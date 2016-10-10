unit ufrmPantallaParametros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CustomModule, cxGraphics, Menus, cxLookAndFeelPainters, DB,
  uDADataTable, uDAScriptingProvider, uDACDSDataTable, cxSpinEdit,
  cxDropDownEdit, cxCalendar, cxImageComboBox, StdCtrls, cxButtons,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxCurrencyEdit, cxTextEdit,
  cxMaskEdit, cxTimeEdit, cxGroupBox, cxControls, cxContainer, cxEdit,
  cxRadioGroup, ExtCtrls, jpeg, LibraryIngresos_Intf, dxRibbonForm, cxClasses,
  dxRibbon, dxSkinsCore, dxSkinsDefaultPainters, uDAMemDataTable, uDAInterfaces,
  dxSkinsdxRibbonPainter, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinValentine, dxSkinXmas2008Blue, cxLookAndFeels, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinFoggy, dxSkinPumpkin, dxSkinSeven, dxSkinSharp,
  dxSkinSpringTime, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint, Vcl.ComCtrls, dxCore,
  cxDateUtils, dxRibbonSkins, uDAFields, uROComponent;

type
  TfrmPantallaParametros = class(TdxcustomRibbonForm)
    gbHora: TcxGroupBox;
    Label39: TLabel;
    Label40: TLabel;
    edtHoraIni: TcxTimeEdit;
    edtHoraFin: TcxTimeEdit;
    gbAlumnos: TcxGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    edtAlumnoIni: TcxCurrencyEdit;
    edtAlumnoFin: TcxCurrencyEdit;
    edtNombreAlumnoIni: TcxTextEdit;
    edtNombreAlumnoFin: TcxTextEdit;
    edtBuscaAlumnoIni: TcxButton;
    edtBuscaAlumnoFin: TcxButton;
    edtFormaDeCompra: TcxImageComboBox;
    edtDiaFacturar: TcxImageComboBox;
    gbAlumno: TcxGroupBox;
    Label8: TLabel;
    edtAlumno: TcxCurrencyEdit;
    edtNombreAlumno: TcxTextEdit;
    cxButton1: TcxButton;
    gbRangoFechas: TcxGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dtpInicial: TcxDateEdit;
    dtpFinal: TcxDateEdit;
    gbMaestros: TcxGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    edtMaestroIni: TcxCurrencyEdit;
    edtMaestroFin: TcxCurrencyEdit;
    edtNombreMaestroIni: TcxTextEdit;
    edtNombreMaestroFin: TcxTextEdit;
    s: TcxButton;
    btnCancelar: TcxButton;
    cdsDiaFacturar: TDACDSDataTable;
    cdsGrupo: TDACDSDataTable;
    dsGrupo: TDADataSource;
    dxRibbon1: TdxRibbon;
    dxRibbon1Tab1: TdxRibbonTab;
    cdsTipoTarjeta: TDACDSDataTable;
    cdsSerie: TDACDSDataTable;
    dsSerie: TDADataSource;
    cdsEstaciones: TDACDSDataTable;
    dsEstaciones: TDADataSource;
    gbHorario: TcxGroupBox;
    edtBuscaMaestroIni: TcxButton;
    edtBuscaMaestroFin: TcxButton;
    gbTurno: TcxGroupBox;
    Label5: TLabel;
    edtSecuencia: TcxCurrencyEdit;
    Label6: TLabel;
    cdsTurno: TDACDSDataTable;
    dsTurno: TDADataSource;
    dbcTurno: TcxLookupComboBox;
    gbFecha: TcxGroupBox;
    Label7: TLabel;
    dtpFecha: TcxDateEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtBuscaAlumnoIniClick(Sender: TObject);
    procedure sClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtAlumnoIniExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtAlumnoExit(Sender: TObject);
    procedure edtBuscaMaestroIniClick(Sender: TObject);
    procedure edtBuscaMaestroFinClick(Sender: TObject);
    procedure edtMaestroIniExit(Sender: TObject);
    procedure edtMaestroFinExit(Sender: TObject);
    procedure edtMaestroExit(Sender: TObject);
  private
    { Private declarations }
    procedure DatosAlumno(Alumno: TcxCurrencyEdit; Nombre: TcxTextEdit);
    procedure DatosMaestro(Maestro: TcxCurrencyEdit; Nombre: TcxTextEdit);
    function ControlAlumno(Cual: Integer): TcxCurrencyEdit;
    function ControlMaestro(Cual: Integer): TcxCurrencyEdit;
    function ControlMaestroNombre(Cual: Integer): TcxTextEdit;
    function ControlAlumnoNombre(Cual: Integer): TcxTextEdit;
  public
    { Public declarations }
    Parametros: TParametrosBI;
    procedure PrenderParametros(Cad : String);
  end;

