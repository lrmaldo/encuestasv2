@php
    $encuesta = App\Models\encuesta::find($id_encuesta);
    $preguntas = App\Models\Pregunta::where('encuesta_id',$id_encuesta)->get();
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
                /* variables aux para la graficas */
                $total_respuestas=0;
                $array_nombre_respuestas =[];
                $array_total_respuestas =[];
                $array_porcentaje =[];
            @endphp
           <div class="form-group">
                @foreach ($res_pregunta as $item)
                @php
                   $consulta_r = App\Models\encuesta_usuario::where('pregunta_id',$pregunta->id)
                                 ->where('respuesta_id',$item->id)->count();
                    /* guardar en los array y en el acumulador */
                    array_push($array_nombre_respuestas,$item->texto);
                    array_push($array_total_respuestas,$consulta_r);
                                 /* suma de  todas las respuestas */
                    $total_respuestas += $consulta_r;


                @endphp


                  {!!  Form::label('tipo_encuesta_id', $item->texto, null) !!}  <strong> ({{$consulta_r}}) </strong>  <br>


                @endforeach
                {{-- etiqueta html grafica --}}
                <div class="col-lg-6">
                    <div class="card mb-4">
                        <div class="card-header">
                            <i class="fas fa-chart-bar mr-1"></i>

                        </div>
                        <div class="card-body"><canvas id="myBarChart-{{$pregunta->id}}" width="100%" height="50"></canvas></div>

                        {{-- script  grafica  --}}
                        <script>
                            // Set new default font family and font color to mimic Bootstrap's default styling
                            Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
                            Chart.defaults.global.defaultFontColor = '#292b2c';


                            // Bar Chart Example
                            var ctx = document.getElementById("myBarChart-{{$pregunta->id}}");
                            var myLineChart = new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: {!! json_encode($array_nombre_respuestas) !!},
                        datasets: [{
                        label: "Respuesta",
                        backgroundColor: "rgba(2,117,216,1)",
                        borderColor: "rgba(2,117,216,1)",
                        data: {!! json_encode($array_total_respuestas)!!},
                        }],
                    },
                    options: {
                        scales: {
                        xAxes: [{
                            time: {
                            unit: 'month'
                            },
                            gridLines: {
                            display: false
                            },
                            ticks: {
                            maxTicksLimit: 6
                            }
                        }],
                        yAxes: [{
                            ticks: {
                            min: 0,
                            max: {!! json_encode($total_respuestas) !!},
                            maxTicksLimit: 5
                            },
                            gridLines: {
                            display: true
                            }
                        }],
                        },
                        legend: {
                        display: false
                        }
                    }
                    });
                        </script>

                    </div>

                </div>
           </div>
               @break
            @case(3)

           {{-- lista en de respuestas 
            <ul class="list-group">
  <li class="list-group-item d-flex justify-content-between align-items-center">
    Cras justo odio
    <span class="badge badge-primary badge-pill">14</span>
  </li>
  <li class="list-group-item d-flex justify-content-between align-items-center">
    Dapibus ac facilisis in
    <span class="badge badge-primary badge-pill">2</span>
  </li>
  <li class="list-group-item d-flex justify-content-between align-items-center">
    Morbi leo risus
    <span class="badge badge-primary badge-pill">1</span>
  </li>
</ul
            --}}

            <div class="form-group">
                @php
                $res_pregunta = App\Models\Respuesta::where('pregunta_id','=',$pregunta->id)->get();
                $total_respuestas=0;
                $array_nombre_respuestas =[];
                $array_total_respuestas =[];
                @endphp
               
                <br/>
                @foreach($res_pregunta as $value)

                @php
                     array_push($array_nombre_respuestas,$value->texto);

                     $consulta_r = App\Models\encuesta_usuario::where('pregunta_id',$pregunta->id)
                                 ->where('respuesta_id',$value->id)->count();/* consulta de cantidad de respuestas de los encuestados */
                    /* array de las respuestas */
                    array_push($array_total_respuestas,$consulta_r);
                                 /* suma de  todas las respuestas */
                    $total_respuestas += $consulta_r;

                @endphp
                    <label>
                    {{ $value->texto }} <strong>({{$consulta_r}})</strong> </label>
                <br/>
                @endforeach
                {{-- grafica --}}
                <div class="col-lg-6">
                    <div class="card mb-4">
                        <div class="card-header">
                            <i class="fas fa-chart-bar mr-1"></i>

                        </div>
                        <div class="card-body"><canvas id="myBarChart-{{$pregunta->id}}" width="100%" height="50"></canvas></div>

                    </div>

                </div>

                {{-- script de la grafica  --}}
                <script>
                    // Set new default font family and font color to mimic Bootstrap's default styling
                    Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
                    Chart.defaults.global.defaultFontColor = '#292b2c';

                    /* obtener nombre de las respuestas */

                    //console.log(etiquetas_respuestas);
                    // Bar Chart Example
                    var ctx = document.getElementById("myBarChart-{{$pregunta->id}}");
                    var myLineChart = new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: {!! json_encode($array_nombre_respuestas) !!},
                        datasets: [{
                        label: "Respuesta",
                        backgroundColor: "rgba(2,117,216,1)",
                        borderColor: "rgba(2,117,216,1)",
                        data: {!! json_encode($array_total_respuestas)!!},
                        }],
                    },
                    options: {
                        scales: {
                        xAxes: [{
                            time: {
                            unit: 'month'
                            },
                            gridLines: {
                            display: false
                            },
                            ticks: {
                            maxTicksLimit: 6
                            }
                        }],
                        yAxes: [{
                            ticks: {
                            min: 0,
                            max: {!! json_encode($total_respuestas) !!},
                            maxTicksLimit: 5
                            },
                            gridLines: {
                            display: true
                            }
                        }],
                        },
                        legend: {
                        display: false
                        }
                    }
                    });
                </script>
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

{{-- {{$encuestados}} --}}

