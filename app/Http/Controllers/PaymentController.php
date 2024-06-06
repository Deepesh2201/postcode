<?php

namespace App\Http\Controllers;
use App\Models\Payment;
use App\Models\PaymentGateway;
use App\Models\User;
use App\Models\Order;
use Illuminate\Http\Request;
use Carbon\Carbon;
class PaymentController extends Controller
{
    public function payments(){
        $customers = User::select('*')->where('status',1)->where('user_type','client')->get();
        $orderAmount = Order::sum('total_amount');
        $paidAmount = Payment::sum('total_amount');
        $paymentmethods = PaymentGateway::select('*')->where('status',1)->get();
        $payments = Payment::select('payments.*','payment_gateways.title as payment_method','users.name as customer_name')
        ->join('payment_gateways','payment_gateways.id','payments.payment_type')
        ->join('users','users.id','payments.client_id')
        ->get();
        return view('admin.paymentlists',compact('payments','customers','paymentmethods','orderAmount','paidAmount'));
    }

    public function makepayment(Request $request){

        $validatedData = $request->validate([
            'client_id' => 'required|string|max:255',
            'amount' => 'required',
            'payment_method' => 'required',
            'txn_no' => 'required',
            'payment_date' => 'required',
            // 'remarks' => 'required|string|min:8|confirmed',
        ], [
            'client_id.required' => 'Please select customer',
            'amount.required' => 'Please enter amount',
            'payment_method.required' => 'Please select payment method',
            'txn_no.required' => 'Please enter transaction number',
            'payment_date.required' => 'Please select payment date',
        ]);

        $payment = new Payment();
        $payment->client_id = $request->client_id;
        $payment->total_amount = $request->amount;
        $payment->payment_type = $request->payment_method;
        $payment->txn_id = $request->txn_no;
        $payment->created_at = $request->payment_date;
        $payment->transaction_detail = $request->remarks;
        $payment->payment_status = 'paid';

        $paymentDone = $payment->save();

        // $response = [
        //     'data' => $paymentDone
        // ];

        // return json_custom_response($response);

        return redirect()->to(url('admin/payments'));
        
        
    }
    public function paymentsearch(Request $request){
        // dd($request->all());

        $client_id = $request->client_id;
        $payment_method = $request->payment_method;
        $txn_no = $request->txn_no;
        $from_date = $request->from_date;
        $to_date = $request->to_date;

        // Base query for payments
    $paymentsQuery = Payment::select('payments.*', 'payment_gateways.title as payment_method', 'users.name as customer_name')
    ->join('payment_gateways', 'payment_gateways.id', '=', 'payments.payment_type')
    ->join('users', 'users.id', '=', 'payments.client_id');

// Apply filters
if (!empty($client_id)) {
    $paymentsQuery->where('payments.client_id', $client_id);
}

if (!empty($payment_method)) {
    $paymentsQuery->where('payments.payment_type', $payment_method);
}

if (!empty($txn_no)) {
    $paymentsQuery->where('payments.txn_id', 'like', '%' . $txn_no . '%');
}

if (!empty($from_date) && !empty($to_date)) {
    $fromDate = Carbon::parse($from_date)->startOfDay();
    $toDate = Carbon::parse($to_date)->endOfDay();
    $paymentsQuery->whereBetween('payments.created_at', [$fromDate, $toDate]);
}

// Execute query
$payments = $paymentsQuery->get();

// Retrieve other required data
$customers = User::select('*')->where('status', 1)->where('user_type', 'client')->get();
$orderAmount = Order::sum('total_amount');
$paidAmount = Payment::sum('total_amount');
$paymentmethods = PaymentGateway::select('*')->where('status', 1)->get();

        return view('admin.paymentlists',compact('payments','customers','paymentmethods','orderAmount','paidAmount'));
    }
}
