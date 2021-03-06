unit ufrmVehiculo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CustomModule, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinFoggy, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSharp, dxSkinSilver, dxSkinSpringTime,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, cxContainer, Menus, ComCtrls,
  cxListView, StdCtrls, cxButtons, cxCheckBox, cxDropDownEdit, cxCalendar,
  cxDBEdit, cxMaskEdit, cxImageComboBox, cxTextEdit, cxGroupBox, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, cxPC, ExtCtrls, uDAMemDataTable, uDAInterfaces,
  uDADataTable, uDAScriptingProvider, uDACDSDataTable, cxCurrencyEdit;

type
  TfrmVehiculo = class(TfrmCustomModule)
    Panel1: TPanel;
    Panel2: TPanel;
    pgcCatalogo: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    dbgCatalogo: TcxGrid;
    dbgCatalogoDBTableView1: TcxGridDBTableView;
    dbgCatalogoDBTableView1RecID: TcxGridDBColumn;
    dbgCatalogoDBTableView1VehiculoID: TcxGridDBColumn;
    dbgCatalogoDBTableView1DigitoSeguridad: TcxGridDBColumn;
    dbgCatalogoDBTableView1Nombre: TcxGridDBColumn;
    dbgCatalogoDBTableView1Identificacion: TcxGridDBColumn;
    dbgCatalogoDBTableView1Departamento: TcxGridDBColumn;
    dbgCatalogoDBTableView1CuentaContable: TcxGridDBColumn;
    dbgCatalogoDBTableView1CentroCostos: TcxGridDBColumn;
    dbgCatalogoDBTableView1NumeroEconomico: TcxGridDBColumn;
    dbgCatalogoDBTableView1NIP: TcxGridDBColumn;
    dbgCatalogoDBTableView1Estatus: TcxGridDBColumn;
    dbgCatalogoDBTableView1CargasMaximas: TcxGridDBColumn;
    dbgCatalogoDBTableView1Odometro: TcxGridDBColumn;
    dbgCatalogoDBTableView1Firma: TcxGridDBColumn;
    dbgCatalogoDBTableView1Placas: TcxGridDBColumn;
    dbgCatalogoDBTableView1FechaAlta: TcxGridDBColumn;
    dbgCatalogoDBTableView1FechaExpira: TcxGridDBColumn;
    dbgCatalogoDBTableView1FechaBaja: TcxGridDBColumn;
    dbgCatalogoDBTableView1FechaCancelacion: TcxGridDBColumn;
    dbgCatalogoDBTableView1FechaBloqueada: TcxGridDBColumn;
    dbgCatalogoDBTableView1FechaInactiva: TcxGridDBColumn;
    dbgCatalogoDBTableView1Mensaje: TcxGridDBColumn;
    dbgCatalogoDBTableView1LimiteLTTurno: TcxGridDBColumn;
    dbgCatalogoDBTableView1LimiteLTDia: TcxGridDBColumn;
    dbgCatalogoDBTableView1LimiteLTSemana: TcxGridDBColumn;
    dbgCatalogoDBTableView1LimiteLTMes: TcxGridDBColumn;
    dbgCatalogoDBTableView1LimiteMNTurno: TcxGridDBColumn;
    dbgCatalogoDBTableView1LimiteMNDia: TcxGridDBColumn;
    dbgCatalogoDBTableView1LimiteMNSemana: TcxGridDBColumn;
    dbgCatalogoDBTableView1LimiteMNMes: TcxGridDBColumn;
    dbgCatalogoDBTableView1ActualLTTurno: TcxGridDBColumn;
    dbgCatalogoDBTableView1ActualLTDia: TcxGridDBColumn;
    dbgCatalogoDBTableView1ActualLTSemana: TcxGridDBColumn;
    dbgCatalogoDBTableView1ActualLTMes: TcxGridDBColumn;
    dbgCatalogoDBTableView1ActualMNTurno: TcxGridDBColumn;
    dbgCatalogoDBTableView1ActualMNDia: TcxGridDBColumn;
    dbgCatalogoDBTableView1ActualMNSemana: TcxGridDBColumn;
    dbgCatalogoDBTableView1ActualMNMes: TcxGridDBColumn;
    dbgCatalogoDBTableView1ActualCargas: TcxGridDBColumn;
    dbgCatalogoDBTableView1Clasificacion: TcxGridDBColumn;
    dbgCatalogoDBTableView1Generada: TcxGridDBColumn;
    dbgCatalogoDBTableView1Lunes: TcxGridDBColumn;
    dbgCatalogoDBTableView1Martes: TcxGridDBColumn;
    dbgCatalogoDBTableView1Miercoles: TcxGridDBColumn;
    dbgCatalogoDBTableView1Jueves: TcxGridDBColumn;
    dbgCatalogoDBTableView1Viernes: TcxGridDBColumn;
    dbgCatalogoDBTableView1Sabado: TcxGridDBColumn;
    dbgCatalogoDBTableView1Domingo: TcxGridDBColumn;
    dbgCatalogoDBTableView1ClienteID: TcxGridDBColumn;
    dbgCatalogoDBTableView1GasolineroID: TcxGridDBColumn;
    dbgCatalogoLevel1: TcxGridLevel;
    cxTabSheet2: TcxTabSheet;
    cxGroupBox3: TcxGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label10: TLabel;
    cxDBTextEdit10: TcxDBTextEdit;
    cxDBTextEdit11: TcxDBTextEdit;
    cxDBTextEdit14: TcxDBTextEdit;
    cxDBImageComboBox1: TcxDBImageComboBox;
    cxDBImageComboBox2: TcxDBImageComboBox;
    cxGroupBox2: TcxGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBTextEdit3: TcxDBTextEdit;
    cxDBTextEdit4: TcxDBTextEdit;
    cxDBTextEdit5: TcxDBTextEdit;
    cxDBTextEdit6: TcxDBTextEdit;
    cxDBTextEdit7: TcxDBTextEdit;
    cxTabSheet3: TcxTabSheet;
    cxGroupBox4: TcxGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    cxDBDateEdit1: TcxDBDateEdit;
    cxDBDateEdit2: TcxDBDateEdit;
    cxDBDateEdit3: TcxDBDateEdit;
    cxDBDateEdit4: TcxDBDateEdit;
    cxDBDateEdit5: TcxDBDateEdit;
    cxDBDateEdit6: TcxDBDateEdit;
    cxTabSheet4: TcxTabSheet;
    cxGroupBox7: TcxGroupBox;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    TxtMenLitrosH: TcxDBTextEdit;
    TxtSemLitrosH: TcxDBTextEdit;
    TxtDiarioLitrosH: TcxDBTextEdit;
    TxtTurnoLitrosH: TcxDBTextEdit;
    TxtTurnoMNH: TcxDBTextEdit;
    TxtDiarioMNH: TcxDBTextEdit;
    TxtSemMNH: TcxDBTextEdit;
    TxtMenMNH: TcxDBTextEdit;
    TxtCargasDia: TcxDBTextEdit;
    cxGroupBox6: TcxGroupBox;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    TxtTurnoLitrosL: TcxDBTextEdit;
    txtDiarioLitrosL: TcxDBTextEdit;
    TxtSemLitrosL: TcxDBTextEdit;
    TxtMenLitrosL: TcxDBTextEdit;
    TxtMenMNL: TcxDBTextEdit;
    TxtSemMNL: TcxDBTextEdit;
    TxtDiarioMNL: TcxDBTextEdit;
    TxtTurnoMNL: TcxDBTextEdit;
    ChkTTurnoLL: TcxCheckBox;
    ChkDiaLL: TcxCheckBox;
    ChkSemanaLL: TcxCheckBox;
    ChkMesLL: TcxCheckBox;
    ChkTurnoMN: TcxCheckBox;
    ChkDiaMN: TcxCheckBox;
    ChkSemanaMN: TcxCheckBox;
    ChkMesMN: TcxCheckBox;
    cxGroupBox1: TcxGroupBox;
    Label13: TLabel;
    Label64: TLabel;
    Label66: TLabel;
    cxDBDateEdit7: TcxDBDateEdit;
    cxDBDateEdit8: TcxDBDateEdit;
    cxDBTextEdit8: TcxDBTextEdit;
    cxTabSheet5: TcxTabSheet;
    cxGroupBox8: TcxGroupBox;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Chk0Lu: TcxCheckBox;
    Chk1Lu: TcxCheckBox;
    Chk2Lu: TcxCheckBox;
    Chk3Lu: TcxCheckBox;
    Chk4Lu: TcxCheckBox;
    Chk5Lu: TcxCheckBox;
    Chk6Lu: TcxCheckBox;
    Chk7Lu: TcxCheckBox;
    Chk8Lu: TcxCheckBox;
    Chk9Lu: TcxCheckBox;
    Chk10Lu: TcxCheckBox;
    Chk11Lu: TcxCheckBox;
    Chk12Lu: TcxCheckBox;
    Chk13Lu: TcxCheckBox;
    Chk14Lu: TcxCheckBox;
    Chk15Lu: TcxCheckBox;
    Chk16Lu: TcxCheckBox;
    Chk17Lu: TcxCheckBox;
    Chk18Lu: TcxCheckBox;
    Chk19Lu: TcxCheckBox;
    Chk20Lu: TcxCheckBox;
    Chk21Lu: TcxCheckBox;
    Chk22Lu: TcxCheckBox;
    Chk0Ma: TcxCheckBox;
    Chk1Ma: TcxCheckBox;
    Chk2Ma: TcxCheckBox;
    Chk3Ma: TcxCheckBox;
    Chk4Ma: TcxCheckBox;
    Chk5Ma: TcxCheckBox;
    Chk6Ma: TcxCheckBox;
    Chk7Ma: TcxCheckBox;
    Chk8Ma: TcxCheckBox;
    Chk9Ma: TcxCheckBox;
    Chk10Ma: TcxCheckBox;
    Chk11Ma: TcxCheckBox;
    Chk12Ma: TcxCheckBox;
    Chk13Ma: TcxCheckBox;
    Chk14Ma: TcxCheckBox;
    Chk15Ma: TcxCheckBox;
    Chk16Ma: TcxCheckBox;
    Chk17Ma: TcxCheckBox;
    Chk18Ma: TcxCheckBox;
    Chk19Ma: TcxCheckBox;
    Chk20Ma: TcxCheckBox;
    Chk21Ma: TcxCheckBox;
    Chk22Ma: TcxCheckBox;
    Chk0Me: TcxCheckBox;
    Chk1Me: TcxCheckBox;
    Chk2Me: TcxCheckBox;
    Chk3Me: TcxCheckBox;
    Chk4Me: TcxCheckBox;
    Chk5Me: TcxCheckBox;
    Chk6Me: TcxCheckBox;
    Chk7Me: TcxCheckBox;
    Chk8Me: TcxCheckBox;
    Chk9Me: TcxCheckBox;
    Chk10Me: TcxCheckBox;
    Chk11Me: TcxCheckBox;
    Chk12Me: TcxCheckBox;
    Chk13Me: TcxCheckBox;
    Chk14Me: TcxCheckBox;
    Chk15Me: TcxCheckBox;
    Chk16Me: TcxCheckBox;
    Chk17Me: TcxCheckBox;
    Chk18Me: TcxCheckBox;
    Chk19Me: TcxCheckBox;
    Chk20Me: TcxCheckBox;
    Chk21Me: TcxCheckBox;
    Chk22Me: TcxCheckBox;
    Chk0Vi: TcxCheckBox;
    Chk1Vi: TcxCheckBox;
    Chk2Vi: TcxCheckBox;
    Chk3Vi: TcxCheckBox;
    Chk4Vi: TcxCheckBox;
    Chk5Vi: TcxCheckBox;
    Chk6Vi: TcxCheckBox;
    Chk7Vi: TcxCheckBox;
    Chk8Vi: TcxCheckBox;
    Chk9Vi: TcxCheckBox;
    Chk10Vi: TcxCheckBox;
    Chk11Vi: TcxCheckBox;
    Chk12Vi: TcxCheckBox;
    Chk13Vi: TcxCheckBox;
    Chk14Vi: TcxCheckBox;
    Chk15Vi: TcxCheckBox;
    Chk16Vi: TcxCheckBox;
    Chk17Vi: TcxCheckBox;
    Chk18Vi: TcxCheckBox;
    Chk19Vi: TcxCheckBox;
    Chk20Vi: TcxCheckBox;
    Chk21Vi: TcxCheckBox;
    Chk22Vi: TcxCheckBox;
    Chk0Sa: TcxCheckBox;
    Chk1Sa: TcxCheckBox;
    Chk2Sa: TcxCheckBox;
    Chk3Sa: TcxCheckBox;
    Chk4Sa: TcxCheckBox;
    Chk5Sa: TcxCheckBox;
    Chk6Sa: TcxCheckBox;
    Chk7Sa: TcxCheckBox;
    Chk8Sa: TcxCheckBox;
    Chk9Sa: TcxCheckBox;
    Chk10Sa: TcxCheckBox;
    Chk11Sa: TcxCheckBox;
    Chk12Sa: TcxCheckBox;
    Chk13Sa: TcxCheckBox;
    Chk14Sa: TcxCheckBox;
    Chk15Sa: TcxCheckBox;
    Chk16Sa: TcxCheckBox;
    Chk17Sa: TcxCheckBox;
    Chk18Sa: TcxCheckBox;
    Chk19Sa: TcxCheckBox;
    Chk20Sa: TcxCheckBox;
    Chk21Sa: TcxCheckBox;
    Chk22Sa: TcxCheckBox;
    Chk0Do: TcxCheckBox;
    Chk1Do: TcxCheckBox;
    Chk2Do: TcxCheckBox;
    Chk3Do: TcxCheckBox;
    Chk4Do: TcxCheckBox;
    Chk5Do: TcxCheckBox;
    Chk6Do: TcxCheckBox;
    Chk7Do: TcxCheckBox;
    Chk8Do: TcxCheckBox;
    Chk9Do: TcxCheckBox;
    Chk10Do: TcxCheckBox;
    Chk11Do: TcxCheckBox;
    Chk12Do: TcxCheckBox;
    Chk13Do: TcxCheckBox;
    Chk14Do: TcxCheckBox;
    Chk15Do: TcxCheckBox;
    Chk16Do: TcxCheckBox;
    Chk17Do: TcxCheckBox;
    Chk18Do: TcxCheckBox;
    Chk19Do: TcxCheckBox;
    Chk20Do: TcxCheckBox;
    Chk21Do: TcxCheckBox;
    Chk22Do: TcxCheckBox;
    Chk0Ju: TcxCheckBox;
    Chk1Ju: TcxCheckBox;
    Chk2Ju: TcxCheckBox;
    Chk3Ju: TcxCheckBox;
    Chk4Ju: TcxCheckBox;
    Chk5Ju: TcxCheckBox;
    Chk6Ju: TcxCheckBox;
    Chk7Ju: TcxCheckBox;
    Chk8Ju: TcxCheckBox;
    Chk9Ju: TcxCheckBox;
    Chk10Ju: TcxCheckBox;
    Chk11Ju: TcxCheckBox;
    Chk12Ju: TcxCheckBox;
    Chk13Ju: TcxCheckBox;
    Chk14Ju: TcxCheckBox;
    Chk15Ju: TcxCheckBox;
    Chk16Ju: TcxCheckBox;
    Chk17Ju: TcxCheckBox;
    Chk18Ju: TcxCheckBox;
    Chk19Ju: TcxCheckBox;
    Chk20Ju: TcxCheckBox;
    Chk21Ju: TcxCheckBox;
    Chk22Ju: TcxCheckBox;
    Chk23Do: TcxCheckBox;
    Chk23Sa: TcxCheckBox;
    Chk23Vi: TcxCheckBox;
    Chk23Ju: TcxCheckBox;
    Chk23Me: TcxCheckBox;
    Chk23Ma: TcxCheckBox;
    Chk23Lu: TcxCheckBox;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cdsProductos: TDACDSDataTable;
    dsProductos: TDADataSource;
    cdsVehiculoProducto: TDACDSDataTable;
    dsVehiculoProducto: TDADataSource;
    cdsTipoReferencia: TDACDSDataTable;
    dsTipoReferencia: TDADataSource;
    cdsReferencia: TDACDSDataTable;
    dsReferencia: TDADataSource;
    cdsCatalogo: TDAMemDataTable;
    dsCatalogo: TDADataSource;
    Label65: TLabel;
    edtCliente: TcxCurrencyEdit;
    btnBuscaCliente: TcxButton;
    cxGroupBox9: TcxGroupBox;
    ChkOdometro: TcxDBCheckBox;
    ChkFirma: TcxDBCheckBox;
    ChkPlacas: TcxDBCheckBox;
    procedure btnBuscaClienteClick(Sender: TObject);
    procedure edtClienteExit(Sender: TObject);
    procedure cdsCatalogoNewRecord(DataTable: TDADataTable);
    procedure LlenarHorarios;
    procedure GuardarHorarios;
    procedure ChecarLimites;
    procedure ChkTTurnoLLClick(Sender: TObject);
    procedure ChkDiaLLClick(Sender: TObject);
    procedure ChkSemanaLLClick(Sender: TObject);
    procedure ChkMesLLClick(Sender: TObject);
    procedure ChkTurnoMNClick(Sender: TObject);
    procedure ChkDiaMNClick(Sender: TObject);
    procedure ChkSemanaMNClick(Sender: TObject);
    procedure ChkMesMNClick(Sender: TObject);
    procedure cdsCatalogoAfterScroll(DataTable: TDADataTable);
    procedure cdsCatalogoBeforePost(DataTable: TDADataTable);
    procedure Label33Click(Sender: TObject);
    procedure Label40Click(Sender: TObject);
    procedure dbgCatalogoDBTableView1DblClick(Sender: TObject);
    procedure dbgCatalogoDBTableView1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure dsCatalogoStateChange(Sender: TObject);
    procedure cdsCatalogoAfterPost(DataTable: TDADataTable);
    procedure Chk0LuClick(Sender: TObject);
  private
    { Private declarations }
    Clasificacion: Integer;
    procedure BuscarCliente;
    function MiCheckBox(Cual: Integer): TcxCheckBox;
    procedure ActionNuevo(Action: TBasicAction);
    procedure ActionPrimer(Action: TBasicAction);
    procedure ActionSiguiente(Action: TBasicAction);
    procedure ActionAnterior(Action: TBasicAction);
    procedure ActionUltimo(Action: TBasicAction);
    procedure ActionBuscar(Action: TBasicAction);
  protected
    procedure RegisterActions; override;
  public
    { Public declarations }
    Abriendo: Boolean;
    Guardando: Boolean;
    Tipo: Integer;
    Actualiza : Boolean;
    Campo: String;
    procedure ActionActualizar(Action: TBasicAction); virtual;
    procedure ActionGuardar(Action: TBasicAction); virtual;
    procedure ActionImprimir(Action: TBasicAction); virtual;
    procedure ActionCancelar(Action: TBasicAction); virtual;
    procedure UpdateActionsState; override;
  end;
