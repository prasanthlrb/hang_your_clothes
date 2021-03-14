<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\agent;
use App\customer;
use App\order;
use App\service;
use App\item;
use Auth;
use DB;
use Mobile_Detect;
use PDF;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        return view('home');
    }

    public function dashboard(){

    $cfdate = date('Y-m-d',strtotime('first day of this month'));
    $cldate = date('Y-m-d',strtotime('last day of this month'));

    $pfdate = date('Y-m-d',strtotime('first day of previous month'));
    $pldate = date('Y-m-d',strtotime('last day of previous month'));

    $today = date('Y-m-d');

    $current_total = DB::table("orders")->whereBetween('date', [$cfdate, $cldate])->get()->sum("total");

    $previous_total = DB::table("orders")->whereBetween('date', [$pfdate, $pldate])->get()->sum("total");


    $current_total_paid = DB::table("orders")->whereBetween('date', [$cfdate, $cldate])->where('payment_status','1')->get()->sum("total");

    $current_total_unpaid = DB::table("orders")->whereBetween('date', [$cfdate, $cldate])->where('payment_status','0')->get()->sum("total");

    $today_total_paid = DB::table("orders")->where('date', $today)->where('payment_status','1')->get()->sum("total");
    
    $today_total_unpaid = DB::table("orders")->where('date', $today)->where('payment_status','0')->get()->sum("total");


    $today_total = DB::table("orders")->where('date', $today)->get()->sum("total");

    $drivers_count = agent::all()->count();
    $service_count = service::all()->count();
    $customer_count = customer::all()->count();
    $orders_count = order::all()->count();

    $customer_all = customer::all();
    $item_all = item::all();

    $q =DB::table('orders');
    $q->whereBetween('date', [$cfdate, $cldate]);
    $q->groupBy('customer_id');
    $q->select([DB::raw("customer_id") , DB::raw('count(customer_id) as customer_count')]);
    $q->orderBy('customer_count', 'DESC');
    //$q->limit(10);
    $customers = $q->latest()->take(10)->get();

    $i =DB::table('order_items');
    $i->whereBetween('date', [$cfdate, $cldate]);
    $i->groupBy('item_id');
    $i->select([DB::raw("item_id") , DB::raw('count(item_id) as item_count')]);
    $i->orderBy('item_count', 'DESC');
    //$i->limit(10);
    $items = $i->latest()->take(10)->get();

//echo json_encode($customers);


    return view('dashboard',compact('drivers_count','service_count','customer_count','orders_count','current_total','previous_total','today_total','customer_all','item_all','items','customers','current_total_paid','today_total_paid','current_total_unpaid','today_total_unpaid'));

        
    }
    
public function unPaidPdf(){
    $customer = customer::all();

    $fdate = date('Y-m-d',strtotime('first day of this month'));
    $tdate = date('Y-m-d',strtotime('last day of this month'));

    $q =DB::table('orders as o');
    $q->whereBetween('o.date', [$fdate, $tdate]);
    $q->where('o.payment_status',0);
    $data = $q->get();

    $pdf = PDF::loadView('orderReportpdf', compact('customer','data','fdate','tdate'));
    $pdf->setPaper('Legal', 'landscape');
    return $pdf->stream('report.pdf');
}
}
