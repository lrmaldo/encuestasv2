<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Datos_generales extends Model
{
    use HasFactory;

    protected $fillable = [
        'id',
        'genero',
        'edad',
        'domicilio',
        'ciudad',
         'cp',
         'telefono',
         'celular',
         'usuario_id',
    ];
}
