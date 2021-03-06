unit uDM;

interface

uses
  {vcl:} SysUtils, Classes, DB, DBClient,
  {RemObjects:} uROClient, uROClientIntf, uRORemoteService, uROBinMessage, uROWinInetHTTPChannel,
  {Data Abstract:} uDADataTable, uDABin2DataStreamer, uDAInterfaces, uDARemoteDataAdapter,
  uDADataStreamer, Seguridad, Modules, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinSilver, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, cxLookAndFeels, dxSkinsForm, dxmdaset,
  uPSComponent, uPSCompiler, uPSRuntime, Dialogs, cxImageComboBox,
  ppComm, ppRelatv, ppProd, ppClass, ppReport, ppEndUsr, ppDB, ppDBPipe,
  {QExportDialog,} Forms, dxSkinDarkSide, dxSkinPumpkin, dxSkinSpringTime,
  ppBands, ppCache, dxSkinDarkRoom, dxSkinFoggy, dxSkinSeven, dxSkinSharp, LibraryIngresos_Intf,
  uDAScriptingProvider, uDAMemDataTable, TB2ToolWindow, ppParameter, ppJPEG,
  dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010,
  dxSkinWhiteprint, uDACDSDataTable, cxStyles, cxClasses, ppDesignLayer,
  uDAFields, uDADataAdapter, uROChannelAwareComponent, uROMessage, uROComponent,
  uROBaseConnection, uROTransportChannel, uROBaseHTTPClient,
  LibraryFlotillas_Intf, dxBar, ClaseGenera,
  ppModule, raCodMod, NB30;

type
  Monedas = (Pesos, Dolares);

  TDialogo = (Ninguno, Informacion, Error, Confirmar);

type
  TDM = class(TDataModule)
    Message: TROBinMessage;
    Channel: TROWinInetHTTPChannel;
    RemoteService: TRORemoteService;
    DataStreamer: TDABin2DataStreamer;
    RemoteDataAdapter: TDARemoteDataAdapter;
    dxSkinController1: TdxSkinController;
    cdsMaestro: TDAMemDataTable;
    cdsDetalle: TDAMemDataTable;
    dsMaestro: TDADataSource;
    dsDetalle: TDADataSource;
    rdaMaestro: TDARemoteDataAdapter;
    rdaDetalle: TDARemoteDataAdapter;
    repReportes: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    dbpMaestro: TppDBPipeline;
    dbpDetalle: TppDBPipeline;
    cdsConfiguracion: TDAMemDataTable;
    StyleRepository: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    tblDatos: TdxMemData;
    PSScript1: TPSScript;
    dsDatos: TDataSource;
    sdExportar: TSaveDialog;
    cdsDatos: TDACDSDataTable;
    rdaDatos: TDARemoteDataAdapter;
    rdReportes: TppDesigner;
    repReportes2: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand2: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    dbpDatos: TppDBPipeline;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppDesignLayers2: TppDesignLayers;
    ppDesignLayer2: TppDesignLayer;
    procedure DataModuleCreate(Sender: TObject);
    procedure PSScript1Compile(Sender: TPSScript);
    procedure PSScript1CompImport(Sender: TObject; x: TPSPascalCompiler);
    procedure PSScript1ExecImport(Sender: TObject; se: TPSExec;
      x: TPSRuntimeClassImporter);
    procedure PSScript1Execute(Sender: TPSScript);
  private
    { Private declarations }
  public
    { Public declarations }
    FormatoFactura: String;
    ID: Integer;
    EmpleadoID: Integer;
    NumeroEstacion: Integer;
    Seguridad: TControlaSeguridad;
    MiLoginInfo: TLoginInfoBI;
    Parametros: TParametrosBI;
    ParametrosFlotillas: TParametrosF;
    Identificador: integer;
    idAlumnoEncontrado: Integer;
    IVA: Real;
    DatosFactura:LibraryIngresos_Intf.TDatosFactura;
    Serie, SerieFacturaDebito, SerieFacturaCredito, ReporteFacturaCreditoDebito: String;
    NombreEmpresa, VERSIONVOLUMETRICO, TIPOINGRESO: String;
    Ejercicio, Periodo, FormaCompra, DigitoSeguridad: Integer;

    MiExporta: TExporta;
    Archivo: TGenera;
    ParametrosExp: TParametrosExporta;
    function Login(Usr, Psw, Svr: String): Integer;
    function Mensaje(Titulo: String; idDialogo: Integer; Cancelar: Boolean; Tipo: TDialogo; Parametros: Array of Const): Integer;
    procedure AsignaPermisos;
    procedure Imprimir(SQL1, SQL2, Template, Documento, CampoJoin: String; Directo: Boolean = False; Impresora: String = '');
    //function md5(const Input: String): String;
    function ShowModule(AModuleInfo: TModuleInfo): Boolean;
    function ShowModuleByName(AModuleName: String): TModuleInfo;
    function Servidor: IServiceIngresos;
    function Fecha(Inicio: TDateTime; CualPago, Plazo: Integer): TDateTime;
    procedure AbreDataSetsReportes(SQL1, SQL2: String);
    procedure IniciaVentana(Ventana: TTBToolWindow);

    function ValorParametro(Cual : Integer): Variant;
    function Folio(ACampo, ASerie: String): Integer;
    function FechaValida(Fecha: TDateTime): Boolean;

    function Modulo10(Valor : String) : Integer;
    function Modulo66(Cad : String) : Integer;
    procedure RawPrint(Texto, Impresora: string);
    procedure ImprimirFactura(FacturaID, ESTACION: Integer);
    procedure AgregarOpcionCombo(Items: TcxImageComboBoxItems; Descripcion: String; Valor: Variant);
    procedure PreparaDataset(ExportaID: Integer; Exportar: Boolean = False);
    function Campo(Nombre: string; Tipo, Size: Integer; Formato: string): TField;
    procedure AbreDataSet(SQL: String);
    procedure Exporta(Nombre: String);
    function GetMACAdress: string;
    Function GetPrimaryNicMacAddress: String;
    Function ValidaRFC(Const Cad:String):Boolean;
    procedure AgregarSerieCombo(Items: TcxImageComboBoxItems; Descripcion: String; Valor: Variant);
  end;

