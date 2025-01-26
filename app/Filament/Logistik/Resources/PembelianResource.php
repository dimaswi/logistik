<?php

namespace App\Filament\Logistik\Resources;

use App\Filament\Logistik\Resources\PembelianResource\Pages;
use App\Filament\Logistik\Resources\PembelianResource\RelationManagers;
use App\Models\Barang;
use App\Models\Pembelian;
use App\Models\Suplier;
use Filament\Forms;
use Filament\Forms\Components\Card;
use Filament\Forms\Components\DatePicker;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Support\RawJs;
use Filament\Tables;
use Filament\Tables\Actions\ActionGroup;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use Icetalker\FilamentTableRepeater\Forms\Components\TableRepeater;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class PembelianResource extends Resource
{
    protected static ?string $model = Pembelian::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    protected static ?string $navigationLabel = 'Pembelian ';

    protected static ?string $modelLabel = 'Pembelian ';

    protected static ?string $navigationGroup = 'Logistik';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Card::make()->schema([
                    TextInput::make('nomor_faktur')
                        ->label('Nomor Faktur')
                        ->placeholder('Masukan Nomor Faktur')
                        ->required(),
                    DatePicker::make('tanggal_pembelian')
                        ->label('Tanggal Faktur')
                        ->required()
                        ->placeholder('Masukan Tanggal Faktur'),
                    Select::make('supplier')
                        ->required()
                        ->searchable()
                        ->options(
                            Suplier::all()->pluck('nama', 'id')
                        )
                        ->placeholder('Masukan Nama Suplier'),
                    TextInput::make('total')
                        ->numeric()
                        ->mask(RawJs::make('$money($input)'))
                        ->stripCharacters(',')
                        ->placeholder('Masukan Total Harga')
                        ->required(),
                    TextInput::make('diskon')
                        ->numeric()
                        ->mask(RawJs::make('$money($input)'))
                        ->stripCharacters(',')
                        ->default(0),
                    TextInput::make('ppn')
                        ->numeric()
                        ->mask(RawJs::make('$money($input)'))
                        ->stripCharacters(',')
                        ->default(0),
                    TableRepeater::make('detil_pembelian')
                        ->label('Barang Pembelian')
                        ->relationship('detilPembelian')
                        ->dehydrated(true)
                        ->schema([
                            Select::make('id_barang')
                                ->label('Barang')
                                ->required()
                                ->options(
                                    Barang::all()->pluck('nama_barang', 'id')
                                )
                                ->searchable()
                                ->placeholder('Masukan Nama Barang'),
                            TextInput::make('jumlah')
                                ->placeholder('Masukan Jumlah Barang')
                                ->required(),
                            TextInput::make('harga')
                                ->placeholder('Masukan Harga Barang')
                                ->mask(RawJs::make('$money($input)'))
                                ->numeric()
                                ->stripCharacters(',')
                                ->required(),
                        ])->colStyles([
                            'id_barang' => 'width: 60%;',
                            'jumlah' => 'width: 10%;',
                            'harga' => 'width: 30%;',
                        ])->addActionLabel('Tambah')
                ])->columns(2)
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('nomor_faktur')
                    ->badge()
                    ->searchable()
                    ->alignStart(),
                TextColumn::make('toko.nama'),
                TextColumn::make('tanggal_pembelian')->date(),
                TextColumn::make('total')
                    ->badge()
                    ->alignCenter(),
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
            'index' => Pages\ListPembelians::route('/'),
            'create' => Pages\CreatePembelian::route('/create'),
            'edit' => Pages\EditPembelian::route('/{record}/edit'),
        ];
    }
}
