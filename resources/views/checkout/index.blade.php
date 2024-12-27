<!DOCTYPE html>
<html lang="id">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout - C-BOOK</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-..." crossorigin="anonymous">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>

<body class="bg-gray-100">


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
    
    <!-- Main Content -->
    <div class="container mx-auto mt-6 p-6 bg-white rounded shadow-md">
        <h1 class="text-2xl font-semibold text-gray-700">Checkout</h1>

        <!-- Daftar Buku -->
        <div class="mt-4">
            <h2 class="text-lg font-semibold text-gray-800 mb-2">Detail Pesanan</h2>
            <table class="w-full border-collapse border border-gray-300">
                <thead class="bg-gray-200">
                    <tr>
                        <th class="border border-gray-300 px-4 py-2 text-left">Buku</th>
                        <th class="border border-gray-300 px-4 py-2 text-center">Jumlah</th>
                        <th class="border border-gray-300 px-4 py-2 text-right">Subtotal</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($keranjang as $item)
                    <tr>
                        <td class="border border-gray-300 px-4 py-2">{{ $item->buku->judul_buku }}</td>
                        <td class="border border-gray-300 px-4 py-2 text-center">{{ $item->jumlah }}</td>
                        <td class="border border-gray-300 px-4 py-2 text-right">Rp {{ number_format($item->buku->harga * $item->jumlah) }}</td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>

        <!-- Formulir untuk checkout -->
        <form action="{{ route('checkout.proses') }}" method="POST" id="checkoutForm" class="mt-6" enctype="multipart/form-data">
            @csrf
            <div class="mt-4">
                <label for="nama_penerima" class="block text-gray-700">Nama Penerima:</label>
                <input type="text" name="nama_penerima" id="nama_penerima" class="w-full p-2 border rounded mt-2" required>
            </div>
            <br>

            <div class="mt-4">
                <label for="alamat" class="block text-gray-700">Alamat:</label>
                <textarea name="alamat" id="alamat" class="w-full p-2 border rounded mt-2" required></textarea>
            </div>
            <br>

            <div class="mt-4">
                <label for="metode_pembayaran" class="block text-gray-700">Metode Pembayaran:</label>
                <select name="metode_pembayaran" id="metode_pembayaran" class="w-full p-2 border rounded mt-2" required>
                    <option value="cod">Cash on Delivery</option>
                    <option value="transfer">Transfer Bank</option>

                </select>
            </div>
            <br>

            <!-- Rincian Transfer Bank -->
            <!-- Rincian Transfer Bank -->
            <div id="transferBankDetails" class="hidden mt-4">
                <p class="text-gray-700">
                    <strong>Nomor Rekening:</strong> 1234567890 (Bank C-BOOK)
                </p>
                <p class="text-gray-700 mb-2">
                    Silakan transfer ke rekening di atas dan unggah bukti bayar Anda di bawah ini.
                </p>
                <label for="bukti_bayar" class="block text-gray-700">Unggah Bukti Bayar:</label>
                <input type="file" name="bukti_bayar" id="bukti_bayar" class="w-full p-2 border rounded mt-2" accept="image/*">
            </div>


            <!-- Harga Details -->
            <div id="harga-details" class="mt-4">
                <h3 class="text-lg font-semibold text-gray-800">Total: <span id="totalHarga">Rp {{ number_format($totalHarga) }}</span></h3>
                <p id="ongkir" class="text-sm text-gray-600">Ongkir: Rp 0</p>
                <p><strong id="totalPembayaran" class="text-xl text-gray-900">Total Pembayaran: Rp {{ number_format($totalHarga) }}</strong></p>
            </div>
            <br>

            <!-- Tombol Checkout -->
            <button type="submit" class="bg-red-600 text-white px-6 py-2 rounded">Checkout</button>
        </form>
    </div>

    <!-- Footer -->
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



    <script>
        $(document).ready(function() {
            // Ambil total harga dari keranjang yang sudah ada
            var totalHarga = {{ $totalHarga }};
            var ongkir = 0;

            // Logika perhitungan ongkir
            if (totalHarga < 100000) {
                ongkir = 20000; // Ongkir Rp20.000 jika total harga < 100rb
            }

            // Update ongkir dan total pembayaran di halaman
            $('#ongkir').text('Ongkir: Rp ' + formatRupiah(ongkir));
            $('#totalPembayaran').text('Total Pembayaran: Rp ' + formatRupiah(totalHarga + ongkir));

            // Fungsi untuk memformat angka menjadi format mata uang Rupiah
            function formatRupiah(angka) {
                return angka.toLocaleString('id-ID');
            }

            // Tampilkan/matikan rincian transfer bank berdasarkan metode pembayaran
            $(document).ready(function () {
                $('#metode_pembayaran').change(function () {
                    if ($(this).val() === 'transfer') {
                        $('#transferBankDetails').removeClass('hidden');
                        $('#bukti_bayar').prop('required', true); // Jadikan wajib
                    } else {
                        $('#transferBankDetails').addClass('hidden');
                        $('#bukti_bayar').prop('required', false); // Non-wajib
                    }
                });
            });

        });
    </script>


<script>
    function updateCart() {
        let totalItems = 0;
        let totalPrice = 0;

        const itemCheckboxes = document.querySelectorAll('.item-checkbox:checked');

        if (itemCheckboxes.length === 0) {
            document.getElementById('totalItems').textContent = totalItems;
            document.getElementById('totalPrice').textContent = `Rp0`;
            document.getElementById('subtotal').textContent = `Rp0`;
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
    }

    document.addEventListener('DOMContentLoaded', function () {
        const selectAllCheckbox = document.getElementById('selectAll');
        const itemCheckboxes = document.querySelectorAll('.item-checkbox');

        selectAllCheckbox.addEventListener('change', function () {
            const isChecked = selectAllCheckbox.checked;

            itemCheckboxes.forEach(checkbox => {
                checkbox.checked = isChecked;
            });

            updateCart();
        });

        itemCheckboxes.forEach(checkbox => {
            checkbox.addEventListener('change', function () {
                updateCart();
            });
        });

        document.querySelectorAll('.btn-increase').forEach(button => {
            button.addEventListener('click', function () {
                const id = this.dataset.id;
                const input = document.querySelector(`.item-quantity[data-id="${id}"]`);
                let newQuantity = parseInt(input.value) + 1;
                input.value = newQuantity;

                updateQuantityOnServer(id, newQuantity);
            });
        });

        document.querySelectorAll('.btn-decrease').forEach(button => {
            button.addEventListener('click', function () {
                const id = this.dataset.id;
                const input = document.querySelector(`.item-quantity[data-id="${id}"]`);
                let newQuantity = parseInt(input.value);

                if (newQuantity > 1) {
                    newQuantity--;
                    input.value = newQuantity;

                    updateQuantityOnServer(id, newQuantity);
                }
            });
        });

        document.querySelectorAll('.btn-delete').forEach(button => {
            button.addEventListener('click', function () {
                const id = this.dataset.id;

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
                        const item = document.querySelector(`.item[data-id="${id}"]`);
                        item.remove();
                        updateCart();
                    } else {
                        alert('Gagal menghapus item');
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                });
            });
        });

        updateCart();
    });

    function updateQuantityOnServer(id, newQuantity) {
        fetch(`/keranjang/update/${id}`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
            },
            body: JSON.stringify({
                jumlah: newQuantity
            })
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                updateCart();
            } else {
                alert('Gagal memperbarui jumlah');
            }
        })
        .catch(error => {
            console.error('Error:', error);
        });
    }
</script>


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
</body>
</html>
