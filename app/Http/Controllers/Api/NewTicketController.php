<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Cost;
use App\Models\Event;
use Illuminate\Http\Request;
use App\Models\Ticket;
use App\Models\Customer;
use App\Http\Controllers\API\BaseController as BaseController;
use App\Models\Sale;
use Illuminate\Support\Facades\Auth;
use Validator;

class NewTicketController extends BaseController
{
    public function createNewTicket(Request $request){

        $validator = Validator::make($request->all(), [
            'event_id' => 'required',
            't_type' => 'required',
            'no_of_tickets' => 'required',
            'total_cost' => 'required',
           // 'user_id'
//            'name' => 'required',
//            'email' => 'required|email|unique:users',
//            'password' => 'required',
//            'confirm_password' => 'required|same:password',
        ]);
        if($validator->fails()){
            return $this->handleError($validator->errors());
        }

        $ticket = new Ticket();
//        $customer = new Customer();

//
//
//        $customer->name = $request->c_name;
//        $customer->email = $request->c_email;
//        $customer->phone = $request->c_phone;
//        $customer->save();
        $user = Auth::user();

        $ticket->event_id = $request->event_id;
        $ticket->user_id = $user->id;
        $ticket->t_type = $request->t_type;
        $ticket->booking_code = substr(md5(time()), 0, 16);
        $ticket->no_of_tickets = $request->no_of_tickets;
        $event_price = Cost::where('id', $request->event_id)->sum('normal');
        $ticket->costs = $event_price;
        $ticket->save();

        if (Sale::where('event_id', $request->event_id)->exists()) {
            $sale = Sale::find($request->event_id);


            $sale->total_sold = $sale->total_sold + $request->no_of_tickets;
            $sale->total_revenue = $sale->total_revenue + $event_price;
            switch($request->t_type){
                case 0:{
                    $sale->n_sold = $sale->n_sold + $request->no_of_tickets ;
                    break;
                }
                case 1:{
                    $sale->s_sold = $sale->s_sold + $request->no_of_tickets;
                    break;
                }
                case 2:{
                    $sale->g_sold = $sale->g_sold + $request->no_of_tickets;
                    break;
                }
                case 3:{
                    $sale->p_sold = $sale->p_sold + $request->no_of_tickets;
                    break;
                }
                default:{
                    break;
                }
            }
            $sale->save();
        }
        return $this->handleResponse(([
            $ticket
        ]), 'Ticket created successfully' );

        return response()->json([

            "message" => "Ticket created successfully"
          ], 200);
    }
}
