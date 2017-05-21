<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Timesheet extends Model
{
  protected $fillable = ['user_id', 'start_time', 'end_time', 'latitude', 'longitude','description'];

  public $timestamps = false;
}
