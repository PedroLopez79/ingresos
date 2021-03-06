unit ufrmIngreso;

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
  cxNavigator, uDADataAdapter, uDAFields, uROComponent;

const
   MaximoValores: Integer = 10;

  type
  TGrupoValor = record
    Nombre: String;
    Valor: Real;
  end;

  TValores = array[1..10] of TGrupoValor;

type
  TfrmIngresos = class(TfrmCustomModule)
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
    cxDBLookupComboBox1: TcxDBLookupComboBox;
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
    cdsHorasCortes: TDACDSDataTable;
    rdaHorasCortes: TDARemoteDataAdapter;
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
    LtsInicio: TcxGridDBColumn;
    LtsFinal: TcxGridDBColumn;
    Cantidad: TcxGridDBColumn;
    Jarreos: TcxGridDBColumn;
    Entregado: TcxGridDBColumn;
    Importe: TcxGridDBColumn;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    ProductoDescripcion: TcxGridDBColumn;
    ProductoPrecio: TcxGridDBColumn;
    Recibido: TcxGridDBColumn;
    Resurtido: TcxGridDBColumn;
    ProductoEntregado: TcxGridDBColumn;
    ProductoCantidad: TcxGridDBColumn;
    ProductoImporte: TcxGridDBColumn;
    cxGroupBox4: TcxGroupBox;
    cxLabel10: TcxLabel;
    cxLabel11: TcxLabel;
    cxTabSheet6: TcxTabSheet;
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
  private
    { Private declarations }
    Cambiando: Boolean;
    IDINGRESO: Integer;
    TurnoNuevo: Boolean;
    ESCREDITODEBITOCUPON, ESCOMBUSTIBLE, ESPRODUCTO, ESCLIENTE: Integer;
    ESEFECTIVO, ESSALIDAEFECTIVO, IDTIPOVALOR: Integer;
    MiClienteID: Integer;
    ValorMoneda: Float;
    ValoresMoneda: LibraryIngresos_Intf.ATTipoValores;

    procedure EstadoDataSets(Activos: Boolean);
    procedure Calcula(Activos: Boolean);
    procedure ActionNuevo(Action: TBasicAction);
    procedure ActionGuardar(Action: TBasicAction);
    procedure ActionCancelar(Action: TBasicAction);
    procedure ActionBuscar(Action: TBasicAction);
    procedure ActionImprimir(Action: TBasicAction);
    procedure ActionCerrar(Action: TBasicAction);
    procedure GestionaIngreso(Parametros: LibraryIngresos_Intf.TParametrosBI);
    procedure AbreCorte(IDINGRESO: Integer);
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
  frmIngresos: TfrmIngresos;

implementation
uses Modules, uDM, uDMCistemGas, uDMFlotillas, dmImagenes, dmActions, ufrmPantallaParametros,
UtileriasComun;

{$R *.dfm}

procedure TfrmIngresos.AbreCorte(IDINGRESO: Integer);
var
  S: String;
  P: TParametros;
  P2: TParametrosF;
