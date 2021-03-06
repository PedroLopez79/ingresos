unit ufrmDepositosxFecha;

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
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  DB, cxDBData, cxDBLookupComboBox, cxTextEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, cxPC, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxLabel, cxMaskEdit, cxCalendar, cxDBEdit, cxGroupBox, uDAScriptingProvider,
  uDADataTable, uDACDSDataTable, uDAInterfaces, cxDBLabel, LibraryIngresos_Intf,
  cxCurrencyEdit, Menus, StdCtrls, cxButtons, DBCtrls, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxPCdxBarPopupMenu, cxNavigator, uDAFields,
  uROComponent;

  const
   MaximoValores: Integer = 10;

  type
  TGrupoValor = record
    Nombre: String;
    Valor: Real;
  end;

  TValores = array[1..10] of TGrupoValor;

type
  TfrmDepositosxFecha = class(TfrmCustomModule)
    cxGroupBox1: TcxGroupBox;
    cxLabel14: TcxLabel;
    cxLabel2: TcxLabel;
    cxGroupBox3: TcxGroupBox;
    pgcConceptos: TcxPageControl;
    Conceptos: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    cxGroupBox2: TcxGroupBox;
    cdsDepositos: TDACDSDataTable;
    dsDepositos: TDADataSource;
    dtpFecha: TcxDateEdit;
    cxLabel1: TcxLabel;
    cxLabel3: TcxLabel;
    cxDBLabel1: TcxDBLabel;
    dsTurno: TDADataSource;
    cdsTurno: TDACDSDataTable;
    cdsTipoComprobacion: TDACDSDataTable;
    dsTipoValor: TDADataSource;
    cdsTipoCambio: TDACDSDataTable;
    dsTipoCambio: TDADataSource;
    cdsBanco: TDACDSDataTable;
    dsBanco: TDADataSource;
    cdsIngresos: TDACDSDataTable;
    dsIngresos: TDADataSource;
    cxLabel7: TcxLabel;
    edtSecuencia: TcxCurrencyEdit;
    cxButton1: TcxButton;
    cxComboBox1: TcxComboBox;
    cxLabel4: TcxLabel;
    cdsDetalleDeposito: TDACDSDataTable;
    dsDetalleDeposito: TDADataSource;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    REFERENCIA: TcxGridDBColumn;
    CANTIDAD: TcxGridDBColumn;
    IMPORTE: TcxGridDBColumn;
    IDTIPOMONEDA: TcxGridDBColumn;
    IDBANCO: TcxGridDBColumn;
    cxGrid1DBTableView1REFERENCIA: TcxGridDBColumn;
    cxGrid1DBTableView1CANTIDAD: TcxGridDBColumn;
    cxGrid1DBTableView1IMPORTE: TcxGridDBColumn;
    cxGrid1DBTableView1IDTIPOMONEDA: TcxGridDBColumn;
    cxGrid1DBTableView1IDBANCO: TcxGridDBColumn;
    spTotalDepositado: TDACDSDataTable;
    dsTotalDepositado: TDADataSource;
    cxDBLabel2: TcxDBLabel;
    procedure pgcConceptosPageChanging(Sender: TObject; NewPage: TcxTabSheet;
      var AllowChange: Boolean);
    procedure cdsDepositosNewRecord(DataTable: TDADataTable);
    procedure FormShow(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxComboBox1PropertiesChange(Sender: TObject);
    procedure cdsDepositosAfterPost(DataTable: TDADataTable);
    procedure cdsDepositosAfterDelete(DataTable: TDADataTable);
    procedure cdsDetalleDepositoNewRecord(DataTable: TDADataTable);
    procedure CANTIDADPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure IDTIPOMONEDAPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cxGrid1DBTableView1IDTIPOMONEDAPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure cxGrid1DBTableView1CANTIDADPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
  private
    { Private declarations }
    ValoresMoneda: LibraryIngresos_Intf.ATTipoValores;
    ValorMoneda: Float;
    FECHAINGRESO: DateTime;
    IDHORARIO: Integer;

    procedure Calcula(Activos: Boolean);

    procedure EstadoDataSets(Activos: Boolean);
    procedure ActionNuevo(Action: TBasicAction);
    procedure ActionGuardar(Action: TBasicAction);
    procedure ActionCancelar(Action: TBasicAction);
    procedure ActionBuscar(Action: TBasicAction);
  protected
    procedure RegisterActions; override;
  public
    { Public declarations }
     procedure UpdateActionsState; override;
  end;

var
  frmDepositosxFecha: TfrmDepositosxFecha;

implementation
uses DateUtils, uDM, Modules, DMActions, ufrmPantallaParametros,
ufrmDatosIngresosxFecha;

{$R *.dfm}

procedure TfrmDepositosxFecha.ActionBuscar(Action: TBasicAction);
begin

end;

procedure TfrmDepositosxFecha.ActionCancelar(Action: TBasicAction);
begin
  cdsDepositos.Cancel;
  cdsDetalleDeposito.Cancel;
end;

procedure TfrmDepositosxFecha.ActionGuardar(Action: TBasicAction);
begin
  cdsDepositos.ApplyUpdates();
  cdsDetalleDeposito.ApplyUpdates();

  cdsDepositos.Cancel;
  cdsDetalleDeposito.Cancel;
end;

procedure TfrmDepositosxFecha.ActionNuevo(Action: TBasicAction);
var
  Parametros: LibraryIngresos_Intf.TParametrosBI;
begin
  inherited;
  cdsDepositos.Close;

  Parametros:=ObtenParametros('O', 'Fecha del Corte');
  FECHAINGRESO:= Parametros.FechaIni;
  Parametros.Free;

  EstadoDataSets(True);
  dtpFecha.Date:= FECHAINGRESO;


  cdsIngresos.Close;
  cdsIngresos.ParamByName('FECHA').AsDateTime:=FECHAINGRESO;
  cdsIngresos.ParamByName('NUMEROESTACION').AsInteger:= DM.NumeroEstacion;
  cdsIngresos.Open;

  dtpFecha.Date:= cdsIngresos.FieldByName('FECHA').AsDateTime;
  //cxLabel4.Caption:= FloatToStr(cdsIngresos.FieldByName('VENTATOTAL').AsFloat -
  //                              cdsDepositos.FieldByName('TOTALDEPOSITADO').AsFloat);
  cdsDepositos.Close;
  cdsDepositos.ParamByName('FECHA').AsDateTime:= FECHAINGRESO;
  cdsDepositos.ParamByName('NUMEROESTACION').AsInteger:= DM.NumeroEstacion;
  cdsDepositos.Open;

  if not (cdsDepositos.EOF) then
  begin
  cdsDepositos.Edit;
  cdsDepositos.FieldByName('FALTAPORDEPOSITAR').AsFloat:= cdsIngresos.FieldByName('VENTATOTAL').AsFloat -
                                cdsDepositos.FieldByName('TOTALDEPOSITADO').AsFloat;
  cdsDepositos.Post;
  cdsDepositos.ApplyUpdates();
  end else
  begin
  cdsDepositos.Append;
  cdsDepositos.FieldByName('FALTAPORDEPOSITAR').AsFloat:= cdsIngresos.FieldByName('VENTATOTAL').AsFloat;
  cdsDepositos.FieldByName('TOTALDEPOSITADO').AsFloat:= 0;
  cdsDepositos.Post;
  cdsDepositos.ApplyUpdates();
  end;

  //UpdateActionsState;

  cxComboBox1PropertiesChange(nil);
end;

procedure TfrmDepositosxFecha.Calcula(Activos: Boolean);
var
  Tot:Float;
begin

  spTotalDepositado.Close;
  sptotalDepositado.ParamByName('IDDEPOSITO').AsInteger:= cdsDepositos.FieldByName('IDDEPOSITO').AsInteger;
  spTotalDepositado.Open;
  if not spTotalDepositado.EOF then Tot:= spTotalDepositado.FieldByName('IMPORTE').AsFloat;

  if cdsDepositos.State = dsBrowse then cdsDepositos.Edit;
  cdsDepositos.FieldByName('TOTALDEPOSITADO').AsFloat:= Tot;

  //cxLabel4.Caption:= FloattoStr(cdsIngresos.FieldByName('EFECTIVOENTREGADO').AsFloat - Tot);
  cdsDepositos.FieldByName('FALTAPORDEPOSITAR').AsFloat:= cdsIngresos.FieldByName('EFECTIVOENTREGADO').AsFloat - Tot;
  UpdateActionsState;
end;

procedure TfrmDepositosxFecha.CANTIDADPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  inherited;
  if DisplayValue > 0 then
  begin
     cdsDetalleDeposito.FieldByName('IMPORTE').AsFloat:= DisplayValue * ValorMoneda;
     cdsDetalleDeposito.FieldByName('CANTIDAD').AsInteger:= DisplayValue;
  end;
end;

procedure TfrmDepositosxFecha.cdsDepositosAfterDelete(DataTable: TDADataTable);
begin
  inherited;
  cdsDetalleDeposito.ApplyUpdates();
  Calcula(True);
  UpdateActionsState;
end;

procedure TfrmDepositosxFecha.cdsDepositosAfterPost(DataTable: TDADataTable);
begin
  inherited;
  cdsDetalleDeposito.ApplyUpdates();
  Calcula(True);
end;

procedure TfrmDepositosxFecha.cdsDepositosNewRecord(DataTable: TDADataTable);
begin
  inherited;
  cdsDepositos.FieldByName('IDDEPOSITO').AsInteger:= DM.Servidor.Folio('IDDEPOSITO','');
  cdsDepositos.FieldByName('IDTURNO').AsInteger:= -1;
  cdsDepositos.FieldByName('NUMEROESTACION').AsInteger:= DM.NumeroEstacion;
end;

procedure TfrmDepositosxFecha.cdsDetalleDepositoNewRecord(DataTable: TDADataTable);
begin
  inherited;
  cdsDetalleDeposito.FieldByName('IDDETALLEDEPOSITO').AsInteger:= DM.Servidor.Folio('IDDEPOSITO','');
  cdsDetalleDeposito.FieldByName('IDDEPOSITO').AsInteger:= cdsDepositos.FieldByName('IDDEPOSITO').AsInteger;
  cdsDetalleDeposito.FieldByName('TIPO').AsInteger:= pgcConceptos.ActivePageIndex;
  cdsDetalleDeposito.FieldByName('IDHORARIO').AsInteger:= cdsTurno.FieldByName('IDHORARIO').AsInteger;
end;

procedure TfrmDepositosxFecha.cxButton1Click(Sender: TObject);
begin
  inherited;
  Abrir_DatoIngresosxFecha(DM.NumeroEstacion, FECHAINGRESO);
end;

procedure TfrmDepositosxFecha.cxComboBox1PropertiesChange(Sender: TObject);
var s:String;
begin
  inherited;
  if cxComboBox1.Text <> '' then
  begin
  cdsTurno.Locate('DESCRIPCION', cxComboBox1.Text, [loCaseInsensitive]);
  IDHORARIO:= cdsTurno.FieldByName('IDHORARIO').AsInteger;

  cdsDepositos.Cancel;
  cdsDepositos.Close;
  cdsDepositos.ParamByName('FECHA').AsDateTime:= FECHAINGRESO;
  cdsDepositos.ParamByName('NUMEROESTACION').AsInteger:= DM.NumeroEstacion;
  cdsDepositos.open;

  if cdsDepositos.RecordCount = 0 then
  begin
     cdsDetalleDeposito.Close;
     cdsDepositos.Close;

     cdsDepositos.Open;
     cdsDepositos.Append;

     cdsDetalleDeposito.Close;
     cdsDetalleDeposito.ParamByName('IDDEPOSITO').AsInteger:= cdsDepositos.fieldbyName('IDDEPOSITO').AsInteger;
     cdsDetalleDeposito.ParamByName('IDHORARIO').AsInteger:= cdsTurno.FieldByName('IDHORARIO').AsInteger;
     cdsDetalleDeposito.Open;
  end
  else
  begin
     cdsDetalleDeposito.Close;
     cdsDetalleDeposito.ParamByName('IDDEPOSITO').AsInteger:= cdsDepositos.fieldbyName('IDDEPOSITO').AsInteger;
     cdsDetalleDeposito.ParamByName('IDHORARIO').AsInteger:= cdsTurno.FieldByName('IDHORARIO').AsInteger;
     cdsDetalleDeposito.Open;
  end;
  case pgcConceptos.ActivePageIndex of
    0: s:= 'TIPO = ''0''';
    1: s:= 'TIPO = ''1''';
  end;
  cdsDetalleDeposito.Filtered:=False;
  cdsDetalleDeposito.Filter:=s;
  cdsDetalleDeposito.Filtered:=True;
  end;
end;

procedure TfrmDepositosxFecha.cxGrid1DBTableView1CANTIDADPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  inherited;
  if DisplayValue > 0 then
  begin
     cdsDetalleDeposito.FieldByName('IMPORTE').AsFloat:= DisplayValue * ValorMoneda;
     cdsDetalleDeposito.FieldByName('CANTIDAD').AsInteger:= DisplayValue;
  end;
end;

procedure TfrmDepositosxFecha.cxGrid1DBTableView1IDTIPOMONEDAPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
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
  cdsDetalleDeposito.FieldByName('TIPOCAMBIO').AsFloat:=  ValorMoneda;
  cdsDetalleDeposito.FieldByName('IDTIPOMONEDA').AsInteger:= cdsTipoCambio.FieldByName('IDMONEDA').AsInteger;
end;

procedure TfrmDepositosxFecha.EstadoDataSets(Activos: Boolean);
begin
  cdsDepositos.Active:= Activos;
  cdsTipoComprobacion.Active:=Activos;
  cdsTurno.Active:=Activos;
  cdsTipoCambio.Active:= Activos;
  cdsBanco.Active:= Activos;
end;

procedure TfrmDepositosxFecha.FormShow(Sender: TObject);
begin
  inherited;
  pgcConceptos.ActivePageIndex:= 0;
  ValoresMoneda:= DM.Servidor.ObtenTipoValores(DM.NumeroEstacion, Now);

  cdsTurno.Close;
  cdsTurno.Open;

  while not cdsTurno.Eof do
  begin
    cxComboBox1.Properties.Items.Add(cdsTurno.FieldByName('DESCRIPCION').AsString);
    cdsTurno.Next;
  end;
end;

procedure TfrmDepositosxFecha.IDTIPOMONEDAPropertiesValidate(Sender: TObject;
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
  cdsDetalleDeposito.FieldByName('TIPOCAMBIO').AsFloat:=  ValorMoneda;
  cdsDetalleDeposito.FieldByName('IDTIPOMONEDA').AsInteger:= cdsTipoCambio.FieldByName('IDMONEDA').AsInteger;
end;

procedure TfrmDepositosxFecha.pgcConceptosPageChanging(Sender: TObject;
  NewPage: TcxTabSheet; var AllowChange: Boolean);
var
 s: String;
begin
  inherited;
  case NewPage.PageIndex of
    0: s:= 'TIPO = ''0''';
    1: s:= 'TIPO = ''1''';
  end;

  cdsDetalleDeposito.Filtered:=False;
  cdsDetalleDeposito.Filter:=s;
  cdsDetalleDeposito.Filtered:=True;
end;

procedure TfrmDepositosxFecha.RegisterActions;
begin
  inherited RegisterActions;
  RegisterAction(AppActions.actNuevo, ActionNuevo);
  RegisterAction(AppActions.actGuardar, ActionGuardar);
  RegisterAction(AppActions.actCancelar, ActionCancelar);
  RegisterAction(AppActions.actBuscar, ActionBuscar);
end;

procedure TfrmDepositosxFecha.UpdateActionsState;
begin
  inherited;
  dmAppActions.actImprimir.Enabled:= (cdsDepositos.State = dsBrowse);
  dmAppActions.actNuevo.Enabled:=not (cdsDepositos.State in dsEditModes);
  dmAppActions.actGuardar.Enabled:=not dmAppActions.actNuevo.Enabled;
  dmAppActions.actCancelar.Enabled:=not dmAppActions.actNuevo.Enabled;
  edtSecuencia.Enabled:=not dmAppActions.actNuevo.Enabled;
end;

initialization
  ModuleInfoManager.RegisterModule('DepositosxFecha', TfrmDepositosxFecha);

end.
