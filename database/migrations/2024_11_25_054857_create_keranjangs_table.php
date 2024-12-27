<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateKeranjangsTable extends Migration
{
    public function up(): void
    {
        Schema::create('keranjangs', function (Blueprint $table) {
            $table->id(); // ID keranjang
            $table->foreignId('id_user')->constrained('users')->onDelete('cascade'); // Relasi ke tabel users
            $table->foreignId('id_buku')->constrained('bukus')->onDelete('cascade'); // Relasi ke tabel bukus
            $table->integer('jumlah')->default(1); // Jumlah buku dalam keranjang
            $table->decimal('subtotal', 10, 2); // Subtotal harga untuk buku tersebut
            $table->timestamps(); // Kolom created_at dan updated_at
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('keranjangs');
    }
}
