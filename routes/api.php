<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});


//customer
Route::post('/create-customer', 'ApiController@createCustomer');
Route::post('/login', 'ApiController@customerLogin');
Route::post('/update-customer', 'CustomerController@updateCustomer');
Route::get('/edit-customer/{id}', 'CustomerController@editCustomer');

Route::post('/forget-password', 'ApiController@forgetPassword');
Route::post('/reset-password', 'ApiController@resetPassword');

//order
Route::post('/order-place', 'OrderController@order');
Route::post('/customer-address', 'OrderController@customerAddress');

//schedule
Route::get('/get-weeks', 'ApiController@getApiWeeks');
Route::get('/get-schedule/{id}', 'ApiController@getApiSchedule');

//slider
Route::get('/get-slider', 'ApiController@getApiSlider');
Route::get('/get-category/{id}', 'ApiController@getApiCategory');
Route::post('/post-address', 'ApiController@ManageAddress');
Route::post('/update-profile', 'ApiController@updateCustomer');
Route::post('/update-address', 'ApiController@updateAddress');
Route::post('/delete-address', 'ApiController@deleteAddress');
Route::get('/get-address/{id}', 'ApiController@getAddress');
Route::post('/order', 'ApiController@order');
Route::get('/get-order/{id}', 'ApiController@getOrder');
Route::get('/get-order-details/{id}', 'ApiController@getOrderDetails');
Route::get('/get-address-details/{id}', 'ApiController@getAddressDetails');
Route::get('/service/{id}/{lang}', 'ApiController@service');
Route::get('/order-item/{id}', 'ApiController@orderItem');
Route::get('/order-invoice/{id}', 'ApiController@invoiceSendMail');
//Agent route
Route::get('/get-item', 'ApiController@agentItem');
Route::get('/get-service/{id}/{service}', 'ApiController@getService');
Route::get('/get-order-status/{id}', 'ApiController@getPickupOrder');
Route::get('/get-pickup-order-details/{id}', 'ApiController@getPickupOrderId');
Route::get('/get-delivery-order', 'ApiController@getDeliveryOrder');
Route::post('/agent-login', 'ApiController@agentLogin');
Route::post('/add-to-cart', 'ApiController@addTocart');
Route::post('/add-to-cart-agent', 'ApiController@addTocartAgent');
Route::get('/order-by-item/{id}', 'ApiController@orderByItem');
Route::get('/item-pickup/{id}/{payment}', 'ApiController@itemPickup');
Route::get('/item-order-status/{id}', 'ApiController@itemOrderStatus');
Route::get('/item-order-status/{id}/{payment}', 'ApiController@itemOrderDelivery');
Route::get('/item-delivery/{id}', 'ApiController@itemDelivery');

//Cart function
Route::get('/item-price-lists/{types}/{lang}', 'ApiController@addCartItemList');
Route::get('/validate-number/{id}', 'ApiController@checkMobileNumber');
Route::post('/enter-number', 'ApiController@addMobileNumber');
Route::get('/item-price-list/{types}/{id}', 'ApiController@addCartItemListAgent');


//coupon code
Route::get('/coupon-code-apply/{customer_id}/{code}', 'ApiController@couponModule');

//city area
Route::get('/city', 'ApiController@city');
Route::get('/area/{id}', 'ApiController@area');
Route::get('/notification', 'ApiController@sendNotification');

Route::post('/agent-token-update', 'ApiController@agentTokenUpdate');
Route::post('/clear-cart', 'ApiController@clearCart');