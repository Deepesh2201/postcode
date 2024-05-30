<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Country;
use App\Http\Resources\API\CountryResource;

class CountryController extends Controller
{
    // for API
    public function getList(Request $request)
    {
        $country = Country::query();
        
        if( $request->has('status') && isset($request->status) )
        {
            $country = $country->where('status',request('status'));
        }

        if( $request->has('code') && isset($request->code) )
        {
            $country = $country->where('code',request('code'));
        }
        
        if( $request->has('is_deleted') && isset($request->is_deleted) && $request->is_deleted){
            $country = $country->withTrashed();
        }

        $per_page = config('constant.PER_PAGE_LIMIT');
        if( $request->has('per_page') && !empty($request->per_page)){
            if(is_numeric($request->per_page))
            {
                $per_page = $request->per_page;
            }
            if($request->per_page == -1 ){
                $per_page = $country->count();
            }
        }

        $country = $country->orderBy('name','asc')->paginate($per_page);
        $items = CountryResource::collection($country);

        $response = [
            'pagination' => json_pagination_response($items),
            'data' => $items,
        ];
        
        return json_custom_response($response);
    }

    // For web
    public function getListWeb(Request $request)
{
    $countries = Country::query();
    
    // Apply filters if provided
    if ($request->has('status') && $request->filled('status')) {
        $countries->where('status', $request->status);
    }

    if ($request->has('code') && $request->filled('code')) {
        $countries->where('code', $request->code);
    }
    
    if ($request->filled('is_deleted') && $request->is_deleted) {
        $countries->withTrashed();
    }

    // Pagination
    $perPage = config('constant.PER_PAGE_LIMIT');
    if ($request->has('per_page') && is_numeric($request->per_page) && $request->per_page != -1) {
        $perPage = $request->per_page;
    }

    $countries = $countries->orderBy('name', 'asc')->paginate($perPage);
    
    // Pass data to the view
    return view('admin.country', [
        'countries' => $countries
    ]);
}

    public function getDetail(Request $request)
    {
        $id = $request->id;
        $country = Country::where('id',$id)->withTrashed()->first();

        if(empty($country))
        {
            $message = __('message.not_found_entry',[ 'name' => __('message.country') ]);
            return json_message_response($message,400);   
        }
        
        $country_detail = new CountryResource($country);

        $response = [
            'data' => $country_detail
        ];
        
        return json_custom_response($response);
    }
}
