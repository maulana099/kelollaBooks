<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AkunController;
use App\Http\Controllers\CategoriController;
use App\Http\Controllers\RackController;
use App\Http\Controllers\BooksController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Route::middleware('auth:api')->get('/user', function (Request $request) {
// 	return $request->user();
// });

Route::post('register', [AkunController::class, 'register']);
Route::post('login', [AkunController::class, 'login'])->name('login');
Route::post('forgotPassword', [AkunController::class, 'forgotPassword']);
Route::post('resetPass', [AkunController::class, 'resetPass']);


Route::middleware('auth:api')->group(function () {
//books
	Route::resource('books', BooksController::class);
//rack
	Route::resource('rack', RackController::class);
//categori
	Route::resource('categori', CategoriController::class);

});
