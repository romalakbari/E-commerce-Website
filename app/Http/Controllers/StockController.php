<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Stock;
use App\Models\Country;
use App\Models\State;
use App\Models\City;

class StockController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request){

        if(isset($request->all))
        return response()->json([
            "result" => true,
            "data" => Stock::with(['country', 'state', 'city'])->orderBy('created_at', 'desc')
                ->get()
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

        $request->validate(Stock::storeRule($request));
        $stock = new Stock();
        $stock->country_id = $request->country;
        $stock->state_id = $request->state;
        $stock->city_id = $request->city;
        $stock->stock_name = $request->stock_name;
        $stock->address = $request->address;
        $stock->save();
        $stocks = Stock::with(['country','state','city'])->find($stock->id);
        return $stocks;
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $stock =  Stock::where('id',$id)->first();
        return $stock;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
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

        $request->validate(Stock::updateRule($request));

        $stock  = Stock::find($id);
        $stock->country_id = $request->country;
        $stock->state_id = $request->state;
        $stock->city_id = $request->city;
        $stock->stock_name = $request->stock_name;
        $stock->address = $request->address;
        $stock->save();
        return 1;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Stock $stock)
    {
        $stock->delete();
        return $stock;
    }
    public function countryState(Request $request,$id){

      return response()->json(["result"=>true, "data" => State::where('country_id',$id)->get()]); 
    }
    public function countryCity(Request $request,$id){

      return response()->json(["result"=>true, "data" => City::where('state_id',$id)->get()]); 
    }
    public function loadCountry(Request $request){
      
      return response()->json([
            "result" => true,
            "data" => Country::all()
        ]);

    }

    
    
}
