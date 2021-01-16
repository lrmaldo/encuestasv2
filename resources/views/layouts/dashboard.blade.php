@extends('layouts.app')

@section('content')
{{--  logica de php --}}

@php
    $total_encuestas = App\Models\encuesta::all()->count();
    $total_de_encuestados = App\Models\User::role('encuestado')->get();

    /* variables de la grafica de genero */
  $Masculino = App\Models\Datos_generales::where('genero','like','%Masculino%')->count(); 
  $Femenino = App\Models\Datos_generales::where('genero','like','%Femenino%')->count(); 

  $total_egresados = 0;
  $total_empleados =0;
$encuestas = App\Models\encuesta::all();
  $dato = DB::table('users')
        ->join('encuesta_usuarios','users.id','encuesta_usuarios.usuario_id')
        ->join('encuestas','encuestas.id','encuesta_usuarios.encuesta_id')
        ->get();

        foreach ($dato as $key => $value) {
            if($value->tipo_encuesta_id == 1){

                $total_egresados++;
            }elseif ($value->tipo_encuesta_id == 2) {
                $total_empleados++;
            }

        }
        $total_tipo=$total_egresados +$total_empleados;
        $array_tipos =array($total_egresados,$total_empleados);
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
              <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">Pending Requests</div>
              <div class="h5 mb-0 font-weight-bold text-gray-800">18</div>
            </div>
            <div class="col-auto">
              <i class="fas fa-comments fa-2x text-gray-300"></i>
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
    <div class="col-xl-8 col-lg-7">
      <div class="card shadow mb-4">
        <!-- Card Header - Dropdown -->
        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
          <h6 class="m-0 font-weight-bold text-primary">Gráfica de egresados y empleadores</h6>
          
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
    <div class="col-xl-4 col-lg-5">
      <div class="card shadow mb-4">
        <!-- Card Header - Dropdown -->
        <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
          <h6 class="m-0 font-weight-bold text-primary">Gráfica de genero</h6>
          
        </div>
        <!-- Card Body -->
        <div class="card-body">
          <div class="chart-pie pt-4 pb-2">
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
                        labels: ['Egresados','Empleadores'],
                        datasets: [{
                        label: "Encuestados",
                        backgroundColor: "rgba(2,117,216,1)",
                        borderColor: "rgba(2,117,216,1)",
                        data: {!! json_encode($array_tipos)!!},
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
                            max: {!! json_encode($total_tipo) !!},
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
@endsection