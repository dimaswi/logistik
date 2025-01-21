<?php

namespace App\Filament\Logistik\Resources;

use App\Filament\Logistik\Resources\PermintaanResource\Pages;
use App\Filament\Logistik\Resources\PermintaanResource\RelationManagers;
use App\Models\Barang;
use App\Models\DetilPermintaan;
use App\Models\Permintaan;
use Barryvdh\DomPDF\Facade\Pdf;
use Carbon\Carbon;
use Filament\Forms;
use Filament\Forms\Components\Card;
use Filament\Forms\Components\DatePicker;
use Filament\Forms\Components\DateTimePicker;
use Filament\Forms\Components\Hidden;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Support\RawJs;
use Filament\Tables;
use Filament\Tables\Actions\Action;
use Filament\Tables\Actions\ActionGroup;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use Icetalker\FilamentTableRepeater\Forms\Components\TableRepeater;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class PermintaanResource extends Resource
{
    protected static ?string $model = Permintaan::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    protected static ?string $navigationLabel = 'Permintaan';

    protected static ?string $modelLabel = 'Permintaan ';

    protected static ?string $navigationGroup = 'Permintaan';

    protected static ?int $navigationSort = 1;

    public static function form(Form $form): Form
    {
        $data = Permintaan::where('unit', auth()->user()->unit)->orderBy('id', 'desc')->first();

        if (empty($data)) {
            $nomor = 1;
        } else if (Carbon::now('Asia/Jakarta')->format('Y') != Carbon::createFromFormat('Y-m-d', $data->tanggal)->year) {
            $nomor = 1;
        } else if (Carbon::now('Asia/Jakarta')->format('m') != Carbon::createFromFormat('Y-m-d', $data->tanggal)->month) {
            $nomor = 1;
        } else {
            $nomor = $data->nomor + 1;
        }
        return $form
            ->schema([
                Card::make()->schema([
                    Hidden::make('nomor')->default($nomor),
                    Hidden::make('oleh')->default(auth()->user()->id),
                    Hidden::make('unit')->default(auth()->user()->unit),
                    TextInput::make('nomor_permintaan')
                        ->label('Nomor Permintaan')
                        ->placeholder('Masukan Nomor Permintaan')
                        ->required()
                        ->default('SP/' . $nomor . '/' . auth()->user()->unit . '/' . Carbon::now('Asia/Jakarta')->format('m') . '/' . Carbon::now('Asia/Jakarta')->format('Y'))
                        ->readOnly(),
                    DatePicker::make('tanggal')
                        ->label('Tanggal')
                        ->placeholder('Masukan Tanggal')
                        ->default(Carbon::now('Asia/Jakarta'))
                        ->required(),
                    TableRepeater::make('detil_permintaan')
                        ->label('Barang Permintaan')
                        ->relationship('detilPermintaan')
                        ->schema([
                            Select::make('id_barang')
                                ->label('Barang')
                                ->options(Barang::all()->pluck('nama_barang', 'id'))
                                ->placeholder('Masukan Barang Permintaan')
                                ->required()
                                ->searchable(),
                            TextInput::make('jumlah')
                                ->label('Jumlah')
                                ->placeholder('Masukan Jumlah')
                                ->required(),
                            TextInput::make('harga_baru')
                                ->label('Harga Baru')
                                ->placeholder('Masukan Harga Baru')
                                ->mask(RawJs::make('$money($input)'))
                                ->stripCharacters(',')
                                ->required(),
                            TextInput::make('harga_lama')
                                ->label('Harga Lama')
                                ->placeholder('Masukan Harga Lama')
                                ->mask(RawJs::make('$money($input)'))
                                ->stripCharacters(',')
                                ->required(),
                        ])
                        ->reorderable()
                        ->cloneable()
                        ->collapsible()
                        ->columnSpan('full')
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
                TextColumn::make('nomor_permintaan')->searchable()->badge(),
                TextColumn::make('unit')->label('Unit Pemohon'),
                TextColumn::make('user.name')->searchable()->label('Pemohon'),
            ])
            ->filters([
                //
            ])
            ->actions([
                ActionGroup::make([
                    Tables\Actions\EditAction::make()->color('warning'),
                    Action::make('surat')
                        ->label('Memo Permintaan')
                        ->icon('heroicon-o-paper-clip')
                        ->color('success')
                        ->action(
                            function (Permintaan $record) {
                                $pdf = Pdf::loadView('logistik.permintaan.surat.surat_permintaan',
                                [
                                    'permintaan' => $record->toArray(),
                                    'detilPermintaan' => DetilPermintaan::where('id_permintaan', $record->id)->get()->toArray(),
                                ]
                                );
                                return response()->streamDownload(function () use ($pdf) {
                                    echo $pdf->stream();
                                    }, $record->id.'.pdf');
                            }
                        )
                ])
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
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
            'index' => Pages\ListPermintaans::route('/'),
            'create' => Pages\CreatePermintaan::route('/create'),
            'edit' => Pages\EditPermintaan::route('/{record}/edit'),
        ];
    }
}
