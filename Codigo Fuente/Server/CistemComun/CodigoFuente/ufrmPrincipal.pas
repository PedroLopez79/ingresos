unit ufrmPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm2 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses UtileriasComun;

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
  if IsConnectedToNet('64.233.187.99', 80, 1000, 3, nil) then
    ShowMessage('OK')
  else
    ShowMessage('mal');
end;

end.
