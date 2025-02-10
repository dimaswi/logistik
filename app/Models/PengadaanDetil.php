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
        'barang_rab',
        'nama_barang',
        'merk',
        'jumlah',
        'realisasi',
        'serah_terima',
        'harga',
        'ttd_pemohon',
        'ttd_atasan',
        'ttd_logistik',
        'ttd_keuangan',
    ];

    public function pengadaan()
    {
        return $this->belongsTo(Pengadaan::class, 'id_pengadaan');
    }

    public function rab()
    {
        return $this->belongsTo(RencanaAnggaranBelanjaDetil::class, 'barang_rab');
    }

    public function serah_terima()
    {
        return $this->hasMany(SerahTerimaAset::class, 'id_pengadaan', 'id_pengadaan');
    }
}
