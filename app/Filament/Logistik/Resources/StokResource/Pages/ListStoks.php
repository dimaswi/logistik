<?php

namespace App\Filament\Logistik\Resources\StokResource\Pages;

use App\Filament\Logistik\Resources\StokResource;
use Filament\Actions;
use Filament\Actions\Action;
use Filament\Resources\Pages\ListRecords;
use Filament\Resources\Components\Tab;
use Illuminate\Database\Eloquent\Builder;

class ListStoks extends ListRecords
{
    protected static string $resource = StokResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Action::make('stok_opname')
                ->label('Stok Opname')
                ->color('success')
                ->icon('heroicon-o-inbox-stack')
                ->url(
                    fn () => StokResource::getUrl('stok_opname')
                ),
        ];
    }
    public function getTabs(): array
    {
        if (auth()->user()->hasRole('Logistik')) {
            return [
                'Logistik' => Tab::make()
                    ->modifyQueryUsing(fn(Builder $query) => $query->where('organisasi', '9e06eeba-d0ce-40d0-8f3f-f0fba0dde023')),
                'All' => Tab::make()
                    ->modifyQueryUsing(fn(Builder $query) => $query->where('organisasi', '!=', '9e06eeba-d0ce-40d0-8f3f-f0fba0dde023')),
            ];
        } else {
            return [];
        }
    }
}
