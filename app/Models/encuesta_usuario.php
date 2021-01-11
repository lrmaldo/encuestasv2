<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class encuesta_usuario extends Model
{
    use HasFactory;
    protected $primarykey = 'id';

    public function usuario(){
        return $this->belongsTo(User::class,'id','usuario_id');
    }
}
