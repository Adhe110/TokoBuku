<?php

namespace App\Http\Controllers;

use App\Models\Keranjang;
use App\Models\Buku;
use App\Models\Users;
use App\Models\Kategori;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use App\Models\Checkout;

class KeranjangController extends Controller
{
    // Menampilkan daftar keranjang

    // app/Http/Controllers/KeranjangController.php

public function updateQuantity(Request $request, $id)
{
    $keranjang = Keranjang::find($id);
    if (!$keranjang) {
        return response()->json(['success' => false, 'message' => 'Item tidak ditemukan']);
    }

    $keranjang->jumlah = $request->input('jumlah');
    $keranjang->save();

    // Hitung subtotal setelah update
    $subtotal = $keranjang->buku->harga * $keranjang->jumlah;

    return response()->json(['success' => true, 'subtotal' => $subtotal]);
}

public function hapusItem($id)
{
    $keranjang = Keranjang::find($id);
    if (!$keranjang) {
        return response()->json(['success' => false, 'message' => 'Item tidak ditemukan']);
    }

    $keranjang->delete();

    return response()->json(['success' => true]);
}



    public function index()
    {
        $kategoris = Kategori::all();

        // Pastikan user sudah login
        if (!Auth::check()) {
            return redirect()->route('login')->with('error', 'Anda harus login untuk melihat keranjang.');
        }

        // Mengambil semua item keranjang untuk user yang sedang login
        $keranjang = Keranjang::where('id_user', Auth::id())->with('buku')->get();
        return view('keranjang.index', compact('keranjang', 'kategoris'));
    }

    // Menambahkan buku ke keranjang
    public function addToCart(Request $request, $id)
    {
        // Validasi jumlah yang dimasukkan
        $request->validate([
            'jumlah' => 'required|integer|min:1', // Pastikan jumlah minimal 1
        ]);
    
        // Cari buku berdasarkan ID
        $buku = Buku::findOrFail($id);
    
        // Cari item keranjang untuk user dan buku tertentu
        $keranjang = Keranjang::where('id_user', Auth::id())
            ->where('id_buku', $id)
            ->first();
    
        if ($keranjang) {
            // Jika buku sudah ada di keranjang, tambahkan jumlahnya
            $keranjang->jumlah += $request->input('jumlah');
            $keranjang->subtotal = $keranjang->jumlah * $buku->harga;
            $keranjang->save();
        } else {
            // Jika buku belum ada di keranjang, buat entri baru
            Keranjang::create([
                'id_user' => Auth::id(),
                'id_buku' => $id,
                'jumlah' => $request->input('jumlah'),
                'subtotal' => $request->input('jumlah') * $buku->harga,
            ]);
        }
    
        // Redirect ke halaman keranjang dengan pesan sukses
        return redirect()->route('keranjang.index')->with('success', 'Buku berhasil ditambahkan ke keranjang.');
    }

    // Menghapus item dari keranjang
    public function removeFromCart($id)
    {
        // Pastikan user sudah login
        if (!Auth::check()) {
            return response()->json(['success' => false, 'message' => 'Anda harus login untuk menghapus item dari keranjang.']);
        }

        // Cari item keranjang berdasarkan id_user dan id
        $keranjang = Keranjang::where('id_user', Auth::id())->where('id', $id)->first();

        // Jika item ditemukan, hapus
        if ($keranjang) {
            $keranjang->delete();
            return response()->json(['success' => true, 'message' => 'Item berhasil dihapus dari keranjang.']);
        }

        // Jika item tidak ditemukan
        return response()->json(['success' => false, 'message' => 'Item tidak ditemukan dalam keranjang.']);
    }

    // Mengupdate jumlah item di keranjang
    public function updateCart(Request $request, $id)
    {
        // Pastikan user sudah login
        if (!Auth::check()) {
            return response()->json(['error' => 'Anda harus login untuk memperbarui keranjang.'], 401);
        }
    
        // Validasi jumlah
        $request->validate([
            'jumlah' => 'required|integer|min:1', // Jumlah minimal 1
        ]);
    
        // Cari item keranjang yang akan diupdate
        $keranjang = Keranjang::where('id_user', Auth::id())->where('id', $id)->firstOrFail();
        $buku = Buku::findOrFail($keranjang->id_buku);
    
        // Update jumlah dan subtotal
        $keranjang->jumlah = $request->input('jumlah');
        $keranjang->subtotal = $keranjang->jumlah * $buku->harga;
        $keranjang->save();
    
        // Kembalikan response sukses
        return response()->json(['success' => 'Jumlah item berhasil diperbarui.']);
    }

    // Menghitung jumlah item di keranjang


    // Menampilkan halaman checkout
    public function checkout()
    {   
        $kategoris = Kategori::all();
        $keranjang = Keranjang::where('id_user', Auth::id())->with('buku')->get();
    
        // Pastikan keranjang tidak kosong
        if ($keranjang->isEmpty()) {
            return redirect()->route('keranjang.index')->with('error', 'Keranjang Anda kosong.');
        }

        // Hitung total harga berdasarkan data keranjang
        $totalHarga = $keranjang->sum(function ($item) {
            return $item->buku->harga * $item->jumlah;
        });
    
        return view('checkout.index', compact('keranjang', 'totalHarga', 'kategoris'));
    }

    // Proses checkout dan simpan data checkout
    public function prosesCheckout(Request $request)
    {
        // Validasi input dari form
        $validated = $request->validate([
            'nama_penerima' => 'required|string',
            'alamat' => 'required|string',
            'metode_pembayaran' => 'required|string',
            'bukti_bayar' => 'nullable|file|mimes:jpg,png,jpeg|max:2048',
        ]);
    
        // Perhitungan total harga berdasarkan data keranjang
        $keranjang = Keranjang::where('id_user', Auth::id())->get();
        $totalHarga = 0;
        foreach ($keranjang as $item) {
            $totalHarga += $item->jumlah * $item->buku->harga;
        }
    
        // Proses upload file jika ada
        $buktiBayarPath = null;
        if ($request->hasFile('bukti_bayar')) {
            // Pastikan file yang di-upload valid dan simpan ke direktori publik
            $buktiBayarPath = $request->file('bukti_bayar')->store('bukti_bayar', 'public');
        }
    
        // Menyertakan user_id dalam data checkout
        $checkout = Checkout::create([
            'nama_penerima' => $request->nama_penerima,
            'alamat' => $request->alamat,
            'metode_pembayaran' => $request->metode_pembayaran,
            'total_harga' => $totalHarga, // Menggunakan totalHarga yang dihitung
            'bukti_bayar' => $buktiBayarPath,  // Menyimpan path file yang telah di-upload
            'user_id' => Auth::user()->id, // Menambahkan user_id
        ]);
    
        // Redirect atau beri respons sukses
        return redirect()->route('checkout.sukses')->with('success', 'Checkout berhasil diproses.');
    }
    
    


    // Menampilkan halaman sukses setelah checkout
    public function sukses()
    {
        return view('checkout.sukses');
    }

    
}
