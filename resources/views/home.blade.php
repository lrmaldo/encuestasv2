@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                @php
                        $encuesta_usuario = App\Models\encuesta_usuario::where('usuario_id',Auth::user()->id)->orderby('created_at','DESC')->take(1)->first();
                        if($encuesta_usuario){
                            //$respondido = $encuesta_usuario->last();
                            $encuesta = App\Models\encuesta::where('status','=',1)->where('id',$encuesta_usuario->encuesta_id)->count();

                        }
                    
                @endphp
                @if ($encuesta>0)
                @include('layouts.card_tipo')
                @else
                @include('layouts.card_contestado')    
                    
                @endif

                
            </div>
        </div>
    </div>
</div>
@endsection
