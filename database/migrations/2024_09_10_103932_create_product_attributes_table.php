<?php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductAttributesTable extends Migration
{
    public function up()
    {
        Schema::create('product_attributes', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->uuid('attribute_id')->nullable();
            $table->uuid('product_id');
            $table->text('values')->nullable();
            $table->timestamps();

         
        });
    }

    public function down()
    {
        Schema::dropIfExists('product_attributes');
    }
}
