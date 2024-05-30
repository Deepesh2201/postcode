<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Country;

class CountryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $data = $request->all();

        $result = Country::updateOrCreate(['id' => $request->id], $data);

        $message = __('message.update_form',[ 'form' => __('message.country') ] );
		if($result->wasRecentlyCreated){
			$message = __('message.save_form',[ 'form' => __('message.country') ] );
		}

        if($request->is('api/*')) {
            return json_message_response($message);
		}
    }
    public function storeweb(Request $request)
{
    $data = $request->all();
    
    // Map 'country' to 'name'
    $data['name'] = $request->input('country');
    unset($data['country']); // Remove the 'country' key from the data array
    
    $result = Country::updateOrCreate(['id' => $request->id], $data);
    
    // Redirect to the admin country page
    return redirect()->to(url('admin/country'));
}
    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $country = Country::find($id);
        $message = __('message.msg_fail_to_delete',['item' => __('message.country')] );
        
        if($country != '') {
            $country->delete();
            $message = __('message.msg_deleted',['name' => __('message.country')] );
        }
        if(request()->is('api/*')){
            return json_custom_response(['message'=> $message , 'status' => true]);
        }
    }
    public function destroyweb($id)
    {
        $country = Country::find($id);
        $message = __('message.msg_fail_to_delete',['item' => __('message.country')] );
        
        if($country != '') {
            $country->delete();
            $message = __('message.msg_deleted',['name' => __('message.country')] );
        }
        return redirect()->to(url('admin/country'));
    }

    public function action(Request $request)
    {
        $id = $request->id;
        $country = Country::withTrashed()->where('id',$id)->first();
        $message = __('message.not_found_entry',['name' => __('message.country')] );
        if($request->type === 'restore'){
            $country->restore();
            $message = __('message.msg_restored',['name' => __('message.country')] );
        }

        if($request->type === 'forcedelete'){
            $country->forceDelete();
            $message = __('message.msg_forcedelete',['name' => __('message.country')] );
        }

        return json_custom_response(['message'=> $message, 'status' => true]);
    }
}
