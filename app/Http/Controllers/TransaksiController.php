<?php

namespace App\Http\Controllers;

use App\Models\Checkout;  // Pastikan model Checkout sudah ada
use Illuminate\Http\Request;

class TransaksiController extends Controller
{
    /**
     * Menampilkan daftar transaksi.
     */
    public function index(Request $request)
    {
        // Ambil input pencarian dari request
        $search = $request->input('search');
    
        // Query transaksi dengan relasi user
        $transaksi = Checkout::with('user')
            ->when($search, function ($query) use ($search) {
                // Jika ada input pencarian, filter berdasarkan nama user, nama penerima, atau status
                $query->whereHas('user', function ($query) use ($search) {
                    $query->where('name', 'like', '%' . $search . '%'); // Mencari berdasarkan nama user
                })
                ->orWhere('nama_penerima', 'like', '%' . $search . '%') // Mencari berdasarkan nama penerima
                ->orWhere('status', 'like', '%' . $search . '%'); // Mencari berdasarkan status transaksi
            })
            ->paginate(10);
    
        // Tampilkan halaman transaksi dengan data transaksi
        return view('transaksi.index', compact('transaksi', 'search'));
    }
    
    
    

    /**
     * Mengupdate status transaksi.
     */
    public function updateStatus(Request $request, $id)
    {
        // Validasi input status
        $request->validate([
            'status' => 'required|in:pending,confirmed,processed,completed,cancelled',
        ]);

        // Cari transaksi berdasarkan ID
        $transaksi = Checkout::findOrFail($id);

        // Update status transaksi
        $transaksi->status = $request->status;
        $transaksi->save();

        // Kembali ke halaman transaksi dengan pesan sukses
        return redirect()->route('transaksi.index')->with('success', 'Status transaksi berhasil diperbarui.');
    }
}
