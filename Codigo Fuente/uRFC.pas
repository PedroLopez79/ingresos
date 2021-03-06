unit uRFC;

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
  dxSkinValentine, dxSkinXmas2008Blue, cxButtons, ComCtrls,
  uDAScriptingProvider, uDADataTable, uDAMemDataTable, uROComponent;

type
  TFo_AyudaRFC = class(TForm)
    Panel1: TPanel;
    Pa_ayuda: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Ed_ApellidoPat: TEdit;
    Ed_ApellidoMat: TEdit;
    Ed_Nombre: TEdit;
    FechaNac: TDateTimePicker;
    Bevel1: TBevel;
    Button1: TButton;
    Ed_RFC: TEdit;
    Button2: TButton;
    CB_Entidad: TComboBox;
    spObtenRFC: TDAMemDataTable;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fo_AyudaRFC: TFo_AyudaRFC;

function Abrir_ModuloAyudaRFC(APELLIDOP, APELLIDOM, NOMBRES, SEXO: String;
                               FECHANAC: TDateTime):String;

implementation
uses  uDM;

{$R *.dfm}

function Abrir_ModuloAyudaRFC(APELLIDOP, APELLIDOM, NOMBRES, SEXO: String;
                               FECHANAC: TDateTime):String;
Begin
  Fo_ayudaRFC:=TFo_ayudaRFC.Create(Application);

  Fo_ayudaRFC.Ed_ApellidoPat.Text:= APELLIDOP;
  Fo_ayudaRFC.Ed_ApellidoMat.Text:= APELLIDOM;
  Fo_ayudaRFC.Ed_Nombre.Text:= NOMBRES;
  Fo_ayudaRFC.FechaNac.Date:= FECHANAC;

  Fo_ayudaRFC.ShowModal;

  Result:= Fo_ayudaRFC.Ed_RFC.Text;
  Fo_ayudaRFC.Free;
End;

procedure TFo_AyudaRFC.Button1Click(Sender: TObject);
begin
  spObtenRFC.Close;
  spObtenRFC.ParamByName('NOMBRES').AsString:= Ed_Nombre.Text;
  spObtenRFC.ParamByName('AMATERNO').AsString:= Ed_ApellidoMat.Text;
  spObtenRFC.ParamByName('APATERNO').AsString:= Ed_ApellidoPat.Text;
  spObtenRFC.ParamByName('FECHANAC').AsDateTime:= FechaNac.Date;
  spObtenRFC.Open;
  Ed_RFC.text:= spObtenRFC.FieldByName('RFC').AsString;
end;

procedure TFo_AyudaRFC.Button2Click(Sender: TObject);
begin
  Close;
end;

end.
