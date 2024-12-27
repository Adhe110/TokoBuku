<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Keranjang extends Model
{
    use HasFactory;

    // Properti yang dapat diisi
    protected $fillable = ['id_user', 'id_buku', 'jumlah', 'subtotal'];

    /**
     * Relasi ke tabel users (relasi banyak ke satu).
     * 
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function user()
    {
        return $this->belongsTo(User::class, 'id_user');
    }

    /**
     * Relasi ke tabel bukus (relasi banyak ke satu).
     * 
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function buku()
    {
        return $this->belongsTo(Buku::class, 'id_buku');
    }

    /**
     * Hitung subtotal untuk item keranjang.
     * 
     * @param int $jumlah
     * @param float $harga
     * @return float
     */
    public static function hitungSubtotal($jumlah, $harga)
    {
        return $jumlah * $harga;
    }

    /**
     * Periksa apakah buku sudah ada di keranjang pengguna.
     * 
     * @param int $userId
     * @param int $bukuId
     * @return Keranjang|null
     */
    public static function findItemInCart($userId, $bukuId)
    {
        return self::where('id_user', $userId)->where('id_buku', $bukuId)->first();
    }


    
}
