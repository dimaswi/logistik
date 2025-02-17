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
    style="margin-left: 10px; margin-right: 10px; margin-top: -6%; font-family: Arial, Helvetica, sans-serif; font-size: 10pt">

    <div style="text-align: left">
        <img src="{{ url('/storage/' . $kop) }}" height="178" width="700" alt="">
    </div>
    <hr>
    <div>
        <center style="font-weight: bold">
            BERITA ACARA <br>
            SERAH TERIMA BARANG <br>
            Nomor, {{ $data[0]['pengadaan']['nomor_pengadaan'] }}
        </center>
    </div>

    <div style="padding-left: 20px;">
        <p>Pada hari ini, {{ $hari }} tanggal,
            {{ Carbon\Carbon::parse($data[0]['pengadaan']['tanggal_serah_terima'])->format('d') }} Bulan,
            {{ $bulan }} Tahun, {{ $tahun }} yang bertanda tangan dibawah ini :</p>
        <table>
            <tr>
                <td rowspan="3" style="vertical-align: top; line-height: 12px">1.</td>
                <td style="line-height: 12px">Nama</td>
                <td style="line-height: 12px">:</td>
                <td style="line-height: 12px">{{ $kepala_logistik->name }}</td>
            </tr>
            <tr>
                <td style="line-height: 12px">NIK</td>
                <td style="line-height: 12px">:</td>
                <td style="line-height: 12px">{{ $kepala_logistik->nip }}</td>
            </tr>
            <tr>
                <td style="line-height: 12px">Unit</td>
                <td style="line-height: 12px">:</td>
                <td style="line-height: 12px">Kepala Unit Logistik disebut sebagai <b>PIHAK PERTAMA</b></td>
            </tr>
            <br>
            <tr>
                <td rowspan="3" style="vertical-align: top; line-height: 12px">2.</td>
                <td style="line-height: 12px">Nama</td>
                <td style="line-height: 12px">:</td>
                <td style="line-height: 12px">{{ $data[0]['pengadaan']['user']['name'] }}</td>
            </tr>
            <tr>
                <td style="line-height: 12px">NIK</td>
                <td style="line-height: 12px">:</td>
                <td style="line-height: 12px">{{ $data[0]['pengadaan']['user']['nip'] }}</td>
            </tr>
            <tr>
                <td style="line-height: 12px">Unit</td>
                <td style="line-height: 12px">:</td>
                <td style="line-height: 12px">{{ $data[0]['pengadaan']['pemohon']['nama'] }} disebut sebagai <b>PIHAK
                        KEDUA</b></td>
            </tr>
        </table>

        <div style="width: 10px">

        </div>

        <p> Maka kedua belah pihak bersepakat mengadakan <b>Serah Terima Barang</b> dengan ketentuan
            sebagai berikut :
        </p>

        <center><b>PASAL 1 :</b></center>
        <b>PIHAK PERTAMA</b> menyerahkan kepada <b>PIHAK KEDUA</b> dan <b>PIHAK KEDUA</b> menerima
        dan menyetujui atas penyerahan barang dari <b>PIHAK PERTAMA</b> sebagai berikut :


        <br>

        <table style="width: 100%; border: 1px solid black; border-collapse: collapse">
            <thead>
                <th style="width: 5%; border: 1px solid black; border-collapse: collapse">No</th>
                <th
                    style="text-align:left ;width: 20%;padding-left:5px ;border: 1px solid black; border-collapse: collapse">
                    Nama Barang</th>
                <th
                    style="text-align:left ;width: 15%;padding-left:5px ;border: 1px solid black; border-collapse: collapse">
                    Merk</th>
                <th
                    style="text-align:left ;width: 15%;padding-left:5px ;border: 1px solid black; border-collapse: collapse">
                    Volume</th>
                <th
                    style="text-align:left ;width: 15%;padding-left:5px ;border: 1px solid black; border-collapse: collapse">
                    Satuan</th>
            </thead>
            <tbody>
                @foreach ($aset as $key => $value)
                    <tr>
                        <td style="text-align:center;border: 1px solid black; border-collapse: collapse">
                            {{ $key + 1 }}</td>
                        <td style=" padding-left:5px ;border: 1px solid black; border-collapse: collapse">
                            {{ $value['nama_aset'] }}</td>
                        <td style=" padding-left:5px ;border: 1px solid black; border-collapse: collapse">
                            {{ $value['merk'] }}</td>
                        <td style=" padding-left:5px ;border: 1px solid black; border-collapse: collapse">
                            {{ $value['volume'] }}</td>
                        <td style=" padding-left:5px ;border: 1px solid black; border-collapse: collapse">
                            {{ $value['satuan'] }}</td>
                    </tr>
                @endforeach
            </tbody>
        </table>

        <p>
            <center><b>PASAL 2 :</b></center>
            Dengan adanya <b>Serah Terima BarangSerah Terima Barang</b> dari PIHAK PERTAMA yang diserahkan kepada
            PIHAK KEDUA, maka barang sebagaimana tersebut pada pasal 1, sepenuhnya menjadi
            tanggung jawab PIHAK KEDUA atas keberadaan barang tersebut.
        </p>

        <p>
            Demikian Berita Acara Serah Terima Barang ini dibuat dalam rangkap secukupnya untuk
            dapat dipergunakan sebagaimana mestinya.
        </p>

        <br>

        <table style="width: 100%">
            <tr>
                <td style="width: 45%">
                    <center>PIHAK PERTAMA</center>
                    <center>
                        <img src="data:image/png;base64, {!! base64_encode(
                            QrCode::format('png')->size(50)->generate($kepala_logistik->name),
                        ) !!} ">
                    </center>
                    <center><b><u>{{ $kepala_logistik->name }}</u></b></center>
                    <center>NIK.{{ $kepala_logistik->nip }}</center>
                </td>
                <td style="width: 45%">
                    <center>PIHAK KEDUA</center>
                    <center>
                        <img src="data:image/png;base64, {!! base64_encode(
                            QrCode::format('png')->size(50)->generate($data[0]['pengadaan']['user']['name']),
                        ) !!} ">
                    </center>
                    <center><b><u>{{ $data[0]['pengadaan']['user']['name'] }}</u></b></center>
                    <center>NIK.{{ $data[0]['pengadaan']['user']['nip'] }}</center>
                </td>
            </tr>
            <tr>
                <td style="width: 45%">
                    <center>Kabag Keuangan</center>
                    <center>Klinik Rawat Inap Utama</center>
                    <center>Muhammadiyah Kedungadem</center>
                    <center>
                        <img src="data:image/png;base64, {!! base64_encode(
                            QrCode::format('png')->size(50)->generate($kepala_keuangan->name),
                        ) !!} ">
                    </center>
                    <center><b><u>{{ $kepala_keuangan->name }}</u></b></center>
                    <center>NIK.{{ $kepala_keuangan->nip }}</center>
                </td>
                <td style="width: 45%">
                    <center>Kabag {{ $data[0]['pengadaan']['atasan']['org']['nama'] }}</center>
                    <center>Klinik Rawat Inap Utama</center>
                    <center>Muhammadiyah Kedungadem</center>
                    <center>
                        <img src="data:image/png;base64, {!! base64_encode(
                            QrCode::format('png')->size(50)->generate($data[0]['pengadaan']['atasan']['name']),
                        ) !!} ">
                    </center>
                    <center><b><u>{{ $data[0]['pengadaan']['atasan']['name'] }}</u></b></center>
                    <center>NIK.{{ $data[0]['pengadaan']['atasan']['nip'] }}</center>
                </td>
            </tr>
        </table>
    </div>

</body>

</html>
