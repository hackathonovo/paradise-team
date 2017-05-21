<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Station extends Model
{
  protected $fillable = ['name', 'latitude', 'longitude'];

  public $timestamps = false;

  public function users()
  {
    return $this->hasMany('App\User');
  }
}
