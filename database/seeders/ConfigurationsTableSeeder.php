<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ConfigurationsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('modules')->insert([
            [
                'codigo' => 'SOBRE_MIM',
                'valor' => 'Vinicius Araújo é um especialista em casas de alto padrão em condomínio fechado na região de Natal e Parnamirim/RN.',
                'created_at' => now(),
                'updated_at' => now()
            ]
        ]);
    }
}
