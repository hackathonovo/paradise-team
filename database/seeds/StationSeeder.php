<?php

use Illuminate\Database\Seeder;

class StationSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        App\Station::create(['name' => 'Split','latitude'=>'0','longitude'=>'0']);
        App\Station::create(['name' => 'Zagreb','latitude'=>'0','longitude'=>'0']);
        App\Station::create(['name' => 'Zadar','latitude'=>'0','longitude'=>'0']);
    }
}
