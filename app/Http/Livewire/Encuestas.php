<?php

namespace App\Http\Livewire;

use App\Models\encuesta;
use Livewire\Component;

class Encuestas extends Component
{
    public $encuesta, $titulo, $tipo, $descripcion;
    public function render()
    {
        $encuestas = encuesta::all();
        return view('livewire.encuestas',compact('encuestas'));
    }

    public function create(){

      return view('livewire.encuestas')
            ->layout('encuestas.create'); 
    }
}
