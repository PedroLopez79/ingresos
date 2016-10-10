unit ExportaDataSet;

interface

uses
  Classes, SysUtils, DB;

type

TFuncValor = function (ACual: Integer): Variant of object;
TFuncFolio = function (Campo, Serie: String): Integer of object;

TExportaDataSet = class
private
  FDataSet: TDataSet;
  FArchivo: TStrings;
  FValorParametro: TFuncvalor;
    FFolios: TFuncFolio;
    procedure SetFolios(const Value: TFuncFolio);
  procedure SetValorParametro(const Value: TFuncvalor);
  property DataSet: TDataSet read FDataSet;
public
  property ValorParametros: TFuncvalor read FValorParametro write SetValorParametro;
  property Folios: TFuncFolio read FFolios write SetFolios;
  constructor Create(ADataSet: TDataSet);
  destructor Destroy; override;
  function FormatFloat(AFormato: String; Valor: Double): String;
  function FormatDateTime(AFormato: String; Fecha: TDateTime): String;
  function Valor(ACampo: String): Variant;
  function ValorParametro(ACual: Integer): Variant;
  function Folio(ACampo, ASerie: String): Integer;
  function EOF: Boolean;
  function Fecha: TDateTime;
  function Derecha(ACad: String; Acpi: Integer): String;
  function SinGuiones(ACad: String): String;
  procedure Next;
  procedure Agregar(ACad: String);
  procedure GuardaArchivo(ARuta: String);
end;

implementation

uses UtileriasComun;

{ TExportaDataSet }

procedure TExportaDataSet.Agregar(ACad: String);
begin
  FArchivo.Add(ACad);
end;

constructor TExportaDataSet.Create(ADataSet: TDataSet);
begin
  FDataSet:=ADataSet;
  FArchivo:=TStringList.Create;
end;

function TExportaDataSet.Derecha(ACad: String; Acpi: Integer): String;
begin
  Result:=UtileriasComun.Derecha(ACad, Acpi);
end;

destructor TExportaDataSet.Destroy;
begin
  inherited Destroy;
  FDataSet:=nil;
  FArchivo.Free;
end;

function TExportaDataSet.EOF: Boolean;
begin
  Result:=DataSet.Eof;
end;

function TExportaDataSet.Fecha: TDateTime;
begin
  Result:=Now;
end;

function TExportaDataSet.Folio(ACampo, ASerie: String): Integer;
begin
  Result:=Folios(ACampo, ASerie);
end;

function TExportaDataSet.FormatDateTime(AFormato: String;
  Fecha: TDateTime): String;
begin
  Result:=SysUtils.FormatDateTime(AFormato, Fecha);
end;

function TExportaDataSet.FormatFloat(AFormato: String; Valor: Double): String;
begin
  Result:=SysUtils.FormatFloat(AFormato, Valor);
end;

procedure TExportaDataSet.GuardaArchivo(ARuta: String);
begin
  FArchivo.SaveToFile(ARuta);
end;

procedure TExportaDataSet.Next;
begin
  DataSet.Next;
end;

procedure TExportaDataSet.SetFolios(const Value: TFuncFolio);
begin
  FFolios := Value;
end;

procedure TExportaDataSet.SetValorParametro(const Value: TFuncvalor);
begin
  FValorParametro := Value;
end;

function TExportaDataSet.SinGuiones(ACad: String): String;
begin
  while Pos('-', ACad) > 0 do
    Delete(ACad, Pos('-', ACad), 1);
  Result:=ACad;
end;

function TExportaDataSet.Valor(ACampo: String): Variant;
begin
  Result:=DataSet.FieldByName(ACampo).AsVariant;
end;

function TExportaDataSet.ValorParametro(ACual: Integer): Variant;
begin
  Result:=ValorParametros(ACual);
end;

end.
