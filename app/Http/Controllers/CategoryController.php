<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Product;
use App\Models\Attribute;
use App\Models\AttributeValue;
use Illuminate\Http\Request;
use App\Traits\FileTrait;
use App\Models\StockProduct;
use Illuminate\Support\Facades\Gate;
use Storage;
use DB;
use File;
use Illuminate\Support\Arr;

class CategoryController extends Controller
{
    
        use FileTrait;

    public function index(Request $request)
    {
        if(isset($request->all))
            return response()->json(["result"=>true, "data" => Category::orderBy('created_at','desc')->where('parent_id',null)->get()]);

        $categories = Category::orderBy('updated_at','asc')->withoutTrashed()->whereNull('parent_id')->get();
        return response()->json(["result" => true, "data" => $categories]);
    }


   public function store(Request $request){
       
       $request->validate(Category::storeRule($request));
       $featuredfile = $request->file('featuredFile');
       $category = new Category();

       $file = $request->file('file');
       $filename = null;
       $featuredFilename = null;
       if($file){
          $filename = $file->getClientOriginalName(); 
          $file->move(public_path('files/category'), $filename);
       }
       // 
       if($featuredfile){
          $featuredFilename = $featuredfile->getClientOriginalName(); 
       $featuredfile->move(public_path('files/category/featured'), $featuredfile);
       }

       $category->icon = $filename;
       $category->featured_icon = $featuredFilename;
       $category->name = $request->name;
       $category->save();
       return $category;
    }

    public function show(Request $request,$id)
    {   

        $category = Category::where('id',$id)->with(['filterAttributes.attributeValues','childrenRecursive','parent.childrenRecursive'])->first();


        $category['parent_filter_attributes'] = $category->parent ?  Attribute::with('attributeValues')->where('category_id', $category->parent->id)->where('show_type','filter')->orderBy('created_at','asc')->get() : array();

        $childCategories = Category::where('parent_id',$category->id)->get();
        $childCategoriesArray = json_decode(json_encode($childCategories), true);  
        $childCategoriesID = array_column($childCategoriesArray, 'id');
        array_push($childCategoriesID, $category->id); 
        
        if($category->parent_id ==null){
          $products = Product::with(['previewFiles'])->whereIn('category_id', $childCategoriesID)->paginate(100);
          ///////////////
          $productIds = StockProduct::pluck('product_id');

          $products = Product::with(['category', 'previewFiles'])
            ->whereIn('id', $productIds) 
            ->orderBy('created_at', 'desc')
            ->paginate(30);
            //////////////
        }else{
           $products = Product::with(['previewFiles'])->where('sub_cat_id',$id)->paginate(100);
        }
        return response()->json(["result"=> true, "category"=>$category, "products" => $products]);

    }

    public function update(Request $request, Category $category){   

        $category = Category::find($request->id);
        if ($request->hasFile('file')) {
            $file = $request->file('file');
            $filename = $file->getClientOriginalName(); 
            $file->move(public_path('files/category'), $filename);
            $category->icon = $filename;
        }
        if ($request->hasFile('featuredFile')) {
            $featured_file = $request->file('featuredFile');
            $feature_filename = $featured_file->getClientOriginalName(); 
            $featured_file->move(public_path('files/category/featured'), $feature_filename);
            $category->featured_icon = $feature_filename;
        }

       $category->name = $request->name;
       $category->save();
       return $category;
    }


    public function destroy(Category $category)
    {
        $category->delete();
        return $category;
    }

    public function storeSubCtegory(Request $request,$id){

        $category = Category::find($id);
        $nCategory = new Category();
        $nCategory->parent_id = $category->id;
        $nCategory->name = $request->name;
        $nCategory->save();
        return $nCategory;
    }

