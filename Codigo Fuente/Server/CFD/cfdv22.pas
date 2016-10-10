
{*********************************************************************************************************************}
{                                                                                                                     }
{                                                  XML Data Binding                                                   }
{                                                                                                                     }
{         Generated on: 2/21/2012 2:44:32 PM                                                                          }
{       Generated from: C:\Users\Peter\Documents\CISTEM V70\PROYECTO SION\GAUSS\Codigo Fuente\Server\CFD\cfdv22.xsd   }
{   Settings stored in: C:\Users\Peter\Documents\CISTEM V70\PROYECTO SION\GAUSS\Codigo Fuente\Server\CFD\cfdv22.xdb   }
{                                                                                                                     }
{*********************************************************************************************************************}

unit cfdv22;

interface

uses xmldom, XMLDoc, XMLIntf;

type

{ Forward Decls }

  IXMLComprobante = interface;
  IXMLEmisor = interface;
  IXMLT_UbicacionFiscal = interface;
  IXMLT_Ubicacion = interface;
  IXMLRegimenFiscal = interface;
  IXMLRegimenFiscalList = interface;
  IXMLReceptor = interface;
  IXMLConceptos = interface;
  IXMLConcepto = interface;
  IXMLT_InformacionAduanera = interface;
  IXMLT_InformacionAduaneraList = interface;
  IXMLCuentaPredial = interface;
  IXMLComplementoConcepto = interface;
  IXMLParte = interface;
  IXMLParteList = interface;
  IXMLImpuestos = interface;
  IXMLRetenciones = interface;
  IXMLRetencion = interface;
  IXMLTraslados = interface;
  IXMLTraslado = interface;
  IXMLComplemento = interface;
  IXMLAddenda = interface;

{ IXMLComprobante }

  IXMLComprobante = interface(IXMLNode)
    ['{1D9D5D0A-DA66-4E4B-A6C4-116B5235EA86}']
    { Property Accessors }
    function Get_Version: WideString;
    function Get_Serie: WideString;
    function Get_Folio: WideString;
    function Get_Fecha: WideString;
    function Get_Sello: WideString;
    function Get_NoAprobacion: Integer;
    function Get_AnoAprobacion: Integer;
    function Get_FormaDePago: WideString;
    function Get_NoCertificado: WideString;
    function Get_Certificado: WideString;
    function Get_CondicionesDePago: WideString;
    function Get_SubTotal: WideString;
    function Get_Descuento: WideString;
    function Get_MotivoDescuento: WideString;
    function Get_TipoCambio: WideString;
    function Get_Moneda: WideString;
    function Get_Total: WideString;
    function Get_TipoDeComprobante: WideString;
    function Get_MetodoDePago: WideString;
    function Get_LugarExpedicion: WideString;
    function Get_NumCtaPago: WideString;
    function Get_FolioFiscalOrig: WideString;
    function Get_SerieFolioFiscalOrig: WideString;
    function Get_FechaFolioFiscalOrig: WideString;
    function Get_MontoFolioFiscalOrig: WideString;
    function Get_Emisor: IXMLEmisor;
    function Get_Receptor: IXMLReceptor;
    function Get_Conceptos: IXMLConceptos;
    function Get_Impuestos: IXMLImpuestos;
    function Get_Complemento: IXMLComplemento;
    function Get_Addenda: IXMLAddenda;
    procedure Set_Version(Value: WideString);
    procedure Set_Serie(Value: WideString);
    procedure Set_Folio(Value: WideString);
    procedure Set_Fecha(Value: WideString);
    procedure Set_Sello(Value: WideString);
    procedure Set_NoAprobacion(Value: Integer);
    procedure Set_AnoAprobacion(Value: Integer);
    procedure Set_FormaDePago(Value: WideString);
    procedure Set_NoCertificado(Value: WideString);
    procedure Set_Certificado(Value: WideString);
    procedure Set_CondicionesDePago(Value: WideString);
    procedure Set_SubTotal(Value: WideString);
    procedure Set_Descuento(Value: WideString);
    procedure Set_MotivoDescuento(Value: WideString);
    procedure Set_TipoCambio(Value: WideString);
    procedure Set_Moneda(Value: WideString);
    procedure Set_Total(Value: WideString);
    procedure Set_TipoDeComprobante(Value: WideString);
    procedure Set_MetodoDePago(Value: WideString);
    procedure Set_LugarExpedicion(Value: WideString);
    procedure Set_NumCtaPago(Value: WideString);
    procedure Set_FolioFiscalOrig(Value: WideString);
    procedure Set_SerieFolioFiscalOrig(Value: WideString);
    procedure Set_FechaFolioFiscalOrig(Value: WideString);
    procedure Set_MontoFolioFiscalOrig(Value: WideString);
    { Methods & Properties }
    property Version: WideString read Get_Version write Set_Version;
    property Serie: WideString read Get_Serie write Set_Serie;
    property Folio: WideString read Get_Folio write Set_Folio;
    property Fecha: WideString read Get_Fecha write Set_Fecha;
    property Sello: WideString read Get_Sello write Set_Sello;
    property NoAprobacion: Integer read Get_NoAprobacion write Set_NoAprobacion;
    property AnoAprobacion: Integer read Get_AnoAprobacion write Set_AnoAprobacion;
    property FormaDePago: WideString read Get_FormaDePago write Set_FormaDePago;
    property NoCertificado: WideString read Get_NoCertificado write Set_NoCertificado;
    property Certificado: WideString read Get_Certificado write Set_Certificado;
    property CondicionesDePago: WideString read Get_CondicionesDePago write Set_CondicionesDePago;
    property SubTotal: WideString read Get_SubTotal write Set_SubTotal;
    property Descuento: WideString read Get_Descuento write Set_Descuento;
    property MotivoDescuento: WideString read Get_MotivoDescuento write Set_MotivoDescuento;
    property TipoCambio: WideString read Get_TipoCambio write Set_TipoCambio;
    property Moneda: WideString read Get_Moneda write Set_Moneda;
    property Total: WideString read Get_Total write Set_Total;
    property TipoDeComprobante: WideString read Get_TipoDeComprobante write Set_TipoDeComprobante;
    property MetodoDePago: WideString read Get_MetodoDePago write Set_MetodoDePago;
    property LugarExpedicion: WideString read Get_LugarExpedicion write Set_LugarExpedicion;
    property NumCtaPago: WideString read Get_NumCtaPago write Set_NumCtaPago;
    property FolioFiscalOrig: WideString read Get_FolioFiscalOrig write Set_FolioFiscalOrig;
    property SerieFolioFiscalOrig: WideString read Get_SerieFolioFiscalOrig write Set_SerieFolioFiscalOrig;
    property FechaFolioFiscalOrig: WideString read Get_FechaFolioFiscalOrig write Set_FechaFolioFiscalOrig;
    property MontoFolioFiscalOrig: WideString read Get_MontoFolioFiscalOrig write Set_MontoFolioFiscalOrig;
    property Emisor: IXMLEmisor read Get_Emisor;
    property Receptor: IXMLReceptor read Get_Receptor;
    property Conceptos: IXMLConceptos read Get_Conceptos;
    property Impuestos: IXMLImpuestos read Get_Impuestos;
    property Complemento: IXMLComplemento read Get_Complemento;
    property Addenda: IXMLAddenda read Get_Addenda;
  end;

{ IXMLEmisor }

  IXMLEmisor = interface(IXMLNode)
    ['{DDE707D2-D761-4238-801E-1A7A3739146C}']
    { Property Accessors }
    function Get_Rfc: WideString;
    function Get_Nombre: WideString;
    function Get_DomicilioFiscal: IXMLT_UbicacionFiscal;
    function Get_ExpedidoEn: IXMLT_Ubicacion;
    function Get_RegimenFiscal: IXMLRegimenFiscalList;
    procedure Set_Rfc(Value: WideString);
    procedure Set_Nombre(Value: WideString);
    { Methods & Properties }
    property Rfc: WideString read Get_Rfc write Set_Rfc;
    property Nombre: WideString read Get_Nombre write Set_Nombre;
    property DomicilioFiscal: IXMLT_UbicacionFiscal read Get_DomicilioFiscal;
    property ExpedidoEn: IXMLT_Ubicacion read Get_ExpedidoEn;
    property RegimenFiscal: IXMLRegimenFiscalList read Get_RegimenFiscal;
  end;

