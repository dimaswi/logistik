<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Surat Serah Terima Barang</title>
</head>

@php
    setlocale(LC_ALL, 'id_ID', 'id', 'ID', 'id_ID.utf8');
    $hari = strftime('%d', strtotime($data[0]['pengadaan']['tanggal_serah_terima']));
    $bulan = strftime('%B', strtotime($data[0]['pengadaan']['tanggal_serah_terima']));
    $tahun = strftime('%Y', strtotime($data[0]['pengadaan']['tanggal_serah_terima']));
    // dump($pengadaan);
@endphp

<body
    style="margin-left: 10px; margin-right: 10px; margin-top: -6%; font-family: Arial, Helvetica, sans-serif; font-size: 11pt">

    <div style="text-align: left">
        <img src="{{ url('/storage/' . $kop) }}" height="178" width="700" alt="">
    </div>
    <hr>
    <div>
        <center style="font-size:22px;font-weight: bold">
            BERITA ACARA <br>
            SERAH TERIMA BARANG <br>
            Nomor, {{ $data[0]['pengadaan']['nomor_pengadaan'] }}
        </center>
    </div>

    <div style="padding-left: 20px;font-size:16px">
        <p>Pada hari ini, {{ $hari }} tanggal, {{ Carbon\Carbon::parse($data[0]['pengadaan']['tanggal_serah_terima'])->format('d') }} Bulan, {{ $bulan }} Tahun, {{ $tahun }} yang bertanda tangan dibawah ini :</p>
        <table>
            <tr>
                <td rowspan="2"></td>
                <td></td>
                <td></td>
            </tr>
        </table>
    </div>

</body>

</html>
