<?php

namespace App\Providers;

use App\View\Composers\ConfigurationComposer;
use App\View\Composers\MinMaxValueComposer;
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
        Facades\View::composer('pages.post', ConfigurationComposer::class);
        view()->composer('pages.layouts.form._form_search', MinMaxValueComposer::class);
    }
}
