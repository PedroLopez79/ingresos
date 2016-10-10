unit CustomModule;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, jpeg, ExtCtrls, StdCtrls;

type
  TActionNotification = procedure(Action: TBasicAction) of object;

  TfrmCustomModule = class(TForm)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    // The list of supported actions
    FSupportedActionList: TList;
    FOnDestroy: TNotifyEvent;
    FClosing: Boolean;
    FReturn: String;
    FParam2: String;
    FParam1: String;

    // Returns the event handler for the action
    function GetNotificationByAction(Action: TBasicAction): TActionNotification;
    procedure SetReturn(const Value: String);
    procedure SetParam1(const Value: String);
    procedure SetParam2(const Value: String);
  protected
    // Register the supported action
    procedure RegisterAction(const Action: TBasicAction; ANotification: TActionNotification);
    // The successor classes have to overriden this method to register supported actions
    procedure RegisterActions; virtual;
    // Returns True if the module supports printing
    // Do export based on the export type
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    // Override the base TFrame ExecuteAction behaviour
    function ExecuteAction(Action: TBasicAction): Boolean; override;

    // Returns True if the module supports the action
    function IsActionSupported(Action: TBasicAction): Boolean;
    // Make all supported actions visible and un-supported actions invisible on module activation
    procedure UpdateActionsVisibility; virtual;
    // Updates actions state
    procedure UpdateActionsState; virtual;
    property OnDestroy: TNotifyEvent read FOnDestroy write FOnDestroy;
    property Closing: Boolean read FClosing write FClosing;
    property Return: String read FReturn write SetReturn;
    property Param1: String read FParam1 write SetParam1;
    property Param2: String read FParam2 write SetParam2;
  end;

  TfrmCustomModuleClass = class of TfrmCustomModule;

implementation

uses Modules, UtileriasComun, dmActions;

{$R *.dfm}

type
  PActionRegisterRecord = ^TActionRegisterRecord;
  TActionRegisterRecord = record
    Action: TBasicAction;
    Notification: TActionNotification;
  end;

{ TfrmCustomModule }

constructor TfrmCustomModule.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FSupportedActionList := TList.Create;
  FClosing:=True;
  RegisterActions;
  Return:=STRCierre;
end;

destructor TfrmCustomModule.Destroy;
var
  I: Integer;
begin
  if Assigned(OnDestroy) then
    OnDestroy(self);
  for I := 0 to FSupportedActionList.Count - 1 do
    Dispose(PActionRegisterRecord(FSupportedActionList[I]));
  FSupportedActionList.Free;
  inherited;
end;

procedure TfrmCustomModule.RegisterAction(const Action: TBasicAction; ANotification: TActionNotification);
var
  ARecord: PActionRegisterRecord;
begin
  New(ARecord);
  ARecord^.Action := Action;
  ARecord^.Notification := ANotification;
  FSupportedActionList.Add(ARecord)
end;

function TfrmCustomModule.GetNotificationByAction(Action: TBasicAction): TActionNotification;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to FSupportedActionList.Count - 1 do
    if PActionRegisterRecord(FSupportedActionList[I])^.Action = Action then
    begin
       Result := PActionRegisterRecord(FSupportedActionList[I])^.Notification;
       break;
    end;
end;

procedure TfrmCustomModule.RegisterActions;
begin
  //Registrar Acciones
end;

procedure TfrmCustomModule.SetParam1(const Value: String);
begin
  FParam1 := Value;
end;

procedure TfrmCustomModule.SetParam2(const Value: String);
begin
  FParam2 := Value;
end;

procedure TfrmCustomModule.SetReturn(const Value: String);
begin
  FReturn := Value;
end;

function TfrmCustomModule.ExecuteAction(Action: TBasicAction): Boolean;
var
  ANotification: TActionNotification;
begin
  ANotification := GetNotificationByAction(Action);
  Result := Assigned(ANotification);
  if Result then
    ANotification(Action);
  UpdateActionsState;
end;

function TfrmCustomModule.IsActionSupported(Action: TBasicAction): Boolean;
begin
  Result := Assigned(GetNotificationByAction(Action));
end;

procedure TfrmCustomModule.UpdateActionsState;
begin
//Status Acciones
end;

procedure TfrmCustomModule.UpdateActionsVisibility;
var
  I: Integer;
  Action: TBasicAction;
begin
  for I := 0 to AppActions.ActionCount - 1 do
  begin
    Action := AppActions.Actions[I];
    if Action is TCustomAction then
      TCustomAction(Action).Visible := IsActionSupported(Action) and Visible;
  end;
end;

procedure TfrmCustomModule.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TfrmCustomModule.FormCreate(Sender: TObject);
begin
  Return:=STRCierre;
end;

end.
