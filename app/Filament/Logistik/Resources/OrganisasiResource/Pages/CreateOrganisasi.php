<?php

namespace App\Filament\Logistik\Resources\OrganisasiResource\Pages;

use App\Filament\Logistik\Resources\OrganisasiResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;

class CreateOrganisasi extends CreateRecord
{
    protected static string $resource = OrganisasiResource::class;

    protected static ?string $title = 'Tambah Organisasi';

    protected function getRedirectUrl(): string
    {
        return $this->getResource()::getUrl('index');
    }
}
