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
        Schema::create('pengadaan', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->string('tanggal');
            $table->string('oleh');
            $table->string('organisasi');
            $table->string('kepala');
            $table->string('perihal');
            $table->string('nomor_pengadaan');
            $table->string('nama_barang');
            $table->string('merk');
            $table->string('harga');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('pengadaans');
    }
};
