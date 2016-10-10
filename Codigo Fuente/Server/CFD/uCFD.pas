unit uCFD;

interface
uses
 {libreria ing}LibraryIngresos_Intf, SysUtils,
 {FACTURAELECT}FCTELECT,
 {cfd}cfdv22,xmldom, XMLIntf, msxmldom, XMLDoc;

 type
  TXmlCFD = Record
    cfdv22: cfdv22.IXMLComprobante;
    CadenaOriginal: String;
  end;


function GeneraCadenaOriginal(XSLFname : string; XML:TXMLDocument):String;
function generaCFD(DatosFCTElectronica: TDataFacturaElectronicaBI;
                   ArchivoCertificado   :String;
                   ArchivoClavePrivada  :String;
                   PasswordClavePrivada :String): TXmlCFD;

implementation
uses XSBuiltIns, XSLProd, Forms;

function GeneraCadenaOriginal(XSLFname : string; XML:TXMLDocument):String;
var
  XSLT: TXSLPageProducer;
  FilePath: String;
begin
  FilePath:=ExtractFilePath(Application.ExeName);
  Result:='';
  XSLT:= TXSLPageProducer.Create(Application);
  XSLT.ParseOptions := [poResolveExternals, poValidateOnParse];
  if FileExists(FilePath+'\'+XSLFname) then
  begin
     XSLT.FileName := FilePath+'\'+XSLFname;
     XSLT.XMLData := XML;
     Result := XSLT.Content;
  end;
end;

function generaCFD(DatosFCTElectronica: TDataFacturaElectronicaBI;
                   ArchivoCertificado   :String;
                   ArchivoClavePrivada  :String;
                   PasswordClavePrivada :String): TXmlCFD;
var
  fDocumentoXMLcfd: TXMLDocument;
  fXmlcfdv22: cfdv22.IXMLComprobante;
  ind: Integer;

  FCTELECT: TFCTELECT;
  Certificado: TFECertificado;
  TIPO: TTipoDigestionOpenSSL;
  Cadena: String;
begin
  try
  if strtoint(COPY(DatosFCTElectronica.FacturaElectronicaBI.Fecha,1,4)) > 2011 then TIPO:= tdSHA1;
  if COPY(DatosFCTElectronica.FacturaElectronicaBI.Fecha,1,4) = '2010' then TIPO:= tdMD5;

  fDocumentoXMLcfd := TXMLDocument.Create(nil);
  fDocumentoXMLcfd.Active := True;

  fXmlcfdv22 :=  GetComprobante(fDocumentoXMLcfd);
  fXmlcfdv22.SetAttribute('xmlns:xsi', 'http://www.w3.org/2001/XMLSchema-instance');
  fXmlcfdv22.SetAttribute('xsi:schemaLocation',
    'http://www.sat.gob.mx/cfd/2 http://www.sat.gob.mx/sitio_internet/cfd/2/cfdv22.xsd');
  fDocumentoXMLcfd.Version := '1.0';
  fDocumentoXMLcfd.Encoding:= 'UTF-8';

  // Datos del comprobante ****************************************************************
  fXmlcfdv22.Version       := '2.2';
  fXmlcfdv22.Fecha         := DatosFCTElectronica.FacturaElectronicaBI.Fecha;
  fXmlcfdv22.Serie         := DatosFCTElectronica.FacturaElectronicaBI.Serie;
  fXmlcfdv22.Folio         := DatosFCTElectronica.FacturaElectronicaBI.Folio;
  fXmlcfdv22.FormaDePago   := DatosFCTElectronica.FacturaElectronicaBI.formadePago;
  fXmlcfdv22.MetodoDePago  := DatosFCTElectronica.FacturaElectronicaBI.tipoComprobante;
  fXmlcfdv22.SubTotal      := DatosFCTElectronica.FacturaElectronicaBI.SubTotal;
  fXmlcfdv22.Total         := DatosFCTElectronica.FacturaElectronicaBI.Total;
  fXmlcfdv22.AnoAprobacion := strtoint(DatosFCTElectronica.FacturaElectronicaBI.anoAprobacion);
  fXmlcfdv22.NoAprobacion  := strtoint(DatosFCTElectronica.FacturaElectronicaBI.noAprobacion);
  fXmlcfdv22.TipoDeComprobante:= 'ingreso';

  //-------------------------------Emisor-----------------------------------------
  fXmlcfdv22.Emisor.Rfc:= DatosFCTElectronica.FacturaElectronicaBI.RFCEmisor;
  fXmlcfdv22.Emisor.Nombre:= DatosFCTElectronica.FacturaElectronicaBI.NOMEmpEmisor;
//-------------------------------Domicilio Fiscal-------------------------------
  fXmlcfdv22.Emisor.DomicilioFiscal.Calle:= DatosFCTElectronica.FacturaElectronicaBI.DireccionEm;
  fXmlcfdv22.Emisor.DomicilioFiscal.NoExterior:= DatosFCTElectronica.FacturaElectronicaBI.NOExteriorEM;
  fXmlcfdv22.Emisor.DomicilioFiscal.Colonia:= DatosFCTElectronica.FacturaElectronicaBI.ColoniaEmisor;
  fXmlcfdv22.Emisor.DomicilioFiscal.CodigoPostal:= DatosFCTElectronica.FacturaElectronicaBI.CodigoPostalEmisor;
  fXmlcfdv22.Emisor.DomicilioFiscal.Municipio:= DatosFCTElectronica.FacturaElectronicaBI.MunicipioEmisor;
  fXmlcfdv22.Emisor.DomicilioFiscal.Estado:= DatosFCTElectronica.FacturaElectronicaBI.EstadoEmisor;
  fXmlcfdv22.Emisor.DomicilioFiscal.Pais:=  DatosFCTElectronica.FacturaElectronicaBI.PaisEmisor;
if DatosFCTElectronica.FacturaElectronicaBI.Sucursal then
  begin
//-------------------------------Expedido en------------------------------------
  fXmlcfdv22.Emisor.ExpedidoEn.Calle:= DatosFCTElectronica.FacturaElectronicaBI.CalleExpedidoEn;
  fXmlcfdv22.Emisor.ExpedidoEn.NoExterior:= DatosFCTElectronica.FacturaElectronicaBI.NoExterioExpedidoEn;
  fXmlcfdv22.Emisor.ExpedidoEn.Colonia:= DatosFCTElectronica.FacturaElectronicaBI.ColoniaExpedidoEn;
  fXmlcfdv22.Emisor.ExpedidoEn.CodigoPostal:= DatosFCTElectronica.FacturaElectronicaBI.CodigoPostalExpedidoEn;
  fXmlcfdv22.Emisor.ExpedidoEn.Municipio:= DatosFCTElectronica.FacturaElectronicaBI.MunicipioExpedidoEn;
  fXmlcfdv22.Emisor.ExpedidoEn.Estado:= DatosFCTElectronica.FacturaElectronicaBI.EstadoExpedidoEn;
  fXmlcfdv22.Emisor.ExpedidoEn.Localidad:= DatosFCTElectronica.FacturaElectronicaBI.LocalidadExpedidoEn;
  fXmlcfdv22.Emisor.ExpedidoEn.Pais:= DatosFCTElectronica.FacturaElectronicaBI.PaisExpedidoEn;
//--------------------------------Receptor--------------------------------------
  end;
  fXmlcfdv22.Receptor.Rfc:= DatosFCTElectronica.FacturaElectronicaBI.RFCReceptor;
  fXmlcfdv22.Receptor.Nombre:= DatosFCTElectronica.FacturaElectronicaBI.NombreReceptor;
//--------------------------------Receptor Domicilio----------------------------
  fXmlcfdv22.Receptor.Domicilio.Calle:= DatosFCTElectronica.FacturaElectronicaBI.DomicilioReceptor;
  fXmlcfdv22.Receptor.Domicilio.NoExterior:=DatosFCTElectronica.FacturaElectronicaBI.NoExteriorReceptor;
  fXmlcfdv22.Receptor.Domicilio.Colonia:= DatosFCTElectronica.FacturaElectronicaBI.ColoniaReceptor;
  fXmlcfdv22.Receptor.Domicilio.CodigoPostal:= DatosFCTElectronica.FacturaElectronicaBI.CodigoPostalReceptor;
  fXmlcfdv22.Receptor.Domicilio.Localidad:= DatosFCTElectronica.FacturaElectronicaBI.LocalidadReceptor;
  fXmlcfdv22.Receptor.Domicilio.Municipio:= DatosFCTElectronica.FacturaElectronicaBI.MunicipioReceptor;
  fXmlcfdv22.Receptor.Domicilio.Estado:= DatosFCTElectronica.FacturaElectronicaBI.EstadoReceptor;
  fXmlcfdv22.Receptor.Domicilio.Pais:= DatosFCTElectronica.FacturaElectronicaBI.PaisReceptor;
//---------------------------------Conceptos------------------------------------
  for ind:=0 to DatosFCTElectronica.FacturaElectronicaBI.FacturaElectronicaDetalleImportes.Count - 1 do
  begin
    with fXmlcfdv22.Conceptos.Add do
    begin
      Unidad:= DatosFCTElectronica.FacturaElectronicaBI.FacturaElectronicaDetalleImportes.Items[ind].UnidadReceptor;
      Cantidad:= FORMATFLOAT('###0.00', strtofloat(DatosFCTElectronica.FacturaElectronicaBI.FacturaElectronicaDetalleImportes.Items[ind].ImporteReceptor) / strtofloat(DatosFCTElectronica.FacturaElectronicaBI.FacturaElectronicaDetalleImportes.Items[ind].ValorUnitarioReceptor));
      Descripcion:= DatosFCTElectronica.FacturaElectronicaBI.FacturaElectronicaDetalleImportes.Items[ind].DescripcionReceptor;
      ValorUnitario:= FORMATFLOAT('###0.00',strtofloat(DatosFCTElectronica.FacturaElectronicaBI.FacturaElectronicaDetalleImportes.Items[ind].ValorUnitarioReceptor));
      Importe:= FORMATFLOAT('###0.00',strtofloat(DatosFCTElectronica.FacturaElectronicaBI.FacturaElectronicaDetalleImportes.Items[ind].ImporteReceptor));
    end;
  end;
//----------------------------------Impuestos-----------------------------------
  fXmlcfdv22.Impuestos.TotalImpuestosTrasladados:= FORMATFLOAT('###0.0000',strtofloat(DatosFCTElectronica.FacturaElectronicaBI.TotalImpuesto));
//----------------------------------Impuestos Traslados-------------------------
  for ind:=0 to DatosFCTElectronica.FacturaElectronicaBI.FacturaElectronicaDetalleImpuestos.Count - 1 do
  begin
     with fXmlcfdv22.Impuestos.Traslados.Add do
     begin
       Importe:= FORMATFLOAT('###0.0000',strtofloat(DatosFCTElectronica.FacturaElectronicaBI.FacturaElectronicaDetalleImpuestos.Items[ind].ImporteImpReceptor));
       Tasa:= FORMATFLOAT('###0.0000',strtofloat(DatosFCTElectronica.FacturaElectronicaBI.FacturaElectronicaDetalleImpuestos.Items[ind].TasaReceptor));
       Impuesto:= DatosFCTElectronica.FacturaElectronicaBI.FacturaElectronicaDetalleImpuestos.Items[ind].ImpuestoReceptor;
     end;
  end;
  finally
    Cadena:= GeneraCadenaOriginal('XSLT\cadenaoriginal_2_2.xslt',fDocumentoXMLcfd);
    Certificado.Ruta:= ArchivoCertificado;
    FCTELECT:= TFCTELECT.Create(ArchivoClavePrivada,
                                PasswordClavePrivada,
                                Cadena,
                                TIPO,
                                Certificado);

    fXmlcfdv22.Certificado      :=  FCTELECT.CertificadoTexto;
    fXmlcfdv22.NoCertificado    :=  FCTELECT.CertificadoSerial;
    fXmlcfdv22.Sello            :=  FCTELECT.SelloDigital;
  end;

  Result.cfdv22:= fXmlcfdv22;
  Result.CadenaOriginal:= Cadena;
end;

end.
