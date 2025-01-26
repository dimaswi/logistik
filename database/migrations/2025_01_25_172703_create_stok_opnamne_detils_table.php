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
        Schema::create('stok_opnamne_detil', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->string('id_stok_opname');
            $table->string('barang');
            $table->string('stok_sebelumnya');
            $table->string('stok_sekarang');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('stok_opnamne_detils');
    }
};
