<?php

namespace App\Filament\Logistik\Resources\BarangResource\Pages;

use App\Filament\Logistik\Resources\BarangResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;

class CreateBarang extends CreateRecord
{
    protected static string $resource = BarangResource::class;

    protected static ?string $title = 'Tambah Barang';

    protected function getRedirectUrl(): string
    {
        return $this->getResource()::getUrl('index');
    }
}
