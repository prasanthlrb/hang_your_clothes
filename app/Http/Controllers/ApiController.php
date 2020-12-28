<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\customer;
use Hash;
use Yajra\DataTables\Facades\DataTables;
use Auth;
use DB;
use Validator;
use Mail;
use App\home_slider;
use App\category;
use App\manage_address;
use App\schedule;
use App\week;
use App\order;
use App\service;
use App\order_item;
use App\item;
use App\agent;
use App\coupon;
use App\city;
use App\area;

class ApiController extends Controller
{
    public function createCustomer(Request $request){
        try{
            $exist = customer::where('email',$request->email)->get();
            if(count($exist)>0){
                 return response()->json(['message' => 'this Email Address Already Registered','status'=>403], 403);
            }
            $randomid = mt_rand(100000,999999); 
            $customer = new customer;
            $customer->name = $request->name;
            $customer->email = $request->email;
            $customer->mobile = $request->mobile;
            $customer->fcm_token = $request->fcm_token;
            $customer->token_id = $randomid;
            $customer->password = Hash::make($request->password);
            $customer->save();
            return response()->json(
                ['message' => 'Register Successfully',
                'customer_name'=>$customer->name,
                'customer_email'=>$customer->email,
                'customer_mobile'=>$customer->mobile,
                'customer_id'=>$customer->id],
                 200);
        }catch (\Exception $e) {
            return response()->json(['message' => $e->getMessage(),'status'=>400], 400);
}
    }

    public function customerLogin(Request $request){
        $exist = customer::where('email',$request->email)->get();
        if(count($exist)>0){
            if(Hash::check($request->password,$exist[0]->password)){

                $exist[0]->fcm_token = $request->fcm_token;
                $exist[0]->save();

                return response()->json(['message' => 'Login Successfully','customer_name'=>$exist[0]->name,
            'customer_email'=>$exist[0]->email,
            'customer_mobile'=>$exist[0]->mobile,
            'customer_id'=>$exist[0]->id,'status'=>200], 200);
            }else{
                return response()->json(['message' => 'Records Does not Match','status'=>403], 403);
            }
        }else{
            return response()->json(['message' => 'this Email Address Not Registered','status'=>403], 403);
        }
    }

       public function forgetPassword(Request $request){
        try{
            $exist = customer::where('email',$request->email)->get();
        //return response()->json(count($exist));
        if(count($exist)>0){
        $customer = customer::find($exist[0]->id);
        $randomid = mt_rand(100000,999999);
        $customer->unique_id = $randomid;
        $customer->save();

        Mail::send('forgetpasswordmail',compact('customer'),function($message) use($customer){
            $message->to($customer->email)->subject('Change Password Request');
            $message->from('sales@hangyourclothes.com','HYC Reset Password');
        });

        return response()->json(['message' => 'Successfully Send','_id'=>$customer->id], 200);
            }else{
                return response()->json(['message' => 'this Email Address Not Registered','status'=>403], 403);
            }
        
        }catch (\Exception $e) {
            return response()->json($e);
            return response()->json(['message' => 'this Email Address Not Registered()','status'=>200], 200);
}
    }

     public function resetPassword(Request $request)
    {
        // $request->validate([
        //     'password' => 'min:6|required_with:password_confirmation|same:password_confirmation',
        //     'password_confirmation' => 'min:6'
        // ]);
        
        if($request->customer_id !=null){
            $customer = customer::find($request->customer_id);
            if($customer->unique_id == $request->code){
                $customer->password = Hash::make($request->get('password'));
                $customer->save();
                return response()->json(['message' => 'Successfully Reset'], 200);
            }else{
                return response()->json(['message' => 'Verification Code Not Valid','status'=>400], 400);
            }
        }else{
            return response()->json(['message' => 'Customer id not found'], 400);
        }
                
    }
    public function getApiSlider(){
        $data = home_slider::orderBy('position','asc')->select('image','title','text')->get();
        return response()->json($data); 
    }
    
