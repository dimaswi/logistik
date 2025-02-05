<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('rencana_anggaran_belanja_detil', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->string('id_rencana_anggaran_belanja');
            $table->string('nama_barang');
            $table->string('merk');
            $table->string('keterangan');
            $table->string('satuan_barang');
            $table->string('jumlah');
            $table->string('harga');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('rencana_anggaran_belanja_detils');
    }
};
