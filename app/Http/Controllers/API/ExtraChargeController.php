<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\ExtraCharge;
use App\Http\Resources\API\ExtraChargeResource;
use App\Models\City;
use App\Models\Country;

class ExtraChargeController extends Controller
{
    public function getList(Request $request)
    {
        $extra_charge = ExtraCharge::query();
        
        if( $request->has('status') && isset($request->status) )
        {
            $extra_charge = $extra_charge->where('status',request('status'));
        }

        $extra_charge->when(request('city_id'), function ($q) {
            return $q->where('city_id', request('city_id'));
        });
        
        if( $request->has('is_deleted') && isset($request->is_deleted) && $request->is_deleted){
            $extra_charge = $extra_charge->withTrashed();
        }

        $per_page = config('constant.PER_PAGE_LIMIT');
        
        if( $request->has('per_page') && !empty($request->per_page)){
            if(is_numeric($request->per_page))
            {
                $per_page = $request->per_page;
            }
            if($request->per_page == -1 ){
                $per_page = $extra_charge->count();
            }
        }

        $extra_charge = $extra_charge->orderBy('title','asc')->paginate($per_page);
        $items = ExtraChargeResource::collection($extra_charge);

        $response = [
            'pagination' => json_pagination_response($items),
            'data' => $items,
        ];
        
        return json_custom_response($response);
    }
    public function getListWeb(Request $request)
    {
        $countries = Country::select('*')->where('status',1)->get();
        $cities = City::select('*')->where('status',1)->get();
        $items = ExtraCharge::select('extra_charges.*','countries.name as countryname','cities.name as cityname')
        ->join('countries','countries.id','extra_charges.country_id')
        ->join('cities','cities.id','extra_charges.city_id')
        ->get();
        
        return view('admin.extracharges',compact('items','countries','cities'));
    }
}
