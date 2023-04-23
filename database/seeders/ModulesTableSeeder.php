<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ModulesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // DB::table('modules')->delete();

        DB::table('modules')->insert([
            [
                'title' => 'Usuários',
                'url' => 'users',
                'icon' => 'fas fa-fw fa-user',
                'created_at' => now(),
                'updated_at' => now()
            ],
            [
                'title' => 'Grupos',
                'url' => 'roles',
                'icon' => '',
                'created_at' => now(),
                'updated_at' => now()
            ],
            [
                'title' => 'Contato',
                'url' => 'contacts',
                'icon' => '',
                'created_at' => now(),
                'updated_at' => now()
            ],
            [
                'title' => 'Oportunidades',
                'url' => 'posts',
                'icon' => '',
                'created_at' => now(),
                'updated_at' => now()
            ],
            [
                'title' => 'Módulos',
                'url' => 'modules',
                'icon' => 'fas fa-fw fa-database',
                'created_at' => now(),
                'updated_at' => now()
            ],
            [
                'title' => 'Categorias',
                'url' => 'categories',
                'icon' => '',
                'created_at' => now(),
                'updated_at' => now()
            ],
            [
                'title' => 'Tags',
                'url' => 'tags',
                'icon' => '',
                'created_at' => now(),
                'updated_at' => now()
            ],
            [
                'title' => 'Logs',
                'url' => 'logs',
                'icon' => '',
                'created_at' => now(),
                'updated_at' => now()
            ],
            [
                'title' => 'Cidades',
                'url' => 'cities',
                'icon' => 'fas fa-fw fa-building',
                'created_at' => now(),
                'updated_at' => now()
            ],
            [
                'title' => 'Configurações',
                'url' => 'configurations',
                'icon' => 'fas fa-fw fa-wrench',
                'created_at' => now(),
                'updated_at' => now()
            ],
        ]);
    }
}
