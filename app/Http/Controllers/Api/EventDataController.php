<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Cost;
use App\Models\Event;
use App\Models\EventData;
use App\Models\Sale;
use Illuminate\Http\Request;
use App\Http\Controllers\Api\BaseController as BaseController;
class EventDataController extends BaseController
{
    public function getTrendingEvents(){
        $trending_events = array();
        $trending_list = Sale::orderBy('total_revenue', 'DESC')
        ->limit(6)
        ->get();

        foreach($trending_list as $t){
            $current_event_data = new EventData();
            $event = Event::where('id', $t->event_id)->get();
            $cost = Cost::where('event_id', $t->event_id)->get();
            $sale = Sale::where('event_id', $t->event_id)->get();

            $current_event_data->event_id = $event[0]->id;
            $current_event_data->event_name = $event[0]->name;
            $current_event_data->event_description = $event[0]->description;
            $current_event_data->event_location = $event[0]->location;
            $current_event_data->event_date = $event[0]->date;
            $current_event_data->event_organizer = $event[0]->organizer;
            $current_event_data->event_category = Category::where('id', $event[0]->category_id)->get();
            $current_event_data->event_image_url = $event[0]->image_title;
            $current_event_data->type = $cost[0]->t_type;
            $current_event_data->normal_price = $cost[0]->normal;
//            $current_event_data->silver_price = $cost[0]->silver;
//            $current_event_data->gold_price = $cost[0]->gold;
//            $current_event_data->platinum_price = $cost[0]->platinum;
            $current_event_data->total_sold = $sale[0]->total_sold;
            $current_event_data->total_revenue = $sale[0]->total_revenue;
            $trending_events[] = $current_event_data;
        }

        return response($trending_events, 200);
    }

    public function getSportsEvents(){
        $sports_events = array();
        $sports_list = Event::where('catagory', 'sports')->get();

        foreach($sports_list as $s){
            $current_event_data = new EventData();
            $cost = Cost::where('event_id', $s->id)->get();
            $sale = Sale::where('event_id', $s->id)->get();

            $current_event_data->event_id = $s->id;
            $current_event_data->e_name = $s->name;
            $current_event_data->e_desc = $s->description;
            $current_event_data->e_location = $s->location;
            $current_event_data->e_date = $s->date;
            $current_event_data->e_organizer = $s->organizer;
            $current_event_data->e_catagory = $s->catagory;
            $current_event_data->e_image_url = $s->image_title;
            $current_event_data->t_type = $cost[0]->t_type;
            $current_event_data->n_val = $cost[0]->normal;
            $current_event_data->s_val = $cost[0]->silver;
            $current_event_data->g_val = $cost[0]->gold;
            $current_event_data->p_val = $cost[0]->platinum;
            $current_event_data->total_sold = $sale[0]->total_sold;
            $current_event_data->total_revenue = $sale[0]->total_revenue;

            $sports_events[] = $current_event_data;
        }

        return response($sports_events, 200);
    }

