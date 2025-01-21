<?php

namespace App\Filament\Logistik\Resources;

use App\Filament\Logistik\Resources\SatuanBarangResource\Pages;
use App\Filament\Logistik\Resources\SatuanBarangResource\RelationManagers;
use App\Models\SatuanBarang;
use Filament\Forms;
use Filament\Forms\Components\Card;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Actions\ActionGroup;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class SatuanBarangResource extends Resource
{
    protected static ?string $model = SatuanBarang::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    protected static ?string $navigationLabel = 'Satuan Barang';

    protected static ?string $modelLabel = 'Satuan Barang ';

    protected static ?string $navigationGroup = 'Master';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Card::make()->schema([
                    TextInput::make('satuan_barang')
                        ->label('Nama Satuan Barang')
                        ->placeholder('Masukan Nama Satuan Barang')
                        ->required(),
                    Textarea::make('deskripsi')
                        ->label('Deskripsi Satuan Barang')
                        ->placeholder('Masukan Deskripsi Satuan Barang')
                ])
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->recordUrl(
                fn () => null
            )
            ->columns([
                TextColumn::make('index')
                    ->label('No. ')
                    ->rowIndex(),
                TextColumn::make('satuan_barang')
                    ->searchable()
                    ->sortable(),
                TextColumn::make('deskripsi')
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
            'index' => Pages\ListSatuanBarangs::route('/'),
            'create' => Pages\CreateSatuanBarang::route('/create'),
            'edit' => Pages\EditSatuanBarang::route('/{record}/edit'),
        ];
    }
}