    public function destroyAttribute($id){
        
        $attr = Attribute::find($id);
        $attr->attributeValues()->delete();
        return $attr->delete();
    }


public function filter(Request $request, $categoryId){

    $filters = $request->all();
    $query = Product::with(['previewFiles']);

    foreach ($filters as $filter) {

        if (isset($filter['category_id'])) {
            $values = Arr::wrap($filter['values']); 
            $query->orWhere('category_id', $filter['category_id'])
                ->whereIn('sub_cat_id', $values);
        }

        if (isset($filter['attribute_id'])) {

            $values = [$filter['values']];
            if ($filter['type'] != 'range') {
                $query->orWhere(function ($q) use ($categoryId, $values) {
                    $q->where('category_id', $categoryId)
                        ->whereHas('productAttributes', function ($innerQ) use ($values) {
                            $innerQ->whereIn('values', $values);
                        });
                });
            } else {
                $valuess = $filter['values'];
                $minPrice = $request->input('minPrice', 0);
                $maxPrice = $request->input('maxPrice', $valuess);

                $query->orWhere(function ($q) use ($categoryId, $minPrice, $maxPrice) {

                    $q->where('category_id', $categoryId)
                        ->whereHas('productAttributes', function ($innerQ) use ($minPrice, $maxPrice) {
                            $innerQ->where('values', '>=', $minPrice)
                                ->where('values', '<=', $maxPrice);
                        });
                });
            }
        }
    }
    
    $productIds = StockProduct::pluck('product_id');
    $filteredProducts = $query->whereIn('id',$productIds)->get();
    return response()->json(["result" => true, "data" => $filteredProducts]);
}

    public function subCategory(Request $request,$id){
        
        if($id !=0){
           return response()->json(["result"=>true, "data" => Category::orderBy('created_at','desc')->where('parent_id',$id)->get()]); 
        }elseif ($id==01) {
           return response()->json(["result"=>true, "data" => []]);
        }elseif ($id ==0) {
           return response()->json(["result"=>true, "data" => Category::orderBy('created_at','desc')->where('parent_id','!=',null)->get()]);
        }
    }
    public function catAttribute(Request $request,$id){
       $attribut_values = Attribute::with(['attributeValues'])->where('category_id',$id)->get();
        return response()->json(["result"=>true, "data" =>$attribut_values]);
    }

    

    public function destroySubCate(Category $category,Request $request,$id){

        $category = Category::find($id);
        $category->delete();
        return $category;
    }


    public function storeAttributes(Request $request,$id){

        // return $request;
        $attr = (array) $request->attribute;

        
        $attr['show_type'] =  isset($attr['show_type']) ?  $attr['show_type'] : 'detail';
        $attr['filter_type'] =  isset($attr['filter_type']) ?  $attr['filter_type'] : 'text';

    
        $category = Category::find($id);
        $objValues = array();

        if (isset($attr['values'])) {
        $values = $attr['values'];

        foreach($values as $val){
            array_push($objValues, new AttributeValue(["value"=>$val]));
        }
        unset($attr['values']);
        $attribute = new Attribute($attr);
        $savedAttr = $category->attributes()->save($attribute);
        $savedAttr->attributeValues()->saveMany($objValues); 
        }else{
            $attribute = new Attribute($attr);
           $savedAttr = $category->attributes()->save($attribute);
        }
        return response()->json(["result" => true, "data" => Attribute::where('id',$attribute->id)->with('attributeValues')->first()]);
        // //  ///
    }

    public function getTopCategory(Request $request){
        
        return response()->json([
            "result" => true,
            "data" => Category::withCount('products')
                ->having('products_count', '>', 0)
                ->take(4)
                ->get(),
        ]);
    }

    public function updateFeatured(Request $request, $id){

        $category = Category::find($id);
        $category->featured = $request->featured;
        $category->save();
        return $category;
    }


    public function getFeatured(){
        return response()->json(["result" => true, "data" =>  Category::where('featured','true')->get()]);
    }

    public function getSubCategory(Request $request,$id){

        return response()->json(["result" => true, "data" =>  Category::where('parent_id',$id)->get()]);
    }
}
