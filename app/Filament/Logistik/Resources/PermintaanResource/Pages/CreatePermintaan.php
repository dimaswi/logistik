<?php

namespace App\Filament\Logistik\Resources\PermintaanResource\Pages;

use App\Filament\Logistik\Resources\PermintaanResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;

class CreatePermintaan extends CreateRecord
{
    protected static string $resource = PermintaanResource::class;

    protected static ?string $title = 'Tambah Permintaan';

    protected function getRedirectUrl(): string
    {
        return $this->getResource()::getUrl('index');
    }
}
