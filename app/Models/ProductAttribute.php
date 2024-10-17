<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Traits\UuidTrait;

class ProductAttribute extends Model
{
    use HasFactory, UuidTrait;
    protected $guarded = [];

    function attribute(){
        return $this->belongsTo(Attribute::class);
    }
}
