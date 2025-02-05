<?php

namespace App\Filament\Logistik\Resources;

use App\Filament\Logistik\Resources\RABResource\Pages;
use App\Filament\Logistik\Resources\RABResource\RelationManagers;
use App\Models\RAB;
use App\Models\RencanaAnggaranBelanja;
use App\Models\SatuanBarang;
use Filament\Forms;
use Filament\Forms\Components\Card;
use Filament\Forms\Components\DatePicker;
use Filament\Forms\Components\Hidden;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Support\RawJs;
use Filament\Tables;
use Filament\Tables\Actions\ActionGroup;
use Filament\Tables\Columns\IconColumn;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use Icetalker\FilamentTableRepeater\Forms\Components\TableRepeater;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class RABResource extends Resource
{
    protected static ?string $model = RencanaAnggaranBelanja::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    protected static ?string $navigationLabel = 'RAB';

    protected static ?string $modelLabel = 'RAB ';

    protected static ?string $navigationGroup = 'Pengadaan';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Card::make()
                    ->schema([
                        Hidden::make('organisasi')->default(auth()->user()->organisasi),
                        DatePicker::make('periode')
                            ->label('Periode')
                            ->required()
                            ->columnSpanFull(),
                        TableRepeater::make('detil_rab')
                            ->label('List Rencana Anggaran Belanja')
                            ->relationship('barang')
                            ->schema([
                                TextInput::make('nama_barang')
                                    ->placeholder('Nama Barang')
                                    ->required(),
                                TextInput::make('merk')
                                    ->placeholder('Merk Barang')
                                    ->required(),
                                Select::make('satuan_barang')
                                    ->required()
                                    ->live()
                                    ->options(
                                        SatuanBarang::all()->pluck('satuan_barang', 'id')
                                    ),
                                TextInput::make('jumlah')
                                    ->placeholder('Jumlah Barang')
                                    ->required(),
                                TextInput::make('harga')
                                    ->placeholder('Harga Barang')
                                    ->mask(RawJs::make('$money($input)'))
                                    ->numeric()
                                    ->stripCharacters(',')
                                    ->required(),
                                Textarea::make('keterangan')
                                    ->placeholder('Keterangan')
                            ])
                            ->reorderable()
                            ->cloneable()
                            ->collapsible()
                            ->columnSpan('full')
                            ->addActionLabel('Tambah')
                    ])->columns(2)
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('index')
                    ->rowIndex()
                    ->label('No.')
                    ->alignCenter(),
                TextColumn::make('periode')
                    ->badge(),
                TextColumn::make('pemohon.nama')
                    ->label('Pemohon')
                    ->searchable(),
                IconColumn::make('status')
                    ->icon(fn(string $state): string => match ($state) {
                        '0' => 'heroicon-o-clock',
                        '1' => 'heroicon-o-check-circle',
                        '2' => 'heroicon-o-pencil-square',
                        '99' => 'heroicon-o-x-circle',
                    })
                    ->color(fn(string $state): string => match ($state) {
                        '0' => 'info',
                        '1' => 'success',
                        '2' => 'warning',
                        '99' => 'danger',
                    })
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
            'index' => Pages\ListRABS::route('/'),
            'create' => Pages\CreateRAB::route('/create'),
            'edit' => Pages\EditRAB::route('/{record}/edit'),
        ];
    }
}
