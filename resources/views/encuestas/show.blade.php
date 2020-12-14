@extends('layouts.app')


@section('content')

<div class="row">
    <div class="col-lg-12 margin-tb">
        <div class="pull-left">
        <h2 class="h3 mb-2 text-gray-800">Encuestas : {{$encuesta->titulo}}</h2>

            <ol class="breadcrumb mb-4">
                <li class="breadcrumb-item"><a href="{{ route('home') }}">Dashboard</a></li>
                <li class="breadcrumb-item"><a href="{{ route('encuestas.index') }}">Encuestas</a></li>
                <li class="breadcrumb-item active">Encuesta id: {{$encuesta->id}}</li>
            </ol>

        </div>
        <div class="pull-right">
            <a class="btn btn-success text-white" data-toggle="modal" data-target="#ModalCreate"> Crear nueva pregunta</a>
            {{-- <a  class="btn btn-primary text-white"> <i class="fas fa-cube  text-white"></i> Crear Producto</a> --}}
            @include('preguntas.modal.create')
        </div>
    </div>
</div>


@if ($message = Session::get('success'))
    <div class="alert alert-success">
        <p>{{ $message }}</p>
    </div>
@endif


<div class="card shadow mb-4">
    <div class="card-header py-3">
      <h6 class="m-0 font-weight-bold text-primary">Tabla de preguntas</h6>
    </div>

    <div class="card-body">
        <div class="table-responsive">

           {{--  {!! $data->render() !!} --}}


        </div>
    </div>


</div>

@endsection
