<?php

namespace App\Filament\Logistik\Resources\BarangResource\Pages;

use App\Filament\Logistik\Resources\BarangResource;
use App\Models\Stok;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;
use Illuminate\Database\Eloquent\Model;

class CreateBarang extends CreateRecord
{
    protected static string $resource = BarangResource::class;

    protected static ?string $title = 'Tambah Barang';

    protected function handleRecordCreation(array $data): Model
    {
        $save = static::getModel()::create($data);

        return Stok::create([
            'barang' => $save->id,
            'organisasi' => auth()->user()->organisasi,
            'stok' => 0
        ]);;
    }

    protected function getRedirectUrl(): string
    {
        return $this->getResource()::getUrl('index');
    }
}