{ IXMLT_UbicacionFiscal }

  IXMLT_UbicacionFiscal = interface(IXMLNode)
    ['{5D39518C-F58A-443E-901F-6602FDD87C8A}']
    { Property Accessors }
    function Get_Calle: WideString;
    function Get_NoExterior: WideString;
    function Get_NoInterior: WideString;
    function Get_Colonia: WideString;
    function Get_Localidad: WideString;
    function Get_Referencia: WideString;
    function Get_Municipio: WideString;
    function Get_Estado: WideString;
    function Get_Pais: WideString;
    function Get_CodigoPostal: WideString;
    procedure Set_Calle(Value: WideString);
    procedure Set_NoExterior(Value: WideString);
    procedure Set_NoInterior(Value: WideString);
    procedure Set_Colonia(Value: WideString);
    procedure Set_Localidad(Value: WideString);
    procedure Set_Referencia(Value: WideString);
    procedure Set_Municipio(Value: WideString);
    procedure Set_Estado(Value: WideString);
    procedure Set_Pais(Value: WideString);
    procedure Set_CodigoPostal(Value: WideString);
    { Methods & Properties }
    property Calle: WideString read Get_Calle write Set_Calle;
    property NoExterior: WideString read Get_NoExterior write Set_NoExterior;
    property NoInterior: WideString read Get_NoInterior write Set_NoInterior;
    property Colonia: WideString read Get_Colonia write Set_Colonia;
    property Localidad: WideString read Get_Localidad write Set_Localidad;
    property Referencia: WideString read Get_Referencia write Set_Referencia;
    property Municipio: WideString read Get_Municipio write Set_Municipio;
    property Estado: WideString read Get_Estado write Set_Estado;
    property Pais: WideString read Get_Pais write Set_Pais;
    property CodigoPostal: WideString read Get_CodigoPostal write Set_CodigoPostal;
  end;

{ IXMLT_Ubicacion }

  IXMLT_Ubicacion = interface(IXMLNode)
    ['{D6CA3747-DE30-4301-893E-B480817E0B88}']
    { Property Accessors }
    function Get_Calle: WideString;
    function Get_NoExterior: WideString;
    function Get_NoInterior: WideString;
    function Get_Colonia: WideString;
    function Get_Localidad: WideString;
    function Get_Referencia: WideString;
    function Get_Municipio: WideString;
    function Get_Estado: WideString;
    function Get_Pais: WideString;
    function Get_CodigoPostal: WideString;
    procedure Set_Calle(Value: WideString);
    procedure Set_NoExterior(Value: WideString);
    procedure Set_NoInterior(Value: WideString);
    procedure Set_Colonia(Value: WideString);
    procedure Set_Localidad(Value: WideString);
    procedure Set_Referencia(Value: WideString);
    procedure Set_Municipio(Value: WideString);
    procedure Set_Estado(Value: WideString);
    procedure Set_Pais(Value: WideString);
    procedure Set_CodigoPostal(Value: WideString);
    { Methods & Properties }
    property Calle: WideString read Get_Calle write Set_Calle;
    property NoExterior: WideString read Get_NoExterior write Set_NoExterior;
    property NoInterior: WideString read Get_NoInterior write Set_NoInterior;
    property Colonia: WideString read Get_Colonia write Set_Colonia;
    property Localidad: WideString read Get_Localidad write Set_Localidad;
    property Referencia: WideString read Get_Referencia write Set_Referencia;
    property Municipio: WideString read Get_Municipio write Set_Municipio;
    property Estado: WideString read Get_Estado write Set_Estado;
    property Pais: WideString read Get_Pais write Set_Pais;
    property CodigoPostal: WideString read Get_CodigoPostal write Set_CodigoPostal;
  end;

{ IXMLRegimenFiscal }

  IXMLRegimenFiscal = interface(IXMLNode)
    ['{9D6F3133-0633-4564-AF35-D1BCC7DE54AE}']
    { Property Accessors }
    function Get_Regimen: WideString;
    procedure Set_Regimen(Value: WideString);
    { Methods & Properties }
    property Regimen: WideString read Get_Regimen write Set_Regimen;
  end;

{ IXMLRegimenFiscalList }

  IXMLRegimenFiscalList = interface(IXMLNodeCollection)
    ['{4E700B24-3B29-4C66-AEEE-623B51FB603B}']
    { Methods & Properties }
    function Add: IXMLRegimenFiscal;
    function Insert(const Index: Integer): IXMLRegimenFiscal;
    function Get_Item(Index: Integer): IXMLRegimenFiscal;
    property Items[Index: Integer]: IXMLRegimenFiscal read Get_Item; default;
  end;

{ IXMLReceptor }

  IXMLReceptor = interface(IXMLNode)
    ['{B1D422AD-D52A-4117-959A-A232BD2E3771}']
    { Property Accessors }
    function Get_Rfc: WideString;
    function Get_Nombre: WideString;
    function Get_Domicilio: IXMLT_Ubicacion;
    procedure Set_Rfc(Value: WideString);
    procedure Set_Nombre(Value: WideString);
    { Methods & Properties }
    property Rfc: WideString read Get_Rfc write Set_Rfc;
    property Nombre: WideString read Get_Nombre write Set_Nombre;
    property Domicilio: IXMLT_Ubicacion read Get_Domicilio;
  end;

{ IXMLConceptos }

  IXMLConceptos = interface(IXMLNodeCollection)
    ['{2CF0D12E-D939-4ECC-B81F-2AA2F16A3FA0}']
    { Property Accessors }
    function Get_Concepto(Index: Integer): IXMLConcepto;
    { Methods & Properties }
    function Add: IXMLConcepto;
    function Insert(const Index: Integer): IXMLConcepto;
    property Concepto[Index: Integer]: IXMLConcepto read Get_Concepto; default;
  end;

{ IXMLConcepto }

  IXMLConcepto = interface(IXMLNode)
    ['{3B0BCD7B-11FE-419B-9FC2-8E8C5387681A}']
    { Property Accessors }
    function Get_Cantidad: WideString;
    function Get_Unidad: WideString;
    function Get_NoIdentificacion: WideString;
    function Get_Descripcion: WideString;
    function Get_ValorUnitario: WideString;
    function Get_Importe: WideString;
    function Get_InformacionAduanera: IXMLT_InformacionAduaneraList;
    function Get_CuentaPredial: IXMLCuentaPredial;
    function Get_ComplementoConcepto: IXMLComplementoConcepto;
    function Get_Parte: IXMLParteList;
    procedure Set_Cantidad(Value: WideString);
    procedure Set_Unidad(Value: WideString);
    procedure Set_NoIdentificacion(Value: WideString);
    procedure Set_Descripcion(Value: WideString);
    procedure Set_ValorUnitario(Value: WideString);
    procedure Set_Importe(Value: WideString);
    { Methods & Properties }
    property Cantidad: WideString read Get_Cantidad write Set_Cantidad;
    property Unidad: WideString read Get_Unidad write Set_Unidad;
    property NoIdentificacion: WideString read Get_NoIdentificacion write Set_NoIdentificacion;
    property Descripcion: WideString read Get_Descripcion write Set_Descripcion;
    property ValorUnitario: WideString read Get_ValorUnitario write Set_ValorUnitario;
    property Importe: WideString read Get_Importe write Set_Importe;
    property InformacionAduanera: IXMLT_InformacionAduaneraList read Get_InformacionAduanera;
    property CuentaPredial: IXMLCuentaPredial read Get_CuentaPredial;
    property ComplementoConcepto: IXMLComplementoConcepto read Get_ComplementoConcepto;
    property Parte: IXMLParteList read Get_Parte;
  end;

{ IXMLT_InformacionAduanera }

  IXMLT_InformacionAduanera = interface(IXMLNode)
    ['{BD249CD6-C6AE-419F-A45A-84F90D3AB37A}']
    { Property Accessors }
    function Get_Numero: WideString;
    function Get_Fecha: WideString;
    function Get_Aduana: WideString;
    procedure Set_Numero(Value: WideString);
    procedure Set_Fecha(Value: WideString);
    procedure Set_Aduana(Value: WideString);
    { Methods & Properties }
    property Numero: WideString read Get_Numero write Set_Numero;
    property Fecha: WideString read Get_Fecha write Set_Fecha;
    property Aduana: WideString read Get_Aduana write Set_Aduana;
  end;