var
  DM: TDM;

const Dialogos : Array[1..40] of string =
{01}     ('<FONT size="10">�Desea Salir de <B>Gauss 1.0</B>?</FONT>',
{02}     '�Desea Eliminar el Registro Actual?<BR><BR><B><U>Nota:</U></B> Una vez eliminado el registro no se podr� recuperar la informaci�n.',
{03}      'El ID de Pago que se introdujo no existe en la Base de Datos.',
{04}      'El pago que introdujo ya fu� liquidado.',
{05}      'Utilice el Esc�ner � C�mara Digital para procesar la Fotograf�a.',
{06}      'Debe guardar los cambios en <B>Subtipos de Pago.</B>',
{07}      'Debe guardar los cambios en <B>Hijos de la Familia.</B>',
{08}      'Debe guardar los cambios en <B>Alumnos de la Empresa.</B>',
{09}      'El Alumno ya est� inscrito en el ciclo actual.<BR><BR><B>�Desea Inscribirlo de nuevo? </B>',
{10}      'Uno de los pagos no puede ser cubierto.<BR><BR><B>�Desea realizar un pago parcial?</B>',
{11}      'No se puede registrar un pago de $0.',
{12}      'Debe de introducir por lo menos un pago.',
{13}      'No se han guardado los cambios efectuados.<BR><BR><B>�Desea ignorar los cambios?</B>',
{14}      'No hay cupo en este grupo.',
{15}      'Antes de guardar debe hacer click en el bot�n de <B>Inscribir.</B>',
{16}      '�Desea hacer un respaldo de la base de datos?<BR><BR><U><B>Nota:</B></U> Asegurese de que no haya ning�n usuario conectado al sistema.',
{17}      'Debe seleccionar un grupo.',
{18}      'Faltan Parametros.<BR><BR><B>%s</B>',
{19}      'El almno ya est� registrado con otra familia.',
{20}      'El almno ya est� registrado con otra Empresa',
{21}      'No hay alumnos para facturar.',
{22}      'Error en la Base de Datos.<BR><BR>%s',
{23}      'Debe seleccionar un <B>Maestro</B> y Una <B>Materia</B>.',
{24}      'El Maestro no tiene disponible esta Hora.',
{25}      'El Maestro ya tiene ocupada esta Hora.',
{26}      'Las <B>Horas Asignadas</B> sobrepasa las <B>Horas x Semana</B>',
{27}      '�Desea Reemplazar las materias de este grupo?',
{28}      '�Desea Reemplazar los pagos de este grupo?',
{29}      'El <B>ciclo</B> en el que intenta inscribir a un alumno ya finaliz�.',
{30}      'Contrase�a Invalida.',
{31}      'La Calificaci�n [<B>%f</B>] esta fuera del<BR>rango [<B>%f - %f</B>]',
{32}      'Debe seleccionar un <B>Ciclo</B>, un <B>Grupo</B> y un <B>Tipo de Pago</B>',
{33}      'El Folio [<B>%d</B>] no existe � ya est� cancelado.',
{34}      'Desea eliminar el Folio [<B>%d</B>]',
{35}      'No existe el formato <B>"%s"</B>',
{36}      'Error al crear la lista',
{37}      '�Desea aplicar la Beca - Descuento?<BR><BR>Beca [<B>%s</B>]<BR><BR>Descuento [<B>%s</B>]',
{38}      '',
{39}      '',
{40}      '');

