<?php

namespace App\Filament\Logistik\Resources\PengadaanResource\Pages;

use App\Filament\Logistik\Resources\PengadaanResource;
use App\Models\Aset;
use App\Models\Pengadaan;
use App\Models\PengadaanDetil;
use App\Tables\Columns\Pengadaan\SerahTerimaActionColumn;
use Filament\Forms\Components\TextInput;
use Filament\Resources\Pages\Page;
use Filament\Forms\Concerns\InteractsWithForms;
use Filament\Forms\Contracts\HasForms;
use Filament\Notifications\Notification;
use Filament\Tables\Actions\Action;
use Filament\Tables\Actions\ActionGroup;
use Filament\Tables\Actions\BulkAction;
use Filament\Tables\Actions\BulkActionGroup;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Concerns\InteractsWithTable;
use Filament\Tables\Contracts\HasTable;
use Filament\Tables\Table;
use Icetalker\FilamentTableRepeater\Forms\Components\TableRepeater;
use Illuminate\Contracts\View\View;
use Illuminate\Database\Eloquent\Collection;

class SerahTerimaBarang extends Page implements HasForms, HasTable
{
    protected static string $resource = PengadaanResource::class;

    protected static string $view = 'filament.logistik.resources.pengadaan-resource.pages.serah-terima-barang';

    use InteractsWithTable;
    use InteractsWithForms;

    public function table(Table $table): Table
    {

        return $table
            ->paginated(false)
            ->query(PengadaanDetil::with(['pengadaan' => function ($query) {
                $query->with('pemohon');
            }])->with('rab')->where('serah_terima', 0))

            ->columns([
                TextColumn::make('index')
                    ->rowIndex()
                    ->label('No. ')
                    ->alignCenter(),
                TextColumn::make('pengadaan.nomor_pengadaan')
                    ->badge(),
                TextColumn::make('pengadaan.pemohon.nama'),
                TextColumn::make('nama_barang'),
                TextColumn::make('jumlah')
                    ->badge()
                    ->alignCenter(),
                TextColumn::make('harga')
                    ->money('IDR'),
                SerahTerimaActionColumn::make('action')
            ])
            ->filters([
                // ...
            ])
            ->actions([
                // ActionGroup::make([
                //     Action::make('serah_terima')
                //         ->label('Serah Terima')
                //         ->icon('heroicon-o-inbox-arrow-down')
                //         ->color('success')
                //         ->form([
                //             TableRepeater::make('detil_pengadaan')
                //             ->label('List Barang')
                //             ->dehydrated(true)
                //             ->schema([
                //                 TextInput::make('serah_terima'),
                //                 TextInput::make('serah_terima'),
                //             ])
                //         ])
                //         ->action(
                //             function (PengadaanDetil $record) {

                //                 for ($i = 0; $i < $record->jumlah; $i++) {
                //                     Aset::create([

                //                     ]);
                //                 }
                //             }
                //         )
                // ])
            ])
            ->bulkActions([]);
    }
}