const
  Campos: array [1000..1007]of String = ('LimiteLTTurno','LimiteMNTurno',
                                         'LimiteLTDia','LimiteMNDia',
                                         'LimiteLTSemana','LimiteMNSemana',
                                         'LimiteLTMes','LimiteMNMes');  

var
  frmVehiculo: TfrmVehiculo;
  Nombre: String;
  Cadena: String;
  Vehi: Integer;
  Lunes: String;
  Martes: String;
  Miercoles: String;
  Jueves: String;
  Viernes: String;
  Sabado: String;
  Domingo: String;
  ///////////////
  Lun: String;
  Mar: String;
  Mie: String;
  Jue: String;
  Vie: String;
  Sab: String;
  Dom: String;
  Asignando:Boolean;

implementation
uses  Modules, uDMFlotillas, ufrmBuscarClienteCredito, ufrmBuscar, dmActions,
UtileriasComun;

{$R *.dfm}
{ TfrmVehiculo }

procedure TfrmVehiculo.ActionActualizar(Action: TBasicAction);
begin
  Actualiza:=False;
  cdsCatalogo.Close;
  cdsCatalogo.Open;
  Actualiza:=True;
end;

procedure TfrmVehiculo.ActionAnterior(Action: TBasicAction);
begin
  dbgCatalogoDBTableView1.DataController.GotoPrev;
