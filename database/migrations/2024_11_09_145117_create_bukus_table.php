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
        Schema::create('bukus', function (Blueprint $table) {
            $table->id(); // Kolom ID
            $table->string('sampul'); // Sampul
            $table->foreignId('id_kategori')->constrained('kategoris')->onDelete('cascade'); // Relasi ke tabel kategoris
            $table->string('judul_buku'); // Judul Buku
            $table->string('penerbit'); // Penerbit
            $table->string('penulis'); // Penulis
            $table->year('tahun'); // Tahun
            $table->string('isbn')->unique(); // ISBN
            $table->decimal('harga', 10, 2); // Harga
            $table->integer('stok')->default(0);// Stok
            $table->integer('berat'); // Berat
            $table->integer('halaman'); // Halaman
            $table->text('sinopsis'); // Sinopsis
            $table->timestamps(); // Kolom created_at dan updated_at
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('bukus');
    }
};
