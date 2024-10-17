<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Traits\UuidTrait;

class ProductTag extends Model
{
    use HasFactory, UuidTrait;
    protected $table = 'product_tag';
    public $timestamps = false;
}
