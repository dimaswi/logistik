<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PembelianDetil extends Model
{
    use HasFactory, HasUuids;

    protected $connection = 'mysql';

    protected $table = 'pembelian_detil';

    protected $fillable = [
        'id_pembelian',
        'id_barang',
        'jumlah',
        'harga',
    ];
}
