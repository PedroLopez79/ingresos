unit ufrmMarca;

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
  cxGrid, cxPC, cxContainer, cxTextEdit, cxDBEdit, cxLabel, ExtCtrls;

type
  TfrmMarca = class(TfrmCatalogo)
    dbgCatalogoDBTableView1RecID: TcxGridDBColumn;
    dbgCatalogoDBTableView1IDMARCA: TcxGridDBColumn;
    dbgCatalogoDBTableView1DESCRIPCION: TcxGridDBColumn;
    Panel1: TPanel;
    LblNoProducto: TcxLabel;
    TxtNoProducto: TcxDBTextEdit;
    LblNombre: TcxLabel;
    TxtNombre: TcxDBTextEdit;
    Panel2: TPanel;
    procedure cdsCatalogoNewRecord(DataTable: TDADataTable);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMarca: TfrmMarca;

implementation
uses uDM, Modules;

{$R *.dfm}

procedure TfrmMarca.cdsCatalogoNewRecord(DataTable: TDADataTable);
begin
  inherited;
  cdsCatalogo.FieldByName('IDMARCA').AsInteger:= DM.Servidor.Folio('IDMARCA','');
end;

initialization
  ModuleInfoManager.RegisterModule('Marca', TfrmMarca);

end.
