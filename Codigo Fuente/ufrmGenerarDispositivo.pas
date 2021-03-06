unit ufrmGenerarDispositivo;

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
  dxSkinXmas2008Blue, cxContainer, cxEdit, Menus, cxGroupBox, cxRadioGroup,
  cxMaskEdit, cxDropDownEdit, cxImageComboBox, cxTextEdit, cxCurrencyEdit,
  StdCtrls, cxButtons, cxCheckBox, cxCheckListBox, DB, uDAInterfaces,
  uDADataTable, uDAScriptingProvider, uDACDSDataTable, LibraryFlotillas_Intf,
  ufrmBuscar, uDAMemDataTable;

type
  TfrmGenerarDispositivo = class(TfrmCustomModule)
    ClbTarjetas: TcxCheckListBox;
    Label70: TLabel;
    ChkTodas: TcxCheckBox;
    BtnProcesar: TcxButton;
    btnAgregar: TcxButton;
    edtTarjeta: TcxCurrencyEdit;
    cbImpresora: TcxImageComboBox;
    lblImpresora: TLabel;
    rgOpciones: TcxRadioGroup;
    edtCliente: TcxCurrencyEdit;
    Label17: TLabel;
    btnBuscaCliente: TcxButton;
    edtNombre: TcxTextEdit;
    cdsCliente: TDACDSDataTable;
    dsCliente: TDADataSource;
    cdsVehiculos: TDAMemDataTable;
    dsVehiculos: TDADataSource;
    cdsArchivo: TDAMemDataTable;
    dsArchivo: TDADataSource;
    procedure edtClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtClienteExit(Sender: TObject);
    procedure BtnProcesarClick(Sender: TObject);
    procedure ImprimeTipo(Cual: String);
    procedure btnAgregarClick(Sender: TObject);
    procedure btnBuscaClienteClick(Sender: TObject);
    procedure rgOpcionesClick(Sender: TObject);
  private
    { Private declarations }
    procedure ImprimirTarjetas;
    procedure BuscarCliente;
  public
    { Public declarations }
    Tarjetas: String;
    ArreTarjetas:Array[0..1000] of Integer;
    Var Arre: Array[0..1000] of Integer;
    Var Arre2: Array[0..1000] of String;
  end;

var
  frmGenerarDispositivo: TfrmGenerarDispositivo;
  Datos : TDatosBusqueda;

implementation
uses uDMFlotillas, ufrmBuscarClienteCredito, UtileriasComun, Modules;

{$R *.dfm}

procedure TfrmGenerarDispositivo.btnAgregarClick(Sender: TObject);
begin
  inherited;
  cdsVehiculos.Close;
  DMFlotillas.ClienteIDActual:= cdsCliente.FieldByName('ClienteID').AsInteger;
  DMFlotillas.FormaCompra:=cdsCliente.FieldByName('FormaCompraID').AsInteger;
  cdsVehiculos.ParamByName('ClienteID').AsInteger:=DMFlotillas.ClienteIDActual;
  cdsVehiculos.Open;

  if cdsVehiculos.Locate('VehiculoID', edtTarjeta.EditValue, []) then
  begin

  with clbTarjetas.Items.Add do
  begin
   if cdsVehiculos.FieldByName('ClienteID').AsInteger= DMFlotillas.ClienteIDActual then
   begin
    InttoStr(cdsVehiculos.FieldByName('VehiculoID').AsInteger);
    Text:=Format('%d-%s',[cdsVehiculos.FieldByName('VehiculoID').AsInteger,cdsVehiculos.FieldByName('Identificacion').AsString]);
    cdsVehiculos.Next;
    end
  end;
  end else Showmessage('Unidad no localizada para el cliente Actual');
  edtTarjeta.Text:= '';
end;

procedure TfrmGenerarDispositivo.btnBuscaClienteClick(Sender: TObject);
begin
  inherited;
  BuscarCliente;

  edtClienteExit(nil);
end;