{ IXMLT_InformacionAduaneraList }

  IXMLT_InformacionAduaneraList = interface(IXMLNodeCollection)
    ['{B7520AEB-1671-4124-B18D-AC48769583D5}']
    { Methods & Properties }
    function Add: IXMLT_InformacionAduanera;
    function Insert(const Index: Integer): IXMLT_InformacionAduanera;
    function Get_Item(Index: Integer): IXMLT_InformacionAduanera;
    property Items[Index: Integer]: IXMLT_InformacionAduanera read Get_Item; default;
  end;

{ IXMLCuentaPredial }

  IXMLCuentaPredial = interface(IXMLNode)
    ['{33F51751-2C50-47EA-92C8-4D65497A9F43}']
    { Property Accessors }
    function Get_Numero: WideString;
    procedure Set_Numero(Value: WideString);
    { Methods & Properties }
    property Numero: WideString read Get_Numero write Set_Numero;
  end;

{ IXMLComplementoConcepto }

  IXMLComplementoConcepto = interface(IXMLNode)
    ['{E87A74AF-CB12-4E45-9987-49A594729D6D}']
  end;

{ IXMLParte }

  IXMLParte = interface(IXMLNodeCollection)
    ['{AA8EB060-AC85-46FA-9752-368E6923FF68}']
    { Property Accessors }
    function Get_Cantidad: WideString;
    function Get_Unidad: WideString;
    function Get_NoIdentificacion: WideString;
    function Get_Descripcion: WideString;
    function Get_ValorUnitario: WideString;
    function Get_Importe: WideString;
    function Get_InformacionAduanera(Index: Integer): IXMLT_InformacionAduanera;
    procedure Set_Cantidad(Value: WideString);
    procedure Set_Unidad(Value: WideString);
    procedure Set_NoIdentificacion(Value: WideString);
    procedure Set_Descripcion(Value: WideString);
    procedure Set_ValorUnitario(Value: WideString);
    procedure Set_Importe(Value: WideString);
    { Methods & Properties }
    function Add: IXMLT_InformacionAduanera;
    function Insert(const Index: Integer): IXMLT_InformacionAduanera;
    property Cantidad: WideString read Get_Cantidad write Set_Cantidad;
    property Unidad: WideString read Get_Unidad write Set_Unidad;
    property NoIdentificacion: WideString read Get_NoIdentificacion write Set_NoIdentificacion;
    property Descripcion: WideString read Get_Descripcion write Set_Descripcion;
    property ValorUnitario: WideString read Get_ValorUnitario write Set_ValorUnitario;
    property Importe: WideString read Get_Importe write Set_Importe;
    property InformacionAduanera[Index: Integer]: IXMLT_InformacionAduanera read Get_InformacionAduanera; default;
  end;

{ IXMLParteList }

  IXMLParteList = interface(IXMLNodeCollection)
    ['{A2CAE446-611E-4D3B-BAE3-AC1FE9BE6607}']
    { Methods & Properties }
    function Add: IXMLParte;
    function Insert(const Index: Integer): IXMLParte;
    function Get_Item(Index: Integer): IXMLParte;
    property Items[Index: Integer]: IXMLParte read Get_Item; default;
  end;

{ IXMLImpuestos }

  IXMLImpuestos = interface(IXMLNode)
    ['{FC88789C-E604-40B7-A2DC-BF306812A2B8}']
    { Property Accessors }
    function Get_TotalImpuestosRetenidos: WideString;
    function Get_TotalImpuestosTrasladados: WideString;
    function Get_Retenciones: IXMLRetenciones;
    function Get_Traslados: IXMLTraslados;
    procedure Set_TotalImpuestosRetenidos(Value: WideString);
    procedure Set_TotalImpuestosTrasladados(Value: WideString);
    { Methods & Properties }
    property TotalImpuestosRetenidos: WideString read Get_TotalImpuestosRetenidos write Set_TotalImpuestosRetenidos;
    property TotalImpuestosTrasladados: WideString read Get_TotalImpuestosTrasladados write Set_TotalImpuestosTrasladados;
    property Retenciones: IXMLRetenciones read Get_Retenciones;
    property Traslados: IXMLTraslados read Get_Traslados;
  end;

{ IXMLRetenciones }

  IXMLRetenciones = interface(IXMLNodeCollection)
    ['{CC2E7843-EA05-41BD-8FF8-BBF440F1FBA7}']
    { Property Accessors }
    function Get_Retencion(Index: Integer): IXMLRetencion;
    { Methods & Properties }
    function Add: IXMLRetencion;
    function Insert(const Index: Integer): IXMLRetencion;
    property Retencion[Index: Integer]: IXMLRetencion read Get_Retencion; default;
  end;

{ IXMLRetencion }

  IXMLRetencion = interface(IXMLNode)
    ['{1117859D-5D23-4495-91F7-FE334974F3A3}']
    { Property Accessors }
    function Get_Impuesto: WideString;
    function Get_Importe: WideString;
    procedure Set_Impuesto(Value: WideString);
    procedure Set_Importe(Value: WideString);
    { Methods & Properties }
    property Impuesto: WideString read Get_Impuesto write Set_Impuesto;
    property Importe: WideString read Get_Importe write Set_Importe;
  end;

{ IXMLTraslados }

  IXMLTraslados = interface(IXMLNodeCollection)
    ['{23B3ED19-4F81-41A2-A2A4-58C1049AB820}']
    { Property Accessors }
    function Get_Traslado(Index: Integer): IXMLTraslado;
    { Methods & Properties }
    function Add: IXMLTraslado;
    function Insert(const Index: Integer): IXMLTraslado;
    property Traslado[Index: Integer]: IXMLTraslado read Get_Traslado; default;
  end;

{ IXMLTraslado }

  IXMLTraslado = interface(IXMLNode)
    ['{68B3F1F7-5859-4AA7-9E42-97BD779A9D65}']
    { Property Accessors }
    function Get_Impuesto: WideString;
    function Get_Tasa: WideString;
    function Get_Importe: WideString;
    procedure Set_Impuesto(Value: WideString);
    procedure Set_Tasa(Value: WideString);
    procedure Set_Importe(Value: WideString);
    { Methods & Properties }
    property Impuesto: WideString read Get_Impuesto write Set_Impuesto;
    property Tasa: WideString read Get_Tasa write Set_Tasa;
    property Importe: WideString read Get_Importe write Set_Importe;
  end;

{ IXMLComplemento }

  IXMLComplemento = interface(IXMLNode)
    ['{0BFFB698-874E-4D7A-955F-F9402326595B}']
  end;

{ IXMLAddenda }

  IXMLAddenda = interface(IXMLNode)
    ['{B383093D-BCE3-4883-B360-C2D34B4D1C1D}']
  end;

{ Forward Decls }

  TXMLComprobante = class;
  TXMLEmisor = class;
  TXMLT_UbicacionFiscal = class;
  TXMLT_Ubicacion = class;
  TXMLRegimenFiscal = class;
  TXMLRegimenFiscalList = class;
  TXMLReceptor = class;
  TXMLConceptos = class;
  TXMLConcepto = class;
  TXMLT_InformacionAduanera = class;
  TXMLT_InformacionAduaneraList = class;
  TXMLCuentaPredial = class;
  TXMLComplementoConcepto = class;
  TXMLParte = class;
  TXMLParteList = class;
  TXMLImpuestos = class;
  TXMLRetenciones = class;
  TXMLRetencion = class;
  TXMLTraslados = class;
  TXMLTraslado = class;
  TXMLComplemento = class;
  TXMLAddenda = class;

