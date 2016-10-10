program ServerIngresos;

{#ROGEN:LibraryFlotillas.RODL} // RemObjects SDK: Careful, do not remove!

uses
  uROComInit,
  uROComboService,
  Forms,
  Windows,
  fServerForm in 'fServerForm.pas' {ServerForm},
  fServerDataModule in 'fServerDataModule.pas' {ServerDataModule: TDataModule},
  libeay32 in 'libeay32.pas',
  OpenSSLUtils in 'OpenSSLUtils.pas',
  LibEay32Plus in 'LibEay32Plus.pas',
  FCTELECT in 'FCTELECT.pas',
  LibraryIngresos_Intf in 'LibraryIngresos_Intf.pas',
  LibraryIngresos_Invk in 'LibraryIngresos_Invk.pas',
  ServiceIngresos_Impl in 'ServiceIngresos_Impl.pas' {ServiceIngresos: TDataAbstractService},
  LibXmlParser in '..\CistemComun\CodigoFuente\LibXmlParser.pas',
  ufrmPassword in '..\CistemComun\CodigoFuente\ufrmPassword.pas' {frmPassword},
  ufrmServerForm in '..\CistemComun\CodigoFuente\ufrmServerForm.pas' {frmServerForm},
  UtileriasComun in '..\CistemComun\CodigoFuente\UtileriasComun.pas',
  cfdv22 in 'CFD\cfdv22.pas',
  uCFD in 'CFD\uCFD.pas',
  xslprod in 'lib Factura Electronica\xslprod.pas',
  SiteConst in 'lib Factura Electronica\SiteConst.pas';

{$R *.res}
{$R RODLFile.res}

var
  Mutex : THandle;

begin
  Mutex := CreateMutex(nil, True, 'ServerGauss');
  //if (Mutex <> 0) and (GetLastError = 0) then
  //begin
    if ROStartService('ServerIngresos', 'ServerIngresos') then
    begin
      ROService.CreateForm(TServerDataModule, ServerDataModule);
      ROService.Run;
      Exit;
    end;

    Application.Initialize;
    Application.Title := 'Server Ingresos';
  Application.CreateForm(TServerDataModule, ServerDataModule);
  Application.CreateForm(TServerForm, ServerForm);
  Application.Run;
  //end;
end.
