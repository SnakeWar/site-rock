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

Route::match(['get', 'post'],   '/buscar/{category?}/{tag?}', [App\Http\Controllers\Pages\PagesController::class, 'index'])->name('buscar');
Route::get(   '/', [App\Http\Controllers\Pages\PagesController::class, 'index'])->name('home');
Route::get(   '/oportunidade/{slug}', [App\Http\Controllers\Pages\PagesController::class, 'post'])->name('post');
Route::post('/enviar-form', [App\Http\Controllers\Pages\PagesController::class, 'enviar_form'])->name('enviar_form');

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

    Route::resource('modules', App\Http\Controllers\Admin\ModuleController::class)->middleware('can:read_modules');

    Route::post('post_photo/remove', [App\Http\Controllers\Admin\PostPhotosController::class, 'removePhoto'])
        ->name('post_photo_remove')
        ->middleware('can:delete_posts');
    Route::post('post_photo/add/{id}', [App\Http\Controllers\Admin\PostPhotosController::class, 'addPhotos'])
        ->name('post_photo_add')
        ->middleware('can:update_posts');
});

