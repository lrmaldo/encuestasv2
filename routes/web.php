<?php

use App\Http\Controllers\EncuestasController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\RoleController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\PreguntasController;
use App\Http\Controllers\RespuestasController;

//use App\Http\Livewire\Encuestas;


/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
   // return view('welcome');
   return redirect('register');
});

Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

Route::group(['middleware' => ['auth']], function() {
    Route::resource('roles', RoleController::class);
    Route::resource('users', UserController::class);
    Route::resource('preguntas', PreguntasController::class);
    Route::resource('encuestas',EncuestasController::class);
    Route::resource('respuestas',RespuestasController::class);

    Route::GET('encuesta_preview/{id}',[EncuestasController::class,'preview']);

    Route::POST('encuesta_tipo',[ EncuestasController::class,'encuesta_tipo']);
    Route::GET('datos',[EncuestasController::class,'datos_generales']);
    Route::POST('datos_store',[EncuestasController::class,'datos_store']);
});

Route::get('example', function () {
    return view('exam.index');
});