{ TXMLComprobante }

  TXMLComprobante = class(TXMLNode, IXMLComprobante)
  protected
    { IXMLComprobante }
    function Get_Version: WideString;
    function Get_Serie: WideString;
    function Get_Folio: WideString;
    function Get_Fecha: WideString;
    function Get_Sello: WideString;
    function Get_NoAprobacion: Integer;
    function Get_AnoAprobacion: Integer;
    function Get_FormaDePago: WideString;
    function Get_NoCertificado: WideString;
    function Get_Certificado: WideString;
    function Get_CondicionesDePago: WideString;
    function Get_SubTotal: WideString;
    function Get_Descuento: WideString;
    function Get_MotivoDescuento: WideString;
    function Get_TipoCambio: WideString;
    function Get_Moneda: WideString;
    function Get_Total: WideString;
    function Get_TipoDeComprobante: WideString;
    function Get_MetodoDePago: WideString;
    function Get_LugarExpedicion: WideString;
    function Get_NumCtaPago: WideString;
    function Get_FolioFiscalOrig: WideString;
    function Get_SerieFolioFiscalOrig: WideString;
    function Get_FechaFolioFiscalOrig: WideString;
    function Get_MontoFolioFiscalOrig: WideString;
    function Get_Emisor: IXMLEmisor;
    function Get_Receptor: IXMLReceptor;
    function Get_Conceptos: IXMLConceptos;
    function Get_Impuestos: IXMLImpuestos;
    function Get_Complemento: IXMLComplemento;
    function Get_Addenda: IXMLAddenda;
    procedure Set_Version(Value: WideString);
    procedure Set_Serie(Value: WideString);
    procedure Set_Folio(Value: WideString);
    procedure Set_Fecha(Value: WideString);
    procedure Set_Sello(Value: WideString);
    procedure Set_NoAprobacion(Value: Integer);
    procedure Set_AnoAprobacion(Value: Integer);
    procedure Set_FormaDePago(Value: WideString);
    procedure Set_NoCertificado(Value: WideString);
    procedure Set_Certificado(Value: WideString);
    procedure Set_CondicionesDePago(Value: WideString);
    procedure Set_SubTotal(Value: WideString);
    procedure Set_Descuento(Value: WideString);
    procedure Set_MotivoDescuento(Value: WideString);
    procedure Set_TipoCambio(Value: WideString);
    procedure Set_Moneda(Value: WideString);
    procedure Set_Total(Value: WideString);
    procedure Set_TipoDeComprobante(Value: WideString);
    procedure Set_MetodoDePago(Value: WideString);
    procedure Set_LugarExpedicion(Value: WideString);
    procedure Set_NumCtaPago(Value: WideString);
    procedure Set_FolioFiscalOrig(Value: WideString);
    procedure Set_SerieFolioFiscalOrig(Value: WideString);
    procedure Set_FechaFolioFiscalOrig(Value: WideString);
    procedure Set_MontoFolioFiscalOrig(Value: WideString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLEmisor }

  TXMLEmisor = class(TXMLNode, IXMLEmisor)
  private
    FRegimenFiscal: IXMLRegimenFiscalList;
  protected
    { IXMLEmisor }
    function Get_Rfc: WideString;
    function Get_Nombre: WideString;
    function Get_DomicilioFiscal: IXMLT_UbicacionFiscal;
    function Get_ExpedidoEn: IXMLT_Ubicacion;
    function Get_RegimenFiscal: IXMLRegimenFiscalList;
    procedure Set_Rfc(Value: WideString);
    procedure Set_Nombre(Value: WideString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLT_UbicacionFiscal }

  TXMLT_UbicacionFiscal = class(TXMLNode, IXMLT_UbicacionFiscal)
  protected
    { IXMLT_UbicacionFiscal }
    function Get_Calle: WideString;
    function Get_NoExterior: WideString;
    function Get_NoInterior: WideString;
    function Get_Colonia: WideString;
    function Get_Localidad: WideString;
    function Get_Referencia: WideString;
    function Get_Municipio: WideString;
    function Get_Estado: WideString;
    function Get_Pais: WideString;
    function Get_CodigoPostal: WideString;
    procedure Set_Calle(Value: WideString);
    procedure Set_NoExterior(Value: WideString);
    procedure Set_NoInterior(Value: WideString);
    procedure Set_Colonia(Value: WideString);
    procedure Set_Localidad(Value: WideString);
    procedure Set_Referencia(Value: WideString);
    procedure Set_Municipio(Value: WideString);
    procedure Set_Estado(Value: WideString);
    procedure Set_Pais(Value: WideString);
    procedure Set_CodigoPostal(Value: WideString);
  end;

{ TXMLT_Ubicacion }

  TXMLT_Ubicacion = class(TXMLNode, IXMLT_Ubicacion)
  protected
    { IXMLT_Ubicacion }
    function Get_Calle: WideString;
    function Get_NoExterior: WideString;
    function Get_NoInterior: WideString;
    function Get_Colonia: WideString;
    function Get_Localidad: WideString;
    function Get_Referencia: WideString;
    function Get_Municipio: WideString;
    function Get_Estado: WideString;
    function Get_Pais: WideString;
    function Get_CodigoPostal: WideString;
    procedure Set_Calle(Value: WideString);
    procedure Set_NoExterior(Value: WideString);
    procedure Set_NoInterior(Value: WideString);
    procedure Set_Colonia(Value: WideString);
    procedure Set_Localidad(Value: WideString);
    procedure Set_Referencia(Value: WideString);
    procedure Set_Municipio(Value: WideString);
    procedure Set_Estado(Value: WideString);
    procedure Set_Pais(Value: WideString);
    procedure Set_CodigoPostal(Value: WideString);
  end;

{ TXMLRegimenFiscal }

  TXMLRegimenFiscal = class(TXMLNode, IXMLRegimenFiscal)
  protected
    { IXMLRegimenFiscal }
    function Get_Regimen: WideString;
    procedure Set_Regimen(Value: WideString);
  end;

{ TXMLRegimenFiscalList }

  TXMLRegimenFiscalList = class(TXMLNodeCollection, IXMLRegimenFiscalList)
  protected
    { IXMLRegimenFiscalList }
    function Add: IXMLRegimenFiscal;
    function Insert(const Index: Integer): IXMLRegimenFiscal;
    function Get_Item(Index: Integer): IXMLRegimenFiscal;
  end;

{ TXMLReceptor }

  TXMLReceptor = class(TXMLNode, IXMLReceptor)
  protected
    { IXMLReceptor }
    function Get_Rfc: WideString;
    function Get_Nombre: WideString;
    function Get_Domicilio: IXMLT_Ubicacion;
    procedure Set_Rfc(Value: WideString);
    procedure Set_Nombre(Value: WideString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLConceptos }

  TXMLConceptos = class(TXMLNodeCollection, IXMLConceptos)
  protected
    { IXMLConceptos }
    function Get_Concepto(Index: Integer): IXMLConcepto;
    function Add: IXMLConcepto;
    function Insert(const Index: Integer): IXMLConcepto;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLConcepto }

  TXMLConcepto = class(TXMLNode, IXMLConcepto)
  private
    FInformacionAduanera: IXMLT_InformacionAduaneraList;
    FParte: IXMLParteList;
  protected
    { IXMLConcepto }
    function Get_Cantidad: WideString;
    function Get_Unidad: WideString;
    function Get_NoIdentificacion: WideString;
    function Get_Descripcion: WideString;
    function Get_ValorUnitario: WideString;
    function Get_Importe: WideString;
    function Get_InformacionAduanera: IXMLT_InformacionAduaneraList;
    function Get_CuentaPredial: IXMLCuentaPredial;
    function Get_ComplementoConcepto: IXMLComplementoConcepto;
    function Get_Parte: IXMLParteList;
    procedure Set_Cantidad(Value: WideString);
    procedure Set_Unidad(Value: WideString);
    procedure Set_NoIdentificacion(Value: WideString);
    procedure Set_Descripcion(Value: WideString);
    procedure Set_ValorUnitario(Value: WideString);
    procedure Set_Importe(Value: WideString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLT_InformacionAduanera }

  TXMLT_InformacionAduanera = class(TXMLNode, IXMLT_InformacionAduanera)
  protected
    { IXMLT_InformacionAduanera }
    function Get_Numero: WideString;
    function Get_Fecha: WideString;
    function Get_Aduana: WideString;
    procedure Set_Numero(Value: WideString);
    procedure Set_Fecha(Value: WideString);
    procedure Set_Aduana(Value: WideString);
  end;

{ TXMLT_InformacionAduaneraList }

  TXMLT_InformacionAduaneraList = class(TXMLNodeCollection, IXMLT_InformacionAduaneraList)
  protected
    { IXMLT_InformacionAduaneraList }
    function Add: IXMLT_InformacionAduanera;
    function Insert(const Index: Integer): IXMLT_InformacionAduanera;
    function Get_Item(Index: Integer): IXMLT_InformacionAduanera;
  end;

{ TXMLCuentaPredial }

  TXMLCuentaPredial = class(TXMLNode, IXMLCuentaPredial)
  protected
    { IXMLCuentaPredial }
    function Get_Numero: WideString;
    procedure Set_Numero(Value: WideString);
  end;

{ TXMLComplementoConcepto }

  TXMLComplementoConcepto = class(TXMLNode, IXMLComplementoConcepto)
  protected
    { IXMLComplementoConcepto }
  end;

