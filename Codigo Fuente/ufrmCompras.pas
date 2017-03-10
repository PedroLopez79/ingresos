unit ufrmCompras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CustomModule, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxDBEdit, cxPC, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxMaskEdit, cxDropDownEdit, cxCalendar, cxTextEdit,
  cxLabel, cxContainer, cxGroupBox, ExtCtrls, uDADataTable,
  uDAScriptingProvider, uDACDSDataTable, cxDBLookupComboBox, cxLookupEdit,
  cxDBLookupEdit, cxCheckBox, StdCtrls, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, uDAInterfaces, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinSilver, dxSkinStardust,
  dxSkinSummer2008, dxSkinValentine, dxSkinXmas2008Blue, cxLookAndFeelPainters,
  cxLookAndFeels, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinPumpkin,
  dxSkinSeven, dxSkinSharp, dxSkinSpringTime, LibraryIngresos_Intf,
  dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010,
  dxSkinWhiteprint, cxPCdxBarPopupMenu, cxNavigator, uDAFields, uROComponent;

type
  TFrmCompra = class(TfrmCustomModule)
    cdsProveedor: TDACDSDataTable;
    dsProveedor: TDADataSource;
    dsProducto: TDADataSource;
    cdsProducto: TDACDSDataTable;
    pgcFacturacion: TcxPageControl;
    cxPagCompra: TcxPageControl;
    cxTabCompra: TcxTabSheet;
    grbEncabezado: TcxGroupBox;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    dbTxtFolio: TcxDBTextEdit;
    cxDbTxtFacturaCompra: TcxDBTextEdit;
    dbDatFecha: TcxDBDateEdit;
    cxGroupBox5: TcxGroupBox;
    cxLabel17: TcxLabel;
    cxLabel18: TcxLabel;
    cxDBTextEdit10: TcxDBTextEdit;
    cxDBTextEdit11: TcxDBTextEdit;
    cxDBTextEdit12: TcxDBTextEdit;
    cxLabel19: TcxLabel;
    cxGroupBox6: TcxGroupBox;
    cxGrid1: TcxGrid;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridLevel3: TcxGridLevel;
    dbCbxAlmacen: TcxDBLookupComboBox;
    cxLabel2: TcxLabel;
    cxGridDBTableView3Cantidad: TcxGridDBColumn;
    cxGridDBTableView3Costo: TcxGridDBColumn;
    cxGridDBTableView3ProductoID: TcxGridDBColumn;
    cxGridDBTableView3Importe: TcxGridDBColumn;
    dbCbTipoMov: TcxDBLookupComboBox;
    cxLabel4: TcxLabel;
    cdsTipoMovAlmacen: TDACDSDataTable;
    dsTipoMovAlmacen: TDADataSource;
    dsMovimientoAlmacen2: TDADataSource;
    cdsAlmacen2: TDACDSDataTable;
    dsAlmacen2: TDADataSource;
    dsDetalleMovAlmacen2: TDADataSource;
    cxEstacionDestino: TcxDBLookupComboBox;
    cxLabel1: TcxLabel;
    cxAlmacenDestino: TcxDBLookupComboBox;
    cxLabel9: TcxLabel;
    cdsEstaciones: TDACDSDataTable;
    dsEstaciones: TDADataSource;
    cxDescripcion: TcxGridDBColumn;
    cdsMovAlmacenDos: TDACDSDataTable;
    cdsDetalleMovDos: TDACDSDataTable;
    dbcProveedor: TcxDBLookupComboBox;
    cdsDetalleMovAlmacen2: TDACDSDataTable;
    Panel3: TPanel;
    Panel4: TPanel;
    cdsMovimientoAlmacen2: TDACDSDataTable;
    procedure dbCbxAlmacenEnter(Sender: TObject);
    procedure cdsDetalleMovAlmacen2ProductoIDValidate(Sender: TDACustomField);
    procedure cxGridDBTableView3FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure dbCbTipoMovExit(Sender: TObject);
    procedure cdsDetalleMovAlmacen2BeforePost(DataTable: TDADataTable);
    procedure cdsDetalleMovAlmacen2AfterPost(DataTable: TDADataTable);
    procedure cdsMovimientoAlmacen2NewRecord(DataTable: TDADataTable);
    procedure cdsDetalleMovAlmacen2NewRecord(DataTable: TDADataTable);
    procedure FormCreate(Sender: TObject);
    procedure cxGrid1Exit(Sender: TObject);
    procedure cxGridDBTableView3ProductoIDPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure dbTxtProveedorEnter(Sender: TObject);
    procedure cxGrid1Enter(Sender: TObject);
    procedure cxGridDBTableView3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbTxtProveedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxGridDBTableView3EditKeyDown(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word;
      Shift: TShiftState);
    procedure cdsDetalleMovAlmacen2AfterDelete(DataTable: TDADataTable);
  private
    { Private declarations }
    procedure ActionNuevo(Action: TBasicAction);
    procedure ActionGuardar(Action: TBasicAction);
    procedure ActionCancelar(Action: TBasicAction);
    procedure ActionBuscar(Action: TBasicAction);
    procedure EliminarNulos;
    function ExisteProducto(ProductoID:Integer):Boolean;
    procedure BuscarProducto;
    procedure FiltraAlmacen(Filtro: string);
  protected
    procedure RegisterActions; override;
  public
    { Public declarations }
     procedure UpdateActionsState; override;
  end;

