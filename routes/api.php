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


Route::middleware('auth:api')->get('/actions', 'ApiActionController@index');
Route::middleware('auth:api')->get('/action/{id}', 'ApiActionController@details');
Route::middleware('auth:api')->get('/actions/poi', 'ApiActionController@poi');
Route::middleware('auth:api')->post('/action/create', 'ApiActionController@create');

Route::middleware('auth:api')->get('/filters', function (Request $request) {
    return \App\Skill::all();
});
Route::middleware('auth:api')->post('/user/filter', 'ApiUserController@filter');
