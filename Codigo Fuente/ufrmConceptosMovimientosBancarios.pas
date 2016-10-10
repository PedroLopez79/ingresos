unit ufrmConceptosMovimientosBancarios;

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
  cxGrid, cxPC, cxContainer, ExtCtrls, cxTextEdit, cxDBEdit, cxLabel,
  cxGroupBox, cxRadioGroup;

type
  TfrmConceptosMovimientosBancarios = class(TfrmCatalogo)
    dbgCatalogoDBTableView1RecID: TcxGridDBColumn;
    dbgCatalogoDBTableView1IDCONCEPTOMOVIMIENTOBANCARIO: TcxGridDBColumn;
    dbgCatalogoDBTableView1DESCRIPCION: TcxGridDBColumn;
    dbgCatalogoDBTableView1NATURALEZA: TcxGridDBColumn;
    LblNoProducto: TcxLabel;
    TxtNoProducto: TcxDBTextEdit;
    LblNombre: TcxLabel;
    TxtNombre: TcxDBTextEdit;
    Panel2: TPanel;
    Panel1: TPanel;
    cxDBRadioGroup1: TcxDBRadioGroup;
    procedure cdsCatalogoNewRecord(DataTable: TDADataTable);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConceptosMovimientosBancarios: TfrmConceptosMovimientosBancarios;

implementation
uses uDM, Modules;

{$R *.dfm}
procedure TfrmConceptosMovimientosBancarios.cdsCatalogoNewRecord(
  DataTable: TDADataTable);
begin
  inherited;
  cdsCatalogo.FieldByName('IDCONCEPTOMOVIMIENTOBANCARIO').AsInteger:= DM.Servidor.Folio('IDCONCMOVBANC','');
end;

initialization
  ModuleInfoManager.RegisterModule('ConceptosMovimientosBancarios', TfrmConceptosMovimientosBancarios);

end.
