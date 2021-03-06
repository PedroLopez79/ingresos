unit ufrmCatalogoFormaPago;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmCatalogo, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, dxmdaset, uDADataTable,
  uDAScriptingProvider, uDACDSDataTable, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxPC, cxTextEdit, cxDBEdit, cxLabel, cxContainer, cxGroupBox,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, dxSkinscxPCPainter, uDAInterfaces,
  uDAMemDataTable, LibraryIngresos_Intf, ExtCtrls;

type
  TufrmCatalogoFormadePago = class(TfrmCatalogo)
    dbgCatalogoDBTableView1FormaPagoID: TcxGridDBColumn;
    dbgCatalogoDBTableView1Descripcion: TcxGridDBColumn;
    Panel1: TPanel;
    Panel2: TPanel;
    TxtDescripcion: TcxDBTextEdit;
    LblNombre: TcxLabel;
    TxtNoFormaPago: TcxDBTextEdit;
    LblNoProducto: TcxLabel;
    procedure cdsCatalogoNewRecord(DataTable: TDADataTable);
    procedure cdsCatalogoBeforePost(DataTable: TDADataTable);
  protected
    procedure RegisterActions; override;
  private
    { Private declarations }
    procedure ActionImprimir(Action: TBasicAction); override;
  public
    { Public declarations }
  end;

var
  ufrmCatalogoFormadePago: TufrmCatalogoFormadePago;

implementation

uses uDM, dmActions, Modules;

{$R *.dfm}
procedure TufrmCatalogoFormadePago.ActionImprimir(Action: TBasicAction);
var
    Rep: LibraryIngresos_Intf.TReporteF;
begin
  //-- envio del reporte--//
    Rep:=DM.Servidor.BuscarReporte('CATALOGO FORMA DE PAGO');
    DM.Parametros.Factura:=0;
    try
     DM.Imprimir(Rep.SQL1, Rep.SQL2, Rep.Template, 'IMPRIMIENDO...', Rep.CampoJoin, False)
    finally
     Rep.Free;
    end;
end;

procedure TufrmCatalogoFormadePago.cdsCatalogoBeforePost(
  DataTable: TDADataTable);
begin
  inherited;
  cdsCatalogo.ApplyUpdates;
end;

procedure TufrmCatalogoFormadePago.cdsCatalogoNewRecord(
  DataTable: TDADataTable);
begin
  inherited;
    cdsCatalogo.FieldByName('FormaPagoID').AsInteger:=DM.Servidor.Folio('FormadePagoID', '');
end;

procedure TufrmCatalogoFormadePago.RegisterActions;
begin
  inherited;
  RegisterAction(AppActions.actImprimir, ActionImprimir);
end;

initialization
  ModuleInfoManager.RegisterModule('Tipo de Pago', TufrmCatalogoFormadePago);

end.