    public function getFunEvents(){
        $fun_events = array();
        $fun_list = Event::where('category_id', '1')->get();

        foreach($fun_list as $f){
            $current_event_data = new EventData();
            $cost = Cost::where('event_id', $f->id)->get();
            $sale = Sale::where('event_id', $f->id)->get();

            $current_event_data->event_id = $f->id;
            $current_event_data->event_name = $f->name;
            $current_event_data->event_description = $f->description;
            $current_event_data->event_location = $f->location;
            $current_event_data->event_date = $f->date;
            $current_event_data->event_organizer = $f->organizer;
            $current_event_data->event_category = Category::where('id', $f->category_id)->get();
            $current_event_data->event_image_url = $f->image_title;
            $current_event_data->type = $cost[0]->t_type;
            $current_event_data->normal_price = $cost[0]->normal;
//            $current_event_data->silver_price = $cost[0]->silver;
//            $current_event_data->gold_price = $cost[0]->gold;
//            $current_event_data->platinum_price = $cost[0]->platinum;

        //    $current_event_data->total_sold = $sale[0]->total_sold;
       //     $current_event_data->total_revenue = $sale[0]->total_revenue;

            $fun_events[] = $current_event_data;
        }

        return response($fun_events, 200);
    }
    public function getAllEvents(){
        $events = array();
        $list = Event::all();

        foreach($list as $f){
            $current_event_data = new EventData();
            $cost = Cost::where('event_id', $f->id)->get();
            $sale = Sale::where('event_id', $f->id)->get();

            $current_event_data->event_id = $f->id;
            $current_event_data->event_name = $f->name;
            $current_event_data->event_description = $f->description;
            $current_event_data->event_location = $f->location;
            $current_event_data->event_date = $f->date;
            $current_event_data->event_organizer = $f->organizer;
            $current_event_data->event_category = Category::where('id', $f->category_id)->get();
            $current_event_data->event_image_url = $f->image_title;
            $current_event_data->type = $cost[0]->t_type;
            $current_event_data->normal_price = $cost[0]->normal;
            $current_event_data->total_sold = $sale[0]->total_sold;
            $current_event_data->total_revenue = $sale[0]->total_revenue;
            $events[] = $current_event_data;
        }
        return $this->handleResponse(([
            $events
        ]), 'Events get successfully' );

        return response($events, 200);
    }
    public function getEventFromCategory($category_id){
        $events = array();
        $list = Event::where('category_id', $category_id)->get();

        foreach($list as $f){
            $current_event_data = new EventData();
            $cost = Cost::where('event_id', $f->id)->get();
            $sale = Sale::where('event_id', $f->id)->get();

            $current_event_data->event_id = $f->id;
            $current_event_data->event_name = $f->name;
            $current_event_data->event_description = $f->description;
            $current_event_data->event_location = $f->location;
            $current_event_data->event_date = $f->date;
            $current_event_data->event_organizer = $f->organizer;
            $current_event_data->event_category = Category::where('id', $f->category_id)->get();
            $current_event_data->event_image_url = $f->image_title;
            $current_event_data->type = $cost[0]->t_type;
            $current_event_data->normal_price = $cost[0]->normal;
//            $current_event_data->silver_price = $cost[0]->silver;
//            $current_event_data->gold_price = $cost[0]->gold;
//            $current_event_data->platinum_price = $cost[0]->platinum;

            $current_event_data->total_sold = $sale[0]->total_sold;
            $current_event_data->total_revenue = $sale[0]->total_revenue;

            $events[] = $current_event_data;
        }
        return $this->handleResponse(([
            $events
        ]), 'Events from category id get successfully' );

        return response($events, 200);
    }
    public function getEventData($id){
        $event = Event::where('id', $id)->get();
        $current_event_data = new EventData();

        foreach($event as $e){
            $cost = Cost::where('event_id', $e->id)->get();
            $sale = Sale::where('event_id', $e->id)->get();

            $current_event_data->event_id = $e->id;
            $current_event_data->event_name = $e->name;
            $current_event_data->event_description = $e->description;
            $current_event_data->event_location = $e->location;
            $current_event_data->event_date = $e->date;
            $current_event_data->event_organizer = $e->organizer;
            $current_event_data->event_category = Category::where('id', $e->category_id)->get();
            $current_event_data->event_image_url = $e->image_title;
            $current_event_data->type = $cost[0]->t_type;
            $current_event_data->normal_price = $cost[0]->normal;
//            $current_event_data->silver_price = $cost[0]->silver;
//            $current_event_data->gold_price = $cost[0]->gold;
//            $current_event_data->platinum_price = $cost[0]->platinum;

            $current_event_data->total_sold = $sale[0]->total_sold;
            $current_event_data->total_revenue = $sale[0]->total_revenue;
        }
        return $this->handleResponse(([
            $current_event_data
        ]), 'Event ' . $id . ' get successfully' );
    }
}
