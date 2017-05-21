<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class StatistikaController extends Controller
{
    public function allStatistics()
    {
        $roles = \App\Role::all();
        foreach ($roles as $role) {
//            dd($role->users);
        }


        return view('statistics')->withRoles($roles);
    }

}
