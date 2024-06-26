<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\ExtraCharge;

class ExtraChargeController extends Controller
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

        $result = ExtraCharge::updateOrCreate(['id' => $request->id], $data);

        $message = __('message.update_form',[ 'form' => __('message.extra_charge') ] );
		if($result->wasRecentlyCreated){
			$message = __('message.save_form',[ 'form' => __('message.extra_charge') ] );
		}

        if($request->is('api/*')) {
            return json_message_response($message);
		}
    }

    public function storeweb(Request $request)
    {
        $data = $request->all();

        $result = ExtraCharge::updateOrCreate(['id' => $request->id], $data);

        $message = __('message.update_form',[ 'form' => __('message.extra_charge') ] );
		if($result->wasRecentlyCreated){
			$message = __('message.save_form',[ 'form' => __('message.extra_charge') ] );
		}

        return redirect()->to(url('admin/extracharges'));
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
        $extra_charge = ExtraCharge::find($id);
        $message = __('message.msg_fail_to_delete',['item' => __('message.extra_charge')] );
        
        if($extra_charge != '') {
            $extra_charge->delete();
            $message = __('message.msg_deleted',['name' => __('message.extra_charge')] );
        }
        if(request()->is('api/*')){
            return json_custom_response(['message'=> $message , 'status' => true]);
        }
    }


    public function destroyweb($id)
    {
        $extra_charge = ExtraCharge::find($id);
        $message = __('message.msg_fail_to_delete',['item' => __('message.extra_charge')] );
        
        if($extra_charge != '') {
            $extra_charge->delete();
            $message = __('message.msg_deleted',['name' => __('message.extra_charge')] );
        }
        return redirect()->to(url('admin/extracharges'));
    }
    public function action(Request $request)
    {
        $id = $request->id;
        $extra_charge = ExtraCharge::withTrashed()->where('id',$id)->first();
        $message = __('message.not_found_entry',['name' => __('message.extra_charge')] );
        if($request->type === 'restore'){
            $extra_charge->restore();
            $message = __('message.msg_restored',['name' => __('message.extra_charge')] );
        }

        if($request->type === 'forcedelete'){
            $extra_charge->forceDelete();
            $message = __('message.msg_forcedelete',['name' => __('message.extra_charge')] );
        }

        return json_custom_response(['message'=> $message, 'status' => true]);
    }
}
