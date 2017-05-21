<?php

use Illuminate\Database\Seeder;

class ActionEventsTableSeeder extends Seeder
{
    public function run()
    {
        //TODO dodati skillove, runat seed  php artisan db:seed --class=ActionEventsTableSeeder
        //ZA SVAKU AKCIJU IMAT EVENT MESSAGE KOJI OTVARA TEXTBOX
        App\ActionEvent::create(['event_name' => 'Čovjek spašen.', 'action_type_id' => '1']);
        App\ActionEvent::create(['event_name' => 'Čovijek spašen.', 'action_type_id' => '2']);
        App\ActionEvent::create(['event_name' => 'Čovjek spašen.', 'action_type_id' => '3']);
        App\ActionEvent::create(['event_name' => 'Čovjek lociran.', 'action_type_id' => '4']);
        App\ActionEvent::create(['event_name' => 'Čovjek u lošem stanju .', 'action_type_id' => '1']);
        App\ActionEvent::create(['event_name' => 'Čovjek u lošem stanju .', 'action_type_id' => '2']);
        App\ActionEvent::create(['event_name' => 'Čovjek u lošem stanju .', 'action_type_id' => '3']);
        App\ActionEvent::create(['event_name' => 'Čovjek se utopi.', 'action_type_id' => '4']);
        App\ActionEvent::create(['event_name' => 'Čovjek ozljeđen.', 'action_type_id' => '1']);
        App\ActionEvent::create(['event_name' => 'Čovjek ozljeđen.', 'action_type_id' => '2']);
        App\ActionEvent::create(['event_name' => 'Čovijek ozljeđen.', 'action_type_id' => '3']);
        App\ActionEvent::create(['event_name' => 'Čovjek ozljeđen.', 'action_type_id' => '4']);

    }
}