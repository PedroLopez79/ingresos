unit ufrmVales;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CustomModule, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxCurrencyEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxMaskEdit,
  cxCalendar, cxDBEdit, cxTextEdit, StdCtrls, cxGroupBox, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, DB,
  cxDBData, uDAInterfaces, uDADataTable, uDAScriptingProvider, uDACDSDataTable,
  dxmdaset, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid;

type
  TfrmVales = class(TfrmCustomModule)
    cxGroupBox2: TcxGroupBox;
    Label8: TLabel;
    Label10: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dbeCliente: TcxDBTextEdit;
    cxDBDateEdit2: TcxDBDateEdit;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBDateEdit1: TcxDBDateEdit;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    cxCurrencyEdit1: TcxCurrencyEdit;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    tblCuponesGrid: TdxMemData;
    tblCuponesGridCantidad: TIntegerField;
    tblCuponesGridDenominacion: TFloatField;
    tblCuponesGridReferencia: TStringField;
    tblCuponesGridTotal: TFloatField;
    dsCuponesGrid: TDataSource;
    cdsCliente: TDACDSDataTable;
    dsCliente: TDADataSource;
    cdsLoteCupon: TDACDSDataTable;
    cdsCupones: TDACDSDataTable;
    dsCupones: TDADataSource;
    dsLoteCupon: TDADataSource;
    cdsSaldoEjercicio: TDACDSDataTable;
    dsSaldoEjercicio: TDADataSource;
    dbgCupones: TcxGrid;
    dbgCuponesDBTableView1: TcxGridDBTableView;
    dbgCuponesDBTableView1Cantidad: TcxGridDBColumn;
    dbgCuponesDBTableView1Denominacion: TcxGridDBColumn;
    dbgCuponesDBTableView1Referencia: TcxGridDBColumn;
    dbgCuponesDBTableView1Total: TcxGridDBColumn;
    cxGridLevel5: TcxGridLevel;
    procedure cdsLoteCuponBeforePost(DataTable: TDADataTable);
    procedure cdsLoteCuponNewRecord(DataTable: TDADataTable);
    procedure cdsSaldoEjercicioNewRecord(DataTable: TDADataTable);
    procedure cxGridDBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure dbeClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbeClienteEnter(Sender: TObject);
    procedure dbeClienteExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tblCuponesGridBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    MiImpresora: String;
    procedure BuscarCliente;
    procedure ActionNuevo(Action: TBasicAction);
    procedure ActionGuardar(Action: TBasicAction);
    procedure ActionCancelar(Action: TBasicAction);
    procedure ActionBuscar(Action: TBasicAction);
    procedure ActionImprimir(Action: TBasicAction);
    procedure ActionFacturar(Action: TBasicAction);
  public
    { Public declarations }
    procedure UpdateActionsState; override;
  protected
    procedure RegisterActions; override;
  end;

var
  frmVales: TfrmVales;
  TotalCupon, Importe: Float;
  Serie, Folio:String;
  LOTE, MiFactura, ClienteID, EstacionID: Integer;

implementation
uses Modules, uDMFlotillas, dmActions, ufrmBuscarClienteCredito,
     UtileriasComun, LibraryFlotillas_Intf, ufrmBuscar,
     uDM;

{$R *.dfm}

{ TfrmVales }

procedure TfrmVales.ActionBuscar(Action: TBasicAction);
begin
  BuscarCliente;
end;

procedure TfrmVales.ActionCancelar(Action: TBasicAction);
begin
  cdsLoteCupon.Cancel;
  LOTE:= 0;
  cxCurrencyEdit1.Value:= 0;

  UpdateActionsState;
end;

procedure TfrmVales.ActionFacturar(Action: TBasicAction);
var
  Aux: TReporteF;
begin
  MiFactura:=DMFlotillas.Server.FacturaCupon(ClienteID,
                                       Importe,
                                       DM.NumeroEstacion,
                                       DM.Seguridad.idEmpleado,
                                       DM.SerieFacturaDebito);

  if MiFactura > 0 then
  begin
    Aux:=DMFlotillas.Server.BuscarReporte(DM.ReporteFacturaCreditoDebito);
    try
      DM.Parametros.Serie:= DM.SerieFacturaDebito;
      DMFlotillas.Parametros.FacturaIni:=MiFactura;
      DMFlotillas.Parametros.FacturaFin:=MiFactura;
      DMFlotillas.Imprimir(Aux.SQL1, Aux.SQL2, Aux.Template, 'IMPRIMIENDO...', Aux.CampoJoin);
     finally
      MiFactura:=0;
      Aux.Free;
    end;
  end;
