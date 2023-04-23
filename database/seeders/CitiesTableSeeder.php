<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class CitiesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('cities')->insert([
            [
                'id' => 1,
                'title' => 'Natal',
                'slug' => 'natal',
                'status' => 1,
                'photo' => 'posts/teste.png',
                'created_at' => now(),
                'updated_at' => now()
            ],
            [
                'id' => 2,
                'title' => 'Parnamirim',
                'slug' => 'parnamirim',
                'status' => 1,
                'photo' => 'posts/teste.png',
                'created_at' => now(),
                'updated_at' => now()
            ],
        ]);
    }
}
