unit ufrmPantallaReportesFlotillas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CustomModule, ComCtrls, uDAScriptingProvider, uDADataTable,
  uDACDSDataTable, cxControls, cxContainer, cxListView, ImgList, dxSkinsCore,
  dxSkinsDefaultPainters, uPSComponent, dxSkinsdxRibbonPainter, uDAMemDataTable,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinSilver, dxSkinStardust, dxSkinSummer2008, dxSkinValentine,
  dxSkinXmas2008Blue, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSpringTime, uDARemoteDataAdapter;

type
  TfrmPantallaReportesFlotillas = class(TfrmCustomModule)
    ImageList1: TImageList;
    lvReportes: TcxListView;
    cdsReportes: TDACDSDataTable;
    rdaReportes: TDARemoteDataAdapter;
    procedure lvReportesDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure DespliegaReportes(Cual:Integer; Empleado:String);
  end;

var
  frmPantallaReportesFlotillas: TfrmPantallaReportesFlotillas;

implementation

uses Modules, uDMFlotillas, uDAInterfaces, ufrmPantallaParametrosFlotillas,
     LibraryFlotillas_Intf;

{$R *.dfm}

{ TfrmConsumos }

procedure TfrmPantallaReportesFlotillas.DespliegaReportes(Cual: Integer; Empleado:String);
var
  S:String;
  P: TParametrosF;
begin
  P:= TParametrosF.Create;

  try
  S:= 'SELECT ReporteID,Nombre,Tipo,Parametros,Template,SQL1,SQL2,CampoJoin,IdentificadorID FROM REPORTE';
  rdaReportes.GetDataCall.ParamByName('SQL').AsString:=S;
  rdaReportes.GetDataCall.ParamByName('Parametros').AsComplexType:= P;
  cdsReportes.Open;

  //cdsReportes.ParamByName('Tipo').AsInteger:=Cual;
  //cdsReportes.ParamByName('Identificador').AsInteger:= DMFlotillas.Identificador;
  //cdsReportes.ParamByName('USUARIOS').AsString:=Empleado;
  //cdsReportes.Open;

  while not cdsReportes.EOF do
  begin
    with lvReportes.Items.Add do
    begin
      Caption:=cdsReportes.FieldByName('Nombre').AsString;
      StateIndex:=cdsReportes.FieldByName('ReporteID').AsInteger;
      ImageIndex:=0;
    end;
    cdsReportes.Next;
  end;    // while

  finally
    P.Free;
  end;
end;

procedure TfrmPantallaReportesFlotillas.lvReportesDblClick(Sender: TObject);
begin
  inherited;
  if lvReportes.Selected <> nil then
  begin
    cdsReportes.Locate('ReporteID', lvReportes.Selected.StateIndex, []);
    DMFlotillas.Parametros:=ObtenParametros(cdsReportes.FieldByName('Parametros').AsString, cdsReportes.FieldByName('Nombre').AsString);
    if DMFlotillas.Parametros = nil then
      Exit;

    DMFlotillas.Imprimir(cdsReportes.FieldByName('SQL1').AsString,
                cdsReportes.FieldByName('SQL2').AsString,
                cdsReportes.FieldByName('Template').AsString,
                lvReportes.Selected.Caption,
                cdsReportes.FieldByName('CampoJoin').AsString);
  end;
end;

end.
