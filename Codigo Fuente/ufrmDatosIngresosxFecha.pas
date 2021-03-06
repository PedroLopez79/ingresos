unit ufrmDatosIngresosxfecha;

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
  dxSkinValentine, dxSkinXmas2008Blue, cxButtons, ComCtrls,
  uDAScriptingProvider, uDADataTable, uDAMemDataTable, cxControls,
  dxSkinscxPCPainter, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxDBLookupComboBox, cxTextEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, cxPC, cxContainer, cxDBLabel, cxLabel,
  uDAInterfaces, uDACDSDataTable, uDARemoteDataAdapter, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint,
  cxPCdxBarPopupMenu, cxNavigator, uDADataAdapter, uDAFields, uROComponent;

type
  TfrmDatosIngresosxFecha = class(TForm)
    Panel1: TPanel;
    Pa_ayuda: TPanel;
    Bevel1: TBevel;
    Button2: TButton;
    pgcConceptos: TcxPageControl;
    Conceptos: TcxTabSheet;
    dbgConceptos: TcxGrid;
    dbgConceptosDBTableView1: TcxGridDBTableView;
    Descripcion: TcxGridDBColumn;
    Producto: TcxGridDBColumn;
    Precio: TcxGridDBColumn;
    LtsInicio: TcxGridDBColumn;
    LtsFinal: TcxGridDBColumn;
    Cantidad: TcxGridDBColumn;
    Jarreos: TcxGridDBColumn;
    Entregado: TcxGridDBColumn;
    Importe: TcxGridDBColumn;
    dbgConceptosLevel1: TcxGridLevel;
    cxTabSheet2: TcxTabSheet;
    dbgCreditosDebitosCupones: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    Tarjetas: TcxGridDBColumn;
    Ticket: TcxGridDBColumn;
    CreditosProducto: TcxGridDBColumn;
    CreditosCantidad: TcxGridDBColumn;
    CreditosImporte: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    cxTabSheet1: TcxTabSheet;
    dbgProductos: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    ProductoDescripcion: TcxGridDBColumn;
    ProductoPrecio: TcxGridDBColumn;
    Recibido: TcxGridDBColumn;
    Resurtido: TcxGridDBColumn;
    ProductoEntregado: TcxGridDBColumn;
    ProductoCantidad: TcxGridDBColumn;
    ProductoImporte: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxTabSheet3: TcxTabSheet;
    dbgClientes: TcxGrid;
    cxGridDBTableView3: TcxGridDBTableView;
    IDCliente: TcxGridDBColumn;
    ClienteNombre: TcxGridDBColumn;
    ClienteTicket: TcxGridDBColumn;
    ClienteImporte: TcxGridDBColumn;
    cxGridLevel3: TcxGridLevel;
    cxTabSheet4: TcxTabSheet;
    dbgEfectivo: TcxGrid;
    cxGridDBTableView4: TcxGridDBTableView;
    EfectivoDescripcion: TcxGridDBColumn;
    EfectivoCantidad: TcxGridDBColumn;
    EfectivoImporte: TcxGridDBColumn;
    cxGridLevel4: TcxGridLevel;
    cxTabSheet5: TcxTabSheet;
    dbgSalidaEfectivos: TcxGrid;
    cxGridDBTableView5: TcxGridDBTableView;
    SalidaEfectivoDescripcion: TcxGridDBColumn;
    SalidaEfectivoImporte: TcxGridDBColumn;
    cxGridLevel5: TcxGridLevel;
    cxLabel3: TcxLabel;
    cxDBLabel1: TcxDBLabel;
    cxLabel4: TcxLabel;
    cxDBLabel2: TcxDBLabel;
    cxLabel5: TcxLabel;
    cxDBLabel3: TcxDBLabel;
    cxLabel6: TcxLabel;
    cxDBLabel4: TcxDBLabel;
    cdsDetalleIngreso: TDACDSDataTable;
    cdsIngresos: TDACDSDataTable;
    dsIngresos: TDADataSource;
    dsDetalleIngreso: TDADataSource;
    cdsIDTipoValores: TDACDSDataTable;
    rdaIDTipoValores: TDARemoteDataAdapter;
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pgcConceptosPageChanging(Sender: TObject; NewPage: TcxTabSheet;
      var AllowChange: Boolean);
  private
    { Private declarations }
    ESCREDITODEBITOCUPON, ESCOMBUSTIBLE, ESPRODUCTO, ESCLIENTE: Integer;
    ESEFECTIVO, ESSALIDAEFECTIVO, IDTIPOVALOR: Integer;

    procedure IDTIPOVALORES;
  public
    { Public declarations }
  end;

