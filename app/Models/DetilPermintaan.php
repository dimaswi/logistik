<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DetilPermintaan extends Model
{
    use HasFactory, HasUuids;

    protected $connection = 'mysql';

    protected $table = 'detil_permintaan';

    protected $fillable = [
        'id_permintaan',
        'id_barang',
        'harga_baru',
        'harga_lama',
        'jumlah',
    ];

    public function permintaan()
    {
        return $this->belongsTo(Permintaan::class, 'id_permintaan');
    }

    public function barang()
    {
        return $this->belongsTo(Barang::class, 'id_barang');
    }
}
