unit ServiceFlotillas_Impl;

interface

uses
  {vcl:} Classes, SysUtils,
  {RemObjects:} uROClientIntf, uROTypes, uROServer, uROServerIntf, uROSessions,
  {Data Abstract:} uDAClasses, uDADataTable, uDABinAdapter, uDAInterfaces, uDADataStreamer,
  {Ancestor Implementation:} DataAbstractService_Impl,
  {Used RODLs:} DataAbstract4_Intf, Forms,
  {Generated:} LibraryFlotillas_Intf, uDAScriptingProvider, uDABusinessProcessor,
  {GOB del Estado:}SoapHTTPClient, XSBuiltIns, ServicioAdmonCombustible,
  DB, uDACDSDataTable, uAutorizacion, Dialogs, uDABin2DataStreamer, Windows,
  StdCtrls, StrUtils, DateUtils,
  {FACTURAELECT}FCTELECT;

type
  { TServiceFlotillas }
  TServiceFlotillas = class(TDataAbstractService, IServiceFlotillas)
    bpReporte: TDABusinessProcessor;
    DataStreamer: TDABin2DataStreamer;
    Schema: TDASchema;
  private
    function BuscaAutorizacion(const Referencia:String):Boolean;
    function BuscaClientexVehiculo(const VehiculoID: Integer): Integer;
    procedure CalculaIEPS(var Datos: TDatosFactura);
    function IEPS(ProductoID: Integer): Real;
    function NombreProducto(ProductoID: Integer): String;
    function BuscaTicketsFactura(FacturaID: Integer): String;
    function AutorizaProcesaGOB(Procesar: TProcesaTarjeta; Autoriza: TAutoriza): TProcesaTarjeta;
    function AutorizaLimiteTemporal(Procesar: TProcesaTarjeta; Autoriza: TAutoriza): TProcesaTarjeta;
  protected
    { IServiceFlotillas methods }
    function Folio(const Campo: String; const Serie: String): Integer;
    function Login(const Usuario: String; const Clave: String): TLoginInfoF;
    procedure GuardaAccesos(const UsuarioID: Integer; const Lista: String);
    procedure EliminaAutorizacion(const AutorizacionID: Integer);
    procedure GuardaDatosFactura(const DatosFactura : TDatosFactura);
    function GenerarFacturas(const Serie: String; const fol: Integer; const FechaCorte: DateTime; const FechaContable: DateTime; const DiaFacturar: Integer;
                             const Magna: Boolean; const Premium: Boolean; const Diesel: Boolean; const EmpleadoID: Integer): Integer;
    function CambioFactura(const Serie: String; const Folio: Integer; const NevaSerie: String; const NuevoFolio: Integer; const FechaImpresion: DateTime): String;
    function DatosFactura(const Folio: Integer; const Serie: String): Boolean;
    function DocumentosConSaldo(const ClienteID: Integer): TDocumentosConSaldoArray;
    function DocumentosCupones(const ClienteID: Integer): TDocumentosCuponesArray;
    function DatosCliente(const ClienteID: Integer): TCliente;
    function DatosVehiculo(const VehiculoID: Integer):TDatosVehiculo;
    function Series(const Campo: String): String;
    function AbreDataSetReportes(const SQL: String; const Parametros: TParametrosF): Binary;
    function BuscarReporte(const Nombre: String): TReporteF;
    function ObtenCuponValido(const Barras: String; const Grupo: Integer; const CuponAutoriza: TAutoriza): TCuponValido;
    function GuardaAutorizacion(const Autorizacion:TAutoriza):Boolean;
    function QuemarCupon(const Consumo: TConsumo; const Barras: String):Boolean;
    function QuemarCupon_Manual(const Consumo: TConsumo; const Barras: String): Boolean;
    function GuardarConsumo(const Consumo: TConsumo): Boolean;
    procedure ActualizaSaldo(Identificador, ClienteID, Ejercicio, Periodo: Integer; Cargo, Abono: Double);
    procedure ActualizaHistorial(const Consumo: TConsumo);
    function AutorizaTarjeta(const Autoriza: TAutoriza): TTarjeta;
    function TarjetaConsumo(const Tarjeta: string; const Consumo: TConsumo): Boolean;
    function BuscaAutorizacionTajeta(const ClienteID: Integer; const VehiculoID: Integer; const GasolineroID: Integer): Boolean;
    function GasolineroID: Integer;
    function ReferenciaTarjeta(const VehiculoID: Integer): string;
    procedure AgregaReferencia(const VehiculoID: Integer; const Tipo: Integer; const Referencia: string);
    procedure VehiculoProducto(const VehiculoID: Integer; const ProductoID: Integer);
    procedure EliminaReferencia(const VehiculoID: Integer; const Tipo: Integer);
    procedure EliminaVehiculoProducto(const VehiculoID: Integer; const ProductoID: Integer);
    function AfectarMovimientos(const Movimiento: TMovimiento): Boolean;
    function AfectarSaldoDocumento(const SaldoDocumento: TSaldoDocumento): Boolean;
    function CierrePeriodo(const Periodo: Integer; const Ejercicio: Integer;  const UsuarioID: Integer): Boolean;
    function GasolineroNombre: string;
    function EliminaFactura(const Folio: Integer; const Serie: String): Boolean;
    function InsertaBitacora(const ClienteID: Integer; const UsuarioID: Integer;
                             const Tabla: String; const Campo: String; const ValorAnterior: String; const ValorNuevo: String): Boolean;
    function ValidaSecuencias(const EstacionID: Integer; const Secuencias: string): string;
    function AgregaSecuencias(const Consumos: aConsumo): Boolean;
    function CaracteresCupon: String;
    function CancelaGrupo(const Grupo: Integer): Boolean;
    function FacturaRecibo(const Cliente: Integer; const Importe: Double; const EstacionID: Integer; const EmpleadoID: Integer; const SerieFactura: String; const ProductoID: Integer): Integer;
    function ClaveACupon(const Clave: String): Integer;
    function CancelarLote(const LoteID: Integer; const UsuarioID: Integer): String;
    function StatusCupon(const Codigo: String): String;
    function CancelarCupones(const Lista: String; const UsuarioID: Integer): String;
    function ModificarFolioActual(const Campo: string; const Serie: string; const FolioNew: Integer): string;
    function EliminaAutorizacionVehiculo(const Referencia: AnsiString): Boolean;
    function TarjetasLLave: aTarjetaLlave;
    function Fecha: TDateTime;
    procedure GeneraCupones(const LoteCuponID: Integer; const ClienteID: Integer;
      const EstacionID: Integer; const Identificador: Integer;
      const Cupones: AGeneraCupon; const TipoCupon: Boolean; const Serie:AnsiString; const aFolio:Integer);
    function REDAutorizaciones(const EstacionID: Integer;
      const BombaID: Integer): AAutorizacion;
    function REDConsumo(const EstacionID: Integer; const Serie: string; const TicketID: Integer; const AutorizacionID: Integer;
      const Importe: Double; const ProductoID: Integer): TDatosTicketConsumo;
    function Bancaria(const Terminal: string; const Supervisor: string;
      const BombaID: Integer; const EstacionID: Integer; const Track1: string;
      const Track2: string; const Importe: Double; const Ticket: Integer;
      const Serie: String; const Comision: Double; const BancariaTipoID: Integer;
      const CajaID: Integer): TBancaria;
    function PrecioProducto(const ProductoID: Integer): Double;
    function TiempoAire(const EstacionID: Integer; const BombaID: Integer;
      const Telefono: string; const ProveedorID: Integer; const Importe: Double;
      const CajaID: Integer; const LLave: string): TTiempoAire;
    function CashBack(const EstacionID: Integer; const BombaID: Integer;
      const Terminal: string; const Track1: string; const Track2: string;
      const Importe: Double; const LLave: string; const CajaID: Integer): TBancaria;
    function DatosProducto(const ID: Integer): TProductoF;
    function IVAEstacion(const EstacionID: Integer): Double;
    function DatosClienteOtros(const Tarjeta: string;
      const EstacionID: Integer): TDatosClienteOtros;
    procedure ClasificacionCliente(const ClienteID: Integer;
      const Clasificacion: Integer);
    procedure ClasificacionVehiculo(const VehiculoID: Integer;
      const Clasificacion: Integer);
    function Clasificacion: Integer;
    function DatosVerifica(const VehiculoID: Integer): TDatosVerifica;
    function DatosVerificaReferencia(const Referencia: string): TDatosVerifica;
    function Rendimiento(const EstacionID: Integer;
      const TicketID: Integer): Double;
    function DatosVerifone(const VehiculoID: Integer; const Referencia: String): TDatosVerifoneF;
    function CambiaNIP(const Referencia: string; const NIP: Integer): Boolean;
    function CambiaClienteConsumo(const EstacionID: Integer;
      const Ticket: Integer; const Serie: string; const ClienteID: Integer;
      const VehiculoID: Integer): Boolean;
    function CuponManual(const EstacionID: Integer; const TurnoID: Integer;
      const BombaID: Integer; const Barras: string): TCuponValido;
    function GeneraFacturasXCliente(const ClienteID: Integer;
      const Productos: string; const FechaCorte: TDateTime;
      const FechaContable: TDateTime; const Serie: string;
      const aFolio: Integer; const EmpleadoID: Integer): Integer;
    function ValidaConsumo(const Consumo: TConsumo): Integer;
    function ClienteCupon(const Barras: AnsiString): Integer;
    function FacturaCupon(const Cliente: Integer; const Importe: Double; const EstacionID: Integer; const EmpleadoID: Integer; const SerieFactura: String): Integer;
    function GeneraFacturasXClienteCupones(const ClienteID: Integer; const Productos: AnsiString; const FechaCorte: DateTime; const FechaContable: DateTime;
                                           const EmpleadoID: Integer; const Serie: AnsiString; const aFolio: Integer): Integer;
    function AroVehiculo(const Referencia: AnsiString): AnsiString;
    function DatosFacturaElectronica(const FacturaID: Integer; const GasolineroID: Integer): TFacturaElectronicaF;
    procedure InsertaFacturaElectronica(const FacturaElectronicaID: Integer; const CadenaOriginal: Widestring; const SelloDigital: Widestring;
                                        const FacturaID: Integer; const Vigencia: Boolean; const Enviado: Boolean; const NoCertificado: AnsiString; 
                                        const NoAprobacion: AnsiString; const FechaAprobacion: DateTime);
    function FolioActual2(const Serie: String; const folio: Integer): Integer;
    function DatosMonedero(const FacturaID: Integer; const GasolineroID: Integer): TMonederoElectronico;
    function CadenaOriginal(const FacturaID:Integer; const GasolineroID: Integer): TDataFacturaElectronicaF;
    function GOBCHIP(const Referencia: AnsiString): Boolean;
    function GuardaBitacoraGOB(const BitacoraGOB: TBitacoraGOB): Boolean;
    function GuardarConsumoGOB(const Consumo: TConsumo): Boolean;
    function DatosUnidadesGOB(const TARJETA: AnsiString): TUnidadesGOB;
    function EnviaDatosFacturaGOB(const DatosFacturaEnviaGOB: TEnviaDatosFacturaGOB): Boolean;
    function AutorizaGOB(const Referencia: AnsiString): TAutorizaGOB;
    function FacturaEstacion(const DatosFactura: TDatosFactura; const EstacionID: Integer): Integer;
    function RegistraPagosFaltantes(const SaldoDocumentoID: Integer; const Fecha: DateTime; const FechaVencimiento: DateTime; const Cargo: Double; 
                                    const Abono: Double; const Referencia: AnsiString; const ClienteID: Integer; const MovimientoID: Integer; 
                                    const ReciboID: Integer; const BancoID: Integer; const Folio: Integer; const Ejercicio: Integer; const Periodo: Integer; 
                                    const Cheque: AnsiString; const Importe: Double; const CuentaContableCliente: AnsiString; const UsuarioID: Integer; 
                                    const EstacionID: Integer): Integer;
end;

implementation

{$R *.dfm}
uses
  {Generated:} LibraryFlotillas_Invk, fServerDataModule, UtileriasComun, IdHTTP;

function EsNumero(Cad: String): Boolean;
var
  I: Integer;
begin
  Result:=True;
  for I := 1 to Length(Cad) do    // Iterate
  begin
    if not (Cad[I] in ['0'..'9']) then
    begin
      Result:=False;
      Exit;
    end;
  end;    // for
end;

procedure Create_ServiceFlotillas(out anInstance: IUnknown);
begin
  anInstance := TServiceFlotillas.Create(nil);
end;

{ TServiceFlotillas }

function TServiceFlotillas.AbreDataSetReportes(const SQL: String;
  const Parametros: TParametrosF): Binary;
var
  DataSet: IDADataset;
  Aux: TStrings;
procedure AgregaParametro(Nombre: String; Tipo: TDADataType);
begin
  with DataSet.Params.Add do
  begin
    Name:=Nombre;
    DataType:=Tipo;
  end;    // with
end;
begin
  Aux:=TStringList.Create;
  if  FileExists('DefaultFlotillas.dat') then
    Aux.LoadFromFile('DefaultFlotillas.dat');
  DataSet := Connection.NewDataset(Aux.Text + SQL, 'Reporte');
  Aux.Add(SQL);
  Aux.SaveToFile('SQL.txt');
  Aux.Free;
  AgregaParametro('Identificador', datInteger);
  AgregaParametro('FechaIni', datDateTime);
  AgregaParametro('FechaFin', datDateTime);
  AgregaParametro('TipoFecha', datInteger);
  AgregaParametro('ClienteIni', datInteger);
  AgregaParametro('ClienteFin', datInteger);
  AgregaParametro('Grupo', datString);
  AgregaParametro('EstacionIni', datInteger);
  AgregaParametro('EstacionFin', datInteger);
  AgregaParametro('FacturaIni', datInteger);
  AgregaParametro('FacturaFin', datInteger);
  AgregaParametro('FechaCorte', datDateTime);
  AgregaParametro('Venc0', datInteger);
  AgregaParametro('Venc1', datInteger);
  AgregaParametro('Venc2', datInteger);
  AgregaParametro('Venc3', datInteger);
  AgregaParametro('Venc4', datInteger);
  AgregaParametro('Seleccion', datInteger);
  AgregaParametro('Orden', datInteger);
  AgregaParametro('Status', datInteger);
  AgregaParametro('ImporteLitros', datInteger);
  AgregaParametro('TarjetaIni', datInteger);
  AgregaParametro('TarjetaFin', datInteger);
  AgregaParametro('TipoMov', datString);
  AgregaParametro('FormaCompraID', datInteger);
  AgregaParametro('DiaFacturarID', datInteger);
  AgregaParametro('Ejercicio', datInteger);
  AgregaParametro('PeriodoIni', datInteger);
  AgregaParametro('PeriodoFin', datInteger);
  AgregaParametro('Movimientos', datString);
  AgregaParametro('AgenteIni', datInteger);
  AgregaParametro('AgenteFin', datInteger);
  AgregaParametro('ProcesaTabla', datInteger);
  AgregaParametro('Serie', datString);

  DataSet.ParamByName('ProcesaTabla').AsInteger:=Byte(Pos('#CONSUMOS', UpperCase(SQL)) > 0);
  DataSet.ParamByName('Identificador').AsInteger:=Parametros.Identificador;
  DataSet.ParamByName('FechaIni').AsDateTime:=Parametros.FechaIni;
  DataSet.ParamByName('FechaFin').AsDateTime:=Parametros.FechaFin;
  DataSet.ParamByName('TipoFecha').AsInteger:=Parametros.TipoFecha;
  DataSet.ParamByName('ClienteIni').AsInteger:=Parametros.ClienteIni;
  DataSet.ParamByName('ClienteFin').AsInteger:=Parametros.ClienteFin;
  DataSet.ParamByName('Grupo').AsString:=Parametros.Grupo;
  DataSet.ParamByName('EstacionIni').AsInteger:=Parametros.EstacionIni;
  DataSet.ParamByName('EstacionFin').AsInteger:=Parametros.EstacionFin;
  DataSet.ParamByName('FacturaIni').AsInteger:=Parametros.FacturaIni;
  DataSet.ParamByName('FacturaFin').AsInteger:=Parametros.FacturaFin;
  DataSet.ParamByName('FechaCorte').AsDateTime:=Parametros.FechaCorte;
  DataSet.ParamByName('Venc0').AsInteger:=Parametros.Venc0;
  DataSet.ParamByName('Venc1').AsInteger:=Parametros.Venc1;
  DataSet.ParamByName('Venc2').AsInteger:=Parametros.Venc2;
  DataSet.ParamByName('Venc3').AsInteger:=Parametros.Venc3;
  DataSet.ParamByName('Venc4').AsInteger:=Parametros.Venc4;
  DataSet.ParamByName('Seleccion').AsInteger:=Parametros.Seleccion;
  DataSet.ParamByName('Orden').AsInteger:=Parametros.Orden;
  DataSet.ParamByName('Status').AsInteger:=Parametros.Status;
  DataSet.ParamByName('ImporteLitros').AsInteger:=Parametros.ImporteLitros;
  DataSet.ParamByName('TarjetaIni').AsInteger:=Parametros.TarjetaIni;
  DataSet.ParamByName('TarjetaFin').AsInteger:=Parametros.TarjetaFin;
  DataSet.ParamByName('TipoMov').AsString:=Parametros.TipoMov;
  DataSet.ParamByName('FormaCompraID').AsInteger:=Parametros.FormaCompraID;
  DataSet.ParamByName('DiaFacturarID').AsInteger:=Parametros.DiaFacturarID;
  DataSet.ParamByName('Ejercicio').AsInteger:=Parametros.Ejercicio;
  DataSet.ParamByName('PeriodoIni').AsInteger:=Parametros.PeriodoIni;
  DataSet.ParamByName('PeriodoFin').AsInteger:=Parametros.PeriodoFin;
  DataSet.ParamByName('AgenteIni').AsInteger:=Parametros.AgenteIni;
  DataSet.ParamByName('AgenteFin').AsInteger:=Parametros.AgenteFin;
  DataSet.ParamByName('Movimientos').AsString:=Parametros.Movimientos;
  DataSet.ParamByName('Serie').AsString:=Parametros.Serie;

  DataSet.Open;
  Result := Binary.Create;
  DataStreamer.WriteDataset(result, DataSet, [woSchema, woRows]);
  DataSet.Close;
end;

procedure TServiceFlotillas.ActualizaHistorial(const Consumo: TConsumo);
var
  cmd : IDASQLCommand;
  Aux: TDatosVerifica;
begin
  {if Consumo.Importe < 1 then
    Exit;}
  Aux:=TDatosVerifica.Create;
  Aux.AfectarHistorico:=False;
  try
    if (Consumo.VehiculoID > 0) and (Consumo.ProductoID > 3) then
      Aux.Assign(DatosVerifica(Consumo.VehiculoID));
    if not Aux.AfectarHistorico then
    begin
      cmd:= Schema.NewCommand(Connection,'spActualizaHistorial');
      cmd.ParamByName('ClienteID').AsInteger:= Consumo.ClienteID;
      cmd.ParamByName('VehiculoID').AsInteger:= Consumo.VehiculoID;
      cmd.ParamByName('GasolineroID').AsInteger:= Consumo.GasolineroID;
      cmd.ParamByName('Cantidad').AsFloat:= Consumo.Cantidad;
      cmd.ParamByName('Importe').AsFloat:= Consumo.Importe;
      cmd.ParamByName('Fecha').AsDateTime:= Consumo.FechaCarga;
      cmd.Execute;
    end;
  finally
    Aux.Free;
  end;
end;

procedure TServiceFlotillas.ActualizaSaldo(Identificador, ClienteID, Ejercicio,
  Periodo: Integer; Cargo, Abono: Double);
var
  S: String;
  MiDataSet: IDADataset;
  InsertaSaldo: IDASQLCommand;
begin
  MiDataSet:=Schema.NewDataset(Connection, 'SaldoEjercicio');
  try
    MiDataSet.ParamByName('GasolineroID').AsInteger:=Identificador;
    MiDataSet.ParamByName('ClienteID').AsInteger:=ClienteID;
    MiDataSet.ParamByName('Ejercicio').AsInteger:=Ejercicio;
    MiDataSet.Open;
    if MiDataSet.IsEmpty then
    begin
      InsertaSaldo:=Schema.NewCommand(Connection, 'spInsertaSaldoEjercicio');
      InsertaSaldo.ParamByName('GasolineroID').AsInteger:=Identificador;
      InsertaSaldo.ParamByName('ClienteID').AsInteger:=ClienteID;
      InsertaSaldo.ParamByName('Ejercicio').AsInteger:=Ejercicio;
      InsertaSaldo.Execute;
    end;
    MiDataSet.Close;
    S:='UPDATE SaldoEjercicio SET Cargo%s = Cargo%s + %s, Abono%s = Abono%s + %s WHERE Ejercicio = %d and ClienteID = %d AND GasolineroID = %d ';
    S:=Format(S, [FormatFloat('00', Periodo), FormatFloat('00', Periodo), FloatToStr(Cargo), FormatFloat('00', Periodo), FormatFloat('00', Periodo), FloatToStr(Abono), Ejercicio, ClienteID, Identificador]);
    InsertaSaldo:=Connection.NewCommand(S, stSQL, 'InsertaX');
    InsertaSaldo.Execute;
  except
  end;
end;

function TServiceFlotillas.AfectarMovimientos(
  const Movimiento: TMovimiento): Boolean;
var
  cmd: IDASQLCommand;
  DataSet: IDADataset;
begin
  Result:= False;

  Try
      DataSet:= Schema.NewDataset(Connection, 'DatosCliente');
      DataSet.ParamByName('ClienteID').AsInteger := Movimiento.ClienteID;
      DataSet.Open;

      cmd:= Schema.NewCommand(Connection, 'spInsertarMovimiento');
      //Afectar Movimientos//
      cmd.ParamByName('MovimientoID').AsInteger:= Movimiento.MovimientoID;
      cmd.ParamByName('FechaMovimiento').AsDateTime:= Movimiento.FechaMovimiento;
      cmd.ParamByName('FechaVencimiento').AsDateTime:=Movimiento.FechaVencimiento + DataSet.FieldByName('PlazoPago').AsInteger;
      cmd.ParamByName('Referencia').AsString:= Movimiento.Referencia;
      cmd.ParamByName('Ejercicio').AsInteger:= Movimiento.Ejercicio;
      cmd.ParamByName('Periodo').AsInteger:= Movimiento.Periodo;
      cmd.ParamByName('CargoAbono').AsString:= Movimiento.CargoAbono;
      cmd.ParamByName('Cargo').AsFloat := Movimiento.Cargo;
      cmd.ParamByName('Abono').AsFloat := Movimiento.Abono;
      cmd.ParamByName('FechaRegistro').AsDateTime := Movimiento.FechaRegistro;
      cmd.ParamByName('Origen').AsString:= Movimiento.Origen;
      cmd.ParamByName('AfectaSaldos').AsBoolean := Movimiento.AfectaSaldos;
      cmd.ParamByName('TipoMovimientoID').AsString := Movimiento.TipoMovimiento;
      cmd.ParamByName('UsuarioID').AsInteger:= Movimiento.UsuarioID;
      cmd.ParamByName('ClienteID').AsInteger:= Movimiento.ClienteID;
      cmd.Execute;
      Result:=True;
      DataSet.Close;
  Except
  End;

end;

function TServiceFlotillas.AfectarSaldoDocumento(
  const SaldoDocumento: TSaldoDocumento): Boolean;
var
  cmd: IDASQLCommand;
  DataSet: IDADataset;
begin
  Result:= False;
  Try
      DataSet:= Schema.NewDataset(Connection, 'DatosCliente');
      DataSet.ParamByName('ClienteID').AsInteger := SaldoDocumento.ClienteID;
      DataSet.Open;

      cmd:= Schema.NewCommand(Connection, 'spInsertaSaldoDocumentos');
      cmd.ParamByName('SaldoDocumentoID').AsInteger:=SaldoDocumento.SaldoDocumentoID;
      cmd.ParamByName('Fecha').AsDateTime:=SaldoDocumento.Fecha;
      cmd.ParamByName('FechaVencimiento').AsDateTime := SaldoDocumento.FechaVencimiento + DataSet.FieldByName('PlazoPago').AsInteger;
      cmd.ParamByName('Cargo').AsFloat:=SaldoDocumento.Cargo;
      cmd.ParamByName('Abono').AsFloat:=SaldoDocumento.Abono;
      cmd.ParamByName('Referencia').AsString:=SaldoDocumento.Referencia;
      cmd.ParamByName('ClienteID').AsInteger:=SaldoDocumento.ClienteID;
      cmd.ParamByName('MovimientoID').AsInteger:= SaldoDocumento.MovimientoID;
      cmd.Execute;
      Result:= True;
      DataSet.Close;
  Except
  End;
end;

procedure TServiceFlotillas.AgregaReferencia(const VehiculoID, Tipo: Integer;
  const Referencia: string);
var
  cmd: IDASQLCommand;
  ds: IDADataset;
  Ref: String;
begin
  ds:=Schema.NewDataset(Connection, 'ReferenciaTarjeta');
  ds.ParamByName('VehiculoID').AsInteger:=VehiculoID;
  ds.Open;
  case Tipo of
    1: Ref:=FormatFloat('0000', ds.FieldByName('FormaCompraID').AsInteger);
    2: Ref:='0097';
    3: Ref:='0098';
  end;

  Ref:=Ref+ FormatFloat('0000', ServerDataModule.GasolineroID);
  Ref:=Ref+ FormatFloat('00000000', VehiculoID);

  cmd:=Schema.NewCommand(Connection, 'Insert_dbo Referencia');
  cmd.ParamByName('VehiculoID').AsInteger:=VehiculoID;
  cmd.ParamByName('TipoReferenciaID').AsInteger:=Tipo;
  cmd.ParamByName('Referencia').AsString:=Ref;
  cmd.Execute;
