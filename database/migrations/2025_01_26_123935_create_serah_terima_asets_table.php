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
        Schema::create('serah_terima_aset', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->string('id_pengadaan');
            $table->string('nama_penerima');
            $table->string('tanggal_serah_terima');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('serah_terima_asets');
    }
};
