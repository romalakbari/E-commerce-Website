<?php

namespace App\Http\Controllers;

use App\Models\ProductDiscount;
use Illuminate\Http\Request;
use App\Traits\FileTrait;
use Illuminate\Support\Facades\Gate;
use Storage;
use DB;
use File;

class DiscountController extends Controller
{
    
     public function __construct(){
        $this->middleware(['auth:sanctum','can:isAdmin'])->only(['store']);
        $this->middleware(['auth:sanctum','can:isActiveSubscriber'])->only(['download']);
    }

    public function index(Request $request)
    {
        $discounts = ProductDiscount::orderBy('updated_at','asc')->get();
        return response()->json(["result" => true, "data" => $discounts]);
    }

    public function store(Request $request){

    	$request->validate(ProductDiscount::storeRule($request));
    	$discount = new ProductDiscount();
    	$discount->start_date = $request->start_date;
    	$discount->end_date = $request->end_date;
        $discount->description = $request->description;
    	$discount->product_id = $request->product_id;
    	$discount->discount_percentage = $request->discount;
    	$file = $request->file('file');
        $filename = $file->getClientOriginalName(); 
        $file->move(public_path('files/product/discount'), $filename);
    	$discount->file = $filename;
    	$discount->save();
    	return $discount;
    }

    public function show(Request $request,$id){

    	$discounts = ProductDiscount::where('product_id',$id)->get();
        return response()->json(["result" => true, "data" => $discounts]);
    }

    public function destryDiscount(Request $request, $id){

        $discount = ProductDiscount::find($id);
        return $discount->delete();
    }


    public function discountFeatured(Request $request,$id){

        $product = ProductDiscount::find($id);
        $product->featured = $request->featured;
        $product->save();
        return $product;
    }

    public function listDiscount(Request $request){

        $discounts = ProductDiscount::with(['product'])->where('featured','true')->get();
        return response()->json(["result" => true, "data" => $discounts]);
    }
    
}
