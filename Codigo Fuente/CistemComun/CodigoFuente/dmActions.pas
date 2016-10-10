unit dmActions;

interface

uses
  SysUtils, Classes, AppEvnts, XPStyleActnCtrls, ActnList, ActnMan,
  ImgList, Controls, StdActns, System.Actions;

type
  TdmAppActions = class(TDataModule)
    ActionManager: TActionManager;
    actNuevo: TAction;
    actGuardar: TAction;
    actCancelar: TAction;
    actActualizar: TAction;
    actEliminar: TAction;
    actSiguiente: TAction;
    actPrimer: TAction;
    actAnterior: TAction;
    actUltimo: TAction;
    actImprimir: TAction;
    actBuscar: TAction;
    actProcesar: TAction;
    actCalculadora: TAction;
    actPropiedadesBomba: TAction;
    actCortar: TAction;
    actParcial: TAction;
    actProcesarVentas: TAction;
    actCerrarLiquidacion: TAction;
    actRelacionar: TAction;
    actFacturar: TAction;
    actImportar: TAction;
    actExportar: TAction;
    actDiferenciaInventario: TAction;
    actResumenVentas: TAction;
    procedure ActionManagerExecute(Action: TBasicAction;
      var Handled: Boolean);
  private
    function GetActionCount: Integer;
    function GetAction(Index: Integer): TBasicAction;
    // VCL actions disabled UI controls if there is no events assigned to them
    // The easiest solution to avoid this is to assign the dummy event
    procedure DoFakeVCLAction(Sender: TObject);
    procedure FakeVCLActions;
  public
    constructor Create(AOwner: TComponent); override;
    // return the action count
    property ActionCount: Integer read GetActionCount;
    property Actions[Index: Integer]: TBasicAction read GetAction;
  end;

var
  dmAppActions: TdmAppActions;

// returns the global instance of Actions class
function AppActions: TdmAppActions;

implementation

uses Forms, Modules, dmImagenes;


{$R *.dfm}

// returns the global instance of Actions class
function AppActions: TdmAppActions;
begin
  if(dmAppActions = nil) then
    dmAppActions := TdmAppActions.Create(Application);
  Result := dmAppActions;
end;

{ TdmAppActions }
constructor TdmAppActions.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FakeVCLActions;
end;

procedure TdmAppActions.FakeVCLActions;
var
  I: Integer;
begin
  for I := 0 to ActionCount - 1 do
    Actions[I].OnExecute := DoFakeVCLAction;
end;

procedure TdmAppActions.DoFakeVCLAction(Sender: TObject);
begin
  //do nothing
end;

function TdmAppActions.GetActionCount: Integer;
begin
  Result := ActionManager.ActionCount;
end;

function TdmAppActions.GetAction(Index: Integer): TBasicAction;
begin
  Result := ActionManager.Actions[Index];
end;

// Handler for Execute event of ActionManager component
procedure TdmAppActions.ActionManagerExecute(Action: TBasicAction;
  var Handled: Boolean);
begin
  // Call the ExecuteAction method of the currently showing module
  ModuleInfoManager.ActiveModule.Module.ExecuteAction(Action);
end;

end.
