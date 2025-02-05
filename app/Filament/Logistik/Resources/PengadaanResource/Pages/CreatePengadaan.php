<?php

namespace App\Filament\Logistik\Resources\PengadaanResource\Pages;

use App\Filament\Logistik\Resources\PengadaanResource;
use App\Models\RencanaAnggaranBelanjaDetil;
use Filament\Actions;
use Filament\Notifications\Notification;
use Filament\Resources\Pages\CreateRecord;

class CreatePengadaan extends CreateRecord
{
    protected static string $resource = PengadaanResource::class;

    protected static ?string $title = 'Tambah Pengadaan ';

    protected function getRedirectUrl(): string
    {
        return $this->getResource()::getUrl('index');
    }

    protected function mutateFormDataBeforeCreate(array $data): array
    {
        // dd($data);
        try {
            if ($data['rab'] == true) {
                $total_harga = [];
                foreach ($data['detil_pengadaan_rab'] as $key => $value) {
                    array_push($total_harga, $value['harga'] * $value['jumlah']);
                    $barang = RencanaAnggaranBelanjaDetil::where('id', $value['barang_rab'])->first();
                    $data['detil_pengadaan'][$key]['nama_barang'] = $barang->nama_barang;
                    $data['detil_pengadaan'][$key]['merk'] = $barang->merk;
                    $data['detil_pengadaan'][$key]['jumlah'] = $barang->jumlah;
                    $data['detil_pengadaan'][$key]['harga'] = $barang->harga;
                }
                $data['nominal'] = array_sum($total_harga);
            } else {
                $total_harga = [];
                foreach ($data['detil_pengadaan'] as $key => $value) {
                    array_push($total_harga, $value['harga'] * $value['jumlah']);
                }
                $data['nominal'] = array_sum($total_harga);
            }
        } catch (\Throwable $th) {
            Notification::make()
                ->title('Error!')
                ->body($th->getMessage())
                ->danger()
                ->send();
        }

        // dd($data);
        return $data;
    }

    protected function getCreatedNotification(): ?Notification
    {
        return Notification::make()
            ->success()
            ->title('Berhasil Diajukan!')
            ->body('Pengadaan berhasil diajukan ke bagian terkait!');
    }
}
