program Ingresos;

uses
  Forms,
  Windows,
  ufrmPrincipal in 'ufrmPrincipal.pas' {frmPrincipal},
  uDMExcel in 'uDMExcel.pas' {DMExcel: TDataModule},
  uDM in 'uDM.pas' {DM: TDAClientDataModule},
  ufrmSplashScreen in 'ufrmSplashScreen.pas' {frmSplashScreen},
  ufrmBuscar in 'ufrmBuscar.pas' {frmBuscar},
  uDMFlotillas in 'uDMFlotillas.pas' {DMFlotillas: TDataModule},
  ufrmCatalogoUsuarios in 'ufrmCatalogoUsuarios.pas' {frmCatalogoUsuarios},
  ufrmBancos in 'ufrmBancos.pas' {frmBancos},
  ufrmBuscaMateria in 'ufrmBuscaMateria.pas' {frmBuscaMateria},
  ufrmPadre in 'ufrmPadre.pas' {frmPadre},
  ufrmOKCancelar in 'ufrmOKCancelar.pas' {frmOKCancelar},
  ufrmBuscarAlumno in 'ufrmBuscarAlumno.pas' {frmBuscarAlumno},
  ufrmFacturacionDePiso in 'ufrmFacturacionDePiso.pas' {FrmFacturacionDePiso},
  ufrmBuscarProducto in 'ufrmBuscarProducto.pas' {frmBuscarProducto},
  ufrmBuscarMaestro in 'ufrmBuscarMaestro.pas' {frmBuscarMaestro},
  ufrmConfiguracion in 'ufrmConfiguracion.pas' {frmConfiguracion},
  ufrmCatalogoProductos in 'ufrmCatalogoProductos.pas' {frmCatalogoProducto},
  ufrmAgregarAlumno in 'ufrmAgregarAlumno.pas' {frmAgregarAlumno},
  ufrmBuscarPago in 'ufrmBuscarPago.pas' {frmBuscarPago},
  ufrmDialogo in 'ufrmDialogo.pas' {frmDialogo},
  ufrmHorarios in 'ufrmHorarios.pas' {frmHorarios},
  ufrmEmpleado in 'ufrmEmpleado.pas' {frmEmpleado},
  ufrmProveedor in 'ufrmProveedor.pas' {frmProveedor},
  ufrmClienteEfectivo in 'ufrmClienteEfectivo.pas' {frmClienteEfectivo},
  ufmAlmacen in 'ufmAlmacen.pas' {frmAlmacen},
  ufrmTipodePago in 'ufrmTipodePago.pas' {frmTipodePago},
  ufrmStatus in 'ufrmStatus.pas' {frmStatus},
  ufrmTipoComprobacion in 'ufrmTipoComprobacion.pas' {frmTipoComprobacion},
  ufrmCuentasContables in 'ufrmCuentasContables.pas' {frmCuentasContables},
  ufrmChequera in 'ufrmChequera.pas' {frmChequera},
  ufrmLinea in 'ufrmLinea.pas' {frmLinea},
  ufrmMarca in 'ufrmMarca.pas' {frmMarca},
  ufrmUnidadesMedida in 'ufrmUnidadesMedida.pas' {frmUnidadesMedida},
  ufrmConceptosMovimientosBancarios in 'ufrmConceptosMovimientosBancarios.pas' {frmConceptosMovimientosBancarios},
  ufrmClienteCredito in 'ufrmClienteCredito.pas' {frmClienteCredito},
  uAgregaLinea in 'uAgregaLinea.pas' {frmAgregaLinea},
  uAgregaUnidadMedida in 'uAgregaUnidadMedida.pas' {frmAgregaUnidadMedida},
  ufrmVehiculo in 'ufrmVehiculo.pas' {frmVehiculo},
  uCurp in 'uCurp.pas' {Fo_AyudaCurp},
  uAgregarOtrosProductos in 'uAgregarOtrosProductos.pas' {Fo_AgregarVentaOtrosProductos},
  ufrmBuscarCliente in 'ufrmBuscarCliente.pas' {frmBuscarCliente},
  ufrmBuscarClienteEfectivo in 'ufrmBuscarClienteEfectivo.pas' {frmBuscarClienteEfectivo},
  ufrmCredito in 'ufrmCredito.pas' {frmCredito},
  ufrmDebito in 'ufrmDebito.pas' {frmDebito},
  ufrmAutorizaciones in 'ufrmAutorizaciones.pas' {frmAutorizaciones},
  ufrmIngreso in 'ufrmIngreso.pas' {frmIngresos},
  ufrmFacturacionXCliente in 'ufrmFacturacionXCliente.pas' {frmFacturacionXCliente},
  ufrmReenviaCorreoSATCreditos in 'ufrmReenviaCorreoSATCreditos.pas' {frmReenviaCorreoSATCreditos},
  ufrmReporteSATCreditos in 'ufrmReporteSATCreditos.pas' {frmReporteSatCreditos},
  ufrmReporteSATEfectivos in 'ufrmReporteSATEfectivos.pas' {frmReporteSatEfectivos},
  ufrmReenviaCorreoSATEfectivos in 'ufrmReenviaCorreoSATEfectivos.pas' {frmReenviaCorreoSATEfectivos},
  ufrmAltasConsumos in 'ufrmAltasConsumos.pas' {frmAltasConsumos},
  ufrmGenerarDispositivo in 'ufrmGenerarDispositivo.pas' {frmGenerarDispositivo},
  uDMCistemGas in 'uDMCistemGas.pas' {DMCistemGas: TDataModule},
  ufrmDenominacion in 'ufrmDenominacion.pas' {frmDenominacion},
  ufrmDepositos in 'ufrmDepositos.pas' {frmDepositos},
  ufrmCompras in 'ufrmCompras.pas' {FrmCompra},
  ufrmBuscarProveedor in 'ufrmBuscarProveedor.pas' {frmBuscarProveedor},
  ufrmPantallaParametrosFlotillas in 'SRV Reportes Flotillas\ufrmPantallaParametrosFlotillas.pas' {frmPantallaParametrosFlotillas},
  ufrmPantallaReportesFlotillas in 'SRV Reportes Flotillas\ufrmPantallaReportesFlotillas.pas' {frmPantallaReportesFlotillas},
  ufrmReportesConsumoFlotillas in 'SRV Reportes Flotillas\ufrmReportesConsumoFlotillas.pas' {frmReportesConsumoFlotillas},
  ufrmCatalogoReportes in 'SRV Reportes Ingresos\ufrmCatalogoReportes.pas' {frmCatalogoReportes},
  ufrmPantallaParametros in 'SRV Reportes Ingresos\ufrmPantallaParametros.pas' {frmPantallaParametros},
  ufrmPantallaReportes in 'SRV Reportes Ingresos\ufrmPantallaReportes.pas' {frmPantallaReportes},
  ufrmReportesConsumo in 'SRV Reportes Ingresos\ufrmReportesConsumo.pas' {frmReposteConsumo},
  ufrmReportesExportar in 'SRV Reportes Ingresos\ufrmReportesExportar.pas' {frmReportesExportar},
  ufrmReportesInventarios in 'SRV Reportes Ingresos\ufrmReportesInventarios.pas' {frmReportesInventarios},
  ufrmReportesPago in 'SRV Reportes Ingresos\ufrmReportesPago.pas' {frmReportePago},
  ufrmIngresoXfecha in 'ufrmIngresoXfecha.pas' {frmIngresosXfecha},
  ufrmBuscarTarjetasAditivos in 'ufrmBuscarTarjetasAditivos.pas' {frmBuscarTarjetasAdivitos},
  ufrmBuscarTarjetasGastos in 'ufrmBuscarTarjetasGastos.pas' {frmBuscarTarjetasGastos},
  ufrmDepositosxFecha in 'ufrmDepositosxFecha.pas' {frmDepositosxFecha},
  ufrmDatosIngresos in 'ufrmDatosIngresos.pas' {frmDatosIngresos},
  ufrmDatosIngresosxFecha in 'ufrmDatosIngresosxFecha.pas' {frmDatosIngresosxFecha},
  ufrmVales in 'ufrmVales.pas' {frmVales},
  ClaseGenera in 'SRV Exporta\ClaseGenera.pas',
  ufrmCatalogoReportesExporta in 'SRV Exporta\ufrmCatalogoReportesExporta.pas' {frmCatalogoReportesExporta},
  ufrmExportar in 'SRV Exporta\ufrmExportar.pas' {frmExportar},
  ufrmPantallaParametrosExporta in 'SRV Exporta\ufrmPantallaParametrosExporta.pas' {frmPantallaParametrosExporta},
  uPSI_ClaseGenera in 'SRV Exporta\uPSI_ClaseGenera.pas',
  LibraryIngresos_Intf in 'Server\LibraryIngresos_Intf.pas',
  ufrmSaldosClientes in 'ufrmSaldosClientes.pas' {frmSaldosClientes},
  ufrmSaldosPageDown in 'ufrmSaldosPageDown.pas' {DatosFacturaCliente},
  uRapFunctions in 'uRapFunctions.pas',
  uRFC in 'uRFC.pas' {Fo_AyudaRFC},
  CustomModule in 'CistemComun\CodigoFuente\CustomModule.pas' {frmCustomModule},
  dmActions in 'CistemComun\CodigoFuente\dmActions.pas' {dmAppActions: TDataModule},
  dmImagenes in 'CistemComun\CodigoFuente\dmImagenes.pas' {dmImages: TDataModule},
  ExportaDataSet in 'CistemComun\CodigoFuente\ExportaDataSet.pas',
  ImpresionTickets in 'CistemComun\CodigoFuente\ImpresionTickets.pas',
  LibXmlParser in 'CistemComun\CodigoFuente\LibXmlParser.pas',
  LoginComun in 'CistemComun\CodigoFuente\LoginComun.pas',
  Modules in 'CistemComun\CodigoFuente\Modules.pas',
  rbPrvDlg in 'CistemComun\CodigoFuente\rbPrvDlg.pas' {rbPrintPreview},
  Seguridad in 'CistemComun\CodigoFuente\Seguridad.pas',
  SynchedThreads in 'CistemComun\CodigoFuente\SynchedThreads.pas',
  ufrmCatalogo in 'CistemComun\CodigoFuente\ufrmCatalogo.pas' {frmCatalogo},
  ufrmPassword in 'CistemComun\CodigoFuente\ufrmPassword.pas' {frmPassword},
  ufrmSplash in 'CistemComun\CodigoFuente\ufrmSplash.pas' {frmSplash},
  uPSI_ExportaDataSet in 'CistemComun\CodigoFuente\uPSI_ExportaDataSet.pas',
  UtileriasComun in 'CistemComun\CodigoFuente\UtileriasComun.pas',
  LibraryCistemGas_Intf in 'CistemGas\LibraryCistemGas_Intf.pas',
  LibraryFlotillas_Intf in 'Flotillas\LibraryFlotillas_Intf.pas',
  uTurnoxFecha in 'uTurnoxFecha.pas' {Fo_TurnoxFecha},
  uAgregarVentaSalidaEfectivo in 'uAgregarVentaSalidaEfectivo.pas' {Fo_AgregarVentaSalidaEfectivo},
  uAgregarVentaOtros in 'uAgregarVentaOtros.pas' {Fo_AgregarVentaOtros},
  uAgregarVentaCreditoDebitosCupones in 'uAgregarVentaCreditoDebitosCupones.pas' {Fo_AgregarVentaCreditoDebitosCupones},
  ufrmBuscarClienteCredito in 'ufrmBuscarClienteCredito.pas' {frmBuscarClienteCredito},
  uAgregarVenta in 'uAgregarVenta.pas' {Fo_AgregarVenta},
  uAgregarVentaEfectivo in 'uAgregarVentaEfectivo.pas' {Fo_AgregarVentaEfectivo},
  uAgregarVentaDocumentos in 'uAgregarVentaDocumentos.pas' {Fo_AgregarVentaDocumentos},
  ufrmEstaciones in 'ufrmEstaciones.pas' {FrmEstaciones},
  ufrmReportesGenerales in 'SRV Reportes Ingresos\ufrmReportesGenerales.pas' {frmReportesGenerales},
  ufrmCardex in 'ufrmCardex.pas' {frmCardex};

{$R *.res}

var
  Mutex : THandle;

begin
  Mutex := CreateMutex(nil, True, 'Gauss');
  Application.MainFormOnTaskbar := True;
  if (Mutex <> 0) then
  begin
    frmSplashScreen:=TfrmSplashScreen.Create(Application);
    frmSplashScreen.Show;
    Application.Initialize;
    Application.Title := 'Ingresos 1.0';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmImages, dmImages);
  Application.CreateForm(TfrmReportesGenerales, frmReportesGenerales);
  //Application.CreateForm(TDMExcel, DMExcel);
  //Application.CreateForm(TDMFlotillas, DMFlotillas);
  //Application.CreateForm(TDMCistemGas, DMCistemGas);
  Sleep(3000);
    frmSplashScreen.Hide;
    frmSplashScreen.Free;
    Application.Run;
  end;
end.
