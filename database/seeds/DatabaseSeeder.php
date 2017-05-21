<?php

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // $this->call(UsersTableSeeder::class);
//        $this->call(RolesTableSeeder::class);
//        $this->call(ActionTypesTableSeeder::class);
//        $this->call(ActionEventsTableSeeder::class);
//        $this->call(StationSeeder::class);
//        $this->call(ActionsSeeder::class);
//        $this->call(UsersSeeser::class);
    }
}

class RolesTableSeeder extends Seeder
{
  public function run()
  {
      App\Role::create(['role_name' => 'Voditelj']);
      App\Role::create(['role_name' => 'Gorski spašavatelj']);
      App\Role::create(['role_name' => 'Pripravnik']);
      App\Role::create(['role_name' => 'Pridruzei clan']);
  }
}
