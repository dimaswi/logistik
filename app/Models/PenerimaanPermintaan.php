<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PenerimaanPermintaan extends Model
{
    use HasFactory, HasUuids;

    protected $connection = 'mysql';

    protected $table = 'penerimaan_permintaan';

    protected $fillable = [
        'id_permintaan',
        'penerima',
        'keterangan',
    ];
}
