unit ufrmLinea;

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
  cxGrid, cxPC, cxContainer, cxTextEdit, cxDBEdit, cxLabel, ExtCtrls,
  dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010,
  dxSkinWhiteprint, cxPCdxBarPopupMenu, cxNavigator, uDAFields, uROComponent;

type
  TfrmLinea = class(TfrmCatalogo)
    dbgCatalogoDBTableView1RecID: TcxGridDBColumn;
    dbgCatalogoDBTableView1IDLINEA: TcxGridDBColumn;
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
  frmLinea: TfrmLinea;

implementation
uses uDM, Modules;

{$R *.dfm}
procedure TfrmLinea.cdsCatalogoNewRecord(DataTable: TDADataTable);
begin
  inherited;
  cdsCatalogo.FieldByName('IDLINEA').AsInteger:= DM.Servidor.Folio('IDLINEA','');
end;

initialization
  ModuleInfoManager.RegisterModule('Linea', TfrmLinea);

end.
