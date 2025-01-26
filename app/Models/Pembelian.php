<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Pembelian extends Model
{
    use HasFactory, HasUuids;

    protected $connection = 'mysql';

    protected $table = 'pembelian';

    protected $fillable = [
        'nomor_faktur',
        'tanggal_pembelian',
        'supplier',
        'total',
        'diskon',
        'ppn',
        'keterangan',
    ];

    public function detilPembelian()
    {
        return $this->hasMany(PembelianDetil::class, 'id_pembelian');
    }

    public function toko()
    {
        return $this->belongsTo(Suplier::class, 'supplier');
    }
}
