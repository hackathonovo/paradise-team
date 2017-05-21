<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ActionEvent extends Model
{
  protected $fillable = ['event_name', 'action_type_id'];

  public $timestamps = false;
}
