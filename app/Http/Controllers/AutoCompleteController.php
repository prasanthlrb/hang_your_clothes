<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\service;
use App\item;
use DB;
use Mobile_Detect;

class AutoCompleteController extends Controller
{

    public function downloadApp(){
        $detect = new Mobile_Detect;

        if( $detect->isiOS() ){
            return redirect('https://apps.apple.com/us/app/app.laundry.laundry/id1519259782?ls=1');   
        }
        if( $detect->isAndroidOS() ){
            return redirect('https://play.google.com/store/apps/details?id=app.laundry.laundry');  
        }
         return abort(404);
    }
    public function getItem(Request $request){
        $search_term = $request->term;

        $availableResults = DB::table('items')
            //->select('id,name,register_number,mobile')
            ->where('name', 'like', '%' . $search_term . '%')
            // ->orWhere('product_code', 'like', '%' . $search_term . '%')
            ->get();
    
        if(!empty($availableResults)){     
            $data['response'] = 'true'; //If username exists set true
            $data['message'] = array();       
            foreach ($availableResults as $key => $value) {                
                $data['message'][] = array(  
                    'label' => $value->name,
                    'value' => $value->name,
                    'id'=>$value->id
                );
            }        
        }else{
            $data['response'] = 'false';
        }

        echo json_encode($data); 
        exit;
    }

    public function getItemID($id)
    {
      $data = service::where('item_id',$id)->get();
      return response()->json($data); 
    }



}
