<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\StaticData;

class StaticDataController extends Controller
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

        $data['value'] = str_replace(' ', '_', strtolower($request->label));
        $result = StaticData::updateOrCreate(['id' => $request->id], $data);

        $message = __('message.update_form',[ 'form' => __('message.static_data') ] );
		if($result->wasRecentlyCreated){
			$message = __('message.save_form',[ 'form' => __('message.static_data') ] );
		}

        if($request->is('api/*')) {
            return json_message_response($message);
		}
    }

    public function storeweb(Request $request)
    {
        $data = $request->all();

        $data['value'] = str_replace(' ', '_', strtolower($request->label));
        $result = StaticData::updateOrCreate(['id' => $request->id], $data);

        $message = __('message.update_form',[ 'form' => __('message.static_data') ] );
		if($result->wasRecentlyCreated){
			$message = __('message.save_form',[ 'form' => __('message.static_data') ] );
		}

        return redirect()->to(url('admin/parceltype'));
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
        $static_data = StaticData::find($id);
        $message = __('message.msg_fail_to_delete',['item' => __('message.static_data')] );
        
        if($static_data != '') {
            $static_data->delete();
            $message = __('message.msg_deleted',['name' => __('message.static_data')] );
        }

        if(request()->is('api/*')){
            return json_custom_response(['message'=> $message, 'status' => true]);
        }
    }

    public function destroyweb($id)
    {
        $static_data = StaticData::find($id);
        $message = __('message.msg_fail_to_delete',['item' => __('message.static_data')] );
        
        if($static_data != '') {
            $static_data->delete();
            $message = __('message.msg_deleted',['name' => __('message.static_data')] );
        }

        return redirect()->to(url('admin/parceltype'));
    }
}
