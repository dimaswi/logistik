<?php

namespace App\Filament\Logistik\Resources\SuplierResource\Pages;

use App\Filament\Logistik\Resources\SuplierResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditSuplier extends EditRecord
{
    protected static string $resource = SuplierResource::class;

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
