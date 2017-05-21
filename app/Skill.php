<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Skill extends Model
{
     protected $fillable = ['skill_name'];

     public $timestamps = false;

     public function users()
     {
         return $this->belongsToMany('App\User');
     }
}
