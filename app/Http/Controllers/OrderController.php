<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\category;
use App\item;
use App\agent;
use App\customer;
use App\manage_address;
use App\order;
use App\order_item;
use App\service;
use App\settings;
use App\week;
use App\schedule;
use Yajra\DataTables\Facades\DataTables;
use Auth;
use DB;
use AppHelper;
use PDF;
use Mail;
class OrderController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }
    public function order(Request $request){
        $order = new order;
        $order->customer_id = $request->customer_id;
        $order->total = $request->total;
        $order->payment_type = $request->payment_type;
        $order->pickup_date = $request->pickup_date;
        $order->pickup_time = $request->pickup_time;
        $order->delivery_date = $request->delivery_date;
        $order->delivery_time = $request->delivery_time;
        $order->address_id = $request->address_id;
        //$order->status = $request->status;
        $order->save();
        $request->order_item = array('service_id'=>1,'qty'=>2,'price'=>9);
        foreach($request->order_item as $item){
            $order_item = new order_item;
            $order_item->order_id = $order->id;
            $order_item->service_id = $item->service_id;
            $order_item->qty = $item->qty;
            $order_item->price = $item->price;
            $order_item->save();
        }
    }

    public function customerAddress(Request $request){
        $manage_address = new manage_address;
        $manage_address->customer_id = $request->customer_id;
        $manage_address->lat = $request->lat;
        $manage_address->lng = $request->lng;
        $manage_address->addr_type = $request->addr_type;
        $manage_address->addr_title = $request->addr_title;
        $manage_address->address1 = $request->address1;
        $manage_address->address2 = $request->address2;
        $manage_address->address3 = $request->address3;
        $manage_address->save();
        return response()->json($manage_address->id);
    }

    public function orders(){
        $role_get = DB::table('roles')
                ->select('*')
                ->where('id','=',Auth::user()->role_id)
                ->get();
        $agent = agent::all();
        return view('order',compact('agent','role_get'));
    }

    public function getOrder($filter){
        if ($filter != 6) {
        $orders = DB::table('orders')
         ->where('status','=',$filter)
         ->join('customers', 'orders.customer_id', '=', 'customers.id')
         //->join('agents', 'orders.agent_id', '=', 'agents.id')
         ->select('orders.*','customers.name','customers.mobile')
         ->orderBy('orders.id','desc')
         ->get();
        }else{
        $orders = DB::table('orders')
         ->join('customers', 'orders.customer_id', '=', 'customers.id')
         ->select('orders.*','customers.name','customers.mobile')
         ->orderBy('orders.id','desc')
         ->get();
        }

        return Datatables::of($orders)
            ->addColumn('checkbox', function ($orders) {
                return '<td><input type="checkbox" name="order_checkbox[]" class="order_checkbox" value="' . $orders->id . '"></td>';
            })
            ->addColumn('order_id', function ($orders) {
                return '<a href="/view-order/' . $orders->id . '" >#' . $orders->id . '</a>';
            })
            ->addColumn('payment_status', function ($orders) {
                if ($orders->payment_status == 0) {
                    return '<a href="#" onclick="changeStatus('.$orders->id.',1)"><td>Un Paid</td></a>';
                } else {
                    return '<a href="#" onclick="changeStatus('.$orders->id.',0)"><td>Paid</td></a>';
                }
            })
            ->addColumn('order_status', function ($orders) {

                if ($orders->status == 0) {
                    $status = '<b>Pending</b>';
                }
                else if ($orders->status == 1)
                {
                    $status = '<b>Confirmed</b>';
                }
                else if ($orders->status == 2)
                {
                    $status = '<b>Picked Up</b>';
                }
                else if ($orders->status == 3)
                {
                    $status = '<b>In Process</b>';
                }
                else if ($orders->status == 4)
                {
                    $status = '<b>Shipped</b>';
                }
                else if ($orders->status == 5)
                {
                    $status = '<b>Delivered</b>';
                }
                return '<td>
                ' . $status . '
                </td>';
            })
            ->addColumn('customer_details', function ($orders) {
                return '<td>
                <p>' . $orders->name . '</p>
                <p>' . $orders->mobile . '</p>
                </td>';
            })
            ->addColumn('pickup_date', function ($orders) {
                return '<td>
                <p>' . $orders->pickup_date . '</p>
                </td>';
            })
            ->addColumn('agent_details', function ($orders) {
                $agent = agent::find($orders->agent_id);
                if(empty($agent)){
                return '<td>
                <p></p>
                </td>';
                }
                else{
                return '<td>
                <p>' . $agent->name . '</p>
                <p>' . $agent->mobile . '</p>
                </td>';
                }
            })
            ->addColumn('print', function ($orders) {
                return 
                '<td><span class="dropdown">
                  <button id="btnSearchDrop2" type="button" data-toggle="dropdown" aria-haspopup="true"
                  aria-expanded="true" class="btn btn-primary dropdown-toggle dropdown-menu-right"><i class="ft-settings"></i></button>
                  <span aria-labelledby="btnSearchDrop2" class="dropdown-menu mt-1 dropdown-menu-right">
                    
                    <a target="_blank" href="/order-print/'.$orders->id.'" class="dropdown-item"><i class="ft-print"></i> Print</a>
                    <a href="javascript:void(null)" onclick="SendMail('.$orders->id.')" class="dropdown-item"><i class="ft-print"></i> Send Mail</a>
                    <a href="javascript:void(null)" onclick="orderDelete('.$orders->id.')" class="dropdown-item"><i class="ft-trash"></i> Delete</a>

                  </span>
                </span></td>';
            })

            ->rawColumns(['order_id','pickup_date', 'payment_status', 'order_status', 'customer_details','agent_details', 'checkbox','print'])
            ->make(true);

        //return Datatables::of($orders) ->addIndexColumn()->make(true);
    }

    public function addItem($id){
        $order_id = $id;
        $order = order::find($id);
        // $order_item = order_item::where('order_id',$id)->get();
        $item = item::all();
        $service = service::all();
        $agent = agent::all();
        $category = category::all();

    $q =DB::table('order_items as oi');
    $q->where('oi.order_id',$id);
    $q->join('items as i', 'oi.item_id', '=', 'i.id');
    $q->select('oi.*','i.*');
    $order_item = $q->get();

        return view('orderItem',compact('agent','service','order_id','category','item','order_item','order'));
    }

    public function getItemPrice($id){
        $service = service::where('item_id' ,'=', $id)->get();
        return response()->json($service);
    }

    public function viewOrder($id){
        $order = order::find($id);
        $service = service::all();
        $item = item::all();
        $week = week::all();
        $agent = agent::all();
        $customer = customer::find($order->customer_id);
        $order_item = order_item::where('order_id' ,'=', $id)->get();
        return view('viewOrder',compact('agent','service','order','customer','order_item','item','week'));
    }


    public function saveItem(Request $request){
    $total = 0;
    $old_order_item = order_item::where('order_id',$request->order_id)->delete();
        for ($x=0; $x<count($_POST['item_id']); $x++)
        {
            $order_item = new order_item;
            $order_item->date = date('Y-m-d');
            $order_item->order_id = $request->order_id;
            $order_item->item_id = $_POST['item_id'][$x];
            if($_POST['wash_iron_price'][$x] != ''){
            $order_item->laundry_price = $_POST['wash_iron_price'][$x];
            }
            else{
            $order_item->laundry_price = '0';
            }
            if($_POST['dry_clean_price'][$x] != ''){
            $order_item->dry_clean_price = $_POST['dry_clean_price'][$x];
            }
            else{
            $order_item->dry_clean_price = '0';
            }
            if($_POST['iron_price'][$x] != ''){
            $order_item->iron_price = $_POST['iron_price'][$x];
            }
            else{
            $order_item->iron_price = '0';
            }
            if($_POST['wash_iron_qty'][$x] != ''){
            $order_item->laundry_qty = $_POST['wash_iron_qty'][$x];
            }
            else{
            $order_item->laundry_qty = '0';
            }
            if($_POST['dry_clean_qty'][$x] != ''){
            $order_item->dry_clean_qty = $_POST['dry_clean_qty'][$x];
            }
            else{
            $order_item->dry_clean_qty = '0';
            }
            if($_POST['iron_qty'][$x] != ''){
            $order_item->iron_qty = $_POST['iron_qty'][$x];
            }
            else{
            $order_item->iron_qty = '0';
            }

            $order_item->total = $_POST['total'][$x];
            $order_item->save();
        }
        $order = order::find($request->order_id);
        $order->delivery_option = 'express';
        $order->total = $request->final_total;
        $order->save();

        return response()->json('Succesfully Save', 200);
    }

    public function changeStatus(Request $request)
    {
        if ($request->status != 6) {
            $order = order::whereIn('id', $request->id)->get();
            foreach ($order as $row) {
                $row->status = $request->status;
                $row->save();
            }
        }
        return response()->json(["Successfully Update"], 200);
    }

    public function assignAgent(Request $request){
        $ids = explode(",", $request->id);
        foreach ($ids as $id) {
            $order = order::find($id);
            $order->agent_id = $request->agent;
            $order->save();
        }
    return response()->json(['message' => 'Successfully Save'], 200);
    }

    public function assignAgentview(Request $request){
        $order = order::find($request->id);
        $order->agent_id = $request->agent;
        $order->save();
        return response()->json(['message' => 'Successfully Save'], 200);
    }

    public function changeStatusview(Request $request)
    {
        if ($request->status != 6) {
            $order = order::find($request->id);
            $order->status = $request->status;
            $order->save();
        }
        return response()->json(["Successfully Update"], 200);
    }


    public function OrderPrint($id){
        $order = order::find($id);
        $order_item = order_item::where('order_id',$id)->get();
        $address = manage_address::where('id',$order->address_id)->first();
        $customer = customer::find($order->customer_id);
        $item = item::all();
        $settings = settings::first();


        $pdf = PDF::loadView('pdf.invoicepdf',compact('order','order_item','customer','item','settings','address'));
        $pdf->setPaper('A4');
        return $pdf->stream('report.pdf');

    }


    public function invoiceSendMail($id){
        $order = order::find($id);
        $order_item = order_item::where('order_id',$id)->get();
        $address = manage_address::where('id',$order->address_id)->first();
        $customer = customer::find($order->customer_id);
        $item = item::all();
        $settings = settings::first();

        $pdf = PDF::loadView('pdf.invoicepdf',compact('order','order_item','customer','item','settings','address'));

        try{
            Mail::send('mail.invoice', compact('order','order_item','customer','item','settings','address'), function($message)use($order,$customer,$pdf) {
            $message->to($customer->email)->subject('Hang Your Cloths Invoice ID : #'.$order->id);
            $message->from('sales@hangyourcloths.com','Hang Your Cloths');
            $message->attachData($pdf->output(), 'hang_your_cloths_invoice_'.$order->id.'.pdf');
            });
        }catch(JWTException $exception){
            $this->serverstatuscode = "0";
            $this->serverstatusdes = $exception->getMessage();
        }
        if (Mail::failures()) {
             $this->statusdesc  =   "Error sending mail";
             $this->statuscode  =   "0";

        }else{

           $this->statusdesc  =   "Mail sent Succesfully";
           $this->statuscode  =   "1";
        }
        return response()->json($this);
    }


    public function orderDelete($id)
    {
        $order = order::find($id);
        $order->delete();

        $order_item = order_item::where('order_id',$id)->delete();
        // $order_item->delete();
            
        return response()->json(['message'=>'Successfully Deleted'],200);
    }


    public function getChangeWeeksTime($id)
    {
        $schedule = schedule::where('week_id',$id)->get();

        $output = '<option value="">SELECT</option>';
        foreach ($schedule as $key => $value) {
        $output .='<option>'.$value->from_time.' - '.$value->to_time.'</option>';
        }
            
        echo $output;
    }


    public function updatePickupTime(Request $request)
    {
        $week = week::all();
        $today = date("l");

        $day = date('Y-m-d', strtotime(' +1 day'));

        $tomorrow = date('l', strtotime($day));

        $third1 = date('Y-m-d', strtotime(' +2 day'));
        $third = date('l', strtotime($third1));
        $four1 = date('Y-m-d', strtotime(' +3 day'));
        $four = date('l', strtotime($four1));
        $five1 = date('Y-m-d', strtotime(' +4 day'));
        $five = date('l', strtotime($five1));
        $six1 = date('Y-m-d', strtotime(' +5 day'));
        $six = date('l', strtotime($six1));
        $seven1 = date('Y-m-d', strtotime(' +6 day'));
        $seven = date('l', strtotime($seven1));
        date_default_timezone_set("Asia/Dubai");
        date_default_timezone_get();

        $order = order::find($request->order_id);

        $week = week::find($request->weeks);

        if($today == $week->weeks){
        $order->pickup_date = date('M d', strtotime($today));
        }
        if($tomorrow == $week->weeks){
        $order->pickup_date = date('M d', strtotime($tomorrow));
        }
        if($third == $week->weeks){
        $order->pickup_date = date('M d', strtotime($third));
        }
        if($four == $week->weeks){
        $order->pickup_date = date('M d', strtotime($four));
        }
        if($five == $week->weeks){
        $order->pickup_date = date('M d', strtotime($five));
        }
        if($six == $week->weeks){
        $order->pickup_date = date('M d', strtotime($six));
        }
        if($seven == $week->weeks){
        $order->pickup_date = date('M d', strtotime($seven));
        }
        $order->pickup_time = $request->time;
        $order->save();
        
        return response()->json(['message'=>'Successfully Updated'],200);
    }


    public function changePaymentStatus($id,$status)
    {
        $order = order::find($id);
        $order->payment_status = $status;
        $order->save();
        return response()->json(["Successfully Update"], 200);
    }





}