    public function getApiCategory($id){
           if($id =='en'){

               $category = category::select('title_1','image','time','banner','content')->get();
           }else{
                // $service =DB::table('category as s')

                // ->select('name','image','price_1','price_2')
                // ->get();
               $category = category::select('title_1_ar as title_1','image','time_ar as time','banner','content_ar as content')->get();
           }
         return response()->json($category); 
    }

    public function ManageAddress(Request $request){
        try{
        $ma = new manage_address;
        $ma->map_title = $request->map_title;
        $ma->addr_type = $request->addr_type;
        $ma->addr_title = $request->addr_title;
        $ma->address1 = $request->address1;
        $ma->address2 = $request->address2;
        $ma->phone = $request->phone;
        $ma->lat = $request->lat;
        $ma->lng = $request->lng;
        $ma->city = $request->city;
        $ma->area = $request->area;
        $ma->customer_id = $request->customer_id;
        $ma->save();
        return response()->json(['message' => 'Address Store Successfully',], 200);
         }catch (\Exception $e) {
            return response()->json(['message' => ' Server Busy','status'=>400], 400);
}
    }
     public function getAddress($id){
         $addr = manage_address::where('customer_id',$id)->select('map_title','addr_type','addr_title','address1','address2','id','lat','lng','phone','city','area')->where('status',0)->get();
         return response()->json($addr);
     }

     public function updateData($id){
         $addr = manage_address::where('customer_id',$id)->get();
     }


    public function getApiWeeks(){
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
        $time = date("h:i A"); 
        $time1 = strtotime($time); 
        $stime="12:00 AM";

        foreach ($week as $key => $value) {
            if($today == $value->weeks){
                // $schedule = schedule::where('week_id',$value->id)->where('from_strtotime' ,'>', $time1)->get();
                $schedule = schedule::where('week_id',$value->id)->latest()->first();

                //if(count($schedule) > 0){
                if(strtotime($time) < strtotime($schedule->from_time)){
                    $weeks = "Today";
                    $data[] = array(
                    'id' => $value->id,
                    'weeks' => $weeks,
                    'days' => date('M d', strtotime($today)),
                    );
                }

            }
        }
        foreach ($week as $key => $value) {
            if($tomorrow == $value->weeks){
                $weeks = "Tomorrow";
                $data[] = array(
                'id' => $value->id,
                'weeks' => $weeks,
                'days' => date('M d', strtotime($tomorrow)),
                );
            }           
        }
        foreach ($week as $key => $value) {
            if($third == $value->weeks){
                $data[] = array(
                'id' => $value->id,
                'weeks' => $value->weeks,
                'days' => date('M d', strtotime($third)),
                );
            }
        }
        foreach ($week as $key => $value) {
            if($four == $value->weeks){
                $data[] = array(
                'id' => $value->id,
                'weeks' => $value->weeks,
                'days' => date('M d', strtotime($four)),
                );
            }
        }
        foreach ($week as $key => $value) {
            if($five == $value->weeks){
                $data[] = array(
                'id' => $value->id,
                'weeks' => $value->weeks,
                'days' => date('M d', strtotime($five)),
                );
            }
        }
        foreach ($week as $key => $value) {
            if($six == $value->weeks){
                $data[] = array(
                'id' => $value->id,
                'weeks' => $value->weeks,
                'days' => date('M d', strtotime($six)),
                );
            }
        }
        foreach ($week as $key => $value) {
            if($seven == $value->weeks){
                $data[] = array(
                'id' => $value->id,
                'weeks' => $value->weeks,
                'days' => date('M d', strtotime($seven)),
                );
            } 
        }
        return response()->json($data);
    }


