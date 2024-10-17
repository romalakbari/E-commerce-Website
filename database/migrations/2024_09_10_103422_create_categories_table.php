<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCategoriesTable extends Migration
{
    public function up()
    {
        Schema::create('categories', function (Blueprint $table) {
            $table->id();
            $table->uuid('parent_id')->nullable();
            $table->string('name');
            $table->string('banner')->nullable();
            $table->string('icon')->nullable();
            $table->timestamp('deleted_at')->nullable();
            $table->boolean('featured')->default(false);
            $table->string('featured_icon')->nullable();
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('categories');
    }
}
