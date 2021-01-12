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
                <label for="firstName"><strong>{{$conta_pregunta++}}. {{$pregunta->titulo}}</strong></label>
               
              
              
               @switch($pregunta->tipo_pregunta_id)
                   @case(1)
                   {!! Form::text('respuesta_'.$encuesta->id.'_'.$pregunta->id, null, ['placeholder' => 'Escribe tu respuesta', 'class' => 'form-control']) !!}
                       @break
                   @case(2)
                    @php
                        $res_pregunta = App\Models\Respuesta::where('pregunta_id','=',$pregunta->id)->get();
                    @endphp
                   <div class="form-group">
                        @foreach ($res_pregunta as $item)

                        {!! Form::radio('respuesta_'.$encuesta->id.'_'.$pregunta->id,$item->id,false)!!}
                        {!!  Form::label('respuesta_'.$encuesta->id .'_'.$pregunta->id, $item->texto, null) !!} <br>

                        @endforeach
                   </div>
                       @break
                    @case(3)
                    <div class="form-group">
                        @php
                        $res_pregunta = App\Models\Respuesta::where('pregunta_id','=',$pregunta->id)->get();
                    @endphp
                        <br/>
                        @foreach($res_pregunta as $value)
                            <label>{{ Form::checkbox('respuestas_casilla_'.$encuesta->id.'_'.$pregunta->id.'[]', $value->id, false, array('class' => 'name')) }}
                            {{ $value->texto }}</label>
                        <br/>
                        @endforeach
                    </div>
                    @break
                   @default
                       
               @endswitch

                <div class="invalid-feedback">
                  Se requiere este campo.
                </div>
              </div>
          </div>
          {!! Form::text('encuesta_id', $encuesta->id, ['class' => 'form-control', ' type' => 'hidden']) !!}
        @endforeach
        <div class="col-xs-12 col-sm-12 col-md-12 text-center ">
            <button type="submit" class="btn btn-primary">Guardar</button>
        </div>
        {!! Form::close() !!}
      </div>
      


 </div>

    

 <!-- Bootstrap core JavaScript-->
 <script src="{{asset('vendor/jquery/jquery.min.js')}}"></script>
 <script src="{{asset('vendor/bootstrap/js/bootstrap.bundle.min.js')}}"></script>

 <!-- Core plugin JavaScript-->
 <script src="{{asset('vendor/jquery-easing/jquery.easing.min.js')}}"></script>

 <!-- Custom scripts for all pages-->
 <script src="{{asset('js/sb-admin-2.min.js')}}"></script>
</body>
</html>


