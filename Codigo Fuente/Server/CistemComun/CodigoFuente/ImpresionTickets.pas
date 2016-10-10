unit ImpresionTickets;

interface

uses
  SysUtils, Classes, Contnrs, CPort, Graphics;

type
  TFormato = class
    Codigo: String;
    Comando: string;
    TotalCaracteres: Integer;
    Integrado: Boolean;
  end;

  TFormatos = class
  private
    FList: TObjectList;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Agregar(Codigo, Comando: String; TotalCaracteres: Integer; Integrado: Boolean);
    function BuscarPorCodigo(Codigo: String): TFormato;
    function BuscarPorNumero(AIndex: Integer): TFormato;
  end;

{
  #INICIO# - Inicializa Impresora
  #NORMAL# - Tipo de Letra Condensada
  #BOLD# - Tipo de letra bold
  #SINBOLD# - Quita tipo de letra bold
  #ITALIC# - Tipo de letra italic
  #SINITALIC# - Quita tipo de letra italic
  #UNDERLINE# - Tipo de letra underline
  #SINUNDERLINE# - Quita tipo de letra underline
  #INVERSO# - Imprime con color inverso
  #SININVERSO# - Quita color inverso
  #LLENAR#%s - LLena una linea con un caracter definido
  #CORTAR# - Envia comando de cortado automatico
  #TERMINAR# - Finaliza Impresion
  #CENTRO# - Centra el renglon actual
  #IZQUIERDA# - Alinea a la Izquierda el renglon actual
  #DERECHA# - Alinea a la derecha el renglon actual
  #BARRAS#%s - Envia comando de codigo de barras
}
  TImpresora = class
  private
    FPuerto: TComPort;
    FLineas: TStrings;
    FImpresion: TStrings;
    FTotalCaracteres: Integer;
    FFormatos: TFormatos;
    FConPuerto: Boolean;
    FNumPuerto: Integer;
    FParidad: TParityBits;
    FVelocidad: TBaudRate;
    FBitsDatos: TDataBits;
    FBitsParo: TStopBits;
    FImpresora: String;
    FDTR: Boolean;
    FFeedLine: String;
    procedure SetLineas(const Value: TStrings);
    procedure SetTotalCaracteres(const Value: Integer);
    procedure SetFormatos(const Value: TFormatos);
    procedure PreparaImpresion;
    function ImprimirPuerto(Delay: Integer = 0): String;
    function ImprimirWindows: String;
    procedure SetConPuerto(const Value: Boolean);
    procedure SetNumPuerto(const Value: Integer);
    procedure SetBitsDatos(const Value: TDataBits);
    procedure SetBitsParo(const Value: TStopBits);
    procedure SetParidad(const Value: TParityBits);
    procedure SetVelocidad(const Value: TBaudRate);
    procedure SetImpresora(const Value: String);
    procedure SetDTR(const Value: Boolean);
    procedure SetFeedLine(const Value: String);
  public
    property NumPuerto: Integer read FNumPuerto write SetNumPuerto;
    property Velocidad: TBaudRate read FVelocidad write SetVelocidad;
    property BitsParo: TStopBits read FBitsParo write SetBitsParo;
    property BitsDatos: TDataBits read FBitsDatos write SetBitsDatos;
    property Paridad: TParityBits read FParidad write SetParidad;
    property Impresora: String read FImpresora write SetImpresora;
    property DTR: Boolean read FDTR write SetDTR;
    property FeedLine: String read FFeedLine write SetFeedLine;

    property ConPuerto: Boolean read FConPuerto write SetConPuerto;
    property Formatos: TFormatos read FFormatos write SetFormatos;
    property Lineas: TStrings read FLineas write SetLineas;
    property TotalCaracteres: Integer read FTotalCaracteres write SetTotalCaracteres;
    constructor Create;
    destructor Destroy; override;
    procedure Inicializar(MaximoCaracteres: Integer); virtual;
    function Imprimir(MaximoCaracteres: Integer; Delay: Integer = 0): String;
    function ExtraeTexto(Cad: String): String;
    function LLenar(Cad: String; Cuantos: Integer): String;
  end;

  TImpresoraBennet = class(TImpresora)
  public
    procedure Inicializar(MaximoCaracteres: Integer); override;
  end;

  TImpresoraFujitsu = class(TImpresora)
  public
    procedure Inicializar(MaximoCaracteres: Integer); override;
  end;

  TImpresoraFujitsuUSB = class(TImpresora)
  public
    procedure Inicializar(MaximoCaracteres: Integer); override;
  end;

  TImpresoraTSP600 = class(TImpresora)
  public
    procedure Inicializar(MaximoCaracteres: Integer); override;
  end;

  TImpresoraTickets = class(TImpresora)
  public
    procedure Inicializar(MaximoCaracteres: Integer); override;
  end;

  TImpresoraGenerica = class(TImpresora)
  public
    procedure Inicializar(MaximoCaracteres: Integer); override;
  end;

  TImpresoraEpsonM129C = class(TImpresora)
  public
    procedure Inicializar(MaximoCaracteres: Integer); override;
  end;

  TImpresoraTPG = class(TImpresora)
  public
    procedure Inicializar(MaximoCaracteres: Integer); override;
  end;

