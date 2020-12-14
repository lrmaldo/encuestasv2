<?php

namespace App\Http\Controllers;

use App\Models\encuesta;
use Illuminate\Http\Request;
use App\Models\Tipo_encuesta;
use App\Models\Tipo_pregunta;
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
        return view('encuestas.show',compact('encuesta','tipos_preguntas'));

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
    public function destroy($id)
    {
        //
    }
}
