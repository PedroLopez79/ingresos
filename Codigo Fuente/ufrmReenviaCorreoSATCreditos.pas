unit ufrmReenviaCorreoSATCreditos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CustomModule, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinFoggy, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, Menus, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, DB,
  cxDBData, cxCheckBox, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, cxTextEdit, StdCtrls,
  cxButtons, cxGroupBox, cxMaskEdit, cxDropDownEdit, cxCalendar, cxDBEdit,
  uDAInterfaces, uDADataTable, dxmdaset, uDAScriptingProvider, uDACDSDataTable,
  ExtDlgs, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, LibraryFlotillas_Intf,
  uDAMemDataTable, uDARemoteDataAdapter, cxButtonEdit, cxCurrencyEdit, ufrmBuscar,
  ComCtrls;

type
  TfrmReenviaCorreoSATCreditos = class(TfrmCustomModule)
    cxGroupBox4: TcxGroupBox;
    Label9: TLabel;
    btnPreeliminar: TcxButton;
    tblFacturas: TdxMemData;
    DataSource1: TDataSource;
    dsFacturas: TDADataSource;
    Label1: TLabel;
    cxDateEdit1: TcxDateEdit;
    cxDateEdit2: TcxDateEdit;
    tblFacturasImpuesto: TFloatField;
    tblFacturasTotal: TFloatField;
    tblFacturasFolio: TIntegerField;
    tblFacturasSerie: TStringField;
    tblFacturasRFC: TStringField;
    tblFacturasVigencia: TBooleanField;
    tblFacturasFECHANOAPROBACION: TStringField;
    tblFacturasFECHAHORA: TStringField;
    tblFacturasFacturaID: TIntegerField;
    DADataSource1: TDADataSource;
    cdsEstacion: TDACDSDataTable;
    Label2: TLabel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1DBTableView1RecId: TcxGridDBColumn;
    cxGrid1DBTableView1Reenviar: TcxGridDBColumn;
    cxGrid1DBTableView1RFC: TcxGridDBColumn;
    cxGrid1DBTableView1Serie: TcxGridDBColumn;
    cxGrid1DBTableView1Folio: TcxGridDBColumn;
    cxGrid1DBTableView1Total: TcxGridDBColumn;
    cxGrid1DBTableView1Impuesto: TcxGridDBColumn;
    cdsGasolinero: TDACDSDataTable;
    rdaFacturas: TDARemoteDataAdapter;
    cdsFacturas: TDAMemDataTable;
    Label7: TLabel;
    edtNombre: TcxTextEdit;
    dsCliente: TDADataSource;
    cdsCliente: TDACDSDataTable;
    btnBuscaCliente: TcxButton;
    edtCliente: TcxCurrencyEdit;
    lblSerie: TLabel;
    edtSerie: TcxTextEdit;
    prgBar: TProgressBar;
    procedure btnPreeliminarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtClienteExit(Sender: TObject);
    procedure btnBuscaClienteClick(Sender: TObject);
  private
    { Private declarations }
    procedure ActionProcesar(Action: TBasicAction);
  public
    { Public declarations }
    procedure UpdateActionsState; override;
  protected
    procedure BuscarCliente;
    procedure RegisterActions; override;
  end;

var
  frmReenviaCorreoSATCreditos: TfrmReenviaCorreoSATCreditos;
  Datos : TDatosBusqueda;

implementation

uses  Modules, dmActions, uDMFlotillas, ufrmBuscarCliente,
     UtileriasComun;

{$R *.dfm}

procedure TfrmReenviaCorreoSATCreditos.ActionProcesar(Action: TBasicAction);
var
  Cadena:String;
