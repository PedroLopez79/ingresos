unit uCurp;

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
  dxSkinValentine, dxSkinXmas2008Blue, cxButtons, ComCtrls;

type
  TFo_AyudaCurp = class(TForm)
    Panel1: TPanel;
    Pa_ayuda: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Ed_ApellidoPat: TEdit;
    Ed_ApellidoMat: TEdit;
    Ed_Nombre: TEdit;
    FechaNac: TDateTimePicker;
    Bevel1: TBevel;
    Button1: TButton;
    Ed_Curp: TEdit;
    CB_Sexo: TComboBox;
    CB_Entidad: TComboBox;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fo_AyudaCurp: TFo_AyudaCurp;

function Abrir_ModuloAyudaCurp(APELLIDOP, APELLIDOM, NOMBRES, SEXO: String;
                               FECHANAC: TDateTime):String;

implementation

{$R *.dfm}

function Abrir_ModuloAyudaCurp(APELLIDOP, APELLIDOM, NOMBRES, SEXO: String;
                               FECHANAC: TDateTime):String;
Begin
  Fo_ayudaCurp:=TFo_ayudaCurp.Create(Application);

  Fo_AyudaCurp.Ed_ApellidoPat.Text:= APELLIDOP;
  Fo_AyudaCurp.Ed_ApellidoMat.Text:= APELLIDOM;
  Fo_AyudaCurp.Ed_Nombre.Text:= NOMBRES;

  if SEXO = 'M' then Fo_AyudaCurp.CB_Sexo.Text:= '0: Masculino'
  else Fo_AyudaCurp.CB_Sexo.Text:= '1: Femenino';

  Fo_AyudaCurp.FechaNac.Date:= FECHANAC;
  

  Fo_ayudaCurp.ShowModal;

  Result:= Fo_ayudaCurp.Ed_Curp.Text;
  Fo_ayudaCurp.Free;
End;

Function cadena1(ApellidoPat:string):string;
var
  i : integer; curp,car: string;
begin
  curp := '';
  if (ApellidoPat <> '') then begin
    car := copy(ApellidoPat,1,1); curp:= curp + car;
    for i:=2 to length(ApellidoPat) do begin
      car := copy(ApellidoPat,i,1);
      if car[1] in ['A','E','I','O','U','Á','É','Í','Ó','Ú'] then begin
         curp := curp + car[1]; cadena1:= curp; break;
      end;
    end;
  end;
end;

Function cadena2(ApellidoMat:string):string;
var
  i : integer; curp,car: string;
begin
  if (ApellidoMat = '') then begin cadena2 := 'X' end
  else cadena2 := copy(ApellidoMat,1,1);
end;

Function cadena3(Nombres:string):string;
var
  x,i : integer; buff,curp,car: string;
begin
  buff := ''; car := ''; x:=1;
  buff := copy(Nombres,x,1);
  for i:=1 to length(Nombres) do begin
     buff := copy(Nombres,i,1); car := car + buff;
     if buff = ' ' then break;
  end;
  if (car = 'MARIA ') or (car = 'JOSE ') then begin
     buff := Copy(Nombres,i+1,1); curp:= curp + buff;
  end else begin
     buff := Copy(Nombres,1,1); curp:= curp + buff;
  end;
  cadena3 := curp;
end;

Function cadena4(texto: string):string;
var
  x,i :integer; buff,curp,car: string;
begin
  buff:= ''; x:=2;

  for x:=1 to length(texto) do begin
     buff := copy(texto,x,1); car := car + buff;
     if buff = ' ' then break;
  end;

  if (car = 'MARIA ') or (car = 'JOSE ') then begin
     x:= x + 1;
  end else begin x := 2; end;

  buff:= Copy(texto,x,1);
  while(buff <> ' ') do begin
     if buff = '' then break;
     if buff[1] in ['A','E','I','O','U','Á','É','Í','Ó','Ú'] then begin
        inc(x); buff:= copy(texto,x,1);
        if(buff = ' ') then curp := curp + 'X';
     end
     else begin curp:= curp + buff; buff := ' '; end;
  end; if (buff = '') then begin curp := curp + 'X'  end;
  cadena4 := curp;