{ TXMLParte }

  TXMLParte = class(TXMLNodeCollection, IXMLParte)
  protected
    { IXMLParte }
    function Get_Cantidad: WideString;
    function Get_Unidad: WideString;
    function Get_NoIdentificacion: WideString;
    function Get_Descripcion: WideString;
    function Get_ValorUnitario: WideString;
    function Get_Importe: WideString;
    function Get_InformacionAduanera(Index: Integer): IXMLT_InformacionAduanera;
    procedure Set_Cantidad(Value: WideString);
    procedure Set_Unidad(Value: WideString);
    procedure Set_NoIdentificacion(Value: WideString);
    procedure Set_Descripcion(Value: WideString);
    procedure Set_ValorUnitario(Value: WideString);
    procedure Set_Importe(Value: WideString);
    function Add: IXMLT_InformacionAduanera;
    function Insert(const Index: Integer): IXMLT_InformacionAduanera;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLParteList }

  TXMLParteList = class(TXMLNodeCollection, IXMLParteList)
  protected
    { IXMLParteList }
    function Add: IXMLParte;
    function Insert(const Index: Integer): IXMLParte;
    function Get_Item(Index: Integer): IXMLParte;
  end;

{ TXMLImpuestos }

  TXMLImpuestos = class(TXMLNode, IXMLImpuestos)
  protected
    { IXMLImpuestos }
    function Get_TotalImpuestosRetenidos: WideString;
    function Get_TotalImpuestosTrasladados: WideString;
    function Get_Retenciones: IXMLRetenciones;
    function Get_Traslados: IXMLTraslados;
    procedure Set_TotalImpuestosRetenidos(Value: WideString);
    procedure Set_TotalImpuestosTrasladados(Value: WideString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLRetenciones }

  TXMLRetenciones = class(TXMLNodeCollection, IXMLRetenciones)
  protected
    { IXMLRetenciones }
    function Get_Retencion(Index: Integer): IXMLRetencion;
    function Add: IXMLRetencion;
    function Insert(const Index: Integer): IXMLRetencion;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLRetencion }

  TXMLRetencion = class(TXMLNode, IXMLRetencion)
  protected
    { IXMLRetencion }
    function Get_Impuesto: WideString;
    function Get_Importe: WideString;
    procedure Set_Impuesto(Value: WideString);
    procedure Set_Importe(Value: WideString);
  end;

{ TXMLTraslados }

  TXMLTraslados = class(TXMLNodeCollection, IXMLTraslados)
  protected
    { IXMLTraslados }
    function Get_Traslado(Index: Integer): IXMLTraslado;
    function Add: IXMLTraslado;
    function Insert(const Index: Integer): IXMLTraslado;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLTraslado }

  TXMLTraslado = class(TXMLNode, IXMLTraslado)
  protected
    { IXMLTraslado }
    function Get_Impuesto: WideString;
    function Get_Tasa: WideString;
    function Get_Importe: WideString;
    procedure Set_Impuesto(Value: WideString);
    procedure Set_Tasa(Value: WideString);
    procedure Set_Importe(Value: WideString);
  end;

{ TXMLComplemento }

  TXMLComplemento = class(TXMLNode, IXMLComplemento)
  protected
    { IXMLComplemento }
  end;

{ TXMLAddenda }

  TXMLAddenda = class(TXMLNode, IXMLAddenda)
  protected
    { IXMLAddenda }
  end;

{ Global Functions }

function GetComprobante(Doc: IXMLDocument): IXMLComprobante;
function LoadComprobante(const FileName: WideString): IXMLComprobante;
function NewComprobante: IXMLComprobante;

const
  TargetNamespace = 'http://www.sat.gob.mx/cfd/2';

implementation

{ Global Functions }

function GetComprobante(Doc: IXMLDocument): IXMLComprobante;
begin
  Result := Doc.GetDocBinding('Comprobante', TXMLComprobante, TargetNamespace) as IXMLComprobante;
end;

function LoadComprobante(const FileName: WideString): IXMLComprobante;
begin
  Result := LoadXMLDocument(FileName).GetDocBinding('Comprobante', TXMLComprobante, TargetNamespace) as IXMLComprobante;
end;

function NewComprobante: IXMLComprobante;
begin
  Result := NewXMLDocument.GetDocBinding('Comprobante', TXMLComprobante, TargetNamespace) as IXMLComprobante;
end;

{ TXMLComprobante }

procedure TXMLComprobante.AfterConstruction;
begin
  RegisterChildNode('Emisor', TXMLEmisor);
  RegisterChildNode('Receptor', TXMLReceptor);
  RegisterChildNode('Conceptos', TXMLConceptos);
  RegisterChildNode('Impuestos', TXMLImpuestos);
  RegisterChildNode('Complemento', TXMLComplemento);
  RegisterChildNode('Addenda', TXMLAddenda);
  inherited;
end;

function TXMLComprobante.Get_Version: WideString;
begin
  Result := AttributeNodes['version'].Text;
end;

procedure TXMLComprobante.Set_Version(Value: WideString);
begin
  SetAttribute('version', Value);
end;

function TXMLComprobante.Get_Serie: WideString;
begin
  Result := AttributeNodes['serie'].Text;
end;

procedure TXMLComprobante.Set_Serie(Value: WideString);
begin
  SetAttribute('serie', Value);
end;

function TXMLComprobante.Get_Folio: WideString;
begin
  Result := AttributeNodes['folio'].Text;
end;

procedure TXMLComprobante.Set_Folio(Value: WideString);
begin
  SetAttribute('folio', Value);
end;

function TXMLComprobante.Get_Fecha: WideString;
begin
  Result := AttributeNodes['fecha'].Text;
end;

procedure TXMLComprobante.Set_Fecha(Value: WideString);
begin
  SetAttribute('fecha', Value);
end;

function TXMLComprobante.Get_Sello: WideString;
begin
  Result := AttributeNodes['sello'].Text;
end;

procedure TXMLComprobante.Set_Sello(Value: WideString);
begin
  SetAttribute('sello', Value);
end;

function TXMLComprobante.Get_NoAprobacion: Integer;
begin
  Result := AttributeNodes['noAprobacion'].NodeValue;
end;

procedure TXMLComprobante.Set_NoAprobacion(Value: Integer);
begin
  SetAttribute('noAprobacion', Value);
end;

function TXMLComprobante.Get_AnoAprobacion: Integer;
begin
  Result := AttributeNodes['anoAprobacion'].NodeValue;
end;

procedure TXMLComprobante.Set_AnoAprobacion(Value: Integer);
begin
  SetAttribute('anoAprobacion', Value);
end;

function TXMLComprobante.Get_FormaDePago: WideString;
begin
  Result := AttributeNodes['formaDePago'].Text;
end;

procedure TXMLComprobante.Set_FormaDePago(Value: WideString);
begin
  SetAttribute('formaDePago', Value);
end;

function TXMLComprobante.Get_NoCertificado: WideString;
begin
  Result := AttributeNodes['noCertificado'].Text;
end;

procedure TXMLComprobante.Set_NoCertificado(Value: WideString);
begin
  SetAttribute('noCertificado', Value);
end;

function TXMLComprobante.Get_Certificado: WideString;
begin
  Result := AttributeNodes['certificado'].Text;
end;

procedure TXMLComprobante.Set_Certificado(Value: WideString);
begin
  SetAttribute('certificado', Value);
end;

function TXMLComprobante.Get_CondicionesDePago: WideString;
begin
  Result := AttributeNodes['condicionesDePago'].Text;
end;

procedure TXMLComprobante.Set_CondicionesDePago(Value: WideString);
begin
  SetAttribute('condicionesDePago', Value);
end;

function TXMLComprobante.Get_SubTotal: WideString;
begin
  Result := AttributeNodes['subTotal'].Text;
end;

procedure TXMLComprobante.Set_SubTotal(Value: WideString);
begin
  SetAttribute('subTotal', Value);
end;

function TXMLComprobante.Get_Descuento: WideString;
begin
  Result := AttributeNodes['descuento'].Text;
end;

procedure TXMLComprobante.Set_Descuento(Value: WideString);
begin
  SetAttribute('descuento', Value);
end;

function TXMLComprobante.Get_MotivoDescuento: WideString;
begin
  Result := AttributeNodes['motivoDescuento'].Text;
end;

procedure TXMLComprobante.Set_MotivoDescuento(Value: WideString);
begin
  SetAttribute('motivoDescuento', Value);
end;

