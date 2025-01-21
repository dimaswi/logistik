<?php

namespace App\Filament\Logistik\Resources\PermintaanResource\Pages;

use App\Filament\Logistik\Resources\PermintaanResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditPermintaan extends EditRecord
{
    protected static string $resource = PermintaanResource::class;

    protected static ?string $title = 'Edit Permintaan';

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
