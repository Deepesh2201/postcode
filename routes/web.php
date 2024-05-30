<?php

use Illuminate\Foundation\Application;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;
use Illuminate\Support\Facades\Storage;
use Illuminate\Http\Request;
use App\Http\Controllers;
use App\Http\Controllers\API;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Route::get('/', function () {
//     return Inertia::render('Welcome', [
//         'canLogin' => Route::has('login'),
//         'canRegister' => Route::has('register'),
//         'laravelVersion' => Application::VERSION,
//         'phpVersion' => PHP_VERSION,
//     ]);
// })->name('home');

// Route::middleware(['auth:sanctum', 'verified'])->get('/dashboard', function () {
//     return Inertia::render('Dashboard');
// })->name('dashboard');

// Route::get('/storage-link-exist', function () {
//     return config('filesystems.links');
// });

// Landing page redirection
Route::get('/', function () {
    return view('admin.login');
});

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('register', [API\UserController::class, 'register']);
Route::post('update-mobile', [API\UserController::class, 'update_mobile']);
Route::post('login', [API\UserController::class, 'login']);

Route::post('forget-password', [API\UserController::class, 'forgetPassword']);
Route::post('social-login', [API\UserController::class, 'socialLogin']);
Route::get('user-list', [API\UserController::class, 'userList']);
Route::get('staticdata-list', [API\StaticDataController::class, 'getList']);


Route::get('user-detail', [API\UserController::class, 'userDetail']);

Route::get('country-detail', [API\CountryController::class, 'getDetail']);
Route::get('city-detail', [API\CityController::class, 'getDetail']);
Route::get('extracharge-list', [API\ExtraChargeController::class, 'getList']);
Route::get('paymentgateway-list', [API\PaymentGatewayController::class, 'getList']);
Route::get('vehicle-list', [API\VehicleController::class, 'getList']);
Route::post('calculatecharge', [API\OrderController::class, 'calculatecharge']);

Route::get('/orders/last-week', [API\UserController::class, 'lastWeekOrders']);

Route::get('dashboard-detail', [API\UserController::class, 'dashboard']);
// Route::middleware('auth.check')->group(function () {
Route::prefix('admin/')->group(function () {
    Route::post('registerWeb', [API\UserController::class, 'registerWeb']);
    Route::post('registerDriverWeb', [API\UserController::class, 'registerDriverWeb']);
    Route::get('editUserWeb/{id}', [API\UserController::class, 'editUserWeb']);
    Route::get('dashboard', [API\UserController::class, 'dashboardweb']);
    Route::get('country', [API\CountryController::class, 'getListWeb']);
    Route::get('parceltype', [API\StaticDataController::class, 'getListWeb']);
    Route::get('editParcelTypeWeb/{id}', [API\StaticDataController::class, 'editParcelTypeWeb']);
    Route::get('login', [API\UserController::class, 'loginshow']);
    Route::post('login', [API\UserController::class, 'loginweb']);
    Route::get('city', [API\CityController::class, 'getListWeb']);
    Route::get('zones', [API\CityController::class, 'getZonesWeb']);
    Route::get('postalcodes', [API\CityController::class, 'getPostalCodesWeb']);
    Route::get('editpostalcodes/{id}', [API\CityController::class, 'editPostalCodesWeb']);
    Route::post('postalcodesave', [API\CityController::class, 'postalcodesave']);
    Route::post('postalcodesave', [API\CityController::class, 'postalcodesave']);
    Route::get('extracharges', [API\ExtraChargeController::class, 'getListWeb']);
    Route::get('paymentgateway', [API\PaymentGatewayController::class, 'getListWeb']);
    Route::get('vehicle', [API\VehicleController::class, 'getListWeb']);
    Route::get('countrydelete/{id}', [App\Http\Controllers\CountryController::class, 'destroyweb']);
    Route::post('citysave', [App\Http\Controllers\CityController::class, 'storeweb']);
    Route::get('citydelete/{id}', [App\Http\Controllers\CityController::class, 'destroyweb']);
    Route::post('extrachargesave', [App\Http\Controllers\ExtraChargeController::class, 'storeweb']);
    Route::post('staticdatasave', [App\Http\Controllers\StaticDataController::class, 'storeweb']);
    Route::get('extrachargedelete/{id}', [App\Http\Controllers\ExtraChargeController::class, 'destroyweb']);
    Route::get('orders', [API\OrderController::class, 'getListWeb']);
    Route::get('orderserarchweb', [API\OrderController::class, 'orderserarchweb']);
    Route::get('createorder', [API\OrderController::class, 'createOrderWeb']);
    Route::post('saveOrderWeb', [API\OrderController::class, 'saveOrderWeb']);
    Route::get('order/{id}', [API\OrderController::class, 'viewOrderWeb']);
    Route::post('assigndriver', [API\OrderController::class, 'assigndriver']);
    Route::get('staticdatadelete/{id}', [App\Http\Controllers\StaticDataController::class, 'destroyweb']);
    Route::post('vehiclesave', [App\Http\Controllers\VehicleController::class, 'storeweb']);
    Route::get('editVehicleWeb/{id}', [App\Http\Controllers\VehicleController::class, 'editVehicleWeb']);
    Route::get('vehicledelete/{id}', [App\Http\Controllers\VehicleController::class, 'destroyweb']);
    Route::get('documents', [API\DocumentController::class, 'getListWeb']);
    Route::get('editDocumentTypeWeb/{id}', [API\DocumentController::class, 'editDocumentTypeWeb']);
    Route::post('documentsave', [App\Http\Controllers\DocumentController::class, 'storeweb']);
    Route::get('documentdelete/{id}', [App\Http\Controllers\DocumentController::class, 'destroyweb']);
    Route::post('document-action', [App\Http\Controllers\DocumentController::class, 'action']);
    Route::get('delivery-man-document-list', [API\DeliveryManDocumentController::class, 'getList']);
    Route::post('delivery-man-document-save', [App\Http\Controllers\DeliveryManDocumentController::class, 'store']);
    Route::post('delivery-man-document-delete/{id}', [App\Http\Controllers\DeliveryManDocumentController::class, 'destroy']);
    Route::post('delivery-man-document-action', [App\Http\Controllers\DeliveryManDocumentController::class, 'action']);
    Route::get('users', [API\UserController::class, 'userListWeb']);
    Route::get('drivers', [API\UserController::class, 'userListWebDrivers']);
    Route::get('logout', [API\UserController::class, 'logoutweb']);

    // });
});



// Route::group(['middleware' => ['auth:sanctum']], function () {
Route::get('dashboard-chartdata', [API\UserController::class, 'dashboardChartData']);
Route::post('country-save', [App\Http\Controllers\CountryController::class, 'store']);
Route::post('countrysave', [App\Http\Controllers\CountryController::class, 'storeweb']);
Route::post('country-delete/{id}', [App\Http\Controllers\CountryController::class, 'destroy']);
Route::post('country-action', [App\Http\Controllers\CountryController::class, 'action']);

Route::post('city-save', [App\Http\Controllers\CityController::class, 'store']);
Route::post('city-delete/{id}', [App\Http\Controllers\CityController::class, 'destroy']);
Route::post('city-action', [App\Http\Controllers\CityController::class, 'action']);

Route::post('extracharge-save', [App\Http\Controllers\ExtraChargeController::class, 'store']);

Route::post('extracharge-delete/{id}', [App\Http\Controllers\ExtraChargeController::class, 'destroy']);
Route::post('extracharge-action', [App\Http\Controllers\ExtraChargeController::class, 'action']);

Route::post('staticdata-save', [App\Http\Controllers\StaticDataController::class, 'store']);
Route::post('staticdata-delete/{id}', [App\Http\Controllers\StaticDataController::class, 'destroy']);

Route::get('order-list', [API\OrderController::class, 'getList']);
Route::get('order-detail', [API\OrderController::class, 'getDetail']);
Route::post('order-save', [App\Http\Controllers\OrderController::class, 'store']);
Route::post('order-update/{id}', [App\Http\Controllers\OrderController::class, 'update']);
Route::post('order-delete/{id}', [App\Http\Controllers\OrderController::class, 'destroy']);
Route::post('order-action', [App\Http\Controllers\OrderController::class, 'action']);

Route::post('paymentgateway-save', [App\Http\Controllers\PaymentGatewayController::class, 'store']);

Route::post('payment-save', [API\PaymentController::class, 'paymentSave']);
Route::get('payment-list', [API\PaymentController::class, 'getList']);

Route::post('save-wallet', [API\WalletController::class, 'saveWallet']);
Route::get('wallet-list', [API\WalletController::class, 'getList']);

Route::get('withdrawrequest-list', [API\WithdrawRequestController::class, 'getList']);
Route::post('save-withdrawrequest', [API\WithdrawRequestController::class, 'saveWithdrawrequest']);
Route::post('approved-withdrawrequest', [API\WithdrawRequestController::class, 'approvedWithdrawRequest']);
Route::post('decline-withdrawrequest', [API\WithdrawRequestController::class, 'declineWithdrawRequest']);


Route::post('notification-list', [API\NotificationController::class, 'getList']);
Route::get('notification-count', [API\NotificationController::class, 'notificationCounts']);

Route::post('update-user-status', [API\UserController::class, 'updateUserStatus']);
Route::post('change-password', [API\UserController::class, 'changePassword']);
Route::post('update-profile', [API\UserController::class, 'updateProfile']);
Route::post('delete-user', [API\UserController::class, 'deleteUser']);
Route::post('user-action', [API\UserController::class, 'userAction']);

Route::post('update-appsetting', [API\UserController::class, 'updateAppSetting']);
Route::get('get-appsetting', [API\UserController::class, 'getAppSetting']);

Route::get('document-list', [API\DocumentController::class, 'getList']);

Route::post('document-save', [App\Http\Controllers\DocumentController::class, 'store']);
Route::post('document-delete/{id}', [App\Http\Controllers\DocumentController::class, 'destroy']);
Route::post('document-action', [App\Http\Controllers\DocumentController::class, 'action']);

Route::get('delivery-man-document-list', [API\DeliveryManDocumentController::class, 'getList']);
Route::post('delivery-man-document-save', [App\Http\Controllers\DeliveryManDocumentController::class, 'store']);
Route::post('delivery-man-document-delete/{id}', [App\Http\Controllers\DeliveryManDocumentController::class, 'destroy']);
Route::post('delivery-man-document-action', [App\Http\Controllers\DeliveryManDocumentController::class, 'action']);

Route::post('order-auto-assign', [App\Http\Controllers\OrderController::class, 'AutoAssignCancelOrder']);

Route::get('place-autocomplete-api', [API\CommonController::class, 'placeAutoComplete']);
Route::get('place-detail-api', [API\CommonController::class, 'placeDetail']);

Route::get('logout', [API\UserController::class, 'logout']);
Route::get('wallet-detail', [API\WalletController::class, 'getWallatDetail']);

Route::get('client-dashboard', [API\DashboardController::class, 'clientDashboard']);
Route::get('deliveryman-earning-list', [API\PaymentController::class, 'getDeliveryManEarningList']);

Route::get('user-profile-detail', [API\UserController::class, 'commonUserDetail']);


Route::post('vehicle-save', [App\Http\Controllers\VehicleController::class, 'store']);

Route::post('vehicle-delete/{id}', [App\Http\Controllers\VehicleController::class, 'destroy']);
Route::post('vehicle-action', [App\Http\Controllers\VehicleController::class, 'action']);

Route::post('save-setting', [API\CommonController::class, 'saveSetting']);
Route::get('get-setting', [API\CommonController::class, 'getSetting']);
    
// });