function TXMLComprobante.Get_TipoCambio: WideString;
begin
  Result := AttributeNodes['TipoCambio'].Text;
end;

procedure TXMLComprobante.Set_TipoCambio(Value: WideString);
begin
  SetAttribute('TipoCambio', Value);
end;

function TXMLComprobante.Get_Moneda: WideString;
begin
  Result := AttributeNodes['Moneda'].Text;
end;

procedure TXMLComprobante.Set_Moneda(Value: WideString);
begin
  SetAttribute('Moneda', Value);
end;

function TXMLComprobante.Get_Total: WideString;
begin
  Result := AttributeNodes['total'].Text;
end;

procedure TXMLComprobante.Set_Total(Value: WideString);
begin
  SetAttribute('total', Value);
end;

function TXMLComprobante.Get_TipoDeComprobante: WideString;
begin
  Result := AttributeNodes['tipoDeComprobante'].Text;
end;

procedure TXMLComprobante.Set_TipoDeComprobante(Value: WideString);
begin
  SetAttribute('tipoDeComprobante', Value);
end;

function TXMLComprobante.Get_MetodoDePago: WideString;
begin
  Result := AttributeNodes['metodoDePago'].Text;
end;

procedure TXMLComprobante.Set_MetodoDePago(Value: WideString);
begin
  SetAttribute('metodoDePago', Value);
end;

function TXMLComprobante.Get_LugarExpedicion: WideString;
begin
  Result := AttributeNodes['LugarExpedicion'].Text;
end;

procedure TXMLComprobante.Set_LugarExpedicion(Value: WideString);
begin
  SetAttribute('LugarExpedicion', Value);
end;

function TXMLComprobante.Get_NumCtaPago: WideString;
begin
  Result := AttributeNodes['NumCtaPago'].Text;
end;

procedure TXMLComprobante.Set_NumCtaPago(Value: WideString);
begin
  SetAttribute('NumCtaPago', Value);
end;

function TXMLComprobante.Get_FolioFiscalOrig: WideString;
begin
  Result := AttributeNodes['FolioFiscalOrig'].Text;
end;

procedure TXMLComprobante.Set_FolioFiscalOrig(Value: WideString);
begin
  SetAttribute('FolioFiscalOrig', Value);
end;

function TXMLComprobante.Get_SerieFolioFiscalOrig: WideString;
begin
  Result := AttributeNodes['SerieFolioFiscalOrig'].Text;
end;

procedure TXMLComprobante.Set_SerieFolioFiscalOrig(Value: WideString);
begin
  SetAttribute('SerieFolioFiscalOrig', Value);
end;

function TXMLComprobante.Get_FechaFolioFiscalOrig: WideString;
begin
  Result := AttributeNodes['FechaFolioFiscalOrig'].Text;
end;

procedure TXMLComprobante.Set_FechaFolioFiscalOrig(Value: WideString);
begin
  SetAttribute('FechaFolioFiscalOrig', Value);
end;

function TXMLComprobante.Get_MontoFolioFiscalOrig: WideString;
begin
  Result := AttributeNodes['MontoFolioFiscalOrig'].Text;
end;

procedure TXMLComprobante.Set_MontoFolioFiscalOrig(Value: WideString);
begin
  SetAttribute('MontoFolioFiscalOrig', Value);
end;

function TXMLComprobante.Get_Emisor: IXMLEmisor;
begin
  Result := ChildNodes['Emisor'] as IXMLEmisor;
end;

function TXMLComprobante.Get_Receptor: IXMLReceptor;
begin
  Result := ChildNodes['Receptor'] as IXMLReceptor;
end;

function TXMLComprobante.Get_Conceptos: IXMLConceptos;
begin
  Result := ChildNodes['Conceptos'] as IXMLConceptos;
end;

function TXMLComprobante.Get_Impuestos: IXMLImpuestos;
begin
  Result := ChildNodes['Impuestos'] as IXMLImpuestos;
end;

function TXMLComprobante.Get_Complemento: IXMLComplemento;
begin
  Result := ChildNodes['Complemento'] as IXMLComplemento;
end;

function TXMLComprobante.Get_Addenda: IXMLAddenda;
begin
  Result := ChildNodes['Addenda'] as IXMLAddenda;
end;

{ TXMLEmisor }

procedure TXMLEmisor.AfterConstruction;
begin
  RegisterChildNode('DomicilioFiscal', TXMLT_UbicacionFiscal);
  RegisterChildNode('ExpedidoEn', TXMLT_Ubicacion);
  RegisterChildNode('RegimenFiscal', TXMLRegimenFiscal);
  FRegimenFiscal := CreateCollection(TXMLRegimenFiscalList, IXMLRegimenFiscal, 'RegimenFiscal') as IXMLRegimenFiscalList;
  inherited;
end;

function TXMLEmisor.Get_Rfc: WideString;
begin
  Result := AttributeNodes['rfc'].Text;
end;

procedure TXMLEmisor.Set_Rfc(Value: WideString);
begin
  SetAttribute('rfc', Value);
end;

function TXMLEmisor.Get_Nombre: WideString;
begin
  Result := AttributeNodes['nombre'].Text;
end;

procedure TXMLEmisor.Set_Nombre(Value: WideString);
begin
  SetAttribute('nombre', Value);
end;

function TXMLEmisor.Get_DomicilioFiscal: IXMLT_UbicacionFiscal;
begin
  Result := ChildNodes['DomicilioFiscal'] as IXMLT_UbicacionFiscal;
end;

function TXMLEmisor.Get_ExpedidoEn: IXMLT_Ubicacion;
begin
  Result := ChildNodes['ExpedidoEn'] as IXMLT_Ubicacion;
end;

function TXMLEmisor.Get_RegimenFiscal: IXMLRegimenFiscalList;
begin
  Result := FRegimenFiscal;
end;

{ TXMLT_UbicacionFiscal }

function TXMLT_UbicacionFiscal.Get_Calle: WideString;
begin
  Result := AttributeNodes['calle'].Text;
end;

procedure TXMLT_UbicacionFiscal.Set_Calle(Value: WideString);
begin
  SetAttribute('calle', Value);
end;

function TXMLT_UbicacionFiscal.Get_NoExterior: WideString;
begin
  Result := AttributeNodes['noExterior'].Text;
end;

procedure TXMLT_UbicacionFiscal.Set_NoExterior(Value: WideString);
begin
  SetAttribute('noExterior', Value);
end;

function TXMLT_UbicacionFiscal.Get_NoInterior: WideString;
begin
  Result := AttributeNodes['noInterior'].Text;
end;

procedure TXMLT_UbicacionFiscal.Set_NoInterior(Value: WideString);
begin
  SetAttribute('noInterior', Value);
end;

function TXMLT_UbicacionFiscal.Get_Colonia: WideString;
begin
  Result := AttributeNodes['colonia'].Text;
end;

procedure TXMLT_UbicacionFiscal.Set_Colonia(Value: WideString);
begin
  SetAttribute('colonia', Value);
end;

function TXMLT_UbicacionFiscal.Get_Localidad: WideString;
begin
  Result := AttributeNodes['localidad'].Text;
end;

procedure TXMLT_UbicacionFiscal.Set_Localidad(Value: WideString);
begin
  SetAttribute('localidad', Value);
end;

function TXMLT_UbicacionFiscal.Get_Referencia: WideString;
begin
  Result := AttributeNodes['referencia'].Text;
end;

procedure TXMLT_UbicacionFiscal.Set_Referencia(Value: WideString);
begin
  SetAttribute('referencia', Value);
end;

function TXMLT_UbicacionFiscal.Get_Municipio: WideString;
begin
  Result := AttributeNodes['municipio'].Text;
end;

procedure TXMLT_UbicacionFiscal.Set_Municipio(Value: WideString);
begin
  SetAttribute('municipio', Value);
end;

function TXMLT_UbicacionFiscal.Get_Estado: WideString;
begin
  Result := AttributeNodes['estado'].Text;
end;

procedure TXMLT_UbicacionFiscal.Set_Estado(Value: WideString);
begin
  SetAttribute('estado', Value);
end;

function TXMLT_UbicacionFiscal.Get_Pais: WideString;
begin
  Result := AttributeNodes['pais'].Text;
end;

procedure TXMLT_UbicacionFiscal.Set_Pais(Value: WideString);
begin
  SetAttribute('pais', Value);
end;

function TXMLT_UbicacionFiscal.Get_CodigoPostal: WideString;
begin
  Result := AttributeNodes['codigoPostal'].Text;
