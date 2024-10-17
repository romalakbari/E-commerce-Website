<?php

namespace App\Http\Controllers;

use App\Models\Subscription;
use App\Models\User;
use Illuminate\Http\Request;
use DB;

class SubscriptionController extends Controller
{
    public function cancelSubscription(Request $request){
        return User::find($request->user)->subscription($request->name)->cancel();
    }

    public function resumeSubscription(Request $request){
        return User::find($request->user)->subscription($request->name)->resume();
    }

    public function addMember(Request $request){
        $targetUser = User::where('email', $request->email)->first();

        if(!$targetUser) return response()->json(['status'=> 400 ,'message' => 'No Such Email Found, Please Create Account First']);
        if(doesActiveSubscriber($targetUser)) return response()->json(['status'=> 400 , 'message' => 'This User Already is Active Subscriber, Please contact us for details']);
        if(count(User::where('team',auth()->user()->id)->get()) >= 5) return response()->json(['status'=> 400 , 'message' => 'Reach To Limit, If you Want to Add More Member, Please Contact Us']);

        $targetUser->team = auth()->user()->id;
        $targetUser->save();
        return response()->json(['status'=> 200 , 'data'=>$targetUser->email ,'message' => 'Successfully Add Member']);
    }

    public function removeMember(Request $request){
        $targetUser =  User::where('email',$request->email)->first();
        $targetUser->team = NULL;
        $targetUser->save();
        return response()->json(['status'=> 200  ,'message' => 'Successfully Remove Member']);
    }

    public function getMembers(){
        // return User::where('team',auth()->user()->id)->get()->all()->pluck('email');
        return DB::table('users')->select('email')->where('team',auth()->user()->id)->get();
    }
}
