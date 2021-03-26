<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Sistema de encuestas">
    <meta name="author" content="Ing. Leonardo Maldonado">
    <title>Encuesta : {{$encuesta->titulo}}</title>

    <!-- Fonts -->
    <link rel="dns-prefetch" href="//fonts.gstatic.com">
    
    <!-- Custom fonts for this template-->
  <link href="{{asset('vendor/fontawesome-free/css/all.min.css')}}" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<!-- Custom styles for this template-->
<link href="{{asset('css/sb-admin-2.min.css')}}" rel="stylesheet">
<script src="{{asset('vendor/jquery/jquery.min.js')}}"></script>
@livewireStyles
</head>
<body>
 <div class="container">
    <div class="row justify-content-between  py-4">
        <div class="col-3 mt-1">
         <img src="{{asset('/img/Logo_TECNM-1024x438.png')}}" width="250px" alt="" class="img-responsive">
        </div>
        <div class="col-3 mt-1 text-center">
            
        </div>
        <div class="col-3 mt-1">
            <img src="{{asset('/img/logo_tec_tux.png')}}" width="100px" alt="" class="img-responsive ">
        </div>
      </div>
    <div class="py-5 text-center">
       
        <h2>{{$encuesta->titulo}}</h2>
        <p class="lead">{{$encuesta->descripcion}}</p>
        <div class="col-md-4 offset-md-4 ">
            @php
                $usuario = App\Models\User::where('id',$id_encuestado)->first();
                $datos_encuestado = App\Models\Datos_generales::where('usuario_id',$id_encuestado)->first();
            @endphp
            <h3>Datos del encuestado</h3>
            <ul class="list-group">
                <li class="list-group-item"><strong>Nombre:</strong> {{$usuario->name}}</li>
                <li class="list-group-item"><strong>Correo:</strong> {{$usuario->email}}</li>
                <li class="list-group-item"><strong>Genero:</strong> {{$datos_encuestado->genero}}</li>
                <li class="list-group-item"><strong>Edad:</strong> {{$datos_encuestado->edad}}</li>
                <li class="list-group-item"><strong>Ciudad:</strong> {{$datos_encuestado->ciudad}}</li>
                <li class="list-group-item"><strong>Domicilio:</strong> {{$datos_encuestado->domicilio}}</li>
                <li class="list-group-item"><strong>Código Postal:</strong> {{$datos_encuestado->cp}}</li>
                <li class="list-group-item"><strong>Teléfono:</strong> {{$datos_encuestado->telefono}}</li>
              </ul>
        </div>
      </div>
      <div class="justify-content-center">
        @php
            $conta_pregunta=1;
        @endphp
        {{-- poner aqui la etiqueta form --}}
        {!! Form::open(['url' => 'encuesta/post', 'method' => 'POST']) !!}
        @foreach ($preguntas as $pregunta)
        <div class="col-md-12 ">
            <div class=" mb-4">
                <label for="pregunta"><strong>{{$conta_pregunta++}}. {{$pregunta->titulo}}</strong></label>
               
              
              
               @switch($pregunta->tipo_pregunta_id)
                   @case(1)
                    @php
                       $res_text = App\Models\encuesta_usuario::where('encuesta_id',$encuesta->id)->where('pregunta_id',$pregunta->id)
                                                                ->where('usuario_id',$id_encuestado)->first();
                    @endphp
                      @if (isset($res_text->valor_respuesta))
                      
                      {!! Form::text('respuesta_'.$encuesta->id.'_'.$pregunta->id.'_1', $res_text->valor_respuesta?$res_text->valor_respuesta:'no hay respuesta', ['placeholder' => 'Escribe tu respuesta', 'class' => 'form-control','required'=>'required', 'disabled'=>'disabled']) !!}
                      @else
                          {{'no hay respuesta'}}
                      @endif
                       @break
                   @case(2)
                    @php
                       
                       $res_pregunta = App\Models\Respuesta::where('pregunta_id','=',$pregunta->id)->get();
                    @endphp
                   <div class="form-group">
                        @forelse ($res_pregunta as $item)
                        @php
                        $respuesta_usuario = App\Models\encuesta_usuario::where('encuesta_id',$encuesta->id)->where('pregunta_id',$pregunta->id)
                                                                 ->where('usuario_id',$id_encuestado)->first();
                     @endphp
                        @isset($respuesta_usuario->respuesta_id)
                            
                        {!! Form::radio('respuesta_'.$encuesta->id.'_'.$pregunta->id.'_2',$item->id,$respuesta_usuario->respuesta_id=$item->id?true:false,['required'=>'required','disabled'=>'disabled'])!!}
                        {!!  Form::label('respuesta_'.$encuesta->id .'_'.$pregunta->id.'_2', $item->texto, null) !!} <br>
                        @endisset 
                            
                      
                        @empty
                        <p>no hay respuesta</p>
                        @endforelse
                   </div>
                       @break
                    @case(3)
                    @php
                        $res_pregunta = App\Models\Respuesta::where('pregunta_id','=',$pregunta->id)->get();
                        @endphp
                       
                       <div class="form-group options-{{$pregunta->id}}">
                       
                        
                       @forelse($res_pregunta as $value)
                       @php
                       $respuesta_usuario = App\Models\encuesta_usuario::where('encuesta_id',$encuesta->id)->where('pregunta_id',$pregunta->id)
                                                                ->where('usuario_id',$id_encuestado)->first();
                        @endphp
                        @isset($respuesta_usuario->respuesta_id)
                        {{ Form::checkbox('respuestas_casilla_'.$encuesta->id.'_'.$pregunta->id.'_3'.'[]', $value->id, $respuesta_usuario->respuesta_id=$value->id?true:false, array('class' => 'name', 'required' =>'required', 'disabled'=>'disabled')) }}
                             {{ $value->texto }}
                             <br/>
                            
                        @endisset
                         
                        @empty
                            
                        <p>No hay respuesta</p>
                        @endforelse
                        </div>
                        {{-- validacion de required jquery --}}
                        <script>
                            $(function(){
                                var requiredCheckboxes = $('.options-{{$pregunta->id}} :checkbox[required]');
                                requiredCheckboxes.change(function(){
                                    if(requiredCheckboxes.is(':checked')) {
                                        requiredCheckboxes.removeAttr('required');
                                    } else {
                                        requiredCheckboxes.attr('required', 'required');
                                    }
                                });
                            });
                        </script>
                    @break
                   @default
                       
               @endswitch

               
              </div>
          </div>
          {!! Form::text('encuesta_id', $encuesta->id, ['class' => 'form-control', ' type' => 'hidden']) !!}
        @endforeach
        <div class="col-xs-12 col-sm-12 col-md-12 text-center ">
           {{--  <button type="submit" class="btn btn-primary">Guardar</button> --}}
        </div>
      
      </div>
      
{{-- <script>
    /* para no retroceder */
    window.history.forward();
</script> --}}

 </div>

    

 <!-- Bootstrap core JavaScript-->
 
 <script src="{{asset('vendor/bootstrap/js/bootstrap.bundle.min.js')}}"></script>

 <!-- Core plugin JavaScript-->
 <script src="{{asset('vendor/jquery-easing/jquery.easing.min.js')}}"></script>

 <!-- Custom scripts for all pages-->
 <script src="{{asset('js/sb-admin-2.min.js')}}"></script>
</body>
</html>


