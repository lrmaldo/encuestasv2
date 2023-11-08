<?php

namespace App\Http\Controllers;

use App\Models\Datos_generales;
use App\Models\encuesta;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        $user_encuestado = Auth::user()->hasRole('encuestado');
        if($user_encuestado){
            #return view('home');
            /* si ya contesto la encuesta no mostrar datos_generales.index */
            $user = Auth::user();
            $buscar_datos = Datos_generales::where('usuario_id', '=', $user->id)->first();
            if($buscar_datos){
                return view('encuestas.usuario.finalizacion_encuesta');
            }else{

                return view('datos_generales.index');
            }

        }else{
            return view('layouts.dashboard');
        }
    }
}
