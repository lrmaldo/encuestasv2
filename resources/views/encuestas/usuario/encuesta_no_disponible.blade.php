<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Sistema de encuestas">
    <meta name="author" content="Ing. Leonardo Maldonado">
    <title>No disponible</title>

    <!-- Fonts -->
    <link rel="dns-prefetch" href="//fonts.gstatic.com">

    <!-- Custom fonts for this template-->
  <link href="{{asset('vendor/fontawesome-free/css/all.min.css')}}" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
<!-- Custom styles for this template-->
<link href="{{asset('css/sb-admin-2.min.css')}}" rel="stylesheet">
<link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
  />
@livewireStyles
</head>
<body>
    <div class="container">
        <div class="row justify-content-between  py-4 animate__animated animate__fadeInDown">
            <div class="col-3 mt-1">
             <img src="{{asset('/img/Logo_TECNM-1024x438.png')}}" width="250px" alt="" class="img-responsive">
            </div>
            <div class="col-3 mt-1 text-center">

            </div>
            <div class="col-3 mt-1">
                <img src="{{asset('/img/logo_tec_tux.png')}}" width="100px" alt="" class="img-responsive ">
            </div>
          </div>
        <div class="py-5 text-center">
        <h2 class="animate__animated animate__bounceInDown">Encuesta no disponible</h2>
        <p></p>
        <a class="btn btn-info animate__animated animate__fadeInUp animate__delay-1s" href="{{ route('home') }}"> Regresar</a>
        </div>

    </div>
<script>
    /* para no retroceder */

    /* window.history.forward(); */
</script>


 <!-- Bootstrap core JavaScript-->
 <script src="{{asset('vendor/jquery/jquery.min.js')}}"></script>
 <script src="{{asset('vendor/bootstrap/js/bootstrap.bundle.min.js')}}"></script>

 <!-- Core plugin JavaScript-->
 <script src="{{asset('vendor/jquery-easing/jquery.easing.min.js')}}"></script>

 <!-- Custom scripts for all pages-->
 <script src="{{asset('js/sb-admin-2.min.js')}}"></script>
</body>
</html>
