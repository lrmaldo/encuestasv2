<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignKeyEncuestaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('encuestas', function (Blueprint $table) {





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
        Schema::table('encuestas',function(Blueprint $table){

            $table->dropForeign(['tipo_encuesta_id']);
        });
    }
}
