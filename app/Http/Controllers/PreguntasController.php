<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Pregunta;
use  \App\Models\Tipo_pregunta;
class PreguntasController extends Controller
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

        Pregunta::create($input);
        return redirect()->route('encuestas.show',$request->encuesta_id)
                        ->with('success','Pregunta creada correctamente');

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $pregunta = Pregunta::find($id);
        $tipos_preguntas = Tipo_pregunta::all();
        return view('preguntas.edit',compact('pregunta','tipos_preguntas'));
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
            'tipo_pregunta_id' => 'required',

        ]);
        $input = $request->all();
        $pregunta = Pregunta::find($id);
        $pregunta->update($input);
        return redirect()->route('encuestas.show',$pregunta->encuesta_id)
            ->with('success','Pregunta actualizada');

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $pregunta = Pregunta::find($id);
       $encuesta_id = $pregunta->encuesta_id;
       /* eliminar pregunta */
       $pregunta->delete();
       return redirect()->route('encuestas.show',$encuesta_id)
       ->with('success','Pregunta eliminada correctamente');
    }
}