end;

procedure TfrmVehiculo.ActionBuscar(Action: TBasicAction);
begin
  pgcCatalogo.ActivePageIndex:=0;
  dbgCatalogo.SetFocus;
end;

procedure TfrmVehiculo.ActionCancelar(Action: TBasicAction);
begin
  cdsCatalogo.Cancel;
end;

procedure TfrmVehiculo.ActionGuardar(Action: TBasicAction);
begin
  cdsCatalogo.Post;
  uDMFlotillas.DMFlotillas.Server.AgregaReferencia(cdsCatalogo.FieldByName('VehiculoID').AsInteger, 1,
                                 uDMFlotillas.DMFlotillas.Server.ReferenciaTarjeta(cdsCatalogo.FieldByName('VehiculoID').AsInteger));
end;

procedure TfrmVehiculo.ActionImprimir(Action: TBasicAction);
begin

end;

procedure TfrmVehiculo.ActionNuevo(Action: TBasicAction);
begin
  pgcCatalogo.ActivePageIndex:=1;
  cdsCatalogo.Append;
end;

procedure TfrmVehiculo.ActionPrimer(Action: TBasicAction);
begin
  dbgCatalogoDBTableView1.DataController.GotoFirst;
end;

procedure TfrmVehiculo.ActionSiguiente(Action: TBasicAction);
begin
  dbgCatalogoDBTableView1.DataController.GotoNext;