    public function getApiSchedule($id){
        $schedule = schedule::where('week_id',$id)->get();
        date_default_timezone_set("Asia/Dubai");
        date_default_timezone_get();
        $today = date("l");
        $time = date("h:i A"); 
        $data = array();
        foreach ($schedule as $key => $value) {
            $week = week::find($id);
            if($today == $week->weeks){
                if(strtotime($time) < strtotime($value->from_time)){
                    $data[] = array(
                        'id' => $value->id,
                        'from_time' => $value->from_time,
                        'to_time' => $value->to_time,
                    );
                }
            }
            else{
                $data[] = array(
                    'id' => $value->id,
                    'from_time' => $value->from_time,
                    'to_time' => $value->to_time,
                );   
            }
        }
        return response()->json($data); 
    }

    public function updateCustomer(Request $request){
        $customer = customer::find($request->id);
        $customer->name = $request->customer_name;
        $customer->password = Hash::make($request->password);
        $customer->save();
         return response()->json(['message' => 'Update Successfully',], 200);
    }
        public function updateAddress(Request $request){
        try{
        $ma =  manage_address::find($request->addr_id);
        $ma->map_title = $request->map_title;
        $ma->addr_type = $request->addr_type;
        $ma->addr_title = $request->addr_title;
        $ma->address1 = $request->address1;
        $ma->address2 = $request->address2;
        $ma->phone = $request->phone;
        $ma->lat = $request->lat;
        $ma->lng = $request->lng;
        $ma->city = $request->city;
        $ma->area = $request->area;
        $ma->save();
        return response()->json(['message' => 'Address Update Successfully',], 200);
         }catch (\Exception $e) {
            return response()->json(['message' => ' Server Busy','status'=>400], 400);
}


}
    public function deleteAddress(Request $request){
    $address = manage_address::find($request->addr_id);
    $address->status = 1;
    $address->save();
    return response()->json(['message' => 'Address Delete Successfully',], 200);
    }

    public function order(Request $request){
        return response()->json(['message' => 'Sorry Your Order Not Process'], 400);
        $order = new order;
        $order->date = date('Y-m-d');
        $order->customer_id = $request->customer_id;
        $order->address_id = $request->address_id;
        $order->delivery_option = $request->delivery_option;
        $order->pickup_date = $request->pickup_date;
        $order->pickup_time = $request->pickup_time;
        $order->total = $request->total;
        $order->coupon_value = $request->coupon_value;
        $order->coupon_code = $request->coupon_code;
        $order->coupon_id = $request->coupon_id;
        $order->remark = $request->remark;
        $order->save();
        $body = "Pickup date/time : ".$request->pickup_date.'/'.$request->pickup_time.' Delivery Type :'.$request->delivery_option;
       $agents = agent::where('fcm_token','!=',null)->get();
    foreach($agents as $agent){
    $curl = curl_init();
    curl_setopt_array($curl, array(
      CURLOPT_URL => "https://fcm.googleapis.com/fcm/send",
      CURLOPT_RETURNTRANSFER => true,
      CURLOPT_ENCODING => "",
      CURLOPT_MAXREDIRS => 10,
      CURLOPT_TIMEOUT => 0,
      CURLOPT_FOLLOWLOCATION => true,
      CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
      CURLOPT_CUSTOMREQUEST => "POST",
      CURLOPT_POSTFIELDS =>"{\n    \"to\":\"$agent->fcm_token\",\n    \"notification\": {\n        \"sound\": \"default\",\n        \"body\": \" $body \",\n        \"title\": \"New Laundry Order\",\n        \"content_available\": true,\n        \"priority\": \"high\"\n    },\n    \"data\": {\n        \"sound\": \"default\",\n        \"body\": \"$order->id\",\n        \"title\": \"test title\",\n        \"content_available\": true,\n        \"priority\": \"high\"\n    }\n}",
      CURLOPT_HTTPHEADER => array(
        "Authorization: key=AAAA2pYlLPI:APA91bHwj---XdeAmtP1JNmRBm3Cukcl6Qyf172cKB6pZr37r5eV1KWe8wfNH8af9t5Dp7IJbDyeku6LxVoGn23uP524TbMmem6MgaPo7BMNGLgDLAtmTCyJonfwbwoCeS2Flabn0u9P",
        "Content-Type: application/json"
      ),
    ));
    
    $response = curl_exec($curl);
    
    curl_close($curl);
    //echo $response;
}
        return response()->json(['message' => 'Order Placed Successfully','order_id'=>$order->id], 200);
    }
    
