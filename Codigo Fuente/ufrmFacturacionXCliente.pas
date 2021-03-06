unit ufrmFacturacionXCliente;

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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxContainer, cxEdit, Menus, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, DB, cxDBData, cxCheckBox, ufrmBuscar,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, cxSpinEdit, cxTimeEdit, cxTextEdit,
  cxCurrencyEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, StdCtrls, cxButtons,
  cxGroupBox, cxPC, uDAInterfaces, uDADataTable, dxmdaset, uDAScriptingProvider,
  uDACDSDataTable, uDARemoteDataAdapter, uDAMemDataTable, ComCtrls, LibraryFlotillas_Intf;

type
  TfrmFacturacionXCliente = class(TfrmCustomModule)
    pgcFacturas: TcxPageControl;
    cxTabSheet4: TcxTabSheet;
    cxGroupBox4: TcxGroupBox;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label17: TLabel;
    btnPreeliminar: TcxButton;
    dtpCorte: TcxDateEdit;
    dtpContable: TcxDateEdit;
    edtCliente: TcxCurrencyEdit;
    edtNombre: TcxTextEdit;
    edtSerieGenera: TcxTextEdit;
    dtpTimer: TcxTimeEdit;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxTabSheet3: TcxTabSheet;
    cxGroupBox3: TcxGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    edtSerie: TcxTextEdit;
    edtRangoFacturaIni: TcxCurrencyEdit;
    edtRangoFacturaFin: TcxCurrencyEdit;
    cxCheckBox4: TcxCheckBox;
    cdsCliente: TDACDSDataTable;
    tblFactura: TdxMemData;
    tblFacturaFacturado: TBooleanField;
    tblFacturaProductoID: TIntegerField;
    tblFacturaDescripcion: TStringField;
    tblFacturaCantidad: TFloatField;
    tblFacturaImporte: TFloatField;
    dsFactura: TDataSource;
    dsCliente: TDADataSource;
    spBuscaFactura: TDACDSDataTable;
    dsBuscaFactura: TDADataSource;
    tblFacturaTicket: TIntegerField;
    cxGrid1DBTableView1RecId: TcxGridDBColumn;
    cxGrid1DBTableView1Facturado: TcxGridDBColumn;
    cxGrid1DBTableView1Ticket: TcxGridDBColumn;
    cxGrid1DBTableView1ProductoID: TcxGridDBColumn;
    cxGrid1DBTableView1Descripcion: TcxGridDBColumn;
    cxGrid1DBTableView1Cantidad: TcxGridDBColumn;
    cxGrid1DBTableView1Importe: TcxGridDBColumn;
    cdsPrevisualizaFacturasCliente: TDAMemDataTable;
    rdaPrevisualizaFacturasCliente: TDARemoteDataAdapter;
    prgBar: TProgressBar;
    tblFacturaIVA: TFloatField;
    tblFacturaPlazoPago: TIntegerField;
    cdsObtenFactura: TDAMemDataTable;
    rdaObtenFactura: TDARemoteDataAdapter;
    cmdAfectaConsumos: TDARemoteDataAdapter;
    cdsAfectaConsumos: TDAMemDataTable;
    cmdInsertaMovimientos: TDARemoteDataAdapter;
    cdsInsertaMovimientos: TDAMemDataTable;
    cmdInsertaSaldoDocumento: TDARemoteDataAdapter;
    cdsInsertaSaldoDocumento: TDAMemDataTable;
    tblFacturaClienteID: TIntegerField;
    prgBar2: TProgressBar;
    rdaFolioActual: TDARemoteDataAdapter;
    cdsFolioActual: TDAMemDataTable;
    tblFacturaFechaConsumo: TDateTimeField;
    cxGrid1DBTableView1FechaConsumo: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure btnPreeliminarClick(Sender: TObject);
    procedure edtClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtClienteEnter(Sender: TObject);
    procedure edtClienteExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure BuscarCliente;
    procedure ActionBuscar(Action: TBasicAction);
    procedure ActionImprimir(Action: TBasicAction);
    procedure ActionProcesar(Action: TBasicAction);
  public
    { Public declarations }
    procedure UpdateActionsState; override;
  protected
    procedure RegisterActions; override;
  end;

var
  frmFacturacionXCliente: TfrmFacturacionXCliente;
  Datos : TDatosBusqueda;

implementation
uses Modules, uDMFlotillas, dmActions, ufrmBuscarClienteCredito, uDM;

