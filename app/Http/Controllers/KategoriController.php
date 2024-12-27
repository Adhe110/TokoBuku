<?php

namespace App\Http\Controllers;

use App\Models\Kategori;
use Illuminate\Http\RedirectResponse; // Import RedirectResponse
use Illuminate\Http\Request;

class KategoriController extends Controller
{
    /**
     * Menampilkan daftar kategori.
     */
    public function index()
    {
        // Mengambil kategori dengan pagination
        $kategoris = Kategori::paginate(10);
        
        // Mengirim data kategori ke view
        return view('Kategori.index', compact('kategoris'));
    }
    

    /**
     * Menampilkan form untuk menambah kategori baru.
     */
    public function create()
    {
        return view('Kategori.create');
    }

    /**
     * Menyimpan kategori baru ke database.
     */
    public function store(Request $request)
    {
        $request->validate([
            'kategori' => 'required|string|max:255|unique:kategoris,kategori',
        ]);

        Kategori::create([
            'kategori' => $request->kategori,
        ]);

        return redirect()->route(route: 'Kategori.index')->with('success', 'Kategori berhasil ditambahkan!');
    }

    /**
     * Menampilkan form untuk mengedit kategori.
     */
    public function edit(Kategori $kategori)
    {
        return view('Kategori.update', compact('kategori'));
    }

    /**
     * Memperbarui kategori di database.
     */
    public function update(Request $request, Kategori $kategori)
    {
        $request->validate([
            'kategori' => 'required|string|max:255|unique:kategoris,kategori,' . $kategori->id,
        ]);

        $kategori->update([
            'kategori' => $request->kategori,
        ]);

        return redirect()->route('Kategori.index')->with('success', 'Kategori berhasil diperbarui!');
    }


    public function destroy($id): RedirectResponse
    {
        // get category by ID
        $kategori = Kategori::findOrFail($id);
    
        // delete category
        $kategori->delete();
    
        // redirect to index
        return redirect()->route('Kategori.index')->with(['success' => 'Kategori Berhasil Dihapus!']);
    }
    


}
