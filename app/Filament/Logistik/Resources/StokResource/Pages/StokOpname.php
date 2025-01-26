<?php

namespace App\Filament\Logistik\Resources\StokResource\Pages;

use App\Filament\Logistik\Resources\StokResource;
use App\Models\Barang;
use App\Models\Stok;
use App\Models\StokOpname as ModelsStokOpname;
use App\Models\StokOpnameDetil;
use Carbon\Carbon;
use Filament\Forms\Components\Card;
use Filament\Forms\Components\DateTimePicker;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Resources\Pages\Page;
use Filament\Forms\Concerns\InteractsWithForms;
use Filament\Forms\Contracts\HasForms;
use Filament\Forms\Form;
use Filament\Notifications\Notification;
use Icetalker\FilamentTableRepeater\Forms\Components\TableRepeater;

class StokOpname extends Page implements HasForms
{
    protected static string $resource = StokResource::class;

    protected static string $view = 'filament.logistik.resources.stok-resource.pages.stok-opname';

    use InteractsWithForms;

    public ?array $data = [];

    public function mount(): void
    {
        $this->form->fill();
    }

    public function form(Form $form): Form
    {
        $data_stok = Stok::with('detail_barang')->where('organisasi', auth()->user()->organisasi)->get();
        $stok = json_decode($data_stok, true);

        return $form
            ->schema([
                Card::make()->schema([
                    DateTimePicker::make('tanggal')
                        ->required()
                        ->default(Carbon::now('Asia/Jakarta'))
                        ->label('Tanggal Opname')
                        ->placeholder('Masukan Tanggal Stok Opname')
                        ->columnSpanFull(),
                    TableRepeater::make('detil_permintaan')
                        ->label('Barang Permintaan')
                        ->schema([
                            TextInput::make('detail_barang.nama_barang')
                                ->label('Barang')
                                // ->placeholder('Masukan Barang Permintaan')
                                ->readOnly(),
                            TextInput::make('stok')
                                ->label('Stok')
                                ->readOnly()
                                ->placeholder('Masukan Jumlah')
                                ->required(),
                            TextInput::make('sisa_stok')
                                ->label('Sisa Stok')
                                ->numeric()
                                ->placeholder('Masukan Jumlah Sisa Stok')
                                ->required(),
                        ])
                        ->default(
                            $stok
                        )
                        ->colStyles([
                            'barang' => 'width: 60%;',
                            'stok' => 'width: 10%;',
                            'sisa_stok' => 'width: 30%;',
                        ])
                        ->addable(false)
                        ->columnSpan('full')
                ])->columns(2)
            ])
            ->statePath('data');
    }

    public function create(): void
    {

        try {
            $data_stok_opname = ModelsStokOpname::create([
                'tanggal' => $this->form->getState()['tanggal'],
                'organisasi' => auth()->user()->organisasi,
                'status' => 0,
            ]);

            foreach ($this->form->getState()['detil_permintaan'] as $key => $value) {
                StokOpnameDetil::create([
                    'id_stok_opname' => $data_stok_opname->id,
                    'barang' => $value['barang'],
                    'stok_sebelumnya' => $value['stok'],
                    'stok_sekarang' => $value['sisa_stok']
                ]);

                Stok::where('organisasi', auth()->user()->organisasi)->where('barang', $value['barang'])->update([
                    'stok' => $value['sisa_stok'],
                ]);
            }

            Notification::make()
                ->title('Berhasil update stok!')
                ->success()
                ->send();

            redirect(StokResource::getUrl('index'));

        } catch (\Throwable $th) {
            Notification::make()
                ->title($th->getMessage())
                ->danger()
                ->send();
        }
    }
}
