unit uAgregarVenta;

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
  cxClasses, dxRibbon, ufrmPrincipal, cxContainer, cxEdit, cxTextEdit,
  cxCurrencyEdit;

type
  TFo_AgregarVenta = class(TForm)
    Panel1: TPanel;
    Pa_ayuda: TPanel;
    Label6: TLabel;
    CBB_Turnos: TComboBox;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    rdaObtenTurno: TDARemoteDataAdapter;
    cdsObtenTurno: TDACDSDataTable;
    dxRibbon1: TdxRibbon;
    dxRibbon1Tab1: TdxRibbonTab;
    Button1: TButton;
    edtCliente: TcxCurrencyEdit;
    btnBuscaCliente: TcxButton;
    Label7: TLabel;
    cxCurrencyEdit1: TcxCurrencyEdit;
    Label8: TLabel;
    cxCurrencyEdit2: TcxCurrencyEdit;
    Label9: TLabel;
    Label10: TLabel;
    cxCurrencyEdit3: TcxCurrencyEdit;
    Label11: TLabel;
    cxCurrencyEdit4: TcxCurrencyEdit;
    cxCurrencyEdit5: TcxCurrencyEdit;
    procedure CBB_TurnosChange(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    IDTURNO: Integer;
  public
    { Public declarations }
  end;

var
  Fo_AgregarVenta: TFo_AgregarVenta;

function Abrir_ModuloTurnoxFecha(TurnoxFecha: ATTurnoxFecha):Integer;

implementation
uses  uDM;

{$R *.dfm}

function Abrir_ModuloTurnoxFecha(TurnoxFecha: ATTurnoxFecha):Integer;
var
  i:Integer;
Begin
  Fo_AgregarVenta:=TFo_AgregarVenta.Create(Application);
  Fo_AgregarVenta.IDTURNO:= -1;
  i:= TurnoxFecha.Count;

  for i := 0 to TurnoxFecha.Count - 1 do
  begin
    Fo_AgregarVenta.CBB_Turnos.Items.Add(inttostr(TurnoxFecha.Items[i].IDTURNO));
  end;
    Fo_AgregarVenta.CBB_Turnos.Items.Add('AGREGAR UNA SECUENCIA...');

  Fo_AgregarVenta.ShowModal;

  Result:= strtoint(Fo_AgregarVenta.Label4.Caption);
  Fo_AgregarVenta.Free;
End;

procedure TFo_AgregarVenta.Button2Click(Sender: TObject);
begin
  if (IDTURNO > 0) then
  begin
     DM.Servidor.AbreTurno(IDTURNO,DM.NumeroEstacion);
  end;
  Fo_AgregarVenta.Close;
end;

procedure TFo_AgregarVenta.CBB_TurnosChange(Sender: TObject);
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
    Fo_AgregarVenta.Label4.Caption:= CBB_Turnos.Text;
  end;

end;

end.