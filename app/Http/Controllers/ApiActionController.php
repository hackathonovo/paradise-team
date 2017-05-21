<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Action;
use App\User;
use Carbon\Carbon;
use Nexmo;
use DB;

class ApiActionController extends Controller
{
    public function index()
    {
      return Action::orderBy('start_time', 'desc')->get();
    }

    public function details($id)
    {
      $actionObject = Action::where('id', $id)->with('actionType')->get()->first();
      return $actionObject;
    }

    public function create(Request $request)
    {
      $action = new Action;

      $action->title = $request->input('title');
      $action->longitude = $request->input('longitude');
      $action->latitude = $request->input('latitude');
      $action->range = $request->input('range');
      $action->action_type_id = $request->input('action_type_id');
      $action->info = $request->input('info');
      $now =  Carbon::now('Europe/Zagreb');
      $action->start_time = $now;


      $action->save();

      $users = array();
      $numberOfUsers = $request->input('user_num');
      for ($i=0; $i < $numberOfUsers; $i++) {
        $this->sms(User::find($request->input('user_id'.$i))->phone);
        DB::table('action_user')->insert(
             ['action_id' => $action->id, 'user_id' => $request->input('user_id'.$i)]
              );
      }

      return $action;
    }

    public function sms($phone)
    {

      $client = new Nexmo\Client(new Nexmo\Client\Credentials\Basic('bb252e5e', 'bfe726923abaab56'));
      $message = $client->message()->send([
        'to' => $phone,
        'from' => 'NEXMO',
        'text' => 'Pozvan si na akciju!'
      ]);
    }

    public function poi()
    {
      return Action::orderBy('start_time', 'desc')->get(['longitude', 'latitude']);
    }


}
