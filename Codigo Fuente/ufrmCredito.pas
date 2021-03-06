unit ufrmCredito;

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
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxDBEdit, cxMaskEdit,
  cxCalendar, cxGroupBox, cxCurrencyEdit, StdCtrls, cxTextEdit, ExtCtrls,
  Menus, cxButtons, uDAScriptingProvider, uDADataTable,
  uDACDSDataTable, DB, uDAInterfaces, LibraryFlotillas_Intf, dxmdaset, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxCheckBox, cxImageComboBox,
  uROClient;

type
  TfrmCredito = class(TfrmCustomModule)
    cxGroupBox2: TcxGroupBox;
    cxGroupBox4: TcxGroupBox;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    dtpFecha: TcxDBDateEdit;
    cxDBDateEdit3: TcxDBDateEdit;
    dbeCheque: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    cxGroupBox1: TcxGroupBox;
    cxGroupBox5: TcxGroupBox;
    dsBancos: TDADataSource;
    cdsBancos: TDACDSDataTable;
    cdsTipoMovimiento: TDACDSDataTable;
    dsTipoMovimiento: TDADataSource;
    dsMovimientos: TDADataSource;
    dsReciboFactura: TDADataSource;
    cdsMovimientos: TDACDSDataTable;
    cdsReciboFactura: TDACDSDataTable;
    dsRecibo: TDADataSource;
    dsCliente: TDADataSource;
    cdsCliente: TDACDSDataTable;
    cdsRecibo: TDACDSDataTable;
    tblFacturas: TdxMemData;
    tblFacturasImporte: TFloatField;
    tblFacturasMovimientoID: TIntegerField;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGroupBox3: TcxGroupBox;
    dsFacturas: TDataSource;
    tblFacturasIncluir: TBooleanField;
    cxGrid1DBTableView1RecId: TcxGridDBColumn;
    cxGrid1DBTableView1Incluir: TcxGridDBColumn;
    cxGrid1DBTableView1Referencia: TcxGridDBColumn;
    cxGrid1DBTableView1Importe: TcxGridDBColumn;
    cxGrid1DBTableView1MovimientoID: TcxGridDBColumn;
    tblFacturasReferencia: TStringField;
    Label13: TLabel;
    edtNombre: TcxTextEdit;
    edtCliente: TcxCurrencyEdit;
    Label2: TLabel;
    tblFacturasVencimiento: TDateTimeField;
    dbgFacturas: TcxGrid;
    dbtvFacturas: TcxGridDBTableView;
    dbtvFacturasColumn1: TcxGridDBColumn;
    dbtvFacturasColumn2: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxButton1: TcxButton;
    Label1: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    procedure edtClienteExit(Sender: TObject);
    procedure cdsReciboNewRecord(DataTable: TDADataTable);
    procedure cdsReciboBeforePost(DataTable: TDADataTable);
    procedure cdsReciboAfterPost(DataTable: TDADataTable);
    procedure edtClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtClienteEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cdsReciboFacturaNewRecord(DataTable: TDADataTable);
    procedure dbtvFacturasEditValueChanged(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem);
  private
    { Private declarations }
    Documentos: TDocumentosConSaldoArray;
    procedure BuscarCliente;
    function  ValidaReciboFacturas : Boolean;
    function  DocumentosConSaldo(MovimientoID: Integer): TDocumentosConSaldo;
    procedure ActionNuevo(Action: TBasicAction);
    procedure ActionGuardar(Action: TBasicAction);
    procedure ActionCancelar(Action: TBasicAction);
    procedure ActionBuscar(Action: TBasicAction);
    procedure ActionImprimir(Action: TBasicAction);
  public
    { Public declarations }
    procedure UpdateActionsState; override;
  protected
    procedure RegisterActions; override;
  end;

var
  frmCredito: TfrmCredito;
  ImprimeRec : Integer;

implementation
uses Modules, uDMFlotillas, dmActions, ufrmBuscarClienteCredito, ufrmBuscar, uDM;

{$R *.dfm}

procedure TfrmCredito.ActionBuscar(Action: TBasicAction);
begin

end;