end;

procedure TfrmVehiculo.ActionUltimo(Action: TBasicAction);
begin
  dbgCatalogoDBTableView1.DataController.GotoLast;
end;

procedure TfrmVehiculo.btnBuscaClienteClick(Sender: TObject);
begin
  inherited;
  BuscarCliente;

  cdsCatalogo.Close;
  cdsCatalogo.ParamByName('ClienteID').AsInteger:= strtoint(FloatToStr(edtCliente.Value));
  cdsCatalogo.Open;

  DMFlotillas.ClienteIDActual:= cdsCatalogo.FieldByName('ClienteID').AsInteger;
end;

procedure TfrmVehiculo.BuscarCliente;
var
   Datos: TDatosBusqueda;
begin
   Datos:=PantallaBusqueda(TfrmBuscarClienteCredito,'');
   if Datos.OK then
     edtCliente.Value := Datos.Clave;
end;

procedure TfrmVehiculo.cdsCatalogoAfterPost(DataTable: TDADataTable);
begin
  inherited;
  cdsCatalogo.ApplyUpdates();
end;

procedure TfrmVehiculo.cdsCatalogoAfterScroll(DataTable: TDADataTable);
begin
  inherited;
  if (not Abriendo) and (cdscatalogo.State=dsBrowse) and (cdsCatalogo.RecordCount > 0)  then
  begin
    Abriendo:=True;
    Lunes:=cdsCatalogo.FieldByName('Lunes').AsString;
    Martes:=cdsCatalogo.FieldByName('Martes').AsString;
    Miercoles:=cdsCatalogo.FieldByName('Miercoles').AsString;
    Jueves:=cdsCatalogo.FieldByName('Jueves').AsString;
    Viernes:=cdsCatalogo.FieldByName('Viernes').AsString;
    Sabado:=cdsCatalogo.FieldByName('Sabado').AsString;
    Domingo:=cdsCatalogo.FieldByName('Domingo').AsString;
    ChkTTurnoLL.Checked:=cdsCatalogo.FieldByName('LimiteLTTurno').AsInteger > 0 ;
    ChkDiaLL.Checked:=cdsCatalogo.FieldByName('LimiteLTDia').AsInteger > 0 ;
    ChkSemanaLL.Checked:=cdsCatalogo.FieldByName('LimiteLTSemana').AsInteger > 0 ;
    ChkMesLL.Checked:=cdsCatalogo.FieldByName('LimiteLTMes').AsInteger > 0 ;
    ChkTurnoMN.Checked:=cdsCatalogo.FieldByName('LimiteMNTurno').AsInteger > 0 ;
    ChkDiaMN.Checked:=cdsCatalogo.FieldByName('LimiteMNDia').AsInteger > 0 ;
    ChkSemanaMN.Checked:=cdsCatalogo.FieldByName('LimiteMNSemana').AsInteger > 0 ;
    ChkMesMN.Checked:=cdsCatalogo.FieldByName('LimiteMNMes').AsInteger > 0 ;
    LlenarHorarios;
    //Referencias;
    Abriendo:=False;
  end;
