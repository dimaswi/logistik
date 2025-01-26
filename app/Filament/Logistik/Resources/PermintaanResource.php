<?php

namespace App\Filament\Logistik\Resources;

use App\Filament\Logistik\Resources\PermintaanResource\Pages;
use App\Filament\Logistik\Resources\PermintaanResource\RelationManagers;
use App\Models\Barang;
use App\Models\DetilPermintaan;
use App\Models\Organisasi;
use App\Models\PenerimaanPermintaan;
use App\Models\PenolakanPermintaan;
use App\Models\Permintaan;
use App\Models\Stok;
use App\Models\User;
use App\Tables\Columns\Permintaan\CheckStok;
use Barryvdh\DomPDF\Facade\Pdf;
use Carbon\Carbon;
use Filament\Forms;
use Filament\Forms\Components\Card;
use Filament\Forms\Components\DatePicker;
use Filament\Forms\Components\DateTimePicker;
use Filament\Forms\Components\Hidden;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Form;
use Filament\Notifications\Notification;
use Filament\Resources\Resource;
use Filament\Support\RawJs;
use Filament\Tables;
use Filament\Tables\Actions\Action;
use Filament\Tables\Actions\ActionGroup;
use Filament\Tables\Columns\IconColumn;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use Icetalker\FilamentTableRepeater\Forms\Components\TableRepeater;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
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
        $data = Permintaan::where('organisasi', auth()->user()->organisasi)->orderBy('id', 'desc')->first();
        $organisasi = Organisasi::where('id', auth()->user()->organisasi)->first();

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
                    Hidden::make('organisasi')->default($organisasi->id),
                    TextInput::make('nomor_permintaan')
                        ->label('Nomor Permintaan')
                        ->placeholder('Masukan Nomor Permintaan')
                        ->required()
                        ->default('SP/' . $nomor . '/' . $organisasi->kode . '/' . Carbon::now('Asia/Jakarta')->format('m') . '/' . Carbon::now('Asia/Jakarta')->format('Y'))
                        ->readOnly(),
                    DatePicker::make('tanggal')
                        ->label('Tanggal')
                        ->placeholder('Masukan Tanggal')
                        ->default(Carbon::now('Asia/Jakarta'))
                        ->required(),
                    // Select::make('kepala')
                    //     ->label('Kepala')
                    //     ->searchable()
                    //     ->helperText('Untuk mengetahui atasan.')
                    //     ->hintColor('danger')
                    //     ->options(
                    //         Organisasi::all()->pluck('nama', 'id')
                    //     ),
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
            ->recordUrl(
                fn() => null
            )
            ->modifyQueryUsing(
                function (Builder $query) {
                    if (!auth()->user()->hasRole('Logistik')) {
                        return $query->where('oleh', auth()->user()->id);
                    } else {
                        return $query;
                    }
                }
            )
            ->columns([
                TextColumn::make('index')
                    ->label('No.')
                    ->rowIndex()
                    ->alignCenter(),
                TextColumn::make('nomor_permintaan')->searchable()->badge(),
                TextColumn::make('org.nama')->label('Unit Pemohon'),
                TextColumn::make('user.name')->searchable()->label('Pemohon'),
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
                CheckStok::make('check')
                    ->alignCenter(),
            ])
            ->filters([
                //
            ])
            ->actions([
                ActionGroup::make([
                    Tables\Actions\EditAction::make()
                        ->color('info')
                        ->hidden(
                            function (Permintaan $record) {
                                return $record->oleh != auth()->user()->id or $record->status != 0;
                            }
                        ),
                    Action::make('setuju')
                        ->label('Setuju')
                        ->icon('heroicon-o-check-circle')
                        ->color('success')
                        ->form([
                            Select::make('penerima')
                                ->label('Penerima')
                                ->searchable()
                                ->options(User::all()->pluck('name', 'id'))
                                ->required(),
                            Textarea::make('keterangan')
                                ->label('Keterangan')
                                ->placeholder('Masukan Keterangan')
                        ])
                        ->action(
                            function (array $data, Permintaan $record) {
                                try {

                                    $detail_permintaan = DetilPermintaan::where('id_permintaan', $record->id)->get();
                                    $check_stok = [];

                                    foreach ($detail_permintaan as $key => $value) {
                                        $stok_gudang = Stok::where('organisasi', '9e06eeba-d0ce-40d0-8f3f-f0fba0dde023')
                                            ->where('barang', $value->id_barang)
                                            ->first();
                                        $stok = Stok::where('organisasi', $record->organisasi)
                                            ->where('barang', $value->id_barang)
                                            ->first();

                                        $check = $stok_gudang->stok < $value->jumlah ? 0 : 1;

                                        array_push($check_stok, $check);

                                        if ($stok_gudang->stok > (int)$value->jumlah) {
                                            if (!$stok) {
                                                Stok::create([
                                                    'barang' => $value->id_barang,
                                                    'organisasi' => $record->organisasi,
                                                    'stok' => $value->jumlah,
                                                ]);

                                                Stok::where('organisasi', '9e06eeba-d0ce-40d0-8f3f-f0fba0dde023')->where('barang', $value->id_barang)->update([
                                                    'stok' => $stok_gudang->stok - $value->jumlah,
                                                ]);
                                            } else {
                                                Stok::where('organisasi', $record->organisasi)->where('barang', $value->id_barang)->update([
                                                    'stok' => $stok->stok + $value->jumlah,
                                                ]);

                                                Stok::where('organisasi', '9e06eeba-d0ce-40d0-8f3f-f0fba0dde023')->where('barang', $value->id_barang)->update([
                                                    'stok' => $stok_gudang->stok - $value->jumlah,
                                                ]);
                                            }
                                        } else {

                                        }
                                    }

                                    if (in_array(0, $check_stok) == true) {
                                        Notification::make()
                                            ->title('Stok digudang kosong!')
                                            ->danger()
                                            ->send();
                                    } else {
                                        PenerimaanPermintaan::create([
                                            'id_permintaan' => $record->id,
                                            'penerima' => $data['penerima'],
                                            'keterangan' => $data['keterangan'],
                                        ]);

                                        Permintaan::where('id', '=', $record->id)->update([
                                            'status' => 1,
                                        ]);

                                        Notification::make()
                                            ->title('Permintaan disetujui!')
                                            ->success()
                                            ->send();
                                    }
                                } catch (\Throwable $th) {
                                    Notification::make()
                                        ->title($th->getMessage())
                                        ->danger()
                                        ->send();
                                }
                            }
                        )
                        ->hidden(
                            function (Permintaan $record) {
                                if (!auth()->user()->hasRole('Logistik')) {
                                    return $record->status >= 0;
                                } else {
                                    return $record->status != 0;
                                }
                            }
                        ),
                    Action::make('tolak')
                        ->label('Tolak')
                        ->icon('heroicon-o-x-circle')
                        ->color('danger')
                        ->form([
                            Textarea::make('keterangan')
                                ->label('Keterangan')
                                ->required()
                                ->placeholder('Masukan Keterangan')
                        ])
                        ->action(
                            function (array $data, Permintaan $record) {
                                try {
                                    PenolakanPermintaan::create([
                                        'id_permintaan' => $record->id,
                                        'oleh' => auth()->user()->id,
                                        'keterangan' => $data['keterangan'],
                                    ]);

                                    Permintaan::where('id', '=', $record->id)->update([
                                        'status' => 99,
                                    ]);

                                    Notification::make()
                                        ->title('Permintaan ditolak!')
                                        ->danger()
                                        ->send();
                                } catch (\Throwable $th) {
                                    Notification::make()
                                        ->title($th->getMessage())
                                        ->danger()
                                        ->send();
                                }
                            }
                        )
                        ->hidden(
                            function (Permintaan $record) {
                                if (!auth()->user()->hasRole('Logistik')) {
                                    return $record->status >= 0;
                                } else {
                                    return $record->status != 0;
                                }
                            }
                        ),
                    // Action::make('revisi')
                    //     ->label('Revisi')
                    //     ->icon('heroicon-o-pencil')
                    //     ->color('warning'),
                    // Action::make('surat')
                    //     ->label('Memo Permintaan')
                    //     ->icon('heroicon-o-paper-clip')
                    //     ->color('success')
                    //     ->action(
                    //         function (Permintaan $record) {
                    //             $organisasi = Organisasi::where('id', auth()->user()->organisasi)->first();
                    //             $organisasi_kepala = Organisasi::where('id', $record->kepala)->first();
                    //             $nama_kepala = User::where('id', $organisasi_kepala->pimpinan)->first();
                    //             $contxt = stream_context_create([
                    //                 'ssl' => [
                    //                     'verify_peer' => FALSE,
                    //                     'verify_peer_name' => FALSE,
                    //                     'allow_self_signed' => TRUE
                    //                 ]
                    //             ]);
                    //             $pdf = Pdf::setOptions(['isHtml5ParserEnabled' => true, 'isRemoteEnabled' => true])->loadView(
                    //                 'logistik.permintaan.surat.surat_permintaan',
                    //                 [
                    //                     'permintaan' => $record,
                    //                     'organisasi' => $organisasi,
                    //                     'kepala' => array($organisasi_kepala, $nama_kepala),
                    //                     // 'kop' => base64_encode(url('/storage/'.$organisasi->kop)),
                    //                     'detilPermintaan' => DetilPermintaan::with('barang')->where('id_permintaan', $record->id)->get(),
                    //                 ]
                    //             )->setHttpContext($contxt);
                    //             return response()->streamDownload(function () use ($pdf) {
                    //                 echo $pdf->stream();
                    //             }, $record->id . '.pdf');
                    //         }
                    //     )
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
            'index' => Pages\ListPermintaans::route('/'),
            'create' => Pages\CreatePermintaan::route('/create'),
            'edit' => Pages\EditPermintaan::route('/{record}/edit'),
        ];
    }
}
