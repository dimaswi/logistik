<?php

namespace App\Filament\Logistik\Resources\UserResource\Pages;

use App\Filament\Logistik\Resources\UserResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListUsers extends ListRecords
{
    protected static string $resource = UserResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make()->label('Tambah')->color('success')->icon('heroicon-o-plus-circle'),
        ];
    }
}