begin
  cdsConsumos.Close;
  cdsHorasCortes.Close;

  if IDINGRESO > 0 then
  begin
  Try
  P2:= TParametrosF.Create;
  DMCistemGas.ConectaServer(DM.NumeroEstacion);
  DMFlotillas.ConectaServer(DM.NumeroEstacion);
  
  P2.ClienteIni := IDINGRESO;
  P2.EstacionIni:= DM.NumeroEstacion;

  P:= TParametros.Create;
  P.TurnoID:= IDINGRESO;

  if DM.VERSIONVOLUMETRICO = 'STANDARD' then
  BEGIN
  S:= 'SELECT  SecuenciaVenta as  TramaID,'+
      'PosicionCarga as BombaID,'+
      'Cantidad as Volumen, ProductoID, Precio, Importe, Tarjeta as Referencia, '+
      'CLIENTE.NOMBRE AS NOMBRECLIENTE, VEHICULO.NOMBRE AS NOMBREVEHICULO '+
      'FROM  Consumo INNER JOIN '+
      'CLIENTE ON CLIENTE.CLIENTEID = CONSUMO.CLIENTEID INNER JOIN '+
      'VEHICULO ON VEHICULO.VEHICULOID = CONSUMO.VEHICULOID '+
      'WHERE (Turno = @ClienteIni)and(EstacionID = @EstacionIni)';
  rdaConsumos.GetDataCall.ParamByName('SQL').AsString:=S;
  rdaConsumos.GetDataCall.ParamByName('Parametros').AsComplexType:= P2;
  cdsConsumos.Open;

  S:= 'SELECT DISTINCT (SELECT TOP 1 FECHACARGA AS FECHA FROM TRAMA WHERE TURNOID = @TurnoID '+
      'ORDER BY TRAMAID) AS FECHAINI, '+
      '(SELECT TOP 1 FECHACARGA AS FECHA FROM TRAMA WHERE TURNOID = @TurnoID '+
      'ORDER BY TRAMAID DESC)AS FECHAFIN, '+
      'PRODUCTO.PRODUCTOID, PRODUCTO.NOMBRE, PRODUCTO.PRECIO, PRODUCTO.IEPS, '+
      'PRODUCTO.IMPUESTO FROM TRAMA INNER JOIN '+
      'PRODUCTO ON PRODUCTO.PRODUCTOID = PRODUCTO.PRODUCTOID ';

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
      'WHERE (Turno = @ClienteIni)and(EstacionID = @EstacionIni)';
  rdaConsumos.GetDataCall.ParamByName('SQL').AsString:=S;
  rdaConsumos.GetDataCall.ParamByName('Parametros').AsComplexType:= P2;
  cdsConsumos.Open;

  S:= 'SELECT DISTINCT (SELECT TOP 1 FECHAVENTA AS FECHA FROM TRAMA WHERE TURNOID = @TurnoID '+
      'ORDER BY TRAMAID) AS FECHAINI, '+
      '(SELECT TOP 1 FECHAVENTA AS FECHA FROM TRAMA WHERE TURNOID = @TurnoID '+
      'ORDER BY TRAMAID DESC)AS FECHAFIN, '+
      'PRODUCTO.PRODUCTOID, PRODUCTO.NOMBRE, PRODUCTO.PRECIO, PRODUCTO.IEPS, '+
      'PRODUCTO.IMPUESTO FROM TRAMA INNER JOIN '+
      'PRODUCTO ON PRODUCTO.PRODUCTOID = PRODUCTO.PRODUCTOID ';

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

procedure TfrmIngresos.ActionBuscar(Action: TBasicAction);
begin

end;

procedure TfrmIngresos.ActionCancelar(Action: TBasicAction);
begin
  pgcConceptos.ActivePageIndex:=0;
  EstadoDataSets(False);
end;

procedure TfrmIngresos.ActionCerrar(Action: TBasicAction);
begin
  if cdsIngresos.RecordCount > 0 then
  begin
    cdsIngresos.Edit;
    cdsIngresos.FieldByName('TERMINADA').AsBoolean:= True;
    cdsIngresos.Post;
    cdsIngresos.ApplyUpdates();
  end;
end;

procedure TfrmIngresos.ActionGuardar(Action: TBasicAction);
begin
  cdsIngresos.ApplyUpdates();
  cdsEncargadoIngreso.ApplyUpdates();
  cdsDetalleIngreso.ApplyUpdates();
end;

procedure TfrmIngresos.ActionImprimir(Action: TBasicAction);
var
  Aux: TReporteBI;