    public function sendNotification(){
$agents = agent::where('fcm_token','!=',null)->get();
foreach($agents as $agent){
    $curl = curl_init();
    curl_setopt_array($curl, array(
      CURLOPT_URL => "https://fcm.googleapis.com/fcm/send",
      CURLOPT_RETURNTRANSFER => true,
      CURLOPT_ENCODING => "",
      CURLOPT_MAXREDIRS => 10,
      CURLOPT_TIMEOUT => 0,
      CURLOPT_FOLLOWLOCATION => true,
      CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
      CURLOPT_CUSTOMREQUEST => "POST",
      CURLOPT_POSTFIELDS =>"{\n    \"to\":\"$agent->fcm_token\",\n    \"notification\": {\n        \"sound\": \"default\",\n        \"body\": \"Demo body\",\n        \"title\": \"New Laundry Order\",\n        \"content_available\": true,\n        \"priority\": \"high\"\n    },\n    \"data\": {\n        \"sound\": \"default\",\n        \"body\": \"test body\",\n        \"title\": \"test title\",\n        \"content_available\": true,\n        \"priority\": \"high\"\n    }\n}",
      CURLOPT_HTTPHEADER => array(
        "Authorization: key=AAAA2pYlLPI:APA91bHwj---XdeAmtP1JNmRBm3Cukcl6Qyf172cKB6pZr37r5eV1KWe8wfNH8af9t5Dp7IJbDyeku6LxVoGn23uP524TbMmem6MgaPo7BMNGLgDLAtmTCyJonfwbwoCeS2Flabn0u9P",
        "Content-Type: application/json"
      ),
    ));
    
    $response = curl_exec($curl);
    
    curl_close($curl);
    //echo $response;
}
//return true;
    }
    public function getOrder($id){
        $order = order::where('customer_id',$id)->select('id as order_id','status','pickup_date','pickup_time')->orderBy('id','desc')->get();
        return response()->json($order);
    }
    public function getOrderDetails($id){
        $order = order::find($id);
        $address = manage_address::find($order->address_id);
        $data = array(
            'pickup_date'=>$order->pickup_date,
            'pickup_time'=>$order->pickup_time,
            'delivery_option'=>$order->delivery_option,
            'order_id'=>$order->id,
            'map_title'=>$address->map_title,
            'addr_title'=>$address->addr_title,
            'address1'=>$address->address1,
            'city'=>$address->city,
            'area'=>$address->area,
            'status'=>$order->status,
            'coupon_value'=>$order->coupon_value,
            'payment_status'=>$order->payment_status,
        );
        return response()->json($data);
    }

    public function getAddressDetails($id){
        $address = manage_address::find($id);
        $data = array(
            'map_title'=>$address->map_title,
            'addr_title'=>$address->addr_title,
            'addr_type'=>$address->addr_type,
            'address1'=>$address->address1,
        );
        return response()->json($data);
    }

    public function service($id,$lang){
        //$service = service::where('cat_id',$id)->select('name','price_1','price_2','image')->get();
        if($lang == 'en'){
            $service =DB::table('services as s')
                    ->join('items as i', 's.item_id', '=', 'i.id')
                    ->where('s.cat_id',$id)
                    ->select('name','image','price_1','price_2')
                    ->get();
            //$service = service::where('cat_id',$id)->get();
            return response()->json($service);
        }else{
            $service =DB::table('services as s')
                    ->join('items as i', 's.item_id', '=', 'i.id')
                    ->where('s.cat_id',$id)
                    ->select('name_arabic as name','image','price_1','price_2')
                    ->get();
            //$service = service::where('cat_id',$id)->get();
            return response()->json($service); 
        }
    }
    public function orderItem($id){
        $order_item = order_item::where('order_id',$id)->select('item_id','qty','total')->get();
        return response()->json($order_item);
    }
    //agent item list

