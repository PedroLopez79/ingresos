unit ufrmPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
  dxRibbonForm, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinSilver, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinsdxBarPainter, dxSkinsdxRibbonPainter, dxStatusBar, dxRibbonStatusBar,
  cxClasses, dxRibbon, cxControls, dxBar, dxBarExtItems, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxGroupBox, ExtCtrls, dxSkinDarkSide, dxSkinPumpkin,
  dxSkinSpringTime, cxGraphics, cxLookAndFeels, dxSkinDarkRoom, dxSkinFoggy,
  dxSkinSeven, dxSkinSharp;

type
  TfrmPrincipal = class(TdxCustomRibbonForm)
    rbtExportar: TdxRibbonTab;
    Ribbon: TdxRibbon;
    dxRibbon1Tab2: TdxRibbonTab;
    rbtAcciones: TdxRibbonTab;
    dxBarManager1: TdxBarManager;
    tbCatalogos: TdxBar;
    tbExportar: TdxBar;
    tbRapida: TdxBar;
    tbAcciones: TdxBar;
    btnSalir: TdxBarButton;
    btnLogin: TdxBarButton;
    btnLogout: TdxBarButton;
    btnUsuarios: TdxBarLargeButton;
    btnEstaciones: TdxBarLargeButton;
    btnReprotes: TdxBarLargeButton;
    btnExportar: TdxBarLargeButton;
    btnNuevo: TdxBarLargeButton;
    btnGuardar: TdxBarLargeButton;
    btnCancelar: TdxBarLargeButton;
    btnImprimir: TdxBarLargeButton;
    btnCortar: TdxBarButton;
    btnCopiar: TdxBarButton;
    btnPegar: TdxBarButton;
    btnEliminar: TdxBarLargeButton;
    btnPrimer: TdxBarButton;
    btnAnteriior: TdxBarButton;
    btnSiguiente: TdxBarButton;
    btnUltimo: TdxBarButton;
    btnActualizar: TdxBarButton;
    btnBuscar: TdxBarButton;
    btnProcesar: TdxBarLargeButton;
    btnFacturar: TdxBarLargeButton;
    pnlPrincipal: TcxGroupBox;
    tmrPrincipal: TTimer;
    StatusBar: TdxRibbonStatusBar;
    procedure FormCreate(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure btnLogoutClick(Sender: TObject);
    procedure dxBarManager1ClickItem(Sender: TdxBarManager;
      ClickedItem: TdxBarItem);
    procedure tmrPrincipalTimer(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    function Boton(Cual: Integer): TdxBarLargeButton;
  end;

var
  frmPrincipal: TfrmPrincipal;

const
  TotalModulos = 4;
  Modulos: Array[1..TotalModulos] of string = ('Exportar',
                                               'Usuarios',
                                               'Estaciones',
                                               'Reportes');

implementation

uses
  uDM, dmImagenes, UtileriasComun, Modules, dmActions, LoginComun;
  
{$R *.dfm}

function TfrmPrincipal.Boton(Cual: Integer): TdxBarLargeButton;
var
  I: Integer;
begin
  Result:=nil;
  for I := 0 to ComponentCount - 1 do
  begin
    if (Components[I] is TdxBarLargeButton) and (Components[I].Tag = Cual) then
    begin
      Result:=TdxBarLargeButton(Components[I]);
      Break;
    end;
  end;
end;

procedure TfrmPrincipal.btnLoginClick(Sender: TObject);
var
  I: Integer;
begin
  if Login(DM.Login) >= 0 then
  if 1 >= 0 then
  begin
    DM.AsignaPermisos;
    btnLogin.Enabled:=False;
    btnLogout.Enabled:=True;
    for I := 1 to TotalModulos do
      Boton(I).Enabled:=DM.Seguridad.SeguridadPorNombre(Modulos[I]) <> nil;
    rbtExportar.Active:=True;
  end;
end;

procedure TfrmPrincipal.btnLogoutClick(Sender: TObject);
var
  I: Integer;
begin
  FreeAndNil(DM.Seguridad);
  ModuleInfoManager.CloseActiveModule;
  rbtAcciones.Visible:=False;
  btnLogin.Enabled:=True;
  btnLogout.Enabled:=False;
  for I := 1 to TotalModulos do
    Boton(I).Enabled:=False;
end;

procedure TfrmPrincipal.btnSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrincipal.dxBarManager1ClickItem(Sender: TdxBarManager;
  ClickedItem: TdxBarItem);
begin
  if ClickedItem.Tag > 0 then
    DM.ShowModuleByName(Modulos[ClickedItem.Tag]);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
const
  Dias  : Array[1..7] Of String = ('Domingo','Lunes','Martes','Miércoles','Jueves','Viernes','Sábado');
  Meses : Array[1..12] Of String = ('Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre');
var
  i : Byte;
begin
  Application.UpdateFormatSettings:=False;
  for i:=1 to 12 do
  begin
    LongMonthNames[i]:=Meses[i];
    ShortMonthNames[i]:=Copy(Meses[i],1 ,3);
    if i <= 7 then
    begin
      LongDayNames[i]:=Dias[i];
      ShortDayNames[i]:=Copy(Dias[i],1 ,3);
    end;
  end;
  ShortDateFormat:='dd/mm/yyyy';
  LongDateFormat:='dddd dd "de" mmmm "de" yyyy';
  ThousandSeparator:=',';
  DecimalSeparator:='.';
  DateSeparator:='/';
  CurrencyString:='$';
  CurrencyFormat:=0;
  NegCurrFormat:=1;
  CurrencyDecimals:=2;
  TimeSeparator:=':';
  TimeAMString:='AM';
  TimePMString:='PM';
  ColorRibbonSchema:=StrToInt(LeerRegistro('Skin', '1'));
  Ribbon.ColorSchemeName:=RibbonSchema[ColorRibbonSchema];
  DM.dxSkinController1.SkinName:=RibbonSchema[ColorRibbonSchema];
  StatusBar.Panels[5].Text:='Versión : ' + Version;
  tmrPrincipalTimer(nil);
  rbtAcciones.Visible:=False;
  UseLatestCommonDialogs:=False;
end;

procedure TfrmPrincipal.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (OkEnter) and (Key = #13) then
  begin
    Key:=#0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmPrincipal.tmrPrincipalTimer(Sender: TObject);
begin
  StatusBar.Panels[0].Text:=FormatDateTime('hh:nn:ss AMPM', Now);
  StatusBar.Panels[1].Text:=FormatDateTime('dddd dd mmmm yyyy', Now);
  if DM.Seguridad <> nil then
    StatusBar.Panels[2].Text:=DM.Seguridad.Nombre
  else
    StatusBar.Panels[2].Text:='';
end;

end.
