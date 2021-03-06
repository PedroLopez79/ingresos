unit ufrmSaldosClientes;

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
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, Menus, StdCtrls,
  cxButtons, cxTextEdit, cxCurrencyEdit, ExtCtrls, cxDropDownEdit,
  cxImageComboBox, cxMaskEdit, cxSpinEdit, cxDBEdit, uDAScriptingProvider,
  uDADataTable, uDAMemDataTable, DB, uDAInterfaces;

type
  TfrmSaldosClientes = class(TfrmCustomModule)
    Panel2: TPanel;
    Panel1: TPanel;
    Label65: TLabel;
    edtCliente: TcxCurrencyEdit;
    btnBuscaCliente: TcxButton;
    Label6: TLabel;
    edtEjercicio: TcxSpinEdit;
    Label7: TLabel;
    cbPeriodoIni: TcxImageComboBox;
    Label8: TLabel;
    cbPeriodoFin: TcxImageComboBox;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    cxDBTextEdit3: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBTextEdit4: TcxDBTextEdit;
    cxDBTextEdit5: TcxDBTextEdit;
    cxDBTextEdit7: TcxDBTextEdit;
    Label11: TLabel;
    Label10: TLabel;
    Label9: TLabel;
    Button1: TButton;
    dsCatalogo: TDADataSource;
    cdsCatalogo: TDAMemDataTable;
    cdsSaldo: TDAMemDataTable;
    dsSaldo: TDADataSource;
    procedure edtClienteExit(Sender: TObject);
    procedure btnBuscaClienteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    procedure BuscarCliente;
  public
    { Public declarations }
  end;

var
  frmSaldosClientes: TfrmSaldosClientes;

implementation
uses Modules, uDM, dmActions,  ufrmBuscarCliente, ufrmBuscar, uDMFlotillas, ufrmBuscarClienteCredito,
     ufrmSaldosPageDown;

{$R *.dfm}

procedure TfrmSaldosClientes.btnBuscaClienteClick(Sender: TObject);
begin
  inherited;
  BuscarCliente;

  Application.ProcessMessages;
  if (edtCliente.EditValue > 0) then
  begin
    if cdsCatalogo.Locate('ClienteID', edtCliente.EditValue, []) then
    begin
    Label1.Caption:= cdsCatalogo.FieldByName('Nombre').AsString;
    Label2.Caption:= cdsCatalogo.FieldByName('RazonSocial').AsString;
    Label3.Caption:= cdsCatalogo.FieldByName('Domicilio').AsString;
    end;
  end;

  DMFlotillas.ClienteIDActual:= cdsCatalogo.FieldByName('ClienteID').AsInteger;
end;

procedure TfrmSaldosClientes.BuscarCliente;
var
   Datos: TDatosBusqueda;
begin
   Datos:=PantallaBusqueda(TfrmBuscarClienteCredito,'');
   if Datos.OK then
     edtCliente.Value := Datos.Clave;
end;

procedure TfrmSaldosClientes.Button1Click(Sender: TObject);
begin
  inherited;
  try
    Screen.Cursor:=crHourGlass;
    cdsSaldo.Close;
    cdsSaldo.ParamByName('Ejercicio').AsInteger:=Trunc(edtEjercicio.Value);
    cdsSaldo.ParamByName('ClienteIni').AsInteger:=cdsCatalogo.FieldByName('ClienteID').AsInteger;
    cdsSaldo.ParamByName('ClienteFin').AsInteger:=cdsCatalogo.FieldByName('ClienteID').AsInteger;
    cdsSaldo.ParamByName('Ini').AsInteger:= cbPeriodoIni.EditValue;
    cdsSaldo.ParamByName('Fin').AsInteger:= cbPeriodoFin.EditValue;
    cdsSaldo.ParamByName('GrupoFacturarID').AsInteger:=0;
    cdsSaldo.ParamByName('FormaCompraID').AsInteger:=0;
    cdsSaldo.ParamByName('Grupo').AsString:='';
    cdsSaldo.Open;
  finally
    Screen.Cursor:=crDefault;
 end;
end;

procedure TfrmSaldosClientes.edtClienteExit(Sender: TObject);
begin
  inherited;
  if edtCliente.EditValue > 0 then
     DMFlotillas.ClienteIDActual:= edtCliente.EditValue;
  if (edtCliente.EditValue > 0) then
  begin
    if cdsCatalogo.Locate('ClienteID', DMFlotillas.ClienteIDActual, []) then
    begin
    Label1.Caption:= cdsCatalogo.FieldByName('Nombre').AsString;
    Label2.Caption:= cdsCatalogo.FieldByName('RazonSocial').AsString;
    Label3.Caption:= cdsCatalogo.FieldByName('Domicilio').AsString;
    end;
  end;
end;

procedure TfrmSaldosClientes.FormCreate(Sender: TObject);
begin
  inherited;
  Label1.Caption:= '';
  Label2.Caption:= '';
  Label3.Caption:= '';

  cdsCatalogo.Close;
  cdsCatalogo.Open;
end;

procedure TfrmSaldosClientes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = 34 then
  Begin
    Abrir_ModuloSaldosCliente(Trunc(edtEjercicio.Value),
                              cdsCatalogo.FieldByName('ClienteID').AsInteger,
                              cdsCatalogo.FieldByName('ClienteID').AsInteger,
                              cbPeriodoIni.EditValue,
                              cbPeriodoFin.EditValue,
                              0,
                              0,
                              '');
  End;
end;

initialization
  ModuleInfoManager.RegisterModule('SaldosClientes', TfrmSaldosClientes);

end.