end;

procedure TXMLT_UbicacionFiscal.Set_CodigoPostal(Value: WideString);
begin
  SetAttribute('codigoPostal', Value);
end;

{ TXMLT_Ubicacion }

function TXMLT_Ubicacion.Get_Calle: WideString;
begin
  Result := AttributeNodes['calle'].Text;
end;

procedure TXMLT_Ubicacion.Set_Calle(Value: WideString);
begin
  SetAttribute('calle', Value);
end;

function TXMLT_Ubicacion.Get_NoExterior: WideString;
begin
  Result := AttributeNodes['noExterior'].Text;
end;

procedure TXMLT_Ubicacion.Set_NoExterior(Value: WideString);
begin
  SetAttribute('noExterior', Value);
end;

function TXMLT_Ubicacion.Get_NoInterior: WideString;
begin
  Result := AttributeNodes['noInterior'].Text;
end;

procedure TXMLT_Ubicacion.Set_NoInterior(Value: WideString);
begin
  SetAttribute('noInterior', Value);
end;

function TXMLT_Ubicacion.Get_Colonia: WideString;
begin
  Result := AttributeNodes['colonia'].Text;
end;

procedure TXMLT_Ubicacion.Set_Colonia(Value: WideString);
begin
  SetAttribute('colonia', Value);
end;

function TXMLT_Ubicacion.Get_Localidad: WideString;
begin
  Result := AttributeNodes['localidad'].Text;
end;

procedure TXMLT_Ubicacion.Set_Localidad(Value: WideString);
begin
  SetAttribute('localidad', Value);
end;

function TXMLT_Ubicacion.Get_Referencia: WideString;
begin
  Result := AttributeNodes['referencia'].Text;
end;

procedure TXMLT_Ubicacion.Set_Referencia(Value: WideString);
begin
  SetAttribute('referencia', Value);
end;

function TXMLT_Ubicacion.Get_Municipio: WideString;
begin
  Result := AttributeNodes['municipio'].Text;
end;

procedure TXMLT_Ubicacion.Set_Municipio(Value: WideString);
begin
  SetAttribute('municipio', Value);
end;

function TXMLT_Ubicacion.Get_Estado: WideString;
begin
  Result := AttributeNodes['estado'].Text;
end;

procedure TXMLT_Ubicacion.Set_Estado(Value: WideString);
begin
  SetAttribute('estado', Value);
end;

function TXMLT_Ubicacion.Get_Pais: WideString;
begin
  Result := AttributeNodes['pais'].Text;
end;

procedure TXMLT_Ubicacion.Set_Pais(Value: WideString);
begin
  SetAttribute('pais', Value);
end;

function TXMLT_Ubicacion.Get_CodigoPostal: WideString;
begin
  Result := AttributeNodes['codigoPostal'].Text;
end;

procedure TXMLT_Ubicacion.Set_CodigoPostal(Value: WideString);
begin
  SetAttribute('codigoPostal', Value);
end;

{ TXMLRegimenFiscal }

function TXMLRegimenFiscal.Get_Regimen: WideString;
begin
  Result := AttributeNodes['Regimen'].Text;
end;

procedure TXMLRegimenFiscal.Set_Regimen(Value: WideString);
begin
  SetAttribute('Regimen', Value);
end;

{ TXMLRegimenFiscalList }

function TXMLRegimenFiscalList.Add: IXMLRegimenFiscal;
begin
  Result := AddItem(-1) as IXMLRegimenFiscal;
end;

function TXMLRegimenFiscalList.Insert(const Index: Integer): IXMLRegimenFiscal;
begin
  Result := AddItem(Index) as IXMLRegimenFiscal;
end;
function TXMLRegimenFiscalList.Get_Item(Index: Integer): IXMLRegimenFiscal;
begin
  Result := List[Index] as IXMLRegimenFiscal;
end;

{ TXMLReceptor }

procedure TXMLReceptor.AfterConstruction;
begin
  RegisterChildNode('Domicilio', TXMLT_Ubicacion);
  inherited;
end;

function TXMLReceptor.Get_Rfc: WideString;
begin
  Result := AttributeNodes['rfc'].Text;
end;

procedure TXMLReceptor.Set_Rfc(Value: WideString);
begin
  SetAttribute('rfc', Value);
end;

function TXMLReceptor.Get_Nombre: WideString;
begin
  Result := AttributeNodes['nombre'].Text;
end;

procedure TXMLReceptor.Set_Nombre(Value: WideString);
begin
  SetAttribute('nombre', Value);
end;

function TXMLReceptor.Get_Domicilio: IXMLT_Ubicacion;
begin
  Result := ChildNodes['Domicilio'] as IXMLT_Ubicacion;
end;

{ TXMLConceptos }

procedure TXMLConceptos.AfterConstruction;
begin
  RegisterChildNode('Concepto', TXMLConcepto);
  ItemTag := 'Concepto';
  ItemInterface := IXMLConcepto;
  inherited;
end;

function TXMLConceptos.Get_Concepto(Index: Integer): IXMLConcepto;
begin
  Result := List[Index] as IXMLConcepto;
end;

function TXMLConceptos.Add: IXMLConcepto;
begin
  Result := AddItem(-1) as IXMLConcepto;
end;

function TXMLConceptos.Insert(const Index: Integer): IXMLConcepto;
begin
  Result := AddItem(Index) as IXMLConcepto;
end;

{ TXMLConcepto }

procedure TXMLConcepto.AfterConstruction;
begin
  RegisterChildNode('InformacionAduanera', TXMLT_InformacionAduanera);
  RegisterChildNode('CuentaPredial', TXMLCuentaPredial);
  RegisterChildNode('ComplementoConcepto', TXMLComplementoConcepto);
  RegisterChildNode('Parte', TXMLParte);
  FInformacionAduanera := CreateCollection(TXMLT_InformacionAduaneraList, IXMLT_InformacionAduanera, 'InformacionAduanera') as IXMLT_InformacionAduaneraList;
  FParte := CreateCollection(TXMLParteList, IXMLParte, 'Parte') as IXMLParteList;
  inherited;
end;

function TXMLConcepto.Get_Cantidad: WideString;
begin
  Result := AttributeNodes['cantidad'].Text;
end;

procedure TXMLConcepto.Set_Cantidad(Value: WideString);
begin
  SetAttribute('cantidad', Value);
end;

function TXMLConcepto.Get_Unidad: WideString;
begin
  Result := AttributeNodes['unidad'].Text;
end;

procedure TXMLConcepto.Set_Unidad(Value: WideString);
begin
  SetAttribute('unidad', Value);
end;

function TXMLConcepto.Get_NoIdentificacion: WideString;
begin
  Result := AttributeNodes['noIdentificacion'].Text;
end;

procedure TXMLConcepto.Set_NoIdentificacion(Value: WideString);
begin
  SetAttribute('noIdentificacion', Value);
end;

function TXMLConcepto.Get_Descripcion: WideString;
begin
  Result := AttributeNodes['descripcion'].Text;
end;

procedure TXMLConcepto.Set_Descripcion(Value: WideString);
begin
  SetAttribute('descripcion', Value);
end;

function TXMLConcepto.Get_ValorUnitario: WideString;
begin
  Result := AttributeNodes['valorUnitario'].Text;
end;

procedure TXMLConcepto.Set_ValorUnitario(Value: WideString);
begin
  SetAttribute('valorUnitario', Value);
end;

function TXMLConcepto.Get_Importe: WideString;
begin
  Result := AttributeNodes['importe'].Text;
end;

procedure TXMLConcepto.Set_Importe(Value: WideString);
begin
  SetAttribute('importe', Value);
end;

function TXMLConcepto.Get_InformacionAduanera: IXMLT_InformacionAduaneraList;
begin
  Result := FInformacionAduanera;
end;

function TXMLConcepto.Get_CuentaPredial: IXMLCuentaPredial;
begin
  Result := ChildNodes['CuentaPredial'] as IXMLCuentaPredial;
end;

function TXMLConcepto.Get_ComplementoConcepto: IXMLComplementoConcepto;
begin
  Result := ChildNodes['ComplementoConcepto'] as IXMLComplementoConcepto;
end;

function TXMLConcepto.Get_Parte: IXMLParteList;
begin
  Result := FParte;
end;

{ TXMLT_InformacionAduanera }

function TXMLT_InformacionAduanera.Get_Numero: WideString;
begin
  Result := AttributeNodes['numero'].Text;
