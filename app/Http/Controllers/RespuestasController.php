<?php

namespace App\Http\Controllers;

use App\Models\Pregunta;
use App\Models\Respuesta;
use Illuminate\Http\Request;

class RespuestasController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
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
        $input = $request->all();

        Respuesta::create($input);
        return redirect()->route('respuestas.show',$request->pregunta_id)
                        ->with('success','Respuesta creada correctamente');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
       $pregunta = Pregunta::find($id);
       $respuestas = Respuesta::where('pregunta_id','=',$id)->get();
       return view('respuestas.show',compact('respuestas','pregunta'));
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
        $respuesta = Respuesta::find($id);
        $input = $request->all();
        $pregunta_id = $respuesta->pregunta_id;
        $respuesta->update($input);
        
        return redirect()->route('respuestas.show',$pregunta_id)
                        ->with('success','Respuesta actualizado correctamente');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        
        $respuesta = Respuesta::find($id);
        $pregunta_id = $respuesta->pregunta_id;
        $respuesta->delete();
        
        return redirect()->route('respuestas.show',$pregunta_id)
                        ->with('success','Respuesta eliminada correctamente');
    }
}
