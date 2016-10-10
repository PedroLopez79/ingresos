unit ufrmSplash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, jpeg;

type
  TfrmSplash = class(TForm)
    lblVersion: TLabel;
    Image1: TImage;
    lblDerechos: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSplash: TfrmSplash;

implementation

uses UtileriasComun;

{$R *.dfm}

procedure TfrmSplash.FormCreate(Sender: TObject);
begin
  lblVersion.Caption:='Ver ' + Version;
end;

end.
