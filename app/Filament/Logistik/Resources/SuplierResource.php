<?php

namespace App\Filament\Logistik\Resources;

use App\Filament\Logistik\Resources\SuplierResource\Pages;
use App\Filament\Logistik\Resources\SuplierResource\RelationManagers;
use App\Models\Suplier;
use Filament\Forms;
use Filament\Forms\Components\Card;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Actions\ActionGroup;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class SuplierResource extends Resource
{
    protected static ?string $model = Suplier::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    protected static ?string $navigationLabel = 'Suplier ';

    protected static ?string $modelLabel = 'Suplier ';

    protected static ?string $navigationGroup = 'Master';
    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Card::make()->schema([
                    TextInput::make('nama')
                        ->label('Nama Suplier')
                        ->placeholder('Masukan Nama Suplier')
                        ->required(),
                    TextInput::make('alamat')
                        ->label('Alamat')
                        ->placeholder('Masukan Alamat Suplier')
                        ->required(),
                    TextInput::make('nomor_telepon')
                        ->label('Telepon')
                        ->placeholder('Masukan Telepon Suplier')
                        ->required(),
                ])
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->recordUrl(
                fn() => null
            )
            ->columns([
                TextColumn::make('index')
                    ->label('No. ')
                    ->rowIndex()
                    ->sortable()
                    ->width('5%'),
                TextColumn::make('nama')
                    ->searchable()
                    ->sortable(),
                TextColumn::make('alamat')
                    ->searchable()
                    ->sortable(),
                TextColumn::make('nomor_telepon')
                    ->badge()
                    ->searchable()
                    ->sortable(),
            ])
            ->filters([
                //
            ])
            ->actions([
                ActionGroup::make([
                    Tables\Actions\EditAction::make(),
                ])
            ])
            ->bulkActions([
                // Tables\Actions\BulkActionGroup::make([
                //     Tables\Actions\DeleteBulkAction::make(),
                // ]),
            ]);
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
            'index' => Pages\ListSupliers::route('/'),
            'create' => Pages\CreateSuplier::route('/create'),
            'edit' => Pages\EditSuplier::route('/{record}/edit'),
        ];
    }
}
