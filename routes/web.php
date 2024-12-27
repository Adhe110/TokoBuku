<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\BukuController;
use App\Http\Controllers\KategoriController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\AdminAuthController;
use App\Http\Middleware\AdminMiddleware;
use App\Http\Controllers\DashboardController;
use App\Models\Buku;
use App\Models\Kategori;
use App\Http\Controllers\KeranjangController;
use App\Http\Controllers\TransaksiController;
use App\Models\Keranjang;



// Route untuk halaman sukses checkout
Route::get('/checkout/sukses', [KeranjangController::class, 'sukses'])->name('checkout.sukses');
Route::post('/checkout/proses', [KeranjangController::class, 'prosesCheckout'])->name('checkout.proses');

Route::get('/riwayat-transaksi', [TransaksiController::class, 'riwayat'])->name('pembayaran.riwayat');


Route::middleware(['auth'])->group(function () {
    Route::get('/keranjang/checkout', [KeranjangController::class, 'checkout'])->name('checkout.index');
    Route::post('/keranjang/checkout', [KeranjangController::class, 'prosesCheckout'])->name('checkout.proses');
    Route::get('/keranjang/sukses', [KeranjangController::class, 'sukses'])->name('checkout.sukses');
    Route::post('/keranjang/update/{id}', [KeranjangController::class, 'updateQuantity']);
    Route::delete('/keranjang/hapus/{id}', [KeranjangController::class, 'hapusItem']);
});

// routes/web.php
// Di routes/web.php
Route::delete('/keranjang/hapus/{id}', [KeranjangController::class, 'removeFromCart'])->name('keranjang.remove');
Route::put('/keranjang/update/{id}', [KeranjangController::class, 'updateCart'])->name('keranjang.update');
Route::delete('/keranjang/hapus/{id}', [KeranjangController::class, 'removeFromCart']);

Route::get('/keranjang/count', [KeranjangController::class, 'getCount'])->name('keranjang.count');



// Rute untuk menambahkan buku ke keranjang
Route::post('/keranjang/add/{id}', [KeranjangController::class, 'addToCart'])->name('keranjang.add');
// Rute untuk menghapus item dari keranjang
Route::delete('/keranjang/remove/{id}', [KeranjangController::class, 'removeFromCart'])->name('keranjang.remove');

// Rute untuk memperbarui jumlah item di keranjang
Route::put('/keranjang/update/{id}', [KeranjangController::class, 'updateCart'])->name('keranjang.update');

// Route User
Route::middleware('auth')->group(function () {
    Route::get('/keranjang', [KeranjangController::class, 'index'])->name('keranjang.index');
    Route::post('/keranjang/{id}', [KeranjangController::class, 'addToCart'])->name('keranjang.add');
    Route::put('/keranjang/{id}', [KeranjangController::class, 'updateCart'])->name('keranjang.update');
    Route::delete('/keranjang/{id}', [KeranjangController::class, 'removeFromCart'])->name('keranjang.remove');
});

// Route Admin
Route::prefix('admin')->group(function () {
    // Rute login dan register admin
    Route::get('/login', [AdminAuthController::class, 'showLoginForm'])->name('admin.login');
    Route::post('/login', [AdminAuthController::class, 'login']);
    Route::get('/register', [AdminAuthController::class, 'showRegisterForm'])->name('admin.register');
    Route::post('/register', [AdminAuthController::class, 'register']);

    // Halaman Dashboard Admin dengan Middleware Admin
    Route::middleware([AdminMiddleware::class])->group(function () {
        Route::get('/dashboard', function () { // Perbaiki rute ini dengan '/dashboard' saja
            return view('admin.dashboard'); // Pastikan view ini ada di resources/views/admin/dashboard.blade.php
        })->name('admin.dashboard');
    });

    // Rute logout admin
    Route::post('/logout', [AdminAuthController::class, 'logout'])->name('admin.logout');
    
});

// Route Admin
Route::prefix('admin')->middleware([AdminMiddleware::class])->group(function () {
    // Rute transaksi dengan prefix 'admin'
    Route::get('/transaksi', [TransaksiController::class, 'index'])->name('transaksi.index');
    Route::post('transaksi/{id}/update-status', [TransaksiController::class, 'updateStatus'])->name('transaksi.update-status');
    Route::resource('/Buku', \App\Http\Controllers\BukuController::class);
});



