<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up()
    {
        Schema::table('checkouts', function (Blueprint $table) {
            $table->string('bukti_bayar')->nullable()->after('status'); // Menambahkan kolom bukti_bayar
        });
    }
    
    public function down()
    {
        Schema::table('checkouts', function (Blueprint $table) {
            $table->dropColumn('bukti_bayar');
        });
    }
    
};


// TAMBAH Kolom bukti_bayar pada Tabel checkouts