begin

  DM.Parametros.NumeroEstacion:= DM.NumeroEstacion;
  DM.Parametros.TurnoInicio:= edtSecuencia.EditValue;
  DM.Parametros.TurnoFin:= edtSecuencia.EditValue;

  Aux:= DM.Servidor.BuscarReporte('INGRESOS TURNO');
  if Aux <> nil then
  begin
    DM.Imprimir(Aux.SQL1, Aux.SQL2, Aux.Template, 'INGRESO DEL TURNO', Aux.CampoJoin);
    Aux.Free;
  end;
end;

procedure TfrmIngresos.ActionNuevo(Action: TBasicAction);
var
  Parametros: LibraryIngresos_Intf.TParametrosBI;
begin
  inherited;
  Parametros:=ObtenParametros('S', 'Numero del Corte');
  GestionaIngreso(Parametros);
end;

procedure TfrmIngresos.AgregaValor(Nombre: String; Valor: Real;
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

function TfrmIngresos.BuscarCliente: TDatosBusqueda;
begin
  Result:=PantallaBusqueda(TfrmBuscarCliente,'');
end;

function TfrmIngresos.BuscarProducto: Integer;
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

procedure TfrmIngresos.Calcula(Activos: Boolean);
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
  I:=cdsDetalleIngreso.FieldByName('IDENCARGADOINGRESOS').AsInteger;
  while not cdsDetalleIngreso.EOF do
  begin
    AgregaValor(cdsDetalleIngreso.FieldByName('IDTIPOCOMPROBACION').AsString, cdsDetalleIngreso.FieldByName('Importe').AsFloat, Totales);
    if cdsDetalleIngreso.FieldByName('IDENCARGADOINGRESOS').AsInteger = I then
      AgregaValor(cdsDetalleIngreso.FieldByName('IDTIPOCOMPROBACION').AsString, cdsDetalleIngreso.FieldByName('Importe').AsFloat, Valores);
    cdsDetalleIngreso.Next;
  end;

  if cdsIngresos.State = dsBrowse then cdsIngresos.Edit;  
  //cdsIngresos.FieldByName('VENTATOTAL').AsFloat:= CualValor(inttostr(ESCOMBUSTIBLE),Valores)+CualValor(inttostr(ESPRODUCTO),Valores)-CualValor(inttostr(ESSALIDAEFECTIVO),Valores);
  cdsIngresos.FieldByName('VENTATOTAL').AsFloat:= CualValor(inttostr(ESCOMBUSTIBLE),Valores)+CualValor(inttostr(ESPRODUCTO),Valores);
  cdsIngresos.FieldByName('EFECTIVOENTREGADO').AsFloat:= CualValor(inttostr(ESEFECTIVO),Valores);
  cdsIngresos.FieldByName('SALIDAEFECTIVO').AsFloat:= CualValor(inttostr(ESSALIDAEFECTIVO),Valores);
  cdsIngresos.FieldByName('DIFERENCIA').AsFloat:= (CualValor(inttostr(ESCOMBUSTIBLE),Valores)+CualValor(inttostr(ESPRODUCTO),Valores))-CualValor(inttostr(ESEFECTIVO),Valores)-CualValor(inttostr(ESCREDITODEBITOCUPON),Valores)-CualValor(inttostr(ESCLIENTE),Valores);

  cxLabel10.Caption:= floattostr(CualValor(inttostr(ESCREDITODEBITOCUPON),Valores));


  if pgcConceptos.ActivePageIndex in [0..5] then
  begin
    case pgcConceptos.ActivePageIndex of
    0: begin IDTIPOVALOR:= ESCOMBUSTIBLE; s:= 'IDTIPOCOMPROBACION = '''+ INTTOSTR(ESCOMBUSTIBLE) +''''; end;
    1: begin IDTIPOVALOR:= ESCREDITODEBITOCUPON; s:= 'IDTIPOCOMPROBACION = '''+ INTTOSTR(ESCREDITODEBITOCUPON) +''''; end;
    2: begin IDTIPOVALOR:= ESPRODUCTO; s:= 'IDTIPOCOMPROBACION = '''+ INTTOSTR(ESPRODUCTO) +''''; end;
    3: begin IDTIPOVALOR:= ESCLIENTE; s:= 'IDTIPOCOMPROBACION = '''+ INTTOSTR(ESCLIENTE) +''''; end;
    4: begin IDTIPOVALOR:= ESEFECTIVO; s:= 'IDTIPOCOMPROBACION = '''+ INTTOSTR(ESEFECTIVO) +''''; end;
    5: begin IDTIPOVALOR:= ESSALIDAEFECTIVO; s:= 'IDTIPOCOMPROBACION = '''+ INTTOSTR(ESSALIDAEFECTIVO) +''''; end;
  end;
  cdsDetalleIngreso.Filtered:=False;
  cdsDetalleIngreso.Filter:=s;
  cdsDetalleIngreso.Filtered:=True;
  end;
end;

procedure TfrmIngresos.CantidadPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;
  cdsDetalleIngreso.FieldByName('Cantidad').AsFloat:=DisplayValue;
  cdsDetalleIngreso.FieldByName('Importe').AsFloat:=Decimales(cdsDetalleIngreso.FieldByName('Cantidad').AsFloat*
                                                    cdsDetalleIngreso.FieldByName('Precio').AsFloat, 2);
end;

procedure TfrmIngresos.cdsDetalleIngresoAfterDelete(DataTable: TDADataTable);
begin
  inherited;
  Calcula(True);
  UpdateActionsState;
end;

procedure TfrmIngresos.cdsDetalleIngresoAfterPost(DataTable: TDADataTable);
begin
  inherited;
  Calcula(True);

  cdsIngresos.Edit;
  UpdateActionsState;
end;

procedure TfrmIngresos.cdsDetalleIngresoBeforePost(DataTable: TDADataTable);
begin
  inherited;
  //Calcula(False);
end;

procedure TfrmIngresos.cdsDetalleIngresoIDCLIENTEValidate(
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

procedure TfrmIngresos.cdsDetalleIngresoNewRecord(DataTable: TDADataTable);
begin
  inherited;
  cdsDetalleIngreso.FieldByName('IDDETALLEINGRESOS').AsInteger:=DM.Servidor.Folio('IDDETALLEINGRESOS', '');
  cdsDetalleIngreso.FieldByName('IDENCARGADOINGRESOS').AsInteger:=cdsEncargadoIngreso.FieldByName('IDENCARGADOINGRESOS').AsInteger;
  cdsDetalleIngreso.FieldByName('IDTIPOCOMPROBACION').AsInteger:= IDTIPOVALOR;
  cdsDetalleIngreso.FieldByName('IMPORTE').AsInteger:=0;
  cdsDetalleIngreso.FieldByName('CANTIDAD').AsInteger:=0;
  cdsDetalleIngreso.FieldByName('TICKET').AsInteger:=0;
  cdsDetalleIngreso.FieldByName('IDCLIENTE').AsInteger:=0;
  cdsDetalleIngreso.FieldByName('CLIENTE').AsString:='';
  cdsDetalleIngreso.FieldByName('VEHICULO').AsString:='';
  cdsDetalleIngreso.FieldByName('IDPRODUCTO').AsInteger:=0;
  cdsDetalleIngreso.FieldByName('COSTO').AsFloat:=0;
  cdsDetalleIngreso.FieldByName('PUNTOS').AsInteger := 0;
  cdsDetalleIngreso.FieldByName('IMPUESTOPORCENTAJE').AsInteger:= 0;
  cdsDetalleIngreso.FieldByName('IEPS').AsInteger:= 0;
  cdsDetalleIngreso.FieldByName('NUMEROESTACION').AsInteger := DM.NumeroEstacion;

  UpdateActionsState;
end;

procedure TfrmIngresos.CreaEncargado;
begin
  cdsEncargadoIngreso.Append;
  cdsEncargadoIngreso.FieldByName('IDENCARGADOINGRESOS').AsInteger:=DM.Servidor.Folio('IDENCARGADOINGRESOS', '');
  cdsEncargadoIngreso.FieldByName('IDEMPLEADO').AsInteger:=0;
  cdsEncargadoIngreso.FieldByName('IDINGRESO').AsInteger:=cdsIngresos.FieldByName('IDINGRESO').AsInteger;
  cdsEncargadoIngreso.FieldByName('OBSERVACIONES').AsString:='';
  cdsEncargadoIngreso.Post;
end;

function TfrmIngresos.CualValor(Nombre: String; Valores: TValores): Real;
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

procedure TfrmIngresos.cxGridDBTableView1KeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmIngresos.cxGridDBTableView3KeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmIngresos.dbgConceptos1DBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  Sender.OptionsSelection.CellSelect:=AFocusedRecord = nil;
end;

procedure TfrmIngresos.EfectivoCantidadPropertiesValidate(Sender: TObject;
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

procedure TfrmIngresos.EfectivoDescripcionPropertiesValidate(Sender: TObject;
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

procedure TfrmIngresos.EstadoDataSets(Activos: Boolean);
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
  if not Activos then
  begin

  end;
end;

procedure TfrmIngresos.FormShow(Sender: TObject);
begin
  inherited;
  pgcConceptos.ActivePageIndex:= 0;
  ValoresMoneda:= DM.Servidor.ObtenTipoValores(DM.NumeroEstacion, Now);
end;

procedure TfrmIngresos.GestionaIngreso(Parametros: LibraryIngresos_Intf.TParametrosBI);
var
  Fecha: TDateTime;
  S: String;
begin
  Screen.Cursor:=crHourGlass;
  try
  Cambiando:=True;
  IDINGRESO:=Parametros.IDTurno;
  EstadoDataSets(False);

  cdsIngresos.Close;
  cdsIngresos.ParamByName('IDTURNO').AsInteger:=IDINGRESO;
  cdsIngresos.ParamByName('NUMEROESTACION').AsInteger:= DM.NumeroEstacion;
  cdsIngresos.Open;

  cdsEncargadoIngreso.ParamByName('IDINGRESO').AsInteger:=cdsIngresos.FieldByName('IDINGRESO').AsInteger;
  cdsDetalleIngreso.ParamByName('IDINGRESO').AsInteger:=cdsIngresos.FieldByName('IDINGRESO').AsInteger;
  cdsEncargadoIngreso.Filtered:=False;
  cdsDetalleIngreso.Filtered:=False;

  EstadoDataSets(True);
  if cdsIngresos.RecordCount = 0 then
  begin
    S:= IDTIPOSDEVALORESINGRESOS;
    if S <> '' then begin
       Showmessage('AUN NO SE DEFINEN LOS SIGUENTES TIPOS DE VALORES'+#13#10+S+'<<DEFINA ESTOS ANTES DE CAPTURAR INGRESOS>>'); Exit;
    end;
    AbreCorte(IDINGRESO);
    //----------------------------------------------------------
    try
      if cdsHorasCortes.FieldByName('FECHAINI').AsDateTime = 0 then
      begin
        MessageDlg('El turno que selecciono no existe.', mtError, [mbOK], 0);
        edtSecuencia.Text:='';
        EstadoDataSets(False);
        Screen.Cursor:=crDefault;
        tInicio.Time:=0;
        tFin.Time:=0;
        Exit;
      end
      else
      begin
        Fecha:=Trunc(cdsHorasCortes.FieldByName('FECHAINI').AsDateTime);
        dtpFecha.Date:= Fecha;

        cdsIngresos.Append;
        cdsIngresos.FieldByName('IDINGRESO').AsInteger:=DM.Servidor.Folio('IDINGRESOS', '');
        cdsIngresos.FieldByName('FECHA').AsDateTime:=Fecha;
        cdsIngresos.FieldByName('EJERCICIO').AsString:=FormatDateTime('yyyy', Fecha);
        cdsIngresos.FieldByName('PERIODO').AsString:=FormatDateTime('m', Fecha);
        cdsIngresos.FieldByName('DIA').AsString:=FormatDateTime('d', Fecha);
        cdsIngresos.FieldByName('TERMINADA').AsBoolean:=False;
        cdsIngresos.FieldByName('IDTURNO').AsInteger:=IDINGRESO;
        cdsIngresos.FieldByName('NUMEROESTACION').AsInteger:=DM.NumeroEstacion;
        cdsIngresos.FieldByName('INICIOTURNO').AsDateTime:= cdsHorasCortes.FieldByName('FECHAINI').AsDateTime;
        cdsIngresos.FieldByName('FINTURNO').AsDateTime:= cdsHorasCortes.FieldByName('FECHAFIN').AsDateTime;

        edtSecuencia.EditValue:= IDINGRESO;
        CreaEncargado;
        ValoresCabecera;

        IDTIPOVALOR:= ESCOMBUSTIBLE;
        s:= 'IDTIPOCOMPROBACION = '''+ INTTOSTR(ESCOMBUSTIBLE) +'''';
        pgcConceptos.ActivePageIndex:= 0;
        cdsDetalleIngreso.Filtered:=False;
        cdsDetalleIngreso.Filter:=s;
        cdsDetalleIngreso.Filtered:=True;

        //if cdsConsumos.RecordCount > 0 then
        //begin
          //ProcesaValoresCorte(Aux);
          //--llamar a valorescabecera--//
          Calcula(True);
        //end;
        cdsEncargadoIngreso.First;
        UpdateActionsState;
      end;
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

  tInicio.Time:= cdsIngresos.FieldByName('INICIOTURNO').AsDateTime;
  tFin.Time:= cdsIngresos.FieldByName('FINTURNO').AsDateTime;
  edtSecuencia.EditValue:= cdsIngresos.FieldByName('IDTURNO').AsInteger;
  S:= IDTIPOSDEVALORESINGRESOS;
  if S <> '' then begin
    Showmessage('AUN NO SE DEFINEN LOS SIGUENTES TIPOS DE VALORES'+#13#10+S+'<<DEFINA ESTOS ANTES DE CAPTURAR INGRESOS>>'); Exit;
  end;
  Calcula(True);
  end;

  finally
    Cambiando:=False;
    Screen.Cursor:=crDefault;
  end;
end;

function TfrmIngresos.IDTIPOSDEVALORESINGRESOS: String;
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

procedure TfrmIngresos.ImportePropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;
  cdsDetalleIngreso.FieldByName('Importe').AsFloat:=DisplayValue;
  cdsDetalleIngreso.FieldByName('Cantidad').AsFloat:=Decimales(cdsDetalleIngreso.FieldByName('Importe').AsFloat /
                                                    cdsDetalleIngreso.FieldByName('Precio').AsFloat, 4);
end;

procedure TfrmIngresos.pgcConceptosPageChanging(Sender: TObject;
  NewPage: TcxTabSheet; var AllowChange: Boolean);
var
 s: String;
begin
  inherited;
  case NewPage.PageIndex of
    0: begin IDTIPOVALOR:= ESCOMBUSTIBLE; s:= 'IDTIPOCOMPROBACION = '''+ INTTOSTR(ESCOMBUSTIBLE) +''''; end;
    1: begin IDTIPOVALOR:= ESCREDITODEBITOCUPON; s:= 'IDTIPOCOMPROBACION = '''+ INTTOSTR(ESCREDITODEBITOCUPON) +''''; end;
    2: begin IDTIPOVALOR:= ESPRODUCTO; s:= 'IDTIPOCOMPROBACION = '''+ INTTOSTR(ESPRODUCTO) +''''; end;
    3: begin IDTIPOVALOR:= ESCLIENTE; s:= 'IDTIPOCOMPROBACION = '''+ INTTOSTR(ESCLIENTE) +''''; end;
    4: begin IDTIPOVALOR:= ESEFECTIVO; s:= 'IDTIPOCOMPROBACION = '''+ INTTOSTR(ESEFECTIVO) +''''; end;
    5: begin IDTIPOVALOR:= ESSALIDAEFECTIVO; s:= 'IDTIPOCOMPROBACION = '''+ INTTOSTR(ESSALIDAEFECTIVO) +''''; end;
  end;

  cdsDetalleIngreso.Filtered:=False;
  cdsDetalleIngreso.Filter:=s;
  cdsDetalleIngreso.Filtered:=True;
end;

procedure TfrmIngresos.ProductoCantidadPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;
  cdsDetalleIngreso.FieldByName('Cantidad').AsFloat:=DisplayValue;
  cdsDetalleIngreso.FieldByName('Importe').AsFloat:=Decimales(cdsDetalleIngreso.FieldByName('Cantidad').AsFloat*
                                                    cdsDetalleIngreso.FieldByName('Precio').AsFloat, 2);
end;

procedure TfrmIngresos.ProductoDescripcionPropertiesValidate(Sender: TObject;
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

procedure TfrmIngresos.ProductoImportePropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;
  cdsDetalleIngreso.FieldByName('Importe').AsFloat:=DisplayValue;
  cdsDetalleIngreso.FieldByName('Cantidad').AsFloat:=Decimales(cdsDetalleIngreso.FieldByName('Importe').AsFloat /
                                                    cdsDetalleIngreso.FieldByName('Precio').AsFloat, 4);
end;

procedure TfrmIngresos.ProductoPropertiesValidate(Sender: TObject;
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

procedure TfrmIngresos.RegisterActions;
begin
  inherited RegisterActions;
  RegisterAction(AppActions.actNuevo, ActionNuevo);
  RegisterAction(AppActions.actGuardar, ActionGuardar);
  RegisterAction(AppActions.actCancelar, ActionCancelar);
  RegisterAction(AppActions.actBuscar, ActionBuscar);
  RegisterAction(AppActions.actImprimir, ActionImprimir);
  RegisterAction(AppActions.actCerrarLiquidacion, ActionCerrar);
end;

procedure TfrmIngresos.UpdateActionsState;
begin
  inherited;
  dmAppActions.actImprimir.Enabled:= (cdsIngresos.State = dsBrowse);
  dmAppActions.actNuevo.Enabled:=not (cdsIngresos.State in dsEditModes);
  dmAppActions.actGuardar.Enabled:=not dmAppActions.actNuevo.Enabled;
  dmAppActions.actCancelar.Enabled:=not dmAppActions.actNuevo.Enabled;
  dmAppActions.actCerrarLiquidacion.Enabled:=not dmAppActions.actNuevo.Enabled;
  edtSecuencia.Enabled:=not dmAppActions.actNuevo.Enabled;
end;

procedure TfrmIngresos.ValoresCabecera;
begin
  cdsHorasCortes.First;
  if not cdsHorasCortes.EOF then
  begin
     tInicio.Time:= cdsHorasCortes.FieldByName('FECHAINI').AsDateTime;
     tFin.Time:= cdsHorasCortes.FieldByName('FECHAFIN').AsDateTime
  end;
  while not cdsHorasCortes.EOF do
  begin
    cdsDetalleIngreso.Append;
    cdsDetalleIngreso.FieldByName('IMPORTE').AsFloat:=0;
    cdsDetalleIngreso.FieldByName('CANTIDAD').AsFloat:=0;
    cdsDetalleIngreso.FieldByName('TICKET').AsInteger:=0;
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
  ModuleInfoManager.RegisterModule('Ingresos', TfrmIngresos);

end.
