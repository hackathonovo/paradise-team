<?php
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', 'HomeController@index');
Route::get('/edit/{actionId}', 'ActionController@editAction');
Route::post('/edit/{actionId}', 'ActionController@saveAction');
Auth::routes();

Route::get('/sifrarnik', 'SifrarnikController@actiontypes');
Route::post('/sifrarnik', 'SifrarnikController@saveActionType');

Route::get('/home', 'HomeController@index')->name('home');


Route::post('/token', function (Request $request) {

    $http = new GuzzleHttp\Client;

    try {
        $response = $http->post(env('APP_URL') . '/oauth/token', [
            'form_params' => [
                'grant_type' => 'password',
                'client_id' => $request->client_id,
                'client_secret' => $request->client_secret,
                'username' => $request->username,
                'password' => $request->password,
                'scope' => ''
            ],
            'headers' => [
                'Accept' => 'application/json'
            ]

        ]);


        return json_decode((string)$response->getBody(), true);
    } catch (GuzzleHttp\Exception\ServerException $e) {
        $response = $e->getResponse();
        $result = $response->getBody();

        return $result;

    }
});

Route::get('/test', function(Request $request) {
   return 'test HELL YEAH';
});
Route::get('/akcije', 'ActionController@allActions');
Route::get('/akcija/{actionId}', 'ActionController@actionDetails');

Route::get('/spasitelji', 'EvidencijaController@listUsers');
Route::get('spasitelj/{spasiteljId}','EvidencijaController@listSpasitelj');
Route::post('spasitelj/{spasiteljId}','EvidencijaController@saveSpasitelj');

Route::get('statistika','StatistikaController@allStatistics');