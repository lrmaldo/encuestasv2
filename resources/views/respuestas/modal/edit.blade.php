<div class="modal fade " id="ModalEdit-{{$item->id}}" role="dialog" aria-labelledby="exampleModalLabel3" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Editar respuesta</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            {!! Form::open(['route' => ['respuestas.update',$item->id], 'method' => 'PATCH' ,'class'=>'form-horizontal','role'=>'form']) !!}
            {{-- {!! Form::model($encuesta,['route' => ['encuestas.update',$encuesta->id], 'method' => 'PATCH']) !!} --}}
              {{--   <form id="formfile" class="form-horizontal" role="form" method="POST"
                action="{{ route('productos.store') }}" enctype="multipart/form-data"> --}}
                <div class="modal-body">

                    {{-- <input type="hidden" name="_method" value="DELETE">
                    --}}

                    {{-- titulo --}}

                    <div class="form-group">
                        <div class="input-group-prepend">
                            <label class="col-md-6 control-label">Título de la respuesta*</label>
                        </div>
                        <div class="col-md-12">
                            {!! Form::text('texto', $item->texto, ['placeholder' => 'Título de la respuesta', 'class' => 'form-control', 'required' => 'required']) !!}
                           {{--  <input type="text" id="titulo" class="form-control" name="titulo" value=""
                                placeholder="Escribe un titulo del producto" required> --}}
                        </div>
                    </div>

                  
                    {!! Form::text('pregunta_id', $item->pregunta_id, ['class' => 'form-control', ' type' => 'hidden']) !!}




                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    <input class="btn btn-primary btn-xs" type="submit" value="Guardar" />

                </div>
                {!! Form::close() !!}
        </div>
    </div>
</div>
