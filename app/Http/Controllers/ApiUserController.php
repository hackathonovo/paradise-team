<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use App\Skill;


class ApiUserController extends Controller
{
    public function filter(Request $request)
    {
      $PI = 3.14;
      $speolog = $alpinist = $medicina = $visokogorstvo = $penjanje = null;

      if (null !== $request->input('speolog')){
        $speolog = $request->input('speolog');
      }
      if (null !== $request->input('alpinist')){
        $alpinist = $request->input('alpinist');
      }
      if (null !== $request->input('medicina')){
        $medicina = $request->input('medicina');
      }
      if (null !== $request->input('visokogorstvo')){
        $visokogorstvo = $request->input('visokogorstvo');
      }
      if (null !== $request->input('penjanje')){
        $penjanje = $request->input('penjanje');
      }

      $latitude = $request->input('latitude');
      $longitude = $request->input('longitude');

      $users = User::with('timesheets')->whereHas('skills', function($q) use($speolog, $alpinist, $medicina, $visokogorstvo, $penjanje)
      {
          $firstSearch = true;

          if(isset($speolog)){
            $q->where('id','1');
            $firstSearch = false;
          }

          if(isset($alpinist)){
            if ($firstSearch){
              $q->where('id', '2');
              $firstSearch = false;
            }
            else{
              $q->orWhere('id', '2');
            }
          }

          if(isset($medicina)){
            if ($firstSearch){
              $q->where('id', '3');
              $firstSearch = false;
            }
            else{
              $q->orWhere('id', '3');
            }
          }

          if(isset($visokogorstvo)){
            if ($firstSearch){
              $q->where('id', '4');
              $firstSearch = false;
            }
            else{
              $q->orWhere('id', '4');
            }
          }

          if(isset($penjanje)){
            if ($firstSearch){
              $q->where('id', '5');
              $firstSearch = false;
            }
            else{
              $q->orWhere('id', '5');
            }
          }

      })->get();

      $size = $users->count();
      $array = array();
      for ($i=0; $i < $size; $i++) {
        $array[$i] = $i;
      }
      unset($i);

      $distances = array();
      for ($i=0; $i < $size; $i++) {
        $R = 6371; // Radius of the earth in km
        $dLat = ($users[$i]['timesheets']->first()->latitude-$latitude)*($PI/180);  // deg2rad below
        $dLon = ($users[$i]['timesheets']->first()->longitude-$longitude)*($PI/180);
        $a = sin($dLat/2) * sin($dLat/2) + cos($users[0]['timesheets']->first()->latitude*($PI/180)) * cos($latitude*($PI/180)) * sin($dLon/2) * sin($dLon/2);
        $c = 2 * atan(sqrt($a))* atan(sqrt(1-$a));
        $d = $R * $c; // Distance in km
        $distances[$i]=$d;
      }
      unset($i);


      for ($i=0; $i<$size; $i++) {
        for ($j=0; $j<$size-1-$i; $j++) {
            if ($distances[$j+1] < $distances[$j]) {
                $temp = $distances[$j];
                $distances[$j]=$distances[$j+1];
                $distances[$j+1] = $temp;

                $temp = $array[$j];
                $array[$j]=$array[$j+1];
                $array[$j+1] = $temp;
            }
        }
      }
      unset($i);
      unset($j);

      $usersCopy = $users->all();
      for ($i=0; $i < $size; $i++) {
        $users[$i] = $usersCopy[$array[$i]];
      }

      return $users;

    }



}
