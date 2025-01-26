<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Suplier extends Model
{
    use HasFactory, HasUuids;

    protected $connection = 'mysql';

    protected $table = 'suplier';

    protected $fillable = ['nama', 'alamat', 'nomor_telepon'];
}
