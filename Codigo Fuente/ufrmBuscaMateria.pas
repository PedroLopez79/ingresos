unit ufrmBuscaMateria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ufrmBuscar, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, dxSkinsdxRibbonPainter,
  cxContainer, Menus, uDAInterfaces, uDADataTable, uDAScriptingProvider,
  uDACDSDataTable, StdCtrls, cxButtons, cxGroupBox, dxRibbon, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid;

type
  TfrmBuscaMateria = class(TfrmBuscar)
    cxGridDBTableView1IDMATERIA: TcxGridDBColumn;
    cxGridDBTableView1CODIGO: TcxGridDBColumn;
    cxGridDBTableView1NOMBRE: TcxGridDBColumn;
    cxGridDBTableView1CREDITOS: TcxGridDBColumn;
    cxGridDBTableView1MINIMOAPRO: TcxGridDBColumn;
    cxGridDBTableView1MAXIMOFALTAS: TcxGridDBColumn;
    cxGridDBTableView1SERIADACON: TcxGridDBColumn;
    cxGridDBTableView1NOMBREAUX1: TcxGridDBColumn;
    cxGridDBTableView1NOMBREAUX2: TcxGridDBColumn;
    cxGridDBTableView1HORASXSEMANA: TcxGridDBColumn;
    cxGridDBTableView1PROMEDIO: TcxGridDBColumn;
    cxGridDBTableView1ORDENOFICIAL: TcxGridDBColumn;
    cxGridDBTableView1ORDENINTERNO: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure cxGridDBTableView1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBuscaMateria: TfrmBuscaMateria;

implementation

uses uDM;

{$R *.dfm}

procedure TfrmBuscaMateria.cxGridDBTableView1DblClick(Sender: TObject);
begin
  inherited;
  Datos.Clave:=cdsBuscar.FieldByName('IDMATERIA').AsInteger;
  Datos.Nombre:= cdsBuscar.FieldByName('NOMBRE').AsString;
  Datos.Tipo:=cdsBuscar.FieldByName('CREDITOS').AsInteger;
  Datos.Cuenta:= cdsBuscar.FieldByName('CODIGO').AsString;
  //Datos.Estatus := cdsBuscar.FieldByName('Estatus').AsString;
  Datos.Estatus := 'A';
  inherited;
end;

procedure TfrmBuscaMateria.FormCreate(Sender: TObject);
begin
  inherited;
  cdsBuscar.Close;
  cdsBuscar.Open;
end;

end.