{$R *.dfm}
procedure TfrmFacturacionXCliente.ActionBuscar(Action: TBasicAction);
begin
   BuscarCliente;
end;

procedure TfrmFacturacionXCliente.ActionImprimir(Action: TBasicAction);
begin

end;

procedure TfrmFacturacionXCliente.ActionProcesar(Action: TBasicAction);
var
  Tickets: String;

  DatosFactura: TDatosFactura;
  Detalle:TDetalleFactura;
  CliID, MovID  : Integer;
  Porcentaje, SubTotal, ImpIVA, IVA, Total: Currency;

  S: String;
  P: TParametrosF;
  Folio: String;
begin
  {spBuscaFactura.Close;
  spBuscaFactura.ParamByName('Folio').AsInteger:= strtoint(cxTextEdit2.Text);
  spBuscaFactura.ParamByName('Serie').AsString:= edtSerieGenera.Text;
  spBuscaFactura.Open;}

  //if spBuscaFactura.RecordCount > 0 then begin
     //MessageDlg('Serie y Folio ya utilizados',[mtError],mbOK,0);
  //   Exit;
  //end;
  //////////////////////////////////////////////////////////////////////////////
  if not tblFactura.EOF then
  begin
     prgBar2.Min:= 1;
     prgBar2.Max:= cdsPrevisualizaFacturasCliente.RecordCount;
     prgBar2.Position:= 0;
  end;

  if tblFactura.Active then
  begin
    tblFactura.First;
    Tickets:= '@';

    while not(TblFactura.EOF) do
    begin
      if TblFactura.FieldByName('Facturado').AsBoolean then
         Tickets:= Tickets  + TblFactura.FieldByName('Ticket').AsString + '@';
      tblFactura.Next;
      prgBar2.Position:= prgBar2.Position + 1;
    end;
  end;
  //////////////////////////////////////////////////////////////////////////////

  P:= TParametrosF.Create;
  Try
  cdsObtenFactura.Close;
  S:= 'Select Producto.Precio, Cliente.ClienteID, Estacion.IVA, Consumo.ProductoID, Cliente.PlazoPago, Descripcion, Sum(Cantidad) as Cantidad, '+
      'Sum(Importe) as Importe, Sum(ImpuestoImporte) as IVA '+
      'from   Consumo inner join '+
      'Producto on Producto.ProductoID = Consumo.ProductoID '+
      'inner join Estacion on Estacion.EstacionID = Consumo.EstacionID '+
      'inner join Cliente  on Consumo.ClienteID = Cliente.ClienteID '+
      'Where Consumo.ClienteID = @ClienteIni and Consumo.FechaCarga <= @FechaCorte and Consumo.Facturado = 0 and '+
      '      @Movimientos like ''%@''+cast(Consumo.SecuenciaVenta as varchar(100))+''@%'' '+
      'Group by Cliente.ClienteID, Consumo.ProductoID, Producto.Descripcion, Estacion.IVA, Cliente.PlazoPago, Producto.Precio '+
      'order by Consumo.ProductoID';
  P.ClienteIni:= edtCliente.EditValue;
  P.FechaCorte:= dtpCorte.Date + dtpTimer.Time;
  P.Movimientos:= Tickets;
  rdaObtenFactura.GetDataCall.ParamByName('SQL').AsString:=S;
  rdaObtenFactura.GetDataCall.ParamByName('Parametros').AsComplexType:= P;
  cdsObtenFactura.Open;
  //////////////////////////////////////////////////////////////////////////////
  Total := 0;
  CliID := cdsObtenFactura.FieldByName('ClienteID').AsInteger;
  Porcentaje := cdsObtenFactura.FieldByName('IVA').AsFloat;
  ImpIVA := Porcentaje / 100;
  //Crear Estructura//
  DatosFactura := TDatosFactura.Create;
  DatosFactura.Factura := TFactura.Create;
  DatosFactura.DetalleFactura := ATDetalleFactura.Create;
  ////////////////////
  MovID := DMFlotillas.Server.Folio('MovimientoID', '');
  DatosFactura.Factura.FacturaID := DMFlotillas.Server.Folio('FacturaID','');
  DatosFactura.Factura.Serie := edtSerieGenera.Text;

  DatosFactura.Factura.Fecha := dtpContable.Date;;
  DatosFactura.Factura.FechaVencimiento := dtpContable.Date + tblFactura.FieldByName('PlazoPago').AsInteger;
  DatosFactura.Factura.FechaImpresion := dtpContable.Date;
  DatosFactura.Factura.Ejercicio := strtoint(FormatDateTime('yyyy',dtpContable.Date));
  DatosFactura.Factura.Periodo := strtoint(FormatDateTime('mm',dtpContable.Date));
  DatosFactura.Factura.Saldo := 0;
  DatosFactura.Factura.Tickets := '';
  DatosFactura.Factura.ClienteID := CliID;
  DatosFactura.Factura.UsuarioID := DM.EmpleadoID;
  DatosFactura.Factura.MovimientoID := MovID;
  DatosFactura.Factura.IVA := Porcentaje;
  while ((cdsObtenFactura.FieldByName('ClienteID').AsInteger = CliID) and
          (cdsObtenFactura.FieldByName('IVA').AsFloat = Porcentaje) and
           (not cdsObtenFactura.EOF)) do
  begin
    Detalle:=TDetalleFactura.Create;
    Detalle.Cantidad:=cdsObtenFactura.FieldByName('Cantidad').AsFloat;
    Detalle.Precio:=cdsObtenFactura.FieldByName('Precio').AsFloat;
    Detalle.Importe:=cdsObtenFactura.FieldByName('Importe').AsFloat;
    Detalle.ProductoID:=cdsObtenFactura.FieldByName('ProductoID').AsInteger;
    Detalle.DetalleFacturaID:=DMFlotillas.Server.Folio('DetalleFacturaID', '');
    DatosFactura.DetalleFactura.Add(Detalle);
    Total := Total + cdsObtenFactura.FieldByName('Importe').AsFloat;
    cdsObtenFactura.Next;
  end;
  //////////////////////////////////////////////////////////////////////////////
  SubTotal:=StrToFloat(FormatFloat('#0.00', Total / (1+ImpIVA)));
  IVA:=StrToFloat(FormatFloat('#0.00', Total - SubTotal));
  DatosFactura.Factura.Subtotal:=SubTotal;
  DatosFactura.Factura.Impuesto:=IVA;
  DatosFactura.Factura.Total:= Total;

  Try
  cdsFolioActual.Close;
  S:= 'select isnull(max(Folio),0)+1 as Folio from Factura where Serie = @Grupo';
  P.Grupo:= DM.SerieFacturaCredito;
  rdaFolioActual.GetDataCall.ParamByName('SQL').AsString:=S;
  rdaFolioActual.GetDataCall.ParamByName('Parametros').AsComplexType:= P;
  cdsFolioActual.Open;
  Finally
  End;
  DatosFactura.Factura.Folio := cdsFolioActual.FieldByName('Folio').AsInteger;
  DMFlotillas.Server.GuardaDatosFactura(DatosFactura);
  //////////////////////////////////////////////////////////////////////////////
  //-----------afecta los consumos----------------------------------------------
  Try
  cdsAfectaConsumos.Close;
  S:= 'Update dbo.Consumo '+
      'set    Facturado = 1, FacturaID = @FacturaIni '+
      'where (ClienteID = @ClienteIni)AND(@FechaCorte >= FechaMovimiento) and '+
      '(Facturado = 0) AND '+
      ''''+Tickets+''' Like ''%@''+Cast(SecuenciaVenta as Varchar(50))+''@%'' ';

  S:= S + 'insert into dbo.Movimiento '+
      '(MovimientoID, FechaMovimiento, FechaVencimiento, Referencia, '+
       'Ejercicio, Periodo, CargoAbono, Cargo, Abono, FechaRegistro, '+
       'Origen, AfectaSaldos, TipoMovimientoID, UsuarioID, ClienteID) '+
      'values '+
      '(@TipoFecha, @FechaIni, @FechaFin, @Grupo, '+
       '@EstacionIni, @EstacionFin, ''C'', '+floattostr(Total)+', 0, @FechaCorte, '+
       '''AUTO'', 0, ''FAC'', @Venc0, @ClienteIni) ';

  S:= S + 'insert into dbo.SaldoDocumento '+
      '(SaldoDocumentoID, Fecha, FechaVencimiento, Cargo, '+
      'Abono, Referencia, ClienteID, MovimientoID, ReciboID, BancoID) '+
      'values '+
      '(@EstacionFin, @FechaIni, @FechaFin, '+floattostr(Total)+', '+
      '0, @Grupo, @ClienteIni, @EstacionIni, 0, 0)  SELECT 1';

  P.FacturaIni:= DatosFactura.Factura.FacturaID;
  P.FechaCorte:= dtpCorte.Date + dtpTimer.Time;

  P.TipoFecha:= MovID;
  P.FechaIni:=  dtpContable.Date;
  P.FechaFin:=  dtpContable.Date + dtpTimer.Time;
  P.Grupo:=     'FACTURA: ' + edtSerieGenera.Text + inttostr(DatosFactura.Factura.Folio);
  P.EstacionIni:= strtoint(FormatDateTime('yyyy',dtpContable.Date));
  P.EstacionFin:= strtoint(FormatDateTime('mm',dtpContable.Date));
  P.FechaCorte:= Trunc(now);
  P.Venc0:= DM.EmpleadoID;
  P.ClienteIni:= CliID;
  P.ClienteIni:= CliID;
  P.EstacionIni:= MovID;
  P.EstacionFin:= DMFlotillas.Server.Folio('SaldoDocID', '');

  cmdAfectaConsumos.GetDataCall.ParamByName('SQL').AsString:=S;
  cmdAfectaConsumos.GetDataCall.ParamByName('Parametros').AsComplexType:= P;
  cdsAfectaConsumos.Open;
  Finally
  End;
  Finally
     ShowMessage('Factura '+edtSerieGenera.Text+' '+inttostr(DatosFactura.Factura.Folio)+ ' con exito');
     tblFactura.Close;
  End;
end;

procedure TfrmFacturacionXCliente.btnPreeliminarClick(Sender: TObject);
var
  S: String;
  P: TParametrosF;
begin
  inherited;
  P:= TParametrosF.Create;

  Try
  cdsPrevisualizaFacturasCliente.Close;
  S:= 'Select Cliente.ClienteID, Estacion.IVA, Consumo.SecuenciaVenta, Consumo.ProductoID, Cliente.PlazoPago, Descripcion, Sum(Cantidad) as Cantidad, '+
      'Sum(Importe) as Importe, Sum(ImpuestoImporte) as IVA, FechaCarga as FechaConsumo '+
      'from   Consumo inner join '+
      'Producto on Producto.ProductoID = Consumo.ProductoID '+
      'inner join Estacion on Estacion.EstacionID = Consumo.EstacionID '+
      'inner join Cliente  on Consumo.ClienteID = Cliente.ClienteID '+
      'Where Consumo.ClienteID = @ClienteIni and Consumo.FechaCarga <= @FechaCorte and Consumo.Facturado = 0 '+
      'Group by Cliente.ClienteID, Consumo.SecuenciaVenta, Consumo.ProductoID, Producto.Descripcion, Estacion.IVA, Cliente.PlazoPago, Consumo.FechaCarga '+
      'order by Consumo.ProductoID ';
      
  P.ClienteIni:= edtCliente.EditValue;
  P.FechaCorte:= dtpCorte.Date + dtpTimer.Time;
  rdaPrevisualizaFacturasCliente.GetDataCall.ParamByName('SQL').AsString:=S;
  rdaPrevisualizaFacturasCliente.GetDataCall.ParamByName('Parametros').AsComplexType:= P;
  cdsPrevisualizaFacturasCliente.Open;

  if not cdsPrevisualizaFacturasCliente.EOF then
  begin
     prgBar.Min:= 1;
     prgBar.Max:= cdsPrevisualizaFacturasCliente.RecordCount;
     prgBar.Position:= 0;
  end;

  tblFactura.Close;
  tblFactura.Open;
  while not cdsPrevisualizaFacturasCliente.EOF do
  begin
    tblFactura.Append;
    tblFactura.FieldByName('Facturado').AsBoolean:= True;
    tblFactura.FieldByName('Ticket').AsInteger:= cdsPrevisualizaFacturasCliente.FieldByName('SecuenciaVenta').AsInteger;
    tblFactura.FieldByName('ProductoID').AsInteger:= cdsPrevisualizaFacturasCliente.FieldByName('ProductoID').AsInteger;
    tblFactura.FieldByName('Descripcion').AsString:= cdsPrevisualizaFacturasCliente.FieldByName('Descripcion').AsString;
    tblFactura.FieldByName('Cantidad').AsFloat:= cdsPrevisualizaFacturasCliente.FieldByName('Cantidad').AsFloat;
    tblFactura.FieldByName('Importe').AsFloat:= cdsPrevisualizaFacturasCliente.FieldByName('Importe').AsFloat;
    tblFactura.FieldByName('IVA').AsFloat:= cdsPrevisualizaFacturasCliente.FieldByName('IVA').AsFloat;
    tblFactura.FieldByName('PlazoPago').AsInteger:= cdsPrevisualizaFacturasCliente.FieldByName('PlazoPago').AsInteger;
    tblFactura.FieldByName('ClienteID').AsInteger:= cdsPrevisualizaFacturasCliente.FieldByName('ClienteID').AsInteger;
    tblFactura.FieldByName('FechaConsumo').AsDateTime := cdsPrevisualizaFacturasCliente.FieldByName('FechaConsumo').AsDateTime;
    cdsPrevisualizaFacturasCliente.Next;

    prgBar.Position:= prgBar.Position + 1;
  end;

  tblFactura.First;
  Finally
    FreeAndNil(P);
  End;

end;

procedure TfrmFacturacionXCliente.BuscarCliente;
begin
   Datos:= PantallaBusqueda(TfrmBuscarClienteCredito,'1,2,3');
   if Datos.OK then
   begin
   
     if Datos.Estatus <> 'A' then
     begin
        MessageDlg('Cliente no esta Activo', mtError, [mbOK], 0);
        Exit;
     end;
     edtCliente.Text :=inttostr(Datos.Clave);
     edtNombre.Text := Datos.Nombre;
   end;
end;

procedure TfrmFacturacionXCliente.edtClienteEnter(Sender: TObject);
begin
  inherited;
  UpdateActionsState;
end;

procedure TfrmFacturacionXCliente.edtClienteExit(Sender: TObject);
begin
  inherited;
  cdsCliente.Close;
  if edtCliente.Text <> '' then
  begin
    cdsCliente.ParamByName('Cliente').AsInteger := strToInt(edtCliente.Text);
    cdsCliente.Open;
  end else
  begin
    cdsCliente.ParamByName('Cliente').AsInteger := 0;
    cdsCliente.Open;
  end;

  if not (cdsCliente.EOF) then
  begin
     if (cdsCliente.FieldByName('Estatus').AsString <> 'A') then
     begin
       MessageDlg('Cliente no esta Activo', mtError, [mbOK], 0);
       exit;
     end;

     Datos.Clave:=cdsCliente.FieldByName('ClienteID').AsInteger;
     Datos.Nombre:= cdsCliente.FieldByName('Nombre').AsString;
     Datos.FormaPago:= cdsCliente.FieldByName('FormaPagoID').AsInteger;
     Datos.Estatus := cdsCliente.FieldByName('Estatus').AsString;
     Datos.RFC := '';
     Datos.Cuenta:= cdsCliente.FieldByName('CuentaContable').AsString;

     edtCliente.Text :=inttostr(Datos.Clave);
     edtNombre.Text := Datos.Nombre;
  end else MessageDlg('El Cliente no existe', mtError, [mbOK], 0);
end;

procedure TfrmFacturacionXCliente.edtClienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = VK_F2 then
     BuscarCliente;
end;

procedure TfrmFacturacionXCliente.FormCreate(Sender: TObject);
begin
  inherited;
  pgcFacturas.ActivePageIndex:=0;
  dtpCorte.Date:=Trunc(Now);
  dtpContable.Date:=Trunc(Now);

  
end;

procedure TfrmFacturacionXCliente.FormShow(Sender: TObject);
begin
  inherited;
  edtSerieGenera.Text:= DM.SerieFacturaCredito;
end;

procedure TfrmFacturacionXCliente.RegisterActions;
begin
  inherited RegisterActions;
  RegisterAction(AppActions.actBuscar, ActionBuscar);
  RegisterAction(AppActions.actImprimir, ActionImprimir);
  RegisterAction(AppActions.actProcesar, ActionProcesar);
end;

procedure TfrmFacturacionXCliente.UpdateActionsState;
begin
  inherited;
  AppActions.actBuscar.Enabled:=edtCliente.Focused;
  AppActions.actProcesar.Enabled:= pgcFacturas.ActivePageIndex = 0;
  AppActions.actImprimir.Enabled:= pgcFacturas.ActivePageIndex = 1;
end;

initialization
   ModuleInfoManager.RegisterModule('FacturaXCliente', TfrmFacturacionXCliente);

end.
