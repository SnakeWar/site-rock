<?php

namespace Database\Seeders;

use App\Models\City;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        $this->call([
            UsersTableSeeder::class,
            ModulesTableSeeder::class,
            RolesTableSeeder::class,
            RolesUsersTableSeeder::class,
            PermissionsTableSeeder::class,
            PermissionsRolesTableSeeder::class,
            CitiesTableSeeder::class,
            CityNeighborhoodsTableSeeder::class,
            //PostsTableSeeder::class,
            ConfigurationsTableSeeder::class
        ]);
    }
}
