<?php

namespace App\Http\Controllers;

use App\Http\Livewire\Encuestas;
use App\Models\Datos_generales;
use App\Models\encuesta;
use Illuminate\Http\Request;
use App\Models\Tipo_encuesta;
use App\Models\Tipo_pregunta;
use App\Models\Pregunta;
use App\Models\Respuesta;
use App\Models\encuesta_usuario;
use Illuminate\Support\Facades\Auth;

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
        return view('encuestas.index', compact('data'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $tipos_encuestas = Tipo_encuesta::all();
        return view('encuestas.create', compact('tipos_encuestas'));
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
            'tipo_encuesta_id' => 'required',
        ]);

        $status = $request->status;
        $input = $request->all();
        if(!empty($status)){
            encuesta::where('tipo_encuesta_id',$request->tipo_encuesta_id)
            ->update(['status'=>0]);

            encuesta::create($input);
        }else{
            $encuesta = encuesta::create($input);

        }




        return redirect()->route('encuestas.index')
            ->with('success', 'Encuesta creado correctamente');
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
        $preguntas = Pregunta::where('encuesta_id', '=', $id)->get();
        return view('encuestas.show', compact('encuesta', 'tipos_preguntas', 'preguntas'));
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
        return view('encuestas.edit', compact('encuesta', 'tipos_encuestas'));
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
            'tipo_encuesta_id' => 'required',
        ]);
        $status = $request->status;
        $input = $request->all();
        if(!empty($status)){
            encuesta::where('tipo_encuesta_id',$request->tipo_encuesta_id)
            ->update(['status'=>0]);

            $encuesta = encuesta::find($id);
             $encuesta->update($input);
            }else{
                $encuesta = encuesta::find($id);
                $encuesta->update($input);
                $encuesta->update(['status'=>0]);

        }


        return redirect()->route('encuestas.index')
            ->with('success', 'Encuesta actualizada correctamente');
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
            ->with('success', 'Encuesta Eliminada correctamente correctamente');
    }


    /* preview */


    public  function preview($id)
    {

        $encuesta = encuesta::find($id);
        $preguntas = Pregunta::where('encuesta_id', '=', $id)->get();
        $respuestas = Respuesta::where('encuesta_id', '=', $id)->get();

        return view('encuestas.preview', compact('encuesta', 'preguntas', 'respuestas'));
    }


    /* tipo encuesta */

    public function encuesta_tipo(Request $request)
    {

        $id_user = Auth::user()->id;
        $buscar_datos = Datos_generales::where('usuario_id', '=', $id_user)->first();
        $tipo_encuesta_id = $request->tipo_encuesta_id;
        if (!is_null($buscar_datos)) {

            //return 'encuesta';
            //return redirect('encuesta_preview/1');
            /* buscar si el usuario ya contesto la encuesta */
                $encuesta_usuario = encuesta_usuario::where('usuario_id','=',Auth::user()->id)
                ->get();
                if(empty($encuesta_usuario)){
                return 'ya ha contestado la encuesta';

                }else{
                    $tipo_encuesta = $request->tipo_encuesta_id;
                    /*  poner una encuesta  hacer un if para buscar que encuesta del tipo esta activo sino mandar mensaje que no hay encuesta  disponible */
                    $encuesta = encuesta::where('tipo_encuesta_id','=',$tipo_encuesta)->where('status','=',1)->first();
                    if(!empty($encuesta)){
                        return $encuesta;
                        //return redirect()->route('encuesta', ['id_usuario' =>$id_user, 'id_encuesta'=>$request->tipo_encuesta_id ]);
                    }else{
                        //return $encuesta;
                        return 'encuesta no disponible';
                    }
                }

        } else {

           return view('datos_generales.index',compact('tipo_encuesta_id'));
            //return 'formula de datos';
            //$request->all();
        }
    }
    public function datos_generales(){
        return view('datos_generales.index');
    }

    public function datos_store(Request $request){

        $id_user = Auth::user()->id;

        $datos = new Datos_generales();
        $datos->genero = $request->genero;
        $datos->edad = $request->edad;
        $datos->domicilio = $request->domicilio;
        $datos->ciudad = $request->ciudad;
        $datos->cp = $request->cp;
        $datos->telefono = $request->telefono;
        $datos->usuario_id = Auth::user()->id;
        $datos->save();
        /* buscar si el usuario ya contesto la encuesta */
        $encuesta_usuario = encuesta_usuario::where('usuario_id','=',Auth::user()->id)
                            ->get();
        if(empty($encuesta_usuario)){
            return 'ya ha contestado la encuesta';

        }else{
            $tipo_encuesta = $request->tipo_encuesta_id;
            /*  poner una encuesta  hacer un if para buscar que encuesta del tipo esta activo sino mandar mensaje que no hay encuesta  disponible */
            $encuesta = encuesta::where('id',$tipo_encuesta)->where('status','=',1)->first();
            if(!empty($encuesta)){
                //return $encuesta;
                return redirect()->route('encuesta'  , ['id_usuario' =>$id_user, 'id_encuesta'=>$request->tipo_encuesta_id ]);
            }else{
                return 'encuesta no disponible';
            }

        }




    }
    public function encuesta_usuario($id_usuario, $id_encuesta){
        return $id_encuesta;
    }
}
