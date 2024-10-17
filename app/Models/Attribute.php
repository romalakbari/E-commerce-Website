<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Traits\UuidTrait;

class Attribute extends Model
{
    use HasFactory, UuidTrait;
    protected $guarded = [];
    protected $appends = ['key'];
    // protected $with = ['attributeValues'];

    public function attributeValues(){
        return $this->hasMany(AttributeValue::class);
    }

    public function getKeyAttribute(){
        return $this->attributes['id'];
    }
}
