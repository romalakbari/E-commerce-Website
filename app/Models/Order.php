<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    use HasFactory;
    protected $table ='orders';
    protected $fillable = ['customer_id'];

    public function orderDetail(){

        return $this->hasMany('App\Models\OrderDetail','order_id');
    }

    public function customer(){
        return $this->belongsTo('App\Models\User','customer_id');
    }
}
