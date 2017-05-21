<?php

use Illuminate\Database\Seeder;

class UsersSeeser extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        App\User::create([
            'name'=>'pero',
            'email'=>uniqid().'@email.com',
            'password'=>bcrypt('password'),
            'station_id'=>random_int(1,4),
            'role_id' => random_int(4,6), //OVO JE NEVODITELJ A VODITELJ TREA DA BUDE 1
            'first_name'=> 'Josko',
            'last_name' => 'Glovic'

        ]);


        App\User::create([
            'name'=>'pero',
            'email'=>uniqid().'@email.com',
            'password'=>bcrypt('password'),
            'station_id'=>random_int(1,4),
            'role_id' => random_int(4,6), //OVO JE NEVODITELJ A VODITELJ TREA DA BUDE 1
            'first_name'=> 'Janko',
            'last_name' => 'Glovic'

        ]);


        App\User::create([
            'name'=>'pero',
            'email'=>uniqid().'@email.com',
            'password'=>bcrypt('password'),
            'station_id'=>random_int(1,4),
            'role_id' =>'1', //OVO JE VODITELJ
            'first_name'=> 'Jelenko',
            'last_name' => 'Filic'

        ]);
    }
}
