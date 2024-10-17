<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAttributesTable extends Migration
{
    public function up()
    {
        Schema::create('attributes', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->string('name');
            $table->uuid('category_id')->nullable();
            $table->enum('show_type', ['detail', 'filter'])->default('detail');
            $table->enum('filter_type', ['text', 'range'])->default('text');
            $table->integer('min')->default(0);
            $table->integer('max')->default(1000);
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('attributes');
    }
}