var
  FrmCompra: TFrmCompra;
  ImpuestoPorcentaje:Real;
  Consulta:Byte;
  Transaccion: Integer;

implementation

  uses Modules, uDM, dmActions, ufrmBuscarProveedor,
  UtileriasComun, ufrmBuscarProducto, ufrmBuscar, ufrmPrincipal;

{$R *.dfm}

procedure TFrmCompra.ActionNuevo(Action: TBasicAction);
begin
  grbEncabezado.Enabled:=True;
  dbTxtFolio.Enabled:=True;
  dbCbxAlmacen.Enabled:=True;
  dbcProveedor.Enabled:=True;
  cxDbTxtFacturaCompra.Enabled:=True;
  cxgrid1.Enabled:=True;
  //edtBonoMerma.Enabled:=True;
  dbCbTipoMov.Enabled:=True;

  cdsMovimientoAlmacen2.Append;
  cdsDetalleMovAlmacen2.Close;
  cdsDetalleMovAlmacen2.Open;
  grbEncabezado.SetFocus;
  dbCbxAlmacen.SetFocus;
end;

procedure TFrmCompra.BuscarProducto;
var
  Datos: TDatosBusqueda;
begin
  Datos:=PantallaBusqueda(TfrmBuscarProducto,'');
  if Datos.OK then
  begin
  try
    if (cdsDetalleMovAlmacen2.State = dsBrowse) then
       cdsDetalleMovAlmacen2.Append;
       cdsDetalleMovAlmacen2.FieldByName('IDPRODUCTO').AsInteger:=Datos.Clave;
       cdsDetalleMovAlmacen2.FieldByName('PRECIO').AsFloat:=Datos.Precio;
  finally
  end;
  end;
end;

