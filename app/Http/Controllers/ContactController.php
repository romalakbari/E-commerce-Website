<?php

namespace App\Http\Controllers;

use App\Models\Contact;
use Illuminate\Http\Request;

class ContactController extends Controller
{

    public function index()
    {
        return Contact::orderBy('created_at','desc')->get();
    }

    public function store(Request $request)
    {
        $request->validate(Contact::storeRule((array) $request));
        $sale =  Contact::create($request->all());
        return 123;
    }

    public function show(Contact $contact)
    {
        //
    }

    public function update(Request $request, Contact $contact)
    {
        //
    }

    public function destroy(Contact $contact)
    {
        //
    }
}
