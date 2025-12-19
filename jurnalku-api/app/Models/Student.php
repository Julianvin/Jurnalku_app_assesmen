<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Student extends Model
{
    

    protected $table = 'students';

    //
    protected $fillable = [
        'nis',
        'nama',
        'password',
        'rombel',
        'rayon',
        'jurusan',
        'foto',
    ];
}
