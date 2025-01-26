<?php

namespace App\Filament\Logistik\Resources;

use App\Filament\Logistik\Resources\StokResource\Pages;
use App\Filament\Logistik\Resources\StokResource\RelationManagers;
use App\Models\Organisasi;
use App\Models\Stok;
use Filament\Forms;
use Filament\Forms\Components\Select;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Enums\FiltersLayout;
use Filament\Tables\Filters\Filter;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class StokResource extends Resource
{
    protected static ?string $model = Stok::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    protected static ?string $navigationLabel = 'Stok';

    protected static ?string $modelLabel = 'Stok ';

    protected static ?string $navigationGroup = 'Logistik';

    protected static ?int $navigationSort = 1;

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                //
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->modifyQueryUsing(
                function (Builder $query): Builder {

                    if (!auth()->user()->hasRole('Logistik')) {
                        return $query->where('organisasi', auth()->user()->organisasi);
                    } else {
                        return $query;
                    }

                }
            )
            ->columns([
                TextColumn::make('index')
                    ->label('No.')
                    ->alignCenter()
                    ->rowIndex(),
                TextColumn::make('detail_barang.nama_barang')
                    ->label('Nama Barang'),
                TextColumn::make('lokasi.nama')
                    ->sortable()
                    ->badge()
                    ->color('success'),
                TextColumn::make('stok'),
                TextColumn::make('detail_barang.harga')
                    ->money('IDR')
                    ->badge()
            ])
            ->filters([
                Filter::make('filter_barang')
                    ->form([
                        Select::make('organisasi')
                            ->label('Unit')
                            ->searchable()
                            ->options(Organisasi::all()->pluck('nama', 'id')),
                    ])
                    ->query(function (Builder $query, array $data): Builder {
                        return $query
                            ->when(
                                $data['organisasi'],
                                fn(Builder $query, $organisasi): Builder => $query->where('organisasi', $organisasi),
                            );
                    })
                    ->indicateUsing(function (array $data): ?string {
                        if (! $data['organisasi']) {
                            return null;
                        }

                        $organisasi = Organisasi::where('id', $data['organisasi'])->first();

                        return 'Filter ' . $organisasi->nama;
                    })
            ], layout: FiltersLayout::Modal)
            ->deferFilters()
            ->filtersTriggerAction(
                fn(\Filament\Tables\Actions\Action $action) => $action->slideOver(),
            )
            ->actions([
                // Tables\Actions\EditAction::make(),
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
            'index' => Pages\ListStoks::route('/'),
            'stok_opname' => Pages\StokOpname::route('/stok-opname'),
            // 'create' => Pages\CreateStok::route('/create'),
            // 'edit' => Pages\EditStok::route('/{record}/edit'),
        ];
    }
}
