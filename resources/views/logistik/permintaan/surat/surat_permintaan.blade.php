<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Memo Permintaan Barang</title>
</head>

@php
    setlocale(LC_ALL, 'IND');
    $tanggal_permintaan = strftime('%d %B %Y', strtotime($permintaan->tanggal));

    $harga_barang = [];

    foreach ($detilPermintaan as $key => $value) {
        array_push($harga_barang, $value->harga_baru);
    }
@endphp

<style>
    .tanda_tangan_lembar_pertama {
        width: 50%;
        float: left;
        text-align: center;
    }

    .tanda_tangan_lembar_kedua {
        width: 50%;
        float: left;
        text-align: center;
    }

    .detil_surat_lembar_kedua {
        width: 50%;
        float: left;
    }
</style>

<body
    style="margin-left: 10px; margin-right: 10px; margin-top: -6%; font-family: Arial, Helvetica, sans-serif; font-size: 11pt">

    <div style="text-align: left">
        <img src="{{ url('/storage/' . $organisasi->kop) }}" height="178" width="700" alt="">
    </div>

    <hr>

    <table>
        <tr>
            <td style="padding-right: 100px">No. {{ $permintaan->nomor_permintaan }}</td>
            <td>&nbsp;</td>
            <td style="padding-left: 70px">Dari</td>
            <td> :</td>
            <td>{{ $organisasi->nama }}</td>
        </tr>
        <tr>
            <td style="padding-right: 100px"><b>Kepada Yth :</b></td>
            <td>&nbsp;</td>
            <td style="padding-left: 70px">Bidang</td>
            <td> :</td>
            <td>Kepala Unit</td>
        </tr>
        <tr>
            <td style="padding-right: 100px">Pimpinan Klinik Rawat Inap Utama<br>
                Muhammadiyah Kedungadem
            </td>
            <td>&nbsp;</td>
            <td style="vertical-align: top; padding-left: 70px">Tanggal</td>
            <td style="vertical-align: top"> :</td>
            <td style="vertical-align: top">{{ $tanggal_permintaan }}</td>
        </tr>
    </table>

    <hr>

    <table>
        <tr>
            <td>
                <b>Tembusan :</b>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
            <td>1. </td>
            <td>Kepala Unit Logistik Umum</td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
            <td>2. </td>
            <td>Kepala Bagian Keuangan</td>
        </tr>
    </table>

    <table>
        <tr>
            <td>
                <b>Perihal :</b>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;
            </td>
            <td>
                <b>Permohonan Permintaan Barang</b>
            </td>
        </tr>
    </table>

    <br>
    <br>

    <div>
        <i>Assalamualaikum. Wr.Wb</i>

        <p>Bersama ini kami sampaikan permohonan pengajuan pengadaan pembelian sarana dan prasarana ,total pengajuan
            sebesar <b>Rp. {{ number_format(array_sum($harga_barang)) }}</b></p>

        <p>Demikian pengajuan memo intern ini dibuat atas perhatian dan kebijakan bapak direktur kami sampaikan terima
            kasih</p>

        <i>
            Wassalamualaikum. Wr.Wb
        </i>
    </div>

    <br>
    <br>

    <div class="tanda_tangan_lembar_pertama">

    </div>

    <div class="tanda_tangan_lembar_pertama">
        <p style="text-align: center">Mengetahui</p>
        <br>
        <br>
        <br>
        <p style="text-align: center">( {{ $kepala[1]['name'] }} )</p>
    </div>

    <div style="page-break-after: always"></div>

    <div style="text-align: left">
        <img src="{{ url('/storage/' . $organisasi->kop) }}" height="178" width="700" alt="">
    </div>

    <hr>

    <div class="detil_surat_lembar_kedua">
        <table>
            <tr>
                <td>No. {{ $permintaan->nomor_permintaan }}</td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td>Lampiran</td>
                <td>:</td>
                <td><b><u>Terlampir</u></b></td>
            </tr>
            <tr>
                <td>Perihal</td>
                <td>:</td>
                <td><b><u>PERMOHONAN</u></b></td>
            </tr>
        </table>
    </div>

    <div class="detil_surat_lembar_kedua" style="padding-left: 50px">
        <table>
            <tr>
                <td style="padding-left: 50px">Kedungadem, {{ $tanggal_permintaan }}</td>
            </tr>
            <tr>
                <td>Kepada Yth :</td>
            </tr>
            <tr>
                <td>
                    Pimpinan Klinik Rawat Inap Utama<br>
                    Muhammadiyah Kedungadem
                    <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Di-
                    <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Tempat
                </td>
            </tr>
        </table>
    </div>

    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>

    <div>
        <p><i>Assalamualaikum.Wr.Wb</i></p>
        <p>Dengan hormat,</p>
        <p>Dengan ini saya kepala Unit Administrasi dan Dakwah Citra, dengan ini mengajukan permohonan permintaan
            barang. Permohonan dilampirkan dalam surat permohonan ini.</p>
        <p>Demikian surat permintaan pengadaan barang yang kami ajukan dan kami mohon untuk segera direalisasikan. Atas
            perhatian dan kerjasamanya kami ucapkan terimakasih.</p>
        <p><i>Wassalamualaikum. Wr.Wb</i></p>
    </div>

    <div class="tanda_tangan_lembar_pertama">
        <p style="text-align: center">Mengetahui</p>
        <br>
        <br>
        <br>
        <p style="text-align: center">( {{ $kepala[1]['name'] }} )</p>
    </div>

    <div class="tanda_tangan_lembar_pertama">
        <p style="text-align: center">Mengetahui</p>
        <br>
        <br>
        <br>
        <p style="text-align: center">( {{ $kepala[1]['name'] }} )</p>
    </div>

    <div style="page-break-after: always"></div>

    <div style="text-align: left">
        <img src="{{ url('/storage/' . $organisasi->kop) }}" height="178" width="700" alt="">
    </div>

    <hr>
    <br>
    <table>
        <tr>
            <td><b>LAMPIRAN</b></td>
        </tr>
        <tr>
            <td>No. {{ $permintaan->nomor_permintaan }}</td>
        </tr>
    </table>

    <br>

    <div style="text-align: center">
        <b>LAMPIRAN PERMOHONAN PERMINTAAN</b>
    </div>
    <br>
    <table style="border: 1px solid black; width: 100%;border-collapse: collapse;">
        <thead style="border: 1px solid black;border-collapse: collapse">
            <th style="border: 1px solid black;border-collapse: collapse;width: 10%">No.</th>
            <th style="border: 1px solid black;border-collapse: collapse;">Nama Barang</th>
            <th style="border: 1px solid black;border-collapse: collapse;">Jumlah</th>
            <th style="border: 1px solid black;border-collapse: collapse;">Harga</th>
        </thead>
        <tbody style="border: 1px solid black;border-collapse: collapse">
            @foreach ($detilPermintaan as $key => $value)
                <tr>
                    <td style="border: 1px solid black;border-collapse: collapse;">
                        <center>{{ $key + 1 }}</center>
                    </td>
                    <td style="border: 1px solid black;border-collapse: collapse;">
                        <center style="font-weight: bold">{{ $value->barang->nama_barang }}</center>
                    </td>
                    <td style="border: 1px solid black;border-collapse: collapse;">
                        <center>{{ $value->jumlah }}</center>
                    </td>
                    <td style="border: 1px solid black;border-collapse: collapse;">
                        <center>Rp. {{ number_format($value->harga_baru) }}</center>
                    </td>
                </tr>
            @endforeach
            <tr>
                <td style="border: 1px solid black;border-collapse: collapse;" colspan="3">
                    <center style="font-weight: bolder">Total</center>
                </td>
                <td style="border: 1px solid black;border-collapse: collapse;">
                    <center>Rp. {{ number_format(array_sum($harga_barang)) }}</center>
                </td>
            </tr>
        </tbody>
    </table>

</body>

</html>
