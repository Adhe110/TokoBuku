<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="{{ asset('icon.png') }}" type="image/png">

    <title>Admin - Data Users</title>

    <!-- Custom fonts for this template-->
    <link href="{{ asset('vendor/fontawesome-free/css/all.min.css')}}" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="{{ asset('css/sb-admin-2.min.css') }}" rel="stylesheet">

    <style>
        .table th,
        .table td {
            white-space: nowrap;
            text-align: center;
        }

        .table .aksi-column {
            width: 150px;
        }

        /* Menggeser tabel ke kanan */
        .table-wrapper {
            margin-left: auto;
            margin-right: 0;
            width: 100%;
        }

        .table {
            table-layout: fixed;
        }

        /* Modal styles */
        .modal {
            display: none;
            position: fixed;
            z-index: 1000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.8);
        }

        .modal img {
            margin: auto;
            display: block;
            max-width: 90%;
            max-height: 90%;
        }

        .modal .close {
            position: absolute;
            top: 10px;
            right: 20px;
            font-size: 35px;
            color: white;
            cursor: pointer;
        }
    </style>
</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="{{ route('admin.dashboard') }}">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-home"></i>
                </div>
                <div class="sidebar-brand-text mx-3">Admin</div>
            </a>

            <hr class="sidebar-divider my-0">
            <li class="nav-item active">
                <a class="nav-link" href="{{ route('admin.dashboard') }}">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>Dashboard</span>
                </a>
            </li>

            <hr class="sidebar-divider">
            <div class="sidebar-heading">
                Data Buku
            </div>
            <li class="nav-item">
                <a class="nav-link" href="{{ route('Buku.index') }}">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>Buku</span>
                </a>
                <a class="nav-link" href="{{ route('Kategori.index') }}">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>Kategori</span>
                </a>
            </li>

            <hr class="sidebar-divider">
            <div class="sidebar-heading">
                Data User
            </div>
            <li class="nav-item">
                <a class="nav-link" href="{{ route('Users.index') }}">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>User</span>
                </a>
                <a class="nav-link" href="tables.html">
                    <i class="fas fa-fw fa-table"></i>
                    <span>Transaksi</span>
                </a>
            </li>
            <hr class="sidebar-divider d-none d-md-block">
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>
        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Topbar -->
            <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                    <i class="fa fa-bars"></i>
                </button>
                <form action="{{ route('transaksi.index') }}" method="GET" class="d-flex mb-3">
                    <input type="text" name="search" class="form-control mr-2" placeholder="Cari transaksi..." value="{{ request('search') }}">
                    <button type="submit" class="btn btn-primary">Cari</button>
                </form>
                
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item dropdown no-arrow">
                        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="mr-2 d-none d-lg-inline text-gray-600 small">{{ Auth::guard('admin')->check() ? Auth::guard('admin')->user()->name : '' }}</span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                            <a class="dropdown-item" href="#" onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
                                <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                Logout
                            </a>
                            <form id="logout-form" action="{{ route('admin.logout') }}" method="POST" style="display: none;">
                                @csrf
                            </form>
                        </div>
                    </li>
                </ul>
            </nav>
            <!-- End of Topbar -->

           <!-- Begin Page Content -->
