<?php

namespace App\Filament\Logistik\Resources\JenisBarangResource\Pages;

use App\Filament\Logistik\Resources\JenisBarangResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;

class CreateJenisBarang extends CreateRecord
{
    protected static string $resource = JenisBarangResource::class;

    protected static ?string $title = 'Tambah Jenis Barang';

    protected function getRedirectUrl(): string
    {
        return $this->getResource()::getUrl('index');
    }
}
