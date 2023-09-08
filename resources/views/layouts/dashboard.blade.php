@extends('layouts.app')

@section('content')
{{--  logica de php --}}

@php
    $total_encuestas = App\Models\encuesta::all()->count();
    $total_de_encuestados = App\Models\User::role('encuestado')->get();


    /* variables de la grafica de genero */
  $Masculino = App\Models\Datos_generales::where('genero','like','%Masculino%')->count();
  $Femenino = App\Models\Datos_generales::where('genero','like','%Femenino%')->count();

  /* edades de 18 a 25 */
  $entre18 = App\Models\Datos_generales::whereBetween('edad',[18 , 25])->count();
  /* edades de 26 a 30 */
  $entre26a30 = App\Models\Datos_generales::whereBetween('edad',[26 , 30])->count();
  /* edades de 31 a 35  */
  $entre31a35 = App\Models\Datos_generales::whereBetween('edad',[31 , 35])->count();
  /* más de 35 años */
  $masde36 = App\Models\Datos_generales::where('edad','>',36)->count();


        $total_edades=$entre18+$entre26a30+$entre31a35+$masde36;
        $array_edades =array($entre18,$entre26a30,$entre31a35,$masde36);
        $array_genero =array($Masculino,$Femenino);
@endphp

<div class="container">
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>

      </div>
