unit ufrmBancos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmCatalogo, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, dxmdaset, uDAInterfaces,
  uDADataTable, uDAScriptingProvider, uDAMemDataTable, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxPC, cxContainer, cxMaskEdit, cxDropDownEdit, cxDBEdit, ExtCtrls,
  cxTextEdit, cxLabel, AdvMemo, AdvmPS, StdCtrls, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, Modules, TB2Dock, TB2ToolWindow, TBX, Menus, cxButtons,
  dmActions, LibraryIngresos_Intf;

type
  TfrmBancos = class(TfrmCatalogo)
    cxLabel1: TcxLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    Panel1: TPanel;
    cxLabel3: TcxLabel;
    cxDBTextEdit3: TcxDBTextEdit;
    cxLabel2: TcxLabel;
    cxLabel4: TcxLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    AdvPascalMemoStyler1: TAdvPascalMemoStyler;
    dbgCatalogoDBTableView1RecID: TcxGridDBColumn;
    dbgCatalogoDBTableView1CODIGO: TcxGridDBColumn;
    dbgCatalogoDBTableView1NOMBRE: TcxGridDBColumn;
    dbgCatalogoDBTableView1CUENTA: TcxGridDBColumn;
    dbgCatalogoDBTableView1FORMATO: TcxGridDBColumn;
    dbgCatalogoDBTableView1IDEMPLEADO: TcxGridDBColumn;
    cdsEmpleado: TDAMemDataTable;
    dsEmpleado: TDADataSource;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    twCodigo: TTBXToolWindow;
    btnCodigo: TcxButton;
    admCodigo: TAdvMemo;
    Button1: TButton;
    Panel2: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure btnCodigoClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure cdsCatalogoNewRecord(DataTable: TDADataTable);
  protected
    procedure RegisterActions; override;
  private
    { Private declarations }
    procedure ActionImprimir(Action: TBasicAction); override;
  public
    { Public declarations }
  end;

var
  frmBancos: TfrmBancos;

implementation
uses uDM;

{$R *.dfm}

procedure TfrmBancos.ActionImprimir(Action: TBasicAction);
var
    Rep: LibraryIngresos_Intf.TReporteBI;
begin
  //-- envio del reporte--//
    Rep:=DM.Servidor.BuscarReporte('Catalogo de Bancos');
    DM.Parametros.Factura:=0;
    try
     DM.Imprimir(Rep.SQL1, Rep.SQL2, Rep.Template, 'IMPRIMIENDO...', Rep.CampoJoin, False)
    finally
     Rep.Free;
    end;
end;

procedure TfrmBancos.btnCodigoClick(Sender: TObject);
begin
  inherited;
  twCodigo.Visible:= True;
  admCodigo.SetFocus;
end;

procedure TfrmBancos.Button1Click(Sender: TObject);
begin
  inherited;
  twCodigo.Visible:= False;
end;

procedure TfrmBancos.cdsCatalogoNewRecord(DataTable: TDADataTable);
begin
  inherited;
  cdsCatalogo.FieldByName('IDBANCO').AsInteger:= DM.Servidor.Folio('IDBANCO','');
end;

procedure TfrmBancos.FormCreate(Sender: TObject);
begin
  inherited;
  DM.IniciaVentana(twCodigo);
  cdsEmpleado.Close;
  cdsEmpleado.Open;
end;

procedure TfrmBancos.RegisterActions;
begin
  inherited;
  RegisterAction(AppActions.actImprimir, ActionImprimir);
end;

initialization
  ModuleInfoManager.RegisterModule('Bancos', TfrmBancos);

end.
