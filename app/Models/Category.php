<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use App\Traits\UuidTrait;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Validation\Rule;
// use Laravel\Scout\Searchable;
// use App\Models\Attribute;

class Category extends Model
{

    protected $fillable = ['parent_id','name'];
    public static function storeRule($data){
        
        return [
            'name' => 'required|unique:categories|max:255',
        ];
    }

    public static function updateRule($data,$id){
        return [
            'name' => 'required|max:255|unique:categories,name,'.$id,
            'name' => [
                'required',
                Rule::unique('categories')->ignore($id),
            ],
        ];
    }

    


    public function parent()
    {
        return $this->belongsTo(Category::class, 'parent_id');
    }

    public function children()
    {
        return $this->hasMany(Category::class, 'parent_id');
    }

    public function childrenRecursive()
    {
        return $this->children()->with('childrenRecursive');
    }

    public function attributes()
    {
        return $this->hasMany(Attribute::class);
    }

    public function filterAttributes()
    {
        return $this->hasMany(Attribute::class)->where('show_type','filter')->orderBy('created_at','asc');
    }

    public function products(){
        return $this->hasMany(Product::class);
    }

    public function tags(){
        return $this->belongsToMany(Tag::class,'category_tags');
    }

    public function getKeyAttribute()
    {
        return $this->attributes['id'];
    }

    public function getPathAttribute(){
        return env('APP_URL') . '/storage/' . $this->attributes['banner'];
    }
}
