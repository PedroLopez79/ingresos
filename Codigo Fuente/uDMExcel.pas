unit uDMExcel;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDMExcel = class(TDataModule)
    tblExcel: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMExcel: TDMExcel;

implementation

{$R *.dfm}

end.
