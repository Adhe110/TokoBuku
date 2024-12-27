<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Beranda - Toko Buku</title>
    <link rel="stylesheet" href="{{ asset('css/styles.css') }}">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet" />


    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <style>
        .banner-container {
            max-width: 100%;
            position: relative;
            overflow: hidden;
        }
    
        .carousel-inner {
            width: 100%;
            height: 100%;
        }
    
        .promo-banner img {
            object-fit: cover;
            width: 100%;
            height: 100%;
        }
    
        .carousel-control-prev-icon,
        .carousel-control-next-icon {
            background-color: black;
            border-radius: 50%;
        }

                /* Menyembunyikan scrollbar pada kontainer */
                #kategoriCarousel::-webkit-scrollbar {
            display: none;  /* Menyembunyikan scrollbar */
        }
    
        /* Menyembunyikan scrollbar untuk Firefox */
        #kategoriCarousel {
            scrollbar-width: none;  /* Menyembunyikan scrollbar pada Firefox */
        }
    </style>    

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
    

    <!-- Banner -->
    <div class="banner-container">
        <div id="bannerCarousel" class="carousel slide carousel-fade" data-bs-ride="carousel" data-bs-interval="5000">
            <div class="carousel-inner">
                <!-- Slide 1 -->
                <div class="carousel-item active">
                    <div class="promo-banner">
                        <img src="{{ asset('img/1.avif') }}" alt="Slide 1" class="d-block w-100" loading="lazy">
                    </div>
                </div>
                <!-- Slide 2 -->
                <div class="carousel-item">
                    <div class="promo-banner">
                        <img src="{{ asset('img/2.avif') }}" alt="Slide 2" class="d-block w-100" loading="lazy">
                    </div>
                </div>
                <!-- Slide 3 -->
                <div class="carousel-item">
                    <div class="promo-banner">
                        <img src="{{ asset('img/3.avif') }}" alt="Slide 3" class="d-block w-100" loading="lazy">
                    </div>
                </div>
            </div>

            <!-- Kontrol Carousel -->
            <button class="carousel-control-prev" type="button" data-bs-target="#bannerCarousel" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#bannerCarousel" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </div>


    {{-- Card Buku --}}
    <section class="bestseller-fiction mt-5" id="bestseller-books">
        <div class="container mt-5">
            <div class="text-start mb-4">
                <h4 class="store-title fw-bold fs-2">
                    <!-- Menampilkan nama kategori jika ada, jika tidak tampilkan 'Terbaru' -->
                    @if(isset($kategori))
                        {{ $kategori->kategori }}
                    @else
                        Terbaru
                    @endif
                </h4>
            </div>
            <div class="row row-cols-2 row-cols-sm-3 row-cols-md-4 row-cols-lg-6 g-3">
                <!-- Looping Buku -->
                @foreach($Buku as $book)
                <div class="col">
                    <div class="card book-box shadow-sm h-100 d-flex flex-column">
                        <div class="card-img-container">
                            <img src="{{ asset('storage/buku/' . $book->sampul) }}" 
                                class="card-img-top img-fluid" 
                                alt="{{ $book->judul_buku }}" 
                                style="max-height: 240px; object-fit: contain; border-radius: 5px;">
                        </div>
                        <div class="card-body text-center d-flex flex-column justify-content-between">
                            <div>
                                <h6 class="card-author text-muted mb-1">{{ $book->penulis }}</h6>
                                <p class="card-title fw-bold mb-1 text-truncate" title="{{ $book->judul_buku }}">
                                    {{ $book->judul_buku }}
                                </p>
                                <div class="price-container mb-3">
                                    <span class="text-danger fw-bold">Rp {{ number_format($book->harga, 0, ',', '.') }}</span>
                                </div>
                            </div>
                            <div class="d-flex justify-content-center gap-2 mt-3">
                                <a href="{{ route('dashboard.details', $book->id) }}" class="btn btn-danger btn-sm">Details</a>
                                <!-- Tambahkan ke Keranjang -->
                                <form action="{{ route('keranjang.add', $book->id) }}" method="POST" class="add-to-cart-form">
                                    @csrf
                                    <input type="hidden" name="jumlah" value="1"> <!-- Jumlah default adalah 1 -->
                                    <button type="submit" class="btn btn-success btn-sm add-to-cart-btn">
                                        <i class="fas fa-cart-plus"></i> Add
                                    </button>
                                </form>
                                
                            </div>
                        </div>
                    </div>
                </div>
                @endforeach
            </div>

            <!-- Pagination -->
            <div class="mt-4">
                {{ $Buku->links() }}
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
    </div>


    {{-- Fungsi JavaScript --}}
    <script>
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

            // Mengaktifkan dropdown saat profile button diklik
            document.getElementById('profileBtn').addEventListener('click', function () {
                const dropdown = document.getElementById('dropdownMenu');
                dropdown.classList.toggle('hidden');
            });


            // Fungsi untuk memperbarui jumlah keranjang
            let cartCount = 0;  // Menyimpan jumlah barang di keranjang

            document.getElementById('addToCartForm').addEventListener('submit', function(event) {
                event.preventDefault(); // Mencegah form submit yang otomatis

                // Menambah jumlah barang yang ada di keranjang
                cartCount++;

                // Update tampilan jumlah keranjang
                document.getElementById('cartCount').innerText = cartCount;

                // (Opsional) Bisa tambahkan logika untuk mengirim data ke server jika diperlukan
                // Misalnya menggunakan fetch() atau AJAX untuk menambah item ke keranjang di backend
                // fetch('/keranjang/add', { method: 'POST', body: new FormData(this) });
            });
    </script>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <script>
        $(document).ready(function() {
            // Tangkap event submit pada form
            $('.add-to-cart-form').on('submit', function(e) {
                e.preventDefault(); // Mencegah redirect default form
                
                var form = $(this); // Ambil elemen form
                var button = form.find('.add-to-cart-btn'); // Ambil tombol submit
                
                // Ubah tombol menjadi status "Loading"
                var originalButtonText = button.html();
                button.html('<i class="fas fa-spinner fa-spin"></i> Adding...');
                button.prop('disabled', true);
    
                // Kirim permintaan AJAX
                $.ajax({
                    url: form.attr('action'), // URL endpoint
                    type: 'POST',
                    data: form.serialize(), // Data form (termasuk CSRF token)
                    success: function(response) {
                        // Tampilkan pesan sukses (opsional)
                        
                        // Perbarui tombol
                        button.html('<i class="fas fa-cart-plus"></i> Added');
                        
                        // Pulihkan tombol setelah beberapa detik
                        setTimeout(function() {
                            button.html(originalButtonText);
                            button.prop('disabled', false);
                        }, 2000);
    
                        // Perbarui jumlah item di keranjang
                        updateCartCount();
                    },
                    error: function(xhr, status, error) {
                        // Tangani error
                        alert('Terjadi kesalahan, coba lagi.');
                        button.html(originalButtonText);
                        button.prop('disabled', false);
                    }
                });
            });
    
            // Fungsi untuk memperbarui jumlah item di keranjang
            function updateCartCount() {
                $.get("{{ route('keranjang.count') }}", function(data) {
                    if (data && data.count !== undefined) {
                        $('#cartCount').text(data.count); // Perbarui elemen jumlah keranjang
                    }
                }).fail(function() {
                    console.warn("Tidak dapat memperbarui jumlah keranjang.");
                });
            }
        });
    </script>
    


    <script>
        // Fungsi untuk mendapatkan jumlah keranjang
        function updateCartCount() {
            fetch("{{ route('keranjang.count') }}")
                .then(response => response.json())
                .then(data => {
                    const cartCount = document.getElementById('cartCount');
                    cartCount.textContent = data.count > 0 ? data.count : 0;
                })
                .catch(error => console.error('Error:', error));
        }
    
        // Panggil fungsi secara periodik (misal: setiap 10 detik)
        setInterval(updateCartCount, 10000); // 10 detik
        updateCartCount(); // Jalankan saat halaman dimuat
    </script>

@if (session('success'))
<div class="bg-green-500 text-white p-4 rounded mb-4">
    {{ session('success') }}
</div>
@endif


</body>

</html>