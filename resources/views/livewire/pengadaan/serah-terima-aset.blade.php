<div>
    <form wire:submit="create">
        {{ $this->form }}

        <br>

        @if (
            $data_pengadaan->ttd_pemohon == 1 &&
                $data_pengadaan->ttd_atasan == 1 &&
                $data_pengadaan->ttd_logistik == 1 &&
                $data_pengadaan->ttd_keuangan == 1 &&
                auth()->user()->hasRole('Logistik'))
            <x-filament::button icon="heroicon-m-document" type="submit" size="sm">
                Simpan
            </x-filament::button>
        @endif

        @if ($data_pengadaan->pengadaan->oleh == auth()->user()->id && $data_pengadaan->ttd_pemohon == 1)
        @elseif ($data_pengadaan->pengadaan->kepala == auth()->user()->id && $data_pengadaan->ttd_atasan == 1)

        @elseif ($data_pengadaan->ttd_logistik == 1 && $data_pengadaan->ttd_keuangan == 1 $data_pengadaan->ttd_pemohon == 1 && $data_pengadaan->ttd_atasan == 1 )

        @elseif ($data_pengadaan->pengadaan->oleh == auth()->user()->id && $data_pengadaan->ttd_pemohon == 0)
            <x-filament::button disable icon="heroicon-m-check-circle" wire:click="setujui" type="button" size="sm"
                color="success">
                Setujui
            </x-filament::button>
        @elseif ($data_pengadaan->pengadaan->kepala == auth()->user()->id && $data_pengadaan->ttd_atasan == 0)
            <x-filament::button disable icon="heroicon-m-check-circle" wire:click="setujui" type="button" size="sm"
                color="success">
                Setujui
            </x-filament::button>
        @else
            <x-filament::button disable icon="heroicon-m-check-circle" wire:click="setujui" type="button"
                size="sm" color="success">
                Setujui
            </x-filament::button>
        @endif


    </form>

    <x-filament-actions::modals />
</div>
