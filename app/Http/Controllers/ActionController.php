<?php

namespace App\Http\Controllers;

use App\Action;
use Illuminate\Http\Request;
use DB;

class ActionController extends Controller
{

    public function allActions()
    {
        $allActions = \App\Action::all()
            ;
//dd($allActions);
        return view('allaction')->withActions($allActions);
    }

    public function editAction($actionId)
    {

        $action = \App\Action::find($actionId);
        return view('editaction')->withAction($action);
    }

    public function saveAction(Request $request,$actionId)
    {

        $action = \App\Action::find($actionId);
        $action->update($request->input());

        return view('editaction')->withAction($action);
    }
    public function actionDetails($actionId)
    {
        $action = \App\Action::find($actionId);
        $userId = DB::table('action_user')->select('user_id')->where('action_id',$actionId)->first();
        if(!isset($userId)){
            $user = \App\User::find(6);
        } else {
            $user = \App\User::find($userId->user_id);
        }


        $actionTypeId = $action->action_type_id;

        $type = \App\ActionType::find($actionTypeId);
         return view('actiondetails')->withAction($action)->withUser($user)->withType($type);
    }
}
