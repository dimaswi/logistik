<?php

namespace App\Filament\Logistik\Resources\PengadaanResource\Pages;

use App\Filament\Logistik\Resources\PengadaanResource;
use App\Models\Pengadaan;
use Filament\Actions;
use Filament\Actions\Action;
use Filament\Resources\Pages\ListRecords;
use Filament\Resources\Components\Tab;
use Illuminate\Database\Eloquent\Builder;

class ListPengadaans extends ListRecords
{
    protected static string $resource = PengadaanResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make()
                ->label('Tambah')
                ->color('success')
                ->icon('heroicon-o-plus-circle'),
            Action::make('serah_terima')
                ->label('Serah Terima Barnag')
                ->color('primary')
                ->icon('heroicon-o-inbox-arrow-down')
                ->url(PengadaanResource::getUrl('serah_terima'))
        ];
    }

    public function getTabs(): array
    {
        // dd(Pengadaan::where('kepala', auth()->user()->id)->get());
        if (auth()->user()->hasRole('Logistik')) {
            return [
                'Logistik' => Tab::make()
                    ->modifyQueryUsing(fn(Builder $query) => $query->where('organisasi', '9e06eeba-d0ce-40d0-8f3f-f0fba0dde023')),
                'All' => Tab::make()
                    ->modifyQueryUsing(fn(Builder $query) => $query->where('organisasi', '!=', '9e06eeba-d0ce-40d0-8f3f-f0fba0dde023')->where('persetujuan', '!=', 0)),
            ];
        }
        return [
            'Pengadaan' => Tab::make()
                ->modifyQueryUsing(fn(Builder $query) => $query->where('oleh', auth()->user()->id)),
            'Menunggu Tanda Tangan' => Tab::make()
                ->modifyQueryUsing(fn(Builder $query) => $query->where('kepala', auth()->user()->id)->where('persetujuan', 0)),
        ];
    }
}
