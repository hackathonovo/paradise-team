<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateActionUserTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('action_user', function (Blueprint $table) {
          $table->integer('user_id')->unsigned();
          $table->integer('action_id')->unsigned();

          $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
          $table->foreign('action_id')->references('id')->on('actions')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
      $table->dropForeign('action_user_user_id_foreign');
      $table->dropForeign('action_user_action_id_foreign');
      Schema::dropIfExists('action_user');
    }
}
