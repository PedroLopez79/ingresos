unit fServerDataModule;

interface

uses
  SysUtils, Classes, Windows,
  uROClient, uROPoweredByRemObjectsButton, uROClientIntf, uROServer,
  uROBinMessage, uROIndyHTTPServer,
  uDAEngine, uDADriverManager, uDAClasses, uROSessions,
  uDAADODriver, uROIndyTCPServer, Registry, uDASDACDriver,
  uROSOAPMessage, Forms, uROBaseHTTPServer, uDADataDictionary,
  uDAStreamableComponent, uDAConnectionManager, uROMessage, uROComponent,
  uROBaseConnection, uROCustomHTTPServer;

type
  TServerDataModule = class(TDataModule)
    Server: TROIndyHTTPServer;
    Message: TROBinMessage;
    ConnectionManager: TDAConnectionManager;
    DriverManager: TDADriverManager;
    SessionManager: TROInMemorySessionManager;
    ROSOAP: TROSOAPMessage;
    DataDictionary: TDADataDictionary;
    
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ServerDataModule: TServerDataModule;

implementation

uses UtileriasComun;

{$R *.dfm}

procedure TServerDataModule.DataModuleCreate(Sender: TObject);
const
  Cadena = 'SDAC?Server=%s;Database=%s;UserID=%s;Password=%s;';
begin
  RutaRegistro:='Server Ingresos';
  try
    ConnectionManager.Connections[0].ConnectionString:=Format(Cadena, [LeerRegistro('Server','127.0.0.1'),
                                                                       LeerRegistro('Database','INGRESOS'),
                                                                       LeerRegistro('User','sa'),
                                                                       LeerRegistro('Password','')]);
  finally
     Server.Port := StrToInt(LeerRegistro('Puerto', '8001'));
     Server.Active := true;
  end;
end;

end.
