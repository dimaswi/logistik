<?php

namespace App\Filament\Logistik\Resources\RABResource\Pages;

use App\Filament\Logistik\Resources\RABResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;

class CreateRAB extends CreateRecord
{
    protected static string $resource = RABResource::class;

    protected static ?string $title = 'Tambah Rencana Anggaran Belanja';

    protected function getRedirectUrl(): string
    {
        return $this->getResource()::getUrl('index');
    }
}
