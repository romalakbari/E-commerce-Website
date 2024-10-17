<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OrderDetail extends Model
{
    use HasFactory;
    protected $table = 'orderdetails';
   
   public function order(){
    return $this->belongsTo('App\Models\Order','order_id');
   }

     public function orderProduct()
    {
        return $this->belongsTo(Product::class, 'product_id');
    }
    
}
