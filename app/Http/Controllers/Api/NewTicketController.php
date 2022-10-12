<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Ticket;
use App\Models\Customer;
use App\Http\Controllers\API\BaseController as BaseController;
use App\Models\Sale;
use Validator;

class NewTicketController extends BaseController
{
    public function createNewTicket(Request $request){

        $validator = Validator::make($request->all(), [
            'event_id' => 'required',
            't_type' => 'required',
            'no_of_tickets' => 'required',
            'costs' => 'required',
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
        $customer = new Customer();



        $customer->name = $request->c_name;
        $customer->email = $request->c_email;
        $customer->phone = $request->c_phone;
        $customer->save();

        $ticket->event_id = $request->event_id;
        $ticket->customer_id = $customer->id;
        $ticket->t_type = $request->t_type;
        $ticket->no_of_tickets = $request->no_of_tickets;
        $ticket->costs = $request->total_cost;
        $ticket->save();

        if (Sale::where('event_id', $request->event_id)->exists()) {
            $sale = Sale::find($request->event_id);
            $sale->total_sold = $sale->total_sold + $request->no_of_tickets;
            $sale->total_revenue = $sale->total_revenue + $request->total_cost;
            switch($request->t_type){
                case 0:{
                    $sale->n_sold = $sale->n_sold + $request->no_of_tickets;
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

        return response()->json([
            "message" => "Ticket created successfully"
          ], 200);
    }
}
