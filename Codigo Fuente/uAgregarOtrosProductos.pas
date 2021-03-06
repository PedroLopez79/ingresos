unit uAgregarOtrosProductos;

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
  dxSkinValentine, dxSkinXmas2008Blue, cxButtons, ComCtrls, LibraryIngresos_Intf,
  uDAScriptingProvider, uDADataTable, uDAMemDataTable, uROComponent,
  uDACDSDataTable, uDADataAdapter, uDARemoteDataAdapter, cxControls,
  dxRibbonSkins, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint, dxSkinsdxRibbonPainter,
  cxClasses, dxRibbon, ufrmPrincipal, cxContainer, cxEdit, cxTextEdit,
  cxCurrencyEdit, dxRibbonForm;

type
  // Declare a Venta record
  TVentaOtrosProductos = record
    OK            : boolean;
    DESCRIPCION   : string[100];
    PRECIO        : Float;
    CANTIDAD      : Integer;
    IMPORTE       : Float;
    REFERENCIA    : string[100];
  end;

  TFo_AgregarVentaOtrosProductos = class(TdxCustomRibbonForm)
    Panel1: TPanel;
    Pa_ayuda: TPanel;
    Button2: TButton;
    dxRibbon1: TdxRibbon;
    dxRibbon1Tab1: TdxRibbonTab;
    Button1: TButton;
    Label8: TLabel;
    edtPrecio: TcxCurrencyEdit;
    Label9: TLabel;
    Label10: TLabel;
    edtCantidad: TcxCurrencyEdit;
    Label11: TLabel;
    edtImporte: TcxCurrencyEdit;
    Label3: TLabel;
    edtDescripcionProducto: TcxTextEdit;
    edtReferenciaCliente: TcxTextEdit;
    procedure Button2Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure edtCantidadPropertiesEditValueChanged(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fo_AgregarVentaOtrosProductos: TFo_AgregarVentaOtrosProductos;
  Venta: TVentaOtrosProductos;
  CAPTURA: Boolean;

function Abrir_ModuloAgregarVentaOtrosProductos(Estacion: Integer):TVentaOtrosProductos;

implementation
uses  uDM;

{$R *.dfm}

function Abrir_ModuloAgregarVentaOtrosProductos(Estacion: Integer):TVentaOtrosProductos;
Begin
  Fo_AgregarVentaOtrosProductos:=TFo_AgregarVentaOtrosProductos.Create(Application);
  Fo_AgregarVentaOtrosProductos.ShowModal;

  Result:= Venta;

  Fo_AgregarVentaOtrosProductos.Free;
End;

procedure TFo_AgregarVentaOtrosProductos.Button1Click(Sender: TObject);
begin
  Venta.OK:= False;
  Fo_AgregarVentaOtrosProductos.Close;
end;

procedure TFo_AgregarVentaOtrosProductos.Button2Click(Sender: TObject);
begin
  Venta.OK:= True;
  Venta.DESCRIPCION:= edtDescripcionProducto.EditValue;
  Venta.PRECIO:= edtPrecio.EditValue;
  Venta.CANTIDAD:= edtCantidad.EditValue;
  Venta.IMPORTE:= edtImporte.EditValue;
  Venta.REFERENCIA:= edtReferenciaCliente.EditValue;

  Fo_AgregarVentaOtrosProductos.Close;
end;

procedure TFo_AgregarVentaOtrosProductos.edtCantidadPropertiesEditValueChanged(
  Sender: TObject);
begin
  edtimporte.EditValue:= edtPrecio.EditValue * edtCantidad.EditValue;
end;

procedure TFo_AgregarVentaOtrosProductos.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key:=#0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;

end;

end.
