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
        return $this->hasOne(User::class,'usuario_id','id');
    }

    public function get_encuesta(){
        return $this->belongsTo(encuesta::class,'encuesta_id');
    }
   /*  public function get_usuarios(){
        return $this->hasMany(User::class,'usuario_id','id');
     } */
}
