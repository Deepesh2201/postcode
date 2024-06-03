<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Order;
use App\Models\OrderHistory;
use App\Http\Resources\API\OrderResource;
use App\Http\Resources\API\OrderDetailResource;
use App\Models\Notification;
use App\Models\Payment;
use App\Http\Resources\API\PaymentResource;
use App\Models\parcelSizeModal;
use App\Models\Postalcodes;
use App\Models\UserDesignation;
use App\Models\StaticData;
use App\Models\User;
use App\Models\Wallet;

class OrderController extends Controller
{
    public function getList(Request $request)
    {
        $order = Order::myOrder();

        if ($request->has('status') && isset($request->status)) {
            if (request('status') == 'trashed') {
                $order = $order->withTrashed();
            } else {
                $order = $order->where('status', request('status'));
            }
        };
        // $order->join('parcel_size_modals', 'parcel_size_modals.id', '=', 'orders.total_weight');
        $order->when(request('client_id'), function ($q) {
            return $q->where('client_id', request('client_id'));
        });

        $order->when(request('delivery_man_id'), function ($query) {
            return $query->whereHas('delivery_man', function ($q) {
                $q->where('delivery_man_id', request('delivery_man_id'));
            });
        });

        $order->when(request('country_id'), function ($q) {
            return $q->where('country_id', request('country_id'));
        });

        $order->when(request('city_id'), function ($q) {
            return $q->where('city_id', request('city_id'));
        });

        $order->when(request('exclude_status'), function ($q) {
            $statuses = explode(',', request('exclude_status'));
            return $q->whereNotIn('status', $statuses);
        });

        $order->when(request('statuses'), function ($q) {
            $statuses = explode(',', request('statuses'));
            return $q->whereIn('status', $statuses);
        });

        $order->when(request('today_date'), function ($q) {
            return $q->whereDate('date', request('today_date'));
        });

        if (request('from_date') != null && request('to_date') != null) {
            $order = $order->whereBetween('date', [request('from_date'), request('to_date')]);
        }
        $per_page = config('constant.PER_PAGE_LIMIT');
        if ($request->has('per_page') && !empty($request->per_page)) {
            if (is_numeric($request->per_page)) {
                $per_page = $request->per_page;
            }
            if ($request->per_page == -1) {
                $per_page = $order->count();
            }
        }

        $order = $order->orderBy('date', 'desc')->paginate($per_page);
        $items = OrderResource::collection($order);

        $user = auth()->user();
        $all_unread_count = isset($user->unreadNotifications) ? $user->unreadNotifications->count() : 0;

        $wallet_data = Wallet::where('user_id', auth()->id())->first();
        $response = [
            'pagination' => json_pagination_response($items),
            'data' => $items,
            'all_unread_count' => $all_unread_count,
            'wallet_data' => $wallet_data ?? null,
        ];

        return json_custom_response($response);
    }

    public function getListWeb(Request $request)
    {

        $order = Order::myOrder();

        if ($request->has('status') && isset($request->status)) {
            if (request('status') == 'trashed') {
                $order = $order->withTrashed();
            } else {
                $order = $order->where('status', request('status'));
            }
        };
        // $order->join('parcel_size_modals', 'parcel_size_modals.id', '=', 'orders.total_weight');
        $order->when(request('client_id'), function ($q) {
            return $q->where('client_id', request('client_id'));
        });

        $order->when(request('delivery_man_id'), function ($query) {
            return $query->whereHas('delivery_man', function ($q) {
                $q->where('delivery_man_id', request('delivery_man_id'));
            });
        });

        $order->when(request('country_id'), function ($q) {
            return $q->where('country_id', request('country_id'));
        });

        $order->when(request('city_id'), function ($q) {
            return $q->where('city_id', request('city_id'));
        });

        $order->when(request('exclude_status'), function ($q) {
            $statuses = explode(',', request('exclude_status'));
            return $q->whereNotIn('status', $statuses);
        });

        $order->when(request('statuses'), function ($q) {
            $statuses = explode(',', request('statuses'));
            return $q->whereIn('status', $statuses);
        });

        $order->when(request('today_date'), function ($q) {
            return $q->whereDate('date', request('today_date'));
        });

        if (request('from_date') != null && request('to_date') != null) {
            $order = $order->whereBetween('date', [request('from_date'), request('to_date')]);
        }
        $per_page = config('constant.PER_PAGE_LIMIT');
        if ($request->has('per_page') && !empty($request->per_page)) {
            if (is_numeric($request->per_page)) {
                $per_page = $request->per_page;
            }
            if ($request->per_page == -1) {
                $per_page = $order->count();
            }
        }

        $order = $order->orderBy('date', 'desc')->paginate($per_page);
        $items = OrderResource::collection($order);

        $user = auth()->user();
        $all_unread_count = isset($user->unreadNotifications) ? $user->unreadNotifications->count() : 0;

        $wallet_data = Wallet::where('user_id', auth()->id())->first();
        $response = [
            'pagination' => json_pagination_response($items),
            'data' => $items,
            'all_unread_count' => $all_unread_count,
            'wallet_data' => $wallet_data ?? null,
        ];
        $userType = session('user')['user_type'];

        $ordersQuery = Order::query();

        if ($userType != 'admin') {
            $ordersQuery->where('client_id', session('user')['id']);
        }

        $userType = session('user')['user_type'];

        $ordersQuery = Order::query()
            ->leftjoin('users as customers', function ($join) {
                $join->on('customers.id', '=', 'orders.client_id')
                    ->where('customers.user_type', '=', 'client');
            })
            ->leftJoin('users as delivery_partners', function ($join) {
                $join->on('delivery_partners.id', '=', 'orders.delivery_man_id')
                    ->where('delivery_partners.user_type', '=', 'delivery_man');
            })
            ->select(
                'orders.*',
                'customers.name as customer_name',
                'delivery_partners.name as delivery_person_name'
            );

        if ($userType !== 'admin') {
            $ordersQuery->where('orders.client_id', session('user')['id']);
        }

        $orders = $ordersQuery->get();

        // dd($orders);

        $drivers = User::select('*')->where('user_type', 'delivery_man')->where('status', 1)->get();
        // dd($items);
        // return json_custom_response($response);
        return view('admin.orders', compact('items', 'wallet_data', 'orders', 'drivers'));
    }

