unit ufrmTanque;

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
  cxGrid, cxPC, cxContainer, ExtCtrls, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxTextEdit, cxDBEdit, cxLabel;

type
  TfrmTanque = class(TfrmCatalogo)
    dbgCatalogoDBTableView1RecID: TcxGridDBColumn;
    dbgCatalogoDBTableView1NUMTANQUE: TcxGridDBColumn;
    dbgCatalogoDBTableView1NOMBRE: TcxGridDBColumn;
    dbgCatalogoDBTableView1CAPACIDAD: TcxGridDBColumn;
    dbgCatalogoDBTableView1FONDAJE: TcxGridDBColumn;
    dbgCatalogoDBTableView1IDPRODUCTO: TcxGridDBColumn;
    LblNoProducto: TcxLabel;
    TxtNoProducto: TcxDBTextEdit;
    TxtNombre: TcxDBTextEdit;
    LblNombre: TcxLabel;
    cxLabel11: TcxLabel;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    cxLabel2: TcxLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    cxLabel10: TcxLabel;
    cxDBTextEdit10: TcxDBTextEdit;
    Panel2: TPanel;
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    dsProductos: TDADataSource;
    cdsProducto: TDAMemDataTable;
    procedure FormCreate(Sender: TObject);
    procedure cdsCatalogoNewRecord(DataTable: TDADataTable);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTanque: TfrmTanque;

implementation
uses uDM, Modules;

{$R *.dfm}
procedure TfrmTanque.cdsCatalogoNewRecord(DataTable: TDADataTable);
begin
  inherited;
  cdsCatalogo.FieldByName('IDTANQUE').AsInteger:= DM.Servidor.Folio('IDTANQUE','');
end;

procedure TfrmTanque.FormCreate(Sender: TObject);
begin
  inherited;
  cdsProducto.Close;
  cdsProducto.Open;
end;

initialization
   ModuleInfoManager.RegisterModule('Tanque', TfrmTanque);

end.
