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
            <a href="{{url('encuesta_preview/'.$encuesta->id)}}" class="btn btn-info text-white"   target="_blank" rel="noopener noreferrer">Ver encuesta</a>
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
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                    <th>No</th>
                    <th>Titulo</th>

                    <th>Tipo de pregunta</th>
                    <th width="280px">Accion</th>
                </thead>
                <tbody>
                    @php
                        $i = 1;
                    @endphp
                    @foreach ($preguntas as $key => $item)
                    <tr>
                        <td>{{$i++}}</td>
                        <td>{{ $item->titulo }}</td>

                        <td>{{$item->tipo_pregunta->nombre}}</td>
                        {{-- <td>
                            @if (!empty($user->getRoleNames()))
                                @foreach ($user->getRoleNames() as $v)
                                    <label class="badge badge-success">{{ $v }}</label>
                                @endforeach
                            @endif
                        </td> --}}
                        <td>

                            @if ($item->tipo_pregunta_id==1)
                                
                            @else
                            
                            <a class="btn btn-info" href="{{ route('respuestas.show', $item->id) }}">Respuestas</a>
                            @endif
                            <a data-toggle="modal" data-target="#ModalEdit-{{$item->id}}"  class="btn btn-primary text-white">Editar</a>
                            @include('preguntas.modal.edit')
                            {{-- <a class="btn btn-primary" href="{{ route('preguntas.edit', $item->id) }}">Editar</a> --}}

                            {!! Form::open(['method' => 'DELETE', 'route' => ['preguntas.destroy', $item->id], 'style' =>
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
