<?php

namespace App\Http\Controllers\Services;

use Carbon\Carbon;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Session;
use Illuminate\Support\Facades\Log;
use \DateTime;
use Illuminate\Support\Facades\Hash;
use Auth;
use Illuminate\Foundation\Auth\AuthenticatesUsers;

class AdminController extends Controller
{
    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }
    public function index(REQUEST $request)
    { 
        $url = explode('/', $_SERVER['REQUEST_URI']);
        $this->source = array_pop($url);
        $this->postVal=$request;
        switch( $this->postVal['for'] ) {
            case 'get_all_data':
                return $this->allData($this->postVal);
                break;
            case 'country_list':
                return $this->getCountry($this->postVal);
                break;
            case 'capital_city_list':
                return $this->getCity($this->postVal);
                break;
            case 'create_group':
                return $this->createGroupData($this->postVal);
                break;
            case 'all_group_data':
                return $this->allGroupData($this->postVal);
                break;
            case 'get_all_city':
                return $this->getAllCity($this->postVal);
                break;
            case 'city_with_country':
                return $this->getCity_with_country($this->postVal);
                break;
            default:
                header("HTTP/1.0 422 Unprocessable Entity");
                die(json_encode(["status" => 422, "message" => "Unprocessable Entity"]));
            break;
        }
    }
    public function checkAccessToken(){
        $accessToken =\DB::table('api_users')->select('access_token')->where('username', 'LIKE', ($this->source).'@gcc.com')->first();
        // log::info(($accessToken->access_token));die;
        if (!isset($this->postVal['access_token'])||empty($this->postVal['access_token'])){
            header("HTTP/1.0 422 Unprocessable Entity");
            die(json_encode(["status" => 500, "message" => "Access Token Required"]));
        } 
        elseif($this->postVal['access_token']!=$accessToken->access_token && $this->postVal['section']!="dropdown"){
            header("HTTP/1.0 422 Unprocessable Entity");
            die(json_encode(["status" => 500, "message" => "Access Token Invalid"]));
        }
    }
    public function getCountry()
    {   
        $this->checkAccessToken();
        $countries = \DB::table('countries')->select('name')->orderBy('name', 'asc')->get();

        $countryArray = [];
        foreach ($countries as $country)
        {
            array_push($countryArray, $country->name);
        }

        $countryObj = new \stdClass();
        $countryObj->message = "success";
        $countryObj->status = "200";
        $countryObj->country = $countryArray;

        $jsonEncodedResult = json_encode($countryObj);
        return response($jsonEncodedResult)->header('Content-Type', 'application/json');
    }
    public function getCity()
    {           
        $this->checkAccessToken();
        $cities = \DB::table('countries')->select('capital_city')->where('capital_city','!=','')->whereNotNull('capital_city')->orderBy('capital_city', 'asc')->get();

        $cityArray = [];
        foreach ($cities as $city)
        {
            array_push($cityArray, $city->capital_city);
        }

        $cityObj = new \stdClass();
        $cityObj->message = "success";
        $cityObj->status = "200";
        $cityObj->city = $cityArray;

        $jsonEncodedResult = json_encode($cityObj);
        return response($jsonEncodedResult)->header('Content-Type', 'application/json');
    }
    // API FOR JSON DATA TABLE 
    public function allData(){

        $data = $this->postVal;
        $columnNamesArr = ["id","name","region","capital_city","population","created_at","updated_at"];
    
        $recordsTotal = \DB::table('countries')->count();
        $tData = DB::table('countries as tData')
            ->select("tData.id","tData.name","tData.region","tData.capital_city","tData.population","tData.created_at","tData.updated_at");
        $i = 1;
        $isFiltered = false;
        foreach( $columnNamesArr as $col ) {
            
            if( ! empty($data['columns'][$i]['search']['value']) ) {
                $column = 'tData.' . $data['columns'][$i]['data'];
                if( $data['columns'][$i]['data'] == "id" ) {
                    $column = 'tData.id';
                }elseif( $data['columns'][$i]['data'] == "name" ) {
                    $column = 'tData.name';
                }elseif( $data['columns'][$i]['data'] == "region" ) {
                    $column = 'tData.region';
                }elseif( $data['columns'][$i]['data'] == "capital_city" ) {
                    $column = 'tData.capital_city';
                }elseif( $data['columns'][$i]['data'] == "population" ) {
                    $column = 'tData.population';
                }elseif( $data['columns'][$i]['data'] == "created_at" ) {
                    $column = 'tData.created_at';
                }elseif( $data['columns'][$i]['data'] == "updated_at" ) {
                    $column = 'tData.updated_at';
                }                
    
                $isFiltered = true;
                $tData->where($column, 'LIKE', '%' . $data['columns'][$i]['search']['value'] . '%');
            }
            //Sort order by column
            if( ! empty($data['order'][0]['column']) ) {
    
                $orderColumn = 'tData.' . $data['order'][0]['column'];
                if($data['order'][0]['column'] ==  "0"){
                    $orderColumn = 'tData.id';
                }elseif($data['order'][0]['column'] ==  "1"){
                    $orderColumn = 'tData.name';
                }elseif($data['order'][0]['column'] ==  "2"){
                    $orderColumn = 'tData.region';
                }elseif($data['order'][0]['column'] ==  "3"){
                    $orderColumn = 'tData.capital_city';
                }elseif($data['order'][0]['column'] ==  "4"){
                    $orderColumn = 'tData.population';
                }elseif($data['order'][0]['column'] ==  "5"){
                    $orderColumn = 'tData.created_at';
                }elseif($data['order'][0]['column'] ==  "6"){
                    $orderColumn = 'tData.updated_at';
                }
    
                $isFiltered = true;
                $tData->orderBy($orderColumn, $data['order'][0]['dir'] );
                
            }    
            $i++;
        }
    
        $fileteredtData = $tData->get();
        $gettData = $tData->offset($data['start'])
            ->limit($data['length'])
            ->get();
    
        $recordsFiltered = $isFiltered ? count($fileteredtData) : $recordsTotal;
        $responsetData = [];
        $responseArr = [
            "draw" => $data['draw'],
            "recordsTotal" => $recordsTotal,
            "recordsFiltered" => $recordsFiltered,
            "data" => $gettData
        ];
        return json_encode($responseArr);
    }
    public function randomKey($length) {
        $pool = array_merge(range(0, 9), range('a', 'z'), range('A', 'Z'));

        $key = null;
        for ($i = 0; $i < $length; $i++) {
            $key .= $pool[mt_rand(0, count($pool) - 1)];
        }
        return $key;
    }

    public function createAccessToken($username)
    {
        $accessToken = $this->randomKey(39);
        $expire_time = date("Y-m-d H:i:s", strtotime('+24 hours'));

        $existing_token = \DB::table('api_users')->select('*')->where('username', 'LIKE', $username)
            ->first();
        $existing_token->access_token = "$accessToken";
        $existing_token->expires_at = $expire_time;
        $existing_token= \DB::table('api_users')->where('username', $username)
        ->update([
            'access_token' =>$existing_token->access_token,
            'expires_at' =>$existing_token->expires_at,
        ]);
        return $existing_token;
    }

    public function getAccessToken(Request $request)
    {
        $post_val = $request;
        $username = $post_val['username'];
        $password = $post_val['password'];

        $existing_token = \DB::table('api_users')->select('access_token','password','expires_at')->where('username', 'LIKE', $username)->first();
        
        $response = new \stdClass();
        $currentDate = date('Y-m-d H:i:s');
        if ($existing_token)
        {
            if (Hash::check($password, $existing_token->password))
            {
                $expireDate = $existing_token->expires_at;
                if (($existing_token->access_token == '')||($expireDate < $currentDate) )
                {
                    $api_users = $this->createAccessToken($username);                  
                    $response->status = "success";
                    $response->access_token = $api_users->access_token;
                    $response->expires_at = $api_users->expires_at;
                }
                else
                {
                    $response->status = "success";
                    $response->access_token = $existing_token->access_token;
                    $response->expires_at = $existing_token->expires_at;

                }
            }
            else
            {
                $response->status = "failure";
                $response->message = "Invalid password";
            }
        }
        return response(json_encode($response))->header('Content-Type', 'application/json');
    }
    public function createGroupData($postVal)
    {   
        $this->checkAccessToken();
        $grpListArr=[];
        $allGrps = \DB::table('group_data')->select('group_name')->get();
        foreach ($allGrps as $ag)
        {
            array_push($grpListArr, $ag->group_name);
        }
        if (in_array($postVal['group_name'], $grpListArr))
        {
            return response()->json(['message' => 'Group name already exists']);
        }
        else
        {
            $arr[] = [
                'group_name' => $postVal['group_name'],
                'group_data' => json_encode($postVal['data_list'])
            ];
            DB::table('group_data')->insert($arr);
            if(DB::table('group_data')->insert($arr)){
                return response()->json(['message' => 'Group created successfully']);
            }
        }
        
    }
    public function allGroupData(){
        $this->checkAccessToken();
        
        $groupData = \DB::table('group_data')->select('group_name','group_data')->orderBy('id', 'desc')->get();
        
        $data = json_decode($groupData, true);
        if ($data !== null) {
            foreach ($data as &$item) {
                $groupData = json_decode($item['group_data']);
                $item['group_data'] = $groupData;
            }
            $prettyJson = json_encode(['status'=>200,'message' => 'Success','data'=>[$data]], JSON_PRETTY_PRINT);
            return response($prettyJson)->header('Content-Type', 'application/json');
        } else {
            $prettyJson = json_encode(['message' => 'Something went wrong']);
            return response($prettyJson)->header('Content-Type', 'application/json');
        }
    }

    public function getCity_with_country()
    {           
        $this->checkAccessToken();
        $cities = \DB::table('city_json')->select('city_with_country')->where('id',2)->get();
        $data = json_decode($cities, true);
        $output_data = json_decode($data[0]['city_with_country'], true);
        $input_data= json_encode($output_data);  
        $data = json_decode($input_data, true);
        $result = [];
        
        foreach ($data as $entry) {
            $country = $entry['country'];
            $city = $entry['city'];
        
            if (!isset($result["city_with_country"][$country])) {
                $result["city_with_country"][$country] = [];
            }
        
            $result["city_with_country"][$country]["city"][] = $city;
        }
        
        $prettyJson = json_encode(['status'=>200,'message' => 'Success','data'=>$result], JSON_PRETTY_PRINT);
        return response($prettyJson)->header('Content-Type', 'application/json');
    }

    public function getAllCity()
    {           
        $this->checkAccessToken();
        $cities = \DB::table('city_json')->select('city_with_country')->where('id',2)->get();
    
        $data = json_decode($cities, true);

        // Extract all the "city" values into a list
        $cities = [];

        foreach ($data as $entry) {
            $city_with_country = json_decode($entry["city_with_country"], true);
            foreach ($city_with_country as $city_data) {
                $cities[] = $city_data["city"];
            }
        }
        $prettyJson = json_encode(['status'=>200,'message' => 'Success','cities'=>$cities], JSON_PRETTY_PRINT);
        return response($prettyJson)->header('Content-Type', 'application/json');
    }
}