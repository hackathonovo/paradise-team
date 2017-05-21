<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTableSkillUser extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
      Schema::create('skill_user', function (Blueprint $table) {
         $table->integer('user_id')->unsigned();
         $table->integer('skill_id')->unsigned();

         $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
         $table->foreign('skill_id')->references('id')->on('skills')->onDelete('cascade');
      });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
      $table->dropForeign('skill_user_user_id_foreign');
      $table->dropForeign('skill_user_skill_id_foreign');
      Schema::dropIfExists('skill_user');
    }
}
