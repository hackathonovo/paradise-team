<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ActionType extends Model
{
  protected $fillable = ['name', 'about'];

  public $timestamps = false;

  public function actions()
    {
        return $this->hasMany('App\Action');
    }
}