implementation

uses
     uPSR_std,
     uPSC_std,
     uPSR_stdctrls,
     uPSC_stdctrls,
     uPSR_forms,
     uPSC_forms,
     uPSR_dateutils,
     uPSC_dateutils,

     uPSC_graphics,
     uPSC_controls,
     uPSC_classes,
     uPSR_graphics,
     uPSR_controls,
     uPSR_classes,
     uPSI_ClaseGenera,
     uPSUtils,
 Windows, Controls, ufrmPrincipal, Variants, UtileriasComun, ufrmDialogo, ShellAPI,
ppTypes, uDMFlotillas, uDMCistemGas, ufrmPantallaParametrosExporta;

{$R *.dfm}

{ TDM }

procedure TDM.AbreDataSet(SQL: String);
var
  I: Integer;
begin
  cdsDatos.Close;
  if SQL <> '' then
  begin
    Parametros.FechaIni:=DM.ParametrosExp.FechaINI;
    Parametros.FechaFin:=DM.ParametrosExp.FechaFIN;
    Parametros.TurnoInicio:= DM.ParametrosExp.TurnoIni;
    Parametros.TurnoFin:= DM.ParametrosExp.TurnoFin;
    Parametros.NumeroEstacion:= DM.ParametrosExp.EstacionIni;
    Parametros.NumeroEstacionIni:= DM.ParametrosExp.EstacionIni;
    Parametros.NumeroEstacionFin:= DM.ParametrosExp.EstacionFin;

    cdsDatos.Fields.Clear;
    rdaDatos.GetDataCall.ParamByName('SQL').AsString:=SQL;
    rdaDatos.GetDataCall.ParamByName('Parametros').AsComplexType:=Parametros;
    cdsDatos.Open;
    while not cdsDatos.EOF do
    begin
      DM.tblDatos.Append;
      for I := 0 to cdsDatos.Fields.Count - 1 do
      begin
        if DM.tblDatos.Fields.FindField(cdsDatos.Fields[I].Name) <> nil then
          DM.tblDatos.FieldByName(cdsDatos.Fields[I].Name).Value:=cdsDatos.FieldByName(cdsDatos.Fields[I].Name).Value;
      end;
      DM.tblDatos.Post;
      cdsDatos.Next;
    end;
  end;
end;

procedure TDM.AbreDataSetsReportes(SQL1, SQL2: String);
begin
  cdsMaestro.Close;
  cdsDetalle.Close;

  cdsMaestro.Fields.Clear;
  cdsDetalle.Fields.Clear;

  rdaMaestro.GetDataCall.ParamByName('SQL').AsString:=SQL1;
  rdaMaestro.GetDataCall.ParamByName('Parametros').AsComplexType:=Parametros;
  cdsMaestro.Open;

  if Trim(SQL2) <> '' then
  begin
    rdaDetalle.GetDataCall.ParamByName('SQL').AsString:=SQL2;
    rdaDetalle.GetDataCall.ParamByName('Parametros').AsComplexType:=Parametros;
    cdsDetalle.Open;
  end;
end;

procedure TDM.AgregarOpcionCombo(Items: TcxImageComboBoxItems; Descripcion: String; Valor: Variant);
var
  Aux: TcxImageComboBoxItem;
begin
  Aux:=TcxImageComboBoxItem(Items.Add);
  Aux.Description:=Descripcion;
  Aux.Value:=Valor;
end;

procedure TDM.AgregarSerieCombo(Items: TcxImageComboBoxItems;
  Descripcion: String; Valor: Variant);
var
  Aux1: TcxImageComboBoxItem;
begin
  Aux1:=TcxImageComboBoxItem(Items.Add);
  Aux1.Description:=Descripcion;
  Aux1.Value:=Valor;
end;

procedure TDM.AsignaPermisos;
var
  I: Integer;
begin
  if Seguridad <> nil then
    Seguridad.Free;
  Seguridad:=TControlaSeguridad.Create(MiLoginInfo.EmpleadoID, MiLoginInfo.EmpleadoID, MiLoginInfo.NombreEmpleado, '');
  for I := 0 to MiLoginInfo.Accesos.Count - 1 do
    Seguridad.AgregaSeguridad(MiLoginInfo.Accesos[I].Nombre, '', '', 1);
end;

function TDM.Campo(Nombre: string; Tipo, Size: Integer;
  Formato: string): TField;