implementation

uses UtileriasComun, Printers, WinSpool, Windows;

{ TImpresora }

constructor TImpresora.Create;
begin
  FLineas:=TStringList.Create;
  FPuerto:=TComPort.Create(nil);
  FFormatos:=TFormatos.Create;
  FImpresion:=TStringList.Create;
  FDTR:=False;
  FFeedLine:=#10#13;
end;

destructor TImpresora.Destroy;
begin
  FLineas.Free;
  FPuerto.Free;
  FImpresion.Free;
  FFormatos.Free;
  inherited;
end;

function TImpresora.ExtraeTexto(Cad: String): String;
begin
  Result:='';
  if Pos('~', Cad) > 0 then
    Result:=Copy(Cad, Pos('~', Cad) + 1, Length(Cad) - Pos('~', Cad));
  if (Pos('~', Cad) < 1) and (Pos('#', Cad) < 1) then
    Result:=Cad;
end;

function TImpresora.Imprimir(MaximoCaracteres: Integer; Delay: Integer = 0): String;
begin
  Result:='';
  Inicializar(MaximoCaracteres);
  try
    if ConPuerto then
      Result:=ImprimirPuerto(Delay)
    else
      Result:=ImprimirWindows;
  except
    on E: Exception do
      Result:=E.Message;
  end;
end;

function TImpresora.ImprimirPuerto(Delay: Integer = 0): String;
var
  I: Integer;
begin
  Result:='';
  try
    try
      FPuerto.Open;
      PreparaImpresion;
      for I := 0 to FImpresion.Count - 1 do
      begin
        EscribeSerialLog('Impresora', FImpresion[I]);
        FPuerto.WriteStr(FImpresion[I]);
        Sleep(Delay);
      end;
    finally
      FPuerto.Close;
    end;
  except
    on E: Exception do
      Result:='';
  end;
end;

function WriteRawDataToPrinter(PrinterName: String; Str: String): Boolean;
var
  PrinterHandle: THandle;
  DocInfo: TDocInfo1;
  i: Integer;
  B: Byte;
  Escritos: DWORD;
