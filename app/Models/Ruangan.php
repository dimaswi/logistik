<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Ruangan extends Model
{
    use HasFactory, HasUuids;

    protected $connection = 'mysql';

    protected $table = 'ruangan';

    protected $fillable = [
        'nama_ruangan',
        'kepala_ruangan',
        'organisasi',
    ];

    public function kepala()
    {
        return $this->belongsTo(User::class, 'kepala_ruangan');
    }

    public function org()
    {
        return $this->belongsTo(Organisasi::class, 'organisasi');
    }
}
