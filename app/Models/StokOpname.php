<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class StokOpname extends Model
{
    use HasFactory, HasUuids;

    protected $connection = 'mysql';

    protected $table = 'stok_opname';

    protected $fillable = [
        'tanggal',
        'organisasi',
        'status',
    ];
}
