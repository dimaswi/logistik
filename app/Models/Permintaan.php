<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Permintaan extends Model
{
    use HasFactory, HasUuids;

    protected $connection = 'mysql';

    protected $table = 'permintaan';

    protected $fillable = [
        'nomor',
        'nomor_permintaan',
        'tanggal',
        'oleh',
        'status',
        'organisasi',
    ];

    public function detilPermintaan()
    {
        return $this->hasMany(DetilPermintaan::class, 'id_permintaan');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'oleh');
    }

    public function org()
    {
        return $this->belongsTo(Organisasi::class, 'organisasi');
    }
}