end;

function TServiceFlotillas.AgregaSecuencias(const Consumos: aConsumo): Boolean;
var
  I: Integer;
begin
  for I := 0 to Consumos.Count - 1 do
  begin
    if Copy(Consumos[I].Tarjeta, 1, 4) = '0005' then
      QuemarCupon(Consumos[I], Consumos[I].Tarjeta)
    else
      TarjetaConsumo(Consumos[I].Tarjeta, Consumos[I]);
  end;
  Result:=True;
end;

function TServiceFlotillas.AroVehiculo(
  const Referencia: AnsiString): AnsiString;
var
  DataSet: IDADataSet;
begin
  Result:='';
  DataSet:= Schema.NewDataset(Connection, 'spAroVehiculo');
  DataSet.ParamByName('Referencia').AsString:= Referencia;
  DataSet.Open;

  if not (DataSet.EOF) then
  Begin
     if DataSet.FieldByName('ARO').AsString = '/' then
        Exit;

     Result:= DataSet.FieldByName('ARO').AsString;
  End;
end;

function TServiceFlotillas.AutorizaGOB(const Referencia: AnsiString): TAutorizaGOB;
var
{pla_GOB}//-GOBIERNO DEL ESTADO------------------------------------------------}
  GOB: ServicioAdmonCombustibleSoap;
  HTTPRIO: THTTPRIO;
  SALDOGOB: Double;
  cmd: IDASqlCommand;
  BitacoraGOB: TBitacoraGOB;
  DataSet, DSGOB: IDADataSet;
{pla_GOB}//--------------------------------------------------------------------}
begin
    Result:= TAutorizaGOB.Create();
    Result.SALDOGOB:= -1;
    Result.REFERENCIAGOB:='';
    Result.CLASIFICACION:= ServerDataModule.Clasificacion;


    HTTPRIO:= THTTPRIO.Create(Self);
    GOB:= GetServicioAdmonCombustibleSoap(True, ServerDataModule.GOBHOST, HTTPRIO);

    DSGOB:= Schema.NewDataset(Connection, 'spDatosVehiculoGOB');
    DSGOB.ParamByName('IDRFID').AsString:= Referencia;
    DSGOB.ParamByName('NUMEROECONOMICO').AsString:='';
    DSGOB.Open;

    if DSGOB.IsEmpty then
    Begin
       DSGOB.Close;
       DSGOB.ParamByName('NUMEROECONOMICO').AsString:=  GOB.ObtenerInformacion(Referencia,
                                                                                ServerDataModule.GOBUSUARIO,
                                                                                ServerDataModule.GOBPASSWORD)[0];
       if (DSGOB.ParamByName('NUMEROECONOMICO').AsString = ('-1'))OR
          (DSGOB.ParamByName('NUMEROECONOMICO').AsString = ('-2'))OR
          (DSGOB.ParamByName('NUMEROECONOMICO').AsString = ('-3'))OR
          (DSGOB.ParamByName('NUMEROECONOMICO').AsString = ('-12'))OR
          (DSGOB.ParamByName('NUMEROECONOMICO').AsString = ('-99')) then
       begin
          Result.REFERENCIAGOB:= DSGOB.ParamByName('NUMEROECONOMICO').AsString;
          Result.SALDOGOB:= 0;
          Exit;
       end;
                              

       DSGOB.ParamByName('IDRFID').AsString:= Referencia;
       DSGOB.Open;
    End;

    SALDOGOB:= StrToFloat(GOB.ObtenerSaldoDisponible(Referencia,
                          ServerDataModule.GOBUSUARIO,
                          ServerDataModule.GOBPASSWORD).DecimalString);

    if not(DSGOB.IsEmpty) then
    begin
       //DataSet.Close;
       DataSet:= Schema.NewDataset(Connection, 'spBuscaReferencia');
       DataSet.ParamByName('Referencia').AsString:= DSGOB.FieldByName('Referencia').AsString;
       DataSet.Open;

       Result.REFERENCIAGOB:= DSGOB.FieldByName('Referencia').AsString;
       Result.CLASIFICACION:= DSGOB.FieldByName('CLASIFICACION').AsInteger;

       if DSGOB.FieldByName('IDRFID').AsString = '' then
       begin
       cmd:=Schema.NewCommand(Connection, 'UPDIDRFIDGOB');
       cmd.ParamByName('VehiculoID').AsInteger:=DataSet.FieldByName('VehiculoID').AsInteger;
       cmd.ParamByName('IDRFID').AsString:=Referencia;
       cmd.Execute;
       end;
    end;
   ///SALDOS:=SALDO.DecimalString;
//Guarda BitacoraGOB----------------------------------------------------------//
 if SALDOGOB > 0 then
 begin
    BitacoraGOB := TBitacoraGOB.Create();
    BitacoraGOB.Fecha:= now();
    BitacoraGOB.IDAutorizacion:= Folio('IDAutorizacion','');
    BitacoraGOB.IDConsumoGuardadoGOB:=0;
    BitacoraGOB.RFID:= Referencia;
    BitacoraGOB.Saldo:= SALDOGOB;
    GuardaBitacoraGOB(BitacoraGOB);
    BitacoraGOB.Free;
 end;
 Result.SALDOGOB:= SALDOGOB;
end;

function TServiceFlotillas.AutorizaLimiteTemporal(Procesar: TProcesaTarjeta;
  Autoriza: TAutoriza): TProcesaTarjeta;
var
  spAutorizaImporteTemporal: IDADataSet;
  Fecha: DateTime;
begin
  Result:= TProcesaTarjeta.Create;
  Result.curFirma:= true;
  Result:= Procesar;
  
  Fecha:= now();
  spAutorizaImporteTemporal:= Schema.NewDataset(Connection, 'spAutorizaImporteTemporal');
  spAutorizaImporteTemporal.ParamByName('VehiculoID').AsInteger:= Autoriza.VehiculoID;
  spAutorizaImporteTemporal.Open;

  if (Fecha >= spAutorizaImporteTemporal.FieldByName('MES1').AsDateTime) and
     (Fecha <=  spAutorizaImporteTemporal.FieldByName('MES2').AsDateTime) and
     (spAutorizaImporteTemporal.FieldByName('MONTO').AsFloat > 0) then
  begin
     Result.LimiteMNTurno:= spAutorizaImporteTemporal.FieldByName('MONTO').AsFloat;
     Result.LimiteMNDia:= spAutorizaImporteTemporal.FieldByName('MONTO').AsFloat;
     Result.LimiteMNSemana:= spAutorizaImporteTemporal.FieldByName('MONTO').AsFloat;
     Result.LimiteMNMes:= spAutorizaImporteTemporal.FieldByName('MONTO').AsFloat;
     Result.LimiteLTTurno:= 0;
     Result.LimiteLTDia:= 0;
     Result.LimiteLTSemana:= 0;
     Result.LimiteLTMes:= 0;
  end;
end;

function TServiceFlotillas.AutorizaProcesaGOB(Procesar: TProcesaTarjeta;  Autoriza: TAutoriza): TProcesaTarjeta;
begin
  Result:= TProcesaTarjeta.Create;
  Result.curFirma:= true;
  Result:= Procesar;
  Result.curLunes:= '111111111111111111111111';
  Result.curMartes:= '111111111111111111111111';
  Result.curMiercoles:= '111111111111111111111111';
  Result.curJueves:= '111111111111111111111111';
  Result.curViernes:= '111111111111111111111111';
  Result.curSabado:= '111111111111111111111111';
  Result.curDomingo:= '111111111111111111111111';
  Result.LimiteLTTurno:= 0;
  Result.LimiteLTDia:= 0;
  Result.LimiteLTSemana:= 0;
  Result.LimiteLTMes:= 0;

  Result.LimiteMNTurno:= Result.curSaldo;
  Result.LimiteMNDia:= Result.curSaldo;
  Result.LimiteMNSemana:= Result.curSaldo;
  Result.LimiteMNMes:= Result.curSaldo;

  if Autoriza.Magna > 0 then
     Procesar.Magna:=Autoriza.Magna
  else
     Procesar.Magna:=PrecioProducto(1);
  if Autoriza.Premium > 0 then
     Procesar.Premium:=Autoriza.Premium
  else
     Procesar.Premium:=PrecioProducto(2);
  if Autoriza.Diesel > 0 then
     Procesar.Diesel:=Autoriza.Diesel
  else
     Procesar.Diesel:=PrecioProducto(3);

  Result.cliStatus:= 'A';
  Result.curStatus:= 'A';
  Result.curLitTarProceso:= 0;
  Result.curImpTarProceso:= 0;
  Result.cliImpProceso:=0;
  Result.cliVolProceso:=0;
  Result.curImpCliProceso:=0;
  Result.curLitCliProceso:=0;

  Result.PresetMN:= Autoriza.PresetMN;;
  Result.PresetLT:= Autoriza.PresetLT;;

  Result.cliLimiteCredito:= 99999999;
  Result.Despacho:= 999;
  Result.VolumenImporte:= 'I';
  Result.curProductoAutorizado:= '1234';
  Result.MaximoImporte:= 9999;
  Result.MaximoVolumen:= 999;
  Result.CargasMaximas:= 99;

  Result.IdentificadorID:= GasolineroID;
  Result.curFechaVencimiento:= now()+365;
end;

function TServiceFlotillas.AutorizaTarjeta(const Autoriza: TAutoriza): TTarjeta;
var
  DataSet: IDADataSet;
  ClienteID, VehiculoID, GasolineroID: Integer;
  Importe, Volumen: Double;
  Procesar : TProcesaTarjeta;
  msn:String;
  aBarras: String;

{pla_GOB}//-GOBIERNO DEL ESTADO------------------------------------------------}
  SALDOGOB: Double;
  AutGOB: TAutorizaGOB;
{pla_GOB}//--------------------------------------------------------------------}
begin
  Procesar :=  TProcesaTarjeta.Create();
  Result:=TTarjeta.Create;
  Result.Status:=ERR_SINCOMUNICACION;
  Result.Valido:= False;
  SALDOGOB:= 0;

  if Length(Autoriza.Referencia) <= 10 then
  begin
     ABarras:=IntToStr(ClaveToID(Autoriza.Referencia));
     Autoriza.Referencia:= ABarras;
  end;

  DataSet:= Schema.NewDataset(Connection, 'spBuscaReferencia');
  try

{pla_GOB}//--VALIDA GOBIERNO DEL ESTADO--BC-----------------------------------//
      if (copy(Autoriza.Referencia,1,1) <> '0') and (ServerDataModule.AUTORIZAGOB = 'S') then
      begin
         AutGOB:= TAutorizaGOB.Create();
         AutGOB.SALDOGOB:= 0; AutGOB.CLASIFICACION:=0;
         AutGOB.Assign(AutorizaGOB(Copy(Autoriza.Referencia, 1, 16)));

         if (AutGOB.REFERENCIAGOB =  '-1') OR
            (AutGOB.REFERENCIAGOB =  '-3') OR
            (AutGOB.REFERENCIAGOB =  '-12') OR
            (AutGOB.REFERENCIAGOB =  '-99') then
         Begin
            Result.Status:= strtoint(AutGOB.REFERENCIAGOB);
            Result.MsnError:= MensajeDeError(Result.Status);
            Exit;
         End;

         if (AutGOB.REFERENCIAGOB <>  '-2') AND (AutGOB.SALDOGOB > 0) then
         Begin
         Autoriza.Referencia:= Copy(Autoriza.Referencia, 1, 16);
         SALDOGOB:= AutGOB.SALDOGOB;
         DataSet.Close;
         DataSet.ParamByName('Referencia').AsString:= AutGOB.REFERENCIAGOB;
         DataSet.Open;
         End Else
         begin
         if AutGOB.SALDOGOB = 0 then
            Result.Status:= ERR_SINSALDO;
         if AutGOB.REFERENCIAGOB = '-2'  then
            Result.Status:= ERR_GOB_IDRFINEXISTENTE;
            Result.MsnError:= MensajeDeError(Result.Status);
            Exit;
         end;
      end;
{pla_GOB}//--VALIDA GOBIERNO DEL ESTADO--BC-----------------------------------//

  if Length(Autoriza.Referencia) > 16 then
  begin
     DataSet.Close;
     DataSet.ParamByName('Referencia').AsString:= Copy(Autoriza.Referencia,16+1,Length(Autoriza.Referencia));
     DataSet.Open;
  end else
  Begin
     DataSet.Close;
     DataSet.ParamByName('Referencia').AsString:= Autoriza.Referencia;
     DataSet.Open;
  End;

  if not DataSet.IsEmpty or (SALDOGOB > 0) then
  begin
      ClienteID   := DataSet.FieldByName('ClienteID').AsInteger;
      VehiculoID  := DataSet.FieldByName('VehiculoID').AsInteger;
      GasolineroID:= DataSet.FieldByName('GasolineroID').AsInteger;
      Autoriza.VehiculoID:= dataset.FieldByName('VehiculoID').AsInteger;

      if not (BuscaAutorizacionTajeta(ClienteID, VehiculoID, GasolineroID)) then
      begin
        DataSet:=Schema.NewDataset(Connection, 'ValidarTarAutorizaciones');
        //DataSet.ParamByName('Identificador').AsInteger:=TProcesaTarjeta(MiRef.Procesa).IdentificadorID;
        DataSet.ParamByName('ClienteID').AsInteger:=ClienteID;
        DataSet.ParamByName('TarjetaID').AsInteger:=VehiculoID;
        DataSet.Open;

        if not DataSet.IsEmpty then
        begin
          msn:= 'Paso ValidarAutorizaciones';
          Procesar.curLitTarProceso:=DataSet.FieldByName('Volumen').AsFloat;
          Procesar.curImpTarProceso:=DataSet.FieldByName('Importe').AsFloat;
        end;
        DataSet.Close;

        DataSet:=Schema.NewDataset(Connection, 'ValidarTarSaldoEjercicio');
        //DataSet.ParamByName('Identificador').AsInteger:=Procesar.IdentificadorID;
        DataSet.ParamByName('ClienteIni').AsInteger:=ClienteID;
        DataSet.ParamByName('ClienteFin').AsInteger:=ClienteID;
        DataSet.Open;

        if not DataSet.IsEmpty or (SaldoGOB > 0) then
        begin
          msn:= 'Paso ValidarSaldoEjercicio';
          Procesar.curSaldo:=DataSet.FieldByName('Saldo').AsCurrency;

{pla-GOB} if (ServerDataModule.AUTORIZAGOB ='S') and (SALDOGOB > 0) Then
          begin
              Procesar.curSaldo:= FloatToCurr(SALDOGOB);
          end;
{pla-GOB}

          Procesar.curCargos:=0;
          Procesar.curAbonos:=0;
        end;
        DataSet.Close;

        DataSet:=Schema.NewDataset(Connection, 'ValidarCliAutorizaciones');
        DataSet.ParamByName('Identificador').AsInteger:=GasolineroID;
        DataSet.ParamByName('ClienteID').AsInteger:=ClienteID;
        DataSet.Open;

        if not DataSet.IsEmpty then
        begin
          msn:= 'Paso Validar CliAutorizaciones';
          Result.RFC:= DataSet.FieldByName('RFC').AsString;
          Procesar.cliNombre:=DataSet.FieldByName('Nombre').AsString;
          Procesar.cliStatus:=DataSet.FieldByName('Estatus').AsString;
          Procesar.cliFormaCompra:=DataSet.FieldByName('FormaCompraID').AsInteger;
          Procesar.cliCuentaContable:=DataSet.FieldByName('CuentaContable').AsString;
          Procesar.cliLimiteCredito:=DataSet.FieldByName('LimiteCredito').AsFloat;
          Procesar.cliImpProceso:=DataSet.FieldByName('Importe').AsFloat;
          Procesar.cliVolProceso:=DataSet.FieldByName('Volumen').AsFloat;
          Procesar.curTipoTarjeta:=DataSet.FieldByName('NombreFormaCompra').AsString;
          Procesar.cliFormaCompra := DataSet.FieldByName('FormaCompraID').AsInteger;
        end;
        DataSet.Close;

        DataSet:=Schema.NewDataset(Connection, 'SaldoTarjeta');
        DataSet.ParamByName('Identificador').AsInteger:=GasolineroID;
        DataSet.ParamByName('ClienteID').AsInteger:=ClienteID;
        DataSet.ParamByName('TarjetaID').AsInteger:=VehiculoID;
        DataSet.Open;

        if not DataSet.IsEmpty then
        begin
          msn:= 'Paso SaldoTarjeta';
          Procesar.DigitoSeguridad:=Autoriza.DigitoSeguridad;
          if Autoriza.Magna > 0 then
            Procesar.Magna:=Autoriza.Magna
          else
            Procesar.Magna:=PrecioProducto(1);
          if Autoriza.Premium > 0 then
            Procesar.Premium:=Autoriza.Premium
          else
            Procesar.Premium:=PrecioProducto(2);
          if Autoriza.Diesel > 0 then
            Procesar.Diesel:=Autoriza.Diesel
          else
            Procesar.Diesel:=PrecioProducto(3);
          procesar.PresetMN:=Autoriza.PresetMN;
          Procesar.PresetLT:=Autoriza.PresetLT;
          Procesar.SeleccionDeProducto:=Autoriza.SeleccionDeProducto;
          Procesar.curStatus:=DataSet.FieldByName('Estatus').AsString;
          Procesar.curNIP:=DataSet.FieldByName('NIP').AsString;
          Procesar.curClasificacion:=DataSet.FieldByName('Clasificacion').AsInteger;
          Procesar.curFechaVencimiento:=DataSet.FieldByName('FechaExpira').AsDateTime;
          Procesar.curNombre:=DataSet.FieldByName('Nombre').AsString;
          Procesar.curCentroCosto:=DataSet.FieldByName('CentroCostos').AsString;
          Procesar.curIdentificacion:=DataSet.FieldByName('Identificacion').AsString;
          Procesar.curNoEconomico:=DataSet.FieldByName('NumeroEconomico').AsString;
          Procesar.curDepartamento:=DataSet.FieldByName('Departamento').AsString;
          Procesar.curProductoAutorizado:=DataSet.FieldByName('ProductoAutorizado').AsString;
          Procesar.curOdometro:=DataSet.FieldByName('Odometro').AsBoolean;
          Procesar.curFirma:=DataSet.FieldByName('Firma').AsBoolean;
          Procesar.curPlacas:=DataSet.FieldByName('Placas').AsBoolean;
          Procesar.curLunes:=DataSet.FieldByName('Lunes').AsString;
          Procesar.curMartes:=DataSet.FieldByName('Martes').AsString;
          Procesar.curMiercoles:=DataSet.FieldByName('Miercoles').AsString;
          Procesar.curJueves:=DataSet.FieldByName('Jueves').AsString;
          Procesar.curViernes:=DataSet.FieldByName('Viernes').AsString;
          Procesar.curSabado:=DataSet.FieldByName('Sabado').AsString;
          Procesar.curDomingo:=DataSet.FieldByName('Domingo').AsString;
          Procesar.Mensaje:=DataSet.FieldByName('Mensaje').AsString;
          Procesar.curDigitoSeguridad:=DataSet.FieldByName('DigitoSeguridad').AsInteger;
          Procesar.LimiteLTTurno:=DataSet.FieldByName('LimiteLTTurno').AsFloat;
          Procesar.LimiteLTDia:=DataSet.FieldByName('LimiteLTDia').AsFloat;
          Procesar.LimiteLTSemana:=DataSet.FieldByName('LimiteLTSemana').AsFloat;
          Procesar.LimiteLTMes:=DataSet.FieldByName('LimiteLTMes').AsFloat;
          Procesar.LimiteMNTurno:=DataSet.FieldByName('LimiteMNTurno').AsFloat;
          Procesar.LimiteMNDia:=DataSet.FieldByName('LimiteMNDia').AsFloat;
          Procesar.LimiteMNSemana:=DataSet.FieldByName('LimiteMNSemana').AsFloat;
          Procesar.LimiteMNMes:=DataSet.FieldByName('LimiteMNMes').AsFloat;
          Procesar.CargasMaximas:=DataSet.FieldByName('CargasMaximas').AsInteger;

          Procesar.ActualLTTurno:=DataSet.FieldByName('ActualLTTurno').AsFloat;
          Procesar.ActualLTDia:=DataSet.FieldByName('ActualLTDia').AsFloat;
          Procesar.ActualLTSemana:=DataSet.FieldByName('ActualLTSemana').AsFloat;
          Procesar.ActualLTMes:=DataSet.FieldByName('ActualLTMes').AsFloat;
          Procesar.ActualMNTurno:=DataSet.FieldByName('ActualMNTurno').AsFloat;
          Procesar.ActualMNDia:=DataSet.FieldByName('ActualMNDia').AsFloat;
          Procesar.ActualMNSemana:=DataSet.FieldByName('ActualMNSemana').AsFloat;
          Procesar.ActualMNMes:=DataSet.FieldByName('ActualMNMes').AsFloat;
          Procesar.ActualCargas:=DataSet.FieldByName('ActualCargas').AsInteger;
          Procesar.NIP:=Autoriza.NIP;
          Procesar.Odometro:=Autoriza.Odometro;
          Procesar.MaximoVolumen:= 900;
          Procesar.MaximoImporte:= 9000;
        end
        else
          Result.Status:=ERR_DIGITOSEGURIDADINCORRECTO;
        DataSet.Close;
        
        //gobierno procesa//
        if SaldoGOB > 0 then
        begin
           Procesar.curClasificacion:= AutGOB.CLASIFICACION;
           Procesar:= AutorizaProcesaGOB(Procesar, Autoriza);
        end;
        ///////////////////

        //VALIDACION DE AUTORIZACION TEMPORAL//
        Procesar:= AutorizaLimiteTemporal(Procesar, Autoriza);
        ///////////////////////////////////////


        Result.Status:=Procesar.Procesar;

        if (Result.Status = ERR_OK) then
        begin
          Autoriza.ImporteCantidad:=Procesar.VolumenImporte;
          Autoriza.ClienteID:=ClienteID;
          Autoriza.VehiculoID:=VehiculoID;
          Autoriza.GasolineroID:=GasolineroID;
          Autoriza.Fecha:=Now;
          if Procesar.VolumenImporte = 'I' then
          begin
            Importe:=Procesar.Despacho;
            Volumen:=Importe / Procesar.PrecioAlto;
          end
          else
          begin
            Volumen:=Procesar.Despacho;
            Importe:=Volumen * Procesar.PrecioAlto;
          end;
          Autoriza.Importe:=Importe;
          Autoriza.Cantidad:=Volumen;
          Autoriza.AutorizacionID:=Folio('AutorizacionID', '');
          Autoriza.Tipo:= 1;
          GuardaAutorizacion(Autoriza);

          Result.Cantidad:=Procesar.Despacho;
          Result.Clasificacion:=IntToStr(Procesar.curClasificacion);
          Result.LitrosImporte:=Procesar.VolumenImporte;
          Result.GasolineroID:=GasolineroID;
          Result.VehiculoID:=VehiculoID;
          Result.ClienteID:=ClienteID;
          Result.Identificacion:= Procesar.curIdentificacion;

          Result.Saldo:= Procesar.curSaldo;
          {GOB----}
          Result.Mensaje:= Procesar.curMensaje;
          Result.CentroCostos:= Procesar.curCentroCosto;
          Result.Valido:= True;
          Result.Nombre:= Procesar.curNombre;
          Result.RazonSocial:= Procesar.cliNombre;
          Result.Productos:=Procesar.curProductoAutorizado;
          {Result.FormaCompraID := Procesar.cliFormaCompra;
          Result.NombreFormaCompra := Procesar.curTipoTarjeta}
        end
        else
        begin
          {if Result.Status <> ERR_OK then
            Result:=MiRef.Armar('')
          else
            Result:=MiRef.Armar(MiRef.Procesa.Mensaje + '0|');}
        end;
      end
      else
        Result.Status:= ERR_SALDORETENIDO;
      Result.MsnError:= MensajeDeError(Result.Status);
      Result.Status:=Autoriza.AutorizacionID;
  end
  else
  begin
    if Result.Status =  ERR_GOB_IDRFINEXISTENTE then
       Result.MsnError:= MensajeDeError(Result.Status);

    Result.Status:= ERR_TARJETANOACTIVA;

    if Result.MsnError <> '' then
       Result.MsnError:=  Result.MsnError + #10#13 + MensajeDeError(Result.Status)
    else
       Result.MsnError:= MensajeDeError(Result.Status);
  end;
  except
    on E : Exception do
       ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
  end;

  //HTTPRIO.Free;
end;

function TServiceFlotillas.Bancaria(const Terminal: string; const Supervisor: string;
      const BombaID: Integer; const EstacionID: Integer; const Track1: string;
      const Track2: string; const Importe: Double; const Ticket: Integer;
      const Serie: string; const Comision: Double;
      const BancariaTipoID, CajaID: Integer): TBancaria;
var
  HTTP: TIdHTTP;
  Aux, Params: TStringList;
  ds, ds2: IDADataset;
  cmd: IDASQLCommand;
  I, MiFolio: Integer;
  TxID, OperType, CardType, Banco: String;