procedure TfrmCredito.ActionCancelar(Action: TBasicAction);
begin
  if cdsRecibo.State in dsEditModes then
  begin
    //edtFolio.Text:='0';
    edtCliente.Text:='0';
    edtNombre.Text:= '';
    cdsRecibo.Cancel;

    cdsRecibo.Close;
    cdsRecibo.Open;

    cdsReciboFactura.Close;
    cdsReciboFactura.Open;

    tblFacturas.Close;
  end;
end;

procedure TfrmCredito.ActionGuardar(Action: TBasicAction);
begin
  dbeCheque.SetFocus;
  if not ValidaReciboFacturas then
     Exit;

  try
    Screen.Cursor:=crHourGlass;
    if (not DM.FechaValida(cdsRecibo.FieldByName('FechaMovimiento').AsDateTime)) then
    begin
      {if not DM.PermiteFechaRecibos then
      begin
        dtpFecha.SetFocus;
        MessageDlg('Fecha fuera de Ejercicio/Periodo.', mtError, [mbOK], 0);
        Exit;
      end;}
    end;
    if cdsRecibo.State in dsEditModes then
    begin
      cdsRecibo.FieldByName('Ejercicio').AsString:=FormatDateTime('yyyy', cdsRecibo.FieldByName('FechaMovimiento').AsDateTime);
      cdsRecibo.FieldByName('Periodo').AsString:=FormatDateTime('m', cdsRecibo.FieldByName('FechaMovimiento').AsDateTime);
      cdsRecibo.FieldByName('UsuarioID').AsInteger:=DM.Seguridad.idEmpleado;
      cdsRecibo.FieldByName('MovimientoID').AsInteger:=DMFlotillas.Server.Folio('MovimientoID', '');
      cdsRecibo.FieldByName('FechaCaptura').AsDateTime:=Now;
      cdsRecibo.Post;

      cdsReciboFactura.First;
      while not cdsReciboFactura.EOF do
      begin
        cdsReciboFactura.Edit;
        cdsReciboFactura.FieldByName('Fecha').AsDateTime:=cdsRecibo.FieldByName('FechaMovimiento').AsDateTime;
        cdsReciboFactura.FieldByName('ReciboID').AsInteger:=cdsRecibo.FieldByName('ReciboID').AsInteger;
        cdsReciboFactura.FieldByName('BancoID').AsInteger:=cdsRecibo.FieldByName('BancoID').AsInteger;
        ImprimeRec:= cdsRecibo.FieldByName('ReciboID').AsInteger;
        cdsReciboFactura.Post;
        cdsReciboFactura.Next
      end;    // while}

      cdsReciboFactura.ApplyUpdates();
      if Documentos <> nil then
        FreeAndNil(Documentos);
    end;
  finally
    Screen.Cursor:=crDefault;
    cdsRecibo.Close;
    cdsRecibo.Open;
    cdsReciboFactura.Close;
    cdsReciboFactura.Open;

    edtCliente.Value:=0;
  end;
end;

procedure TfrmCredito.ActionImprimir(Action: TBasicAction);
begin

end;

procedure TfrmCredito.ActionNuevo(Action: TBasicAction);
begin
    cdsRecibo.Append;
    cdsRecibo.FieldByName('FechaMovimiento').AsDateTime:=Trunc(DMFlotillas.Server.Fecha);

    cdsBancos.Close;
    cdsBancos.Open;

    cdsTipoMovimiento.Close;
    cdsTipoMovimiento.Open;

    cdsReciboFactura.Close;
    cdsReciboFactura.Open;

    UpdateActionsState;
    //gbCliente.Enabled:=True;
    edtCliente.Enabled:=True;
    edtCliente.SetFocus;
end;

procedure TfrmCredito.BuscarCliente;
var
   Datos : TDatosBusqueda;
begin
   Datos:= PantallaBusqueda(TfrmBuscarClienteCredito,'1,2,3');
   if Datos.OK then
   begin
     if Datos.Estatus <> 'A' then
     begin
        MessageDlg('Cliente no esta Activo', mtError, [mbOK], 0);
        Exit;
     end;
     cdsRecibo.FieldByName('ClienteID').AsInteger:=Datos.Clave;
     edtCliente.Text :=inttostr(Datos.Clave);
     edtNombre.Text := Datos.Nombre;
   end;
