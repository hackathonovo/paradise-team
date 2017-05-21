<?php

namespace App;

use Laravel\Passport\HasApiTokens;
use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    //TODO assign relationships with other models

    use HasApiTokens, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password','image_url','station_id','role_id','phone','first_name','last_name'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    public function station()
    {
        return $this->belongsTo('App\Station');
    }

    public function timesheets()
    {
        return $this->hasMany('App\Timesheet');
    }


    public function routeNotificationForNexmo()
    {
        return $this->phone;
      }
    public function skills()
    {
        return $this->belongsToMany('App\Skill');
    }
}
