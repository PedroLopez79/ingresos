unit ufrmClienteCredito;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CustomModule, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, cxContainer, dxmdaset,
  uDAInterfaces, uDADataTable, uDAScriptingProvider, uDAMemDataTable,
  cxDropDownEdit, cxCalendar, cxDBEdit, cxImageComboBox, cxMaskEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxTextEdit, StdCtrls,
  cxGroupBox, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, cxPC, dmActions,
  Menus, cxButtons, ExtCtrls, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint, cxPCdxBarPopupMenu,
  cxNavigator, uDAFields, uROComponent;

type
  TfrmClienteCredito = class(TfrmCustomModule)
    pgcCatalogo: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    dbgCatalogo: TcxGrid;
    dbgCatalogoDBTableView1: TcxGridDBTableView;
    dbgCatalogoDBTableView1RecID: TcxGridDBColumn;
    dbgCatalogoDBTableView1ClienteID: TcxGridDBColumn;
    dbgCatalogoDBTableView1Nombre: TcxGridDBColumn;
    dbgCatalogoDBTableView1RazonSocial: TcxGridDBColumn;
    dbgCatalogoDBTableView1Domicilio: TcxGridDBColumn;
    dbgCatalogoDBTableView1Grupo: TcxGridDBColumn;
    dbgCatalogoDBTableView1Colonia: TcxGridDBColumn;
    dbgCatalogoDBTableView1CodigoPostal: TcxGridDBColumn;
    dbgCatalogoDBTableView1Ciudad: TcxGridDBColumn;
    dbgCatalogoDBTableView1Telefono: TcxGridDBColumn;
    dbgCatalogoDBTableView1RFC: TcxGridDBColumn;
    dbgCatalogoDBTableView1CuentaContable: TcxGridDBColumn;
    dbgCatalogoDBTableView1PlazoPago: TcxGridDBColumn;
    dbgCatalogoDBTableView1Estatus: TcxGridDBColumn;
    dbgCatalogoDBTableView1FechaIngreso: TcxGridDBColumn;
    dbgCatalogoDBTableView1NIP: TcxGridDBColumn;
    dbgCatalogoDBTableView1FechaBaja: TcxGridDBColumn;
    dbgCatalogoDBTableView1LimiteCredito: TcxGridDBColumn;
    dbgCatalogoDBTableView1Deposito: TcxGridDBColumn;
    dbgCatalogoDBTableView1CambioCredito: TcxGridDBColumn;
    dbgCatalogoDBTableView1CambioCreditoAnterior: TcxGridDBColumn;
    dbgCatalogoDBTableView1UltimoPago: TcxGridDBColumn;
    dbgCatalogoDBTableView1DiaCorteSemana: TcxGridDBColumn;
    dbgCatalogoDBTableView1ClienteNuevo: TcxGridDBColumn;
    dbgCatalogoDBTableView1Tasa: TcxGridDBColumn;
    dbgCatalogoDBTableView1TarjetaID: TcxGridDBColumn;
    dbgCatalogoDBTableView1FormaPagoID: TcxGridDBColumn;
    dbgCatalogoDBTableView1GrupoFacturarID: TcxGridDBColumn;
    dbgCatalogoDBTableView1VendedorID: TcxGridDBColumn;
    dbgCatalogoDBTableView1GasolineroID: TcxGridDBColumn;
    dbgCatalogoDBTableView1FormaCompraID: TcxGridDBColumn;
    dbgCatalogoDBTableView1ClasificacionID: TcxGridDBColumn;
    dbgCatalogoDBTableView1FacturaConsumoCupon: TcxGridDBColumn;
    dbgCatalogoDBTableView1NoExterior: TcxGridDBColumn;
    dbgCatalogoDBTableView1Localidad: TcxGridDBColumn;
    dbgCatalogoDBTableView1Municipio: TcxGridDBColumn;
    dbgCatalogoDBTableView1Estado: TcxGridDBColumn;
    dbgCatalogoDBTableView1Pais: TcxGridDBColumn;
    dbgCatalogoDBTableView1email: TcxGridDBColumn;
    dbgCatalogoDBTableView1FechaAniversario: TcxGridDBColumn;
    dbgCatalogoLevel1: TcxGridLevel;
    cxTabSheet2: TcxTabSheet;
    cxGroupBox2: TcxGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label54: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label72: TLabel;
    Label75: TLabel;
    Label73: TLabel;
    Label74: TLabel;
    Label76: TLabel;
    TXTCLIENTE: TcxDBTextEdit;
    TXTRAZON: TcxDBTextEdit;
    TXTNOMBRE: TcxDBTextEdit;
    TXTGRUPO: TcxDBTextEdit;
    TXTDOMICILIO: TcxDBTextEdit;
    TXTCOLONIA: TcxDBTextEdit;
    TXTCIUDAD: TcxDBTextEdit;
    TXTCP: TcxDBTextEdit;
    TXTCUENTACONTABLE: TcxDBTextEdit;
    TXTRFC: TcxDBTextEdit;
    TXTTELEFONO: TcxDBTextEdit;
    LOOKUPCMFORMACOMPRA: TcxDBLookupComboBox;
    LOOKUPCMDIAFACTURAR: TcxDBLookupComboBox;
    LOOKUPCMAGENTEVENTA: TcxDBLookupComboBox;
    cxDBImageComboBox1: TcxDBImageComboBox;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    cxDBTextEdit11: TcxDBTextEdit;
    cxDBTextEdit12: TcxDBTextEdit;
    cxDBTextEdit13: TcxDBTextEdit;
    cxDBTextEdit16: TcxDBTextEdit;
    cxDBTextEdit14: TcxDBTextEdit;
    cxDBTextEdit15: TcxDBTextEdit;
    cxDBDateEdit1: TcxDBDateEdit;
    cxTabSheet3: TcxTabSheet;
    cxGroupBox3: TcxGroupBox;
    Label34: TLabel;
    Label42: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label55: TLabel;
    cxDBTextEdit19: TcxDBTextEdit;
    cxDBTextEdit21: TcxDBTextEdit;
    dbeLimiteCredito: TcxDBTextEdit;
    cxDBTextEdit29: TcxDBTextEdit;
    DateUltimoPago: TcxDBDateEdit;
    DateFechaIngreso: TcxDBDateEdit;
    DateFechaBaja: TcxDBDateEdit;
    DateUltimoCambio: TcxDBDateEdit;
    DateCambioanterior: TcxDBDateEdit;
    LOOKUPCMFORMAPAGO: TcxDBLookupComboBox;
    cxDBImageComboBox2: TcxDBImageComboBox;
    cxDBImageComboBox3: TcxDBImageComboBox;
    cdsCatalogo: TDAMemDataTable;
    dsCatalogo: TDADataSource;
    cxButton2: TcxButton;
    Panel1: TPanel;
    Panel2: TPanel;
    cdsFormaCompra: TDAMemDataTable;
    dsFormaCompra: TDADataSource;
    cxDBTextEdit22: TcxDBTextEdit;
    Label77: TLabel;
    Label1: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    procedure FormShow(Sender: TObject);
    procedure dbgCatalogoDBTableView1DblClick(Sender: TObject);
    procedure dbgCatalogoDBTableView1KeyPress(Sender: TObject; var Key: Char);
    procedure dsCatalogoStateChange(Sender: TObject);
    procedure cdsCatalogoAfterDelete(DataTable: TDADataTable);
    procedure cdsCatalogoAfterPost(DataTable: TDADataTable);
    procedure cdsCatalogoNewRecord(DataTable: TDADataTable);
    procedure cxButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TXTRFCExit(Sender: TObject);
 private
    { Private declarations }
    procedure ActionNuevo(Action: TBasicAction);
    procedure ActionPrimer(Action: TBasicAction);
    procedure ActionSiguiente(Action: TBasicAction);
    procedure ActionAnterior(Action: TBasicAction);
    procedure ActionUltimo(Action: TBasicAction);
    procedure ActionBuscar(Action: TBasicAction);
  protected
    procedure RegisterActions; override;
  public
    { Public declarations }
    Campo: String;
    Actualiza : Boolean;
    procedure ActionActualizar(Action: TBasicAction); virtual;
    procedure ActionGuardar(Action: TBasicAction); virtual;
    procedure ActionImprimir(Action: TBasicAction); virtual;
    procedure ActionCancelar(Action: TBasicAction); virtual;
    procedure UpdateActionsState; override;
  end;

