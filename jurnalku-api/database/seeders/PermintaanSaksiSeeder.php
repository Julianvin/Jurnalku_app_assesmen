<?php

namespace Database\Seeders;

use App\Models\PermintaanSaksi;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class PermintaanSaksiSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        //
            PermintaanSaksi::insert([
                [
                    'pengirim' => 'John Doe',
                    'tanggal' => '2023-10-01',
                    'status' => 'pending',
                ],
                [
                    'pengirim' => 'Jane Smith',
                    'tanggal' => '2023-10-02',
                    'status' => 'accepted',
                ],
                [
                    'pengirim' => 'Alice Johnson',
                    'tanggal' => '2023-10-03',
                    'status' => 'rejected',
                ],
            ]);
    }
}
