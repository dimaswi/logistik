<?php

namespace App\Filament\Logistik\Resources\RABResource\Pages;

use App\Filament\Logistik\Resources\RABResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditRAB extends EditRecord
{
    protected static string $resource = RABResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
