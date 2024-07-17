<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Sewing extends Model
{
    use HasFactory;

    protected $table = "dbo_lygsewingoutput"; // menghubungkan ke dalam tabel dbo_lygsewingoutput

    protected $guarded = [];

    public function destination()
    {
        return $this->belongsTo(Destination::class, 'destination_code');
    }

    public function style()
    {
        return $this->belongsTo(Style::class, 'style_code');
    }
}
