<?php

namespace App\Http\Controllers\Auth;
use Mail;
use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Auth\Events\Registered;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rules;
use App\Models\Product;
use App\Models\Contact;
use App\Models\Order;
use App\Mail\SendEmail;

class RegisteredUserController extends Controller{

    /**
     * Handle an incoming registration request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     *
     * @throws \Illuminate\Validation\ValidationException
     */
    public function store(Request $request){

        $request->validate([
            'fname' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'password' => ['required'],
        ]);
        $user = User::create([
            'name' => $request->fname,
            'email' => $request->email,
            'password' => Hash::make($request->password),
        ]);
        Auth::login($user);
        return response()->noContent();
    }

    public function registerContact(Request $request){
       
       $request->validate(Contact::storeRule((array) $request));
       $sale =  Contact::create($request->all());
       return response()->json(["result"=>true]);
    }

    public function submitOrder(Request $request){
        
        $request->validate([
            'description' => ['required'],
            'email' => ['required', 'string', 'email'],
            'order_amount' => ['required'],
            'phone' => ['required']
        ]);

       $product = Product::where('id',$request->product_id)->first();
       $data['description'] = $request->input('description');
       $data['fname'] = $request->input('fname');
       $data['lname'] = $request->input('lname');
       $data['email'] = $request->input('email');
       $data['phone'] = $request->input('phone');
       $data['company'] = $request->input('company');
       $data['product'] = $product->title;
       $data['quantity'] = $product->quantity;

       $file = $request->file('image');
       $filename = null;
       if($file){
          $filename = $file->getClientOriginalName(); 
          $file->move(public_path('files/order'), $filename);
       }
       $data['image'] = $filename;

       $order = new Order();
       $order->fname = $request->fname;
       $order->lname = $request->lname;
       $order->email  = $request->email;
       $order->image = $filename;
       $order->phone = $request->phone;
       $order->company = $request->company;
       $order->description = $request->description;
       $order->product_id = $product->id;
       $order->order_quantity = $request->order_amount;
       $order->save();
       Mail::send(new SendEmail($data));
       return 4000;
    }
}



