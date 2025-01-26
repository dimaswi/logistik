<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class StokOpnameDetil extends Model
{
    use HasFactory, HasUuids;

    protected $connection = 'mysql';

    protected $table ='stok_opname_detil';

    protected $fillable = [
        'id_stok_opname',
        'barang',
        'stok_sebelumnya',
        'stok_sekarang',
    ];
}
