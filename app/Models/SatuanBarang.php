<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SatuanBarang extends Model
{
    use HasFactory, HasUuids;

    protected $connection = 'mysql';

    protected $table = 'satuan_barang';

    protected $fillable = [
        'satuan_barang',
        'deskripsi',
    ];
}