var
  FoDatosIngresosxFecha: TfrmDatosIngresosxFecha;
  NUMEROESTACIONL: Integer;
  FECHAL: DateTime;

procedure Abrir_DatoIngresosxFecha(NUMEROESTACION: Integer; FECHA: DateTime);

implementation
uses  uDM, LibraryIngresos_Intf;

{$R *.dfm}

procedure Abrir_DatoIngresosxFecha(NUMEROESTACION: Integer; FECHA: DateTime);
Begin
  FoDatosIngresosxFecha:=TfrmDatosIngresosxFecha.Create(Application);
  NUMEROESTACIONL:= NUMEROESTACION;
  FECHAL:= FECHA;

  FoDatosIngresosxFecha.ShowModal;

  FoDatosIngresosxFecha.Free;
End;

procedure TfrmDatosIngresosxFecha.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmDatosIngresosxFecha.FormShow(Sender: TObject);
var
  s: String;
begin
  cdsIngresos.Close;
  cdsIngresos.ParamByName('NUMEROESTACION').AsInteger:= NUMEROESTACIONL;
  cdsIngresos.ParamByName('FECHA').AsDateTime:= FECHAL;
  cdsIngresos.Open;

  cdsDetalleIngreso.Close;
  cdsDetalleIngreso.ParamByName('IDINGRESO').AsInteger:= cdsIngresos.FieldByName('IDINGRESO').AsInteger;
  cdsDetalleIngreso.Open;

  IDTIPOVALORES;
  if pgcConceptos.ActivePageIndex in [0..5] then
  begin
    case pgcConceptos.ActivePageIndex of
    0: begin s:= 'IDTIPOCOMPROBACION = '''+ INTTOSTR(ESCOMBUSTIBLE) +''''; end;
    1: begin s:= 'IDTIPOCOMPROBACION = '''+ INTTOSTR(ESCREDITODEBITOCUPON) +''''; end;
    2: begin s:= 'IDTIPOCOMPROBACION = '''+ INTTOSTR(ESPRODUCTO) +''''; end;
    3: begin s:= 'IDTIPOCOMPROBACION = '''+ INTTOSTR(ESCLIENTE) +''''; end;
    4: begin s:= 'IDTIPOCOMPROBACION = '''+ INTTOSTR(ESEFECTIVO) +''''; end;
    5: begin s:= 'IDTIPOCOMPROBACION = '''+ INTTOSTR(ESSALIDAEFECTIVO) +''''; end;
  end;
  cdsDetalleIngreso.Filtered:=False;
  cdsDetalleIngreso.Filter:=s;
  cdsDetalleIngreso.Filtered:=True;
  end;
end;

procedure TfrmDatosIngresosxFecha.IDTIPOVALORES;
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

  Finally
    P.Free;
  End;
end;

procedure TfrmDatosIngresosxFecha.pgcConceptosPageChanging(Sender: TObject;
  NewPage: TcxTabSheet; var AllowChange: Boolean);
var
 s: String;
begin
  inherited;
  case NewPage.PageIndex of
    0: begin s:= 'IDTIPOCOMPROBACION = '''+ INTTOSTR(ESCOMBUSTIBLE) +''''; end;
    1: begin s:= 'IDTIPOCOMPROBACION = '''+ INTTOSTR(ESCREDITODEBITOCUPON) +''''; end;
    2: begin s:= 'IDTIPOCOMPROBACION = '''+ INTTOSTR(ESPRODUCTO) +''''; end;
    3: begin s:= 'IDTIPOCOMPROBACION = '''+ INTTOSTR(ESCLIENTE) +''''; end;
    4: begin s:= 'IDTIPOCOMPROBACION = '''+ INTTOSTR(ESEFECTIVO) +''''; end;
    5: begin s:= 'IDTIPOCOMPROBACION = '''+ INTTOSTR(ESSALIDAEFECTIVO) +''''; end;
  end;

  cdsDetalleIngreso.Filtered:=False;
  cdsDetalleIngreso.Filter:=s;
  cdsDetalleIngreso.Filtered:=True;
end;

end.