begin
  Cadena:= Cadena + '(';

  tblFacturas.First;
  while not tblFacturas.Eof do
  begin
      if (tblFacturas.FieldByName('Reenviar').AsBoolean) then
      begin
         Cadena:= Cadena + tblFacturas.FieldByName('FACTURAID').AsString;
         if not tblFacturas.Eof then Cadena:= Cadena + ',';
      end;
      tblFacturas.Next;
  end;
  Delete(Cadena, length(Cadena),1);
  Cadena:= Cadena + ')';

  DMFlotillas.cdsMaestro.Close;
  DMFlotillas.cdsDetalle.Close;

  DMFlotillas.cdsMaestro.Fields.Clear;
  DMFlotillas.cdsDetalle.Fields.Clear;

  DMFlotillas.rdaMaestro.GetDataCall.ParamByName('SQL').AsString:= 'UPDATE FACTURAELECTRONICA SET ENVIADO = 0 WHERE FACTURAID IN'+ CADENA + ' SELECT 1';
  DMFlotillas.rdaMaestro.GetDataCall.ParamByName('Parametros').AsComplexType:=DMFlotillas.Parametros;
  DMFlotillas.cdsMaestro.Open;

  tblFacturas.Close;
  cdsFacturas.Close;
end;

procedure TfrmReenviaCorreoSATCreditos.btnBuscaClienteClick(Sender: TObject);
begin
  inherited;
  BuscarCliente;
end;

procedure TfrmReenviaCorreoSATCreditos.btnPreeliminarClick(Sender: TObject);
var
  P: TParametrosF;
  S: String;
