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
                'created_at' => now(),
                'updated_at' => now()
            ],
            [
                'title' => 'Contato',
                'url' => 'contacts',
                'created_at' => now(),
                'updated_at' => now()
            ],
            [
                'title' => 'Oportunidades',
                'url' => 'posts',
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
                'created_at' => now(),
                'updated_at' => now()
            ],
            [
                'title' => 'Tags',
                'url' => 'tags',
                'created_at' => now(),
                'updated_at' => now()
            ],
            [
                'title' => 'Logs',
                'url' => 'url',
                'created_at' => now(),
                'updated_at' => now()
            ],
        ]);
    }
}
