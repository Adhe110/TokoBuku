<?php

namespace App\Http\Controllers;

use App\Models\Buku;
use App\Models\Kategori;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    public function index(Request $request)
    {
        // Mengambil semua kategori untuk ditampilkan di dropdown
        $kategoris = Kategori::all();

        // Jika ada kategori yang dipilih, filter buku berdasarkan kategori
        if ($request->has('kategori_id')) {
            $Buku = Buku::where('id_kategori', $request->kategori_id)->paginate(5);
            $kategori = Kategori::findOrFail($request->kategori_id);
        } else {
            // Jika tidak ada kategori yang dipilih, tampilkan buku terbaru
            $Buku = Buku::latest()->paginate(5);
            $kategori = null;
        }

        // Mengirim data buku, kategori, dan daftar kategori ke view
        return view('dashboard.index', compact('Buku', 'kategoris', 'kategori'));
    }

    public function show($id)
    {
        // Mencari buku berdasarkan ID
        $book = Buku::findOrFail($id);
        $kategoris = Kategori::all();
    
        // Mengambil 5 buku secara acak
        $recommendedBooks = Buku::inRandomOrder()->take(5)->get();
    
        // Mengirim data buku dan rekomendasi ke view
        return view('dashboard.details', compact('book', 'recommendedBooks','kategoris'));
    }
    
    
    
}
