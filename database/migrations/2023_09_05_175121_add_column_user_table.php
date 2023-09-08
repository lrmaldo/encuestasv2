<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddColumnUserTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('users', function (Blueprint $table) {

            /* tipo de persona egresado o Empleado*/
           $table->tinyInteger('es_empleado')->nullable();


/*
            $table->foreign('tipo_encuesta_id')->references('id')->on('tipo_encuestas')->onDelete('cascade'); /* set null */

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('users',function(Blueprint $table){

            $table->dropForeign(['es_empleado']);
        });

    }
}
