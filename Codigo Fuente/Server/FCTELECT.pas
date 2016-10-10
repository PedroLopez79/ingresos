unit FCTELECT;

interface
uses
   {openssl} libeay32, OpenSSLUtils, StdCtrls, StrUtils, SysUtils, Windows, libeay32plus;

type
    TFELlavePrivada = record
    Ruta: String;
    Clave: String;
    end;

    TFECertificado = record
    Ruta: String;
    LlavePrivada: TFELlavePrivada;
    VigenciaInicio: TDateTime;
    VigenciaFin: TDateTime;
    NumeroSerie: String;
    end;

    {$IF Compilerversion >= 20}
    TCadenaUTF8 = RawByteString;
    {$ELSE}
    TCadenaUTF8 = UTF8String;
    {$IFEND}

    {$IF CompilerVersion >= 20}
    PCharacter = PAnsiChar;
    Caracter = AnsiChar;
    {$ELSE}
    PCharacter = PChar;
    Caracter = Char;
    {$IFEND}

    TTipoDigestionOpenSSL = (tdMD5, tdSHA1);
    ENoExisteArchivoException = class(Exception);
    ECertificadoLlaveEsFiel = class(Exception);
    ELlaveFormatoIncorrectoException = class(Exception);
    ELlaveLecturaException = class(Exception);
    ELlavePrivadaClaveIncorrectaException = class(Exception);
    ELlavePareceSerFiel = class(Exception);
    ELongitudBufferPequenoException = class(Exception);

    // Excepciones que pueden ser generadas
    EFECertificadoNoExisteException = class(Exception);
    EFECertificadoNoVigente =  class(Exception);

    type
    {TFACTURAELECTRONICA}
    TFCTELECT = class
    fArchivoLlavePrivada: String;
    fClaveLlavePrivada: String;
    private
      fCertificado: TFECertificado;
      fCertificadoTexto: WideString;
      //function ObtenerLlavePrivadaDesencriptada() : pEVP_PKEY;
      function BinToBase64(const PDat: PBYTE; const DatLen: DWORD): String;
      function ObtenerUltimoMensajeDeError: string;
      function ObtenerLlavePrivadaDesencriptada() : pEVP_PKEY;
    public
      fCertificate: pX509;
      CertificadoEX: TX509Certificate;
      CertificadoSerial: String;
      CertificadoTexto: WideString;
      SelloDigital: String;
      /// Crea el objeto, inicializa la liberia OpenSSL, y establece la llave privada a usar
      constructor Create(ArchivoLlavePrivada, ClaveLlavePrivada: String;
                         sCadena:TCadenaUTF8; trTipo:TTipoDigestionOpenSSL;
                         Certificado: TFECertificado);
      function HacerDigestion(ArchivoLlavePrivada, ClaveLlavePrivada: String; sCadena: TCadenaUTF8;
         trTipo: TTipoDigestionOpenSSL) : String;
      function AbrirLlavePrivada(Ruta, ClaveLlavePrivada : String) : pPKCS8_Priv_Key_Info;
      function ObtenCertificado(Certificado: TFECertificado):TX509Certificate;
      destructor Destroy; override;
end;

implementation

{ TFACTURAELECTRONICA }

function TFCTELECT.AbrirLlavePrivada(Ruta,
  ClaveLlavePrivada: String): pPKCS8_Priv_Key_Info;
var
    bioArchivoLlave : pBIO;
    sMsgErr: String;
    p8 : pX509_SIG;
    p8inf : pPKCS8_Priv_Key_Info;
    {$IF CompilerVersion >= 20}
        p8pass: PAnsiChar;
    {$ELSE}
        p8pass: PChar;
    {$IFEND}
