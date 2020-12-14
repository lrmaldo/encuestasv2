<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForeignTipoPregunta extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('preguntas', function (Blueprint $table) {





            $table->foreign('tipo_pregunta_id')->references('id')->on('tipos_preguntas')->onDelete('cascade'); /* set null */


        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('preguntas',function(Blueprint $table){

            $table->dropForeign(['tipo_pregunta_id']);
        });
    }
}