<!-- Content Row -->
<div class="row">

    <!-- Earnings (Monthly) Card Example -->
    <div class="col-xl-3 col-md-6 mb-4">
      <div class="card border-left-primary shadow h-100 py-2">
        <div class="card-body">
          <div class="row no-gutters align-items-center">
            <div class="col mr-2">
              <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Total de encuestas</div>
              <div class="h5 mb-0 font-weight-bold text-gray-800">{{$total_encuestas}}</div>
            </div>
            <div class="col-auto">
              <i class="fas fa-file-alt fa-2x text-gray-300"></i>

            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Earnings (Monthly) Card Example -->
    <div class="col-xl-3 col-md-6 mb-4">
      <div class="card border-left-success shadow h-100 py-2">
        <div class="card-body">
          <div class="row no-gutters align-items-center">
            <div class="col mr-2">
              <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Total de encuestados</div>
              <div class="h5 mb-0 font-weight-bold text-gray-800">{{$total_de_encuestados->count()}}</div>
            </div>
            <div class="col-auto">
              <i class="fas fa-fw fa-users fa-2x text-gray-300"></i>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Earnings (Monthly) Card Example -->
    <div class="col-xl-3 col-md-6 mb-4">
      <div class="card border-left-info shadow h-100 py-2">
        <div class="card-body">
          <div class="row no-gutters align-items-center">
            <div class="col mr-2">
              <div class="text-xs font-weight-bold text-info text-uppercase mb-1"> <a class="text-info text-uppercase mb-1" href="{{ route('resultados') }}">Ir a Resultados</a> </div>
              <div class="row no-gutters align-items-center">

              </div>
            </div>
            <div class="col-auto">
              <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Pending Requests Card Example -->
    <div class="col-xl-3 col-md-6 mb-4">
      <div class="card border-left-warning shadow h-100 py-2">
        <div class="card-body">
          <div class="row no-gutters align-items-center">
            <div class="col mr-2">
              <div ><a class="text-xs font-weight-bold text-warning text-uppercase mb-1" href="{{ route('encuestas.index') }}">Ir a encuestas</a></div>

            </div>
            <div class="col-auto">
              <i class="fas fa-file-alt fa-2x text-gray-300"></i>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>


  {{-- grafica  de encuestados  --}}

  <!-- Content Row -->

  <div class="row">

    <!-- Area Chart -->
    <div class="col-xl-6 col-lg-7">
      <div class="card shadow mb-4">
        <!-- Card Header - Dropdown -->
        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
          <h6 class="m-0 font-weight-bold text-primary">Gráfica de edades</h6>

        </div>
        <!-- Card Body -->
        <div class="card-body">
          <div class="chart-area">
            <canvas id="myBarChart"></canvas>
          </div>
        </div>
      </div>
    </div>

    <!-- Pie Chart -->
    <div class="col-xl-6 col-lg-5">
      <div class="card shadow mb-4">
        <!-- Card Header - Dropdown -->
        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">

          <h6 class="m-0 font-weight-bold text-primary">   <i class="fas fa-chart-pie mr-1"></i>Gráfica de genero</h6>

        </div>
        <!-- Card Body -->
        <div class="card-body">
          <div class="chart-pie ">
            <canvas id="migrafica_generos"></canvas>
          </div>

        </div>
      </div>
    </div>
  </div>


  <script>

 Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
                            Chart.defaults.global.defaultFontColor = '#292b2c';


                            // Bar Chart Example
                            var ctx = document.getElementById("myBarChart");
                            var myLineChart = new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: ['18 a 25 años','26 a 30 años','31 a 35 años','más de 36 años'],
                        datasets: [{
                        label: "Encuestados",
                        backgroundColor: "rgba(2,117,216,1)",
                        borderColor: "rgba(2,117,216,1)",
                        data: {!! json_encode($array_edades)!!},
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
                            max: {!! json_encode($total_edades) !!},
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


                    /* grafica de genero */

                   // Set new default font family and font color to mimic Bootstrap's default styling
                    Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
                    Chart.defaults.global.defaultFontColor = '#292b2c';

                    // Pie Chart Example
                    var ctx = document.getElementById("migrafica_generos");
                    var myPieChart = new Chart(ctx, {
                      type: 'pie',
                      data: {
                        labels: ["Hombres", "Mujeres"],
                        datasets: [{
                          data: {!! json_encode($array_genero) !!},
                          backgroundColor: ['#007bff', '#dc3545'],
                        }],
                      },
                    });
  </script>


{{-- encuestados --}}

<div class="card-body">
  <div class="table-responsive">
      <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
          <thead>
              <th>No</th>
              <th>Nombre</th>
              <th>Edad</th>
               <th>Domicilio</th>
              <th>Ciudad</th>
              <th>CP</th>
              <th>Teléfono</th>
              <th>Célular</th>
              <th >Fecha de registro</th>
          </thead>
          <tbody>
            @php
                $i=0;
            @endphp
              @foreach ($total_de_encuestados as $key => $user)
              <tr>
                  <td>{{ ++$i }}</td>
                  <td>{{ $user->name }}</td>
                  <td>{{ isset($user->Datos->edad)?$user->Datos->edad:'sin datos' }}</td>
                  <td>{{ isset($user->Datos->domicilio)?$user->Datos->domicilio:'sin datos'}}</td>
                  <td>{{ isset($user->Datos->ciudad)?$user->Datos->ciudad:'sin datos'}}</td>
                  <td>{{ isset($user->Datos->cp)?$user->Datos->cp:'sin datos'}}</td>
                  <td>{{ isset($user->Datos->telefono)?$user->Datos->telefono:'sin datos'}}</td>
                  <td>{{ isset($user->Datos->celular)?$user->Datos->celular:'sin datos'}}</td>
                  <td>{{ isset($user->Datos->created_at)?date_format($user->Datos->created_at,'d/m/Y h:i:s A'):'sin datos' }}</td>
                  {{-- <td>
                      @if (!empty($user->getRoleNames()))
                          @foreach ($user->getRoleNames() as $v)
                              <label class="badge badge-success">{{ $v }}</label>
                          @endforeach
                      @endif
                  </td> --}}

                     {{--  <a class="btn btn-info" href="{{ route('users.show', $user->id) }}">Ver</a>
                      <a class="btn btn-primary" href="{{ route('users.edit', $user->id) }}">Editar</a>
                      {!! Form::open(['method' => 'DELETE', 'route' => ['users.destroy', $user->id], 'style' =>
                      'display:inline']) !!}
                      {!! Form::submit('Eliminar', ['class' => 'btn btn-danger']) !!}
                      {!! Form::close() !!} --}}

              </tr>
          @endforeach
          </tbody>
      </table>



  </div>
</div>


</div>
@endsection
