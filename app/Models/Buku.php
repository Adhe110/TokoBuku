<?php

// Model Buku
namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Buku extends Model
{
    use HasFactory;

    protected $fillable = [
        'sampul',
        'judul_buku',
        'id_kategori',  // Tambahkan kolom id_kategori
        'penerbit',
        'penulis',
        'tahun',
        'isbn',
        'harga',
        'stok',
        'berat',
        'halaman',
        'sinopsis',
    ];

    // Relasi ke model Kategori
    public function kategori()
    {
        return $this->belongsTo(Kategori::class, 'id_kategori');
    }
}
