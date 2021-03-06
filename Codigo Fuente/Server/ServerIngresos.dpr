program ServerIngresos;

{#ROGEN:LibraryFlotillas.RODL} // RemObjects SDK: Careful, do not remove!

uses
  uROComInit,
  uROComboService,
  Forms,
  Windows,
  fServerForm in 'fServerForm.pas' {ServerForm},
  fServerDataModule in 'fServerDataModule.pas' {ServerDataModule: TDataModule},
  LibraryIngresos_Intf in 'LibraryIngresos_Intf.pas',
  LibraryIngresos_Invk in 'LibraryIngresos_Invk.pas',
  ServiceIngresos_Impl in 'ServiceIngresos_Impl.pas' {ServiceIngresos: TDataAbstractService},
  LibXmlParser in 'CistemComun\CodigoFuente\LibXmlParser.pas',
  ufrmPassword in 'CistemComun\CodigoFuente\ufrmPassword.pas' {frmPassword},
  UtileriasComun in 'CistemComun\CodigoFuente\UtileriasComun.pas',
  ufrmServerForm in 'CistemComun\CodigoFuente\ufrmServerForm.pas' {frmServerForm},
  CadenaOriginal in 'FCTELECTRONICA\CadenaOriginal.pas',
  CadenaOriginalTimbre in 'FCTELECTRONICA\CadenaOriginalTimbre.pas',
  ClaseCertificadoSellos in 'FCTELECTRONICA\ClaseCertificadoSellos.pas',
  ClaseOpenSSL in 'FCTELECTRONICA\ClaseOpenSSL.pas',
  ComprobanteFiscal in 'FCTELECTRONICA\ComprobanteFiscal.pas',
  DocComprobanteFiscal in 'FCTELECTRONICA\DocComprobanteFiscal.pas',
  FacturacionHashes in 'FCTELECTRONICA\FacturacionHashes.pas',
  FacturaElectronica in 'FCTELECTRONICA\FacturaElectronica.pas',
  FacturaReglamentacion in 'FCTELECTRONICA\FacturaReglamentacion.pas',
  FacturaTipos in 'FCTELECTRONICA\FacturaTipos.pas',
  libeay32 in 'FCTELECTRONICA\libeay32.pas',
  LibEay32Plus in 'FCTELECTRONICA\LibEay32Plus.pas',
  OpenSSLUtils in 'FCTELECTRONICA\OpenSSLUtils.pas',
  SelloDigital in 'FCTELECTRONICA\SelloDigital.pas',
  uWSHelper in 'FCTELECTRONICA\uWSHelper.pas',
  FeCFD in 'FCTELECTRONICA\CFD\FeCFD.pas',
  FeCFDv2 in 'FCTELECTRONICA\CFD\FeCFDv2.pas',
  FeCFDv22 in 'FCTELECTRONICA\CFD\FeCFDv22.pas',
  FeCFDv32 in 'FCTELECTRONICA\CFD\FeCFDv32.pas',
  FEImpuestosLocales in 'FCTELECTRONICA\CFD\FEImpuestosLocales.pas',
  FETimbreFiscalDigital in 'FCTELECTRONICA\CFD\FETimbreFiscalDigital.pas',
  GeneradorCBB in 'FCTELECTRONICA\GeneradorCBB\GeneradorCBB.pas',
  QuricolAPI in 'FCTELECTRONICA\GeneradorCBB\QuricolAPI.pas',
  QuricolCode in 'FCTELECTRONICA\GeneradorCBB\QuricolCode.pas',
  ManejadorDeErroresComunes in 'FCTELECTRONICA\PACs\ManejadorDeErroresComunes.pas',
  ProveedorAutorizadoCertificacion in 'FCTELECTRONICA\PACs\ProveedorAutorizadoCertificacion.pas',
  FECancelaComercioDigital in 'FCTELECTRONICA\PACs\ComercioDigital\FECancelaComercioDigital.pas',
  PACComercioDigital in 'FCTELECTRONICA\PACs\ComercioDigital\PACComercioDigital.pas',
  EcodexWsCancelacion in 'FCTELECTRONICA\PACs\Ecodex\EcodexWsCancelacion.pas',
  EcodexWsClientes in 'FCTELECTRONICA\PACs\Ecodex\EcodexWsClientes.pas',
  EcodexWsComun in 'FCTELECTRONICA\PACs\Ecodex\EcodexWsComun.pas',
  EcodexWsSeguridad in 'FCTELECTRONICA\PACs\Ecodex\EcodexWsSeguridad.pas',
  EcodexWsTimbrado in 'FCTELECTRONICA\PACs\Ecodex\EcodexWsTimbrado.pas',
  PAC.Ecodex.ManejadorDeSesion in 'FCTELECTRONICA\PACs\Ecodex\PAC.Ecodex.ManejadorDeSesion.pas',
  PACEcodex in 'FCTELECTRONICA\PACs\Ecodex\PACEcodex.pas',
  PACEjemplo in 'FCTELECTRONICA\PACs\Ejemplo\PACEjemplo.pas';

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