begin
  Result:=TBancaria.Create;
  Result.Aprobada:=False;
  Result.Comision:=Comision;
  Result.Mensaje:='ERROR AL PROCESAR LA TARJETA';
  if Length(Track2) >= 16 then
  begin
    if Pos(';', Track2) > 0 then
      Result.Tarjeta:=Copy(Track2, Pos(';', Track2) + 1, 16)
    else
      Result.Tarjeta:=Copy(Track2, 1, 16);
  end
  else
    Result.Tarjeta:=Copy(Track1, 2, 16);
  I:=Pos('^', Track1);
  if I > 0 then
  begin
    Result.NombreCliente:=Copy(Track1, I+1, Length(Track1) - I);
    I:=Pos('^', Result.NombreCliente);
    if I > 0 then
      Result.NombreCliente:=Trim(Copy(Result.NombreCliente, 1, I-1));
  end;
  ds:=Schema.NewDataset(Connection, 'spBuscaBancaria');
  ds.ParamByName('EstacionID').AsInteger:=EstacionID;
  ds.ParamByName('Ticket').AsInteger:=Ticket;
  ds.ParamByName('Serie').AsString:=Serie;
  ds.Open;
  ds2:=Schema.NewDataset(Connection, 'spBuscaBancariaFecha');
  ds2.ParamByName('Tarjeta').AsString:=Result.Tarjeta;
  ds2.ParamByName('Fecha').AsDateTime:=Trunc(Now);
  ds2.ParamByName('Serie').AsString:=Serie;
  ds2.Open;
  MiFolio:=Folio('BancariaID', '');
  if ValidaTarjeta(Result.Tarjeta) then
  begin
    if ds2.FieldByName('Total').AsInteger <= 0 then
    begin
      TxID:=FormatDateTime('yymmdd', Now);
      Result.Mensaje:=FormatDateTime('hhnnss', Now);
      Result.Aprobada:=True;
    end
    else
      Result.Mensaje:='ERROR LA TARJETA YA FUE UTILIZADA ESTE DIA';
  end
  else
  begin
    if ds2.FieldByName('Total').AsInteger <= 0 then
    begin
      if not ds.FieldByName('Aprobada').AsBoolean then
      begin
        Params := TStringList.Create;
        HTTP:=TIdHTTP.Create;
        try
          HTTP.Request.ContentType := 'application/x-www-form-urlencoded';
          Params.Values['id_store']:=LeerRegistro('BA_id_store', '');
          Params.Values['amount']:=FormatFloat('#,#0.00', Importe + Comision);
          Params.Values['tip']:='0';
          Params.Values['total']:=FormatFloat('#,#0.00', Importe + Comision);
          Params.Values['Id_transaction']:=IntToStr(MiFolio);
          Params.Values['track2']:=Track2;
          Params.Values['track1']:=Track1;
          Params.Values['serial']:='001-001-' + FormatFloat('000', CajaID);
          Params.Values['ptid']:=FormatFloat('00000000', CajaID);
          Params.Values['operation_type']:='1';
          try
            HTTP.Post('http://edomexpos.puntoclave.com.mx/credit_debit/send_data_gateway.asp', Params);
            if POS('APROBADA', HTTP.Response.RawHeaders.Values['response_message']) > 0 then
            begin
              TxID:=HTTP.Response.RawHeaders.Values['id_tx'];
              CardType:=HTTP.Response.RawHeaders.Values['CardType'];
              OperType:=HTTP.Response.RawHeaders.Values['OperType'];
              Banco:=HTTP.Response.RawHeaders.Values['IssuingBank'];
              Result.Mensaje:=HTTP.Response.RawHeaders.Values['authorization_number'];
              Result.Aprobada:=True;
              Result.ID:=MiFolio;
              Result.Autorizacion:=HTTP.Response.RawHeaders.Values['authorization_number'];
              Aux:=TStringList.Create;
              Aux.Text:=HTTP.Response.RawHeaders.Text;
              Aux.SaveToFile('bancaria.log');
              Aux.Free;
            end
            else
              Result.Mensaje:='ERROR ' + HTTP.Response.RawHeaders.Values['response_message'];
          except
            on E: Exception do
              Result.Mensaje:='ERROR ' + E.Message;
          end;
        finally
         Params.Free;
         HTTP.Free;
        end;
      end
      else
      begin
        Result.Mensaje:=ds.FieldByName('Resultado').AsString;
        Result.Aprobada:=True;
        Exit;
      end;
    end
    else
      Result.Mensaje:='ERROR LA TARJETA YA FUE UTILIZADA ESTE DIA';
  end;
  cmd:=Schema.NewCommand(Connection, 'Insert_dbo Bancaria');
  cmd.ParamByName('BancariaID').AsInteger:=MiFolio;
  cmd.ParamByName('Terminal').AsString:=Terminal;
  cmd.ParamByName('Fecha').AsDateTime:=Now;
  cmd.ParamByName('Importe').AsFloat:=Importe;
  cmd.ParamByName('Comision').AsFloat:=Comision;
  cmd.ParamByName('Supervisor').AsString:=Supervisor;
  cmd.ParamByName('Track1').AsString:=Track1;
  cmd.ParamByName('Track2').AsString:=Track2;
  cmd.ParamByName('Resultado').AsString:=Result.Mensaje;
  cmd.ParamByName('Tarjeta').AsString:=Result.Tarjeta;
  cmd.ParamByName('BombaID').AsInteger:=BombaID;
  cmd.ParamByName('EstacionID').AsInteger:=EstacionID;
  cmd.ParamByName('Ticket').AsInteger:=Ticket;
  cmd.ParamByName('Serie').AsString:=Serie;
  cmd.ParamByName('Aprobada').AsBoolean:=Result.Aprobada;
  cmd.ParamByName('TxID').AsString:=TxID;
  cmd.ParamByName('Type').AsString:=OperType;
  cmd.ParamByName('CardType').AsString:=CardType;
  cmd.ParamByName('BancoEmisor').AsString:=Banco;
  cmd.ParamByName('GrupoCaja').AsInteger:=1;
  cmd.ParamByName('TipoBancariaID').AsInteger:=BancariaTipoID;
  cmd.Execute;
  ds.Close;
end;

function TServiceFlotillas.BuscaAutorizacion(const Referencia: String): Boolean;
var
  DataSet: IDADataset;
begin
  Result:= False;
  DataSet := Schema.NewDataset(Connection,'spBuscaAutorizacion');
  DataSet.ParamByName('Barras').AsString:= Referencia;
  DataSet.Open;

  if not DataSet.IsEmpty then
     Result:= True;
end;

function TServiceFlotillas.BuscaAutorizacionTajeta(const ClienteID, VehiculoID,
  GasolineroID: Integer): Boolean;
var
  DataSet: IDADataset;
begin
  Result:= False;
  DataSet := Schema.NewDataset(Connection,'spBuscaAutorizacionTarjeta');
  DataSet.ParamByName('ClienteID').AsInteger:= ClienteID;
  DataSet.ParamByName('VehiculoID').AsInteger:= VehiculoID;
  DataSet.ParamByName('GasolineroID').AsInteger:= GasolineroID;
  DataSet.Open;

  if not DataSet.IsEmpty then
     Result:= True;

end;

function TServiceFlotillas.BuscaClientexVehiculo(
  const VehiculoID: Integer): Integer;
var
  S: String;
  ds: IDADataset;
begin
  Result:=0;
  try
    S:= Format('Select ClienteID from Vehiculo where VehiculoID = %d', [VehiculoID]);
    ds:=Connection.NewDataset(S, 'BuscaClientexVehiculo');
    ds.Open;
    Result:=ds.FieldByName('ClienteID').AsInteger;
    ds.Close;
  except
  end;
end;

function TServiceFlotillas.BuscarReporte(const Nombre: String): TReporteF;
var
  MiDataSet: IDADataSet;
begin
  Result:=nil;
  MiDataSet:=Schema.NewDataset(Connection, 'BuscarReporte');
  MiDataSet.ParamByName('Nombre').AsString:=UpperCase(Nombre);
  MiDataSet.Open;
  if not MiDataSet.IsEmpty then
  begin
    Result:=TReporteF.Create;
    Result.SQL1:=MiDataSet.FieldByName('SQL1').AsString;
    Result.SQL2:=MiDataSet.FieldByName('SQL2').AsString;
    Result.Template:=MiDataSet.FieldByName('Template').AsString;
    Result.CampoJoin:=MiDataSet.FieldByName('CampoJoin').AsString;
  end;
  MiDataSet.Close;
end;

function TServiceFlotillas.BuscaTicketsFactura(FacturaID: Integer): String;
var
  ds: IDADataset;
  Tickets: String;
begin
  Result := '';
  Tickets := '';
  try
    ds := Schema.NewDataset(Connection, 'spBuscaTicketFactura');
    ds.ParamByName('FacturaID').AsInteger := FacturaID;
    ds.Open;

    while not ds.EOF do
    begin
      Tickets := Tickets + ds.FieldByName('SecuenciaVenta').AsString;
      ds.Next;

      if not ds.EOF then Tickets := Tickets + ',';
    end;
  finally
    ds.Close;
  end;
  Result := Tickets
end;

function TServiceFlotillas.CadenaOriginal(const FacturaID,
  GasolineroID: Integer): TDataFacturaElectronicaF;
var
  CDOR: WideString;
  ind, idx: integer;

  FCTELECT: TFCTELECT;
  Certificado: TFECertificado;
  TIPO: TTipoDigestionOpenSSL;
  ds1: IDADataSet;
begin
  TIPO:= tdSHA1;
  ds1:=Schema.NewDataset(Connection, 'spDatosCertificado');
  //ds1.ParamByName('GasolineroID').AsInteger:= GasolineroID;
  ds1.Open;

  Result:= TDataFacturaElectronicaF.Create();
  Result.FacturaElectronicaF.Assign(DatosFacturaElectronica(FacturaID,GASOLINEROID));
  if COPY(Result.FacturaElectronicaF.Fecha,1,4) = '2011' then TIPO:= tdSHA1;
  if COPY(Result.FacturaElectronicaF.Fecha,1,4) = '2010' then TIPO:= tdMD5;

  if Result.FacturaElectronicaF.FacturaElectronicaDetalleImportes.Count > 0 then
  begin
  //--CADENA ORIGINAL--//
  with Result.FacturaElectronicaF do begin
  CDOR:= '||2.0|'+Serie+'|'+Folio+'|'+
         Fecha+'|'+noAprobacion+'|'+
         anoAprobacion+'|'+'ingreso'+'|'+'pago en una sola exhibicion'+'|'+
         SubTotal+'|'+Total+'|'+RFCEmisor+'|'+
         NomEmpEmisor+'|'+DireccionEm+'|'+
         NoExteriorEM+'|'+ColoniaEmisor+'|'+
         MunicipioEmisor+'|'+EstadoEmisor+'|'+
         PaisEmisor+'|'+CodigoPostalEmisor+'|'+
         RFCReceptor+'|'+NombreReceptor+'|'+
         DomicilioReceptor+'|'+NoExteriorReceptor+'|'+
         ColoniaReceptor+'|'+LocalidadReceptor+'|'+
         MunicipioReceptor+'|'+EstadoReceptor+'|'+
         PaisReceptor+'|'+CodigoPostalReceptor+'|';
         for ind:=0 to FacturaElectronicaDetalleImportes.Count - 1 do
         begin
             CDOR:= CDOR + FacturaElectronicaDetalleImportes.Items[ind].CantidadReceptor+'|'+
                    FacturaElectronicaDetalleImportes.Items[ind].UnidadReceptor+'|'+
                    FacturaElectronicaDetalleImportes.Items[ind].DescripcionReceptor+'|'+
                    FacturaElectronicaDetalleImportes.Items[ind].ValorUnitarioReceptor+'|'+
                    FacturaElectronicaDetalleImportes.Items[ind].ImporteReceptor+'|';
         end;
         for ind:=0 to FacturaElectronicaDetalleImpuestos.Count - 1 do
         begin
             CDOR:= CDOR + FacturaElectronicaDetalleImpuestos[ind].ImpuestoReceptor+'|'+
                    FacturaElectronicaDetalleImpuestos[ind].TasaReceptor+'|'+
                    FacturaElectronicaDetalleImpuestos[ind].ImporteImpReceptor+'|';
         end;
  CDOR:= CDOR + TotalImpuesto+'|';
  end;
  if ServerDataModule.MONEDERO = 'S' then
  begin
  Result.MonederoElectronico.Assign(DatosMonedero(FacturaID,GASOLINEROID));
         with Result.MonederoElectronico do begin
         if conceptoEstadodeCuentaCombustible.Count > 0 then
         begin
            CDOR:= CDOR + tipoOperacion+'|'+NumerodeCuenta+'|'+
                   SubTotal+'|'+Total+'|';

            for ind:=0 to conceptoEstadodeCuentaCombustible.Count - 1 do
            begin
            with conceptoEstadodeCuentaCombustible.Items[ind] do
            CDOR:= CDOR + identificacion+'|'+fecha+'|'+rfc+'|'+claveEstacion+'|'+cantidad+'|'+
                   nombreCombustible+'|'+folioOperacion+'|'+valorUnitario+'|'+importe+'|';

            for idx:= 0 to conceptoEstadodeCuentaCombustible.Items[ind].detalleimpuesto.Count - 1 do
            with conceptoEstadodeCuentaCombustible.Items[ind].detalleimpuesto.Items[idx] do
            CDOR:= CDOR + impuesto+'|'+tasa+'|'+importeimpuesto+'|';
            end;
         end;
         end;
  end;
  CDOR:= CDOR +'|';

  while AnsiPos('  ',CDOR)>0 do
        delete(CDOR,AnsiPos('  ',CDOR),1);
  while AnsiPOS('| |',CDOR)> 0 do
        delete(CDOR,AnsiPos('| |',CDOR)+1,1);

  Result.CadenaOriginal:= Trim(CDOR);

  Certificado.Ruta:= ds1.FieldByName('ArchivoCertificado').AsString;
  FCTELECT:= TFCTELECT.Create(ds1.FieldByName('ArchivoClavePrivada').AsString,
                              ds1.FieldByName('PasswordFCTELECT').AsString,
                              Result.CadenaOriginal,
                              TIPO,
                              Certificado);

  Result.SelloDigital:= FCTELECT.SelloDigital;
  Result.Certificado:= FCTELECT.CertificadoTexto;
  Result.NumCertificado:= FCTELECT.CertificadoSerial;
  end;
end;

procedure TServiceFlotillas.CalculaIEPS(var Datos: TDatosFactura);
var
  Aux, Impuesto: Double;
  SubTotal: Double;
  I: Integer;
  PrecioNeto: Double;
begin
  SubTotal:=0;
  for I := 0 to Datos.DetalleFactura.Count - 1 do
  begin
    Impuesto:=IEPS(Datos.DetalleFactura[I].ProductoID);
    PrecioNeto:= Datos.DetalleFactura[I].Precio;
    Aux:=Datos.DetalleFactura[I].Precio - Impuesto;
    Aux:=Aux / (1 + (Datos.Factura.IVA / 100));
    Aux:=Aux + Impuesto;
    Aux:=Decimales(Aux, 6);
    Datos.DetalleFactura[I].Precio:=Aux;
    Datos.DetalleFactura[I].Cantidad:=  Decimales((Datos.DetalleFactura[I].Importe / PrecioNeto),6);
    Datos.DetalleFactura[I].Cantidad:=Decimales(Datos.DetalleFactura[I].Cantidad, 4);
    Datos.DetalleFactura[I].Importe:=Decimales(Aux * Datos.DetalleFactura[I].Cantidad, 2);
    SubTotal:=SubTotal + Datos.DetalleFactura[I].Importe;
  end;
  Datos.Factura.Total:=Decimales(Datos.Factura.Total, 2);
  Datos.Factura.Subtotal:=Decimales(SubTotal, 2);
  Datos.Factura.Impuesto:=Decimales(Datos.Factura.Total - SubTotal, 2);
end;

function TServiceFlotillas.CambiaClienteConsumo(const EstacionID,
  Ticket: Integer; const Serie: string; const ClienteID,
  VehiculoID: Integer): Boolean;
var
  cmd: IDASQLCommand;
begin
  Result:=True;
  cmd:=Schema.NewCommand(Connection, 'spCambiaClienteConsumo');
  cmd.ParamByName('EstacionID').AsInteger:=EstacionID;
  cmd.ParamByName('SecuenciaVenta').AsInteger:=Ticket;
  cmd.ParamByName('Serie').AsString:=Serie;
  cmd.ParamByName('ClienteID').AsInteger:=ClienteID;
  cmd.ParamByName('VehiculoID').AsInteger:=VehiculoID;
  cmd.Execute;
end;

function TServiceFlotillas.CambiaNIP(const Referencia: string;
  const NIP: Integer): Boolean;
var
  cmd: IDASQLCommand;
begin
  Result:=False;
  try
    cmd:=Schema.NewCommand(Connection, 'spCambiaNIP');
    cmd.ParamByName('Referencia').AsString:=Referencia;
    cmd.ParamByName('NIP').AsInteger:=NIP;
    cmd.Execute;
    Result:=True;
  except
  end;
end;

function TServiceFlotillas.CambioFactura(const Serie: String;
  const Folio: Integer; const NevaSerie: String; const NuevoFolio: Integer;
  const FechaImpresion: DateTime):String;
var
  cmd : IDASQLCommand;
begin
  if (DatosFactura(NuevoFolio,NevaSerie)) then
  begin
      cmd := Schema.NewCommand(Connection, 'spCambioNumeroFactura');
      cmd.ParamByName('Serie').AsString := Serie;
      cmd.ParamByName('Folio').AsInteger:= Folio;
      cmd.ParamByName('NuevaSerie').AsString:=NevaSerie;
      cmd.ParamByName('NuevoFolio').AsInteger:=NuevoFolio;
      cmd.ParamByName('FechaImpresion').AsDateTime:=FechaImpresion;
      cmd.Execute;
      Result := 'Cambio de Folio a Factura Exitoso';
  end Else Result := 'La factura ya existe';
end;

function TServiceFlotillas.CancelaGrupo(const Grupo: Integer): Boolean;
var
  cmd: IDASQLCommand;
begin
  try
    cmd:=Schema.NewCommand(Connection, 'spCancelaGrupo');
    cmd.ParamByName('Grupo').AsInteger:=Grupo;
    cmd.Execute;
    Result:=True;
  finally
  end;
end;

function TServiceFlotillas.CancelarCupones(const Lista: String; const UsuarioID: Integer): String;
var
  Aux: TStrings;
  I: Integer;
  cmd: IDASQLCommand;
  Fecha: TDateTime;
begin
  Fecha:=Now;
  Aux:=TStringList.Create;
  cmd:=Schema.NewCommand(Connection, 'UPDCancelaCupon');
  Result:='Error al cancelar los cupones.';
  try
    Aux.Text:=Lista;
    for I := 0 to Aux.Count - 1 do
    begin
      cmd.ParamByName('Codigo').AsString:=Aux[I];
      cmd.ParamByName('Fecha').AsDateTime:=Fecha;
      cmd.ParamByName('UsuarioID').AsInteger:=UsuarioID;
      cmd.Execute;
    end;
    Result:='Los cupones fueron cancelados correctamente.';
  finally
    Aux.Free;
  end;
end;

function TServiceFlotillas.CancelarLote(const LoteID, UsuarioID: Integer): String;
var
  ds: IDADataset;
begin
  ds:=Schema.NewDataset(Connection, 'spCancelaLote');
  ds.ParamByName('LoteID').AsInteger:=LoteID;
  ds.ParamByName('UsuarioID').AsInteger:=UsuarioID;
  ds.Open;
  Result:=ds.FieldByName('Resultado').AsString;
end;

function TServiceFlotillas.CaracteresCupon: String;
var
  Aux: TStrings;
  I: Integer;
begin
  Result:='';
  Aux:=TStringList.Create;
  try
    for I := 1 to 5 do
      Aux.Add(CaracteresCupones[I]);
    Result:=Aux.Text;
  finally
    Aux.Free;
  end;
end;

function TServiceFlotillas.CashBack(const EstacionID, BombaID: Integer;
  const Terminal, Track1, Track2: string; const Importe: Double;
  const LLave: string; const CajaID: Integer): TBancaria;
var
  Aux: Integer;
  Consumo: TConsumo;
  Fecha: TDateTime;
begin
  Result:=TBancaria.Create;
  Consumo:=TConsumo.Create;
  try
    Fecha:=Now;
    Aux:=Folio('CashBackID', '');
    Result.Assign(Bancaria(Terminal, LLave, BombaID, EstacionID, Track1, Track2, Importe, Aux, 'CASHB', ServerDataModule.ComisionCashBack, 2, CajaID));
    Result.ID:=Aux;
    if Result.Aprobada then
    begin
      Consumo.SecuenciaVenta:=Result.ID;
      Consumo.Serie:='CASHB';
      Consumo.EstacionID:=EstacionID;
      Consumo.FechaMovimiento:=Trunc(Fecha);
      Consumo.FechaCarga:=Fecha;
      Consumo.Ejercicio:=StrToInt(FormatDateTime('yyyy', Fecha));
      Consumo.Periodo:=StrToInt(FormatDateTime('m', Fecha));
      Consumo.Dia:=StrToInt(FormatDateTime('d', Fecha));
      Consumo.Turno:=0;
      Consumo.Kilometraje:=0;
      Consumo.Referencia:=Result.Tarjeta;
      Consumo.Tarjeta:=Result.Tarjeta;
      Consumo.PosicionCarga:=BombaID;
      Consumo.Cantidad:=Importe;
      Consumo.Precio:=1;
      Consumo.Importe:=Importe;
      Consumo.ImpuestoPorcentaje:=IVAEstacion(EstacionID);
      Consumo.ImpuestoImporte:=Impuesto(Importe, Consumo.ImpuestoPorcentaje);
      Consumo.CuentaContable:='';
      Consumo.ManualAutomatico:='A';
      Consumo.Facturado:=0;
      Consumo.EnIngresos:=0;
      Consumo.Auditado:=0;
      Consumo.FacturaID:=0;
      Consumo.ProductoID:=1000;
      Consumo.GasolineroID:=GasolineroID;
      Consumo.ClienteID:=1;
      Consumo.VehiculoID:=0;
      Consumo.IEPS:=0;
      GuardarConsumo(Consumo);
    end;
  finally
    Consumo.Free;
  end;
end;

function TServiceFlotillas.CierrePeriodo(const Periodo,
  Ejercicio: Integer;  const UsuarioID: Integer): Boolean;
var
  Movimiento: TMovimiento;
  MiDataSet, MiDataSet2: IDADataSet;
  cmd : IDASQLCommand;
begin
  Result:= False;

  MiDataSet:=Schema.NewDataset(Connection, 'dbo Cliente');
  MiDataSet2:= Schema.NewDataset(Connection, 'CargoCierreCliente');
  cmd := Schema.NewCommand(Connection, 'spActualizaConsumo');
  MiDataSet.Open;

  While not MiDataSet.EOF do
  begin
    MiDataSet2.ParamByName('ClienteID').AsInteger:= MiDataSet.FieldByName('ClienteID').AsInteger;
    MiDataSet2.ParamByName('Periodo').AsInteger:= Periodo;
    MiDataSet2.ParamByName('Ejercicio').AsInteger:= Ejercicio;
    MiDataSet2.Open;

    Movimiento:= TMovimiento.Create();
    Movimiento.MovimientoID := Folio('MovimientoID', '');
    Movimiento.FechaMovimiento:= trunc(Now);
    Movimiento.FechaVencimiento:= trunc(Now);
    Movimiento.Referencia:= 'CIERRE DE PERIODO ' + inttostr(Periodo) + ' EJERCICIO ' + inttostr(Ejercicio);
    Movimiento.Ejercicio:= Ejercicio;
    Movimiento.Periodo:= Periodo;
    Movimiento.CargoAbono:= 'C';
    Movimiento.Cargo:= MiDataSet2.FieldByName('Importe').AsCurrency;
    Movimiento.Abono:= 0;
    Movimiento.FechaRegistro:= trunc(now);
    Movimiento.Origen:= 'AUTO';
    Movimiento.AfectaSaldos:= False;
    Movimiento.TipoMovimiento:= 'CRR';
    Movimiento.ClienteID:= MiDataset.FieldByName('ClienteID').AsInteger;
    Movimiento.UsuarioID:= UsuarioID;
    MiDataSet2.Close;
    if Movimiento.Cargo > 0 then
       if  AfectarMovimientos(Movimiento) then begin Result:= True;
           cmd.ParamByName('ClienteID').AsInteger:= Movimiento.ClienteID;
           cmd.ParamByName('Periodo').AsInteger:= Periodo;
           cmd.ParamByName('Ejercicio').AsInteger:= Ejercicio;
           cmd.Execute;
       end;                
    MiDataSet.Next
  end;
end;

function TServiceFlotillas.Clasificacion: Integer;
begin
  Result:=ServerDataModule.Clasificacion;
end;

procedure TServiceFlotillas.ClasificacionCliente(const ClienteID,
  Clasificacion: Integer);
var
  cmd: IDASQLCommand;
begin
  cmd:=Schema.NewCommand(Connection, 'spClasificacionCliente');
  cmd.ParamByName('ClienteID').AsInteger:=ClienteID;
  cmd.ParamByName('Clasificacion').AsInteger:=Clasificacion;
  cmd.Execute;
end;

procedure TServiceFlotillas.ClasificacionVehiculo(const VehiculoID,
  Clasificacion: Integer);
var
  cmd: IDASQLCommand;
begin
  cmd:=Schema.NewCommand(Connection, 'spClasificacionVehiculo');
  cmd.ParamByName('VehiculoID').AsInteger:=VehiculoID;
  cmd.ParamByName('Clasificacion').AsInteger:=Clasificacion;
  cmd.Execute;
end;

function TServiceFlotillas.ClaveACupon(const Clave: String): Integer;
begin
  Result:=ClaveToID(Clave);
end;

function TServiceFlotillas.ClienteCupon(const Barras: AnsiString): Integer;
var
  ds: IDADataset;
