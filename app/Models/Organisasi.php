<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Organisasi extends Model
{
    use HasFactory, HasUuids;

    protected $connection = 'mysql';

    protected $table = 'organisasi';

    protected $fillable = [
        'nama',
        'pimpinan',
        'kode',
        'kop',
        'tingkat',
    ];

    public function user()
    {
        return $this->belongsTo(User::class, 'pimpinan');
    }
}
