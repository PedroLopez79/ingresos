unit ufrmPassword;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, cxControls, cxContainer, cxEdit, cxTextEdit, Menus,
  cxLookAndFeelPainters, StdCtrls, cxButtons, cxLabel, UtileriasComun,
  cxGraphics, cxMaskEdit, cxDropDownEdit, cxImageComboBox, dxSkinsCore,
  dxSkinsDefaultPainters, cxLookAndFeels, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint;

type
  TfrmPassword = class(TForm)
    Image1: TImage;
    edtUsuario: TcxTextEdit;
    edtClave: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    btnAceptar: TcxButton;
    btnCancelar: TcxButton;
    cxLabel3: TcxLabel;
    tmrEntra: TTimer;
    cxLabel4: TcxLabel;
    cbServidor: TcxImageComboBox;
    //function ListaServidores: TStringList;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtClaveEnter(Sender: TObject);
    procedure edtClaveExit(Sender: TObject);
    procedure tmrEntraTimer(Sender: TObject);
    procedure cbServidorEnter(Sender: TObject);
    procedure cbServidorExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Valida: Integer;
    onValidar: TFuncLogin;
  end;

implementation
uses uDM;

{$R *.dfm}

procedure TfrmPassword.btnAceptarClick(Sender: TObject);
var
  Servidor: String;
begin
  try
    Servidor:='127.0.0.1';
    if (cbServidor.EditValue <> null) AND (cbServidor.EditValue <> '') then
      Servidor:=cbServidor.EditValue;
    Screen.Cursor:=crHourGlass;
    Valida:=onValidar(edtUsuario.Text, edtClave.Text, Servidor);
    if Valida >= 0 then
      Close
    else
    begin
      edtUsuario.Text:='';
      edtClave.Text:='';
      edtUsuario.SetFocus;
      beep;
    end;
  finally
    Screen.Cursor:=crDefault;
  end;
end;

procedure TfrmPassword.btnCancelarClick(Sender: TObject);
begin
  Application.Terminate;
  Close;
end;

procedure TfrmPassword.cbServidorEnter(Sender: TObject);
begin
  btnAceptar.Default:=True;
end;

procedure TfrmPassword.cbServidorExit(Sender: TObject);
begin
  btnAceptar.Default:=False;
end;

procedure TfrmPassword.edtClaveEnter(Sender: TObject);
begin
  if not cbServidor.Enabled then
    btnAceptar.Default:=True;
end;

procedure TfrmPassword.edtClaveExit(Sender: TObject);
begin
  if not cbServidor.Enabled then
    btnAceptar.Default:=False;
end;

procedure TfrmPassword.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key:=#0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmPassword.FormShow(Sender: TObject);
var
  S: String;
  Archivo: TStrings;
  I: Integer;
begin  
  Valida:=-1;
  S:=ExtractFileName(Application.ExeName);
  S:=Copy(S, 1, Length(S) - 4);
  S:='Servidores' + S + '.ini';
  S:=ExtractFilePath(Application.ExeName) + S;

  if FileExists(S) then
  begin

  Archivo:=TStringList.Create;
  try
      //Archivo:= ListaServidores;
    Archivo.LoadFromFile(S);
    cbServidor.Enabled:=True;
    cbServidor.Properties.Items.Clear;
    for I := 0 to Archivo.Count - 1 do
    begin
      with cbServidor.Properties.Items.Add do
      begin
        Description:=GetParsedItem(Archivo[I], '@', 0);
        Value:=GetParsedItem(Archivo[I], '@', 1);
        if I = 0 then
          cbServidor.EditValue:=Value;
      end;
    end;
  finally
    Archivo.Free;
  end;
  //end
  //else
  //begin
  //  cbServidor.EditValue:='';
  //  cbServidor.Enabled:=False;
  //end;
  tmrEntra.Enabled:=FindWindow('TAppBuilder', nil) > 0;
end;
end;

{function TfrmPassword.ListaServidores: TStringList;
begin
  DM.cdsConfiguracion.Close;
  DM.cdsConfiguracion.Open;
  Result:= TStringList.Create;;
  if DM.cdsConfiguracion.RecordCount > 0 then
  begin
    DM.cdsConfiguracion.First;
    Result.Add('Default@-1');
    while not DM.cdsConfiguracion.EOF do
    begin
      Result.Add(DM.cdsConfiguracion.FieldByName('NOMBRECOMERCIAL').AsString+'@'+DM.cdsConfiguracion.FieldByName('NUMEROESTACION').AsString);
      DM.cdsConfiguracion.Next;
    end;
  end;
end;}

procedure TfrmPassword.tmrEntraTimer(Sender: TObject);
begin
  tmrEntra.Enabled:=False;
  edtUsuario.Text:='SUPER';
  edtClave.Text:='CISTEM';
  btnAceptarClick(nil);
end;

end.
