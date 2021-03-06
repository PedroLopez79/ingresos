unit ufrmCliente;

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
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxCheckBox;

type
  TfrmClienteEfectivo = class(TfrmCatalogo)
    dbgCatalogoDBTableView1IDCLIENTE: TcxGridDBColumn;
    dbgCatalogoDBTableView1CODIGO: TcxGridDBColumn;
    dbgCatalogoDBTableView1NOMBRE: TcxGridDBColumn;
    dbgCatalogoDBTableView1GRUPO: TcxGridDBColumn;
    dbgCatalogoDBTableView1CALLE: TcxGridDBColumn;
    dbgCatalogoDBTableView1COLONIA: TcxGridDBColumn;
    dbgCatalogoDBTableView1CIUDAD: TcxGridDBColumn;
    dbgCatalogoDBTableView1TELEFONO: TcxGridDBColumn;
    dbgCatalogoDBTableView1CODIGOPOSTAL: TcxGridDBColumn;
    dbgCatalogoDBTableView1RFC: TcxGridDBColumn;
    dbgCatalogoDBTableView1CURP: TcxGridDBColumn;
    Panel1: TPanel;
    Panel2: TPanel;
    TxtNoProducto: TcxDBTextEdit;
    LblNoProducto: TcxLabel;
    TxtNombre: TcxDBTextEdit;
    LblNombre: TcxLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    cxLabel9: TcxLabel;
    cxDBTextEdit9: TcxDBTextEdit;
    cxDBTextEdit10: TcxDBTextEdit;
    cxLabel10: TcxLabel;
    cxDBTextEdit3: TcxDBTextEdit;
    cxLabel3: TcxLabel;
    cxDBTextEdit4: TcxDBTextEdit;
    cxLabel4: TcxLabel;
    cxLabel8: TcxLabel;
    cxDBTextEdit8: TcxDBTextEdit;
    cxDBTextEdit7: TcxDBTextEdit;
    cxLabel7: TcxLabel;
    cxLabel12: TcxLabel;
    cxDBTextEdit11: TcxDBTextEdit;
    cxLabel13: TcxLabel;
    cxDBTextEdit12: TcxDBTextEdit;
    cdsStatus: TDAMemDataTable;
    dsStatus: TDADataSource;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    cxLabel11: TcxLabel;
    procedure FormCreate(Sender: TObject);
    procedure cdsCatalogoNewRecord(DataTable: TDADataTable);
    procedure cdsCatalogoBeforePost(DataTable: TDADataTable);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClienteEfectivo: TfrmClienteEfectivo;

implementation
uses uDM, Modules;

{$R *.dfm}

procedure TfrmClienteEfectivo.cdsCatalogoBeforePost(DataTable: TDADataTable);
var
  S:String;
begin
  inherited;
  S:= cdsCatalogo.FieldByName('RFC').AsString;
  while (AnsiPos('-',S)>0) do Delete(S,AnsiPos('-',S),1);
  while (AnsiPos(' ',S)>0) do Delete(S,AnsiPos(' ',S),1);

  cdsCatalogo.FieldByName('RFC').AsString:= S;
end;

procedure TfrmClienteEfectivo.cdsCatalogoNewRecord(DataTable: TDADataTable);
begin
  inherited;
  cdsCatalogo.FieldByName('IDCLIENTE').AsInteger:= DM.Servidor.Folio('IDCLIENTE','');

end;

procedure TfrmClienteEfectivo.FormCreate(Sender: TObject);
begin
  inherited;
  cdsStatus.Close;
  cdsStatus.Open;
end;

initialization
   ModuleInfoManager.RegisterModule('ClienteEfectivo', TfrmClienteEfectivo);

end.
