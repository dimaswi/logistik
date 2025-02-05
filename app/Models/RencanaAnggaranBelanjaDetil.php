<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RencanaAnggaranBelanjaDetil extends Model
{
    use HasFactory;

    protected $connection ='mysql';

    protected $table = 'rencana_anggaran_belanja_detil';

    protected $fillable = [
        'id_rencana_anggaran_belanja',
        'nama_barang',
        'merk',
        'keterangan',
        'satuan_barang',
        'jumlah',
        'harga',
    ];

    public function rab()
    {
        return $this->belongsTo(RencanaAnggaranBelanja::class, 'id_rencana_anggaran_belanja');
    }
}