begin
  Result:=nil;
  case Tipo of
    1: begin
         Result:=TStringField.Create(tblDatos);
         Result.Size:=Size;
       end;
    2: begin
         Result:=TIntegerField.Create(tblDatos);
         TIntegerField(Result).DisplayFormat:=Formato;
       end;
    3: begin
         Result:=TFloatField.Create(tblDatos);
         TFloatField(Result).DisplayFormat:=Formato;
       end;
    4: begin
         Result:=TDateTimeField.Create(tblDatos);
         TDateTimeField(Result).DisplayFormat:=Formato;
       end;
    5: Result:=TBooleanField.Create(tblDatos);
    6: Result:=TBlobField.Create(tblDatos);
  end;
  if Result <> nil then
  begin
    Result.Name:=GetValidName(tblDatos, 'tblDatos' + Nombre + IntToStr(ID));
    Inc(ID);
    Result.Lookup:=False;
    Result.Calculated:=False;
    Result.FieldName:=Nombre;
    Result.DataSet:=tblDatos;
  end;
end;

procedure TDM.DataModuleCreate(Sender: TObject);
const
  Ruta = 'http://%s:%s/BIN';
begin
  Parametros:= TParametrosBI.Create();

  RutaRegistro:='Gauss';
  Serie:=UtileriasComun.LeerRegistro('SerieFactura','A');
  FormatoFactura:=UtileriasComun.LeerRegistro('FormatoFactura', 'IMPRIMIR FACTURA');
  Channel.TargetURL:=Format(Ruta, [LeerRegistro('ServerGauss', '127.0.0.1'),LeerRegistro('PuertoGauss', '8001')]);
  ID:=0;
  MiLoginInfo:=TLoginInfoBI.Create;
  MiExporta:=TExporta.Create;
  ParametrosExp:= TParametrosExporta.Create;

  Archivo:=TGenera.Create;

  UtileriasComun.RemoteDataAdapter:=Self.RemoteDataAdapter;
  UtileriasComun.RemoteDataAdapter:=RemoteDataAdapter;
  dxSkinController1.UseSkins := True;
  repReportes.Language:= lgSpanishMexico;
  Ejercicio:=StrToInt(FormatDateTime('yyyy', Now));
  Periodo:=StrToInt(FormatDateTime('m', Now));
end;

procedure TDM.Exporta(Nombre: String);
begin
  tblDatos.First;
  tblDatos.DisableControls;
  Archivo.NombreArchivo:=Nombre;
  PSScript1.Script.Text:=MiExporta.ScriptExporta;
  if not PSScript1.Compile then
    MessageDlg(PSScript1.CompilerMessages[0].MessageToString, mtError, [mbOK], 0)
  else
  begin
    PSScript1.Execute;
    Archivo.Guardar;
  end;
  tblDatos.EnableControls;
end;

function TDM.Fecha(Inicio: TDateTime; CualPago, Plazo: Integer): TDateTime;
begin
{****** Tipos de Plazo ********
  1.- Semanal
  2.- Catorcenal
  3.- Quincenal
  4.- Mensual
  5.- Bimestral
  6.- Trimestral
  7.- Cuatrimestral
  8.- Semestral
  9.- Anual
**************}
  {Result:=Inicio;
  case Plazo of
    1:Result:=AddWeeks(Inicio, CualPago);
    2:Result:=AddWeeks(Inicio, CualPago * 2);
    3:Result:=Inicio+(CualPago * 15);
    4:Result:=AddMonths(Inicio, CualPago);
    5:Result:=AddMonths(Inicio, CualPago * 2);
    6:Result:=AddMonths(Inicio, CualPago * 3);
    7:Result:=AddMonths(Inicio, CualPago * 4);
    8:Result:=AddSemesters(Inicio, CualPago);
    9:Result:=AddYrs(Inicio, CualPago);
  end;}
end;

function TDM.FechaValida(Fecha: TDateTime): Boolean;
begin
   Result:=(StrToInt(FormatDateTime('yyyy', Fecha)) = Ejercicio) and (StrToInt(FormatDateTime('m', Fecha)) = Periodo);
end;

function TDM.Folio(ACampo, ASerie: String): Integer;
begin
  Result:=Servidor.Folio(ACampo, ASerie);
end;

function TDM.GetMACAdress: string;
var
  NCB: PNCB;
  Adapter: PAdapterStatus;
  URetCode: PChar;
  RetCode: ansichar;
  I: integer;
  Lenum: PlanaEnum;
  _SystemID: string;
  TMPSTR: string;
