<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Registrate para contestar una encuesta">
    <meta name="author" content="Ing. Leonardo Maldonado">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>Registro - Encuestas</title>

    <!-- Scripts -->
    {{-- <script src="{{ asset('js/app.js') }}" defer></script> --}}

    <!-- Fonts -->
    <link rel="dns-prefetch" href="//fonts.gstatic.com">
   {{--  <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet"> --}}

    <!-- Styles -->
   {{--  <link href="{{ asset('css/app.css') }}" rel="stylesheet"> --}}

    <!-- Custom fonts for this template-->
  <link href="{{asset('vendor/fontawesome-free/css/all.min.css')}}" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="{{asset('css/sb-admin-2.min.css')}}" rel="stylesheet">
</head>

<body class="bg-gradient-primary">

  <div class="container">

    <div class="card o-hidden border-0 shadow-lg my-5">
      <div class="card-body p-0">
        <!-- Nested Row within Card Body -->
        <div class="row">
          <div class="col-lg-5 d-none d-lg-block bg-register-image">{{--  la imagen debe de ser 600x800 editar en psd --}}</div>
          <div class="col-lg-7">
            <div class="p-5">
              <div class="text-center">
                <h1 class="h4 text-gray-900 mb-4">Crear usuario</h1>
                <h3 class="h6 text-gray-900 mb-4" >Programa de seguimiento a egresados y empleadores</h3>
              </div>

                <form  class="user" method="POST" action="{{ route('register') }}">
                    @csrf
                <div class="form-group ">


                    <div class="py-2">
                        <input id="name" type="text"  placeholder="Nombre completo"  class=" form-control-user form-control @error('name') is-invalid @enderror" name="name" value="{{ old('name') }}" required autocomplete="name" autofocus>

                        @error('name')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                        @enderror
                    </div>

                </div>
                <div class="form-group">
                 {{--  <input type="email" class="form-control form-control-user" id="exampleInputEmail" placeholder="Email Address"> --}}
                  <input id="email" type="email" placeholder="Correo Electrónico" class=" form-control-user form-control @error('email') is-invalid @enderror" name="email" value="{{ old('email') }}" required autocomplete="email">

                  @error('email')
                      <span class="invalid-feedback" role="alert">
                          <strong>{{ $message }}</strong>
                      </span>
                  @enderror
                </div>
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    {{-- <input type="password" class="form-control form-control-user" id="exampleInputPassword" placeholder="Password"> --}}
                    <input id="password" type="password" placeholder="Contraseña" class="form-control form-control-user @error('password') is-invalid @enderror" name="password" required autocomplete="new-password">

                    @error('password')
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                    @enderror
                  </div>
                  <div class="col-sm-6">


                        <input id="password-confirm" type="password" class="form-control form-control-user" placeholder="Repetir contraseña" name="password_confirmation" required autocomplete="new-password">

                  </div>
                </div>
                <div class="form-group">
                    <label class="">¿Eres empleador?</label>
                    <br>
                    {{-- insertar un select con las opciones de empleado y egresado--}}
                   {{--  <input type="radio" name="tipo_usuario" id="tipo_usuario" value="egresado" required>
                    <label for="tipo_usuario" class="">Egresado</label>
                    <input type="radio" name="tipo_usuario" id="tipo_usuario" value="empleado" required>
                    <label for="tipo_usuario" class="">Empleado</label> --}}

                    <select name="es_empleado" id="es_empleado" class="form-control  @error('is_egresado') is-invalid @enderror" style="border-radius: 0.35rem;" required>
                        <option >Selecciona una opción</option>
                        <option value="2">Sí</option>
                        <option value="1">No</option>
                    </select>
                    {{-- <select name="tipo_usuario" id="tipo_usuario" class="form-control form-control-user @error('tipo_usuario') is-invalid @enderror" style="color:black !important" required>
                        <option value="">Selecciona una opción</option>
                        <option value="egresado">Egresado</option>
                        <option value="empleado">Empleado</option>
                    </select> --}}

                    {{-- poner un grupo de radios uno como egresados y el otro como empleado --}}





                </div>
                <button type="submit" class="btn btn-primary btn-user btn-block">
                    {{ __('Registrar cuenta') }}
                </button>

              </form>
              <hr>
              <div class="text-center">
                <a class="small" href="{{ route('password.request') }}">¿Se te olvidó tu contraseña?</a>
              </div>
              <div class="text-center">
                <a class="small" href="{{ route('login') }}">¿Ya te registraste?, click aqui para Login</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

  </div>
  <!-- Bootstrap core JavaScript-->
  <script src="{{asset('vendor/jquery/jquery.min.js')}}"></script>
  <script src="{{asset('vendor/bootstrap/js/bootstrap.bundle.min.js')}}"></script>

  <!-- Core plugin JavaScript-->
  <script src="{{asset('vendor/jquery-easing/jquery.easing.min.js')}}"></script>

  <!-- Custom scripts for all pages-->
  <script src="{{asset('js/sb-admin-2.min.js')}}"></script>

</body>

</html>




{{-- @extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">{{ __('Register') }}</div>

                <div class="card-body">
                    <form method="POST" action="{{ route('register') }}">
                        @csrf

                        <div class="form-group row">
                            <label for="name" class="col-md-4 col-form-label text-md-right">{{ __('Name') }}</label>

                            <div class="col-md-6">
                                <input id="name" type="text" class="form-control @error('name') is-invalid @enderror" name="name" value="{{ old('name') }}" required autocomplete="name" autofocus>

                                @error('name')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="email" class="col-md-4 col-form-label text-md-right">{{ __('E-Mail Address') }}</label>

                            <div class="col-md-6">
                                <input id="email" type="email" class="form-control @error('email') is-invalid @enderror" name="email" value="{{ old('email') }}" required autocomplete="email">

                                @error('email')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="password" class="col-md-4 col-form-label text-md-right">{{ __('Password') }}</label>

                            <div class="col-md-6">
                                <input id="password" type="password" class="form-control @error('password') is-invalid @enderror" name="password" required autocomplete="new-password">

                                @error('password')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="password-confirm" class="col-md-4 col-form-label text-md-right">{{ __('Confirm Password') }}</label>

                            <div class="col-md-6">
                                <input id="password-confirm" type="password" class="form-control" name="password_confirmation" required autocomplete="new-password">
                            </div>
                        </div>

                        <div class="form-group row mb-0">
                            <div class="col-md-6 offset-md-4">
                                <button type="submit" class="btn btn-primary">
                                    {{ __('Register') }}
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection --}}
