unit ClaseGenera;

interface

uses
  Classes, SysUtils, DB, Variants{, ExportaLibrary_Intf};

type
  TMisParametros = class
    SN: String;
    NombreEstacion: String;
    Fecha: TDateTime;
    Poliza: Integer;
    EstacionINI: Integer;
    EstacionFIN: Integer;
    TurnoINI: Integer;
    TurnoFIN: Integer;
    FechaINI: TDateTime;
    FechaFIN: TDateTime;
  end;

  TGenera = class
  private
    FLista: TStrings;
    FNombreArchivo: String;
    FParametros: TMisParametros;
    procedure SetNombreArchivo(const Value: String);
    procedure SetParametros(const Value: TMisParametros);
  public
    constructor Create;
    destructor Destroy; override;
    property NombreArchivo: String read FNombreArchivo write SetNombreArchivo;
    property Parametros: TMisParametros read FParametros write SetParametros;
    procedure Guardar;
    procedure Abrir;
    procedure Next;
    procedure First;
    procedure Last;
    procedure Prior;
    function Campo(Campo: String): Variant;
    function EOF: Boolean;
    function RecordCount: Integer;
    function LinesCount: Integer;
    function Formato(Cad: String; Valor: Variant): String;
    function FormatoFecha(Cad: String; Valor: Variant): String;
    procedure Agregar(Cad: String);
    procedure Reemplazar(AIndex: Integer; Cad: String);
    procedure Limpiar;
    function Locate(Campo: String; Valor: Variant): Boolean;
    procedure AsignaValorCampo(Campo: String; Valor: Variant);
    procedure Deletes;
    function Alinear(Cad: String; cpi, Direccion: Integer): String;
    function LLenar(Cad, Caracter: String; Cuantos: Integer; Inicio: Boolean): String;
    function ReemplazaStr(Cad, Busca, Nuevo: String): String;
    function Nivel(Cad: String): Integer;
    function NumTexto(Num : Integer) : String;
  end;

implementation

uses
  uDM, UtileriasComun;

{ TGenera }

procedure TGenera.Abrir;
begin
  if FileExists(NombreArchivo) then
  begin
    FLista.Clear;
    FLista.LoadFromFile(NombreArchivo);
  end;
end;

procedure TGenera.Agregar(Cad: String);
begin
  FLista.Add(Cad);
end;

procedure TGenera.Reemplazar(AIndex: Integer; Cad: String);
begin
  if FLista.Count > AIndex then
    FLista[AIndex]:=Cad;
end;

function TGenera.ReemplazaStr(Cad, Busca, Nuevo: String): String;
begin
  Result:=UtileriasComun.ReemplazaStr(Cad, Busca, Nuevo);
end;

function TGenera.Alinear(Cad: String; cpi, Direccion: Integer): String;
begin
  Result:=Alinea(Cad, cpi, Direccion);
end;

procedure TGenera.AsignaValorCampo(Campo: String; Valor: Variant);
begin
  if Valor <> Null then
  begin
    DM.tblDatos.Edit;
    DM.tblDatos.FieldByName(Campo).Value:=Valor;
    DM.tblDatos.Post;
  end;
end;

function TGenera.Campo(Campo: String): Variant;
begin
  Result:=DM.tblDatos.FieldByName(Campo).Value;
end;

constructor TGenera.Create;
begin
  FLista:=TStringList.Create;
  FParametros:=TMisParametros.Create;
end;

procedure TGenera.Deletes;
begin
  if DM.tblDatos.RecordCount > 0 then
    DM.tblDatos.Delete;
end;

destructor TGenera.Destroy;
begin
  FLista.Free;
  inherited;
end;

function TGenera.EOF: Boolean;
begin
  Result:=DM.tblDatos.EOF;
end;

procedure TGenera.First;
begin
  DM.tblDatos.First;
end;

function TGenera.Formato(Cad: String; Valor: Variant): String;
begin
  Result:=FormatFloat(Cad, Valor);
end;

function TGenera.FormatoFecha(Cad: String; Valor: Variant): String;
begin
  Result:=FormatDateTime(Cad, Valor);
end;

procedure TGenera.Guardar;
begin
  FLista.SaveToFile(NombreArchivo);
end;

procedure TGenera.Last;
begin
  DM.tblDatos.Last;
end;

procedure TGenera.Limpiar;
begin
  FLista.Clear;
end;

function TGenera.LinesCount: Integer;
begin
  Result:=FLista.Count;
end;

function TGenera.LLenar(Cad, Caracter: String; Cuantos: Integer; Inicio: Boolean): String;
var
  I: Integer;
begin
  if length(Caracter) > 1 then
    Caracter:=Caracter[1];
  if Length(Cad) > Cuantos then
    Result:=Copy(Cad, 1, Cuantos)
  else
  begin
    Result:='';
    for I := Length(Cad) + 1 to Cuantos do
      Result:=Result + Caracter;
    if Inicio then
      Result:=Result + Cad
    else
      Result:=Cad + Result;
  end;
end;

function TGenera.Locate(Campo: String; Valor: Variant): Boolean;
begin
  Result:=False;
  if Valor <> Null then
    Result:=DM.tblDatos.Locate(Campo, Valor, [loCaseInsensitive]);
end;

procedure TGenera.Next;
begin
  DM.tblDatos.Next;
end;

function TGenera.Nivel(Cad: String): Integer;
var
  I, J: Integer;
  OK: Boolean;
  S: String;
begin
  Result:=1;
  I:=1;
  if Cad = '' then
    Exit;
  while GetParsedItem(Cad, '-', I) <> '' do
  begin
    OK:=True;
    S:=GetParsedItem(Cad, '-', I);
    for J := 1 to Length(S) do
    begin
      if S[J] <> '0' then
        OK:=False;
    end;
    if OK then
    begin
      Result:=I;
      Exit;
    end;
    I:=I+1;
  end;
  Result:=I;
end;

function TGenera.NumTexto(Num : Integer): String;
begin
  Result:=inttostr(Num);
end;

procedure TGenera.Prior;
begin
  DM.tblDatos.Prior;
end;

function TGenera.RecordCount: Integer;
begin
  Result:=DM.tblDatos.RecordCount;
end;

procedure TGenera.SetNombreArchivo(const Value: String);
begin
  FNombreArchivo := Value;
end;

procedure TGenera.SetParametros(const Value: TMisParametros);
begin
  FParametros := Value;
end;

end.
