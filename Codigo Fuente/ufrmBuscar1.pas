unit ufrmBuscar1;

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
  dxSkinPumpkin, dxSkinSpringTime, LibraryFlotillas_Intf,
  dxSkinSummer2008, dxSkinDarkRoom, dxSkinFoggy, dxSkinSeven, dxSkinSharp,
  uDARemoteDataAdapter;

type
  TfrmBuscar1 = class(TfrmBuscar)
    cxGridDBTableView1Column1: TcxGridDBColumn;
    cxGridDBTableView1Column2: TcxGridDBColumn;
    cxGridDBTableView1Column3: TcxGridDBColumn;
    rdaTarjetasAditivos: TDARemoteDataAdapter;
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
  frmBuscar1: TfrmBuscar1;

implementation
uses UDMFlotillas, uDM;

{$R *.dfm}

procedure TfrmBuscar1.cxGridDBTableView1CellDblClick(
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

procedure TfrmBuscar1.FormShow(Sender: TObject);
var
  S: String;
  P: TParametrosF;
begin
  inherited;
  cdsBuscar.Close;

  P:= TParametrosF.Create;
  DMFlotillas.ConectaServer(DM.NumeroEstacion);
  
  P.ClienteIni := strtoint(Copy(CRITERIO, 1, length(CRITERIO)-1));

  S:= 'SELECT  Vehiculo.VehiculoID, Vehiculo.ClienteID, Vehiculo.Nombre, '+
      'Vehiculo.GasolineroID, Vehiculo.GasolineroID as Identificador, Cliente.FormaCompraID '+
      'FROM  Vehiculo INNER JOIN CLIENTE ON CLIENTE.CLIENTEID = VEHICULO.CLIENTEID '+
      'WHERE (Vehiculo.ClienteID = @ClienteIni) and (Cliente.FormaCompraID = 8) ';
  rdaTarjetasAditivos.GetDataCall.ParamByName('SQL').AsString:=S;
  rdaTarjetasAditivos.GetDataCall.ParamByName('Parametros').AsComplexType:= P;
  cdsBuscar.Open;
end;

end.
