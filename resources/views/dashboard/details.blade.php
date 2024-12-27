<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detail - Toko Buku</title>
    <link rel="stylesheet" href="{{ asset('css/styles.css') }}">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">

    <!-- Link CSS Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

</head>

<body>
    
    <!-- Navbar -->
    <nav class="bg-red-600 p-4">
        <div class="container mx-auto flex items-center justify-between">
            <!-- Brand Logo -->
            <a href="{{ route('dashboard.index') }}" class="text-white text-2xl font-bold hover:no-underline">C-BOOK</a>
    
            <!-- Toggle Button untuk Mobile -->
            <button id="navbarToggle" class="text-white lg:hidden focus:outline-none">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16m-7 6h7" />
                </svg>
            </button>
    
            <!-- Navbar Content -->
            <div id="navbarMenu" class="hidden lg:flex lg:items-center lg:gap-8 w-full lg:w-auto">
                <!-- Search Bar -->
                <form action="{{ route('buku.search') }}" method="GET" class="flex items-center flex-grow lg:flex-grow-0 mx-4 lg:mx-0">
                    <input 
                        type="text" 
                        name="search" 
                        placeholder="Search" 
                        class="w-full lg:w-80 p-2 rounded-l-md border border-gray-300 focus:outline-none focus:ring focus:ring-red-300"
                    >
                    <button type="submit" class="bg-white text-red-600 px-4 py-2 rounded-r-md">
                        <i class="fas fa-search"></i>
                    </button>
                </form>
                
                <!-- Dropdown Kategori -->
                <div class="relative">
                    <button 
                        id="dropdownKategoriToggle"
                        class="text-white px-4 py-2 rounded-md flex items-center focus:outline-none"
                    >
                        <span>Kategori</span>
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 ml-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
                        </svg>
                    </button>
                    <div id="dropdownKategoriMenu" class="hidden absolute bg-white rounded-md mt-2 w-48 shadow-lg z-10">
                        @foreach($kategoris as $kategori_item)
                            <a href="{{ route('dashboard.index', ['kategori_id' => $kategori_item->id]) }}" 
                            class="block px-4 py-2 text-sm text-gray-700 hover:bg-red-100 hover:text-gray-900 focus:outline-none hover:no-underline">
                                {{ $kategori_item->kategori }}
                            </a>
                        @endforeach
                    </div>
                </div>

                
                <!-- Keranjang dan Login -->
                <div class="flex gap-4 items-center relative">
                    <!-- Ikon Keranjang -->
                    <a href="{{ route('keranjang.index') }}" class="text-white flex items-center hover:no-underline">
                        <i class="fas fa-shopping-cart text-xl"></i>
                        <span class="position-relative">
                            <!-- Menampilkan jumlah total buku di keranjang -->
                            <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-primary" id="cartCount">
                                0
                            </span>
                        </span>
                    </a>
                </div>
                
                
                
                


                    <!-- Nama User atau Tombol Login -->
                    <div class="relative">
                        <a href="{{ Auth::check() ? '#' : route('LoginUser.login') }}" class="text-white flex items-center hover:no-underline" id="profileBtn">
                            <i class="fas fa-user text-xl"></i> 
                            <span class="ml-2 text-sm hidden lg:block">
                                {{ Auth::check() ? Auth::user()->name : 'Login' }}
                            </span>
                        </a>
                    
                        <!-- Dropdown Menu -->
                        @if(Auth::check())
                            <div id="dropdownMenu" class="absolute right-0 mt-2 bg-white border border-gray-300 rounded-lg shadow-lg w-40 z-10 hidden">
                                <ul>
                                    <!-- Riwayat Transaksi -->
                                    <li>
                                        <a href="#" class="block px-4 py-2 text-gray-700 hover:bg-gray-200">Riwayat Transaksi</a>
                                    </li>
                                    <li>
                                        <form action="{{ route('logout') }}" method="POST" class="px-4 py-2">
                                            @csrf
                                            <button type="submit" class="text-gray-700 w-full text-left hover:bg-gray-200">Logout</button>
                                        </form>
                                    </li>
                                </ul>
                            </div>
                        @endif
                    </div>
                    
                </div>

                
            </div>
        </div>
    </nav>  

