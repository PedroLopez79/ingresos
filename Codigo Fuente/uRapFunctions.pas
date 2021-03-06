{ $HDR$}
{**********************************************************************}
{ Unit archived using Team Coherence                                   }
{ Team Coherence is Copyright 2002 by Quality Software Components      }
{                                                                      }
{ For further information / comments, visit our WEB site at            }
{ http://www.TeamCoherence.com                                         }
{**********************************************************************}
{}
{ $Log:  10494: uRapFunctions.pas 
{
{   Rev 1.0    10/06/2008 11:25:08 AM  Marks
{ Version .62
}
{
{   Rev 1.0    31/07/2007 9:51:04 AM  Marco
{ Inicial
}
{
{   Rev 1.0    24/06/2007 7:40:54 PM  Marco
{ Inicio
}
{
{   Rev 1.0    09/05/2007 11:12:40 AM  Marco
{ Funciones en el reporteador
}
{
{   Rev 1.0    24/07/2006 11:38:10 AM  Supervisor
{ 24 Julio 2006
}
{
{   Rev 1.0    04/07/2003 10:47:46 AM  Supervisor    Version: 1.0.0
{ Inicio TimexCard
}
unit uRapFunctions;

interface

uses
  raFunc, ppRTTI, SysUtils;

type
  { TmyParametrosFunction }
  TmyParametrosFunction = class(TraSystemFunction)
    procedure ExecuteFunction(aParams: TraParamList); override;
    class function GetSignature: String; override;
    class function Category: String; override;
  end;

  { TmyRawPrintFunction }
  TmyRawPrintFunction = class(TraSystemFunction)
    procedure ExecuteFunction(aParams: TraParamList); override;
    class function GetSignature: String; override;
    class function Category: String; override;
  end;

  { TmyNumeroALetraFunction }
  TmyNumeroALetraFunction = class(TraSystemFunction)
    procedure ExecuteFunction(aParams: TraParamList); override;
    class function GetSignature: String; override;
    class function Category: String; override;
  end;

  { TmyModulo10Function }
  TmyModulo10 = class(TraSystemFunction)
    procedure ExecuteFunction(aParams: TraParamList); override;
    class function GetSignature: String; override;
    class function Category: String; override;
  end;

  { TmyIDToClave }
  TmyIDToClaveFunction = class(TraSystemFunction)
    procedure ExecuteFunction(aParams: TraParamList); override;
    class function GetSignature: String; override;
    class function Category: String; override;
  end;


implementation

uses uDM, UtileriasComun;


{**********************    Parametros    **************************}
class function TmyParametrosFunction.GetSignature: String;
begin
  result := 'function ValorParametro(Cual : Integer) : Variant;';
end;


procedure TmyParametrosFunction.ExecuteFunction(aParams: TraParamList);
var
  Cual : Integer;
  Valor : Variant;
begin
  GetParamValue(0, Cual);
  Valor := DM.ValorParametro(Cual);
  SetParamValue(1, Valor);
end;

class function TmyParametrosFunction.Category: String;
begin
  Result:= 'Utility';
end;

{ TmyNumeroALetraFunction }

class function TmyNumeroALetraFunction.Category: String;
begin
  Result:= 'Utility';
end;

procedure TmyNumeroALetraFunction.ExecuteFunction(aParams: TraParamList);
var
  Numero: Real;
  Moneda: Integer;
  Texto: String;
begin
  GetParamValue(0, Numero);
  GetParamValue(1, Moneda);
  Texto := NumeroATexto(Numero, Moneda);
  SetParamValue(2, Texto);
end;

class function TmyNumeroALetraFunction.GetSignature: String;
begin
  result := 'function NumeroATexto(Numero: Double; Moneda: Integer): String;';
end;

{ TmyRawPrintFunction }

class function TmyRawPrintFunction.Category: String;
begin
  Result:= 'Utility';
end;

procedure TmyRawPrintFunction.ExecuteFunction(aParams: TraParamList);
var
  Texto, Impresora: String;
begin
  GetParamValue(0, Texto);
  GetParamValue(1, Impresora);
  DM.RawPrint(Texto, Impresora);
end;

{ TmyIDToClaveFunction }

class function TmyIDToClaveFunction.Category: String;
begin
  Result:= 'Utility';
end;

procedure TmyIDToClaveFunction.ExecuteFunction(aParams: TraParamList);
var
  ID: Integer;
  Clave: String;
begin
  GetParamValue(0, ID);
  Clave := IDToClave(ID);
  SetParamValue(1, Clave);
end;

class function TmyIDToClaveFunction.GetSignature: String;
begin
  result := 'function IDToClave(ID: Integer): String;';
end;

class function TmyRawPrintFunction.GetSignature: String;
begin
  result := 'procedure RawPrint(Texto, Impresora: String);';
end;

{ TmySecuenciasDeCorteFunction }


{ TmyModulo10 }

class function TmyModulo10.Category: String;
begin
  Result:= 'Utility';
end;

procedure TmyModulo10.ExecuteFunction(aParams: TraParamList);
var
  Result: integer;
  Texto: String;
begin
  GetParamValue(0, Texto);
  Result:=  DM.Modulo10(Texto);
end;

class function TmyModulo10.GetSignature: String;
begin
  result := 'function Modulo10(Valor : String) : Integer;';
end;

initialization
  raRegisterFunction('ValorParametro', TmyParametrosFunction);
  raRegisterFunction('NumeroATexto', TmyNumeroALetraFunction);
  raRegisterFunction('RawPrint', TmyRawPrintFunction);
  raRegisterFunction('Modulo10', TmyModulo10);
  raRegisterFunction('IDToClave', TmyIDToClaveFunction);

finalization
  raUnRegisterFunction('ValorParametro');
  raUnRegisterFunction('NumeroATexto');
  raUnRegisterFunction('RawPrint');
  raUnRegisterFunction('Modulo10');
  raUnRegisterFunction('IDToClave');

end.