function ObtenParametros(Parametros, Titulo: String): TParametrosBI;

var
  frmPantallaParametros: TfrmPantallaParametros;

implementation

uses uDM, uDMFlotillas, ufrmBuscarAlumno, ufrmBuscar, UtileriasComun, ufrmBuscarMaestro;

{$R *.dfm}

{ TfrmPantallaParametros }

function ObtenParametros(Parametros, Titulo: String): TParametrosBI;
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

procedure TfrmPantallaParametros.sClick(Sender: TObject);
begin
  inherited;
  Parametros.AlumnoIni:=edtAlumnoIni.EditValue;
  Parametros.AlumnoFin:=edtAlumnoFin.EditValue;
  Parametros.FechaIni:=0;
  Parametros.FechaFin:=65000;
  Parametros.NumeroEstacion:= DM.NumeroEstacion;


  if gbHorario.Visible then
  begin
    Parametros.HorarioIni:=dbcTurno.EditValue;
    Parametros.HorarioFin:=dbcTurno.EditValue;
  end;

  //Parametros.
  if gbAlumno.Visible then
  begin
    Parametros.AlumnoIni:=edtAlumno.EditValue;
    Parametros.AlumnoFin:=edtAlumno.EditValue;
  end;
  if gbRangoFechas.Visible then
  begin
    Parametros.FechaIni:=Trunc(dtpInicial.Date);
    Parametros.FechaFin:=Trunc(dtpFinal.Date) + MinSeg_59;
  end;
  if gbHora.Visible then
  begin
    Parametros.FechaIni:=Trunc(dtpInicial.Date) + edtHoraIni.EditValue;
    Parametros.FechaFin:=Trunc(dtpFinal.Date) + edtHoraFin.EditValue;
  end;
  {if gbEstaciones.Visible then
  begin
    Parametros.EstacionIni:=cxEstacionIni.EditValue;//edtEstacionIni.EditValue;
    Parametros.EstacionFin:=cxEstacionFin.EditValue;//edtEstacionFin.EditValue;
  end;}
  if gbTurno.Visible then
     Parametros.IDTurno:= edtSecuencia.EditValue;

  if gbFecha.Visible then
     Parametros.FechaIni:= dtpFecha.Date;

  ModalResult:=mrOK;
end;

procedure TfrmPantallaParametros.btnCancelarClick(Sender: TObject);
begin
  inherited;
  ModalResult:=mrCancel;
end;

function TfrmPantallaParametros.ControlAlumno(Cual: Integer): TcxCurrencyEdit;
begin
  case Cual of    //
   1: Result:=edtAlumnoIni;
   2: Result:=edtAlumnoFin;
   3: Result:=edtAlumno;
 else
   Result:=nil;
 end;    // case
end;

function TfrmPantallaParametros.ControlAlumnoNombre(
  Cual: Integer): TcxTextEdit;
begin
  case Cual of    //
   1: Result:=edtNombreAlumnoIni;
   2: Result:=edtNombreAlumnoFin;
   3: Result:=edtNombreAlumno;
 else
   Result:=nil;
 end;    // case
end;

function TfrmPantallaParametros.ControlMaestro(Cual: Integer): TcxCurrencyEdit;
begin
  case Cual of    //
   1: Result:=edtMaestroIni;
   2: Result:=edtMaestroFin;
   //3: Result:=edtMaestro;
 else
   Result:=nil;
 end;    // case
end;

function TfrmPantallaParametros.ControlMaestroNombre(
  Cual: Integer): TcxTextEdit;
begin
  case Cual of    //
   1: Result:=edtNombreMaestroIni;
   2: Result:=edtNombreMaestroFin;
   //3: Result:=edtNombreMaestro;
 else
   Result:=nil;
 end;    // case
end;

procedure TfrmPantallaParametros.DatosAlumno(Alumno: TcxCurrencyEdit;
  Nombre: TcxTextEdit);
var
  Aux: TDatos;
begin
  if (Alumno.EditValue <> null) and (Alumno.EditValue <> 0) then
  begin
    Aux:=DM.Servidor.DatosAlumno(Alumno.EditValue);
    if Aux <> nil then
    begin
      Nombre.Text:=Aux.Nombre;
      Aux.Free;
    end
    else
      Application.MessageBox('Cliente no existe.', 'Error', MB_OK+MB_ICONHAND+MB_DEFBUTTON1+MB_APPLMODAL);
  end
end;

procedure TfrmPantallaParametros.DatosMaestro(Maestro: TcxCurrencyEdit;
  Nombre: TcxTextEdit);
var
  Aux: TDatos;
