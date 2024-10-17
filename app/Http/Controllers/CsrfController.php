<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class CsrfController extends Controller
{
    function get_csrf(Request $request){

      return response()->json(['csrfToken' => csrf_token()]);
    }
}
