<?php

namespace App\Filament\Logistik\Resources\PembelianResource\Pages;

use App\Filament\Logistik\Resources\PembelianResource;
use App\Models\Barang;
use App\Models\Stok;
use Filament\Actions;
use Filament\Notifications\Notification;
use Filament\Resources\Pages\CreateRecord;
use Illuminate\Database\Eloquent\Model;

class CreatePembelian extends CreateRecord
{
    protected static string $resource = PembelianResource::class;

    protected static ?string $title = 'Tambah Pembelian ';

    protected function getRedirectUrl(): string
    {
        return $this->getResource()::getUrl('index');
    }

    protected function beforeCreate(): void
    {
        $total_harga = [];
        // dd(preg_replace("/,/", "",$this->data['total']));
        foreach ($this->data['detil_pembelian'] as $key => $value) {
            array_push($total_harga, (int)preg_replace("/,/", "", $value['harga']) * (int)preg_replace("/,/", "", $value['jumlah']));
        }

        if ((int)preg_replace("/,/", "", $this->data['total']) != array_sum($total_harga)) {
            Notification::make()
                ->title('Pembelian Ditolak!')
                ->body('Total harga tidak sama dengan harga faktur!')
                ->danger()
                ->send();

            $this->halt();
        }
    }

    protected function getCreatedNotification(): ?Notification
    {
        return null;
    }

    protected function handleRecordCreation(array $data): Model
    {
        try {
            $total_harga = [];
            foreach ($data['detil_pembelian'] as $key => $value) {
                $stok = Stok::where('organisasi', '9e06eeba-d0ce-40d0-8f3f-f0fba0dde023')->where('barang', $value['id_barang'])->first();
                Stok::where('organisasi', '9e06eeba-d0ce-40d0-8f3f-f0fba0dde023')->where('barang', $value['id_barang'])->update([
                    'stok' => $stok->stok + $value['jumlah'],
                ]);

                $barang = Barang::where('id', $value['id_barang'])->first();
                Barang::where('id', $value['id_barang'])->update([
                    'harga' => $value['harga'],
                ]);

                array_push($total_harga, $value['harga']);
            }

            Notification::make()
                ->title('Berhasil Disimpan!')
                ->body('Pembelian dengan faktur ' . $data['nomor_faktur'] . ' berhasil disimpan!')
                ->success()
                ->send();

            return static::getModel()::create($data);
        } catch (\Throwable $th) {
            throw $th;
        }
    }
}
