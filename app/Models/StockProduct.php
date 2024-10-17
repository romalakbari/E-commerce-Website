<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Traits\UuidTrait;

class StockProduct extends Model
{
    use HasFactory,UuidTrait;

    public static function storeRule($data){
        return [
            // 'asin' => 'required|unique:products|max:255',
            'product' => 'required',
            'quantity' => 'required',
            // 'url' => 'required|url',
        ];
    }

    public function stock()
    {
        return $this->belongsTo(Stock::class, 'stock_id');
    }

    // A StockProduct belongs to a Product
    

    public function product()
    {
        return $this->belongsTo(Product::class, 'product_id', 'id');
    }

    
}
