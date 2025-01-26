<?php

namespace App\Filament\Logistik\Resources;

use App\Filament\Logistik\Resources\OrganisasiResource\Pages;
use App\Filament\Logistik\Resources\OrganisasiResource\RelationManagers;
use App\Models\Organisasi;
use App\Models\User;
use Filament\Forms;
use Filament\Forms\Components\Card;
use Filament\Forms\Components\FileUpload;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Columns\ImageColumn;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class OrganisasiResource extends Resource
{
    protected static ?string $model = Organisasi::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    protected static ?string $navigationLabel = 'Organisasi ';

    protected static ?string $modelLabel = 'Organisasi ';

    protected static ?string $navigationGroup = 'Master';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Card::make()->schema([
                    TextInput::make('nama')
                        ->required()
                        ->label('Nama Organisasi')
                        ->placeholder('Masukan Nama Organisasi'),
                    TextInput::make('kode')
                        ->required()
                        ->label('Kode Organisasi')
                        ->placeholder('Masukan Kode Organisasi'),
                    Select::make('pimpinan')
                        ->required()
                        ->options(
                            User::all()->pluck('name', 'id')
                        )
                        ->searchable()
                        ->label('Pimpinan Organisasi')
                        ->placeholder('Masukan Pimpinan Organisasi'),
                    FileUpload::make('kop')
                        ->required()
                        ->label('KOP Oraganisasi')
                        ->downloadable()
                        ->previewable()
                        ->directory('kop')
                        ->columnSpanFull(),
                    Select::make('tingkat')
                        ->required()
                        ->options([
                            'Ruangan' => 'Ruangan',
                            'Unit' => 'Unit',
                            'Bagian' => 'Bagian',
                            'Direksi' => 'Direksi',
                        ])
                        ->columnSpanFull(),
                ])->columns(3)
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                ImageColumn::make('kop')->label('Organisasi'),
                TextColumn::make('kode')->searchable()->badge(),
                TextColumn::make('tingkat')->searchable()->badge(),
                TextColumn::make('nama')->searchable(),
                TextColumn::make('user.name')->searchable()->label('Pimpinan'),
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
            'index' => Pages\ListOrganisasis::route('/'),
            'create' => Pages\CreateOrganisasi::route('/create'),
            'edit' => Pages\EditOrganisasi::route('/{record}/edit'),
        ];
    }
}