procedure TFrmCompra.ActionGuardar(Action: TBasicAction);
var
Aux: LibraryIngresos_Intf.TReporteBI;
i: Integer;
begin
  EliminarNulos;
  if cdsDetalleMovAlmacen2.RecordCount > 0 then
  begin
    grbEncabezado.Enabled:=False;
    cdsMovimientoAlmacen2.FieldByName('FOLIO').AsInteger:=DM.Servidor.Folio('FolioCompra','');
    cdsMovimientoAlmacen2.FieldByName('IDUSUARIO').AsInteger:=DM.Seguridad.idEmpleado;
    cdsMovimientoAlmacen2.Post;
    cdsMovimientoAlmacen2.ApplyUpdates();
    cdsDetalleMovAlmacen2.ApplyUpdates();
    if cdsMovimientoAlmacen2.FieldByName('IDTIPOMOVIMIENTO').AsInteger = 5 then
    begin
      cdsMovAlmacenDos.Open;
      cdsMovAlmacenDos.Append;
      for I := 0 to cdsMovimientoAlmacen2.FieldCount - 1 do
        cdsMovAlmacenDos.FieldByName(cdsMovimientoAlmacen2.Fields[I].Name).AsVariant:=cdsMovimientoAlmacen2.Fields[I].Value;
      cdsMovAlmacenDos.FieldByName('IDMOVIMIENTOALMACEN').AsInteger:=DM.Servidor.Folio('IDMOVIMIENTOALMACEN','');
      cdsMovAlmacenDos.FieldByName('FOLIO').AsInteger:=DM.Servidor.Folio('FOLIOCOMPRA','');
      cdsMovAlmacenDos.FieldByName('IDALMACEN').AsInteger:=cdsMovimientoAlmacen2.FieldByName('IDALMACEND').AsInteger;
      cdsMovAlmacenDos.FieldByName('NUMEROESTACION').AsInteger:=cdsMovimientoAlmacen2.FieldByName('IDESTACIOND').AsInteger;
      cdsMovAlmacenDos.FieldByName('IDALMACEND').AsInteger:=cdsMovimientoAlmacen2.FieldByName('IDALMACEN').AsInteger;
      cdsMovAlmacenDos.FieldByName('IDESTACIOND').AsInteger:=cdsMovimientoAlmacen2.FieldByName('NUMEROESTACION').AsInteger;
      cdsMovAlmacenDos.FieldByName('IDTIPOMOVIMIENTO').AsInteger:=4;
      cdsMovAlmacenDos.Post;
      cdsMovAlmacenDos.ApplyUpdates();
      cdsDetalleMovAlmacen2.First;
      cdsDetalleMovDos.Open;
      while not cdsDetalleMovAlmacen2.EOF do
      begin
        cdsDetalleMovDos.Append;
        for I := 0 to cdsDetalleMovAlmacen2.FieldCount - 1 do
          cdsDetalleMovDos.FieldByName(cdsDetalleMovAlmacen2.Fields[I].Name).AsVariant:=cdsDetalleMovAlmacen2.Fields[I].Value;
        cdsDetalleMovDos.FieldByName('IDMOVIMIENTOALMACEN').AsInteger:=cdsMovAlmacenDos.FieldByName('IDMOVIMIENTOALMACEN').AsInteger;
        cdsDetalleMovDos.FieldByName('IDDETALLEMOVIMIENTOALMACEN').AsInteger:=DM.Servidor.Folio('IDDETALLEMOVIMIENTOALM','');

        cdsDetalleMovDos.Post;
        cdsDetalleMovAlmacen2.Next;
      end;
      cdsDetalleMovDos.ApplyUpdates();
      cdsMovAlmacenDos.Close;
      cdsDetalleMovDos.Close;
    end;
   Aux:=TReporteBI.Create;
   Try
      Aux.Assign(DM.Servidor.BuscarReporte('INVENTARIOS TIPO MOVIMIENTO'));
      DM.Parametros.FacturasCompras:=Transaccion;
      DM.Imprimir(Aux.SQL1, Aux.SQL2, Aux.Template, 'IMPRIMIENDO...', Aux.CampoJoin,False);
    finally
      Aux.Free;
    end;
  end
  else
    Showmessage('Registre al menos un Producto');
end;

procedure TFrmCompra.ActionCancelar(Action: TBasicAction);
begin

  dbTxtFolio.Enabled:=false;
  dbCbxAlmacen.Enabled:=False;
  dbcProveedor.Enabled:=False;
  cxDbTxtFacturaCompra.Enabled:=False;
  cxgrid1.Enabled:=false;
  //edtBonoMerma.Enabled:=False;
  dbCbTipoMov.Enabled:=False;
  cxEstacionDestino.Enabled:=False;
  cxAlmacenDestino.Enabled:=False;

  cdsMovimientoAlmacen2.Cancel;
  cdsDetalleMovAlmacen2.Cancel;
  cdsDetalleMovAlmacen2.Close;
end;

procedure TFrmCompra.ActionBuscar(Action: TBasicAction);
begin
  case Consulta of
    2:BuscarProducto;
  end;
end;

procedure TFrmCompra.RegisterActions;
begin
  inherited RegisterActions;
  RegisterAction(AppActions.actNuevo, ActionNuevo);
  RegisterAction(AppActions.actGuardar, ActionGuardar);
  RegisterAction(AppActions.actCancelar, ActionCancelar);
  RegisterAction(AppActions.actBuscar, ActionBuscar);
