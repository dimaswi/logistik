<?php

namespace App\Filament\Logistik\Resources\RABResource\Pages;

use App\Filament\Logistik\Resources\RABResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListRABS extends ListRecords
{
    protected static string $resource = RABResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make()->label('Tambah')->color('success')->icon('heroicon-o-plus-circle'),
        ];
    }
}
