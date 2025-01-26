<div>
    <x-filament::modal slide-over width="7xl" sticky-header>

        <x-slot name="heading">
            Serah Terima Aset
        </x-slot>

        <x-slot name="trigger">
            <x-filament::button>
                Serah Terima
            </x-filament::button>
        </x-slot>

        <livewire:pengadaan.serah-terima-aset :key="Str::random()" :id="$getRecord()->id" :idpengadaan="$getRecord()->id_pengadaan"/>
    </x-filament::modal>
</div>