end;

procedure TFrmCompra.UpdateActionsState;
begin
  inherited;
  dmAppActions.actNuevo.Enabled:=cdsMovimientoAlmacen2.State = dsBrowse;
  dmAppActions.actGuardar.Enabled:=(cdsMovimientoAlmacen2.State in dsEditModes);
  dmAppActions.actCancelar.Enabled:=cdsMovimientoAlmacen2.State in dsEditModes;
  dmAppActions.actEliminar.Enabled:=(cdsMovimientoAlmacen2.State = dsBrowse) and (cdsMovimientoAlmacen2.RecordCount > 0);
  dmAppActions.actBuscar.Enabled:=((cdsMovimientoAlmacen2.State=dsEdit) or (cdsMovimientoAlmacen2.State=dsInsert));
end;

procedure TFrmCompra.cdsDetalleMovAlmacen2AfterDelete(DataTable: TDADataTable);
var
  Total:Real;
  Impuesto: Real;
  Merma: Float;
begin
  inherited;
  Total:=0;
  cdsDetalleMovAlmacen2.First;
  While not cdsDetalleMovAlmacen2.EOF do
  begin
     Total:=Total + Decimales(cdsDetalleMovAlmacen2.FieldByName('CANTIDAD').AsFloat *
                    cdsDetalleMovAlmacen2.FieldByName('PRECIO').AsFloat, 2);
     cdsDetalleMovAlmacen2.Next;
  end;

     cdsEstaciones.Locate('NUMEROESTACION', cdsMovimientoAlmacen2.FieldByName('NUMEROESTACION').AsInteger, []);
     ImpuestoPorcentaje:=cdsEstaciones.FieldByName('IMPUESTO').AsFloat;

     cdsMovimientoAlmacen2.FieldByName('IMPUESTOPORCENTAJE').AsFloat:=ImpuestoPorcentaje;
     cdsMovimientoAlmacen2.FieldByName('SUBTOTAL').AsFloat:=Decimales(Total, 2);
     Impuesto:= (Total*(ImpuestoPorcentaje/100));
     cdsMovimientoAlmacen2.FieldByName('IMPUESTO').AsFloat:=Impuesto;
     //Merma:=cdsMovimientoAlmacen2.FieldByName('BonoMerma').AsFloat;
     cdsMovimientoAlmacen2.FieldByName('TOTAL').AsFloat:=Total + Impuesto - Merma;
end;

procedure TFrmCompra.cdsDetalleMovAlmacen2AfterPost(DataTable: TDADataTable);
var
  Total:Real;
  Impuesto: Real;
  Merma: Float;
begin
  inherited;
  Total:=0;
  cdsDetalleMovAlmacen2.First;
  While not cdsDetalleMovAlmacen2.EOF do
  begin
     Total:=Total + Decimales(cdsDetalleMovAlmacen2.FieldByName('CANTIDAD').AsFloat *
                    cdsDetalleMovAlmacen2.FieldByName('PRECIO').AsFloat, 2);
     cdsDetalleMovAlmacen2.Next;
  end;

     cdsEstaciones.Locate('NUMEROESTACION', cdsMovimientoAlmacen2.FieldByName('NUMEROESTACION').AsInteger, []);
     ImpuestoPorcentaje:=cdsEstaciones.FieldByName('IMPUESTO').AsFloat;

     cdsMovimientoAlmacen2.FieldByName('IMPUESTOPORCENTAJE').AsFloat:=ImpuestoPorcentaje;
     cdsMovimientoAlmacen2.FieldByName('SUBTOTAL').AsFloat:=Decimales(Total, 2);
     Impuesto:= (Total*(ImpuestoPorcentaje/100));
     cdsMovimientoAlmacen2.FieldByName('IMPUESTO').AsFloat:=Impuesto;
     //Merma:=cdsMovimientoAlmacen2.FieldByName('BonoMerma').AsFloat;
     cdsMovimientoAlmacen2.FieldByName('TOTAL').AsFloat:=Total + Impuesto - Merma;

end;