begin
  Result:= 0;
  ds:=Schema.NewDataset(Connection, 'spClienteCupon');
  ds.ParamByName('BARRAS').AsString:=Barras;
  ds.Open;

  if not ds.Eof then
     Result:= ds.FieldByName('CLIENTEID').AsInteger;
end;

function TServiceFlotillas.CuponManual(const EstacionID, TurnoID,
  BombaID: Integer; const  Barras: string): TCuponValido;
var
  Aux: String;
  cmd: IDASQLCommand;
  DataSet: IDADataset;
  MiConsumo: TConsumo;
begin
  Result:=TCuponValido.Create;
  Aux:=Barras;
  if Length(Barras) <= 10 then
    Aux:=IntToStr(ClaveToID(Barras));
  DataSet:= Schema.NewDataset(Connection, 'spObtenCuponValido');
  DataSet.ParamByName('Barras').AsString:=Aux;
  DataSet.Open;
  Result.Valido:=False;
  Result.MsnError:='';
  if not DataSet.IsEmpty then
  begin
    Aux:=DataSet.FieldByName('Status').AsString;
    if Aux <> 'A' then
       Result.MsnError:= 'ESTE CUPON YA FUE CONSUMIDO';

    if Aux = 'I' then
       Result.MsnError:= 'ESTE CUPON FUE CANCELADO';

    if BuscaAutorizacion(DataSet.FieldByName('Barras').AsString) then
       Result.MsnError:= 'CUPON EN PROCESO DE CARGA';

    if Trunc(DataSet.FieldByName('FechaValido').AsDateTime) < Trunc(Now) then
      Result.MsnError:= 'EL CUPON HA CADUCADO VERIFIQUE FECHA DE VENCIMIENTO';

    if Result.MsnError = '' then
    begin
      Result.Importe:=DataSet.FieldByName('Importe').AsCurrency;
      MiConsumo:=TConsumo.Create;
      try
        MiConsumo.SecuenciaVenta:=Folio('TicketID', '');
        MiConsumo.Serie:='CM';
        MiConsumo.EstacionID:=EstacionID;
        MiConsumo.FechaMovimiento:=Trunc(Now);
        MiConsumo.FechaCarga:=Now;
        MiConsumo.Ejercicio:=StrToInt(FormatDateTime('yyyy', MiConsumo.FechaCarga));
        MiConsumo.Periodo:=StrToInt(FormatDateTime('m', MiConsumo.FechaCarga));
        MiConsumo.Dia:=StrToInt(FormatDateTime('d', MiConsumo.FechaCarga));
        MiConsumo.Turno:=TurnoID;
        MiConsumo.Kilometraje:=0;
        MiConsumo.Referencia:=Barras;
        MiConsumo.Tarjeta:=Barras;
        MiConsumo.PosicionCarga:=BombaID;
        MiConsumo.ProductoID:=1;
        MiConsumo.Importe:=DataSet.FieldByName('Importe').AsCurrency;
        MiConsumo.Precio:=PrecioProducto(1);
        MiConsumo.Cantidad:=MiConsumo.Importe / MiConsumo.Precio;
        MiConsumo.ImpuestoPorcentaje:=IVAEstacion(EstacionID);
        MiConsumo.ImpuestoImporte:=Impuesto(MiConsumo.Importe, MiConsumo.ImpuestoPorcentaje);
        MiConsumo.CuentaContable:='';
        MiConsumo.ManualAutomatico:='A';
        MiConsumo.Facturado:=0;
        MiConsumo.EnIngresos:=0;
        MiConsumo.Auditado:=0;
        MiConsumo.FacturaID:=0;
        MiConsumo.VehiculoID:=0;
        MiConsumo.ClienteID:=DataSet.FieldByName('ClienteID').AsInteger;
        MiConsumo.IEPS:=0;
        MiConsumo.GasolineroID:=GasolineroID;
        cmd:= Schema.NewCommand(Connection, 'spModificaCuponIndividual');
        cmd.ParamByName('CuponID').AsInteger:=DataSet.FieldByName('CuponID').AsInteger;
        cmd.ParamByName('EstacionID').AsInteger:=EstacionID;
        cmd.ParamByName('TurnoID').AsInteger:=TurnoID;
        cmd.ParamByName('BombaID').AsInteger:=BombaID;
        cmd.ParamByName('FechaCarga').AsDateTime:=MiConsumo.FechaCarga;
        cmd.ParamByName('Secuencia').AsInteger:=MiConsumo.SecuenciaVenta;
        cmd.ParamByName('Importe').AsFloat:=DataSet.FieldByName('Importe').AsCurrency;
        cmd.Execute;
        GuardarConsumo(MiConsumo);
        Result.CuponID:=MiConsumo.SecuenciaVenta;
        Result.Valido:=True;
        Result.Referencia:=Barras;
        Result.ClienteID:=MiConsumo.ClienteID;
      finally
        MiConsumo.Free;
      end;
    end;
  end
  else
    Result.MsnError:= 'CODIGO DE CUPON NO EXISTE';
end;

function TServiceFlotillas.DatosCliente(const ClienteID: Integer): TCliente;
var
  MiDataSet: IDADataSet;
begin
  Result:=nil;
  MiDataSet:=Schema.NewDataset(Connection, 'DatosCliente');
  MiDataSet.ParamByName('ClienteID').AsInteger:=ClienteID;
  MiDataSet.Open;
  if not MiDataSet.IsEmpty then
  begin
    Result:=TCliente.Create;
    Result.Nombre:=MiDataSet.FieldByName('Nombre').AsString;
    Result.RFC:=MiDataSet.FieldByName('RFC').AsString;
    Result.PlazoPago:=MiDataSet.FieldByName('PlazoPago').AsInteger;
    Result.CuentaContable:=MiDataSet.FieldByName('CuentaContable').AsString;
  end;
  MiDataSet.Close;
end;

function TServiceFlotillas.DatosClienteOtros(const Tarjeta: string;
  const EstacionID: Integer): TDatosClienteOtros;
var
  ds: IDADataset;
begin
  Result:=TDatosClienteOtros.Create;
  Result.IVA:=IVAEstacion(EstacionID);
  Result.GasolineroID:=GasolineroID;
  ds:=Schema.NewDataset(Connection, 'spDatosClienteOtros');
  ds.ParamByName('Tarjeta').AsString:=Tarjeta;
  ds.Open;
  Result.ClienteID:=ds.FieldByName('ClienteID').AsInteger;
  Result.VehiculoID:=ds.FieldByName('VehiculoID').AsInteger;
  Result.Nombre:=ds.FieldByName('Nombre').AsString;
  Result.Identificacion:=ds.FieldByName('Identificacion').AsString;
  ds.Close;
end;

function TServiceFlotillas.DatosFactura(const Folio: Integer;
  const Serie: String): Boolean;
var
  DataSet : IDADataSet;
begin
  Result:=false;
  DataSet := Schema.NewDataset(Connection, 'ObtenDatosFactura');
  DataSet.Close;
  DataSet.ParamByName('Folio').AsInteger := Folio;
  DataSet.ParamByName('Serie').AsString := Serie;
  DataSet.Open;

  if DataSet.EOF then Result := true;

end;

function TServiceFlotillas.DatosFacturaElectronica(
  const FacturaID: Integer; const GasolineroID: Integer): TFacturaElectronicaF;
var
  ds1: IDADataSet;
  ds2: IDADataSet;
  ds3: IDADataSet;
  ds4: IDADataSet;
  ds5: IDADataSet;

  TOTImpuestos: Double;
begin
  /////
  Result:=TFacturaElectronicaF.Create();

  TOTImpuestos:=0;

  ds1:=Schema.NewDataset(Connection, 'spDatosCadena');
  ds1.ParamByName('FacturaID').AsInteger:=FacturaID;

  ds1.Open;

  ds5:=Schema.NewDataset(Connection, 'spDatosCadenaExpedidoEn');
  ds5.Open;

  while not (ds1.EOF) do
  begin

    if not(ds5.EOF) then
    begin
      Result.CalleExpedidoEn:= ds5.FieldByName('Domicilio').AsString;
      Result.NoExterioExpedidoEn:= ds5.FieldByName('NoExterior').AsString;
      Result.ColoniaExpedidoEn:= ds5.FieldByName('Colonia').AsString;
      Result.CodigoPostalExpedidoEn:= ds5.FieldByName('CodigoPostal').AsString;
      Result.LocalidadExpedidoEn:= ds5.FieldByName('Localidad').AsString;
      Result.MunicipioExpedidoEn:= ds5.FieldByName('Municipio').AsString;
      Result.EstadoExpedidoEn:= ds5.FieldByName('Estado').AsString;
      Result.PaisExpedidoEn:= ds5.FieldByName('Pais').AsString;
      Result.Sucursal:= True;
    end else Result.Sucursal:= False;
    

    Result.Serie:= ds1.FieldByName('SERIE').AsString;
    Result.Folio:= ds1.FieldByName('FOLIO').AsString;
    Result.Fecha:= ds1.FieldByName('FECHA').AsString;
    Result.noAprobacion:= ds1.FieldByName('NOAPROBACION').AsString;
    Result.anoAprobacion:= ds1.FieldByName('ANOAPROBACION').AsString;
    Result.tipoComprobante:= ds1.FieldByName('FORMAPAGO').AsString;
    Result.formaDePago:= 'pago en una sola exhibicion';
    Result.SubTotal:= ds1.FieldByName('SUBTOTAL').AsString;
    Result.Total:= ds1.FieldByName('TOTAL').AsString;
    Result.RFCEmisor:= ds1.FieldByName('RFCEMISOR').AsString;
    Result.NOMEmpEmisor:= ds1.FieldByName('NOMEMPRESAEMISOR').AsString;
    Result.DireccionEm:= ds1.FieldByName('DOMEMISOR').AsString;
    Result.NOExteriorEM:= ds1.FieldByName('NOEXTERIOREMISOR').AsString;
    Result.ColoniaEmisor:= ds1.FieldByName('COLONIAEMISOR').AsString;
    Result.MunicipioEmisor:= ds1.FieldByName('MUNICIPIOEMISOR').AsString;
    Result.EstadoEmisor:= ds1.FieldByName('ESTADOEMISOR').AsString;
    Result.PaisEmisor:= ds1.FieldByName('PAISEMISOR').AsString;
    Result.CodigoPostalEmisor:= ds1.FieldByName('CODIGOPOSTALEMISOR').AsString;

    Result.RFCReceptor:= ds1.FieldByName('RFCRECEPTOR').AsString;
    Result.NombreReceptor:= ds1.FieldByName('NOMBREEMPRECEPTOR').AsString;
    Result.DomicilioReceptor:= ds1.FieldByName('DOMICILIORECEPTOR').AsString;
    Result.NoExteriorReceptor:= ds1.FieldByName('NOEXTERIORRECEPTOR').AsString;
    Result.ColoniaReceptor:= ds1.FieldByName('COLONIARECEPTOR').AsString;
    Result.LocalidadReceptor:= ds1.FieldByName('LOCALIDADRECEPTOR').AsString;
    Result.MunicipioReceptor:= ds1.FieldByName('MUNICIPIORECEPTOR').AsString;
    Result.EstadoReceptor:= ds1.FieldByName('ESTADORECEPTOR').AsString;
    Result.PaisReceptor:= ds1.FieldByName('PAISRECEPTOR').AsString;
    Result.CodigoPostalReceptor:= ds1.FieldByName('CODIGOPOSTALRECEPTOR').AsString;
    Result.email:= ds1.FieldByName('email').AsString;
    ds1.Next;
  end;

  ds2:=Schema.NewDataset(Connection, 'spDatosCadenaImportes');
  ds2.ParamByName('FacturaID').AsInteger:=FacturaID;
  ds2.Open;

  while not (ds2.EOF) do
  begin
    With Result.FacturaElectronicaDetalleImportes.Add do begin
      if ds2.FieldByName('ProductoID').AsInteger <= 3 then
         UnidadReceptor:= 'LTS'
      else
         UnidadReceptor:= 'UNI';

      CantidadReceptor:= FormatFloat('###0.00',(ds2.FieldByName('IMPORTE').AsFloat/
      strtofloat(FormatFloat('###0.00',ds2.FieldByName('PRECIO').AsFloat))));

      DescripcionReceptor:= ds2.FieldByName('DESCRIPCION').AsString;
      ValorUnitarioReceptor:= FormatFloat('###0.00',ds2.FieldByName('PRECIO').AsFloat);
      ImporteReceptor:= FormatFloat('###0.00',ds2.FieldByName('IMPORTE').AsFloat);
    end;
    ds2.Next;
  end;

      ds3:=Schema.NewDataset(Connection, 'spDatosCadenaImpuestosIEPS');
      ds3.ParamByName('FacturaID').AsInteger:=FacturaID;
      ds3.Open;

      ds4:=Schema.NewDataset(Connection, 'spDatosCadenaImpuestosIVA');
      ds4.ParamByName('FacturaID').AsInteger:=FacturaID;
      ds4.Open;

      while not (ds3.EOF) do
      begin
        if ds3.FieldByName('IEPS').AsFloat <> 0 then
        begin
           With Result.FacturaElectronicaDetalleImpuestos.Add do
           begin
                ImporteImpReceptor:= FormatFloat('###0.00',ds3.FieldByName('IEPS').AsFloat);
                TasaReceptor:= FormatFloat('###0.0000',ds3.FieldByName('TASAIEPS').AsFloat);
                ImpuestoReceptor:= 'IEPS';
                TOTImpuestos:= TOTImpuestos + ds3.FieldByName('IEPS').AsFloat;
                ds3.Next;
           end;
        end else ds3.Next;
      end;

      while not (ds4.EOF) do
      begin
        if ds4.FieldByName('IVA').AsFloat <> 0 then
        begin
           With Result.FacturaElectronicaDetalleImpuestos.Add do
           begin
                ImporteImpReceptor:= FormatFloat('###0.00',ds4.FieldByName('IVA').AsFloat);
                TasaReceptor:= FormatFloat('###0.0000',ds4.FieldByName('TASAIVA').AsFloat);
                ImpuestoReceptor:= 'IVA';
                TOTImpuestos:= TOTImpuestos + ds4.FieldByName('IVA').AsFloat;
               ds4.Next;
           end;
        end else ds4.Next;
      end;

  Result.TotalImpuesto:= FormatFloat('###0.0000',TOTImpuestos);
end;

function TServiceFlotillas.DatosMonedero(const FacturaID,
  GasolineroID: Integer): TMonederoElectronico;
var
  ds: IDADataset;
  TOTAL, SUBTOTAL: Double;
begin
  TOTAL:= 0; SUBTOTAL:=0;
  Result:=TMonederoElectronico.Create();

  ds:=Schema.NewDataset(Connection, 'spDatosMonedero');
  ds.ParamByName('FacturaID').AsInteger:= FacturaID;
  ds.ParamByName('GasolineroID').AsInteger:= GasolineroID;
  ds.Open;

  if not ds.IsEmpty then
  begin

  while not (ds.EOF) do
  begin
    With Result.conceptoEstadodeCuentaCombustible.Add do begin
      identificacion:= ds.FieldByName('Tarjeta').AsString;
      fecha:= ds.FieldByName('FECHAHORAFACTURA').AsString;
      rfc  := ds.FieldByName('RFCEstacion').AsString;
      claveEstacion:= ds.FieldByName('EstacionID').AsString;
      cantidad:= FormatFloat('###0.00',ds.FieldByName('Cantidad').AsFloat);
      nombreCombustible:= ds.FieldByName('NomProducto').AsString;
      folioOperacion:= ds.FieldByName('FacturaID').AsString;
      valorUnitario:= FormatFloat('###0.00',ds.FieldByName('Precio').AsFloat);
      importe:= FormatFloat('#0.0000', ds.FieldByName('Importe').AsFloat);

      if ds.FieldByName('ImpuestoImporte').AsFloat > 0 then
      begin
         With Result.conceptoEstadodeCuentaCombustible.Items[(Result.conceptoEstadodeCuentaCombustible.Count) - 1].detalleimpuesto.add do begin
         impuesto       := 'IVA';
         tasa           := ds.FieldByName('IVA').AsString;
         importeimpuesto:= FormatFloat('#0.0000',ds.FieldByName('ImpuestoImporte').AsFloat);
         end;
      end;

      if ds.FieldByName('ImporteIEPS').AsFloat > 0 then
      begin
         With Result.conceptoEstadodeCuentaCombustible.Items[(Result.conceptoEstadodeCuentaCombustible.Count) - 1].detalleimpuesto.add do begin
         impuesto       := 'IEPS';
         tasa           := ds.FieldByName('IEPS').AsString;
         importeimpuesto:= FormatFloat('#0.0000',ds.FieldByName('ImporteIEPS').AsFloat);
         end;
      end;

      SUBTOTAL:= SUBTOTAL + ds.FieldByName('SubTotal').AsFloat;
      TOTAL   := TOTAL + (ds.FieldByName('SubTotal').AsFloat + ds.FieldByName('ImpuestoImporte').AsFloat);
    end;
    ds.Next;
  end;
  Result.tipoOperacion:= 'Tarjeta';
  Result.NumerodeCuenta:= ds.FieldByName('ClienteID').AsString;
  Result.SubTotal:= FormatFloat('#0.0000',SUBTOTAL);
  Result.Total:= FormatFloat('#0.0000',TOTAL);
  end;
end;

function TServiceFlotillas.DatosProducto(const ID: Integer): TProductoF;
var
  ds: IDADataset;
begin
  Result:=TProductoF.Create;
  Result.ID:=-1;
  ds:=Schema.NewDataset(Connection, 'spDatosProducto');
  ds.ParamByName('ID').AsInteger:=ID;
  ds.Open;
  if not ds.IsEmpty then
  begin
    Result.ID:=ds.FieldByName('ProductoID').AsInteger;
    Result.Nombre:=ds.FieldByName('Descripcion').AsString;
    Result.Precio:=ds.FieldByName('Precio').AsFloat;
    Result.Cantidad:=1;
  end;
  ds.Close;
end;

function TServiceFlotillas.DatosUnidadesGOB(
  const TARJETA: AnsiString): TUnidadesGOB;
var
{pla_GOB}//-GOBIERNO DEL ESTADO------------------------------------------------}
  GOB: ServicioAdmonCombustibleSoap;
  HTTPRIO: THTTPRIO;
  CHIPS: ArrayOfString;
{pla_GOB}//--------------------------------------------------------------------}
begin
  Result:= TUnidadesGOB.Create();
  Try
  HTTPRIO:= THTTPRIO.Create(Self);
  GOB:= GetServicioAdmonCombustibleSoap(True, ServerDataModule.GOBHOST, HTTPRIO);

  CHIPS:=  GOB.ObtenerInformacion(TARJETA,
                         ServerDataModule.GOBUSUARIO,
                         ServerDataModule.GOBPASSWORD);

  if CHIPS[0]  <> INTTOSTR(ERR_GOB_IDRFINEXISTENTE) then
  begin
     Result.NumeroEconomico:= CHIPS[0];
     Result.Inventario:= CHIPS[1];
     Result.Placas:= CHIPS[2];
     Result.Marcas:= CHIPS[3];
     Result.Modelo:= CHIPS[4];
     Result.Color:= CHIPS[5];
  end else Result.NumeroEconomico:= CHIPS[0];
  except  End;
{pla_GOB}//--VALIDA GOBIERNO DEL ESTADO--BC-----------------------------------//
end;

function TServiceFlotillas.DatosVehiculo(const VehiculoID: Integer): TDatosVehiculo;
var
  MiDs: IDADataSet;
begin
  Result:=TDatosVehiculo.Create;
  Result.ClienteID:=0;
  MiDs:=Schema.NewDataset(Connection, 'DatosVehiculo');
  MiDs.ParamByName('VehiculoID').AsInteger:=VehiculoID;
  MiDs.Open;
  if not MiDs.IsEmpty then
  begin
    Result.ClienteID:=MiDs.FieldByName('ClienteID').AsInteger;
    Result.VehiculoID:=MiDs.FieldByName('VehiculoID').AsInteger;
    Result.ClienteNombre:=MiDs.FieldByName('Nombre').AsString;
    Result.Referencia:=MiDs.FieldByName('Referencia').AsString;
  end;
  MiDs.Close;
end;

function TServiceFlotillas.DatosVerifica(
  const VehiculoID: Integer): TDatosVerifica;
var
  ds: IDADataset;
begin
  Result:=TDatosVerifica.Create;
  ds:=Schema.NewDataset(Connection, 'spDatosVerifica');
  ds.ParamByName('VehiculoID').AsInteger:=VehiculoID;
  ds.Open;
  Result.AfectarHistorico:=ds.FieldByName('AfectarHistorico').AsBoolean;
  Result.KMS:=ds.FieldByName('KMS').AsInteger;
  ds.Close;
end;

function TServiceFlotillas.DatosVerificaReferencia(
  const Referencia: string): TDatosVerifica;
var
  ds: IDADataset;
begin
  Result:=TDatosVerifica.Create;
  ds:=Schema.NewDataset(Connection, 'spDatosVerificaReferencia');
  ds.ParamByName('Referencia').AsString:=Referencia;
  ds.Open;
  Result.AfectarHistorico:=ds.FieldByName('AfectarHistorico').AsBoolean;
  Result.KMS:=ds.FieldByName('KMS').AsInteger;
  ds.Close;
end;

function TServiceFlotillas.DatosVerifone(const VehiculoID: Integer;
  const Referencia: String): TDatosVerifoneF;
var
  ds: IDADataset;
  dsRef: IDADataset;
  DataSet: IDADataset;
  Procesar: TProcesaTarjeta;
  K: Double;
