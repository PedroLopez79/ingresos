unit ufrmReporteSATCreditos;

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
  ExtDlgs, cxSpinEdit, cxTimeEdit, ComCtrls, cxCurrencyEdit,
  {xmldocument} xmldom, XMLIntf, msxmldom, XMLDoc, XSBuiltIns, ShlObj,
  dxSkinBlueprint, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinHighContrast, dxSkinMetropolis, dxSkinMetropolisDark,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray, dxSkinOffice2013White,
  dxSkinSevenClassic, dxSkinSharpPlus, dxSkinTheAsphaltWorld, dxSkinVS2010,
  dxSkinWhiteprint, dxCore, cxDateUtils, cxNavigator, uROComponent;

type
  TfrmReporteSatCreditos = class(TfrmCustomModule)
    cxGroupBox4: TcxGroupBox;
    btnPreeliminar: TcxButton;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    tblFacturas: TdxMemData;
    DataSource1: TDataSource;
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
    SaveDialog1: TSaveDialog;
    prgBar: TProgressBar;
    OpenDialog: TOpenDialog;
    Label9: TLabel;
    Label1: TLabel;
    cxDateEdit2: TcxDateEdit;
    dtpHora: TcxTimeEdit;
    cxDateEdit1: TcxDateEdit;
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
  frmReporteSatCreditos: TfrmReporteSatCreditos;

implementation

uses  Modules, dmActions, uDM,
      UtileriasComun;

{$R *.dfm}

function ChooseFolderDlg(const subtitle: string;
  const newStyle: boolean) : string;
var
  BI: TBrowseInfo;
  IL: PItemIDList;
begin
  Result := '';
  with BI do begin
    lpfn:= nil;
    lParam:= 0;
    iImage:= 0;
    pidlRoot:= nil;
    hwndOwner:= GetActiveWindow;
    lpszTitle:= PChar(subtitle);
    GetMem(pszDisplayName, MAX_PATH);
    ulFlags := BIF_RETURNONLYFSDIRS;
    if newStyle then
      ulFlags := BIF_NEWDIALOGSTYLE;
  end;
  IL := SHBrowseForFolder(BI);
  if SHGetPathFromIDList(IL, BI.pszDisplayName)
    then Result := StrPas(BI.pszDisplayName);
  FreeMem(BI.pszDisplayName);
  GlobalFreePtr(IL);
end;

procedure TfrmReporteSatCreditos.ActionProcesar(Action: TBasicAction);
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
end;

procedure TfrmReporteSatCreditos.btnPreeliminarClick(Sender: TObject);
procedure RastreaDir(Dir: String);
var FileSearch: TSearchRec;
    ind: integer;
    XMLD: TXMLDocument;
    S: String;
begin
   chDir(Dir);
   ind:= FindFirst('*.xml', faDirectory, FileSearch);

   XMLD:= TXMLDocument.Create(self);
   tblFacturas.Close;
   tblFacturas.Open;
   //prgBar.Position:= 0;
   //prgBar.Min:=0; prgBar.Max:= cdsFacturas.RecordCount;

   while ind = 0 do
   begin
     XMLD.LoadFromFile(Dir+'\'+FileSearch.Name);
     XMLD.Active:= True;
     ind:= FindNext(FileSearch);
     S:= StringReplace(XMLD.DocumentElement.Attributes['fecha'],'T',' ',[rfReplaceAll, rfIgnoreCase]);
     S:= StringReplace(S,'-','/',[rfReplaceAll, rfIgnoreCase]);
     
     tblFacturas.Append;
     tblFacturas.FieldByName('Vigencia').AsBoolean:= True;
     tblFacturas.FieldByName('RFC').AsString:= XMLD.DocumentElement.ChildNodes['Emisor'].Attributes['rfc'];
     tblFacturas.FieldByName('Serie').AsString:= XMLD.DocumentElement.Attributes['serie'];
     tblFacturas.FieldByName('Folio').AsInteger:= XMLD.DocumentElement.Attributes['folio'];
     tblFacturas.FieldByName('Total').AsFloat:= XMLD.DocumentElement.Attributes['total'];
     tblFacturas.FieldByName('Impuesto').AsFloat:= XMLD.DocumentElement.ChildNodes['Impuestos'].Attributes['totalImpuestosTrasladados'];
     tblFacturas.FieldByName('FECHANOAPROBACION').AsString:= copy(XMLD.DocumentElement.Attributes['fecha'],1,4)+cdsConfiguracion.FieldByName('noAprobacion').AsString;
     tblFacturas.FieldByName('FECHAHORA').AsString:=  S;
     //tblFacturas.FieldByName('FacturaID').AsInteger:= cdsFacturas.FieldByName('FacturaID').AsInteger;
     //prgBar.Position:= prgBar.Position + 1;
   end;
   FindClose(FileSearch);
end;
begin
  RastreaDir(ChooseFolderDlg('Seleccione Directorio',true));

  UpdateActionsState;
end;


procedure TfrmReporteSatCreditos.FormShow(Sender: TObject);
begin
  inherited;
  cdsConfiguracion.Close;
  cdsConfiguracion.Open;
  cdsConfiguracion.Locate('NUMEROESTACION', DM.NumeroEstacion, []);

  dtpHora.Text := '23:59:59';
end;

function TfrmReporteSatCreditos.GuardaArchivo(Texto: String; FileArch: String): Integer;
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

procedure TfrmReporteSatCreditos.RegisterActions;
begin
  inherited RegisterActions;
  RegisterAction(AppActions.actProcesar, ActionProcesar);
end;

procedure TfrmReporteSatCreditos.UpdateActionsState;
var abilitar:boolean;
begin
  inherited;  
  dmAppActions.actProcesar.Enabled:= tblFacturas.RecordCount > 0
end;

initialization
  ModuleInfoManager.RegisterModule('Reporte SAT Creditos', TfrmReporteSatCreditos);

end.
