<?php

namespace App\Providers;

use App\Models\Configuration;
use Illuminate\Support\ServiceProvider;
use Illuminate\View\View;

class ViewServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap services.
     */
    public function boot(): void
    {
        View::composer('pages.layouts.block.head', function (View $view) {
            return $view->composer('configuration_head', Configuration::whereCode('APP_DESCRIPTION')
                ->whereCode('APP_APP_NAME')
                ->whereCode('APP_EMAIL')
                ->whereCode('APP_INSTAGRAM')
                ->whereCode('APP_URL')
                ->whereCode('APP_WHATSAPP')
                ->orderBy('code')
                ->get());
//            return array_map(function ($it) {
//                return [$it->code => $it->value];
//            }, $result);
        });
    }
}
