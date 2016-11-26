unit ufrmIngresoXfecha;

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
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxGroupBox,
  dxSkinscxPCPainter, cxPC, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxMaskEdit,
  cxCalendar, cxDBEdit, cxTextEdit, cxCurrencyEdit, cxLabel, uDAInterfaces,
  uDADataTable, uDAScriptingProvider, uDACDSDataTable, LibraryCistemGas_Intf,
  LibraryFlotillas_Intf, uDARemoteDataAdapter, cxButtonEdit, LibraryIngresos_Intf, dxmdaset,
  cxSpinEdit, cxTimeEdit, cxDBLabel, ufrmBuscarCliente, ufrmBuscarProducto, ufrmBuscar,
  StdCtrls, DBCtrls, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint, cxPCdxBarPopupMenu,
  cxNavigator, uDADataAdapter, uDAFields, uROComponent, Vcl.ExtCtrls, Vcl.Menus,
  cxButtons,

  uAgregarVenta, uAgregarVentaCreditoDebitosCupones, uAgregarOtrosProductos,
  uAgregarVentaDocumentos, uAgregarVentaEfectivo, uAgregarVentaSalidaEfectivo,
  uAgregarVentaCheques, uAgregarVentaOtros;

const
   MaximoValores: Integer = 10;

  type
  TGrupoValor = record
    Nombre: String;
    Valor: Real;
  end;

  TValores = array[1..10] of TGrupoValor;

