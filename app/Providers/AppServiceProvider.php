<?php

namespace App\Providers;

use Illuminate\Events\Dispatcher;
use Illuminate\Pagination\Paginator;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\ServiceProvider;
use JeroenNoten\LaravelAdminLte\Events\BuildingMenu;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(Dispatcher $events): void
    {
        Paginator::useBootstrapFive();

        $events->listen(BuildingMenu::class, function (BuildingMenu $event) {

            $event->menu->addBefore('1', 'MENU DE NAVEGAÇÃO');


            $menus = DB::table('modules')
                ->whereNotIn('title', ['Usuários', 'Módulos', 'Logs', 'Grupos', 'Configurações'])
                ->get();

            foreach($menus as $menu){

                $event->menu->addAfter('1' ,[
                    'text' => $menu->title,
                    'url' => 'admin/' . $menu->url,
                    'can' => 'read_' . $menu->url,
                    'icon' => $menu->icon ?? 'fas fa-th',
                ]);
            }
        });
    }
}
