<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTicketsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tickets', function (Blueprint $table) {
            $table->integer('id')->autoIncrement();
            $table->integer('event_id');
            $table->foreign('event_id')->references('id')->on('events');

            $table->integer('user_id');
            $table->foreign('user_id')->references('id')->on('users');

            $table->string('booking_code');

            $table->integer('t_type');
            $table->integer('no_of_tickets');
            $table->integer('costs');
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
        Schema::dropIfExists('tickets');
    }
}