var
  frmClienteCredito: TfrmClienteCredito;

implementation
uses uDMFlotillas, Modules, UtileriasComun, uRFC, uDM;

{$R *.dfm}
procedure TfrmClienteCredito.ActionActualizar(Action: TBasicAction);
begin
  Actualiza:=False;
  cdsCatalogo.Close;
  cdsCatalogo.Open;
  Actualiza:=True;
end;

procedure TfrmClienteCredito.ActionAnterior(Action: TBasicAction);
begin
 dbgCatalogoDBTableView1.DataController.GotoPrev;
end;

procedure TfrmClienteCredito.ActionBuscar(Action: TBasicAction);
begin
  pgcCatalogo.ActivePageIndex:=0;
  dbgCatalogo.SetFocus;
end;

procedure TfrmClienteCredito.ActionCancelar(Action: TBasicAction);
begin
  cdsCatalogo.Cancel;
end;

procedure TfrmClienteCredito.ActionGuardar(Action: TBasicAction);
begin
  cdsCatalogo.Post;
end;

procedure TfrmClienteCredito.ActionImprimir(Action: TBasicAction);
begin

end;

procedure TfrmClienteCredito.ActionNuevo(Action: TBasicAction);
begin
  pgcCatalogo.ActivePageIndex:=1;
  cdsCatalogo.Append;