begin
    // Creamos el objeto en memoria para leer la llave en formato binario .DER (.KEY)
    bioArchivoLlave := BIO_new(BIO_s_file());
    if Not FileExists(Ruta) then
      Raise ENoExisteArchivoException.Create('El archivo de llave privada no existe.');

    // Checamos que la extension de la llave privada sea la correcta
    if AnsiPos('.PEM', Uppercase(Ruta)) > 0 then
      Raise ELlaveFormatoIncorrectoException.Create('La llave privada debe de ser el archivo binario (.key, .cer) y ' +
            'no el formato base64 .pem');

    // Leemos el archivo de llave binario en el objeto creado en memoria
    // DIferentes parametros si usa Delphi 2009 o superior...
    {$IF CompilerVersion >= 20}
        if BIO_read_filename(bioArchivoLlave, PWideChar(AnsiString(Ruta))) = 0 then
    {$ELSE}
        if BIO_read_filename(bioArchivoLlave, PChar(AnsiString(Ruta))) = 0 then
    {$IFEND}
          raise ELlaveLecturaException.Create('Error al leer llave privada. Error reportado: '+
                ObtenerUltimoMensajeDeError);

    // Checamos que la clave no esté vacia
    if Trim(ClaveLlavePrivada) = '' then
      raise ELlavePrivadaClaveIncorrectaException.Create('La clave de la llave privada esta vacia');

    // Convertimos al tipo adecuado de acuerdo a la version de Delphi...
    {$IF CompilerVersion >= 20}
        // Delphi 2009 o superior
        p8pass:=PAnsiChar(AnsiString(ClaveLlavePrivada));
    {$ELSE}
        p8pass:=PChar(AnsiString(ClaveLlavePrivada));
    {$IFEND}

    p8:=nil;
    p8inf:=nil;

    try
        //  Leemos la llave en formato binario (PKCS8)
        p8 := d2i_PKCS8_bio(bioArchivoLlave, nil);
        if not Assigned(p8) then
          raise ELlaveLecturaException.Create('Error al leer llave privada. Error reportado: '+
                ObtenerUltimoMensajeDeError);

        // Des encriptamos la llave en memoria usando la clave proporcionada
        p8inf := PKCS8_decrypt(p8, p8pass, StrLen(p8pass));
        if Not Assigned(p8inf) then
        begin
           sMsgErr:=ObtenerUltimoMensajeDeError;
           // TODO: Crear excepciones para los diferentes tipos de error que puede haber al
           // tratar de desencriptar la llave privada
           // Llave incorrecta (Mensaje exacto: 23077074:PKCS12 routines:PKCS12_pbe_crype:pkcs12 cipherfinal error)
           if ((AnsiPos('cipherfinal error', sMsgErr) > 0) or // clave incorrecta
              (AnsiPos('bad decrypt', sMsgErr) > 0))   // clave incorrecta
           then
              raise ELlavePrivadaClaveIncorrectaException.Create('La clave de la llave privada fue incorrecta')
           else
              if (AnsiPos('unknown pbe algorithm', sMsgErr) > 0) then // Clave vacia o pertenece a la FIEL
                Raise ELlavePareceSerFiel.Create('Al parecer la llave privada pertenece a la FIEL')
              else
                raise ELlaveLecturaException.Create('Error desconocido al desencriptar llave privada. Error reportado: '+
                      ObtenerUltimoMensajeDeError);

           // Nos estan dando un certificado de la FIEL??
           {if AnsiPos('bad decrypt', sMsgErr) > 0 then
              raise TCertificadoLlaveEsFiel.Create('El certificado (archivo de llave) pertenece a la FIEL. + '
              'Use el certificado de Llave Privada')
           else}
        end else

    finally
        // Liberamos las variables usadas en memoria
        X509_SIG_free(p8);
	      BIO_free(bioArchivoLlave);
        EVP_cleanup;
    end;

    Result:=p8inf;
end;

function TFCTELECT.BinToBase64(const PDat: PBYTE;
  const DatLen: DWORD): String;
const BaseTable: string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';
var s, s1: string;
	i, p, len, n, Addnum: DWORD;
	PBin: PBYTE;