end;

procedure TfrmVehiculo.cdsCatalogoBeforePost(DataTable: TDADataTable);
begin
  inherited;
    GuardarHorarios;
    ChecarLimites;

    if cxDBImageComboBox1.EditValue = 'A' then
       cdsCatalogo.FieldByName('FechaAlta').AsDateTime:= Trunc(Now);
    if cxDBImageComboBox1.EditValue = 'I' then
       cdsCatalogo.FieldByName('FechaInactiva').AsDateTime:= Trunc(Now);
    if cxDBImageComboBox1.EditValue = 'C' then
       cdsCatalogo.FieldByName('FechaCancelacion').AsDateTime:= Trunc(Now);
    if cxDBImageComboBox1.EditValue = 'B' then
       cdsCatalogo.FieldByName('FechaBloqueada').AsDateTime:= Trunc(Now);
end;

procedure TfrmVehiculo.cdsCatalogoNewRecord(DataTable: TDADataTable);
Var Cadena: String;
begin
  inherited;
  Cadena:='111111111111111111111111';
  ////////// CAMPOS QUE FALTAN AGREGAR ////////////////
     cdsCatalogo.FieldByName('ClienteID').AsInteger:=DMFlotillas.ClienteIDActual;
     cdsCatalogo.FieldByName('Clasificacion').AsInteger:=Clasificacion;
     cdsCatalogo.FieldByName('Generada').AsBoolean:=True;
     cdsCatalogo.FieldByName('GasolineroID').AsInteger:=DMFlotillas.Server.GasolineroID;
     cdsCatalogo.FieldByName('DigitoSeguridad').AsString:=GeneraNip(4);


  ///////////////////////////////////////////////////////
     cdsCatalogo.FieldByName('VehiculoID').AsInteger:=DMFlotillas.Server.Folio('VehiculoID','');
     cdsCatalogo.FieldByName('Identificacion').AsString:='';
     cdsCatalogo.FieldByName('Nombre').AsString:='';
     cdsCatalogo.FieldByName('Departamento').AsString:='';
     cdsCatalogo.FieldByName('CentroCostos').AsString:='';
     cdsCatalogo.FieldByName('CuentaContable').AsString:='';
     cdsCatalogo.FieldByName('NumeroEconomico').AsString:='';
     cdsCatalogo.FieldByName('NIP').AsString:=GeneraNip(4);
     cdsCatalogo.FieldByName('Estatus').AsString:='A';
     cdsCatalogo.FieldByName('Mensaje').AsString:='';
     cdsCatalogo.FieldByName('CargasMaximas').AsInteger:=99;
     cdsCatalogo.FieldByName('ProductoAutorizado').AsInteger:=123;
     //------------- Horarios --------------
     cdsCatalogo.FieldByName('Lunes').AsString:=Cadena;
     cdsCatalogo.FieldByName('Martes').AsString:=Cadena;
     cdsCatalogo.FieldByName('Miercoles').AsString:=Cadena;
     cdsCatalogo.FieldByName('Jueves').AsString:=Cadena;
     cdsCatalogo.FieldByName('viernes').AsString:=Cadena;
     cdsCatalogo.FieldByName('Sabado').AsString:=Cadena;
     cdsCatalogo.FieldByName('Domingo').AsString:=Cadena;
     Lunes:=Cadena;
     Martes:=Cadena;
     Miercoles:=Cadena;
     Jueves:=Cadena;
     viernes:=Cadena;
     Sabado:=Cadena;
     Domingo:=Cadena;
     LlenarHorarios;
     //----------------------------------------
     cdsCatalogo.FieldByName('Odometro').AsBoolean:=True;
     cdsCatalogo.FieldByName('Firma').AsBoolean:=True;
     cdsCatalogo.FieldByName('Placas').AsBoolean:=True;
     //----------------------------------------
      cdsCatalogo.FieldByName('FechaAlta').AsDateTime:=Trunc(Now);
      cdsCatalogo.FieldByName('FechaExpira').AsDateTime:=Trunc(Now) + (365*5);
     //-----------------------------------------
      cdsCatalogo.FieldByName('LimiteLTTurno').AsInteger:=0;
      cdsCatalogo.FieldByName('LimiteLTDia').AsInteger:=0;
      cdsCatalogo.FieldByName('LimiteLTSemana').AsInteger:=0;
      cdsCatalogo.FieldByName('LimiteLTMes').AsInteger:=0;
      cdsCatalogo.FieldByName('LimiteMNTurno').AsInteger:=0;
      cdsCatalogo.FieldByName('LimiteMNDia').AsInteger:=0;
      cdsCatalogo.FieldByName('LimiteMNSemana').AsInteger:=0;
      cdsCatalogo.FieldByName('LimiteMNMes').AsInteger:=0;
     //----------------------------------------------
      cdsCatalogo.FieldByName('ActualLTTurno').AsInteger:=0;
      cdsCatalogo.FieldByName('ActualLTDia').AsInteger:=0;
      cdsCatalogo.FieldByName('ActualLTSemana').AsInteger:=0;
      cdsCatalogo.FieldByName('ActualLTMes').AsInteger:=0;
      cdsCatalogo.FieldByName('ActualMNTurno').AsInteger:=0;
      cdsCatalogo.FieldByName('ActualMNDia').AsInteger:=0;
      cdsCatalogo.FieldByName('ActualMNSemana').AsInteger:=0;
      cdsCatalogo.FieldByName('ActualMNMes').AsInteger:=0;
     //------------------------------------------------
      cdsCatalogo.FieldByName('ActualCargas').AsInteger:=0;
