<?php

// Model Kategori
namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Kategori extends Model
{
    use HasFactory;

    protected $fillable = [
        'kategori',
    ];

    // Relasi ke model Buku
    public function bukus()
    {
        return $this->hasMany(Buku::class, 'id_kategori');
    }
}
