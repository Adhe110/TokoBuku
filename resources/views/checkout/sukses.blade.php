<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout Sukses</title>
    <script>
        // Fungsi untuk mengarahkan setelah 5 detik
        setTimeout(() => {
            window.location.href = "{{ route('dashboard.index') }}";
        }, 5000); // Waktu dalam milidetik (5000 ms = 5 detik)
    </script>
</head>
<body>
    <div style="text-align: center; margin-top: 50px;">
        <h1>Checkout Berhasil!</h1>
        <p>Terima kasih telah berbelanja. Anda akan diarahkan ke dashboard dalam 5 detik...</p>
        <p>Jika tidak, klik <a href="{{ route('dashboard.index') }}">di sini</a>.</p>
    </div>
</body>
</html>
