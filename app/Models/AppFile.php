<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Traits\UuidTrait;

class AppFile extends Model
{
    use HasFactory, UuidTrait;
    protected $guarded = [];
    protected $appends = ['status','thumbUrl','uid','path'];

    public function getPathAttribute()
    {
        return $this->attributes['url'];
    }

    public function getThumbUrlAttribute()
    {
        $record = (object) [
            "id"=> $this->attributes['id'],
            "name" => $this->attributes['url']

        ];
        // return getThumbnails($record,"small");
    }

    public function getUrlAttribute()
    {
        $record = (object) [
            "id"=> $this->attributes['id'],
            "name" => $this->attributes['url']

        ];
        // return getThumbnails($record,"default");
    }
    public function getStatusAttribute()
    {
        return 'done';
    }
    public function getUidAttribute()
    {
        return $this->attributes['id'];
    }
    public function getNameAttribute()
    {
        return $this->attributes['name'] ? $this->attributes['name'] : $this->attributes['url'];
    }
}
