<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Event extends Model
{
  protected $fillable = ['user_id', 'latitude', 'longitude', 'action_event_id'];

  public $timestamps = false;
}
