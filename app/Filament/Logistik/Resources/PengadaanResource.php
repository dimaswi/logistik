<?php

namespace App\Filament\Logistik\Resources;

use App\Filament\Logistik\Resources\PengadaanResource\Pages;
use App\Filament\Logistik\Resources\PengadaanResource\RelationManagers;
use App\Models\Organisasi;
use App\Models\Pengadaan;
use App\Models\PengadaanDetil;
use App\Models\User;
use Barryvdh\DomPDF\Facade\Pdf;
use Carbon\Carbon;
use Filament\Forms;
use Filament\Forms\Components\Card;
use Filament\Forms\Components\DatePicker;
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
use Illuminate\Database\Eloquent\SoftDeletingScope;
use SimpleSoftwareIO\QrCode\Facades\QrCode;

class PengadaanResource extends Resource
{
    protected static ?string $model = Pengadaan::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    protected static ?string $navigationLabel = 'Pengadaan';

    protected static ?string $modelLabel = 'Pengadaan ';

    protected static ?string $navigationGroup = 'Pengadaan';

    public static function form(Form $form): Form
    {
        $data = Pengadaan::where('organisasi', auth()->user()->organisasi)->orderBy('id', 'desc')->first();
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
                    TextInput::make('nomor_pengadaan')
                        ->columnSpanFull()
                        ->label('Nomor Pengadaan')
                        ->readOnly()
                        ->default('SP/' . $nomor . '/' . $organisasi->kode . '/' . Carbon::now('Asia/Jakarta')->format('m') . '/' . Carbon::now('Asia/Jakarta')->format('Y')),
                    DatePicker::make('tanggal')
                        ->label('Tanggal')
                        ->placeholder('Masukan Tanggal')
                        ->default(Carbon::now('Asia/Jakarta')),
                    Select::make('kepala')
                        ->label('Atasan')
                        ->searchable()
                        ->options(Organisasi::where('tingkat', 'Bagian')->get()->pluck('nama', 'id'))
                        ->required(),
                    Textarea::make('perihal')
                        ->label('Perihal')
                        ->required()
                        ->placeholder('Masukan Perihal')
                        ->columnSpanFull(),
                    TableRepeater::make('detil_pengadaan')
                        ->label('Detil Pengadaan')
                        ->relationship('detilPengadaan')
                        ->dehydrated(true)
                        ->schema([
                            TextInput::make('nama_barang')
                                ->required()
                                ->label('Nama Barang')
                                ->placeholder('Masukan Nama Barang'),
                            TextInput::make('merk')
                                ->required()
                                ->label('Merk Barang')
                                ->placeholder('Masukan Merk Barang'),
                            TextInput::make('jumlah')
                                ->required()
                                ->numeric()
                                ->label('Jumlah Barang')
                                ->placeholder('Masukan Jumlah Barang'),
                            TextInput::make('harga')
                                ->required()
                                ->label('Harga Barang')
                                ->mask(RawJs::make('$money($input)'))
                                ->numeric()
                                ->stripCharacters(',')
                                ->placeholder('Masukan Harga Barang'),
                        ])->colStyles([
                            'nama_barang' => 'width: 40%;',
                            'merk' => 'width: 30%;',
                            'harga' => 'width: 30%;',
                        ])->addActionLabel('Tambah')

                ])->columns(2)
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->modifyQueryUsing(
                function (Builder $query) {
                    // if (!auth()->user()->hasRole('Logistik')) {
                    //     return $query;
                    // } else {
                    //     return $query;
                    // }

                    return $query;
                }
            )
            ->recordUrl(
                fn() => null
            )
            ->columns([
                TextColumn::make('index')
                    ->rowIndex()
                    ->label('No. ')
                    ->alignCenter(),
                TextColumn::make('nomor_pengadaan')
                    ->badge()
                    ->searchable(),
                TextColumn::make('pemohon.nama')
                    ->label('Unit')
                    ->searchable(),
                TextColumn::make('user.name')
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
                    Tables\Actions\EditAction::make()
                        ->hidden(
                            fn(Pengadaan $record) => $record->oleh != auth()->user()->id
                        ),
                    Action::make('setujui')
                        ->label('Setujui')
                        ->icon('heroicon-o-check-circle')
                        ->requiresConfirmation()
                        ->modalDescription('Setujui Pengadaan Barang?')
                        ->color('success')
                        ->action(
                            function (Pengadaan $record) {
                                try {
                                    $record->update(['status' => 1]);
                                    Notification::make()
                                        ->title('Berhasil Disetujui!')
                                        ->icon('heroicon-o-check-circle')
                                        ->iconColor('success')
                                        ->send();
                                } catch (\Throwable $th) {
                                    Notification::make()
                                        ->title('Gagal!')
                                        ->body($th->getMessage())
                                        ->icon('heroicon-o-check-circle')
                                        ->iconColor('danger')
                                        ->send();
                                }
                            }
                        )->hidden(
                            function (Pengadaan $record) {
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
                        ->modalDescription('Tolak Pengadaan Barang?')
                        ->requiresConfirmation()
                        ->action(
                            function (Pengadaan $record) {
                                try {
                                    $record->update(['status' => 99]);
                                    Notification::make()
                                        ->title('Berhasil Ditolak!')
                                        ->icon('heroicon-o-x-circle')
                                        ->iconColor('danger')
                                        ->send();
                                } catch (\Throwable $th) {
                                    Notification::make()
                                        ->title('Gagal!')
                                        ->body($th->getMessage())
                                        ->icon('heroicon-o-x-circle')
                                        ->iconColor('danger')
                                        ->send();
                                }
                            }
                        )->hidden(
                            function (Pengadaan $record) {
                                if (!auth()->user()->hasRole('Logistik')) {
                                    return $record->status >= 0;
                                } else {
                                    return $record->status != 0;
                                }
                            }
                        ),
                    Action::make('setuju_atasan')
                        ->label('Sutujui')
                        ->icon('heroicon-o-check-circle')
                        ->color('success')
                        ->requiresConfirmation()
                        ->modalDescription('Setujui Surat Pengadaan Barang?')
                        ->action(
                            function (Pengadaan $record) {
                                try {
                                    $record->update(['persetujuan' => 1]);
                                    Notification::make()
                                        ->title('Berhasil Disetujui!')
                                        ->icon('heroicon-o-check-circle')
                                        ->iconColor('success')
                                        ->send();
                                } catch (\Throwable $th) {
                                    Notification::make()
                                        ->title('Gagal!')
                                        ->body($th->getMessage())
                                        ->icon('heroicon-o-check-circle')
                                        ->iconColor('danger')
                                        ->send();
                                }
                            }
                        )
                        ->hidden(
                            function (Pengadaan $record) {

                                if ($record->kepala == auth()->user()->id) {
                                    return $record->persetujuan != 0;
                                } else {
                                    return $record->kepala != auth()->user()->id;
                                }
                            }
                        ),
                    Action::make('surat')
                        ->label('Memo Permintaan')
                        ->icon('heroicon-o-paper-clip')
                        ->color('primary')
                        ->action(
                            function (Pengadaan $record) {
                                $organisasi = Organisasi::where('id', $record->organisasi)->first();
                                $pemohon = User::where('id', $record->oleh)->first();
                                $nama_kepala = User::where('id', $record->kepala)->first();
                                $organisasi_kepala = Organisasi::where('id', $nama_kepala->organisasi)->first();
                                $contxt = stream_context_create([
                                    'ssl' => [
                                        'verify_peer' => FALSE,
                                        'verify_peer_name' => FALSE,
                                        'allow_self_signed' => TRUE
                                    ]
                                ]);
                                $pdf = Pdf::setOptions(['isHtml5ParserEnabled' => true, 'isRemoteEnabled' => true])->loadView(
                                    'logistik.pengadaan.surat.surat_pengadaan',
                                    [
                                        'pengadaan' => $record,
                                        'organisasi' => $organisasi,
                                        'pemohon' => array($organisasi, $pemohon),
                                        'kepala' => array($organisasi_kepala, $nama_kepala),
                                        'detilPengadaan' => PengadaanDetil::where('id_pengadaan', $record->id)->get(),
                                        'qr_pemohon' => QrCode::format('png')->generate($pemohon->name),
                                        'qr_kepala' => QrCode::format('png')->generate($nama_kepala->name),
                                    ]
                                )->setHttpContext($contxt);
                                return response()->streamDownload(function () use ($pdf) {
                                    echo $pdf->stream();
                                }, $record->id . '.pdf');
                            }
                        )
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
            'index' => Pages\ListPengadaans::route('/'),
            'create' => Pages\CreatePengadaan::route('/create'),
            'edit' => Pages\EditPengadaan::route('/{record}/edit'),
            'serah_terima' => Pages\SerahTerimaBarang::route('/serah_terima'),
        ];
    }
}
