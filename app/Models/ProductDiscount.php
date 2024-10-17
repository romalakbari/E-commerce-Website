<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use App\Traits\UuidTrait;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Validation\Rule;
// use Laravel\Scout\Searchable;
// use App\Models\Attribute;

class ProductDiscount extends Model
{

	protected $table ='product_discounts';
	
    public static function storeRule($data){
        
        return [
            'start_date' => 'required',
            'end_date' => 'required',
            'discount' => 'required|numeric|between:0,100',
        ];
    }

    public static function updateRule($data,$id){
        return [
            'start_date' => 'required',
            'end_date' => 'required',
            'discount' => 'required|numeric|between:0,100',
        ];
    }

    public function product(){
        return $this->belongsTo(Product::class);
    }
}
