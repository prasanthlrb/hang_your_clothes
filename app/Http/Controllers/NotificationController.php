<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\push_notification;
use App\customer;


class NotificationController extends Controller
{

    public function saveNotification(Request $request){
        $request->validate([
            'title'=>'required',
        ]);

        $push_notification = new push_notification;
        $push_notification->title = $request->title;
        $push_notification->description = $request->description;
        $push_notification->status = 1;
        $push_notification->user_type = $request->user_type;
        $push_notification->user_id = $user_id;
        $push_notification->save();

        $customer_all = customer::all();
        foreach($customer_all as $customer){
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
              CURLOPT_POSTFIELDS =>"{\n    \"to\":\"$customer->fcm_token\",\n    \"notification\": {\n        \"sound\": \"default\",\n        \"body\": \" $body \",\n        \"title\": \"$request->title\",\n        \"content_available\": true,\n        \"priority\": \"high\"\n    },\n    \"data\": {\n        \"sound\": \"default\",\n        \"body\": \"$request->description\",\n        \"title\": \"test title\",\n        \"content_available\": true,\n        \"priority\": \"high\"\n    }\n}",
              CURLOPT_HTTPHEADER => array(
                "Authorization: key=AAAA2pYlLPI:APA91bHwj---XdeAmtP1JNmRBm3Cukcl6Qyf172cKB6pZr37r5eV1KWe8wfNH8af9t5Dp7IJbDyeku6LxVoGn23uP524TbMmem6MgaPo7BMNGLgDLAtmTCyJonfwbwoCeS2Flabn0u9P",
                "Content-Type: application/json"
              ),
            ));
            
            $response = curl_exec($curl);
            
            curl_close($curl);
            //echo $response;
        }

        return response()->json('successfully save'); 
    }

    public function updateNotification(Request $request){
        $request->validate([
            'title'=> 'required',
        ]);
        
        $push_notification = push_notification::find($request->id);
        $push_notification->title = $request->title;
        $push_notification->description = $request->description;
        $push_notification->user_type = $request->user_type;
        $push_notification->user_id = $user_id;
        $push_notification->save();
        return response()->json('successfully update'); 
    }

    public function Notification(){
        $push_notification = push_notification::all();
        $user = customer::all();
        return view('push_notification',compact('push_notification','user'));
    }

    public function editNotification($id){
        $push_notification = push_notification::find($id);
        return response()->json($push_notification); 
    }
    
    public function deleteNotification($id){
        $push_notification = push_notification::find($id);
        $push_notification->delete();
        return response()->json(['message'=>'Successfully Delete'],200); 
    }


    public function get_notification_user($id){
        $data  = push_notification::find($id);

        $user = customer::all();

      $arraydata=array();
      foreach(explode(',',$data->user_id) as $user1){
        $arraydata[]=$user1;
      }
      $output = '<optgroup label="Select User">';
        foreach ($user as $value){
            if(in_array($value->id , $arraydata))
            {
                $output .='<option selected="true" value="'.$value->id.'">'.$value->email.'</option>';
            }
            else{
                $output .='<option value="'.$value->id.'">'.$value->email.'</option>';
            }
        }
      $output .='</optgroup>';

      echo $output;

    }


}
