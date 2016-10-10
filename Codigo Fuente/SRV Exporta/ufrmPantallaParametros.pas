unit ufrmPantallaParametrosExporta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls,
  cxControls, cxContainer, cxEdit,
  cxGroupBox, cxTextEdit, cxCurrencyEdit, cxMaskEdit, cxSpinEdit,
  cxTimeEdit, cxButtons, cxRadioGroup, cxDropDownEdit, cxCalendar,
  cxImageComboBox, DB, uDADataTable, uDAScriptingProvider, uDACDSDataTable,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, jpeg,
  cxGraphics, Menus, cxLookAndFeelPainters, cxClasses, dxRibbonForm, dxRibbon,
  dxSkinsCore, dxSkinsDefaultPainters, uDAInterfaces, uDAMemDataTable,
  dxSkinsdxRibbonPainter, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinValentine, dxSkinXmas2008Blue, ExportaLibrary_Intf, dxSkinDarkSide,
  dxSkinPumpkin, dxSkinSpringTime, cxLookAndFeels, dxSkinDarkRoom, dxSkinFoggy,
  dxSkinSeven, dxSkinSharp;

type
  TfrmPantallaParametros = class(TdxCustomRibbonForm)
    gbTurnos: TcxGroupBox;
    Label12: TLabel;
    gbRangoFechas: TcxGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dtpInicial: TcxDateEdit;
    dtpFinal: TcxDateEdit;
    gbHora: TcxGroupBox;
    Label39: TLabel;
    Label40: TLabel;
    edtHoraIni: TcxTimeEdit;
    edtHoraFin: TcxTimeEdit;
    btnAceptar: TcxButton;
    btnCancelar: TcxButton;
    edtTurnoIni: TcxCurrencyEdit;
    dxRibbon1: TdxRibbon;
    gbEstaciones: TcxGroupBox;
    Label3: TLabel;
    edtTurnoFin: TcxCurrencyEdit;
    Label4: TLabel;
    Label5: TLabel;
    cdsEstaciones: TDAMemDataTable;
    dsEstaciones: TDADataSource;
    cbEstacionIni: TcxLookupComboBox;
    cbEstacionFin: TcxLookupComboBox;
    gbPoliza: TcxGroupBox;
    Label6: TLabel;
    edtPoliza: TcxCurrencyEdit;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure cbEstacionIniExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Parametros: TParametrosExporta;
    procedure PrenderParametros(Cad : String);
  end;

function ObtenParametros(Parametros, Titulo: String): TParametrosExporta;

implementation

uses uDM, UtileriasComun;

{$R *.dfm}

function ObtenParametros(Parametros, Titulo: String): TParametrosExporta;
var
  Aux: TfrmPantallaParametros;
begin
  Result:=nil;
  Aux:=TfrmPantallaParametros.Create(nil);
  Aux.Caption:=Titulo;
  Aux.PrenderParametros(Parametros);
  if Aux.ShowModal = mrOK then
    Result:=Aux.Parametros;
  Aux.Free;
end;

{ TfrmPantallaReportes }

procedure TfrmPantallaParametros.PrenderParametros(Cad: String);
var
  i, j : Integer;
procedure PrenderControl(AControl: TCustomControl; AVisible: Boolean);
begin
  AControl.Visible:=AVisible;
  if (AVisible) and (AControl.Tag <> 888) then
  begin
    AControl.Left := 8;
    AControl.Top := j;
    AControl.TabOrder := i;
    j:=j + 8 + AControl.Height;
    Inc(i);
  end;
end;

begin
  i:=0;
  J:=48;
  PrenderControl(gbRangoFechas, Pos('A', Cad) > 0);
  PrenderControl(gbHora, Pos('B', Cad) > 0);
  PrenderControl(gbTurnos, Pos('C', Cad) > 0);
  PrenderControl(gbEstaciones, Pos('D', Cad) > 0);
  PrenderControl(gbPoliza, Pos('E', Cad) > 0);
  cdsEstaciones.Open;
  cbEstacionIni.EditValue:=cdsEstaciones.FieldByName('EstacionID').AsInteger;
  cbEstacionFin.EditValue:=cdsEstaciones.FieldByName('EstacionID').AsInteger;
end;

procedure TfrmPantallaParametros.btnCancelarClick(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure TfrmPantallaParametros.cbEstacionIniExit(Sender: TObject);
begin
  cbEstacionFin.EditValue:=cbEstacionIni.EditValue;
end;

procedure TfrmPantallaParametros.FormCreate(Sender: TObject);
begin
  Width:=600;
  Height:=500;

  dxRibbon1.ColorSchemeName:=RibbonSchema[ColorRibbonSchema];
  Parametros:=TParametrosExporta.Create;
  dtpInicial.Date:=Trunc(Now);
  dtpFinal.Date:=Trunc(Now);
end;


procedure TfrmPantallaParametros.btnAceptarClick(Sender: TObject);
begin
  Parametros.FechaIni:=Trunc(dtpInicial.Date);
  Parametros.FechaFin:=Trunc(dtpFinal.Date) + MinSeg_59;
  if gbHora.Visible then
  begin
    Parametros.FechaIni:=Trunc(dtpInicial.Date) + edtHoraIni.Time;
    Parametros.FechaFin:=Trunc(dtpFinal.Date) + edtHoraFin.Time;
  end;
  Parametros.TurnoINI:=edtTurnoIni.EditValue;
  Parametros.TurnoFIN:=edtTurnoFin.EditValue;
  Parametros.EstacionINI:=cbEstacionIni.EditValue;
  Parametros.EstacionFIN:=cbEstacionFin.EditValue;
  Parametros.Poliza:=edtPoliza.EditValue;
  ModalResult:=mrOK;
end;

procedure TfrmPantallaParametros.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    Key:=#0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

end.
