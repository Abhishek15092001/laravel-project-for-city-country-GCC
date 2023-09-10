<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::any('getDetails', [
    'as' => 'getDetails', 'uses' => 'CoreApis\ThirdPartyApiController@index'
]);

Route::any('getCities', [
    'as' => 'getCities', 'uses' => 'CoreApis\ThirdPartyApiController@index'
]);
Route::any('admin', [
    'as' => 'admin',
    'uses'=>'Services\AdminController@index'
]);
Route::any('getAccessToken', [
    'as' => 'getAccessToken',
    'uses'=>'Services\AdminController@getAccessToken'
]);

