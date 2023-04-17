<?php

use App\Http\Controllers\Api\CityController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/
Route::get('/city/{id}', [CityController::class, 'show'])->name('city');
Route::get('/cities', [CityController::class, 'index'])->name('cities');
