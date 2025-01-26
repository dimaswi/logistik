<?php

namespace App\Filament\Logistik\Resources\SuplierResource\Pages;

use App\Filament\Logistik\Resources\SuplierResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListSupliers extends ListRecords
{
    protected static string $resource = SuplierResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make()->label('Tambah')->color('success')->icon('heroicon-o-plus-circle'),
        ];
    }
}
