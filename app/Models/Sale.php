<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Traits\UuidTrait;

class Sale extends Model
{
    use HasFactory, UuidTrait;
    protected $guarded = [];
    protected $appends = ['key'];


    public static function storeRule($data){
        return [
            'name' => 'required|max:255',
            'email' => 'required|unique:sales|max:255',
            'country' => 'required|max:255',
            'phone' => 'required|max:15',
            'category' => 'required',
        ];
    }

    public function getKeyAttribute()
    {
        return $this->attributes['id'];
    }
}
