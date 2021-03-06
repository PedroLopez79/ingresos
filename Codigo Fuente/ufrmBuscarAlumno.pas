unit ufrmBuscarAlumno;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmBuscar, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, uDADataTable, uDAScriptingProvider,
  uDACDSDataTable, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  Menus, cxLookAndFeelPainters, dxRibbon, StdCtrls, cxButtons, ExtCtrls,
  dxStatusBar, dxRibbonStatusBar, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, dxSkinsdxRibbonPainter, uDAInterfaces, cxContainer,
  cxGroupBox, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinValentine, dxSkinXmas2008Blue, cxLookAndFeels,
  dxSkinDarkSide, dxSkinPumpkin, 
  dxSkinSpringTime, dxSkinDarkRoom, dxSkinFoggy, dxSkinSeven, dxSkinSharp;

type
  TfrmBuscarAlumno = class(TfrmBuscar)
    cxGridDBTableView1IDALUMNO: TcxGridDBColumn;
    cxGridDBTableView1NUMCONTROL: TcxGridDBColumn;
    cxGridDBTableView1NOMBRE: TcxGridDBColumn;
    cxGridDBTableView1DIRECCION: TcxGridDBColumn;
    cxGridDBTableView1PADRE: TcxGridDBColumn;
    cxGridDBTableView1MADRE: TcxGridDBColumn;
    cxGridDBTableView1TELEFONOCASA: TcxGridDBColumn;
    procedure cdsBuscarFilterRecord(DataTable: TDADataTable;
      var Accept: Boolean);
    procedure cxGridDBTableView1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBuscarAlumno: TfrmBuscarAlumno;

implementation

uses uDM;

{$R *.dfm}

procedure TfrmBuscarAlumno.cdsBuscarFilterRecord(DataTable: TDADataTable;
  var Accept: Boolean);
begin
  inherited;
  Accept:= Pos(DataTable.FieldByName('FormaCompraID').AsString + ',', CRITERIO) > 0;
end;

procedure TfrmBuscarAlumno.cxGridDBTableView1DblClick(Sender: TObject);
begin
  Datos.Clave:=cdsBuscar.FieldByName('IDALUMNO').AsInteger;
  Datos.Nombre:= cdsBuscar.FieldByName('Nombre').AsString;
  Datos.RFC := cdsBuscar.FieldByName('DIRECCION').AsString;
  Datos.Cuenta:= cdsBuscar.FieldByName('NUMCONTROL').AsString;

  Datos.OK:=True;
  inherited;

end;

end.
