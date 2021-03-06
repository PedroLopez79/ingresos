unit ufrmAutorizaciones;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CustomModule, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxImageComboBox,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, uDAInterfaces, uDADataTable,
  uDAScriptingProvider, uDAMemDataTable;

type
  TfrmAutorizaciones = class(TfrmCustomModule)
    cdsAutorizacion: TDAMemDataTable;
    dsGasolinero: TDADataSource;
    dbgCatalogo: TcxGrid;
    dbgCatalogoDBTableView1: TcxGridDBTableView;
    dbgCatalogoDBTableView1AutorizacionID: TcxGridDBColumn;
    dbgCatalogoDBTableView1ClienteID: TcxGridDBColumn;
    dbgCatalogoDBTableView1Tipo: TcxGridDBColumn;
    dbgCatalogoDBTableView1Fecha: TcxGridDBColumn;
    dbgCatalogoDBTableView1Importe: TcxGridDBColumn;
    dbgCatalogoDBTableView1Cantidad: TcxGridDBColumn;
    dbgCatalogoDBTableView1ImporteCantidad: TcxGridDBColumn;
    dbgCatalogoDBTableView1PosicionCarga: TcxGridDBColumn;
    dbgCatalogoDBTableView1EstacionID: TcxGridDBColumn;
    dbgCatalogoDBTableView1VehiculoID: TcxGridDBColumn;
    dbgCatalogoLevel1: TcxGridLevel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure ActionEliminar(Action: TBasicAction);
    procedure ActionProcesar(Action: TBasicAction);
  protected
    procedure RegisterActions; override;
  public
    { Public declarations }
    procedure UpdateActionsState; override;
  end;

var
  frmAutorizaciones: TfrmAutorizaciones;

implementation
uses uDMFlotillas, dmActions, dmImagenes, Modules;

{$R *.dfm}

{ TfrmAutorizaciones }

procedure TfrmAutorizaciones.ActionEliminar(Action: TBasicAction);
begin
  if Application.MessageBox('¿Eliminar la autorización pendiente?', 'Confirmar', MB_YESNO+MB_ICONASTERISK+MB_DEFBUTTON1+MB_APPLMODAL) = ID_YES then
  begin
    DMFlotillas.Server.EliminaAutorizacion(cdsAutorizacion.FieldByName('AutorizacionID').AsInteger);
    cdsAutorizacion.Delete;
  end;
end;

procedure TfrmAutorizaciones.ActionProcesar(Action: TBasicAction);
begin
  cdsAutorizacion.Close;
  cdsAutorizacion.Open;
end;

procedure TfrmAutorizaciones.FormCreate(Sender: TObject);
begin
  inherited;
  cdsAutorizacion.Open;
end;

procedure TfrmAutorizaciones.RegisterActions;
begin
  inherited;
  RegisterAction(AppActions.actEliminar, ActionEliminar);
  RegisterAction(AppActions.actProcesar, ActionProcesar);
end;

procedure TfrmAutorizaciones.UpdateActionsState;
begin
  inherited;
  AppActions.actEliminar.Enabled:=cdsAutorizacion.RecordCount > 0;
  AppActions.actProcesar.Enabled:=True;
end;

initialization
  ModuleInfoManager.RegisterModule('Autorizaciones', TfrmAutorizaciones);


end.
