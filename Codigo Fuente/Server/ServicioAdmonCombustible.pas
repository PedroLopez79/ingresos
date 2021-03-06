// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://om.bajacalifornia.gob.mx/ws_sig/ServicioAdmonCombustible.asmx?WSDL
//  >Import : http://om.bajacalifornia.gob.mx/ws_sig/ServicioAdmonCombustible.asmx?WSDL:0
// Encoding : utf-8
// Version  : 1.0
// (5/23/2011 10:58:18 AM - - $Rev: 10138 $)
// ************************************************************************ //

unit ServicioAdmonCombustible;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns;

const
  IS_OPTN = $0001;
  IS_UNBD = $0002;
  IS_NLBL = $0004;
  IS_REF  = $0080;


type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Borland types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:string          - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:int             - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:decimal         - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:dateTime        - "http://www.w3.org/2001/XMLSchema"[Gbl]


  ArrayOfString = array of WideString;          { "http://bajacalifornia.gob.mx/OM/SIG/"[GblCplx] }

  // ************************************************************************ //
  // Namespace : http://bajacalifornia.gob.mx/OM/SIG/
  // soapAction: http://bajacalifornia.gob.mx/OM/SIG/%operationName%
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : document
  // binding   : ServicioAdmonCombustibleSoap
  // service   : ServicioAdmonCombustible
  // port      : ServicioAdmonCombustibleSoap
  // URL       : http://om.bajacalifornia.gob.mx/ws_sig/ServicioAdmonCombustible.asmx
  // ************************************************************************ //
  ServicioAdmonCombustibleSoap = interface(IInvokable)
  ['{2E463F17-38FD-3D62-6FB1-D39EC4941F4A}']
    function  Autenticar(const usuario: WideString; const contrasena: WideString): Integer; stdcall;
    function  ObtenerSaldoDisponible(const Id: WideString; const usuario: WideString; const contrasena: WideString): TXSDecimal; stdcall;
    function  ConsultaSaldoDisponible(const NumeroEconomico: WideString; const usuario: WideString; const contrasena: WideString): TXSDecimal; stdcall;
    function  ObtenerChipsActivos(const usuario: WideString; const contrasena: WideString): ArrayOfString; stdcall;
    function  ObtenerInformacion(const Id: WideString; const usuario: WideString; const contrasena: WideString): ArrayOfString; stdcall;
    function  PerteneceA(const Id: WideString; const usuario: WideString; const contrasena: WideString): Integer; stdcall;
    function  Cargo(const Id: WideString; const Kms: Integer; const Lts: TXSDecimal; const Producto: Integer; const Importe: TXSDecimal; const usuario: WideString; 
                    const contrasena: WideString): Integer; stdcall;
    function  CargoEx(const Id: WideString; const Kms: Integer; const Lts: TXSDecimal; const Producto: Integer; const Importe: TXSDecimal; const usuario: WideString; 
                      const contrasena: WideString; const estacion: Integer): Integer; stdcall;
    function  CargoVE(const Id: WideString; const Lts: TXSDecimal; const Producto: Integer; const Importe: TXSDecimal; const usuario: WideString; const contrasena: WideString
                      ): Integer; stdcall;
    function  CancelarCargo(const Id: WideString; const Importe: TXSDecimal; const usuario: WideString; const contrasena: WideString): Integer; stdcall;
    function  EnviarDatosFactura(const Factura: WideString; const Fecha: TXSDateTime; const Subtotal: TXSDecimal; const Iva: TXSDecimal; const Detalle: WideString; const usuario: WideString; 
                                 const contrasena: WideString): Integer; stdcall;
  end;

function GetServicioAdmonCombustibleSoap(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): ServicioAdmonCombustibleSoap;


implementation
  uses SysUtils;

function GetServicioAdmonCombustibleSoap(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): ServicioAdmonCombustibleSoap;
const
  defWSDL = 'http://om.bajacalifornia.gob.mx/ws_sig/ServicioAdmonCombustible.asmx?WSDL';
  defURL  = 'http://om.bajacalifornia.gob.mx/ws_sig/ServicioAdmonCombustible.asmx';
  defSvc  = 'ServicioAdmonCombustible';
  defPrt  = 'ServicioAdmonCombustibleSoap';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as ServicioAdmonCombustibleSoap);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


initialization
  InvRegistry.RegisterInterface(TypeInfo(ServicioAdmonCombustibleSoap), 'http://bajacalifornia.gob.mx/OM/SIG/', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ServicioAdmonCombustibleSoap), 'http://bajacalifornia.gob.mx/OM/SIG/%operationName%');
  InvRegistry.RegisterInvokeOptions(TypeInfo(ServicioAdmonCombustibleSoap), ioDocument);
  RemClassRegistry.RegisterXSInfo(TypeInfo(ArrayOfString), 'http://bajacalifornia.gob.mx/OM/SIG/', 'ArrayOfString');

end.