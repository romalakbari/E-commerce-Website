<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\ProductAttribute;
use App\Models\Attribute;
use App\Models\Tag;
use Illuminate\Http\Request;
use App\Traits\FileTrait;
use App\Models\AppFile;
use App\Models\StockProduct;
use Storage;
use File;

class ProductController extends Controller
{
    use FileTrait;

    public function __construct(){
        $this->middleware(['auth:sanctum','can:isAdmin'])->only(['store','storeFile','deleteFile','storeAttributes']);
        $this->middleware(['auth:sanctum','can:isActiveSubscriber'])->only(['download']);
    }

    public function index(Request $request)
    {
       return response()->json(["result"=>true, "data" => StockProduct::with(['product.category','product.previewFiles'])->orderBy('created_at','desc')->get()]);

       // return response()->json(["result"=>true, "data" => Product::with(['category','previewFiles'])->withoutTrashed()->orderBy('created_at','desc')->get()]);
    }


    public function fetchProduct(Request $request){

        $productIds = StockProduct::pluck('product_id'); // Get all product IDs from StockProduct

        $products = Product::with(['category', 'previewFiles'])
            ->whereIn('id', $productIds) // Fetch products that are in StockProduct
            ->orderBy('created_at', 'desc')
            ->paginate(30);
        return response()->json([
            "result" => true,
            "data" => $products
        ]);


    }

    public function productLists(Request $request){

        return response()->json(["result"=>true, "data" => 
            Product::with(['productAttributes.attribute','previewFiles','downloadableFiles','category.attributes.attributeValues','discount'])->orderBy('created_at','desc')->get()]);

    }

    

    public function store(Request $request){
        
        $request->validate(Product::storeRule($request));
        $product = new Product();
        $product->price = $request->price; 
        $product->wh_price = $request->price;  
        $product->asin = $request->asin;
        $product->title = $request->title;
        $product->category_id = $request->category_id;
        $product->sub_cat_id = $request->sub_cat_id;
        $product->description = $request->description;
        $product->about = $request->about;
        $product->save();
        return response()->json(["result"=>true, "data" => Product::with(['category'])->orderBy('created_at','desc')->get()]);
    }

     public function update(Request $request,$id){   


        $product =  Product::find($id);
        if($request->type ==='Both'){
          $product->price = $request->price;  
          $product->wh_price = $request->wh_price; 
        }
        if($request->type === 'WholeSale'){
          $product->wh_price = $request->wh_price; 
          $product->price = null;  
        }
        if($request->type === 'Retail'){
          $product->wh_price = null;
          $product->price = $request->price;  
        }
        $product->asin = $request->asin;
        $product->title = $request->title;
        $product->quantity = $request->quantity;

        $product->type = $request->type;
        $product->category_id = $request->category_id;
        $product->sub_cat_id = $request->sub_cat_id;
        $product->description = $request->description;
        $product->about = $request->about;
        $product->url = $request->url;
        $product->save();
        return $product;
    }


    public function show($id)
    {

        $product =  Product::where('id',$id)->with(['productAttributes.attribute','previewFiles','downloadableFiles','category.attributes.attributeValues','discount'])->first();

        $product['category']['parent_attributes'] = $product->category->parent ?  Attribute::with('attributeValues')->where('category_id', $product->category->parent->id)->get() : array();
       
        return $product;
    }

     public function relatedProducts(Request $request,$id){
      


    $product = Product::where('id', $id)->with(['productAttributes'])->first();

    $stockProducts = StockProduct::with(['product.category', 'product.productAttributes', 'product.previewFiles'])
        ->where('product_id', '<>', $id) // Exclude the current product by its ID
        ->whereHas('product', function ($query) use ($product) {
            $query->where('category_id', $product->category_id); // Match the category
        })
        ->take(40)
        ->get();

       return $stockProducts;
    }