end;

procedure TfrmClienteCredito.ActionPrimer(Action: TBasicAction);
begin
  dbgCatalogoDBTableView1.DataController.GotoFirst;
end;

procedure TfrmClienteCredito.ActionSiguiente(Action: TBasicAction);
begin
  dbgCatalogoDBTableView1.DataController.GotoNext;
end;

procedure TfrmClienteCredito.ActionUltimo(Action: TBasicAction);
begin
  dbgCatalogoDBTableView1.DataController.GotoLast;
end;

procedure TfrmClienteCredito.cdsCatalogoAfterDelete(DataTable: TDADataTable);
begin
  inherited;
  cdsCatalogo.ApplyUpdates();
end;

procedure TfrmClienteCredito.cdsCatalogoAfterPost(DataTable: TDADataTable);
begin
  inherited;
  cdsCatalogo.ApplyUpdates();
end;

procedure TfrmClienteCredito.cdsCatalogoNewRecord(DataTable: TDADataTable);
begin
  inherited;
   cdsCatalogo.FieldbyName('Estatus').asBoolean:=True;
   cdsCatalogo.FieldbyName('ClienteNuevo').asBoolean:=True;
   cdsCatalogo.FieldbyName('DiaCorteSemana').asInteger:=1;
   cdsCatalogo.FieldByName('TarjetaID').AsInteger:=1;
   cdsCatalogo.FieldByName('GasolineroID').AsInteger:=DMFlotillas.Server.GasolineroID;
   cdsCatalogo.FieldByName('ClienteID').AsInteger:=DMFlotillas.Server.Folio('IDCLIENTE','');
   cdsCatalogo.FieldByName('TarjetaID').AsInteger:=1;
   cdsCatalogo.FieldByName('RazonSocial').AsString:='';
   cdsCatalogo.FieldByName('Nombre').AsString:='';
   cdsCatalogo.FieldByName('Grupo').AsString:='';
   cdsCatalogo.FieldByName('Domicilio').AsString:='';
   cdsCatalogo.FieldByName('Colonia').AsString:='';
   cdsCatalogo.FieldByName('Ciudad').AsString:='';
   cdsCatalogo.FieldByName('Telefono').AsString:='';
   cdsCatalogo.FieldByName('RFC').AsString:='';
   cdsCatalogo.FieldByName('Cuentacontable').AsString:='';
   cdsCatalogo.FieldByName('GrupoFacturarID').AsInteger:=1;
   cdsCatalogo.FieldByName('VendedorID').AsInteger:=1;
   cdsCatalogo.FieldByName('FormaCompraID').AsInteger:=1;
   DMFlotillas.FormaCompra:=cdsCatalogo.FieldByName('FormaCompraID').AsInteger;
   cdsCatalogo.FieldByName('Estatus').AsString:='A';
   cdsCatalogo.FieldByName('NIP').AsInteger:=StrToInt(GeneraNIP(4));
   cdsCatalogo.FieldByName('PlazoPago').AsInteger:=15;
   cdsCatalogo.FieldByName('LimiteCredito').AsInteger:=0;
   cdsCatalogo.FieldByName('Deposito').AsInteger:=0;
   cdsCatalogo.FieldByName('FormaPagoID').AsInteger:=1;

   cdsCatalogo.FieldByName('FechaIngreso').AsDateTime:=Trunc(Now);
   cdsCatalogo.FieldByName('FechaBaja').AsDateTime:=Trunc(Now);
   cdsCatalogo.FieldByName('CambioCredito').AsDateTime:=Trunc(Now);
   cdsCatalogo.FieldByName('CambioCreditoAnterior').AsDateTime:=Trunc(Now);
   cdsCatalogo.FieldByName('UltimoPago').AsDateTime:=Trunc(Now);
   txtRazon.SetFocus;