begin
  Result:=TDatosVerifoneF.Create;
  Result.StatusID:=ERR_SINCOMUNICACION;
  Result.Autorizada:=False;
  Procesar:=TProcesaTarjeta.Create;
  try
    ds:=Schema.NewDataset(Connection, 'spDatosVerifone');
    if Referencia <> '' then
    begin
      dsRef:= Schema.NewDataset(Connection, 'spBuscaReferencia');
      dsRef.ParamByName('Referencia').AsString:=Referencia;
      dsRef.Open;
      ds.ParamByName('VehiculoID').AsInteger:=dsRef.FieldByName('VehiculoID').AsInteger;
      dsRef.Close;
    end
    else
      ds.ParamByName('VehiculoID').AsInteger:=VehiculoID;
    ds.Open;
    Result.Referencia:=ds.FieldByName('Referencia').AsString;
    if not ds.IsEmpty then
    begin
      Procesar.ClienteID:=ds.FieldByName('ClienteID').AsInteger;
      Procesar.IdentificadorID:=ds.FieldByName('GasolineroID').AsInteger;
      Procesar.TarjetaID:=ds.FieldByName('VehiculoID').AsInteger;

      Result.Nombre:=ds.FieldByName('Nombre').AsString;
      Result.ClienteID:=Procesar.ClienteID;
      Result.VehiculoID:=Procesar.TarjetaID;
      Result.RazonSocial:=ds.FieldByName('RazonSocial').AsString;
      Result.Domicilio:=ds.FieldByName('Domicilio').AsString;
      Result.Colonia:=ds.FieldByName('Colonia').AsString;
      Result.Ciudad:=ds.FieldByName('Ciudad').AsString;
      Result.RFC:=ds.FieldByName('RFC').AsString;
      Result.NIP:=ds.FieldByName('NIP').AsInteger;
      Result.Identificacion:=ds.FieldByName('Identificacion').AsString;
      Result.Usuario:=ds.FieldByName('Usuario').AsString;
      Result.AcumuladoMNMes:=ds.FieldByName('ActualMNMes').AsFloat;
      Result.KMS:=ds.FieldByName('KMS').AsInteger;

      if not BuscaAutorizacionTajeta(Procesar.ClienteID, Procesar.TarjetaID, Procesar.IdentificadorID) then
      begin
        DataSet:=Schema.NewDataset(Connection, 'ValidarTarAutorizaciones');
        //DataSet.ParamByName('Identificador').AsInteger:=TProcesaTarjeta(MiRef.Procesa).IdentificadorID;
        DataSet.ParamByName('ClienteID').AsInteger:=Procesar.ClienteID;
        DataSet.ParamByName('TarjetaID').AsInteger:=Procesar.TarjetaID;
        DataSet.Open;
        if not DataSet.IsEmpty then
        begin
          Result.Mensaje:= 'Paso ValidarAutorizaciones';
          Procesar.curLitTarProceso:=DataSet.FieldByName('Volumen').AsFloat;
          Procesar.curImpTarProceso:=DataSet.FieldByName('Importe').AsFloat;
        end;
        DataSet.Close;

        DataSet:=Schema.NewDataset(Connection, 'ValidarTarSaldoEjercicio');
        //DataSet.ParamByName('Identificador').AsInteger:=Procesar.IdentificadorID;
        DataSet.ParamByName('ClienteIni').AsInteger:=Procesar.ClienteID;
        DataSet.ParamByName('ClienteFin').AsInteger:=Procesar.ClienteID;
        DataSet.Open;
        if not DataSet.IsEmpty then
        begin
          Result.Mensaje:= 'Paso ValidarSaldoEjercicio';
          Procesar.curSaldo:=DataSet.FieldByName('Saldo').AsCurrency;
          Procesar.curCargos:=0;
          Procesar.curAbonos:=0;
        end;
        DataSet.Close;

        DataSet:=Schema.NewDataset(Connection, 'ValidarCliAutorizaciones');
        DataSet.ParamByName('Identificador').AsInteger:=Procesar.IdentificadorID;
        DataSet.ParamByName('ClienteID').AsInteger:=Procesar.ClienteID;
        DataSet.Open;
        if not DataSet.IsEmpty then
        begin
          Result.Mensaje:= 'Paso Validar CliAutorizaciones';
          Result.RFC:= DataSet.FieldByName('RFC').AsString;
          Procesar.cliNombre:=DataSet.FieldByName('Nombre').AsString;
          Procesar.cliStatus:=DataSet.FieldByName('Estatus').AsString;
          Procesar.cliFormaCompra:=DataSet.FieldByName('FormaCompraID').AsInteger;
          Procesar.cliCuentaContable:=DataSet.FieldByName('CuentaContable').AsString;
          Procesar.cliLimiteCredito:=DataSet.FieldByName('LimiteCredito').AsFloat;
          Procesar.cliImpProceso:=DataSet.FieldByName('Importe').AsFloat;
          Procesar.cliVolProceso:=DataSet.FieldByName('Volumen').AsFloat;
          Procesar.curTipoTarjeta:=DataSet.FieldByName('NombreFormaCompra').AsString;
        end;
        DataSet.Close;

        DataSet:=Schema.NewDataset(Connection, 'SaldoTarjeta');
        DataSet.ParamByName('Identificador').AsInteger:=Procesar.IdentificadorID;
        DataSet.ParamByName('ClienteID').AsInteger:=Procesar.ClienteID;
        DataSet.ParamByName('TarjetaID').AsInteger:=Procesar.TarjetaID;
        DataSet.Open;
        if not DataSet.IsEmpty then
        begin
          Result.Mensaje:= 'Paso SaldoTarjeta';
          Procesar.DigitoSeguridad:=0;
          Procesar.Magna:=PrecioProducto(1);
          Procesar.Premium:=PrecioProducto(2);
          Procesar.Diesel:=PrecioProducto(3);
          procesar.PresetMN:=0;
          Procesar.PresetLT:=0;
          Procesar.SeleccionDeProducto:='123';
          Procesar.curStatus:=DataSet.FieldByName('Estatus').AsString;
          Procesar.curNIP:=DataSet.FieldByName('NIP').AsString;
          Procesar.curClasificacion:=DataSet.FieldByName('Clasificacion').AsInteger;
          Procesar.curFechaVencimiento:=DataSet.FieldByName('FechaExpira').AsDateTime;
          Procesar.curNombre:=DataSet.FieldByName('Nombre').AsString;
          Procesar.curCentroCosto:=DataSet.FieldByName('CentroCostos').AsString;
          Procesar.curIdentificacion:=DataSet.FieldByName('Identificacion').AsString;
          Procesar.curNoEconomico:=DataSet.FieldByName('NumeroEconomico').AsString;
          Procesar.curDepartamento:=DataSet.FieldByName('Departamento').AsString;
          Procesar.curProductoAutorizado:=DataSet.FieldByName('ProductoAutorizado').AsString;
          Procesar.curOdometro:=DataSet.FieldByName('Odometro').AsBoolean;
          Procesar.curFirma:=DataSet.FieldByName('Firma').AsBoolean;
          Procesar.curPlacas:=DataSet.FieldByName('Placas').AsBoolean;
          Procesar.curLunes:=DataSet.FieldByName('Lunes').AsString;
          Procesar.curMartes:=DataSet.FieldByName('Martes').AsString;
          Procesar.curMiercoles:=DataSet.FieldByName('Miercoles').AsString;
          Procesar.curJueves:=DataSet.FieldByName('Jueves').AsString;
          Procesar.curViernes:=DataSet.FieldByName('Viernes').AsString;
          Procesar.curSabado:=DataSet.FieldByName('Sabado').AsString;
          Procesar.curDomingo:=DataSet.FieldByName('Domingo').AsString;
          Procesar.Mensaje:=DataSet.FieldByName('Mensaje').AsString;
          Procesar.curDigitoSeguridad:=DataSet.FieldByName('DigitoSeguridad').AsInteger;
          Procesar.LimiteLTTurno:=DataSet.FieldByName('LimiteLTTurno').AsFloat;
          Procesar.LimiteLTDia:=DataSet.FieldByName('LimiteLTDia').AsFloat;
          Procesar.LimiteLTSemana:=DataSet.FieldByName('LimiteLTSemana').AsFloat;
          Procesar.LimiteLTMes:=DataSet.FieldByName('LimiteLTMes').AsFloat;
          Procesar.LimiteMNTurno:=DataSet.FieldByName('LimiteMNTurno').AsFloat;
          Procesar.LimiteMNDia:=DataSet.FieldByName('LimiteMNDia').AsFloat;
          Procesar.LimiteMNSemana:=DataSet.FieldByName('LimiteMNSemana').AsFloat;
          Procesar.LimiteMNMes:=DataSet.FieldByName('LimiteMNMes').AsFloat;
          Procesar.CargasMaximas:=DataSet.FieldByName('CargasMaximas').AsInteger;

          Procesar.ActualLTTurno:=DataSet.FieldByName('ActualLTTurno').AsFloat;
          Procesar.ActualLTDia:=DataSet.FieldByName('ActualLTDia').AsFloat;
          Procesar.ActualLTSemana:=DataSet.FieldByName('ActualLTSemana').AsFloat;
          Procesar.ActualLTMes:=DataSet.FieldByName('ActualLTMes').AsFloat;
          Procesar.ActualMNTurno:=DataSet.FieldByName('ActualMNTurno').AsFloat;
          Procesar.ActualMNDia:=DataSet.FieldByName('ActualMNDia').AsFloat;
          Procesar.ActualMNSemana:=DataSet.FieldByName('ActualMNSemana').AsFloat;
          Procesar.ActualMNMes:=DataSet.FieldByName('ActualMNMes').AsFloat;
          Procesar.ActualCargas:=DataSet.FieldByName('ActualCargas').AsInteger;
          Procesar.NIP:='0';
          Procesar.Odometro:=0;
          Procesar.MaximoVolumen:= 900;
          Procesar.MaximoImporte:= 9000;
          Result.StatusID:=Procesar.Procesar;
          if Result.StatusID = ERR_OK then
          begin
            Result.Autorizada:=True;
            Result.VolumenImporte:=Procesar.VolumenImporte;
            if Procesar.VolumenImporte = 'I' then
            begin
              Result.AutorizacionMN:=Procesar.Despacho;
              K:=Procesar.PrecioAlto;
              if K <> 0 then
                Result.AutorizacionLT:=Result.AutorizacionMN / K
              else
                Result.AutorizacionLT:=Result.AutorizacionMN;
            end
            else
            begin
              Result.AutorizacionLT:=Procesar.Despacho;
              Result.AutorizacionMN:=Result.AutorizacionLT * Procesar.PrecioAlto;
            end;
          end;
        end;
      end
      else
        Result.StatusID:= ERR_SALDORETENIDO;
    end
    else
      Result.StatusID:=ERR_TARJETANOACTIVA;
  finally
    Procesar.Free;
    Result.Mensaje:=MensajeDeError(Result.StatusID);
  end;
end;

function TServiceFlotillas.DocumentosConSaldo(
  const ClienteID: Integer): TDocumentosConSaldoArray;
var
  MiDataSet: IDADataset;
begin
  Result:=TDocumentosConSaldoArray.Create;
  MiDataSet:=Schema.NewDataset(Connection, 'spSaldoDocumento');
  //MiDataSet.ParamByName('Identificador').AsInteger:=Identificador;
  MiDataSet.ParamByName('ClienteID').AsInteger:=ClienteID;
  MiDataSet.Open;
  while not MiDataSet.EOF do
  begin
    with Result.Add do
    begin
      Importe:=MiDataSet.FieldByName('Importe').AsFloat;
      Saldo:=MiDataSet.FieldByName('Saldo').AsFloat;
      Fecha:=MiDataSet.FieldByName('Fecha').AsDateTime;
      Vencimiento:=MiDataSet.FieldByName('Vencimiento').AsDateTime;
      MovimientoID:=MiDataSet.FieldByName('MovimientoID').AsInteger;
      Referencia:=Format('Movimiento:[%s] Saldo:[%s] Vencimiento[%s]', [MiDataSet.FieldbyName('Referencia').AsString,
                                                                        FormatFloat('$#,0.00', Saldo),
                                                                        FormatDateTime('dd/mmm/yyyy', Vencimiento)]);
    end;    // with
    MiDataSet.Next;
  end;    // while
  MiDataSet.Close;
end;

function TServiceFlotillas.DocumentosCupones(
  const ClienteID: Integer): TDocumentosCuponesArray;
var
  MiDataSet: IDADataset;
begin
  Result:=TDocumentosCuponesArray.Create;
  MiDataSet:=Schema.NewDataset(Connection, 'spFacturasCliente');
  //MiDataSet.ParamByName('Identificador').AsInteger:=Identificador;
  MiDataSet.ParamByName('ClienteID').AsInteger:=ClienteID;
  MiDataSet.Open;

  while not MiDataSet.EOF do
  begin
    with Result.Add do
    begin

      Serie:=MiDataSet.FieldByName('Serie').AsString;
      aFolio:=MiDataSet.FieldByName('Folio').AsInteger;
      Referencia:=Format('Folio:[%s] Serie:[%s] Importe[%s]', [inttostr(aFolio), Serie,
                                                               FormatFloat('$#,0.00', MiDataSet.FieldByName('Total').AsFloat)]);
    end;    // with
    MiDataSet.Next;
  end;    // while
  MiDataSet.Close;
end;

procedure TServiceFlotillas.EliminaAutorizacion(const AutorizacionID: Integer);
var
  cmd: IDASQLCommand;
begin
  cmd:=Schema.NewCommand(Connection, 'AutorizacionEliminar');
  cmd.ParamByName('AutorizacionID').AsInteger:=AutorizacionID;
  cmd.Execute;
end;
              
function TServiceFlotillas.EliminaAutorizacionVehiculo(const Referencia: AnsiString): Boolean;
var
  cmd: IDASQLCommand;
begin
  Result:=False;
  try
    //cmd:=Schema.NewCommand(Connection, 'spAutorizacionEliminarTarjeta');
    cmd:=Schema.NewCommand(Connection, 'spEliminaAutorizacion');
    cmd.ParamByName('Barras').AsString:= Referencia;
    {cmd.ParamByName('ClienteID').AsInteger:= ClienteID;
    cmd.ParamByName('VehiculoID').AsInteger:= VehiculoID;
    cmd.ParamByName('GasolineroID').AsInteger:= GasolineroID;}
    cmd.Execute;
    Result:=True;
  except
  end;
end;

function TServiceFlotillas.EliminaFactura(const Folio: Integer;
  const Serie: String): Boolean;
var
  ds: IDADataset;
begin
  Result:= False;
  try
    ds:= Schema.NewDataset(Connection, 'spEliminaFactura');
    ds.ParamByName('Folio').AsInteger:= Folio;
    ds.ParamByName('Serie').AsString:= Serie;
    ds.Open;
    Result:=ds.FieldByName('Resultado').AsBoolean;
    ds.Close;
  except
  end;
end;

procedure TServiceFlotillas.EliminaReferencia(const VehiculoID, Tipo: Integer);
var
  cmd: IDASQLCommand;
begin
  cmd:=Schema.NewCommand(Connection, 'Delete_dbo Referencia');
  cmd.ParamByName('VehiculoID').AsInteger:=VehiculoID;
  cmd.ParamByName('TipoReferenciaID').AsInteger:=Tipo;
  cmd.Execute;
end;

procedure TServiceFlotillas.EliminaVehiculoProducto(const VehiculoID,
  ProductoID: Integer);
var
  cmd: IDASQLCommand;
begin
  cmd:=Schema.NewCommand(Connection, 'Delete_dbo VehiculoProducto');
  cmd.ParamByName('VehiculoID').AsInteger:=VehiculoID;
  cmd.ParamByName('ProductoID').AsInteger:=ProductoID;
  cmd.Execute;
end;

function TServiceFlotillas.EnviaDatosFacturaGOB(const DatosFacturaEnviaGOB: TEnviaDatosFacturaGOB): Boolean;
var
{pla_GOB}//-GOBIERNO DEL ESTADO------------------------------------------------}
  GOB: ServicioAdmonCombustibleSoap;
  HTTPRIO: THTTPRIO;
  IDUNICO:  Integer;
  XSSUBTOTAL, XSIVA: TXSDecimal;
  XSFECHA: TXSDateTime;

  BitacoraGOB:  TBitacoraGOB;
{pla_GOB}//--------------------------------------------------------------------}
  myYear, myMonth, myDay : Word;
  myHour, myMin, mySec, myMilli : Word;
begin
  Result:= False;

  XSSUBTOTAL:= TXSDecimal.Create();
  XSIVA:= TXSDecimal.Create();
  XSFECHA:= TXSDateTime.Create();

  XSSUBTOTAL.DecimalString:= FormatFloat('#0.00',DatosFacturaEnviaGOB.SubTotal);
  XSIVA.DecimalString:= FormatFloat('#0.00',DatosFacturaEnviaGOB.IVA);

  DecodeDateTime(DatosFacturaEnviaGOB.Fecha, myYear, myMonth, myDay,
                 myHour, myMin, mySec, myMilli);

  XSFECHA.Day:= myDay; XSFECHA.Month:= myMonth; XSFECHA.Year:= myYear;
  XSFECHA.Hour:= myHour; XSFECHA.Minute:= myMin; XSFECHA.Second:= mySec;
  XSFECHA.Millisecond:= myMilli;

  Try
  HTTPRIO:= THTTPRIO.Create(Self);
  GOB:= GetServicioAdmonCombustibleSoap(True, ServerDataModule.GOBHOST, HTTPRIO);

  IDUNICO:=  GOB.EnviarDatosFactura(DatosFacturaEnviaGOB.Factura,
                                  XSFECHA,
                                  XSSUBTOTAL,
                                  XSIVA,
                                  DatosFacturaEnviaGOB.Detalle,
                                  ServerDataModule.GOBUSUARIO,
                                  ServerDataModule.GOBPASSWORD);

  if IDUNICO  >= 0 then
  begin
     {guardar en bitacora la factura}
     //Guarda BitacoraGOB----------------------------------------------------------//
      BitacoraGOB := TBitacoraGOB.Create();
      BitacoraGOB.Fecha:= DatosFacturaEnviaGOB.Fecha;
      BitacoraGOB.SecuenciaVenta:= 0;
      BitacoraGOB.FechaCarga:= now();
      BitacoraGOB.IDAutorizacion:= IDUNICO;
      BitacoraGOB.IDConsumoGuardadoGOB:= strtoint(DatosFacturaEnviaGOB.Factura);
      BitacoraGOB.RFID:= 'FACTURA ENVIADA--#FACT: '+INTTOSTR(IDUNICO)+'--IMPORTE: '+FormatFloat('#0.00',DatosFacturaEnviaGOB.SubTotal);
      BitacoraGOB.Turno := 0;
      BitacoraGOB.Kilometraje:= 0;
      BitacoraGOB.PosicionCarga:= 0;
      BitacoraGOB.Cantidad:= 0;
      BitacoraGOB.Precio:= 0;
      BitacoraGOB.Importe:= DatosFacturaEnviaGOB.SubTotal;
      BitacoraGOB.ImpuestoImporte:= DatosFacturaEnviaGOB.IVA;
      BitacoraGOB.ImpuestoPorcentaje:= 0;
      BitacoraGOB.ProductoID:= 0;
      BitacoraGOB.GasolineroID:= 0;
      BitacoraGOB.IEPS:= 0;
      BitacoraGOB.EstacionID:= 0;
      BitacoraGOB.Saldo:= -1;
      BitacoraGOB.ClienteID:= 0;
      BitacoraGOB.VehiculoID:= 0;
      GuardaBitacoraGOB(BitacoraGOB);
      BitacoraGOB.Free;
{pla_GOB}//--------------------------------------------------------------------}

     Result:= True;
  end else Result:= False;
  except  End;
{pla_GOB}//--VALIDA GOBIERNO DEL ESTADO--BC-----------------------------------//
end;

function TServiceFlotillas.FacturaCupon(const Cliente: Integer;
  const Importe: Double; const EstacionID, EmpleadoID: Integer;
  const SerieFactura: String): Integer;
var
  Aux: TDetalleFactura;
  DatosFactura: TDatosFactura;
  ds: IDADataSet;

  Vencimiento: TDateTime;
begin
  ds:=Schema.NewDataset(Connection, 'DatosCliente');
  ds.ParamByName('ClienteID').AsInteger:=Cliente;
  ds.Open;

  if not ds.IsEmpty then
  begin
     Vencimiento:=  Trunc(Now) + ds.FieldByName('PlazoPago').AsInteger;
  end else Vencimiento:= Trunc(Now);

  Result:=Folio('Folio', SerieFactura);
  DatosFactura:=TDatosFactura.Create;
  ds:=Schema.NewDataset(Connection, 'IVAEstacion');
  ds.ParamByName('EstacionID').AsInteger:=EstacionID;
  ds.Open;

  DatosFactura.Factura.IVA:=ds.FieldByName('IVA').AsFloat;
  if DatosFactura.Factura.IVA = 0 then
    DatosFactura.Factura.IVA:=15;
  DatosFactura.Factura.FacturaID:=Folio('FacturaID','');
  DatosFactura.Factura.Serie :=SerieFactura;
  DatosFactura.Factura.Folio:=Result;
  DatosFactura.Factura.Fecha:=Trunc(Now);
  DatosFactura.Factura.FechaVencimiento:=Vencimiento;
  DatosFactura.Factura.FechaImpresion:= Trunc(Now);
  DatosFactura.Factura.Ejercicio:= strtoint(FormatDateTime('yyyy', Now));
  DatosFactura.Factura.Periodo:=strtoint(FormatDateTime('mm', Now));
  DatosFactura.Factura.Saldo:=0;
  DatosFactura.Factura.Tickets:='';
  DatosFactura.Factura.ClienteID:=Cliente;
  DatosFactura.Factura.UsuarioID:=EmpleadoID;
  DatosFactura.Factura.MovimientoID:=Folio('MovimientoID','');
  DatosFactura.Factura.Total:= Importe;
  DatosFactura.Factura.Subtotal:=Decimales(Importe / (1 + (DatosFactura.Factura.IVA / 100)), 2);
  DatosFactura.Factura.Impuesto:=Decimales(Importe - DatosFactura.Factura.Subtotal, 2);
  Aux:=DatosFactura.DetalleFactura.Add;
  Aux.Precio:=ds.FieldByName('Precio').AsFloat;
  Aux.Importe:=Importe;
  Aux.Cantidad:=Decimales(Aux.Importe/ Aux.Precio, 3);
  Aux.ProductoID:=1;
  Aux.DetalleFacturaID:=Folio('DetalleFacturaID', '');
  GuardaDatosFactura(DatosFactura);
end;

function TServiceFlotillas.FacturaEstacion(
  const DatosFactura: TDatosFactura; const EstacionID: Integer): Integer;
var
  DataSet: IDADataSet;
  Vencimiento: TDateTime;
  cmd: IDASQLCommand;
begin
  DataSet:= Schema.NewDataset(Connection, 'DatosCliente');
  DataSet.Close;
  DataSet.ParamByName('ClienteID').AsInteger:= DatosFactura.Factura.ClienteID;
  DataSet.Open;

  Vencimiento:=DatosFactura.Factura.Fecha + DataSet.FieldByName('PlazoPago').AsInteger;

  Result:= DatosFactura.Factura.Folio;
  DatosFactura.Factura.FechaVencimiento:=Vencimiento;
  DatosFactura.Factura.MovimientoID:=Folio('MovimientoID','');
  GuardaDatosFactura(DatosFactura);

  cmd:=Schema.NewCommand(Connection, 'spInsertaFacturaSaldoEstacion');
  cmd.ParamByName('SaldoEstacionID').AsInteger:=Folio('SaldoEstacionID','');
  cmd.ParamByName('Fecha').AsDateTime:=DatosFactura.Factura.Fecha;
  cmd.ParamByName('Ejercicio').AsInteger:=StrToInt(FormatDateTime('yyyy', DatosFactura.Factura.Fecha));
  cmd.ParamByName('Periodo').AsInteger:=StrToInt(FormatDateTime('mm', DatosFactura.Factura.Fecha));
  cmd.ParamByName('Dia').AsInteger:=StrToInt(FormatDateTime('dd', DatosFactura.Factura.Fecha));
  cmd.ParamByName('Referencia').AsString:='FACTURA ESTACION: ' + DatosFactura.Factura.Serie + inttostr(DatosFactura.Factura.Folio);
  cmd.ParamByName('Cargo').AsFloat:= 0;
  cmd.ParamByName('Abono').AsFloat:= DatosFactura.Factura.Total;
  cmd.ParamByName('FechaRegistro').AsDateTime:=DatosFactura.Factura.Fecha;
  cmd.ParamByName('EstacionID').AsInteger:= EstacionID;
  cmd.ParamByName('UsuarioID').AsInteger:=  DatosFactura.Factura.UsuarioID;
  cmd.Execute;
end;

function TServiceFlotillas.FacturaRecibo(const Cliente: Integer;
  const Importe: Double; const EstacionID: Integer;
  const EmpleadoID: Integer; const SerieFactura: String; const ProductoID: Integer): Integer;
var
  Aux: TDetalleFactura;
  DatosFactura: TDatosFactura;
  ds: IDADataSet;
begin
  Result:=Folio('Folio', SerieFactura);
  DatosFactura:=TDatosFactura.Create;
  ds:=Schema.NewDataset(Connection, 'IVAEstacion');
  ds.ParamByName('EstacionID').AsInteger:=EstacionID;
  ds.Open;
  DatosFactura.Factura.IVA:=ds.FieldByName('IVA').AsFloat;
  if DatosFactura.Factura.IVA = 0 then
    DatosFactura.Factura.IVA:=15;
  DatosFactura.Factura.FacturaID:=Folio('FacturaID','');
  DatosFactura.Factura.Serie :=SerieFactura;
  DatosFactura.Factura.Folio:=Result;
  DatosFactura.Factura.Fecha:=Trunc(Now);
  DatosFactura.Factura.FechaVencimiento:=Trunc(Now);
  DatosFactura.Factura.FechaImpresion:= Trunc(Now);
  DatosFactura.Factura.Ejercicio:= strtoint(FormatDateTime('yyyy', Now));
  DatosFactura.Factura.Periodo:=strtoint(FormatDateTime('mm', Now));
  DatosFactura.Factura.Saldo:=0;
  DatosFactura.Factura.Tickets:='';
  DatosFactura.Factura.ClienteID:=Cliente;
  DatosFactura.Factura.UsuarioID:=EmpleadoID;
  DatosFactura.Factura.MovimientoID:=Folio('MovimientoID','');
  DatosFactura.Factura.Total:= Importe;
  DatosFactura.Factura.Subtotal:=Decimales(Importe / (1 + (DatosFactura.Factura.IVA / 100)), 2);
  DatosFactura.Factura.Impuesto:=Decimales(Importe - DatosFactura.Factura.Subtotal, 2);
  Aux:=DatosFactura.DetalleFactura.Add;
  Aux.Precio:=ds.FieldByName('Precio').AsFloat;
  Aux.Importe:=Importe;
  Aux.Cantidad:=Decimales(Aux.Importe/ Aux.Precio, 3);
  Aux.ProductoID:=ProductoID;
  Aux.DetalleFacturaID:=Folio('DetalleFacturaID', '');
  GuardaDatosFactura(DatosFactura);
end;

function TServiceFlotillas.Fecha: TDateTime;
begin
  Result:=Now;
end;

function TServiceFlotillas.Folio(const Campo, Serie: String): Integer;
var
  DataSet: IDADataset;
begin
  DataSet:=Schema.NewDataset(Connection, 'spFolio');
  DataSet.ParamByName('Campo').AsString:=Campo;
  DataSet.ParamByName('Serie').AsString:=Serie;
  DataSet.Open;
  Result:=DataSet.FieldByName('Folio').AsInteger;
  DataSet.Close;
end;

function TServiceFlotillas.FolioActual2(const Serie: String; const folio: Integer): Integer;
var
  ds: IDADataSet;
begin
  ds:=Schema.NewDataset(Connection, 'spFolioActual2');
  ds.ParamByName('serie').AsString:=Serie;
  ds.ParamByName('folio').AsInteger:=folio;
  ds.ParamByName('GasolineroID').AsInteger:= GasolineroID;
  ds.Open;
  Result:=ds.FieldByName('Folio').AsInteger;
  ds.Close;
end;

function TServiceFlotillas.GasolineroID: Integer;
begin
  Result:=ServerDataModule.GasolineroID;
end;

function TServiceFlotillas.GasolineroNombre: string;
var
  ds: IDADataset;
begin
  ds:=Schema.NewDataset(Connection,'dbo Gasolinero');
  ds.Open;
  Result:=ds.FieldByName('Nombre').asString;
  ds.Close;
end;

procedure TServiceFlotillas.GeneraCupones(const LoteCuponID,
  ClienteID, EstacionID, Identificador: Integer;
  const Cupones: AGeneraCupon; const TipoCupon: Boolean; const Serie:AnsiString; const aFolio:Integer);
var
  I, J, Aux: Integer;
  cmd: IDASQLCommand;
begin
  cmd:=Schema.NewCommand(Connection, 'Insert_dbo Cupon');
  cmd.ParamByName('ClienteID').AsInteger:=ClienteID;
  cmd.ParamByName('EstacionID').AsInteger:=EstacionID;
  cmd.ParamByName('LoteCuponID').AsInteger:=LoteCuponID;
  cmd.ParamByName('Status').AsString:='A';
  cmd.ParamByName('VolumenImporte').AsString:='I';
  cmd.ParamByName('Serie').AsString:= Serie;
  cmd.ParamByName('Folio').AsInteger:= aFolio;
  //cmd.ParamByName('FechaEmision').AsDateTime:= Now();
  for I := 0 to Cupones.Count - 1 do
  begin
    cmd.ParamByName('Referencia').AsString:=Cupones[I].Referencia;
    cmd.ParamByName('FechaValido').AsDateTime:=Trunc(Now) + 365;
    for J := 1 to Cupones[I].Cantidad do
    begin
      Aux:=Folio('CuponID', '');
      cmd.ParamByName('CuponID').AsInteger:=Aux;
      cmd.ParamByName('Barras').AsString:='0005' + FormatFloat('0000', Identificador) + FormatFloat('00000000', Aux);
      cmd.ParamByName('Importe').AsFloat:=Cupones[I].Denominacion;
      cmd.ParamByName('TipoCupon').AsBoolean:= TipoCupon;
      cmd.Execute;
    end;
  end;
