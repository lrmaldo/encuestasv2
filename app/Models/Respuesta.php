<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Respuesta extends Model
{
    use HasFactory;
    protected $fillable = [
        'id',
        'texto',
        'pregunta_id',
        'encuesta_id',
       
    ];
}
