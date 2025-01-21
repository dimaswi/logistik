<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Barang extends Model
{
    use HasFactory, HasUuids;

    protected $connection = 'mysql';

    protected $table = 'barang';

    protected $fillable = [
        'nama_barang',
        'stok',
        'jenis_barang',
        'harga',
        'satuan',
    ];

    public function satuan_barang()
    {
        return $this->belongsTo(SatuanBarang::class, 'satuan', 'id');
    }
}
