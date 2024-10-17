<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Traits\UuidTrait;
use Illuminate\Database\Eloquent\SoftDeletes;
use Laravel\Scout\Searchable;

class Product extends Model
{
    use HasFactory, UuidTrait,Searchable;

    protected $fillable = ['sku','title','price','wh_price','description','category_id','about','net_quantity','item_weight'];
    protected $appends = ['key','thumbnail','thumbnail2','poster'];
    // protected $with = ['category'];


    public function productAttributes(){
        return $this->hasMany(ProductAttribute::class);
    }

    public function category(){
        return $this->belongsTo(Category::class);
    }

    public static function storeRule($data){
        return [
            // 'asin' => 'required|unique:products|max:255',
            'title' => 'required|max:255',
            'category_id' => 'required',
            // 'url' => 'required|url',
        ];
    }

    public function previewFiles(){
        return $this->hasMany(AppFile::class)->orderBy('created_at','asc');
    }

    public function downloadableFiles(){
        return $this->hasMany(AppFile::class)->orderBy('created_at','asc');
    }

    public function files(){
        return $this->hasMany(AppFile::class);

    }

    public function getKeyAttribute()
    {
        return $this->attributes['id'];
    }


    public function getThumbnailAttribute(){
        // return getThumbnails($this->hasMany(AppFile::class)->where('type','preview')->orderBy('created_at','asc')->first(),'default');
    }

    public function getThumbnail2Attribute(){
        // return getThumbnails($this->hasMany(AppFile::class)->where('type','preview')->orderBy('created_at','asc')->first(),'small');
    }

    public function getPosterAttribute(){

       // $record = $this->hasMany(AppFile::class)->where('type','preview')->orderBy('created_at','desc')->first();

       // $extension = '';

       // if($record) $extension = explode(".", $record->name)[1];

       // $supportExtensions = array("jpg", "png", "tiff", "webp", "svg","jpeg","jfif");

       //  if(in_array(strtolower($extension), $supportExtensions))
       //     return env('CLOUDFORMATION_CLOUDFRONT_URL'). '/fit-in/600x600/' . $record->id. "___" . $record->name;
       //  return '';
    }

    public function searchableAs()
    {

        return 'title';
    }


    protected function makeAllSearchableUsing($query)
    {
        return $query->with(['category','productAttributes']);
    }

    public function discount(){
        return $this->hasOne(ProductDiscount::class);
    }

    public function orderDetail()
    {
        return $this->hasMany(OrderDetail::class, 'product_id');
    }

    public function stock(){

        return $this->hasMany('App\Models\Stock','product_id');
    }

     public function stockProducts()
    {
        return $this->hasMany(StockProduct::class, 'product_id');
    }

    
    public function stockProduct()
    {
        return $this->hasOne(StockProduct::class, 'product_id', 'id');
    }
}
