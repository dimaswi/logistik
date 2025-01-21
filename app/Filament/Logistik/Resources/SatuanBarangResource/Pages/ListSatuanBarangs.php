<?php

namespace App\Filament\Logistik\Resources\SatuanBarangResource\Pages;

use App\Filament\Logistik\Resources\SatuanBarangResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListSatuanBarangs extends ListRecords
{
    protected static string $resource = SatuanBarangResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make()->label('Tambah')->color('success')->icon('heroicon-o-plus-circle'),
        ];
    }
}
