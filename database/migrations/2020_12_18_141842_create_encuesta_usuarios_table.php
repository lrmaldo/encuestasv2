<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateEncuestaUsuariosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('encuesta_usuarios', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('encuesta_id')->unsigned()->nullable();
            $table->integer('pregunta_id')->unsigned()->nullable();
            $table->integer('respuesta_id')->unsigned()->nullable();
            $table->text('valor_respuesta')->default(null);
            $table->integer('usuario_id')->unsigned()->nullable();
            /* llaves foraneas */
            $table->foreign('encuesta_id')->references('id')->on('encuestas')->onDelete('cascade');
            $table->foreign('pregunta_id')->references('id')->on('preguntas')->onDelete('cascade');
            $table->foreign('respuesta_id')->references('id')->on('respuestas')->onDelete('cascade');
            $table->foreign('usuario_id')->references('id')->on('users')->onDelete('cascade');
            
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('encuesta_usuarios');
    }
}
