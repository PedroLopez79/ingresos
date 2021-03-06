unit uDMFlotillas;

interface

uses
  SysUtils, Classes, uDADataStreamer, uDABin2DataStreamer, uDADataTable,
  uDARemoteDataAdapter, uDAScriptingProvider, uDACDSDataTable, uRORemoteService,
  uROClient, uROBinMessage, uROWinInetHttpChannel, LibraryFlotillas_Intf,
  uDAMemDataTable, DB, uDAInterfaces, ppBands, ppCache, ppClass,
  ppProd, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppTypes, cxImageComboBox,
  ppParameter, uDADataAdapter, uROBaseHTTPClient, uDAFields,
  uROChannelAwareComponent, uROMessage, uROComponent, uROBaseConnection,
  uROTransportChannel;

type
  TDMFlotillas = class(TDataModule)
    Channel: TROWinInetHTTPChannel;
    Message: TROBinMessage;
    RemoteService: TRORemoteService;
    cdsDatos: TDACDSDataTable;
    rdaDatos: TDARemoteDataAdapter;
    DataStreamer: TDABin2DataStreamer;
    cdsEstacion: TDAMemDataTable;
    RemoteDataAdapter: TDARemoteDataAdapter;
    dsEstacion: TDADataSource;
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
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Parametros: TParametrosF;
    ClienteIDActual, Ejercicio, Periodo, Identificador, FormaCompra, DigitoSeguridad, EmpleadoID: Integer;
    function Server: IServiceFlotillas;
    procedure ConectaServer(Estacion: Integer);
    procedure Imprimir(SQL1, SQL2, Template, Documento, CampoJoin: String; Directo: Boolean = False; Impresora: String = '');
    procedure AbreDataSetsReportes(SQL1, SQL2: String);
    procedure AgregarOpcionCombo(Items: TcxImageComboBoxItems; Descripcion: String; Valor: Variant);
    procedure AgregarSerieCombo(Items: TcxImageComboBoxItems; Descripcion: String; Valor: Variant);
    procedure AbreDataSet(SQL: String);
  end;

var
  DMFlotillas: TDMFlotillas;

implementation

uses UtileriasComun, Variants, uDM;

{$R *.dfm}


{ TDMFlotillas }

procedure TDMFlotillas.AbreDataSet(SQL: String);
var
  I: Integer;
begin
  cdsDatos.Close;
  if SQL <> '' then
  begin
    Parametros.ClienteIni:=0;
    Parametros.ClienteFin:=99999999;
    Parametros.FechaIni:=DM.ParametrosExp.FechaINI;
    Parametros.FechaFin:=DM.ParametrosExp.FechaFIN;
    Parametros.EstacionIni:=DM.ParametrosExp.EstacionINI;
    Parametros.EstacionFin:=DM.ParametrosExp.EstacionFIN;
    Parametros.ClienteIni:=DM.ParametrosExp.TurnoINI;
    Parametros.ClienteFin:=DM.ParametrosExp.TurnoFIN;
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
        begin
          if cdsDatos.FieldByName(cdsDatos.Fields[I].Name).Value <> Null then
            DM.tblDatos.FieldByName(cdsDatos.Fields[I].Name).Value:=cdsDatos.FieldByName(cdsDatos.Fields[I].Name).Value
        end;
      end;
      DM.tblDatos.Post;
      cdsDatos.Next;
    end;
  end;
end;

procedure TDMFlotillas.AbreDataSetsReportes(SQL1, SQL2: String);
begin
  Parametros.Identificador:= Identificador;

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

procedure TDMFlotillas.AgregarOpcionCombo(Items: TcxImageComboBoxItems;
  Descripcion: String; Valor: Variant);
var
  Aux: TcxImageComboBoxItem;
begin
  Aux:=TcxImageComboBoxItem(Items.Add);
  Aux.Description:=Descripcion;
  Aux.Value:=Valor;
end;

procedure TDMFlotillas.AgregarSerieCombo(Items: TcxImageComboBoxItems;
  Descripcion: String; Valor: Variant);
var
  Aux1: TcxImageComboBoxItem;
begin
  Aux1:=TcxImageComboBoxItem(Items.Add);
  Aux1.Description:=Descripcion;
  Aux1.Value:=Valor;
end;


procedure TDMFlotillas.ConectaServer(Estacion: Integer);
const
  URLServer = 'http://%s:%s/BIN';
var
  HOSTFLOTILLAS, PUERTOFLOTILLAS: String;
begin
  cdsConfiguracion.Close;
  cdsConfiguracion.Open;
  cdsConfiguracion.Locate('NUMEROESTACION',DM.NumeroEstacion,[]);

  Parametros:=TParametrosF.Create;
  if (cdsConfiguracion.FieldByName('HOSTFLOTILLAS').AsString <> '') then HOSTFLOTILLAS:= cdsConfiguracion.FieldByName('HOSTFLOTILLAS').AsString
  else HOSTFLOTILLAS:= '127.0.0.1';
  if (cdsConfiguracion.FieldByName('PUERTOFLOTILLAS').AsString <> '') then PUERTOFLOTILLAS:= cdsConfiguracion.FieldByName('PUERTOFLOTILLAS').AsString
  else PUERTOFLOTILLAS:= '9002';

  Channel.TargetURL:=Format(URLServer, [HOSTFLOTILLAS,PUERTOFLOTILLAS]);
  Identificador:= strtoint(UtileriasComun.LeerRegistro('Identificador', '1000'));
end;

procedure TDMFlotillas.DataModuleCreate(Sender: TObject);
const
  URLServer = 'http://%s:%s/BIN';
var
  HOSTFLOTILLAS, PUERTOFLOTILLAS: String;
begin
  cdsConfiguracion.Close;
  cdsConfiguracion.Open;
  cdsConfiguracion.Locate('NUMEROESTACION',DM.NumeroEstacion,[]);

  Parametros:=TParametrosF.Create;
  if (cdsConfiguracion.FieldByName('HOSTFLOTILLAS').AsString <> '') then HOSTFLOTILLAS:= cdsConfiguracion.FieldByName('HOSTFLOTILLAS').AsString
  else HOSTFLOTILLAS:= '127.0.0.1';
  if (cdsConfiguracion.FieldByName('PUERTOFLOTILLAS').AsString <> '') then PUERTOFLOTILLAS:= cdsConfiguracion.FieldByName('PUERTOFLOTILLAS').AsString
  else PUERTOFLOTILLAS:= '9002';

  Channel.TargetURL:=Format(URLServer, [HOSTFLOTILLAS,PUERTOFLOTILLAS]);
  Identificador:= strtoint(UtileriasComun.LeerRegistro('Identificador', '1000'));
end;

procedure TDMFlotillas.Imprimir(SQL1, SQL2, Template, Documento,
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

function TDMFlotillas.Server: IServiceFlotillas;
begin
   Result:=CoServiceFlotillas.Create(Message, Channel);
end;

end.
