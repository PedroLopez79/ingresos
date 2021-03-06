unit ufrmBuscarTarjetasGastos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DateUtils, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Menus, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, cxButtons, ComCtrls,
  uDAScriptingProvider, uDADataTable, uDAMemDataTable, cxControls, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, dxSkinsdxRibbonPainter, cxContainer, cxGroupBox, uDAInterfaces,
  uDARemoteDataAdapter, uDACDSDataTable, dxRibbon, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, LibraryFlotillas_Intf;

type
  TfrmBuscarTarjetasGastos = class(TForm)
    Panel1: TPanel;
    dbgAgrupacion: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    dxRibbon1: TdxRibbon;
    cdsBuscar: TDACDSDataTable;
    rdaTarjetasAditivos: TDARemoteDataAdapter;
    dsBuscar: TDADataSource;
    cxGroupBox1: TcxGroupBox;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxGridDBTableView1DblClick(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBuscarTarjetasGastos: TfrmBuscarTarjetasGastos;
  Cliente: Integer;
  Clave:Integer;
  Nombre: String;

function Abrir_BuscarTarjetaGastos(ClienteID: Integer):Integer;

implementation
uses UDMFlotillas, uDM, ufrmBuscarTarjetasAditivos;

{$R *.dfm}

function Abrir_BuscarTarjetaGastos(ClienteID: Integer):Integer;
Begin
  frmBuscarTarjetasAdivitos:=TfrmBuscarTarjetasAdivitos.Create(Application);
  Cliente:= ClienteID;
  frmBuscarTarjetasAdivitos.ShowModal;

  Result:= Clave;

  frmBuscarTarjetasAdivitos.Free;
End;

procedure TfrmBuscarTarjetasGastos.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmBuscarTarjetasGastos.cxButton1Click(Sender: TObject);
begin
  Clave:= cdsBuscar.FieldByName('VehiculoID').AsInteger;
  Nombre:= cdsBuscar.FieldByName('Nombre').AsString;
  Close;
end;

procedure TfrmBuscarTarjetasGastos.cxButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmBuscarTarjetasGastos.cxGridDBTableView1DblClick(
  Sender: TObject);
begin
  Clave:= cdsBuscar.FieldByName('VehiculoID').AsInteger;
  Nombre:= cdsBuscar.FieldByName('Nombre').AsString;
  Close;
end;

procedure TfrmBuscarTarjetasGastos.FormShow(Sender: TObject);
var
  S: String;
  P: TParametrosF;
begin
  cdsBuscar.Close;

  P:= TParametrosF.Create;
  DMFlotillas.ConectaServer(DM.NumeroEstacion);

  P.ClienteIni := Cliente;

  S:= 'SELECT  Vehiculo.VehiculoID, Vehiculo.ClienteID, Vehiculo.Nombre '+
      'FROM  Vehiculo INNER JOIN CLIENTE ON CLIENTE.CLIENTEID = VEHICULO.CLIENTEID '+
      'WHERE (Vehiculo.ClienteID = @ClienteIni) and (Vehiculo.Nombre = ''GASTOS'') ';
  rdaTarjetasAditivos.GetDataCall.ParamByName('SQL').AsString:=S;
  rdaTarjetasAditivos.GetDataCall.ParamByName('Parametros').AsComplexType:= P;
  cdsBuscar.Open;
  cxGridDBTableView1.ClearItems;
  cxGridDBTableView1.DataController.CreateAllItems();

end;

end.
