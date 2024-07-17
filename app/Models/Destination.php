<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Destination extends Model
{
    use HasFactory;

    protected $table = "dbo_lygdestination"; // menghubungkan ke dalam tabel dbo_lygdestination
    protected $guarded = [];

    public $primaryKey = 'destination_code';
    public $keyType = 'string';
    public $autoIncrement = 'false';
}
