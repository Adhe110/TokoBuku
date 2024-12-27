<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Checkout extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'nama_penerima',    
        'alamat',
        'metode_pembayaran',
        'status',
        'total_harga',
        'bukti_bayar', // Tambahkan ini
    ];

    public function items()
    {
        return $this->hasMany(CheckoutItem::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
