@php
    $detil_permintaan = \App\Models\DetilPermintaan::where('id_permintaan', $getRecord()->id)->get();
    $list_perbandingan = [];

    foreach ($detil_permintaan as $key => $value) {
        $stok = \App\Models\Stok::with('detail_barang')
            ->where('organisasi', '9e06eeba-d0ce-40d0-8f3f-f0fba0dde023')
            ->where('barang', $value->id_barang)
            ->first();

        array_push($list_perbandingan, [
            'nama' => $stok->detail_barang->nama_barang,
            'stok' => $stok->stok,
            'permintaan' => $value->jumlah,
        ]);
    }

    // dump(collect($list_perbandingan[0]));

@endphp

<style>
    #table {
        font-family: Arial, Helvetica, sans-serif;
        border-collapse: collapse;
        width: 100%;
    }

    #table td,
    #table th {
        border: 1px solid #ddd;
        padding: 8px;
    }

    #table tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    #table tr:hover {
        background-color: #ddd;
    }

    #table th {
        padding-top: 12px;
        padding-bottom: 12px;
        text-align: left;
        color: black;
        background-color: #ffcc00;
    }
</style>

@if (auth()->user()->hasRole('Logistik'))
    <div>
        <x-filament::modal sticky-header slide-over width="3xl">
            <x-slot name="trigger">
                <x-filament::button size="xs" color="info" icon="heroicon-o-clock" icon-position="before" outlined>
                    Proces
                </x-filament::button>
            </x-slot>

            <x-slot name="heading">
                Perbandingan Stok dan Permintaan
            </x-slot>

            <table id="table">
                <thead>
                    <th style="width: 25%">
                        <center>Nama</center>
                    </th>
                    <th style="width: 25%">
                        <center>Stok</center>
                    </th>
                    <th style="width: 25%">
                        <center>Permintaan</center>
                    </th>
                    <th style="width: 25%">
                        <center>Status</center>
                    </th>
                </thead>
                <tbody>
                    @foreach ($list_perbandingan as $key => $value)
                        <tr>
                            <td>
                                {{ $value['nama'] }}
                            </td>
                            <td>
                                <center>{{ $value['stok'] }}</center>
                            </td>
                            <td>
                                <center>{{ $value['permintaan'] }}</center>
                            </td>
                            <td>
                                @if ($value['stok'] > $value['permintaan'])
                                    <center style="color: green">Terpenuhi</center>
                                @else
                                    <center style="color: red">Tidak Terpenuhi</center>
                                @endif
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
            <small style="color: red">* Pastikan list permintaan terchecklis semua!</small>

        </x-filament::modal>
    </div>
@else
@endif
