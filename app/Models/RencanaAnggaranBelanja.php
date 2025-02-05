<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RencanaAnggaranBelanja extends Model
{
    use HasFactory, HasUuids;

    protected $connection ='mysql';

    protected $table = 'rencana_anggaran_belanja';

    protected $fillable = [
        'organisasi',
        'prioritas',
        'periode',
        'status',
    ];

    public function barang()
    {
        return $this->hasMany(RencanaAnggaranBelanjaDetil::class, 'id_rencana_anggaran_belanja');
    }

    public function pemohon()
    {
        return $this->belongsTo(Organisasi::class, 'organisasi');
    }
}
