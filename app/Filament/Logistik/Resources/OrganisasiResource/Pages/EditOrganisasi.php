<?php

namespace App\Filament\Logistik\Resources\OrganisasiResource\Pages;

use App\Filament\Logistik\Resources\OrganisasiResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditOrganisasi extends EditRecord
{
    protected static string $resource = OrganisasiResource::class;

    protected static ?string $title = 'Edit Organisasi';

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
