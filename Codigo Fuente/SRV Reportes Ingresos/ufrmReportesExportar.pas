unit ufrmReportesExportar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmPantallaReportes, ComCtrls, dxSkinsCore, dxSkinsDefaultPainters,
  ImgList, uDAScriptingProvider, uDADataTable, uDACDSDataTable, cxControls,
  cxContainer, cxListView, uPSComponent, dxSkinsdxRibbonPainter, uPSCompiler,
  uPSRuntime, ExportaDataSet, uDAMemDataTable, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinSilver, dxSkinStardust,
  dxSkinSummer2008, dxSkinValentine, dxSkinXmas2008Blue, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSpringTime;

type
  TfrmReportesExportar = class(TfrmPantallaReportes)
    PSScript1: TPSScript;
    sdArchivo: TSaveDialog;
    procedure FormCreate(Sender: TObject);
    procedure lvReportesDblClick(Sender: TObject);
    procedure PSScript1Execute(Sender: TPSScript);
    procedure PSScript1ExecImport(Sender: TObject; se: TPSExec;
      x: TPSRuntimeClassImporter);
    procedure PSScript1CompImport(Sender: TObject; x: TPSPascalCompiler);
    procedure PSScript1Compile(Sender: TPSScript);
  private
    { Private declarations }
  public
    { Public declarations }
    ExportaDataSet: TExportaDataSet;
  end;

var
  frmReportesExportar: TfrmReportesExportar;

implementation

uses Modules, uDM,
     uPSR_std,
     uPSC_std,
     uPSR_stdctrls,
     uPSC_stdctrls,
     uPSR_forms,
     uPSC_forms,
     uPSR_dateutils,
     uPSC_dateutils,

     uPSC_graphics,
     uPSC_controls,
     uPSC_classes,
     uPSR_graphics,
     uPSR_controls,
     uPSR_classes,
     uPSI_ExportaDataSet,
     uPSUtils, ufrmPantallaParametros;

{$R *.dfm}

procedure TfrmReportesExportar.FormCreate(Sender: TObject);
begin
  inherited;
  DespliegaReportes(5,'@'+inttostr(DM.EmpleadoID)+'@');
end;

procedure TfrmReportesExportar.lvReportesDblClick(Sender: TObject);
begin
  if lvReportes.Selected <> nil then
  begin
    cdsReportes.Locate('ReporteID', lvReportes.Selected.StateIndex, []);
    DM.Parametros:=ObtenParametros(cdsReportes.FieldByName('Parametros').AsString, cdsReportes.FieldByName('Nombre').AsString);
    if DM.Parametros = nil then
      Exit;
    DM.AbreDataSetsReportes(cdsReportes.FieldByName('SQL1').AsString, '');
    ExportaDataSet:=TExportaDataSet.Create(DM.cdsMaestro.Dataset);
    ExportaDataSet.ValorParametros:=DM.ValorParametro;
    ExportaDataSet.Folios:=DM.Folio;
    try
      PSScript1.Script.Text:=cdsReportes.FieldByName('SQL2').AsString;
      if PSScript1.Compile then
      begin
        if PSScript1.Execute then
        begin
        sdArchivo.FileName:=cdsReportes.FieldByName('Nombre').AsString;
        if sdArchivo.Execute then
          ExportaDataSet.GuardaArchivo(sdArchivo.FileName);
        end
        else
          MessageDlg(PSScript1.ExecErrorToString, mtError, [mbOK], 0);
      end
      else
        MessageDlg(PSScript1.CompilerMessages[0].MessageToString, mtError, [mbOK], 0);
    finally
      ExportaDataSet.Free;
    end;
  end;
end;

procedure TfrmReportesExportar.PSScript1Compile(Sender: TPSScript);
begin
  inherited;
  Sender.AddRegisteredVariable('ExportaDataset', 'TExportaDataSet');
end;

procedure TfrmReportesExportar.PSScript1CompImport(Sender: TObject;
  x: TPSPascalCompiler);
begin
  inherited;
  SIRegister_Std(x);
  SIRegister_Classes(x, true);
  SIRegister_Graphics(x, true);
  SIRegister_Controls(x);
  SIRegister_stdctrls(x);
  SIRegister_Forms(x);
  RegisterDateTimeLibrary_C(x);
  SIRegister_ExportaDataSet(x);
end;

procedure TfrmReportesExportar.PSScript1ExecImport(Sender: TObject; se: TPSExec;
  x: TPSRuntimeClassImporter);
begin
  inherited;
  RIRegister_Std(x);
  RIRegister_Classes(x, True);
  RIRegister_Graphics(x, True);
  RIRegister_Controls(x);
  RIRegister_stdctrls(x);
  RIRegister_Forms(x);
  RIRegister_ExportaDataSet(x);
end;

procedure TfrmReportesExportar.PSScript1Execute(Sender: TPSScript);
begin
  inherited;
  Sender.SetVarToInstance('APPLICATION', Application);
  Sender.SetVarToInstance('SELF', Self);
  Sender.SetVarToInstance('EXPORTADATASET', ExportaDataSet);
end;

initialization
  ModuleInfoManager.RegisterModule('Exportar', TfrmReportesExportar);

end.
