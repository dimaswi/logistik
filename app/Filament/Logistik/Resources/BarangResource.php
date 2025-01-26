<?php

namespace App\Filament\Logistik\Resources;

use App\Filament\Logistik\Resources\BarangResource\Pages;
use App\Filament\Logistik\Resources\BarangResource\RelationManagers;
use App\Models\Barang;
use App\Models\JenisBarang;
use App\Models\SatuanBarang;
use App\Models\Stok;
use Filament\Forms;
use Filament\Forms\Components\Card;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Support\RawJs;
use Filament\Tables;
use Filament\Tables\Actions\ActionGroup;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class BarangResource extends Resource
{
    protected static ?string $model = Barang::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    protected static ?string $navigationLabel = 'Barang';

    protected static ?string $modelLabel = 'Barang ';

    protected static ?string $navigationGroup = 'Logistik';

    protected static ?int $navigationSort = 1;

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Card::make()->schema([
                    TextInput::make('nama_barang')
                        ->required()
                        ->label('Nama Barang')
                        ->placeholder('Masukan Nama Barang')
                        ->columnSpanFull(),
                    TextInput::make('harga')
                        ->label('Harga')
                        ->mask(RawJs::make('$money($input)'))
                        ->stripCharacters(',')
                        ->placeholder('Masukan Stok Barang')
                        ->required()
                        ->numeric(),
                    Select::make('jenis_barang')
                        ->required()
                        ->options(JenisBarang::all()->pluck('jenis_barang', 'id')),
                    Select::make('satuan')
                        ->required()
                        ->options(SatuanBarang::all()->pluck('satuan_barang', 'id')),
                ])->columns(2)
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->recordUrl(
                fn() => null
            )
            ->columns([
                TextColumn::make('nama_barang')->searchable()->sortable(),
                TextColumn::make('satuan_barang.satuan_barang')->numeric()->badge(),
                TextColumn::make('harga')->money('IDR')->badge(),
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
            'index' => Pages\ListBarangs::route('/'),
            'create' => Pages\CreateBarang::route('/create'),
            'edit' => Pages\EditBarang::route('/{record}/edit'),
        ];
    }
}
