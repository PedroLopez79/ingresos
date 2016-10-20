unit uAgregarVenta;

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
  cxCurrencyEdit;

type
  // Declare a Venta record
  TVenta = record
    IDPRODUCTO  : Integer;
    DESCRIPCION : string[100];
    PRECIO      : Float;
    CANTIDAD    : Integer;
    IMPORTE     : Float;
    NUMTICKET   : string[50];
  end;

  TFo_AgregarVenta = class(TForm)
    Panel1: TPanel;
    Pa_ayuda: TPanel;
    Label6: TLabel;
    Button2: TButton;
    rdaObtenProducto: TDARemoteDataAdapter;
    cdsObtenProducto: TDACDSDataTable;
    dxRibbon1: TdxRibbon;
    dxRibbon1Tab1: TdxRibbonTab;
    Button1: TButton;
    edtProducto: TcxCurrencyEdit;
    btnBuscaCliente: TcxButton;
    Label7: TLabel;
    edtDescripcionProducto: TcxCurrencyEdit;
    Label8: TLabel;
    edtPrecio: TcxCurrencyEdit;
    Label9: TLabel;
    Label10: TLabel;
    edtCantidad: TcxCurrencyEdit;
    Label11: TLabel;
    edtImporte: TcxCurrencyEdit;
    edtNumTicket: TcxCurrencyEdit;
    procedure Button2Click(Sender: TObject);
    procedure edtProductoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure BuscarProducto;
  public
    { Public declarations }
  end;

var
  Fo_AgregarVenta: TFo_AgregarVenta;
  Venta: TVenta;

function Abrir_ModuloAgregarVenta(Estacion: Integer):TVenta;

implementation
uses  uDM, ufrmBuscar, ufrmBuscarProducto;

{$R *.dfm}

function Abrir_ModuloAgregarVenta(Estacion: Integer):TVenta;
Begin
  Fo_AgregarVenta:=TFo_AgregarVenta.Create(Application);

  Fo_AgregarVenta.ShowModal;

  Result:= Venta;
  Fo_AgregarVenta.Free;
End;

procedure TFo_AgregarVenta.BuscarProducto;
var
   Datos: TDatosBusqueda;
begin
  Datos:=PantallaBusqueda(TfrmBuscarProducto,'');
  if Datos.OK then
  begin
     edtProducto.EditValue:= Datos.Clave;
     edtDescripcionProducto.EditValue:= Datos.Nombre;
     edtPrecio.Value:= Datos.Precio;
  end;
end;

procedure TFo_AgregarVenta.Button2Click(Sender: TObject);
begin
  Venta.IDPRODUCTO:= edtProducto.EditValue;
  Venta.DESCRIPCION:= edtDescripcionProducto.EditValue;
  Venta.PRECIO:= edtPrecio.EditValue;
  Venta.CANTIDAD:= edtCantidad.EditValue;
  Venta.IMPORTE:= edtImporte.EditValue;
  Venta.NUMTICKET:= edtNumTicket.EditValue;

  Fo_AgregarVenta.Close;
end;

procedure TFo_AgregarVenta.edtProductoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_F2 then
  begin
    BuscarProducto;
  end;
end;

end.
