<?php

namespace App\Http\Controllers;

use App\Http\Livewire\Encuestas;
use App\Models\encuesta;
use Illuminate\Http\Request;
use App\Models\Tipo_encuesta;
use App\Models\Tipo_pregunta;
use App\Models\Pregunta;
use App\Models\Respuesta;

class EncuestasController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = encuesta::all();
        return view('encuestas.index',compact('data'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $tipos_encuestas = Tipo_encuesta::all();
       return view('encuestas.create',compact('tipos_encuestas'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'titulo' => 'required',
            'descripcion' => 'required',
            'tipo_encuesta_id'=>'required',
        ]);

        $input = $request->all();


        $user = encuesta::create($input);


        return redirect()->route('encuestas.index')
                        ->with('success','Encuesta creado correctamente');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {

        $encuesta = encuesta::find($id);
        $tipos_preguntas = Tipo_pregunta::all();
        $preguntas = Pregunta::where('encuesta_id','=',$id)->get();
        return view('encuestas.show',compact('encuesta','tipos_preguntas','preguntas'));

    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
       $encuesta = encuesta::find($id);
       $tipos_encuestas = Tipo_encuesta::all();
       return view('encuestas.edit',compact('encuesta','tipos_encuestas'));
       

        
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
        $this->validate($request, [
            'titulo' => 'required',
            'descripcion' => 'required',
            'tipo_encuesta_id'=>'required',
        ]);
        $input = $request->all();
        $encuesta = encuesta::find($id);
        $encuesta->update($input);
        return redirect()->route('encuestas.index')
        ->with('success','Encuesta actualizada correctamente');

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        encuesta::destroy($id);
        return redirect()->route('encuestas.index')
        ->with('success','Encuesta Eliminada correctamente correctamente');
    }


    /* preview */


    public  function preview($id){

        $encuesta = encuesta::find($id);
        $preguntas = Pregunta::where('encuesta_id','=',$id)->get();
        $respuestas = Respuesta::where('encuesta_id','=',$id)->get();

        return view('encuestas.preview',compact('encuesta','preguntas','respuestas'));
        
    }
}