    public function agentItem(){
        $item = item::select('id','name')->get();
        return response()->json($item);
    }

    public function getService($id,$item){

        //$service = service::where('cat_id',$id)->where('item_id',$service)->select('id','item_id','price_1','price_2')->get();

        $service = service::where('item_id',$item)->select('id','item_id','price_1','price_2','cat_id')->orderBy('cat_id','asc')->get();
           $data = array(
                'item_id'=>$item,
                'dryclean_price'=>null,
                'wash_price'=>null,
                'iron_price'=>null,
            );
        if($id == 'express'){

            foreach($service as $key => $row){
                if($key+1 ==1){
                    $data['dryclean_price'] = $row->price_2;
                }else if($key+1 ==2){
                     $data['wash_price'] = $row->price_2;
                }else{
                    $data['iron_price'] = $row->price_2;
                }
            }

        }else{
               foreach($service as $key => $row){
                if($key+1 ==1){
                    $data['dryclean_price'] = $row->price_1;
                }else if($key+1 ==2){
                     $data['wash_price'] = $row->price_1;
                }else{
                    $data['iron_price'] = $row->price_1;
                }
            }
        }
        return response()->json($data);
    }

    public function agentLogin(Request $request){
        $exist = agent::where('email',$request->email)->get();
        //return response()->json($request);
        if(count($exist)>0){
            if(Hash::check($request->password,$exist[0]->password)){
                return response()->json(['message' => 'Login Successfully','driver_name'=>$exist[0]->name,
            'agent_id'=>$exist[0]->id,'status'=>200], 200);
            }else{

                return response()->json(['message' => 'Records Does not Match','status'=>403], 403);
            }
        }else{
            return response()->json(['message' => 'this Email Address Not Registered','status'=>403], 403);
        }
    }

    public function getPickupOrder($id){
        $orders =DB::table('orders as o')
        ->join('manage_addresses as ma', 'o.address_id', '=', 'ma.id')
        ->join('customers as c', 'o.customer_id', '=', 'c.id')
        ->where('o.status',$id)
        ->where('o.order_complete',0)
        ->select('c.name','ma.addr_title','ma.addr_type','ma.address1','o.id','ma.city','ma.area')
        ->orderBy('o.id','desc')
        ->get(50);
        return response()->json($orders);
    }
    public function getDeliveryOrder(){
        $orders =DB::table('orders as o')
        ->join('manage_addresses as ma', 'o.address_id', '=', 'ma.id')
        ->join('customers as c', 'o.customer_id', '=', 'c.id')
        ->where('o.status',4)
        ->select('c.name','ma.addr_type','ma.addr_title','ma.address1','o.id','ma.map_title')
        ->get();
        return response()->json($orders);
    }

    public function getPickupOrderId($id){
        $orders =DB::table('orders as o')
        ->join('manage_addresses as ma', 'o.address_id', '=', 'ma.id')
        ->join('customers as c', 'o.customer_id', '=', 'c.id')
        ->where('o.id',$id)
        ->select('c.name','ma.addr_type','ma.addr_title','ma.address1','o.id','ma.map_title','c.mobile','ma.lat','ma.lng','o.pickup_date','o.pickup_time','o.delivery_option','ma.city','ma.area','ma.phone','o.coupon_value','o.remark','o.payment_status')
        ->get();
        return response()->json($orders[0]);
    }