procedure TFrmCompra.cdsDetalleMovAlmacen2BeforePost(DataTable: TDADataTable);
begin
  inherited;
   cdsDetalleMovAlmacen2.FieldByName('IMPORTE').AsFloat:=cdsDetalleMovAlmacen2.FieldByName('CANTIDAD').AsFloat *
                                                    cdsDetalleMovAlmacen2.FieldByName('PRECIO').AsFloat;
end;

procedure TFrmCompra.cdsDetalleMovAlmacen2NewRecord(DataTable: TDADataTable);
begin
  inherited;
  cdsDetalleMovAlmacen2.FieldByName('IDDETALLEMOVIMIENTOALMACEN').AsInteger:=DM.Servidor.Folio('IDDETALLEMOVIMIENTOALM','');
  cdsDetalleMovAlmacen2.FieldByName('IDMOVIMIENTOALMACEN').AsInteger:=cdsMovimientoAlmacen2.FieldByName('IDMOVIMIENTOALMACEN').AsInteger;
  cdsDetalleMovAlmacen2.FieldByName('CANTIDAD').AsFloat:=0;
  cdsDetalleMovAlmacen2.FieldByName('PRECIO').AsFloat:=0;
end;

procedure TFrmCompra.cdsDetalleMovAlmacen2ProductoIDValidate(
  Sender: TDACustomField);
begin
  inherited;
  if cdsProducto.Locate('IDPRODUCTO', cdsDetalleMovAlmacen2.FieldByName('ProductoID').AsInteger, []) then
    cdsDetalleMovAlmacen2.FieldByName('PRECIO').AsFloat:=cdsProducto.FieldByName('COSTO').AsFloat;
end;

procedure TFrmCompra.cdsMovimientoAlmacen2NewRecord(DataTable: TDADataTable);
var
  Fecha:DateTime;
begin
  inherited;
  Fecha:=DM.Servidor.Fecha;
  cdsMovimientoAlmacen2.FieldByName('IDMOVIMIENTOALMACEN').AsInteger:=DM.Servidor.Folio('IDMOVIMIENTOALMACEN','');
  Transaccion:= cdsMovimientoAlmacen2.FieldByName('IDMOVIMIENTOALMACEN').AsInteger;
  cdsMovimientoAlmacen2.FieldByName('FOLIO').AsInteger:=DM.Servidor.FolioActual('FolioCompra','');
  cdsMovimientoAlmacen2.FieldByName('FECHA').AsDateTime:=Trunc(Fecha);
  cdsMovimientoAlmacen2.FieldByName('EJERCICIO').AsInteger:=StrToInt(FormatDateTime('yyyy',Fecha));
  cdsMovimientoAlmacen2.FieldByName('PERIODO').AsInteger:=StrToInt(FormatDateTime('m',Fecha));
  cdsMovimientoAlmacen2.FieldByName('DIA').AsInteger:=StrToInt(FormatDateTime('d',Fecha));
  cdsMovimientoAlmacen2.FieldByName('NUMEROESTACION').AsInteger:=DM.NUMEROESTACION;
  cdsMovimientoAlmacen2.FieldByName('IDTIPOMOVIMIENTO').AsInteger:=1;
  //cdsMovimientoAlmacen2.FieldByName('BonoMerma').AsInteger:=0;
end;

procedure TFrmCompra.cxGrid1Enter(Sender: TObject);
begin
  inherited;
  Consulta:=2;
end;

procedure TFrmCompra.cxGrid1Exit(Sender: TObject);
begin
  inherited;
  if (cdsDetalleMovAlmacen2.State = dsEdit) or
     (cdsDetalleMovAlmacen2.State = dsInsert) then
      cdsDetalleMovAlmacen2.Cancel;
      Consulta:=0;
end;

