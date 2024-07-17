<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Style extends Model
{
    use HasFactory;

    protected $table = "dbo_lygstylesize"; // menghubungkan ke dalam tabel dbo_lygstylesize
    protected $guarded = [];

    public $primaryKey = 'style_code';
    public $keyType = 'string';
    public $autoIncrement = 'false';
}
