unit uAgregarVentaDocumentos;

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
  TVentaDocumentos = record
    OK            : boolean;
    IDPRODUCTO    : Integer;
    DESCRIPCION   : string[100];
    PRECIO        : Float;
    CANTIDAD      : Integer;
    IMPORTE       : Float;
    NUMTICKET     : string[50];
    IDCLIENTE     : Integer;
    NOMBRECLIENTE : string[100];
    REFERENCIA    : string[100];
  end;

  TFo_AgregarVentaDocumentos = class(TdxCustomRibbonForm)
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
    btnBuscaProducto: TcxButton;
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
    edtCliente: TcxCurrencyEdit;
    btnBuscarClienteCredito: TcxButton;
    edtNombreCliente: TcxCurrencyEdit;
    Label1: TLabel;
    Label2: TLabel;
    edtReferenciaCliente: TcxCurrencyEdit;
    Label3: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure btnBuscaProductoClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure edtCantidadPropertiesEditValueChanged(Sender: TObject);
    procedure btnBuscarClienteCreditoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    procedure ActionBuscar(Action: TBasicAction; Tipo: Integer);
  public
    { Public declarations }
  end;

var
  Fo_AgregarVentaDocumentos: TFo_AgregarVentaDocumentos;
  Venta: TVentaDocumentos;

function Abrir_ModuloAgregarVentaDocumentos(Estacion: Integer):TVentaDocumentos;

implementation
uses  uDM, ufrmBuscar, ufrmBuscarProducto, ufrmBuscarClienteEfectivo;

{$R *.dfm}

function Abrir_ModuloAgregarVentaDocumentos(Estacion: Integer):TVentaDocumentos;
Begin
  Fo_AgregarVentaDocumentos:=TFo_AgregarVentaDocumentos.Create(Application);

  Fo_AgregarVentaDocumentos.ShowModal;

  Result:= Venta;
  Fo_AgregarVentaDocumentos.Free;
End;

procedure TFo_AgregarVentaDocumentos.ActionBuscar(Action: TBasicAction; Tipo: Integer);
var
  Datos: TDatosBusqueda;
begin

  if Tipo = 1 then
  begin
    Datos:=PantallaBusqueda(TfrmBuscarProducto,'');
    if Datos.OK then
    begin
       edtProducto.EditValue:= Datos.Clave;
       edtDescripcionProducto.EditValue:= Datos.Nombre;
       edtPrecio.Value:= Datos.Precio;
    end;
    edtCantidad.SetFocus();
  end;

  if Tipo = 2 then
  begin
    Datos:= PantallaBusqueda(TfrmBuscarClienteEfectivo,'');
    if Datos.OK then
    begin
       edtCliente.EditValue:= Datos.Clave;
       edtNombreCliente.EditValue:= Datos.Nombre;
       edtReferenciaCliente.EditValue:= Datos.Referencia;
    end;
  end;
end;

procedure TFo_AgregarVentaDocumentos.btnBuscaProductoClick(Sender: TObject);
begin
   ActionBuscar(nil, 1);
end;

procedure TFo_AgregarVentaDocumentos.btnBuscarClienteCreditoClick(
  Sender: TObject);
begin
  ActionBuscar(nil, 2);
end;

procedure TFo_AgregarVentaDocumentos.Button1Click(Sender: TObject);
begin
  Venta.OK:= False;
  Fo_AgregarVentaDocumentos.Close;
end;

procedure TFo_AgregarVentaDocumentos.Button2Click(Sender: TObject);
begin
  Venta.OK:= True;
  Venta.IDPRODUCTO:= edtProducto.EditValue;
  Venta.DESCRIPCION:= edtDescripcionProducto.EditValue;
  Venta.PRECIO:= edtPrecio.EditValue;
  Venta.CANTIDAD:= edtCantidad.EditValue;
  Venta.IMPORTE:= edtImporte.EditValue;
  Venta.NUMTICKET:= edtNumTicket.EditValue;
  Venta.REFERENCIA:= edtReferenciaCliente.EditValue;
  Venta.IDCLIENTE:= edtCliente.EditValue;
  Venta.NOMBRECLIENTE:= edtNombreCliente.EditValue;

  Fo_AgregarVentaDocumentos.Close;
end;

procedure TFo_AgregarVentaDocumentos.edtCantidadPropertiesEditValueChanged(
  Sender: TObject);
begin
  edtimporte.EditValue:= edtPrecio.EditValue * edtCantidad.EditValue;
end;

procedure TFo_AgregarVentaDocumentos.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key=VK_F2 then
     ActionBuscar(nil, 1);

  if Key=VK_F3 then
     ActionBuscar(nil, 2);
end;

procedure TFo_AgregarVentaDocumentos.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key:=#0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;

end;

end.
