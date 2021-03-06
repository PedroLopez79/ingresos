unit uTurnoxFecha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DateUtils, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, cxButtons, ComCtrls, LibraryIngresos_Intf,
  uDAScriptingProvider, uDADataTable, uDAMemDataTable, uROComponent,
  uDACDSDataTable, uDADataAdapter, uDARemoteDataAdapter, cxControls,
  dxRibbonSkins, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint, dxSkinsdxRibbonPainter,
  cxClasses, dxRibbon, ufrmPrincipal;

type
  TFo_TurnoxFecha = class(TForm)
    Panel1: TPanel;
    Pa_ayuda: TPanel;
    Label6: TLabel;
    Bevel1: TBevel;
    CBB_Turnos: TComboBox;
    Button2: TButton;
    Label4: TLabel;
    Label5: TLabel;
    rdaObtenTurno: TDARemoteDataAdapter;
    cdsObtenTurno: TDACDSDataTable;
    dxRibbon1: TdxRibbon;
    dxRibbon1Tab1: TdxRibbonTab;
    Button1: TButton;
    procedure CBB_TurnosChange(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    IDTURNO: Integer;
  public
    { Public declarations }
  end;

var
  Fo_TurnoxFecha: TFo_TurnoxFecha;
  FechaTurnos: DateTime;

function Abrir_ModuloTurnoxFecha(TurnoxFecha: ATTurnoxFecha; Fecha: DateTime):Integer;

implementation
uses  uDM;

{$R *.dfm}

function Abrir_ModuloTurnoxFecha(TurnoxFecha: ATTurnoxFecha; Fecha: DateTime):Integer;
var
  i:Integer;
Begin
  FechaTurnos:= Fecha;
  Fo_TurnoxFecha:=TFo_TurnoxFecha.Create(Application);
  Fo_TurnoxFecha.IDTURNO:= -1;
  i:= TurnoxFecha.Count;

  for i := 0 to TurnoxFecha.Count - 1 do
  begin
    Fo_TurnoxFecha.CBB_Turnos.Items.Add(inttostr(TurnoxFecha.Items[i].IDTURNO));
  end;
    Fo_TurnoxFecha.CBB_Turnos.Items.Add('AGREGAR UNA SECUENCIA...');

  Fo_TurnoxFecha.ShowModal;

  Result:= Fo_TurnoxFecha.IDTURNO;

  Fo_TurnoxFecha.Free;
End;

procedure TFo_TurnoxFecha.Button1Click(Sender: TObject);
begin
  IDTURNO:= -1;
  Close;
end;

procedure TFo_TurnoxFecha.Button2Click(Sender: TObject);
begin
  if (IDTURNO > 0) AND (CBB_Turnos.Text = 'AGREGAR UNA SECUENCIA...') then
  begin
     DM.Servidor.AbreTurno(IDTURNO,DM.NumeroEstacion,FechaTurnos);
  end;
  Fo_TurnoxFecha.Close;
end;

procedure TFo_TurnoxFecha.CBB_TurnosChange(Sender: TObject);
var
  S: String;
  P: TParametrosBI;
begin
  if CBB_Turnos.Text = 'AGREGAR UNA SECUENCIA...' then
  begin
    Try
    P:= TParametrosBI.Create;
    P.NumeroEstacion:= DM.NumeroEstacion;
    S:= 'SELECT ISNULL(MAX(IDTURNO),0) + 1 AS IDTURNO FROM INGRESOS WHERE NUMEROESTACION= @NUMEROESTACION';
        rdaObtenTurno.GetDataCall.ParamByName('SQL').AsString:=S;
        rdaObtenTurno.GetDataCall.ParamByName('Parametros').AsComplexType:= P;
        cdsObtenTurno.Open;

    IDTURNO:= cdsObtenTurno.FieldByName('IDTURNO').AsInteger;
    label4.Caption:= cdsObtenTurno.FieldByName('IDTURNO').AsString;

    Label5.Visible:= True;
    Label4.Visible:= True;
    Finally
      P.Free;
    End;
  end else
  begin
    Label5.Visible:= False;
    Label4.Visible:= False;
    Fo_TurnoxFecha.Label4.Caption:= CBB_Turnos.Text;
    IDTURNO:= strtoint(CBB_Turnos.Text);
  end;

end;

end.
