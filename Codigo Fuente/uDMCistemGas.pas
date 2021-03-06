unit uDMCistemGas;

interface

uses
  SysUtils, Classes, ppBands, ppCache, ppClass, ppProd, ppReport,
  ppComm, ppRelatv, ppDB, ppDBPipe, DB, uDAInterfaces, uDADataTable,
  uDAMemDataTable, uDADataStreamer, uDABin2DataStreamer, uDARemoteDataAdapter,
  uDAScriptingProvider, uDACDSDataTable, uRORemoteService, uROClient,
  uROBinMessage, uROWinInetHttpChannel, LibraryCistemGas_Intf, ppTypes,
  ppParameter, uDADataAdapter, uROBaseHTTPClient, uDAFields,
  uROChannelAwareComponent, uROMessage, uROComponent, uROBaseConnection,
  uROTransportChannel;

type
  TDMCistemGas = class(TDataModule)
    Channel: TROWinInetHTTPChannel;
    Message: TROBinMessage;
    RemoteService: TRORemoteService;
    cdsDatos: TDACDSDataTable;
    rdaDatos: TDARemoteDataAdapter;
    DataStreamer: TDABin2DataStreamer;
    RemoteDataAdapter: TDARemoteDataAdapter;
    cdsMaestro: TDAMemDataTable;
    cdsDetalle: TDAMemDataTable;
    dsMaestro: TDADataSource;
    dsDetalle: TDADataSource;
    dbpMaestro: TppDBPipeline;
    dbpDetalle: TppDBPipeline;
    repReportes: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    rdaMaestro: TDARemoteDataAdapter;
    rdaDetalle: TDARemoteDataAdapter;
    cdsConfiguracion: TDAMemDataTable;
    RemoteServiceProxy: TRORemoteService;
    RemoteDataAdapterProxy: TDARemoteDataAdapter;
  private
    { Private declarations }
  public
    { Public declarations }
    Parametros: TParametros;
    procedure ConectaServer(Estacion: Integer);
    function Server: IServiceCistemGas;
    function ServerProxy(Estacion: Integer): IServiceProxy;
    procedure Imprimir(SQL1, SQL2, Template, Documento, CampoJoin: String; Directo: Boolean = False; Impresora: String = '');
    procedure AbreDataSetsReportes(SQL1, SQL2: String);
    procedure AbreDataSet(Host, SQL: String);
    function Server2(Host: String): IServiceCistemGas;
  end;

var
  DMCistemGas: TDMCistemGas;

implementation
uses uDM;

{$R *.dfm}

{ TDMCistemGas }

procedure TDMCistemGas.AbreDataSet(Host, SQL: String);
var
  I: Integer;
begin
  if SQL <> '' then
  begin
    Server2(Host);
    cdsDatos.Close;
    Parametros.FechaIni:=DM.ParametrosExp.FechaIni;
    Parametros.FechaFin:=DM.ParametrosExp.FechaFin;
    Parametros.TurnoID:=DM.ParametrosExp.TurnoINI;
    Parametros.TurnoIni:=DM.ParametrosExp.TurnoINI;
    Parametros.TurnoFin:=DM.ParametrosExp.TurnoFIN;
    Parametros.ArchivoID:=Dm.ParametrosExp.TurnoFIN;
    Parametros.Estacion:= Dm.ParametrosExp.EstacionINI;

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

procedure TDMCistemGas.AbreDataSetsReportes(SQL1, SQL2: String);
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

procedure TDMCistemGas.ConectaServer(Estacion: Integer);
const
  URLServer = 'http://%s:%s/BIN';
var
  HOSTVOLUMETRICO, PUERTOVOLUMETRICO: String;
begin
  cdsConfiguracion.Close;
  cdsConfiguracion.Open;
  cdsConfiguracion.Locate('NUMEROESTACION',DM.NumeroEstacion,[]);

  Parametros:=TParametros.Create;
  if (cdsConfiguracion.FieldByName('HOSTVOLUMETRICO').AsString <> '') then HOSTVOLUMETRICO:= cdsConfiguracion.FieldByName('HOSTVOLUMETRICO').AsString
  else HOSTVOLUMETRICO:= '127.0.0.1';
  if (cdsConfiguracion.FieldByName('PUERTOVOLUMETRICO').AsString <> '') then PUERTOVOLUMETRICO:= cdsConfiguracion.FieldByName('PUERTOVOLUMETRICO').AsString
  else PUERTOVOLUMETRICO:= '9001';

  Channel.TargetURL:=Format(URLServer, [HOSTVOLUMETRICO,PUERTOVOLUMETRICO]);
end;

procedure TDMCistemGas.Imprimir(SQL1, SQL2, Template, Documento,
  CampoJoin: String; Directo: Boolean; Impresora: String);
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

function TDMCistemGas.Server: IServiceCistemGas;
begin
  Result:=CoServiceCistemGas.Create(Message, Channel);
end;

function TDMCistemGas.Server2(Host: String): IServiceCistemGas;
const
  URLServer = 'http://%s:9001/BIN';
begin
  Channel.TargetURL:=Format(URLServer, [Host]);
  Result:=CoServiceCistemGas.Create(Message, Channel);
end;


function TDMCistemGas.ServerProxy(Estacion: Integer): IServiceProxy;
const
  URL = 'http://%s:9001/BIN';
begin
  if not cdsConfiguracion.Active then
     cdsConfiguracion.Open;
  cdsConfiguracion.Locate('NUMEROESTACION', Estacion, []);
  Channel.TargetURL:=Format(URL, [cdsConfiguracion.FieldByName('HOSTVOLUMETRICO').AsString]);
  Result:=CoServiceProxy.Create(Message, Channel);
end;

end.
