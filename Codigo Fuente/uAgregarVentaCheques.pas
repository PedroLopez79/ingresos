unit uAgregarVentaCheques;

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
  TVentaCheques = record
    OK            : boolean;
    CANTIDAD      : Integer;
    IMPORTE       : Float;
    IDCLIENTE     : Integer;
    NOMBRECLIENTE : string[100];
    REFERENCIA    : string[100];
    IDBANCO       : Integer;
    NOMBREBANCO   : string[100];
  end;

  TFo_AgregarVentaCheques = class(TdxCustomRibbonForm)
    Panel1: TPanel;
    Pa_ayuda: TPanel;
    Button2: TButton;
    dxRibbon1: TdxRibbon;
    dxRibbon1Tab1: TdxRibbonTab;
    Button1: TButton;
    Label11: TLabel;
    edtImporte: TcxCurrencyEdit;
    edtCliente: TcxCurrencyEdit;
    btnBuscarClienteCredito: TcxButton;
    edtNombreCliente: TcxCurrencyEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cbBanco: TcxLookupComboBox;
    Label4: TLabel;
    cdsBanco: TDACDSDataTable;
    dsBanco: TDADataSource;
    edtReferenciaCliente: TcxTextEdit;
    procedure Button2Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure btnBuscarClienteCreditoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure ActionBuscar(Action: TBasicAction; Tipo: Integer);
  public
    { Public declarations }
  end;

var
  Fo_AgregarVentaCheques: TFo_AgregarVentaCheques;
  Venta: TVentaCheques;

function Abrir_ModuloAgregarVentaCheques(Estacion: Integer):TVentaCheques;

implementation
uses  uDM, ufrmBuscar, ufrmBuscarProducto, ufrmBuscarClienteEfectivo;

{$R *.dfm}

function Abrir_ModuloAgregarVentaCheques(Estacion: Integer):TVentaCheques;
Begin
  Fo_AgregarVentaCheques:=TFo_AgregarVentaCheques.Create(Application);

  Fo_AgregarVentaCheques.ShowModal;

  Result:= Venta;
  Fo_AgregarVentaCheques.Free;
End;

procedure TFo_AgregarVentaCheques.ActionBuscar(Action: TBasicAction; Tipo: Integer);
var
  Datos: TDatosBusqueda;
begin
  if Tipo = 2 then
  begin
    Datos:= PantallaBusqueda(TfrmBuscarClienteEfectivo,'');
    if Datos.OK then
    begin
       edtCliente.EditValue:= Datos.Clave;
       edtNombreCliente.EditValue:= Datos.Nombre;
    end;
  end;
end;

procedure TFo_AgregarVentaCheques.btnBuscarClienteCreditoClick(
  Sender: TObject);
begin
  ActionBuscar(nil, 2);
end;

procedure TFo_AgregarVentaCheques.Button1Click(Sender: TObject);
begin
  Venta.OK:= False;
  Fo_AgregarVentaCheques.Close;
end;

procedure TFo_AgregarVentaCheques.Button2Click(Sender: TObject);
begin
  Venta.OK:= True;
  Venta.CANTIDAD:= edtImporte.EditValue;
  Venta.IMPORTE:= edtImporte.EditValue;
  Venta.REFERENCIA:= edtReferenciaCliente.EditValue;
  Venta.IDCLIENTE:= edtCliente.EditValue;
  Venta.NOMBRECLIENTE:= edtNombreCliente.EditValue;
  Venta.IDBANCO:= cbBanco.EditValue;
  Venta.NOMBREBANCO:= cbBanco.Text;

  Fo_AgregarVentaCheques.Close;
end;

procedure TFo_AgregarVentaCheques.FormCreate(Sender: TObject);
begin
  cdsBanco.Close;
  cdsBanco.Open;
end;

procedure TFo_AgregarVentaCheques.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key=VK_F2 then
     ActionBuscar(nil, 2);
end;

procedure TFo_AgregarVentaCheques.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key:=#0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;

end;

end.
