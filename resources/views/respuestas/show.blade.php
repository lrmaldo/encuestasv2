@extends('layouts.app')


@section('content')

<div class="row">
    <div class="col-lg-12 margin-tb">
        <div class="pull-left">
        <h2 class="h3 mb-2 text-gray-800">Pregunta : {{$pregunta->titulo}}</h2>

            <ol class="breadcrumb mb-4">
                <li class="breadcrumb-item"><a href="{{ route('home') }}">Dashboard</a></li>
                <li class="breadcrumb-item"><a href="{{ route('encuestas.index') }}">Encuestas</a></li>
               {{--  <li class="breadcrumb-item"><a href="{{ route('encuestas.show',$pregunta->id)}}">Preguntas</a></li> --}}
                <li class="breadcrumb-item active">pregunta id: {{$pregunta->id}}</li>
            </ol>

        </div>
        <div class="pull-right">
            <a class="btn btn-success text-white" data-toggle="modal" data-target="#ModalCreate"> Crear nueva respuesta</a>
            {{-- <a  class="btn btn-primary text-white"> <i class="fas fa-cube  text-white"></i> Crear Producto</a> --}}
            @include('respuestas.modal.create')
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
      <h6 class="m-0 font-weight-bold text-primary">Tabla de Respuestas</h6>
    </div>

    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                    <th>No</th>
                    <th>Texto</th>

                    
                    <th width="280px">Accion</th>
                </thead>
                <tbody>
                    @foreach ($respuestas as $key => $item)
                    <tr>
                        <td>{{$item->id}}</td>
                        <td>{{ $item->texto }}</td>

                       
                        {{-- <td>
                            @if (!empty($user->getRoleNames()))
                                @foreach ($user->getRoleNames() as $v)
                                    <label class="badge badge-success">{{ $v }}</label>
                                @endforeach
                            @endif
                        </td> --}}
                        <td>
                            {{-- <a class="btn btn-info" href="{{ route('respuestas.show', $item->id) }}">Respuestas</a> --}}
                            <a class="btn btn-primary" href="{{ route('respuestas.edit', $item->id) }}">Editar</a>
                            {!! Form::open(['method' => 'DELETE', 'route' => ['respuestas.destroy', $item->id], 'style' =>
                            'display:inline']) !!}
                            {!! Form::submit('Eliminar', ['class' => 'btn btn-danger']) !!}
                            {!! Form::close() !!}
                        </td>
                    </tr>
                @endforeach
                </tbody>
            </table>
           {{--  {!! $data->render() !!} --}}


        </div>
    </div>

</div>

@endsection
