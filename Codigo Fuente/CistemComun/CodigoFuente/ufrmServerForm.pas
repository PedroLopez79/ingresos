unit ufrmServerForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
  uROClient, uROClientIntf, uROServer,
  uROBinMessage, uROIndyHTTPServer, jpeg, ExtCtrls, ShellAPI, Menus;

const 
  WM_ShellIcon = WM_USER + 1; 

type
  TfrmServerForm = class(TForm)
    Image1: TImage;
    mnuIconTray: TPopupMenu;
    Restaurar1: TMenuItem;
    Minimizar1: TMenuItem;
    Cerrar1: TMenuItem;
    N1: TMenuItem;
    lblVersion: TLabel;
    lblDerechos: TLabel;
    tmrHide: TTimer;
    N2: TMenuItem;
    Configurar1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Cerrar1Click(Sender: TObject);
    procedure Restaurar1Click(Sender: TObject);
    procedure Minimizar1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure tmrHideTimer(Sender: TObject);
  private
    { Private declarations }
    IconData: TNotifyIconData;
    Primer: Boolean;
    procedure MiException(Sender: TObject; E: Exception);
  public
    { Public declarations }
    Ocupado: Boolean;
    procedure ShellIcon( var Msg : TMessage ); message WM_ShellIcon;
    procedure OnMinimize( var Msg : TWMSysCommand ); message WM_SYSCOMMAND;
    procedure RemueveIcono;
  end;

var
  frmServerForm: TfrmServerForm;

implementation

{$R *.dfm}

uses
  UtileriasComun;

procedure TfrmServerForm.FormCreate(Sender: TObject);
begin
  Primer:=True;
  Ocupado:=False;
  IconData.cbSize := sizeof(IconData);
  IconData.Wnd := Handle;
  IconData.uID := 100;
  IconData.uFlags := NIF_MESSAGE + NIF_ICON + NIF_TIP;
  IconData.uCallbackMessage := WM_USER + 1;
  IconData.hIcon := Application.Icon.Handle;
  StrPCopy(IconData.szTip, Caption);
  Shell_NotifyIcon(NIM_ADD, @IconData);
  ShowWindow(Application.Handle, SW_HIDE);
  lblVersion.Caption:='Ver ' + Version;
  Application.OnException:=MiException;
end;

procedure TfrmServerForm.FormActivate(Sender: TObject);
begin
  ShowWindow(Application.Handle, SW_HIDE);
end;

procedure TfrmServerForm.OnMinimize(var Msg: TWMSysCommand);
begin
  if( Msg.CmdType = SC_MINIMIZE ) or
    ( Msg.CmdType = SC_CLOSE    ) then
    Hide
  else
    inherited;
end;

procedure TfrmServerForm.ShellIcon(var Msg: TMessage);
var
  Point : TPoint;
begin
  case Msg.LParam of
    WM_LBUTTONDBLCLK : begin
                         Show;
                         SetForegroundWindow( Handle );
                       end;
    WM_RBUTTONUP     : begin
                         SetForegroundWindow( Handle );
                         GetCursorPos( Point );
                         mnuIconTray.Popup( Point.x, Point.y );
                         PostMessage( Handle, WM_USER, 0, 0 );
                       end;
  end;
end;

procedure TfrmServerForm.tmrHideTimer(Sender: TObject);
begin
  tmrHide.Enabled:=False;
  if Primer then
  begin
    Hide;
    Primer:=False;
  end;
end;

procedure TfrmServerForm.Cerrar1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmServerForm.RemueveIcono;
begin
  Shell_NotifyIcon(NIM_DELETE, @IconData);
end;

procedure TfrmServerForm.Restaurar1Click(Sender: TObject);
begin
  Show;
end;

procedure TfrmServerForm.MiException(Sender: TObject; E: Exception);
begin
  MuestraMensaje(E.Message);
end;

procedure TfrmServerForm.Minimizar1Click(Sender: TObject);
begin
  Hide;
end;

procedure TfrmServerForm.Image1Click(Sender: TObject);
begin
  Hide;
end;

procedure TfrmServerForm.FormDestroy(Sender: TObject);
begin
  RemueveIcono;
end;

end.
