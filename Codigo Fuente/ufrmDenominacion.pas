unit ufrmDenominacion;

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
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxCurrencyEdit, StdCtrls, cxGroupBox,
  Menus, cxButtons;

type
  TfrmDenominacion = class(TfrmCatalogo)
    dbgCatalogoDBTableView1RecID: TcxGridDBColumn;
    dbgCatalogoDBTableView1IDMONEDA: TcxGridDBColumn;
    dbgCatalogoDBTableView1DESCRIPCION: TcxGridDBColumn;
    Panel1: TPanel;
    Panel2: TPanel;
    LblNoProducto: TcxLabel;
    TxtNoProducto: TcxDBTextEdit;
    LblNombre: TcxLabel;
    TxtNombre: TcxDBTextEdit;
    cxGroupBox1: TcxGroupBox;
    Label2: TLabel;
    edtImporte: TcxCurrencyEdit;
    dtpFecha: TcxDateEdit;
    Label1: TLabel;
    cxButton2: TcxButton;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cdsValorMoneda: TDAMemDataTable;
    dsValorMoneda: TDADataSource;
    cxGrid1DBTableView1RecID: TcxGridDBColumn;
    cxGrid1DBTableView1VALOR: TcxGridDBColumn;
    cxGrid1DBTableView1FECHA: TcxGridDBColumn;
    procedure pgcCatalogoPageChanging(Sender: TObject; NewPage: TcxTabSheet;
      var AllowChange: Boolean);
    procedure cxButton2Click(Sender: TObject);
    procedure cdsCatalogoNewRecord(DataTable: TDADataTable);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDenominacion: TfrmDenominacion;

implementation
uses uDM, Modules;

{$R *.dfm}

procedure TfrmDenominacion.cdsCatalogoNewRecord(DataTable: TDADataTable);
begin
  inherited;
  cdsCatalogo.FieldByName('IDMONEDA').AsInteger:= DM.Servidor.Folio('IDMONEDA','');
  cdsValorMoneda.Close;
end;

procedure TfrmDenominacion.cxButton2Click(Sender: TObject);
begin
  inherited;
  if (edtImporte.Value > 0) then
  begin
    DM.Servidor.ActualizaTipoCampio(DM.NumeroEstacion,dtpFecha.Date,edtImporte.Value,cdsCatalogo.FieldByName('IDMONEDA').AsInteger);

    cdsValorMoneda.Close;
    cdsValorMoneda.ParamByName('IDMONEDA').AsInteger:= cdsCatalogo.FieldByName('IDMONEDA').AsInteger;
    cdsValorMoneda.Open;
  end;

end;

procedure TfrmDenominacion.pgcCatalogoPageChanging(Sender: TObject;
  NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
  inherited;
  if (NewPage.PageIndex = 1) and (cdsCatalogo.FieldByName('IDMONEDA').AsInteger > 0) then
  begin
    cdsValorMoneda.Close;
    cdsValorMoneda.ParamByName('IDMONEDA').AsInteger:= cdsCatalogo.FieldByName('IDMONEDA').AsInteger;
    cdsValorMoneda.Open;
  end;
end;

initialization
  ModuleInfoManager.RegisterModule('TipoCambio', TfrmDenominacion);

end.