procedure TfrmGenerarDispositivo.BtnProcesarClick(Sender: TObject);
Var I:Integer;
Var S: String;
begin
  inherited;
  S:='';
  for I := 0 to clbTarjetas.Items.Count - 1 do
  begin
    if clbTarjetas.Items[I].State = cbsChecked then
      begin
      ArreTarjetas[I]:=Arre[I];
      S:=S + Copy(clbTarjetas.Items[I].Text, 1, Pos('-', clbTarjetas.Items[I].Text) - 1) + ',';
      end;
    end;
   Delete(S, Length(S), 1);
   Tarjetas:=S;
     case rgOpciones.EditValue of
    1: ImprimirTarjetas;
    2: ImprimeTipo('CARTA NIP');
    3: ImprimeTipo('ACUSE DE RECIBO');
  end;
end;

procedure TfrmGenerarDispositivo.BuscarCliente;
begin
   Datos:= PantallaBusqueda(TfrmBuscarClienteCredito,'1,2,3');
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

procedure TfrmGenerarDispositivo.edtClienteExit(Sender: TObject);
var
  cont, I: Integer;
begin
  inherited;
  cdsCliente.Close;
  if edtCliente.Text <> '' then
  begin
    cdsCliente.ParamByName('Cliente').AsInteger := strToInt(edtCliente.Text);
    cdsCliente.Open;
  end else
  begin
    cdsCliente.ParamByName('Cliente').AsInteger := 0;
    cdsCliente.Open;
  end;

  if not (cdsCliente.EOF) then
  begin
     if (cdsCliente.FieldByName('Estatus').AsString <> 'A') then
     begin
       MessageDlg('Cliente no esta Activo', mtError, [mbOK], 0);
       exit;
     end;

     Datos.Clave:=cdsCliente.FieldByName('ClienteID').AsInteger;
     Datos.Nombre:= cdsCliente.FieldByName('Nombre').AsString;
     Datos.FormaPago:= cdsCliente.FieldByName('FormaPagoID').AsInteger;
     Datos.Estatus := cdsCliente.FieldByName('Estatus').AsString;
     Datos.RFC := '';
     Datos.Cuenta:= cdsCliente.FieldByName('CuentaContable').AsString;

     edtCliente.Text :=inttostr(Datos.Clave);
     edtNombre.Text := Datos.Nombre;

     ClbTarjetas.Items.Clear;
     cdsVehiculos.Close;
     DMFlotillas.ClienteIDActual:= cdsCliente.FieldByName('ClienteID').AsInteger;
     DMFlotillas.FormaCompra:=cdsCliente.FieldByName('FormaCompraID').AsInteger;
     cdsVehiculos.ParamByName('ClienteID').AsInteger:=Datos.Clave;
     cdsVehiculos.Open;

     Cont:=cdsVehiculos.RecordCount;
     I:=0;
      while (I < Cont)AND(Cont < 1000) do
         with clbTarjetas.Items.Add do
           begin
            if cdsVehiculos.FieldByName('ClienteID').AsInteger= Datos.Clave then
            begin
               Arre[I]:=cdsVehiculos.FieldByName('VehiculoID').AsInteger;
               Arre2[I]:=cdsVehiculos.FieldByName('Identificacion').AsString;
               InttoStr(Arre[I]);
               Text:=Format('%d-%s',[Arre[I],Arre2[I]]);
               cdsVehiculos.Next;
               I:=I+1;
            end
          else
          begin
            cdsVehiculos.Next;
            I:=I+1;
          end;
      end;
      {If (LOOKUPCMFORMACOMPRA.Text='CUPONES') Or (LOOKUPCMFORMACOMPRA.Text='NOTA DE CREDITO') Then
      begin
       cxTabSheet5.Enabled:=False;
      end
      else
      begin
       cxTabSheet5.Enabled:=True;
      end;
  end;}
  end else MessageDlg('El Cliente no existe', mtError, [mbOK], 0);
end;

procedure TfrmGenerarDispositivo.edtClienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = VK_F2 then
     BuscarCliente;
end;

procedure TfrmGenerarDispositivo.ImprimeTipo(Cual: String);
var
  Aux: TReporteF;
  K: Integer;
