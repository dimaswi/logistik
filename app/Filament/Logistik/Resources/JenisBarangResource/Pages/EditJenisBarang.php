<?php

namespace App\Filament\Logistik\Resources\JenisBarangResource\Pages;

use App\Filament\Logistik\Resources\JenisBarangResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditJenisBarang extends EditRecord
{
    protected static string $resource = JenisBarangResource::class;

    protected static ?string $title = 'Edit Jenis Barang';

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