end;

procedure TfrmCredito.cdsReciboAfterPost(DataTable: TDADataTable);
begin
  inherited;
  cdsMovimientos.open;
  cdsMovimientos.Append;
  cdsMovimientos.FieldByName('MovimientoID').AsInteger:=cdsRecibo.FieldByName('MovimientoID').AsInteger;
  cdsMovimientos.FieldByName('FechaMovimiento').AsDateTime:=cdsRecibo.FieldByName('FechaMovimiento').AsDateTime;
  cdsMovimientos.FieldByName('FechaVencimiento').AsDateTime:=cdsRecibo.FieldByName('FechaMovimiento').AsDateTime;
  cdsMovimientos.FieldByName('Referencia').AsString:=cxDBTextEdit2.Text;
  cdsMovimientos.FieldByName('Ejercicio').AsInteger:=cdsRecibo.FieldByName('Ejercicio').AsInteger;
  cdsMovimientos.FieldByName('Periodo').AsInteger:=cdsRecibo.FieldByName('Periodo').AsInteger;
  cdsMovimientos.FieldByName('CargoAbono').AsString:='A';
  cdsMovimientos.FieldByName('Cargo').AsFloat:=0;
  cdsMovimientos.FieldByName('Abono').AsFloat:=cdsRecibo.FieldByName('Importe').AsFloat;
  cdsMovimientos.FieldByName('FechaRegistro').AsDateTime:=cdsRecibo.FieldByName('FechaCaptura').AsDateTime;
  cdsMovimientos.FieldByName('Origen').AsString:='AUTO';
  cdsMovimientos.FieldByName('ClienteID').AsInteger:=cdsRecibo.FieldByName('ClienteID').AsInteger;
  cdsMovimientos.FieldByName('TipoMovimientoID').AsString:= 'REC';
  cdsMovimientos.FieldByName('AfectaSaldos').AsBoolean:=True;
  cdsMovimientos.FieldByName('UsuarioID').AsInteger:=DM.Seguridad.idEmpleado;
  cdsMovimientos.Post;
  //edtFolio.EditValue:=cdsRecibo.FieldByName('ReciboID').AsInteger;
  cdsMovimientos.ApplyUpdates();
  cdsMovimientos.Close;
  cdsRecibo.ApplyUpdates();
end;

procedure TfrmCredito.cdsReciboBeforePost(DataTable: TDADataTable);
begin
  inherited;
  cdsRecibo.FieldByName('ReciboID').AsInteger:=DMFlotillas.Server.Folio('ReciboID','');
  cdsRecibo.FieldByName('Folio').AsInteger:=cdsRecibo.FieldByName('ReciboID').AsInteger;

  //edtFolio.Text := inttostr(cdsRecibo.FieldByName('ReciboID').AsInteger);
end;

procedure TfrmCredito.cdsReciboFacturaNewRecord(DataTable: TDADataTable);
begin
  inherited;
  cdsReciboFactura.FieldByName('ClienteID').AsInteger:=cdsRecibo.FieldByName('ClienteID').AsInteger;
  //cdsReciboFactura.FieldByName('ReciboID').AsInteger:=cdsRecibo.FieldByName('ReciboID').AsInteger;
  cdsReciboFactura.FieldByName('SaldoDocumentoID').AsInteger:= DMFlotillas.Server.Folio('SaldoDocID','');
  cdsReciboFactura.FieldByName('Fecha').AsDateTime:=Now;
  cdsReciboFactura.FieldByName('Cargo').AsInteger:=0;
end;

procedure TfrmCredito.cdsReciboNewRecord(DataTable: TDADataTable);
begin
  inherited;
  cdsRecibo.FieldByName('EstacionID').AsInteger:=DM.NumeroEstacion;
  cdsRecibo.FieldByName('Referencia').AsString:='';
  cdsRecibo.FieldByName('Cheque').AsString:='';
  cdsRecibo.FieldByName('FechaMovimiento').AsDateTime:=Trunc(DMFlotillas.Server.Fecha);
  cdsRecibo.FieldByName('FechaAplicacion').AsDateTime:=Trunc(DMFlotillas.Server.Fecha);
