<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="icon" href="/icon.png" type="image/png">
    <title>Admin - Show Books</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body style="background: lightgray">

    <div class="container mt-5 mb-5">
        <div class="row">
            <div class="col-md-4">
                <div class="card border-0 shadow-sm rounded">
                    <div class="card-body">
                        <img src="{{ asset('/storage/Buku/' . $buku->sampul) }}" class="rounded" style="width: 100%">
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                <div class="card border-0 shadow-sm rounded">

                    <div class="card-body">
                        <h3>{{ $buku->judul_buku }}</h3>
                        <hr />
                        <p><strong>Harga:</strong> {{ 'Rp ' . number_format($buku->harga, 2, ',', '.') }}</p>
                        <p><strong>Kategori:</strong>
                            @if ($buku->kategori)
                                {{ $buku->kategori->kategori }} <!-- Menampilkan nama kategori -->
                            @else
                                Tidak ada kategori
                            @endif
                        </p>
                        <hr />
                        <p><strong>Penerbit:</strong> {{ $buku->penerbit }}</p>
                        <p><strong>Penulis:</strong> {{ $buku->penulis }}</p>
                        <p><strong>Tahun:</strong> {{ $buku->tahun }}</p>
                        <p><strong>ISBN:</strong> {{ $buku->isbn }}</p>
                        <p><strong>Stock:</strong> {{ $buku->stok }}</p>
                        <hr />
                        <h5>Sinopsis:</h5>
                        <div>
                            {!! $buku->sinopsis !!}
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
