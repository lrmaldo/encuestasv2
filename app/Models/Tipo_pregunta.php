<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Tipo_pregunta extends Model
{
    use HasFactory;
    protected $table = 'tipos_preguntas';

    protected $fillable = [
        'nombre',
    ];
}
