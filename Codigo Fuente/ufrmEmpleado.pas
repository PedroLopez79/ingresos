unit ufrmEmpleado;

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
  cxGrid, cxPC, cxContainer, cxLabel, cxTextEdit, cxDBEdit, ExtCtrls,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox;

type
  TfrmEmpleado = class(TfrmCatalogo)
    Panel1: TPanel;
    Panel2: TPanel;
    TxtNoProducto: TcxDBTextEdit;
    TxtNombre: TcxDBTextEdit;
    LblNombre: TcxLabel;
    LblNoProducto: TcxLabel;
    cxLabel1: TcxLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    cxLabel2: TcxLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBTextEdit3: TcxDBTextEdit;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxDBTextEdit4: TcxDBTextEdit;
    cxLabel8: TcxLabel;
    cxDBTextEdit9: TcxDBTextEdit;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    cxLabel5: TcxLabel;
    cxDBDateEdit1: TcxDBDateEdit;
    cxDBDateEdit2: TcxDBDateEdit;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    dbgCatalogoDBTableView1RecID: TcxGridDBColumn;
    dbgCatalogoDBTableView1IDEMPLEADO: TcxGridDBColumn;
    dbgCatalogoDBTableView1NOMBRE: TcxGridDBColumn;
    dbgCatalogoDBTableView1CODIGOEMPLEADO: TcxGridDBColumn;
    dbgCatalogoDBTableView1DOMICILIO: TcxGridDBColumn;
    dbgCatalogoDBTableView1CIUDAD: TcxGridDBColumn;
    dbgCatalogoDBTableView1TELEFONO: TcxGridDBColumn;
    dbgCatalogoDBTableView1STATUS: TcxGridDBColumn;
    dbgCatalogoDBTableView1CUENTACONTABLE: TcxGridDBColumn;
    dbgCatalogoDBTableView1FECHAALTA: TcxGridDBColumn;
    dbgCatalogoDBTableView1FECHABAJA: TcxGridDBColumn;
    cdsStatus: TDAMemDataTable;
    dsStatus: TDADataSource;
    cxLabel6: TcxLabel;
    cxDBTextEdit5: TcxDBTextEdit;
    procedure FormCreate(Sender: TObject);
    procedure cdsCatalogoNewRecord(DataTable: TDADataTable);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEmpleado: TfrmEmpleado;

implementation
uses uDM, Modules;

{$R *.dfm}

procedure TfrmEmpleado.cdsCatalogoNewRecord(DataTable: TDADataTable);
begin
  inherited;
  cdsCatalogo.FieldByName('IDEMPLEADO').AsInteger:= DM.Servidor.Folio('IDEMPLEADO','');

end;

procedure TfrmEmpleado.FormCreate(Sender: TObject);
begin
  inherited;
  cdsStatus.Close;
  cdsStatus.Open;
end;

initialization
   ModuleInfoManager.RegisterModule('Empleado', TfrmEmpleado);

end.