begin
  Result:= FALSE;
  if OpenPrinter(PChar(PrinterName), PrinterHandle, nil) then
  try
    FillChar(DocInfo,Sizeof(DocInfo),#0);
    with DocInfo do
    begin
      pDocName:= PChar('Printer Test');
      pOutputFile:= nil;
      pDataType:= 'RAW';
    end;
    if StartDocPrinter(PrinterHandle, 1, @DocInfo) <> 0 then
    try
      if StartPagePrinter(PrinterHandle) then
      try
        while Length(Str) > 0 do
        begin
          if Copy(Str, 1, 1) = '\' then
          begin
            if Uppercase(Copy(Str, 2, 1)) = 'X' then
              Str[2]:= '$';
            if not TryStrToInt(Copy(Str, 2, 3),i) then
              Exit;
            B:= Byte(i);
            Delete(Str, 1, 3);
          end else B:= Byte(Str[1]);
          Delete(Str,1,1);
          WritePrinter(PrinterHandle, @B, 1, Escritos);
        end;
        Result:= TRUE;
      finally
        EndPagePrinter(PrinterHandle);
      end;
    finally
      EndDocPrinter(PrinterHandle);
    end;
  finally
    ClosePrinter(PrinterHandle);
  end;
end;

function TImpresora.ImprimirWindows: String;
var
  I: Integer;
begin
  Result:='';
  try
    PreparaImpresion;
    if Impresora <> '' then
    begin
      Printer.PrinterIndex:=0;
      for I := 0 to Printer.Printers.Count - 1 do
      begin
        if Pos(UpperCase(Impresora), Uppercase(Printer.Printers[I])) > 0 then
        begin
          Printer.PrinterIndex:=I;
          Impresora:=Printer.Printers[I];
          break;
        end;
      end;
    end
    else
      Impresora:=Printer.Printers[0];
    for I := 0 to FImpresion.Count - 1 do
      WriteRawDataToPrinter(Impresora, FImpresion[I]);
  except
    on E: Exception do
      Result:=E.Message;
  end;
end;

procedure TImpresora.Inicializar(MaximoCaracteres: Integer);
begin
  if DTR then
  begin
    FPuerto.FlowControl.ControlDTR:=dtrEnable;
    FPuerto.FlowControl.ControlRTS:=rtsEnable;
  end;
end;

function TImpresora.LLenar(Cad: String; Cuantos: Integer): String;
var
  I: Integer;
begin
  Result:='';
  for I := 1 to Cuantos do
    Result:=Result + Cad;
end;

procedure TImpresora.PreparaImpresion;
var
  I, J: Integer;
  S: String;
  MiFormato: TFormato;
  cpi: Integer;
  Alinear: Integer;
begin
  FImpresion.Clear;
  for I := 0 to Lineas.Count - 1 do
  begin
    S:=Lineas[I];
    Alinear:=0;
    cpi:=TotalCaracteres;
    J:= 1;
    while GetParsedItem(S, '#', J) <> '' do
    begin
      MiFormato:=Formatos.BuscarPorCodigo(GetParsedItem(S, '#', J));
      if (Pos('#BARRAS#', S) > 0) and (MiFormato = nil) then
        S:='';
      if MiFormato <> nil then
      begin
        if MiFormato.TotalCaracteres < cpi then
          cpi:=MiFormato.TotalCaracteres;
        if (MiFormato.Codigo = 'CENTRO') or (MiFormato.Codigo = 'DERECHA') or (MiFormato.Codigo = 'IZQUIERDA') then
        begin
          if (MiFormato.Codigo = 'IZQUIERDA') then
            Alinear:=1;
          if (MiFormato.Codigo = 'CENTRO') then
            Alinear:=2;
          if (MiFormato.Codigo = 'DERECHA') then
            Alinear:=3;
        end
        else
        begin
          if MiFormato.Codigo = 'LLENAR' then
          begin
            S:=ExtraeTexto(S);
            FImpresion.Add(LLenar(S, cpi) + #10#13);
            S:='';
          end
          else
          begin
            if MiFormato.Codigo = 'BARRAS' then
            begin
              FImpresion.Add(MiFormato.Comando + ExtraeTexto(S));
              S:='';
            end
            else
              FImpresion.Add(MiFormato.Comando);
          end;
        end;
      end;
      Inc(J);
    end;
    S:=ExtraeTexto(S);
    if s <> '' then
    begin
      if Alinear > 1 then
        S:=Alinea(S, cpi, Alinear);
      FImpresion.Add(S + FeedLine);
    end;
  end;
end;

procedure TImpresora.SetBitsDatos(const Value: TDataBits);
begin
  FBitsDatos := Value;
end;

procedure TImpresora.SetBitsParo(const Value: TStopBits);
begin
  FBitsParo := Value;
end;

procedure TImpresora.SetConPuerto(const Value: Boolean);
begin
  FConPuerto := Value;
end;

procedure TImpresora.SetDTR(const Value: Boolean);
begin
  FDTR := Value;
end;

procedure TImpresora.SetFeedLine(const Value: String);
begin
  FFeedLine := Value;
end;

procedure TImpresora.SetFormatos(const Value: TFormatos);
begin
  FFormatos := Value;
end;

procedure TImpresora.SetImpresora(const Value: String);
begin
  FImpresora := Value;
end;

procedure TImpresora.SetLineas(const Value: TStrings);
begin
  FLineas := Value;
end;

procedure TImpresora.SetNumPuerto(const Value: Integer);
begin
  FNumPuerto := Value;
end;

procedure TImpresora.SetParidad(const Value: TParityBits);
begin
  FParidad := Value;
end;

procedure TImpresora.SetTotalCaracteres(const Value: Integer);
begin
  FTotalCaracteres := Value;
end;

procedure TImpresora.SetVelocidad(const Value: TBaudRate);
begin
  FVelocidad := Value;
end;

{ TImpresoraBennet }

procedure TImpresoraBennet.Inicializar(MaximoCaracteres: Integer);
begin
  Formatos.Agregar('INICIO', #27'@', MaximoCaracteres, False);
  Formatos.Agregar('BOLD', #27'E', MaximoCaracteres, False);
  Formatos.Agregar('SINBOLD', #27'F', MaximoCaracteres, False);
  Formatos.Agregar('ITALIC', #27'4', MaximoCaracteres, False);
  Formatos.Agregar('UNDERLINE', #27'-1', MaximoCaracteres, False);
  Formatos.Agregar('CORTAR', #27#91#99'f', MaximoCaracteres, False);
  Formatos.Agregar('NORMAL', #27'g', MaximoCaracteres, False);
  Formatos.Agregar('CENTRO', '', MaximoCaracteres, False);
  Formatos.Agregar('DERECHA', '', MaximoCaracteres, False);
  Formatos.Agregar('LLENAR', '', MaximoCaracteres, False);


{ #BOLD# - Tipo de letra bold
  #SINBOLD# - Quita bold a la letra
  #ITALIC# - Tipo de letra italic
  #UNDERLINE# - Tipo de letra underline
  #INVERSO# - Imprime con color inverso
  #LLENAR#%s - LLena una linea con un caracter definido
  #CORTAR# - Envia comando de cortado automatico
  #TERMINAR# - Finaliza Impresion
  #CENTRO# - Centra el renglon actual
  #IZQUIERDA# - Alinea a la Izquierda el renglon actual
  #DERECHA# - Alinea a la derecha el renglon actual
  #NORMAL# - Tipo de Letra Condensada
  #BARRAS#%s   }
  TotalCaracteres:=MaximoCaracteres;
  ConPuerto:=True;
  FPuerto.BaudRate:=Velocidad;
  FPuerto.StopBits:=BitsParo;
  FPuerto.DataBits:=BitsDatos;
  FPuerto.Parity.Bits:=Paridad;
  FPuerto.Port:='COM' + IntToStr(NumPuerto);
end;

{ TFormatos }

procedure TFormatos.Agregar(Codigo, Comando: String; TotalCaracteres: Integer;
  Integrado: Boolean);
var
  Aux: TFormato;
begin
  Aux:=TFormato.Create;
  Aux.Codigo:=Codigo;
  Aux.Comando:=Comando;
  Aux.TotalCaracteres:=TotalCaracteres;
  Aux.Integrado:=Integrado;
  FList.Add(Aux);
end;

function TFormatos.BuscarPorCodigo(Codigo: String): TFormato;
var
  I: Integer;
begin
  Result:=nil;
  for I := 0 to FList.Count - 1 do
  begin
    if UpperCase(Codigo) = BuscarPorNumero(I).Codigo then
    begin
      Result:=BuscarPorNumero(I);
      Break;
    end;
  end;
end;

function TFormatos.BuscarPorNumero(AIndex: Integer): TFormato;
begin
  Result:=nil;
  if (AIndex >= 0) and (AIndex < FList.Count) then
    Result:=TFormato(FList[AIndex]);
end;

constructor TFormatos.Create;
begin
  FList:=TObjectList.Create(True);
end;

destructor TFormatos.Destroy;
begin
  FList.Free;
  inherited;
end;

{ TImpresoraTickets }

procedure TImpresoraTickets.Inicializar(MaximoCaracteres: Integer);
begin
  ConPuerto:=False;
  Formatos.Agregar('INICIO', '', MaximoCaracteres, False);
  Formatos.Agregar('BOLD', '', MaximoCaracteres, False);
  Formatos.Agregar('SINBOLD', '', MaximoCaracteres, False);
  Formatos.Agregar('ITALIC', '', MaximoCaracteres, False);
  Formatos.Agregar('UNDERLINE', '', MaximoCaracteres, False);
  Formatos.Agregar('CORTAR', '', MaximoCaracteres, False);
  Formatos.Agregar('NORMAL', '', MaximoCaracteres, False);
  Formatos.Agregar('CENTRO', '', MaximoCaracteres, False);
  Formatos.Agregar('DERECHA', '', MaximoCaracteres, False);
  Formatos.Agregar('LLENAR', '', MaximoCaracteres, False);
  TotalCaracteres:=MaximoCaracteres;
end;

{ TImpresoraGenerica }

procedure TImpresoraGenerica.Inicializar(MaximoCaracteres: Integer);
begin
  ConPuerto:=True;
  Formatos.Agregar('INICIO', '', MaximoCaracteres, False);
  Formatos.Agregar('BOLD', '', MaximoCaracteres, False);
  Formatos.Agregar('SINBOLD', '', MaximoCaracteres, False);
  Formatos.Agregar('ITALIC', '', MaximoCaracteres, False);
  Formatos.Agregar('UNDERLINE', '', MaximoCaracteres, False);
  Formatos.Agregar('CORTAR', '', MaximoCaracteres, False);
  Formatos.Agregar('NORMAL', '', MaximoCaracteres, False);
  Formatos.Agregar('CENTRO', '', MaximoCaracteres, False);
  Formatos.Agregar('LLENAR', '', MaximoCaracteres, False);
  Formatos.Agregar('DERECHA', '', MaximoCaracteres, False);
  Formatos.Agregar('TERMINAR', '', MaximoCaracteres, False);
  TotalCaracteres:=MaximoCaracteres;
  FPuerto.BaudRate:=Velocidad;
  FPuerto.StopBits:=BitsParo;
  FPuerto.DataBits:=BitsDatos;
  FPuerto.Parity.Bits:=Paridad;
  FPuerto.Port:='COM' + IntToStr(NumPuerto);
end;

{ TImpresoraEpsonM129C }

procedure TImpresoraEpsonM129C.Inicializar(MaximoCaracteres: Integer);
begin
  ConPuerto:=True;
  Formatos.Agregar('INICIO', #27'@', MaximoCaracteres, False);
  Formatos.Agregar('BOLD', '', MaximoCaracteres, False);
  Formatos.Agregar('SINBOLD', '', MaximoCaracteres, False);
  Formatos.Agregar('ITALIC', '', MaximoCaracteres, False);
  Formatos.Agregar('UNDERLINE', '', MaximoCaracteres, False);
  Formatos.Agregar('CORTAR', '', MaximoCaracteres, False);
  Formatos.Agregar('NORMAL', '', MaximoCaracteres, False);
  Formatos.Agregar('CENTRO', '', MaximoCaracteres, False);
  Formatos.Agregar('LLENAR', '', MaximoCaracteres, False);
  Formatos.Agregar('DERECHA', '', MaximoCaracteres, False);
  Formatos.Agregar('TERMINAR', #29#86#66#8#27#83, MaximoCaracteres, False);
  TotalCaracteres:=MaximoCaracteres;
  FPuerto.BaudRate:=Velocidad;
  FPuerto.StopBits:=BitsParo;
  FPuerto.DataBits:=BitsDatos;
  FPuerto.Parity.Bits:=Paridad;
  FPuerto.Port:='COM' + IntToStr(NumPuerto);
end;

{ TImpresoraFujitsu }

procedure TImpresoraFujitsu.Inicializar(MaximoCaracteres: Integer);
begin
  Formatos.Agregar('INICIO', #27'@', MaximoCaracteres, False);
  Formatos.Agregar('BOLD', '', MaximoCaracteres, False);
  Formatos.Agregar('SINBOLD', '', MaximoCaracteres, False);
  Formatos.Agregar('ITALIC', '', MaximoCaracteres, False);
  Formatos.Agregar('UNDERLINE', '', MaximoCaracteres, False);
  Formatos.Agregar('CORTAR', '', MaximoCaracteres, False);
  Formatos.Agregar('NORMAL', '', MaximoCaracteres, False);
  Formatos.Agregar('CENTRO', '', MaximoCaracteres, False);
  Formatos.Agregar('DERECHA', '', MaximoCaracteres, False);
  Formatos.Agregar('LLENAR', '', MaximoCaracteres, False);


{ #BOLD# - Tipo de letra bold
  #SINBOLD# - Quita bold a la letra
  #ITALIC# - Tipo de letra italic
  #UNDERLINE# - Tipo de letra underline
  #INVERSO# - Imprime con color inverso
  #LLENAR#%s - LLena una linea con un caracter definido
  #CORTAR# - Envia comando de cortado automatico
  #TERMINAR# - Finaliza Impresion
  #CENTRO# - Centra el renglon actual
  #IZQUIERDA# - Alinea a la Izquierda el renglon actual
  #DERECHA# - Alinea a la derecha el renglon actual
  #NORMAL# - Tipo de Letra Condensada
  #BARRAS#%s   }
  TotalCaracteres:=MaximoCaracteres;
  ConPuerto:=True;
  FPuerto.BaudRate:=Velocidad;
  FPuerto.StopBits:=BitsParo;
  FPuerto.DataBits:=BitsDatos;
  FPuerto.Parity.Bits:=Paridad;
  FPuerto.FlowControl.ControlDTR:=dtrEnable;
  FPuerto.FlowControl.ControlRTS:=rtsEnable;
  FPuerto.Port:='COM' + IntToStr(NumPuerto);
end;

{ TImpresoraFujitsuUSB }

procedure TImpresoraFujitsuUSB.Inicializar(MaximoCaracteres: Integer);
begin
  Formatos.Agregar('INICIO', '', MaximoCaracteres, False);
  Formatos.Agregar('BOLD', '', MaximoCaracteres, False);
  Formatos.Agregar('SINBOLD', '', MaximoCaracteres, False);
  Formatos.Agregar('ITALIC', '', MaximoCaracteres, False);
  Formatos.Agregar('UNDERLINE', '', MaximoCaracteres, False);
  Formatos.Agregar('CORTAR', '', MaximoCaracteres, False);
  Formatos.Agregar('NORMAL', '', MaximoCaracteres, False);
  Formatos.Agregar('CENTRO', '', MaximoCaracteres, False);
  Formatos.Agregar('DERECHA', '', MaximoCaracteres, False);
  Formatos.Agregar('LLENAR', '', MaximoCaracteres, False);


{ #BOLD# - Tipo de letra bold
  #SINBOLD# - Quita bold a la letra
  #ITALIC# - Tipo de letra italic
  #UNDERLINE# - Tipo de letra underline
  #INVERSO# - Imprime con color inverso
  #LLENAR#%s - LLena una linea con un caracter definido
  #CORTAR# - Envia comando de cortado automatico
  #TERMINAR# - Finaliza Impresion
  #CENTRO# - Centra el renglon actual
  #IZQUIERDA# - Alinea a la Izquierda el renglon actual
  #DERECHA# - Alinea a la derecha el renglon actual
  #NORMAL# - Tipo de Letra Condensada
  #BARRAS#%s   }
  TotalCaracteres:=MaximoCaracteres;
  ConPuerto:=False;
  Printer.Canvas.Font.Name:='Courier New';
  Printer.Canvas.Font.Style:=[fsBold];
end;

{ TImpresoraTSP600 }

procedure TImpresoraTSP600.Inicializar(MaximoCaracteres: Integer);
begin
  ConPuerto:=True;
  Formatos.Agregar('INICIO', '', MaximoCaracteres, False);
  Formatos.Agregar('BOLD', '', MaximoCaracteres, False);
  Formatos.Agregar('SINBOLD', '', MaximoCaracteres, False);
  Formatos.Agregar('ITALIC', '', MaximoCaracteres, False);
  Formatos.Agregar('UNDERLINE', '', MaximoCaracteres, False);
  Formatos.Agregar('CORTAR', #27#100#1, MaximoCaracteres, False);
  Formatos.Agregar('NORMAL', '', MaximoCaracteres, False);
  Formatos.Agregar('CENTRO', '', MaximoCaracteres, False);
  Formatos.Agregar('LLENAR', '', MaximoCaracteres, False);
  Formatos.Agregar('DERECHA', '', MaximoCaracteres, False);
  Formatos.Agregar('TERMINAR', '', MaximoCaracteres, False);
  TotalCaracteres:=MaximoCaracteres;
  FPuerto.BaudRate:=Velocidad;
  FPuerto.StopBits:=BitsParo;
  FPuerto.DataBits:=BitsDatos;
  FPuerto.Parity.Bits:=Paridad;
  FPuerto.Port:='COM' + IntToStr(NumPuerto);
end;

{ TImpresoraTPG }

procedure TImpresoraTPG.Inicializar(MaximoCaracteres: Integer);
begin
  inherited;
  ConPuerto:=True;
  Formatos.Agregar('INICIO', '', MaximoCaracteres, False);
  Formatos.Agregar('BOLD', '', MaximoCaracteres, False);
  Formatos.Agregar('SINBOLD', '', MaximoCaracteres, False);
  Formatos.Agregar('ITALIC', '', MaximoCaracteres, False);
  Formatos.Agregar('UNDERLINE', '', MaximoCaracteres, False);
  Formatos.Agregar('CORTAR', '', MaximoCaracteres, False);
  Formatos.Agregar('NORMAL', '', MaximoCaracteres, False);
  Formatos.Agregar('CENTRO', '', MaximoCaracteres, False);
  Formatos.Agregar('LLENAR', '', MaximoCaracteres, False);
  Formatos.Agregar('DERECHA', '', MaximoCaracteres, False);
  Formatos.Agregar('BARRAS', #29#72#0#29#104#80#29#107#4, MaximoCaracteres, False);
  Formatos.Agregar('TERMINAR', #29#86#66#8#27#83, MaximoCaracteres, False);
  TotalCaracteres:=MaximoCaracteres;
  FPuerto.BaudRate:=Velocidad;
  FPuerto.StopBits:=BitsParo;
  FPuerto.DataBits:=BitsDatos;
  FPuerto.Parity.Bits:=Paridad;
  FPuerto.Port:='COM' + IntToStr(NumPuerto);
  FeedLine:=#13;
end;

end.
