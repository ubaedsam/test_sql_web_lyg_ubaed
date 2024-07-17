<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDboLygsewingoutputTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('dbo_lygsewingoutput', function (Blueprint $table) {
            $table->id();
            $table->date('trn_date');
            $table->string('operator_name');
            $table->string('style_code');
            $table->string('size_name');
            $table->string('destination_code');
            $table->string('qty_output');
            $table->timestamps();
            $table->foreign('style_code')->references('style_code')->on('dbo_lygstylesize')->onDelete('cascade');
            $table->foreign('destination_code')->references('destination_code')->on('dbo_lygdestination')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('dbo_lygsewingoutput');
    }
}
