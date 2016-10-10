unit fServerForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
  uDAPoweredByDataAbstractButton, uROPoweredByRemObjectsButton, ufrmServerForm,
  Menus, ExtCtrls, jpeg, dxGDIPlusClasses;

type
  TServerForm = class(TfrmServerForm)
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ServerForm: TServerForm;

implementation

{$R *.dfm}

end.
