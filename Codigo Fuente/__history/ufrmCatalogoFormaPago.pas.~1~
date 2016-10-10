unit ufrmCatalogoFormaPago;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmCatalogo, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, dxmdaset, uDADataTable,
  uDAScriptingProvider, uDACDSDataTable, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxPC, cxTextEdit, cxDBEdit, cxLabel, cxContainer, cxGroupBox;

type
  TufrmCatalogoFormadePago = class(TfrmCatalogo)
    GrpBoxDatos: TcxGroupBox;
    LblNoProducto: TcxLabel;
    TxtNoFormaPago: TcxDBTextEdit;
    cxLabel2: TcxLabel;
    LblNombre: TcxLabel;
    TxtDescripcion: TcxDBTextEdit;
    dbgCatalogoDBTableView1FormaPagoID: TcxGridDBColumn;
    dbgCatalogoDBTableView1Descripcion: TcxGridDBColumn;
    procedure cdsCatalogoNewRecord(DataTable: TDADataTable);
    procedure cdsCatalogoBeforePost(DataTable: TDADataTable);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ufrmCatalogoFormadePago: TufrmCatalogoFormadePago;

implementation

uses uDM, dmActions, Modules;

{$R *.dfm}
procedure TufrmCatalogoFormadePago.cdsCatalogoBeforePost(
  DataTable: TDADataTable);
begin
  inherited;
  cdsCatalogo.ApplyUpdates;
end;

procedure TufrmCatalogoFormadePago.cdsCatalogoNewRecord(
  DataTable: TDADataTable);
begin
  inherited;
    cdsCatalogo.FieldByName('FormaPagoID').AsInteger:=DM.Servidor.Folio('FormadePagoID', '');
end;

initialization
  ModuleInfoManager.RegisterModule('Tipo de Pago', TufrmCatalogoFormadePago);

end.
