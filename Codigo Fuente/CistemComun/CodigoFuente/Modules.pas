unit Modules;

interface

uses Classes, Controls, CustomModule;

type

TModuleInfo = class
private
  FModuleClass: TfrmCustomModuleClass;
  FModule: TfrmCustomModule;
  FName: string;
  procedure DoModuleDestroy(Sender: TObject);
public
  constructor Create(const AName: string; AModuleClass: TfrmCustomModuleClass);
  destructor Destroy; override;
  procedure DestroyModule;
  procedure CreateModule;
  procedure Hide;
  procedure Show(AParent: TWinControl; Modal: Boolean = False);
  property Module: TfrmCustomModule read FModule;
  property Name: string read FName;
end;

TModuleInfoManager = class
private
  FModuleList: TList;
  FActiveModule: TModuleInfo;
  function GetCount: Integer;
  function GetItem(Index: Integer): TModuleInfo;
public
  constructor Create;
  destructor Destroy; override;

  function ActiveModule: TModuleInfo;
  function GetModuleInfoByName(const AName: string): TModuleInfo;
  procedure RegisterModule(const AName: string; AModuleClass: TfrmCustomModuleClass);
  function ShowModule(const AName: string; AParent: TWinControl): Boolean;
  function ShowModuleModal(const AName: string): String;
  procedure CloseActiveModule;
  procedure CloseModule(const AName: string);
  property Count: Integer read GetCount;
  property Items[Index: Integer]: TModuleInfo read GetItem; default;
end;

// Return the instance of the global TModuleInfoManager object
function ModuleInfoManager: TModuleInfoManager;

implementation

uses SysUtils;

var
  FModuleInfoManager: TModuleInfoManager = nil;

function ModuleInfoManager: TModuleInfoManager;
begin
  if FModuleInfoManager = nil then
    FModuleInfoManager := TModuleInfoManager.Create;
  Result := FModuleInfoManager;
end;


{ TModuleInfo }

constructor TModuleInfo.Create(const AName: string; AModuleClass: TfrmCustomModuleClass);
begin
  FName := AName;
  FModuleClass := AModuleClass;
end;

destructor TModuleInfo.Destroy;
begin
  DestroyModule;
  inherited Destroy;
end;

procedure TModuleInfo.CreateModule;
begin
  FModule := FModuleClass.Create(nil);
  FModule.OnDestroy := DoModuleDestroy;
end;

procedure TModuleInfo.DestroyModule;
begin
  if (Module <> nil) and not (csDestroying in Module.ComponentState) then
  begin
    FModule.Free;
    FModule := nil;
  end;
end;

procedure TModuleInfo.DoModuleDestroy(Sender: TObject);
begin
  FModule := nil;
end;

procedure TModuleInfo.Hide;
begin
  Module.Hide;
end;

procedure TModuleInfo.Show(AParent: TWinControl; Modal: Boolean);
begin
  if Module = nil then
    CreateModule;
  if Modal then
    Module.ShowModal
  else
  begin
    Module.Parent := AParent;
    Module.Align := alClient;
    Module.Show;
  end;
end;

{ TModuleInfoManager }

constructor TModuleInfoManager.Create;
begin
  FModuleList := TList.Create;
  FActiveModule:=nil;
end;

destructor TModuleInfoManager.Destroy;
var
  I: Integer;
begin
  for I := 0 to Count - 1 do
    Items[I].Free;
  FModuleList.Free;
  inherited;
end;

function TModuleInfoManager.GetCount: Integer;
begin
  Result := FModuleList.Count;
end;


function TModuleInfoManager.GetItem(Index: Integer): TModuleInfo;
begin
  Result := TModuleInfo(FModuleList[Index]);
end;


function TModuleInfoManager.GetModuleInfoByName(const AName: string): TModuleInfo;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to Count - 1 do
    if(CompareText(Items[I].Name, AName) = 0) then
    begin
      Result := Items[I];
      break;
    end;
end;

procedure TModuleInfoManager.RegisterModule(const AName: string; AModuleClass: TfrmCustomModuleClass);
var
  AModuleInfo: TModuleInfo;
begin
  AModuleInfo := GetModuleInfoByName(AName);
  if(AModuleInfo <> nil) then
    raise Exception.CreateFmt('Module with name "%s" is already exists', [AName]);
  AModuleInfo := TModuleInfo.Create(AName, AModuleClass);
  FModuleList.Add(AModuleInfo);
end;

function TModuleInfoManager.ShowModule(const AName: string; AParent: TWinControl): Boolean;
var
  AModuleInfo: TModuleInfo;
begin
  Result:=False;
  if FActiveModule <> GetModuleInfoByName(AName) then
  begin
    AModuleInfo := GetModuleInfoByName(AName);
    if(AModuleInfo = nil) then
      raise Exception.CreateFmt('Module with name "%s" does not exist', [AName]);
    Result:=True;
    AModuleInfo.Show(AParent);
    AModuleInfo.Module.UpdateActionsVisibility;
    AModuleInfo.Module.UpdateActionsState;
    if FActiveModule <> nil then
      FActiveModule.Module.Close;
    FActiveModule:=AModuleInfo;
  end;
end;

function TModuleInfoManager.ShowModuleModal(const AName: string): String;
begin
  Result:='';
  FActiveModule:=GetModuleInfoByName(AName);
  if(FActiveModule = nil) then
    raise Exception.CreateFmt('Module with name "%s" does not exist', [AName])
  else
  begin
    FActiveModule.CreateModule;
    FActiveModule.Show(nil, True);
    Result:=FActiveModule.Module.Return;
    FActiveModule.DestroyModule;
    FreeAndNil(FActiveModule);
  end;
end;

function TModuleInfoManager.ActiveModule: TModuleInfo;
begin
  Result:=FActiveModule;
end;

procedure TModuleInfoManager.CloseActiveModule;
begin
  if FActiveModule <> nil then
  begin
    FActiveModule.Module.Close;
    FActiveModule:=nil;
  end;
end;

procedure TModuleInfoManager.CloseModule(const AName: string);
var
  AModuleInfo: TModuleInfo;
begin
  AModuleInfo := GetModuleInfoByName(AName);
  if(AModuleInfo = nil) then
    raise Exception.CreateFmt('Module with name "%s" does not exist', [AName]);
  AModuleInfo.Hide;
end;

initialization

finalization
  FModuleInfoManager.Free;
  FModuleInfoManager := nil;
end.
