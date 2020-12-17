<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Sistema de encuestas">
    <meta name="author" content="Ing. Leonardo Maldonado">
    <title>Preview encuesta : {{$encuesta->titulo}}</title>

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
        @foreach ($preguntas as $pregunta)
        <div class="col-md-8 ">
            <div class=" mb-3">
                <label for="firstName"><strong>{{$conta_pregunta++}}. {{$pregunta->titulo}}</strong></label>
               
              
              
               @switch($pregunta->tipo_pregunta_id)
                   @case(1)
                   {!! Form::text('titulo', null, ['placeholder' => 'Escribe tu respuesta', 'class' => 'form-control']) !!}
                       @break
                   @case(2)
                    @php
                        $res_pregunta = App\Models\Respuesta::where('pregunta_id','=',$pregunta->id)->get();
                    @endphp
                   <div class="form-group">
                        @foreach ($res_pregunta as $item)

                        {!! Form::radio('tipo_encuesta_id',$item->id,false)!!}
                        {!!  Form::label('tipo_encuesta_id', $item->texto, null) !!} <br>

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
                            <label>{{ Form::checkbox('respuestas_casilla[]', $value->id, false, array('class' => 'name')) }}
                            {{ $value->texto }}</label>
                        <br/>
                        @endforeach
                    </div>
                    @break
                   @default
                       
               @endswitch

                <div class="invalid-feedback">
                  Valid first name is required.
                </div>
              </div>
          </div>
            
        @endforeach
        

      </div>
      


 </div>


{{--     
<li>

    <h3>CSS Stands for...</h3>
    
    <div>
        <input type="radio" name="question-1-answers" id="question-1-answers-A" value="A" />
        <label for="question-1-answers-A">A) Computer Styled Sections </label>
    </div>
    
    <div>
        <input type="radio" name="question-1-answers" id="question-1-answers-B" value="B" />
        <label for="question-1-answers-B">B) Cascading Style Sheets</label>
    </div>
    
    <div>
        <input type="radio" name="question-1-answers" id="question-1-answers-C" value="C" />
        <label for="question-1-answers-C">C) Crazy Solid Shapes</label>
    </div>
    
    <div>
        <input type="radio" name="question-1-answers" id="question-1-answers-D" value="D" />
        <label for="question-1-answers-D">D) None of the above</label>
    </div>

</li> --}}
    

 <!-- Bootstrap core JavaScript-->
 <script src="{{asset('vendor/jquery/jquery.min.js')}}"></script>
 <script src="{{asset('vendor/bootstrap/js/bootstrap.bundle.min.js')}}"></script>

 <!-- Core plugin JavaScript-->
 <script src="{{asset('vendor/jquery-easing/jquery.easing.min.js')}}"></script>

 <!-- Custom scripts for all pages-->
 <script src="{{asset('js/sb-admin-2.min.js')}}"></script>
</body>
</html>