begin
  Result    := '';
  _SystemID := '';
  Getmem(NCB, SizeOf(TNCB));
  Fillchar(NCB^, SizeOf(TNCB), 0);
  Getmem(Lenum, SizeOf(TLanaEnum));
  Fillchar(Lenum^, SizeOf(TLanaEnum), 0);
  Getmem(Adapter, SizeOf(TAdapterStatus));
  Fillchar(Adapter^, SizeOf(TAdapterStatus), 0);
  Lenum.Length    := chr(0);
  NCB.ncb_command := chr(NCBENUM);
  NCB.ncb_buffer  := Pointer(Lenum);
  NCB.ncb_length  := SizeOf(Lenum);
  RetCode         := Netbios(NCB);
  i := 0;
  repeat
    Fillchar(NCB^, SizeOf(TNCB), 0);
    Ncb.ncb_command  := chr(NCBRESET);
    Ncb.ncb_lana_num := lenum.lana[i];
   RetCode          := Netbios(Ncb);
    Fillchar(NCB^, SizeOf(TNCB), 0);
    Ncb.ncb_command  := chr(NCBASTAT);
    Ncb.ncb_lana_num := lenum.lana[i];
    // Must be 16
    Ncb.ncb_callname := '*               ';
    Ncb.ncb_buffer := Pointer(Adapter);
    Ncb.ncb_length := SizeOf(TAdapterStatus);
    RetCode        := Netbios(Ncb);
    //---- calc _systemId from mac-address[2-5] XOR mac-address[1]...
    if (RetCode = chr(0)) or (RetCode = chr(6)) then
    begin
      _SystemId := IntToHex(Ord(Adapter.adapter_address[0]), 2) + '-' +
        IntToHex(Ord(Adapter.adapter_address[1]), 2) + '-' +
        IntToHex(Ord(Adapter.adapter_address[2]), 2) + '-' +
        IntToHex(Ord(Adapter.adapter_address[3]), 2) + '-' +
        IntToHex(Ord(Adapter.adapter_address[4]), 2) + '-' +
        IntToHex(Ord(Adapter.adapter_address[5]), 2);
    end;
    Inc(i);
  until (I >= Ord(Lenum.Length)) or (_SystemID <> '00-00-00-00-00-00');
  FreeMem(NCB);
  FreeMem(Adapter);
  FreeMem(Lenum);
  GetMacAdress := _SystemID;
end;

function TDM.GetPrimaryNicMacAddress: String;
Type
  TGUID = Record
    A, B: word;
    D, M, S: word;
    MAC: Array[ 1..6 ] Of byte;
  End;
Var
  UuidCreateFunc: Function(Var guid: TGUID): HResult; stdcall;
  handle: THandle;
  g: TGUID;
  WinVer: _OSVersionInfoW;
  i: integer;
  //  ErrCode : HResult;
Begin
  Try
    WinVer.dwOSVersionInfoSize := sizeof(WinVer); // Tama�o
    getversionex(WinVer);  // Obtiene info del Windows en uso
    handle := LoadLibrary('RPCRT4.DLL'); // Obtiene el handle de la DLL
    If WinVer.dwMajorVersion >= 5 Then {Windows 2000 � superior}
      @UuidCreateFunc := GetProcAddress(Handle, 'UuidCreateSequential')
    Else // (Win98 o menor)
      @UuidCreateFunc := GetProcAddress(Handle, 'UuidCreate');
    UuidCreateFunc(g); // Obtiene la info
    Result := '';
    For i := 1 To 6 Do Result := Result + IntToHex(g.MAC[ i ], 2); // Concatena la MAC Address
  Except
    Result := ''; // Resultado nulo
  End;
End;

procedure TDM.Imprimir(SQL1, SQL2, Template, Documento, CampoJoin: String;
  Directo: Boolean; Impresora: String);
var
  Aux: TStringStream;
  lFieldLink: TppMasterFieldLink;
begin
  AbreDataSetsReportes(SQL1, SQL2);
  if CampoJoin <> '' then
  begin
    dbpDetalle.MasterDataPipeline := dbpMaestro;
    lFieldLink := TppMasterFieldLink.Create(nil);
    lFieldLink.Parent := dbpDetalle;
    lFieldLink.DetailFieldName := CampoJoin;
    lFieldLink.MasterFieldName := CampoJoin;
  end;
  Aux:=TStringStream.Create(Template);
  repReportes.Template.LoadFromStream(Aux);
  Aux.Free;
  repReportes.AllowPrintToFile:=True;
  repReportes.AllowPrintToArchive:=True;
  repReportes.PrinterSetup.DocumentName:=Documento;
  if Directo then
  begin
    if Impresora <> '' then
      repReportes.PrinterSetup.PrinterName:=Impresora;
    repReportes.DeviceType:='Printer';
    repReportes.ShowPrintDialog:=False;
  end
  else
  begin
    repReportes.DeviceType:='Screen';
    repReportes.ShowPrintDialog:=True;
  end;
  repReportes.NoDataBehaviors:=[ndBlankReport];
  repReportes.Print;
end;

procedure TDM.ImprimirFactura(FacturaID, ESTACION: Integer);
var
  Aux: LibraryIngresos_Intf.TReporteBI;
begin
  Aux:=DM.Servidor.BuscarReporte(FormatoFactura);
  DM.Parametros.Factura:=FacturaID;
  DM.Parametros.NumeroEstacion:=ESTACION;
  try
  DM.Imprimir(Aux.SQL1, Aux.SQL2, Aux.Template, 'IMPRIMIENDO...', Aux.CampoJoin, False)
  finally
    Aux.Free;
  end;