begin
  inherited;
  P:=TParametrosF.Create;
  try
    cdsFacturas.Close;
    P.ClienteIni:= edtCliente.EditValue;
    P.FechaIni:= cxDateEdit1.Date;
    P.FechaFin:= cxDateEdit2.Date;
    P.Serie:= edtSerie.EditValue;
    S:='SELECT CLIENTE.RFC, FACTURA.SERIE, FACTURA.FOLIO, CONVERT(VARCHAR(4), FACTURA.FECHA, 20) '+
       '+ CAST(GASOLINERO.NOAPROBACION AS VARCHAR(100)) AS FECHANOAPROBACION, CONVERT(VARCHAR(4),'+
       ' FACTURA.FECHA, 20)+ '''+ '/'+ ''' + CONVERT(VARCHAR(2), FACTURA.FECHA, 10) + '''+ '/'+ ''' + CONVERT(VARCHAR(2),'+
       ' FACTURA.FECHA, 5) + '''+''' + CONVERT(Char(8), FACTURA.FECHA, 108) AS FECHAHORA, Factura.Total,'+
       ' Factura.Impuesto, FacturaElectronica.Enviado, FacturaElectronica.FacturaID From Factura'+
       ' INNER JOIN FacturaElectronica on FacturaElectronica.FacturaID = Factura.FacturaID'+
       ' INNER JOIN GASOLINERO ON GASOLINERO.GASOLINEROID = GASOLINERO.GASOLINEROID'+
       ' INNER JOIN CLIENTE ON CLIENTE.CLIENTEID = FACTURA.CLIENTEID'+
       ' WHERE (FACTURA.FECHA BETWEEN @FECHAINI AND @FECHAFIN)AND(FACTURA.CLIENTEID = @CLIENTEINI)AND(FACTURA.SERIE = @SERIE)';
    rdaFacturas.GetDataCall.ParamByName('SQL').AsString:=S;
    rdaFacturas.GetDataCall.ParamByName('Parametros').AsComplexType:=P;
    cdsFacturas.Open;
    cxGrid1DBTableView1.ClearItems;
    cxGrid1DBTableView1.DataController.CreateAllItems();
  finally
    FreeAndNil(P);
  end;

  tblFacturas.Close;
  tblFacturas.Open;

  prgBar.Position:= 0;
  prgBar.Min:=0; prgBar.Max:= cdsFacturas.RecordCount;
  while not cdsFacturas.EOF do
  begin
    tblFacturas.Append;
    tblFacturas.FieldByName('Reenviar').AsBoolean:= False;
    tblFacturas.FieldByName('RFC').AsString:= cdsFacturas.FieldByName('RFC').AsString;
    tblFacturas.FieldByName('Serie').AsString:= cdsFacturas.FieldByName('Serie').AsString;
    tblFacturas.FieldByName('Folio').AsInteger:= cdsFacturas.FieldByName('Folio').AsInteger;
    tblFacturas.FieldByName('Total').AsFloat:= cdsFacturas.FieldByName('Total').AsFloat;
    tblFacturas.FieldByName('Impuesto').AsFloat:= cdsFacturas.FieldByName('Impuesto').AsFloat;
    tblFacturas.FieldByName('FECHANOAPROBACION').AsString:= cdsFacturas.FieldByName('FECHANOAPROBACION').AsString;
    tblFacturas.FieldByName('FECHAHORA').AsString:= cdsFacturas.FieldByName('FECHAHORA').AsString;
    tblFacturas.FieldByName('FacturaID').AsInteger:= cdsFacturas.FieldByName('FacturaID').AsInteger;
    cdsFacturas.Next;
    prgBar.Position:= prgBar.Position + 1;
  end;

  UpdateActionsState;
end;


procedure TfrmReenviaCorreoSATCreditos.BuscarCliente;
var
  Datos: TDatosBusqueda;
begin
   Datos:=PantallaBusqueda(TfrmBuscarCliente);
   if Datos.OK then
   begin
     if Datos.Estatus <> 'A' then
     begin
        MessageDlg('Cliente no esta Activo', mtError, [mbOK], 0);
        Exit;
     end;
     edtCliente.Text :=inttostr(Datos.Clave);
     edtNombre.Text := Datos.Nombre;
   end;
end;

procedure TfrmReenviaCorreoSATCreditos.edtClienteExit(Sender: TObject);
begin
  inherited;
  cdsCliente.Close;
  if edtCliente.Text='' then
   begin
     edtCliente.Text:='0000';
     cdsCliente.ParamByName('Cliente').AsInteger := strToInt(edtCliente.Text);
   end
  else
  cdsCliente.ParamByName('Cliente').AsInteger := strToInt(edtCliente.Text);
  cdsCliente.Open;

  if not (cdsCliente.EOF) then
  begin
     if (cdsCliente.FieldByName('Estatus').AsString <> 'A') then
     begin
       MessageDlg('Cliente no esta Activo', mtError, [mbOK], 0);
       Exit;
     end;

     Datos.Clave:=cdsCliente.FieldByName('ClienteID').AsInteger;
     Datos.Nombre:= cdsCliente.FieldByName('Nombre').AsString;
     Datos.FormaPago:= cdsCliente.FieldByName('FormaPagoID').AsInteger;
     Datos.Estatus := cdsCliente.FieldByName('Estatus').AsString;
     Datos.RFC := '';
     Datos.Cuenta:= cdsCliente.FieldByName('CuentaContable').AsString;

     edtCliente.Text :=inttostr(Datos.Clave);
     edtNombre.Text:= Datos.Nombre;
  end
  else
  begin
    MessageDlg('El cliente no existe', mtError, [mbOK], 0);
    edtCliente.SetFocus;
  end;

  if not (edtCliente.Focused) then dmAppActions.actBuscar.Enabled:=False;
end;

procedure TfrmReenviaCorreoSATCreditos.FormShow(Sender: TObject);
begin
  inherited;
  cdsEstacion.Close;
  cdsEstacion.Open;
end;

procedure TfrmReenviaCorreoSATCreditos.RegisterActions;
begin
  inherited RegisterActions;
  RegisterAction(AppActions.actProcesar, ActionProcesar);
end;

procedure TfrmReenviaCorreoSATCreditos.UpdateActionsState;
begin
  inherited;
  dmAppActions.actProcesar.Enabled:=cdsFacturas.State = dsBrowse;
end;

initialization
  ModuleInfoManager.RegisterModule('ReenviaCorreo SAT Creditos', TfrmReenviaCorreoSATCreditos);

end.
