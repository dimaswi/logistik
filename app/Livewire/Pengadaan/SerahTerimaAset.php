<?php

namespace App\Livewire\Pengadaan;

use App\Models\Aset;
use App\Models\Pengadaan;
use App\Models\PengadaanDetil;
use App\Models\Ruangan;
use App\Models\SerahTerimaAset as ModelsSerahTerimaAset;
use App\Models\User;
use Filament\Forms\Components\Card;
use Filament\Forms\Components\DatePicker;
use Filament\Forms\Components\Hidden;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Concerns\InteractsWithForms;
use Filament\Forms\Contracts\HasForms;
use Filament\Forms\Form;
use Filament\Notifications\Notification;
use Icetalker\FilamentTableRepeater\Forms\Components\TableRepeater;
use Illuminate\Contracts\View\View;
use Livewire\Component;

class SerahTerimaAset extends Component implements HasForms
{
    use InteractsWithForms;

    public ?array $data = [];

    public $id;

    public $idpengadaan;

    public function mount(): void
    {
        $this->form->fill();
    }

    public function form(Form $form): Form
    {
        $data = PengadaanDetil::where('id', $this->id)->get()->toArray();
        $pengadaan = Pengadaan::where('id', $this->idpengadaan)->first();

        $list_barang = [];
        for ($i = 0; $i < $data[0]['jumlah']; $i++) {
            array_push($list_barang, $data[0]);
        }

        return $form
            ->schema([
                Card::make()->schema([
                    DatePicker::make('tanggal_pembelian')
                        ->label('Tanggal Pembelian')
                        ->required(),
                    DatePicker::make('tanggal_serah_terima')
                        ->label('Tanggal Serah Terima')
                        ->required(),
                    Select::make('penerima')
                        ->label('Penerima Barang')
                        ->options(User::all()->pluck('name', 'id'))
                        ->searchable()
                        ->required(),
                    TableRepeater::make('list_barang')
                        ->label('List Barang Serah Terima')
                        ->schema([
                            Hidden::make('id_pengadaan'),
                            TextInput::make('nama_barang')
                                ->readOnly(),
                            TextInput::make('merk')
                                ->readOnly(),
                            Select::make('ruangan')
                                ->options(Ruangan::where('organisasi', $pengadaan->organisasi)->pluck('nama_ruangan', 'id'))
                                ->searchable()
                                ->required(),
                        ])
                        ->default(
                            $list_barang
                        )
                        ->colStyles([
                            'nama_barang' => 'width:40%;',
                            'merk' => 'width:20%;',
                            'ruangan' => 'width:40%;',
                        ])
                        ->addable(false)
                ])
            ])
            ->statePath('data');
    }

    public function create(): void
    {
        try {
            foreach ($this->form->getState()['list_barang'] as $key => $value) {
                Aset::create([
                    'id_pengadaan' => $value['id_pengadaan'],
                    'nama_aset' => $value['nama_barang'],
                    'merk' => $value['merk'],
                    'lokasi' => $value['ruangan'],
                    'tanggal_pembelian' =>  $this->form->getState()['tanggal_pembelian'],
                    'tanggal_serah_terima' =>  $this->form->getState()['tanggal_serah_terima'],
                    'harga_pembelian' => $value['harga'],
                ]);
            }
            PengadaanDetil::where('id', $this->id)->update([
                'serah_terima' => 1
            ]);

            ModelsSerahTerimaAset::create([
                'id_pengadaan' => $this->idpengadaan,
                'id_pengadaan' => $this->idpengadaan,
                'nama_penerima' => $this->form->getState()['penerima'],
                'tanggal_serah_terima' => $this->form->getState()['tanggal_serah_terima'],
            ]);

            Notification::make()
                ->title('Berhasil Diserahkann!')
                ->success()
                ->send();
        } catch (\Throwable $th) {
            Notification::make()
                ->title('Gagal!')
                ->body($th->getMessage())
                ->danger()
                ->send();
        }
    }
    public function render()
    {
        return view('livewire.pengadaan.serah-terima-aset');
    }
}
