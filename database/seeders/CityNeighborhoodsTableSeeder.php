<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class CityNeighborhoodsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('city_neighborhoods')->insert([
            [
                'title' => 'Satélite',
                'city_id' => 1,
                'created_at' => now(),
                'updated_at' => now()
            ],
            [
                'title' => 'Alecrim',
                'city_id' => 1,
                'created_at' => now(),
                'updated_at' => now()
            ],
            [
                'title' => 'Santos Reis',
                'city_id' => 2,
                'created_at' => now(),
                'updated_at' => now()
            ],
            [
                'title' => 'Nova Parnamirim',
                'city_id' => 2,
                'created_at' => now(),
                'updated_at' => now()
            ]
        ]);
    }
}
