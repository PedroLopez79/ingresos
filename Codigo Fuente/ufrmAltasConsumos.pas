unit ufrmAltasConsumos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CustomModule, cxTextEdit, cxDBEdit, StdCtrls, cxControls,
  cxContainer, cxEdit, cxGroupBox, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxSpinEdit, cxSpinButton, cxTimeEdit, cxGraphics, Menus, cxLookAndFeelPainters,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxButtons, cxCurrencyEdit,
  DB, uDADataTable, uDAScriptingProvider, uDACDSDataTable, dxSkinsCore,
  dxSkinsDefaultPainters, uDAInterfaces, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinSilver, dxSkinStardust,
  dxSkinSummer2008, dxSkinValentine, dxSkinXmas2008Blue, cxLookAndFeels,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinPumpkin, dxSkinSeven,
  dxSkinSharp, dxSkinSpringTime, dxSkinscxPCPainter, cxPC, uDARemoteDataAdapter;

type
  TfrmAltasConsumos = class(TfrmCustomModule)
    gbDatos: TcxGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    lblProducto: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    edtCliente: TcxCurrencyEdit;
    edtTarjeta: TcxCurrencyEdit;
    btnBuscaCliente: TcxButton;
    btnBuscaTarjeta: TcxButton;
    edtIdentificadorID: TcxCurrencyEdit;
    edtTipo: TcxCurrencyEdit;
    edtSecuencia: TcxCurrencyEdit;
    dtpFechaCarga: TcxDateEdit;
    dtpHoraCarga: TcxTimeEdit;
    dtpFecha: TcxDateEdit;
    cbProducto: TcxLookupComboBox;
    edtPrecio: TcxCurrencyEdit;
    edtCantidad: TcxCurrencyEdit;
    edtImporte: TcxCurrencyEdit;
    edtCuenta: TcxTextEdit;
    edtTurno: TcxCurrencyEdit;
    edtBomba: TcxCurrencyEdit;
    edtKilometros: TcxCurrencyEdit;
    cbEstacion: TcxLookupComboBox;
    cdsEstacion: TDACDSDataTable;
    cdsProductos: TDACDSDataTable;
    dsProductos: TDADataSource;
    dsEstacion: TDADataSource;
    cdsObtenDatosCM: TDACDSDataTable;
    dsObtenDatosCM: TDADataSource;
    edtIEPS: TcxCurrencyEdit;
    Label1: TLabel;
    cxTicket: TcxButton;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    rdaTickets: TDARemoteDataAdapter;
    cdsTickets: TDACDSDataTable;
    procedure cxTicketClick(Sender: TObject);
    procedure edtImportePropertiesEditValueChanged(Sender: TObject);
    procedure edtPrecioPropertiesEditValueChanged(Sender: TObject);
    procedure btnBuscaClienteClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnBuscaTarjetaClick(Sender: TObject);
    procedure edtClienteEnter(Sender: TObject);
    procedure edtClienteExit(Sender: TObject);
    procedure edtTarjetaEnter(Sender: TObject);
    procedure edtTarjetaExit(Sender: TObject);
    procedure cbProductoPropertiesChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dtpFechaExit(Sender: TObject);
    procedure dtpFechaCargaExit(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    { Private declarations }

    procedure BuscarCliente;
    procedure BuscarTarjeta;
    procedure BuscarTarjetaAditivos;
    procedure BuscarTarjetaGastos;
    procedure Limpia;
    procedure ActionNuevo(Action: TBasicAction);
    procedure ActionGuardar(Action: TBasicAction);
    procedure ActionCancelar(Action: TBasicAction);
    procedure ActionBuscar(Action: TBasicAction);
  public
    { Public declarations }
    procedure UpdateActionsState; override;
  protected
    procedure RegisterActions; override;
  end;

var
  frmAltasConsumos: TfrmAltasConsumos;

implementation
uses
   Modules, uDMFlotillas, dmActions, ufrmBuscarClienteCredito, uDM,
   UtileriasComun, LibraryFlotillas_Intf, ufrmBuscar, ufrmBuscarTarjeta,
   ufrmBuscarTarjetasAditivos, ufrmBuscarTarjetasGastos, uDMCistemGas,
   LibraryCistemGas_Intf;

{$R *.dfm}
{ TfrmAltasConsumos }

procedure TfrmAltasConsumos.ActionBuscar(Action: TBasicAction);
begin
   if edtCliente.Focused then
      BuscarCliente;
   if edtTarjeta.Focused then
      BuscarTarjeta;
end;

procedure TfrmAltasConsumos.ActionCancelar(Action: TBasicAction);
begin
  dmAppActions.actNuevo.Enabled:=True;
  dmAppActions.actGuardar.Enabled:= False;
  dmAppActions.actCancelar.Enabled:= False;
  dmAppActions.actBuscar.Enabled:= False;
  Limpia;
  gbDatos.Enabled:= False;
end;

procedure TfrmAltasConsumos.ActionGuardar(Action: TBasicAction);
var
  Consumo:TConsumo;
begin
   if (edtPrecio.EditValue = 0) or (edtImporte.EditValue = 0) or (edtCantidad.EditValue = 0) then
   begin
     MessageDlg('Debe de capturar todos los datos del consumo.', mtError, [mbOK], 0);
     exit;
   end;
   
   Consumo:= TConsumo.Create;
   Consumo.SecuenciaVenta:= strtoint(edtSecuencia.Text);
   Consumo.ClienteID:= strtoint(edtCliente.text);
   Consumo.VehiculoID:= strtoint(edtTarjeta.Text);
   Consumo.FechaMovimiento:= dtpFecha.Date;
   Consumo.FechaCarga:= dtpFechaCarga.Date + dtpHoraCarga.Time;
   Consumo.ProductoID:= cbProducto.EditValue;
   Consumo.Precio:= edtPrecio.Value;
   Consumo.Cantidad:= edtCantidad.Value;
   Consumo.Importe:= edtImporte.Value;
   Consumo.CuentaContable:= edtCuenta.Text;
   Consumo.EstacionID:= cbEstacion.EditValue;
   Consumo.Turno:= StrToInt(edtTurno.Text);
   Consumo.Kilometraje:= StrToInt(edtKilometros.Text);
   Consumo.PosicionCarga:= StrToInt(edtBomba.Text);
   Consumo.GasolineroID:= StrToInt(edtIdentificadorID.Text);
   Consumo.Facturado:= 0;
   Consumo.Ejercicio:= StrToInt(FormatDateTime('yyyy',dtpFecha.Date));
   Consumo.Periodo:= StrToInt(FormatDateTime('m',dtpFecha.Date));
   Consumo.Dia:= StrToInt(FormatDateTime('d',dtpFecha.Date));
   Consumo.Tarjeta:=  edtTipo.Text + edtIdentificadorID.Text + FormatFloat('00000000', edtTarjeta.EditValue);
   Consumo.ManualAutomatico:='M';
   Consumo.ImpuestoPorcentaje:=DM.IVA;
   Consumo.IEPS:=StrToFloat(edtIEPS.Text);
   Consumo.UsuarioID:= DM.EmpleadoID;
   Consumo.ImpuestoImporte:=Decimales(Consumo.Importe - Decimales(Consumo.Importe / (1 + (DM.IVA / 100)), 2), 2);
   DMFlotillas.Server.GuardarConsumo(Consumo);
   DMFlotillas.Server.ActualizaHistorial(Consumo);

   dmAppActions.actNuevo.Enabled:=True;
   dmAppActions.actGuardar.Enabled:= False;
   dmAppActions.actCancelar.Enabled:= False;
   dmAppActions.actBuscar.Enabled:= False;

   Limpia;
   gbDatos.Enabled:= False;
end;

procedure TfrmAltasConsumos.ActionNuevo(Action: TBasicAction);
var
  Fecha: TDateTime;
begin
   gbDatos.Enabled := True;
   dmAppActions.actNuevo.Enabled:=False;
   dmAppActions.actGuardar.Enabled:= True;
   dmAppActions.actCancelar.Enabled:= True;
   dmAppActions.actBuscar.Enabled:= False;

   Fecha:=DM.Servidor.Fecha;
   dtpFechaCarga.Date:= Trunc(Fecha);
   dtpFecha.Date := Trunc(Fecha);
   edtTurno.Text:='1';
   edtBomba.Text:='1';
   edtKilometros.Text:='1';
   edtIEPS.Text:='0';

   cdsEstacion.Close;
   cdsEstacion.ParamByName('Externa').AsBoolean:=DM.Seguridad.SeguridadPorNombre('Estacion Externa en Cargas') <> nil;
   cdsEstacion.Open;

   cbEstacion.EditValue:= DM.NumeroEstacion;
   
   cdsProductos.Close;
   cdsProductos.Open;
end;

procedure TfrmAltasConsumos.btnBuscaClienteClick(Sender: TObject);
begin
  inherited;
  BuscarCliente;
end;

procedure TfrmAltasConsumos.btnBuscaTarjetaClick(Sender: TObject);
begin
  inherited;
  if edtCliente.Text<>'' then
    BuscarTarjeta
  else
    MessageDlg('Debe seleccionar un cliente.', mtError, [mbOK], 0);
end;

procedure TfrmAltasConsumos.BuscarCliente;
var
   Datos: TDatosBusqueda;
begin
   Datos:=PantallaBusqueda(TfrmBuscarClienteCredito,'');
   if Datos.OK then
     edtCliente.Value := Datos.Clave;
end;

procedure TfrmAltasConsumos.BuscarTarjeta;
var
   Datos: TDatosBusqueda;
begin
   Datos:=PantallaBusqueda(TfrmBuscarTarjeta, edtCliente.Text);
   if Datos.OK then
   begin
      edtTarjeta.Value:= Datos.Clave;
      edtIdentificadorID.Value:= DM.Identificador;
      edtTipo.Value:=Datos.Tipo;
   end;
end;

procedure TfrmAltasConsumos.BuscarTarjetaAditivos;
var
   Clave: Integer;
begin
   Clave:= Abrir_BuscarTarjetaAditivos(strtoint(edtCliente.Text));

   if Clave > 0 then edtTarjeta.Value:= Clave;

end;

procedure TfrmAltasConsumos.BuscarTarjetaGastos;
var
   Clave: Integer;
begin
   Clave:= Abrir_BuscarTarjetaGastos(strtoint(edtCliente.Text));

   if Clave > 0 then edtTarjeta.Value:= Clave;

end;

procedure TfrmAltasConsumos.cbProductoPropertiesChange(Sender: TObject);
begin
  inherited;
  if cdsProductos.Active then
  begin
    cdsProductos.Locate('ProductoID', cbProducto.EditValue, []);
    edtIEPS.Value:=cdsProductos.FieldByName('IEPS').AsFloat;
    edtPrecio.Value := cdsProductos.FieldByName('Precio').AsFloat;
  end;
end;

procedure TfrmAltasConsumos.cxButton1Click(Sender: TObject);
begin
  if edtCliente.Text<>'' then
  begin
    BuscarTarjetaAditivos;
    edtTarjetaExit(self);
  end
  else
    MessageDlg('Debe seleccionar un cliente.', mtError, [mbOK], 0);
end;

procedure TfrmAltasConsumos.cxButton2Click(Sender: TObject);
begin
  inherited;
  if edtCliente.Text<>'' then
  begin
    BuscarTarjetaGastos;
    edtTarjetaExit(self);
  end
  else
    MessageDlg('Debe seleccionar un cliente.', mtError, [mbOK], 0);
end;

procedure TfrmAltasConsumos.cxTicketClick(Sender: TObject);
var
  S: String;
  P: TParametros;
begin
  inherited;
  //edtSecuencia.Text:=IntToStr(DM.Servidor.Folio('TicketID',''));
  DMCistemGas.ConectaServer(DM.NumeroEstacion);

  P:= TParametros.Create;
  P.TurnoIni:= edtSecuencia.EditValue;

  if DM.VERSIONVOLUMETRICO = 'STANDARD' then
  BEGIN
  S:= 'SELECT Volumen, Importe, FechaCarga as FechaCarga, Precio, ProductoID, TurnoID, BombaID from trama '+
      'WHERE TramaID = @TurnoIni'
  END;
  if DM.VERSIONVOLUMETRICO = 'IMPI' then
  BEGIN
  S:= 'SELECT Volumen, Importe, FechaVenta as FechaCarga, Precio, ProductoID, TurnoID, BombaID from trama '+
      'WHERE TramaID = @TurnoIni'
  END;
  cdsTickets.Close;
  rdaTickets.GetDataCall.ParamByName('SQL').AsString:=S;
  rdaTickets.GetDataCall.ParamByName('Parametros').AsComplexType:= P;
  cdsTickets.Open;

  if cdsTickets.RecordCount > 0 then
  begin
    dtpFechaCarga.Date:= cdsTickets.FieldByName('FechaCarga').AsDateTime;
    dtpHoraCarga.Time:= cdsTickets.FieldByName('FechaCarga').AsDateTime;
    cbProducto.EditValue:= cdsTickets.FieldByName('ProductoID').AsInteger;
    edtPrecio.EditValue:= cdsTickets.FieldByName('Precio').AsFloat;
    edtCantidad.EditValue:= cdsTickets.FieldByName('Volumen').AsFloat;
    edtImporte.EditValue:= cdsTickets.FieldByName('Importe').AsFloat;
    edtTurno.EditValue:= cdsTickets.FieldByName('TurnoID').AsInteger;
    edtBomba.EditValue:= cdsTickets.FieldByName('BombaID').AsInteger;
  end;  
end;

procedure TfrmAltasConsumos.dtpFechaCargaExit(Sender: TObject);
begin
  inherited;
  dtpFecha.Date:=Trunc(dtpFechaCarga.Date);
end;

procedure TfrmAltasConsumos.dtpFechaExit(Sender: TObject);
begin
  inherited;
  dtpFechaCarga.Date:=Trunc(dtpFecha.Date);
end;

procedure TfrmAltasConsumos.edtClienteEnter(Sender: TObject);
begin
  inherited;
  dmAppActions.actBuscar.Enabled:= True;
end;

procedure TfrmAltasConsumos.edtClienteExit(Sender: TObject);
begin
  inherited;
  //dmAppActions.actBuscar.Enabled:= False;
end;

procedure TfrmAltasConsumos.edtImportePropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  if edtPrecio.EditValue > 0 then
    edtCantidad.EditValue:=Decimales(edtImporte.EditValue / edtPrecio.EditValue, 3)
  else
    edtCantidad.EditValue:=0;
end;

procedure TfrmAltasConsumos.edtPrecioPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  edtImporte.EditValue:=Decimales(edtPrecio.EditValue * edtCantidad.EditValue, 2); 
end;

procedure TfrmAltasConsumos.FormCreate(Sender: TObject);
begin
  inherited;
  dtpFecha.Enabled:=DM.Seguridad.SeguridadPorNombre('Habilita Fecha Cargas') <> nil;
  dtpFechaCarga.Enabled:=DM.Seguridad.SeguridadPorNombre('Habilita Fecha Cargas') <> nil;
end;

procedure TfrmAltasConsumos.FormShow(Sender: TObject);
begin
  inherited;
  dmAppActions.actNuevo.Enabled:=True;
  dmAppActions.actGuardar.Enabled:= False;
  dmAppActions.actCancelar.Enabled:= False;
  dmAppActions.actBuscar.Enabled:= False;
end;

procedure TfrmAltasConsumos.Limpia;
begin
  edtCliente.Text:= '';
  edtTarjeta.Text:= '';
  edtIdentificadorID.Text:= '';
  edtTipo.Text:= '';
  edtSecuencia.Text:= '';
  edtPrecio.Text:= '0';
  edtCantidad.Text:= '0';
  edtImporte.Text:= '0';
  edtCuenta.Text:= '';
  edtTurno.Text:= '';
  edtBomba.Text:= '0';
  edtKilometros.Text:= '';
  dtpHoraCarga.Text:= '0';
  edtIEPS.Text:='';
end;

procedure TfrmAltasConsumos.RegisterActions;
begin
  inherited RegisterActions;
  RegisterAction(AppActions.actNuevo, ActionNuevo);
  RegisterAction(AppActions.actGuardar, ActionGuardar);
  RegisterAction(AppActions.actCancelar, ActionCancelar);
  RegisterAction(AppActions.actBuscar, ActionBuscar);
end;

procedure TfrmAltasConsumos.UpdateActionsState;
begin
  inherited;

end;

procedure TfrmAltasConsumos.edtTarjetaEnter(Sender: TObject);
begin
  inherited;
  dmAppActions.actBuscar.Enabled:= True;
 end;

procedure TfrmAltasConsumos.edtTarjetaExit(Sender: TObject);
begin
  inherited;
  dmAppActions.actBuscar.Enabled:= False;
  if edtTarjeta.Text<>'' then
  begin
  cdsObtenDatosCM.Close;
  cdsObtenDatosCM.ParamByName('VehiculoID').AsInteger:=edtTarjeta.EditValue;
  cdsObtenDatosCM.Open;
  end;
  if cdsObtenDatosCM.FieldByName('ClienteID').AsInteger > 0 then
  begin
    edtCliente.EditValue:=cdsObtenDatosCM.FieldByName('ClienteID').AsInteger;
    edtIdentificadorID.EditValue:=cdsObtenDatosCM.FieldByName('GasolineroID').AsInteger;
    EdtTipo.EditValue:=cdsObtenDatosCM.FieldByName('FormaCompraID').AsInteger;
    edtCuenta.EditValue:=cdsObtenDatosCM.FieldByName('CuentaContable').AsString;
  end
  else
    MessageDlg('Tarjeta no existe.', mtError, [mbOK], 0);
end;

initialization
ModuleInfoManager.RegisterModule('Consumo Manual', TfrmAltasConsumos);

end.
