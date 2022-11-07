<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\Api\EventDataController;
use App\Http\Controllers\Api\NewEventController;
use App\Http\Controllers\Api\NewTicketController;
use App\Http\Controllers\Api\ReportsController;
use App\Http\Controllers\CategoryController;
use Illuminate\Auth\Events\Login;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('/', function(){
    return;
});

Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);

Route::middleware('auth:sanctum')->group(function () {
    Route::get('/me', [AuthController::class, 'me']);



    Route::post('/createnewticket', 'Api\NewTicketController@createNewTicket');

    Route::put('/createnewevent', 'Api\NewEventController@createNewEvent');

    Route::patch('/editevent/{id}', 'Api\NewEventController@editEvent');
   // Route::post('/editeventalt', 'Api\NewEventController@editEventAlt');
    Route::delete('/deleteevent/{id}', 'Api\NewEventController@deleteEvent');

    Route::get('/getcategory', 'CategoryController@index');
    Route::get('/getcategory/{id}', 'CategoryController@show');
    Route::put('/addcategory', 'CategoryController@create');
    Route::patch('/editcategory', 'CategoryController@edit');
    Route::delete('/deletecategory', 'CategoryController@destroy');

    Route::get('/getevents', 'Api\EventDataController@getAllEvents');
    Route::post('/searchevents', 'Api\EventDataController@searchEvent');
//    Route::patch('/getevents', 'Api\EventDataController@getAllEvents');

    Route::get('/geteventfromcategory/{id}', 'Api\EventDataController@getEventFromCategory');
    Route::get('/gettrendingevents', 'Api\EventDataController@getTrendingEvents');
    Route::get('/geteventdata/{id}', 'Api\EventDataController@getEventData');

    
    Route::get('/getsalesoverview', 'Api\ReportsController@getSalesOverview');
    Route::get('/getsalesdetails', 'Api\ReportsController@getSalesDetails');

    
});