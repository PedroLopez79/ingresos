unit ufrmCatalogoProductos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmCatalogo, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxMaskEdit, cxDropDownEdit, cxDBEdit,
  cxTextEdit, cxLabel, cxContainer, cxGroupBox, dxmdaset, uDADataTable,
  uDAScriptingProvider, uDACDSDataTable, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxPC, cxCheckBox, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter, uDAInterfaces,
  uDAMemDataTable, cxLookAndFeels, cxLookAndFeelPainters, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinValentine, dxSkinXmas2008Blue, LibraryIngresos_Intf, dmActions, ExtCtrls,
  Menus, StdCtrls, cxButtons, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint, cxPCdxBarPopupMenu,
  cxNavigator, uDAFields, uROComponent;


type
  TfrmCatalogoProducto = class(TfrmCatalogo)
    Panel1: TPanel;
    Panel2: TPanel;
    LblNoProducto: TcxLabel;
    TxtNoProducto: TcxDBTextEdit;
    TxtNombre: TcxDBTextEdit;
    LblNombre: TcxLabel;
    LblPrecio: TcxLabel;
    TxtPrecio: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxLabel3: TcxLabel;
    LblPrecioCompra: TcxLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit3: TcxDBTextEdit;
    cxLabel4: TcxLabel;
    dbgCatalogoDBTableView1RecID: TcxGridDBColumn;
    dbgCatalogoDBTableView1IDPRODUCTO: TcxGridDBColumn;
    dbgCatalogoDBTableView1CODIGOPRODUCTO: TcxGridDBColumn;
    dbgCatalogoDBTableView1NOMBRE: TcxGridDBColumn;
    dbgCatalogoDBTableView1PRECIOVENTA: TcxGridDBColumn;
    dbgCatalogoDBTableView1CLAVEPEMEX: TcxGridDBColumn;
    dbgCatalogoDBTableView1COSTO: TcxGridDBColumn;
    dbgCatalogoDBTableView1STATUS: TcxGridDBColumn;
    dbgCatalogoDBTableView1CCCOMPRA: TcxGridDBColumn;
    dbgCatalogoDBTableView1CCIVA: TcxGridDBColumn;
    dbgCatalogoDBTableView1IEPS: TcxGridDBColumn;
    dbgCatalogoDBTableView1PUNTOS: TcxGridDBColumn;
    cxLabel2: TcxLabel;
    cxDBTextEdit5: TcxDBTextEdit;
    cxLabel5: TcxLabel;
    cxDBTextEdit6: TcxDBTextEdit;
    cxLabel6: TcxLabel;
    cxDBTextEdit7: TcxDBTextEdit;
    cxLabel1: TcxLabel;
    cxDBTextEdit4: TcxDBTextEdit;
    cxButton2: TcxButton;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    cxDBLookupComboBox2: TcxDBLookupComboBox;
    cxButton1: TcxButton;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    cdsUnidadMedida: TDAMemDataTable;
    dsUnidadMedida: TDADataSource;
    cdsLinea: TDAMemDataTable;
    dsLinea: TDADataSource;
    procedure FormCreate(Sender: TObject);
    procedure cdsCatalogoNewRecord(DataTable: TDADataTable);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  protected
    procedure RegisterActions; override;
  private
    { Private declarations }
    procedure ActionImprimir(Action: TBasicAction); override;
  public
    { Public declarations }
  end;

var
  frmCatalogoProducto: TfrmCatalogoProducto;
  EstacionActual:Integer;

implementation

uses Modules, uDM, UtileriasComun, uAgregaLinea, uAgregaUnidadMedida;

{$R *.dfm}

procedure TfrmCatalogoProducto.ActionImprimir(Action: TBasicAction);
var
    Rep: LibraryIngresos_Intf.TReporteBI;
begin
  //-- envio del reporte--//
    Rep:=DM.Servidor.BuscarReporte('CATALOGO DE PRODUCTOS');
    DM.Parametros.Factura:=0;
    try
     DM.Imprimir(Rep.SQL1, Rep.SQL2, Rep.Template, 'IMPRIMIENDO...', Rep.CampoJoin, False)
    finally
     Rep.Free;
    end;
end;

procedure TfrmCatalogoProducto.cdsCatalogoNewRecord(DataTable: TDADataTable);
begin
  inherited;
  cdsCatalogo.FieldByName('IDPRODUCTO').AsInteger:=DM.Servidor.Folio('IDPRODUCTO','');
  TxtNombre.SetFocus;  
end;
procedure TfrmCatalogoProducto.cxButton1Click(Sender: TObject);
var
  ID: Integer;
begin
  inherited;
  ID:= Abrir_AgregaUnidadMedida;
  cdsUnidadMedida.Refresh;
  if ID <> -1 then
  begin
    if cdsCatalogo.State = dsBrowse then cdsCatalogo.Edit;
    cxDBLookupComboBox2.EditValue:=ID;
    cdsCatalogo.FieldByName('IDUNIDADMEDIDA').AsInteger:=ID;
  end;
end;

procedure TfrmCatalogoProducto.cxButton2Click(Sender: TObject);
var
  ID: Integer;
begin
  inherited;
  ID:= Abrir_AgregaLinea;
  cdsLinea.Refresh;
  if ID <> -1 then
  begin
    if cdsCatalogo.State = dsBrowse then cdsCatalogo.Edit;
    cxDBLookupComboBox1.EditValue:=ID;
    cdsCatalogo.FieldByName('IDLINEA').AsInteger:= ID;
  end;

end;

procedure TfrmCatalogoProducto.FormCreate(Sender: TObject);
begin
  inherited;
  cdsCatalogo.Open;
  cdsLinea.Open;
  cdsUnidadMedida.Open;
end;
procedure TfrmCatalogoProducto.RegisterActions;
begin
  inherited;
  RegisterAction(AppActions.actImprimir, ActionImprimir);
end;

initialization
  ModuleInfoManager.RegisterModule('Productos', TfrmCatalogoProducto);

end.