Route::resource('kategori', KategoriController::class);
Route::get('/kategori/create', [KategoriController::class, 'create'])->name('Kategori.create');
Route::post('/kategori', [KategoriController::class, 'store'])->name('Kategori.store');
Route::get('/kategori', [KategoriController::class, 'index'])->name('Kategori.index');
Route::delete('/kategori/{id}', [KategoriController::class, 'destroy'])->name('Kategori.destroy');

Route::get('/', function () {
    return view('welcome');
});

// create
Route::resource('/Buku', \App\Http\Controllers\BukuController::class);

 
//  delete
Route::delete('/Buku/{id}', [BukuController::class, 'destroy'])->name('Buku.destroy');


// Route untuk form edit buku (GET)
Route::get('/buku/{id}/edit', [BukuController::class, 'edit'])->name('Buku.edit');

// Route untuk update buku (PUT)
Route::put('/buku/{id}', [BukuController::class, 'update'])->name('Buku.update');

Route::get('/dashboard', [BukuController::class, 'dashboard'])->name('Buku.dashboard');




Route::get('login', [UserController::class, 'showLoginForm'])->name('login');
Route::post('login', [UserController::class, 'login']);
Route::get('register', [UserController::class, 'showRegisterForm'])->name('register');
Route::post('register', [UserController::class, 'register']);
Route::post('logout', [UserController::class, 'logout'])->name('logout');

Route::get('/users', [UserController::class, 'index'])->name('Users.index');

// Rute dengan middleware kategori
Route::prefix('admin')->middleware(['kategori'])->group(function () {
    Route::resource('kategori', KategoriController::class);
});




// Semua route di bawah prefix "dashboard"
Route::prefix('dashboard')->group(function () {
    // Halaman utama dashboard
    Route::get('/', function () {
        return view('Dashboard.index');
    })->name('dashboard.index');

    // routes/web.php

Route::get('kategori/details', function () {
    return view('dashboard.details');
    })->name('book.detail');


    // Halaman kategori
    Route::get('/kategori', function () {
        return view('Dashboard.kategori');
    })->name('dashboard.kategori');

    Route::get('/keranjang', function () {
        return view('Dashboard.keranjang');
    })->name('dashboard.keranjang');

    Route::get('/checkout', function () {
        return view('Dashboard.checkout');
    })->name('dashboard.checkout');
    
});



Route::post('/login', [UserController::class, 'login'])->name('login');
Route::get('/login', [UserController::class, 'showLoginForm'])->name('login');

Route::get('/register', [UserController::class, 'showRegisterForm'])->name('register');
Route::post('/register', [UserController::class, 'register'])->name('register');


Route::get('/dashboard', function () {
    // Mengambil data buku yang terbaru, dipaginasi 25 per halaman
    $Buku = Buku::orderBy('created_at', 'desc')->paginate(25);
    
    // Mengambil semua kategori
    $kategoris = Kategori::all();
    
    // Mengirim data buku dan kategori ke view
    return view('dashboard.index', compact('Buku', 'kategoris'));
});



// Route untuk menampilkan form tambah buku
Route::get('/buku/search', [BukuController::class, 'search'])->name('buku.search');

// route dashboard
Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard.index');

Route::get('/dashboard/kategori/{kategori_id}', [DashboardController::class, 'kategori'])->name('dashboard.kategori');
Route::get('/dashboard/details/{id}', [DashboardController::class, 'show'])->name('dashboard.details');

// Route::get('/register', [UserController::class, 'showRegisterForm'])->name('register');
// Route::post('/register', [UserController::class, 'register'])->name('register');
// Route::post('/logout', [UserController::class, 'logout'])->name('logout');
// Route::get('/register', [UserController::class, 'showRegisterForm'])->name('LoginUser.register');
// Route::post('/register', [UserController::class, 'register'])->name('LoginUser.register');
// Route::post('/logout', [UserController::class, 'logout'])->name('LoginUser.logout');