end;

procedure TfrmCredito.cxButton1Click(Sender: TObject);
begin
  inherited;
  cdsReciboFactura.Close;
  cdsReciboFactura.Open;
  tblFacturas.First;

  while not tblFacturas.Eof do
  begin
    if tblFacturas.FieldByName('Incluir').AsBoolean then
    begin
    cdsReciboFactura.Append;
    cdsReciboFactura.FieldByName('FechaVencimiento').AsDateTime:= tblFacturas.FieldByName('Vencimiento').AsDateTime;
    cdsReciboFactura.FieldByName('MovimientoID').AsInteger:= tblFacturas.FieldByName('MovimientoID').AsInteger;
    cdsReciboFactura.FieldByName('Referencia').AsString:=tblFacturas.FieldByName('Referencia').AsString;
    cdsReciboFactura.FieldByName('Cargo').AsInteger:=0;
    cdsReciboFactura.FieldByName('Abono').AsFloat:= tblFacturas.FieldByName('Importe').AsFloat;
    cdsReciboFactura.Post;
    end;
    tblFacturas.Next;
  end;
  cdsRecibo.FieldByName('Importe').AsFloat:= Abs(dbtvFacturas.DataController.Summary.FooterSummaryValues[0]);
end;

procedure TfrmCredito.dbtvFacturasEditValueChanged(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem);
begin
  inherited;
  cdsRecibo.FieldByName('Importe').AsFloat:= Abs(dbtvFacturas.DataController.Summary.FooterSummaryValues[0]);
end;

function TfrmCredito.DocumentosConSaldo(
  MovimientoID: Integer): TDocumentosConSaldo;
var
  I: Integer;
begin
  Result:=nil;
  for I := 0 to Documentos.Count - 1 do    // Iterate
  begin
    if Documentos[I].MovimientoID = MovimientoID then
    begin
      Result:=Documentos[I];
      Exit;
    end;
  end;
end;

procedure TfrmCredito.edtClienteEnter(Sender: TObject);
begin
  inherited;
  UpdateActionsState;
end;

procedure TfrmCredito.edtClienteExit(Sender: TObject);
var
  I: Integer;
begin
  inherited;
  cdsCliente.Close;
  if edtCliente.Text <> '' then
  begin
    cdsCliente.ParamByName('Cliente').AsInteger := strToInt(edtCliente.Text);
    cdsCliente.Open;
    edtCliente.Enabled:=False;
  end
  else
    Exit;

  if not (cdsCliente.EOF) then
  begin
     if (cdsCliente.FieldByName('FormaCompraID').AsInteger <> 1) then
     begin
       MessageDlg('Cliente no es de Credito', mtError, [mbOK], 0);
       ActionCancelar(nil);
       Exit;
     end;
     if (cdsCliente.FieldByName('Estatus').AsString <> 'A') then
     begin
       MessageDlg('Cliente no esta Activo', mtError, [mbOK], 0);
       Exit;
     end;
     cdsRecibo.FieldByName('ClienteID').AsInteger:= cdsCliente.FieldByName('ClienteID').AsInteger;
     edtCliente.Text := cdsCliente.FieldByName('ClienteID').AsString;
     edtNombre.Text:= cdsCliente.FieldByName('Nombre').AsString;

     cdsRecibo.FieldByName('ClienteID').AsInteger:=cdsCliente.FieldByName('ClienteID').AsInteger;
     cdsRecibo.FieldByName('CuentaContableCliente').AsString:=cdsCliente.FieldByName('CuentaContable').AsString;

     Documentos:=DMFlotillas.Server.DocumentosConSaldo(edtCliente.EditValue);
     {TcxImageComboBoxProperties(dbtvFacturasColumn1.Properties).Items.Clear;}
     tblFacturas.Close;
     tblFacturas.Open;

     TcxImageComboBoxProperties(dbtvFacturasColumn1.Properties).Items.Clear;
     if Documentos <> nil then
     begin
        for I := 0 to Documentos.Count - 1 do    // Iterate
        begin
          tblFacturas.Append;
          tblFacturas.FieldByName('Referencia').AsString:= Documentos[I].Referencia;
          tblFacturas.FieldByName('Importe').AsFloat:=  Documentos[I].Importe;
          tblFacturas.FieldByName('MovimientoID').AsInteger:= Documentos[I].MovimientoID;
          tblFacturas.FieldByName('Vencimiento').AsDateTime:= Documentos[I].Vencimiento;

          DM.AgregarOpcionCombo(TcxImageComboBoxProperties(dbtvFacturasColumn1.Properties).Items,
                                Documentos[I].Referencia,
                                Documentos[I].MovimientoID);
        end;
        tblFacturas.First;
     end;
  end else MessageDlg('El Cliente no existe', mtError, [mbOK], 0);

  UpdateActionsState;