<div id="content">
    <div class="container-fluid">
        <h1 class="h3 mb-2 text-gray-800">Kelola Transaksi</h1>

        @if(session('success'))
            <div id="successAlert" class="alert alert-success alert-dismissible fade show" role="alert">
                {{ session('success') }}
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <script>
                // Menyimpan posisi scroll tabel saat alert muncul
                var tableElement = document.querySelector('.table-responsive');
                var scrollPosition = tableElement.scrollTop;

                // Menghilangkan alert setelah 2 detik
                setTimeout(function() {
                    var alertElement = document.getElementById('successAlert');
                    if (alertElement) {
                        alertElement.classList.remove('show');
                        alertElement.classList.add('fade');
                    }

                    // Mengembalikan scroll posisi tabel setelah alert hilang
                    tableElement.scrollTop = scrollPosition;  // Kembalikan posisi scroll ke posisi semula
                }, 2000); // 2000 ms = 2 detik
            </script>
        @endif

        <div class="card shadow mb-4">
            <div class="card-body">
                <!-- Responsive Table Wrapper -->
                <div class="table-responsive">
                    <table class="table table-bordered" style="table-layout: auto; width: 100%;">
                        <thead>
                            <tr class="bg-gray-200">
                                <th class="text-center" style="width: 50px;">No</th>
                                <th class="text-center" style="width: 150px;">Nama User</th>
                                <th class="text-center" style="width: 200px;">Nama Penerima</th>
                                <th class="text-center" style="width: 150px;">Total Harga</th>
                                <th class="text-center" style="width: 120px;">Bukti Bayar</th>
                                <th class="text-center" style="width: 120px;">Status</th>
                                <th class="text-center" style="width: 150px;">Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($transaksi as $index => $item)
                                <tr>
                                    <td class="text-center">{{ $index + 1 }}</td>
                                    <td class="text-center">{{ $item->user->name }}</td>
                                    <td class="text-center">{{ $item->nama_penerima }}</td>
                                    <td class="text-center">Rp {{ number_format($item->total_harga) }}</td>
                                    <td class="text-center">
                                        @if($item->bukti_bayar)
                                            <img src="{{ asset('/storage/' . $item->bukti_bayar) }}"
                                                 class="img-thumbnail bukti-bayar-img"
                                                 style="width: 100px; height: 100px; object-fit: cover; border: 1px solid #ddd;"
                                                 alt="Bukti Bayar">
                                        @else
                                            <span class="text-gray-600">COD</span>
                                        @endif
                                    </td>

                                    <td class="text-center">
                                        <span class="px-2 py-1 rounded text-black 
                                            {{ $item->status == 'pending' ? 'bg-yellow-500' : '' }}
                                            {{ $item->status == 'confirmed' ? 'bg-blue-500' : '' }}
                                            {{ $item->status == 'processed' ? 'bg-orange-500' : '' }}
                                            {{ $item->status == 'completed' ? 'bg-green-500' : '' }}
                                            {{ $item->status == 'cancelled' ? 'bg-red-500' : '' }}">
                                            {{ ucfirst($item->status) }}
                                        </span>
                                    </td>
                                    <td class="text-center">
                                        <form action="{{ route('transaksi.update-status', $item->id) }}" method="POST">
                                            @csrf
                                            <select name="status" class="border border-gray-300 rounded px-2 py-1">
                                                <option value="pending" {{ $item->status == 'pending' ? 'selected' : '' }}>Pending</option>
                                                <option value="confirmed" {{ $item->status == 'confirmed' ? 'selected' : '' }}>Confirmed</option>
                                                <option value="processed" {{ $item->status == 'processed' ? 'selected' : '' }}>Processed</option>
                                                <option value="completed" {{ $item->status == 'completed' ? 'selected' : '' }}>Completed</option>
                                                <option value="cancelled" {{ $item->status == 'cancelled' ? 'selected' : '' }}>Cancelled</option>
                                            </select>
                                            <button type="submit" class="bg-blue-500 text-black px-4 py-1 rounded hover:bg-blue-600">
                                                Update
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>

                    <!-- Pagination -->
                    <div class="d-flex justify-content-center mt-4">
                        {{ $transaksi->links('pagination::bootstrap-4') }}
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

E:\VERSI HAMPIR\tesst\resources\views\transaksi\index.blade.php



        <!-- Image Modal -->
        <div id="imageModal" class="modal">
            <span class="close">&times;</span>
            <img id="modalImage">
        </div>

        

        <script>
            document.addEventListener('DOMContentLoaded', function () {
                const modal = document.getElementById('imageModal');
                const modalImage = document.getElementById('modalImage');
                const closeModal = document.querySelector('#imageModal .close');

                // Open modal
                document.querySelectorAll('.bukti-bayar-img').forEach(img => {
                    img.addEventListener('click', function () {
                        modal.style.display = "block";
                        modalImage.src = this.src;
                    });
                });

                // Close modal
                closeModal.addEventListener('click', function () {
                    modal.style.display = "none";
                });

                // Close modal on clicking outside the image
                modal.addEventListener('click', function (event) {
                    if (event.target === modal) {
                        modal.style.display = "none";
                    }
                });
            });
        </script>

        <!-- Bootstrap core JavaScript-->
        <script src="{{ asset('vendor/jquery/jquery.min.js') }}"></script>
        <script src="{{ asset('vendor/bootstrap/js/bootstrap.bundle.min.js') }}"></script>

        <!-- Core plugin JavaScript-->
        <script src="{{ asset('vendor/jquery-easing/jquery.easing.min.js') }}"></script>

        <!-- Custom scripts for all pages-->
        <script src="{{ asset('js/sb-admin-2.min.js') }}"></script>
    </div>
</body>

</html>
