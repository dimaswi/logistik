<?php

namespace App\Filament\Logistik\Resources;

use App\Filament\Logistik\Resources\RuanganResource\Pages;
use App\Filament\Logistik\Resources\RuanganResource\RelationManagers;
use App\Models\Organisasi;
use App\Models\Ruangan;
use App\Models\User;
use Filament\Forms;
use Filament\Forms\Components\Card;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class RuanganResource extends Resource
{
    protected static ?string $model = Ruangan::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    protected static ?string $navigationLabel = 'Ruangan';

    protected static ?string $modelLabel = 'Ruangan ';

    protected static ?string $navigationGroup = 'Master';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Card::make()->schema([
                    TextInput::make('nama_ruangan')
                        ->required()
                        ->label('Nama Ruangan')
                        ->placeholder('Masukan Nama Ruangan')
                        ->columnSpanFull(),
                    Select::make('kepala_ruangan')
                        ->required()
                        ->options(
                            User::all()->pluck('name', 'id')
                        )
                        ->label('Kepala Ruangan')
                        ->searchable()
                        ->columnSpanFull(),
                    Select::make('organisasi')
                        ->required()
                        ->options(
                            Organisasi::all()->pluck('nama', 'id')
                        )
                        ->label('Unit')
                        ->searchable()
                        ->columnSpanFull(),
                ])
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->recordUrl(
                fn () => null
            )
            ->columns([
                TextColumn::make('nama_ruangan')->searchable(),
                TextColumn::make('kepala.name')->searchable(),
                TextColumn::make('org.nama')->label('Unit')->searchable(),
            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
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
            'index' => Pages\ListRuangans::route('/'),
            'create' => Pages\CreateRuangan::route('/create'),
            'edit' => Pages\EditRuangan::route('/{record}/edit'),
        ];
    }
}
