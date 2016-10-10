unit ufrmBuscarTarjeta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmBuscar, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, Menus, cxLookAndFeelPainters, uDADataTable,
  uDAScriptingProvider, uDACDSDataTable, dxRibbon, StdCtrls, cxButtons,
  ExtCtrls, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  dxStatusBar, dxRibbonStatusBar, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, dxSkinsdxRibbonPainter, uDAInterfaces, cxContainer,
  cxGroupBox, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinSilver, dxSkinStardust, dxSkinValentine,
  dxSkinXmas2008Blue, cxLookAndFeels, dxSkinDarkSide,
  dxSkinPumpkin, dxSkinSpringTime,
  dxSkinSummer2008, dxSkinDarkRoom, dxSkinFoggy, dxSkinSeven, dxSkinSharp;

type
  TfrmBuscarTarjeta = class(TfrmBuscar)
    cxGridDBTableView1Column1: TcxGridDBColumn;
    cxGridDBTableView1Column2: TcxGridDBColumn;
    cxGridDBTableView1Column3: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure cxGridDBTableView1CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBuscarTarjeta: TfrmBuscarTarjeta;

implementation

{$R *.dfm}

procedure TfrmBuscarTarjeta.cxGridDBTableView1CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  Datos.Clave:=cdsBuscar.FieldByName('VehiculoID').AsInteger;
  Datos.Nombre:= cdsBuscar.FieldByName('Nombre').AsString;
  Datos.Tipo:=cdsBuscar.FieldByName('FormaCompraID').AsInteger;
  //Datos.Estatus := cdsBuscar.FieldByName('Estatus').AsString;
  Datos.Estatus := 'A';
  inherited;
end;

procedure TfrmBuscarTarjeta.FormShow(Sender: TObject);
begin
  inherited;
  cdsBuscar.Close;
  cdsBuscar.ParamByName('ClienteID').AsInteger:= strtoint(Copy(CRITERIO, 1, length(CRITERIO)-1));
  cdsBuscar.Open;
end;

end.
