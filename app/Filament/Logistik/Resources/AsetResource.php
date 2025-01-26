<?php

namespace App\Filament\Logistik\Resources;

use App\Filament\Logistik\Resources\AsetResource\Pages;
use App\Filament\Logistik\Resources\AsetResource\RelationManagers;
use App\Models\Aset;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class AsetResource extends Resource
{
    protected static ?string $model = Aset::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    protected static ?string $navigationLabel = 'Aset';

    protected static ?string $modelLabel = 'Aset ';

    protected static ?string $navigationGroup = 'Logistik';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                //
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->modifyQueryUsing(
                function (Builder $query) {
                    return $query->leftJoin('ruangan', 'aset.lokasi', '=', 'ruangan.id')->where('ruangan.organisasi', auth()->user()->organisasi);
                }
            )
            ->columns([
                TextColumn::make('index')
                    ->rowIndex()
                    ->label('No.')
                    ->alignCenter(),
                TextColumn::make('nama_aset')
                    ->searchable(),
                TextColumn::make('merk')
                    ->searchable(),
                TextColumn::make('tanggal_pembelian')
                    ->date(),
                TextColumn::make('harga_pembelian')
                    ->money('IDR')
                    ->badge(),
                TextColumn::make('ruangan.nama_ruangan')
                    ->label('Ruangan')
                    ->searchable()

            ])
            ->filters([
                //
            ])
            ->actions([])
            ->bulkActions([]);
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListAsets::route('/'),
            // 'create' => Pages\CreateAset::route('/create'),
            // 'edit' => Pages\EditAset::route('/{record}/edit'),
        ];
    }
}
