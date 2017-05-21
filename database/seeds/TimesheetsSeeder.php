<?php

use Illuminate\Database\Seeder;

class TimesheetsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        \App\Timesheet::create(['user_id'=>'6','latitude'=>'43.5081','longitude'=>'16.4402','start_time'=>'2017-01-01 09:00:00', 'end_time'=>'2017-01-01 19:00:00', 'description'=>'na poslu u Centru ZG']);
        \App\Timesheet::create(['user_id'=>'7','latitude'=>'45.8150','longitude'=>'115.9819','start_time'=>'2017-01-01 09:00:00', 'end_time'=>'2017-01-01 19:00:00', 'description'=>'U Splitu ']);
        \App\Timesheet::create(['user_id'=>'8','latitude'=>'45.5550','longitude'=>'18.6955','start_time'=>'2017-01-01 08:00:00', 'end_time'=>'2017-01-01 14:30:00', 'description'=>'Kod kuće']);
    }
}
