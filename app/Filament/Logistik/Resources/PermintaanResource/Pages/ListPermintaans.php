<?php

namespace App\Filament\Logistik\Resources\PermintaanResource\Pages;

use App\Filament\Logistik\Resources\PermintaanResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListPermintaans extends ListRecords
{
    protected static string $resource = PermintaanResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make()->label('Tambah')->color('success')->icon('heroicon-o-plus-circle'),
        ];
    }
}
