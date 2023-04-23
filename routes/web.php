<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/
// Route::get('/foo', function () {
//     Artisan::call('storage:link');
// });
 Route::get('/limpar-cache', function () {
     Artisan::call('config:clear');
     Artisan::call('route:clear');
     Artisan::call('view:clear');
 });
Route::get('/deploy', function () {
    Artisan::call('config:cache');
    Artisan::call('route:cache');
    Artisan::call('view:cache');
});
Route::get('/resetar-banco', function () {
    Artisan::call('migrate:fresh');
    Artisan::call('db:seed');
});
Route::post(   '/oportunidades/buscar', [App\Http\Controllers\Pages\PagesController::class, 'posts'])->name('buscar');
Route::get(   '/oportunidades/buscar', [App\Http\Controllers\Pages\PagesController::class, 'posts'])->name('buscar-por');
Route::get(   '/', [App\Http\Controllers\Pages\PagesController::class, 'index'])->name('home');
Route::get(   '/oportunidade/{slug}', [App\Http\Controllers\Pages\PagesController::class, 'post'])->name('post');
Route::get(   '/oportunidades', [App\Http\Controllers\Pages\PagesController::class, 'posts'])->name('posts');
Route::post('/enviar-form', [App\Http\Controllers\Pages\PagesController::class, 'enviar_form'])->name('enviar_form');
Route::get('/page/{page}', [App\Http\Controllers\Pages\PagesController::class, 'page'])->name('page');

Auth::routes();

Route::middleware('auth')->prefix('admin')->name('admin.')->group(function () {
    Route::get('home', [App\Http\Controllers\Admin\HomeController::class, 'index'])->name('home');
    Route::get('/', [App\Http\Controllers\Admin\HomeController::class, 'index']);

    Route::resource('posts', App\Http\Controllers\Admin\PostController::class)->middleware('can:read_posts');
    Route::post('posts/ativo/{id}', [App\Http\Controllers\Admin\PostController::class, 'ativo'])->name('posts.ativo')->middleware('can:update_posts');
    Route::post('posts/destaque/{id}', [App\Http\Controllers\Admin\PostController::class, 'destaque'])->name('posts.destaque')->middleware('can:update_posts');

    Route::resource('contacts', App\Http\Controllers\Admin\ContactController::class)->middleware('can:read_contacts');

    Route::resource('roles', App\Http\Controllers\Admin\RoleController::class)->middleware('can:read_roles');

    Route::resource('users', App\Http\Controllers\Admin\UserController::class)->middleware('can:read_users');

    Route::get('user/edit', [App\Http\Controllers\Admin\UserController::class, 'edit_user'])->name('edit_user');
    Route::post('user/update/{id}', [App\Http\Controllers\Admin\UserController::class, 'update_user'])->name('update_user');

    Route::resource('categories', App\Http\Controllers\Admin\CategoryController::class)->middleware('can:read_categories');

    Route::resource('tags', App\Http\Controllers\Admin\TagController::class)->middleware('can:read_tags');

    Route::resource('configurations', App\Http\Controllers\Admin\ConfigurationController::class)->middleware('can:read_configurations');

    Route::resource('modules', App\Http\Controllers\Admin\ModuleController::class)->middleware('can:read_modules');

    Route::resource('cities', App\Http\Controllers\Admin\CityController::class)->middleware('can:read_cities');
    Route::post('cities/ativo/{id}', [App\Http\Controllers\Admin\CityController::class, 'ativo'])->name('cities.ativo')->middleware('can:update_cities');

    Route::post('post_photo/remove', [App\Http\Controllers\Admin\PostPhotosController::class, 'removePhoto'])
        ->name('post_photo_remove')
        ->middleware('can:delete_posts');
    Route::post('post_photo/add/{id}', [App\Http\Controllers\Admin\PostPhotosController::class, 'addPhotos'])
        ->name('post_photo_add')
        ->middleware('can:update_posts');

    Route::post('city_neighborhood/remove', [App\Http\Controllers\Admin\CityNeighborhoodsController::class, 'removeNeighborhood'])
        ->name('city_neighborhood_remove')
        ->middleware('can:delete_cities');
    Route::post('city_neighborhood/add/{id}', [App\Http\Controllers\Admin\CityNeighborhoodsController::class, 'addNeighborhood'])
        ->name('city_neighborhood_add')
        ->middleware('can:update_cities');
});