    public function orderserarchweb(Request $request)
    {
        $order = Order::myOrder();

        if ($request->has('status') && isset($request->status)) {
            if (request('status') == 'trashed') {
                $order = $order->withTrashed();
            } else {
                $order = $order->where('status', request('status'));
            }
        };
        // $order->join('parcel_size_modals', 'parcel_size_modals.id', '=', 'orders.total_weight');
        $order->when(request('client_id'), function ($q) {
            return $q->where('client_id', request('client_id'));
        });

        $order->when(request('delivery_man_id'), function ($query) {
            return $query->whereHas('delivery_man', function ($q) {
                $q->where('delivery_man_id', request('delivery_man_id'));
            });
        });

        $order->when(request('country_id'), function ($q) {
            return $q->where('country_id', request('country_id'));
        });

        $order->when(request('city_id'), function ($q) {
            return $q->where('city_id', request('city_id'));
        });

        $order->when(request('exclude_status'), function ($q) {
            $statuses = explode(',', request('exclude_status'));
            return $q->whereNotIn('status', $statuses);
        });

        $order->when(request('statuses'), function ($q) {
            $statuses = explode(',', request('statuses'));
            return $q->whereIn('status', $statuses);
        });

        $order->when(request('today_date'), function ($q) {
            return $q->whereDate('date', request('today_date'));
        });

        if (request('from_date') != null && request('to_date') != null) {
            $order = $order->whereBetween('date', [request('from_date'), request('to_date')]);
        }
        $per_page = config('constant.PER_PAGE_LIMIT');
        if ($request->has('per_page') && !empty($request->per_page)) {
            if (is_numeric($request->per_page)) {
                $per_page = $request->per_page;
            }
            if ($request->per_page == -1) {
                $per_page = $order->count();
            }
        }

        $order = $order->orderBy('date', 'desc')->paginate($per_page);
        $items = OrderResource::collection($order);

        $user = auth()->user();
        $all_unread_count = isset($user->unreadNotifications) ? $user->unreadNotifications->count() : 0;

        $wallet_data = Wallet::where('user_id', auth()->id())->first();
        $response = [
            'pagination' => json_pagination_response($items),
            'data' => $items,
            'all_unread_count' => $all_unread_count,
            'wallet_data' => $wallet_data ?? null,
        ];
        $userType = session('user')['user_type'];

        $ordersQuery = Order::query();

        if ($userType != 'admin') {
            $ordersQuery->where('client_id', session('user')['id']);
        }

        $ordersQuery = Order::query();

        // Check if the user is an admin
        if (session('user')['user_type'] == 'admin') {
            // Show all orders
            $ordersQuery->join('users as customers', 'customers.id', '=', 'orders.client_id')
                ->leftJoin('users as delivery_partners', 'delivery_partners.id', '=', 'orders.delivery_man_id')
                ->where('orders.id', 'like', '%' . $request->searchdata . '%') // Filter orders by order ID
                ->select(
                    'orders.*',
                    'customers.name as customer_name',
                    'delivery_partners.name as delivery_person_name'
                );
        } else {
            // Show orders for the current user only
            $ordersQuery->join('users as customers', 'customers.id', '=', 'orders.client_id')
                ->leftJoin('users as delivery_partners', 'delivery_partners.id', '=', 'orders.delivery_man_id')
                ->where('orders.client_id', '=', session('user')['id']) // Filter orders by current user's client ID
                ->where('orders.id', 'like', '%' . $request->searchdata . '%') // Filter orders by order ID
                ->select(
                    'orders.*',
                    'customers.name as customer_name',
                    'delivery_partners.name as delivery_person_name'
                );
        }

        // Execute the query
        $orders = $ordersQuery->get();


        $drivers = User::select('*')->where('user_type', 'delivery_man')->where('status', 1)->get();
        // dd($items);
        // return json_custom_response($response);
        return view('admin.orders', compact('items', 'wallet_data', 'orders', 'drivers'));
    }
    public function createOrderWeb()
    {

        $parceltypes = StaticData::select('*')->get();
        $customers = User::select('*')->where('user_type', 'client')->where('status', 1)->get();
        $designations = UserDesignation::select('*')->get();
        return view('admin.createorder', compact('parceltypes', 'customers','designations'));
    }
    public function saveOrderWeb(Request $request)
    {

        $requestData = $request->all();
        // dd($requestData);
        $order = new Order();
        // $order->fill($requestData);
        $order->client_id = $request->client_id;
        $order->pi_company_name = $request->pi_company_name;
        $order->pi_department_name = $request->pi_department;
        $order->pi_first_name = $request->pi_first_name;
        $order->pi_last_name = $request->pi_last_name;
        $order->pickup_point = $request->pickup_point;
        $order->pickup_address = $request->pickup_address;
        $order->pickup_contact = $request->pickup_contact;
        $order->pickup_instructions = $request->pickup_instructions;
        $order->di_company_name = $request->di_company_name;
        $order->di_department_name = $request->di_department;
        $order->di_first_name = $request->di_first_name;
        $order->di_last_name = $request->di_last_name;
        $order->delivery_point = $request->delivery_point;
        $order->delivery_address = $request->delivery_address;
        $order->delivery_contact = $request->delivery_contact;
        $order->delivery_instructions = $request->delivery_instructions;
        $order->parcel_type = $request->parcel_type;
        $order->total_weight = $request->total_weight;
        $order->total_parcel = $request->total_parcel;
        $order->distance_charge = $request->distance_charge; // Total shipment cost based on distance
        $order->total_amount = $request->distance_charge; //Total Cost of delivery including all
        $order->total_parcel = $request->total_parcel;
        $order->oder_type = 0;
        $order->status = 1;
        $order->save();

        if ($order) {
            return redirect()->to(url('admin/orders'));
        } else {
            return redirect()->to(url('admin/orders'))->with('error', 'order not created');
        }
    }