{{-- Details Buku --}}
<section id="detail-buku" class="mt-6">
    <!-- Detail Buku -->
    <div class="container mx-auto px-4">
        <div class="grid grid-cols-1 md:grid-cols-2 items-center gap-6">
            <!-- Bagian Gambar Buku -->
            <div class="flex justify-center md:justify-end">
                <img src="{{ asset('storage/buku/' . $book->sampul) }}" alt="{{ $book->judul_buku }}" class="w-full max-w-xs mx-auto rounded-lg">
            </div>
            
            <!-- Bagian Detail Buku -->
            <div>
                <h2 class="text-3xl font-semibold font-serif">{{ $book->judul_buku }}</h2>
                <p class="text-lg text-gray-600">By {{ $book->penulis }}</p>
                <h3 class="text-2xl font-bold text-red-600">Rp {{ number_format($book->harga, 0, ',', '.') }}</h3>
                
                <!-- Tab Deskripsi dan Detail -->
                <ul class="nav nav-tabs mt-4">
                    <li class="nav-item">
                        <a class="nav-link active text-blue-500" data-toggle="tab" href="#description">Sinopsis</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-blue-500" data-toggle="tab" href="#detail">Detail</a>
                    </li>
                </ul>
                
                <div class="tab-content mt-4">
                    <!-- Isi Tab Deskripsi -->
                    <div id="description" class="tab-pane active">
                        <p class="text-gray-700" id="sinopsis">
                            {{ Str::limit($book->sinopsis, 550) }} 
                            <a href="javascript:void(0);" id="read-more" class="text-blue-500">Lihat Selengkapnya</a>
                        </p>
                        <div id="full-sinopsis" class="hidden">
                            <p class="text-gray-700">{{ $book->sinopsis }}</p>
                            <a href="javascript:void(0);" id="read-less" class="text-blue-500">Tutup</a>
                        </div>
                    </div>
                    
                    <!-- Isi Tab Detail -->
                    <div id="detail" class="tab-pane fade">
                        <dl class="mt-4">
                            <div class="flex gap-4 mb-2">
                                <dt class="font-semibold w-32">Kategori</dt>
                                <dd class="font-normal">: {{ $book->kategori->kategori }}</dd>
                            </div>
                            <div class="flex gap-4 mb-2">
                                <dt class="font-semibold w-32">Halaman</dt>
                                <dd class="font-normal">: {{ $book->halaman }} halaman</dd>
                            </div>
                            <div class="flex gap-4 mb-2">
                                <dt class="font-semibold w-32">Berat</dt>
                                <dd class="font-normal">: {{ $book->berat }} gram</dd>
                            </div>
                            <div class="flex gap-4 mb-2">
                                <dt class="font-semibold w-32">Tahun Terbit</dt>
                                <dd class="font-normal">: {{ $book->tahun }}</dd>
                            </div>
                        </dl>
                    </div>
                </div>
                
                <!-- Tombol Keranjang -->
                <form action="{{ route('keranjang.add', $book->id) }}" method="POST">
                    @csrf
                    <button type="submit" class="mt-4 py-2 px-6 bg-red-600 text-white rounded-md hover:bg-red-700 transition duration-300">+ Keranjang</button>
                </form>
            </div>
        </div>
    </div>
</section>

{{-- Rekomendasi Buku ( RANDOM ) --}}
<section class="recommended-books mt-6">
    <div class="container mx-auto">
        <h4 class="store-title fw-bold fs-2">Rekomendasi Buku</h4>
        <div class="row row-cols-2 row-cols-sm-3 row-cols-md-4 row-cols-lg-6 g-2 g-lg-3 mt-4">
            <!-- Looping Buku Rekomendasi -->
            @foreach($recommendedBooks as $recommendedBook)
            <div class="col">
                <div class="card book-box shadow-sm h-100">
                    <div class="card-img-container mb-2">
                        <img src="{{ asset('storage/buku/' . $recommendedBook->sampul) }}" class="card-img-top" alt="{{ $recommendedBook->judul_buku }}" style="width: 100%; max-height: 240px; object-fit: contain; border-radius: 5px;">
                    </div>
                    <div class="card-body text-center">
                        <h6 class="card-author text-muted mb-1">{{ $recommendedBook->penulis }}</h6>
                        <p class="card-title fw-bold mb-1" style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
                            {{ $recommendedBook->judul_buku }}
                        </p>
                        <div class="price-container mb-3">
                            <span class="text-danger fw-bold">Rp {{ number_format($recommendedBook->harga, 0, ',', '.') }}</span>
                        </div>
                        <div class="d-flex justify-content-center gap-2">
                            <a href="{{ route('dashboard.details', $recommendedBook->id) }}" class="btn btn-danger btn-sm">Details</a>
                            <form action="#" method="POST">
                                @csrf
                                <button type="submit" class="btn btn-success btn-sm">
                                    <i class="fas fa-cart-plus"></i> Add
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            @endforeach
        </div>
    </div>