begin
	result := '';
	S := '';
	addnum := 0;
	PBin := PDat;
	for i := 1 to DatLen do
	begin
		S := S + IntToHex(PBin^, 2);
		PBin := PBYTE(DWORD(PDat) + i);
	end;
	case (length(s) mod 3) of
		0: addnum := 0;
		1: begin
				s := s + '00';
				addnum := 2;
			end;
		2: begin
				s := s + '0';
				addnum := 1;
			end;
	end;
	len := length(s) div 3;
	for i := 1 to len do
	begin
		s1 := midstr(S, i * 3 - 2, 3);
		p := strtoint('$' + s1);
		n := p div 64;
		result := result + basetable[n + 1];
		n := p mod 64;
		result := result + basetable[n + 1];
	end;
	if addnum = 1 then result := result + '==';
	if addnum = 2 then result[length(result)] := '=';
end;

constructor TFCTELECT.Create(ArchivoLlavePrivada, ClaveLlavePrivada: String;
                             sCadena:TCadenaUTF8; trTipo:TTipoDigestionOpenSSL;
                             Certificado: TFECertificado);
begin
  OpenSSL_add_all_algorithms;
  OpenSSL_add_all_ciphers;
  OpenSSL_add_all_digests;
  ERR_load_crypto_strings;

  ObtenCertificado(Certificado);
  SelloDigital:= HacerDigestion(ArchivoLlavePrivada, ClaveLlavePrivada, sCadena, trTipo);
end;

destructor TFCTELECT.Destroy;
begin
  	EVP_cleanup;
    inherited;
end;

function TFCTELECT.HacerDigestion(ArchivoLlavePrivada, ClaveLlavePrivada: String; sCadena: TCadenaUTF8;
         trTipo: TTipoDigestionOpenSSL) : String;
var
  mdctx: EVP_MD_CTX;
  {$IF CompilerVersion >= 20}
      Inbuf: Array[0..999999] of AnsiChar; // Antes [0..8192]
      Outbuf: array [0..1024] of AnsiChar;
  {$ELSE}
      Inbuf: Array[0..999999] of Char;
      Outbuf: array [0..1024] of Char;
  {$IFEND}
	ekLlavePrivada: pEVP_PKEY;
  Len, Tam: cardinal;
begin
  sCadena:= UTF8Encode(sCadena);

  fArchivoLlavePrivada:=ArchivoLlavePrivada;
  fClaveLlavePrivada:= ClaveLlavePrivada;

  Len:=0;
  ekLlavePrivada := ObtenerLlavePrivadaDesencriptada;

  Tam:=Length(sCadena); // Obtenemos el tamaño de la cadena original
  try
      StrPLCopy(inbuf, sCadena, Tam);  // Copiamos la cadena original al buffer de entrada
  except
      On E:Exception do
      begin
          if Pos('Access', E.Message) > 0 then
             Raise ELongitudBufferPequenoException.Create('Error de sellado digital: La cadena original fue mas grande que el tamaño del buffer,' +
                                                          'por favor intente aumentando el tamaño del buffer.');
      end;
  end;

  if not Assigned(ekLlavePrivada) then
    Raise ELlaveLecturaException.Create('No fue posible leer la llave privada');

  // Establecemos el tipo de digestion a realizar
  case trTipo of
    tdMD5: EVP_SignInit(@mdctx,EVP_md5());
    tdSHA1: EVP_SignInit(@mdctx,EVP_sha1());
  end;

  // Establece los datos que vamos a usar
	EVP_SignUpdate(@mdctx,@inbuf,StrLen(inbuf));
  // Realiza la digestion usando la llave privada que obtuvimos y leimos en memoria
	EVP_SignFinal(@mdctx,@outbuf,Len,ekLlavePrivada);
  // Liberamos el puntero a la llave privada usada previamente
  EVP_PKEY_free(ekLlavePrivada);

  // Regresa los resultados en formato Base64
	Result := BinToBase64(@outbuf,Len);

  SelloDigital:= Result;
end;

