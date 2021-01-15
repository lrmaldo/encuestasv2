<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\encuesta;
use App\Models\encuesta_usuario;
use App\Models\Pregunta;
use \App\Models\User;

class ResultadosController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = encuesta::all();
        return view('resultados.index', compact('data'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
       // $encuestados = encuesta_usuario::with('usuario')->where('encuesta_id',$id)->get();
        //$encuestados = encuesta_usuario::where('encuesta_id',$id)->get();
        $encuestados = User::all();
        $id_encuesta = $id;
        return view('resultados.encuestados.index',compact('encuestados','id_encuesta'));
        //return $encuestados;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function grafica($id)
    {
        $encuestados = encuesta_usuario::where('encuesta_id',$id)->get();
        $id_encuesta = $id;
        return view('resultados.grafica.index',compact('encuestados','id_encuesta'));

    }


    /* funciones de encuestado */

    public function encuestado($id,$id_encuesta){
        $id_encuestado =$id; 
        $encuesta = encuesta::find($id_encuesta);
        $preguntas = Pregunta::where('encuesta_id',$id_encuesta)->get();
        return view('resultados.encuestados.vista_encuestado',compact('id_encuestado','encuesta','preguntas'));

    }

    public function eliminar_encuestado($id_usuario, $id_encuesta){
        encuesta_usuario::where('encuesta_id',$id_encuesta)->where('usuario_id',$id_usuario)->delete();
        return redirect()->back();
    }
}
