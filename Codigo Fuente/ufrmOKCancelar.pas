unit ufrmOKCancelar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmPadre, ExtCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, Menus, StdCtrls,
  cxButtons, cxGroupBox;

type
  TfrmOKCancelar = class(TfrmPadre)
    Panel1: TPanel;
    Panel2: TPanel;
    cxGroupBox2: TcxGroupBox;
    btnAceptar: TcxButton;
    btnCancelar: TcxButton;
    procedure btnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOKCancelar: TfrmOKCancelar;

implementation

{$R *.dfm}

procedure TfrmOKCancelar.btnAceptarClick(Sender: TObject);
begin
  inherited;
  Close;
  ModalResult:= id_yes;
end;

procedure TfrmOKCancelar.btnCancelarClick(Sender: TObject);
begin
  inherited;
  Close;
  ModalResult:=id_cancel;
end;

end.
