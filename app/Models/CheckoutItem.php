<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CheckoutItem extends Model
{
    use HasFactory;

    protected $fillable = [
        'checkout_id',
        'buku_id',
        'jumlah',
        'subtotal',
    ];

    public function buku()
    {
        return $this->belongsTo(Buku::class);
    }
}