end;

procedure TfrmVales.ActionGuardar(Action: TBasicAction);
var
  Cupones: AGeneraCupon;
begin
  if not (cdsLoteCupon.FieldByName('ClienteID').AsInteger > 0) then
  begin
    MessageDlg('Debe seleccionar un cliente.', mtError, [mbOK], 0);
    Exit;
  end;

  if Abs(Decimales(dbgCuponesDBTableView1.DataController.Summary.FooterSummaryValues[3], 2) - Decimales(cdsLoteCupon.FieldByName('Total').AsFloat, 2)) > 0.5 then
  begin
    MessageDlg('El importe del lote no coincide con el detalle de cupones.', mtError, [mbOK], 0);
    Exit;
  end;

  cdsSaldoEjercicio.Close;
  cdsSaldoEjercicio.ParamByName('ClienteIni').AsInteger:= strtoint(dbeCliente.Text);
  cdsSaldoEjercicio.ParamByName('ClienteFin').AsInteger:= strtoint(dbeCliente.Text);
  cdsSaldoEjercicio.Open;

  if not (cdsSaldoEjercicio.EOF) then
     if dbgCuponesDBTableView1.DataController.Summary.FooterSummaryValues[3] > cdsSaldoEjercicio.FieldByName('Saldo').AsCurrency then
     begin
        MessageDlg('Saldo Insuficiente', mtError, [mbOK], 0);
        Exit;
     end;

  cdsLoteCupon.Post;
  cdsLoteCupon.ApplyUpdates();
  cxGroupBox2.Enabled:=False;
  tblCuponesGrid.First;
  Cupones:=AGeneraCupon.Create;
  try
    while not tblCuponesGrid.Eof do
    begin
      with Cupones.Add do
      begin
        Cantidad:=tblCuponesGridCantidad.AsInteger;
        Denominacion:=tblCuponesGridDenominacion.AsFloat;
        Referencia:=tblCuponesGridReferencia.AsString;
      end;
      tblCuponesGrid.Next;
    end;
    ClienteID:= cdsLoteCupon.FieldByName('ClienteID').AsInteger;
    EstacionID:= cdsLoteCupon.FieldByName('EstacionID').AsInteger;
    Importe:= cdsLoteCupon.FieldByName('Total').AsInteger;
    
    LOTE:= cdsLoteCupon.FieldByName('LoteCuponID').AsInteger;
    DMFlotillas.Server.GeneraCupones(cdsLoteCupon.FieldByName('LoteCuponID').AsInteger,
                              cdsLoteCupon.FieldByName('ClienteID').AsInteger,
                              cdsLoteCupon.FieldByName('EstacionID').AsInteger,
                              DM.Identificador,
                              Cupones,
                              False,
                              '',
                              0);

  finally
    Cupones.Free;
    UpdateActionsState
  end;
  tblCuponesGrid.Close;
  tblCuponesGrid.Open;


 { cdsCupones.Close;
  cdsCupones.Open;

  tblCuponesGrid.First;
  while not tblCuponesGrid.Eof do
  begin
    for I := 1 to tblCuponesGridCantidad.AsInteger do
    begin
      cdsCupones.Append;
      DM.Servidor.Folio('CuponID', '');
      cdsCupones.FieldByName('CuponID').AsInteger:=DM.Servidor.Folio('CuponID', '');
      cdsCupones.FieldByName('Referencia').AsString:=tblCuponesGridReferencia.AsString;
      cdsCupones.FieldByName('Importe').AsCurrency:=tblCuponesGridDenominacion.AsCurrency;
      cdsCupones.FieldByName('FechaValido').AsDateTime:=cdsLoteCupon.FieldByName('FechaValido').AsDateTime;
      cdsCupones.FieldByName('Status').AsString:='A';
      cdsCupones.FieldByName('VolumenImporte').AsString:='I';
      S:='0005' + FormatFloat('0000', DM.Identificador) + FormatFloat('0000000', cdsCupones.FieldByName('CuponID').AsInteger);
      cdsCupones.FieldByName('Barras').AsString:=S + IntToStr(Modulo10(S));
      cdsCupones.FieldByName('ClienteID').AsInteger:=cdsLoteCupon.FieldByName('ClienteID').AsInteger;
      cdsCupones.FieldByName('EstacionID').AsInteger:=cdsLoteCupon.FieldByName('EstacionID').AsInteger;
      cdsCupones.FieldByName('LoteCuponID').AsInteger:=cdsLoteCupon.FieldByName('LoteCuponID').AsInteger;
      cdsCupones.Post;
    end;
    tblCuponesGrid.Next;
  end;

  cdsCupones.ApplyUpdates();

   tblCuponesGrid.Open;
   tblCuponesGrid.Append;
   tblCuponesGrid.First;
//  while not tblCuponesGrid.Eof do
//  begin
    for I := 1 to tblCuponesGrid.RecordCount do
    begin
      tblCuponesGrid.Delete;
      tblCuponesGrid.Next;
    end;

//  end; }
end;

procedure TfrmVales.ActionImprimir(Action: TBasicAction);
var
  Aux: TReporteF;
begin
  Aux:=DMFlotillas.Server.BuscarReporte('IMPRIMIR CUPONES');
  try
    DMFlotillas.Parametros.ClienteIni:=cdsLoteCupon.FieldByName('LoteCuponID').AsInteger;
    DMFlotillas.Parametros.Identificador:=DM.Identificador;
    DMFlotillas.Imprimir(Aux.SQL1, Aux.SQL2, Aux.Template, 'IMPRIMIENDO...', Aux.CampoJoin, True, MiImpresora);
  finally
    Aux.Free;
  end;
  cdsLoteCupon.Close;
  cdsLoteCupon.Open;
end;

procedure TfrmVales.ActionNuevo(Action: TBasicAction);
begin
  cdsLoteCupon.Append;
  tblCuponesGrid.Close;
  tblCuponesGrid.Open;

  cxCurrencyEdit1.Value:= 0;
  cxGroupBox2.Enabled:=True;

  ClienteID:= 0;
  EstacionID:= 0;
  Importe:= 0;
  MiFactura:= 0;
  LOTE:= 0;
end;

procedure TfrmVales.BuscarCliente;
var
  Datos: TDatosBusqueda;
begin
  Datos:= PantallaBusqueda(TfrmBuscarClienteCredito,'');
  if Datos.OK then
  begin
      cdsLoteCupon.FieldByName('ClienteID').AsInteger := Datos.Clave;
  end;
end;

procedure TfrmVales.cdsLoteCuponBeforePost(DataTable: TDADataTable);
begin
  inherited;
  if cdsLoteCupon.State = dsInsert then
  begin
    cdsLoteCupon.FieldByName('LoteCuponID').AsInteger:=DMFlotillas.Server.Folio('LoteCuponID', '');
    cdsLoteCupon.FieldByName('EstacionID').AsInteger:=DM.NumeroEstacion;
    cdsLoteCupon.FieldByName('UsuarioID').AsInteger:=DM.Seguridad.idEmpleado;
    cdsLoteCupon.FieldByName('Ejercicio').AsString:=FormatDateTime('yyyy', cdsLoteCupon.FieldByName('Fecha').AsDateTime);
    cdsLoteCupon.FieldByName('Periodo').AsString:=FormatDateTime('m', cdsLoteCupon.FieldByName('Fecha').AsDateTime);
    cdsLoteCupon.FieldByName('Dia').AsString:=FormatDateTime('d', cdsLoteCupon.FieldByName('Fecha').AsDateTime);
    cdsLoteCupon.FieldByName('Status').AsString:='A';
    cdsLoteCupon.FieldByName('FechaValido').AsDateTime:=cdsLoteCupon.FieldByName('Fecha').AsDateTime + 365;
  end;
end;

procedure TfrmVales.cdsLoteCuponNewRecord(DataTable: TDADataTable);
begin
  inherited;
  cdsLoteCupon.FieldByName('Fecha').AsDateTime:=Trunc(DM.Servidor.Fecha);
end;

procedure TfrmVales.cdsSaldoEjercicioNewRecord(DataTable: TDADataTable);
begin
  inherited;
  if cdsLoteCupon.State = dsInsert then
  begin
    cdsLoteCupon.FieldByName('LoteCuponID').AsInteger:=DMFlotillas.Server.Folio('LoteCuponID', '');
    cdsLoteCupon.FieldByName('EstacionID').AsInteger:=DM.NumeroEstacion;
    cdsLoteCupon.FieldByName('UsuarioID').AsInteger:=DM.Seguridad.idEmpleado;
    cdsLoteCupon.FieldByName('Ejercicio').AsString:=FormatDateTime('yyyy', cdsLoteCupon.FieldByName('Fecha').AsDateTime);
    cdsLoteCupon.FieldByName('Periodo').AsString:=FormatDateTime('m', cdsLoteCupon.FieldByName('Fecha').AsDateTime);
    cdsLoteCupon.FieldByName('Dia').AsString:=FormatDateTime('d', cdsLoteCupon.FieldByName('Fecha').AsDateTime);
    cdsLoteCupon.FieldByName('Status').AsString:='A';
    cdsLoteCupon.FieldByName('FechaValido').AsDateTime:=cdsLoteCupon.FieldByName('Fecha').AsDateTime + 365;
  end;
end;

procedure TfrmVales.cxGridDBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
   Sender.OptionsSelection.CellSelect:=AFocusedRecord = nil;
end;

procedure TfrmVales.dbeClienteEnter(Sender: TObject);
begin
  inherited;
  UpdateActionsState;
end;

procedure TfrmVales.dbeClienteExit(Sender: TObject);
begin
  inherited;
  if not  cdsCliente.Locate('ClienteID', cdsLoteCupon.FieldByName('ClienteID').AsInteger, []) then
  begin
     MessageDlg('Cliente no exite', mtError, [mbOK], 0);
  end else
  begin
    cdsSaldoEjercicio.Close;
    cdsSaldoEjercicio.ParamByName('ClienteIni').AsInteger:= strtoint(dbeCliente.Text);
    cdsSaldoEjercicio.ParamByName('ClienteFin').AsInteger:= strtoint(dbeCliente.Text);
    cdsSaldoEjercicio.Open;
    if not (cdsSaldoEjercicio.EOF) then
       cxCurrencyEdit1.Value:= cdsSaldoEjercicio.FieldByName('Saldo').AsCurrency;
  end;
  UpdateActionsState;
end;

procedure TfrmVales.dbeClienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F2 then
     BuscarCliente;
end;

procedure TfrmVales.FormCreate(Sender: TObject);
begin
  inherited;
  MiImpresora:=LeerRegistro('ImpresoraCupones', '');
  cdsLoteCupon.Open;
  tblCuponesGrid.Open;
  cdsCliente.Open;
end;

procedure TfrmVales.RegisterActions;
begin
  inherited RegisterActions;
  RegisterAction(AppActions.actNuevo, ActionNuevo);
  RegisterAction(AppActions.actGuardar, ActionGuardar);
  RegisterAction(AppActions.actCancelar, ActionCancelar);
  RegisterAction(AppActions.actBuscar, ActionBuscar);
  RegisterAction(AppActions.actImprimir, ActionImprimir);
  RegisterAction(AppActions.actFacturar, ActionFacturar);
end;

procedure TfrmVales.tblCuponesGridBeforePost(DataSet: TDataSet);
begin
  inherited;
  tblCuponesGridTotal.AsFloat:=tblCuponesGridCantidad.AsFloat * tblCuponesGridDenominacion.AsFloat;
end;

procedure TfrmVales.UpdateActionsState;
begin
  inherited;
  dmAppActions.actNuevo.Enabled:=cdsLoteCupon.State = dsBrowse;
  dmAppActions.actGuardar.Enabled:=not dmAppActions.actNuevo.Enabled;
  dmAppActions.actCancelar.Enabled:=not dmAppActions.actNuevo.Enabled;
  dmAppActions.actBuscar.Enabled:=(not dmAppActions.actNuevo.Enabled) and (dbeCliente.IsFocused);
  dmAppActions.actImprimir.Enabled:=(cdsLoteCupon.State = dsBrowse) and (cdsLoteCupon.RecordCount > 0);

  dmAppActions.actFacturar.Enabled:=(LOTE > 0);
end;

initialization
   ModuleInfoManager.RegisterModule('Vales', TfrmVales);

end.