begin
    for K := 0 to ClbTarjetas.Count - 1 do
      begin
       if clbTarjetas.Items[K].State = cbsChecked then
          begin
    cdsArchivo.Close;
    cdsArchivo.ParamByName('Vehiculo').AsInteger:=Arre[K];
    cdsArchivo.Open;
     end;
   end;
  Aux:=DMFlotillas.Server.BuscarReporte(Cual);
  if Aux <> nil then
  begin
    //if DM.Parametros = nil then
    if rgOpciones.EditValue=2 then
      begin
    //DM.Parametros:=TParametros.Create;
    DMFlotillas.Parametros.ClienteIni:=cdsCliente.FieldByName('ClienteID').AsInteger;
    DMFlotillas.Parametros.Identificador:=DMFlotillas.Identificador;
    DMFlotillas.Parametros.TipoMov:=',' + Tarjetas + ',';
    DMFlotillas.Imprimir(Aux.SQL1, Aux.SQL2, Aux.Template, Aux.CampoJoin, Cual);
    Aux.Free;
      end;
    if (rgOpciones.EditValue=3) then
      begin
        //DM.Parametros:=TParametros.Create;
        DMFlotillas.Parametros.ClienteIni:=cdsCliente.FieldByName('ClienteID').AsInteger;
        DMFlotillas.Parametros.Identificador:=DMFlotillas.Identificador;
        DMFlotillas.Parametros.TipoMov:=',' + Tarjetas + ',';
        DMFlotillas.Imprimir(Aux.SQL1, Aux.SQL2, Aux.Template, Aux.CampoJoin, Cual);
        Aux.Free;
      end;
  end;
end;
procedure TfrmGenerarDispositivo.ImprimirTarjetas;
const
  RutaReg = 'CistemFlotillas';
var
  //Temp: TRegIniFile;
  Aux: TReporteF;
  I: Integer;
  S: String;
begin
  if cbImpresora.Text <> '' then
  begin
    //Temp:=TRegIniFile.Create;
    //Temp.WriteString(RutaReg, 'ImpresoraTarjetas', cbImpresora.EditValue);
    //Temp.WriteString(RutaReg, 'FormatoTarjetas', cbFormato.EditValue);
    //Temp.Free;
    //S:=cbFormato.EditValue;
    if S = ' ' then
      S:='';
    //Aux:=DM.Servidor.BuscaReporte(cbImpresora.Text + S, DM.Identificador);
    Aux:=DMFlotillas.Server.BuscarReporte(cbImpresora.Text);
    if Aux <> nil then
    begin
      if DMFlotillas.Parametros = nil then
         DMFlotillas.Parametros:=TParametrosF.Create;
      DMFlotillas.Parametros.ClienteIni:=cdsCliente.FieldByName('ClienteID').AsInteger;
      DMFlotillas.Parametros.Identificador:=DMFlotillas.Identificador;
      I:=0;
      while GetParsedItem(Tarjetas, ',', I) <> '' do
      begin
        DMFlotillas.Parametros.TarjetaIni:=StrToInt(GetParsedItem(Tarjetas, ',', I));
        //DM.Imprimir(Aux.SQL1, Aux.SQL2, Aux.Template, 'Tarjeta: ' + GetParsedItem(Tarjetas, ',', I), '', False);
        DMFlotillas.Imprimir(Aux.SQL1, Aux.SQL2, Aux.Template, 'Tarjeta: ' + GetParsedItem(Tarjetas, ',', I), Aux.CampoJoin, True);
        Inc(I);
      end;    // while
      Aux.Free;
    end;
  end;
end;

procedure TfrmGenerarDispositivo.rgOpcionesClick(Sender: TObject);
begin
  inherited;
  lblImpresora.Visible:=(rgOpciones.EditValue = 1);
  cbImpresora.Visible:=(rgOpciones.EditValue = 1);
end;

initialization
ModuleInfoManager.RegisterModule('Generar Dispotivo', TfrmGenerarDispositivo);

end.
