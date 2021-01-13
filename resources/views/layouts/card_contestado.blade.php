<div class="card-header">{{ __('Espera la siguiente encuesta') }}</div>

                <div class="card-body">
                    @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif
                   <p>Ya has respondido una encuesta muchas gracias.</p>
                </div>