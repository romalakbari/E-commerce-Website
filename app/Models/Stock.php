<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Traits\UuidTrait;

class Stock extends Model
{
    use HasFactory,UuidTrait;

    public static function storeRule($data){
        
        return [
            'country' => 'required|max:255',
            'state' => 'required',
            'city' => 'required',
            'stock_name' => 'required|unique:stocks,stock_name', 
            'address' => 'required',
        ];
    }
    public static function updateRule($data){
        
        return [
            // 'country' => 'required|max:255',
            // 'state' => 'required',
            // 'city' => 'required',
            'address' => 'required',
        ];
    }

    public function country()
    {
        return $this->belongsTo(Country::class);
    }

    public function state()
    {
        return $this->belongsTo(State::class);
    }

    public function city()
    {
        return $this->belongsTo(City::class);
    }

    public function stockProducts()
    {
        return $this->hasMany(StockProduct::class, 'stock_id');
    }

    
}
