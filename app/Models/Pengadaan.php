<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Pengadaan extends Model
{
    use HasFactory, HasUuids;

    protected $connection = 'mysql';

    protected $table = 'pengadaan';

    protected $fillable = [
        'tanggal',
        'oleh',
        'organisasi',
        'kepala',
        'perihal',
        'nomor_pengadaan',
        'nomor',
        'nominal',
        'status',
        'rab',
        'persetujuan',
        'tanggal_serah_terima',
    ];

    public function detilPengadaan()
    {
        return $this->hasMany(PengadaanDetil::class, 'id_pengadaan');
    }

    public function pemohon()
    {
        return $this->belongsTo(Organisasi::class, 'organisasi');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'oleh');
    }

    public function atasan()
    {
        return $this->belongsTo(User::class, 'kepala');
    }

}