    public function addTocart(Request $request){
          $order_item = new order_item;
           $order_item->item_id = $request->item_id;
           $order_item->date = date('Y-m-d');
           $order_item->order_id = $request->order_id;
           $order_item->laundry_price = $request->laundry_price;
           $order_item->dry_clean_price = $request->dry_clean_price;
           $order_item->iron_price = $request->iron_price;
           $order_item->laundry_qty = $request->laundry_qty;
           $order_item->dry_clean_qty =$request->dry_clean_qty;
           $order_item->iron_qty =$request->iron_qty;
           $order_item->total = $request->total;
           $order_item->unique_value = $request->unique_value;
           $order_item->save();
        
        $item = order_item::where('order_id',$request->order_id)->select('item_id','laundry_price','dry_clean_price','iron_price','laundry_qty','dry_clean_qty','iron_qty','total')->get();
        return response()->json($item);
    }
    public function addTocartAgent(Request $request){
          if($request->lengths > 0){
            $prev_order = order_item::where('order_id',$request->order_id)->where('item_id',$request->item_id)->get();
            if($prev_order->isEmpty()){
           $order_item = new order_item;
           $order_item->item_id = $request->item_id;
           $order_item->date = date('Y-m-d');
           $order_item->order_id = $request->order_id;
           $order_item->laundry_price = $request->laundry_price;
           $order_item->dry_clean_price = $request->dry_clean_price;
           $order_item->iron_price = $request->iron_price;
           $order_item->laundry_qty = $request->laundry_qty;
           $order_item->dry_clean_qty =$request->dry_clean_qty;
           $order_item->iron_qty =$request->iron_qty;
           $order_item->total = $request->total;
           $order_item->unique_value = $request->unique_value;
           $order_item->save();
            }else{
           $order_item = order_item::find($prev_order[0]->id);
           $order_item->item_id = $request->item_id;
           $order_item->date = date('Y-m-d');
           $order_item->order_id = $request->order_id;
           $order_item->laundry_price = $request->laundry_price;
           $order_item->dry_clean_price = $request->dry_clean_price;
           $order_item->iron_price = $request->iron_price;
           $order_item->laundry_qty = $request->laundry_qty;
           $order_item->dry_clean_qty =$request->dry_clean_qty;
           $order_item->iron_qty =$request->iron_qty;
           $order_item->total = $request->total;
           $order_item->unique_value = $request->unique_value;
           $order_item->save();
            }
            if($request->lengths == $request->counter){
                order_item::where('order_id',$request->order_id)->where('unique_value','!=',$request->unique_value)->delete();
                $order = order_item::where('order_id',$request->order_id)->get();
                $total=0;
                foreach($order as $row){
                    $total=($total + $row->total);
                }
                $orders = order::find($request->order_id);
                $orders->total = $total;
                $orders->save();
            }

            }
    
        return response()->json(['message' => 'Update Successfully',], 200);
    }

    public function clearCart(Request $request){
        order_item::where('order_id',$request->order_id)->delete();
         return response()->json(['message' => 'Records Delete'], 200);
    }
    public function orderByItem($id){
           $orders =DB::table('order_items as oi')
                ->join('items as i', 'oi.item_id', '=', 'i.id')
                ->where('oi.order_id',$id)
                ->select('oi.id','i.name','oi.laundry_price','oi.dry_clean_price','oi.iron_price','oi.laundry_qty','oi.dry_clean_qty','oi.iron_qty','oi.total')
                ->get();
                return response()->json($orders);
    }

    public function itemPickup($id,$payment){
        $item = order::find($id);
        $item->status =3;
        $item->payment_status =$payment;
        $item->save();
         return response()->json(['message' => 'Pickup Successful',], 200);
    }
    public function itemOrderDelivery($id,$payment){
        $item = order::find($id);
        $item->order_complete =1;
        $item->payment_status =$payment;
        $item->save();
         return response()->json(['message' => 'Pickup Successful',], 200);
    }
    public function itemOrderStatus($id){
        $item = order::find($id);
        $item->status =($item->status +1);
        $item->save();
         return response()->json(['message' => 'Pickup Successful',], 200);
    }
    public function itemDelivery($id){
        $item = order::find($id);
        $item->status =5;
        $item->save();
         return response()->json(['message' => 'Delivery Successful',], 200);
    }