end;

procedure TfrmCredito.edtClienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F2 then
     BuscarCliente;
end;

procedure TfrmCredito.FormCreate(Sender: TObject);
begin
  inherited;
  cdsRecibo.Close;
  cdsRecibo.Open;
  ImprimeRec:= 0;
  dtpFecha.Enabled:=True;
  //dtpFecha.Enabled:=DMFlotillas.ModificaFechaRecibo;
end;

procedure TfrmCredito.RegisterActions;
begin
  inherited RegisterActions;
  RegisterAction(AppActions.actNuevo, ActionNuevo);
  RegisterAction(AppActions.actCancelar, ActionCancelar);
  RegisterAction(AppActions.actGuardar, ActionGuardar);
  RegisterAction(AppActions.actBuscar, ActionBuscar);
  RegisterAction(AppActions.actImprimir, ActionImprimir);
end;

procedure TfrmCredito.UpdateActionsState;
begin
  inherited;
  dmAppActions.actNuevo.Enabled:=cdsRecibo.State = dsBrowse;
  dmAppActions.actGuardar.Enabled:=(cdsRecibo.State in dsEditModes);
  dmAppActions.actCancelar.Enabled:=cdsRecibo.State in dsEditModes;
  dmAppActions.actEliminar.Enabled:=(cdsRecibo.State = dsBrowse) and (cdsRecibo.RecordCount > 0);
  dmAppActions.actBuscar.Enabled:=(edtCliente.Focused) and (cdsRecibo.State in dsEditModes);

  cxGroupBox1.Enabled := not (dmAppActions.actNuevo.Enabled);
  cxGroupBox2.Enabled := not (dmAppActions.actNuevo.Enabled);
  //gbCliente.Enabled := not (dmAppActions.actNuevo.Enabled);
  cxGroupBox4.Enabled := not (dmAppActions.actNuevo.Enabled);
  if dmAppActions.actNuevo.Enabled then
    edtNombre.Text:='';
end;

function TfrmCredito.ValidaReciboFacturas: Boolean;
var
  I:Integer;
begin
  Result:= False;

  try

    if cdsReciboFactura.State in dsEditModes then
    begin
      MessageDlg('Existen cambios pendientes en las facturas.', mtError, [mbOK], 0);
      Exit;
    end;

    if (Abs(dbtvFacturas.DataController.Summary.FooterSummaryValues[0] - cdsRecibo.FieldByName('Importe').AsFloat) > 0.1) then
    begin
        MessageDlg('El Importe del recibo y la suma de las facturas no coinciden.', mtError, [mbOK], 0);
        Exit;
    end;

    for I := 0 to Documentos.Count - 1 do    // Iterate
        Documentos[I].EnRecibo:=0;

    cdsReciboFactura.First;
    while not cdsReciboFactura.EOF do
    begin
      I:=cdsReciboFactura.FieldByName('MovimientoID').AsInteger;
      DocumentosConSaldo(I).EnRecibo:=DocumentosConSaldo(I).EnRecibo + cdsReciboFactura.FieldByName('Abono').AsFloat;
      if (DocumentosConSaldo(I).EnRecibo - DocumentosConSaldo(I).Saldo) > 0.1 then
      begin
        MessageDlg('Existe una factura con sobrepago.', mtError, [mbOK], 0);
        Exit;
      end;
      cdsReciboFactura.Next;
    end;    // while
    Result:=True;
  except
  end;
end;

initialization
   ModuleInfoManager.RegisterModule('Credito', TfrmCredito);

end.
