<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Tipo_encuesta extends Model
{
    use HasFactory;
    protected $fillable = [
        'id',
        'nombre',

    ];

    public  function encuesta(){
        return $this->hasMany(encuesta::class);
        
    }
}