end;

function TServiceFlotillas.GeneraFacturasXCliente(const ClienteID: Integer;
  const Productos: string; const FechaCorte, FechaContable: TDateTime;
  const Serie: string; const aFolio, EmpleadoID: Integer): Integer;
var
  DataSet: IDADataset;
  cmd3, cmd2,cmd1: IDASQLCommand;
  DatosFactura: TDatosFactura;
  Detalle:TDetalleFactura;
  MiFolio, CliID, MovID  : Integer;
  Porcentaje, SubTotal, ImpIVA, IVA, Total: Currency;
begin
  Result:=0;
  MiFolio:= aFolio;

  //Buscar por folio repetido
  Dataset := Schema.NewDataSet(Connection, 'spBuscaFolio');
  DataSet.ParamByName('Folio').AsInteger := MiFolio;
  DataSet.ParamByName('Serie').AsString := Serie;
  DataSet.Open;

  if DataSet.RecordCount > 0 then
  begin
    Result := -2;
    Exit;
  end;

  DataSet.Close;

  cmd1:= Schema.NewCommand(Connection, 'spActualizaConsumoGenFact2');
  cmd2:= Schema.NewCommand(Connection, 'spInsertarMovimiento');
  cmd3:= Schema.NewCommand(Connection, 'spInsertaSaldoDocumentos');

  DataSet := Schema.NewDataset(Connection, 'spObtenConsumosXCliente');
  DataSet.ParamByName('ClienteID').AsInteger := ClienteID;
  DataSet.ParamByName('FechaCorte').AsDateTime := FechaCorte;
  DataSet.ParamByName('Productos').AsString := Productos;

  DataSet.Open;

  if DataSet.EOF then MiFolio:= -1;

  while not(DataSet.EOF) do
  begin
    ////BUSCA SI FOLIO EXCEDE O NO ES EL CORRECTO AL FOLIO INICIAL Y FINAL//////
    MiFolio:= FolioActual2(Serie,MiFolio);
    if MiFolio < 0 then Begin Exit; End;
    ////////////////////////////////////////////////////////////////////////////

    Total := 0;
    CliID := DataSet.FieldByName('ClienteID').AsInteger;
    Porcentaje := DataSet.FieldByName('IVA').AsFloat;
    ImpIVA := Porcentaje / 100;

    //Crear Estructura//
    DatosFactura := TDatosFactura.Create;
    DatosFactura.Factura := TFactura.Create;
    DatosFactura.DetalleFactura := ATDetalleFactura.Create;
    ////////////////////

    MovID := Folio('MovimientoID', '');

    DatosFactura.Factura.FacturaID := Folio('FacturaID','');
    DatosFactura.Factura.Serie := Serie;
    DatosFactura.Factura.Folio := MiFolio;
    DatosFactura.Factura.Fecha := FechaContable;
    DatosFactura.Factura.FechaVencimiento := FechaContable + DataSet.FieldByName('PlazoPago').AsInteger;
    DatosFactura.Factura.FechaImpresion := FechaContable;
    DatosFactura.Factura.Ejercicio := strtoint(FormatDateTime('yyyy',FechaContable));
    DatosFactura.Factura.Periodo := strtoint(FormatDateTime('mm',FechaContable));
    DatosFactura.Factura.Saldo := 0;
    DatosFactura.Factura.Tickets := '';
    DatosFactura.Factura.ClienteID := CliID;
    DatosFactura.Factura.UsuarioID := EmpleadoID;
    DatosFactura.Factura.MovimientoID := MovID;
    DatosFactura.Factura.IVA := Porcentaje;

    while ((DataSet.FieldByName('ClienteID').AsInteger = CliID) and
          (DataSet.FieldByName('IVA').AsFloat = Porcentaje) and
           (not DataSet.EOF)) do
    begin
      Detalle:=TDetalleFactura.Create;
      Detalle.Cantidad:=DataSet.FieldByName('Cantidad').AsFloat;
      Detalle.Precio:=DataSet.FieldByName('Precio').AsFloat;
      Detalle.Importe:=DataSet.FieldByName('Importe').AsFloat;
      Detalle.ProductoID:=DataSet.FieldByName('ProductoID').AsInteger;
      Detalle.DetalleFacturaID:=Folio('DetalleFacturaID', '');
      DatosFactura.DetalleFactura.Add(Detalle);
      Total := Total + DataSet.FieldByName('Importe').AsFloat;
      DataSet.Next;
    end;

    //Afectar Consumos
    cmd1.ParamByName('FechaCorte').AsDateTime := FechaCorte;
    cmd1.ParamByName('ClientID').AsInteger := CliID;
    cmd1.ParamByName('FacturaID').AsInteger := DatosFactura.Factura.FacturaID;
    cmd1.ParamByName('Productos').AsString := Productos;
    cmd1.Execute;

    DatosFactura.Factura.Tickets := BuscaTicketsFactura(DatosFactura.Factura.FacturaID);

    //Afectar Movimientos//
    cmd2.ParamByName('MovimientoID').AsInteger:= MovID;
    cmd2.ParamByName('FechaMovimiento').AsDateTime:= FechaContable;
    cmd2.ParamByName('FechaVencimiento').AsDateTime:=FechaContable + DataSet.FieldByName('PlazoPago').AsInteger;
    cmd2.ParamByName('Referencia').AsString:= 'FACTURA: ' + Serie + inttostr(MiFolio);
    cmd2.ParamByName('Ejercicio').AsInteger:= strtoint(FormatDateTime('yyyy',FechaContable));
    cmd2.ParamByName('Periodo').AsInteger:= strtoint(FormatDateTime('mm',FechaContable));
    cmd2.ParamByName('CargoAbono').AsString:= 'C';
    cmd2.ParamByName('Cargo').AsFloat := Total;
    cmd2.ParamByName('Abono').AsFloat := 0;
    cmd2.ParamByName('FechaRegistro').AsDateTime := Trunc(now);
    cmd2.ParamByName('Origen').AsString:= 'AUTO';
    cmd2.ParamByName('AfectaSaldos').AsBoolean := False;
    cmd2.ParamByName('TipoMovimientoID').AsString := 'FAC';
    cmd2.ParamByName('UsuarioID').AsInteger:= EmpleadoID;
    cmd2.ParamByName('ClienteID').AsInteger:= CliID;
    cmd2.Execute;

    //Afectar SaldosDocumentos//
    cmd3.ParamByName('SaldoDocumentoID').AsInteger:=Folio('SaldoDocID', '');
    cmd3.ParamByName('Fecha').AsDateTime:=FechaContable;
    cmd3.ParamByName('FechaVencimiento').AsDateTime := FechaContable + DataSet.FieldByName('PlazoPago').AsInteger;
    cmd3.ParamByName('Cargo').AsFloat:=Total;
    cmd3.ParamByName('Abono').AsFloat:=0;
    cmd3.ParamByName('Referencia').AsString:='FACTURA: ' + Serie + inttostr(MiFolio);
    cmd3.ParamByName('ClienteID').AsInteger:=CliID;
    cmd3.ParamByName('MovimientoID').AsInteger:= MovID;
    cmd3.ParamByName('ReciboID').AsInteger:= 0;
    cmd3.ParamByName('BancoID').AsInteger:= 0;
    cmd3.Execute;

    SubTotal:=StrToFloat(FormatFloat('#0.00', Total / (1+ImpIVA)));
    IVA:=StrToFloat(FormatFloat('#0.00', Total - SubTotal));
    Result:= MiFolio;
    MiFolio := MiFolio + 1;
    DatosFactura.Factura.Subtotal:=SubTotal;
    DatosFactura.Factura.Impuesto:=IVA;
    DatosFactura.Factura.Total:= Total;

    GuardaDatosFactura(DatosFactura);
  end;
end;

function TServiceFlotillas.GeneraFacturasXClienteCupones(const ClienteID: Integer; const Productos: AnsiString;
         const FechaCorte: DateTime; const FechaContable: DateTime;
         const EmpleadoID: Integer; const Serie: AnsiString; const aFolio: Integer): Integer;
var
  DataSet: IDADataset;
  cmd3, cmd2,cmd1: IDASQLCommand;

  MiFolio, CliID, MovID, FacturaID  : Integer;
  Porcentaje, Total: Currency;
begin
  MiFolio:= aFolio;

  //Buscar por folio repetido
  Dataset := Schema.NewDataSet(Connection, 'spBuscaFoliocCupon');
  DataSet.ParamByName('Folio').AsInteger := MiFolio;
  DataSet.ParamByName('Serie').AsString := Serie;
  DataSet.Open;

  Result:=0;
  MiFolio:= DataSet.FieldByName('MovimientoID').AsInteger;

  if DataSet.RecordCount > 0 then
     FacturaID:= DataSet.FieldByName('FacturaID').AsInteger
  Else begin Result := -2; Exit; end;

  DataSet.Close;

  cmd1:= Schema.NewCommand(Connection, 'spActualizaConsumoGenFact2Cupones');
  
  cmd2:= Schema.NewCommand(Connection, 'spInsertarMovimiento');
  cmd3:= Schema.NewCommand(Connection, 'spInsertaSaldoDocumentos');

  DataSet := Schema.NewDataset(Connection, 'spObtenConsumosXClienteCupones');
  DataSet.ParamByName('ClienteID').AsInteger := ClienteID;
  DataSet.ParamByName('FechaCorte').AsDateTime := FechaCorte;
  DataSet.ParamByName('CadTicket').AsString := Productos;

  DataSet.Open;

  if DataSet.EOF then MiFolio:= -1;

  while not(DataSet.EOF) do
  begin
    ////BUSCA SI FOLIO EXCEDE O NO ES EL CORRECTO AL FOLIO INICIAL Y FINAL//////
    MiFolio:= FolioActual2(Serie,MiFolio);
    if MiFolio < 0 then Begin Exit; End;
    ////////////////////////////////////////////////////////////////////////////

    Total := 0;
    CliID := DataSet.FieldByName('ClienteID').AsInteger;
    Porcentaje := DataSet.FieldByName('IVA').AsFloat;

    MovID := MiFolio;

    while ((DataSet.FieldByName('ClienteID').AsInteger = CliID) and
          (DataSet.FieldByName('IVA').AsFloat = Porcentaje) and
           (not DataSet.EOF)) do
    begin
      Total := Total + DataSet.FieldByName('Importe').AsFloat;
      DataSet.Next;
    end;

    //Afectar Consumos
    cmd1.ParamByName('FechaCorte').AsDateTime := FechaCorte;
    cmd1.ParamByName('ClientID').AsInteger := CliID;
    cmd1.ParamByName('FacturaID').AsInteger := FacturaID;
    cmd1.ParamByName('CadTicket').AsString := Productos;
    cmd1.Execute;

    //Afectar Movimientos//
    cmd2.ParamByName('MovimientoID').AsInteger:= MovID;
    cmd2.ParamByName('FechaMovimiento').AsDateTime:= FechaContable;
    cmd2.ParamByName('FechaVencimiento').AsDateTime:=FechaContable + DataSet.FieldByName('PlazoPago').AsInteger;
    cmd2.ParamByName('Referencia').AsString:= 'FACTURA CUPONES: ' + Serie + inttostr(aFolio);
    cmd2.ParamByName('Ejercicio').AsInteger:= strtoint(FormatDateTime('yyyy',FechaContable));
    cmd2.ParamByName('Periodo').AsInteger:= strtoint(FormatDateTime('mm',FechaContable));
    cmd2.ParamByName('CargoAbono').AsString:= 'C';
    cmd2.ParamByName('Cargo').AsFloat := Total;
    cmd2.ParamByName('Abono').AsFloat := 0;
    cmd2.ParamByName('FechaRegistro').AsDateTime := Trunc(now);
    cmd2.ParamByName('Origen').AsString:= 'AUTO';
    cmd2.ParamByName('AfectaSaldos').AsBoolean := False;
    cmd2.ParamByName('TipoMovimientoID').AsString := 'FAC';
    cmd2.ParamByName('UsuarioID').AsInteger:= EmpleadoID;
    cmd2.ParamByName('ClienteID').AsInteger:= CliID;
    cmd2.Execute;

    //Afectar SaldosDocumentos//
    cmd3.ParamByName('SaldoDocumentoID').AsInteger:=Folio('SaldoDocID', '');
    cmd3.ParamByName('Fecha').AsDateTime:=FechaContable;
    cmd3.ParamByName('FechaVencimiento').AsDateTime := FechaContable + DataSet.FieldByName('PlazoPago').AsInteger;
    cmd3.ParamByName('Cargo').AsFloat:=Total;
    cmd3.ParamByName('Abono').AsFloat:=0;
    cmd3.ParamByName('Referencia').AsString:='FACTURA CUPONES: ' + Serie + inttostr(aFolio);
    cmd3.ParamByName('ClienteID').AsInteger:=CliID;
    cmd3.ParamByName('MovimientoID').AsInteger:= MovID;
    cmd3.ParamByName('ReciboID').AsInteger:= 0;
    cmd3.ParamByName('BancoID').AsInteger:= 0;
    cmd3.Execute;

    Result:= MiFolio;
    MiFolio := MiFolio + 1;

  end;
end;

function TServiceFlotillas.GenerarFacturas(const Serie: String;
  const fol: Integer; const FechaCorte, FechaContable: DateTime;
  const DiaFacturar: Integer; const Magna, Premium, Diesel: Boolean; const EmpleadoID: Integer):Integer;
var
  DataSet: IDADataset;
  cmd3, cmd2,cmd1: IDASQLCommand;
  DatosFactura: TDatosFactura;
  Detalle:TDetalleFactura;
  MiFolio, CliID, MovID  : Integer;
  Porcentaje, SubTotal, ImpIVA, IVA, Total: Currency;
  Vencimiento: TDateTime;
  AuxMagna,AuxPremium,AuxDiesel: Integer;
begin
  Result:= 0;
  MiFolio:= fol;
  //Buscar por folio repetido
  try
    Dataset := Schema.NewDataSet(Connection, 'spBuscaFolio');
    DataSet.ParamByName('Folio').AsInteger := MiFolio;
    DataSet.ParamByName('Serie').AsString := Serie;
    DataSet.Open;

    if DataSet.RecordCount > 0 then
    begin
      Result := -2;
      Exit;
    end;
  finally
    DataSet.Close;
  end;

  cmd1:= Schema.NewCommand(Connection, 'spActualizaConsumoGenFact');
  cmd2:= Schema.NewCommand(Connection, 'spInsertarMovimiento');
  cmd3:= Schema.NewCommand(Connection, 'spInsertaSaldoDocumentos');

  MiFolio:= fol;

  if Magna then AuxMagna := 1 else AuxMagna := 0;
  if Premium then AuxPremium := 2 else AuxPremium := 0;
  if Diesel then AuxDiesel := 3 else AuxDiesel := 0;

  DataSet:= Schema.NewDataset(Connection, 'spObtenClientesConsumos');

  DataSet.ParamByName('Magna').AsInteger := AuxMagna;
  DataSet.ParamByName('Premium').AsInteger := AuxPremium;
  DataSet.ParamByName('Diesel').AsInteger := AuxDiesel;
  
  DataSet.ParamByName('FechaCorte').AsDateTime := FechaCorte;
  DataSet.ParamByName('GrupoFacturar').AsInteger := DiaFacturar;
  DataSet.Open;

  IF DataSet.EOF then MiFolio:= -1;

  while not(DataSet.EOF) Do
  begin
    ////BUSCA SI FOLIO EXCEDE O NO ES EL CORRECTO AL FOLIO INICIAL Y FINAL//////
    MiFolio:= FolioActual2(Serie,MiFolio);
    if MiFolio < 0 then Begin Result:= -1; Exit; End;
    ////////////////////////////////////////////////////////////////////////////
    Total := 0;
    CliID := DataSet.FieldByName('ClienteID').AsInteger;
    Porcentaje:=DataSet.FieldByName('IVA').AsFloat;
    ImpIVA:= Porcentaje / 100;
    Vencimiento:=FechaContable + DataSet.FieldByName('PlazoPago').AsInteger;
    //crear Estructura//
      DatosFactura := TDatosFactura.Create;
      DatosFactura.Factura:= TFactura.Create;
      DatosFactura.DetalleFactura := ATDetalleFactura.Create;
    ////////////////////

    MovID := Folio('MovimientoID', '');

    DatosFactura.Factura.FacturaID:=Folio('FacturaID','');
    DatosFactura.Factura.Serie :=Serie;
    DatosFactura.Factura.Folio:=MiFolio;
    DatosFactura.Factura.Fecha:=FechaContable;

    DatosFactura.Factura.FechaVencimiento:= Vencimiento;
    DatosFactura.Factura.FechaImpresion:= FechaContable;
    DatosFactura.Factura.Ejercicio:= strtoint(FormatDateTime('yyyy',FechaContable));
    DatosFactura.Factura.Periodo:=strtoint(FormatDateTime('mm',FechaContable));
    DatosFactura.Factura.Saldo:=0;
    //DatosFactura.Factura.Tickets:='';
    DatosFactura.Factura.ClienteID:=CliID;
    DatosFactura.Factura.UsuarioID:=EmpleadoID;
    DatosFactura.Factura.MovimientoID:=MovID;
    DatosFactura.Factura.IVA:=Porcentaje;

    while ((DataSet.FieldByName('ClienteID').AsInteger = CliID) and
          (DataSet.FieldByName('IVA').AsFloat = Porcentaje) and
           (not DataSet.EOF)) do
    begin
      Detalle:=TDetalleFactura.Create;
      Detalle.Cantidad:=DataSet.FieldByName('Cantidad').AsFloat;
      Detalle.Precio:=DataSet.FieldByName('Precio').AsFloat;
      Detalle.Importe:=DataSet.FieldByName('Importe').AsFloat;
      Detalle.ProductoID:=DataSet.FieldByName('ProductoID').AsInteger;
      Detalle.DetalleFacturaID:=Folio('DetalleFacturaID', '');
      DatosFactura.DetalleFactura.Add(Detalle);
      Total := Total + DataSet.FieldByName('Importe').AsFloat;
      DataSet.Next;
    end;
    //Afectar Consumos
    cmd1.ParamByName('FechaCorte').AsDateTime := FechaCorte;
    cmd1.ParamByName('ClientID').AsInteger := CliID;
    cmd1.ParamByName('FacturaID').AsInteger := DatosFactura.Factura.FacturaID;
    cmd1.ParamByName('IVA').AsFloat := DatosFactura.Factura.IVA;
    cmd1.Execute;

    DatosFactura.Factura.Tickets := BuscaTicketsFactura(DatosFactura.Factura.FacturaID);

    //Afectar Movimientos//
    cmd2.ParamByName('MovimientoID').AsInteger:= MovID;
    cmd2.ParamByName('FechaMovimiento').AsDateTime:= FechaContable;
    cmd2.ParamByName('FechaVencimiento').AsDateTime:=Vencimiento;
    cmd2.ParamByName('Referencia').AsString:= 'FACTURA: ' + Serie + inttostr(MiFolio);
    cmd2.ParamByName('Ejercicio').AsInteger:= strtoint(FormatDateTime('yyyy',FechaContable));
    cmd2.ParamByName('Periodo').AsInteger:= strtoint(FormatDateTime('mm',FechaContable));
    cmd2.ParamByName('CargoAbono').AsString:= 'C';
    cmd2.ParamByName('Cargo').AsFloat := Total;
    cmd2.ParamByName('Abono').AsFloat := 0;
    cmd2.ParamByName('FechaRegistro').AsDateTime := Trunc(now);
    cmd2.ParamByName('Origen').AsString:= 'AUTO';
    cmd2.ParamByName('AfectaSaldos').AsBoolean := False;
    cmd2.ParamByName('TipoMovimientoID').AsString := 'FAC';
    cmd2.ParamByName('UsuarioID').AsInteger:= EmpleadoID;
    cmd2.ParamByName('ClienteID').AsInteger:= CliID;
    cmd2.Execute;

    //Afectar SaldosDocumentos//
    cmd3.ParamByName('SaldoDocumentoID').AsInteger:=Folio('SaldoDocID', '');
    cmd3.ParamByName('Fecha').AsDateTime:=FechaContable;
    cmd3.ParamByName('FechaVencimiento').AsDateTime := FechaContable + DataSet.FieldByName('PlazoPago').AsInteger;
    cmd3.ParamByName('Cargo').AsFloat:=Total;
    cmd3.ParamByName('Abono').AsFloat:=0;
    cmd3.ParamByName('Referencia').AsString:='FACTURA: ' + Serie + inttostr(MiFolio);
    cmd3.ParamByName('ClienteID').AsInteger:=CliID;
    cmd3.ParamByName('MovimientoID').AsInteger:= MovID;
    cmd3.ParamByName('ReciboID').AsInteger:= 0;
    cmd3.ParamByName('BancoID').AsInteger:= 0;
    cmd3.Execute;

    SubTotal:=StrToFloat(FormatFloat('#0.00', Total / (1+ImpIVA)));
    IVA:=StrToFloat(FormatFloat('#0.00', Total - SubTotal));

    MiFolio := MiFolio + 1;
    DatosFactura.Factura.Subtotal:=SubTotal;
    DatosFactura.Factura.Impuesto:=IVA;
    DatosFactura.Factura.Total:= Total;
    GuardaDatosFactura(DatosFactura);
  end;
  Result:= MiFolio;
end;

function TServiceFlotillas.GOBCHIP(const Referencia: AnsiString): Boolean;
var
{pla_GOB}//-GOBIERNO DEL ESTADO------------------------------------------------}
  GOB: ServicioAdmonCombustibleSoap;
  HTTPRIO: THTTPRIO;
{pla_GOB}//--------------------------------------------------------------------}
begin
  Result:= False;

  if ServerDataModule.AUTORIZAGOB = 'S' then
  Begin
  Try
  HTTPRIO:= THTTPRIO.Create(Self);
  GOB:= GetServicioAdmonCombustibleSoap(True, ServerDataModule.GOBHOST, HTTPRIO);

  if GOB.ObtenerInformacion(Referencia,
                         ServerDataModule.GOBUSUARIO,
                         ServerDataModule.GOBPASSWORD)[0]  <> INTTOSTR(ERR_GOB_IDRFINEXISTENTE)
  then
  Result:= True else Result:= False;
  Except  End;
  End;
{pla_GOB}//--VALIDA GOBIERNO DEL ESTADO--BC-----------------------------------//
end;

procedure TServiceFlotillas.GuardaAccesos(const UsuarioID: Integer;
  const Lista: String);
var
  I: Integer;
  MiLista: TStrings;
  cmdElimina: IDASQLCommand;
  cmdInserta: IDASQLCommand;
begin
  cmdElimina:=Schema.NewCommand(Connection, 'AccesosEliminar');
  cmdElimina.ParamByName('UsuarioID').AsInteger:=UsuarioID;
  cmdElimina.Execute;
  cmdInserta:=Schema.NewCommand(Connection, 'AccesosInsertar');
  cmdInserta.ParamByName('UsuarioID').AsInteger:=UsuarioID;
  MiLista:=TStringList.Create;
  MiLista.Text:=Lista;
  try
    for I := 0 to MiLista.Count - 1 do
    begin
      cmdInserta.ParamByName('OpcionID').AsString:=MiLista[I];
      cmdInserta.Execute;
    end;
  finally
    MiLista.Free;
  end;
end;

function TServiceFlotillas.GuardaAutorizacion(
  const Autorizacion: TAutoriza): Boolean;
var
  cmdAutorizacion: IDASQLCommand;
begin
  Result := False;
  try
    cmdAutorizacion:= Schema.NewCommand(Connection,'spInsertarAutorizacion');
    cmdAutorizacion.ParamByName('AutorizacionID').AsInteger:= Autorizacion.AutorizacionID;
    cmdAutorizacion.ParamByName('Fecha').AsDateTime:= Autorizacion.Fecha;
    cmdAutorizacion.ParamByName('Importe').AsFloat:= Autorizacion.Importe;
    cmdAutorizacion.ParamByName('Cantidad').AsFloat:= Autorizacion.Cantidad;
    cmdAutorizacion.ParamByName('ImporteCantidad').AsString:= Autorizacion.ImporteCantidad;
    cmdAutorizacion.ParamByName('PosicionCarga').AsInteger:= Autorizacion.PosicionCarga;
    cmdAutorizacion.ParamByName('Referencia').AsString:= Autorizacion.Referencia;
    cmdAutorizacion.ParamByName('EstacionID').AsInteger:= Autorizacion.EstacionID;
    cmdAutorizacion.ParamByName('VehiculoID').AsInteger:= Autorizacion.VehiculoID;
    cmdAutorizacion.ParamByName('ClienteID').AsInteger:= Autorizacion.ClienteID;
    cmdAutorizacion.ParamByName('GasolineroID').AsInteger:= ServerDataModule.GasolineroID;
    cmdAutorizacion.ParamByName('Tipo').AsInteger:= Autorizacion.Tipo;
    cmdAutorizacion.ParamByName('Odometro').AsInteger:= Autorizacion.Odometro;
    cmdAutorizacion.Execute;
    Result:= True;
  except
  end;
end;

function TServiceFlotillas.GuardaBitacoraGOB(
  const BitacoraGOB: TBitacoraGOB): Boolean;