end;

procedure TfrmVehiculo.ChecarLimites;
begin
///////////// LIMITES DE CONSUMO ///////////////////
    if TxtTurnoLitrosL.Text='' then
       cdsCatalogo.FieldByName('LimiteLTTurno').AsFloat:=0;
    if TxtDiarioLitrosL.Text='' then
       cdsCatalogo.FieldByName('LimiteLTDia').AsFloat:=0;
    if TxtSemLitrosL.Text='' then
       cdsCatalogo.FieldByName('LimiteLTSemana').AsFloat:=0;
    if TxtMenLitrosL.Text='' then
       cdsCatalogo.FieldByName('LimiteLTMes').AsFloat:=0;

    if TxtTurnoMNL.Text='' then
       cdsCatalogo.FieldByName('LimiteMNTurno').AsFloat:=0;
    if TxtDiarioMNL.Text='' then
       cdsCatalogo.FieldByName('LimiteMNDia').AsFloat:=0;
    if TxtSemMNL.Text='' then
       cdsCatalogo.FieldByName('LimiteMNSemana').AsFloat:=0;
    if TxtMenMNL.Text='' then
       cdsCatalogo.FieldByName('LimiteMNMes').AsFloat:=0;
/////////// HISTORIAL DE CONSUMO /////////////////
    if TxtTurnoLitrosH.Text='' then
       cdsCatalogo.FieldByName('ActualLTTurno').AsFloat:=0;
    if TxtDiarioLitrosH.Text='' then
       cdsCatalogo.FieldByName('ActualLTDia').AsFloat:=0;
    if TxtSemLitrosH.Text='' then
       cdsCatalogo.FieldByName('ActualLTSemana').AsFloat:=0;
    if TxtMenLitrosH.Text='' then
       cdsCatalogo.FieldByName('ActualLTMes').AsFloat:=0;

    if TxtTurnoMNH.Text='' then
       cdsCatalogo.FieldByName('ActualMNTurno').AsFloat:=0;
    if TxtDiarioMNH.Text='' then
       cdsCatalogo.FieldByName('ActualMNDia').AsFloat:=0;
    if TxtSemMNH.Text='' then
       cdsCatalogo.FieldByName('ActualMNSemana').AsFloat:=0;
    if TxtMenMNH.Text='' then
       cdsCatalogo.FieldByName('ActualMNMes').AsFloat:=0;

    if TxtCargasDia.Text='' then
       cdsCatalogo.FieldByName('ActualCargar').AsInteger:=0;
end;

procedure TfrmVehiculo.Chk0LuClick(Sender: TObject);
begin
  inherited;
  if (not Asignando) and (cdsCatalogo.State = dsBrowse) and (not Abriendo) then
    cdsCatalogo.Edit;
end;

procedure TfrmVehiculo.ChkDiaLLClick(Sender: TObject);
begin
  inherited;
    if ChkDiaLL.Checked=False then
         TxtDiarioLitrosL.Enabled:=False
    else
         TxtDiarioLitrosL.Enabled:=True;
