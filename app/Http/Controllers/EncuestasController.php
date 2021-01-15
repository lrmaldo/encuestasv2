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
use App\Models\User;
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
        $encuesta = encuesta::where('tipo_encuesta_id',$tipo_encuesta_id)->where('status',1)->first();
        if($buscar_datos){
            if($encuesta){
                /* esta disponible */
                
                $contestado = encuesta_usuario::where('usuario_id',$id_user)->where('encuesta_id',$encuesta->id)->count();
                
                if($contestado>0){/* condicion si exite registros del usuario en la encuesta */
                    return view('encuestas.usuario.encuesta_contestado');
                }else{
                    $aux_tipo = $tipo_encuesta_id == 1?2:1;
                    $aux_e =encuesta::where('tipo_encuesta_id',$aux_tipo)->where('status',1)->first();
                    if($aux_e){/* recibir si el otro tipo de encuesta esta disponible */
                        $aux_contestado = encuesta_usuario::where('usuario_id',$id_user)->where('encuesta_id',$aux_e->id)->count();
                     #entonces si contestado es mayor a cero y aux_contesdado es igual a cero 
                        if($aux_contestado>0){
                            return  view('encuestas.usuario.encuesta_respondido');
                        }else{
                            return redirect()->route('encuesta', ['id_usuario' =>$id_user, 'id_encuesta'=>$encuesta->id ]);
                        }
                    }else{
                        /* cambiar*********** */
                        return redirect()->route('encuesta', ['id_usuario' =>$id_user, 'id_encuesta'=>$encuesta->id ]);
                    }
                }
                
            }else{
                /* encuesta del tipo no disponible */
                return view('encuestas.usuario.encuesta_no_disponible');
            }
        }else{
            return view('datos_generales.index',compact('tipo_encuesta_id'));

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
                            ->count();
        if($encuesta_usuario>0){
            return view('encuestas.usuario.encuesta_contestado');

        }else{
            $tipo_encuesta = $request->tipo_encuesta_id;
            /*  poner una encuesta  hacer un if para buscar que encuesta del tipo esta activo sino mandar mensaje que no hay encuesta  disponible */
            $encuesta = encuesta::where('id',$tipo_encuesta)->where('status','=',1)->first();
            if(!empty($encuesta)){
                //return $encuesta;
                return redirect()->route('encuesta'  , ['id_usuario' =>$id_user, 'id_encuesta'=>$request->tipo_encuesta_id ]);
            }else{
                return view('encuestas.usuario.encuestas_no_disponible');
            }

        }




    }
    public function encuesta_usuario($id_usuario, $id_encuesta){
        $encuesta = encuesta::find($id_encuesta);
        $usuario = User::find($id_usuario);
        $preguntas = Pregunta::where('encuesta_id', '=', $id_encuesta)->get();
        return view('encuestas.usuario.vista',compact('usuario','encuesta','preguntas'));
        //return $id_encuesta;
    }

    public function guardar_encuesta(Request $request){
        $id_encuesta = $request->encuesta_id;
        $id_user = Auth::user()->id;

        $encuesta = encuesta::find($id_encuesta);
        $preguntas = Pregunta::where('encuesta_id',$id_encuesta)->get();
        $respuestas =  Respuesta::where('encuesta_id', '=', $id_encuesta)->get();

        foreach($preguntas as $pregunta){

               if($request['respuesta_'.$id_encuesta.'_'.$pregunta->id.'_1']){
                   $usuario_encuesta = new encuesta_usuario();
                   $usuario_encuesta->encuesta_id = $id_encuesta;
                   $usuario_encuesta->pregunta_id = $pregunta->id;
                   $usuario_encuesta->tipo_pregunta = 1;
                   $usuario_encuesta->respuesta_id = null;
                   $usuario_encuesta->valor_respuesta = $request['respuesta_'.$id_encuesta.'_'.$pregunta->id.'_1'];
                   $usuario_encuesta->usuario_id = $id_user;
                   $usuario_encuesta->save();
               }else if($request['respuesta_'.$id_encuesta.'_'.$pregunta->id.'_2']){
                $usuario_encuesta = new encuesta_usuario();
                $usuario_encuesta->encuesta_id = $id_encuesta;
                $usuario_encuesta->pregunta_id = $pregunta->id;
                $usuario_encuesta->tipo_pregunta = 2;
                $usuario_encuesta->respuesta_id = $request['respuesta_'.$id_encuesta.'_'.$pregunta->id.'_2'];
                $usuario_encuesta->valor_respuesta = null;
                $usuario_encuesta->usuario_id = $id_user;
                $usuario_encuesta->save();
               }else if($request['respuestas_casilla_'.$id_encuesta.'_'.$pregunta->id.'_3']){
                /* convertir el array en string */
                //$array_respuesta = json_encode($request['respuestas_casilla_'.$id_encuesta.'_'.$pregunta->id.'_3']);
                $array_respuesta =  $request['respuestas_casilla_'.$id_encuesta.'_'.$pregunta->id.'_3'];


                /* interacion del array de las casillas y las guarda como un registro */
                foreach ($array_respuesta as $key => $value) {

                    $usuario_encuesta = new encuesta_usuario();
                    $usuario_encuesta->encuesta_id = $id_encuesta;
                    $usuario_encuesta->pregunta_id = $pregunta->id;
                    $usuario_encuesta->tipo_pregunta = 3;
                    $usuario_encuesta->respuesta_id = $value;
                    $usuario_encuesta->valor_respuesta = null ;
                    $usuario_encuesta->usuario_id = $id_user;
                    $usuario_encuesta->save();
                }

               }

        }

        return view('encuestas.usuario.finalizacion_encuesta');
    }
}
