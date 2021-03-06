unit ufrmTipoComprobacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmCatalogo, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, dxmdaset, uDAInterfaces,
  uDADataTable, uDAScriptingProvider, uDAMemDataTable, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxPC, cxContainer, cxTextEdit, cxDBEdit, cxLabel, ExtCtrls, cxCheckBox,
  LibraryIngresos_Intf, uDARemoteDataAdapter, uDACDSDataTable, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint,
  cxPCdxBarPopupMenu, cxNavigator, uDADataAdapter, uDAFields, uROComponent;

type
  TfrmTipoComprobacion = class(TfrmCatalogo)
    dbgCatalogoDBTableView1RecID: TcxGridDBColumn;
    dbgCatalogoDBTableView1IDTIPOCOMPROBACION: TcxGridDBColumn;
    dbgCatalogoDBTableView1DESCRIPCION: TcxGridDBColumn;
    dbgCatalogoDBTableView1CUENTACONCENTRADORA: TcxGridDBColumn;
    dbgCatalogoDBTableView1CC: TcxGridDBColumn;
    Panel1: TPanel;
    Panel2: TPanel;
    LblNoProducto: TcxLabel;
    TxtNoProducto: TcxDBTextEdit;
    LblNombre: TcxLabel;
    TxtNombre: TcxDBTextEdit;
    cxLabel1: TcxLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    cxLabel2: TcxLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBCheckBox1: TcxDBCheckBox;
    cdsBuscaTiposFijos: TDACDSDataTable;
    rdaBuscaTiposFijos: TDARemoteDataAdapter;
    cxDBCheckBox3: TcxDBCheckBox;
    cxDBCheckBox2: TcxDBCheckBox;
    cxDBCheckBox4: TcxDBCheckBox;
    cxDBCheckBox5: TcxDBCheckBox;
    cxDBCheckBox6: TcxDBCheckBox;
    procedure cdsCatalogoNewRecord(DataTable: TDADataTable);
    procedure cdsCatalogoAfterEdit(DataTable: TDADataTable);
    procedure cxDBCheckBox1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cxDBCheckBox3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cxDBCheckBox2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cxDBCheckBox5MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cxDBCheckBox4MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cxDBCheckBox6MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    QueTipodeComprobacion: String;
  public
    { Public declarations }
  end;

var
  frmTipoComprobacion: TfrmTipoComprobacion;

implementation
uses uDM, Modules;

{$R *.dfm}

procedure TfrmTipoComprobacion.cdsCatalogoAfterEdit(DataTable: TDADataTable);
var
  P: LibraryIngresos_Intf.TParametrosBI;
  S: String;
begin
  inherited;
  if QuetipoDeComprobacion <> '' then
  begin
  P:= TParametrosBI.Create;
  Try
  cdsBuscaTiposFijos.Close;
  S:= 'SELECT COUNT(*) AS CONT FROM TIPOCOMPROBACION '+
      QuetipoDeComprobacion + '> 0 AND IDTIPOCOMPROBACION <> ' +
      cdsCatalogo.FieldByName('IDTIPOCOMPROBACION').AsString;
  rdaBuscaTiposFijos.GetDataCall.ParamByName('SQL').AsString:=S;
  rdaBuscaTiposFijos.GetDataCall.ParamByName('Parametros').AsComplexType:= P;
  cdsBuscaTiposFijos.Open;
  if cdsBuscaTiposFijos.FieldByName('CONT').AsInteger = 1 then
  begin
    if QuetipoDeComprobacion = 'WHERE ESCREDITODEBITOYCUPON' then
       showmessage('El tipo de comprobacion para Creditos, Debitos y Cupones ya fue definido');
    if QuetipoDeComprobacion = 'WHERE ESPRODUCTO' then
       showmessage('El tipo de comprobacion para Productos ya fue definido');
    if QuetipoDeComprobacion = 'WHERE ESCOMBUSTIBLE' then
       showmessage('El tipo de comprobacion para Combustible ya fue definido');
    if QuetipoDeComprobacion = 'WHERE ESSALIDAEFECTIVO' then
       showmessage('El tipo de comprobacion para Salidas de Efectivo ya fue definido');
    if QuetipoDeComprobacion = 'WHERE ESEFECTIVO' then
       showmessage('El tipo de comprobacion para Efectivo ya fue definido');
    if QuetipoDeComprobacion = 'WHERE ESCLIENTE' then
       showmessage('El tipo de comprobacion para Efectivo ya fue definido');
    ActionCancelar(nil);
  end;
  Finally
    P.Free;
    QuetipoDeComprobacion:='';
  End;
  end;
end;

procedure TfrmTipoComprobacion.cdsCatalogoNewRecord(DataTable: TDADataTable);
begin
  inherited;
  cdsCatalogo.FieldByName('IDTIPOCOMPROBACION').AsInteger:= DM.Servidor.Folio('IDTIPOCOMPROBACION','');
end;

procedure TfrmTipoComprobacion.cxDBCheckBox1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  QueTipodeComprobacion:= 'WHERE ESCREDITODEBITOYCUPON';
end;

procedure TfrmTipoComprobacion.cxDBCheckBox2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  QueTipodeComprobacion:= 'WHERE ESCOMBUSTIBLE';
end;

procedure TfrmTipoComprobacion.cxDBCheckBox3MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  QueTipodeComprobacion:= 'WHERE ESPRODUCTO';
end;

procedure TfrmTipoComprobacion.cxDBCheckBox4MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  QueTipodeComprobacion:= 'WHERE ESEFECTIVO';
end;

procedure TfrmTipoComprobacion.cxDBCheckBox5MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  QueTipodeComprobacion:= 'WHERE ESSALIDAEFECTIVO';
end;

procedure TfrmTipoComprobacion.cxDBCheckBox6MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  QueTipodeComprobacion:= 'WHERE ESCLIENTE';
end;

initialization
  ModuleInfoManager.RegisterModule('TipoComprobacion', TfrmTipoComprobacion);

end.
