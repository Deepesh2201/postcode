<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\PaymentGateway;
use App\Http\Resources\API\PaymentGatewayResource;

class PaymentGatewayController extends Controller
{

    public function getList(Request $request)
    {
        $gateways = PaymentGateway::query();

        if( $request->has('status') && isset($request->status) )
        {
            $gateways = $gateways->where('status',request('status'));
        }

        $gateways = $gateways->orderBy('title','asc')->paginate(10);
        $items = PaymentGatewayResource::collection($gateways);

        $response = [
            'pagination' => json_pagination_response($items),
            'data' => $items,
        ];
        
        return json_custom_response($response);
    }
    public function getListWeb(Request $request)
    {
        $gateways = PaymentGateway::query();

        if( $request->has('status') && isset($request->status) )
        {
            $gateways = $gateways->where('status',request('status'));
        }

        $gateways = $gateways->orderBy('title','asc')->paginate(10);
        $items = PaymentGatewayResource::collection($gateways);

        return view('admin.paymentgateway',compact('items'));
    }
}