end;

Function HomoClave(fecha:string):String;
begin
   if strtoint(fecha) < 2000 then
   begin
      HomoClave := '0';
   end else
   begin
      HomoClave := 'A';
   end;
end;

Function VerificadorCurp(ip_curp:string):String;
var
   I_res,I_Car: string;  I_Vals   : string;
   I_acum     : string;  I_digito : string;
   I_posicion : integer; I_residuo: real;
   I_Valor    : integer; I_i,I_i2,c   : integer;
const
   arreglo1: array[1..37] of string = ('0','1','2','3','4','5','6','7','8','9',
               'A','B','C','D','E','F','G','H','I','J','K','L','M','N','Ñ','O',
               'P','Q','R','S','T','U','V','W','X','Y','Z');

   arreglo2: array[1..37] of string = ('00','01','02','03','04','05','06','07',
              '08','09','10','11','12','13','14','15','16','17','18','19','20',
              '21','22','23','24','25','26','27','28','29','30','31','32','33',
              '34','35','36');
begin
  if length(ip_curp) < 16 then begin
     showmessage('Error debe recibir los primeros 17 digitos de la curp');
  end;
  I_acum:= '0';
  for I_i := 0 To length(ip_curp) do begin
      I_Car := Copy(ip_Curp,I_i + 1,1);
      if (I_Car = '') then I_Car := '*';
      for c:=1 to 37 do begin
          if arreglo1[c] = I_Car then begin
             I_Posicion := c; break;
          end else begin I_Posicion := -1 end;
      end;
      if I_Posicion > -1 then begin
         I_Vals := arreglo2[I_Posicion];
      end
      else begin
         I_Vals := '0';
      end;
      I_acum := inttostr (strtoint(I_acum) + (strtoint(I_Vals) * (19 - (I_i + 1))));
  end;
  I_residuo := strtoint(I_acum) / 10;
  I_res := copy (floattostr(I_residuo),length(floattostr(I_residuo)),1);
  if  I_res = '0' then begin VerificadorCurp:='0';
  end else begin
  VerificadorCurp := floattostr(abs (10 - strtofloat(I_res)));
  end;
end;

procedure TFo_AyudaCurp.Button1Click(Sender: TObject);
var
  Curp, Sex,fec : string;
  Year, Month, Day: Word;
  Hour2, Min2, Sec2, Milli2 : Word;

  CadFec: String;
begin
  Sex := copy(CB_Sexo.Text,1,1);
  if Sex = '0' then Sex := 'H'; if Sex = '1' then Sex := 'M';
  DecodeDateTime(FechaNac.Date, Year, Month, Day, Hour2, Min2, Sec2, Milli2);
  CadFec:= copy(inttostr(year),3,2);

  if Month < 10 then
     CadFec:= CadFec + '0' + inttostr(Month) + inttostr(Day)
  else CadFec:= CadFec + inttostr(Month) + inttostr(Day);

  if  (Ed_Nombre.Text <> '') then begin
      Curp :=cadena1(Ed_ApellidoPat.Text) + cadena2(Ed_ApellidoMat.Text) +
      cadena3(Ed_Nombre.text)+ CadFec +
      Sex + copy(CB_Entidad.Text,1,2)        + cadena4(Ed_ApellidoPat.Text)  +
      cadena4(Ed_ApellidoMat.Text)           + cadena4(Ed_Nombre.Text)       +
      HomoClave(inttostr(year));

      Ed_curp.text:= Curp + VerificadorCurp(Curp);
  end;
end;

procedure TFo_AyudaCurp.Button2Click(Sender: TObject);
begin
  Close;
end;

end.
