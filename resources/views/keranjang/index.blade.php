<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Keranjang Belanja</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <style>
        a.disabled {
            pointer-events: none;
            opacity: 0.5;
            cursor: not-allowed;
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

    
    {{-- Main Content --}}
    <main class="container mx-auto py-8">
        <div class="keranjang-list mb-6">
            <h1 class="text-2xl font-bold mb-6">Keranjang Belanja</h1>

            <div class="bg-white shadow rounded-lg p-4 mb-6 flex justify-between items-center">
                <div>
                    <input type="checkbox" id="selectAll" class="mr-2">
                    <label for="selectAll" class="text-lg font-medium">Pilih Semua</label>
                </div>
                <button id="deleteAll" class="bg-red-500 text-white px-4 py-2 rounded hidden">Hapus Semua</button>
            </div>

            <div id="cartItems">
                @foreach ($keranjang as $item)
                    <div class="bg-white shadow rounded-lg p-6 mb-6 item" data-id="{{ $item->id }}" data-price="{{ $item->buku->harga }}">
                        <div class="flex items-center gap-6">
                            <input type="checkbox" class="item-checkbox mr-2" data-id="{{ $item->id }}">
                            <div class="flex items-center gap-4 flex-1">
                                <img src="{{ asset('storage/Buku/' . $item->buku->sampul) }}" alt="{{ $item->buku->judul_buku }}" class="w-16 h-16 rounded">
                                <div>
                                    <h2 class="font-medium">{{ $item->buku->judul_buku }}</h2>
                                    <span class="text-sm text-gray-500">{{ $item->buku->jenis_buku }}</span>
                                </div>
                            </div>
                            <div class="text-right">
                                <p class="text-lg font-semibold text-black-600">Rp{{ number_format($item->buku->harga, 2) }}</p>
                            </div>
                            <div class="flex items-center gap-2">
                                <button class="btn-decrease bg-gray-200 text-gray-600 px-2 py-1 rounded" data-id="{{ $item->id }}">-</button>
                                <input type="text" value="{{ $item->jumlah }}" class="w-10 text-center border rounded item-quantity" data-id="{{ $item->id }}">
                                <button class="btn-increase bg-gray-200 text-gray-600 px-2 py-1 rounded" data-id="{{ $item->id }}">+</button>
                            </div>
                            <button class="btn-delete text-red-500 hover:text-red-600" data-id="{{ $item->id }}">
                                <i class="fas fa-trash"></i>
                            </button>
                            
                        </div>
                    </div>
                @endforeach
            </div>
        </div>

        <div class="ringkasan-keranjang bg-white shadow rounded-lg p-6">
            <h2 class="text-xl font-bold mb-4">Ringkasan Keranjang</h2>
            <div class="mb-4">
                <p class="flex justify-between">
                    <span>Total Barang:</span>
                    <span id="totalItems">0</span>
                </p>
                <p class="flex justify-between">
                    <span>Total Harga:</span>
                    <span id="totalPrice">Rp0</span>
                </p>
                <hr class="my-4">
                <p class="flex justify-between font-semibold">
                    <span>Subtotal Belanja:</span>
                    <span id="subtotal">Rp0</span>
                </p>
            </div>
            <a href="{{ route('checkout.index') }}" id="checkoutButton" class="w-full block bg-red-500 text-white py-2 rounded text-center hover:bg-red-600 disabled">
                Checkout
            </a>
        </div>
    </main>



    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const selectAllCheckbox = document.getElementById('selectAll');
            const itemCheckboxes = document.querySelectorAll('.item-checkbox');
            const checkoutButton = document.getElementById('checkoutButton');
    
            // Event listener untuk "Pilih Semua"
            selectAllCheckbox.addEventListener('change', function () {
                const isChecked = selectAllCheckbox.checked;
                itemCheckboxes.forEach(checkbox => {
                    checkbox.checked = isChecked;
                });
                updateCart();
            });
    
            // Event listener untuk setiap checkbox item
            itemCheckboxes.forEach(checkbox => {
                checkbox.addEventListener('change', function () {
                    updateCart();
                });
            });
    
            // Event listener untuk tombol delete
            document.querySelectorAll('.btn-delete').forEach(button => {
                button.addEventListener('click', function () {
                    const id = this.dataset.id;
                    const item = document.querySelector(`.item[data-id="${id}"]`);
                    if (item) {
                        // Mengirim request untuk menghapus item
                        fetch(`/keranjang/hapus/${id}`, {
                            method: 'DELETE',
                            headers: {
                                'Content-Type': 'application/json',
                                'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
                            }
                        })
                        .then(response => response.json())
                        .then(data => {
                            if (data.success) {
                                item.remove(); // Hapus item dari DOM
                                updateCart(); // Perbarui total keranjang
                            } else {
                                alert(data.message || 'Gagal menghapus item.');
                            }
                        })
                        .catch(error => console.error('Error:', error));
                    }
                });
            });
    
            // Event listener untuk tombol tambah/kurang jumlah
            document.querySelectorAll('.btn-increase').forEach(button => {
                button.addEventListener('click', function () {
                    const id = this.dataset.id;
                    const quantityInput = document.querySelector(`.item-quantity[data-id="${id}"]`);
                    if (quantityInput) {
                        quantityInput.value = parseInt(quantityInput.value) + 1;
                        updateQuantity(id, quantityInput.value); // Update di server
                        updateCart(); // Perbarui total keranjang
                    }
                });
            });
    
            document.querySelectorAll('.btn-decrease').forEach(button => {
                button.addEventListener('click', function () {
                    const id = this.dataset.id;
                    const quantityInput = document.querySelector(`.item-quantity[data-id="${id}"]`);
                    if (quantityInput && parseInt(quantityInput.value) > 1) {
                        quantityInput.value = parseInt(quantityInput.value) - 1;
                        updateQuantity(id, quantityInput.value); // Update di server
                        updateCart(); // Perbarui total keranjang
                    }
                });
            });
    
            // Fungsi untuk mengupdate kuantitas di server
            function updateQuantity(id, quantity) {
                fetch(`/keranjang/update/${id}`, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                        'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
                    },
                    body: JSON.stringify({ jumlah: quantity })
                })
                .then(response => response.json())
                .then(data => {
                    if (!data.success) {
                        alert('Gagal mengupdate kuantitas.');
                    }
                })
                .catch(error => console.error('Error:', error));
            }
    
            // Fungsi untuk memperbarui total keranjang
            function updateCart() {
                let totalItems = 0;
                let totalPrice = 0;
    
                const itemCheckboxes = document.querySelectorAll('.item-checkbox:checked');
    
                if (itemCheckboxes.length === 0) {
                    document.getElementById('totalItems').textContent = totalItems;
                    document.getElementById('totalPrice').textContent = `Rp0`;
                    document.getElementById('subtotal').textContent = `Rp0`;
    
                    // Nonaktifkan tombol checkout
                    checkoutButton.classList.add('disabled');
                    return;
                }
    
                itemCheckboxes.forEach((checkbox) => {
                    const id = checkbox.dataset.id;
                    const quantityElement = document.querySelector(`.item-quantity[data-id="${id}"]`);
                    const priceElement = document.querySelector(`.item[data-id="${id}"]`);
    
                    if (quantityElement && priceElement) {
                        const quantity = parseInt(quantityElement.value || 0);
                        const price = parseFloat(priceElement.dataset.price || 0);
    
                        if (quantity > 0) {
                            totalItems += quantity;
                            totalPrice += quantity * price;
                        }
                    }
                });
    
                document.getElementById('totalItems').textContent = totalItems;
                document.getElementById('totalPrice').textContent = `Rp${totalPrice.toLocaleString('id-ID')}`;
                document.getElementById('subtotal').textContent = `Rp${totalPrice.toLocaleString('id-ID')}`;
    
                // Aktifkan tombol checkout
                checkoutButton.classList.remove('disabled');
            }
    
            updateCart(); // Panggil update saat halaman dimuat
        });
    </script>
    

    {{-- FUNGSI JS NAVBAR --}}
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

    {{-- FUNGSI JS KERANJANG --}}
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


</body>
</html>