end;

procedure TfrmVehiculo.ChkDiaMNClick(Sender: TObject);
begin
  inherited;
    if ChkDiaMN.Checked=False then
         TxtDiarioMNL.Enabled:=False
    else
         TxtDiarioMNL.Enabled:=True;
end;

procedure TfrmVehiculo.ChkMesLLClick(Sender: TObject);
begin
  inherited;
    if ChkMesLL.Checked=False then
         TxtMenLitrosL.Enabled:=False
    else
         TxtMenLitrosL.Enabled:=True;
end;

procedure TfrmVehiculo.ChkMesMNClick(Sender: TObject);
begin
  inherited;
    if ChkMesMN.Checked=False then
         TxtMenMNL.Enabled:=False
    else
         TxtMenMNL.Enabled:=True;
end;

procedure TfrmVehiculo.ChkSemanaLLClick(Sender: TObject);
begin
  inherited;
    if ChkSemanaLL.Checked=False then
         TxtSemLitrosL.Enabled:=False
    else
         TxtSemLitrosL.Enabled:=True;
end;

procedure TfrmVehiculo.ChkSemanaMNClick(Sender: TObject);
begin
  inherited;
    if ChkSemanaMN.Checked=False then
         TxtSemMNL.Enabled:=False
    else
         TxtSemMNL.Enabled:=True;
end;

procedure TfrmVehiculo.ChkTTurnoLLClick(Sender: TObject);
begin
  inherited;
    if ChkTTurnoLL.Checked=False then
         TxtTurnoLitrosL.Enabled:=False
    else
         TxtTurnoLitrosL.Enabled:=True;
end;

procedure TfrmVehiculo.ChkTurnoMNClick(Sender: TObject);
begin
  inherited;
    if ChkTurnoMN.Checked=False then
         TxtTurnoMNL.Enabled:=False
    else
         TxtTurnoMNL.Enabled:=True;
end;

procedure TfrmVehiculo.dbgCatalogoDBTableView1DblClick(Sender: TObject);
begin
  inherited;
  pgcCatalogo.ActivePageIndex:=1;
end;

procedure TfrmVehiculo.dbgCatalogoDBTableView1KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if key = #13 then
    dbgCatalogoDBTableView1DblClick(Nil);
end;

procedure TfrmVehiculo.dsCatalogoStateChange(Sender: TObject);
begin
  inherited;
  UpdateActionsState;
end;

procedure TfrmVehiculo.edtClienteExit(Sender: TObject);
begin
  inherited;
  if edtCliente.EditValue <> '' then
     DMFlotillas.ClienteIDActual:= edtCliente.EditValue;
  if (edtCliente.Value > 0) then
  begin
    cdsCatalogo.Close;
    cdsCatalogo.ParamByName('ClienteID').AsInteger:= strtoint(FloatToStr(edtCliente.Value));
    cdsCatalogo.Open;
  end;
end;

procedure TfrmVehiculo.FormCreate(Sender: TObject);
begin
  inherited;
  Abriendo:=True;
  Campo:='VehiculoID';
    cdsCatalogo.Close;
    cdsProductos.Close;
    cdsReferencia.Close;
    cdsTipoReferencia.Close;
    cdsVehiculoProducto.Close;
  //dbgCatalogo.InsertComponent(cdsCatalogo);
    cdsCatalogo.ParamByName('ClienteID').AsInteger:=DMFlotillas.ClienteIDActual;
    cdsProductos.Open;
    cdsCatalogo.Open;
    cdsReferencia.Open;
    cdsVehiculoProducto.Open;
    cdsTipoReferencia.Open;
  TxtTurnoLitrosL.Enabled:=False;
  TxtTurnoMNL.Enabled:=False;
  TxtDiarioLitrosL.Enabled:=False;
  TxtDiarioMNL.Enabled:=False;
  TxtSemLitrosL.Enabled:=False;
  TxtSemMNL.Enabled:=False;
  TxtMenLitrosL.Enabled:=False;
  TxtMenMNL.Enabled:=False;
  Asignando:=False;
  Clasificacion:=DMFlotillas.Server.Clasificacion;
  inherited;
  Abriendo:=False;
  cdsCatalogoAfterScroll(cdsCatalogo);
end;

procedure TfrmVehiculo.GuardarHorarios;
Var L,K: Integer;
begin
Lun:='';
Mar:='';
Mie:='';
Jue:='';
Vie:='';
Sab:='';
Dom:='';
      for K := 0 to 6 do
    for L := 1 to 24 do
     begin
     if K=0 then

      if MiCheckBox((L + 100) - 1).Checked=True then
          Lun:=Lun+'1'
      else
          Lun:=Lun+'0'
////////////// MARTES /////////////////////
     else
     if K=1 then
      if MiCheckBox((L+200) - 1).Checked=True then
          Mar:=Mar+'1'
      else
          Mar:=Mar+'0';
 ///////// MIERCOLES //////////
      if K=2 then
        if MiCheckBox((L+300) - 1).Checked=True then
           Mie:=Mie+'1'
      else
           Mie:=Mie+'0';
 /////////// JUEVES ///////////////
      if K=3 then
        if MiCheckBox((L+400) - 1).Checked=True then
            Jue:=Jue+'1'
      else
            Jue:=Jue+'0';
/////////// VIERNES ///////////////
       if K=4 then
        if MiCheckBox((L+500) - 1).Checked=True then
           Vie:=Vie+'1'
      else
           Vie:=Vie+'0';
/////////// SABAD0 ///////////////
       if K=5 then
        if MiCheckBox((L+600) - 1).Checked=True then
           Sab:=Sab+'1'
      else
           Sab:=Sab+'0';
