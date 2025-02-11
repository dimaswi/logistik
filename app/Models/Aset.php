<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Aset extends Model
{
    use HasFactory, HasUuids;

    protected $connection = 'mysql';

    protected $table = 'aset';

    protected $fillable = [
        'id_pengadaan',
        'nama_aset',
        'merk',
        'volume',
        'satuan',
        'kodefikasi',
        'nomor',
        'lokasi',
        'organisasi',
        'harga_pembelian',
        'tanggal_pembelian',
        'tanggal_serah_terima',
    ];

    public function ruangan()
    {
        return $this->belongsTo(Ruangan::class, 'lokasi');
    }

    public function unit()
    {
        return $this->belongsTo(Organisasi::class, 'organisasi');
    }
}
