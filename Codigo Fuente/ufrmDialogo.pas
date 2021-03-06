unit ufrmDialogo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmOKCancelar, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, Menus, StdCtrls,
  cxButtons, cxGroupBox, ExtCtrls, ComCtrls, HTMLText, uDM;

type
  TfrmDialogo = class(TfrmOKCancelar)
    lvImagen: TListView;
    lblTexto: THTMLStaticText;
    Panel3: TPanel;
    procedure lvImagenEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Mensaje(Titulo: String; idDialogo: Integer; Tipo: TDialogo; Parametros: Array of Const);
  end;

var
  frmDialogo: TfrmDialogo;

implementation

uses dmImagenes;

{$R *.dfm}

{ TfrmOKCancelar1 }

procedure TfrmDialogo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action:= caFree;
end;

procedure TfrmDialogo.FormCreate(Sender: TObject);
begin
  inherited;
  Beep;
end;

procedure TfrmDialogo.lvImagenEnter(Sender: TObject);
begin
  inherited;
  Panel3.SetFocus;
end;

procedure TfrmDialogo.Mensaje(Titulo: String; idDialogo: Integer;
  Tipo: TDialogo; Parametros: array of Const);
begin
  Panel1.Caption:= ' ' + Titulo;

  case Tipo of
    Ninguno:      lvImagen.Items[0].ImageIndex:= -1;
    Informacion:  lvImagen.Items[0].ImageIndex:= 37;
    Error:        lvImagen.Items[0].ImageIndex:= 38;
    Confirmar:    lvImagen.Items[0].ImageIndex:= 39;
  end;
    lblTexto.HTMLText.Text:= Format(Dialogos[idDialogo], Parametros);
end;

end.
