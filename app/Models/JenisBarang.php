<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class JenisBarang extends Model
{
    use HasFactory, HasUuids;

    protected $connection = 'mysql';

    protected $table = 'jenis_barang';

    protected $fillable = [
        'jenis_barang',
        'deskripsi'
    ];
}
