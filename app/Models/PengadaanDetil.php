<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PengadaanDetil extends Model
{
    use HasFactory, HasUuids;

    protected $connection = 'mysql';

    protected $table = 'pengadaan_detil';

    protected $fillable = [
        'id_pengadaan',
        'nama_barang',
        'merk',
        'jumlah',
        'harga',
    ];

    public function pengadaan()
    {
        return $this->belongsTo(Pengadaan::class, 'id_pengadaan');
    }
}
