unit uAgregaLinea;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DateUtils, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, cxButtons, ComCtrls,
  uDAScriptingProvider, uDADataTable, uDAMemDataTable, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxDBEdit, DB, uDAInterfaces;

type
  TfrmAgregaLinea = class(TForm)
    Panel1: TPanel;
    Pa_ayuda: TPanel;
    Label1: TLabel;
    Button2: TButton;
    cdsLinea: TDAMemDataTable;
    Button1: TButton;
    dsLinea: TDADataSource;
    TxtNombre: TcxDBTextEdit;
    procedure FormShow(Sender: TObject);
    procedure cdsLineaAfterPost(DataTable: TDADataTable);
    procedure cdsLineaNewRecord(DataTable: TDADataTable);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAgregaLinea: TfrmAgregaLinea;
  ID: Integer;

function Abrir_AgregaLinea: Integer;

implementation
uses  uDM;

{$R *.dfm}

function Abrir_AgregaLinea: Integer;
Begin
  ID:= -1;
  frmAgregaLinea:=TfrmAgregaLinea.Create(Application);

  frmAgregaLinea.ShowModal;
  Result:= ID;
  frmAgregaLinea.Free;
End;

procedure TfrmAgregaLinea.Button1Click(Sender: TObject);
begin
  ID:= cdsLinea.FieldByName('IDLINEA').AsInteger;
  cdsLinea.Post;
  Close;
end;

procedure TfrmAgregaLinea.Button2Click(Sender: TObject);
begin
  cdsLinea.Cancel;
  Close;
end;

procedure TfrmAgregaLinea.cdsLineaAfterPost(DataTable: TDADataTable);
begin
  cdsLinea.ApplyUpdates();
end;

procedure TfrmAgregaLinea.cdsLineaNewRecord(DataTable: TDADataTable);
begin
  cdsLinea.FieldByName('IDLINEA').AsInteger:=DM.Servidor.Folio('IDLINEA','');
  txtNombre.SetFocus;
end;

procedure TfrmAgregaLinea.FormShow(Sender: TObject);
begin
   cdsLinea.Open;
   cdsLinea.Append;
end;

end.
