<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Api\BaseController as BaseController;
use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use App\Models\Cost;
use App\Models\Event;
use App\Models\Sale;
use App\Models\Ticket;
use Illuminate\Support\Facades\Auth;
use SebastianBergmann\Environment\Console;
use Validator;
class NewEventController extends BaseController
{

    public function createNewEvent(Request $request){
        $user = Auth::user();
        if ($user['is_admin'] == '0') {
            return $this->handleError([
                'message' => 'Unauthorized'], '401',401);
        }

        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'category_id' => 'required',
            'organizer' => 'required',
            'location' => 'required',
            'date' => 'required|date',
            'description' => 'required',
            'duration' => 'required',
            'image_url' => 'required',
            'price' => 'required',
            'type' => 'required'
        ]);
        if($validator->fails()){
            return $this->handleError($validator->errors(), null, 401);
        }

        $event = new Event();
        $cost = new Cost();
        $sale = new Sale();

        $event->name = $request->name;
        $event->category_id = $request->category_id;
        $event->organizer = $request->organizer;
        $event->location = $request->location;
        $event->date = $request->date;
        $event->description = $request->description;
        $event->duration = $request->duration;
        $event->image_title = $request->image_url;
        $event->save();

        $sale->event_id = $event->id;
        $sale->n_sold = 0;
        $sale->s_sold = 0;
        $sale->g_sold = 0;
        $sale->p_sold = 0;
        $sale->total_sold = 0;
        $sale->total_revenue = 0;
        $sale->save();

        $cost->event_id = $event->id;
        $cost->t_type = $request->type;
        $cost->normal = $request->price;
        $cost->silver = 0;
        $cost->gold = 0;
        $cost->platinum = 0;
        $cost->save();
        return $this->handleResponse(([
            $event
        ]), 'Event successfully created' );

    }

    public function editEvent(Request $request, $id){
        $user = Auth::user();
        if ($user['is_admin'] == '0') {
            return $this->handleError([
                'message' => 'Unauthorized'], '401',401);
        }
        if (Event::where('id', $id)->exists()) {
            $event = Event::find($id);

            $event->date = is_null($request->date) ? $event->date : $request->date;
            $event->description = is_null($request->description) ? $event->description : $request->description;
            $event->duration = is_null($request->duration) ? $event->duration : $request->duration;
            $event->location = is_null($request->location) ? $event->location : $request->location;
            $event->image_title = is_null($request->e_image_url) ? $event->image_title : $request->e_image_url;
            $event->organizer = is_null($request->e_organizer) ? $event->organizer : $request->e_organizer;
            $event->save();

            return $this->handleResponse(([
                $event
            ]), 'Event updated successfully' );

        }
        else{
            return $this->handleError([
                'message' => 'Event not found'], '401',401);
        }
    }

    public function editEventAlt(Request $request){
        $user = Auth::user();
        if ($user['is_admin'] == '0') {
            return $this->handleError([
                'message' => 'Unauthorized'], '401',401);
        }
        if (Event::where('id', $request->id)->exists()) {
            $event = Event::find($request->id);

            echo $request;
            $event->date = is_null($request->e_date) ? $event->date : $request->e_date;
            $event->description = is_null($request->e_desc) ? $event->description : $request->e_desc;
            $event->duration = is_null($request->e_duration) ? $event->duration : $request->e_duration;
            $event->location = is_null($request->e_location) ? $event->location : $request->e_location;
            $event->image_title = is_null($request->e_image_url) ? $event->image_title : $request->e_image_url;
            $event->organizer = is_null($request->e_organizer) ? $event->organizer : $request->e_organizer;
            $event->save();

            return response()->json([
                "message" => "records updated successfully"
              ], 200);
        }
        else{
            return response()->json([
                "message" => "Event not found"
              ], 404);
        }
    }

    public function deleteEvent($id){
        $user = Auth::user();
        if ($user['is_admin'] == '0') {
            return $this->handleError([
                'message' => 'Unauthorized'], '401',401);
        }
        if (Event::where('id', $id)->exists()) {
            $event = Event::find($id);
            $ticket = Ticket::where('event_id', $id)->get();
            $sale = Sale::where('event_id', $id)->get();
            $cost = Cost::where('event_id', $id)->get();

            foreach($ticket as $t){
                $t->delete();
            }

            foreach($sale as $s){
                $s->delete();
            }

            foreach($cost as $c){
                $c->delete();
            }

            $event->delete();

            return $this->handleResponse(([
                $event
            ]), 'Event deleted successfully' );
        } else {
            return $this->handleError([
                'message' => 'Event not found'], '401',401);
        }


    }
}
