<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="/icon.png" type="image/png">

    <title>Admin - Data Books</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
    
</head>

<body id="page-top">


    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="{{ route('admin.dashboard') }}">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">Admin</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="{{ route('admin.dashboard') }}">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>Dashboard</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Data Buku
            </div>


            <!-- Nav Item - Data Buku -->
            <li class="nav-item">
                <a class="nav-link" href="{{ route('Buku.index') }}">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>Buku</span></a>

                <a class="nav-link" href="{{ route('Kategori.index') }}">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>Kategori</span></a>
            </li>


            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Data User
            </div>

            <!-- Nav Item - Charts -->
            <li class="nav-item">
                <a class="nav-link" href="{{ route('Users.index') }}">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>User</span></a>
                    <a class="nav-link" href="{{route('transaksi.index')}}">
                        <i class="fas fa-fw fa-table"></i>
                        <span>Transaksi</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Topbar -->
            <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                <!-- Sidebar Toggle (Topbar) -->
                <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                    <i class="fa fa-bars"></i>
                </button>

                <!-- Topbar Search -->
                <form action="{{ route('Buku.index') }}" method="GET" class="d-flex mb-3">
                    <input type="text" name="search" class="form-control mr-2" placeholder="Cari buku..."
                        value="{{ request('search') }}">
                    <button type="submit" class="btn btn-primary">Cari</button>
                </form>


                <!-- Topbar Navbar -->
                <ul class="navbar-nav ml-auto">

                    <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                    <li class="nav-item dropdown no-arrow d-sm-none">
                        <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-search fa-fw"></i>
                        </a>
                        <!-- Dropdown - Messages -->
                        <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                            aria-labelledby="searchDropdown">
                            <form class="form-inline mr-auto w-100 navbar-search">
                                <div class="input-group">
                                    <input type="text" class="form-control bg-light border-0 small"
                                        placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                                    <div class="input-group-append">
                                        <button class="btn btn-primary" type="button">
                                            <i class="fas fa-search fa-sm"></i>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </li>



                    <div class="topbar-divider d-none d-sm-block"></div>

                    <!-- Nav Item - User Information -->
                    <li class="nav-item dropdown no-arrow">
                        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="mr-2 d-none d-lg-inline text-gray-600 small">@if(Auth::guard('admin')->check())
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">
                                    {{ Auth::guard('admin')->user()->name }}
                                </span>
                            @else
                                <script>
                                    // Jika belum login, alihkan ke halaman login admin
                                    window.location.href = "{{ route('admin.login') }}";
                                </script>
                            @endif
                            </span>
                        </a>
                    
                        <!-- Dropdown - Hanya Tombol Logout -->
                        <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                            aria-labelledby="userDropdown">
                            <a class="dropdown-item" href="#" onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
                                <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                Logout
                            </a>
                    
                            <!-- Form Logout -->
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
                    <h1 class="h3 mb-2 text-gray-800">Data Buku</h1>
                    <div class="card shadow mb-4">
                        <div class="card-body">
                            <div class="d-flex justify-content-end mb-3">
                                <a href="{{ route('Buku.create') }}" class="btn btn-sm btn-success">TAMBAH BUKU</a>
                            </div>

                            <!-- Responsive Table Wrapper -->
                            <div class="table-responsive">
                                <table class="table table-bordered" style="table-layout: auto; width: 100%;">
                                    <thead>
                                        <tr>
                                            <th class="text-center" style="width: 100px;">SAMPUL</th>
                                            <th class="text-center" style="width: 200px;">JUDUL BUKU</th>
                                            <th class="text-center" style="width: 100px;">KATEGORI</th>
                                            <th class="text-center" style="width: 120px;">PENERBIT</th>
                                            <th class="text-center" style="width: 120px;">PENULIS</th>
                                            <th class="text-center" style="width: 70px;">TAHUN</th>
                                            <th class="text-center" style="width: 120px;">ISBN</th>
                                            <th class="text-center" style="width: 200px;">HARGA</th>
                                            <th class="text-center" style="width: 70px;">STOK</th>
                                            <th class="text-center" style="width: 200px;">SINOPSIS</th>
                                            <th class="text-center aksi-column" style="width: 150px;">AKSI</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @forelse ($Buku as $item)
                                            <tr>
                                                <td class="text-center">
                                                    <img src="{{ asset('/storage/Buku/' . $item->sampul) }}"
                                                        class="cover-image rounded"
                                                        style="width: 80px; height: 120px; object-fit: cover;">
                                                </td>
                                                <td class="text-center">{{ $item->judul_buku }}</td>
                                                <td class="text-center">
                                                    {{ $item->kategori ? $item->kategori->kategori : 'Tidak ada kategori' }}
                                                </td>
                                                <td class="text-center">{{ $item->penerbit }}</td>
                                                <td class="text-center">{{ $item->penulis }}</td>
                                                <td class="text-center">{{ $item->tahun }}</td>
                                                <td class="text-center">{{ $item->isbn }}</td>
                                                <td class="text-center">
                                                    {{ 'Rp ' . number_format($item->harga, 2, ',', '.') }}</td>
                                                <td class="text-center">{{ $item->stok }}</td>
                                                <td class="text-center sinopsis-cell"
                                                    style="max-width: 200px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
                                                    {{ $item->sinopsis }}
                                                </td>
                                                <td class="text-center aksi-column">
                                                    <div class="d-flex justify-content-center">
                                                        <a href="{{ route('Buku.show', $item->id) }}"
                                                            class="btn btn-sm btn-primary mx-1 aksi-button">Show</a>
                                                        <a href="{{ route('Buku.edit', $item->id) }}"
                                                            class="btn btn-sm btn-warning mx-1 aksi-button">Edit</a>
                                                        <form action="{{ route('Buku.destroy', $item->id) }}"
                                                            method="POST"
                                                            onsubmit="return confirm('Apakah Anda Yakin ?');"
                                                            style="display:inline-block;">
                                                            @csrf
                                                            @method('DELETE')
                                                            <button type="submit"
                                                                class="btn btn-sm btn-danger mx-1 aksi-button">Delete</button>
                                                        </form>
                                                    </div>
                                                </td>
                                            </tr>
                                        @empty
                                            <tr>
                                                <td colspan="11" class="text-center">
                                                    <div class="alert alert-danger mb-0">Data Buku belum tersedia.
                                                    </div>
                                                </td>
                                            </tr>
                                        @endforelse
                                    </tbody>
                                </table>
                            </div>
                            <!-- Pagination Links -->
                            <div class="d-flex justify-content-center">
                                {{ $Buku->links('pagination::bootstrap-4') }}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End of Main Content -->



            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2024</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->
    </div>
    <!-- End of Page Wrapper -->

    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="js/sb-admin-2.min.js"></script>


</body>

</html>
