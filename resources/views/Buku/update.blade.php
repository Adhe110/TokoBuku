<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="icon" href="/icon.png" type="image/png">
    <title>Admin - Edit Books</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body style="background: lightgray">

    <div class="container mt-5 mb-5">
        <div class="row">
            <div class="col-md-12">
                <div class="card border-0 shadow-sm rounded">
                    <div class="card-body">
                        <form action="{{ route('Buku.update', $buku->id) }}" method="POST"
                            enctype="multipart/form-data">
                            @csrf
                            @method('PUT') <!-- Menentukan metode PUT untuk update -->

                            {{-- // Sampul --}}
                            <div class="form-group mb-3">
                                <label class="font-weight-bold">Sampul</label>
                                <input type="file" class="form-control @error('sampul') is-invalid @enderror"
                                    name="sampul">
                                <small class="text-muted">Kosongkan jika tidak ingin mengubah gambar.</small>

                                <div class="mt-2">
                                    <img src="{{ asset('storage/Buku/' . $buku->sampul) }}" alt="Sampul Buku"
                                        width="150">
                                </div>

                                @error('sampul')
                                    <div class="alert alert-danger mt-2">{{ $message }}</div>
                                @enderror
                            </div>

                            {{-- // Judul Buku --}}
                            <div class="form-group mb-3">
                                <label class="font-weight-bold">JUDUL BUKU</label>
                                <input type="text" class="form-control" name="judul_buku"
                                    value="{{ old('judul_buku', $buku->judul_buku) }}" required>
                            </div>

                            {{-- // Penerbit --}}
                            <div class="form-group mb-3">
                                <label class="font-weight-bold">PENERBIT</label>
                                <input type="text" class="form-control" name="penerbit"
                                    value="{{ old('penerbit', $buku->penerbit) }}" required>
                            </div>

                            {{-- // Penulis --}}
                            <div class="form-group mb-3">
                                <label class="font-weight-bold">PENULIS</label>
                                <input type="text" class="form-control" name="penulis"
                                    value="{{ old('penulis', $buku->penulis) }}" required>
                            </div>

                            {{-- // Tahun dan ISBN --}}
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group mb-3">
                                        <label class="font-weight-bold">TAHUN</label>
                                        <input type="number" class="form-control" name="tahun"
                                            value="{{ old('tahun', $buku->tahun) }}" required>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group mb-3">
                                        <label class="font-weight-bold">ISBN</label>
                                        <input type="text" class="form-control" name="isbn"
                                            value="{{ old('isbn', $buku->isbn) }}" required>
                                    </div>
                                </div>
                            </div>

                            {{-- // Harga dan Stok --}}
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group mb-3">
                                        <label class="font-weight-bold">HARGA</label>
                                        <input type="number" class="form-control" name="harga"
                                            value="{{ old('harga', $buku->harga) }}" required>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group mb-3">
                                        <label class="font-weight-bold">STOK</label>
                                        <input type="number" class="form-control" name="stok"
                                            value="{{ old('stok', $buku->stok) }}" required>
                                    </div>
                                </div>
                            </div>

                            {{-- // Berat dan Halaman --}}
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group mb-3">
                                        <label class="font-weight-bold">BERAT (gram)</label>
                                        <input type="number" class="form-control" name="berat"
                                            value="{{ old('berat', $buku->berat) }}" required>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group mb-3">
                                        <label class="font-weight-bold">HALAMAN</label>
                                        <input type="number" class="form-control" name="halaman"
                                            value="{{ old('halaman', $buku->halaman) }}" required>
                                    </div>
                                </div>
                            </div>

                            {{-- // Kategori --}}
                            <div class="form-group mb-3">
                                <label class="font-weight-bold">KATEGORI</label>
                                <select name="id_kategori" class="form-control" required>
                                    <option value="">Pilih Kategori</option>
                                    @foreach ($kategori as $item)
                                        <option value="{{ $item->id }}"
                                            {{ $item->id == $buku->id_kategori ? 'selected' : '' }}>
                                            {{ $item->kategori }}
                                        </option>
                                    @endforeach
                                </select>
                            </div>

                            {{-- Sinopsis --}}
                            <div class="form-group mb-3">
                                <label class="font-weight-bold">SINOPSIS</label>
                                <textarea class="form-control" name="sinopsis" rows="5" required>{{ old('sinopsis', $buku->sinopsis) }}</textarea>
                            </div>

                            <button type="submit" class="btn btn-md btn-primary me-3">UPDATE</button>
                            <a href="{{ route('Buku.index') }}" class="btn btn-md btn-secondary">KEMBALI</a>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
