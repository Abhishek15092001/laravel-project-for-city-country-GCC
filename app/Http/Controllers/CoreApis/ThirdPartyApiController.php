<?php

namespace App\Http\Controllers\CoreApis;

use Carbon\Carbon;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Session;
use Illuminate\Support\Facades\Log;

class ThirdPartyApiController extends Controller
{

    public function index(REQUEST $request){
        
        $resArr=[];
        $finalArr=[];

        $curl = curl_init();

        curl_setopt_array($curl, array(
        CURLOPT_URL => 'https://restcountries.com/v3.1/all',
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_ENCODING => '',
        CURLOPT_MAXREDIRS => 10,
        CURLOPT_TIMEOUT => 0,
        CURLOPT_FOLLOWLOCATION => true,
        CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
        CURLOPT_CUSTOMREQUEST => 'GET',
        ));

        $response = curl_exec($curl);

        curl_close($curl);
        $response=json_decode($response,true);
        $CliReccount = count($response);
        $GCCRecCount = \DB::table('countries')->count();
        if($CliReccount == $GCCRecCount){
            $finalArr =['message' => 'Success', 'message' => 'NOTHING TO SYNC'];
            return json_encode($finalArr);
        }else{
            foreach($response as $key=>$val){
                
                $resArr['name']= isset($val['name']['common']) ? $val['name']['common']: '';
                $resArr['region']= isset($val['region']) ? $val['region'] : '';
                $resArr['capital_city']=isset($val['capital'][0]) ? $val['capital'][0]: '';
                $resArr['population']= isset($val['population']) ? $val['population'] : '';
                $finalArr[] = $resArr;
            }
            \DB::table('countries')->insert($finalArr);
            $finalArr =['message' => 'Success', 'message' => 'SYNCED SUCCESSFULLY'];
            return json_encode($finalArr);
        }
    }
}
