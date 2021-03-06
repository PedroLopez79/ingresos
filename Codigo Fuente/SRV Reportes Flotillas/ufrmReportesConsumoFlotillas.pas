unit ufrmReportesConsumoFlotillas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CustomModule, ComCtrls, cxControls, cxContainer, cxListView, ImgList,
  uDAScriptingProvider, uDADataTable, uDACDSDataTable, dxSkinsCore,
  dxSkinsDefaultPainters, ufrmPantallaReportes, uDAMemDataTable, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinValentine, dxSkinXmas2008Blue,
  ufrmPantallaReportesFlotillas, uDARemoteDataAdapter;

type
  TfrmReportesConsumoFlotillas = class(TfrmPantallaReportesFlotillas)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReportesConsumoFlotillas: TfrmReportesConsumoFlotillas;

implementation
uses Modules, uDMFlotillas, uDM;
{$R *.dfm}

procedure TfrmReportesConsumoFlotillas.FormCreate(Sender: TObject);
begin
  inherited;
  uDMFlotillas.DMFlotillas.ConectaServer(DM.NumeroEstacion);
  DespliegaReportes(1, '@'+inttostr(DMFlotillas.EmpleadoID)+'@');
end;

initialization
  ModuleInfoManager.RegisterModule('Reportes Flotillas', TfrmReportesConsumoFlotillas);

end.