end;

procedure TfrmClienteCredito.cxButton2Click(Sender: TObject);
begin
  inherited;
  cdsCatalogo.Edit;
  cdsCatalogo.FieldByName('RFC').AsString:=  Abrir_ModuloAyudaRFC('','','','M',Now());
end;

procedure TfrmClienteCredito.dbgCatalogoDBTableView1DblClick(Sender: TObject);
begin
  inherited;
  pgcCatalogo.ActivePageIndex:=1;
end;

procedure TfrmClienteCredito.dbgCatalogoDBTableView1KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if key = #13 then
  dbgCatalogoDBTableView1DblClick(Nil);
end;

procedure TfrmClienteCredito.dsCatalogoStateChange(Sender: TObject);
begin
  inherited;
  UpdateActionsState;
end;

procedure TfrmClienteCredito.FormCreate(Sender: TObject);
begin
  inherited;
  uDMFlotillas.DMFlotillas.ConectaServer(DM.NumeroEstacion);
  cdsFormaCompra.Open;
end;

procedure TfrmClienteCredito.FormShow(Sender: TObject);
begin
  inherited;
  TRY
    cdsCatalogo.Close;
    cdsCatalogo.Open;
  EXCEPT on E : Exception do
    begin
     showmessage('No fue posible establecer coneccion con el Servidor de Creditos -'+E.Message);
    end;
  END;
end;

procedure TfrmClienteCredito.RegisterActions;
begin
  inherited RegisterActions;
  RegisterAction(AppActions.actNuevo, ActionNuevo);
  RegisterAction(AppActions.actGuardar, ActionGuardar);
  RegisterAction(AppActions.actCancelar, ActionCancelar);
  RegisterAction(AppActions.actActualizar, ActionActualizar);
  RegisterAction(AppActions.actImprimir, ActionImprimir);

  RegisterAction(AppActions.actPrimer, ActionPrimer);
  RegisterAction(AppActions.actSiguiente, ActionSiguiente);
  RegisterAction(AppActions.actAnterior, ActionAnterior);
  RegisterAction(AppActions.actUltimo, ActionUltimo);
  RegisterAction(AppActions.actBuscar, ActionBuscar);
end;

procedure TfrmClienteCredito.TXTRFCExit(Sender: TObject);
var S:String;
begin
  inherited;
  S:= TXTRFC.EditValue;
  while ansipos('_',S) > 0 do
        delete(S,AnsiPos('_',S),1);

  while ansipos('-',S) > 0 do
        delete(S,AnsiPos('-',S),1);

  while ansipos(' ',S) > 0 do
        delete(S,AnsiPos(' ',S),1);
  if Length(S) > 14 then
  begin
    showmessage('La logitud del RFC es demasiado grande');
    S:='';
  end;

  TXTRFC.EditValue:= S;
end;

procedure TfrmClienteCredito.UpdateActionsState;
begin
  inherited UpdateActionsState;
  AppActions.actNuevo.Enabled:=cdsCatalogo.State = dsBrowse;
  AppActions.actGuardar.Enabled:=cdsCatalogo.State in dsEditModes;
  AppActions.actCancelar.Enabled:=cdsCatalogo.State in dsEditModes;
  AppActions.actActualizar.Enabled:=cdsCatalogo.State = dsBrowse;
  AppActions.actPrimer.Enabled:=cdsCatalogo.State = dsBrowse;
  AppActions.actSiguiente.Enabled:=cdsCatalogo.State = dsBrowse;
  AppActions.actAnterior.Enabled:=cdsCatalogo.State = dsBrowse;
  AppActions.actUltimo.Enabled:=cdsCatalogo.State = dsBrowse;
  AppActions.actImprimir.Enabled:=cdsCatalogo.State = dsBrowse;
  AppActions.actBuscar.Enabled:=cdsCatalogo.State = dsBrowse;
  Closing:=cdsCatalogo.State = dsBrowse;
end;

initialization
   ModuleInfoManager.RegisterModule('ClienteCredito', TfrmClienteCredito);

end.
