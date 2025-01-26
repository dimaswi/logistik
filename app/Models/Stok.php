<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Stok extends Model
{
    use HasFactory, HasUuids;

    protected $connection = 'mysql';

    protected $table = 'stok';

    protected $fillable = [
        'barang',
        'organisasi',
        'stok',
    ];

    public function detail_barang()
    {
        return $this->belongsTo(Barang::class, 'barang');
    }

    public function lokasi()
    {
        return $this->belongsTo(Organisasi::class, 'organisasi');
    }
}
