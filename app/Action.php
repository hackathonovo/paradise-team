<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Action extends Model
{
  protected $fillable = ['title', 'latitude', 'longitude', 'range', 'action_type_id', 'info', 'start_time', 'end_time'];

  public $timestamps = false;

  public function actionType()
   {
       return $this->belongsTo('App\ActionType');
   }
}