    public function addCartItemList($types,$lang){
        $items = item::all();
        $output = array();
        foreach($items as $item){
            $service = service::where('item_id',$item->id)->select('id','item_id','price_1','price_2','cat_id')->orderBy('cat_id','asc')->get();
            if(count($service)>0){
        $data = array(
                'item_id'=>$item->id,
                'item_name'=> $lang == "en" ? $item->name : $item->name_arabic,
                'dryclean_price'=>'-',
                'wash_price'=>'-',
                'iron_price'=>'-',
                'dryclean_qty'=>0,
                'wash_qty'=>0,
                'iron_qty'=>0,
                'total'=>'0'
            );
            if($types == 'express'){
            foreach($service as $key => $row){
                if($key+1 ==1){
                    $data['dryclean_price'] = $row->price_2 == null?'-':$row->price_2;
                }else if($key+1 ==2){
                     $data['wash_price'] = $row->price_2 == null?'-':$row->price_2;
                }else{
                    $data['iron_price'] = $row->price_2 == null?'-':$row->price_2;
                }
            }
        }else{
               foreach($service as $key => $row){
                if($key+1 ==1){
                    $data['dryclean_price'] = $row->price_1 == null?'-':$row->price_1;
                }else if($key+1 ==2){
                     $data['wash_price'] =  $row->price_1 == null?'-':$row->price_1;
                }else{
                    $data['iron_price'] =  $row->price_1 == null?'-':$row->price_1;
                }
            }
        }
        $output[]=$data;
            }
        }

          
  
        return response()->json($output);
    }

    public function addCartItemListAgent($types,$id){
        $items = item::all();
        $output = array();
        foreach($items as $item){
            $service = service::where('item_id',$item->id)->select('id','item_id','price_1','price_2','cat_id')->orderBy('cat_id','asc')->get();
            if(count($service)>0){
        $data = array(
                'item_id'=>$item->id,
                'item_name'=>$item->name,
                'dryclean_price'=>'-',
                'wash_price'=>'-',
                'iron_price'=>'-',
                'dryclean_qty'=>0,
                'wash_qty'=>0,
                'iron_qty'=>0,
                'total'=>'0'
            );
            $order_item = order_item::where('order_id',$id)->where('item_id',$item->id)->get();
            if(count($order_item) >0){
                     $data['dryclean_price'] = $order_item[0]->dry_clean_price;
                     $data['wash_price'] = $order_item[0]->laundry_price;
                     $data['iron_price'] = $order_item[0]->iron_price;
                     $data['wash_qty'] = (int)$order_item[0]->laundry_qty;
                     $data['iron_qty'] = (int)$order_item[0]->iron_qty;
                     $data['dryclean_qty'] = (int)$order_item[0]->dry_clean_qty;
                     $data['total'] = $order_item[0]->total;
                    }else{

            if($types == 'express'){
            foreach($service as $key => $row){
                 if($key+1 ==1){
                    $data['dryclean_price'] = $row->price_2 == null?'-':$row->price_2;
                }else if($key+1 ==2){
                     $data['wash_price'] = $row->price_2 == null?'-':$row->price_2;
                }else{
                    $data['iron_price'] = $row->price_2 == null?'-':$row->price_2;

                    }
               
                        }
        }else{
               foreach($service as $key => $row){
                if($key+1 ==1){
                    $data['dryclean_price'] = $row->price_1 == null?'-':$row->price_1;
                }else if($key+1 ==2){
                     $data['wash_price'] =  $row->price_1 == null?'-':$row->price_1;
                }else{
                    $data['iron_price'] =  $row->price_1 == null?'-':$row->price_1;
                }
            }
        }
    }
        $output[]=$data;
            }
        }

          
  
        return response()->json($output);
    }

