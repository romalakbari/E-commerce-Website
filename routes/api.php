<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\AppFileController;
use App\Http\Controllers\DiscountController;
use App\Http\Controllers\CustomerController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\StockController;
use App\Http\Controllers\PStockController;


/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
Route::middleware(['auth:sanctum'])->get('/user', function (Request $request) {
    return $request->user();
});

Route::middleware('web')->get('/csrf', [CsrfController::class, 'get_csrf']);
Route::apiResource('categories', CategoryController::class);
Route::post('categories/{id}/subCategory',[CategoryController::class,'storeSubCtegory']);
Route::post('categories/{id}',[CategoryController::class,'update']);
Route::get('subCategory/{id}',[CategoryController::class,'subCategory']);
Route::get('categoryAttr/{id}',[CategoryController::class,'catAttribute']);
Route::delete('subCategory/{id}',[CategoryController::class,'destroySubCate']);
Route::post('categories/{id}/storeAttribute',[CategoryController::class,'storeAttributes']);
Route::delete('attributes/{id}',[CategoryController::class,'destroyAttribute']);
Route::get('category/topCategory',[CategoryController::class,'getTopCategory']);
Route::post('category/{id}/featured',[CategoryController::class,'updateFeatured']);
Route::get('category/featured',[CategoryController::class,'getFeatured']);
Route::get('category/{id}',[CategoryController::class,'show']);
Route::post('filter/{id}',[CategoryController::class,'filter']);
Route::get('fetchSubCategory/{id}',[CategoryController::class,'getSubCategory']);

// customer
Route::apiResource('customers',CustomerController::class);


Route::apiResource('sales',SaleController::class);
Route::apiResource('contacts',ContactController::class);
Route::post('pay',[CustomerController::class,'paymentIntent']);
Route::post('makesubscription',[CustomerController::class,'makeSubscription']);
Route::post('customerPprofile', [CustomerController::class, 'customerPprofile']);

Route::post('updateemail',[CustomerController::class,'updateEmail']);
Route::post('updatepassword',[CustomerController::class,'updatePassword']);
// 

// proudction
Route::apiResource('products',ProductController::class);
Route::apiResource('orders',OrderController::class);
Route::post('orders/{id}/featured',[OrderController::class,'updateFeatured']);

Route::get('fetch-products',[ProductController::class,'fetchProduct']);
Route::get('product-lists',[ProductController::class,'productLists']);


Route::post('files/{product}',[ProductController::class,'storeFile'])->name('files');
Route::delete('files/{id}',[ProductController::class,'deleteFile']);

Route::delete('productList',[ProductController::class,'productList']);


Route::apiResource('appfiles',AppFileController::class);

Route::post('products/{id}/attributes',[ProductController::class,'storeAttributes']);
Route::get('products/{id}/download',[ProductController::class,'download']);
Route::get('products/{id}/related',[ProductController::class,'relatedProducts']);
Route::post('products/{id}',[ProductController::class,'update']);
Route::post('products/{id}/featured',[ProductController::class,'updateFeatured']);
Route::get('featured',[ProductController::class,'getFeatured']);
Route::get('products/{id}/related',[ProductController::class,'relatedProducts']);


// 
Route::apiResource('discounts', DiscountController::class);
Route::get('discounts/{id}',[DiscountController::class,'show']);
Route::delete('prodDiscount/{id}',[DiscountController::class,'destryDiscount']);
Route::post('discountFeatured/{id}',[DiscountController::class,'discountFeatured']);
Route::post('discount/listDiscount',[DiscountController::class,'listDiscount']);

// stock management 
Route::get('countryState/{id}',[StockController::class,'countryState']);
Route::get('countryCity/{id}',[StockController::class,'countryCity']);
Route::get('loadCountry',[StockController::class,'loadCountry']);
Route::apiResource('stocks', StockController::class);

// Route::apiResource('pstocks', PStockController::class);
Route::apiResource('pstocks', PStockController::class);