function TFCTELECT.ObtenerLlavePrivadaDesencriptada: pEVP_PKEY;
var
    p8inf : pPKCS8_Priv_Key_Info;
    resLlave   : pEVP_PKEY;
begin
    // Abrimos la llave privada
    p8inf:=AbrirLlavePrivada(fArchivoLlavePrivada, fClaveLlavePrivada);
    resLlave := EVP_PKCS82PKEY(p8inf);
    Result:=resLlave;
end;

function TFCTELECT.ObtenerUltimoMensajeDeError: string;
var
  {$IF CompilerVersion >= 20}
     ErrMsg: array [0..160] of AnsiChar;
  {$ELSE}
      ErrMsg: array [0..160] of Char;
  {$IFEND}
begin
  ERR_error_string(ERR_get_error, @ErrMsg);
  result := StrPas(PAnsiChar(@ErrMsg));
end;

function TFCTELECT.ObtenCertificado(Certificado: TFECertificado): TX509Certificate;
const
    _CADENA_INICIO_CERTIFICADO = '-----BEGIN CERTIFICATE-----';
    _CADENA_FIN_CERTIFICADO    = '-----END CERTIFICATE-----';
var
  x509Certificado: TX509Certificate;

  // Quita los encabezados, pie y retornos de carro del certificado
  function QuitarCaracteresNoUsadosEnCertificado(sCertificadoBase64: WideString) : WideString;
  begin
      sCertificadoBase64:=StringReplace(sCertificadoBase64, #13, '', [rfReplaceAll, rfIgnoreCase]);
      sCertificadoBase64:=StringReplace(sCertificadoBase64, #10, '', [rfReplaceAll, rfIgnoreCase]);
      // Quitamos encabezado del certificado
      sCertificadoBase64:=StringReplace(sCertificadoBase64, _CADENA_INICIO_CERTIFICADO, '', [rfReplaceAll, rfIgnoreCase]);
      // Quitamos el pie del certificado
      Result:=StringReplace(sCertificadoBase64, _CADENA_FIN_CERTIFICADO, '', [rfReplaceAll, rfIgnoreCase]);
  end;

begin
  // Ya que tenemos los datos del certificado, lo procesamos para obtener los datos
  // necesarios
  x509Certificado := TX509Certificate.Create;
  try
    if Not FileExists(Certificado.Ruta) then
      raise EFECertificadoNoExisteException.Create('No existe el archivo del certificado')
    else
      x509Certificado.LoadFromFile(Certificado.Ruta);

    fCertificado := Certificado;
    
    // Llenamos las propiedades
    fCertificado.VigenciaInicio := x509Certificado.NotBefore;
    fCertificado.VigenciaFin := x509Certificado.NotAfter;

    // Checamos que el certificado este dentro de la vigencia
    if Not((Now >= fCertificado.VigenciaInicio) and (Now <= fCertificado.VigenciaFin)) then
      raise EFECertificadoNoVigente.Create('El certificado no tiene vigencia actual');

      fCertificado.NumeroSerie := x509Certificado.SerialNumber;
      CertificadoSerial:= fCertificado.NumeroSerie;
    // Incluir el certificado en el XML?

       // Obtenemos el certificado codificado en Base64 para incluirlo en el comprobante
       fCertificadoTexto:=X509Certificado.AsBase64;
       fCertificadoTexto:=QuitarCaracteresNoUsadosEnCertificado(X509Certificado.AsBase64);
       //CodeSite.Send('Certificado Base64', CertificadoBase64);
       //CodeSite.Send('length', Length(CertificadoBase64));

  except
     // Pasamos la excepcion tal y como esta
     On E: Exception do
     begin
        FreeAndNil(x509Certificado);
        raise Exception.Create(E.Message);
     end;
  end;
  Result:= x509Certificado;
  CertificadoEX:= x509Certificado;
  CertificadoTexto:= fCertificadoTexto;

  FreeAndNil(x509Certificado);
end;

end.
