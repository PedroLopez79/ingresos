object ServiceIngresos: TServiceIngresos
  OldCreateOrder = True
  SessionManager = ServerDataModule.SessionManager
  ServiceSchema = Schema
  ServiceDataStreamer = DataStreamer
  ExportedDataTables = <>
  Height = 349
  Width = 272
  object Schema: TDASchema
    ConnectionManager = ServerDataModule.ConnectionManager
    Datasets = <
      item
        Params = <
          item
            Name = 'NUMEROESTACION'
            Value = '1'
            ParamType = daptInput
          end
          item
            Name = 'FacturaID'
            Value = '1'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            SQL = 
              'DECLARE @CAD AS VARCHAR(4000)'#10'DECLARE @SUCURSAL AS INT'#10'DECLARE @' +
              'NOAPROBACIONSUC AS INT'#10'DECLARE @NOAPROBFCTELECT AS INT'#10#10'SELECT @' +
              'CAD = (SELECT '#39#39')'#10#10'SELECT @SUCURSAL = ISNULL((SELECT TOP 1 ISNUL' +
              'L(SUCURSALDE,0) FROM CONFIGURACION WHERE NUMEROESTACION=:NUMEROE' +
              'STACION AND ISNULL(SUCURSAL,0) = 1),-1)'#10'SELECT @NOAPROBACIONSUC ' +
              '= (SELECT CONFIGURACION.NOAPROBACION FROM CONFIGURACION WHERE CO' +
              'NFIGURACION.NUMEROESTACION=:NUMEROESTACION)'#10#10'SELECT @NOAPROBFCTE' +
              'LECT = ISNULL((SELECT NOAPROBACION FROM FACTURAELECTRONICA WHERE' +
              ' FACTURAELECTRONICA.FACTURAID = :FacturaID),0)'#10#10'IF @NOAPROBFCTEL' +
              'ECT > 0'#10'  SELECT @NOAPROBACIONSUC = (SELECT @NOAPROBFCTELECT)'#10'EL' +
              'SE'#10'  SELECT @NOAPROBFCTELECT = (SELECT CONFIGURACION.NOAPROBACIO' +
              'N FROM CONFIGURACION WHERE CONFIGURACION.NUMEROESTACION=:NUMEROE' +
              'STACION)'#10#10'IF @SUCURSAL > 0'#10#10'SELECT FACTURA.SERIE,RTRIM(CAST(FACT' +
              'URA.FOLIO AS VARCHAR(50))) AS FOLIO,'#10'       LEFT(CONVERT(VARCHAR' +
              ', FACTURA.FECHA, 120), 10)+'#39'T'#39'+'#10'       Substring(convert(varchar' +
              ', FACTURA.FECHA, 14),1,8) AS FECHA,LTRIM(CAST(@NOAPROBACIONSUC A' +
              'S VARCHAR (10))) AS NOAPROBACION,'#10'       CAST(YEAR(CONFIGURACION' +
              '.ANOAPROBACION) AS VARCHAR(4)) AS ANOAPROBACION, FORMAPAGO.DESCR' +
              'IPCION AS FORMAPAGO,'#10'       CONVERT(VARCHAR,CONVERT(MONEY,FACTUR' +
              'A.SUBTOTAL),0) AS SUBTOTAL,CONVERT(VARCHAR,CONVERT(MONEY,FACTURA' +
              '.TOTAL),0) AS TOTAL,'#10'       CONFIGURACION.RFC AS RFCEMISOR, CONF' +
              'IGURACION.EMPRESA AS NOMEMPRESAEMISOR, CONFIGURACION.DIRECCION A' +
              'S DOMEMISOR, ISNULL(CONFIGURACION.NOEXTERIOR,'#39#39') NOEXTERIOREMISO' +
              'R,'#10'       ISNULL(CONFIGURACION.COLONIA,'#39#39') AS COLONIAEMISOR,ISNU' +
              'LL(CONFIGURACION.MUNICIPIO,'#39#39') AS MUNICIPIOEMISOR,ISNULL(CONFIGU' +
              'RACION.ESTADO,'#39#39') AS ESTADOEMISOR,'#10'       ISNULL(CONFIGURACION.P' +
              'AIS,'#39#39') AS PAISEMISOR,ISNULL(CONFIGURACION.CODIGOPOSTAL,'#39#39') AS C' +
              'ODIGOPOSTALEMISOR,'#10'       ISNULL(CLIENTE.RFC,'#39#39') AS RFCRECEPTOR,' +
              ' ISNULL(CLIENTE.NOMBRE,'#39#39') AS NOMBREEMPRECEPTOR, ISNULL(CLIENTE.' +
              'CALLE,'#39#39') AS DOMICILIORECEPTOR, ISNULL(CLIENTE.NOEXTERIOR,'#39#39') AS' +
              ' NOEXTERIORRECEPTOR,'#10'       ISNULL(CLIENTE.COLONIA,'#39#39') AS COLONI' +
              'ARECEPTOR,ISNULL(CLIENTE.LOCALIDAD,'#39#39') AS LOCALIDADRECEPTOR,ISNU' +
              'LL(CLIENTE.MUNICIPIO,'#39#39') AS MUNICIPIORECEPTOR,'#10'       ISNULL(CLI' +
              'ENTE.ESTADO,'#39#39') AS ESTADORECEPTOR,ISNULL(CLIENTE.PAIS,'#39#39') AS PAI' +
              'SRECEPTOR,ISNULL(CAST(CLIENTE.CODIGOPOSTAL AS VARCHAR(20)),'#39#39') A' +
              'S CODIGOPOSTALRECEPTOR,'#10'       ISNULL(CLIENTE.EMAIL,'#39#39') AS EMAIL' +
              #10'FROM FACTURA INNER JOIN CLIENTE ON CLIENTE.IDCLIENTE = FACTURA.' +
              'CLIENTEID'#10'INNER JOIN CONFIGURACION ON CONFIGURACION.IDCONFIGURAC' +
              'ION = CONFIGURACION.IDCONFIGURACION'#10'INNER JOIN FORMAPAGO ON FACT' +
              'URA.FORMAPAGOID = FORMAPAGO.FORMAPAGOID'#10'WHERE FACTURAID = :Factu' +
              'raID AND CONFIGURACION.NUMEROESTACION = @SUCURSAL AND ISNULL(SUC' +
              'URSAL,0)= 0'#10#10'ELSE'#10#10'SELECT FACTURA.SERIE,RTRIM(CAST(FACTURA.FOLIO' +
              ' AS VARCHAR(50))) AS FOLIO,'#10'       LEFT(CONVERT(VARCHAR, FACTURA' +
              '.FECHA, 120), 10)+'#10'       '#39'T'#39'+'#10#10'       Substring(convert(varchar' +
              ', FACTURA.FECHA, 14),1,8) AS FECHA,LTRIM(CAST(@NOAPROBFCTELECT A' +
              'S VARCHAR (10))) AS NOAPROBACION,'#10'       CAST(YEAR(CONFIGURACION' +
              '.ANOAPROBACION) AS VARCHAR(4)) AS ANOAPROBACION, FORMAPAGO.DESCR' +
              'IPCION AS FORMAPAGO,'#10'       CONVERT(VARCHAR,CONVERT(MONEY,FACTUR' +
              'A.SUBTOTAL),0) AS SUBTOTAL,CONVERT(VARCHAR,CONVERT(MONEY,FACTURA' +
              '.TOTAL),0) AS TOTAL,'#10'       CONFIGURACION.RFC AS RFCEMISOR, CONF' +
              'IGURACION.EMPRESA AS NOMEMPRESAEMISOR, CONFIGURACION.DIRECCION A' +
              'S DOMEMISOR, ISNULL(CONFIGURACION.NOEXTERIOR,'#39#39') NOEXTERIOREMISO' +
              'R,'#10'       ISNULL(CONFIGURACION.COLONIA,'#39#39') AS COLONIAEMISOR,ISNU' +
              'LL(CONFIGURACION.MUNICIPIO,'#39#39') AS MUNICIPIOEMISOR,ISNULL(CONFIGU' +
              'RACION.ESTADO,'#39#39') AS ESTADOEMISOR,'#10'       ISNULL(CONFIGURACION.P' +
              'AIS,'#39#39') AS PAISEMISOR,ISNULL(CONFIGURACION.CODIGOPOSTAL,'#39#39') AS C' +
              'ODIGOPOSTALEMISOR,'#10'       ISNULL(CLIENTE.RFC,'#39#39') AS RFCRECEPTOR,' +
              ' ISNULL(CLIENTE.NOMBRE,'#39#39') AS NOMBREEMPRECEPTOR, ISNULL(CLIENTE.' +
              'CALLE,'#39#39') AS DOMICILIORECEPTOR, ISNULL(CLIENTE.NOEXTERIOR,'#39#39') AS' +
              ' NOEXTERIORRECEPTOR,'#10'       ISNULL(CLIENTE.COLONIA,'#39#39') AS COLONI' +
              'ARECEPTOR,ISNULL(CLIENTE.LOCALIDAD,'#39#39') AS LOCALIDADRECEPTOR,ISNU' +
              'LL(CLIENTE.MUNICIPIO,'#39#39') AS MUNICIPIORECEPTOR,'#10'       ISNULL(CLI' +
              'ENTE.ESTADO,'#39#39') AS ESTADORECEPTOR,ISNULL(CLIENTE.PAIS,'#39#39') AS PAI' +
              'SRECEPTOR,ISNULL(CAST(CLIENTE.CODIGOPOSTAL AS VARCHAR(20)),'#39#39') A' +
              'S CODIGOPOSTALRECEPTOR,'#10'       ISNULL(CLIENTE.EMAIL,'#39#39') AS EMAIL' +
              #10'FROM FACTURA INNER JOIN CLIENTE ON CLIENTE.IDCLIENTE = FACTURA.' +
              'CLIENTEID'#10'INNER JOIN CONFIGURACION ON CONFIGURACION.IDCONFIGURAC' +
              'ION = CONFIGURACION.IDCONFIGURACION'#10'INNER JOIN FORMAPAGO ON FACT' +
              'URA.FORMAPAGOID = FORMAPAGO.FORMAPAGOID'#10'WHERE FACTURAID = :Factu' +
              'raID AND CONFIGURACION.NUMEROESTACION = :NUMEROESTACION AND ISNU' +
              'LL(SUCURSAL,0)= 0'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'SERIE'
                TableField = 'SERIE'
              end
              item
                DatasetField = 'FOLIO'
                TableField = 'FOLIO'
              end
              item
                DatasetField = 'FECHA'
                TableField = 'FECHA'
              end
              item
                DatasetField = 'NOAPROBACION'
                TableField = 'NOAPROBACION'
              end
              item
                DatasetField = 'ANOAPROBACION'
                TableField = 'ANOAPROBACION'
              end
              item
                DatasetField = 'FORMAPAGO'
                TableField = 'FORMAPAGO'
              end
              item
                DatasetField = 'SUBTOTAL'
                TableField = 'SUBTOTAL'
              end
              item
                DatasetField = 'TOTAL'
                TableField = 'TOTAL'
              end
              item
                DatasetField = 'RFCEMISOR'
                TableField = 'RFCEMISOR'
              end
              item
                DatasetField = 'NOMEMPRESAEMISOR'
                TableField = 'NOMEMPRESAEMISOR'
              end
              item
                DatasetField = 'DOMEMISOR'
                TableField = 'DOMEMISOR'
              end
              item
                DatasetField = 'NOEXTERIOREMISOR'
                TableField = 'NOEXTERIOREMISOR'
              end
              item
                DatasetField = 'COLONIAEMISOR'
                TableField = 'COLONIAEMISOR'
              end
              item
                DatasetField = 'MUNICIPIOEMISOR'
                TableField = 'MUNICIPIOEMISOR'
              end
              item
                DatasetField = 'ESTADOEMISOR'
                TableField = 'ESTADOEMISOR'
              end
              item
                DatasetField = 'PAISEMISOR'
                TableField = 'PAISEMISOR'
              end
              item
                DatasetField = 'CODIGOPOSTALEMISOR'
                TableField = 'CODIGOPOSTALEMISOR'
              end
              item
                DatasetField = 'RFCRECEPTOR'
                TableField = 'RFCRECEPTOR'
              end
              item
                DatasetField = 'NOMBREEMPRECEPTOR'
                TableField = 'NOMBREEMPRECEPTOR'
              end
              item
                DatasetField = 'DOMICILIORECEPTOR'
                TableField = 'DOMICILIORECEPTOR'
              end
              item
                DatasetField = 'NOEXTERIORRECEPTOR'
                TableField = 'NOEXTERIORRECEPTOR'
              end
              item
                DatasetField = 'COLONIARECEPTOR'
                TableField = 'COLONIARECEPTOR'
              end
              item
                DatasetField = 'LOCALIDADRECEPTOR'
                TableField = 'LOCALIDADRECEPTOR'
              end
              item
                DatasetField = 'MUNICIPIORECEPTOR'
                TableField = 'MUNICIPIORECEPTOR'
              end
              item
                DatasetField = 'ESTADORECEPTOR'
                TableField = 'ESTADORECEPTOR'
              end
              item
                DatasetField = 'PAISRECEPTOR'
                TableField = 'PAISRECEPTOR'
              end
              item
                DatasetField = 'CODIGOPOSTALRECEPTOR'
                TableField = 'CODIGOPOSTALRECEPTOR'
              end
              item
                DatasetField = 'EMAIL'
                TableField = 'EMAIL'
              end>
          end>
        Name = 'spDatosCadena'
        Fields = <
          item
            Name = 'SERIE'
            DataType = datString
            Size = 5
          end
          item
            Name = 'FOLIO'
            DataType = datString
            Size = 50
          end
          item
            Name = 'FECHA'
            DataType = datString
            Size = 19
          end
          item
            Name = 'NOAPROBACION'
            DataType = datString
            Size = 10
          end
          item
            Name = 'ANOAPROBACION'
            DataType = datString
            Size = 4
          end
          item
            Name = 'FORMAPAGO'
            DataType = datString
            Size = 50
          end
          item
            Name = 'SUBTOTAL'
            DataType = datString
            Size = 30
          end
          item
            Name = 'TOTAL'
            DataType = datString
            Size = 30
          end
          item
            Name = 'RFCEMISOR'
            DataType = datString
            Size = 50
          end
          item
            Name = 'NOMEMPRESAEMISOR'
            DataType = datString
            Size = 50
          end
          item
            Name = 'DOMEMISOR'
            DataType = datString
            Size = 70
          end
          item
            Name = 'NOEXTERIOREMISOR'
            DataType = datString
            Size = 20
          end
          item
            Name = 'COLONIAEMISOR'
            DataType = datString
            Size = 50
          end
          item
            Name = 'MUNICIPIOEMISOR'
            DataType = datString
            Size = 50
          end
          item
            Name = 'ESTADOEMISOR'
            DataType = datString
            Size = 50
          end
          item
            Name = 'PAISEMISOR'
            DataType = datString
            Size = 50
          end
          item
            Name = 'CODIGOPOSTALEMISOR'
            DataType = datString
            Size = 50
          end
          item
            Name = 'RFCRECEPTOR'
            DataType = datString
            Size = 15
          end
          item
            Name = 'NOMBREEMPRECEPTOR'
            DataType = datString
            Size = 80
          end
          item
            Name = 'DOMICILIORECEPTOR'
            DataType = datString
            Size = 60
          end
          item
            Name = 'NOEXTERIORRECEPTOR'
            DataType = datString
            Size = 50
          end
          item
            Name = 'COLONIARECEPTOR'
            DataType = datString
            Size = 30
          end
          item
            Name = 'LOCALIDADRECEPTOR'
            DataType = datString
            Size = 25
          end
          item
            Name = 'MUNICIPIORECEPTOR'
            DataType = datString
            Size = 100
          end
          item
            Name = 'ESTADORECEPTOR'
            DataType = datString
            Size = 100
          end
          item
            Name = 'PAISRECEPTOR'
            DataType = datString
            Size = 100
          end
          item
            Name = 'CODIGOPOSTALRECEPTOR'
            DataType = datString
            Size = 20
          end
          item
            Name = 'EMAIL'
            DataType = datString
            Size = 150
          end>
      end
      item
        Params = <
          item
            Name = 'NUMEROESTACION'
            Value = '1'
          end>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            SQL = 
              'SELECT DIRECCION=ISNULL(DIRECCION,'#39#39'),NOEXTERIOR=ISNULL(NOEXTERI' +
              'OR,'#39#39'),COLONIA=ISNULL(COLONIA,'#39#39'),LOCALIDAD=ISNULL(LOCALIDAD,'#39#39')' +
              ','#10'             MUNICIPIO=ISNULL(MUNICIPIO,'#39#39'),ESTADO=ISNULL(ESTA' +
              'DO,'#39#39'),PAIS=ISNULL(PAIS,'#39#39'),CODIGOPOSTAL=ISNULL(CODIGOPOSTAL,'#39#39')' +
              #10'FROM CONFIGURACION WHERE NUMEROESTACION=:NUMEROESTACION AND ISN' +
              'ULL(SUCURSAL,0)= 1'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'NOEXTERIOR'
                TableField = 'NOEXTERIOR'
              end
              item
                DatasetField = 'COLONIA'
                TableField = 'COLONIA'
              end
              item
                DatasetField = 'LOCALIDAD'
                TableField = 'LOCALIDAD'
              end
              item
                DatasetField = 'MUNICIPIO'
                TableField = 'MUNICIPIO'
              end
              item
                DatasetField = 'ESTADO'
                TableField = 'ESTADO'
              end
              item
                DatasetField = 'PAIS'
                TableField = 'PAIS'
              end
              item
                DatasetField = 'CODIGOPOSTAL'
                TableField = 'CODIGOPOSTAL'
              end
              item
                DatasetField = 'DIRECCION'
                TableField = 'DIRECCION'
              end>
          end>
        Name = 'spDatosCadenaExpedidoEn'
        Fields = <
          item
            Name = 'DIRECCION'
            DataType = datString
            Size = 70
          end
          item
            Name = 'NOEXTERIOR'
            DataType = datString
            Size = 20
          end
          item
            Name = 'COLONIA'
            DataType = datString
            Size = 50
          end
          item
            Name = 'LOCALIDAD'
            DataType = datString
            Size = 50
          end
          item
            Name = 'MUNICIPIO'
            DataType = datString
            Size = 50
          end
          item
            Name = 'ESTADO'
            DataType = datString
            Size = 50
          end
          item
            Name = 'PAIS'
            DataType = datString
            Size = 50
          end
          item
            Name = 'CODIGOPOSTAL'
            DataType = datString
            Size = 50
          end>
      end
      item
        Params = <
          item
            Name = 'FacturaID'
            Value = '10'
          end>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            SQL = 
              'SELECT DETALLEFACTURA.PRODUCTOID, DETALLEFACTURA.IMPORTE, DETALL' +
              'EFACTURA.CANTIDAD,'#10'       DETALLEFACTURA.PRECIO, PRODUCTO.NOMBRE' +
              ' AS DESCRIPCION FROM DETALLEFACTURA INNER JOIN'#10'       PRODUCTO O' +
              'N PRODUCTO.IDPRODUCTO = DETALLEFACTURA.PRODUCTOID'#10'WHERE DETALLEF' +
              'ACTURA.FACTURAID = :FacturaID'#10'ORDER BY DETALLEFACTURA.PRODUCTOID' +
              ' ASC'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'PRODUCTOID'
                TableField = 'PRODUCTOID'
              end
              item
                DatasetField = 'IMPORTE'
                TableField = 'IMPORTE'
              end
              item
                DatasetField = 'CANTIDAD'
                TableField = 'CANTIDAD'
              end
              item
                DatasetField = 'PRECIO'
                TableField = 'PRECIO'
              end
              item
                DatasetField = 'DESCRIPCION'
                TableField = 'DESCRIPCION'
              end>
          end>
        Name = 'spDatosCadenaImportes'
        Fields = <
          item
            Name = 'PRODUCTOID'
            DataType = datInteger
          end
          item
            Name = 'IMPORTE'
            DataType = datFloat
          end
          item
            Name = 'CANTIDAD'
            DataType = datFloat
          end
          item
            Name = 'PRECIO'
            DataType = datFloat
          end
          item
            Name = 'DESCRIPCION'
            DataType = datString
            Size = 150
          end>
      end
      item
        Params = <
          item
            Name = 'FACTURAID'
            Value = '10'
          end>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            SQL = 
              'SELECT SUM(CANTIDAD * PRODUCTO.IEPS) AS IEPS, IEPS AS TASAIEPS'#10'F' +
              'ROM FACTURA'#10'INNER JOIN DETALLEFACTURA ON DETALLEFACTURA.FACTURAI' +
              'D = FACTURA.FACTURAID'#10'INNER JOIN PRODUCTO ON PRODUCTO.IDPRODUCTO' +
              ' = DETALLEFACTURA.PRODUCTOID'#10'WHERE (FACTURA.FACTURAID = :FACTURA' +
              'ID)'#10'GROUP BY IEPS'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IEPS'
                TableField = 'IEPS'
              end
              item
                DatasetField = 'TASAIEPS'
                TableField = 'TASAIEPS'
              end>
          end>
        Name = 'spDatosCadenaImpuestosIEPS'
        Fields = <
          item
            Name = 'IEPS'
            DataType = datFloat
          end
          item
            Name = 'TASAIEPS'
            DataType = datFloat
          end>
      end
      item
        Params = <
          item
            Name = 'FACTURAID'
            Value = '25'
          end>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            SQL = 
              'SELECT SUM(IMPUESTO) AS IVA, IMPUESTOPORCENTAJE AS TASAIVA'#10'FROM ' +
              'FACTURA'#10'WHERE (FACTURA.FACTURAID = :FACTURAID)'#10'GROUP BY IMPUESTO' +
              'PORCENTAJE'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IVA'
                TableField = 'IVA'
              end
              item
                DatasetField = 'TASAIVA'
                TableField = 'TASAIVA'
              end>
          end>
        Name = 'spDatosCadenaImpuestosIVA'
        Fields = <
          item
            Name = 'IVA'
            DataType = datFloat
          end
          item
            Name = 'TASAIVA'
            DataType = datFloat
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            SQL = 
              'SELECT TOP 1 NOCERTIFICADO, Certificado, ArchivoCertificado, Pas' +
              'swordFCTELECT,'#10'ArchivoClavePrivada, ClavePriv FROM CONFIGURACION' +
              #10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'NOCERTIFICADO'
                TableField = 'NOCERTIFICADO'
              end
              item
                DatasetField = 'Certificado'
                TableField = 'Certificado'
              end
              item
                DatasetField = 'ArchivoCertificado'
                TableField = 'ArchivoCertificado'
              end
              item
                DatasetField = 'ClavePriv'
                TableField = 'ClavePriv'
              end
              item
                DatasetField = 'PasswordFCTELECT'
                TableField = 'PasswordFCTELECT'
              end
              item
                DatasetField = 'ArchivoClavePrivada'
                TableField = 'ArchivoClavePrivada'
              end>
          end>
        Name = 'spDatosCertificado'
        Fields = <
          item
            Name = 'NOCERTIFICADO'
            DataType = datString
            Size = 50
          end
          item
            Name = 'Certificado'
            DataType = datString
            Size = 4000
          end
          item
            Name = 'ArchivoCertificado'
            DataType = datString
            Size = 200
          end
          item
            Name = 'PasswordFCTELECT'
            DataType = datString
            Size = 200
          end
          item
            Name = 'ArchivoClavePrivada'
            DataType = datString
            Size = 200
          end
          item
            Name = 'ClavePriv'
            DataType = datString
            Size = 200
          end>
      end
      item
        Params = <
          item
            Name = 'VIGENCIA'
            Value = '1'
          end
          item
            Name = 'FACTURAID'
            Value = '1'
          end>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            SQL = 
              'UPDATE FACTURAELECTRONICA SET VIGENCIA = :VIGENCIA'#10'WHERE FACTURA' +
              'ELECTRONICA.FACTURAID = :FACTURAID'#10#10'SELECT 1'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'COLUMN1'
                TableField = 'COLUMN1'
              end>
          end>
        Name = 'spActualizaFacturaElectronica'
        Fields = <
          item
            Name = 'COLUMN1'
            DataType = datInteger
          end>
      end
      item
        Params = <
          item
            Name = 'folio'
            Value = '1'
            ParamType = daptInput
          end
          item
            Name = 'Serie'
            Value = #39'A'#39
            ParamType = daptInput
          end
          item
            Name = 'GasolineroID'
            Value = '1'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            SQL = 
              'declare @aFolio as varchar(50)'#10'declare @Serie as varchar(10)'#10'dec' +
              'lare @FolioInicial as integer'#10'declare @FolioFinal as integer'#10'dec' +
              'lare @reg as integer'#10#10'declare @folio as integer'#10#10'select @aFolio ' +
              '= (Select :folio)'#10'select @Serie = (Select :Serie)'#10'select @Folio ' +
              '= (Select -1)'#10#10'select @FolioInicial = (select FolioInicial from ' +
              'Gasolinero Where GasolineroID = :GasolineroID)'#10'select @FolioFina' +
              'l = (select FolioFinal from Gasolinero Where GasolineroID = :Gas' +
              'olineroID)'#10#10'select @reg = (select count (*) From Factura'#10'       ' +
              '        Where (Folio = @aFolio)AND(Serie = @Serie))'#10#10'if @reg = 0' +
              #10'BEGIN'#10#10'select @Folio = (select @aFolio)'#10#10'if (isnull(@Folio,0)) ' +
              '>= (isnull(@FolioInicial,0)) AND (isnull(@Folio,0)) <= (isnull(@' +
              'FolioFinal,0))'#10'   Select @Folio = @Folio'#10'Else'#10'   Select @Folio=-' +
              '1'#10#10'Select @Folio As Folio'#10'END'#10#10'select @Folio as Folio'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'Folio'
                TableField = 'Folio'
              end>
          end>
        Name = 'spFolioActual2'
        Fields = <
          item
            Name = 'Folio'
            DataType = datInteger
          end>
      end
      item
        Params = <
          item
            Name = 'Usuario'
            Value = 'a'
            ParamType = daptInput
          end
          item
            Name = 'Clave'
            Value = 'a'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'INGRESOS'
            SQL = 
              'SELECT IDEMPLEADO, Nombre'#10'FROM Usuario'#10'WHERE (USERNAME = :Usuari' +
              'o) AND (USERPASSWORD = :Clave)'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'Nombre'
                TableField = 'Nombre'
              end
              item
                DatasetField = 'IDEMPLEADO'
                TableField = 'IDEMPLEADO'
              end>
          end>
        Name = 'spValidaUsuario'
        Fields = <
          item
            Name = 'IDEMPLEADO'
            DataType = datInteger
          end
          item
            Name = 'Nombre'
            DataType = datString
            Size = 70
          end>
      end
      item
        Params = <
          item
            Name = 'UsuarioID'
            Value = '1'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'INGRESOS'
            SQL = 
              'DECLARE @UsuarioID AS INT'#10#10'SELECT @UsuarioID = :UsuarioID'#10#10'SELEC' +
              'T DISTINCT Opcion.OpcionID, Descripcion FROM'#10'       (SELECT     ' +
              'OpcionID'#10'        FROM       Acceso'#10'        WHERE usuarioid = @Us' +
              'uarioID'#10#10'        UNION'#10'        '#10'        SELECT     OpcionID'#10'    ' +
              '    FROM       GrupoAcceso'#10'        WHERE GrupoID IN (SELECT Grup' +
              'oID FROM GrupoUsuario'#10'                          WHERE UsuarioID ' +
              '= @UsuarioID)) SelectUnion  INNER JOIN'#10'                         ' +
              ' Opcion ON Opcion.OpcionID = SelectUnion.OpcionID'#10'ORDER BY Opcio' +
              'n.OpcionID'#10#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'OpcionID'
                TableField = 'OpcionID'
              end
              item
                DatasetField = 'Descripcion'
                TableField = 'Descripcion'
              end>
          end>
        Name = 'spAccesos'
        Fields = <
          item
            Name = 'OpcionID'
            DataType = datInteger
          end
          item
            Name = 'Descripcion'
            DataType = datString
            Size = 50
          end>
      end
      item
        Params = <
          item
            Name = 'Campo'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'Serie'
            Value = ''
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'INGRESOS'
            SQL = 
              'DECLARE @Campo AS VARCHAR(30)'#10'DECLARE @Serie AS VARCHAR(20)'#10#10'SEL' +
              'ECT @Campo = :Campo'#10'SELECT @Serie = :Serie'#10#10'SELECT Folio'#10'FROM Fo' +
              'lio'#10'WHERE (UPPER(Campo) = UPPER(@Campo)) AND (UPPER(Serie) = UPP' +
              'ER(@Serie))'#10#10'UPDATE Folio'#10'SET Folio = Folio + 1'#10'WHERE (UPPER(Cam' +
              'po) = UPPER(@Campo)) AND (UPPER(Serie) = UPPER(@Serie))'#10#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'Folio'
                TableField = 'Folio'
              end>
          end>
        Name = 'spFolio'
        Fields = <
          item
            Name = 'Folio'
            DataType = datInteger
          end>
      end
      item
        Params = <
          item
            Name = 'Identificador'
            Value = '1000'
          end
          item
            Name = 'Tipo'
            Value = '3'
          end
          item
            Name = 'USUARIOS'
            Value = '@1@'
          end>
        Statements = <
          item
            Connection = 'INGRESOS'
            SQL = 
              'SELECT'#10'    ReporteID, Nombre, Tipo, Parametros,'#10'    Template, SQ' +
              'L1, SQL2, CampoJoin,IdentificadorID'#10'  FROM'#10'    dbo.Reporte'#10'WHERE' +
              #10'    IdentificadorID = :Identificador and Tipo = :Tipo AND'#10'    U' +
              'SUARIOS LIKE  '#39'%'#39'+ :USUARIOS +'#39'%'#39#10'order by Nombre'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'ReporteID'
                TableField = 'ReporteID'
              end
              item
                DatasetField = 'Nombre'
                TableField = 'Nombre'
              end
              item
                DatasetField = 'IdentificadorID'
                TableField = 'IdentificadorID'
              end
              item
                DatasetField = 'Tipo'
                TableField = 'Tipo'
              end
              item
                DatasetField = 'Parametros'
                TableField = 'Parametros'
              end
              item
                DatasetField = 'Template'
                TableField = 'Template'
              end
              item
                DatasetField = 'SQL1'
                TableField = 'SQL1'
              end
              item
                DatasetField = 'SQL2'
                TableField = 'SQL2'
              end
              item
                DatasetField = 'CampoJoin'
                TableField = 'CampoJoin'
              end>
          end>
        Name = 'Reportes'
        Fields = <
          item
            Name = 'ReporteID'
            DataType = datInteger
          end
          item
            Name = 'Nombre'
            DataType = datString
            Size = 50
          end
          item
            Name = 'Tipo'
            DataType = datInteger
          end
          item
            Name = 'Parametros'
            DataType = datString
            Size = 10
          end
          item
            Name = 'Template'
            DataType = datMemo
          end
          item
            Name = 'SQL1'
            DataType = datMemo
          end
          item
            Name = 'SQL2'
            DataType = datMemo
          end
          item
            Name = 'CampoJoin'
            DataType = datString
            Size = 30
          end
          item
            Name = 'IdentificadorID'
            DataType = datInteger
          end>
      end
      item
        Params = <
          item
            Name = 'FACTURAID'
            Value = '23'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            SQL = 
              'DECLARE @IEPS AS FLOAT'#10'DECLARE @IVA AS FLOAT'#10'DECLARE @IVAS AS FL' +
              'OAT'#10'DECLARE @TASAIVA AS FLOAT'#10'DECLARE @TASAIEPS AS FLOAT'#10'DECLARE' +
              ' @TOTIMPUESTO AS FLOAT'#10#10'DECLARE @PRODUCTOID AS INT'#10'DECLARE @IMPO' +
              'RTE AS FLOAT'#10'DECLARE @CANTIDAD AS FLOAT'#10'DECLARE @PRECIO AS FLOAT' +
              #10#10'DECLARE @SUCURSAL AS INT'#10#10'DECLARE @CAD AS VARCHAR(4000)'#10'DECLAR' +
              'E @CAD2 AS VARCHAR(4000)'#10'DECLARE @CAD3 AS VARCHAR(4000)'#10'DECLARE ' +
              '@CADENAORIGINAL AS VARCHAR(4000)'#10#10'SELECT @CAD = (SELECT '#39#39')'#10'SELE' +
              'CT @CAD2 = (SELECT '#39#39')'#10'SELECT @CAD3 = (SELECT '#39#39')'#10'SELECT @CADENA' +
              'ORIGINAL = (SELECT '#39#39')'#10#10'DECLARE prueba_Cursor2 SCROLL CURSOR FOR' +
              #10'SELECT ISNULL(SUM(CANTIDAD * PRODUCTO.IEPS),0) AS IEPS, ISNULL(' +
              'IEPS,0) AS TASAIEPS'#10'FROM FACTURA'#10'INNER JOIN DETALLEFACTURA ON DE' +
              'TALLEFACTURA.FACTURAID = FACTURA.FACTURAID'#10'INNER JOIN PRODUCTO O' +
              'N PRODUCTO.PRODUCTOID = DETALLEFACTURA.PRODUCTOID'#10'WHERE (FACTURA' +
              '.FACTURAID = :FACTURAID)AND(PRODUCTO.IEPS <> 0)'#10'GROUP BY IEPS'#10#10'O' +
              'PEN prueba_Cursor2'#10'FETCH NEXT FROM prueba_Cursor2'#10'into @IVA, @TA' +
              'SAIVA'#10#10'WHILE @@FETCH_STATUS = 0'#10'BEGIN'#10'   SELECT @CAD2 = (SELECT ' +
              '@CAD2 + '#39'IEPS'#39'+'#39'|'#39'+CONVERT(VARCHAR,CONVERT(MONEY,@TASAIVA),3)+'#39'|' +
              #39'+'#10'                            CONVERT(VARCHAR,CONVERT(MONEY,(@I' +
              'VA)),2)+'#39'|'#39')'#10#10'   SELECT @TOTIMPUESTO = (SELECT ISNULL(@TOTIMPUES' +
              'TO,0) + @IVA)'#10#10'   FETCH NEXT FROM prueba_Cursor2'#10'   into @IVA, @' +
              'TASAIVA'#10'END'#10#10'CLOSE prueba_Cursor2'#10'DEALLOCATE prueba_Cursor2'#10#10'DEC' +
              'LARE prueba_Cursor2 SCROLL CURSOR FOR'#10'SELECT ISNULL(SUM(FACTURA.' +
              'IMPUESTO),0) AS IVA, ISNULL(IVA,0) AS TASAIVA'#10'FROM FACTURA'#10'WHERE' +
              ' (FACTURA.FACTURAID = :FACTURAID)'#10'GROUP BY IVA'#10#10'OPEN prueba_Curs' +
              'or2'#10'FETCH NEXT FROM prueba_Cursor2'#10'into @IVA, @TASAIVA'#10'WHILE @@F' +
              'ETCH_STATUS = 0'#10'BEGIN'#10'   SELECT @CAD2 = (SELECT @CAD2 + '#39'IVA'#39'+'#39'|' +
              #39'+CONVERT(VARCHAR,CONVERT(MONEY,@TASAIVA),3)+'#39'|'#39'+'#10'              ' +
              '              CONVERT(VARCHAR,CONVERT(MONEY,(@IVA)),2)+'#39'|'#39')'#10#10'   ' +
              'SELECT @TOTIMPUESTO = (SELECT ISNULL(@TOTIMPUESTO,0) + @IVA)'#10#10'  ' +
              ' FETCH NEXT FROM prueba_Cursor2 into @IVA, @TASAIVA'#10'END'#10#10'CLOSE p' +
              'rueba_Cursor2'#10'DEALLOCATE prueba_Cursor2'#10#10'SELECT @CAD2 = (SELECT ' +
              '@CAD2 + CONVERT(VARCHAR,CONVERT(MONEY,@TOTIMPUESTO),2)+'#39'|'#39')'#10#10'DEC' +
              'LARE prueba_Cursor SCROLL CURSOR FOR'#10'SELECT DETALLEFACTURA.PRODU' +
              'CTOID, DETALLEFACTURA.IMPORTE, DETALLEFACTURA.CANTIDAD,'#10'       D' +
              'ETALLEFACTURA.PRECIO FROM DETALLEFACTURA'#10'WHERE DETALLEFACTURA.FA' +
              'CTURAID = :FACTURAID'#10'ORDER BY DETALLEFACTURA.PRODUCTOID ASC'#10#10'OPE' +
              'N prueba_Cursor'#10'FETCH NEXT FROM prueba_Cursor'#10'into @PRODUCTOID, ' +
              '@IMPORTE, @CANTIDAD, @PRECIO'#10#10'WHILE @@FETCH_STATUS = 0'#10'BEGIN'#10'   ' +
              'SELECT @CAD = (SELECT @CAD + CONVERT(VARCHAR,CONVERT(MONEY,@CANT' +
              'IDAD),2)+'#39'|'#39')'#10#10'   IF @PRODUCTOID <= 3'#10'      SELECT @CAD = (SELEC' +
              'T @CAD + '#39'LTS'#39'+'#39'|'#39')'#10#10'   IF @PRODUCTOID > 3'#10'      SELECT @CAD = (' +
              'SELECT @CAD + '#39'UNI'#39'+'#39'|'#39')'#10#10'   SELECT @CAD = (SELECT @CAD + PRODUC' +
              'TO.DESCRIPCION + '#39'|'#39' FROM PRODUCTO WHERE PRODUCTOID = @PRODUCTOI' +
              'D)'#10'   SELECT @CAD = (SELECT @CAD + CONVERT(VARCHAR,CONVERT(MONEY' +
              ',@PRECIO),2)+'#39'|'#39')'#10'   SELECT @CAD = (SELECT @CAD + CONVERT(VARCHA' +
              'R,CONVERT(MONEY,@IMPORTE),2)+'#39'|'#39')'#10#10'   FETCH NEXT FROM prueba_Cur' +
              'sor into @PRODUCTOID, @IMPORTE, @CANTIDAD, @PRECIO'#10'END'#10#10'CLOSE pr' +
              'ueba_Cursor'#10'DEALLOCATE prueba_Cursor'#10#10'SELECT @CADENAORIGINAL = (' +
              'SELECT TOP 1 '#39'||2.0|'#39'+ISNULL(FACTURA.SERIE,'#39#39')+'#39'|'#39'+ISNULL(RTRIM(' +
              'CAST(FACTURA.FOLIO AS VARCHAR(50))),'#39#39')+'#39'|'#39'+'#10'       ISNULL(LEFT(' +
              'CONVERT(VARCHAR, FACTURA.FECHA, 120), 10),'#39#39')+'#39'T'#39'+'#10#10'       ISNUL' +
              'L(Substring(convert(varchar, FACTURA.FECHA, 14),1,8),'#39#39')  + '#39'|'#39#10 +
              #10'       +ISNULL(LTRIM(CAST(GASOLINERO.NOAPROBACION AS VARCHAR (1' +
              '0))),'#39#39')+'#10'       '#39'|'#39'+CAST(YEAR(FACTURA.FECHA) AS VARCHAR(4))+'#39'|'#39 +
              '+'#39'ingreso'#39'+'#39'|'#39'+'#39'pago en una sola exhibicion|'#39'+'#10'       CONVERT(VA' +
              'RCHAR,CONVERT(MONEY,FACTURA.SUBTOTAL),0)+'#39'|'#39'+CONVERT(VARCHAR,CON' +
              'VERT(MONEY,FACTURA.TOTAL),0)+'#39'|'#39'+'#10'       RTRIM(GASOLINERO.RFC)+'#39 +
              '|'#39'+RTRIM(GASOLINERO.NOMBRE)+'#39'|'#39'+RTRIM(GASOLINERO.DOMICILIO)+'#39'|'#39'+' +
              'RTRIM(ISNULL(GASOLINERO.NOEXTERIOR,'#39#39'))+'#39'|'#39'+'#10'       RTRIM(ISNULL' +
              '(GASOLINERO.COLONIA,'#39#39'))+'#39'|'#39'+RTRIM(ISNULL(GASOLINERO.MUNICIPIO,'#39 +
              #39'))+'#39'|'#39'+RTRIM(ISNULL(GASOLINERO.ESTADO,'#39#39'))+'#39'|'#39'+'#10'       RTRIM(IS' +
              'NULL(GASOLINERO.PAIS,'#39#39'))+'#39'|'#39'+RTRIM(ISNULL(GASOLINERO.CODIGOPOST' +
              'AL,'#39#39'))+'#39'|'#39'+'#10'       RTRIM(ISNULL(CLIENTE.RFC,'#39#39'))+'#39'|'#39'+RTRIM(ISNU' +
              'LL(CLIENTE.NOMBRE,'#39#39'))+'#39'|'#39'+RTRIM(ISNULL(CLIENTE.DOMICILIO,'#39#39'))+'#39 +
              '|'#39'+RTRIM(ISNULL(CLIENTE.NOEXTERIOR,'#39#39'))+'#39'|'#39'+'#10'       RTRIM(ISNULL' +
              '(CLIENTE.COLONIA,'#39#39'))+'#39'|'#39'+RTRIM(ISNULL(CLIENTE.LOCALIDAD,'#39#39'))+'#39'|' +
              #39'+RTRIM(ISNULL(CLIENTE.MUNICIPIO,'#39#39'))+'#39'|'#39'+'#10'       RTRIM(ISNULL(C' +
              'LIENTE.ESTADO,'#39#39'))+'#39'|'#39'+RTRIM(ISNULL(CLIENTE.PAIS,'#39#39'))+'#39'|'#39'+RTRIM(' +
              'ISNULL(CAST(CLIENTE.CODIGOPOSTAL AS VARCHAR(20)),'#39#39'))+'#39'|'#39'+'#10'     ' +
              '  @CAD+@CAD2+'#39'|'#39'  AS CADENAORIGINAL'#10'FROM FACTURA INNER JOIN CLIE' +
              'NTE ON CLIENTE.CLIENTEID = FACTURA.CLIENTEID'#10'INNER JOIN GASOLINE' +
              'RO ON GASOLINERO.GASOLINEROID = GASOLINERO.GASOLINEROID'#10'INNER JO' +
              'IN FORMAPAGO ON CLIENTE.FORMAPAGOID = FORMAPAGO.FORMAPAGOID'#10'WHER' +
              'E FACTURAID = :FACTURAID)'#10#10#10'SELECT @CADENAORIGINAL AS CADENAORIG' +
              'INAL'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'CADENAORIGINAL'
                TableField = 'CADENAORIGINAL'
              end>
          end>
        Name = 'spCadenaOriginal2'
        Fields = <
          item
            Name = 'CADENAORIGINAL'
            DataType = datString
            Size = 4000
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            TargetTable = 'dbo.STATUS'
            StatementType = stAutoSQL
            ColumnMappings = <
              item
                DatasetField = 'IDSTATUS'
                TableField = 'IDSTATUS'
              end
              item
                DatasetField = 'CODIGO'
                TableField = 'CODIGO'
              end
              item
                DatasetField = 'NOMBRE'
                TableField = 'NOMBRE'
              end>
          end>
        Name = 'dbo STATUS'
        Fields = <
          item
            Name = 'IDSTATUS'
            DataType = datInteger
            Required = True
            InPrimaryKey = True
          end
          item
            Name = 'CODIGO'
            DataType = datString
            Size = 10
            Required = True
          end
          item
            Name = 'NOMBRE'
            DataType = datString
            Size = 50
            Required = True
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            TargetTable = 'dbo.Opcion'
            SQL = 
              'SELECT '#10'    OpcionID, Descripcion, ImageIndex, PadreID, Orden'#10'  ' +
              'FROM'#10'    dbo.Opcion'#10'  WHERE {Where}'
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'OpcionID'
                TableField = 'OpcionID'
              end
              item
                DatasetField = 'Descripcion'
                TableField = 'Descripcion'
              end
              item
                DatasetField = 'ImageIndex'
                TableField = 'ImageIndex'
              end
              item
                DatasetField = 'PadreID'
                TableField = 'PadreID'
              end
              item
                DatasetField = 'Orden'
                TableField = 'Orden'
              end>
          end>
        Name = 'dbo Opcion'
        Fields = <
          item
            Name = 'OpcionID'
            DataType = datInteger
            Required = True
          end
          item
            Name = 'Descripcion'
            DataType = datString
            Size = 50
            Required = True
          end
          item
            Name = 'ImageIndex'
            DataType = datInteger
            Required = True
          end
          item
            Name = 'PadreID'
            DataType = datInteger
            Required = True
          end
          item
            Name = 'Orden'
            DataType = datInteger
            Required = True
          end>
      end
      item
        Params = <
          item
            Name = 'IDMAESTRO'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            SQL = 
              'SELECT'#10'    IDMAESTRO,CODIGO,NOMBRE,IMSS,DIRECCION,EMAIL'#10'  FROM'#10' ' +
              '   dbo.MAESTRO'#10'  WHERE'#10'    IDMAESTRO = :IDMAESTRO'#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'DatosMaestro'
        Fields = <>
      end
      item
        Params = <
          item
            Name = 'ProductoID'
            Value = '1'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            SQL = 
              'declare @ProductoID as integer'#10#10'select @ProductoID = (select :Pr' +
              'oductoID)'#10#10'SELECT PrecioVenta from Producto where IDPRODUCTO = @' +
              'ProductoID'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'PrecioVenta'
                TableField = 'PrecioVenta'
              end>
          end>
        Name = 'spPrecioProducto'
        Fields = <
          item
            Name = 'PrecioVenta'
            DataType = datFloat
          end>
      end
      item
        Params = <
          item
            Name = 'Campo'
            Value = 'FOLIOFACTURA'
            ParamType = daptInput
          end
          item
            Name = 'Serie'
            Value = 'A'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            SQL = 
              'declare @Campo as varchar(50)'#10'declare @Serie as varchar(10)'#10#10'sel' +
              'ect @Campo = (Select :Campo)'#10'select @Serie = (Select :Serie)'#10#10'se' +
              'lect Folio from folio'#10'where campo = @campo and serie = @serie'#10#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'Folio'
                TableField = 'Folio'
              end>
          end>
        Name = 'spFolioActual'
        Fields = <
          item
            Name = 'Folio'
            DataType = datInteger
          end>
      end
      item
        Params = <
          item
            Name = 'Serie'
            Value = 'A'
          end
          item
            Name = 'Folio'
            Value = '1'
          end>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            SQL = 
              'select FacturaID from factura'#10'where serie = :Serie and Folio = :' +
              'Folio'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'FacturaID'
                TableField = 'FacturaID'
              end>
          end>
        Name = 'spValidaFolioFactura'
        Fields = <
          item
            Name = 'FacturaID'
            DataType = datInteger
          end>
      end
      item
        Params = <
          item
            Name = 'FacturaID'
            Value = '1'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            TargetTable = 'dbo.DetalleFactura'
            SQL = 
              'declare @FacturaID as integer'#10'select @FacturaID = (select :Factu' +
              'raID)'#10#10'SELECT'#10'    DetalleFacturaID, Cantidad, Precio, Importe, I' +
              'temNo,'#10'    FacturaID, ProductoID'#10'  FROM'#10'    dbo.DetalleFactura'#10' ' +
              ' WHERE FacturaID = @FacturaID'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'DetalleFacturaID'
                TableField = 'DetalleFacturaID'
              end
              item
                DatasetField = 'Cantidad'
                TableField = 'Cantidad'
              end
              item
                DatasetField = 'Precio'
                TableField = 'Precio'
              end
              item
                DatasetField = 'Importe'
                TableField = 'Importe'
              end
              item
                DatasetField = 'ItemNo'
                TableField = 'ItemNo'
              end
              item
                DatasetField = 'FacturaID'
                TableField = 'FacturaID'
              end
              item
                DatasetField = 'ProductoID'
                TableField = 'ProductoID'
              end>
          end>
        Name = 'DetalleFactura'
        Fields = <
          item
            Name = 'DetalleFacturaID'
            DataType = datInteger
          end
          item
            Name = 'Cantidad'
            DataType = datFloat
          end
          item
            Name = 'Precio'
            DataType = datFloat
          end
          item
            Name = 'Importe'
            DataType = datFloat
          end
          item
            Name = 'ItemNo'
            DataType = datInteger
          end
          item
            Name = 'FacturaID'
            DataType = datInteger
          end
          item
            Name = 'ProductoID'
            DataType = datInteger
          end>
      end
      item
        Params = <
          item
            Name = 'IDCLIENTE'
            Value = '1'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            SQL = 
              'declare @IDCLIENTE as integer'#10#10'Select  @IDCLIENTE = (select :IDC' +
              'LIENTE)'#10#10'SELECT'#10'    *'#10'  FROM'#10'    dbo.Cliente'#10'  WHERE IDCLIENTE =' +
              ' @IDCLIENTE'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDCLIENTE'
                TableField = 'IDCLIENTE'
              end
              item
                DatasetField = 'CODIGO'
                TableField = 'CODIGO'
              end
              item
                DatasetField = 'NOMBRE'
                TableField = 'NOMBRE'
              end
              item
                DatasetField = 'GRUPO'
                TableField = 'GRUPO'
              end
              item
                DatasetField = 'CALLE'
                TableField = 'CALLE'
              end
              item
                DatasetField = 'COLONIA'
                TableField = 'COLONIA'
              end
              item
                DatasetField = 'CIUDAD'
                TableField = 'CIUDAD'
              end
              item
                DatasetField = 'TELEFONO'
                TableField = 'TELEFONO'
              end
              item
                DatasetField = 'CODIGOPOSTAL'
                TableField = 'CODIGOPOSTAL'
              end
              item
                DatasetField = 'RFC'
                TableField = 'RFC'
              end
              item
                DatasetField = 'CURP'
                TableField = 'CURP'
              end
              item
                DatasetField = 'STATUS'
                TableField = 'STATUS'
              end
              item
                DatasetField = 'CCA'
                TableField = 'CCA'
              end
              item
                DatasetField = 'CCC'
                TableField = 'CCC'
              end
              item
                DatasetField = 'LOCALIDAD'
                TableField = 'LOCALIDAD'
              end
              item
                DatasetField = 'DIRECCION'
                TableField = 'DIRECCION'
              end
              item
                DatasetField = 'NOEXTERIOR'
                TableField = 'NOEXTERIOR'
              end
              item
                DatasetField = 'MUNICIPIO'
                TableField = 'MUNICIPIO'
              end
              item
                DatasetField = 'ESTADO'
                TableField = 'ESTADO'
              end
              item
                DatasetField = 'PAIS'
                TableField = 'PAIS'
              end
              item
                DatasetField = 'EMAIL'
                TableField = 'EMAIL'
              end>
          end>
        Name = 'ObtenerDatosCliente'
        Fields = <
          item
            Name = 'IDCLIENTE'
            DataType = datInteger
          end
          item
            Name = 'CODIGO'
            DataType = datString
            Size = 10
          end
          item
            Name = 'NOMBRE'
            DataType = datString
            Size = 80
          end
          item
            Name = 'GRUPO'
            DataType = datString
            Size = 30
          end
          item
            Name = 'CALLE'
            DataType = datString
            Size = 60
          end
          item
            Name = 'COLONIA'
            DataType = datString
            Size = 30
          end
          item
            Name = 'CIUDAD'
            DataType = datString
            Size = 30
          end
          item
            Name = 'TELEFONO'
            DataType = datString
            Size = 20
          end
          item
            Name = 'CODIGOPOSTAL'
            DataType = datString
            Size = 5
          end
          item
            Name = 'RFC'
            DataType = datString
            Size = 15
          end
          item
            Name = 'CURP'
            DataType = datString
            Size = 20
          end
          item
            Name = 'STATUS'
            DataType = datInteger
          end
          item
            Name = 'CCA'
            DataType = datString
            Size = 20
          end
          item
            Name = 'CCC'
            DataType = datString
            Size = 20
          end
          item
            Name = 'LOCALIDAD'
            DataType = datString
            Size = 25
          end
          item
            Name = 'DIRECCION'
            DataType = datString
            Size = 100
          end
          item
            Name = 'NOEXTERIOR'
            DataType = datString
            Size = 50
          end
          item
            Name = 'MUNICIPIO'
            DataType = datString
            Size = 100
          end
          item
            Name = 'ESTADO'
            DataType = datString
            Size = 100
          end
          item
            Name = 'PAIS'
            DataType = datString
            Size = 100
          end
          item
            Name = 'EMAIL'
            DataType = datString
            Size = 150
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            SQL = 'SELECT * FROM PRODUCTO'#10'WHERE IDPRODUCTO > 3'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDPRODUCTO'
                TableField = 'IDPRODUCTO'
              end
              item
                DatasetField = 'CODIGOPRODUCTO'
                TableField = 'CODIGOPRODUCTO'
              end
              item
                DatasetField = 'NOMBRE'
                TableField = 'NOMBRE'
              end
              item
                DatasetField = 'PRECIOVENTA'
                TableField = 'PRECIOVENTA'
              end
              item
                DatasetField = 'CLAVEPEMEX'
                TableField = 'CLAVEPEMEX'
              end
              item
                DatasetField = 'COSTO'
                TableField = 'COSTO'
              end
              item
                DatasetField = 'STATUS'
                TableField = 'STATUS'
              end
              item
                DatasetField = 'CCCOMPRA'
                TableField = 'CCCOMPRA'
              end
              item
                DatasetField = 'CCIVA'
                TableField = 'CCIVA'
              end
              item
                DatasetField = 'IEPS'
                TableField = 'IEPS'
              end
              item
                DatasetField = 'PUNTOS'
                TableField = 'PUNTOS'
              end
              item
                DatasetField = 'CCVENTA'
                TableField = 'CCVENTA'
              end
              item
                DatasetField = 'IDLINEA'
                TableField = 'IDLINEA'
              end
              item
                DatasetField = 'IDUNIDADMEDIDA'
                TableField = 'IDUNIDADMEDIDA'
              end>
          end>
        Name = 'spProducto'
        Fields = <
          item
            Name = 'IDPRODUCTO'
            DataType = datInteger
          end
          item
            Name = 'CODIGOPRODUCTO'
            DataType = datString
            Size = 10
          end
          item
            Name = 'NOMBRE'
            DataType = datString
            Size = 150
          end
          item
            Name = 'PRECIOVENTA'
            DataType = datFloat
          end
          item
            Name = 'CLAVEPEMEX'
            DataType = datString
            Size = 50
          end
          item
            Name = 'COSTO'
            DataType = datFloat
          end
          item
            Name = 'STATUS'
            DataType = datBoolean
          end
          item
            Name = 'CCCOMPRA'
            DataType = datString
            Size = 20
          end
          item
            Name = 'CCVENTA'
            DataType = datString
            Size = 20
          end
          item
            Name = 'CCIVA'
            DataType = datString
            Size = 20
          end
          item
            Name = 'IEPS'
            DataType = datFloat
          end
          item
            Name = 'PUNTOS'
            DataType = datInteger
          end
          item
            Name = 'IDLINEA'
            DataType = datInteger
          end
          item
            Name = 'IDUNIDADMEDIDA'
            DataType = datInteger
          end>
      end
      item
        Params = <
          item
            Name = 'ProductoID'
            Value = '1'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            SQL = 
              'declare @ProductoID int'#10'select @ProductoID = (select :ProductoID' +
              ')'#10'select IEPS from producto'#10'where IDPRODUCTO = @ProductoID or CO' +
              'DIGOPRODUCTO = cast(@ProductoID as varchar(10))'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IEPS'
                TableField = 'IEPS'
              end>
          end>
        Name = 'spIEPS'
        Fields = <
          item
            Name = 'IEPS'
            DataType = datFloat
          end>
      end
      item
        Params = <
          item
            Name = 'NOMBRES'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'APATERNO'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'AMATERNO'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'FECHANAC'
            Value = ''
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            SQL = 
              'DECLARE @NOMBRES_AUX VARCHAR(100)'#10'DECLARE @APATERNO_AUX VARCHAR(' +
              '100)'#10'DECLARE @AMATERNO_AUX VARCHAR(100)'#10'DECLARE @FECHANACIMIENTO' +
              ' DATETIME'#10#10'SET @NOMBRES_AUX = :NOMBRES'#10'SET @APATERNO_AUX = :APAT' +
              'ERNO'#10'SET @AMATERNO_AUX = :AMATERNO'#10'SET @FECHANACIMIENTO = :FECHA' +
              'NAC'#10#10'--DECLARACION DE VARIABLES'#10'DECLARE @NOMBRES VARCHAR(100)'#10'DE' +
              'CLARE @APATERNO VARCHAR(100)'#10'DECLARE @AMATERNO VARCHAR(100)'#10'DECL' +
              'ARE @T_NOMTOT CHAR(52)'#10'DECLARE @NOMBRE1 VARCHAR(100) --PRIMER NO' +
              'MBRE'#10'DECLARE @NOMBRE2 VARCHAR(100) --DEMAS NOMBRES'#10'DECLARE @NOMB' +
              'RES_LONGITUD INT --LONGITUD DE TODOS @NOMBRES'#10'DECLARE @NOMBRE1_L' +
              'ONGITUD INT --LONGITUD DEL PRIMER NOMBRE(MAS UNO,EL QUE SOBRA ES' +
              ' UN ESPACIO EN BLANCO)'#10'DECLARE @APATERNO1 VARCHAR(100) --PRIMER ' +
              'NOMBRE'#10'DECLARE @APATERNO2 VARCHAR(100) --DEMAS NOMBRES'#10'DECLARE @' +
              'APATERNO_LONGITUD INT --LONGITUD DE TODOS @NOMBRES'#10'DECLARE @APAT' +
              'ERNO1_LONGITUD INT --LONGITUD DEL PRIMER NOMBRE(MAS UNO,EL QUE S' +
              'OBRA ES UN ESPACIO EN BLANCO)'#10'DECLARE @AMATERNO1 VARCHAR(100) --' +
              'PRIMER NOMBRE'#10'DECLARE @AMATERNO2 VARCHAR(100) --DEMAS NOMBRES'#10'DE' +
              'CLARE @AMATERNO_LONGITUD INT --LONGITUD DE TODOS @NOMBRES'#10'DECLAR' +
              'E @AMATERNO1_LONGITUD INT --LONGITUD DEL PRIMER NOMBRE(MAS UNO,E' +
              'L QUE SOBRA ES UN ESPACIO EN BLANCO)'#10'DECLARE @VARLOOPS INT --VAR' +
              'IABLE PARA LOS LOOPS, SE INICIALIZA AL INICIR UN LOOP'#10'DECLARE @R' +
              'FC CHAR(16)'#10'DECLARE @T_NOMNUM CHAR(102) --Nombre numerico'#10'DECLAR' +
              'E @T_SUMA INT'#10'DECLARE @T_DIVID INT -- Dividendo'#10'DECLARE @T_MOD I' +
              'NT -- MOD de la division'#10'DECLARE @T_HOMOCLV CHAR(3) -- Homoclave' +
              #10'DECLARE @T_NUMERO INT -- Numero ASC asignado a un caracter'#10'DECL' +
              'ARE @T_PARCIAL INT -- Acumulado de la suma de los caracteres del' +
              ' RFC'#10#10#10'--INICIALZA VARIABLES'#10'SET @NOMBRES = LTRIM(RTRIM(@NOMBRES' +
              '_AUX))'#10'SET @APATERNO = LTRIM(RTRIM(@APATERNO_AUX))'#10'SET @AMATERNO' +
              ' = LTRIM(RTRIM(@AMATERNO_AUX))'#10'SET @T_NOMTOT =@APATERNO+'#39' '#39'+@AMA' +
              'TERNO+'#39' '#39'+@NOMBRES'#10#10'--PROCESAR NOMBRES DE PILA'#10'SET @VARLOOPS = 0' +
              #10'WHILE @VARLOOPS <> 1'#10'BEGIN'#10#10'SET @NOMBRES_LONGITUD = LEN(@NOMBRE' +
              'S)'#10'SET @NOMBRE1_LONGITUD = PATINDEX('#39'% %'#39',@NOMBRES)'#10#10'IF @NOMBRE1' +
              '_LONGITUD = 0'#10'SET @NOMBRE1_LONGITUD = @NOMBRES_LONGITUD'#10#10'SET @NO' +
              'MBRE1 = RTRIM(LEFT(@NOMBRES,@NOMBRE1_LONGITUD))'#10'SET @NOMBRE2 = L' +
              'TRIM(RIGHT(@NOMBRES,@NOMBRES_LONGITUD - @NOMBRE1_LONGITUD))'#10#10'--S' +
              'E QUINTAN LOS NOMBRES DE JOSE, MARIA,MA,MA.'#10'IF @NOMBRE1 IN ('#39'JOS' +
              'E'#39','#39'MARIA'#39','#39'MA.'#39','#39'MA'#39','#39'DE'#39','#39'LA'#39','#39'LAS'#39','#39'MC'#39','#39'VON'#39','#39'DEL'#39','#39'LOS'#39','#39'Y'#39 +
              ','#39'MAC'#39','#39'VAN'#39') AND @NOMBRE2 <> '#39#39#10'BEGIN'#10'SET @NOMBRES = @NOMBRE2'#10#10 +
              'END'#10'ELSE'#10'BEGIN'#10'SET @VARLOOPS = 1'#10'END'#10'END'#10#10'--PROCESAMOS APELLIDOS' +
              ', PATERNO EN UN LOOP'#10'SET @VARLOOPS = 0'#10'WHILE @VARLOOPS <> 1'#10'BEGI' +
              'N'#10#10'SET @APATERNO_LONGITUD = LEN(@APATERNO)'#10'SET @APATERNO1_LONGIT' +
              'UD = PATINDEX('#39'% %'#39',@APATERNO)'#10#10'IF @APATERNO1_LONGITUD = 0'#10'SET @' +
              'APATERNO1_LONGITUD = @APATERNO_LONGITUD'#10#10'SET @APATERNO1 = RTRIM(' +
              'LEFT(@APATERNO,@APATERNO1_LONGITUD))'#10'SET @APATERNO2 = LTRIM(RIGH' +
              'T(@APATERNO,@APATERNO_LONGITUD - @APATERNO1_LONGITUD))'#10#10'--SE QUI' +
              'NTAN LOS SUFIJOS'#10'IF @APATERNO1 IN ('#39'DE'#39','#39'LA'#39','#39'LAS'#39','#39'MC'#39','#39'VON'#39','#39'D' +
              'EL'#39','#39'LOS'#39','#39'Y'#39','#39'MAC'#39','#39'VAN'#39') AND @APATERNO2 <> '#39#39#10'BEGIN'#10'SET @APATE' +
              'RNO = @APATERNO2'#10#10'END'#10'ELSE'#10'BEGIN'#10'SET @VARLOOPS = 1'#10'END'#10'END'#10#10'--PR' +
              'OCESAMOS APELLIDOS, MATERNO EN UN LOOP'#10'SET @VARLOOPS = 0'#10'WHILE @' +
              'VARLOOPS <> 1'#10'BEGIN'#10#10'SET @AMATERNO_LONGITUD = LEN(@AMATERNO)'#10'SET' +
              ' @AMATERNO1_LONGITUD = PATINDEX('#39'% %'#39',@AMATERNO)'#10#10'IF @AMATERNO1_' +
              'LONGITUD = 0'#10'SET @AMATERNO1_LONGITUD = @AMATERNO_LONGITUD'#10#10'SET @' +
              'AMATERNO1 = RTRIM(LEFT(@AMATERNO,@AMATERNO1_LONGITUD))'#10'SET @AMAT' +
              'ERNO2 = LTRIM(RIGHT(@AMATERNO,@AMATERNO_LONGITUD - @AMATERNO1_LO' +
              'NGITUD))'#10#10'--SE QUINTAN LOS SUFIJOS'#10'IF @AMATERNO1 IN ('#39'DE'#39','#39'LA'#39','#39 +
              'LAS'#39','#39'MC'#39','#39'VON'#39','#39'DEL'#39','#39'LOS'#39','#39'Y'#39','#39'MAC'#39','#39'VAN'#39') AND @AMATERNO2 <> '#39 +
              #39#10'BEGIN'#10'SET @AMATERNO = @AMATERNO2'#10#10'END'#10'ELSE'#10'BEGIN'#10'SET @VARLOOPS' +
              ' = 1'#10'END'#10'END'#10#10'--SE OBTIENE DEL PRIMER APELLIDO LA PRIMER LETRA Y' +
              ' LA PRIMER VOCAL INTERNA'#10'SET @RFC = LEFT(@APATERNO1,1)'#10'SET @APAT' +
              'ERNO1_LONGITUD= LEN(@APATERNO1)'#10'SET @VARLOOPS = 1 --EMPIEZA EN U' +
              'NO POR LA PRIMERA LETRA SE LA VA A SALTAR'#10#10'WHILE @APATERNO1_LONG' +
              'ITUD > @VARLOOPS'#10'BEGIN'#10'SET @VARLOOPS = @VARLOOPS + 1'#10#10'IF SUBSTRI' +
              'NG(@APATERNO1,@VARLOOPS,1) IN ('#39'A'#39','#39'E'#39','#39'I'#39','#39'O'#39','#39'U'#39')'#10'BEGIN'#10#10'SET @' +
              'RFC = RTRIM(@RFC)+CONVERT(CHAR(1),SUBSTRING(@APATERNO1,@VARLOOPS' +
              ',1))'#10'SET @VARLOOPS = @APATERNO1_LONGITUD'#10#10'END'#10#10'END'#10#10'--SE OBTIENE' +
              ' LA PRIMER LETRA DEL APELLIDO MATERNO SI NO TIENE APELLIDO MATER' +
              'NO SE PONE UNA X'#10'--DICE QUE SI NO TIENE APELLIDO MATERNO LE PONG' +
              'AS LA PRIMER LETRA DEL APELLIDO PATERNO EN EL RFX'#10#10'IF ISNULL(@AM' +
              'ATERNO1,'#39#39') = '#39#39#10'BEGIN'#10'SET @RFC = RTRIM(@RFC)+CONVERT(CHAR(1),SU' +
              'BSTRING(@APATERNO1,1,1))'#10'END'#10'ELSE'#10'BEGIN'#10'SET @RFC = RTRIM(@RFC)+C' +
              'ONVERT(CHAR(1),SUBSTRING(@AMATERNO1,1,1))'#10'END'#10'--SE LE AGREGA LA ' +
              'PRIMER LETRA DEL NOMBRE'#10'SET @RFC = RTRIM(@RFC)+CONVERT(CHAR(1),S' +
              'UBSTRING(@NOMBRE1,1,1))'#10#10'--CHEAS QUE NO SEA UNA PALARA INCONVENI' +
              'ENTE'#10'/*'#10'IF EXISTS ( SELECT INC_PALINC FROM NINCO WHERE INC_PALIN' +
              'C = @RFC )'#10'BEGIN'#10'SELECT @RFC = LTRIM(RTRIM (SUBSTRING (@RFC , 1 ' +
              ', 3))) + '#39'X'#39#10'END'#10'*/'#10'--SE LE AGREGA LA FECHA DE NACIMIENTO'#10#10'SET @' +
              'RFC = RTRIM(@RFC) + CONVERT(CHAR,@FECHANACIMIENTO,12)'#10#10'--HOMOCLA' +
              'VE'#10'SET @T_NOMNUM = '#39'0'#39#10#10'--SACA NOMBRE NUMERICO'#10'SET @VARLOOPS = 1' +
              #10'WHILE @VARLOOPS <= 52'#10'BEGIN'#10'SET @T_NOMNUM = LTRIM(RTRIM (@T_NOM' +
              'NUM)) +'#10'CASE'#10'WHEN SUBSTRING (@T_NOMTOT , @VARLOOPS, 1) = '#39'A'#39' THE' +
              'N '#39'11'#39#10'WHEN SUBSTRING (@T_NOMTOT , @VARLOOPS , 1) = '#39'B'#39' THEN '#39'12' +
              #39#10'WHEN SUBSTRING (@T_NOMTOT , @VARLOOPS , 1) = '#39'C'#39' THEN '#39'13'#39#10'WHE' +
              'N SUBSTRING (@T_NOMTOT , @VARLOOPS , 1) = '#39'D'#39' THEN '#39'14'#39#10'WHEN SUB' +
              'STRING (@T_NOMTOT , @VARLOOPS , 1) = '#39'E'#39' THEN '#39'15'#39#10'WHEN SUBSTRIN' +
              'G (@T_NOMTOT , @VARLOOPS , 1) = '#39'F'#39' THEN '#39'16'#39#10'WHEN SUBSTRING (@T' +
              '_NOMTOT , @VARLOOPS , 1) = '#39'G'#39' THEN '#39'17'#39#10'WHEN SUBSTRING (@T_NOMT' +
              'OT , @VARLOOPS , 1) = '#39'H'#39' THEN '#39'18'#39#10'WHEN SUBSTRING (@T_NOMTOT , ' +
              '@VARLOOPS , 1) = '#39'I'#39' THEN '#39'19'#39#10'WHEN SUBSTRING (@T_NOMTOT , @VARL' +
              'OOPS , 1) = '#39'J'#39' THEN '#39'21'#39#10'WHEN SUBSTRING (@T_NOMTOT , @VARLOOPS ' +
              ', 1) = '#39'K'#39' THEN '#39'22'#39#10'WHEN SUBSTRING (@T_NOMTOT , @VARLOOPS , 1) ' +
              '= '#39'L'#39' THEN '#39'23'#39#10'WHEN SUBSTRING (@T_NOMTOT , @VARLOOPS , 1) = '#39'M'#39 +
              ' THEN '#39'24'#39#10'WHEN SUBSTRING (@T_NOMTOT , @VARLOOPS , 1) = '#39'N'#39' THEN' +
              ' '#39'25'#39#10'WHEN SUBSTRING (@T_NOMTOT , @VARLOOPS , 1) = '#39'O'#39' THEN '#39'26'#39 +
              #10'WHEN SUBSTRING (@T_NOMTOT , @VARLOOPS , 1) = '#39'P'#39' THEN '#39'27'#39#10'WHEN' +
              ' SUBSTRING (@T_NOMTOT , @VARLOOPS , 1) = '#39'Q'#39' THEN '#39'28'#39#10'WHEN SUBS' +
              'TRING (@T_NOMTOT , @VARLOOPS , 1) = '#39'R'#39' THEN '#39'29'#39#10'WHEN SUBSTRING' +
              ' (@T_NOMTOT , @VARLOOPS , 1) = '#39'S'#39' THEN '#39'32'#39#10'WHEN SUBSTRING (@T_' +
              'NOMTOT , @VARLOOPS , 1) = '#39'T'#39' THEN '#39'33'#39#10'WHEN SUBSTRING (@T_NOMTO' +
              'T , @VARLOOPS , 1) = '#39'U'#39' THEN '#39'34'#39#10'WHEN SUBSTRING (@T_NOMTOT , @' +
              'VARLOOPS , 1) = '#39'V'#39' THEN '#39'35'#39#10'WHEN SUBSTRING (@T_NOMTOT , @VARLO' +
              'OPS , 1) = '#39'W'#39' THEN '#39'36'#39#10'WHEN SUBSTRING (@T_NOMTOT , @VARLOOPS ,' +
              ' 1) = '#39'X'#39' THEN '#39'37'#39#10'WHEN SUBSTRING (@T_NOMTOT , @VARLOOPS , 1) =' +
              ' '#39'Y'#39' THEN '#39'38'#39#10'WHEN SUBSTRING (@T_NOMTOT , @VARLOOPS , 1) = '#39'Z'#39' ' +
              'THEN '#39'39'#39#10'WHEN SUBSTRING (@T_NOMTOT , @VARLOOPS , 1) >= '#39'0'#39' AND'#10 +
              'SUBSTRING (@T_NOMTOT , @VARLOOPS , 1) <= '#39'9'#39' THEN CONVERT(VARCHA' +
              'R,CONVERT(INT, SUBSTRING (@T_NOMTOT , @VARLOOPS , 1)) , 2)'#10'WHEN ' +
              'SUBSTRING (@T_NOMTOT , @VARLOOPS , 1) IN ('#39'&'#39','#39#209#39') THEN '#39'10'#39#10'ELS' +
              'E '#39'00'#39#10'END'#10#10'SET @VARLOOPS = @VARLOOPS + 1'#10'END'#10'set @VARLOOPS = 1'#10 +
              'SET @T_SUMA = 0'#10'while @VARLOOPS <= 99'#10'begin'#10'SET @T_SUMA = @T_SUM' +
              'A + ((CONVERT(INT,SUBSTRING (@T_NOMNUM , @VARLOOPS , 1))*10) + C' +
              'ONVERT(INT,SUBSTRING (@T_NOMNUM , @VARLOOPS+1 , 1))) * CONVERT(I' +
              'NT,SUBSTRING (@T_NOMNUM , @VARLOOPS+1 , 1))'#10#10'SET @VARLOOPS = @VA' +
              'RLOOPS + 1'#10'end'#10#10'-- Obtener HOMOCLAVE'#10#10'SELECT @T_DIVID = @T_SUMA%' +
              '1000 -- Obtener residuo de los ultimos 3 digitos'#10'SELECT @T_MOD =' +
              ' @T_DIVID%34 -- Obtener el residuo de los ultimos 3 digitos-- en' +
              'tre 34'#10'SELECT @T_DIVID = (@T_DIVID - @T_MOD) / 34 -- Obtener el ' +
              'Cociente entero'#10'--select @T_DIVID,@T_MOD'#10'-- Checar Cociente y re' +
              'siduo'#10'SET @VARLOOPS = 0'#10#10'WHILE @VARLOOPS <= 1'#10'BEGIN'#10'SET @T_HOMOC' +
              'LV ='#10'CASE CASE @VARLOOPS WHEN 0 THEN @T_DIVID ELSE @T_MOD END'#10'WH' +
              'EN 0 THEN '#39'1'#39#10'WHEN 1 THEN '#39'2'#39#10'WHEN 2 THEN '#39'3'#39#10'WHEN 3 THEN '#39'4'#39#10'WH' +
              'EN 4 THEN '#39'5'#39#10'WHEN 5 THEN '#39'6'#39#10'WHEN 6 THEN '#39'7'#39#10'WHEN 7 THEN '#39'8'#39#10'WH' +
              'EN 8 THEN '#39'9'#39#10'WHEN 9 THEN '#39'A'#39#10'WHEN 10 THEN '#39'B'#39#10'WHEN 11 THEN '#39'C'#39#10 +
              'WHEN 12 THEN '#39'D'#39#10'WHEN 13 THEN '#39'E'#39#10'WHEN 14 THEN '#39'F'#39#10'WHEN 15 THEN ' +
              #39'G'#39#10'WHEN 16 THEN '#39'H'#39#10'WHEN 17 THEN '#39'I'#39#10#10'WHEN 18 THEN '#39'J'#39#10'WHEN 19 ' +
              'THEN '#39'K'#39#10'WHEN 20 THEN '#39'L'#39#10'WHEN 21 THEN '#39'M'#39#10'WHEN 22 THEN '#39'N'#39#10'WHEN' +
              ' 23 THEN '#39'P'#39#10'WHEN 24 THEN '#39'Q'#39#10'WHEN 25 THEN '#39'R'#39#10'WHEN 26 THEN '#39'S'#39#10 +
              'WHEN 27 THEN '#39'T'#39#10'WHEN 28 THEN '#39'U'#39#10'WHEN 29 THEN '#39'V'#39#10'WHEN 30 THEN ' +
              #39'W'#39#10'WHEN 31 THEN '#39'X'#39#10'WHEN 32 THEN '#39'Y'#39#10'ELSE '#39'Z'#39#10'END'#10'SET @VARLOOPS' +
              ' = @VARLOOPS + 1'#10'-- Incluir la parte de la homoclave'#10'SET @RFC = ' +
              'LTRIM(RTRIM (@RFC)) + LTRIM(RTRIM (@T_HOMOCLV))'#10'END'#10'-- ---------' +
              '------------------------------------'#10'-- Obtener Digito Verificad' +
              'or'#10'-- ---------------------------------------------'#10'SET @VARLOOP' +
              'S = 0'#10'SET @T_PARCIAL = 0'#10'WHILE @VARLOOPS < 12'#10'BEGIN'#10'SELECT @VARL' +
              'OOPS = @VARLOOPS + 1'#10'SET @T_NUMERO ='#10'CASE'#10'WHEN SUBSTRING (@RFC ,' +
              ' @VARLOOPS , 1) = '#39'A'#39' THEN 10'#10'WHEN SUBSTRING (@RFC , @VARLOOPS ,' +
              ' 1) = '#39'B'#39' THEN 11'#10'WHEN SUBSTRING (@RFC , @VARLOOPS , 1) = '#39'C'#39' TH' +
              'EN 12'#10'WHEN SUBSTRING (@RFC , @VARLOOPS , 1) = '#39'D'#39' THEN 13'#10'WHEN S' +
              'UBSTRING (@RFC , @VARLOOPS , 1) = '#39'E'#39' THEN 14'#10'WHEN SUBSTRING (@R' +
              'FC , @VARLOOPS , 1) = '#39'F'#39' THEN 15'#10'WHEN SUBSTRING (@RFC , @VARLOO' +
              'PS , 1) = '#39'G'#39' THEN 16'#10'WHEN SUBSTRING (@RFC , @VARLOOPS , 1) = '#39'H' +
              #39' THEN 17'#10'WHEN SUBSTRING (@RFC , @VARLOOPS , 1) = '#39'I'#39' THEN 18'#10'WH' +
              'EN SUBSTRING (@RFC , @VARLOOPS , 1) = '#39'J'#39' THEN 19'#10'WHEN SUBSTRING' +
              ' (@RFC , @VARLOOPS , 1) = '#39'K'#39' THEN 20'#10'WHEN SUBSTRING (@RFC , @VA' +
              'RLOOPS , 1) = '#39'L'#39' THEN 21'#10'WHEN SUBSTRING (@RFC , @VARLOOPS , 1) ' +
              '= '#39'M'#39' THEN 22'#10'WHEN SUBSTRING (@RFC , @VARLOOPS , 1) = '#39'N'#39' THEN 2' +
              '3'#10'WHEN SUBSTRING (@RFC , @VARLOOPS , 1) = '#39'O'#39' THEN 25'#10'WHEN SUBST' +
              'RING (@RFC , @VARLOOPS , 1) = '#39'P'#39' THEN 26'#10'WHEN SUBSTRING (@RFC ,' +
              ' @VARLOOPS , 1) = '#39'Q'#39' THEN 27'#10'WHEN SUBSTRING (@RFC , @VARLOOPS ,' +
              ' 1) = '#39'R'#39' THEN 28'#10'WHEN SUBSTRING (@RFC , @VARLOOPS , 1) = '#39'S'#39' TH' +
              'EN 29'#10'WHEN SUBSTRING (@RFC , @VARLOOPS , 1) = '#39'T'#39' THEN 30'#10'WHEN S' +
              'UBSTRING (@RFC , @VARLOOPS , 1) = '#39'U'#39' THEN 31'#10'WHEN SUBSTRING (@R' +
              'FC , @VARLOOPS , 1) = '#39'V'#39' THEN 32'#10'WHEN SUBSTRING (@RFC , @VARLOO' +
              'PS , 1) = '#39'W'#39' THEN 33'#10'WHEN SUBSTRING (@RFC , @VARLOOPS , 1) = '#39'X' +
              #39' THEN 34'#10'WHEN SUBSTRING (@RFC , @VARLOOPS , 1) = '#39'Y'#39' THEN 35'#10'WH' +
              'EN SUBSTRING (@RFC , @VARLOOPS , 1) = '#39'Z'#39' THEN 36'#10'WHEN SUBSTRING' +
              ' (@RFC , @VARLOOPS , 1) >= '#39'0'#39' AND'#10'SUBSTRING (@RFC , @VARLOOPS ,' +
              ' 1) <= '#39'9'#39#10#10'THEN CONVERT(INT,SUBSTRING (@RFC , @VARLOOPS , 1))'#10'W' +
              'HEN SUBSTRING (@RFC , @VARLOOPS , 1) = '#39#39#10#10'THEN 24'#10#10'WHEN SUBSTRI' +
              'NG (@RFC , @VARLOOPS , 1) = '#39' '#39#10#10'THEN 37'#10#10'ELSE 0'#10'END'#10'-- Contabil' +
              'izar el nuevo digito'#10'SELECT @T_PARCIAL = @T_PARCIAL + (@T_NUMERO' +
              ' * (14 - @VARLOOPS))'#10'END'#10#10'SET @T_MOD = ROUND(@T_PARCIAL%11,1)'#10'IF' +
              ' @T_MOD = 0'#10#10'SET @RFC = LTRIM(RTRIM (@RFC)) + '#39'0'#39#10'ELSE'#10'BEGIN'#10'SET' +
              ' @T_PARCIAL = 11 - @T_MOD'#10'IF @T_PARCIAL = 10'#10'SELECT @RFC = LTRIM' +
              '(RTRIM (@RFC)) + '#39'A'#39#10'ELSE'#10'SELECT @RFC = LTRIM(RTRIM (@RFC)) + CO' +
              'NVERT(VARCHAR ,@T_PARCIAL)'#10'END'#10#10'SELECT @RFC AS '#39'RFC'#39#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'RFC'
                TableField = 'RFC'
              end>
          end>
        Name = 'spObtenRFC'
        Fields = <
          item
            Name = 'RFC'
            DataType = datString
            Size = 16
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            SQL = 'SELECT * FROM EMPRESA'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDEMPRESA'
                TableField = 'IDEMPRESA'
              end
              item
                DatasetField = 'NOMBRE'
                TableField = 'NOMBRE'
              end
              item
                DatasetField = 'RAZONSOCIAL'
                TableField = 'RAZONSOCIAL'
              end
              item
                DatasetField = 'RFC'
                TableField = 'RFC'
              end
              item
                DatasetField = 'CLAVEPEMEX'
                TableField = 'CLAVEPEMEX'
              end
              item
                DatasetField = 'BOMBAS'
                TableField = 'BOMBAS'
              end
              item
                DatasetField = 'COLONIA'
                TableField = 'COLONIA'
              end
              item
                DatasetField = 'CIUDAD'
                TableField = 'CIUDAD'
              end
              item
                DatasetField = 'CODIGOPOSTAL'
                TableField = 'CODIGOPOSTAL'
              end
              item
                DatasetField = 'HOST'
                TableField = 'HOST'
              end
              item
                DatasetField = 'CC'
                TableField = 'CC'
              end
              item
                DatasetField = 'IMPUESTO'
                TableField = 'IMPUESTO'
              end
              item
                DatasetField = 'TELEFONO'
                TableField = 'TELEFONO'
              end
              item
                DatasetField = 'EMAIL'
                TableField = 'EMAIL'
              end
              item
                DatasetField = 'NUMEROESTACION'
                TableField = 'NUMEROESTACION'
              end>
          end>
        Name = 'spObtenEstaciones'
        Fields = <
          item
            Name = 'IDEMPRESA'
            DataType = datInteger
          end
          item
            Name = 'NOMBRE'
            DataType = datString
            Size = 70
          end
          item
            Name = 'RAZONSOCIAL'
            DataType = datString
            Size = 70
          end
          item
            Name = 'RFC'
            DataType = datString
            Size = 30
          end
          item
            Name = 'CLAVEPEMEX'
            DataType = datString
            Size = 10
          end
          item
            Name = 'BOMBAS'
            DataType = datInteger
          end
          item
            Name = 'COLONIA'
            DataType = datString
            Size = 80
          end
          item
            Name = 'CIUDAD'
            DataType = datString
            Size = 30
          end
          item
            Name = 'CODIGOPOSTAL'
            DataType = datString
            Size = 10
          end
          item
            Name = 'HOST'
            DataType = datString
            Size = 30
          end
          item
            Name = 'CC'
            DataType = datString
            Size = 20
          end
          item
            Name = 'IMPUESTO'
            DataType = datFloat
          end
          item
            Name = 'TELEFONO'
            DataType = datString
            Size = 20
          end
          item
            Name = 'EMAIL'
            DataType = datString
            Size = 50
          end
          item
            Name = 'NUMEROESTACION'
            DataType = datInteger
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            SQL = 
              'SELECT NOMBRE + '#39'@'#39' + CAST(ISNULL(NUMEROESTACION,0) AS VARCHAR(2' +
              '0)) AS NUMEROESTRACION FROM EMPRESA'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'NUMEROESTRACION'
                TableField = 'NUMEROESTRACION'
              end>
          end>
        Name = 'spObtenNumEstacion'
        Fields = <
          item
            Name = 'NUMEROESTRACION'
            DataType = datString
            Size = 91
          end>
      end
      item
        Params = <
          item
            Name = 'FECHAINI'
            Value = '01/01/2011'
          end
          item
            Name = 'FECHAFIN'
            Value = '11/25/2011'
          end
          item
            Name = 'SERIE'
            Value = 'DFF'
          end>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            SQL = 
              'SELECT CLIENTE.RFC, FACTURA.SERIE, FACTURA.FOLIO, CONVERT(VARCHA' +
              'R(4), FACTURA.FECHA, 20) + CAST(CONFIGURACION.NOAPROBACION AS VA' +
              'RCHAR(100)) AS FECHANOAPROBACION, CONVERT(VARCHAR(2), FACTURA.FE' +
              'CHA, 5)+ '#39'/'#39' + CONVERT(VARCHAR(2), FACTURA.FECHA, 10) + '#39'/'#39' + CO' +
              'NVERT(VARCHAR(4), FACTURA.FECHA, 20) + '#39' '#39' + CONVERT(Char(8), FA' +
              'CTURA.FECHA, 108) AS FECHAHORA, Factura.Total,'#10'Factura.Impuesto,' +
              ' FacturaElectronica.Vigencia, FacturaElectronica.FacturaID From ' +
              'Factura'#10'INNER JOIN FacturaElectronica on FacturaElectronica.Fact' +
              'uraID = Factura.FacturaID'#10'INNER JOIN CONFIGURACION ON FACTURA.NU' +
              'MEROESTACION = CONFIGURACION.NUMEROESTACION'#10'INNER JOIN CLIENTE O' +
              'N CLIENTE.IDCLIENTE = FACTURA.CLIENTEID'#10'WHERE FACTURA.FECHA BETW' +
              'EEN :FECHAINI AND :FECHAFIN AND SERIE = :SERIE'#10'ORDER BY FOLIO'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'RFC'
                TableField = 'RFC'
              end
              item
                DatasetField = 'SERIE'
                TableField = 'SERIE'
              end
              item
                DatasetField = 'FOLIO'
                TableField = 'FOLIO'
              end
              item
                DatasetField = 'FECHANOAPROBACION'
                TableField = 'FECHANOAPROBACION'
              end
              item
                DatasetField = 'FECHAHORA'
                TableField = 'FECHAHORA'
              end
              item
                DatasetField = 'Total'
                TableField = 'Total'
              end
              item
                DatasetField = 'Impuesto'
                TableField = 'Impuesto'
              end
              item
                DatasetField = 'Vigencia'
                TableField = 'Vigencia'
              end
              item
                DatasetField = 'FacturaID'
                TableField = 'FacturaID'
              end>
          end>
        Name = 'spReporteSAT'
        Fields = <
          item
            Name = 'RFC'
            DataType = datString
            Size = 15
          end
          item
            Name = 'SERIE'
            DataType = datString
            Size = 5
          end
          item
            Name = 'FOLIO'
            DataType = datInteger
          end
          item
            Name = 'FECHANOAPROBACION'
            DataType = datString
            Size = 104
          end
          item
            Name = 'FECHAHORA'
            DataType = datString
            Size = 19
          end
          item
            Name = 'Total'
            DataType = datFloat
          end
          item
            Name = 'Impuesto'
            DataType = datFloat
          end
          item
            Name = 'Vigencia'
            DataType = datBoolean
          end
          item
            Name = 'FacturaID'
            DataType = datInteger
          end>
      end
      item
        Params = <
          item
            Name = 'IDMONEDA'
            Value = ''
          end
          item
            Name = 'NUMEROESTACION'
            Value = ''
          end
          item
            Name = 'FECHA'
            Value = '12/15/2011'
          end>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            SQL = 
              'SELECT TOP(1) * FROM VALORMONEDA'#10'WHERE IDMONEDA= :IDMONEDA AND N' +
              'UMEROESTACION = :NUMEROESTACION AND FECHA <= :FECHA'#10'ORDER BY FEC' +
              'HA DESC'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDVALORMONEDA'
                TableField = 'IDVALORMONEDA'
              end
              item
                DatasetField = 'IDMONEDA'
                TableField = 'IDMONEDA'
              end
              item
                DatasetField = 'VALOR'
                TableField = 'VALOR'
              end
              item
                DatasetField = 'NUMEROESTACION'
                TableField = 'NUMEROESTACION'
              end
              item
                DatasetField = 'FECHA'
                TableField = 'FECHA'
              end>
          end>
        Name = 'spTipoCambio'
        Fields = <
          item
            Name = 'IDVALORMONEDA'
            DataType = datInteger
          end
          item
            Name = 'IDMONEDA'
            DataType = datInteger
          end
          item
            Name = 'VALOR'
            DataType = datFloat
          end
          item
            Name = 'NUMEROESTACION'
            DataType = datInteger
          end
          item
            Name = 'FECHA'
            DataType = datDateTime
          end>
      end
      item
        Params = <
          item
            Name = 'IDPRODUCTO'
            Value = '1'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            SQL = 
              'declare @ProductoID as integer'#10#10'select @ProductoID = (select :ID' +
              'PRODUCTO)'#10#10'select Costo'#10#10'From Producto  P'#10'Where P.IDPRODUCTO = @' +
              'ProductoID'#10#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'Costo'
                TableField = 'Costo'
              end>
          end>
        Name = 'spCostoProducto'
        Fields = <
          item
            Name = 'Costo'
            DataType = datFloat
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            SQL = 
              'SELECT'#10'    NUMEROESTACION, EMPRESA, RFC,'#10'    CIUDAD, HOSTVOLUMET' +
              'RICO, CC,'#10'    IMPUESTOPORCENTAJE'#10'  FROM'#10'    dbo.Configuracion'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'NUMEROESTACION'
                TableField = 'NUMEROESTACION'
              end
              item
                DatasetField = 'EMPRESA'
                TableField = 'EMPRESA'
              end
              item
                DatasetField = 'RFC'
                TableField = 'RFC'
              end
              item
                DatasetField = 'CIUDAD'
                TableField = 'CIUDAD'
              end
              item
                DatasetField = 'HOSTVOLUMETRICO'
                TableField = 'HOSTVOLUMETRICO'
              end
              item
                DatasetField = 'CC'
                TableField = 'CC'
              end
              item
                DatasetField = 'IMPUESTOPORCENTAJE'
                TableField = 'IMPUESTOPORCENTAJE'
              end>
          end>
        Name = 'spEstacion'
        Fields = <
          item
            Name = 'NUMEROESTACION'
            DataType = datInteger
          end
          item
            Name = 'EMPRESA'
            DataType = datString
            Size = 50
          end
          item
            Name = 'RFC'
            DataType = datString
            Size = 50
          end
          item
            Name = 'CIUDAD'
            DataType = datString
            Size = 30
          end
          item
            Name = 'HOSTVOLUMETRICO'
            DataType = datString
            Size = 30
          end
          item
            Name = 'CC'
            DataType = datString
            Size = 20
          end
          item
            Name = 'IMPUESTOPORCENTAJE'
            DataType = datFloat
          end>
      end
      item
        Params = <
          item
            Name = 'IDDEPOSITO'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            SQL = 
              'SELECT SUM(IMPORTE) AS IMPORTE FROM DETALLEDEPOSITO'#10'WHERE IDDEPO' +
              'SITO = :IDDEPOSITO'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IMPORTE'
                TableField = 'IMPORTE'
              end>
          end>
        Name = 'spTotalDepositado'
        Fields = <
          item
            Name = 'IMPORTE'
            DataType = datFloat
          end>
      end
      item
        Params = <
          item
            Name = 'Nombre'
            Value = ''
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            SQL = 'select * from reporte'#10'where upper(nombre) = upper(:Nombre)'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'ReporteID'
                TableField = 'ReporteID'
              end
              item
                DatasetField = 'Nombre'
                TableField = 'Nombre'
              end
              item
                DatasetField = 'Tipo'
                TableField = 'Tipo'
              end
              item
                DatasetField = 'Parametros'
                TableField = 'Parametros'
              end
              item
                DatasetField = 'Template'
                TableField = 'Template'
              end
              item
                DatasetField = 'TemplateMedia'
                TableField = 'TemplateMedia'
              end
              item
                DatasetField = 'TemplateBaja'
                TableField = 'TemplateBaja'
              end
              item
                DatasetField = 'TemplateExportar'
                TableField = 'TemplateExportar'
              end
              item
                DatasetField = 'SQL1'
                TableField = 'SQL1'
              end
              item
                DatasetField = 'SQL2'
                TableField = 'SQL2'
              end
              item
                DatasetField = 'CampoJoin'
                TableField = 'CampoJoin'
              end
              item
                DatasetField = 'IdentificadorID'
                TableField = 'IdentificadorID'
              end
              item
                DatasetField = 'Usuarios'
                TableField = 'Usuarios'
              end>
          end>
        Name = 'ReportesWeb'
        Fields = <
          item
            Name = 'ReporteID'
            DataType = datInteger
          end
          item
            Name = 'Nombre'
            DataType = datString
            Size = 50
          end
          item
            Name = 'Tipo'
            DataType = datInteger
          end
          item
            Name = 'Parametros'
            DataType = datString
            Size = 10
          end
          item
            Name = 'Template'
            DataType = datMemo
          end
          item
            Name = 'TemplateMedia'
            DataType = datMemo
          end
          item
            Name = 'TemplateBaja'
            DataType = datMemo
          end
          item
            Name = 'TemplateExportar'
            DataType = datMemo
          end
          item
            Name = 'SQL1'
            DataType = datMemo
          end
          item
            Name = 'SQL2'
            DataType = datMemo
          end
          item
            Name = 'CampoJoin'
            DataType = datString
            Size = 30
          end
          item
            Name = 'IdentificadorID'
            DataType = datInteger
          end
          item
            Name = 'Usuarios'
            DataType = datString
            Size = 80
          end>
      end
      item
        Params = <
          item
            Name = 'ExportarID'
            Value = '1'
          end>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            SQL = 
              'SELECT Template, ScriptDatos, ScriptExporta, Parametros, Nombre'#10 +
              'FROM'#10'dbo.Exportar WHERE EXPORTARID = :ExportarID'#10#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'Template'
                TableField = 'Template'
              end
              item
                DatasetField = 'ScriptDatos'
                TableField = 'ScriptDatos'
              end
              item
                DatasetField = 'ScriptExporta'
                TableField = 'ScriptExporta'
              end
              item
                DatasetField = 'Parametros'
                TableField = 'Parametros'
              end
              item
                DatasetField = 'Nombre'
                TableField = 'Nombre'
              end>
          end>
        Name = 'spExporta'
        Fields = <
          item
            Name = 'Template'
            DataType = datMemo
          end
          item
            Name = 'ScriptDatos'
            DataType = datMemo
          end
          item
            Name = 'ScriptExporta'
            DataType = datMemo
          end
          item
            Name = 'Parametros'
            DataType = datString
            Size = 50
          end
          item
            Name = 'Nombre'
            DataType = datString
            Size = 50
          end>
      end
      item
        Params = <
          item
            Name = 'ExportarID'
            Value = '1'
          end>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            SQL = 
              'SELECT'#10'    Nombre, Size, Formato, Tipo'#10'  FROM'#10'    dbo.Campo'#10'  WH' +
              'ERE'#10'    ExportarID = :ExportarID'#10'  ORDER BY'#10'    Orden'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'Nombre'
                TableField = 'Nombre'
              end
              item
                DatasetField = 'Size'
                TableField = 'Size'
              end
              item
                DatasetField = 'Formato'
                TableField = 'Formato'
              end
              item
                DatasetField = 'Tipo'
                TableField = 'Tipo'
              end>
          end>
        Name = 'spCampos'
        Fields = <
          item
            Name = 'Nombre'
            DataType = datString
            Size = 50
          end
          item
            Name = 'Size'
            DataType = datInteger
          end
          item
            Name = 'Formato'
            DataType = datString
            Size = 50
          end
          item
            Name = 'Tipo'
            DataType = datInteger
          end>
      end
      item
        Params = <
          item
            Name = 'ServidorID'
            Value = '1'
          end>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            SQL = 
              'SELECT     ServidorID, ISNULL(IDEMPRESA, 0) AS EstacionID, HostS' +
              'ervidor, HostEstacion'#10'FROM         (SELECT     Servidor.Servidor' +
              'ID, Empresa.IDEMPRESA, Servidor.Host AS HostServidor, Empresa.Ho' +
              'st AS HostEstacion'#10'                       FROM          Servidor' +
              ' LEFT OUTER JOIN'#10'                                              E' +
              'mpresa ON Servidor.ServidorID = Empresa.ServidorID) AS A'#10'WHERE  ' +
              '   (ServidorID = :ServidorID)'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'ServidorID'
                TableField = 'ServidorID'
              end
              item
                DatasetField = 'EstacionID'
                TableField = 'EstacionID'
              end
              item
                DatasetField = 'HostServidor'
                TableField = 'HostServidor'
              end
              item
                DatasetField = 'HostEstacion'
                TableField = 'HostEstacion'
              end>
          end>
        Name = 'spServers'
        Fields = <
          item
            Name = 'ServidorID'
            DataType = datInteger
          end
          item
            Name = 'EstacionID'
            DataType = datInteger
          end
          item
            Name = 'HostServidor'
            DataType = datString
            Size = 70
          end
          item
            Name = 'HostEstacion'
            DataType = datString
            Size = 30
          end>
      end
      item
        Params = <
          item
            Name = 'ExportarID'
            Value = '1'
          end>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            SQL = 
              'SELECT'#10'    ServidorID, SQL'#10'  FROM'#10'    dbo.Paso'#10'  WHERE'#10'    Expor' +
              'tarID = :ExportarID'#10'  ORDER BY'#10'    Orden'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'ServidorID'
                TableField = 'ServidorID'
              end
              item
                DatasetField = 'SQL'
                TableField = 'SQL'
              end>
          end>
        Name = 'spPasos'
        Fields = <
          item
            Name = 'ServidorID'
            DataType = datInteger
          end
          item
            Name = 'SQL'
            DataType = datMemo
          end>
      end
      item
        Params = <
          item
            Name = 'Cliente'
            Value = '1'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            SQL = 
              'Select IDCLIENTE, Nombre, STATUS, CCA From dbo.Cliente'#10'Where(IDC' +
              'LIENTE = :Cliente)'#10'order by Nombre'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDCLIENTE'
                TableField = 'IDCLIENTE'
              end
              item
                DatasetField = 'Nombre'
                TableField = 'Nombre'
              end
              item
                DatasetField = 'STATUS'
                TableField = 'STATUS'
              end
              item
                DatasetField = 'CCA'
                TableField = 'CCA'
              end>
          end>
        Name = 'BuscaCliente'
        Fields = <
          item
            Name = 'IDCLIENTE'
            DataType = datInteger
          end
          item
            Name = 'Nombre'
            DataType = datString
            Size = 80
          end
          item
            Name = 'STATUS'
            DataType = datInteger
          end
          item
            Name = 'CCA'
            DataType = datString
            Size = 20
          end>
      end
      item
        Params = <
          item
            Name = 'Nombre'
            Value = 's'
          end>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            SQL = 
              'SELECT'#10'    SQL1, SQL2, Template, CampoJoin'#10'  FROM'#10'    Reporte'#10'  ' +
              'WHERE'#10'    Nombre = :Nombre'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'SQL1'
                TableField = 'SQL1'
              end
              item
                DatasetField = 'SQL2'
                TableField = 'SQL2'
              end
              item
                DatasetField = 'Template'
                TableField = 'Template'
              end
              item
                DatasetField = 'CampoJoin'
                TableField = 'CampoJoin'
              end>
          end>
        Name = 'BuscarReporte'
        Fields = <
          item
            Name = 'SQL1'
            DataType = datMemo
          end
          item
            Name = 'SQL2'
            DataType = datMemo
          end
          item
            Name = 'Template'
            DataType = datMemo
          end
          item
            Name = 'CampoJoin'
            DataType = datString
            Size = 30
          end>
      end
      item
        Params = <
          item
            Name = 'FechaServidor'
            Value = '01/02/2010'
            ParamType = daptInput
          end
          item
            Name = 'FechaFactura'
            Value = '01/01/2010'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            SQL = 
              'declare @FechaServer as Datetime'#10'Declare @FechaFactura as DateTi' +
              'me'#10'Select @FechaServer=(select :FechaServidor)'#10'Select @FechaFact' +
              'ura=(Select :FechaFactura)'#10#10'Select DateDiff(day,@FechaFactura,@F' +
              'echaServer)as Diferencia'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'Diferencia'
                TableField = 'Diferencia'
              end>
          end>
        Name = 'ComparaFechas'
        Fields = <
          item
            Name = 'Diferencia'
            DataType = datInteger
          end>
      end
      item
        Params = <
          item
            Name = 'IDALUMNO'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            SQL = 
              'SELECT'#10'    IDALUMNO,NUMCONTROL,NOMBRE,CURP,DIRECCION,EMAIL,IDSTA' +
              'TUS'#10'  FROM'#10'    dbo.ALUMNO'#10'  WHERE'#10'    IDALUMNO = :IDALUMNO'#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'DatosAlumno'
        Fields = <>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            TargetTable = 'dbo.Acceso'
            SQL = 
              'SELECT '#10'    UsuarioID, OpcionID'#10'  FROM'#10'    dbo.Acceso'#10'  WHERE {W' +
              'here}'
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'UsuarioID'
                TableField = 'UsuarioID'
              end
              item
                DatasetField = 'OpcionID'
                TableField = 'OpcionID'
              end>
          end>
        Name = 'dbo Acceso'
        Fields = <
          item
            Name = 'UsuarioID'
            DataType = datInteger
            Required = True
          end
          item
            Name = 'OpcionID'
            DataType = datInteger
            Required = True
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            TargetTable = 'dbo.USUARIO'
            SQL = 
              'SELECT '#10'    IDEMPLEADO, CODIGO, NOMBRE, USERNAME, USERPASSWORD'#10' ' +
              ' FROM'#10'    dbo.USUARIO'#10'  WHERE {Where}'
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDEMPLEADO'
                TableField = 'IDEMPLEADO'
              end
              item
                DatasetField = 'CODIGO'
                TableField = 'CODIGO'
              end
              item
                DatasetField = 'NOMBRE'
                TableField = 'NOMBRE'
              end
              item
                DatasetField = 'USERNAME'
                TableField = 'USERNAME'
              end
              item
                DatasetField = 'USERPASSWORD'
                TableField = 'USERPASSWORD'
              end>
          end>
        Name = 'dbo USUARIO'
        Fields = <
          item
            Name = 'IDEMPLEADO'
            DataType = datInteger
            Required = True
            InPrimaryKey = True
          end
          item
            Name = 'CODIGO'
            DataType = datString
            Size = 10
            Required = True
          end
          item
            Name = 'NOMBRE'
            DataType = datString
            Size = 70
          end
          item
            Name = 'USERNAME'
            DataType = datString
            Size = 10
            Required = True
          end
          item
            Name = 'USERPASSWORD'
            DataType = datString
            Size = 10
            Required = True
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            TargetTable = 'dbo.BANCO'
            SQL = 
              'SELECT '#10'    IDBANCO, CODIGO, NOMBRE, CUENTA, FORMATO, IDEMPLEADO' +
              #10'  FROM'#10'    dbo.BANCO'#10'  WHERE {Where}'
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDBANCO'
                TableField = 'IDBANCO'
              end
              item
                DatasetField = 'CODIGO'
                TableField = 'CODIGO'
              end
              item
                DatasetField = 'NOMBRE'
                TableField = 'NOMBRE'
              end
              item
                DatasetField = 'CUENTA'
                TableField = 'CUENTA'
              end
              item
                DatasetField = 'FORMATO'
                TableField = 'FORMATO'
              end
              item
                DatasetField = 'IDEMPLEADO'
                TableField = 'IDEMPLEADO'
              end>
          end>
        Name = 'dbo BANCO'
        Fields = <
          item
            Name = 'IDBANCO'
            DataType = datInteger
          end
          item
            Name = 'CODIGO'
            DataType = datString
            Size = 10
          end
          item
            Name = 'NOMBRE'
            DataType = datString
            Size = 50
          end
          item
            Name = 'CUENTA'
            DataType = datString
            Size = 25
          end
          item
            Name = 'FORMATO'
            DataType = datMemo
          end
          item
            Name = 'IDEMPLEADO'
            DataType = datInteger
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            TargetTable = 'dbo.Reporte'
            SQL = 
              'SELECT'#10'    ReporteID, Nombre, Tipo, Parametros, Template, Templa' +
              'teMedia,'#10'    TemplateBaja, TemplateExportar, SQL1, SQL2, CampoJo' +
              'in,'#10'    IdentificadorID, Usuarios'#10'  FROM'#10'    dbo.Reporte'#10'  WHERE' +
              ' {Where}'#10'  ORDER BY ReporteID'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'ReporteID'
                TableField = 'ReporteID'
              end
              item
                DatasetField = 'Nombre'
                TableField = 'Nombre'
              end
              item
                DatasetField = 'Tipo'
                TableField = 'Tipo'
              end
              item
                DatasetField = 'Parametros'
                TableField = 'Parametros'
              end
              item
                DatasetField = 'Template'
                TableField = 'Template'
              end
              item
                DatasetField = 'TemplateMedia'
                TableField = 'TemplateMedia'
              end
              item
                DatasetField = 'TemplateBaja'
                TableField = 'TemplateBaja'
              end
              item
                DatasetField = 'TemplateExportar'
                TableField = 'TemplateExportar'
              end
              item
                DatasetField = 'SQL1'
                TableField = 'SQL1'
              end
              item
                DatasetField = 'SQL2'
                TableField = 'SQL2'
              end
              item
                DatasetField = 'CampoJoin'
                TableField = 'CampoJoin'
              end
              item
                DatasetField = 'IdentificadorID'
                TableField = 'IdentificadorID'
              end
              item
                DatasetField = 'Usuarios'
                TableField = 'Usuarios'
              end>
          end>
        Name = 'dbo Reporte'
        Fields = <
          item
            Name = 'ReporteID'
            DataType = datInteger
            Required = True
            InPrimaryKey = True
          end
          item
            Name = 'Nombre'
            DataType = datString
            Size = 50
            Required = True
          end
          item
            Name = 'Tipo'
            DataType = datInteger
            Required = True
          end
          item
            Name = 'Parametros'
            DataType = datString
            Size = 10
            Required = True
          end
          item
            Name = 'Template'
            DataType = datMemo
          end
          item
            Name = 'TemplateMedia'
            DataType = datMemo
          end
          item
            Name = 'TemplateBaja'
            DataType = datMemo
          end
          item
            Name = 'TemplateExportar'
            DataType = datMemo
          end
          item
            Name = 'SQL1'
            DataType = datMemo
          end
          item
            Name = 'SQL2'
            DataType = datMemo
          end
          item
            Name = 'CampoJoin'
            DataType = datString
            Size = 30
          end
          item
            Name = 'IdentificadorID'
            DataType = datInteger
          end
          item
            Name = 'Usuarios'
            DataType = datString
            Size = 80
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            TargetTable = 'dbo.Factura'
            SQL = 
              'SELECT '#10'    FacturaID, Folio, Serie, Ejercicio, Periodo, Dia, Fe' +
              'cha, '#10'    Subtotal, Impuesto, Total, ImpuestoPorcentaje, Cancela' +
              'da, '#10'    ClienteID, FormaPagoID, UsuarioID, TipoFacturaID, METOD' +
              'OPAGO,'#10'    IDCONDICIONPAGO'#10'  FROM'#10'    dbo.Factura'#10'  WHERE 2 = 1'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'FacturaID'
                TableField = 'FacturaID'
              end
              item
                DatasetField = 'Folio'
                TableField = 'Folio'
              end
              item
                DatasetField = 'Serie'
                TableField = 'Serie'
              end
              item
                DatasetField = 'Ejercicio'
                TableField = 'Ejercicio'
              end
              item
                DatasetField = 'Periodo'
                TableField = 'Periodo'
              end
              item
                DatasetField = 'Dia'
                TableField = 'Dia'
              end
              item
                DatasetField = 'Fecha'
                TableField = 'Fecha'
              end
              item
                DatasetField = 'Subtotal'
                TableField = 'Subtotal'
              end
              item
                DatasetField = 'Impuesto'
                TableField = 'Impuesto'
              end
              item
                DatasetField = 'Total'
                TableField = 'Total'
              end
              item
                DatasetField = 'ImpuestoPorcentaje'
                TableField = 'ImpuestoPorcentaje'
              end
              item
                DatasetField = 'Cancelada'
                TableField = 'Cancelada'
              end
              item
                DatasetField = 'ClienteID'
                TableField = 'ClienteID'
              end
              item
                DatasetField = 'FormaPagoID'
                TableField = 'FormaPagoID'
              end
              item
                DatasetField = 'UsuarioID'
                TableField = 'UsuarioID'
              end
              item
                DatasetField = 'TipoFacturaID'
                TableField = 'TipoFacturaID'
              end
              item
                DatasetField = 'METODOPAGO'
                TableField = 'METODOPAGO'
              end
              item
                DatasetField = 'IDCONDICIONPAGO'
                TableField = 'IDCONDICIONPAGO'
              end>
          end>
        Name = 'dbo Factura'
        Fields = <
          item
            Name = 'FacturaID'
            DataType = datInteger
          end
          item
            Name = 'Folio'
            DataType = datInteger
          end
          item
            Name = 'Serie'
            DataType = datString
            Size = 5
          end
          item
            Name = 'Ejercicio'
            DataType = datInteger
          end
          item
            Name = 'Periodo'
            DataType = datInteger
          end
          item
            Name = 'Dia'
            DataType = datInteger
          end
          item
            Name = 'Fecha'
            DataType = datDateTime
          end
          item
            Name = 'Subtotal'
            DataType = datFloat
          end
          item
            Name = 'Impuesto'
            DataType = datFloat
          end
          item
            Name = 'Total'
            DataType = datFloat
          end
          item
            Name = 'ImpuestoPorcentaje'
            DataType = datFloat
          end
          item
            Name = 'Cancelada'
            DataType = datBoolean
          end
          item
            Name = 'ClienteID'
            DataType = datInteger
          end
          item
            Name = 'FormaPagoID'
            DataType = datInteger
          end
          item
            Name = 'UsuarioID'
            DataType = datInteger
          end
          item
            Name = 'TipoFacturaID'
            DataType = datInteger
          end
          item
            Name = 'METODOPAGO'
            DataType = datString
            Size = 50
          end
          item
            Name = 'IDCONDICIONPAGO'
            DataType = datInteger
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            TargetTable = 'dbo.DetalleFactura'
            SQL = 
              'SELECT '#10'    DetalleFacturaID, Cantidad, Precio, ItemNo, FacturaI' +
              'D, '#10'    ProductoID, Importe'#10'  FROM'#10'    dbo.DetalleFactura'#10'  WHER' +
              'E {Where}'
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'DetalleFacturaID'
                TableField = 'DetalleFacturaID'
              end
              item
                DatasetField = 'Cantidad'
                TableField = 'Cantidad'
              end
              item
                DatasetField = 'Precio'
                TableField = 'Precio'
              end
              item
                DatasetField = 'ItemNo'
                TableField = 'ItemNo'
              end
              item
                DatasetField = 'FacturaID'
                TableField = 'FacturaID'
              end
              item
                DatasetField = 'ProductoID'
                TableField = 'ProductoID'
              end
              item
                DatasetField = 'Importe'
                TableField = 'Importe'
              end>
          end>
        Name = 'dbo DetalleFactura'
        Fields = <
          item
            Name = 'DetalleFacturaID'
            DataType = datInteger
            Required = True
          end
          item
            Name = 'Cantidad'
            DataType = datFloat
            Required = True
          end
          item
            Name = 'Precio'
            DataType = datFloat
            Required = True
          end
          item
            Name = 'ItemNo'
            DataType = datInteger
            Required = True
          end
          item
            Name = 'FacturaID'
            DataType = datInteger
            Required = True
          end
          item
            Name = 'ProductoID'
            DataType = datInteger
          end
          item
            Name = 'Importe'
            DataType = datFloat
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            TargetTable = 'dbo.FormaPago'
            SQL = 
              'SELECT '#10'    FormaPagoID, Descripcion'#10'  FROM'#10'    dbo.FormaPago'#10'  ' +
              'WHERE {Where}'
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'FormaPagoID'
                TableField = 'FormaPagoID'
              end
              item
                DatasetField = 'Descripcion'
                TableField = 'Descripcion'
              end>
          end>
        Name = 'dbo FormaPago'
        Fields = <
          item
            Name = 'FormaPagoID'
            DataType = datInteger
            Required = True
          end
          item
            Name = 'Descripcion'
            DataType = datString
            Size = 50
            Required = True
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            TargetTable = 'dbo.CONFIGURACION'
            SQL = 
              'SELECT '#9#10#9'"TIPOCAMBIO", "FORMATOCONTROL", "ESCUELA", '#10#9'"MNIMACAL' +
              '", "MAXIMACAL", "LOGO", '#10#9'"CICLOACTUAL", "DIRECCION", "TELEFONO"' +
              ', '#10#9'"IMAGEN1", "IMAGEN2", "FAX", '#10#9'"DIRECTOR", "MINUTOSXHORA", "' +
              'EMPRESAS", '#10#9'"CALIFICACION1", "CALIFICACION2", "CUENTABANCO1", '#10 +
              #9'"BOLETAS", "FECHABOLETAOFICIAL", "NoExterior", '#10#9'"Localidad", "' +
              'Municipio", "Estado", '#10#9'"Pais", "noAprobacion", "Colonia", '#10#9'"Co' +
              'digoPostal", "NoCertificado", "ArchivoClavePrivada", '#10#9'"ArchivoC' +
              'ertificado", "ClavePriv", "Certificado", '#10#9'"PasswordFCTElect", "' +
              'EstacionID", "Sucursal", '#10#9'"SucursalDE", "Telefono1", "Telefono2' +
              '", '#10#9'"AnoAprobacion", "FolioInicial", "FolioFinal", '#10#9'"ImpuestoP' +
              'orcentaje", "RFC", "CALIFICACION3", '#10#9'"SITIOTIMBREFISCAL", "USUA' +
              'RIOTIMBREFISCAL", "PASSWORDTIMBREFISCAL", '#10#9'"NUMEROESTACION", "S' +
              'erieFacturaDebito", "SerieFacturaCredito", '#10#9'"ReporteFacturaCred' +
              'itoDebito", "NOMBRECOMERCIAL", "TIPOINGRESO" '#10'FROM '#10#9'"dbo"."CONF' +
              'IGURACION" '#10'WHERE '#10#9'{WHERE} '
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'TIPOCAMBIO'
                TableField = 'TIPOCAMBIO'
              end
              item
                DatasetField = 'FORMATOCONTROL'
                TableField = 'FORMATOCONTROL'
              end
              item
                DatasetField = 'ESCUELA'
                TableField = 'ESCUELA'
              end
              item
                DatasetField = 'MNIMACAL'
                TableField = 'MNIMACAL'
              end
              item
                DatasetField = 'MAXIMACAL'
                TableField = 'MAXIMACAL'
              end
              item
                DatasetField = 'LOGO'
                TableField = 'LOGO'
              end
              item
                DatasetField = 'CICLOACTUAL'
                TableField = 'CICLOACTUAL'
              end
              item
                DatasetField = 'DIRECCION'
                TableField = 'DIRECCION'
              end
              item
                DatasetField = 'TELEFONO'
                TableField = 'TELEFONO'
              end
              item
                DatasetField = 'IMAGEN1'
                TableField = 'IMAGEN1'
              end
              item
                DatasetField = 'IMAGEN2'
                TableField = 'IMAGEN2'
              end
              item
                DatasetField = 'FAX'
                TableField = 'FAX'
              end
              item
                DatasetField = 'DIRECTOR'
                TableField = 'DIRECTOR'
              end
              item
                DatasetField = 'MINUTOSXHORA'
                TableField = 'MINUTOSXHORA'
              end
              item
                DatasetField = 'EMPRESAS'
                TableField = 'EMPRESAS'
              end
              item
                DatasetField = 'CALIFICACION1'
                TableField = 'CALIFICACION1'
              end
              item
                DatasetField = 'CALIFICACION2'
                TableField = 'CALIFICACION2'
              end
              item
                DatasetField = 'CUENTABANCO1'
                TableField = 'CUENTABANCO1'
              end
              item
                DatasetField = 'BOLETAS'
                TableField = 'BOLETAS'
              end
              item
                DatasetField = 'FECHABOLETAOFICIAL'
                TableField = 'FECHABOLETAOFICIAL'
              end
              item
                DatasetField = 'NoExterior'
                TableField = 'NoExterior'
              end
              item
                DatasetField = 'Localidad'
                TableField = 'Localidad'
              end
              item
                DatasetField = 'Municipio'
                TableField = 'Municipio'
              end
              item
                DatasetField = 'Estado'
                TableField = 'Estado'
              end
              item
                DatasetField = 'Pais'
                TableField = 'Pais'
              end
              item
                DatasetField = 'noAprobacion'
                TableField = 'noAprobacion'
              end
              item
                DatasetField = 'Colonia'
                TableField = 'Colonia'
              end
              item
                DatasetField = 'CodigoPostal'
                TableField = 'CodigoPostal'
              end
              item
                DatasetField = 'NoCertificado'
                TableField = 'NoCertificado'
              end
              item
                DatasetField = 'ArchivoClavePrivada'
                TableField = 'ArchivoClavePrivada'
              end
              item
                DatasetField = 'ArchivoCertificado'
                TableField = 'ArchivoCertificado'
              end
              item
                DatasetField = 'ClavePriv'
                TableField = 'ClavePriv'
              end
              item
                DatasetField = 'Certificado'
                TableField = 'Certificado'
              end
              item
                DatasetField = 'PasswordFCTElect'
                TableField = 'PasswordFCTElect'
              end
              item
                DatasetField = 'EstacionID'
                TableField = 'EstacionID'
              end
              item
                DatasetField = 'Sucursal'
                TableField = 'Sucursal'
              end
              item
                DatasetField = 'SucursalDE'
                TableField = 'SucursalDE'
              end
              item
                DatasetField = 'Telefono1'
                TableField = 'Telefono1'
              end
              item
                DatasetField = 'Telefono2'
                TableField = 'Telefono2'
              end
              item
                DatasetField = 'AnoAprobacion'
                TableField = 'AnoAprobacion'
              end
              item
                DatasetField = 'FolioInicial'
                TableField = 'FolioInicial'
              end
              item
                DatasetField = 'FolioFinal'
                TableField = 'FolioFinal'
              end
              item
                DatasetField = 'ImpuestoPorcentaje'
                TableField = 'ImpuestoPorcentaje'
              end
              item
                DatasetField = 'RFC'
                TableField = 'RFC'
              end
              item
                DatasetField = 'CALIFICACION3'
                TableField = 'CALIFICACION3'
              end
              item
                DatasetField = 'SITIOTIMBREFISCAL'
                TableField = 'SITIOTIMBREFISCAL'
              end
              item
                DatasetField = 'USUARIOTIMBREFISCAL'
                TableField = 'USUARIOTIMBREFISCAL'
              end
              item
                DatasetField = 'PASSWORDTIMBREFISCAL'
                TableField = 'PASSWORDTIMBREFISCAL'
              end
              item
                DatasetField = 'NUMEROESTACION'
                TableField = 'NUMEROESTACION'
              end
              item
                DatasetField = 'SerieFacturaDebito'
                TableField = 'SerieFacturaDebito'
              end
              item
                DatasetField = 'SerieFacturaCredito'
                TableField = 'SerieFacturaCredito'
              end
              item
                DatasetField = 'ReporteFacturaCreditoDebito'
                TableField = 'ReporteFacturaCreditoDebito'
              end
              item
                DatasetField = 'NOMBRECOMERCIAL'
                TableField = 'NOMBRECOMERCIAL'
              end
              item
                DatasetField = 'TIPOINGRESO'
                TableField = 'TIPOINGRESO'
              end>
          end>
        Name = 'dbo CONFIGURACION'
        Fields = <
          item
            Name = 'TIPOCAMBIO'
            DataType = datFloat
          end
          item
            Name = 'FORMATOCONTROL'
            DataType = datMemo
          end
          item
            Name = 'ESCUELA'
            DataType = datString
            Size = 50
          end
          item
            Name = 'MNIMACAL'
            DataType = datFloat
          end
          item
            Name = 'MAXIMACAL'
            DataType = datFloat
          end
          item
            Name = 'LOGO'
            DataType = datMemo
          end
          item
            Name = 'CICLOACTUAL'
            DataType = datInteger
          end
          item
            Name = 'DIRECCION'
            DataType = datString
            Size = 70
          end
          item
            Name = 'TELEFONO'
            DataType = datString
            Size = 20
          end
          item
            Name = 'IMAGEN1'
            DataType = datMemo
          end
          item
            Name = 'IMAGEN2'
            DataType = datMemo
          end
          item
            Name = 'FAX'
            DataType = datString
            Size = 20
          end
          item
            Name = 'DIRECTOR'
            DataType = datString
            Size = 70
          end
          item
            Name = 'MINUTOSXHORA'
            DataType = datInteger
          end
          item
            Name = 'EMPRESAS'
            DataType = datString
            Size = 10
          end
          item
            Name = 'CALIFICACION1'
            DataType = datString
            Size = 30
          end
          item
            Name = 'CALIFICACION2'
            DataType = datString
            Size = 30
          end
          item
            Name = 'CUENTABANCO1'
            DataType = datString
            Size = 25
          end
          item
            Name = 'BOLETAS'
            DataType = datString
            Size = 150
          end
          item
            Name = 'FECHABOLETAOFICIAL'
            DataType = datDateTime
          end
          item
            Name = 'NoExterior'
            DataType = datString
            Size = 20
          end
          item
            Name = 'Localidad'
            DataType = datString
            Size = 50
          end
          item
            Name = 'Municipio'
            DataType = datString
            Size = 50
          end
          item
            Name = 'Estado'
            DataType = datString
            Size = 50
          end
          item
            Name = 'Pais'
            DataType = datString
            Size = 50
          end
          item
            Name = 'noAprobacion'
            DataType = datInteger
          end
          item
            Name = 'Colonia'
            DataType = datString
            Size = 50
          end
          item
            Name = 'CodigoPostal'
            DataType = datString
            Size = 50
          end
          item
            Name = 'NoCertificado'
            DataType = datString
            Size = 50
          end
          item
            Name = 'ArchivoClavePrivada'
            DataType = datString
            Size = 200
          end
          item
            Name = 'ArchivoCertificado'
            DataType = datString
            Size = 200
          end
          item
            Name = 'ClavePriv'
            DataType = datString
            Size = 200
          end
          item
            Name = 'Certificado'
            DataType = datString
            Size = 4000
          end
          item
            Name = 'PasswordFCTElect'
            DataType = datString
            Size = 200
          end
          item
            Name = 'EstacionID'
            DataType = datInteger
          end
          item
            Name = 'Sucursal'
            DataType = datBoolean
          end
          item
            Name = 'SucursalDE'
            DataType = datInteger
          end
          item
            Name = 'Telefono1'
            DataType = datString
            Size = 50
          end
          item
            Name = 'Telefono2'
            DataType = datString
            Size = 50
          end
          item
            Name = 'AnoAprobacion'
            DataType = datDateTime
          end
          item
            Name = 'FolioInicial'
            DataType = datInteger
          end
          item
            Name = 'FolioFinal'
            DataType = datInteger
          end
          item
            Name = 'ImpuestoPorcentaje'
            DataType = datFloat
          end
          item
            Name = 'RFC'
            DataType = datString
            Size = 50
          end
          item
            Name = 'CALIFICACION3'
            DataType = datString
            Size = 30
          end
          item
            Name = 'SITIOTIMBREFISCAL'
            DataType = datString
            Size = 200
          end
          item
            Name = 'USUARIOTIMBREFISCAL'
            DataType = datString
            Size = 150
          end
          item
            Name = 'PASSWORDTIMBREFISCAL'
            DataType = datString
            Size = 150
          end
          item
            Name = 'NUMEROESTACION'
            DataType = datInteger
          end
          item
            Name = 'SerieFacturaDebito'
            DataType = datString
            Size = 100
          end
          item
            Name = 'SerieFacturaCredito'
            DataType = datString
            Size = 100
          end
          item
            Name = 'ReporteFacturaCreditoDebito'
            DataType = datString
            Size = 100
          end
          item
            Name = 'NOMBRECOMERCIAL'
            DataType = datString
            Size = 100
          end
          item
            Name = 'TIPOINGRESO'
            DataType = datString
            Size = 50
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            TargetTable = 'dbo.PRODUCTO'
            SQL = 
              'SELECT '#10'    IDPRODUCTO, CODIGOPRODUCTO, NOMBRE, PRECIOVENTA, CLA' +
              'VEPEMEX, '#10'    COSTO, STATUS, CCCOMPRA, CCIVA, IEPS, PUNTOS, IDLI' +
              'NEA, IDUNIDADMEDIDA'#10'  FROM'#10'    dbo.PRODUCTO'#10'  WHERE {Where}'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDPRODUCTO'
                TableField = 'IDPRODUCTO'
              end
              item
                DatasetField = 'CODIGOPRODUCTO'
                TableField = 'CODIGOPRODUCTO'
              end
              item
                DatasetField = 'NOMBRE'
                TableField = 'NOMBRE'
              end
              item
                DatasetField = 'PRECIOVENTA'
                TableField = 'PRECIOVENTA'
              end
              item
                DatasetField = 'CLAVEPEMEX'
                TableField = 'CLAVEPEMEX'
              end
              item
                DatasetField = 'COSTO'
                TableField = 'COSTO'
              end
              item
                DatasetField = 'STATUS'
                TableField = 'STATUS'
              end
              item
                DatasetField = 'CCCOMPRA'
                TableField = 'CCCOMPRA'
              end
              item
                DatasetField = 'CCIVA'
                TableField = 'CCIVA'
              end
              item
                DatasetField = 'IEPS'
                TableField = 'IEPS'
              end
              item
                DatasetField = 'PUNTOS'
                TableField = 'PUNTOS'
              end
              item
                DatasetField = 'IDLINEA'
                TableField = 'IDLINEA'
              end
              item
                DatasetField = 'IDUNIDADMEDIDA'
                TableField = 'IDUNIDADMEDIDA'
              end>
          end>
        Name = 'dbo PRODUCTO'
        Fields = <
          item
            Name = 'IDPRODUCTO'
            DataType = datInteger
            Required = True
          end
          item
            Name = 'CODIGOPRODUCTO'
            DataType = datString
            Size = 10
            Required = True
          end
          item
            Name = 'NOMBRE'
            DataType = datString
            Size = 150
          end
          item
            Name = 'PRECIOVENTA'
            DataType = datFloat
            Required = True
          end
          item
            Name = 'CLAVEPEMEX'
            DataType = datString
            Size = 50
          end
          item
            Name = 'COSTO'
            DataType = datFloat
          end
          item
            Name = 'STATUS'
            DataType = datBoolean
          end
          item
            Name = 'CCCOMPRA'
            DataType = datString
            Size = 20
          end
          item
            Name = 'CCIVA'
            DataType = datString
            Size = 20
          end
          item
            Name = 'IEPS'
            DataType = datFloat
          end
          item
            Name = 'PUNTOS'
            DataType = datInteger
          end
          item
            Name = 'IDLINEA'
            DataType = datInteger
          end
          item
            Name = 'IDUNIDADMEDIDA'
            DataType = datInteger
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            TargetTable = 'dbo.HORARIO'
            SQL = 
              'SELECT '#10'    IDHORARIO, HORAINICIO, HORAFINAL, DESCRIPCION'#10'  FROM' +
              #10'    dbo.HORARIO'#10'  WHERE {Where}'
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDHORARIO'
                TableField = 'IDHORARIO'
              end
              item
                DatasetField = 'HORAINICIO'
                TableField = 'HORAINICIO'
              end
              item
                DatasetField = 'HORAFINAL'
                TableField = 'HORAFINAL'
              end
              item
                DatasetField = 'DESCRIPCION'
                TableField = 'DESCRIPCION'
              end>
          end>
        Name = 'dbo HORARIO'
        Fields = <
          item
            Name = 'IDHORARIO'
            DataType = datInteger
            Required = True
            InPrimaryKey = True
          end
          item
            Name = 'HORAINICIO'
            DataType = datDateTime
          end
          item
            Name = 'HORAFINAL'
            DataType = datDateTime
          end
          item
            Name = 'DESCRIPCION'
            DataType = datString
            Size = 50
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            TargetTable = 'dbo.EMPLEADO'
            SQL = 
              'SELECT '#10'    IDEMPLEADO, NOMBRE, CODIGOEMPLEADO, DOMICILIO, CIUDA' +
              'D, '#10'    TELEFONO, STATUS, CUENTACONTABLE, FECHAALTA, FECHABAJA,'#10 +
              '    IMSS'#10'  FROM'#10'    dbo.EMPLEADO'#10'  WHERE {Where}'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDEMPLEADO'
                TableField = 'IDEMPLEADO'
              end
              item
                DatasetField = 'NOMBRE'
                TableField = 'NOMBRE'
              end
              item
                DatasetField = 'CODIGOEMPLEADO'
                TableField = 'CODIGOEMPLEADO'
              end
              item
                DatasetField = 'DOMICILIO'
                TableField = 'DOMICILIO'
              end
              item
                DatasetField = 'CIUDAD'
                TableField = 'CIUDAD'
              end
              item
                DatasetField = 'TELEFONO'
                TableField = 'TELEFONO'
              end
              item
                DatasetField = 'STATUS'
                TableField = 'STATUS'
              end
              item
                DatasetField = 'CUENTACONTABLE'
                TableField = 'CUENTACONTABLE'
              end
              item
                DatasetField = 'FECHAALTA'
                TableField = 'FECHAALTA'
              end
              item
                DatasetField = 'FECHABAJA'
                TableField = 'FECHABAJA'
              end
              item
                DatasetField = 'IMSS'
                TableField = 'IMSS'
              end>
          end>
        Name = 'dbo EMPLEADO'
        Fields = <
          item
            Name = 'IDEMPLEADO'
            DataType = datInteger
          end
          item
            Name = 'NOMBRE'
            DataType = datString
            Size = 50
          end
          item
            Name = 'CODIGOEMPLEADO'
            DataType = datString
            Size = 10
          end
          item
            Name = 'DOMICILIO'
            DataType = datString
            Size = 80
          end
          item
            Name = 'CIUDAD'
            DataType = datString
            Size = 30
          end
          item
            Name = 'TELEFONO'
            DataType = datString
            Size = 20
          end
          item
            Name = 'STATUS'
            DataType = datInteger
          end
          item
            Name = 'CUENTACONTABLE'
            DataType = datString
            Size = 20
          end
          item
            Name = 'FECHAALTA'
            DataType = datDateTime
          end
          item
            Name = 'FECHABAJA'
            DataType = datDateTime
          end
          item
            Name = 'IMSS'
            DataType = datString
            Size = 50
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            TargetTable = 'dbo.PROVEEDOR'
            SQL = 
              'SELECT '#10'    IDPROVEEDOR, NOMBRE, CALLE, COLONIA, CIUDAD, RFC, TE' +
              'LEFONO, '#10'    CODIGOPOSTAL, EMAIL, CCCompra, CCPago, PlazoPago'#10'  ' +
              'FROM'#10'    dbo.PROVEEDOR'#10'  WHERE {Where}'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDPROVEEDOR'
                TableField = 'IDPROVEEDOR'
              end
              item
                DatasetField = 'NOMBRE'
                TableField = 'NOMBRE'
              end
              item
                DatasetField = 'CALLE'
                TableField = 'CALLE'
              end
              item
                DatasetField = 'COLONIA'
                TableField = 'COLONIA'
              end
              item
                DatasetField = 'CIUDAD'
                TableField = 'CIUDAD'
              end
              item
                DatasetField = 'RFC'
                TableField = 'RFC'
              end
              item
                DatasetField = 'TELEFONO'
                TableField = 'TELEFONO'
              end
              item
                DatasetField = 'CODIGOPOSTAL'
                TableField = 'CODIGOPOSTAL'
              end
              item
                DatasetField = 'EMAIL'
                TableField = 'EMAIL'
              end
              item
                DatasetField = 'CCCompra'
                TableField = 'CCCompra'
              end
              item
                DatasetField = 'CCPago'
                TableField = 'CCPago'
              end
              item
                DatasetField = 'PlazoPago'
                TableField = 'PlazoPago'
              end>
          end>
        Name = 'dbo PROVEEDOR'
        Fields = <
          item
            Name = 'IDPROVEEDOR'
            DataType = datInteger
            Required = True
            InPrimaryKey = True
          end
          item
            Name = 'NOMBRE'
            DataType = datString
            Size = 50
          end
          item
            Name = 'CALLE'
            DataType = datString
            Size = 40
            Required = True
          end
          item
            Name = 'COLONIA'
            DataType = datString
            Size = 30
            Required = True
          end
          item
            Name = 'CIUDAD'
            DataType = datString
            Size = 30
            Required = True
          end
          item
            Name = 'RFC'
            DataType = datString
            Size = 15
            Required = True
          end
          item
            Name = 'TELEFONO'
            DataType = datString
            Size = 20
          end
          item
            Name = 'CODIGOPOSTAL'
            DataType = datString
            Size = 5
          end
          item
            Name = 'EMAIL'
            DataType = datString
            Size = 30
          end
          item
            Name = 'CCCompra'
            DataType = datString
            Size = 25
          end
          item
            Name = 'CCPago'
            DataType = datString
            Size = 25
          end
          item
            Name = 'PlazoPago'
            DataType = datInteger
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            TargetTable = 'dbo.CLIENTE'
            SQL = 
              'SELECT '#10'    IDCLIENTE, CODIGO, NOMBRE, GRUPO, CALLE, COLONIA, CI' +
              'UDAD, '#10'    TELEFONO, CODIGOPOSTAL, RFC, CURP, STATUS, CCA, CCC, ' +
              'LOCALIDAD,'#10'    DIRECCION, NOEXTERIOR, NOINTERIOR, MUNICIPIO, EST' +
              'ADO, PAIS, EMAIL'#10'  FROM'#10'    dbo.CLIENTEEFECTIVO'#10'  WHERE {Where}'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDCLIENTE'
                TableField = 'IDCLIENTE'
              end
              item
                DatasetField = 'CODIGO'
                TableField = 'CODIGO'
              end
              item
                DatasetField = 'NOMBRE'
                TableField = 'NOMBRE'
              end
              item
                DatasetField = 'GRUPO'
                TableField = 'GRUPO'
              end
              item
                DatasetField = 'CALLE'
                TableField = 'CALLE'
              end
              item
                DatasetField = 'COLONIA'
                TableField = 'COLONIA'
              end
              item
                DatasetField = 'CIUDAD'
                TableField = 'CIUDAD'
              end
              item
                DatasetField = 'TELEFONO'
                TableField = 'TELEFONO'
              end
              item
                DatasetField = 'CODIGOPOSTAL'
                TableField = 'CODIGOPOSTAL'
              end
              item
                DatasetField = 'RFC'
                TableField = 'RFC'
              end
              item
                DatasetField = 'CURP'
                TableField = 'CURP'
              end
              item
                DatasetField = 'STATUS'
                TableField = 'STATUS'
              end
              item
                DatasetField = 'CCA'
                TableField = 'CCA'
              end
              item
                DatasetField = 'CCC'
                TableField = 'CCC'
              end
              item
                DatasetField = 'LOCALIDAD'
                TableField = 'LOCALIDAD'
              end
              item
                DatasetField = 'DIRECCION'
                TableField = 'DIRECCION'
              end
              item
                DatasetField = 'NOEXTERIOR'
                TableField = 'NOEXTERIOR'
              end
              item
                DatasetField = 'NOINTERIOR'
                TableField = 'NOINTERIOR'
              end
              item
                DatasetField = 'MUNICIPIO'
                TableField = 'MUNICIPIO'
              end
              item
                DatasetField = 'ESTADO'
                TableField = 'ESTADO'
              end
              item
                DatasetField = 'PAIS'
                TableField = 'PAIS'
              end
              item
                DatasetField = 'EMAIL'
                TableField = 'EMAIL'
              end>
          end>
        Name = 'dbo CLIENTE EFECTIVO'
        Fields = <
          item
            Name = 'IDCLIENTE'
            DataType = datInteger
          end
          item
            Name = 'CODIGO'
            DataType = datString
            Size = 10
          end
          item
            Name = 'NOMBRE'
            DataType = datString
            Size = 80
          end
          item
            Name = 'GRUPO'
            DataType = datString
            Size = 30
          end
          item
            Name = 'CALLE'
            DataType = datString
            Size = 60
          end
          item
            Name = 'COLONIA'
            DataType = datString
            Size = 30
          end
          item
            Name = 'CIUDAD'
            DataType = datString
            Size = 30
          end
          item
            Name = 'TELEFONO'
            DataType = datString
            Size = 20
          end
          item
            Name = 'CODIGOPOSTAL'
            DataType = datString
            Size = 5
          end
          item
            Name = 'RFC'
            DataType = datString
            Size = 15
          end
          item
            Name = 'CURP'
            DataType = datString
            Size = 20
          end
          item
            Name = 'STATUS'
            DataType = datInteger
          end
          item
            Name = 'CCA'
            DataType = datString
            Size = 20
          end
          item
            Name = 'CCC'
            DataType = datString
            Size = 20
          end
          item
            Name = 'LOCALIDAD'
            DataType = datString
            Size = 25
          end
          item
            Name = 'DIRECCION'
            DataType = datString
            Size = 100
          end
          item
            Name = 'NOEXTERIOR'
            DataType = datString
            Size = 50
          end
          item
            Name = 'NOINTERIOR'
            DataType = datString
            Size = 50
          end
          item
            Name = 'MUNICIPIO'
            DataType = datString
            Size = 100
          end
          item
            Name = 'ESTADO'
            DataType = datString
            Size = 100
          end
          item
            Name = 'PAIS'
            DataType = datString
            Size = 100
          end
          item
            Name = 'EMAIL'
            DataType = datString
            Size = 150
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            TargetTable = 'dbo.ALMACEN'
            SQL = 
              'SELECT '#10'    IDALMACEN, NOMBRE, NUMEROESTACION'#10'  FROM'#10'    dbo.ALM' +
              'ACEN'#10'  WHERE {Where}'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDALMACEN'
                TableField = 'IDALMACEN'
              end
              item
                DatasetField = 'NOMBRE'
                TableField = 'NOMBRE'
              end
              item
                DatasetField = 'NUMEROESTACION'
                TableField = 'NUMEROESTACION'
              end>
          end>
        Name = 'dbo ALMACEN'
        Fields = <
          item
            Name = 'IDALMACEN'
            DataType = datInteger
            Required = True
            InPrimaryKey = True
          end
          item
            Name = 'NOMBRE'
            DataType = datString
            Size = 70
          end
          item
            Name = 'NUMEROESTACION'
            DataType = datInteger
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            TargetTable = 'dbo.TANQUE'
            SQL = 
              'SELECT '#10'    IDTANQUE, NUMTANQUE, NOMBRE, CAPACIDAD, FONDAJE, IDP' +
              'RODUCTO'#10'  FROM'#10'    dbo.TANQUE'#10'  WHERE {Where}'
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDTANQUE'
                TableField = 'IDTANQUE'
              end
              item
                DatasetField = 'NUMTANQUE'
                TableField = 'NUMTANQUE'
              end
              item
                DatasetField = 'NOMBRE'
                TableField = 'NOMBRE'
              end
              item
                DatasetField = 'CAPACIDAD'
                TableField = 'CAPACIDAD'
              end
              item
                DatasetField = 'FONDAJE'
                TableField = 'FONDAJE'
              end
              item
                DatasetField = 'IDPRODUCTO'
                TableField = 'IDPRODUCTO'
              end>
          end>
        Name = 'dbo TANQUE'
        Fields = <
          item
            Name = 'IDTANQUE'
            DataType = datInteger
            Required = True
            InPrimaryKey = True
          end
          item
            Name = 'NUMTANQUE'
            DataType = datInteger
          end
          item
            Name = 'NOMBRE'
            DataType = datString
            Size = 50
          end
          item
            Name = 'CAPACIDAD'
            DataType = datFloat
          end
          item
            Name = 'FONDAJE'
            DataType = datFloat
          end
          item
            Name = 'IDPRODUCTO'
            DataType = datInteger
            Required = True
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            TargetTable = 'dbo.CUENTASCONTABLES'
            SQL = 
              'SELECT '#10'    IDCUENTACONTABLE, NUMERODECUENTA, NATURALEZACUENTA, ' +
              #10'    DESCRIPCION'#10'  FROM'#10'    dbo.CUENTASCONTABLES'#10'  WHERE {Where}'
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDCUENTACONTABLE'
                TableField = 'IDCUENTACONTABLE'
              end
              item
                DatasetField = 'NUMERODECUENTA'
                TableField = 'NUMERODECUENTA'
              end
              item
                DatasetField = 'NATURALEZACUENTA'
                TableField = 'NATURALEZACUENTA'
              end
              item
                DatasetField = 'DESCRIPCION'
                TableField = 'DESCRIPCION'
              end>
          end>
        Name = 'dbo CUENTASCONTABLES'
        Fields = <
          item
            Name = 'IDCUENTACONTABLE'
            DataType = datInteger
            Required = True
            InPrimaryKey = True
          end
          item
            Name = 'NUMERODECUENTA'
            DataType = datString
            Size = 25
          end
          item
            Name = 'NATURALEZACUENTA'
            DataType = datString
            Size = 1
          end
          item
            Name = 'DESCRIPCION'
            DataType = datString
            Size = 25
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            TargetTable = 'dbo.CHEQUERA'
            SQL = 
              'SELECT '#10'    IDCHEQUERA, NUMEROCUENTA, BANCO, DESCRIPCION, MONEDA' +
              ', '#10'    SALDOINICIAL'#10'  FROM'#10'    dbo.CHEQUERA'#10'  WHERE {Where}'
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDCHEQUERA'
                TableField = 'IDCHEQUERA'
              end
              item
                DatasetField = 'NUMEROCUENTA'
                TableField = 'NUMEROCUENTA'
              end
              item
                DatasetField = 'BANCO'
                TableField = 'BANCO'
              end
              item
                DatasetField = 'DESCRIPCION'
                TableField = 'DESCRIPCION'
              end
              item
                DatasetField = 'MONEDA'
                TableField = 'MONEDA'
              end
              item
                DatasetField = 'SALDOINICIAL'
                TableField = 'SALDOINICIAL'
              end>
          end>
        Name = 'dbo CHEQUERA'
        Fields = <
          item
            Name = 'IDCHEQUERA'
            DataType = datInteger
            Required = True
            InPrimaryKey = True
          end
          item
            Name = 'NUMEROCUENTA'
            DataType = datString
            Size = 25
          end
          item
            Name = 'BANCO'
            DataType = datInteger
          end
          item
            Name = 'DESCRIPCION'
            DataType = datString
            Size = 50
          end
          item
            Name = 'MONEDA'
            DataType = datString
            Size = 20
          end
          item
            Name = 'SALDOINICIAL'
            DataType = datFloat
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            TargetTable = 'dbo.LINEA'
            SQL = 
              'SELECT '#10'    IDLINEA, DESCRIPCION'#10'  FROM'#10'    dbo.LINEA'#10'  WHERE {W' +
              'here}'
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDLINEA'
                TableField = 'IDLINEA'
              end
              item
                DatasetField = 'DESCRIPCION'
                TableField = 'DESCRIPCION'
              end>
          end>
        Name = 'dbo LINEA'
        Fields = <
          item
            Name = 'IDLINEA'
            DataType = datInteger
            Required = True
            InPrimaryKey = True
          end
          item
            Name = 'DESCRIPCION'
            DataType = datString
            Size = 50
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            TargetTable = 'dbo.MARCA'
            SQL = 
              'SELECT '#10'    IDMARCA, DESCRIPCION'#10'  FROM'#10'    dbo.MARCA'#10'  WHERE {W' +
              'here}'
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDMARCA'
                TableField = 'IDMARCA'
              end
              item
                DatasetField = 'DESCRIPCION'
                TableField = 'DESCRIPCION'
              end>
          end>
        Name = 'dbo MARCA'
        Fields = <
          item
            Name = 'IDMARCA'
            DataType = datInteger
          end
          item
            Name = 'DESCRIPCION'
            DataType = datString
            Size = 50
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            TargetTable = 'dbo.UNIDADESMEDIDA'
            SQL = 
              'SELECT '#10'    IDUNIDADMEDIDA, DESCRIPCION'#10'  FROM'#10'    dbo.UNIDADESM' +
              'EDIDA'#10'  WHERE {Where}'
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDUNIDADMEDIDA'
                TableField = 'IDUNIDADMEDIDA'
              end
              item
                DatasetField = 'DESCRIPCION'
                TableField = 'DESCRIPCION'
              end>
          end>
        Name = 'dbo UNIDADESMEDIDA'
        Fields = <
          item
            Name = 'IDUNIDADMEDIDA'
            DataType = datInteger
          end
          item
            Name = 'DESCRIPCION'
            DataType = datString
            Size = 50
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            TargetTable = 'dbo.CONCEPTOMOVIMIENTOBANCARIO'
            SQL = 
              'SELECT '#10'    IDCONCEPTOMOVIMIENTOBANCARIO, DESCRIPCION, NATURALEZ' +
              'A'#10'  FROM'#10'    dbo.CONCEPTOMOVIMIENTOBANCARIO'#10'  WHERE {Where}'
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDCONCEPTOMOVIMIENTOBANCARIO'
                TableField = 'IDCONCEPTOMOVIMIENTOBANCARIO'
              end
              item
                DatasetField = 'DESCRIPCION'
                TableField = 'DESCRIPCION'
              end
              item
                DatasetField = 'NATURALEZA'
                TableField = 'NATURALEZA'
              end>
          end>
        Name = 'dbo CONCEPTOMOVIMIENTOBANCARIO'
        Fields = <
          item
            Name = 'IDCONCEPTOMOVIMIENTOBANCARIO'
            DataType = datInteger
          end
          item
            Name = 'DESCRIPCION'
            DataType = datString
            Size = 50
          end
          item
            Name = 'NATURALEZA'
            DataType = datString
            Size = 1
          end>
      end
      item
        Params = <
          item
            Name = 'NUMEROESTACION'
            DataType = datInteger
            Value = '1'
          end
          item
            Name = 'IDTURNO'
            DataType = datInteger
            Value = '1'
          end>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            TargetTable = 'dbo.INGRESOS'
            SQL = 
              'SELECT '#10'    IDINGRESO, FECHA, EJERCICIO, PERIODO, DIA, IDTURNO, ' +
              #10'    NUMEROESTACION, IDUSUARIO, INICIOTURNO, FINTURNO, TERMINADA' +
              ','#10'    IDHORARIO, VENTATOTAL, EFECTIVOENTREGADO, SALIDAEFECTIVO, ' +
              'DIFERENCIA'#10'  FROM'#10'    dbo.INGRESOS'#10'  WHERE NUMEROESTACION = :NUM' +
              'EROESTACION AND IDTURNO = :IDTURNO'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDINGRESO'
                TableField = 'IDINGRESO'
              end
              item
                DatasetField = 'FECHA'
                TableField = 'FECHA'
              end
              item
                DatasetField = 'EJERCICIO'
                TableField = 'EJERCICIO'
              end
              item
                DatasetField = 'PERIODO'
                TableField = 'PERIODO'
              end
              item
                DatasetField = 'DIA'
                TableField = 'DIA'
              end
              item
                DatasetField = 'IDTURNO'
                TableField = 'IDTURNO'
              end
              item
                DatasetField = 'NUMEROESTACION'
                TableField = 'NUMEROESTACION'
              end
              item
                DatasetField = 'IDUSUARIO'
                TableField = 'IDUSUARIO'
              end
              item
                DatasetField = 'INICIOTURNO'
                TableField = 'INICIOTURNO'
              end
              item
                DatasetField = 'FINTURNO'
                TableField = 'FINTURNO'
              end
              item
                DatasetField = 'TERMINADA'
                TableField = 'TERMINADA'
              end
              item
                DatasetField = 'IDHORARIO'
                TableField = 'IDHORARIO'
              end
              item
                DatasetField = 'VENTATOTAL'
                TableField = 'VENTATOTAL'
              end
              item
                DatasetField = 'EFECTIVOENTREGADO'
                TableField = 'EFECTIVOENTREGADO'
              end
              item
                DatasetField = 'SALIDAEFECTIVO'
                TableField = 'SALIDAEFECTIVO'
              end
              item
                DatasetField = 'DIFERENCIA'
                TableField = 'DIFERENCIA'
              end>
          end>
        Name = 'dbo INGRESOS'
        Fields = <
          item
            Name = 'IDINGRESO'
            DataType = datInteger
          end
          item
            Name = 'FECHA'
            DataType = datDateTime
          end
          item
            Name = 'EJERCICIO'
            DataType = datInteger
          end
          item
            Name = 'PERIODO'
            DataType = datInteger
          end
          item
            Name = 'DIA'
            DataType = datInteger
          end
          item
            Name = 'IDTURNO'
            DataType = datInteger
          end
          item
            Name = 'NUMEROESTACION'
            DataType = datInteger
          end
          item
            Name = 'IDUSUARIO'
            DataType = datInteger
          end
          item
            Name = 'INICIOTURNO'
            DataType = datDateTime
          end
          item
            Name = 'FINTURNO'
            DataType = datDateTime
          end
          item
            Name = 'TERMINADA'
            DataType = datBoolean
          end
          item
            Name = 'IDHORARIO'
            DataType = datInteger
          end
          item
            Name = 'VENTATOTAL'
            DataType = datFloat
          end
          item
            Name = 'EFECTIVOENTREGADO'
            DataType = datFloat
          end
          item
            Name = 'SALIDAEFECTIVO'
            DataType = datFloat
          end
          item
            Name = 'DIFERENCIA'
            DataType = datFloat
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            TargetTable = 'dbo.TIPOCOMPROBACION'
            SQL = 
              'SELECT '#10'    IDTIPOCOMPROBACION, DESCRIPCION, CUENTACONCENTRADORA' +
              ', '#10'    CC, ESCREDITODEBITOYCUPON, ESPRODUCTO, ESCOMBUSTIBLE,'#10'   ' +
              ' ESCLIENTE, ESEFECTIVO, ESSALIDAEFECTIVO, GRUPO, GRUPOCIERRE,'#10'  ' +
              '  FACTOR, OPERADOR'#10'  FROM'#10'    dbo.TIPOCOMPROBACION'#10'  WHERE {Wher' +
              'e}'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDTIPOCOMPROBACION'
                TableField = 'IDTIPOCOMPROBACION'
              end
              item
                DatasetField = 'DESCRIPCION'
                TableField = 'DESCRIPCION'
              end
              item
                DatasetField = 'CUENTACONCENTRADORA'
                TableField = 'CUENTACONCENTRADORA'
              end
              item
                DatasetField = 'CC'
                TableField = 'CC'
              end
              item
                DatasetField = 'ESCREDITODEBITOYCUPON'
                TableField = 'ESCREDITODEBITOYCUPON'
              end
              item
                DatasetField = 'ESPRODUCTO'
                TableField = 'ESPRODUCTO'
              end
              item
                DatasetField = 'ESCOMBUSTIBLE'
                TableField = 'ESCOMBUSTIBLE'
              end
              item
                DatasetField = 'ESCLIENTE'
                TableField = 'ESCLIENTE'
              end
              item
                DatasetField = 'ESEFECTIVO'
                TableField = 'ESEFECTIVO'
              end
              item
                DatasetField = 'ESSALIDAEFECTIVO'
                TableField = 'ESSALIDAEFECTIVO'
              end
              item
                DatasetField = 'GRUPO'
                TableField = 'GRUPO'
              end
              item
                DatasetField = 'GRUPOCIERRE'
                TableField = 'GRUPOCIERRE'
              end
              item
                DatasetField = 'FACTOR'
                TableField = 'FACTOR'
              end
              item
                DatasetField = 'OPERADOR'
                TableField = 'OPERADOR'
              end>
          end>
        Name = 'dbo TIPOCOMPROBACION'
        Fields = <
          item
            Name = 'IDTIPOCOMPROBACION'
            DataType = datInteger
          end
          item
            Name = 'DESCRIPCION'
            DataType = datString
            Size = 50
          end
          item
            Name = 'CUENTACONCENTRADORA'
            DataType = datString
            Size = 25
          end
          item
            Name = 'CC'
            DataType = datString
            Size = 25
          end
          item
            Name = 'ESCREDITODEBITOYCUPON'
            DataType = datBoolean
          end
          item
            Name = 'ESPRODUCTO'
            DataType = datBoolean
          end
          item
            Name = 'ESCOMBUSTIBLE'
            DataType = datBoolean
          end
          item
            Name = 'ESCLIENTE'
            DataType = datBoolean
          end
          item
            Name = 'ESEFECTIVO'
            DataType = datBoolean
          end
          item
            Name = 'ESSALIDAEFECTIVO'
            DataType = datBoolean
          end
          item
            Name = 'GRUPO'
            DataType = datString
            Size = 50
          end
          item
            Name = 'GRUPOCIERRE'
            DataType = datString
            Size = 50
          end
          item
            Name = 'FACTOR'
            DataType = datFloat
          end
          item
            Name = 'OPERADOR'
            DataType = datInteger
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            TargetTable = 'dbo.MONEDA'
            SQL = 
              'SELECT '#10'    IDMONEDA, DESCRIPCION'#10'  FROM'#10'    dbo.MONEDA'#10'  WHERE ' +
              '{Where}'
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDMONEDA'
                TableField = 'IDMONEDA'
              end
              item
                DatasetField = 'DESCRIPCION'
                TableField = 'DESCRIPCION'
              end>
          end>
        Name = 'dbo MONEDA'
        Fields = <
          item
            Name = 'IDMONEDA'
            DataType = datInteger
            Required = True
            InPrimaryKey = True
          end
          item
            Name = 'DESCRIPCION'
            DataType = datString
            Size = 100
          end>
      end
      item
        Params = <
          item
            Name = 'IDMONEDA'
            DataType = datInteger
            Value = ''
          end>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            TargetTable = 'dbo.VALORMONEDA'
            SQL = 
              'SELECT '#10'    IDVALORMONEDA, IDMONEDA, VALOR, NUMEROESTACION, FECH' +
              'A'#10'  FROM'#10'    dbo.VALORMONEDA'#10'  WHERE IDMONEDA = :IDMONEDA'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDVALORMONEDA'
                TableField = 'IDVALORMONEDA'
              end
              item
                DatasetField = 'IDMONEDA'
                TableField = 'IDMONEDA'
              end
              item
                DatasetField = 'VALOR'
                TableField = 'VALOR'
              end
              item
                DatasetField = 'NUMEROESTACION'
                TableField = 'NUMEROESTACION'
              end
              item
                DatasetField = 'FECHA'
                TableField = 'FECHA'
              end>
          end>
        Name = 'dbo VALORMONEDA'
        Fields = <
          item
            Name = 'IDVALORMONEDA'
            DataType = datInteger
          end
          item
            Name = 'IDMONEDA'
            DataType = datInteger
          end
          item
            Name = 'VALOR'
            DataType = datFloat
          end
          item
            Name = 'NUMEROESTACION'
            DataType = datInteger
          end
          item
            Name = 'FECHA'
            DataType = datDateTime
          end>
      end
      item
        Params = <
          item
            Name = 'IDTURNO'
            DataType = datInteger
            Value = '1001'
          end
          item
            Name = 'NUMEROESTACION'
            DataType = datInteger
            Value = '20'
          end>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            TargetTable = 'dbo.DEPOSITOS'
            SQL = 
              'SELECT '#10'    IDDEPOSITO, IDTURNO, NUMEROESTACION, TOTALDEPOSITADO' +
              ', FALTAPORDEPOSITAR'#10'  FROM'#10'    dbo.DEPOSITOS'#10'  WHERE IDTURNO = :' +
              'IDTURNO AND NUMEROESTACION = :NUMEROESTACION'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDDEPOSITO'
                TableField = 'IDDEPOSITO'
              end
              item
                DatasetField = 'IDTURNO'
                TableField = 'IDTURNO'
              end
              item
                DatasetField = 'NUMEROESTACION'
                TableField = 'NUMEROESTACION'
              end
              item
                DatasetField = 'TOTALDEPOSITADO'
                TableField = 'TOTALDEPOSITADO'
              end
              item
                DatasetField = 'FALTAPORDEPOSITAR'
                TableField = 'FALTAPORDEPOSITAR'
              end>
          end>
        Name = 'dbo DEPOSITOS'
        Fields = <
          item
            Name = 'IDDEPOSITO'
            DataType = datInteger
          end
          item
            Name = 'IDTURNO'
            DataType = datInteger
          end
          item
            Name = 'NUMEROESTACION'
            DataType = datInteger
          end
          item
            Name = 'TOTALDEPOSITADO'
            DataType = datFloat
          end
          item
            Name = 'FALTAPORDEPOSITAR'
            DataType = datFloat
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            TargetTable = 'dbo.TIPOMOVIMIENTO'
            SQL = 
              'SELECT '#10'    IDTIPOMOVIMIENTO, REFERENCIA, EFECTO'#10'  FROM'#10'    dbo.' +
              'TIPOMOVIMIENTO'#10'  WHERE {Where}'
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDTIPOMOVIMIENTO'
                TableField = 'IDTIPOMOVIMIENTO'
              end
              item
                DatasetField = 'REFERENCIA'
                TableField = 'REFERENCIA'
              end
              item
                DatasetField = 'EFECTO'
                TableField = 'EFECTO'
              end>
          end>
        Name = 'dbo TIPOMOVIMIENTO'
        Fields = <
          item
            Name = 'IDTIPOMOVIMIENTO'
            DataType = datInteger
            Required = True
            InPrimaryKey = True
          end
          item
            Name = 'REFERENCIA'
            DataType = datString
            Size = 200
          end
          item
            Name = 'EFECTO'
            DataType = datInteger
          end>
      end
      item
        Params = <
          item
            Name = 'IDMOVIMIENTOALMACEN'
            DataType = datInteger
            Value = ''
          end>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            TargetTable = 'dbo.MOVIMIENTOALMACEN'
            SQL = 
              'SELECT '#10'    IDMOVIMIENTOALMACEN, FOLIO, FECHA, DIA, EJERCICIO, '#10 +
              '    PERIODO, TOTAL, SUBTOTAL, IMPUESTO, IMPUESTOPORCENTAJE, '#10'   ' +
              ' REFERENCIA, IDPROVEEDOR, IDALMACEN, IDUSUARIO, NUMEROESTACION, ' +
              #10'    IDTIPOMOVIMIENTO, IDESTACIOND, IDALMACEND'#10'  FROM'#10'    dbo.MO' +
              'VIMIENTOALMACEN'#10'  WHERE'#10'    IDMOVIMIENTOALMACEN = :IDMOVIMIENTOA' +
              'LMACEN'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDMOVIMIENTOALMACEN'
                TableField = 'IDMOVIMIENTOALMACEN'
              end
              item
                DatasetField = 'FOLIO'
                TableField = 'FOLIO'
              end
              item
                DatasetField = 'FECHA'
                TableField = 'FECHA'
              end
              item
                DatasetField = 'DIA'
                TableField = 'DIA'
              end
              item
                DatasetField = 'EJERCICIO'
                TableField = 'EJERCICIO'
              end
              item
                DatasetField = 'PERIODO'
                TableField = 'PERIODO'
              end
              item
                DatasetField = 'TOTAL'
                TableField = 'TOTAL'
              end
              item
                DatasetField = 'SUBTOTAL'
                TableField = 'SUBTOTAL'
              end
              item
                DatasetField = 'IMPUESTO'
                TableField = 'IMPUESTO'
              end
              item
                DatasetField = 'IMPUESTOPORCENTAJE'
                TableField = 'IMPUESTOPORCENTAJE'
              end
              item
                DatasetField = 'REFERENCIA'
                TableField = 'REFERENCIA'
              end
              item
                DatasetField = 'IDPROVEEDOR'
                TableField = 'IDPROVEEDOR'
              end
              item
                DatasetField = 'IDALMACEN'
                TableField = 'IDALMACEN'
              end
              item
                DatasetField = 'IDUSUARIO'
                TableField = 'IDUSUARIO'
              end
              item
                DatasetField = 'NUMEROESTACION'
                TableField = 'NUMEROESTACION'
              end
              item
                DatasetField = 'IDTIPOMOVIMIENTO'
                TableField = 'IDTIPOMOVIMIENTO'
              end
              item
                DatasetField = 'IDESTACIOND'
                TableField = 'IDESTACIOND'
              end
              item
                DatasetField = 'IDALMACEND'
                TableField = 'IDALMACEND'
              end>
          end>
        Name = 'dbo MOVIMIENTOALMACEN'
        Fields = <
          item
            Name = 'IDMOVIMIENTOALMACEN'
            DataType = datInteger
            Required = True
            InPrimaryKey = True
          end
          item
            Name = 'FOLIO'
            DataType = datInteger
          end
          item
            Name = 'FECHA'
            DataType = datDateTime
          end
          item
            Name = 'DIA'
            DataType = datInteger
          end
          item
            Name = 'EJERCICIO'
            DataType = datInteger
          end
          item
            Name = 'PERIODO'
            DataType = datInteger
          end
          item
            Name = 'TOTAL'
            DataType = datFloat
          end
          item
            Name = 'SUBTOTAL'
            DataType = datFloat
          end
          item
            Name = 'IMPUESTO'
            DataType = datFloat
          end
          item
            Name = 'IMPUESTOPORCENTAJE'
            DataType = datFloat
          end
          item
            Name = 'REFERENCIA'
            DataType = datString
            Size = 200
          end
          item
            Name = 'IDPROVEEDOR'
            DataType = datInteger
          end
          item
            Name = 'IDALMACEN'
            DataType = datInteger
          end
          item
            Name = 'IDUSUARIO'
            DataType = datInteger
          end
          item
            Name = 'NUMEROESTACION'
            DataType = datInteger
          end
          item
            Name = 'IDTIPOMOVIMIENTO'
            DataType = datInteger
          end
          item
            Name = 'IDESTACIOND'
            DataType = datInteger
          end
          item
            Name = 'IDALMACEND'
            DataType = datInteger
          end>
      end
      item
        Params = <
          item
            Name = 'IDMOVIMIENTOALMACEN'
            DataType = datInteger
            Value = ''
          end>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            TargetTable = 'dbo.DETALLEMOVIMIENTOALMACEN'
            SQL = 
              'SELECT '#10'    IDDETALLEMOVIMIENTOALMACEN, IDMOVIMIENTOALMACEN, CAN' +
              'TIDAD, '#10'    PRECIO, IMPORTE, IDPRODUCTO'#10'  FROM'#10'    dbo.DETALLEMO' +
              'VIMIENTOALMACEN'#10'  WHERE'#10'    IDMOVIMIENTOALMACEN = :IDMOVIMIENTOA' +
              'LMACEN'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDDETALLEMOVIMIENTOALMACEN'
                TableField = 'IDDETALLEMOVIMIENTOALMACEN'
              end
              item
                DatasetField = 'IDMOVIMIENTOALMACEN'
                TableField = 'IDMOVIMIENTOALMACEN'
              end
              item
                DatasetField = 'CANTIDAD'
                TableField = 'CANTIDAD'
              end
              item
                DatasetField = 'PRECIO'
                TableField = 'PRECIO'
              end
              item
                DatasetField = 'IMPORTE'
                TableField = 'IMPORTE'
              end
              item
                DatasetField = 'IDPRODUCTO'
                TableField = 'IDPRODUCTO'
              end>
          end>
        Name = 'dbo DETALLEMOVIMIENTOALMACEN'
        Fields = <
          item
            Name = 'IDDETALLEMOVIMIENTOALMACEN'
            DataType = datInteger
            Required = True
            InPrimaryKey = True
          end
          item
            Name = 'IDMOVIMIENTOALMACEN'
            DataType = datInteger
            Required = True
          end
          item
            Name = 'CANTIDAD'
            DataType = datFloat
          end
          item
            Name = 'PRECIO'
            DataType = datFloat
          end
          item
            Name = 'IMPORTE'
            DataType = datFloat
          end
          item
            Name = 'IDPRODUCTO'
            DataType = datInteger
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            TargetTable = 'dbo.CONDICIONPAGO'
            SQL = 
              'SELECT '#10'    IDCONDICIONPAGO, DESCRIPCION'#10'  FROM'#10'    dbo.CONDICIO' +
              'NPAGO'#10'  WHERE {Where}'
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDCONDICIONPAGO'
                TableField = 'IDCONDICIONPAGO'
              end
              item
                DatasetField = 'DESCRIPCION'
                TableField = 'DESCRIPCION'
              end>
          end>
        Name = 'dbo CONDICIONPAGO'
        Fields = <
          item
            Name = 'IDCONDICIONPAGO'
            DataType = datInteger
          end
          item
            Name = 'DESCRIPCION'
            DataType = datString
            Size = 50
          end>
      end
      item
        Params = <
          item
            Name = 'IDDEPOSITO'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'IDHORARIO'
            DataType = datInteger
            Value = ''
          end>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            TargetTable = 'dbo.DETALLEDEPOSITO'
            SQL = 
              'SELECT '#10'    IDDETALLEDEPOSITO, REFERENCIA, CANTIDAD, IMPORTE, ID' +
              'TIPOMONEDA, '#10'    TIPOCAMBIO, TIPO, IDBANCO, IDDEPOSITO, IDHORARI' +
              'O'#10'  FROM'#10'    dbo.DETALLEDEPOSITO'#10'  WHERE IDDEPOSITO = :IDDEPOSIT' +
              'O AND IDHORARIO = :IDHORARIO'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDDETALLEDEPOSITO'
                TableField = 'IDDETALLEDEPOSITO'
              end
              item
                DatasetField = 'REFERENCIA'
                TableField = 'REFERENCIA'
              end
              item
                DatasetField = 'CANTIDAD'
                TableField = 'CANTIDAD'
              end
              item
                DatasetField = 'IMPORTE'
                TableField = 'IMPORTE'
              end
              item
                DatasetField = 'IDTIPOMONEDA'
                TableField = 'IDTIPOMONEDA'
              end
              item
                DatasetField = 'TIPOCAMBIO'
                TableField = 'TIPOCAMBIO'
              end
              item
                DatasetField = 'TIPO'
                TableField = 'TIPO'
              end
              item
                DatasetField = 'IDBANCO'
                TableField = 'IDBANCO'
              end
              item
                DatasetField = 'IDDEPOSITO'
                TableField = 'IDDEPOSITO'
              end
              item
                DatasetField = 'IDHORARIO'
                TableField = 'IDHORARIO'
              end>
          end>
        Name = 'dbo DETALLEDEPOSITO'
        Fields = <
          item
            Name = 'IDDETALLEDEPOSITO'
            DataType = datInteger
          end
          item
            Name = 'REFERENCIA'
            DataType = datString
            Size = 50
          end
          item
            Name = 'CANTIDAD'
            DataType = datFloat
          end
          item
            Name = 'IMPORTE'
            DataType = datFloat
          end
          item
            Name = 'IDTIPOMONEDA'
            DataType = datInteger
          end
          item
            Name = 'TIPOCAMBIO'
            DataType = datFloat
          end
          item
            Name = 'TIPO'
            DataType = datInteger
          end
          item
            Name = 'IDBANCO'
            DataType = datInteger
          end
          item
            Name = 'IDDEPOSITO'
            DataType = datInteger
          end
          item
            Name = 'IDHORARIO'
            DataType = datInteger
          end>
      end
      item
        Params = <
          item
            Name = 'NUMEROESTACION'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'FECHA'
            Value = ''
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            TargetTable = 'dbo.INGRESOS'
            SQL = 
              'SELECT '#10'    IDINGRESO, FECHA, EJERCICIO, PERIODO, DIA, IDTURNO, ' +
              #10'    NUMEROESTACION, IDUSUARIO, INICIOTURNO, FINTURNO, TERMINADA' +
              ', '#10'    IDHORARIO, VENTATOTAL, EFECTIVOENTREGADO, SALIDAEFECTIVO,' +
              ' '#10'    DIFERENCIA'#10'  FROM'#10'    dbo.INGRESOS'#10'  WHERE (NUMEROESTACION' +
              ' = :NUMEROESTACION) AND (DAY(FECHA) = DAY(:FECHA)) AND'#10'  (MONTH(' +
              'FECHA) = MONTH(:FECHA)) AND (YEAR(FECHA) = YEAR(:FECHA))'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDINGRESO'
                TableField = 'IDINGRESO'
              end
              item
                DatasetField = 'FECHA'
                TableField = 'FECHA'
              end
              item
                DatasetField = 'EJERCICIO'
                TableField = 'EJERCICIO'
              end
              item
                DatasetField = 'PERIODO'
                TableField = 'PERIODO'
              end
              item
                DatasetField = 'DIA'
                TableField = 'DIA'
              end
              item
                DatasetField = 'IDTURNO'
                TableField = 'IDTURNO'
              end
              item
                DatasetField = 'NUMEROESTACION'
                TableField = 'NUMEROESTACION'
              end
              item
                DatasetField = 'IDUSUARIO'
                TableField = 'IDUSUARIO'
              end
              item
                DatasetField = 'INICIOTURNO'
                TableField = 'INICIOTURNO'
              end
              item
                DatasetField = 'FINTURNO'
                TableField = 'FINTURNO'
              end
              item
                DatasetField = 'TERMINADA'
                TableField = 'TERMINADA'
              end
              item
                DatasetField = 'IDHORARIO'
                TableField = 'IDHORARIO'
              end
              item
                DatasetField = 'VENTATOTAL'
                TableField = 'VENTATOTAL'
              end
              item
                DatasetField = 'EFECTIVOENTREGADO'
                TableField = 'EFECTIVOENTREGADO'
              end
              item
                DatasetField = 'SALIDAEFECTIVO'
                TableField = 'SALIDAEFECTIVO'
              end
              item
                DatasetField = 'DIFERENCIA'
                TableField = 'DIFERENCIA'
              end>
          end>
        Name = 'dbo INGRESOS2'
        Fields = <
          item
            Name = 'IDINGRESO'
            DataType = datInteger
            Required = True
            InPrimaryKey = True
          end
          item
            Name = 'FECHA'
            DataType = datDateTime
          end
          item
            Name = 'EJERCICIO'
            DataType = datInteger
          end
          item
            Name = 'PERIODO'
            DataType = datInteger
          end
          item
            Name = 'DIA'
            DataType = datInteger
          end
          item
            Name = 'IDTURNO'
            DataType = datInteger
          end
          item
            Name = 'NUMEROESTACION'
            DataType = datInteger
          end
          item
            Name = 'IDUSUARIO'
            DataType = datInteger
          end
          item
            Name = 'INICIOTURNO'
            DataType = datDateTime
          end
          item
            Name = 'FINTURNO'
            DataType = datDateTime
          end
          item
            Name = 'TERMINADA'
            DataType = datBoolean
          end
          item
            Name = 'IDHORARIO'
            DataType = datInteger
          end
          item
            Name = 'VENTATOTAL'
            DataType = datFloat
          end
          item
            Name = 'EFECTIVOENTREGADO'
            DataType = datFloat
          end
          item
            Name = 'SALIDAEFECTIVO'
            DataType = datFloat
          end
          item
            Name = 'DIFERENCIA'
            DataType = datFloat
          end>
      end
      item
        Params = <
          item
            Name = 'FECHA'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'NUMEROESTACION'
            Value = ''
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            TargetTable = 'dbo.DEPOSITOS'
            SQL = 
              'SELECT'#10'    IDDEPOSITO, IDTURNO, NUMEROESTACION, TOTALDEPOSITADO,' +
              ' FALTAPORDEPOSITAR,'#10'    FECHA'#10'  FROM'#10'    dbo.DEPOSITOS'#10'  WHERE (' +
              'DAY(FECHA) = DAY(:FECHA)) AND (MONTH(FECHA) = MONTH(:FECHA)) AND' +
              ' (YEAR(FECHA) = YEAR(:FECHA))'#10'  AND NUMEROESTACION = :NUMEROESTA' +
              'CION'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDDEPOSITO'
                TableField = 'IDDEPOSITO'
              end
              item
                DatasetField = 'IDTURNO'
                TableField = 'IDTURNO'
              end
              item
                DatasetField = 'NUMEROESTACION'
                TableField = 'NUMEROESTACION'
              end
              item
                DatasetField = 'TOTALDEPOSITADO'
                TableField = 'TOTALDEPOSITADO'
              end
              item
                DatasetField = 'FALTAPORDEPOSITAR'
                TableField = 'FALTAPORDEPOSITAR'
              end
              item
                DatasetField = 'FECHA'
                TableField = 'FECHA'
              end>
          end>
        Name = 'dbo DEPOSITOS2'
        Fields = <
          item
            Name = 'IDDEPOSITO'
            DataType = datInteger
          end
          item
            Name = 'IDTURNO'
            DataType = datInteger
          end
          item
            Name = 'NUMEROESTACION'
            DataType = datInteger
          end
          item
            Name = 'TOTALDEPOSITADO'
            DataType = datFloat
          end
          item
            Name = 'FALTAPORDEPOSITAR'
            DataType = datFloat
          end
          item
            Name = 'FECHA'
            DataType = datDateTime
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            TargetTable = 'dbo.EXPORTAR'
            SQL = 
              'SELECT '#10'    ExportarID, Nombre, Parametros, Template, ScriptExpo' +
              'rta, '#10'    ScriptDatos'#10'  FROM'#10'    dbo.EXPORTAR'#10'  WHERE {Where}'
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'ExportarID'
                TableField = 'ExportarID'
              end
              item
                DatasetField = 'Nombre'
                TableField = 'Nombre'
              end
              item
                DatasetField = 'Parametros'
                TableField = 'Parametros'
              end
              item
                DatasetField = 'Template'
                TableField = 'Template'
              end
              item
                DatasetField = 'ScriptExporta'
                TableField = 'ScriptExporta'
              end
              item
                DatasetField = 'ScriptDatos'
                TableField = 'ScriptDatos'
              end>
          end>
        Name = 'dbo EXPORTAR'
        Fields = <
          item
            Name = 'ExportarID'
            DataType = datInteger
            Required = True
            InPrimaryKey = True
          end
          item
            Name = 'Nombre'
            DataType = datString
            Size = 50
          end
          item
            Name = 'Parametros'
            DataType = datString
            Size = 50
          end
          item
            Name = 'Template'
            DataType = datMemo
          end
          item
            Name = 'ScriptExporta'
            DataType = datMemo
          end
          item
            Name = 'ScriptDatos'
            DataType = datMemo
          end>
      end
      item
        Params = <
          item
            Name = 'ExportarID'
            DataType = datInteger
            Value = ''
          end>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            TargetTable = 'dbo.CAMPO'
            SQL = 
              'SELECT'#10'    CampoID, Nombre, Size, Formato, Tipo, Orden, Exportar' +
              'ID'#10'  FROM'#10'    dbo.Campo'#10'  WHERE'#10'    ExportarID = :ExportarID'#10'  O' +
              'RDER BY'#10'    Orden'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'CampoID'
                TableField = 'CampoID'
              end
              item
                DatasetField = 'Nombre'
                TableField = 'Nombre'
              end
              item
                DatasetField = 'Size'
                TableField = 'Size'
              end
              item
                DatasetField = 'Formato'
                TableField = 'Formato'
              end
              item
                DatasetField = 'Tipo'
                TableField = 'Tipo'
              end
              item
                DatasetField = 'Orden'
                TableField = 'Orden'
              end
              item
                DatasetField = 'ExportarID'
                TableField = 'ExportarID'
              end>
          end>
        Name = 'dbo CAMPO'
        Fields = <
          item
            Name = 'CampoID'
            DataType = datInteger
            Required = True
          end
          item
            Name = 'Nombre'
            DataType = datString
            Size = 50
            Required = True
          end
          item
            Name = 'Size'
            DataType = datInteger
            Required = True
          end
          item
            Name = 'Formato'
            DataType = datString
            Size = 50
          end
          item
            Name = 'Tipo'
            DataType = datInteger
            Required = True
          end
          item
            Name = 'Orden'
            DataType = datInteger
            Required = True
          end
          item
            Name = 'ExportarID'
            DataType = datInteger
            Required = True
          end>
      end
      item
        Params = <
          item
            Name = 'ExportarID'
            DataType = datInteger
            Value = ''
          end>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            TargetTable = 'dbo.PASO'
            SQL = 
              'SELECT'#10'    PasoID, Nombre, SQL, Orden, ExportarID, ServidorID'#10'  ' +
              'FROM'#10'    dbo.Paso'#10'  WHERE'#10'    ExportarID = :ExportarID'#10'  ORDER B' +
              'Y'#10'    Orden'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'PasoID'
                TableField = 'PasoID'
              end
              item
                DatasetField = 'Nombre'
                TableField = 'Nombre'
              end
              item
                DatasetField = 'SQL'
                TableField = 'SQL'
              end
              item
                DatasetField = 'Orden'
                TableField = 'Orden'
              end
              item
                DatasetField = 'ExportarID'
                TableField = 'ExportarID'
              end
              item
                DatasetField = 'ServidorID'
                TableField = 'ServidorID'
              end>
          end>
        Name = 'dbo PASO'
        Fields = <
          item
            Name = 'PasoID'
            DataType = datInteger
            Required = True
          end
          item
            Name = 'Nombre'
            DataType = datString
            Size = 50
          end
          item
            Name = 'SQL'
            DataType = datMemo
          end
          item
            Name = 'Orden'
            DataType = datInteger
          end
          item
            Name = 'ExportarID'
            DataType = datInteger
            Required = True
          end
          item
            Name = 'ServidorID'
            DataType = datInteger
            Required = True
          end>
      end
      item
        Params = <
          item
            Name = 'IDINGRESO'
            DataType = datInteger
            Value = ''
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'INGRESOS'
            ConnectionType = 'MSSQL'
            Default = True
            TargetTable = 'dbo.DETALLEINGRESOS'
            SQL = 
              'SELECT '#10'    IDDETALLEINGRESOS, IDENCARGADOINGRESOS, IDTIPOCOMPRO' +
              'BACION, '#10'    CANTIDAD, IMPORTE, DESCRIPCION, TICKET,'#10'    IDPRODU' +
              'CTO, COSTO, PUNTOS, NUMEROESTACION,  IDTIPOMONEDA, PRECIO,'#10'    I' +
              'MPUESTOPORCENTAJE, IEPS, TIPOCAMBIO, CLIENTE, VEHICULO, IDCLIENT' +
              'E,'#10'    IDCUPON, IDBANCO, IDAUXILIAR, IDSALIDA'#10'  FROM'#10'    dbo.DET' +
              'ALLEINGRESOS'#10'  WHERE (dbo.DETALLEINGRESOS.IDENCARGADOINGRESOS IN' +
              #10'  (SELECT     IDENCARGADOINGRESOS'#10'   FROM       ENCARGADOINGRES' +
              'OS'#10'   WHERE      IDINGRESO = :IDINGRESO))'
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDDETALLEINGRESOS'
                TableField = 'IDDETALLEINGRESOS'
              end
              item
                DatasetField = 'IDENCARGADOINGRESOS'
                TableField = 'IDENCARGADOINGRESOS'
              end
              item
                DatasetField = 'IDTIPOCOMPROBACION'
                TableField = 'IDTIPOCOMPROBACION'
              end
              item
                DatasetField = 'CANTIDAD'
                TableField = 'CANTIDAD'
              end
              item
                DatasetField = 'IMPORTE'
                TableField = 'IMPORTE'
              end
              item
                DatasetField = 'DESCRIPCION'
                TableField = 'DESCRIPCION'
              end
              item
                DatasetField = 'TICKET'
                TableField = 'TICKET'
              end
              item
                DatasetField = 'IDPRODUCTO'
                TableField = 'IDPRODUCTO'
              end
              item
                DatasetField = 'COSTO'
                TableField = 'COSTO'
              end
              item
                DatasetField = 'PUNTOS'
                TableField = 'PUNTOS'
              end
              item
                DatasetField = 'NUMEROESTACION'
                TableField = 'NUMEROESTACION'
              end
              item
                DatasetField = 'IDTIPOMONEDA'
                TableField = 'IDTIPOMONEDA'
              end
              item
                DatasetField = 'PRECIO'
                TableField = 'PRECIO'
              end
              item
                DatasetField = 'IMPUESTOPORCENTAJE'
                TableField = 'IMPUESTOPORCENTAJE'
              end
              item
                DatasetField = 'IEPS'
                TableField = 'IEPS'
              end
              item
                DatasetField = 'TIPOCAMBIO'
                TableField = 'TIPOCAMBIO'
              end
              item
                DatasetField = 'CLIENTE'
                TableField = 'CLIENTE'
              end
              item
                DatasetField = 'VEHICULO'
                TableField = 'VEHICULO'
              end
              item
                DatasetField = 'IDCLIENTE'
                TableField = 'IDCLIENTE'
              end
              item
                DatasetField = 'IDCUPON'
                TableField = 'IDCUPON'
              end
              item
                DatasetField = 'IDBANCO'
                TableField = 'IDBANCO'
              end
              item
                DatasetField = 'IDAUXILIAR'
                TableField = 'IDAUXILIAR'
              end
              item
                DatasetField = 'IDSALIDA'
                TableField = 'IDSALIDA'
              end>
          end>
        Name = 'dbo.DETALLEINGRESOS'
        BusinessRulesClient.CompileOnServer = False
        BusinessRulesClient.RunOnClientAndServer = False
        Fields = <
          item
            Name = 'IDDETALLEINGRESOS'
            DataType = datInteger
          end
          item
            Name = 'IDENCARGADOINGRESOS'
            DataType = datInteger
          end
          item
            Name = 'IDTIPOCOMPROBACION'
            DataType = datInteger
          end
          item
            Name = 'CANTIDAD'
            DataType = datFloat
          end
          item
            Name = 'IMPORTE'
            DataType = datFloat
          end
          item
            Name = 'DESCRIPCION'
            DataType = datString
            Size = 150
          end
          item
            Name = 'TICKET'
            DataType = datInteger
          end
          item
            Name = 'IDPRODUCTO'
            DataType = datInteger
          end
          item
            Name = 'COSTO'
            DataType = datFloat
          end
          item
            Name = 'PUNTOS'
            DataType = datInteger
          end
          item
            Name = 'NUMEROESTACION'
            DataType = datInteger
          end
          item
            Name = 'IDTIPOMONEDA'
            DataType = datInteger
          end
          item
            Name = 'PRECIO'
            DataType = datFloat
          end
          item
            Name = 'IMPUESTOPORCENTAJE'
            DataType = datFloat
          end
          item
            Name = 'IEPS'
            DataType = datFloat
          end
          item
            Name = 'TIPOCAMBIO'
            DataType = datFloat
          end
          item
            Name = 'CLIENTE'
            DataType = datString
            Size = 150
          end
          item
            Name = 'VEHICULO'
            DataType = datString
            Size = 150
          end
          item
            Name = 'IDCLIENTE'
            DataType = datInteger
          end
          item
            Name = 'IDCUPON'
            DataType = datInteger
          end
          item
            Name = 'IDBANCO'
            DataType = datInteger
          end
          item
            Name = 'IDAUXILIAR'
            DataType = datInteger
          end
          item
            Name = 'IDSALIDA'
            DataType = datInteger
          end>
      end
      item
        Params = <
          item
            Name = 'IDINGRESO'
            DataType = datInteger
            Value = ''
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'INGRESOS'
            ConnectionType = 'MSSQL'
            Default = True
            TargetTable = 'dbo.ENCARGADOINGRESOS'
            SQL = 
              'SELECT '#9#10#9'"IDENCARGADOINGRESOS", "IDEMPLEADO", "IDINGRESO", '#10#9'"O' +
              'BSERVACIONES", "IMPORTE", "ENTREGADO", "DIFERENCIA", "IDAGRUPACI' +
              'ON" '#10'FROM '#10#9'"dbo"."ENCARGADOINGRESOS" '#10'WHERE '#10#9'IDINGRESO = :IDIN' +
              'GRESO'
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDENCARGADOINGRESOS'
                TableField = 'IDENCARGADOINGRESOS'
              end
              item
                DatasetField = 'IDEMPLEADO'
                TableField = 'IDEMPLEADO'
              end
              item
                DatasetField = 'IDINGRESO'
                TableField = 'IDINGRESO'
              end
              item
                DatasetField = 'OBSERVACIONES'
                TableField = 'OBSERVACIONES'
              end
              item
                DatasetField = 'IMPORTE'
                TableField = 'IMPORTE'
              end
              item
                DatasetField = 'ENTREGADO'
                TableField = 'ENTREGADO'
              end
              item
                DatasetField = 'DIFERENCIA'
                TableField = 'DIFERENCIA'
              end
              item
                DatasetField = 'IDAGRUPACION'
                TableField = 'IDAGRUPACION'
              end>
          end>
        Name = 'dbo.ENCARGADOINGRESOS'
        BusinessRulesClient.CompileOnServer = False
        BusinessRulesClient.RunOnClientAndServer = False
        Fields = <
          item
            Name = 'IDENCARGADOINGRESOS'
            DataType = datInteger
          end
          item
            Name = 'IDEMPLEADO'
            DataType = datInteger
          end
          item
            Name = 'IDINGRESO'
            DataType = datInteger
          end
          item
            Name = 'OBSERVACIONES'
            DataType = datString
            Size = 150
          end
          item
            Name = 'IMPORTE'
            DataType = datFloat
          end
          item
            Name = 'ENTREGADO'
            DataType = datFloat
          end
          item
            Name = 'DIFERENCIA'
            DataType = datFloat
          end
          item
            Name = 'IDAGRUPACION'
            DataType = datInteger
          end>
      end
      item
        Params = <
          item
            Name = 'FECHA'
            DataType = datDateTime
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'ESTACION'
            Value = ''
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'INGRESOS'
            ConnectionType = 'MSSQL'
            Default = True
            SQL = 
              'SELECT IDTURNO, FECHA, IDHORARIO FROM INGRESOS '#10'WHERE MONTH(FECH' +
              'A) = MONTH(:FECHA) AND YEAR(FECHA) = YEAR(:FECHA) AND DAY(FECHA)' +
              ' = DAY(:FECHA) AND NUMEROESTACION = :ESTACION'
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDTURNO'
                TableField = 'IDTURNO'
              end
              item
                DatasetField = 'FECHA'
                TableField = 'FECHA'
              end
              item
                DatasetField = 'IDHORARIO'
                TableField = 'IDHORARIO'
              end>
          end>
        Name = 'spObtenTurnosdeFecha'
        BusinessRulesClient.CompileOnServer = False
        BusinessRulesClient.RunOnClientAndServer = False
        Fields = <
          item
            Name = 'IDTURNO'
            DataType = datInteger
          end
          item
            Name = 'FECHA'
            DataType = datDateTime
          end
          item
            Name = 'IDHORARIO'
            DataType = datInteger
          end>
      end
      item
        Params = <
          item
            Name = 'IDINGRESO'
            DataType = datInteger
            Value = '-5'
            ParamType = daptInput
          end
          item
            Name = 'IDTURNO'
            DataType = datString
            Value = '4'
            ParamType = daptInput
          end
          item
            Name = 'NUMEROESTACION'
            DataType = datString
            Value = '1'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            SQL = 
              'declare @EJERCICIO as integer'#10'declare @PERIODO as integer'#10'declar' +
              'e @DIA as integer'#10#10'set @EJERCICIO = (Select YEAR(GETDATE()))'#10'set' +
              ' @PERIODO = (Select MONTH(GETDATE()))'#10'set @DIA = (Select DAY(GET' +
              'DATE()))'#10#10'INSERT INTO [dbo].[INGRESOS]'#10'           ([IDINGRESO]'#10' ' +
              '          ,[FECHA]'#10'           ,[EJERCICIO]'#10'           ,[PERIODO]' +
              #10'           ,[DIA]'#10'           ,[IDTURNO]'#10'           ,[NUMEROESTA' +
              'CION]'#10'           ,[IDUSUARIO]'#10'           ,[INICIOTURNO]'#10'        ' +
              '   ,[FINTURNO]'#10'           ,[TERMINADA]'#10'           ,[IDHORARIO]'#10' ' +
              '          ,[VENTATOTAL]'#10'           ,[EFECTIVOENTREGADO]'#10'        ' +
              '   ,[SALIDAEFECTIVO]'#10'           ,[DIFERENCIA])'#10'     VALUES(:IDIN' +
              'GRESO,GETDATE(),@EJERCICIO,@PERIODO,@DIA,:IDTURNO,:NUMEROESTACIO' +
              'N,-1,GETDATE(),GETDATE(),0,0,0,0,0,0)'#10#10#10' SELECT '#39'TURNO ABIERTO C' +
              'ORRECTAMENTE'#39' AS RESULT'#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'spAbreTurno'
        BusinessRulesClient.CompileOnServer = False
        BusinessRulesClient.RunOnClientAndServer = False
        Fields = <
          item
            Name = 'RESULT'
            DataType = datInteger
          end>
      end
      item
        Params = <
          item
            Name = 'IDESTACION'
            DataType = datInteger
            Value = ''
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'INGRESOS'
            ConnectionType = 'MSSQL'
            Default = True
            TargetTable = 'dbo.AGRUPACION'
            SQL = 
              'SELECT '#9#10#9'"IDAGRUPACION", "NOMBRE", "IDESTACION" '#9#10'FROM '#10#9'"dbo".' +
              '"AGRUPACION" '#10'WHERE '#10#9'IDESTACION = :IDESTACION'
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDAGRUPACION'
                TableField = 'IDAGRUPACION'
              end
              item
                DatasetField = 'NOMBRE'
                TableField = 'NOMBRE'
              end
              item
                DatasetField = 'IDESTACION'
                TableField = 'IDESTACION'
              end>
          end>
        Name = 'AGRUPACION'
        BusinessRulesClient.CompileOnServer = False
        BusinessRulesClient.RunOnClientAndServer = False
        Fields = <
          item
            Name = 'IDAGRUPACION'
            DataType = datInteger
          end
          item
            Name = 'NOMBRE'
            DataType = datString
            Size = 70
          end
          item
            Name = 'IDESTACION'
            DataType = datInteger
          end>
      end
      item
        Params = <
          item
            Name = 'IDESTACION'
            Value = ''
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'INGRESOS'
            ConnectionType = 'MSSQL'
            Default = True
            TargetTable = 'dbo.AGRUPACIONCAJAS'
            SQL = 
              'SELECT AGRUPACIONCAJAS.IDAGRUPACION, AGRUPACIONCAJAS.IDCAJA'#10'FROM' +
              ' AGRUPACIONCAJAS INNER JOIN AGRUPACION'#10'ON AGRUPACIONCAJAS.IDAGRU' +
              'PACION = AGRUPACION.IDAGRUPACION'#10'WHERE AGRUPACION.IDESTACION = :' +
              'IDESTACION'#10'ORDER BY AGRUPACIONCAJAS.IDAGRUPACION, AGRUPACIONCAJA' +
              'S.IDCAJA'
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDAGRUPACION'
                TableField = 'IDAGRUPACION'
              end
              item
                DatasetField = 'IDCAJA'
                TableField = 'IDCAJA'
              end>
          end>
        Name = 'AGRUPACIONCAJAS'
        BusinessRulesClient.CompileOnServer = False
        BusinessRulesClient.RunOnClientAndServer = False
        Fields = <
          item
            Name = 'IDAGRUPACION'
            DataType = datInteger
          end
          item
            Name = 'IDCAJA'
            DataType = datInteger
          end>
      end
      item
        Params = <
          item
            Name = 'Tipo'
            DataType = datInteger
            Value = '0'
            ParamType = daptInput
          end
          item
            Name = 'EstacionID'
            DataType = datInteger
            Value = '1'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'INGRESOS'
            ConnectionType = 'MSSQL'
            Default = True
            TargetTable = 'dbo.PRODUCTO'
            SQL = 
              'declare @Tipo as Integer'#10'declare @EstacionID as integer'#10#10'select ' +
              '@Tipo = (Select :Tipo)'#10'select @EstacionID = (Select :EstacionID)' +
              #10#10'If @Tipo = 0'#10'begin'#10'     SELECT'#10'           IDPRODUCTO, CODIGOPR' +
              'ODUCTO, NOMBRE, PRECIOVENTA, CLAVEPEMEX,'#10'           COSTO, STATU' +
              'S, BARRAS, CCCOMPRA, CCVENTA,'#10'           INVENTARIABLE, IDLINEA'#10 +
              '     FROM'#10'         dbo.Producto'#10'end'#10#10'If @Tipo = 1'#10'begin'#10'  SELECT' +
              #10'    P.IDPRODUCTO, CODIGOPRODUCTO, NOMBRE, PP.PRECIO as PrecioVe' +
              'nta, CLAVEPEMEX,'#10'    P.COSTO, STATUS, BARRAS, CCCOMPRA, CCVENTA,' +
              ' '#10'    INVENTARIABLE, IDLINEA'#10'  FROM'#10'    dbo.Producto P Left Join' +
              ' ProductoPrecio PP on P.IDPRODUCTO=PP.ProductoId'#10'  WHERE not ((C' +
              'LAVEPEMEX is null) or (CLAVEPEMEX = '#39#39')) and (PP.EstacionID = @E' +
              'stacionID)'#10'end'#10#10'    If @Tipo = 2'#10'    begin'#10'      SELECT'#10'        ' +
              'IDPRODUCTO, CODIGOPRODUCTO, NOMBRE, PRECIOVENTA, CLAVEPEMEX,'#10'   ' +
              '     COSTO, STATUS, BARRAS, CCCOMPRA, CCVENTA,'#10'        INVENTARI' +
              'ABLE, IDLINEA'#10'      FROM'#10'        dbo.Producto'#10'      WHERE ((CLAV' +
              'EPEMEX is null) or (CLAVEPEMEX = '#39#39')) and (INVENTARIABLE = 1)'#10'  ' +
              '  end'#10#10'        If @Tipo = 3'#10'        begin'#10'          SELECT'#10'     ' +
              '       IDPRODUCTO, CODIGOPRODUCTO, NOMBRE, PRECIOVENTA, CLAVEPEM' +
              'EX,'#10'            COSTO, STATUS, BARRAS, CCCOMPRA, CCVENTA,'#10'      ' +
              '      INVENTARIABLE, IDLINEA'#10'          FROM'#10'            dbo.Prod' +
              'ucto'#10'          WHERE ((ClavePemex is null) or (ClavePemex = '#39#39'))' +
              ' and (Inventariable = 0)'#10'        end'#10#10'            If @Tipo = 4'#10' ' +
              '           begin'#10'              select IDPRODUCTO, CODIGOPRODUCTO' +
              ', NOMBRE, (case'#10'                  when p.clavepemex is null then' +
              ' p.PrecioVenta'#10'                  when p.clavepemex = '#39#39' then p.P' +
              'recioVenta'#10'                  else'#10'                     (Select P' +
              'recio From ProductoPrecio p2 Where p2.ProductoID = p.IDPRODUCTO ' +
              'and EstacionID = @EstacionID)'#10'                  end) as PrecioVe' +
              'nta,'#10'                  ClavePemex, P.Costo, Status, Barras, CCCO' +
              'MPRA, CCVENTA,'#10'                  Inventariable, IDLINEA'#10'        ' +
              '      From Producto  P'#10'              WHERE Inventariable = 1'#10'   ' +
              '         end'#10#10'              If @Tipo = 5'#10'              begin'#10'   ' +
              '             select IDPRODUCTO, CODIGOPRODUCTO, Nombre, (case'#10'  ' +
              '                when p.clavepemex is null then p.PrecioVenta'#10'   ' +
              '               when p.clavepemex = '#39#39' then p.PrecioVenta'#10'       ' +
              '           else'#10'                     (Select Precio From Product' +
              'oPrecio p2 Where p2.ProductoID = p.IDPRODUCTO and EstacionID = @' +
              'EstacionID)'#10'                  end) as PrecioVenta,'#10'             ' +
              '     ClavePemex, P.Costo, Status, Barras, CCCOMPRA, CCVENTA,'#10'   ' +
              '               Inventariable, IDLINEA'#10'                From Produ' +
              'cto  P'#10'                WHERE not ClavePemex is null and ClavePem' +
              'ex<>'#39#39#10'              end'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDPRODUCTO'
                TableField = 'IDPRODUCTO'
              end
              item
                DatasetField = 'CODIGOPRODUCTO'
                TableField = 'CODIGOPRODUCTO'
              end
              item
                DatasetField = 'NOMBRE'
                TableField = 'NOMBRE'
              end
              item
                DatasetField = 'PRECIOVENTA'
                TableField = 'PRECIOVENTA'
              end
              item
                DatasetField = 'CLAVEPEMEX'
                TableField = 'CLAVEPEMEX'
              end
              item
                DatasetField = 'COSTO'
                TableField = 'COSTO'
              end
              item
                DatasetField = 'STATUS'
                TableField = 'STATUS'
              end
              item
                DatasetField = 'BARRAS'
                TableField = 'CCCOMPRA'
                SQLOrigin = 'BARRAS'
              end
              item
                DatasetField = 'CCCOMPRA'
                TableField = 'CCCOMPRA'
              end
              item
                DatasetField = 'CCVENTA'
                TableField = 'IEPS'
                SQLOrigin = 'CCVENTA'
              end
              item
                DatasetField = 'INVENTARIABLE'
                TableField = 'INVENTARIABLE'
              end
              item
                DatasetField = 'IDLINEA'
                TableField = 'IDLINEA'
              end>
          end>
        Name = 'Obtenproductoportipo'
        BusinessRulesClient.CompileOnServer = False
        BusinessRulesClient.RunOnClientAndServer = False
        Fields = <
          item
            Name = 'IDPRODUCTO'
            DataType = datInteger
          end
          item
            Name = 'CODIGOPRODUCTO'
            DataType = datString
            Size = 10
          end
          item
            Name = 'NOMBRE'
            DataType = datString
            Size = 150
          end
          item
            Name = 'PRECIOVENTA'
            DataType = datFloat
          end
          item
            Name = 'CLAVEPEMEX'
            DataType = datString
            Size = 50
          end
          item
            Name = 'COSTO'
            DataType = datFloat
          end
          item
            Name = 'STATUS'
            DataType = datBoolean
          end
          item
            Name = 'BARRAS'
            DataType = datString
            Size = 50
          end
          item
            Name = 'CCCOMPRA'
            DataType = datString
            Size = 20
          end
          item
            Name = 'CCVENTA'
            DataType = datBlob
          end
          item
            Name = 'INVENTARIABLE'
            DataType = datBoolean
          end
          item
            Name = 'IDLINEA'
            DataType = datInteger
          end>
      end
      item
        Params = <
          item
            Name = 'IDENCARGADOINGRESOS'
            DataType = datInteger
            Value = '7'
            ParamType = daptInput
          end
          item
            Name = 'IDINGRESO'
            DataType = datInteger
            Value = '6'
            ParamType = daptInput
          end
          item
            Name = 'IDAGRUPACION'
            DataType = datInteger
            Value = '3'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'INGRESOS'
            ConnectionType = 'MSSQL'
            Default = True
            TargetTable = 'dbo.ENCARGADOINGRESOS'
            SQL = 
              'INSERT INTO [dbo].[ENCARGADOINGRESOS]'#10'           ([IDENCARGADOIN' +
              'GRESOS]'#10'           ,[IDEMPLEADO]'#10'           ,[IDINGRESO]'#10'       ' +
              '    ,[OBSERVACIONES]'#10'           ,[IMPORTE]'#10'           ,[ENTREGAD' +
              'O]'#10'           ,[DIFERENCIA]'#10'           ,[IDAGRUPACION])'#10'     VAL' +
              'UES'#10'           (:IDENCARGADOINGRESOS,-1,:IDINGRESO,'#39'LIQUIDACION ' +
              'AUTOGENERADA'#39',0,0,0,:IDAGRUPACION)'#10'           '#10'SELECT '#39'ENCARGADO' +
              ' INGRESO OK'#39' AS RESULT'
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'spAbreAgrupaciones'
        BusinessRulesClient.CompileOnServer = False
        BusinessRulesClient.RunOnClientAndServer = False
        Fields = <
          item
            Name = 'RESULT'
            DataType = datString
            Size = 20
          end>
      end>
    JoinDataTables = <>
    UnionDataTables = <>
    Commands = <
      item
        Params = <
          item
            Name = 'DetalleFacturaID'
            Value = ''
          end
          item
            Name = 'Cantidad'
            Value = ''
          end
          item
            Name = 'Precio'
            Value = ''
          end
          item
            Name = 'Importe'
            Value = ''
          end
          item
            Name = 'ItemNo'
            Value = ''
          end
          item
            Name = 'FacturaID'
            Value = ''
          end
          item
            Name = 'ProductoID'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            SQL = 
              'insert into'#10'  dbo.DetalleFactura'#10'  (DetalleFacturaID, Cantidad, ' +
              'Precio, Importe, ItemNo, FacturaID, ProductoID)'#10'  values'#10'  (:Det' +
              'alleFacturaID, :Cantidad, :Precio, :Importe, :ItemNo, :FacturaID' +
              ', :ProductoID)'#10#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'spInsertarDetalleFactura'
      end
      item
        Params = <
          item
            Name = 'FacturaID'
            Value = ''
          end
          item
            Name = 'Folio'
            Value = ''
          end
          item
            Name = 'Serie'
            Value = ''
          end
          item
            Name = 'Fecha'
            Value = ''
          end
          item
            Name = 'Ejercicio'
            Value = ''
          end
          item
            Name = 'Periodo'
            Value = ''
          end
          item
            Name = 'Dia'
            Value = ''
          end
          item
            Name = 'Subtotal'
            Value = ''
          end
          item
            Name = 'Impuesto'
            Value = ''
          end
          item
            Name = 'Total'
            Value = ''
          end
          item
            Name = 'ImpuestoPorcentaje'
            Value = ''
          end
          item
            Name = 'ClienteID'
            Value = ''
          end
          item
            Name = 'FormaPagoID'
            Value = ''
          end
          item
            Name = 'UsuarioID'
            Value = ''
          end
          item
            Name = 'NumeroEstacion'
            Value = ''
          end
          item
            Name = 'IDCondicionPago'
            Value = ''
          end
          item
            Name = 'MetodoPago'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            SQL = 
              'insert into dbo.Factura'#10'   (FacturaID, Folio, Serie, Fecha, Ejer' +
              'cicio, Periodo, Dia, Subtotal, Impuesto,'#10'    Total, ImpuestoPorc' +
              'entaje, Cancelada, ClienteID, FormaPagoID, UsuarioID, NumeroEsta' +
              'cion,'#10'    IDCondicionPago, MetodoPago)'#10'    Values'#10'    (:FacturaI' +
              'D, :Folio, :Serie, :Fecha, :Ejercicio, :Periodo, :Dia, :Subtotal' +
              ', :Impuesto,'#10'     :Total, :ImpuestoPorcentaje, 0, :ClienteID,:Fo' +
              'rmaPagoID, :UsuarioID, :NumeroEstacion,'#10'     :IDCondicionPago, :' +
              'MetodoPago)'#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'spInsertarFactura'
      end
      item
        Params = <
          item
            Name = 'IDSTATUS'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'CODIGO'
            DataType = datString
            Size = 10
            Value = ''
          end
          item
            Name = 'NOMBRE'
            DataType = datString
            Size = 50
            Value = ''
          end>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            TargetTable = 'dbo.STATUS'
            SQL = 
              'INSERT'#10'  INTO dbo.STATUS'#10'    (IDSTATUS, CODIGO, NOMBRE)'#10'  VALUES' +
              #10'    (:IDSTATUS, :CODIGO, :NOMBRE)'
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'Insert_dbo STATUS'
      end
      item
        Params = <
          item
            Name = 'OpcionID'
            Value = ''
          end
          item
            Name = 'UsuarioID'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            SQL = 
              'INSERT'#10'  INTO Acceso'#10'    (OpcionID, UsuarioID)'#10'  VALUES'#10'    (:Op' +
              'cionID, :UsuarioID)'#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'AccesosInsertar'
      end
      item
        Params = <
          item
            Name = 'FacturaID'
            Value = ''
          end
          item
            Name = 'FacturaElectornicaID'
            Value = ''
          end
          item
            Name = 'CadenaOriginal'
            Value = ''
          end
          item
            Name = 'SelloDigital'
            Value = ''
          end
          item
            Name = 'Vigencia'
            Value = ''
          end
          item
            Name = 'Enviado'
            Value = ''
          end
          item
            Name = 'NoCertificado'
            Value = ''
          end
          item
            Name = 'Noaprobacion'
            Value = ''
          end
          item
            Name = 'FechaAprobacion'
            Value = ''
          end
          item
            Name = 'XMLCFD'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            SQL = 
              'DECLARE @CONT INT'#10#10'SELECT @CONT = (SELECT 0)'#10#10'SELECT @CONT = (SE' +
              'LECT COUNT(*) FROM DBO.FACTURAELECTRONICA WHERE DBO.FACTURAELECT' +
              'RONICA.FACTURAID = :FacturaID)'#10#10'IF @CONT = 0'#10'BEGIN'#10'insert into'#10' ' +
              '  dbo.FacturaElectronica'#10'  (FacturaElectornicaID, CadenaOriginal' +
              ', SelloDigital, FacturaID, Vigencia, Enviado, NoCertificado, Noa' +
              'probacion, FechaAprobacion,'#10'   CFDIUUID, CFDISerieCertificadoSAT' +
              ', CFDIFechaTimbrado, CFDISelloDigitalEmisorCFDI, CFDISelloDigita' +
              'lSAT, XMLCFD, XMLCFDI)'#10'   values'#10'  (:FacturaElectornicaID, :Cade' +
              'naOriginal, :SelloDigital, :FacturaID, :Vigencia, :Enviado, :NoC' +
              'ertificado, :Noaprobacion, :FechaAprobacion,'#10'   '#39#39', '#39#39', '#39#39', '#39#39', ' +
              #39#39', :XMLCFD, '#39#39')'#10'END'#10#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'spInsertaFCTELECTRONICA'
      end
      item
        Params = <
          item
            Name = 'IDVALORMONEDA'
            Value = ''
          end
          item
            Name = 'IDMONEDA'
            Value = ''
          end
          item
            Name = 'VALOR'
            Value = ''
          end
          item
            Name = 'NUMEROESTACION'
            Value = ''
          end
          item
            Name = 'FECHA'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            SQL = 
              'insert into'#10'  dbo.VALORMONEDA'#10'  (IDVALORMONEDA, IDMONEDA, VALOR,' +
              ' NUMEROESTACION, FECHA)'#10'  values'#10'  (:IDVALORMONEDA, :IDMONEDA, :' +
              'VALOR, :NUMEROESTACION, :FECHA)'#10#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'ActualizaTipoCambio'
      end
      item
        Params = <
          item
            Name = 'UsuarioID'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            SQL = 'DELETE'#10'  FROM'#10'    Acceso'#10'  WHERE'#10'    UsuarioID = :UsuarioID'#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'AccesosEliminar'
      end
      item
        Params = <
          item
            Name = 'OLD_IDSTATUS'
            DataType = datInteger
            Value = ''
          end>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            TargetTable = 'dbo.STATUS'
            SQL = 
              'DELETE '#10'  FROM'#10'    dbo.STATUS'#10'  WHERE'#10'    (IDSTATUS = :OLD_IDSTA' +
              'TUS)'
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'Delete_dbo STATUS'
      end
      item
        Params = <
          item
            Name = 'IDSTATUS'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'CODIGO'
            DataType = datString
            Size = 10
            Value = ''
          end
          item
            Name = 'NOMBRE'
            DataType = datString
            Size = 50
            Value = ''
          end
          item
            Name = 'OLD_IDSTATUS'
            DataType = datInteger
            Value = ''
          end>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            TargetTable = 'dbo.STATUS'
            SQL = 
              'UPDATE dbo.STATUS'#10'  SET '#10'    IDSTATUS = :IDSTATUS, '#10'    CODIGO =' +
              ' :CODIGO, '#10'    NOMBRE = :NOMBRE'#10'  WHERE'#10'    (IDSTATUS = :OLD_IDS' +
              'TATUS)'
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'Update_dbo STATUS'
      end
      item
        Params = <
          item
            Name = 'ReporteID'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'Nombre'
            DataType = datString
            Size = 50
            Value = ''
          end
          item
            Name = 'Tipo'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'Parametros'
            DataType = datString
            Size = 10
            Value = ''
          end
          item
            Name = 'Template'
            DataType = datMemo
            Value = ''
          end
          item
            Name = 'TemplateMedia'
            DataType = datMemo
            Value = ''
          end
          item
            Name = 'TemplateBaja'
            DataType = datMemo
            Value = ''
          end
          item
            Name = 'TemplateExportar'
            DataType = datMemo
            Value = ''
          end
          item
            Name = 'SQL1'
            DataType = datMemo
            Value = ''
          end
          item
            Name = 'SQL2'
            DataType = datMemo
            Value = ''
          end
          item
            Name = 'CampoJoin'
            DataType = datString
            Size = 30
            Value = ''
          end
          item
            Name = 'IdentificadorID'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'Usuarios'
            DataType = datString
            Size = 80
            Value = ''
          end>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            TargetTable = 'dbo.Reporte'
            SQL = 
              'INSERT'#10'  INTO dbo.Reporte'#10'    (ReporteID, Nombre, Tipo, Parametr' +
              'os, Template, TemplateMedia, '#10'     TemplateBaja, TemplateExporta' +
              'r, SQL1, SQL2, CampoJoin, '#10'     IdentificadorID, Usuarios)'#10'  VAL' +
              'UES'#10'    (:ReporteID, :Nombre, :Tipo, :Parametros, :Template, '#10'  ' +
              '   :TemplateMedia, :TemplateBaja, :TemplateExportar, :SQL1, '#10'   ' +
              '  :SQL2, :CampoJoin, :IdentificadorID, :Usuarios)'
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'Insert_dbo Reporte'
      end
      item
        Params = <
          item
            Name = 'OLD_ReporteID'
            DataType = datInteger
            Value = ''
          end>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            TargetTable = 'dbo.Reporte'
            SQL = 
              'DELETE '#10'  FROM'#10'    dbo.Reporte'#10'  WHERE'#10'    (ReporteID = :OLD_Rep' +
              'orteID)'
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'Delete_dbo Reporte'
      end
      item
        Params = <
          item
            Name = 'ReporteID'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'Nombre'
            DataType = datString
            Size = 50
            Value = ''
          end
          item
            Name = 'Tipo'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'Parametros'
            DataType = datString
            Size = 10
            Value = ''
          end
          item
            Name = 'Template'
            DataType = datMemo
            Value = ''
          end
          item
            Name = 'TemplateMedia'
            DataType = datMemo
            Value = ''
          end
          item
            Name = 'TemplateBaja'
            DataType = datMemo
            Value = ''
          end
          item
            Name = 'TemplateExportar'
            DataType = datMemo
            Value = ''
          end
          item
            Name = 'SQL1'
            DataType = datMemo
            Value = ''
          end
          item
            Name = 'SQL2'
            DataType = datMemo
            Value = ''
          end
          item
            Name = 'CampoJoin'
            DataType = datString
            Size = 30
            Value = ''
          end
          item
            Name = 'IdentificadorID'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'Usuarios'
            DataType = datString
            Size = 80
            Value = ''
          end
          item
            Name = 'OLD_ReporteID'
            DataType = datInteger
            Value = ''
          end>
        Statements = <
          item
            Connection = 'INGRESOS'
            Default = True
            TargetTable = 'dbo.Reporte'
            SQL = 
              'UPDATE dbo.Reporte'#10'  SET '#10'    ReporteID = :ReporteID, '#10'    Nombr' +
              'e = :Nombre, '#10'    Tipo = :Tipo, '#10'    Parametros = :Parametros, '#10 +
              '    Template = :Template, '#10'    TemplateMedia = :TemplateMedia, '#10 +
              '    TemplateBaja = :TemplateBaja, '#10'    TemplateExportar = :Templ' +
              'ateExportar, '#10'    SQL1 = :SQL1, '#10'    SQL2 = :SQL2, '#10'    CampoJoi' +
              'n = :CampoJoin, '#10'    IdentificadorID = :IdentificadorID, '#10'    Us' +
              'uarios = :Usuarios'#10'  WHERE'#10'    (ReporteID = :OLD_ReporteID)'
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'Update_dbo Reporte'
      end>
    RelationShips = <
      item
        Name = 'FK_dbo MATERIA_dbo MATERIA'
        MasterFields = 'IDMATERIA'
        DetailFields = 'SERIADACON'
        RelationshipType = rtForeignKey
      end
      item
        Name = 'FK_Obtenproductoportipo_Obtenproductoportipo'
        MasterDatasetName = 'Obtenproductoportipo'
        DetailDatasetName = 'Obtenproductoportipo'
        RelationshipType = rtForeignKey
      end>
    UpdateRules = <>
    Version = 0
    BusinessRulesServer.ScriptLanguageStr = 'JavaScript'
    Left = 32
    Top = 64
  end
  object bpReporte: TDABusinessProcessor
    Schema = Schema
    InsertCommandName = 'Insert_dbo Reporte'
    DeleteCommandName = 'Delete_dbo Reporte'
    UpdateCommandName = 'Update_dbo Reporte'
    ReferencedDataset = 'dbo Reporte'
    ProcessorOptions = []
    UpdateMode = updWhereKeyOnly
    Left = 112
    Top = 8
  end
  object DataStreamer: TDABin2DataStreamer
    Left = 32
    Top = 8
  end
end
