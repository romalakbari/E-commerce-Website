<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Auth\Events\Registered;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Stripe\Stripe;
use Stripe\SetupIntent;
use Stripe\PaymentIntent;
use Stripe\Customer;
use Stripe\Charge;
use App\Models\BillingInfo;
use Stripe\PaymentMethod;
use Stripe\Subscription;
use App\Models\Order;
use App\Models\OrderDetail;
use DB;


class CustomerController extends Controller
{

    public function __construct(){
        $this->middleware('auth:sanctum')->only(['paymentIntent','makeSubscription','updateEmail','updatePassword']);
    }

    public function index()
    {
        return User::where('is_customer',1)->orderBy('created_at','desc')->get();
    }

    public function store(Request $request)
    {
        // $request->validate(User::storeRule($request));
        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
            'is_customer' => true
        ]);
        // event(new Registered($user));

        Auth::login($user);

        return response()->noContent();

    }

    public function updateEmail(Request $request){
        $request->validate([
            'email' => ['required', 'email', 'max:255', 'unique:users'],
        ]);
        $user = auth()->user();
        $user->email = $request->email;
        $user->save();
    }

    public function updatePassword(Request $request){
        $request->validate([
            'oldPassword' => ['required', function ($attribute, $value, $fail) {
                if (!Hash::check($value, Auth::user()->password)) {
                    $fail('Old Password didn\'t match');
                }
            }],
            'newPassword' => ['min:6','max:64','different:oldPassword'],
        ]);

        $user = Auth::user();
        $user->password = Hash::make($request->newPassword);
        $user->save();

    }

    public function destroy(Request $request, $id){

        $user = User::find($id);
        // if(count($user->subscriptions)){
        //     $user->subscriptions()->delete();
        // }
        foreach($user->subscriptions as $subscription){
            $subscription->items()->delete();
            $subscription->delete();
        }
        $user->delete();
        return $user;

    }

    public function paymentIntent(Request $request){
        
        Stripe::setApiKey(env('STRIPE_SECRET'));
        $setupIntent = SetupIntent::create();
        return $setupIntent->client_secret;
    }

  public function makeSubscription(Request $request)
   {

    Stripe::setApiKey(env('STRIPE_SECRET'));

    $paymentMethodId = $request->input('paymentMethod');
    $localStorageItems = $request->input('localStorageItems');
    $subTotal = $request->input('subTotal');
    $country = $request->input('country');
    $state = $request->input('state');
    $city = $request->input('city');
    $billingAddress = $request->input('billingAddress');
    $cardHolderName = $request->input('cardHolderName');

    $description = 'Description for the charge'; // Customize as needed
    $amount = (int)($subTotal); 
   
        // Create or retrieve 
        $customer = Customer::create([
            'payment_method' => $paymentMethodId,
            'invoice_settings' => ['default_payment_method' => $paymentMethodId],
        ]);
        $paymentIntent = PaymentIntent::create([
            'amount' => $amount,
            'currency' => 'usd',
            'payment_method' => $paymentMethodId,
            'customer' => $customer->id, 
            'confirmation_method' => 'manual', 
            'confirm' => true, 
            'description' => $description,
            'return_url' => 'https://your-site.com/complete-payment', // Replace with your return URL
        ]);


            $userId = Auth::user()->id; // Assuming the user is authenticated
            $order = new Order();
            $order->customer_id = $userId;
            $order->total_amount =$amount;
            $order->stripe_transaction_id =$paymentIntent->id;
            $order->status ='pending';
            $order->save();

            foreach ($localStorageItems as $item) {
                $orderDetails = new OrderDetail();
                $orderDetails->order_id = $order->id;
                $orderDetails->product_id = $item['product'];
                $orderDetails->quantity = $item['quantity'];
                $orderDetails->price = $item['price'];
                $orderDetails->save();
            }

            $billingInfo = new BillingInfo(); // Make sure you have the BillingInfo model set up
            $billingInfo->order_id = $order->id;
            $billingInfo->card_holder_name = $cardHolderName;
            $billingInfo->address_line1 = $billingAddress;
            $billingInfo->city = $city;
            $billingInfo->state = $state;
            $billingInfo->country = $country;
            $billingInfo->save();

        return response()->json(['success' => true,'payment processed']);
   
    }

    public function customerPprofile(Request $request){
        
        $user = User::where('id',$request->user_id)->where('is_customer',1)->first();

        $user->name = $request->name;
        $user->last_name = $request->last_name;
        $user->email = $request->email;
        $user->address = $request->address;
        $user->phone = $request->phone;
        $user->save();
        return 1;
    }

}
