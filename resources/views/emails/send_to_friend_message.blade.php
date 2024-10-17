@extends('admin.layouts.email_template')
@section('content')

    <h2 >Product</h2>
    <p>{{ $data['product'] }}</p>
    <ul style="list-style-type: none;">
        <li>Company: {{ $data['company'] }}</li>
        <li>Order Quantity: {{ $data['quantity'] }}</li>
        <li><img src="https://api.azizijobsllc.us/files/order/{{$data['image']}}" /></li>
    </ul>
    <br>
    <p>{{ $data['description'] }}</p>

@endsection
