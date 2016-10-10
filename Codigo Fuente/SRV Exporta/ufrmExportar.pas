unit ufrmExportar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CustomModule, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinSilver, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, uDAInterfaces, uDADataTable,
  uDAScriptingProvider, uDAMemDataTable, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxPC, dxSkinDarkSide, dxSkinPumpkin, dxSkinSpringTime, StdCtrls,
  DBCtrls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinDarkRoom, dxSkinFoggy,
  dxSkinSeven, dxSkinSharp;

type
  TfrmExportar = class(TfrmCustomModule)
    pgcExportar: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cdsLista: TDAMemDataTable;
    dsLista: TDADataSource;
    cxGrid1DBTableView1ExportarID: TcxGridDBColumn;
    cxGrid1DBTableView1Nombre: TcxGridDBColumn;
    dbgDatos: TcxGrid;
    dbgDatosDBTableView1: TcxGridDBTableView;
    dbgDatosLevel1: TcxGridLevel;
    dsDatos: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure cdsListaAfterScroll(DataTable: TDADataTable);
  private
    { Private declarations }
    procedure ActionProcesar(Action: TBasicAction);
    procedure ActionImprimir(Action: TBasicAction);
    procedure ActionExportar(Action: TBasicAction);
  protected
    procedure RegisterActions; override;
  public
    { Public declarations }
    procedure UpdateActionsState; override;
  end;

var
  frmExportar: TfrmExportar;

implementation

uses Modules, dmActions, uDM, dmImagenes;

{$R *.dfm}

{ TfrmExportar }

procedure TfrmExportar.ActionExportar(Action: TBasicAction);
begin
  if DM.sdExportar.Execute then
  begin
    DM.Exporta(DM.sdExportar.FileName);
  end;
end;

procedure TfrmExportar.ActionImprimir(Action: TBasicAction);
var
  Aux: TStringStream;
begin
  if cdsLista.FieldByName('Template').AsString <> '' then
  begin
     Aux:=TStringStream.Create(cdsLista.FieldByName('Template').AsString);
     try
       Aux.Position:=0;
       DM.repReportes.Template.LoadFromStream(Aux);
     finally
       Aux.Free;
     end;
     DM.repReportes.Print;
  end
end;

procedure TfrmExportar.ActionProcesar(Action: TBasicAction);
begin
  DM.PreparaDataset(cdsLista.FieldByName('ExportarID').AsInteger, False);
  dbgDatosDBTableView1.ClearItems;
  dbgDatosDBTableView1.DataController.CreateAllItems();
  pgcExportar.ActivePageIndex:=1;
end;

procedure TfrmExportar.cdsListaAfterScroll(DataTable: TDADataTable);
begin
  inherited;
  DM.tblDatos.Close;
  UpdateActionsState;
end;

procedure TfrmExportar.FormCreate(Sender: TObject);
begin
  inherited;
  pgcExportar.ActivePageIndex:=0;
  dsDatos.DataSet:=DM.tblDatos;
  cdsLista.Close;
  cdsLista.Open;
  cdsLista.Next;
  cdsLista.Next;
  cdsLista.Next;
  cdsLista.Next;
  //memo1.Text:= cdsLista.FieldByName('Template').AsWideString;

end;

procedure TfrmExportar.RegisterActions;
begin
  inherited;
  RegisterAction(AppActions.actProcesar, ActionProcesar);
  RegisterAction(AppActions.actImprimir, ActionImprimir);
  RegisterAction(AppActions.actExportar, ActionExportar);
end;

procedure TfrmExportar.UpdateActionsState;
begin
  inherited;
  AppActions.actProcesar.Enabled:=True;
  AppActions.actImprimir.Enabled:=DM.tblDatos.Active;
  AppActions.actExportar.Enabled:=DM.tblDatos.Active;
end;

initialization
  ModuleInfoManager.RegisterModule('ExportarPoliza', TfrmExportar);

end.