</section>

{{-- Bagian Footer --}}
<footer class="bg-gray-800 text-white py-8 mt-5">
        <div class="container mx-auto grid grid-cols-1 lg:grid-cols-3 gap-8">
            <!-- Tentang Kami -->
            <div>
                <h4 class="text-xl font-bold mb-4">Tentang C-BOOK</h4>
                <p class="text-gray-400 text-sm">
                    C-BOOK adalah platform terbaik untuk mendapatkan buku-buku favorit Anda, dari kategori fiksi, non-fiksi, hingga buku anak-anak. Kami berkomitmen untuk memberikan pengalaman belanja buku yang mudah dan nyaman.
                </p>
            </div>
    
            <!-- Tautan Cepat -->
            <div>
                <h4 class="text-xl font-bold mb-4">Tautan Cepat</h4>
                <ul class="text-gray-400 text-sm space-y-2">
                    <li><a href="{{ route('dashboard.index') }}" class="hover:text-white">Beranda</a></li>
                    <li><a href="#" class="hover:text-white">Kategori</a></li>
                    <li><a href="#" class="hover:text-white">Tentang Kami</a></li>
                    <li><a href="#" class="hover:text-white">Hubungi Kami</a></li>
                </ul>
            </div>
    
            <!-- Media Sosial -->
            <div>
                <h4 class="text-xl font-bold mb-4">Ikuti Kami</h4>
                <div class="flex space-x-4">
                    <a href="#" class="hover:text-gray-400"><i class="fab fa-facebook fa-2x"></i></a>
                    <a href="#" class="hover:text-gray-400"><i class="fab fa-twitter fa-2x"></i></a>
                    <a href="#" class="hover:text-gray-400"><i class="fab fa-instagram fa-2x"></i></a>
                    <a href="#" class="hover:text-gray-400"><i class="fab fa-linkedin fa-2x"></i></a>
                </div>
            </div>
        </div>
    
        <!-- Copyright -->
        <div class="border-t border-gray-700 mt-8 pt-4 text-center text-gray-400 text-sm">
            &copy; 2024 C-BOOK. All Rights Reserved.
        </div>
</footer>

{{-- Blok JavaScript --}}
<div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<div>

<!-- Script Dropdown -->
<script>

        // dropdown Kategori
        document.getElementById('dropdownKategoriToggle').addEventListener('click', function () {
        const dropdown = document.getElementById('dropdownKategoriMenu');
        dropdown.classList.toggle('hidden');
        });

        // Klik di luar dropdown untuk menutup
        document.addEventListener('click', function (e) {
        const dropdown = document.getElementById('dropdownKategoriMenu');
        const toggle = document.getElementById('dropdownKategoriToggle');
        if (!dropdown.contains(e.target) && !toggle.contains(e.target)) {
            dropdown.classList.add('hidden');
            }
        }); 

        // Tombol "Lihat Selengkapnya"
        document.getElementById('read-more').addEventListener('click', function() {
        document.getElementById('sinopsis').style.display = 'none';
        document.getElementById('full-sinopsis').style.display = 'block';
        });

        // Tombol "Tutup"
        document.getElementById('read-less').addEventListener('click', function() {
        document.getElementById('full-sinopsis').style.display = 'none';
        document.getElementById('sinopsis').style.display = 'block';
        });
    

</script>

</body>
</html>