unit LoginComun;

interface

uses
  Controls, Forms, Windows;

type
  TFuncLogin = function (Usr, Psw, Svr: String): Integer of object;

function Login(Validador: TFuncLogin): Integer;

implementation

uses
  ufrmPassword;

function Login(Validador: TFuncLogin): Integer;
var
  frmPassword: TfrmPassword;
begin
  frmPassword := TfrmPassword.Create(nil);
  try
    Screen.Cursor := crHourGlass;
    frmPassword.onValidar:=Validador;
    LockWindowUpdate(Application.Handle);
    frmPassword.ShowModal;
    Result := frmPassword.Valida;
  finally
    Screen.Cursor:=crDefault;
    LockWindowUpdate(0);
    frmPassword.Free;
  end;
end;


end.
