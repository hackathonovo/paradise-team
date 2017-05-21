<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateActionEventsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('action_events', function (Blueprint $table) {
            $table->increments('id');
            $table->string('event_name');
            $table->integer('action_type_id')->unsigned();

            $table->foreign('action_type_id')->references('id')->on('action_types')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        $table->dropForeign('action_events_action_type_id_foreign');
        Schema::dropIfExists('action_events');
    }
}
