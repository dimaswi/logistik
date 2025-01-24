<?php

namespace App\Filament\Logistik\Resources\SatuanBarangResource\Pages;

use App\Filament\Logistik\Resources\SatuanBarangResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditSatuanBarang extends EditRecord
{
    protected static string $resource = SatuanBarangResource::class;

    protected static ?string $title = 'Edit Satuan Barang';

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
