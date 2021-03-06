unit ufrmReporteSATEfectivos;

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
  ExtDlgs, cxSpinEdit, cxTimeEdit, ComCtrls, cxCurrencyEdit;

type
  TfrmReporteSatEfectivos = class(TfrmCustomModule)
    cxGroupBox4: TcxGroupBox;
    Label9: TLabel;
    btnPreeliminar: TcxButton;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cdsFacturas: TDACDSDataTable;
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
    cxGrid1DBTableView1RecId: TcxGridDBColumn;
    cxGrid1DBTableView1Vigencia: TcxGridDBColumn;
    cxGrid1DBTableView1RFC: TcxGridDBColumn;
    cxGrid1DBTableView1Serie: TcxGridDBColumn;
    cxGrid1DBTableView1Folio: TcxGridDBColumn;
    cxGrid1DBTableView1Total: TcxGridDBColumn;
    cxGrid1DBTableView1Impuesto: TcxGridDBColumn;
    tblFacturasFECHANOAPROBACION: TStringField;
    tblFacturasFECHAHORA: TStringField;
    tblFacturasFacturaID: TIntegerField;
    spActualizaFacturaElectronica: TDACDSDataTable;
    cdsConfiguracion: TDACDSDataTable;
    DataSource2: TDataSource;
    dtpHora: TcxTimeEdit;
    SaveDialog1: TSaveDialog;
    prgBar: TProgressBar;
    lblSerie: TLabel;
    edtSerie: TcxTextEdit;
    procedure btnPreeliminarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure ActionProcesar(Action: TBasicAction);
    function GuardaArchivo(Texto: String; FileArch: String):Integer;
  public
    { Public declarations }
    procedure UpdateActionsState; override;
  protected
    procedure RegisterActions; override;
  end;

var
  frmReporteSatEfectivos: TfrmReporteSatEfectivos;

implementation

uses  Modules, dmActions, uDM;

{$R *.dfm}

procedure TfrmReporteSatEfectivos.ActionProcesar(Action: TBasicAction);
var
  Cadena: String;
  NOMARCH:String;
begin

  NOMARCH:='1'+cdsConfiguracion.FieldByName('RFC').AsString+FormatDateTime('MM',now())+FormatDateTime('YYYY',now())+'.txt';

  SaveDialog1.FileName:= '1'+cdsConfiguracion.FieldByName('RFC').AsString+FormatDateTime('MM',cxDateEdit1.Date)+FormatDateTime('YYYY',cxDateEdit1.Date)+'.txt';

  if not SaveDialog1.Execute then exit;
  NOMARCH := SaveDialog1.FileName;

  if FileExists(NOMARCH) then  DeleteFile(NOMARCH);

  tblFacturas.First;
  while not tblFacturas.Eof do
  begin
      Cadena:= '|'+ tblFacturas.FieldByName('RFC').AsString+'|'+tblFacturas.FieldByName('Serie').AsString+'|'+tblFacturas.FieldByName('Folio').AsString+'|'+tblFacturas.FieldByName('FECHANOAPROBACION').AsString+'|'+tblFacturas.FieldByName('FECHAHORA').AsString+'|'+formatFloat('#0.00',tblFacturas.FieldByName('TOTAL').AsFloat)+'|'+FormatFloat('#0.00',tblFacturas.FieldByName('IMPUESTO').AsFloat)+'|'+'1'+'|I||||';
      GuardaArchivo(cadena, NOMARCH);

      if not(tblFacturas.FieldByName('Vigencia').AsBoolean) then
      begin
         Cadena:= '|'+ tblFacturas.FieldByName('RFC').AsString+'|'+tblFacturas.FieldByName('Serie').AsString+'|'+tblFacturas.FieldByName('Folio').AsString+'|'+tblFacturas.FieldByName('FECHANOAPROBACION').AsString+'|'+tblFacturas.FieldByName('FECHAHORA').AsString+'|'+formatFloat('#0.00',tblFacturas.FieldByName('TOTAL').AsFloat)+'|'+FormatFloat('#0.00',tblFacturas.FieldByName('IMPUESTO').AsFloat)+'|'+'0'+'|I||||';
         GuardaArchivo(cadena, NOMARCH);
      end;

      tblFacturas.Next;
  end;

  spActualizaFacturaElectronica.Close;
  spActualizaFacturaElectronica.ParamByName('VIGENCIA').AsBoolean:= tblFacturas.FieldByName('Vigencia').AsBoolean;
  spActualizaFacturaElectronica.ParamByName('FACTURAID').AsInteger:= tblFacturas.FieldByName('FacturaID').AsInteger;
  spActualizaFacturaElectronica.Open;
  spActualizaFacturaElectronica.Close;

  tblFacturas.Close;
  cdsFacturas.Close;
end;

procedure TfrmReporteSatEfectivos.btnPreeliminarClick(Sender: TObject);
begin

  cdsFacturas.Close;
  cdsFacturas.ParamByName('FECHAINI').AsDateTime:= cxDateEdit1.Date;
  cdsFacturas.ParamByName('FECHAFIN').AsDateTime:= cxDateEdit2.Date + dtpHora.Time;
  cdsFacturas.ParamByName('SERIE').AsString:= edtSerie.EditValue;
  cdsFacturas.Open;

  tblFacturas.Close;
  tblFacturas.Open;

  prgBar.Position:= 0;
  prgBar.Min:=0; prgBar.Max:= cdsFacturas.RecordCount;
  while not cdsFacturas.EOF do
  begin
    tblFacturas.Append;
    tblFacturas.FieldByName('Vigencia').AsBoolean:= cdsFacturas.FieldByName('Vigencia').AsBoolean;
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


procedure TfrmReporteSatEfectivos.FormShow(Sender: TObject);
begin
  inherited;
  cdsConfiguracion.Close;
  cdsConfiguracion.Open;
  cdsConfiguracion.Locate('NUMEROESTACION', DM.NumeroEstacion, []);

  dtpHora.Text := '23:59:59';
end;

function TfrmReporteSatEfectivos.GuardaArchivo(Texto: String; FileArch: String): Integer;
var
  F: TextFile;
begin
    {$I-}
    AssignFile( F, FileArch );
    Reset(F);
    {$I+}

    If (IOResult <> 0) then begin
      Rewrite(F);
      WriteLN( F, Texto );
      CloseFile( F );
    end
    else begin
      Append(F);
      WriteLN( F, Texto );
      CloseFile( F );
    end;
    Result:=1;
end;

procedure TfrmReporteSatEfectivos.RegisterActions;
begin
  inherited RegisterActions;
  RegisterAction(AppActions.actProcesar, ActionProcesar);
end;

procedure TfrmReporteSatEfectivos.UpdateActionsState;
begin
  inherited;
  dmAppActions.actProcesar.Enabled:=cdsFacturas.State = dsBrowse;
end;

initialization
  ModuleInfoManager.RegisterModule('Reporte SAT Efectivos', TfrmReporteSatEfectivos);

end.
