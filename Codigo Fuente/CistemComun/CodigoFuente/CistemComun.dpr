program CistemComun;



uses
  Forms,
  ufrmPrincipal in 'ufrmPrincipal.pas' {Form2},
  CustomModule in 'CustomModule.pas' {frmCustomModule},
  Modules in 'Modules.pas',
  Seguridad in 'Seguridad.pas',
  UtileriasComun in 'UtileriasComun.pas',
  dmActions in 'dmActions.pas' {dmAppActions: TDataModule},
  dmImagenes in 'dmImagenes.pas' {dmImages: TDataModule},
  ufrmCatalogo in 'ufrmCatalogo.pas' {frmCatalogo},
  ufrmServerForm in 'ufrmServerForm.pas' {frmServerForm},
  ExportaDataSet in 'ExportaDataSet.pas',
  uPSI_ExportaDataSet in 'uPSI_ExportaDataSet.pas',
  ufrmPassword in 'ufrmPassword.pas' {frmPassword},
  ufrmSplash in 'ufrmSplash.pas' {frmSplash},
  LibXmlParser in 'LibXmlParser.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
