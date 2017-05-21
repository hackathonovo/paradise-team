<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AlterUsersTable2 extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
      Schema::table('users', function (Blueprint $table) {
            $table->integer('role_id')->default("3");
            $table->string('phone')->default("000-000-000");
            $table->string('first_name')->default("Ciro");
            $table->string('last_name')->default("Ciric");

            $table->foreign('role_id')->references('id')->on('roles')->onDelete('cascade');
      });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
      Schema::table('users', function (Blueprint $table) {

        $table->dropForeign('users_role_id_foreign');
        $table->dropColumn(['role_id']);
        $table->dropColumn(['phone']);
        $table->dropColumn(['first_name']);
        $table->dropColumn(['last_name']);
        });
    }
}
