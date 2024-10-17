<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Illuminate\Validation\Rules;
use Laravel\Sanctum\HasApiTokens;
use App\Traits\UuidTrait;
// use Illuminate\Database\Eloquent\SoftDeletes;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory;
    protected $fillable = [
        'name',
        'email',
        'password',
        'is_customer'
    ];

    protected $hidden = [
        'password',
        'remember_token',
    ];


    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function getKeyAttribute()
    {
        return $this->attributes['id'];
    }

    public function order(){

        return $this->hasMany('App\Models\Order','customer_id');
    }
}
