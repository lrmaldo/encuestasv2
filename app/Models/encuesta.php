<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class encuesta extends Model
{
    use HasFactory;
    protected $fillable = [
        'titulo',
        'descripcion',
        'tipo_encuesta_id'
    ];

    public function tipo_encuesta(){
        return $this->belongsTo(Tipo_encuesta::class,'tipo_encuesta_id');
    }

}
