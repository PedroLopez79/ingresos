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
  uROBaseConnection, uROCustomHTTPServer, uROJSONMessage;

type
  TServerDataModule = class(TDataModule)
    Server: TROIndyHTTPServer;
    Message: TROBinMessage;
    ConnectionManager: TDAConnectionManager;
    DriverManager: TDADriverManager;
    SessionManager: TROInMemorySessionManager;
    ROSOAP: TROSOAPMessage;
    DataDictionary: TDADataDictionary;
    ROJSON: TROJSONMessage;
    
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    AplicaSobrantes: Boolean;
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
    ECODEX:= LeerRegistro('ECODEX','SI');
    COMERCIODIGITAL:= LeerRegistro('COMERCIODIGITAL','NO');
    URLPACKTIMBRE:= LeerRegistro('URLPACKTIMBRE','https://pruebas.ecodex.com.mx:2045');
    URLPACKCANCELAR:= LeerRegistro('URLPAKCANCELAR','');
    CREDENCIALESPACKRFC:= LeerRegistro('CREDENCIALESPACKRFC','AAA010101AAA');
    CREDENCIALESPACKCLAVE:= LeerRegistro('CREDENCIALESPACKCLAVE','PWD');
    CREDENCIALESPACK_ECODEX_DISTRIBUIDORID:= LeerRegistro('CREDENCIALESPACK_ECODEX_DISTRIBUIDORID','2b3a8764-d586-4543-9b7e-82834443f219');
  finally
     Server.Port := StrToInt(LeerRegistro('Puerto', '8001'));
     Server.Active := true;
  end;
end;

end.
