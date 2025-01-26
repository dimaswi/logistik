<?php

namespace App\Filament\Logistik\Resources\RuanganResource\Pages;

use App\Filament\Logistik\Resources\RuanganResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;

class CreateRuangan extends CreateRecord
{
    protected static string $resource = RuanganResource::class;

    protected static ?string $title = 'Tambah Ruangan ';

    protected function getRedirectUrl(): string
    {
        return $this->getResource()::getUrl('index');
    }
}
