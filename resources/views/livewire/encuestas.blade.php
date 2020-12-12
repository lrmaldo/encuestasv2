@extends('layouts.app')


@section('content')
<div>
    {{-- If you look to others for fulfillment, you will never truly be fulfilled. --}}
    <ol class="breadcrumb mb-4">
        <li class="breadcrumb-item"><a href="{{ route('home') }}">Dashboard</a></li>
        <li class="breadcrumb-item active">Encuestas</li>
    </ol>


    @if (session()->has('message'))
    <div class="bg-teal-100 border-t-4 border-teal-500 rounded-b text-teal-900 px-4 py-3 shadow-md my-3" role="alert">
      <div class="flex">
        <div>
          <p class="text-sm">{{ session('message') }}</p>
        </div>
      </div>
    </div>
@endif
<button wire:click="create()" class="btn btn-success">Crear nueva encuesta</button>
</div>


@endsection