var
  cmd:IDASQLCommand;
begin
  cmd:= Schema.NewCommand(Connection,'spInsertaBitacoraGOB');
  cmd.ParamByName('BitacoraGOBID').AsInteger:=Folio('BitacoraGOBID','');
  cmd.ParamByName('SecuenciaVenta').AsInteger:= BitacoraGOB.SecuenciaVenta;
  cmd.ParamByName('Fecha').AsDateTime:=BitacoraGOB.Fecha;
  cmd.ParamByName('IDAutorizacion').AsInteger:=BitacoraGOB.IDAutorizacion;
  cmd.ParamByName('IDConsumoGuardaGOB').AsInteger:=BitacoraGOB.IDConsumoGuardadoGOB;
  cmd.ParamByName('FechaCarga').AsFloat:=BitacoraGOB.FechaCarga;
  cmd.ParamByName('RFID').AsString:=BitacoraGOB.RFID;
  cmd.ParamByName('Turno').AsInteger:=BitacoraGOB.Turno;
  cmd.ParamByName('Kilometraje').AsInteger:=BitacoraGOB.Kilometraje;
  cmd.ParamByName('PosicionCarga').AsFloat:=BitacoraGOB.PosicionCarga;
  cmd.ParamByName('Cantidad').AsFloat:=BitacoraGOB.Cantidad;
  cmd.ParamByName('Precio').AsFloat:=BitacoraGOB.Precio;
  cmd.ParamByName('Importe').AsFloat:=BitacoraGOB.Importe;
  cmd.ParamByName('ImpuestoImporte').AsFloat:=BitacoraGOB.ImpuestoImporte;
  cmd.ParamByName('ImpuestoPorcentaje').AsFloat:=BitacoraGOB.ImpuestoPorcentaje;
  cmd.ParamByName('ProductoID').AsInteger:=BitacoraGOB.ProductoID;
  cmd.ParamByName('GasolineroID').AsInteger:=BitacoraGOB.GasolineroID;
  cmd.ParamByName('IEPS').AsFloat:=BitacoraGOB.IEPS;
  cmd.ParamByName('EstacionID').AsFloat:=BitacoraGOB.EstacionID;
  cmd.ParamByName('Saldo').AsFloat:=BitacoraGOB.Saldo;
  cmd.ParamByName('ClienteID').AsInteger:= BitacoraGOB.ClienteID;
  cmd.ParamByName('VehiculoID').AsInteger:= BitacoraGOB.VehiculoID;
  cmd.Execute;
  Result:= True;
end;

procedure TServiceFlotillas.GuardaDatosFactura(
  const DatosFactura: TDatosFactura);
var
  cmdFactura:IDASQLCommand;
  cmdDetalles:IDASQLCommand;
  cmdDetalleCupon:IDASQLCommand;
  cmdCupon:IDASQLCommand;
  Datos: TDatosFactura;
  J,I: integer;
  dsGasolinero: IDADataSet;

  DFacturaElectronica: TDataFacturaElectronicaF;
begin
  Datos:=TDatosFactura.Create;
  try
    Datos.Assign(DatosFactura);
    CalculaIEPS(Datos);
    cmdFactura:=Schema.NewCommand(Connection,'spInsertarFactura') ;
    cmdFactura.ParamByName('FacturaID').AsInteger:=Datos.Factura.FacturaID;
    cmdFactura.ParamByName('Serie').AsString:=Datos.Factura.Serie;
    cmdFactura.ParamByName('Folio').AsInteger:=Datos.Factura.Folio;
    cmdFactura.ParamByName('Fecha').AsDateTime:=Datos.Factura.Fecha;
    cmdFactura.ParamByName('FechaVencimiento').AsFloat:=Datos.Factura.FechaVencimiento;
    cmdFactura.ParamByName('FechaImpresion').AsDateTime:=Datos.Factura.FechaImpresion;
    cmdFactura.ParamByName('Ejercicio').AsInteger:=Datos.Factura.Ejercicio;
    cmdFactura.ParamByName('Periodo').AsInteger:=Datos.Factura.Periodo;
    cmdFactura.ParamByName('Subtotal').AsFloat:=Datos.Factura.Subtotal;
    cmdFactura.ParamByName('Impuesto').AsFloat:=Datos.Factura.Impuesto;
    cmdFactura.ParamByName('Total').AsFloat:=Datos.Factura.Total;
    cmdFactura.ParamByName('Saldo').AsFloat:=Datos.Factura.Saldo;
    cmdFactura.ParamByName('Tickets').AsString:=Datos.Factura.Tickets;
    cmdFactura.ParamByName('ClienteID').AsInteger:=Datos.Factura.ClienteID;
    cmdFactura.ParamByName('UsuarioID').AsInteger:=Datos.Factura.UsuarioID;
    cmdFactura.ParamByName('MovimientoID').AsInteger:=Datos.Factura.MovimientoID;
    cmdFactura.ParamByName('IVA').AsFloat:=Datos.Factura.IVA;
    cmdFactura.Execute;

    cmdDetalles:=Schema.NewCommand(Connection,'spInsertarDetalleFactura') ;
    for I := 0 to Datos.DetalleFactura.Count - 1 do
    begin
      cmdDetalles.ParamByName('DetalleFacturaID').AsInteger:=Datos.DetalleFactura[I].DetalleFacturaID;
      cmdDetalles.ParamByName('FacturaID').AsInteger:=Datos.Factura.FacturaID;
      cmdDetalles.ParamByName('Cantidad').AsFloat:=Datos.DetalleFactura.Items[I].Cantidad;
      cmdDetalles.ParamByName('Precio').AsFloat:=Datos.DetalleFactura.Items[I].Precio;
      cmdDetalles.ParamByName('Importe').AsFloat:=Datos.DetalleFactura.Items[I].Importe;
      cmdDetalles.ParamByName('ProductoID').AsInteger:=Datos.DetalleFactura.Items[I].ProductoID;
      cmdDetalles.Execute;
    end;

    cmdDetalleCupon:=Schema.NewCommand(Connection,'spInsertaDetalleCupon') ;
    For I:=0 to Datos.DetalleCupon.Count - 1 do
    begin
      cmdDetalleCupon.ParamByName('DetalleCuponID').AsInteger:=Folio('DetalleCuponID','');
      cmdDetalleCupon.ParamByName('Denominacion').AsFloat:=Datos.DetalleCupon.Items[I].Denominacion;
      cmdDetalleCupon.ParamByName('Cantidad').AsFloat:=Datos.DetalleCupon.Items[I].Cantidad;
      cmdDetalleCupon.ParamByName('Referencia').AsString:=Datos.DetalleCupon.Items[I].Referencia;
      cmdDetalleCupon.ParamByName('FacturaID').AsFloat:=Datos.Factura.FacturaID;
      cmdDetalleCupon.Execute;
      cmdCupon:=Schema.NewCommand(Connection,'spInsertarCupon') ;
      For J:=1 to Trunc(Datos.DetalleCupon.Items[I].Cantidad) do
      begin
        cmdCupon.ParamByName('CuponID').AsInteger:=Folio('CuponID','');
        cmdCupon.ParamByName('Importe').AsFloat:=Datos.DetalleCupon.Items[I].Denominacion;
        cmdCupon.ParamByName('FechaEmision').AsDateTime:=Datos.Factura.Fecha;


        cmdCupon.ParamByName('Barras').AsString:= IntToStr(cmdCupon.ParamByName('CuponID').AsInteger) +
                                                  IntToStr(Modulo66(inttostr(cmdCupon.ParamByName('CuponID').AsInteger))) +
                                                  IntToStr(Modulo66(IntToStr(cmdCupon.ParamByName('CuponID').AsInteger) + IntToStr(Modulo66(IntToStr(cmdCupon.ParamByName('CuponID').AsInteger)))));

        cmdCupon.ParamByName('ClienteID').AsInteger:=Datos.Factura.ClienteID;
        cmdCupon.ParamByName('FacturaID').AsInteger:=Datos.Factura.FacturaID;
        cmdCupon.ParamByName('DetalleCuponID').AsInteger:=cmdDetalleCupon.ParamByName('DetalleCuponID').AsInteger;
        cmdCupon.Execute;
      end;
    end;
  finally
    ///////////FACTURA ELECTRONICA//////////////////////////////////////////////
    dsGasolinero:=Schema.NewDataset(Connection, 'spObtenDatosGasolinero');
    dsGasolinero.ParamByName('Gasolinero').AsInteger:=GasolineroID;
    dsGasolinero.Open;

    DFacturaElectronica:=  TDataFacturaElectronicaF.Create();
    DFacturaElectronica.Assign(CadenaOriginal(Datos.Factura.FacturaID, GasolineroID));
    ///////////FACTURA ELECTRONICA//////////////////////////////////////////////
    InsertaFacturaElectronica(Folio('FacturaElectronicaID',''),
                              DFacturaElectronica.CadenaOriginal,
                              DFacturaElectronica.SelloDigital,
                              Datos.Factura.FacturaID,
                              True,False,
                              dsGasolinero.FieldByName('NOCERTIFICADO').AsString,
                              dsGasolinero.FieldByName('NOAPROBACION').AsString,
                              dsGasolinero.FieldByName('ANOAPROBACION').AsDateTime);
    ////////////////////////////////////////////////////////////////////////////
    Datos.Free;
  end;
end;

function TServiceFlotillas.GuardarConsumo(const Consumo: TConsumo): Boolean;
var
  Aux: TDatosVerifica;
  cmdConsumo:IDASQLCommand;
  spBuscaClienteEmpresa: IDADataset;
begin
   {if (Abs(Consumo.Importe) < 1) then
   begin
     Result:=True;
     Exit;
   end;}
   cmdConsumo := Schema.NewCommand(Connection, 'spInsertaConsumo');
   spBuscaClienteEmpresa := Schema.NewDataset(Connection, 'BuscaClienteEmpresaDebito');
   Aux:=TDatosVerifica.Create;
   Try
       if Consumo.VehiculoID > 0 then
       begin
         Aux.Assign(DatosVerifica(Consumo.VehiculoID));
         cmdConsumo.ParamByName('Rendimiento').AsFloat := Decimales((Consumo.Kilometraje - Aux.KMS) / Consumo.Cantidad, 3);
       end
       else
         cmdConsumo.ParamByName('Rendimiento').AsFloat := 0;
       cmdConsumo.ParamByName('Serie').AsString:=Consumo.Serie;
       if Consumo.SecuenciaVenta = -1 then
         cmdConsumo.ParamByName('SecuenciaVenta').AsInteger := Folio('FolioOtrosID', '')
       else
         cmdConsumo.ParamByName('SecuenciaVenta').AsInteger := Consumo.SecuenciaVenta;
       cmdConsumo.ParamByName('EstacionID').AsInteger := Consumo.EstacionID;
       cmdConsumo.ParamByName('FechaMovimiento').AsDateTime := Consumo.FechaMovimiento;
       cmdConsumo.ParamByName('FechaCarga').AsDateTime := Consumo.FechaCarga;
       cmdConsumo.ParamByName('Ejercicio').AsInteger := Consumo.Ejercicio;
       cmdConsumo.ParamByName('Periodo').AsInteger := Consumo.Periodo;
       cmdConsumo.ParamByName('Dia').AsInteger := Consumo.Dia;
       cmdConsumo.ParamByName('Turno').AsInteger := Consumo.Turno;
       cmdConsumo.ParamByName('Kilometraje').AsInteger := Consumo.Kilometraje;
       if Length(Consumo.Tarjeta) <= 16 then
         cmdConsumo.ParamByName('Tarjeta').AsString := Consumo.Tarjeta
       else
         cmdConsumo.ParamByName('Tarjeta').AsString := Copy(Consumo.Tarjeta, 1, 16);
       cmdConsumo.ParamByName('PosicionCarga').AsInteger := Consumo.PosicionCarga;
       cmdConsumo.ParamByName('Cantidad').AsFloat := Consumo.Cantidad;
       cmdConsumo.ParamByName('Precio').AsFloat := Consumo.Precio;
       cmdConsumo.ParamByName('Importe').AsFloat := Consumo.Importe;
       cmdConsumo.ParamByName('ImpuestoImporte').AsFloat := Consumo.ImpuestoImporte;
       cmdConsumo.ParamByName('ImpuestoPorcentaje').AsFloat := Consumo.ImpuestoPorcentaje;
       cmdConsumo.ParamByName('CuentaContable').AsString := Consumo.CuentaContable;
       cmdConsumo.ParamByName('ManualAutomatico').AsString := Consumo.ManualAutomatico;
       cmdConsumo.ParamByName('Facturado').AsInteger := Consumo.Facturado;
       cmdConsumo.ParamByName('EnIngresos').AsInteger := Consumo.EnIngresos;
       cmdConsumo.ParamByName('Auditado').AsInteger := Consumo.Auditado;
       cmdConsumo.ParamByName('FacturaID').AsInteger := Consumo.FacturaID;
       cmdConsumo.ParamByName('ProductoID').AsInteger := Consumo.ProductoID;
       cmdConsumo.ParamByName('GasolineroID').AsInteger := ServerDataModule.GasolineroID;
       if Consumo.ClienteID <> 0 then
       begin
         if Consumo.ClienteID <> -1 then
           cmdConsumo.ParamByName('ClienteID').AsInteger := Consumo.ClienteID
         else
           cmdConsumo.ParamByName('ClienteID').AsInteger := ServerDataModule.ClienteBancaria;
       end
       else
         cmdConsumo.ParamByName('ClienteID').AsInteger:= buscaClientexVehiculo(Consumo.VehiculoID);
       cmdConsumo.ParamByName('VehiculoID').AsInteger := Consumo.VehiculoID;
       cmdConsumo.ParamByName('IEPS').AsFloat:= Consumo.IEPS;
       cmdConsumo.ParamByName('UsuarioID').AsInteger:= Consumo.UsuarioID;
       cmdConsumo.Execute;
       Result:= True;

       //---------------------------------------------------------------------//
         {IF (ServerDataModule.DebitoEmpresa = 'S') and
         ((Consumo.Referencia = 'DEBITO') OR (Copy(Consumo.Referencia, 1, 4) = '0002'))
         Then
         begin
            spBuscaClienteEmpresa.Close;
            spBuscaClienteEmpresa.ParamByName('ESTACIONID').AsInteger:= Consumo.EstacionID;
            spBuscaClienteEmpresa.Open;

            if not spBuscaClienteEmpresa.EOF then
            begin
               cmdConsumo.ParamByName('ClienteID').AsInteger:= spBuscaClienteEmpresa.FieldByName('CLIENTEID').AsInteger;
               cmdConsumo.ParamByName('FlotillaID').AsInteger := spBuscaClienteEmpresa.FieldByName('VEHICULOID').AsInteger;
               cmdConsumo.Execute;

               spBuscaClienteEmpresa.Next;
            end;
         end;  }
       //---------------------------------------------------------------------//
   Except
       Result:= False;
   End;
end;

function TServiceFlotillas.GuardarConsumoGOB(const Consumo: TConsumo): Boolean;
var
//-GOBIERNO DEL ESTADO-//
  GOB: ServicioAdmonCombustibleSoap;
  HTTPRIO: THTTPRIO;
  XSCANTIDAD, XSIMPORTE: TXSDecimal;
  RESGOB: Integer;
  BitacoraGOB: TBitacoraGOB;
//---------------------//
begin
  RESGOB:= 0;
{pla_GOB}//--obten IDRFID------------------------------------------------------}
  if (ServerDataModule.AUTORIZAGOB = 'S') AND (copy(Consumo.Tarjeta,1,1) <> '0') then
  BEGIN
  HTTPRIO:= THTTPRIO.Create(Self);
  GOB:= GetServicioAdmonCombustibleSoap(True, ServerDataModule.GOBHOST, HTTPRIO);

  END;

  {pla_GOB}//guarda consumo en gobierno del estado-------------------------------}
    XSCANTIDAD:= TXSDecimal.Create();
    XSIMPORTE:= TXSDecimal.Create();
    XSCANTIDAD.DecimalString:= FormatFloat('#0.00',CONSUMO.Cantidad);
    XSIMPORTE.DecimalString:= FormatFloat('#0.00',CONSUMO.Importe);

    if (ServerDataModule.AUTORIZAGOB = 'S') AND (copy(Consumo.Tarjeta,1,1) <> '0') then
    RESGOB:=  GOB.CargoEx(Consumo.Tarjeta,
              CONSUMO.Kilometraje,
              XSCANTIDAD,
              CONSUMO.ProductoID,
              XSIMPORTE,
              ServerDataModule.GOBUSUARIO,
              ServerDataModule.GOBPASSWORD,
              Consumo.EstacionID);

//Guarda BitacoraGOB----------------------------------------------------------//
   if RESGOB > 0 then
   begin
      BitacoraGOB := TBitacoraGOB.Create();
      BitacoraGOB.Fecha:= now();
      BitacoraGOB.SecuenciaVenta:= Consumo.SecuenciaVenta;
      BitacoraGOB.FechaCarga:= Consumo.FechaCarga;
      BitacoraGOB.IDAutorizacion:= 0;
      BitacoraGOB.IDConsumoGuardadoGOB:= RESGOB;
      BitacoraGOB.RFID:= Consumo.Referencia;
      BitacoraGOB.Turno := Consumo.Turno;
      BitacoraGOB.Kilometraje:= Consumo.Kilometraje;
      BitacoraGOB.PosicionCarga:= Consumo.PosicionCarga;
      BitacoraGOB.Cantidad:= Consumo.Cantidad;
      BitacoraGOB.Precio:= Consumo.Precio;
      BitacoraGOB.Importe:= Consumo.Importe;
      BitacoraGOB.ImpuestoImporte:= Consumo.ImpuestoImporte;
      BitacoraGOB.ImpuestoPorcentaje:= Consumo.ImpuestoPorcentaje;
      BitacoraGOB.ProductoID:= Consumo.ProductoID;
      BitacoraGOB.GasolineroID:= Consumo.GasolineroID;
      BitacoraGOB.IEPS:= Consumo.IEPS;
      BitacoraGOB.EstacionID:= Consumo.EstacionID;
      BitacoraGOB.Saldo:= -1;
      BitacoraGOB.ClienteID:= Consumo.ClienteID;
      BitacoraGOB.VehiculoID:= Consumo.VehiculoID;
      BitacoraGOB.RFID:= Consumo.Tarjeta;
      GuardaBitacoraGOB(BitacoraGOB);
      BitacoraGOB.Free;
   END;
   Result:= True;
{pla_GOB}//--------------------------------------------------------------------}
end;

function TServiceFlotillas.IEPS(ProductoID: Integer): Real;
var
  ds: IDADataset;
begin
  ds:=Schema.NewDataset(Connection, 'spIEPS');
  ds.ParamByName('ProductoID').AsInteger:=ProductoID;
  ds.Open;
  Result:=Decimales(ds.FieldByName('IEPS').AsFloat, 4);
  ds.Close;
end;

function TServiceFlotillas.InsertaBitacora(const ClienteID, UsuarioID: Integer;
const Tabla, Campo, ValorAnterior, ValorNuevo: String): Boolean;
var
  cmdBitacora:IDASQLCommand;
begin
  Result:= False;
  Try
    cmdBitacora := Schema.NewCommand(Connection, 'spInsertaBitacora');

    cmdBitacora.ParamByName('BitacoraID').AsInteger:= Folio('BitacoraID','');
    cmdBitacora.ParamByName('ClienteID').AsInteger:= ClienteID;
    cmdBitacora.ParamByName('GasolineroID').AsInteger:= GasolineroID;
    cmdBitacora.ParamByName('UsuarioID').AsInteger:= UsuarioID;
    cmdBitacora.ParamByName('Tabla').AsString:= Tabla;
    cmdBitacora.ParamByName('Campo').AsString:= Campo;
    cmdBitacora.ParamByName('ValorAnterior').AsString:= ValorAnterior;
    cmdBitacora.ParamByName('ValorNuevo').AsString:= ValorNuevo;
    cmdBitacora.ParamByName('Fecha').AsDateTime:= Now;

    cmdBitacora.Execute;
    Result:= True;
  Except
    
  End;
end;

procedure TServiceFlotillas.InsertaFacturaElectronica(const FacturaElectronicaID: Integer; const CadenaOriginal: Widestring; const SelloDigital: Widestring; 
const FacturaID: Integer; const Vigencia: Boolean; const Enviado: Boolean; const NoCertificado: AnsiString;
const NoAprobacion: AnsiString; const FechaAprobacion: DateTime);
var
  cmd:IDASQLCommand;
begin
  cmd:=Schema.NewCommand(Connection, 'spInsertaFCTELECTRONICA');
  cmd.ParamByName('FacturaElectornicaID').AsInteger:= Folio('FacturaElectronicaID','');
  cmd.ParamByName('CadenaOriginal').AsWideString:= CadenaOriginal;
  cmd.ParamByName('SelloDigital').AsWideString:= SelloDigital;
  cmd.ParamByName('FacturaID').AsInteger:= FacturaID;
  cmd.ParamByName('Vigencia').AsBoolean:= Vigencia;
  cmd.ParamByName('Enviado').AsBoolean:= Enviado;
  cmd.ParamByName('NoCertificado').AsString:= NoCertificado;
  cmd.ParamByName('Noaprobacion').AsString:= NoAprobacion;
  cmd.ParamByName('FechaAprobacion').AsDateTime:= FechaAprobacion;
  cmd.Execute;
end;

function TServiceFlotillas.IVAEstacion(const EstacionID: Integer): Double;
var
  ds: IDADataset;
begin
  ds:=Schema.NewDataset(Connection, 'spIVAEstacion');
  ds.ParamByName('EstacionID').AsInteger:=EstacionID;
  ds.Open;
  Result:=ds.FieldByName('IVA').AsFloat;
  ds.Close;
end;

function TServiceFlotillas.Login(const Usuario, Clave: String): TLoginInfoF;
var
  DataSet, Permisos: IDADataSet;
begin
  Result:=TLoginInfoF.Create;
  DataSet:=Schema.NewDataset(Connection, 'spValidaUsuario');
  DataSet.ParamByName('Usuario').AsString:=Usuario;
  DataSet.ParamByName('Clave').AsString:=Clave;
  DataSet.Open;
  if not DataSet.IsEmpty then
  begin
    Result.Valida:=True;
    Result.EmpleadoID:=DataSet.FieldByName('UsuarioID').AsInteger;
    Result.NombreEmpleado:=DataSet.FieldByName('Nombre').AsString;
    Permisos:=Schema.NewDataset(Connection, 'spAccesos');
    Permisos.ParamByName('UsuarioID').AsInteger:=Result.EmpleadoID;
    Permisos.Open;
    while not Permisos.EOF do
    begin
      with Result.Accesos.Add do
      begin
        OpcionID:=Permisos.FieldByName('OpcionID').AsInteger;
        Nombre:=Permisos.FieldByName('Descripcion').AsString;
      end;
      Permisos.Next;
    end;
    Permisos.Close;
  end
  else
  begin
    Result.Valida:=False;
    Result.EmpleadoID:=0;
    Result.NombreEmpleado:='';
  end;
  DataSet.Close;
end;

function TServiceFlotillas.ModificarFolioActual(const Campo, Serie: string;
  const FolioNew: Integer): string;
var
  ds: IDADataset;
begin
  ds:=Schema.NewDataset(Connection, 'spModificaFolioFactura');
  ds.ParamByName('Campo').AsString:=Campo;
  ds.ParamByName('Serie').AsString:=Serie;
  ds.ParamByName('Folio').AsInteger:=FolioNew;
  ds.Open;
  Result:=ds.FieldByName('Resultado').AsString;
  ds.Close;
end;

function TServiceFlotillas.NombreProducto(ProductoID: Integer): String;
var
  ds: IDADataset;
begin
  ds:=Schema.NewDataset(Connection, 'spNombreProducto');
  ds.ParamByName('ProductoID').AsInteger:=ProductoID;
  ds.Open;
  Result:=ds.FieldByName('Descripcion').AsString;
  ds.Close;
end;

function TServiceFlotillas.ObtenCuponValido(const Barras: String; const Grupo: Integer; const CuponAutoriza: TAutoriza): TCuponValido;
var
  DataSet :    IDADataset;

  DS :    IDADataset;
  Autorizacion:TAutoriza;
  ABarras: String;
