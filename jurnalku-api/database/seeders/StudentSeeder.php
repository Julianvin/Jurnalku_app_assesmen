<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class StudentSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        //
        DB::table('students')->insert([
            [
                'nis' => '12309719',
                'nama' => 'Delvin',
                'password' => Hash::make('password123'),
                'rombel' => 'PPLG XII-5',
                'rayon' => 'Cisarua 1',
                'jurusan' => 'PPLG',
                'foto' => 'john_doe.jpg',
            ],
            [
                'nis' => '12309717',
                'nama' => 'adalah Pokoknya',
                'password' => Hash::make('password456'),
                'rombel' => 'PPLG XII-5',
                'rayon' => 'Cisarua 2',
                'jurusan' => 'PPLG',
                'foto' => 'jane_smith.jpg',
            ],
            [
                'nis' => '12309717',
                'nama' => 'fadhlan Pokoknya',
                'password' => Hash::make('password456'),
                'rombel' => 'PPLG XII-5',
                'rayon' => 'Cisarua 2',
                'jurusan' => 'PPLG',
                'foto' => 'jane_smith.jpg',
            ],
        ]);
    }
}