end;

procedure TDM.IniciaVentana(Ventana: TTBToolWindow);
var
  P: TPoint;
  R: TRect;
begin
  GetWindowRect(Ventana.Parent.Handle, R);
  P.x:= R.Left + Ventana.Left + 4;
  P.y:= R.Top + Ventana.Top + 28;
  Ventana.FloatingPosition:= P;
end;

function TDM.Login(Usr, Psw, Svr: String): Integer;
var
  Aux: TLoginInfoBI;
  I: Integer;
  s:String;
begin

  Result:=-1;
  Aux:=Servidor.Login(Usr, Psw);
  MiLoginInfo.Assign(Aux);
  try
    if Aux.Valida then
    begin
      Result:=Aux.EmpleadoID;
      DM.EmpleadoID:= Aux.EmpleadoID;
      if Svr = '' then Svr := '0';
      DM.NumeroEstacion:= strtoint(Svr);

      cdsConfiguracion.Close;
      cdsConfiguracion.Open;
      cdsConfiguracion.Locate('NumeroEstacion', DM.NumeroEstacion, []);
      SerieFacturaDebito:= cdsConfiguracion.FieldByName('SerieFacturaDebito').AsString;
      SerieFacturaCredito:= cdsConfiguracion.FieldByName('SerieFacturaCredito').AsString;
      ReporteFacturaCreditoDebito:= cdsConfiguracion.FieldByName('ReporteFacturaCreditoDebito').AsString;
      IVA:=cdsConfiguracion.FieldByName('TIPOCAMBIO').AsFloat;
      NombreEmpresa:= cdsConfiguracion.FieldByName('NOMBRECOMERCIAL').AsString;

      if cdsConfiguracion.FieldByName('TIPOINGRESO').AsString = 'INGRESO POR TURNO' then
      begin
         TIPOINGRESO:= 'INGRESO POR TURNO';
         ufrmPrincipal.frmPrincipal.dxBarLargeButton27.Enabled:= True;
         ufrmPrincipal.frmPrincipal.dxBarLargeButton27.Visible:= ivAlways;
         ufrmPrincipal.frmPrincipal.dxBarLargeButton42.Visible:= ivNever;

         ufrmPrincipal.frmPrincipal.dxBarLargeButton35.Enabled:= True;
         ufrmPrincipal.frmPrincipal.dxBarLargeButton35.Visible:= ivAlways;
         ufrmPrincipal.frmPrincipal.dxBarLargeButton43.Visible:= ivNever;
      end else
      begin
         TIPOINGRESO:= cdsConfiguracion.FieldByName('TIPOINGRESO').AsString;
         ufrmPrincipal.frmPrincipal.dxBarLargeButton42.Enabled:= True;
         ufrmPrincipal.frmPrincipal.dxBarLargeButton27.Visible:= ivNever;
         ufrmPrincipal.frmPrincipal.dxBarLargeButton42.Visible:= ivAlways;

         ufrmPrincipal.frmPrincipal.dxBarLargeButton35.Enabled:= False;
         ufrmPrincipal.frmPrincipal.dxBarLargeButton35.Visible:= ivNever;
         ufrmPrincipal.frmPrincipal.dxBarLargeButton43.Visible:= ivAlways;
      end;

      if Svr <> '-1' then
      {if (md5(NombreEmpresa+Svr) <> cdsConfiguracion.FieldByName('LICENCIA').AsString) then
      begin
         MessageDlg('Licencia Invalida',mtError,[mbOK], 0);
         Application.Terminate;
      end;}
    end;
  finally
    Aux.Free;
  end;
end;

{function TDM.md5(const Input: String): String;
var
  hCryptProvider: HCRYPTPROV;
  hHash: HCRYPTHASH;
  bHash: array[0..$7f] of Byte;
  dwHashBytes: Cardinal;
  pbContent: PByte;
  i: Integer;

begin
  dwHashBytes := 16;
  pbContent := Pointer(PChar(Input));

  Result := '';

  if CryptAcquireContext(@hCryptProvider, nil, nil, PROV_RSA_FULL, CRYPT_VERIFYCONTEXT or CRYPT_MACHINE_KEYSET) then
  begin
    if CryptCreateHash(hCryptProvider, CALG_MD5, 0, 0, @hHash) then
    begin
      if CryptHashData(hHash, pbContent, Length(Input) * sizeof(Char), 0) then
      begin
        if CryptGetHashParam(hHash, HP_HASHVAL, @bHash[0], @dwHashBytes, 0) then
        begin
          for i := 0 to dwHashBytes - 1 do
          begin
            Result := Result + Format('%.2x', [bHash[i]]);
          end;
        end;
      end;
      CryptDestroyHash(hHash);
    end;

    CryptReleaseContext(hCryptProvider, 0);
  end;

  Result := AnsiLowerCase(Result);
end;  }

