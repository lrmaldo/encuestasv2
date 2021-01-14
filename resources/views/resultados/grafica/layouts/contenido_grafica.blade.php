@php
    $encuesta = App\Models\encuesta::find($id_encuesta);
    $preguntas = App\Models\pregunta::where('encuesta_id',$id_encuesta)->get();
@endphp

<h2>{{$encuesta->titulo}}</h2>
<p class="lead">{{$encuesta->descripcion}}</p>
</div>
<div class="justify-content-center">
@php
    $conta_pregunta=1;
@endphp
@foreach ($preguntas as $pregunta)
<div class="col-md-12 ">
    <div class=" mb-4">
        <label for="pregunta-{{$pregunta->id}}"><strong>{{$conta_pregunta++}}. {{$pregunta->titulo}}</strong></label>
       
      
      
       @switch($pregunta->tipo_pregunta_id)
           @case(1)
                @foreach ($encuestados as $item)
                    @if ($item->pregunta_id== $pregunta->id && $item->tipo_pregunta==1)
                        <li>{{$item->valor_respuesta}} ({{App\Models\User::find($item->usuario_id)->name}})</li>
                        
                    @endif
                @endforeach
           
               @break
           @case(2)
            @php
                $res_pregunta = App\Models\Respuesta::where('pregunta_id','=',$pregunta->id)->get();
            @endphp
           <div class="form-group">
                @foreach ($res_pregunta as $item)
                @php
                   $consulta_r = App\Models\encuesta_usuario::where('pregunta_id',$pregunta->id)
                                 ->where('respuesta_id',$item->id)->count(); 
                @endphp
                
             
                  {!!  Form::label('tipo_encuesta_id', $item->texto, null) !!}  <strong> ({{$consulta_r}}) </strong>  <br>
               

                @endforeach
           </div>
               @break
            @case(3)
            
            
            
            <div class="form-group">
                @php
                $res_pregunta = App\Models\Respuesta::where('pregunta_id','=',$pregunta->id)->get();
                /* obtener el json de  las respuestas de casillas */
                $json_res_casillas = App\Models\encuesta_usuario::where('pregunta_id',$pregunta->id)
                             ->where('tipo_pregunta',3)->get();

                             foreach ($json_res_casillas as $key => $value) {
                                  $json = json_decode($value->valor_respuesta);
                                  foreach ($res_pregunta as $y => $v) {
                                      if($v->id==$json){
                                        echo "1sasa";
                                      }
                                  }
                                  //var_dump($json);
                             }
                
            @endphp
           {{--  {{$json_res_casillas}} --}}
                <br/>
                @foreach($res_pregunta as $value)
                  
                    <label>
                    {{ $value->texto }} </label>
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
    
@endforeach

{{$encuestados}}

