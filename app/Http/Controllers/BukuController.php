<?php

namespace App\Http\Controllers;

use App\Models\Buku; // Import model Buku
use Illuminate\Http\Request; // Import Request
use Illuminate\Http\RedirectResponse; // Import RedirectResponse
use Illuminate\View\View; // Import View
use Illuminate\Support\Facades\Storage;
use App\Models\Kategori;


class BukuController extends Controller
{
    
    
    /**
     * 

     * Menampilkan semua buku
     *
     * @return View
     */

    
     public function dashboard()
     {
         // Fetch data jika diperlukan, contoh jumlah buku
         $totalBuku = Buku::count();
         $totalStok = Buku::sum('stok');
     
         return view('Buku.dashboard', compact('totalBuku', 'totalStok'));
     }
     
     public function index(): View
     {   
         // Mengambil input pencarian dari request
         $search = request('search');
     
         // Query data buku dengan filter pencarian
         $Buku = Buku::when($search, function ($query, $search) {
             return $query->where('judul_buku', 'like', "%{$search}%")
                         ->orWhere('penulis', 'like', "%{$search}%")
                         ->orWhere('penerbit', 'like', "%{$search}%")
                         ->orWhereHas('kategori', function ($q) use ($search) {
                             $q->where('kategori', 'like', "%{$search}%");
                         });
         })
         ->latest() // Mengurutkan berdasarkan yang terbaru
         ->paginate(5); // Paginasi dengan 5 item per halaman
     
         // Render view dengan data buku
         return view('Buku.index', compact('Buku'));
     }

     public function search(Request $request)
     {
         // Mengambil input pencarian dari query string
         $search = $request->input('search');
 
         // Query data buku berdasarkan pencarian
         $Buku = Buku::when($search, function ($query, $search) {
             return $query->where('judul_buku', 'like', "%{$search}%")
                          ->orWhere('penulis', 'like', "%{$search}%")
                          ->orWhere('penerbit', 'like', "%{$search}%");
         })->latest()->paginate(5);
 
         // Kembalikan view dengan data pencarian
         return view('dashboard.index', compact('Buku'));
     }
     

    /**
     * Menampilkan form untuk menambah buku
     *
     * @return View
     */
    public function create(): View
    {
        // Ambil semua kategori dari tabel 'Kategori'
        $kategoris = Kategori::all();
    
        // Kirim data kategori ke tampilan
        return view('Buku.create', compact('kategoris'));
    }
    /**
     * Menyimpan buku baru ke database
     *
     * @param Request $request
     * @return RedirectResponse
     */
    public function store(Request $request): RedirectResponse
    {
        // Validasi form
        $request->validate([
            'sampul'     => 'required|image|mimes:jpeg,jpg,png|max:2048',
            'judul_buku' => 'required|string|min:5',
            'penerbit'   => 'required|string|min:3',
            'penulis'    => 'required|string|min:3',
            'tahun'      => 'required|integer',
            'isbn'       => 'required|string|max:13',
            'harga'      => 'required|numeric',
            'stok'       => 'required|integer',
            'berat'      => 'required|numeric',
            'halaman'    => 'required|integer',
            'sinopsis'   => 'required|string|min:10',
            'id_kategori' => 'required|exists:kategoris,id', // Validasi kategori
        ]);

        // Upload image
        $sampul = $request->file('sampul');
        $sampul->storeAs('public/buku', $sampul->hashName());

        // Create buku
        Buku::create([
            'sampul'     => $sampul->hashName(), // Simpan nama file yang di-upload
            'judul_buku' => $request->judul_buku,
            'penerbit'   => $request->penerbit,
            'penulis'    => $request->penulis,
            'tahun'      => $request->tahun,
            'isbn'       => $request->isbn,
            'harga'      => $request->harga,
            'stok'       => $request->stok,
            'berat'      => $request->berat,
            'halaman'    => $request->halaman,
            'sinopsis'   => $request->sinopsis,
            'id_kategori' => $request->id_kategori,
        ]);

        // 
        return redirect()->route('Buku.index')->with(['success' => 'Data Berhasil Disimpan!']);
    }

    // fungsi delete
    public function destroy($id): RedirectResponse
    {
        //get product by ID
        $buku = Buku::findOrFail($id);

        //delete image
        Storage::delete('public/buku/'. $buku->sampul);


        //delete product
        $buku->delete();

        //redirect to index
        return redirect()->route('Buku.index')->with(['success' => 'Data Berhasil Dihapus!']);
    }


    // fungsi untuk menampilkan detail buku
    public function show(string $id): View
    {
        //get product by ID
        $buku = Buku::findOrFail($id);

        //render view with product
        return view('Buku.show', compact('buku'));
    }

    // fungsi untuk menampilkan form edit buku
    public function edit($id)
    {
        $buku = Buku::findOrFail($id); // Mendapatkan data buku berdasarkan ID
        $kategori = Kategori::all(); // Mendapatkan semua kategori dari database
    
        return view('Buku.update', compact('buku', 'kategori')); // Mengirimkan data buku dan kategori ke view
    }

    // Method untuk memperbarui data buku
    
    public function update(Request $request, $id): RedirectResponse
    {
        // Validasi form
        $request->validate([
            'sampul'     => 'nullable|image|mimes:jpeg,jpg,png|max:2048',
            'judul_buku' => 'required|string|min:5',
            'penerbit'   => 'required|string|min:3',
            'penulis'    => 'required|string|min:3',
            'tahun'      => 'required|integer',
            'isbn'       => 'required|string|max:13',
            'harga'      => 'required|numeric',
            'stok'       => 'required|integer',
            'berat'      => 'required|numeric',
            'halaman'    => 'required|integer',
            'id_kategori' => 'required|exists:kategoris,id', // Validasi kategori
            'sinopsis'   => 'required|string|min:10',
        ]);

        // Cari data buku berdasarkan ID
        $buku = Buku::findOrFail($id);

        // Cek apakah ada file gambar yang diunggah
        if ($request->hasFile('sampul')) {
            
            // Unggah gambar baru
            $sampul = $request->file('sampul');
            $sampul->storeAs('public/buku', $sampul->hashName());

            Storage::delete('public/buku/' . $buku->sampul);

            $buku->update ([
                'sampul'     => $sampul->hashName(),
                'judul_buku' => $request->judul_buku,
                'penerbit'   => $request->penerbit,
                'penulis'    => $request->penulis,
                'tahun'      => $request->tahun,
                'isbn'       => $request->isbn,
                'harga'      => $request->harga,
                'stok'       => $request->stok,
                'berat'      => $request->berat,
                'halaman'    => $request->halaman,
                'id_kategori' => $request->id_kategori,
                'sinopsis'   => $request->sinopsis,
            ]);
        
        } else {
            $buku->update ([
                'judul_buku' => $request->judul_buku,
                'penerbit'   => $request->penerbit,
                'penulis'    => $request->penulis,
                'tahun'      => $request->tahun,
                'isbn'       => $request->isbn,
                'harga'      => $request->harga,
                'stok'       => $request->stok,
                'berat'      => $request->berat,
                'halaman'    => $request->halaman,
                'id_kategori' => $request->id_kategori,
                'sinopsis'   => $request->sinopsis,
            ]);
        }

        // Redirect ke halaman index dengan pesan sukses
        return redirect()->route('Buku.index')->with(['success' => 'Data Berhasil Diubah!']);
    }
    
}