function TDM.Mensaje(Titulo: String; idDialogo: Integer; Cancelar: Boolean;
  Tipo: TDialogo; Parametros: array of Const): Integer;
begin
  frmDialogo:= TfrmDialogo.Create(Nil);
  frmDialogo.btnCancelar.Visible:=Cancelar;
  frmDialogo.Mensaje(Titulo, idDialogo, Tipo, Parametros);
  Result:= frmDialogo.ShowModal;
  frmDialogo.free;
end;

function TDM.Modulo10(Valor: String): Integer;
var
  S,Cad : String;
  i : Byte;
  sum : Integer;
  Impar : Boolean;
begin
  While Pos(' ', Valor) > 0 do
    Delete(Valor, Pos(' ', Valor), 1);
  S:=Valor;
  Cad:='';
  Impar:=odd(Length(S));
  for i:=1 to length(S) do
  begin
    if ((Impar) And (odd(i))) Or ((Not Impar) And (Not odd(i))) then
      Cad:=Cad+S[i];
  end;
  sum:=StrToInt(Cad)*2;
  Cad:=IntToStr(sum);
  Sum:=0;
  for i:=1 to Length(Cad) do
    Sum:=Sum+StrToInt(Cad[i]);
  for i:=1 to Length(S) do
  begin
    if ((Impar) And (not odd(i))) Or ((Not Impar) And (odd(i))) then
      Sum:=Sum+StrToInt(S[i]);
  end;
  sum:=10*((sum div 10)+byte(sum mod 10<>0))-sum;
  Result:=sum;
end;

function TDM.Modulo66(Cad: String): Integer;
const
  Secuencia : Array[0..2] of Integer = (8,4,3);
var
  Suma, i : Integer;
function Sumar(x : Integer) : Integer;
var
  s : String;
  j : Integer;
begin
  Result:=x;
  while Result > 9 do
  begin
    s:=IntToStr(Result);
    Result:=0;
    for j:=1 to length(s) do
      Result:=Result+StrToInt(s[j]);
  end;
end;
begin
  Suma:=0;
  for i:=1 to Length(Cad) do
  begin
    Suma:=Suma + Sumar(StrToInt(Cad[i]) * Secuencia[i mod 3]);
  end;
  if suma mod 10 = 0 then
    Result:=0
  else
    Result:=(((Suma div 10) + 1) * 10) - Suma;
end;

procedure TDM.PreparaDataset(ExportaID: Integer; Exportar: Boolean);
var
  I, J: Integer;
  Aux: TParametrosExporta;
begin
  MiExporta.Assign(Servidor.Exporta(ExportaID));
  Aux:=ObtenParametros(MiExporta.Parametros, MiExporta.Nombre);
  if Aux <> nil then
  begin
    ParametrosExp.Assign(Aux);
    Archivo.Parametros.NombreEstacion:='';
    Archivo.Parametros.Fecha:= now;
    Archivo.Parametros.Poliza:=Aux.Poliza;
    Archivo.Parametros.EstacionINI:=Aux.EstacionINI;
    Archivo.Parametros.EstacionFIN:=Aux.EstacionFIN;
    Archivo.Parametros.TurnoINI:=Aux.TurnoINI;
    Archivo.Parametros.TurnoFIN:=Aux.TurnoFIN;
    Archivo.Parametros.FechaINI:=Aux.FechaINI;
    Archivo.Parametros.FechaFIN:=Aux.FechaFIN;
    FreeAndNil(Aux);
  end
  else
  begin
    Abort;
    Exit;
  end;
  tblDatos.Close;
  while tblDatos.FieldCount > 1 do
    tblDatos.Fields[0].Free;
  tblDatos.Fields.Clear;
  for I := 0 to MiExporta.Campos.Count - 1 do
  begin
    Campo(MiExporta.Campos[I].Nombre,
          MiExporta.Campos[I].Tipo,
          MiExporta.Campos[I].Size,
          MiExporta.Campos[I].Formato);
  end;
  tblDatos.Open;
  for I := 0 to MiExporta.Pasos.Count - 1 do
  begin
    case MiExporta.Pasos[I].Server.ServidorID of
      1:DMFlotillas.AbreDataSet(MiExporta.Pasos[I].SQL);
      2:DM.AbreDataSet(MiExporta.Pasos[I].SQL);
      3:begin
          for J := 0 to MiExporta.Pasos[I].Server.Estaciones.Count - 1 do
          begin
            if (MiExporta.Pasos[I].Server.Estaciones[J].EstacionID >= ParametrosExp.EstacionINI) and (MiExporta.Pasos[I].Server.Estaciones[J].EstacionID <= ParametrosExp.EstacionFIN) then
              DMCistemGas.AbreDataSet(MiExporta.Pasos[I].Server.Estaciones[J].Host, MiExporta.Pasos[I].SQL);
          end;
        end;
    end;
  end;
  tblDatos.DisableControls;
  try
    tblDatos.First;
    PSScript1.Script.Text:=MiExporta.ScriptDatos;
    if not PSScript1.Compile then
    begin
      MessageDlg(PSScript1.CompilerMessages[0].MessageToString, mtError, [mbOK], 0);
      Abort;
    end
    else
    begin
      if not PSScript1.Execute then
      begin
        MessageDlg(PSScript1.ExecErrorToString, mtError, [mbOK], 0);
        //Abort;
      end
      else
      begin
        if Exportar then
        begin
          tblDatos.First;
          PSScript1.Script.Text:=MiExporta.ScriptExporta;
          if not PSScript1.Compile then
          begin
            MessageDlg(PSScript1.CompilerMessages[0].MessageToString, mtError, [mbOK], 0);
            Abort;
          end
          else
          begin
            if not PSScript1.Execute then
            begin
              MessageDlg(PSScript1.ExecErrorToString, mtError, [mbOK], 0);
              //Abort;
            end
          end;
         end;
      end;
    end;
  finally
    tblDatos.EnableControls
  end;
