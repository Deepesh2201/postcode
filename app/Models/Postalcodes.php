<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Postalcodes extends Model
{
    use HasFactory;
    protected $fillable = [
        'code1', 'code2', 'charge', 'description'
    ];
}
