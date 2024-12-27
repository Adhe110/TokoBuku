<div class="container mx-auto mt-5">
    <h1 class="text-2xl font-bold mb-5">Riwayat</h1>

    @if($transaksi->isEmpty())
        <p class="text-gray-600">Anda belum memiliki riwayat transaksi.</p>
    @else
        <div class="overflow-x-auto">
            <table class="min-w-full bg-white border border-gray-300">
                <thead>
                    <tr class="bg-gray-200">
                        <th class="py-2 px-4 border-b">No</th>
                        <th class="py-2 px-4 border-b">Tanggal</th>
                        <th class="py-2 px-4 border-b">Buku</th>
                        <th class="py-2 px-4 border-b">Total Pembayaran</th>
                        <th class="py-2 px-4 border-b">Metode Pembayaran</th>
                        <th class="py-2 px-4 border-b">Status</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($transaksi as $index => $transaksiItem)
                        <tr>
                            <td class="py-2 px-4 border-b text-center">{{ $index + 1 }}</td>
                            <td class="py-2 px-4 border-b text-center">{{ $transaksiItem->created_at->format('d-m-Y H:i') }}</td>
                            <td class="py-2 px-4 border-b">
                                <ul>
                                    @foreach($transaksiItem->items as $item)
                                        <li>{{ $item->buku->judul }} (x{{ $item->jumlah }})</li>
                                    @endforeach
                                </ul>
                            </td>
                            <td class="py-2 px-4 border-b text-center">Rp {{ number_format($transaksiItem->total_harga) }}</td>
                            <td class="py-2 px-4 border-b text-center">{{ ucfirst($transaksiItem->metode_pembayaran) }}</td>
                            <td class="py-2 px-4 border-b text-center">{{ ucfirst($transaksiItem->status) }}</td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    @endif
</div>