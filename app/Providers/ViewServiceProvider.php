<?php

namespace App\Providers;

use App\View\Composers\ConfigurationComposer;
use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades;

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
        Facades\View::composer('pages.layouts.block.head', ConfigurationComposer::class);
        Facades\View::composer('pages.index', ConfigurationComposer::class);
        Facades\View::composer('pages.layouts.app', ConfigurationComposer::class);
    }
}
