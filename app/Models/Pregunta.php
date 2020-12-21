<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Pregunta extends Model
{
    use HasFactory;
    protected $fillable = [
        'id',
        'titulo',
        'encuesta_id',
        'tipo_pregunta_id'
    ];

    public function tipo_pregunta(){
        return $this->belongsTo(Tipo_pregunta::class,'tipo_pregunta_id');
        
    }
}
