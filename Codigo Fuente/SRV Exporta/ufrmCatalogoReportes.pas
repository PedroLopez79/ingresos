unit ufrmCatalogoReportesExporta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmCatalogo, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinSilver, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, dxmdaset, uDAInterfaces, uDADataTable,
  uDAScriptingProvider, uDAMemDataTable, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxPC, cxLookAndFeelPainters, AdvmPS, AdvMemo, AdvmSQLS, DBAdvMemo,
  cxContainer, cxGroupBox, cxTextEdit, cxDBEdit, cxLabel, cxImageComboBox,
  StdCtrls, Grids, DBGrids, cxSplitter, cxCheckListBox,  ppCTDsgn,
  raIDE, dxSkinDarkSide, dxSkinPumpkin, dxSkinSpringTime, cxLookAndFeels,
  dxSkinDarkRoom, dxSkinFoggy, dxSkinSeven, dxSkinSharp;

type
  TfrmCatalogoReportesExporta = class(TfrmCatalogo)
    dbgCatalogoDBTableView1RecID: TcxGridDBColumn;
    dbgCatalogoDBTableView1ExportarID: TcxGridDBColumn;
    dbgCatalogoDBTableView1Nombre: TcxGridDBColumn;
    cdsCampo: TDAMemDataTable;
    cdsPaso: TDAMemDataTable;
    dsCampo: TDADataSource;
    dsPaso: TDADataSource;
    cxTabSheet3: TcxTabSheet;
    cxTabSheet4: TcxTabSheet;
    cxTabSheet5: TcxTabSheet;
    DBAdvMemo1: TDBAdvMemo;
    AdvSQLMemoStyler1: TAdvSQLMemoStyler;
    AdvPascalMemoStyler1: TAdvPascalMemoStyler;
    cxGroupBox2: TcxGroupBox;
    cxGroupBox1: TcxGroupBox;
    cxLabel2: TcxLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    cxLabel1: TcxLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1RecID: TcxGridDBColumn;
    cxGrid1DBTableView1Nombre: TcxGridDBColumn;
    cxGrid1DBTableView1Size: TcxGridDBColumn;
    cxGrid1DBTableView1Formato: TcxGridDBColumn;
    cxGrid1DBTableView1Tipo: TcxGridDBColumn;
    cxGrid1DBTableView1Orden: TcxGridDBColumn;
    DBAdvMemo2: TDBAdvMemo;
    cxGroupBox3: TcxGroupBox;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGridDBTableView1Nombre: TcxGridDBColumn;
    cxGridDBTableView1Orden: TcxGridDBColumn;
    cxGridDBTableView1ServidorID: TcxGridDBColumn;
    cxSplitter1: TcxSplitter;
    cxTabSheet6: TcxTabSheet;
    DBAdvMemo3: TDBAdvMemo;
    clbParametros: TcxCheckListBox;
    Label4: TLabel;
    dsDatos: TDataSource;
    tsDatos: TcxTabSheet;
    dbgDatosDBTableView1: TcxGridDBTableView;
    dbgDatosLevel1: TcxGridLevel;
    dbgDatos: TcxGrid;
    procedure FormCreate(Sender: TObject);
    procedure cdsCatalogoNewRecord(DataTable: TDADataTable);
    procedure cdsCampoNewRecord(DataTable: TDADataTable);
    procedure cxGrid1Enter(Sender: TObject);
    procedure cxGrid1Exit(Sender: TObject);
    procedure cdsCampoAfterPost(DataTable: TDADataTable);
    procedure pgcCatalogoPageChanging(Sender: TObject; NewPage: TcxTabSheet;
      var AllowChange: Boolean);
    procedure cdsPasoNewRecord(DataTable: TDADataTable);
    procedure cdsCatalogoAfterScroll(DataTable: TDADataTable);
    procedure cdsCatalogoBeforePost(DataTable: TDADataTable);
    procedure clbParametrosClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
    function ParametrosALetras: String;
    procedure LetrasAParametros(Cad: String);
  protected
    procedure RegisterActions; override;
  public
    { Public declarations }
    procedure ActionGuardar(Action: TBasicAction); override;
    procedure ActionCancelar(Action: TBasicAction); override;
    procedure ActionProcesar(Action: TBasicAction);
    procedure UpdateActionsState; override;
  end;

var
  frmCatalogoReportesExporta: TfrmCatalogoReportesExporta;

implementation

uses uDM, Modules, UtileriasComun, cxGridExportLink, dmActions;

{$R *.dfm}

procedure TfrmCatalogoReportesExporta.ActionCancelar(Action: TBasicAction);
begin
  cdsCampo.Close;
  cdsPaso.Close;
  inherited;
  cdsCampo.Open;
  cdsPaso.Open;
end;

procedure TfrmCatalogoReportesExporta.ActionGuardar(Action: TBasicAction);
begin
  inherited;
end;

procedure TfrmCatalogoReportesExporta.ActionProcesar(Action: TBasicAction);
begin
  inherited;
  if DM.sdExportar.Execute then
  begin
    dbgDatosDBTableView1.DataController.DataSource:=nil;
    DM.Archivo.NombreArchivo:=DM.sdExportar.FileName;
    DM.Archivo.Abrir;
    DM.PreparaDataset(cdsCatalogo.FieldByName('ExportarID').AsInteger, True);
    dbgDatosDBTableView1.DataController.DataSource:=dsDatos;
    dbgDatosDBTableView1.ClearItems;
    dbgDatosDBTableView1.DataController.CreateAllItems();
    pgcCatalogo.ActivePage:=tsDatos;
  end;