begin
  if (Maestro.EditValue <> null) and (Maestro.EditValue <> 0) then
  begin
    Aux:=DM.Servidor.DatosMaestro(Maestro.EditValue);
    if Aux <> nil then
    begin
      Nombre.Text:=Aux.Nombre;
      Aux.Free;
    end
    else
      Application.MessageBox('Maestro no existe.', 'Error', MB_OK+MB_ICONHAND+MB_DEFBUTTON1+MB_APPLMODAL);
  end
end;

procedure TfrmPantallaParametros.edtBuscaAlumnoIniClick(Sender: TObject);
var
  Datos : TDatosBusqueda;
begin
  inherited;
  Datos:= PantallaBusqueda(TfrmBuscarAlumno,'');
  if Datos.OK then
  begin
    ControlAlumno((Sender As TControl).Tag).Value:=Datos.Clave;
    DatosAlumno(ControlAlumno((Sender As TControl).Tag), ControlAlumnoNombre((Sender As TControl).Tag));
  end;
end;

procedure TfrmPantallaParametros.edtBuscaMaestroFinClick(Sender: TObject);
var
  Datos : TDatosBusqueda;
begin
  inherited;
  Datos:= PantallaBusqueda(TfrmBuscarMaestro,'');
  if Datos.OK then
  begin
    ControlMaestro((Sender As TControl).Tag).Value:=Datos.Clave;
    DatosMaestro(ControlMaestro((Sender As TControl).Tag), ControlMaestroNombre((Sender As TControl).Tag));
  end;
end;

procedure TfrmPantallaParametros.edtBuscaMaestroIniClick(Sender: TObject);
var
  Datos : TDatosBusqueda;
begin
  inherited;
  Datos:= PantallaBusqueda(TfrmBuscarMaestro,'');
  if Datos.OK then
  begin
    ControlMaestro((Sender As TControl).Tag).Value:=Datos.Clave;
    DatosMaestro(ControlMaestro((Sender As TControl).Tag), ControlMaestroNombre((Sender As TControl).Tag));
  end;
end;

procedure TfrmPantallaParametros.edtMaestroExit(Sender: TObject);
begin
  DatosMaestro(ControlMaestro((Sender As TControl).Tag), ControlMaestroNombre((Sender As TControl).Tag));
end;

procedure TfrmPantallaParametros.edtMaestroFinExit(Sender: TObject);
begin
  DatosMaestro(ControlMaestro((Sender As TControl).Tag), ControlMaestroNombre((Sender As TControl).Tag));
end;

procedure TfrmPantallaParametros.edtMaestroIniExit(Sender: TObject);
begin
  DatosMaestro(ControlMaestro((Sender As TControl).Tag), ControlMaestroNombre((Sender As TControl).Tag));
end;

procedure TfrmPantallaParametros.edtAlumnoExit(Sender: TObject);
begin
  DatosAlumno(ControlAlumno((Sender As TControl).Tag), ControlAlumnoNombre((Sender As TControl).Tag));
end;

procedure TfrmPantallaParametros.edtAlumnoIniExit(Sender: TObject);
begin
  inherited;
  DatosAlumno(ControlAlumno((Sender As TControl).Tag), ControlalumnoNombre((Sender As TControl).Tag));
end;

procedure TfrmPantallaParametros.FormCreate(Sender: TObject);
begin
  inherited;
  dxRibbon1.ColorSchemeName:=RibbonSchema[ColorRibbonSchema];
  Parametros:=TParametrosBI.Create;


  dtpInicial.Date:=Trunc(Now);
  dtpFinal.Date:=Trunc(Now);


  //cdsGrupo.Open;
  //cdsTurno.Close;
  //cdsTurno.Open;
  {cdsEstaciones.Open;
  cxEstacionIni.EditValue:=cdsEstaciones.FieldByName('EstacionID').AsInteger;
  cdsEstaciones.Last;
  cxEstacionFin.EditValue:=cdsEstaciones.FieldByName('EstacionID').AsInteger;}

end;

procedure TfrmPantallaParametros.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
  begin
    Key:=#0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmPantallaParametros.FormShow(Sender: TObject);
begin
  Width:=630;
  Height:=530;
end;

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
  PrenderControl(gbRangoFechas, Pos('B', Cad) > 0);
  PrenderControl(gbHora, Pos('C', Cad) > 0);
  PrenderControl(gbAlumno, Pos('D', Cad) > 0);
  PrenderControl(gbAlumnos, Pos('E', Cad) > 0);
  PrenderControl(gbHorario, Pos('F', Cad) > 0);
  PrenderControl(gbMaestros, Pos('G', Cad) > 0);
  PrenderControl(gbTurno, Pos('S', Cad) > 0);
  PrenderControl(gbFecha, Pos('O', Cad) > 0);
end;

end.
