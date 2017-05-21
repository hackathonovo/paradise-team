<?php

use Illuminate\Database\Seeder;

class ActionsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        \App\Action::create(['title'=>'Spašavanje žene u planini','latitude'=>'43.5081','longitude'=>'16.4402',
            'range'=>'5','action_type_id'=>'1','info'=>'žena se utapa na zrmanji','start_time'=>'2017-03-17 13:30:30',
            'end_time'=>'2017-03-17 13:20:30']);

        \App\Action::create(['title'=>'Spašavanje žene u planini','latitude'=>'47.3401','longitude'=>'13.4402',
            'range'=>'5','action_type_id'=>'2','info'=>'žena se utapa na zrmanji','start_time'=>'2017-02-17 13:20:30',
            'end_time'=>'2017-03-01 13:20:30']);

        \App\Action::create(['title'=>'Spašavanje žene u planini','latitude'=>'33.5081','longitude'=>'53.4402',
            'range'=>'5','action_type_id'=>'3','info'=>'žena se utapa na zrmanji','start_time'=>'2017-03-17 13:20:30',
            'end_time'=>'2017-03-17 13:20:30']);

        \App\Action::create(['title'=>'Spašavanje žene u planini','latitude'=>'44.5081','longitude'=>'21.4402',
            'range'=>'5','action_type_id'=>'4','info'=>'žena se utapa na zrmanji','start_time'=>'2016-03-17 13:20:30',
            'end_time'=>'2016-03-17 13:20:30']);
    }
}