end;

procedure TfrmCatalogoReportesExporta.cdsCampoAfterPost(DataTable: TDADataTable);
begin
  inherited;
  if cdsCatalogo.State = dsbrowse then
    cdsCatalogo.Edit;
end;

procedure TfrmCatalogoReportesExporta.cdsCampoNewRecord(DataTable: TDADataTable);
begin
  inherited;
  cdsCampo.FieldByName('ExportarID').AsInteger:=cdsCatalogo.FieldByName('ExportarID').AsInteger;
  cdsCampo.FieldByName('CampoID').AsInteger:=DM.Servidor.Folio('CampoID', '');
  cdsCampo.FieldByName('Formato').AsString:='';
  cdsCampo.FieldByName('Size').AsInteger:=0;
end;

procedure TfrmCatalogoReportesExporta.cdsCatalogoAfterScroll(DataTable: TDADataTable);
begin
  inherited;
    if cdsCatalogo.State = dsBrowse then
      LetrasAParametros(cdsCatalogo.FieldByName('Parametros').AsString);
end;

procedure TfrmCatalogoReportesExporta.cdsCatalogoBeforePost(DataTable: TDADataTable);
begin
  inherited;
  cdsCatalogo.FieldByName('Parametros').AsString:=ParametrosALetras;
end;

procedure TfrmCatalogoReportesExporta.cdsCatalogoNewRecord(DataTable: TDADataTable);
begin
  inherited;
  cdsCatalogo.FieldByName('ExportarID').AsInteger:=DM.Servidor.Folio('ExportarID', '');
end;

procedure TfrmCatalogoReportesExporta.cdsPasoNewRecord(DataTable: TDADataTable);
begin
  inherited;
  cdsPaso.FieldByName('ExportarID').AsInteger:=cdsCatalogo.FieldByName('ExportarID').AsInteger;
  cdsPaso.FieldByName('PasoID').AsInteger:=DM.Servidor.Folio('PasoID', '');
  cdsPaso.FieldByName('SQL').AsString:='';
end;

procedure TfrmCatalogoReportesExporta.clbParametrosClick(Sender: TObject);
begin
  inherited;
  if cdsCatalogo.State = dsBrowse then
    cdsCatalogo.Edit;
end;

procedure TfrmCatalogoReportesExporta.cxGrid1Enter(Sender: TObject);
begin
  inherited;
  OkEnter:=False;
end;

procedure TfrmCatalogoReportesExporta.cxGrid1Exit(Sender: TObject);
begin
  inherited;
  OkEnter:=True;
end;

procedure TfrmCatalogoReportesExporta.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  //DM.expExporta.Execute;
end;

procedure TfrmCatalogoReportesExporta.FormCreate(Sender: TObject);
begin
  inherited;
  cdsCampo.Open;
  cdsPaso.Open;
  dsDatos.DataSet:=DM.tblDatos;
end;

procedure TfrmCatalogoReportesExporta.LetrasAParametros(Cad: String);
var
  I: Integer;
begin
  for I := 0 to clbParametros.Items.Count - 1 do    // Iterate
    clbParametros.Items[I].Checked:=Pos(Chr(clbParametros.Items[I].Tag), Cad) > 0;
end;

function TfrmCatalogoReportesExporta.ParametrosALetras: String;
var
  I: Integer;
begin
  Result:='';
  for I := 0 to clbParametros.Items.Count - 1 do    // Iterate
  begin
    if clbParametros.Items[I].Checked then
      Result:= Result + Chr(clbParametros.Items[I].Tag);
  end;    // for
end;

procedure TfrmCatalogoReportesExporta.pgcCatalogoPageChanging(Sender: TObject;
  NewPage: TcxTabSheet; var AllowChange: Boolean);
var
  Aux: TStringStream;
begin
  inherited;
  if NewPage.PageIndex = 5 then
  begin
    AllowChange:=False;
    if cdsCatalogo.State = dsBrowse then
    begin
      DM.PreparaDataset(cdsCatalogo.FieldByName('ExportarID').AsInteger);
      dbgDatosDBTableView1.ClearItems;
      dbgDatosDBTableView1.DataController.CreateAllItems();
      if cdsCatalogo.FieldByName('Template').AsString <> '' then
      begin
         Aux:=TStringStream.Create(cdsCatalogo.FieldByName('Template').AsString);
         try
           Aux.Position:=0;
           DM.repReportes.Template.LoadFromStream(Aux);
         finally
           Aux.Free;
         end;
      end
      else
        DM.repReportes.Template.New;
      DM.rdReportes.ShowModal;
      Aux:=TStringStream.Create('');
      try
        DM.repReportes.Template.SaveToStream(Aux);
        cdsCatalogo.Edit;
        cdsCatalogo.FieldByName('Template').AsString:=Aux.DataString;
      finally
       Aux.Free;
      end;
    end;
  end;
end;

procedure TfrmCatalogoReportesExporta.RegisterActions;
begin
  inherited;
  RegisterAction(AppActions.actProcesar, ActionProcesar);
end;

procedure TfrmCatalogoReportesExporta.UpdateActionsState;
begin
  inherited;
  AppActions.actProcesar.Enabled:=cdsCatalogo.State = dsBrowse;
end;

initialization
  ModuleInfoManager.RegisterModule('Reportes', TfrmCatalogoReportesExporta);


end.
