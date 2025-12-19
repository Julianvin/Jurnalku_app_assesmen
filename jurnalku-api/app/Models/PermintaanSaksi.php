<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PermintaanSaksi extends Model
{
    protected $table = 'permintaan_saksis';

    //
    protected $fillable = [
        "pengirim",
        "tanggal",
        "konfirmasi"
    ];

    protected $casts = [
        'tanggal' => 'date',
    ];
}
