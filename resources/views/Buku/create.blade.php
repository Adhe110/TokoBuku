<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="icon" href="/icon.png" type="image/png">
    
    <title>Admin - Create Books </title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body style="background: lightgray">

    <div class="container mt-5 mb-5">
        <div class="row">
            <div class="col-md-12">
                <div class="card border-0 shadow-sm rounded">
                    <div class="card-body">
                        <form action="{{ route('Buku.store') }}" method="POST" enctype="multipart/form-data">
                            @csrf

                            <!-- Sampul -->
                            <div class="form-group mb-3">
                                <label class="font-weight-bold">Sampul</label>
                                <input type="file" class="form-control @error('sampul') is-invalid @enderror"
                                    name="sampul">
                                @error('sampul')
                                    <div class="alert alert-danger mt-2">
                                        {{ $message }}
                                    </div>
                                @enderror
                            </div>

                            <!-- Judul Buku -->
                            <div class="form-group mb-3">
                                <label class="font-weight-bold">JUDUL BUKU</label>
                                <input type="text" class="form-control @error('judul_buku') is-invalid @enderror"
                                    name="judul_buku" value="{{ old('judul_buku') }}" placeholder="Masukkan Judul Buku"
                                    required>
                                @error('judul_buku')
                                    <div class="alert alert-danger mt-2">
                                        {{ $message }}
                                    </div>
                                @enderror
                            </div>

                            <!-- Penerbit -->
                            <div class="form-group mb-3">
                                <label class="font-weight-bold">PENERBIT</label>
                                <input type="text" class="form-control @error('penerbit') is-invalid @enderror"
                                    name="penerbit" value="{{ old('penerbit') }}" placeholder="Masukkan Penerbit Buku"
                                    required>
                                @error('penerbit')
                                    <div class="alert alert-danger mt-2">
                                        {{ $message }}
                                    </div>
                                @enderror
                            </div>

                            <!-- Penulis -->
                            <div class="form-group mb-3">
                                <label class="font-weight-bold">PENULIS</label>
                                <input type="text" class="form-control @error('penulis') is-invalid @enderror"
                                    name="penulis" value="{{ old('penulis') }}" placeholder="Masukkan Penulis Buku"
                                    required>
                                @error('penulis')
                                    <div class="alert alert-danger mt-2">
                                        {{ $message }}
                                    </div>
                                @enderror
                            </div>

                            <!-- Tahun dan ISBN -->
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group mb-3">
                                        <label class="font-weight-bold">TAHUN</label>
                                        <input type="number" class="form-control @error('tahun') is-invalid @enderror"
                                            name="tahun" value="{{ old('tahun') }}"
                                            placeholder="Masukkan Tahun Terbit" required>
                                        @error('tahun')
                                            <div class="alert alert-danger mt-2">
                                                {{ $message }}
                                            </div>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group mb-3">
                                        <label class="font-weight-bold">ISBN</label>
                                        <input type="text" class="form-control @error('isbn') is-invalid @enderror"
                                            name="isbn" value="{{ old('isbn') }}" placeholder="Masukkan ISBN Buku"
                                            required>
                                        @error('isbn')
                                            <div class="alert alert-danger mt-2">
                                                {{ $message }}
                                            </div>
                                        @enderror
                                    </div>
                                </div>
                            </div>

                            <!-- Harga dan Stok -->
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group mb-3">
                                        <label class="font-weight-bold">HARGA</label>
                                        <input type="number" class="form-control @error('harga') is-invalid @enderror"
                                            name="harga" value="{{ old('harga') }}"
                                            placeholder="Masukkan Harga Buku" required>
                                        @error('harga')
                                            <div class="alert alert-danger mt-2">
                                                {{ $message }}
                                            </div>
                                        @enderror
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group mb-3">
                                        <label class="font-weight-bold">STOK</label>
                                        <input type="number" class="form-control @error('stok') is-invalid @enderror"
                                            name="stok" value="{{ old('stok') }}" placeholder="Masukkan Stok Buku"
                                            required>
                                        @error('stok')
                                            <div class="alert alert-danger mt-2">
                                                {{ $message }}
                                            </div>
                                        @enderror
                                    </div>
                                </div>

                                <!-- Berat dan Halaman -->
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group mb-3">
                                            <label class="font-weight-bold">BERAT (gram)</label>
                                            <input type="number"
                                                class="form-control @error('berat') is-invalid @enderror" name="berat"
                                                value="{{ old('berat') }}" placeholder="Masukkan Berat Buku" required>
                                            @error('berat')
                                                <div class="alert alert-danger mt-2">
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group mb-3">
                                            <label class="font-weight-bold">HALAMAN</label>
                                            <input type="number"
                                                class="form-control @error('halaman') is-invalid @enderror"
                                                name="halaman" value="{{ old('halaman') }}"
                                                placeholder="Masukkan Jumlah Halaman" required>
                                            @error('halaman')
                                                <div class="alert alert-danger mt-2">
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                        </div>
                                    </div>
                                </div>

                                <!-- Sinopsis -->
                                <div class="form-group mb-3">
                                    <label class="font-weight-bold">SINOPSIS</label>
                                    <textarea class="form-control @error('sinopsis') is-invalid @enderror" name="sinopsis" rows="5"
                                        placeholder="Masukkan Sinopsis Buku" required>{{ old('sinopsis') }}</textarea>
                                    @error('sinopsis')
                                        <div class="alert alert-danger mt-2">
                                            {{ $message }}
                                        </div>
                                    @enderror
                                </div>

                                <!-- Kategori -->
                                <div class="form-group mb-3">
                                    <label class="font-weight-bold">KATEGORI</label>
                                    <select class="form-control @error('id_kategori') is-invalid @enderror"
                                        name="id_kategori" required>
                                        <option value="">Pilih Kategori</option>
                                        @foreach ($kategoris as $kategori)
                                            <option value="{{ $kategori->id }}"
                                                {{ old('id_kategori') == $kategori->id ? 'selected' : '' }}>
                                                {{ $kategori->kategori }}</option>
                                        @endforeach
                                    </select>
                                    @error('id_kategori')
                                        <div class="alert alert-danger mt-2">
                                            {{ $message }}
                                        </div>
                                    @enderror
                                </div>

                            </div>

                            {{-- Tombol Simpan , Kembali , Reset --}}
                            <div class="d-flex justify-content-between">
                                <!-- Tombol SIMPAN dan KEMBALI -->
                                <div>
                                    <button type="submit" class="btn btn-md btn-primary me-3">SIMPAN</button>
                                    <a href="javascript:history.back()" class="btn btn-md btn-warning me-4">KEMBALI</a>
                                </div>
                                
                                <!-- Tombol RESET di pojok kanan -->
                                <div class="ml-auto">
                                    <button type="reset" class="btn btn-md btn-danger">RESET</button>
                                </div>
                            </div>
                            


                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
