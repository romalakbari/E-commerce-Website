<?php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
            $table->increments('product_id'); // Auto-incrementing primary key
            $table->string('sku', 50)->unique(); // SKU as unique
            $table->string('name', 255); // Name column
            $table->text('description'); // Description column
            $table->decimal('price', 10, 2); // Price column
            $table->unsignedInteger('category_id')->nullable(); // CategoryID
            $table->string('brand', 100)->nullable(); // Brand column
            $table->string('image_url', 255)->nullable(); // ImageURL column
            $table->timestamps(); // Timestamps for CreatedAt and UpdatedAt

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('products');
    }
}