procedure TFrmCompra.cxGridDBTableView3EditKeyDown(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key=VK_F2 then
  begin
    BuscarProducto;
  end;
end;

procedure TFrmCompra.cxGridDBTableView3FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  Sender.OptionsSelection.CellSelect:=AFocusedRecord = nil;
end;

procedure TFrmCompra.cxGridDBTableView3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key=VK_F2 then
  begin
    BuscarProducto;
  end;
end;

procedure TFrmCompra.cxGridDBTableView3ProductoIDPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
  inherited;
  if DisplayValue > 0 then
  begin
    if ExisteProducto(DisplayValue) then
    begin
      cdsDetalleMovAlmacen2.FieldByName('PRECIO').AsFloat:=DM.Servidor.CostoProducto(DisplayValue);
      cdsDetalleMovAlmacen2.FieldByName('IDPRODUCTO').AsInteger:=DisplayValue;
//      cdsProductoNombre.Close;
//      cdsProductoNombre.ParamByName('ProductoID').AsInteger:=cdsDetalleMovAlmacen2.FieldByName('ProductoID').AsInteger;
//      cdsProductoNombre.Open;
    end
    else
    begin
      Showmessage('Producto NO Existe o no es Inventariable');
    end;
  end;
end;

procedure TFrmCompra.dbCbTipoMovExit(Sender: TObject);
begin
  inherited;
    if (dbCbTipoMov.Text = 'Salida por Traspaso') or (dbCbTipoMov.Text = 'Salida por Traspaso') then
    begin
       cxEstacionDestino.Enabled:=True;
       cxAlmacenDestino.Enabled:=True;
       cdsMovimientoAlmacen2.FieldByName('IDESTACIOND').AsInteger:=DM.NUMEROESTACION;
    end
    else
    begin
       cxEstacionDestino.Enabled:=False;
       cxAlmacenDestino.Enabled:=False;
    end;
end;

procedure TFrmCompra.dbCbxAlmacenEnter(Sender: TObject);
begin
  inherited;
  FiltraAlmacen('NUMEROESTACION = ' + IntToStr(DM.NUMEROESTACION));
end;

procedure TFrmCompra.dbTxtProveedorEnter(Sender: TObject);
begin
  inherited;
  Consulta:=1;
end;

procedure TFrmCompra.dbTxtProveedorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key=VK_F2 then
  begin
    case Consulta of
      2:BuscarProducto;
    end
  end;
end;

procedure TFrmCompra.FiltraAlmacen(Filtro: string);
begin
  cdsAlmacen2.Filtered:=False;
  cdsAlmacen2.Filter:=Filtro;
  cdsAlmacen2.Filtered:=True;
end;

procedure TFrmCompra.FormCreate(Sender: TObject);
var
  panelwidth:integer;
begin
  inherited;

  //TAMAÑOS DE PANELS PARA CENTRAR//
  panelwidth:= (ROUND((ufrmPrincipal.frmPrincipal.pnlPrincipal.Width - cxPagCompra.Width) / 2));
  Panel3.Width:= panelwidth;
  Panel4.Width:= panelwidth;
  //////////////////////////////////
  ///
  cxGridDBTableView3.Styles.ContentEven:=DM.cxStyle2;
  dbTxtFolio.Enabled:=false;
  dbCbxAlmacen.Enabled:=False;
  dbcProveedor.Enabled:=False;
  cxDbTxtFacturaCompra.Enabled:=False;
  //edtBonoMerma.Enabled:=False;
  cxgrid1.Enabled:=false;
  dbCbTipoMov.Enabled:=False;
  cxEstacionDestino.Enabled:=False;
  cxAlmacenDestino.Enabled:=False;
  cdsAlmacen2.Open;
  cdsTipoMovAlmacen.Open;
  cdsProducto.Open;
  cdsProveedor.Open;
  cdsMovimientoAlmacen2.Open;
  cdsDetalleMovAlmacen2.Open;
  cdsMovAlmacenDos.Open;
  cdsEstaciones.Open;
end;

procedure TFrmCompra.EliminarNulos;
begin
  cdsDetalleMovAlmacen2.First;
  while not cdsDetalleMovAlmacen2.EOF  do
  begin
    if (cdsDetalleMovAlmacen2.FieldByName('IDPRODUCTO').AsInteger=0) then
        cdsDetalleMovAlmacen2.Delete;
        cdsDetalleMovAlmacen2.Next;
  end;
end;


function TFrmCompra.ExisteProducto(ProductoID: Integer): Boolean;
begin
  cdsProducto.First;
  Result:=cdsProducto.Locate('IDPRODUCTO',ProductoID, [loCaseInsensitive]);
end;

initialization
  ModuleInfoManager.RegisterModule('Compras', TFrmCompra);
end.
