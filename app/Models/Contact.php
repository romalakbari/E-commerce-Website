<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Traits\UuidTrait;

class Contact extends Model
{
    use HasFactory, UuidTrait;

    protected $guarded = [];
    protected $appends = ['key'];


    public static function storeRule($data){
        
        return [
            'fname' => 'required|max:255',
            // 'lname ' => 'required|max:255',
            'email' => 'required|max:255',
            'phone' => 'required|max:255',
            'description' => 'required|max:255',
        ];
    }

    public function getKeyAttribute()
    {
        return $this->attributes['id'];
    }
}
