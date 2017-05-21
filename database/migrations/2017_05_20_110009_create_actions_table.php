<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateActionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('actions', function (Blueprint $table) {
            $table->increments('id');
            $table->string('title');
            $table->decimal('latitude', 10, 7);
            $table->decimal('longitude', 10, 7);
            $table->double('range', 7, 3);
            $table->integer('action_type_id')->unsigned();
            $table->text('info');
            $table->dateTime('start_time');
            $table->dateTime('end_time')->nullable();

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
        Schema::dropIfExists('actions');
    }
}
