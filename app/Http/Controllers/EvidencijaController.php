<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use Carbon\Carbon;


class EvidencijaController extends Controller
{

    public function listUsers()
    {

        $spasitelji = \App\User::all();

//        dd(\App\User::find(4)->station->name);
        return view('sviSpasitelji')->withSpasitelji($spasitelji);
    }

    public function listSpasitelj($spasiteljId)
    {
        $spasitelj = \App\User::find($spasiteljId);

        $timesheet = \App\User::find($spasiteljId)->timesheets[0];


        return view('spasitelj')->withSpasitelj($spasitelj)->withTimesheet($timesheet);
    }

    public function saveSpasitelj(Request $request, $spasiteljId)
    {
        $userInfo = array_slice($request->input(), 0, 3, true);

        $user = \App\User::find($spasiteljId);
        $user->update($userInfo);

        $timesheetInfo = array_slice($request->input(), 3, 3, true);

        if ($timesheetInfo['start_time'] == null) {
            $timesheetInfo['start_time'] = '00';
        }


        if ($timesheetInfo['end_time'] == null) {
            $timesheetInfo['end_time'] = '00';
        }

        $timesheetInfo['start_time'] = Carbon::createFromTime(substr($timesheetInfo['start_time'], 0, 2), substr($timesheetInfo['start_time'], 3, 2), 0);

        $timesheetInfo['end_time'] = Carbon::createFromTime(substr($timesheetInfo['end_time'], 0, 2), substr($timesheetInfo['end_time'], 3, 2), 0);

        $timesheet = \App\Timesheet::where('user_id', $user->id)->first();
        if (empty($timesheet)) {
            $timesheet = \App\Timesheet::create($timesheetInfo);
            $timesheetInfo['user_id']= $user->id;
        }
        $timesheet->update($timesheetInfo);

//        dd($timesheetInfo);

        return redirect('/spasitelji');
    }
}
