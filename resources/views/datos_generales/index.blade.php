@extends('layouts.app')
@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">{{ __('LLena este formulario con tus Datos generales') }}</div>

                <div class="card-body">
                   
                    {!! Form::open(['url' => 'encuesta_tipo', 'method' => 'POST']) !!}
                   {{--  {{ __('You are logged in!') }} --}}
                    <br>
                 {{--    @foreach (App\Models\Tipo_encuesta::all() as $item)
                    {!! Form::radio('tipo_encuesta_id',$item->id,false)!!}
                    {!!  Form::label('tipo_encuesta_id', $item->nombre, null) !!} <br>
        
                    @endforeach --}}
                    <div class="col-xs-12 col-sm-12 col-md-12 ">
                        <button type="submit" class="btn btn-primary">Continuar</button>
                    </div>
                
                    {!! Form::close() !!}
                </div>
            </div>
        </div>
    </div>
</div>
    
@endsection