    public function storeFile(Request $request, $product){



         $files = $request->file('files');
        // $products = Product::find($request->product);
        // $products->downloadableFiles->each(function ($product) {
        //     $product->delete();
        // });
        $files = $request->file('files');
         if (!is_array($files)) {
            return response()->json(['message' => 'No files provided'], 400);
        }

        $uploadedFiles = [];
        foreach ($files as $file) {

            $filename = $file->getClientOriginalName(); 
            $new_name = rand() . '.' . $file->getClientOriginalExtension();

            $file->move(public_path('files'), $new_name);
            $fileType = $this->getFileType($file->getClientOriginalExtension());

            $uploadedFiles[] = [
                "name" => $new_name,
                "url" => 'files/' . $filename,
                "product_id" => $product,
                "type" => $fileType,
            ];
        }
        AppFile::insert($uploadedFiles);
        return response()->json(['message' => 'Files uploaded successfully']);
       
    }

    private function getFileType($extension){

        $imageExtensions = ['jpg', 'jpeg', 'png', 'gif', 'bmp'];
        $documentExtensions = ['doc', 'docx', 'pdf', 'txt'];
        $videoExtensions = ['mp4', 'avi', 'mov', 'mkv','ts'];

        if (in_array($extension, $imageExtensions)) {
            return 'image';
        } elseif (in_array($extension, $documentExtensions)) {
            return 'document';
        } elseif (in_array($extension, $videoExtensions)) {
            return 'video';
        } else {
            return 'other';
        }
    }

    public function deleteFile($id){

        $appFile = AppFile::find($id);

         $filePath = public_path('files/'.$appFile->name); 
         if (file_exists($filePath)) {
             unlink($filePath);
         }
        $appFile->delete();
        return $appFile;
    }

   


    public function destroy(Product $product){

        if(count($product->files))
            return response()->json(["result" => false, "message" => "Please delete the related files first"],400);

        $product->productAttributes()->delete();
        $product->delete();
        return $product;

    }

    public function storeAttributes(Request $request,$id){

        $attributes = json_decode($request->atts);

        $product = Product::find($id);
                        
        $product->productAttributes()->delete();
        foreach ($attributes as $attr) {
            
            if (property_exists($attr, 'values')) {
                // return $attr->values;
                if (is_array($attr->values)) {
                    foreach ($attr->values as $val) {
                        $attribute = new ProductAttribute([
                            'attribute_id' => $attr->attribute_id,
                            'values' => $val,
                        ]);
                        $product->productAttributes()->save($attribute);
                    }
                } else {
                    if ($attr->attribute_id && $attr->values) {
                        $attribute = new ProductAttribute([
                            'attribute_id' => $attr->attribute_id,
                            'values' => $attr->values,
                        ]);
                        $product->productAttributes()->save($attribute);
                    }
                }
            }
        }
        return response()->json(["result" => true, "data" => $product->productAttributes]);
    }


    public function download($id){

        $path =  Product::find($id)->downloadableFiles[0];

        $url = Storage::temporaryUrl(
            $path->id . "___" . $path->name ,
            now()->addMinutes(60),
            [
                'ResponseContentType' => 'application/octet-stream',
                'ResponseContentDisposition' => 'attachment; filename='. $path->name,
            ]
        );
        return $url;
    }

    public function updateFeatured(Request $request, $id){

        $product = Product::find($id);
        $product->featured = $request->featured;
        $product->save();
        return $product;
    }

    public function getFeatured(){

       return response()->json([
            "result" => true,
            "data" => StockProduct::with(['product.previewFiles']) // Eager load the product and its preview files
                ->whereHas('product', function ($query) {
                    $query->where('featured', 'true'); // Filter only featured products
                })
                ->get()
                ->pluck('product') // Extract the products from StockProduct
                ->unique('id') // Ensure products are unique
        ]);


    }

    public function productList(Request $request){
        return response()->json(["result"=>true, "data" => Product::withoutTrashed()->orderBy('created_at','desc')->get()]);



    }
}
