<?php

namespace App\Filament\Logistik\Resources\PengadaanResource\Pages;

use App\Filament\Logistik\Resources\PengadaanResource;
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
        $total_harga = [];
        foreach ($data['detil_pengadaan'] as $key => $value) {
            array_push($total_harga, $value['harga']);
        }
        $data['nominal'] = array_sum($total_harga);

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