    public function couponModule($id,$code){
        $coupon = coupon::where('coupon_code',$code)->get();
        if(count($coupon)>0){
            if($coupon[0]->start_date <= date('Y-m-d') && $coupon[0]->end_date >= date('Y-m-d')){
                // return response()->json(['message' => 'Valid Date',], 200);
                if($coupon[0]->user_type ==1){
                    $arraydata=0;
                    foreach(explode(',',$coupon[0]->user_id) as $user1){
                        if($id == $user1){
                            $arraydata=1;
                        }
                   
                        }
                        if($arraydata==0){

                            return response()->json(['message' => 'coupon not valid for you',], 400);
                        }else{
                            if($coupon[0]->limit_per_user !=null){
                                $order_count = order::where('customer_id',$id)->where('coupon_id',$coupon[0]->id)->get();
                                if(count($order_count)< $coupon[0]->limit_per_user){
                                    return response()->json(['coupon_id' => $coupon[0]->id,'min_order_val'=> $coupon[0]->min_order_val,'discount_type'=>$coupon[0]->discount_type,'amount'=>$coupon[0]->amount], 200);
                                }else{
                                    return response()->json(['message' => 'coupon Already Used',], 400);
                                }
                            }

                            return response()->json(['coupon_id' => $coupon[0]->id,'min_order_val'=> $coupon[0]->min_order_val,'discount_type'=>$coupon[0]->discount_type,'amount'=>$coupon[0]->amount], 200);
                        }
                }else{
                      if($coupon[0]->limit_per_user !=null){
                                $order_count = order::where('customer_id',$id)->where('coupon_id',$coupon[0]->id)->get();
                                if(count($order_count)< $coupon[0]->limit_per_user){
                                    return response()->json(['coupon_id' => $coupon[0]->id,'min_order_val'=> $coupon[0]->min_order_val,'discount_type'=>$coupon[0]->discount_type,'amount'=>$coupon[0]->amount], 200);
                                }else{
                                    return response()->json(['message' => 'coupon Already Used',], 400);
                                }
                            }
                            return response()->json(['coupon_id' => $coupon[0]->id,'min_order_val'=> $coupon[0]->min_order_val,'discount_type'=>$coupon[0]->discount_type,'amount'=>$coupon[0]->amount], 200);

                }
            }
            return response()->json(['message' => 'coupon expired',], 400);
        }else{
            return response()->json(['message' => 'invalid coupon code',], 500);
        }
    }

    public function city(){
        $cities = city::select('city_name')->get();
        // $data = array();
        // $data[] = "Select City";
        // foreach($cities as $city){
        //     $data[] = $city->city_name;
        // }
        return response()->json($cities);
    }
    public function area($id){
        $area = area::where('city_name',$id)->get();
          $data = array();
        $data[] = array("area_name"=>"Select Area");
        foreach($area as $city){
            $data[] = array("area_name"=>$city->area_name);
        }
        // $area.append('area_name','Select Area');
        return response()->json($data);
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
            $message->from('prasanthats@gmail.com','Hang Your Cloths');
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

           $this->statusdesc  =   "Message sent Succesfully";
           $this->statuscode  =   "1";
        }
        return response()->json('Mail Send Succesfully');
    }

    public function agentTokenUpdate(Request $request){
        $agent = agent::find($request->agent_id);
        $agent->fcm_token = $request->fcm_token;
        $agent->save();
        return response()->json(['message' => 'successfully update',], 200);
    }

    public function checkMobileNumber($id){
        $data = customer::find($id);
        if($data->mobile != null || $data->mobile != ''){
            return response()->json(['message' => 'successfully update',], 200);
        }else{
             return response()->json(['message' => 'please enter mobile number',], 400);
        }

    }
            public function addMobileNumber(Request $request){
                $data = customer::find($request->id);
                $data->mobile = $request->mobile;
                $data->save();
                return response()->json(['message' => 'successfully update',], 200);
            }

}