end;

procedure TXMLT_InformacionAduanera.Set_Numero(Value: WideString);
begin
  SetAttribute('numero', Value);
end;

function TXMLT_InformacionAduanera.Get_Fecha: WideString;
begin
  Result := AttributeNodes['fecha'].Text;
end;

procedure TXMLT_InformacionAduanera.Set_Fecha(Value: WideString);
begin
  SetAttribute('fecha', Value);
end;

function TXMLT_InformacionAduanera.Get_Aduana: WideString;
begin
  Result := AttributeNodes['aduana'].Text;
end;

procedure TXMLT_InformacionAduanera.Set_Aduana(Value: WideString);
begin
  SetAttribute('aduana', Value);
end;

{ TXMLT_InformacionAduaneraList }

function TXMLT_InformacionAduaneraList.Add: IXMLT_InformacionAduanera;
begin
  Result := AddItem(-1) as IXMLT_InformacionAduanera;
end;

function TXMLT_InformacionAduaneraList.Insert(const Index: Integer): IXMLT_InformacionAduanera;
begin
  Result := AddItem(Index) as IXMLT_InformacionAduanera;
end;
function TXMLT_InformacionAduaneraList.Get_Item(Index: Integer): IXMLT_InformacionAduanera;
begin
  Result := List[Index] as IXMLT_InformacionAduanera;
end;

{ TXMLCuentaPredial }

function TXMLCuentaPredial.Get_Numero: WideString;
begin
  Result := AttributeNodes['numero'].Text;
end;

procedure TXMLCuentaPredial.Set_Numero(Value: WideString);
begin
  SetAttribute('numero', Value);
end;

{ TXMLComplementoConcepto }

{ TXMLParte }

procedure TXMLParte.AfterConstruction;
begin
  RegisterChildNode('InformacionAduanera', TXMLT_InformacionAduanera);
  ItemTag := 'InformacionAduanera';
  ItemInterface := IXMLT_InformacionAduanera;
  inherited;
end;

function TXMLParte.Get_Cantidad: WideString;
begin
  Result := AttributeNodes['cantidad'].Text;
end;

procedure TXMLParte.Set_Cantidad(Value: WideString);
begin
  SetAttribute('cantidad', Value);
end;

function TXMLParte.Get_Unidad: WideString;
begin
  Result := AttributeNodes['unidad'].Text;
end;

procedure TXMLParte.Set_Unidad(Value: WideString);
begin
  SetAttribute('unidad', Value);
end;

function TXMLParte.Get_NoIdentificacion: WideString;
begin
  Result := AttributeNodes['noIdentificacion'].Text;
end;

procedure TXMLParte.Set_NoIdentificacion(Value: WideString);
begin
  SetAttribute('noIdentificacion', Value);
end;

function TXMLParte.Get_Descripcion: WideString;
begin
  Result := AttributeNodes['descripcion'].Text;
end;

procedure TXMLParte.Set_Descripcion(Value: WideString);
begin
  SetAttribute('descripcion', Value);
end;

function TXMLParte.Get_ValorUnitario: WideString;
begin
  Result := AttributeNodes['valorUnitario'].Text;
end;

procedure TXMLParte.Set_ValorUnitario(Value: WideString);
begin
  SetAttribute('valorUnitario', Value);
end;

function TXMLParte.Get_Importe: WideString;
begin
  Result := AttributeNodes['importe'].Text;
end;

procedure TXMLParte.Set_Importe(Value: WideString);
begin
  SetAttribute('importe', Value);
end;

function TXMLParte.Get_InformacionAduanera(Index: Integer): IXMLT_InformacionAduanera;
begin
  Result := List[Index] as IXMLT_InformacionAduanera;
end;

function TXMLParte.Add: IXMLT_InformacionAduanera;
begin
  Result := AddItem(-1) as IXMLT_InformacionAduanera;
end;

function TXMLParte.Insert(const Index: Integer): IXMLT_InformacionAduanera;
begin
  Result := AddItem(Index) as IXMLT_InformacionAduanera;
end;

{ TXMLParteList }

function TXMLParteList.Add: IXMLParte;
begin
  Result := AddItem(-1) as IXMLParte;
end;

function TXMLParteList.Insert(const Index: Integer): IXMLParte;
begin
  Result := AddItem(Index) as IXMLParte;
end;
function TXMLParteList.Get_Item(Index: Integer): IXMLParte;
begin
  Result := List[Index] as IXMLParte;
end;

{ TXMLImpuestos }

procedure TXMLImpuestos.AfterConstruction;
begin
  RegisterChildNode('Retenciones', TXMLRetenciones);
  RegisterChildNode('Traslados', TXMLTraslados);
  inherited;
end;

function TXMLImpuestos.Get_TotalImpuestosRetenidos: WideString;
begin
  Result := AttributeNodes['totalImpuestosRetenidos'].Text;
end;

procedure TXMLImpuestos.Set_TotalImpuestosRetenidos(Value: WideString);
begin
  SetAttribute('totalImpuestosRetenidos', Value);
end;

function TXMLImpuestos.Get_TotalImpuestosTrasladados: WideString;
begin
  Result := AttributeNodes['totalImpuestosTrasladados'].Text;
end;

procedure TXMLImpuestos.Set_TotalImpuestosTrasladados(Value: WideString);
begin
  SetAttribute('totalImpuestosTrasladados', Value);
end;

function TXMLImpuestos.Get_Retenciones: IXMLRetenciones;
begin
  Result := ChildNodes['Retenciones'] as IXMLRetenciones;
end;

function TXMLImpuestos.Get_Traslados: IXMLTraslados;
begin
  Result := ChildNodes['Traslados'] as IXMLTraslados;
end;

{ TXMLRetenciones }

procedure TXMLRetenciones.AfterConstruction;
begin
  RegisterChildNode('Retencion', TXMLRetencion);
  ItemTag := 'Retencion';
  ItemInterface := IXMLRetencion;
  inherited;
end;

function TXMLRetenciones.Get_Retencion(Index: Integer): IXMLRetencion;
begin
  Result := List[Index] as IXMLRetencion;
end;

function TXMLRetenciones.Add: IXMLRetencion;
begin
  Result := AddItem(-1) as IXMLRetencion;
end;

function TXMLRetenciones.Insert(const Index: Integer): IXMLRetencion;
begin
  Result := AddItem(Index) as IXMLRetencion;
end;

{ TXMLRetencion }

function TXMLRetencion.Get_Impuesto: WideString;
begin
  Result := AttributeNodes['impuesto'].Text;
end;

procedure TXMLRetencion.Set_Impuesto(Value: WideString);
begin
  SetAttribute('impuesto', Value);
end;

function TXMLRetencion.Get_Importe: WideString;
begin
  Result := AttributeNodes['importe'].Text;
end;

procedure TXMLRetencion.Set_Importe(Value: WideString);
begin
  SetAttribute('importe', Value);
end;

{ TXMLTraslados }

procedure TXMLTraslados.AfterConstruction;
begin
  RegisterChildNode('Traslado', TXMLTraslado);
  ItemTag := 'Traslado';
  ItemInterface := IXMLTraslado;
  inherited;
end;

function TXMLTraslados.Get_Traslado(Index: Integer): IXMLTraslado;
begin
  Result := List[Index] as IXMLTraslado;
end;

function TXMLTraslados.Add: IXMLTraslado;
begin
  Result := AddItem(-1) as IXMLTraslado;
end;

function TXMLTraslados.Insert(const Index: Integer): IXMLTraslado;
begin
  Result := AddItem(Index) as IXMLTraslado;
end;

{ TXMLTraslado }

function TXMLTraslado.Get_Impuesto: WideString;
begin
  Result := AttributeNodes['impuesto'].Text;
end;

procedure TXMLTraslado.Set_Impuesto(Value: WideString);
begin
  SetAttribute('impuesto', Value);
end;

function TXMLTraslado.Get_Tasa: WideString;
begin
  Result := AttributeNodes['tasa'].Text;
end;

procedure TXMLTraslado.Set_Tasa(Value: WideString);
begin
  SetAttribute('tasa', Value);
end;

function TXMLTraslado.Get_Importe: WideString;
begin
  Result := AttributeNodes['importe'].Text;
end;

procedure TXMLTraslado.Set_Importe(Value: WideString);
begin
  SetAttribute('importe', Value);
end;

{ TXMLComplemento }

{ TXMLAddenda }

end.