/////////// DOMINGO /////////////
      if K=6 then
        if MiCheckBox((L+700) - 1).Checked=True then
           Dom:=Dom+'1'
      else
           Dom:=Dom+'0';
      end;

      cdsCatalogo.FieldByName('Lunes').AsString:=Lun;
      cdsCatalogo.FieldByName('Martes').AsString:=Mar;
      cdsCatalogo.FieldByName('Miercoles').AsString:=Mie;
      cdsCatalogo.FieldByName('Jueves').AsString:=Jue;
      cdsCatalogo.FieldByName('Viernes').AsString:=Vie;
      cdsCatalogo.FieldByName('Sabado').AsString:=Sab;
      cdsCatalogo.FieldByName('Domingo').AsString:=Dom;
end;

procedure TfrmVehiculo.Label33Click(Sender: TObject);
var
  I: Integer;
begin
  inherited;
    for I := (Sender As TComponent).Tag to (Sender As TComponent).Tag + 23 do    // Iterate
    MiCheckBox(I).Checked:=not MiCheckBox(I).Checked;
end;

procedure TfrmVehiculo.Label40Click(Sender: TObject);
Var
 I: Integer;
begin
  inherited;
   for I := 1 to 7 do
    MiCheckBox(((I - 1) * 100) +  (Sender As TComponent).Tag).Checked:=not MiCheckBox(((I - 1) * 100) +  (Sender As TComponent).Tag).Checked;
end;

procedure TfrmVehiculo.LlenarHorarios;
var L,K: Integer;
begin
  for K := 0 to 6 do
    for L := 1 to 24 do
     begin
     if K=0 then

      if Lunes[L]='1' then
         MiCheckBox((L + 100) - 1).Checked:=True
      else
         MiCheckBox((L + 100) - 1).Checked:=False
////////////// MARTES /////////////////////
     else
     if K=1 then
      if Martes[L]='1' then
         MiCheckBox((L+200) - 1).Checked:=True
      else
         MiCheckBox((L+200) - 1).Checked:=False;
 ///////// MIERCOLES //////////
      if K=2 then
        if Miercoles[L]='1' then
         MiCheckBox((L+300) - 1).Checked:=True
      else
         MiCheckBox((L+300) - 1).Checked:=False;
 /////////// JUEVES ///////////////
      if K=3 then
        if Jueves[L]='1' then
         MiCheckBox((L+400) - 1).Checked:=True
      else
         MiCheckBox((L+400) - 1).Checked:=False;
/////////// VIERNES ///////////////
       if K=4 then
        if Viernes[L]='1' then
         MiCheckBox((L+500) - 1).Checked:=True
      else
         MiCheckBox((L+500) - 1).Checked:=False;
/////////// SABAD0 ///////////////
       if K=5 then
        if Sabado[L]='1' then
         MiCheckBox((L+600) - 1).Checked:=True
      else
         MiCheckBox((L+600) - 1).Checked:=False;
/////////// DOMINGO /////////////
      if K=6 then
        if Domingo[L]='1' then
         MiCheckBox((L+700) - 1).Checked:=True
      else
         MiCheckBox((L+700) - 1).Checked:=False;
      end;
end;

function TfrmVehiculo.MiCheckBox(Cual: Integer): TcxCheckBox;
var
  I: Integer;
begin
  Result:=nil;
  for I := 0 to ComponentCount - 1 do    // Iterate
  begin
    if (Components[I] is TcxCheckBox) and (Components[I].Tag = Cual) then
    begin
      Result:=TcxCheckBox(Components[I]);
      Break;
    end;
  end;    // for
end;

procedure TfrmVehiculo.RegisterActions;
begin
inherited RegisterActions;
  RegisterAction(AppActions.actNuevo, ActionNuevo);
  RegisterAction(AppActions.actGuardar, ActionGuardar);
  RegisterAction(AppActions.actCancelar, ActionCancelar);
  RegisterAction(AppActions.actActualizar, ActionActualizar);
  RegisterAction(AppActions.actImprimir, ActionImprimir);

  RegisterAction(AppActions.actPrimer, ActionPrimer);
  RegisterAction(AppActions.actSiguiente, ActionSiguiente);
  RegisterAction(AppActions.actAnterior, ActionAnterior);
  RegisterAction(AppActions.actUltimo, ActionUltimo);
  RegisterAction(AppActions.actBuscar, ActionBuscar);
end;

procedure TfrmVehiculo.UpdateActionsState;
begin
  inherited UpdateActionsState;
  AppActions.actNuevo.Enabled:=cdsCatalogo.State = dsBrowse;
  AppActions.actGuardar.Enabled:=cdsCatalogo.State in dsEditModes;
  AppActions.actCancelar.Enabled:=cdsCatalogo.State in dsEditModes;
  AppActions.actActualizar.Enabled:=cdsCatalogo.State = dsBrowse;
  AppActions.actPrimer.Enabled:=cdsCatalogo.State = dsBrowse;
  AppActions.actSiguiente.Enabled:=cdsCatalogo.State = dsBrowse;
  AppActions.actAnterior.Enabled:=cdsCatalogo.State = dsBrowse;
  AppActions.actUltimo.Enabled:=cdsCatalogo.State = dsBrowse;
  AppActions.actImprimir.Enabled:=cdsCatalogo.State = dsBrowse;
  AppActions.actBuscar.Enabled:=cdsCatalogo.State = dsBrowse;
  Closing:=cdsCatalogo.State = dsBrowse;

end;

initialization
   ModuleInfoManager.RegisterModule('Vehiculo', TfrmVehiculo);

end.
