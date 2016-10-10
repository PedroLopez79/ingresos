unit uUtilerias;

interface

const
  Cadena = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';

function GeneraPassword(Longitud: Byte): String;

implementation

function GeneraPassword(Longitud: Byte): String;
var
  S: String;
  X,Valor: Integer;
begin
  S := '';
  for X := 1 to Longitud do
  begin
    Valor := Random(Length(Cadena));
    S := S + Cadena[Valor];
  end;

  Result := S;
end;

end.
