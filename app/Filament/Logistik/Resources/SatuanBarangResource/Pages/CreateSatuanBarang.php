<?php

namespace App\Filament\Logistik\Resources\SatuanBarangResource\Pages;

use App\Filament\Logistik\Resources\SatuanBarangResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;

class CreateSatuanBarang extends CreateRecord
{
    protected static string $resource = SatuanBarangResource::class;

    protected static ?string $title = 'Tambah Satuan Barang';

    protected function getRedirectUrl(): string
    {
        return $this->getResource()::getUrl('index');
    }
}
