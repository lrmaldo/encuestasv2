@extends('layouts.app')
@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">{{ __('LLena este formulario con tus Datos generales') }}</div>

                    <div class="card-body">
                        @if (count($errors) > 0)
                            <div class="alert alert-danger">
                                <strong>Error!</strong><br><br>
                                <ul>
                                    @foreach ($errors->all() as $error)
                                        <li>{{ $error }}</li>
                                    @endforeach
                                </ul>
                            </div>
                        @endif

                        {!! Form::open(['url' => 'datos_store', 'method' => 'POST']) !!}
                        {{--  {{ __('You are logged in!') }} --}}
                        <br>
                        {{--    @foreach (App\Models\Tipo_encuesta::all() as $item)
                    {!! Form::radio('tipo_encuesta_id',$item->id,false)!!}
                    {!!  Form::label('tipo_encuesta_id', $item->nombre, null) !!} <br>

                    @endforeach --}}
                        <div class="col-xs-12 col-sm-12 col-md-10">
                            <div class="form-group">
                                <strong>Nombre:</strong>
                                {!! Form::text('nombre', Auth::user()->name, [
                                    'placeholder' => 'Nombre',
                                    'disabled' => 'disabled',
                                    'class' => 'form-control',
                                    'required' => 'required',
                                ]) !!}
                            </div>
                        </div>
                        <div class="row col-sm-12">
                            <div class="col-xs-12 col-sm-12 col-md-4 ">
                                <div class="form-group">
                                    <strong>Genero:</strong>
                                    {!! Form::select('genero', ['Femenino' => 'Femenino', 'Masculino' => 'Masculino'], null, [
                                        'class' => 'form-control',
                                        'required' => 'required',
                                    ]) !!}
                                </div>



                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-4 ">
                                <div class="form-group">
                                    <strong>Edad:</strong>
                                    {!! Form::number('edad', null, [
                                        'placeholder' => 'Tu edad',
                                        'class' => 'form-control',
                                        'min' => '0',
                                        'required' => 'required',
                                    ]) !!}
                                </div>
                            </div>

                        </div>


                        <div class="col-xs-12 col-sm-12 col-md-12 ">
                            <div class="form-group">
                                <strong>Domicilio:</strong>
                                {!! Form::text('domicilio', null, [
                                    'placeholder' => 'Escribe tu dirección',
                                    'class' => 'form-control',
                                    'required' => 'required',
                                ]) !!}
                            </div>
                        </div>
                        <div class="row col-sm-12">
                            <div class="col-xs-12 col-sm-12 col-md-6 ">
                                <div class="form-group">
                                    <strong>Ciudad:</strong>
                                    {!! Form::text('ciudad', null, ['placeholder' => 'Ejem. San Juan Bautista Tuxtepec', 'class' => 'form-control']) !!}
                                </div>



                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-4 ">
                                <div class="form-group">
                                    <strong>CP:</strong>
                                    {!! Form::number('cp', null, [
                                        'placeholder' => 'Código Postal',
                                        'class' => 'form-control',
                                        'min' => '0',
                                        'required' => 'required',
                                    ]) !!}
                                </div>
                            </div>

                        </div>
                        <div class="row col-sm-12">
                            <div class="col-xs-12 col-sm-12 col-md-6 ">
                                <div class="form-group">
                                    <strong>Celular:</strong>
                                    {!! Form::number('celular', null, [
                                        'placeholder' => '2870000000',
                                        'class' => 'form-control',
                                        'min' => '0',
                                        'required' => 'required',
                                    ]) !!}
                                </div>


                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-6 ">
                                <div class="form-group">
                                    <strong>Teléfono:</strong>
                                    {!! Form::number('telefono', null, [
                                        'placeholder' => '2870000000',
                                        'class' => 'form-control',
                                        'min' => '0',
                                       # 'required' => 'required',
                                    ]) !!}
                                </div>
                            </div>

                        </div>
                        {!! Form::text('tipo_encuesta_id', Auth::user()->es_empleado, ['class' => 'form-control', ' type' => 'hidden']) !!}

                        <div class="col-xs-12 col-sm-12 col-md-12 ">
                            <button type="submit" class="btn btn-primary">Continuar</button>
                        </div>

                        {!! Form::close() !!}
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        window.history.forward();
    </script>
@endsection
