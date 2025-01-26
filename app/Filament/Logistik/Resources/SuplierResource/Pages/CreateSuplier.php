<?php

namespace App\Filament\Logistik\Resources\SuplierResource\Pages;

use App\Filament\Logistik\Resources\SuplierResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;

class CreateSuplier extends CreateRecord
{
    protected static string $resource = SuplierResource::class;

    protected function getRedirectUrl(): string
    {
        return $this->getResource()::getUrl('index');
    }
}
