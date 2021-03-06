unit ufrmHorarios;

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
  cxGrid, cxPC, ExtCtrls, cxContainer, cxTextEdit, cxDBEdit, cxLabel,
  cxMaskEdit, cxSpinEdit, cxTimeEdit, ComCtrls;

type
  TfrmHorarios = class(TfrmCatalogo)
    Panel1: TPanel;
    Panel2: TPanel;
    LblNoProducto: TcxLabel;
    TxtNoProducto: TcxDBTextEdit;
    TxtNombre: TcxDBTextEdit;
    LblNombre: TcxLabel;
    cxLabel3: TcxLabel;
    LblPrecio: TcxLabel;
    dbgCatalogoDBTableView1RecID: TcxGridDBColumn;
    dbgCatalogoDBTableView1IDHORARIO: TcxGridDBColumn;
    dbgCatalogoDBTableView1DESCRIPCION: TcxGridDBColumn;
    dtpHoraInicio: TDateTimePicker;
    dtpHoraFin: TDateTimePicker;
    procedure cdsCatalogoNewRecord(DataTable: TDADataTable);
    procedure pgcCatalogoChange(Sender: TObject);
    procedure dtpHoraInicioChange(Sender: TObject);
    procedure dtpHoraFinChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHorarios: TfrmHorarios;

implementation
uses uDM, Modules;

{$R *.dfm}

procedure TfrmHorarios.cdsCatalogoNewRecord(DataTable: TDADataTable);
begin
  inherited;
  cdsCatalogo.FieldByName('IDHORARIO').AsInteger:= DM.Servidor.Folio('IDHORARIO','');
end;

procedure TfrmHorarios.dtpHoraFinChange(Sender: TObject);
begin
  inherited;
  if cdsCatalogo.State = dsBrowse then cdsCatalogo.Edit;
  cdsCatalogo.FieldByName('HORAFINAL').AsDateTime:= dtpHoraFin.DateTime;
end;

procedure TfrmHorarios.dtpHoraInicioChange(Sender: TObject);
begin
  inherited;
  if cdsCatalogo.State = dsBrowse then cdsCatalogo.Edit;
  cdsCatalogo.FieldByName('HORAINICIO').AsDateTime:= dtpHoraInicio.DateTime;
end;

procedure TfrmHorarios.pgcCatalogoChange(Sender: TObject);
begin
  inherited;
  if pgcCatalogo.ActivePageIndex = 1 then
  begin
    dtpHoraInicio.DateTime:= cdsCatalogo.FieldByName('HORAINICIO').AsDateTime;
    dtpHoraFin.DateTime:= cdsCatalogo.FieldByName('HORAFINAL').AsDateTime;
  end;
end;

initialization
  ModuleInfoManager.RegisterModule('Horarios', TfrmHorarios);

end.
