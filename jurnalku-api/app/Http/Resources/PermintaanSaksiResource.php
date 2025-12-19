<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class PermintaanSaksiResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'pengirim' => $this->pengirim,
            'tanggal' => $this->tanggal->format('Y-m-d'),
            'konfirmasi' => $this->konfirmasi ? 'diterima' : 'ditolak',
        ];
    }
}
