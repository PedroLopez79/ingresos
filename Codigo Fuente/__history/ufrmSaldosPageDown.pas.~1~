unit ufrmSaldosPageDown;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  uDAInterfaces, uDADataTable, uDAScriptingProvider, uDAMemDataTable;

type
  TDatosFacturaCliente = class(TForm)
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1CargoAbonoID: TcxGridDBColumn;
    cxGrid1DBTableView1FechaMovimiento: TcxGridDBColumn;
    cxGrid1DBTableView1Referencia: TcxGridDBColumn;
    cxGrid1DBTableView1Cargo: TcxGridDBColumn;
    cxGrid1DBTableView1Abono: TcxGridDBColumn;
    cxGrid1DBTableView1Column1: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cdsSaldo: TDAMemDataTable;
    dsSaldo: TDADataSource;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DatosFacturaCliente: TDatosFacturaCliente;
  iEJERCICIO, iCLIENTEINI, iCLIENTEFIN, iINI,
  iFIN, iGRUPOFACTURARID, iFORMACOMPRAID: Integer;
  iGRUPO: String;

function Abrir_ModuloSaldosCliente(EJERCICIO,
                                   CLIENTEINI,
                                   CLIENTEFIN,
                                   INI,
                                   FIN,
                                   GRUPOFACTURARID,
                                   FORMACOMPRAID: Integer;
                                   GRUPO: String):String;

implementation

{$R *.dfm}

function Abrir_ModuloSaldosCliente(EJERCICIO,
                                   CLIENTEINI,
                                   CLIENTEFIN,
                                   INI,
                                   FIN,
                                   GRUPOFACTURARID,
                                   FORMACOMPRAID: Integer;
                                   GRUPO: String):String;
begin
  DatosFacturaCliente:=TDatosFacturaCliente.Create(Application);
  iEJERCICIO:= EJERCICIO;
  iCLIENTEINI:= CLIENTEINI;
  iCLIENTEFIN:= CLIENTEFIN;
  iINI:= INI;
  iFIN:= FIN;
  iGRUPOFACTURARID:= GRUPOFACTURARID;
  iFORMACOMPRAID:= FORMACOMPRAID;
  iGRUPO:= GRUPO;

  DatosFacturaCliente.ShowModal;

  Result:= '';
  DatosFacturaCliente.Free;
end;

procedure TDatosFacturaCliente.FormShow(Sender: TObject);
begin
  Screen.Cursor:=crHourGlass;
  cdsSaldo.Close;
  cdsSaldo.ParamByName('Ejercicio').AsInteger:=iEJERCICIO;
  cdsSaldo.ParamByName('ClienteIni').AsInteger:=iCLIENTEINI;
  cdsSaldo.ParamByName('ClienteFin').AsInteger:=iCLIENTEFIN;
  cdsSaldo.ParamByName('Ini').AsInteger:= iINI;
  cdsSaldo.ParamByName('Fin').AsInteger:= iFIN;
  cdsSaldo.ParamByName('GrupoFacturarID').AsInteger:=iGRUPOFACTURARID;
  cdsSaldo.ParamByName('FormaCompraID').AsInteger:=iFORMACOMPRAID;
  cdsSaldo.ParamByName('Grupo').AsString:=iGRUPO;
  cdsSaldo.Open;
end;

end.
