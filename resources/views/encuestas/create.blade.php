@extends('layouts.app')


@section('content')

<div class="row">
    <div class="col-lg-12 margin-tb">
        <div class="pull-left">
            <h2 class="h3 mb-2 text-gray-800">Gestión de Encuestas</h2>

            <ol class="breadcrumb mb-4">
                <li class="breadcrumb-item"><a href="{{ route('home') }}">Dashboard</a></li>
                <li class="breadcrumb-item"><a href="{{ route('encuestas.index') }}">Encuestas</a></li>
                <li class="breadcrumb-item active">Crear encuestas</li>
            </ol>

        </div>
        <div class="pull-right">
            <a class="btn btn-info" href="{{ route('encuestas.index') }}"> Regresar</a>
        </div>
    </div>
</div>

<div class="">
    <div class="card shadow mb-2">
        <div class="card-header py-3">
          <h6 class="m-0 font-weight-bold text-primary">
              Encuesta
          </h6>
        </div>
        <div class="card-body">
            @if (count($errors) > 0)
        <div class="alert alert-danger">
            <strong>Error!</strong> Los siguientes campos son requeridos.<br><br>
            <ul>
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif

    {!! Form::open(['route' => 'encuestas.store', 'method' => 'POST']) !!}
   {{--  @csrf  --}}   
    <div class="col-xs-6 col-sm-6 col-md-6">
        <div class="form-group">
            <strong>Título:</strong>
            {!! Form::text('titulo', null, ['placeholder' => 'Título', 'class' => 'form-control']) !!}

        </div>
    </div>
    <div class="col-xs-6 col-sm-6 col-md-6">
        <div class="form-group">
            <strong>Descripción</strong>
            {!! Form::textarea('descripcion', null, ['placeholder' => 'Descripción', 'rows'=>5,'col'=>10, 'class' => 'form-control']) !!}
        </div>

    </div>
    <div class="col-xs-12 col-sm-12 col-md-12 ">
        <button type="submit" class="btn btn-primary">Guardar</button>
    </div>
    
    {!! Form::close() !!}
        </div>
      </div>
</div>

@endsection