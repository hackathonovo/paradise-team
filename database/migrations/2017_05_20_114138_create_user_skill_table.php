<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateUserSkillTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('user_skill', function (Blueprint $table) {
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
        $table->dropForeign('user_skill_user_id_foreign');
        $table->dropForeign('user_skill_skill_id_foreign');
        Schema::dropIfExists('user_skill');
    }
}
