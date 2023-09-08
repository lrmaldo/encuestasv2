<div class="card-header">{{ __('Elige el tipo de encuesta a contestar:') }}</div>

                <div class="card-body">
                    @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif
                    {!! Form::open(['url' => 'encuesta_tipo', 'method' => 'POST']) !!}
                   {{--  {{ __('You are logged in!') }} --}}
                    <br>
                    @foreach (App\Models\Tipo_encuesta::all() as $item)
                    {!! Form::radio('tipo_encuesta_id',$item->id,false)!!}
                    {!!  Form::label('tipo_encuesta_id', $item->nombre, null) !!} <br>

                    @endforeach
                    <div class="col-xs-12 col-sm-12 col-md-12 ">
                        <button type="submit" class="btn btn-primary">Continuar</button>
                    </div>

                    {!! Form::close() !!}
                </div>
