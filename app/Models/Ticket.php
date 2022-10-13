<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Ticket extends Model
{
    protected $table = 'tickets';
    protected $fillable = ['event_id', 'customer_id', 't_type', 'no_of_tickets', 'costs', 'user_id', 'booking_code'];
}
