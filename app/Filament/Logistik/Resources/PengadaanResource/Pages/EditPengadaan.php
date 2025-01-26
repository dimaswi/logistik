<?php

namespace App\Filament\Logistik\Resources\PengadaanResource\Pages;

use App\Filament\Logistik\Resources\PengadaanResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditPengadaan extends EditRecord
{
    protected static string $resource = PengadaanResource::class;

    protected static ?string $title = 'Edit Pengadaan ';

    protected function getRedirectUrl(): string
    {
        return $this->getResource()::getUrl('index');
    }

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