    public function viewOrderWeb($id)
    {
        $orderData = Order::select('*')->where('id', $id)->first();

        $parceltypes = StaticData::select('*')->get();
        $customers = User::select('*')->where('user_type', 'client')->where('status', 1)->get();
        return view('admin.vieworder', compact('parceltypes', 'customers', 'orderData'));
    }

    public function assigndriver(Request $request)
    {
        $order = Order::find($request->orderid);
        $order->delivery_man_id = $request->driverid;
        $updated = $order->save(); // Save the changes and store the result in a variable

        if ($updated) {
            return "success"; // Data updated successfully
        } else {
            return "failed"; // Data update failed
        }
    }
    public function getDetail(Request $request)
    {
        $id = $request->id;
        // $order = Order::where('id',$id)->withTrashed()->first();
        $order = Order::Select('parcel_size_modals.name as parcel_size', 'parcel_size_modals.rate as parcel_rate', 'orders.*')
            ->join('parcel_size_modals', 'parcel_size_modals.id', '=', 'orders.total_weight')
            ->where('orders.id', $id)->withTrashed()->first();

        // echo $order;
        // dd();
        if ($order == null) {
            return json_message_response(__('message.not_found_entry', ['name' => __('message.order')]), 400);
        }
        $order_detail = new OrderDetailResource($order);

        $order_history = optional($order)->orderHistory;

        $payment = Payment::where('order_id', $id)->first();

        // $parcelsize = parcelSizeModal::where('id',$order->total_weight)->first();
        if ($payment != null) {
            $payment = new PaymentResource($payment);
        }
        $current_user = auth()->user();
        // if(count($current_user->unreadNotifications) > 0 ) {
        //     $current_user->unreadNotifications->where('data.id',$id)->markAsRead();
        // }

        $response = [
            'data' => $order_detail,
            'payment' => $payment ?? null,
            // 'parcelsize' => $parcelsize,
            'order_history' => $order_history
        ];
        return $response;

        return json_custom_response($response);
    }

    public function calculatecharge(Request $request)
    {
        $code1 = $request->code1;
        $code2 = $request->code2;
        // Trim spaces before and after
        $trimmedCode1 = trim($code1);
        $trimmedCode2 = trim($code2);
        // Extract the first two characters
        $pcode1 = substr($trimmedCode1, 0, 2);
        $pcode2 = substr($trimmedCode2, 0, 2);

        // $charges = Postalcodes::select('*')->where('code1',$pcode1)->where('code2',$pcode2)->first();
        $charges = Postalcodes::whereRaw('SUBSTRING(code1, 1, 2) = ? AND SUBSTRING(code2, 1, 2) = ?', [$pcode1, $pcode2])->first();
        $response = [
            'data' => $charges->charge
        ];
        return $charges->charge;

        // return json_custom_response($response);
    }
}