begin
  ABarras:=Barras;
  Result:= TCuponValido.Create();
  Autorizacion:=TAutoriza.Create();
  if Length(ABarras) <= 10 then
     ABarras:=IntToStr(ClaveToID(ABarras));

  DataSet:= Schema.NewDataset(Connection, 'spObtenCuponValido');
  DataSet.ParamByName('Barras').AsString:= ABarras;
  DataSet.Open;
  Result.MsnError:= 'CODIGO DE CUPON NO EXISTE';
  Result.Valido:=False;

  ////VALIDA QUE EL CUPON PUEDA SER CONSUMIDO EN PISO////
  if CUPONAUTORIZA.Referencia <> 'CAJA' then
  BEGIN
  
  DS:= Schema.NewDataset(Connection, 'spTipoCupon');
  DS.ParamByName('CUPONID').AsString:= ABarras;
  DS.Open;

  if not DS.IsEmpty then
  begin
    if DS.FieldByName('TipoCupon').AsBoolean then
    begin
       Result.MsnError:= 'ESTE CUPON NO PUEDE SER CONSUMIDO EN PISO';
       Result.Valido:=False;
       Exit;
    end;
  end;

  END;
  ///////////////////////////////////////////////////////

  if not DataSet.IsEmpty then
  begin
    if Grupo = 0 then
      Result.Grupo:=Folio('Grupo', '')
    else
      Result.Grupo:=Grupo;
    Result.CuponID:= DataSet.FieldByName('CuponID').AsInteger;
    Result.Importe:= DataSet.FieldByName('Importe').AsCurrency;
    Result.Status:=  DataSet.FieldByName('Status').AsString;
    Result.Referencia:= DataSet.FieldByName('Barras').AsString;
    Result.Nombre:=  DataSet.FieldByName('Nombre').AsString;
    Result.RazonSocial:= DataSet.FieldByName('RazonSocial').AsString;
    Result.Domicilio:= DataSet.FieldByName('Domicilio').AsString;
    Result.RFC:= DataSet.FieldByName('RFC').AsString;
    Result.CuentaContable:= DataSet.FieldByName('CuentaContable').AsString;
    Result.TarjetaID:= DataSet.FieldByName('TarjetaID').AsInteger;
    Result.ClienteID:= DataSet.FieldByName('ClienteID').AsInteger;
    Result.VehiculoID:= 0;
    Result.GasolineroID:= DataSet.FieldByName('GasolineroID').AsInteger;
    Result.MsnError:='';

    if Result.Status <> 'A' then
       Result.MsnError:= 'ESTE CUPON YA FUE CONSUMIDO';

    if Result.Status = 'I' then
       Result.MsnError:= 'ESTE CUPON FUE CANCELADO';

    if (CuponAutoriza.ClienteID <> 0) and (CuponAutoriza.ClienteID <> Result.ClienteID) then
      Result.MsnError:= 'EL CUPON NO ES^DEL MISMO CLIENTE';

    if BuscaAutorizacion(Result.Referencia) then
       Result.MsnError:= 'CUPON EN PROCESO DE CARGA';

    if Trunc(DataSet.FieldByName('FechaValido').AsDateTime) < Trunc(Now) then
      Result.MsnError:= 'EL CUPON HA CADUCADO^ ^VERIFIQUE FECHA^DE VENCIMIENTO';

    if Result.MsnError = '' then
    begin
       Result.Valido:=True;
       Autorizacion.AutorizacionID:= Folio('AutorizacionID','');
       Autorizacion.Fecha:= Now;
       Autorizacion.Importe:= DataSet.FieldByName('Importe').AsCurrency;
       Autorizacion.Cantidad:= 0;
       Autorizacion.ImporteCantidad:= 'I';
       Autorizacion.PosicionCarga:= CuponAutoriza.PosicionCarga;
       Autorizacion.Referencia:= Result.Referencia;
       Autorizacion.EstacionID:= CuponAutoriza.EstacionID;
       Autorizacion.VehiculoID:= Result.CuponID;
       Autorizacion.ClienteID:= Result.Grupo;
       Autorizacion.Tipo:= 2;

       if not(GuardaAutorizacion(Autorizacion)) then
          Result.MsnError:= 'ERROR AL SOLIICTAR^LA AUTORIZACION';
    end;
  end;
end;

function TServiceFlotillas.PrecioProducto(const ProductoID: Integer): Double;
var
  ds: IDADataset;
begin
  ds:=Schema.NewDataset(Connection, 'spPrecioProducto');
  ds.ParamByName('ProductoID').AsInteger:=ProductoID;
  ds.Open;
  Result:=ds.FieldByName('Precio').AsFloat;
  ds.Close;
end;

function TServiceFlotillas.QuemarCupon(const Consumo: TConsumo; const Barras: String): Boolean;
var
  cmd: IDASQLCommand;
begin
  if Consumo.Importe < 1 then
  begin
    Result:=True;
    Exit;
  end;
  cmd:= Schema.NewCommand(Connection, 'spModificaCupon');
  Result:= False;
  try
    GuardarConsumo(Consumo);
    cmd.ParamByName('Barras').AsString:= Barras;
    cmd.ParamByName('EstacionID').AsInteger:=Consumo.EstacionID;
    cmd.ParamByName('TurnoID').AsInteger:=Consumo.Turno;
    cmd.ParamByName('BombaID').AsInteger:=Consumo.PosicionCarga;
    cmd.ParamByName('FechaCarga').AsDateTime:=Consumo.FechaCarga;
    cmd.ParamByName('Secuencia').AsInteger:=Consumo.SecuenciaVenta;
    cmd.ParamByName('Importe').AsFloat:=Consumo.Importe;
    cmd.Execute;
    CancelaGrupo(StrToInt(Barras));
    Result:= True;
  except
  end;
end;

function TServiceFlotillas.QuemarCupon_Manual(const Consumo: TConsumo;
  const Barras: String): Boolean;
var
  cmd : IDASQLCommand;
  ds: IDADataset;
begin
  cmd:= Schema.NewCommand(Connection, 'spModificaCupon');
  ds:= Schema.NewDataset(Connection, 'obtenProducto');

  ds.ParamByName('ProductoID').AsInteger:=Consumo.ProductoID;
  ds.Open;

  if not ds.EOF then
  begin
     Consumo.Precio:= ds.FieldByName('Precio').AsFloat;
     Consumo.IEPS  := ds.FieldByName('IEPS').AsFloat;
     Consumo.ImpuestoPorcentaje := ds.FieldByName('PorcentajeImpuesto').AsInteger;
     Consumo.ImpuestoImporte:=Decimales(Consumo.Importe - Decimales(Consumo.Importe / (1 + (Consumo.ImpuestoPorcentaje / 100)), 2), 2);
  end;

  GuardarConsumo(Consumo);

  cmd.ParamByName('Barras').AsString:= Barras;
  cmd.ParamByName('EstacionID').AsInteger:=Consumo.EstacionID;
  cmd.ParamByName('TurnoID').AsInteger:=Consumo.Turno;
  cmd.ParamByName('BombaID').AsInteger:=Consumo.PosicionCarga;
  cmd.ParamByName('FechaCarga').AsDateTime:=Consumo.FechaCarga;
  cmd.ParamByName('Secuencia').AsInteger:=Consumo.SecuenciaVenta;
  cmd.ParamByName('Importe').AsFloat:=Consumo.Importe;
  cmd.Execute;
  CancelaGrupo(StrToInt(Barras));
  Result:= True;
end;

function TServiceFlotillas.REDAutorizaciones(const EstacionID,
  BombaID: Integer): AAutorizacion;
var
  ds: IDADataset;
begin
  Result:=AAutorizacion.Create;
  ds:=Schema.NewDataset(Connection, 'spREDAutorizaciones');
  ds.ParamByName('EstacionID').AsInteger:=EstacionID;
  ds.ParamByName('BombaID').AsInteger:=BombaID;
  ds.Open;
  while not ds.EOF do
  begin
    with Result.Add do
    begin
      AutorizacionID:=ds.FieldByName('AutorizacionID').AsInteger;
      Referencia:=ds.FieldByName('Referencia').AsString;
      Importe:=ds.FieldByName('Importe').AsFloat;
      ImporteCantidad:=ds.FieldByName('Nombre').AsString;
      Fecha:=ds.FieldByName('Fecha').AsDateTime;
      GasolineroID:=ds.FieldByName('ProductoAutorizado').AsInteger;
    end;                      
    ds.Next;
  end;
  ds.Close;
end;

function TServiceFlotillas.REDConsumo(const EstacionID: Integer; const Serie: string; const TicketID, AutorizacionID: Integer;
  const Importe: Double; const ProductoID: Integer): TDatosTicketConsumo;
var
  ds: IDADataset;
  Fecha: TDateTime;
  Aux: TConsumo;
begin
  Fecha:=Now;
  Aux:=TConsumo.Create;
  Result:=TDatosTicketConsumo.Create;
  ds:=Schema.NewDataset(Connection, 'spAutorizacion');
  ds.ParamByName('AutorizacionID').AsInteger:=AutorizacionID;
  ds.Open;
  try
    if not ds.IsEmpty then
    begin
      Aux.SecuenciaVenta:=TicketID;
      Aux.Serie:=Serie;
      Aux.EstacionID:=EstacionID;
      Aux.FechaMovimiento:=Trunc(Fecha);
      Aux.FechaCarga:=Fecha;
      Aux.Ejercicio:=StrToInt(FormatDateTime('yyyy', Fecha));
      Aux.Periodo:=StrToInt(FormatDateTime('m', Fecha));
      Aux.Dia:=StrToInt(FormatDateTime('d', Fecha));
      Aux.Turno:=0;
      Aux.Kilometraje:=ds.FieldByName('Odometro').AsInteger;
      Aux.Referencia:=ds.FieldByName('Referencia').AsString;
      Aux.Tarjeta:=Aux.Referencia;
      Aux.PosicionCarga:=ds.FieldByName('PosicionCarga').AsInteger;
      Aux.Cantidad:=Decimales(Importe / PrecioProducto(ProductoID), 3);
      Aux.Precio:=PrecioProducto(ProductoID);
      Aux.Importe:=Importe;
      Aux.ManualAutomatico:='A';
      Aux.Facturado:=0;
      Aux.EnIngresos:=0;
      Aux.Auditado:=0;
      Aux.FacturaID:=0;
      Aux.ProductoID:=ProductoID;
      Aux.GasolineroID:=GasolineroID;
      Aux.ClienteID:=ds.FieldByName('ClienteID').AsInteger;
      Aux.VehiculoID:=ds.FieldByName('VehiculoID').AsInteger;
      Aux.IEPS:=IEPS(ProductoID);
      Aux.ImpuestoPorcentaje:=IVAEstacion(EstacionID);
      Aux.ImpuestoImporte:=Decimales(Impuesto(Aux.Importe, Aux.ImpuestoPorcentaje), 2);
      GuardarConsumo(Aux);
      ActualizaHistorial(Aux);
      EliminaAutorizacion(AutorizacionID);
      Result.Secuencia:=TicketID;
      Result.BombaID:=Aux.PosicionCarga;
      Result.Fecha:=Fecha;
      Result.NombreProducto:=NombreProducto(ProductoID);
      Result.Cliente:=ds.FieldByName('Nombre').AsString;
      Result.Identificacion:=ds.FieldByName('Identificacion').AsString + ' ' + ds.FieldByName('VehiculoNombre').AsString;
      Result.Referencia:=Aux.Referencia;
      Result.Odometro:=Aux.Kilometraje;
      Result.Volumen:=Aux.Cantidad;
      Result.Precio:=Aux.Precio;
      Result.Importe:=Aux.Importe;
      Result.IVA:=Aux.ImpuestoPorcentaje;
    end;
  finally
    Aux.Free;
  end;
end;

function TServiceFlotillas.ReferenciaTarjeta(const VehiculoID: Integer): string;
Var
  ds: IDADataset;
begin
  ds:=Schema.NewDataset(Connection, 'ReferenciaTarjeta');
  ds.ParamByName('VehiculoID').AsInteger:=VehiculoID;
  ds.Open;
  Result:='';
  if not ds.IsEmpty then
  begin
    Result:=FormatFloat('0000', ds.FieldByName('FormaCompraID').AsInteger);
    Result:=Result + FormatFloat('0000', ServerDataModule.GasolineroID);
    Result:=Result + FormatFloat('00000000', VehiculoID);
    end;
end;

function TServiceFlotillas.RegistraPagosFaltantes(
  const SaldoDocumentoID: Integer; const Fecha, FechaVencimiento: DateTime;
  const Cargo, Abono: Double; const Referencia: AnsiString; const ClienteID,
  MovimientoID, ReciboID, BancoID, Folio, Ejercicio, Periodo: Integer;
  const Cheque: AnsiString; const Importe: Double;
  const CuentaContableCliente: AnsiString; const UsuarioID, EstacionID: Integer): Integer;
var
  ds: IDADataset;
begin
  Result:= -1;
  ds:=Schema.NewDataset(Connection, 'spRegistraPagosFaltantes');
  ds.ParamByName('SaldoDocumentoID').AsInteger:=SaldoDocumentoID;
  ds.ParamByName('Fecha').AsDateTime:=Fecha;
  ds.ParamByName('FechaVencimiento').AsDateTime:= FechaVencimiento;
  ds.ParamByName('Cargo').AsFloat:= Cargo;
  ds.ParamByName('Abono').AsFloat:= Abono;
  ds.ParamByName('Referencia').AsString:= Referencia;
  ds.ParamByName('ClienteID').AsInteger:= ClienteID;
  ds.ParamByName('MovimientoID').AsInteger:= MovimientoID;
  ds.ParamByName('ReciboID').AsInteger:= ReciboID;
  ds.ParamByName('BancoID').AsInteger:= BancoID;
  ds.ParamByName('Folio').AsInteger:= Folio;
  ds.ParamByName('Ejercicio').AsInteger:= Ejercicio;
  ds.ParamByName('Periodo').AsInteger:= Periodo;
  ds.ParamByName('Cheque').AsString:= Cheque;
  ds.ParamByName('Importe').AsFloat:= Importe;
  ds.ParamByName('CuentaContableCliente').AsString:= CuentaContableCliente;
  ds.ParamByName('UsuarioID').AsInteger:= UsuarioID;
  ds.ParamByName('EstacionID').AsInteger:= EstacionID;
  ds.Open;

  Result:=ds.FieldByName('Result').AsInteger;
  
  ds.Close;
end;

function TServiceFlotillas.Rendimiento(const EstacionID,
  TicketID: Integer): Double;
var
  ds: IDADataset;
begin
  ds:=Schema.NewDataset(Connection, 'spRendimiento');
  ds.ParamByName('EstacionID').AsInteger:=EstacionID;
  ds.ParamByName('TicketID').AsInteger:=TicketID;
  ds.Open;
  Result:=ds.FieldByName('Rendimiento').AsFloat;
  ds.Close;
end;

function TServiceFlotillas.Series(const Campo: String): String;
var
  MiDataSet: IDADataset;
  Aux: TStrings;
begin
  MiDataSet:=Schema.NewDataset(Connection, 'ObtenSerie');
  MiDataSet.ParamByName('Campo').AsString:=Campo;
  //MiDataSet.ParamByName('Identificador').AsInteger:=Identificador;
  MiDataSet.Open;
  Aux:=TStringList.Create;
  while not MiDataSet.EOF do
  begin
    Aux.Add(MiDataSet.FieldByName('Serie').AsString);
    MiDataSet.Next;
  end;    // while
  Result:=Aux.Text;
  Aux.Free;
end;

function TServiceFlotillas.StatusCupon(const Codigo: String): String;
var
  ds: IDADataset;
begin
  ds:=Schema.NewDataset(Connection, 'spStatusCuponCancelar');
  ds.ParamByName('Codigo').AsString:=Codigo;
  ds.Open;
  Result:=ds.FieldByName('Status').AsString;
end;

function TServiceFlotillas.TarjetaConsumo(const Tarjeta: string;
  const Consumo: TConsumo): Boolean;
var
  DataSet, DSGOB: IDADataSet;
  aBarras: String;
begin

  if Length(Tarjeta) <= 10 then
  begin
     ABarras:=IntToStr(ClaveToID(Tarjeta));
     Consumo.Tarjeta:= ABarras;
  end;

  try
  DataSet:= Schema.NewDataset(Connection, 'spBuscaReferencia');
  DataSet.ParamByName('Referencia').AsString:= Consumo.Tarjeta;
  DataSet.Open;
  finally
     Consumo.VehiculoID:= DataSet.FieldByName('VehiculoID').AsInteger;
  end;

  Result:=False;
  try

{pla_GOB}//--obten IDRFID------------------------------------------------------}
    if (ServerDataModule.AUTORIZAGOB = 'S') AND (copy(Consumo.Tarjeta,1,1) <> '0') then
    begin
    DSGOB:= Schema.NewDataset(Connection, 'spDatosVehiculoGOB');
    DSGOB.ParamByName('IDRFID').AsString:= Consumo.Tarjeta;
    DSGOB.ParamByName('NUMEROECONOMICO').AsString:='';
    DSGOB.Open;
    if DSGOB.IsEmpty then
    begin
       Consumo.VehiculoID:= -100;
       Consumo.ClienteID:= -100;
    end else Consumo.VehiculoID:= DSGOB.FieldByName('VehiculoID').AsInteger;                                         
    end;
{pla_GOB}//--obten IDRFID------------------------------------------------------}
    Result:=GuardarConsumo(Consumo);
{pla_GOB}//--obten IDRFID------------------------------------------------------}
    if (ServerDataModule.AUTORIZAGOB = 'S') AND (copy(Consumo.Tarjeta,1,1) <> '0') then
    Result:= GuardarConsumoGOB(Consumo);
{pla_GOB}//--------------------------------------------------------------------}

    if (Result) and (Tarjeta <> '') then
    begin
      ActualizaHistorial(Consumo);
      //EliminaAutorizacionVehiculo(Consumo.ClienteID, Consumo.VehiculoID, Consumo.GasolineroID);
      EliminaAutorizacionVehiculo(Consumo.Tarjeta);
    end;
  except
  end;
end;

function TServiceFlotillas.TarjetasLLave: aTarjetaLlave;
var
  ds: IDADataset;
begin
  ds:=Schema.NewDataset(Connection, 'spTarjetasLLave');
  ds.Open;
  Result:=aTarjetaLlave.Create;
  while not ds.EOF do
  begin
    with Result.Add do
    begin
      UsuarioID:=ds.FieldByName('UsuarioID').AsInteger;
      Nombre:=ds.FieldByName('Nombre').AsString;
      Tarjeta:=ds.FieldByName('Tarjeta').AsString;
      Activo:=ds.FieldByName('Activo').AsBoolean;
      EstacionID:=ds.FieldByName('EstacionID').AsInteger;
    end;
    ds.Next;
  end;
end;

function TServiceFlotillas.TiempoAire(const EstacionID, BombaID: Integer;
  const Telefono: string; const ProveedorID: Integer; const Importe: Double;
  const CajaID: Integer; const LLave: string): TTiempoAire;
var
  cmd: IDASQLCommand;
  Aux, Tiempo: String;
  HTTP: TIdHTTP;
  Params: TStringList;
  Temp: TStrings;
  Fecha: TDateTime;
  Consumo: TConsumo;
  ds: IDADataset;
  MiSaldo: Double;
begin
  Result:=TTiempoAire.Create;
  Result.Accepted:=False;
  Result.Notes:='ERROR AL PROCESAR LA RECARGA DE TIEMPO AIRE';
  Result.Proveedor:=ProveedorID;
  Result.Telefono:=Telefono;
  Result.Importe:=Importe;
  Fecha:=Now;
  ds:=Schema.NewDataset(Connection, 'spSaldoTiempoAire');
  ds.ParamByName('EstacionID').AsInteger:=EstacionID;
  ds.Open;
  MiSaldo:=ds.FieldByName('Saldo').AsFloat;
  ds.Close;
  if Importe > MiSaldo then
  begin
    Result.Notes:='ERROR AL PROCESAR LA RECARGA DE TIEMPO AIRE [SALDO INSUFICIENTE]';
    Exit;
  end;

  Tiempo:=FormatDateTime('yyyymmddhhnnss"_"zzz"00"', Fecha);
  Params := TStringList.Create;
  Params.Values['accepted']:='False';
  Params.Values['notes']:=Result.Notes;
  Params.Clear;
  Temp:=TStringList.Create;
  HTTP:=TIdHTTP.Create;
  Consumo:=TConsumo.Create;
  cmd:=Schema.NewCommand(Connection, 'Insert_dbo TiempoAire');
  cmd.ParamByName('TiempoAireID').AsInteger:=Folio('TiempoAireID', '');
  cmd.ParamByName('Fecha').AsDateTime:=Fecha;
  cmd.ParamByName('Telefono').AsString:=Telefono;
  cmd.ParamByName('Importe').AsFloat:=Importe;
  cmd.ParamByName('ProveedorID').AsInteger:=ProveedorID;
  cmd.ParamByName('CajaID').AsInteger:=CajaID;
  cmd.ParamByName('EstacionID').AsInteger:=EstacionID;
  cmd.ParamByName('BombaID').AsInteger:=BombaID;
  cmd.ParamByName('TimeStampID').AsString:=Tiempo;
  cmd.ParamByName('Trans').AsString:='';
  cmd.ParamByName('TransID').AsString:='';
  cmd.ParamByName('LLave').AsString:=LLave;
  cmd.ParamByName('Accepted').AsBoolean:=False;
  try
    HTTP.Request.ContentType := 'application/x-www-form-urlencoded';
    Params.Values['eUser']:=LeerRegistro('TA_eUser', '');
    Params.Values['ePassword']:=LeerRegistro('TA_ePassword', '');
    Params.Values['serial']:=LeerRegistro('TA_serial', '');
    Params.Values['ptid']:=LeerRegistro('TA_ptid', '');
    Params.Values['tellerLogin']:=LeerRegistro('TA_tellerLogin', '');
    Params.Values['idMaster']:=LeerRegistro('TA_idMaster', '');
    Params.Values['idProvider']:=IntToStr(ProveedorID);
    Params.Values['topUpTelephone']:=Telefono;
    Params.Values['amount']:=FormatFloat('#0', Importe);
    Params.Values['posTimeStamp']:=Tiempo;
    Aux:=HTTP.Post('http://recargaelectronica.puntoclave.com.mx/TelcoWS/service1.asmx/TopUpPurchase', Params);

    Temp.Text:=Aux;
    Temp.SaveToFile('TiempoAire.log');
    Params.Assign(LeerXML(Aux));
    if Params.Values['accepted'] = 'True' then
    begin
      Result.Accepted:=True;
      Result.TransID:=Params.Values['transID'];
      Result.idTrans:=Params.Values['idTrans'];
      Result.Notes:=Params.Values['notes'];
      Result.Instructions:=Params.Values['instructions'];
      cmd.ParamByName('Trans').AsString:=Params.Values['idTrans'];
      cmd.ParamByName('TransID').AsString:=Params.Values['transID'];
      cmd.ParamByName('Accepted').AsBoolean:=True;
      Consumo.SecuenciaVenta:=Folio('FolioOtrosID', '');
      Consumo.EstacionID:=EstacionID;
      Consumo.FechaMovimiento:=Trunc(Fecha);
      Consumo.FechaCarga:=Fecha;
      Consumo.Ejercicio:=StrToInt(FormatDateTime('yyyy', Fecha));
      Consumo.Periodo:=StrToInt(FormatDateTime('m', Fecha));
      Consumo.Dia:=StrToInt(FormatDateTime('d', Fecha));
      Consumo.Turno:=0;
      Consumo.Kilometraje:=0;
      Consumo.Referencia:=Telefono;
      Consumo.Tarjeta:=Telefono;
      Consumo.PosicionCarga:=BombaID;
      Consumo.Cantidad:=1;
      Consumo.Precio:=Importe;
      Consumo.Importe:=Importe;
      Consumo.ImpuestoPorcentaje:=15;
      Consumo.ImpuestoImporte:=Decimales(Impuesto(Importe, 15), 2);
      Consumo.CuentaContable:='';
      Consumo.ManualAutomatico:='A';
      Consumo.Facturado:=0;
      Consumo.EnIngresos:=0;
      Consumo.Auditado:=0;
      Consumo.FacturaID:=0;
      case ProveedorID of
        1: Consumo.ProductoID:=1001;
        2: Consumo.ProductoID:=1002;
        3: Consumo.ProductoID:=1003;
      end;
      Consumo.GasolineroID:=ServerDataModule.GasolineroID;
      Consumo.IEPS:=0;
      Consumo.ClienteID:=4;
      Consumo.VehiculoID:=0;
      Consumo.Serie:='TA';
      GuardarConsumo(Consumo)
    end;
  finally
    cmd.Execute;
    Params.Free;
    Temp.Free;
    HTTP.Free;
    Consumo.Free;
  end;
end;

function TServiceFlotillas.ValidaConsumo(const Consumo: TConsumo): Integer;
var
  ds: IDADataset;
begin
  Result:=1;
  ds:=Schema.NewDataset(Connection, 'spValidaConsumo');
  ds.ParamByName('SecuenciaVenta').AsInteger:=Consumo.SecuenciaVenta;
  ds.ParamByName('Serie').AsString:=Consumo.Serie;
  ds.ParamByName('EstacionID').AsInteger:=Consumo.EstacionID;
  ds.Open;
  if ds.IsEmpty then
    Result:=0;
  ds.Close;
end;

function TServiceFlotillas.ValidaSecuencias(const EstacionID: Integer;
  const Secuencias: string): string;
var
  Arreglo: TStrings;
  I : Integer;
  S: String;
  ds: IDADataset;
begin
  Arreglo:=TStringList.Create;
  try
    Arreglo.Text:=Secuencias;
    if Arreglo.Count > 0 then
    begin
      S:='';
      for I := 0 to Arreglo.Count - 1 do
        S:= S + Arreglo[I] + ',';
      Delete(S, Length(S), 1);
      S:=Format('Select SecuenciaVenta from consumo where EstacionID = %d and and Serie = ''C'' SecuenciaVenta in (%s)', [EstacionID, S]);
      ds:=Connection.NewDataset(S, 'ValidaSecuencias');
      ds.Open;
      while not ds.EOF do
      begin
        I:=Arreglo.IndexOf(ds.FieldByName('SecuenciaVenta').AsString);
        if I >= 0 then
          Arreglo.Delete(I);
        ds.Next;
      end;
      ds.Close;
      Result:=Arreglo.Text;
    end;
  finally
    Arreglo.Free;
  end;
end;

procedure TServiceFlotillas.VehiculoProducto(const VehiculoID,
  ProductoID: Integer);
var
  cmd: IDASQLCommand;
begin
  cmd:=Schema.NewCommand(Connection, 'Insert_dbo VehiculoProducto');
  cmd.ParamByName('VehiculoID').AsInteger:=VehiculoID;
  cmd.ParamByName('ProductoID').AsInteger:=ProductoID;
  cmd.Execute;
end;

initialization
  TROClassFactory.Create('ServiceFlotillas', Create_ServiceFlotillas, TServiceFlotillas_Invoker);
finalization
end.
