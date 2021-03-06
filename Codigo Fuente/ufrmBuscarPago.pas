unit ufrmBuscarPago;

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
  dxSkinSpringTime, dxSkinDarkRoom, dxSkinFoggy, dxSkinSeven, dxSkinSharp,
  dxmdaset, uDAMemDataTable, uDARemoteDataAdapter, dxSkinBlueprint,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinHighContrast,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinSevenClassic,
  dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint,
  cxNavigator, dxRibbonSkins, uDADataAdapter, uDAFields, uROComponent;

type
  TfrmBuscarPago = class(TfrmBuscar)
    rdaBuscarPagos: TDARemoteDataAdapter;
    cdsPagos: TDAMemDataTable;
    tblPagos: TdxMemData;
    dsPagos: TDataSource;
    tblPagosReciboID: TIntegerField;
    tblPagosFolio: TIntegerField;
    tblPagosFechaMovimiento: TDateTimeField;
    tblPagosReferencia: TStringField;
    tblPagosImporte: TFloatField;
    tblPagosFechaCaptura: TDateTimeField;
    tblPagosFechaAplicacion: TDateTimeField;
    tblPagosClienteID: TIntegerField;
    cxGridDBTableView1RecId: TcxGridDBColumn;
    cxGridDBTableView1ReciboID: TcxGridDBColumn;
    cxGridDBTableView1Folio: TcxGridDBColumn;
    cxGridDBTableView1FechaMovimiento: TcxGridDBColumn;
    cxGridDBTableView1Referencia: TcxGridDBColumn;
    cxGridDBTableView1Importe: TcxGridDBColumn;
    cxGridDBTableView1FechaCaptura: TcxGridDBColumn;
    cxGridDBTableView1FechaAplicacion: TcxGridDBColumn;
    cxGridDBTableView1ClienteID: TcxGridDBColumn;
    procedure cxGridDBTableView1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBuscarPago: TfrmBuscarPago;
  ID: integer;
  Datos_Reg: TDatosBusqueda;

function Abrir_BuscarPago(ClienteID: Integer): TDatosBusqueda;

implementation

uses uDMFlotillas, LibraryFlotillas_Intf;

{$R *.dfm}

function Abrir_BuscarPago(ClienteID: Integer): TDatosBusqueda;
Begin
  ID:= ClienteID;
  frmBuscarPago:=TfrmBuscarPago.Create(Application);
  frmBuscarPago.ShowModal;

  Result:= Datos_Reg;
  frmBuscarPago.Free;
End;

procedure TfrmBuscarPago.cxGridDBTableView1DblClick(Sender: TObject);
begin
  Datos.Clave:= tblPagos.FieldByName('ReciboID').AsInteger;
  Datos.Tipo:=  tblPagos.FieldByName('Folio').AsInteger;
  Datos.Nombre:= tblPagos.FieldByName('Referencia').AsString;
  Datos.Importe:= tblPagos.FieldByName('Importe').AsFloat;
  Datos.FormaPago:= tblPagos.FieldByName('ClienteID').AsInteger;

  Datos.OK:=True;
  Datos_Reg:= Datos;
  inherited;

end;

procedure TfrmBuscarPago.FormShow(Sender: TObject);
var
  S: String;
  P: TParametrosF;
begin
  cdsBuscar.Close;
  cdsPagos.Close;

  cxGridDBTableView1.ClearItems;
  cxGridDBTableView1.DataController.CreateAllItems();
  P:= TParametrosF.Create;
  Try
  P.ClienteIni:= ID;
  S:= 'SELECT ReciboID, Folio, FechaMovimiento, Referencia, Importe, FechaCaptura, FechaAplicacion, ClienteID '+
      'From Recibo Where ClienteID = @ClienteIni order by ReciboID Desc';

  rdaBuscarPagos.GetDataCall.ParamByName('SQL').AsString:=S;
  rdaBuscarPagos.GetDataCall.ParamByName('Parametros').AsComplexType:=P;
  cdsPagos.Open;

  tblPagos.Open;

  while not cdsPagos.EOF do
  begin

   tblPagos.Append;
   tblPagos.FieldByName('ReciboID').AsInteger:= cdsPagos.FieldByName('ReciboID').AsInteger;
   tblPagos.FieldByName('Folio').AsInteger:= cdsPagos.FieldByName('Folio').AsInteger;
   tblPagos.FieldByName('FechaMovimiento').AsDateTime:= cdsPagos.FieldByName('FechaMovimiento').AsDateTime;
   tblPagos.FieldByName('Referencia').AsString:= cdsPagos.FieldByName('Referencia').AsString;
   tblPagos.FieldByName('Importe').AsFloat:= cdsPagos.FieldByName('Importe').AsFloat;
   tblPagos.FieldByName('FechaCaptura').AsDateTime:= cdsPagos.FieldByName('FechaCaptura').AsDateTime;
   tblPagos.FieldByName('FechaAplicacion').AsDateTime:= cdsPagos.FieldByName('FechaAplicacion').AsDateTime;
   tblPagos.FieldByName('ClienteID').AsInteger:= cdsPagos.FieldByName('ClienteID').AsInteger;

   cdsPagos.Next;
  end;
  finally
    tblPagos.First;
    FreeAndNil(P);
  end;
end;

end.
