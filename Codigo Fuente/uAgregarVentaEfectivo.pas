unit uAgregarVentaEfectivo;

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
  cxCurrencyEdit, dxRibbonForm, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, Data.DB, uDAFields;

type
  // Declare a Venta record
  TVentaEfectivo = record
    OK                  : Boolean;
    IDTIPOCOMPROBACION  : Integer;
    DESCRIPCION         : string[100];
    CANTIDAD    : Float;
    IMPORTE     : Float;
  end;

  TFo_AgregarVentaEfectivo = class(TdxCustomRibbonForm)
    Panel1: TPanel;
    Pa_ayuda: TPanel;
    Button2: TButton;
    dxRibbon1: TdxRibbon;
    dxRibbon1Tab1: TdxRibbonTab;
    Button1: TButton;
    Label7: TLabel;
    Label10: TLabel;
    edtCantidad: TcxCurrencyEdit;
    Label11: TLabel;
    edtImporte: TcxCurrencyEdit;
    cbDescripcionTipoComprobacion: TcxLookupComboBox;
    dsTipoValor: TDADataSource;
    cdsTipoComprobacion: TDACDSDataTable;
    procedure Button2Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure edtCantidadPropertiesEditValueChanged(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fo_AgregarVentaEfectivo: TFo_AgregarVentaEfectivo;
  Venta: TVentaEfectivo;

function Abrir_ModuloAgregarVentaEfectivo(Estacion: Integer):TVentaEfectivo;

implementation
uses  uDM, ufrmBuscar, ufrmBuscarProducto;

{$R *.dfm}

function Abrir_ModuloAgregarVentaEfectivo(Estacion: Integer):TVentaEfectivo;
Begin
  Fo_AgregarVentaEfectivo:=TFo_AgregarVentaEfectivo.Create(Application);

  Fo_AgregarVentaEfectivo.ShowModal;

  Result:= Venta;
  Fo_AgregarVentaEfectivo.Free;
End;

procedure TFo_AgregarVentaEfectivo.Button1Click(Sender: TObject);
begin
  Venta.OK:= False;
  Fo_AgregarVentaEfectivo.Close;
end;

procedure TFo_AgregarVentaEfectivo.Button2Click(Sender: TObject);
begin
  Venta.OK:= True;
  Venta.IDTIPOCOMPROBACION:= cbDescripcionTipoComprobacion.EditValue;
  Venta.DESCRIPCION:= cbDescripcionTipoComprobacion.Text;
  Venta.CANTIDAD:= edtCantidad.EditValue;
  Venta.IMPORTE:= edtImporte.EditValue;

  Fo_AgregarVentaEfectivo.Close;
end;

procedure TFo_AgregarVentaEfectivo.edtCantidadPropertiesEditValueChanged(
  Sender: TObject);
begin
  edtimporte.EditValue:= edtCantidad.EditValue;
end;

procedure TFo_AgregarVentaEfectivo.FormCreate(Sender: TObject);
begin
  cdsTipoComprobacion.Close;
  cdsTipoComprobacion.Filtered:= False;
  cdsTipoComprobacion.Filter:= 'IDTIPOCOMPROBACION IN (6,7)';
  cdsTipoComprobacion.Filtered:= True;
  cdsTipoComprobacion.Open;
end;

procedure TFo_AgregarVentaEfectivo.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key:=#0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

end.
