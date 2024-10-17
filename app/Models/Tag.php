<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Traits\UuidTrait;

class Tag extends Model
{
    use HasFactory, UuidTrait;
    protected $guarded = [];
    protected $appends = ['total_products'];

    public function products(){
        return $this->belongsToMany(Product::class);
    }

    public function getTotalProductsAttribute(){

        return $this->belongsToMany(Product::class)->count();

    }

    public function categoryTag(){
        return $this->hasMany(CategoryTag::class);
    }
}
