<?php

namespace App\Filament\Logistik\Resources\OrganisasiResource\Pages;

use App\Filament\Logistik\Resources\OrganisasiResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListOrganisasis extends ListRecords
{
    protected static string $resource = OrganisasiResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make()->label('Tambah')->color('success')->icon('heroicon-o-plus-circle'),
        ];
    }
}
