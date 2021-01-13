<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class encuesta_usuario extends Model
{
    use HasFactory;
    protected $primarykey = 'id';
    protected $fillable = [
        'id',
        'encuesta_id',
        'pregunta_id',
        'tipo_pregunta',        
        'respuesta_id',
        'valor_respuesta',
        'usuario_id',
    ];

    public function usuario(){
        return $this->belongsTo(User::class,'id','usuario_id');
    }
}