end;

procedure TDM.PSScript1Compile(Sender: TPSScript);
begin
  Sender.AddRegisteredVariable('Archivo', 'TGenera');
end;

procedure TDM.PSScript1CompImport(Sender: TObject; x: TPSPascalCompiler);
begin
  SIRegister_Std(x);
  SIRegister_Classes(x, true);
  SIRegister_Graphics(x, true);
  SIRegister_Controls(x);
  SIRegister_stdctrls(x);
  SIRegister_Forms(x);
  RegisterDateTimeLibrary_C(x);
  SIRegister_ClaseGenera(x);
end;

procedure TDM.PSScript1ExecImport(Sender: TObject; se: TPSExec;
  x: TPSRuntimeClassImporter);
begin
  RIRegister_Std(x);
  RIRegister_Classes(x, True);
  RIRegister_Graphics(x, True);
  RIRegister_Controls(x);
  RIRegister_stdctrls(x);
  RIRegister_Forms(x);
  RIRegister_ClaseGenera(x);
end;

procedure TDM.PSScript1Execute(Sender: TPSScript);
begin
  Sender.SetVarToInstance('APPLICATION', Application);
  Sender.SetVarToInstance('SELF', Self);
  Sender.SetVarToInstance('ARCHIVO', Archivo);
end;

procedure TDM.RawPrint(Texto, Impresora: string);
begin

end;

function TDM.Servidor: IServiceIngresos;
begin
  Result:=CoServiceIngresos.Create(Message, Channel);
end;

function TDM.ShowModule(AModuleInfo: TModuleInfo): Boolean;
begin
  Screen.Cursor:=crHourGlass;
  Result:=False;
  LockWindowUpdate(Application.Handle);
  try
    Result:=ModuleInfoManager.ShowModule(AModuleInfo.Name, frmPrincipal.pnlPrincipal);
  finally
    Screen.Cursor:=crDefault;
    LockWindowUpdate(0);
    if Result then
      RedrawWindow(Application.Handle, nil, 0, RDW_ERASE or RDW_FRAME or RDW_INVALIDATE or RDW_ALLCHILDREN);
  end;
end;

function TDM.ShowModuleByName(AModuleName: String): TModuleInfo;
begin
  Result:=ModuleInfoManager.GetModuleInfoByName(AModuleName);
  if Result <> nil then
  begin
    ShowModule(Result);
    frmPrincipal.rbtAcciones.Caption:=AModuleName;
    frmPrincipal.rbtAcciones.Visible:=True;
    frmPrincipal.rbtAcciones.Active:=True;
  end;
end;

function TDM.ValidaRFC(const Cad: String): Boolean;
var
 I:Integer;
begin
  Result:=True;
  For I:=1 to Length(Cad) do
    If (Cad[i] in (['-',' '])) then
    begin
      Result:=False;
      Break;//Exit
    end;
end;

function TDM.ValorParametro(Cual: Integer): Variant;
begin
  if DM.Parametros = nil then
  begin
    Result:='';
    Exit;
  end;
  case Cual of    //
    0: Result:=DM.Parametros.FechaIni;
    1: Result:=DM.Parametros.FechaFin;
    //2: Result:=DM.Parametros.AlumnoIni;
    //3: Result:=DM.Parametros.AlumnoFin;
    //4: Result:=DM.Parametros.Maestro;
    //5: Result:=DM.Parametros.MaestroIni;
    //6:Result:=DM.Parametros.MaestroFin;
    //7: Result:=DM.Parametros.Grupo;
  end;    // case
end;

end.
