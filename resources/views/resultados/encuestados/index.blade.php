@extends('layouts.app')


@section('content')

<div class="row">
    <div class="col-lg-12 margin-tb">
        <div class="pull-left">
            <h2 class="h3 mb-2 text-gray-800">Gestión de encuestados</h2>
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
      <h6 class="m-0 font-weight-bold text-primary">Tabla de encuestados</h6>
    </div>

    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                    <th>No</th>
                    <th>Nombre</th>
                    <th>Email</th>
                    <th width="280px">Acción</th>
                </thead>
                <tbody>
                    @php
                       $id_user = null;
                       $user =null;
                    @endphp
                    @foreach ($encuestados as $key => $encuestado)
                    @php
                                $id_user =$encuestado->usuario_encuesta($id_encuesta);
                                if($id_user){
                             //echo $id_user;
                                    $user = App\Models\User::find($id_user->usuario_id);
                            }
                        
                    @endphp
                    <tr>
                        
                        @if (!is_null($user))
                            
                        
                        <td>{{ $user->id }}</td>
                        <td>{{ $user->name }}</td>
                        <td>{{ $user->email}}</td>
                        
                        <td>
                            <a class="btn btn-info" href="{{ route('encuestado.show', [$encuestado->id,$id_encuesta]) }}">Ver encuesta</a>
                           {{--  <a class="btn btn-primary" href="{{ route('users.edit', $user->id) }}">Editar</a> --}}
                            {!! Form::open(['method' => 'DELETE', 'route' => ['encuestado.destroy', $encuestado->id], 'style' =>
                            'display:inline']) !!}
                            {!! Form::submit('Eliminar', ['class' => 'btn btn-danger']) !!}
                            {!! Form::close() !!}
                        </td>
                        @endif
                    </tr>
                @endforeach
                </tbody>
            </table>
            

        
        </div>
    </div>


</div>




@endsection
