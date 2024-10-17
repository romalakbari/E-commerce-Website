<?php

namespace App\Http\Controllers;

use App\Models\Order;
use App\Models\OrderDetail;
use Illuminate\Http\Request;
use Auth;
class OrderController extends Controller
{

    public function __construct(){
        $this->middleware(['auth:sanctum','can:isAdmin'])->only(['index']);
        $this->middleware(['auth:sanctum','can:isActiveSubscriber'])->only(['download']);
    }


    public function store(Request $request)
    {

       $orders = Order::with(['orderDetail.orderProduct.previewFiles','customer'])->where('status','Pending')->where('customer_id',Auth::user()->id)->get();

        return response()->json([
            "result" => true,
            "data" => $orders
        ]);
    }

    public function updateFeatured(Request $request, $id){
        $order = Order::find($id);
        if($request->featured ==="false"){
            $order->status ="Received";
            $order->save();
            return $order;  
        }
    }

}