type
  TfrmIngresosXfecha = class(TfrmCustomModule)
    cxGroupBox1: TcxGroupBox;
    cxGroupBox3: TcxGroupBox;
    pgcConceptos: TcxPageControl;
    Conceptos: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    cxLabel1: TcxLabel;
    edtSecuencia: TcxCurrencyEdit;
    dtpFecha: TcxDBDateEdit;
    cxLabel9: TcxLabel;
    cbEncargado: TcxDBLookupComboBox;
    cxLabel14: TcxLabel;
    cdsIngresos: TDACDSDataTable;
    dsIngresos: TDADataSource;
    dsDetalleIngreso: TDADataSource;
    cdsDetalleIngreso: TDACDSDataTable;
    dsEncargadoIngreso: TDADataSource;
    cdsTipoComprobacion: TDACDSDataTable;
    dsTipoValor: TDADataSource;
    cdsProductosCombustibles: TDACDSDataTable;
    dsProductosCombustibles: TDADataSource;
    cdsEncargadoIngreso: TDACDSDataTable;
    dbgCreditosDebitosCupones: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    rdaConsumos: TDARemoteDataAdapter;
    cdsConsumos: TDACDSDataTable;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet3: TcxTabSheet;
    cxTabSheet4: TcxTabSheet;
    cbTurno: TcxDBLookupComboBox;
    cxLabel2: TcxLabel;
    cdsEmpleado: TDACDSDataTable;
    dsEmpleado: TDADataSource;
    cdsTurno: TDACDSDataTable;
    dsTurno: TDADataSource;
    rdaIDTipoValores: TDARemoteDataAdapter;
    cdsIDTipoValores: TDACDSDataTable;
    cxTabSheet5: TcxTabSheet;
    dbgClientes: TcxGrid;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridLevel3: TcxGridLevel;
    dbgEfectivo: TcxGrid;
    cxGridDBTableView4: TcxGridDBTableView;
    cxGridLevel4: TcxGridLevel;
    dbgSalidaEfectivos: TcxGrid;
    cxGridDBTableView5: TcxGridDBTableView;
    cxGridLevel5: TcxGridLevel;
    Tarjetas: TcxGridDBColumn;
    Ticket: TcxGridDBColumn;
    CreditosProducto: TcxGridDBColumn;
    CreditosCantidad: TcxGridDBColumn;
    CreditosImporte: TcxGridDBColumn;
    cxGroupBox2: TcxGroupBox;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    ClienteNombre: TcxGridDBColumn;
    ClienteTicket: TcxGridDBColumn;
    ClienteImporte: TcxGridDBColumn;
    EfectivoDescripcion: TcxGridDBColumn;
    EfectivoCantidad: TcxGridDBColumn;
    EfectivoImporte: TcxGridDBColumn;
    SalidaEfectivoDescripcion: TcxGridDBColumn;
    SalidaEfectivoImporte: TcxGridDBColumn;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    tInicio: TcxTimeEdit;
    tFin: TcxTimeEdit;
    cxDBLabel1: TcxDBLabel;
    cxDBLabel2: TcxDBLabel;
    cxDBLabel3: TcxDBLabel;
    cxDBLabel4: TcxDBLabel;
    cdsProductos: TDACDSDataTable;
    dsProductos: TDADataSource;
    cdsClientes: TDACDSDataTable;
    dsClientes: TDADataSource;
    IDCliente: TcxGridDBColumn;
    cdsTipoCambio: TDACDSDataTable;
    dsTipoCambio: TDADataSource;
    dbgConceptos: TcxGrid;
    dbgConceptosDBTableView1: TcxGridDBTableView;
    dbgConceptosLevel1: TcxGridLevel;
    Descripcion: TcxGridDBColumn;
    Producto: TcxGridDBColumn;
    Precio: TcxGridDBColumn;
    Cantidad: TcxGridDBColumn;
    Importe: TcxGridDBColumn;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    ProductoDescripcion: TcxGridDBColumn;
    ProductoPrecio: TcxGridDBColumn;
    ProductoCantidad: TcxGridDBColumn;
    ProductoImporte: TcxGridDBColumn;
    cdsHorasCortes: TDACDSDataTable;
    rdaHorasCortes: TDARemoteDataAdapter;
    cxTabSheet6: TcxTabSheet;
    GBTotalesConceptos: TGroupBox;
    cxLabel12: TcxLabel;
    cxLabel13: TcxLabel;
    cxLabel15: TcxLabel;
    cxLabel16: TcxLabel;
    cxLabel17: TcxLabel;
    cxLabel18: TcxLabel;
    LEfectivo: TcxLabel;
    LClientes: TcxLabel;
    LCheques: TcxLabel;
    LTarjetasyCupones: TcxLabel;
    LOtros: TcxLabel;
    LFaltantes: TcxLabel;
    Bevel1: TBevel;
    cxLabel19: TcxLabel;
    LEntregado: TcxLabel;
    GBVenta: TGroupBox;
    Bevel2: TBevel;
    cxLabel20: TcxLabel;
    cxLabel21: TcxLabel;
    cxLabel22: TcxLabel;
    LEVenta: TcxLabel;
    LOtrosProductos: TcxLabel;
    LSobrantes: TcxLabel;
    cxLabel32: TcxLabel;
    cxGroupBox5: TcxGroupBox;
    LDiferencia: TcxLabel;
    LVentaTot: TcxLabel;
    cxTabSheet7: TcxTabSheet;
    cxTabSheet8: TcxTabSheet;
    dbgCheques: TcxGrid;
    dbgChequesDBTableView1: TcxGridDBTableView;
    dbgChequesDBTableView1TipoValorID: TcxGridDBColumn;
    dbgChequesDBTableView1ClienteID: TcxGridDBColumn;
    dbgChequesDBTableView1Column1: TcxGridDBColumn;
    dbgChequesDBTableView1BancoID: TcxGridDBColumn;
    dbgChequesDBTableView1Referencia: TcxGridDBColumn;
    dbgChequesDBTableView1Importe: TcxGridDBColumn;
    cxGridLevel6: TcxGridLevel;
    dbgOtros: TcxGrid;
    dbgOtrosDBTableView1: TcxGridDBTableView;
    dbgOtrosDBTableView1Ticket: TcxGridDBColumn;
    dbgOtrosDBTableView1SalidaID: TcxGridDBColumn;
    dbgOtrosDBTableView1Referencia: TcxGridDBColumn;
    dbgOtrosDBTableView1Importe: TcxGridDBColumn;
    dbgOtrosLevel1: TcxGridLevel;
    NoTicket: TcxGridDBColumn;
    cdsAgrupacion: TDACDSDataTable;
    cdsAgrupacionCajas: TDACDSDataTable;
    dsAgrupacionCajas: TDADataSource;
    dsAgrupacion: TDADataSource;
    cxLabel24: TcxLabel;
    ProductoReferencia: TcxGridDBColumn;
    Panel1: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    cxButton5: TcxButton;
    cxButton6: TcxButton;
    cxButton7: TcxButton;
    cxButton8: TcxButton;
    cbDepartamento: TcxLookupComboBox;
    IDProducto: TcxGridDBColumn;
    DescripcionProducto: TcxGridDBColumn;
    CantidadProducto: TcxGridDBColumn;
    cdsBanco: TDACDSDataTable;
    dsBanco: TDADataSource;
    cdsSalida: TDACDSDataTable;
    dsSalida: TDADataSource;
    cxTabSheet9: TcxTabSheet;
    Bevel3: TBevel;
    cxLabel25: TcxLabel;
    LTotCreditoDebitoCupones: TcxLabel;
    dbgDiferencias: TcxGrid;
    dbgDiferenciasDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    dbgDiferenciasDBTableView1Column1: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridLevel7: TcxGridLevel;
    procedure pgcConceptosPageChanging(Sender: TObject; NewPage: TcxTabSheet;
      var AllowChange: Boolean);
    procedure cdsDetalleIngresoNewRecord(DataTable: TDADataTable);
    procedure FormShow(Sender: TObject);
    procedure dbgConceptos1DBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure cdsDetalleIngresoAfterDelete(DataTable: TDADataTable);
    procedure cdsDetalleIngresoAfterPost(DataTable: TDADataTable);
    procedure ProductoPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure CantidadPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure ImportePropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure ProductoDescripcionPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure ProductoCantidadPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure ProductoImportePropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cxGridDBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cdsDetalleIngresoIDCLIENTEValidate(Sender: TDACustomField);
    procedure cxGridDBTableView3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EfectivoDescripcionPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure EfectivoCantidadPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cdsDetalleIngresoBeforePost(DataTable: TDADataTable);
    procedure FormCreate(Sender: TObject);
    procedure dsIngresosStateChange(Sender: TObject);
    procedure dsEncargadoIngresoStateChange(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure pgcConceptosChange(Sender: TObject);
    procedure cbDepartamentoPropertiesChange(Sender: TObject);
    procedure cdsEncargadoIngresoAfterScroll(DataTable: TDADataTable);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure cxButton5Click(Sender: TObject);
    procedure cxButton6Click(Sender: TObject);
    procedure cxButton7Click(Sender: TObject);
    procedure cxButton8Click(Sender: TObject);
  private
    { Private declarations }
    HacerScroll: Boolean;
    Cambiando: Boolean;
    ListaTickets: TStrings;
    FECHAINGRESO: DateTime;
    TurnoNuevo: Boolean;
    ESCREDITODEBITOCUPON, ESCOMBUSTIBLE, ESPRODUCTO, ESCLIENTE: Integer;
    ESEFECTIVO, ESSALIDAEFECTIVO, IDTIPOVALOR: Integer;
    MiClienteID: Integer;
    ValorMoneda: Float;
    ValoresMoneda: LibraryIngresos_Intf.ATTipoValores;

    procedure AgregaVenta(Venta: uAgregarVenta.TVenta);
    procedure AgregaVentaCreditoDebitoCupones(Venta: uAgregarVentaCreditoDebitosCupones.TVentaCreditoDebitosCupones);
    procedure AgregaVentaOtrosProductos(Venta: uAgregarOtrosProductos.TVentaOtrosProductos);
    procedure AgregaVentaDocumentos(Venta: uAgregarVentaDocumentos.TVentaDocumentos);
    procedure AgregaVentaEfectivo(Venta: uAgregarVentaEfectivo.TVentaEfectivo);
    procedure AgregaVentaSalidaEfectivo(Venta: uAgregarVentaSalidaEfectivo.TVentaSalidaEfectivo);
    procedure AgregaVentaCheques(Venta: uAgregarVentaCheques.TVentaCheques);
    procedure AgregaVentaOtros(Venta: uAgregarVentaOtros.TVentaOtros);
    procedure EstadoDataSets(Activos: Boolean);
    procedure Calcula(Aplicar: Boolean);
    procedure ActionNuevo(Action: TBasicAction);
    procedure ActionGuardar(Action: TBasicAction);
    procedure ActionCancelar(Action: TBasicAction);
    procedure ActionBuscar(Action: TBasicAction);
    procedure ActionImprimir(Action: TBasicAction);
    procedure ActionCerrar(Action: TBasicAction);
    procedure GestionaIngreso(Parametros: LibraryIngresos_Intf.TParametrosBI);
    procedure AbreCorte(FECHA: DATETIME);
    function CualValor(Nombre: String; Valores: TValores): Real;
    procedure ValoresCabecera;
    function IDTIPOSDEVALORESINGRESOS: String;
    procedure CreaEncargado;
    procedure AgregaValor(Nombre: String; Valor: Real; var Valores: TValores);
    function BuscarCliente: TDatosBusqueda;
    function BuscarProducto: Integer;
  protected
    procedure RegisterActions; override;
  public
    { Public declarations }
     procedure UpdateActionsState; override;
  end;

var
  frmIngresosXfecha: TfrmIngresosXfecha;

implementation
uses Modules, uDM, uDMCistemGas, uDMFlotillas, dmImagenes, dmActions, ufrmPantallaParametros,
UtileriasComun, uTurnoxFecha;

{$R *.dfm}

procedure TfrmIngresosXfecha.AbreCorte(FECHA: DATETIME);
var
  S: String;
  P: TParametros;
  P2: TParametrosF;
begin
  cdsConsumos.Close;

  if FECHAINGRESO > 0 then
  begin
  Try
  P2:= TParametrosF.Create;
  DMCistemGas.ConectaServer(DM.NumeroEstacion);
  DMFlotillas.ConectaServer(DM.NumeroEstacion);
  
  P2.FechaIni := FECHA;
  P2.EstacionIni:= DM.NumeroEstacion;

  P:= TParametros.Create;
  P.FechaIni:= FECHA;

  if DM.VERSIONVOLUMETRICO = 'STANDARD' then
  BEGIN
  S:= 'SELECT  SecuenciaVenta as  TramaID,'+
      'PosicionCarga as BombaID,'+
      'Cantidad as Volumen, ProductoID, Precio, Importe, Tarjeta as Referencia, '+
      'CLIENTE.NOMBRE AS NOMBRECLIENTE, VEHICULO.NOMBRE AS NOMBREVEHICULO '+
      'FROM  Consumo INNER JOIN '+
      'CLIENTE ON CLIENTE.CLIENTEID = CONSUMO.CLIENTEID INNER JOIN '+
      'VEHICULO ON VEHICULO.VEHICULOID = CONSUMO.VEHICULOID '+
      'WHERE (DAY(FechaCarga) = DAY(@FechaIni)) AND (MONTH(FECHACARGA) = MONTH(@FechaIni)) AND '+
      '(YEAR(FECHACARGA) = YEAR(@FechaIni))and(EstacionID = @EstacionIni)';
  rdaConsumos.GetDataCall.ParamByName('SQL').AsString:=S;
  rdaConsumos.GetDataCall.ParamByName('Parametros').AsComplexType:= P2;
  cdsConsumos.Open;

  S:= 'SELECT TOP 1 PRODUCTO.PRODUCTOID, PRODUCTO.NOMBRE, PRODUCTO.PRECIO, PRODUCTO.IEPS, '+
      'PRODUCTO.IMPUESTO FROM TRAMA INNER JOIN PRODUCTO ON PRODUCTO.PRODUCTOID = TRAMA.PRODUCTOID '+
      'WHERE MONTH(FECHACARGA) = MONTH(@FECHAINI) AND DAY(FECHACARGA)= DAY(@FECHAINI) AND YEAR(FECHACARGA) = YEAR(@FECHAINI)';
  rdaHorasCortes.GetDataCall.ParamByName('SQL').AsString:=S;
  rdaHorasCortes.GetDataCall.ParamByName('Parametros').AsComplexType:= P;
  cdsHorasCortes.Open;

  END;

  if DM.VERSIONVOLUMETRICO = 'IMPI' then
  BEGIN
  S:= 'SELECT  SecuenciaVenta as  TramaID,'+
      'PosicionCarga as BombaID,'+
      'Cantidad as Volumen, ProductoID, Precio, Importe, Tarjeta as Referencia, '+
      'CLIENTE.NOMBRE AS NOMBRECLIENTE, VEHICULO.NOMBRE AS NOMBREVEHICULO '+
      'FROM  Consumo INNER JOIN '+
      'CLIENTE ON CLIENTE.CLIENTEID = CONSUMO.CLIENTEID INNER JOIN '+
      'VEHICULO ON VEHICULO.VEHICULOID = CONSUMO.VEHICULOID '+
      'WHERE (DAY(FechaCarga) = DAY(@FechaIni)) AND (MONTH(FECHACARGA) = MONTH(@FechaIni)) AND '+
      '(YEAR(FECHACARGA) = YEAR(@FechaIni))and(EstacionID = @EstacionIni)';
  rdaConsumos.GetDataCall.ParamByName('SQL').AsString:=S;
  rdaConsumos.GetDataCall.ParamByName('Parametros').AsComplexType:= P2;
  cdsConsumos.Open;

   S:= 'SELECT PRODUCTO.PRODUCTOID, PRODUCTO.NOMBRE, PRODUCTO.PRECIO, PRODUCTO.IEPS, '+
       'PRODUCTO.IMPUESTO FROM TRAMA INNER JOIN PRODUCTO ON PRODUCTO.PRODUCTOID = TRAMA.PRODUCTOID '+
       'WHERE MONTH(FECHACARGA) = MONTH(@FECHAINI) AND DAY(FECHACARGA)= DAY(@FECHAINI) AND YEAR(FECHACARGA) = YEAR(@FECHA)';
  rdaHorasCortes.GetDataCall.ParamByName('SQL').AsString:=S;
  rdaHorasCortes.GetDataCall.ParamByName('Parametros').AsComplexType:= P;
  cdsHorasCortes.Open;  
  END;

  Finally
    P.Free;
    P2.Free;
  End;
  end;
end;

procedure TfrmIngresosXfecha.ActionBuscar(Action: TBasicAction);
begin

end;

procedure TfrmIngresosXfecha.ActionCancelar(Action: TBasicAction);
begin
  pgcConceptos.ActivePageIndex:=0;
  EstadoDataSets(False);
  cxGroupBox1.Enabled:= False;
  cxGroupBox3.Enabled:= False;
  pgcConceptos.Enabled:= False;
  Panel1.Enabled:= False;
end;

procedure TfrmIngresosXfecha.ActionCerrar(Action: TBasicAction);
begin
  if cdsIngresos.RecordCount > 0 then
  begin
    cdsIngresos.Edit;
    cdsIngresos.FieldByName('TERMINADA').AsBoolean:= True;
    cdsIngresos.Post;
    cdsIngresos.ApplyUpdates();
  end;
end;

procedure TfrmIngresosXfecha.ActionGuardar(Action: TBasicAction);
begin
  cdsIngresos.ApplyUpdates();
  cdsEncargadoIngreso.ApplyUpdates();
  cdsDetalleIngreso.ApplyUpdates();
end;

procedure TfrmIngresosXfecha.ActionImprimir(Action: TBasicAction);
var
  Aux: TReporteBI;
begin

  DM.Parametros.NumeroEstacion:= DM.NumeroEstacion;
  DM.Parametros.FechaIni:= dtpFecha.EditValue;

  Aux:= DM.Servidor.BuscarReporte('INGRESOS FECHA');
  if Aux <> nil then
  begin
    DM.Imprimir(Aux.SQL1, Aux.SQL2, Aux.Template, 'INGRESO DEL TURNO', Aux.CampoJoin);
    Aux.Free;
  end;
end;

procedure TfrmIngresosXfecha.ActionNuevo(Action: TBasicAction);
var
  Parametros: LibraryIngresos_Intf.TParametrosBI;
begin
  inherited;
  pgcConceptos.ActivePageIndex:=0;
  ListaTickets.Clear;

  Parametros:=ObtenParametros('O', 'Fecha del Corte');
  if Parametros <> nil then
  begin
    GestionaIngreso(Parametros);
  end;
end;

procedure TfrmIngresosXfecha.AgregaValor(Nombre: String; Valor: Real;
  var Valores: TValores);
var
  j: Integer;
  Ok: Boolean;
begin
  Ok:=False;
  for j := 1 to MaximoValores do
  begin
    if Uppercase(Valores[j].Nombre) = Uppercase(Nombre) then
    begin
      Valores[j].Valor:=Valores[j].Valor + Valor;
      Ok:=True;
      Break;
    end;
  end;
  if not Ok then
  begin
    for j := 1 to MaximoValores do
    begin
      if Valores[j].Nombre = '' then
      begin
        Valores[j].Nombre:=Nombre;
        Valores[j].Valor:=Valor;
        Break;
      end;
    end;
  end;
end;

procedure TfrmIngresosXfecha.AgregaVenta(Venta: uAgregarVenta.TVenta);
begin
  cdsTipoComprobacion.Filtered:=False;
  cdsTipoComprobacion.Locate('IDTIPOCOMPROBACION', 1, []);
  cdsDetalleIngreso.Append;
  cdsDetalleIngreso.FieldByName('Cantidad').AsFloat:= Venta.CANTIDAD;
  cdsDetalleIngreso.FieldByName('Importe').AsFloat:= Venta.IMPORTE;
  cdsDetalleIngreso.FieldByName('IDTIPOCOMPROBACION').AsInteger:= 1;
  cdsDetalleIngreso.FieldByName('PRECIO').AsFloat:= Venta.PRECIO;
  cdsDetalleIngreso.FieldByName('IDPRODUCTO').AsInteger:=Venta.IDPRODUCTO;
  cdsDetalleIngreso.FieldByName('DESCRIPCION').AsString:=cdsTipoComprobacion.FieldByName('DESCRIPCION').AsString;
  cdsDetalleIngreso.FieldByName('TICKET').AsString:= Venta.NUMTICKET;
  cdsDetalleIngreso.Post;
end;

procedure TfrmIngresosXfecha.AgregaVentaCheques(
  Venta: uAgregarVentaCheques.TVentaCheques);
begin
  cdsTipoComprobacion.Filtered:=False;
  cdsTipoComprobacion.Locate('IDTIPOCOMPROBACION', 8, []);
  cdsDetalleIngreso.Append;
  cdsDetalleIngreso.FieldByName('Cantidad').AsFloat:= Venta.CANTIDAD;
  cdsDetalleIngreso.FieldByName('Importe').AsFloat:= Venta.IMPORTE;
  cdsDetalleIngreso.FieldByName('IDTIPOCOMPROBACION').AsInteger:= 8;
  cdsDetalleIngreso.FieldByName('DESCRIPCION').AsString:= Venta.REFERENCIA;
  cdsDetalleIngreso.FieldByName('IDBANCO').AsInteger:= Venta.IDBANCO;
  cdsDetalleIngreso.FieldByName('IDCLIENTE').AsInteger:= Venta.IDCLIENTE;
  cdsDetalleIngreso.FieldByName('CLIENTE').AsString:= Venta.NOMBRECLIENTE;

  cdsDetalleIngreso.Post;
end;

procedure TfrmIngresosXfecha.AgregaVentaCreditoDebitoCupones(Venta: uAgregarVentaCreditoDebitosCupones.TVentaCreditoDebitosCupones);
begin
  cdsTipoComprobacion.Filtered:=False;
  cdsTipoComprobacion.Locate('IDTIPOCOMPROBACION', 10, []);
  cdsDetalleIngreso.Append;
  cdsDetalleIngreso.FieldByName('Cantidad').AsFloat:= Venta.CANTIDAD;
  cdsDetalleIngreso.FieldByName('Importe').AsFloat:= Venta.IMPORTE;
  cdsDetalleIngreso.FieldByName('IDTIPOCOMPROBACION').AsInteger:= 10;
  cdsDetalleIngreso.FieldByName('PRECIO').AsFloat:= Venta.PRECIO;
  cdsDetalleIngreso.FieldByName('IDPRODUCTO').AsInteger:=Venta.IDPRODUCTO;
  cdsDetalleIngreso.FieldByName('DESCRIPCION').AsString:= Venta.REFERENCIA;
  cdsDetalleIngreso.FieldByName('TICKET').AsString:= Venta.NUMTICKET;
  cdsDetalleIngreso.FieldByName('IDCLIENTE').AsInteger:= Venta.IDCLIENTE;
  cdsDetalleIngreso.FieldByName('CLIENTE').AsString:= Venta.NOMBRECLIENTE;

  cdsDetalleIngreso.Post;
end;

procedure TfrmIngresosXfecha.AgregaVentaDocumentos(
  Venta: uAgregarVentaDocumentos.TVentaDocumentos);
begin
  cdsTipoComprobacion.Filtered:=False;
  cdsTipoComprobacion.Locate('IDTIPOCOMPROBACION', 9, []);
  cdsDetalleIngreso.Append;
  cdsDetalleIngreso.FieldByName('Cantidad').AsFloat:= Venta.CANTIDAD;
  cdsDetalleIngreso.FieldByName('Importe').AsFloat:= Venta.IMPORTE;
  cdsDetalleIngreso.FieldByName('IDTIPOCOMPROBACION').AsInteger:= 9;
  cdsDetalleIngreso.FieldByName('PRECIO').AsFloat:= Venta.PRECIO;
  cdsDetalleIngreso.FieldByName('IDPRODUCTO').AsInteger:=Venta.IDPRODUCTO;
  cdsDetalleIngreso.FieldByName('DESCRIPCION').AsString:= Venta.REFERENCIA;
  cdsDetalleIngreso.FieldByName('TICKET').AsString:= Venta.NUMTICKET;
  cdsDetalleIngreso.FieldByName('IDCLIENTE').AsInteger:= Venta.IDCLIENTE;
  cdsDetalleIngreso.FieldByName('CLIENTE').AsString:= Venta.NOMBRECLIENTE;

  cdsDetalleIngreso.Post;
end;

procedure TfrmIngresosXfecha.AgregaVentaEfectivo(
  Venta: uAgregarVentaEfectivo.TVentaEfectivo);
begin
  cdsTipoComprobacion.Filtered:=False;
  cdsTipoComprobacion.Locate('IDTIPOCOMPROBACION', Venta.IDTIPOCOMPROBACION, []);
  cdsDetalleIngreso.Append;
  cdsDetalleIngreso.FieldByName('Cantidad').AsFloat:= Venta.CANTIDAD;
  cdsDetalleIngreso.FieldByName('Importe').AsFloat:= Venta.IMPORTE;
  cdsDetalleIngreso.FieldByName('IDTIPOCOMPROBACION').AsInteger:= Venta.IDTIPOCOMPROBACION;
  cdsDetalleIngreso.FieldByName('DESCRIPCION').AsString:= Venta.DESCRIPCION;

  cdsDetalleIngreso.Post;
end;

procedure TfrmIngresosXfecha.AgregaVentaOtros(
  Venta: uAgregarVentaOtros.TVentaOtros);
begin
  cdsTipoComprobacion.Filtered:=False;
  cdsTipoComprobacion.Locate('IDTIPOCOMPROBACION', 12, []);
  cdsDetalleIngreso.Append;
  cdsDetalleIngreso.FieldByName('Cantidad').AsFloat:= Venta.CANTIDAD;
  cdsDetalleIngreso.FieldByName('Importe').AsFloat:= Venta.IMPORTE;
  cdsDetalleIngreso.FieldByName('IDTIPOCOMPROBACION').AsInteger:= 12;
  cdsDetalleIngreso.FieldByName('DESCRIPCION').AsString:= Venta.REFERENCIA;
  cdsDetalleIngreso.FieldByName('IDSALIDA').AsInteger:= Venta.IDSALIDA;
  cdsDetalleIngreso.FieldByName('TICKET').AsInteger:= Venta.NOTICKET;

  cdsDetalleIngreso.Post;
end;

procedure TfrmIngresosXfecha.AgregaVentaOtrosProductos(Venta: uAgregarOtrosProductos.TVentaOtrosProductos);
begin
  cdsTipoComprobacion.Filtered:=False;
  cdsTipoComprobacion.Locate('IDTIPOCOMPROBACION', 14, []);
  cdsDetalleIngreso.Append;
  cdsDetalleIngreso.FieldByName('CANTIDAD').AsInteger:= Venta.CANTIDAD;
  cdsDetalleIngreso.FieldByName('IMPORTE').AsFloat:= Venta.IMPORTE;
  cdsDetalleIngreso.FieldByName('IDTIPOCOMPROBACION').AsInteger:= 14;
  cdsDetalleIngreso.FieldByName('PRECIO').AsFloat:= Venta.PRECIO;
  cdsDetalleIngreso.FieldByName('DESCRIPCION').AsString:= Venta.REFERENCIA;

  cdsDetalleIngreso.Post;
end;

procedure TfrmIngresosXfecha.AgregaVentaSalidaEfectivo(
  Venta: uAgregarVentaSalidaEfectivo.TVentaSalidaEfectivo);
begin
  cdsTipoComprobacion.Filtered:=False;
  cdsTipoComprobacion.Locate('IDTIPOCOMPROBACION', 18, []);
  cdsDetalleIngreso.Append;
  cdsDetalleIngreso.FieldByName('Cantidad').AsFloat:= Venta.CANTIDAD;
  cdsDetalleIngreso.FieldByName('Importe').AsFloat:= Venta.IMPORTE;
  cdsDetalleIngreso.FieldByName('IDTIPOCOMPROBACION').AsInteger:= 18;
  cdsDetalleIngreso.FieldByName('DESCRIPCION').AsString:= Venta.DESCRIPCION;

  cdsDetalleIngreso.Post;
end;

function TfrmIngresosXfecha.BuscarCliente: TDatosBusqueda;
begin
  Result:=PantallaBusqueda(TfrmBuscarCliente,'');
end;

function TfrmIngresosXfecha.BuscarProducto: Integer;
var
  Datos: TDatosBusqueda;
begin
  Datos:=PantallaBusqueda(TfrmBuscarProducto,'');
  if Datos.OK then
  begin
  try
    Result:=Datos.Clave;
  finally
  end;
  end;
end;

procedure TfrmIngresosXfecha.Calcula(Aplicar: Boolean);
var
  I: Integer;
  s: String;
  Valores, Totales: TValores;
  Aux: Float;
begin
  for I := 1 to MaximoValores do
  begin
    Valores[I].Nombre:='';
    Valores[I].Valor:=0;
    Totales[I].Nombre:='';
    Totales[I].Valor:=0;
  end;
  cdsDetalleIngreso.Filtered:=False;
  I:=cdsEncargadoIngreso.FieldByName('IDENCARGADOINGRESOS').AsInteger;
  cdsDetalleIngreso.First;
  while not cdsDetalleIngreso.EOF do
  begin
    AgregaValor(cdsDetalleIngreso.FieldByName('IDTIPOCOMPROBACION').AsString, cdsDetalleIngreso.FieldByName('Importe').AsFloat, Totales);
    if cdsDetalleIngreso.FieldByName('IDENCARGADOINGRESOS').AsInteger = I then
      AgregaValor(cdsDetalleIngreso.FieldByName('IDTIPOCOMPROBACION').AsString, cdsDetalleIngreso.FieldByName('Importe').AsFloat, Valores);
    cdsDetalleIngreso.Next;
  end;
  LEVenta.EditValue:=CualValor('1', Valores);
  LEfectivo.EditValue:=CualValor('6', Valores) + CualValor('7', Valores);
  LClientes.EditValue:=CualValor('9', Valores);
  LCheques.EditValue:=CualValor('8', Valores);
  LTarjetasYCupones.EditValue:=CualValor('10', Valores) + CualValor('11', Valores);
  LOtros.EditValue:=CualValor('12', Valores);
  LOtrosProductos.EditValue:=CualValor('14', Valores);
  LFaltantes.EditValue:=CualValor('16', Valores);
  LSobrantes.EditValue:=CualValor('17', Valores);

  if Aplicar then
  begin
    cdsEncargadoIngreso.Edit;
    Aux:=CualValor('1', Valores) + CualValor('14', Valores) + CualValor('16', Valores);
    cdsEncargadoIngreso.FieldByName('Importe').AsFloat:=Decimales(Aux, 2);
    Aux:=CualValor('6', Valores) + CualValor('7', Valores) + CualValor('9', Valores) + CualValor('8', Valores) + CualValor('10', Valores) + CualValor('11', Valores) + CualValor('12', Valores) + CualValor('17', Valores);
    cdsEncargadoIngreso.FieldByName('Entregado').AsFloat:=Decimales(Aux, 2);
    Aux:=cdsEncargadoIngreso.FieldByName('Entregado').AsFloat - cdsEncargadoIngreso.FieldByName('Importe').AsFloat;
    cdsEncargadoIngreso.FieldByName('Diferencia').AsFloat:=Decimales(Aux, 2);
    cdsEncargadoIngreso.Post;
    if cdsIngresos.State = dsBrowse then
      cdsIngresos.Edit;
    Aux:=CualValor('1', Valores) + CualValor('14', Valores) + CualValor('16', Valores);
    cdsIngresos.FieldByName('VENTATOTAL').AsFloat:=Decimales(Aux, 2);
    Aux:=CualValor('6', Valores) + CualValor('7', Valores) + CualValor('9', Valores) + CualValor('8', Valores) + CualValor('10', Valores) + CualValor('11', Valores) + CualValor('12', Valores) + CualValor('17', Valores);
    cdsIngresos.FieldByName('EFECTIVOENTREGADO').AsFloat:= Decimales(Aux, 2);
    Aux:=cdsIngresos.FieldByName('EFECTIVOENTREGADO').AsFloat - cdsIngresos.FieldByName('VENTATOTAL').AsFloat;
    cdsIngresos.FieldByName('DIFERENCIA').AsFloat:=Decimales(Aux, 2);
  end;

  if cdsIngresos.State = dsBrowse then cdsIngresos.Edit;  
  cdsIngresos.FieldByName('VENTATOTAL').AsFloat:= CualValor('1', Valores) + CualValor('14', Valores) + CualValor('16', Valores);;
  cdsIngresos.FieldByName('EFECTIVOENTREGADO').AsFloat:= CualValor('6', Valores) + CualValor('7', Valores) + CualValor('9', Valores) + CualValor('8', Valores) + CualValor('10', Valores) + CualValor('11', Valores) + CualValor('12', Valores) + CualValor('17', Valores);
  cdsIngresos.FieldByName('SALIDAEFECTIVO').AsFloat:= CualValor('18',Valores);
  cdsIngresos.FieldByName('DIFERENCIA').AsFloat:= cdsIngresos.FieldByName('EFECTIVOENTREGADO').AsFloat - cdsIngresos.FieldByName('VENTATOTAL').AsFloat;

  LEntregado.EditValue:= LEfectivo.EditValue+ LClientes.EditValue + LCheques.EditValue +
                         LTarjetasyCupones.EditValue + LOtros.EditValue + LFaltantes.EditValue;
  LVentaTot.EditValue:= LEVenta.EditValue + LOtrosProductos.EditValue + LSobrantes.EditValue;

  LTotCreditoDebitoCupones.EditValue:= CualValor('10', Valores) + CualValor('11', Valores) + CualValor('9', Valores);

  LDiferencia.EditValue:= cdsIngresos.FieldByName('EFECTIVOENTREGADO').AsFloat - cdsIngresos.FieldByName('VENTATOTAL').AsFloat;
  if LDiferencia.EditValue < 0 then
  begin
     LDiferencia.EditValue:=  LDiferencia.EditValue * -1;
     LDiferencia.Style.Color:= clRed;
     cxGroupBox5.Caption:= 'Diferencia (Faltante)';
  end
  else
  begin
     LDiferencia.Style.Color:= clGreen;
     cxGroupBox5.Caption:= 'Diferencia (Sobrante)';
  end;

  if pgcConceptos.ActivePageIndex in [0..8] then
  begin
    case pgcConceptos.ActivePageIndex of
      0: s:='IDTIPOCOMPROBACION = ''0''';
      1: s:='IDTIPOCOMPROBACION = ''1''';
      2: s:='IDTIPOCOMPROBACION = ''10'' OR IDTIPOCOMPROBACION = ''11''';
      3: s:='IDTIPOCOMPROBACION = ''14''';
      4: s:='IDTIPOCOMPROBACION = ''9''';
      5: s:='IDTIPOCOMPROBACION = ''6'' OR IDTIPOCOMPROBACION = ''7''';
      6: s:='IDTIPOCOMPROBACION = ''18''';
      7: s:='IDTIPOCOMPROBACION = ''8''';
      8: s:='IDTIPOCOMPROBACION = ''12''';
      9: s:='IDTIPOCOMPROBACION = ''FALTANTES'' OR GRUPO = ''SOBRANTES'' OR GRUPO = ''PENDIENTE AUTORIZAR''';
      10: s:='IDTIPOCOMPROBACION = ''OK''';
  end;

  //ELIMINAR SECCION SOLO CONSERVO PARA ACLARAR LO QUE HACIA AQUI---------------
  cdsDetalleIngreso.Filtered:=False;
  cdsDetalleIngreso.Filter:=s + ' AND IDENCARGADOINGRESOS = ' + IntToStr(I);;
  cdsDetalleIngreso.Filtered:=True;
  end;
end;

procedure TfrmIngresosXfecha.CantidadPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;
  cdsDetalleIngreso.FieldByName('Cantidad').AsFloat:=DisplayValue;
  cdsDetalleIngreso.FieldByName('Importe').AsFloat:=Decimales(cdsDetalleIngreso.FieldByName('Cantidad').AsFloat*
                                                    cdsDetalleIngreso.FieldByName('Precio').AsFloat, 2);
end;

procedure TfrmIngresosXfecha.cbDepartamentoPropertiesChange(Sender: TObject);
begin
  inherited;
  if not cdsEncargadoIngreso.Active then
    Exit;

  if (cdsEncargadoIngreso.Locate('IDAGRUPACION', cbDepartamento.EditValue, [])) then
  begin
    pgcConceptos.ActivePageIndex:=0;
    Calcula(True);
  end
  else
  begin

  end;
end;

procedure TfrmIngresosXfecha.cdsDetalleIngresoAfterDelete(DataTable: TDADataTable);
begin
  inherited;
  Calcula(True);
  UpdateActionsState;
end;

procedure TfrmIngresosXfecha.cdsDetalleIngresoAfterPost(DataTable: TDADataTable);
begin
  inherited;
  Calcula(True);

  cdsIngresos.Edit;
  UpdateActionsState;
end;

procedure TfrmIngresosXfecha.cdsDetalleIngresoBeforePost(DataTable: TDADataTable);
begin
  inherited;
  //Calcula(False);
end;

procedure TfrmIngresosXfecha.cdsDetalleIngresoIDCLIENTEValidate(
  Sender: TDACustomField);
begin
  inherited;
  if (cdsDetalleIngreso.FieldByName('IDCLIENTE').AsInteger <> 0) then
  begin
    MiClienteID:=cdsDetalleIngreso.FieldByName('IDCLIENTE').AsInteger;
    if cdsClientes.Locate('IDCLIENTE', MiClienteID, []) then begin
       cdsDetalleIngreso.FieldByName('Descripcion').AsString:=cdsClientes.FieldByName('Nombre').AsString;
    end;
  end;
end;

procedure TfrmIngresosXfecha.cdsDetalleIngresoNewRecord(DataTable: TDADataTable);
begin
  inherited;
  cdsDetalleIngreso.FieldByName('IDDETALLEINGRESOS').AsInteger:=DM.Servidor.Folio('IDDETALLEINGRESOS', '');
  cdsDetalleIngreso.FieldByName('IDENCARGADOINGRESOS').AsInteger:=cdsEncargadoIngreso.FieldByName('IDENCARGADOINGRESOS').AsInteger;
  cdsDetalleIngreso.FieldByName('IDTIPOCOMPROBACION').AsInteger:= IDTIPOVALOR;
  cdsDetalleIngreso.FieldByName('IMPORTE').AsInteger:=0;
  cdsDetalleIngreso.FieldByName('CANTIDAD').AsInteger:=0;
  cdsDetalleIngreso.FieldByName('TICKET').AsInteger:=0;
  cdsDetalleIngreso.FieldByName('CLIENTE').AsString:='';
  cdsDetalleIngreso.FieldByName('VEHICULO').AsString:='';
  cdsDetalleIngreso.FieldByName('IDCLIENTE').AsInteger:=0;
  cdsDetalleIngreso.FieldByName('IDPRODUCTO').AsInteger:=0;
  cdsDetalleIngreso.FieldByName('COSTO').AsFloat:=0;
  cdsDetalleIngreso.FieldByName('PUNTOS').AsInteger := 0;
  cdsDetalleIngreso.FieldByName('NUMEROESTACION').AsInteger := DM.NumeroEstacion;

  UpdateActionsState;
end;

procedure TfrmIngresosXfecha.cdsEncargadoIngresoAfterScroll(
  DataTable: TDADataTable);
begin
  inherited;
  if not HacerScroll then
    Exit;

  if cdsEncargadoIngreso.Active then
  begin
    cbEncargado.EditValue:=cdsEncargadoIngreso.FieldByName('IDEMPLEADO').AsInteger;
    cbDepartamento.Editvalue:=cdsEncargadoIngreso.FieldByName('IDAGRUPACION').AsInteger;
  end
  else
  begin
    cbEncargado.EditValue:='';
    cbDepartamento.Editvalue:='';
  end;
end;

procedure TfrmIngresosXfecha.CreaEncargado;
var
  AgrupacionID: Integer;
begin
  cdsAgrupacion.First;
  while not cdsAgrupacion.EOF do
  begin
    AgrupacionID:=cdsAgrupacion.FieldByName('AgrupacionID').AsInteger;
    cdsEncargadoIngreso.Append;
    cdsEncargadoIngreso.FieldByName('IDENCARGADOINGRESOS').AsInteger:=DM.Servidor.Folio('IDENCARGADOINGRESOS', '');
    cdsEncargadoIngreso.FieldByName('IDEMPLEADO').AsInteger:=0;
    cdsEncargadoIngreso.FieldByName('IDINGRESO').AsInteger:=cdsIngresos.FieldByName('IDINGRESO').AsInteger;
    cdsEncargadoIngreso.FieldByName('IDAGRUPACION').AsInteger:=AgrupacionID;
    cdsEncargadoIngreso.FieldByName('IMPORTE').AsInteger:=0;
    cdsEncargadoIngreso.FieldByName('ENTREGADO').AsInteger:=0;
    cdsEncargadoIngreso.FieldByName('DIFERENCIA').AsInteger:=0;
    cdsEncargadoIngreso.Post;
    cdsAgrupacion.Next;
  end;

  {cdsEncargadoIngreso.Append;
  cdsEncargadoIngreso.FieldByName('IDENCARGADOINGRESOS').AsInteger:=DM.Servidor.Folio('IDENCARGADOINGRESOS', '');
  cdsEncargadoIngreso.FieldByName('IDEMPLEADO').AsInteger:=0;
  cdsEncargadoIngreso.FieldByName('IDINGRESO').AsInteger:=cdsIngresos.FieldByName('IDINGRESO').AsInteger;
  cdsEncargadoIngreso.FieldByName('OBSERVACIONES').AsString:='';
  cdsEncargadoIngreso.Post;}
end;

function TfrmIngresosXfecha.CualValor(Nombre: String; Valores: TValores): Real;
var
  I: Integer;
begin
  Result:=0;
  for I := 1 to MaximoValores do
  begin
    if Uppercase(Valores[I].Nombre) = Uppercase(Nombre) then
    begin
      Result:=Valores[I].Valor;
      Break;
    end;
  end;
end;

procedure TfrmIngresosXfecha.cxButton1Click(Sender: TObject);
var
  Venta: uAgregarVenta.TVenta;
begin
  inherited;
  Venta:= Abrir_ModuloAgregarVenta(DM.NumeroEstacion);

  //AGREGAR CODIGO PARA AGREGAR LA VENTA A DETALLEINGRESOS--------------------//
  if Venta.OK then
  AgregaVenta(Venta);
end;

procedure TfrmIngresosXfecha.cxButton2Click(Sender: TObject);
var
  Venta: uAgregarVentaCreditoDebitosCupones.TVentaCreditoDebitosCupones;
begin
  inherited;
  Venta:= Abrir_ModuloAgregarVentaCreditoDebitosCupones(DM.NumeroEstacion);

  //AGREGAR CODIGO PARA AGREGAR LA VENTA A DETALLEINGRESOS--------------------//
  if Venta.OK then
  AgregaVentaCreditoDebitoCupones(Venta);
end;

procedure TfrmIngresosXfecha.cxButton3Click(Sender: TObject);
var
  Venta: uAgregarOtrosProductos.TVentaOtrosProductos;
begin
  inherited;
  Venta:= Abrir_ModuloAgregarVentaOtrosProductos(DM.NumeroEstacion);

  //AGREGAR CODIGO PARA AGREGAR LA VENTA A DETALLEINGRESOS--------------------//
  if Venta.OK then
  AgregaVentaOtrosProductos(Venta);
end;

procedure TfrmIngresosXfecha.cxButton4Click(Sender: TObject);
var
  Venta: uAgregarVentaDocumentos.TVentaDocumentos;
begin
  inherited;
  Venta:= Abrir_ModuloAgregarVentaDocumentos(DM.NumeroEstacion);

  //AGREGAR CODIGO PARA AGREGAR LA VENTA A DETALLEINGRESOS------------------//
  if Venta.OK then
  AgregaVentaDocumentos(Venta);
end;

procedure TfrmIngresosXfecha.cxButton5Click(Sender: TObject);
var
  Venta: uAgregarVentaEfectivo.TVentaEfectivo;
begin
  inherited;
  Venta:= Abrir_ModuloAgregarVentaEfectivo(DM.NumeroEstacion);

  //AGREGAR CODIGO PARA AGREGAR LA VENTA A DETALLEINGRESOS------------------//
  if Venta.OK then
  AgregaVentaEfectivo(Venta);
end;

procedure TfrmIngresosXfecha.cxButton6Click(Sender: TObject);
var
  Venta: uAgregarVentaSalidaEfectivo.TVentaSalidaEfectivo;
begin
  inherited;
  Venta:= Abrir_ModuloAgregarVentaSalidaEfectivo(DM.NumeroEstacion);

  //AGREGAR CODIGO PARA AGREGAR LA VENTA A DETALLEINGRESOS------------------//
  if Venta.OK then
  AgregaVentaSalidaEfectivo(Venta);
end;

procedure TfrmIngresosXfecha.cxButton7Click(Sender: TObject);
var
  Venta: uAgregarVentaCheques.TVentaCheques;
begin
  inherited;
  Venta:= Abrir_ModuloAgregarVentaCheques(DM.NumeroEstacion);

  //AGREGAR CODIGO PARA AGREGAR LA VENTA A DETALLEINGRESOS------------------//
  if Venta.OK then
  AgregaVentaCheques(Venta);
end;

procedure TfrmIngresosXfecha.cxButton8Click(Sender: TObject);
var
  Venta: uAgregarVentaOtros.TVentaOtros;
begin
  inherited;
  Venta:= Abrir_ModuloAgregarVentaOtros(DM.NumeroEstacion);

  //AGREGAR CODIGO PARA AGREGAR LA VENTA A DETALLEINGRESOS------------------//
  if Venta.OK then
  AgregaVentaOtros(Venta);
end;

procedure TfrmIngresosXfecha.cxGridDBTableView1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F2 then
  begin
    cdsDetalleIngreso.Edit;
    cdsDetalleIngreso.FieldByName('IDPRODUCTO').AsInteger:=BuscarProducto;
  end;
  cdsProductos.Locate('IDPRODUCTO',cdsDetalleIngreso.FieldByName('IDPRODUCTO').AsInteger,[]);
  cdsDetalleIngreso.FieldByName('PRECIO').AsFloat:= cdsProductos.FieldByName('PRECIOVENTA').AsFloat;
end;

procedure TfrmIngresosXfecha.cxGridDBTableView3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Datos: TDatosBusqueda;
begin
  inherited;
  if Key = VK_F2 then
  begin
    Datos:= BuscarCliente;
    cdsDetalleIngreso.Edit;
    cdsDetalleIngreso.FieldByName('DESCRIPCION').AsString:=Datos.Nombre;
    cdsDetalleIngreso.FieldByName('IDCLIENTE').AsInteger:=Datos.Clave;
  end;
end;

procedure TfrmIngresosXfecha.dbgConceptos1DBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  Sender.OptionsSelection.CellSelect:=AFocusedRecord = nil;
end;

procedure TfrmIngresosXfecha.dsEncargadoIngresoStateChange(Sender: TObject);
begin
  inherited;
  if (cdsEncargadoIngreso.State in dsEditModes) and (cdsIngresos.State = dsBrowse) then
  begin
    cdsIngresos.Edit;
    UpdateActionsState;
  end;
end;

procedure TfrmIngresosXfecha.dsIngresosStateChange(Sender: TObject);
begin
  inherited;
  UpdateActionsState;
end;

procedure TfrmIngresosXfecha.EfectivoCantidadPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;
  if DisplayValue > 0 then
  begin
     cdsDetalleIngreso.FieldByName('TIPOCAMBIO').AsFloat:= ValorMoneda;
     cdsDetalleIngreso.FieldByName('IMPORTE').AsFloat:= DisplayValue * ValorMoneda;
     cdsDetalleIngreso.FieldByName('CANTIDAD').AsInteger:= DisplayValue;
  end;
end;

procedure TfrmIngresosXfecha.EfectivoDescripcionPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
var
  I: Integer;
begin
  inherited;
  if cdsTipoCambio.Locate('DESCRIPCION', DisplayValue, []) then begin
     for I := 0 to ValoresMoneda.Count - 1 do
     begin
       if valoresMoneda[I].IDMONEDA = cdsTipoCambio.FieldByName('IDMONEDA').AsInteger then
       begin
          ValorMoneda:= valoresMoneda[I].VALOR;
          break;
       end;
     end;
    end;
end;

procedure TfrmIngresosXfecha.EstadoDataSets(Activos: Boolean);
begin
  cdsIngresos.Active:=Activos;
  cdsDetalleIngreso.Active:=Activos;
  cdsEncargadoIngreso.Active:=Activos;

  cdsTipoComprobacion.Active:=Activos;
  cdsEmpleado.Active:=Activos;
  cdsTurno.Active:=Activos;

  cdsClientes.Active:= Activos;
  cdsProductos.Active:=Activos;
  cdsProductos.Filtered:=False;
  cdsProductos.Filter:='IDPRODUCTO > 3';
  cdsProductos.Filtered:=True;

  cdsProductosCombustibles.Active:= Activos;
  cdsProductosCombustibles.Filtered:=False;
  cdsProductosCombustibles.Filter:='IDPRODUCTO <= 3';
  cdsProductosCombustibles.Filtered:=True;

  cdsTipoCambio.Close;
  cdsTipoCambio.Open;
  cdsBanco.Close;
  cdsBanco.Open;
  cdsSalida.Close;
  cdsSalida.Open;
  if not Activos then
  begin

  end;
end;

procedure TfrmIngresosXfecha.FormCreate(Sender: TObject);
begin
  inherited;
  ListaTickets:=TStringList.Create;
  cxGroupBox1.Enabled:= False;
  Panel1.Enabled:= False;
  pgcConceptos.Enabled:= False;
end;

procedure TfrmIngresosXfecha.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Venta : uAgregarVenta.TVenta;
  VentaCreditoDebitoCupones : uAgregarVentaCreditoDebitosCupones.TVentaCreditoDebitosCupones;
  VentaOtrosProductos       : uAgregarOtrosProductos.TVentaOtrosProductos;
  VentaDocumentos           : uAgregarVentaDocumentos.TVentaDocumentos;
  VentaEfectivo             : uAgregarVentaEfectivo.TVentaEfectivo;
  VentaSalidaEfectivo       : uAgregarVentaSalidaEfectivo.TVentaSalidaEfectivo;
  VentaCheques              : uAgregarVentaCheques.TVentaCheques;
  VentaOtros                : uAgregarVentaOtros.TVentaOtros;
begin
  inherited;
  if Key = VK_F2 then
  begin
     Venta:= Abrir_ModuloAgregarVenta(DM.NumeroEstacion);
     //AGREGAR VENTA A DETALLEINGRESOS----------------------------------------//
     if Venta.OK then
     AgregaVenta(Venta);
  end;

  if Key = VK_F3 then
  begin
    VentaCreditoDebitoCupones:= Abrir_ModuloAgregarVentaCreditoDebitosCupones(DM.NumeroEstacion);

    //AGREGAR CODIGO PARA AGREGAR LA VENTA A DETALLEINGRESOS------------------//
    if VentaCreditoDebitoCupones.OK then
    AgregaVentaCreditoDebitoCupones(VentaCreditoDebitoCupones);
  end;

  if Key = VK_F4 then
  begin
    VentaOtrosProductos:= Abrir_ModuloAgregarVentaOtrosProductos(DM.NumeroEstacion);

    //AGREGAR CODIGO PARA AGREGAR LA VENTA A DETALLEINGRESOS------------------//
    if VentaOtrosProductos.OK then
    AgregaVentaOtrosProductos(VentaOtrosProductos);
  end;

  if Key = VK_F5 then
  begin
    VentaDocumentos:= Abrir_ModuloAgregarVentaDocumentos(DM.NumeroEstacion);

    //AGREGAR CODIGO PARA AGREGAR LA VENTA A DETALLEINGRESOS------------------//
    if VentaDocumentos.OK then
    AgregaVentaDocumentos(VentaDocumentos);
  end;

  if Key = VK_F6 then
  begin
    VentaEfectivo:= Abrir_ModuloAgregarVentaEfectivo(DM.NumeroEstacion);

    //AGREGAR CODIGO PARA AGREGAR LA VENTA A DETALLEINGRESOS------------------//
    if VentaDocumentos.OK then
    AgregaVentaEfectivo(VentaEfectivo);
  end;

  if Key = VK_F7 then
  begin
    VentaSalidaEfectivo:= Abrir_ModuloAgregarVentaSalidaEfectivo(DM.NumeroEstacion);

    //AGREGAR CODIGO PARA AGREGAR LA VENTA A DETALLEINGRESOS------------------//
    if VentaDocumentos.OK then
    AgregaVentaSalidaEfectivo(VentaSalidaEfectivo);
  end;

  if Key = VK_F8 then
  begin
    VentaCheques:= Abrir_ModuloAgregarVentaCheques(DM.NumeroEstacion);

    //AGREGAR CODIGO PARA AGREGAR LA VENTA A DETALLEINGRESOS------------------//
    if VentaCheques.OK then
    AgregaVentaCheques(VentaCheques);
  end;

  if Key = VK_F9 then
  begin
    VentaOtros:= Abrir_ModuloAgregarVentaOtros(DM.NumeroEstacion);

    //AGREGAR CODIGO PARA AGREGAR LA VENTA A DETALLEINGRESOS------------------//
    if VentaOtros.OK then
    AgregaVentaOtros(VentaOtros);
  end;


end;

procedure TfrmIngresosXfecha.FormShow(Sender: TObject);
begin
  inherited;
  HacerScroll:=True;
  pgcConceptos.ActivePageIndex:= 0;
  ValoresMoneda:= DM.Servidor.ObtenTipoValores(DM.NumeroEstacion, Now);
end;

procedure TfrmIngresosXfecha.GestionaIngreso(Parametros: LibraryIngresos_Intf.TParametrosBI);
var
  Fecha: TDateTime;
  S: String;

  TURNO: Integer;
  TurnoxFecha: ATTurnoxFecha;
begin
  Screen.Cursor:=crHourGlass;
  try
  Cambiando:=True;
  FECHAINGRESO:=Parametros.FechaIni;
  EstadoDataSets(False);

  //BUSCAR POR FECHA Y PRESENTAR LOS TURNOS EN ESA FECHA O DAR OPCION DE CREAR//
  //TURNO NUEVO---------------------------------------------------------------//
  TurnoxFecha:= DM.Servidor.ObtenTurnosdeFecha(FECHAINGRESO, DM.NumeroEstacion);
  Turno:= Abrir_ModuloTurnoxFecha(TurnoxFecha,FECHAINGRESO);
  if Turno > 0 then
  begin
     cxGroupBox1.Enabled:= True;
     cxGroupBox3.Enabled:= True;
     pgcConceptos.Enabled:= True;
     Panel1.Enabled:= True;
  end;
  //////////////////////////////////////////////////////////////////////////////

  cdsIngresos.Close;
  cdsIngresos.ParamByName('IDTURNO').AsInteger:=Turno;
  cdsIngresos.ParamByName('NUMEROESTACION').AsInteger:= DM.NumeroEstacion;
  cdsIngresos.Open;

  cdsAgrupacion.Close;
  cdsAgrupacion.ParamByName('IDESTACION').AsInteger:=DM.NumeroEstacion;
  cdsAgrupacion.Open;
  cdsAgrupacionCajas.Close;
  cdsAgrupacionCajas.ParamByName('IDESTACION').AsInteger:=DM.NumeroEstacion;
  cdsAgrupacionCajas.Open;

  cdsEncargadoIngreso.ParamByName('IDINGRESO').AsInteger:=cdsIngresos.FieldByName('IDINGRESO').AsInteger;
  cdsDetalleIngreso.ParamByName('IDINGRESO').AsInteger:=cdsIngresos.FieldByName('IDINGRESO').AsInteger;
  cdsEncargadoIngreso.Filtered:=False;
  cdsDetalleIngreso.Filtered:=False;

  //TurnoEstacion := DM.ServidorEstacion(DM.Estacion).TurnoActual;
  EstadoDataSets(True);
  if cdsIngresos.RecordCount = 0 then
  begin
    //----------------PROCESO PARA OBTENER LA VENTA DESDE LA CACETA DE VENTA--//
    //Aux:=DM.ServidorEstacion(DM.Estacion).TotalesBomba(LiquidacionID);
    //------------------------------------------------------------------------//

    //S:= IDTIPOSDEVALORESINGRESOS;
    //if S <> '' then begin
    //   Showmessage('AUN NO SE DEFINEN LOS SIGUENTES TIPOS DE VALORES'+#13#10+S+'<<DEFINA ESTOS ANTES DE CAPTURAR INGRESOS>>'); Exit;
    //end;

    //AbreCorte(FECHAINGRESO); NO SE UTILIZARA BUSCAR UN USO--------------------
    //----------------------------------------------------------
    try
        Fecha:=Trunc(FECHAINGRESO);
        dtpFecha.Date:= FECHAINGRESO;

        cdsIngresos.Append;
        cdsIngresos.FieldByName('IDINGRESO').AsInteger:=DM.Servidor.Folio('IDINGRESOS', '');
        cdsIngresos.FieldByName('FECHA').AsDateTime:=Fecha;
        cdsIngresos.FieldByName('EJERCICIO').AsString:=FormatDateTime('yyyy', Fecha);
        cdsIngresos.FieldByName('PERIODO').AsString:=FormatDateTime('m', Fecha);
        cdsIngresos.FieldByName('DIA').AsString:=FormatDateTime('d', Fecha);
        cdsIngresos.FieldByName('TERMINADA').AsBoolean:=False;
        cdsIngresos.FieldByName('IDTURNO').AsInteger:=-1;
        cdsIngresos.FieldByName('NUMEROESTACION').AsInteger:=DM.NumeroEstacion;
        //cdsIngresos.FieldByName('INICIOTURNO').AsDateTime:= ;
        //cdsIngresos.FieldByName('FINTURNO').AsDateTime:= ;

        edtSecuencia.EditValue:= 0;
        CreaEncargado;
        //if Aux.Corte[0].BombaID > 0 then
        //begin
          //ProcesaValoresCorte(Aux);
          //CalculaImportes(True);
        //end;
          //--llamar a valorescabecera--//
          Calcula(True);
        //cdsDespachadorLiquidacion.First;
        //cbIsla.EditValue:=cdsDespachadorLiquidacion.FieldByName('AgrupacionID').AsInteger;
        ValoresCabecera;

        IDTIPOVALOR:= ESCOMBUSTIBLE;
        s:= 'IDTIPOCOMPROBACION = '''+ INTTOSTR(ESCOMBUSTIBLE) +'''';
        pgcConceptos.ActivePageIndex:= 0;
        cdsDetalleIngreso.Filtered:=False;
        cdsDetalleIngreso.Filter:=s;
        cdsDetalleIngreso.Filtered:=True;

        cdsEncargadoIngreso.First;
        UpdateActionsState;
    finally

    end;
  end
  else
  begin
  if cdsIngresos.FieldByName('TERMINADA').AsBoolean then
  begin
    if DM.Seguridad.SeguridadPorNombre('Re-Abre Cortes Terminados') = nil then
    begin
      cdsIngresos.Close;
      cdsDetalleIngreso.Close;
      cdsEncargadoIngreso.Close;
      ShowMessage('SU USUARIO NO TIENE PERMISO DE RE-ABRIR CORTES YA CONCLUIDOS');
      Exit;
    end
  end;

  cdsDetalleIngreso.Filtered:=False;
  cdsDetalleIngreso.First;
  while not cdsDetalleIngreso.EOF do
  begin
    if cdsDetalleIngreso.FieldByName('Ticket').AsString <> '' then
      ListaTickets.Add(cdsDetalleIngreso.FieldByName('Ticket').AsString);
    cdsDetalleIngreso.Next;
  end;
  //ListaTickets.Text:=DM.Servidor.TicketsLiquidacion(cdsLiquidacion.FieldByName('LiquidacionID').AsInteger);

  tInicio.Time:= cdsIngresos.FieldByName('INICIOTURNO').AsDateTime;
  tFin.Time:= cdsIngresos.FieldByName('FINTURNO').AsDateTime;
  edtSecuencia.EditValue:= cdsIngresos.FieldByName('IDTURNO').AsInteger;

  //S:= IDTIPOSDEVALORESINGRESOS;
  //if S <> '' then begin
  //  Showmessage('AUN NO SE DEFINEN LOS SIGUENTES TIPOS DE VALORES'+#13#10+S+'<<DEFINA ESTOS ANTES DE CAPTURAR INGRESOS>>'); Exit;
  //end;
  Calcula(True);
  end;

  finally
    Cambiando:=False;
    Screen.Cursor:=crDefault;
  end;
end;

function TfrmIngresosXfecha.IDTIPOSDEVALORESINGRESOS: String;
var
  S: String;
  P: TParametrosBI;
begin
  cdsIDTipoValores.Close;

  Try
  P:= TParametrosBI.Create;
  S:= 'SELECT DISTINCT ISNULL((SELECT IDTIPOCOMPROBACION FROM TIPOCOMPROBACION WHERE ESCREDITODEBITOYCUPON = 1),0) AS CREDITOSDEBITOYCUPONES, '+
      'ISNULL((SELECT IDTIPOCOMPROBACION FROM TIPOCOMPROBACION WHERE ESCOMBUSTIBLE = 1),0) AS COMBUSTIBLE, '+
      'ISNULL((SELECT IDTIPOCOMPROBACION FROM TIPOCOMPROBACION WHERE ESPRODUCTO = 1),0) AS PRODUCTO, '+
      'ISNULL((SELECT IDTIPOCOMPROBACION FROM TIPOCOMPROBACION WHERE ESCLIENTE = 1),0) AS CLIENTE, '+
      'ISNULL((SELECT IDTIPOCOMPROBACION FROM TIPOCOMPROBACION WHERE ESEFECTIVO = 1),0) AS EFECTIVO, '+
      'ISNULL((SELECT IDTIPOCOMPROBACION FROM TIPOCOMPROBACION WHERE ESSALIDAEFECTIVO = 1),0) AS SALIDOEFECTIVO '+
      'FROM TIPOCOMPROBACION';
  rdaIDTipoValores.GetDataCall.ParamByName('SQL').AsString:=S;
  rdaIDTipoValores.GetDataCall.ParamByName('Parametros').AsComplexType:= P;
  cdsIDTipoValores.Open;

  ESCREDITODEBITOCUPON:= cdsIDTipoValores.FieldByName('CREDITOSDEBITOYCUPONES').AsInteger;
  ESCOMBUSTIBLE:= cdsIDTipoValores.FieldByName('COMBUSTIBLE').AsInteger;
  ESPRODUCTO:= cdsIDTipoValores.FieldByName('PRODUCTO').AsInteger;
  ESCLIENTE:= cdsIDTipoValores.FieldByName('CLIENTE').AsInteger;
  ESEFECTIVO:= cdsIDTipoValores.FieldByName('EFECTIVO').AsInteger;
  ESSALIDAEFECTIVO:= cdsIDTipoValores.FieldByName('SALIDOEFECTIVO').AsInteger;

  Result:='';
  if ESCREDITODEBITOCUPON = 0 then Result:= Result + '*CREDITOS DEBITOS Y CUPONES'+#13#10;
  if ESCOMBUSTIBLE = 0 then Result:= Result + '*COMBUSTIBLES'+#13#10;
  if ESPRODUCTO = 0 then Result:= Result + '*PRODUCTOS'+#13#10;
  if ESCLIENTE = 0 then Result:= Result + '*CLIENTES'+#13#10;
  if ESEFECTIVO = 0 then Result:= Result + '*EFECTIVOS'+#13#10;
  if ESSALIDAEFECTIVO = 0 then Result:= Result + '*SALIDAS DE EFECTIVO'+#13#10;
  Finally
    P.Free;
  End;
end;

procedure TfrmIngresosXfecha.ImportePropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;
  cdsDetalleIngreso.FieldByName('Importe').AsFloat:=DisplayValue;
  cdsDetalleIngreso.FieldByName('Cantidad').AsFloat:=Decimales(cdsDetalleIngreso.FieldByName('Importe').AsFloat /
                                                    cdsDetalleIngreso.FieldByName('Precio').AsFloat, 4);
end;

procedure TfrmIngresosXfecha.pgcConceptosChange(Sender: TObject);
begin
  inherited;
  if pgcConceptos.ActivePageIndex = 10 then
  begin
    pgcConceptos.ActivePageIndex:=0;
    cbDepartamento.EditValue:=cdsAgrupacionCajas.FieldByName('IDAGRUPACION').AsInteger;
  end;
end;

procedure TfrmIngresosXfecha.pgcConceptosPageChanging(Sender: TObject;
  NewPage: TcxTabSheet; var AllowChange: Boolean);
var
  s: String;
  i: integer;
begin
  inherited;
  if not (NewPage.PageIndex in [1..9]) then
    Exit;

  case NewPage.PageIndex of
    1: s:='GRUPO = ''VENTAS''';
    2: s:='GRUPO = ''TARJETAS Y CUPONES''';
    3: s:='GRUPO = ''PRODUCTOS''';
    4: s:='GRUPO = ''CLIENTES''';
    5: s:='GRUPO = ''EFECTIVO''';
    6: s:='GRUPO = ''SALIDA EFECTIVO''';
    7: s:='GRUPO = ''CHEQUES''';
    8: S:='GRUPO = ''OTROS''';
    9: s:='(GRUPO = ''FALTANTES'' OR GRUPO = ''SOBRANTES'' OR GRUPO = ''PENDIENTE AUTORIZAR'')';
    10: S:='GRUPO = ''OK''';
  end;
  cdsDetalleIngreso.Filtered:=False;
  cdsTipoComprobacion.Filtered:=False;
  cdsTipoComprobacion.Filter:=s;
  cdsTipoComprobacion.Filtered:=True;
  s:= '';
  cdsTipoComprobacion.First;
  while not cdsTipoComprobacion.EOF do
  begin
    s:= s + ' IDTIPOCOMPROBACION ='+cdsTipoComprobacion.FieldByName('IDTIPOCOMPROBACION').AsString;
    cdsTipoComprobacion.Next;

    if not cdsTipoComprobacion.EOF then
       s:= s + ' OR ';
  end;
  cdsDetalleIngreso.Filter:=s + ' AND IDENCARGADOINGRESOS = ' + IntToStr(cdsEncargadoIngreso.FieldByName('IDENCARGADOINGRESOS').AsInteger);
  cdsDetalleIngreso.Filtered:=True;
end;

procedure TfrmIngresosXfecha.ProductoCantidadPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;
  cdsDetalleIngreso.FieldByName('Cantidad').AsFloat:=DisplayValue;
  cdsDetalleIngreso.FieldByName('Importe').AsFloat:=Decimales(cdsDetalleIngreso.FieldByName('Cantidad').AsFloat*
                                                    cdsDetalleIngreso.FieldByName('Precio').AsFloat, 2);
end;

procedure TfrmIngresosXfecha.ProductoDescripcionPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;
  cdsProductos.Locate('NOMBRE',DisplayValue,[]);
  if DisplayValue <> '' then
  begin
      cdsDetalleIngreso.FieldByName('DESCRIPCION').AsString:=cdsProductos.FieldByName('NOMBRE').AsString;
      cdsDetalleIngreso.FieldByName('Precio').AsFloat:=cdsProductos.FieldByName('PRECIOVENTA').AsFloat;
      cdsDetalleIngreso.FieldByName('IDPRODUCTO').AsInteger:=cdsProductos.FieldByName('IDPRODUCTO').AsInteger;
  end;
end;

procedure TfrmIngresosXfecha.ProductoImportePropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;
  cdsDetalleIngreso.FieldByName('Importe').AsFloat:=DisplayValue;
  cdsDetalleIngreso.FieldByName('Cantidad').AsFloat:=Decimales(cdsDetalleIngreso.FieldByName('Importe').AsFloat /
                                                    cdsDetalleIngreso.FieldByName('Precio').AsFloat, 4);
end;

procedure TfrmIngresosXfecha.ProductoPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;
  cdsProductosCombustibles.Locate('NOMBRE',DisplayValue,[]);
  if DisplayValue <> '' then
  begin
      cdsDetalleIngreso.FieldByName('Precio').AsFloat:=cdsProductosCombustibles.FieldByName('PRECIOVENTA').AsFloat;
      cdsDetalleIngreso.FieldByName('IDPRODUCTO').AsInteger:=cdsProductosCombustibles.FieldByName('IDPRODUCTO').AsInteger;
  end;
end;

procedure TfrmIngresosXfecha.RegisterActions;
begin
  inherited RegisterActions;
  RegisterAction(AppActions.actNuevo, ActionNuevo);
  RegisterAction(AppActions.actGuardar, ActionGuardar);
  RegisterAction(AppActions.actCancelar, ActionCancelar);
  RegisterAction(AppActions.actBuscar, ActionBuscar);
  RegisterAction(AppActions.actImprimir, ActionImprimir);
  RegisterAction(AppActions.actCerrarLiquidacion, ActionCerrar);
end;

procedure TfrmIngresosXfecha.UpdateActionsState;
begin
  inherited;
  dmAppActions.actImprimir.Enabled:= (cdsIngresos.State = dsBrowse);
  dmAppActions.actNuevo.Enabled:=not (cdsIngresos.State in dsEditModes);
  dmAppActions.actGuardar.Enabled:=not dmAppActions.actNuevo.Enabled;
  dmAppActions.actCancelar.Enabled:=not dmAppActions.actNuevo.Enabled;
   dmAppActions.actCerrarLiquidacion.Enabled:=not dmAppActions.actNuevo.Enabled;
  edtSecuencia.Enabled:=not dmAppActions.actNuevo.Enabled;
end;

procedure TfrmIngresosXfecha.ValoresCabecera;
begin
  cdsHorasCortes.First;
  while not cdsHorasCortes.EOF do
  begin
    cdsDetalleIngreso.Append;
    cdsDetalleIngreso.FieldByName('IMPORTE').AsFloat:=0;
    cdsDetalleIngreso.FieldByName('CANTIDAD').AsFloat:=0;
    cdsDetalleIngreso.FieldByName('TICKET').AsInteger:=0;
    //cdsDetalleIngreso.FieldByName('IDCLIENTE').AsInteger:=0;
    cdsDetalleIngreso.FieldByName('IDPRODUCTO').AsInteger:=cdsHorasCortes.FieldByName('ProductoID').AsInteger;
    cdsDetalleIngreso.FieldByName('COSTO').AsFloat:=0;
    cdsDetalleIngreso.FieldByName('PUNTOS').AsInteger := 0;
    cdsDetalleIngreso.FieldByName('DESCRIPCION').AsString:='VENTA DE '+cdsHorasCortes.FieldByName('NOMBRE').AsString;
    cdsDetalleIngreso.FieldByName('PRECIO').AsFloat:= cdsHorasCortes.FieldByName('PRECIO').AsFloat;
    cdsDetalleIngreso.FieldByName('IMPUESTOPORCENTAJE').AsInteger:= cdsHorasCortes.FieldByName('IMPUESTO').AsInteger;
    cdsDetalleIngreso.FieldByName('IEPS').AsFloat:= cdsHorasCortes.FieldByName('IEPS').AsFloat;
    cdsDetalleIngreso.FieldByName('IDTIPOCOMPROBACION').AsInteger:= ESCOMBUSTIBLE;
    cdsDetalleIngreso.Post;
    cdsHorasCortes.Next;
  end;
  
  cdsConsumos.First;
  while not cdsConsumos.EOF do
  begin
    cdsDetalleIngreso.Append;
    cdsDetalleIngreso.FieldByName('IMPORTE').AsFloat:=cdsConsumos.FieldByName('IMPORTE').AsFloat;
    cdsDetalleIngreso.FieldByName('CANTIDAD').AsFloat:=cdsConsumos.FieldByName('VOLUMEN').AsFloat;
    cdsDetalleIngreso.FieldByName('PRECIO').AsFloat:=cdsConsumos.FieldByName('PRECIO').AsFloat;
    cdsDetalleIngreso.FieldByName('TICKET').AsInteger:=cdsConsumos.FieldByName('TRAMAID').AsInteger;
    //cdsDetalleIngreso.FieldByName('IDCLIENTE').AsInteger:=0;
    cdsDetalleIngreso.FieldByName('CLIENTE').AsString:=cdsConsumos.FieldByName('NOMBRECLIENTE').AsString;
    cdsDetalleIngreso.FieldByName('VEHICULO').AsString:=cdsConsumos.FieldByName('NOMBREVEHICULO').AsString;
    cdsDetalleIngreso.FieldByName('IDPRODUCTO').AsInteger:=cdsConsumos.FieldByName('PRODUCTOID').AsInteger;
    cdsDetalleIngreso.FieldByName('COSTO').AsFloat:=0;
    cdsDetalleIngreso.FieldByName('PUNTOS').AsInteger := 0;
    cdsDetalleIngreso.FieldByName('DESCRIPCION').AsString:=cdsConsumos.FieldByName('REFERENCIA').AsString;
    cdsDetalleIngreso.FieldByName('IDTIPOCOMPROBACION').AsInteger:= ESCREDITODEBITOCUPON;
    cdsDetalleIngreso.Post;
    cdsConsumos.Next;
  end;
end;

initialization
  ModuleInfoManager.RegisterModule('IngresosxFecha', TfrmIngresosXfecha);

end.
