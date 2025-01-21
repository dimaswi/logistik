<?php

namespace App\Filament\Logistik\Resources\BarangResource\Pages;

use App\Filament\Logistik\Resources\BarangResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListBarangs extends ListRecords
{
    protected static string $resource = BarangResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make()->label('Tambah')->color('success')->icon('heroicon-o-plus-circle'),
        ];
    }
}
