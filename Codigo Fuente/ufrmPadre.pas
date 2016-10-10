unit ufrmPadre;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type
  TfrmPadre = class(TForm)
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    OkEnter: Boolean;
  end;

var
  frmPadre: TfrmPadre;

implementation

{$R *.dfm}

procedure TfrmPadre.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = vk_return) and (OkEnter) then
  begin
    key:=0;
    Perform(WM_NEXTDLGCTL,0,0);
  end;
end;

procedure TfrmPadre.FormShow(Sender: TObject);
begin
  Screen.Cursor:= crDefault;
end;

end.
