<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class SifrarnikController extends Controller
{

    public function actiontypes()
    {
        $types = \App\ActionType::all();

        return view('actiontypes')->withTypes($types);
    }

    public function saveActionType(Request $request)
    {
        \App\ActionType::create($request->input());

        $types = \App\ActionType::all();

        return view('actiontypes')->withTypes($types);
    }
}
