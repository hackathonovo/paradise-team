<?php

use Illuminate\Database\Seeder;

class SkillsTableSeeder extends Seeder
{
  public function run()
  {
    //TODO dodati skillove, runat seed  php artisan db:seed --class=SkillsTableSeeder
      App\Skill::create(['skill_name' => 'Speolog']);
      App\Skill::create(['skill_name' => 'Alpinist']);
      App\Skill::create(['skill_name' => 'Medicina']);
      App\Skill::create(['skill_name' => 'Visokogorstvo']);
      App\Skill::create(['skill_name' => 'Sportsko penjanje']);
  }
}
