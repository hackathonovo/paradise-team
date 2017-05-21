<?php

use Illuminate\Database\Seeder;

class ActionTypesTableSeeder extends Seeder
{
  public function run()
  {
    //TODO dodati skillove, runat seed  php artisan db:seed --class=ActionTypesTableSeeder
      App\ActionType::create(['name' => 'More','about'=>'Pretraga na moru']);
      App\ActionType::create(['name' => 'Stijename','about'=>'Pretraga na stijenu']);
      App\ActionType::create(['name' => 'Planine','about'=>'Pretraga na planine']);
      App\ActionType::create(['name' => 'Potraga','about'=>'Pretraga']);
  }
}
