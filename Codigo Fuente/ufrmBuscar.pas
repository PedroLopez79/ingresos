unit ufrmBuscar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CustomModule, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, uDADataTable, uDAScriptingProvider, uDACDSDataTable,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid,
  Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls, dxRibbon,
  dxRibbonForm, dxStatusBar, dxRibbonStatusBar, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, dxSkinsdxRibbonPainter,
  uDAInterfaces, cxContainer, cxGroupBox, cxLookAndFeels, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinValentine, dxSkinXmas2008Blue, dxSkinDarkRoom, dxSkinFoggy, dxSkinSeven,
  dxSkinSharp, dxSkinBlueprint, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinHighContrast, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinSevenClassic, dxSkinSharpPlus,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint, cxNavigator,
  dxRibbonSkins, uDAFields, uROComponent;

type
  TDatosBusqueda = record
    OK:Boolean;
    Clave, FormaPago, Tipo:Integer;
    Cuenta, RFC, Nombre, Referencia: String;
    Estatus : Variant;
    Precio, Importe, Costo: Float;
  end;

  TfrmBuscar = class(TdxcustomRibbonForm)
    dbgAgrupacion: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cdsBuscar: TDACDSDataTable;
    dsBuscar: TDADataSource;
    dxRibbon1: TdxRibbon;
    cxGroupBox1: TcxGroupBox;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    procedure cxGridDBTableView1DblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CRITERIO:String;
    Datos: TDatosBusqueda;
    procedure Filtro(parametros : string ); 
  end;

  TBuscaClass = class of TfrmBuscar;

  function PantallaBusqueda(Clase: TBuscaClass; Parametros: String = ''): TDatosBusqueda;
  
implementation

uses Modules, uDM, uDMFlotillas, dmActions, UtileriasComun;

{$R *.dfm}

function PantallaBusqueda(Clase: TBuscaClass; Parametros: String = ''): TDatosBusqueda;
var
  Pantalla: TfrmBuscar;
begin
  Pantalla:=Clase.Create(nil);
  Pantalla.Filtro(Parametros);
  Pantalla.ShowModal;
  Result:=Pantalla.Datos;
  FreeAndNil(Pantalla);
end;

procedure TfrmBuscar.Filtro(parametros: string);
begin
   cdsBuscar.Close;
   cdsBuscar.Open;
   cdsBuscar.Filtered:= False;
   if parametros <> '' then
   begin
     CRITERIO:=parametros + ',';
     cdsBuscar.Filtered:=True;
   end;
end;

procedure TfrmBuscar.cxButton2Click(Sender: TObject);
begin
   Datos.OK:= False;
   Close;
end;

procedure TfrmBuscar.cxGridDBTableView1DblClick(Sender: TObject);
begin
  inherited;
  Datos.OK:=True;
  Close;
end;

procedure TfrmBuscar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    cxGridDBTableView1DblClick(Sender);
end;

procedure TfrmBuscar.FormShow(Sender: TObject);
begin
  inherited;
  dxRibbon1.ColorSchemeName:=RibbonSchema[ColorRibbonSchema];
  //Panel1.Color:=RibbonSchema[ColorRibbonSchema].Color;
end;

end.
