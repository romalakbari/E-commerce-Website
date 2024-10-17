<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\StockProduct;

class PStockController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
       return response()->json(["result"=>true, "data" => StockProduct::with(['stock', 'product'])->orderBy('created_at','desc')->get()]);
    }
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        
        $request->validate(StockProduct::storeRule($request));

        $StockProduct = new StockProduct();
        $StockProduct->stock_id = $request->stock;
        $StockProduct->product_id = $request->product;
        $StockProduct->quantity = $request->quantity;
        $StockProduct->save();

        $StockProduct =StockProduct::with(['stock', 'product'])->where('id',$StockProduct->id)->first();
        return $StockProduct;

        // return response()->json(["result"=>true, "data" =>$StockProduct]);

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        return response()->json(["result"=>true, "data" => StockProduct::with(['stock', 'product'])->where('stock_id',$id)->orderBy('created_at','desc')->get()]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(StockProduct $Pstock)
    {
       $id = $Pstock->id;
        $Pstocks =StockProduct::with(['stock', 'product'])->where('id',$id)->first();
       $Pstock->delete();

        return $Pstocks;
    }
}
