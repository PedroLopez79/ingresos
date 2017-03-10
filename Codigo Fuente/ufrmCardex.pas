unit ufrmCardex;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CustomModule, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008, dxSkinTheAsphaltWorld,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData, cxTextEdit,
  cxDBLookupComboBox, Vcl.ComCtrls, dxCore, cxDateUtils, cxDropDownEdit,
  cxCalendar, Vcl.StdCtrls, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, cxLabel, cxMaskEdit,
  cxLookupEdit, cxDBLookupEdit, cxGroupBox, Vcl.Menus, cxButtons;

type
  TfrmCardex = class(TfrmCustomModule)
    grbEncabezado: TcxGroupBox;
    dbCbxAlmacen: TcxDBLookupComboBox;
    cxLabel2: TcxLabel;
    cxGroupBox6: TcxGroupBox;
    cxGrid1: TcxGrid;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridDBTableView3ProductoID: TcxGridDBColumn;
    cxDescripcion: TcxGridDBColumn;
    cxGridDBTableView3Cantidad: TcxGridDBColumn;
    cxGridDBTableView3Costo: TcxGridDBColumn;
    cxGridDBTableView3Importe: TcxGridDBColumn;
    cxGridLevel3: TcxGridLevel;
    cxLabel1: TcxLabel;
    cxEstacionDestino: TcxDBLookupComboBox;
    Label1: TLabel;
    dtpInicial: TcxDateEdit;
    Label2: TLabel;
    dtpFinal: TcxDateEdit;
    cxButton1: TcxButton;
    cxLabel3: TcxLabel;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCardex: TfrmCardex;

implementation

{$R *.dfm}

end.
