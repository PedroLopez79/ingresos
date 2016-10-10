unit Seguridad;

interface

uses
  Classes;

type
  TSeguridad = class
    private
      FTipo: Integer;
      FNombre: String;
      FCodigo: String;
      FTipoNombre: String;
    public
      constructor Create(ANombre, ACodigo, ATipoNombre : String; ATipo : Integer);
      property Nombre : String read FNombre;
      property Codigo : String read FCodigo;
      property TipoNombre : String read FTipoNombre;
      property Tipo : Integer read FTipo;
  end;

  TControlaSeguridad = class
    private
      FidEmpleado : Integer;
      FNumeroEmpelado : Integer;
      FNombre : String;
      FListaSeguridad : TList;
    FUsuario: String;
    procedure SetUsuario(const Value: String);
      function GetItem(Indice: Integer): TSeguridad;
      function GetCount: Integer;
    public
      constructor Create(AidEmpleado, ANumeroEmpleado : Integer; ANombre, AUsuario: String);
      destructor Destroy; override;
      function SeguridadPorNombre(const Nombre : String) : TSeguridad;
      procedure AgregaSeguridad(const Nombre, Codigo, TipoNombre : String; Tipo : Integer);
      property idEmpleado : Integer read FidEmpleado;
      property NumeroEmpleado : Integer read FNumeroEmpelado;
      property Nombre : String read FNombre;
      property Usuario: String read FUsuario write SetUsuario;
      property Count : Integer read GetCount;
      property Items[Indice : Integer] : TSeguridad read GetItem;
  end;

implementation

uses SysUtils;

{ TSeguridad }

constructor TSeguridad.Create(ANombre, ACodigo, ATipoNombre : String; ATipo : Integer);
begin
  FNombre:=ANombre;
  FCodigo:=ACodigo;
  FTipoNombre:=ATipoNombre;
  FTipo:=ATipo;
end;

{ TControlaSeguridad }

procedure TControlaSeguridad.AgregaSeguridad(const Nombre, Codigo,
  TipoNombre: String; Tipo: Integer);
var
  Aux : TSeguridad;
begin
  Aux:=TSeguridad.Create(Nombre, Codigo, TipoNombre, Tipo);
  FListaSeguridad.Add(Aux);
end;

constructor TControlaSeguridad.Create(AidEmpleado, ANumeroEmpleado: Integer; ANombre, AUsuario: String);
begin
  FListaSeguridad:=TList.Create;
  FidEmpleado:=AidEmpleado;
  FNumeroEmpelado:=ANumeroEmpleado;
  FNombre:=ANombre;
  FUsuario:=AUsuario;
end;

destructor TControlaSeguridad.Destroy;
var
  i : Integer;
begin
  for i:=0 to Count do
    Items[i].Free;
  FListaSeguridad.Free;
  inherited;
end;

function TControlaSeguridad.GetCount: Integer;
begin
  Result:=FListaSeguridad.Count;
end;

function TControlaSeguridad.GetItem(Indice: Integer): TSeguridad;
begin
  if (indice >= 0) and (Indice < Count) then
    Result:=TSeguridad(FListaSeguridad[Indice])
  else
    Result:=nil;
end;

function TControlaSeguridad.SeguridadPorNombre(
  const Nombre: String): TSeguridad;
var
  i : Integer;
begin
  Result:=nil;
  for i:=0 to Count-1 do
  begin
    if CompareText(Nombre, Items[i].Nombre) = 0 then
    begin
      Result:=Items[i];
      break;
    end;
  end;
end;

procedure TControlaSeguridad.SetUsuario(const Value: String);
begin
  FUsuario := Value;
end;

end.
