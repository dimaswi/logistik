<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SerahTerimaAset extends Model
{
    use HasFactory, HasUuids;

    protected $connection = 'mysql';

    protected $table = 'serah_terima_aset';

    protected $fillable = [
        'id_pengadaan',
        'nama_penerima',
        'tanggal_serah_terima',
    ];

    public function pengadaan()
    {
        return $this->belongsTo(Pengadaan::class, 'id_pengadaan');
    }
}
