object ServiceGauss: TServiceGauss
  OldCreateOrder = True
  SessionManager = ServerDataModule.SessionManager
  ServiceSchema = Schema
  ServiceDataStreamer = DataStreamer
  ExportedDataTables = <>
  Height = 300
  Width = 342
  object Schema: TDASchema
    ConnectionManager = ServerDataModule.ConnectionManager
    Datasets = <
      item
        Params = <
          item
            Name = 'Identificador'
            Value = '1'
            ParamType = daptInput
          end
          item
            Name = 'ClienteID'
            Value = '1'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            SQL = 
              'SELECT     dbo.Cliente.Nombre, dbo.Cliente.RazonSocial, dbo.Clie' +
              'nte.RFC, dbo.Cliente.Estatus, dbo.Cliente.FormaCompraID, dbo.Cli' +
              'ente.CuentaContable,'#10'                      dbo.Cliente.LimiteCre' +
              'dito, ISNULL(SUM(dbo.Autorizacion.Importe), 0) AS Importe, ISNUL' +
              'L(SUM(dbo.Autorizacion.Cantidad), 0)'#10'                      AS Vo' +
              'lumen, dbo.FormaCompra.Nombre AS NombreFormaCompra'#10'FROM         ' +
              'dbo.Cliente INNER JOIN'#10'                      dbo.FormaCompra ON ' +
              'dbo.Cliente.FormaCompraID = dbo.FormaCompra.FormaCompraID LEFT O' +
              'UTER JOIN'#10'                      dbo.Autorizacion ON dbo.Cliente.' +
              'GasolineroID = dbo.Autorizacion.GasolineroID AND'#10'               ' +
              '       dbo.Cliente.ClienteID = dbo.Autorizacion.ClienteID'#10'GROUP ' +
              'BY dbo.Cliente.Nombre, dbo.Cliente.RazonSocial, dbo.Cliente.RFC,' +
              ' dbo.Cliente.Estatus, dbo.Cliente.FormaCompraID, dbo.Cliente.Cue' +
              'ntaContable,'#10'                      dbo.Cliente.LimiteCredito, db' +
              'o.Cliente.GasolineroID, dbo.Cliente.ClienteID, dbo.FormaCompra.N' +
              'ombre'#10'HAVING      (dbo.Cliente.GasolineroID = :Identificador) AN' +
              'D (dbo.Cliente.ClienteID = :ClienteID)'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'Nombre'
                TableField = 'Nombre'
              end
              item
                DatasetField = 'RazonSocial'
                TableField = 'RazonSocial'
              end
              item
                DatasetField = 'RFC'
                TableField = 'RFC'
              end
              item
                DatasetField = 'Estatus'
                TableField = 'Estatus'
              end
              item
                DatasetField = 'FormaCompraID'
                TableField = 'FormaCompraID'
              end
              item
                DatasetField = 'CuentaContable'
                TableField = 'CuentaContable'
              end
              item
                DatasetField = 'LimiteCredito'
                TableField = 'LimiteCredito'
              end
              item
                DatasetField = 'Importe'
                TableField = 'Importe'
              end
              item
                DatasetField = 'Volumen'
                TableField = 'Volumen'
              end
              item
                DatasetField = 'NombreFormaCompra'
                TableField = 'NombreFormaCompra'
              end>
          end>
        Name = 'ValidarCliAutorizaciones'
        Fields = <
          item
            Name = 'Nombre'
            DataType = datString
            Size = 70
          end
          item
            Name = 'RazonSocial'
            DataType = datString
            Size = 70
          end
          item
            Name = 'RFC'
            DataType = datString
            Size = 20
          end
          item
            Name = 'Estatus'
            DataType = datString
            Size = 1
          end
          item
            Name = 'FormaCompraID'
            DataType = datInteger
          end
          item
            Name = 'CuentaContable'
            DataType = datString
            Size = 15
          end
          item
            Name = 'LimiteCredito'
            DataType = datFloat
          end
          item
            Name = 'Importe'
            DataType = datFloat
          end
          item
            Name = 'Volumen'
            DataType = datFloat
          end
          item
            Name = 'NombreFormaCompra'
            DataType = datString
            Size = 50
          end>
      end
      item
        Params = <
          item
            Name = 'ClienteIni'
            Value = '1'
            ParamType = daptInput
          end
          item
            Name = 'ClienteFin'
            Value = '1'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            SQL = 
              'declare @ClienteIni as INT'#10'declare @ClienteFin as INT'#10#10'select @C' +
              'lienteIni = (select :ClienteIni)'#10'select @ClienteFin = (select :C' +
              'lienteFin)'#10#10'SELECT     A.ClienteID, A.Nombre, CAST(A.LimiteCredi' +
              'to AS money) AS Limite, CAST(ISNULL(B.Importe, 0) AS money) AS C' +
              'onsumosPendientes,'#10#9'   CAST(ISNULL(F.Cupones, 0) AS money) AS Cu' +
              'ponesPendientes,'#10'                      CAST(A.Moviminetos AS mon' +
              'ey) AS Movimientos, CAST(A.LimiteCredito - ISNULL(B.Importe, 0) ' +
              '- A.Moviminetos - F.Cupones AS money) AS Saldo'#10'FROM         (SEL' +
              'ECT     Cliente.ClienteID, Cliente.Nombre, Cliente.LimiteCredito' +
              ', ISNULL(SUM(Movimiento.Cargo - Movimiento.Abono), 0) AS Movimin' +
              'etos'#10'              FROM          Cliente LEFT OUTER JOIN'#10'       ' +
              '                     Movimiento ON Cliente.ClienteID = Movimient' +
              'o.ClienteID'#10'              WHERE      (Cliente.ClienteID BETWEEN ' +
              '@ClienteIni AND @ClienteFin)'#10'              GROUP BY Cliente.Clie' +
              'nteID, Cliente.Nombre, Cliente.LimiteCredito) AS A LEFT OUTER JO' +
              'IN'#10'                         (SELECT     Cliente_1.ClienteID, ISN' +
              'ULL(SUM(Consumo.Importe), 0) AS Importe'#10'                        ' +
              '  FROM          Cliente AS Cliente_1 INNER JOIN'#10'                ' +
              '                        Consumo ON Cliente_1.ClienteID = Consumo' +
              '.ClienteID'#10'                          WHERE      (Cliente_1.Clien' +
              'teID BETWEEN @ClienteIni AND @ClienteFin) AND (Consumo.Facturado' +
              ' = 0)'#10'                          GROUP BY Cliente_1.ClienteID) AS' +
              ' B ON A.ClienteID = B.ClienteID INNER JOIN (SELECT     Cliente.C' +
              'lienteID, ISNULL(D.Importe, 0) AS Cupones'#10'FROM         (SELECT  ' +
              '   ClienteID, SUM(Importe) AS Importe'#10'                       FRO' +
              'M          Cupon'#10'                       WHERE      (Status = '#39'A'#39 +
              ') AND (ClienteID BETWEEN @ClienteIni AND @ClienteFin)'#10'          ' +
              '             GROUP BY ClienteID) D RIGHT OUTER JOIN'#10'            ' +
              '          Cliente ON D.ClienteID = Cliente.ClienteID'#10'WHERE     (' +
              'Cliente.ClienteID BETWEEN @ClienteIni AND @ClienteFin)) F ON A.C' +
              'lienteID = F.ClienteID'#10'ORDER BY A.ClienteID'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'ClienteID'
                TableField = 'ClienteID'
              end
              item
                DatasetField = 'Nombre'
                TableField = 'Nombre'
              end
              item
                DatasetField = 'Limite'
                TableField = 'Limite'
              end
              item
                DatasetField = 'ConsumosPendientes'
                TableField = 'ConsumosPendientes'
              end
              item
                DatasetField = 'Movimientos'
                TableField = 'Movimientos'
              end
              item
                DatasetField = 'Saldo'
                TableField = 'Saldo'
              end
              item
                DatasetField = 'CuponesPendientes'
                TableField = 'CuponesPendientes'
              end>
          end>
        Name = 'ValidarTarSaldoEjercicio'
        Fields = <
          item
            Name = 'ClienteID'
            DataType = datInteger
          end
          item
            Name = 'Nombre'
            DataType = datString
            Size = 70
          end
          item
            Name = 'Limite'
            DataType = datCurrency
          end
          item
            Name = 'ConsumosPendientes'
            DataType = datCurrency
          end
          item
            Name = 'CuponesPendientes'
            DataType = datCurrency
          end
          item
            Name = 'Movimientos'
            DataType = datCurrency
          end
          item
            Name = 'Saldo'
            DataType = datCurrency
          end>
      end
      item
        Params = <
          item
            Name = 'Identificador'
            Value = '1'
            ParamType = daptInput
          end
          item
            Name = 'TarjetaID'
            Value = '1'
            ParamType = daptInput
          end
          item
            Name = 'ClienteID'
            Value = '1'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            SQL = 
              'SELECT     SUM(Cantidad) AS Volumen, SUM(Importe) AS Importe'#10'FRO' +
              'M         dbo.Autorizacion'#10'WHERE     (GasolineroID = :Identifica' +
              'dor) AND (VehiculoID = :TarjetaID) AND (ClienteID = :ClienteID)'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'Volumen'
                TableField = 'Volumen'
              end
              item
                DatasetField = 'Importe'
                TableField = 'Importe'
              end>
          end>
        Name = 'ValidarTarAutorizaciones'
        Fields = <
          item
            Name = 'Volumen'
            DataType = datFloat
          end
          item
            Name = 'Importe'
            DataType = datFloat
          end>
      end
      item
        Params = <
          item
            Name = 'ClienteID'
            Value = ''
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            SQL = 
              'Select VehiculoID,Identificacion from Vehiculo Where ClienteID=:' +
              'ClienteID'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'VehiculoID'
                TableField = 'VehiculoID'
              end
              item
                DatasetField = 'Identificacion'
                TableField = 'Identificacion'
              end>
          end>
        Name = 'spVehi'
        Fields = <
          item
            Name = 'VehiculoID'
            DataType = datInteger
          end
          item
            Name = 'Identificacion'
            DataType = datString
            Size = 30
          end>
      end
      item
        Params = <
          item
            Name = 'FacturaID'
            Value = '25'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            Name = 'Flotillas'
            SQL = 
              'DECLARE @CAD AS VARCHAR(4000)'#10'DECLARE @SUCURSAL AS INT'#10'DECLARE @' +
              'NOAPROBFCTELECT AS INT'#10'DECLARE @NOAPROBACION AS INT'#10#10'SELECT @CAD' +
              ' = (SELECT '#39#39')'#10#10'SELECT @NOAPROBACION = (SELECT CONFIGURACION.NOA' +
              'PROBACION FROM CONFIGURACION)'#10'SELECT @NOAPROBFCTELECT = ISNULL((' +
              'SELECT NOAPROBACION FROM FACTURAELECTRONICA WHERE FACTURAELECTRO' +
              'NICA.FACTURAID = :FACTURAID),0)'#10#10'IF @NOAPROBFCTELECT > 0'#10'   SELE' +
              'CT @NOAPROBACION = (SELECT @NOAPROBFCTELECT)'#10#10'SELECT FACTURA.SER' +
              'IE,RTRIM(CAST(FACTURA.FOLIO AS VARCHAR(50))) AS FOLIO,'#10'       LE' +
              'FT(CONVERT(VARCHAR, FACTURA.FECHA, 120), 10)+'#10'       '#39'T'#39'+'#10#10'     ' +
              '  Substring(convert(varchar, FACTURA.FECHA, 14),1,8) AS FECHA,LT' +
              'RIM(CAST(@NOAPROBFCTELECT AS VARCHAR (10))) AS NOAPROBACION,'#10'   ' +
              '    CAST(YEAR(CONFIGURACION.ANOAPROBACION) AS VARCHAR(4)) AS ANO' +
              'APROBACION, FORMAPAGO.DESCRIPCION AS FORMAPAGO,'#10'       CONVERT(V' +
              'ARCHAR,CONVERT(MONEY,FACTURA.SUBTOTAL),0) AS SUBTOTAL,CONVERT(VA' +
              'RCHAR,CONVERT(MONEY,FACTURA.TOTAL),0) AS TOTAL,'#10'       CONFIGURA' +
              'CION.RFC AS RFCEMISOR, CONFIGURACION.ESCUELA AS NOMEMPRESAEMISOR' +
              ', CONFIGURACION.DIRECCION AS DOMEMISOR, ISNULL(CONFIGURACION.NOE' +
              'XTERIOR,'#39#39') NOEXTERIOREMISOR,'#10'       ISNULL(CONFIGURACION.COLONI' +
              'A,'#39#39') AS COLONIAEMISOR,ISNULL(CONFIGURACION.MUNICIPIO,'#39#39') AS MUN' +
              'ICIPIOEMISOR,ISNULL(CONFIGURACION.ESTADO,'#39#39') AS ESTADOEMISOR,'#10'  ' +
              '     ISNULL(CONFIGURACION.PAIS,'#39#39') AS PAISEMISOR,ISNULL(CONFIGUR' +
              'ACION.CODIGOPOSTAL,'#39#39') AS CODIGOPOSTALEMISOR,'#10'       ISNULL(ALUM' +
              'NO.RFC,'#39#39') AS RFCRECEPTOR, ISNULL(ALUMNO.FACTURANOMBRE,'#39#39') AS NO' +
              'MBREEMPRECEPTOR, ISNULL(ALUMNO.FACTURADOMICILIO,'#39#39') AS DOMICILIO' +
              'RECEPTOR, ISNULL(ALUMNO.NOEXTERIOR,'#39#39') AS NOEXTERIORRECEPTOR,'#10'  ' +
              '     ISNULL(ALUMNO.COLONIA,'#39#39') AS COLONIARECEPTOR,ISNULL(ALUMNO.' +
              'LOCALIDAD,'#39#39') AS LOCALIDADRECEPTOR,ISNULL(ALUMNO.MUNICIPIO,'#39#39') A' +
              'S MUNICIPIORECEPTOR,'#10'       ISNULL(ALUMNO.ESTADO,'#39#39') AS ESTADORE' +
              'CEPTOR,ISNULL(ALUMNO.PAIS,'#39#39') AS PAISRECEPTOR,ISNULL(CAST(ALUMNO' +
              '.CODIGOPOSTAL AS VARCHAR(20)),'#39#39') AS CODIGOPOSTALRECEPTOR,'#10'     ' +
              '  ISNULL(ALUMNO.EMAIL,'#39#39') AS EMAIL'#10'FROM FACTURA INNER JOIN ALUMN' +
              'O ON ALUMNO.IDALUMNO = FACTURA.CLIENTEID'#10'INNER JOIN CONFIGURACIO' +
              'N ON CONFIGURACION.CICLOACTUAL = CONFIGURACION.CICLOACTUAL'#10'INNER' +
              ' JOIN FORMAPAGO ON FACTURA.FORMAPAGOID = FORMAPAGO.FORMAPAGOID'#10'W' +
              'HERE FACTURAID = :FACTURAID'#10
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
            Size = 20
          end
          item
            Name = 'NOMBREEMPRECEPTOR'
            DataType = datString
            Size = 70
          end
          item
            Name = 'DOMICILIORECEPTOR'
            DataType = datString
            Size = 70
          end
          item
            Name = 'NOEXTERIORRECEPTOR'
            DataType = datString
            Size = 20
          end
          item
            Name = 'COLONIARECEPTOR'
            DataType = datString
            Size = 40
          end
          item
            Name = 'LOCALIDADRECEPTOR'
            DataType = datString
            Size = 50
          end
          item
            Name = 'MUNICIPIORECEPTOR'
            DataType = datString
            Size = 50
          end
          item
            Name = 'ESTADORECEPTOR'
            DataType = datString
            Size = 50
          end
          item
            Name = 'PAISRECEPTOR'
            DataType = datString
            Size = 50
          end
          item
            Name = 'CODIGOPOSTALRECEPTOR'
            DataType = datString
            Size = 20
          end
          item
            Name = 'EMAIL'
            DataType = datString
            Size = 40
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            Name = 'Flotillas'
            SQL = 
              'SELECT DOMICILIO=ISNULL(DIRECCION,'#39#39'),NOEXTERIOR=ISNULL(NOEXTERI' +
              'OR,'#39#39'),COLONIA=ISNULL(COLONIA,'#39#39'),LOCALIDAD=ISNULL(LOCALIDAD,'#39#39')' +
              ','#10'             MUNICIPIO=ISNULL(MUNICIPIO,'#39#39'),ESTADO=ISNULL(ESTA' +
              'DO,'#39#39'),PAIS=ISNULL(PAIS,'#39#39'),CODIGOPOSTAL=ISNULL(CODIGOPOSTAL,'#39#39')' +
              ','#10'             ISNULL(SUCURSAL,0) AS SUCURSAL'#10'FROM CONFIGURACION' +
              #10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'DOMICILIO'
                TableField = 'DOMICILIO'
              end
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
                DatasetField = 'SUCURSAL'
                TableField = 'SUCURSAL'
              end>
          end>
        Name = 'spDatosCadenaExpedidoEn'
        Fields = <
          item
            Name = 'DOMICILIO'
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
          end
          item
            Name = 'SUCURSAL'
            DataType = datBoolean
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
            Connection = 'GAUSS'
            Default = True
            Name = 'Flotillas'
            SQL = 
              'SELECT DETALLEFACTURA.PRODUCTOID, DETALLEFACTURA.IMPORTE, DETALL' +
              'EFACTURA.CANTIDAD,'#10'       DETALLEFACTURA.PRECIO, PRODUCTO.NOMBRE' +
              ' AS DESCRIPCION FROM DETALLEFACTURA INNER JOIN'#10'       PRODUCTO O' +
              'N PRODUCTO.PRODUCTOID = DETALLEFACTURA.PRODUCTOID'#10'WHERE DETALLEF' +
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
            Connection = 'GAUSS'
            Default = True
            Name = 'Flotillas'
            SQL = 
              'SELECT SUM(CANTIDAD * PRODUCTO.IEPS) AS IEPS, IEPS AS TASAIEPS'#10'F' +
              'ROM FACTURA'#10'INNER JOIN DETALLEFACTURA ON DETALLEFACTURA.FACTURAI' +
              'D = FACTURA.FACTURAID'#10'INNER JOIN PRODUCTO ON PRODUCTO.PRODUCTOID' +
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
            Connection = 'GAUSS'
            Default = True
            Name = 'Flotillas'
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
        Params = <
          item
            Name = 'idhistorialgrupo'
            Value = '1'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
            SQL = 
              'DECLARE @CUPO INT'#10#10'SELECT @CUPO = (SELECT COUNT(*) AS CUPO'#10'FROM ' +
              'HISTORIALALUMNO'#10'INNER JOIN HISTORIALGRUPO ON (HISTORIALALUMNO.ID' +
              'HISTORIALGRUPO = HISTORIALGRUPO.IDHISTORIALGRUPO)'#10'INNER JOIN CON' +
              'FIGURACION ON (HISTORIALGRUPO.IDCICLO = CONFIGURACION.CICLOACTUA' +
              'L)'#10'WHERE historialalumno.idhistorialgrupo = :idhistorialgrupo'#10'GR' +
              'OUP BY HISTORIALALUMNO.IDHISTORIALGRUPO)'#10#10'SELECT @CUPO AS CUPO'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'CUPO'
                TableField = 'CUPO'
              end>
          end>
        Name = 'spCupo'
        Fields = <
          item
            Name = 'CUPO'
            DataType = datInteger
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            Name = 'Flotillas'
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
            Connection = 'GAUSS'
            Default = True
            Name = 'Flotillas'
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
            Connection = 'GAUSS'
            Default = True
            Name = 'Flotillas'
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
            Connection = 'GAUSS'
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
            Connection = 'GAUSS'
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
            Connection = 'GAUSS'
            SQL = 
              'DECLARE @Campo AS VARCHAR(25)'#10'DECLARE @Serie AS VARCHAR(5)'#10#10'SELE' +
              'CT @Campo = :Campo'#10'SELECT @Serie = :Serie'#10#10'SELECT Folio'#10'FROM Fol' +
              'io'#10'WHERE (UPPER(Campo) = UPPER(@Campo)) AND (UPPER(Serie) = UPPE' +
              'R(@Serie))'#10#10'UPDATE Folio'#10'SET Folio = Folio + 1'#10'WHERE (UPPER(Camp' +
              'o) = UPPER(@Campo)) AND (UPPER(Serie) = UPPER(@Serie))'#10#10
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
            Connection = 'GAUSS'
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
            Connection = 'GAUSS'
            Default = True
            Name = 'Flotillas'
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
            Connection = 'GAUSS'
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
            Connection = 'GAUSS'
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
            Value = '1'
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
            SQL = 
              'SELECT MATERIA.CODIGO, MATERIA.NOMBRE, MAESTROMATERIA.IDMAESTRO,' +
              ' MAESTROMATERIA.IDMATERIA'#10'FROM MATERIA'#10'INNER JOIN MAESTROMATERIA' +
              ' ON MAESTROMATERIA.IDMATERIA = MATERIA.IDMATERIA'#10'WHERE MAESTROMA' +
              'TERIA.IDMAESTRO = :IDMAESTRO'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'CODIGO'
                TableField = 'CODIGO'
              end
              item
                DatasetField = 'NOMBRE'
                TableField = 'NOMBRE'
              end
              item
                DatasetField = 'IDMAESTRO'
                TableField = 'IDMAESTRO'
              end
              item
                DatasetField = 'IDMATERIA'
                TableField = 'IDMATERIA'
              end>
          end>
        Name = 'spMateriasMaestro'
        Fields = <
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
            Name = 'IDMAESTRO'
            DataType = datInteger
          end
          item
            Name = 'IDMATERIA'
            DataType = datInteger
          end>
      end
      item
        Params = <
          item
            Name = 'IDCAJA'
            Value = '1'
            ParamType = daptInput
          end
          item
            Name = 'IDEMPLEADO'
            Value = '1'
            ParamType = daptInput
          end
          item
            Name = 'OBSERVACIONES'
            Value = 'SS'
            ParamType = daptInput
          end
          item
            Name = 'IMPORTE'
            Value = '1'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
            SQL = 
              'DECLARE @OK INT'#10'DECLARE @IMPORTE FLOAT'#10#10'DECLARE @RESULTADO INT'#10#10 +
              'SET @RESULTADO = -1'#10#10'  SET @OK = (SELECT COUNT(*) FROM CAJA WHER' +
              'E IDCAJA = :IDCAJA AND STATUS = '#39'P'#39')'#10#10'  IF (@OK > 0)'#10'  BEGIN'#10#10'  ' +
              '  SET @IMPORTE = (SELECT SUM(IMPORTE + INTERES) FROM PAGO'#10'    WH' +
              'ERE IDPAGO IN (SELECT IDPAGO FROM PAGOCAJA WHERE IDCAJA = :IDCAJ' +
              'A))'#10#10'    UPDATE CAJA'#10'    SET'#10'      STATUS = '#39'C'#39','#10'      IDEMPLEAD' +
              'O = :IDEMPLEADO,'#10'      OBSERVACIONES = :OBSERVACIONES,'#10'      FEC' +
              'HA = GETDATE(),'#10'      IMPORTE = :IMPORTE'#10'    WHERE'#10'    IDCAJA = ' +
              ':IDCAJA'#10#10'    UPDATE'#10'      PAGO'#10'    SET'#10'      STATUS = '#39'D'#39','#10'     ' +
              ' IDEMPLEADO = :IDEMPLEADO,'#10'      FECHAPAGO = NULL'#10'    WHERE'#10'    ' +
              '  IDPAGO IN (SELECT IDPAGO FROM PAGOCAJA WHERE IDCAJA = :IDCAJA)' +
              #10#10'    DELETE FROM PAGOCAJA'#10'    WHERE IDCAJA = :IDCAJA'#10'    '#10'    S' +
              'ET @RESULTADO = 1'#10'  END'#10'  '#10'  SELECT @RESULTADO AS RESULTADO'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'RESULTADO'
                TableField = 'RESULTADO'
              end>
          end>
        Name = 'spCancelaCaja'
        Fields = <
          item
            Name = 'RESULTADO'
            DataType = datInteger
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
            SQL = 
              'create table #temp1'#10'(ID int,'#10' IDPadre int,'#10' IDCampo int,'#10' IDCamp' +
              'oPadre int,'#10' Tipo varchar(50),'#10' Codigo varchar(50),'#10' Nombre varc' +
              'har(50),'#10' ImageIndex int,'#10' StateIndex int'#10')'#10#10'declare @nada int'#10'd' +
              'eclare @varnivel int'#10'declare @varidpadre int'#10'declare @vargrupo i' +
              'nt'#10'declare @vargruporeal int'#10'declare @varmateria int'#10'declare @va' +
              'rpago int'#10#10'declare @id int'#10'declare @codigo varchar(50)'#10'declare @' +
              'nombre varchar(50)'#10'declare @tipo int'#10'declare @idpadre int'#10'declar' +
              'e @imageindex int'#10'declare @stateindex int'#10'declare @idcampo int'#10'd' +
              'eclare @idcampopadre int'#10#10'set @id = 0'#10'set @codigo = null'#10'set @no' +
              'mbre = '#39'Cat'#225'logo de Nivel Escolar'#39#10'set @tipo = -1'#10'set @idpadre =' +
              ' -1'#10'set @imageindex = 41'#10'set @stateindex = 40'#10#10'INSERT INTO #TEMP' +
              '1(ID, IDPadre, IDCampo, IDCampoPadre, Tipo, Codigo, Nombre, Imag' +
              'eIndex, StateIndex)VALUES'#10'                   (@id, @idpadre, 0, ' +
              '0, @tipo, @codigo, @nombre, @imageindex, @stateindex)'#10#10'declare c' +
              'ursoNivelEscolar SCROLL CURSOR FOR'#10'select idnivel, codigo, nombr' +
              'e, 0, 0, 34, 34 from nivel'#10'order by nombre'#10#10'open cursoNivelEscol' +
              'ar'#10'fetch next from cursoNivelEscolar'#10'into @idcampo, @codigo, @no' +
              'mbre, @tipo, @idpadre, @imageindex, @stateindex'#10'while @@fetch_st' +
              'atus = 0'#10'begin'#10#10'      set @idpadre = 0'#10'      set @id=@id+1'#10'     ' +
              ' set @varnivel = @idcampo'#10'      set @idcampopadre = @varnivel'#10'  ' +
              '    set @varidpadre = @id'#10'      set @codigo = null'#10#10' INSERT INTO' +
              ' #TEMP1(ID, IDPadre, IDCampo, IDCampoPadre, Tipo, Codigo, Nombre' +
              ', ImageIndex, StateIndex)VALUES'#10'                   (@id, @idpadr' +
              'e, @idcampo, 0, @tipo, @codigo, @nombre, @imageindex, @stateinde' +
              'x)'#10#10'      set @idpadre = @id'#10'      set @id=@id+1'#10'      set @varn' +
              'ivel = @idcampo'#10'      set @idcampopadre = @varnivel'#10'      set @v' +
              'aridpadre = @id'#10'      set @codigo = null'#10'      set @nombre = '#39'Ca' +
              't'#225'logo de Grupos'#39#10'      set @tipo = -2'#10'      set @imageindex = 4' +
              '1'#10'      set @stateindex = 40'#10#10'INSERT INTO #TEMP1(ID, IDPadre, ID' +
              'Campo, IDCampoPadre, Tipo, Codigo, Nombre, ImageIndex, StateInde' +
              'x)VALUES'#10'                   (@id, @idpadre, @idcampo, 0, @tipo, ' +
              '@codigo, @nombre, @imageindex, @stateindex)'#10#10' declare cursoGrupo' +
              's SCROLL CURSOR FOR'#10' select idgrupo, @id+1, codigo, nombre, 1, @' +
              'varidpadre, 33, 33 from grupo'#10' where idnivel = @varnivel'#10' order ' +
              'by codigo'#10' open cursoGrupos'#10' fetch next from cursoGrupos'#10' into @' +
              'idcampo, @id, @codigo, @nombre, @tipo, @idpadre, @imageindex, @s' +
              'tateindex'#10' while @@fetch_status = 0'#10' begin'#10'      set @id = 1 + @' +
              'id'#10'      set @varmateria = @id'#10'      set @idcampopadre = @varniv' +
              'el'#10'      set @varidpadre = @id'#10'      set @codigo = null'#10'      se' +
              't @vargruporeal = @idcampo'#10#10'      INSERT INTO #TEMP1(ID, IDPadre' +
              ', IDCampo, IDCampoPadre, Tipo, Codigo, Nombre, ImageIndex, State' +
              'Index)VALUES'#10'      (@id, @idpadre, @idcampo, @idcampopadre, @tip' +
              'o, @codigo, @nombre, @imageindex, @stateindex)'#10#10'declare cursoMat' +
              'eriasGrupos SCROLL CURSOR FOR'#10'select MateriaGrupo.IDMateria as i' +
              'dmateria, @id+1, Materia.Codigo as MateriaCodigo,'#10'       Materia' +
              '.Nombre as MateriaNombre, 2, @varmateria, 43, 43, @vargruporeal ' +
              'from'#10'Materia inner join MateriaGrupo on Materia.IDMateria = Mate' +
              'riaGrupo.IDMateria'#10'where MateriaGrupo.IDGrupo = @vargruporeal'#10'or' +
              'der by Materia.Nombre'#10#10'   set @vargruporeal = @idcampo'#10'   set @v' +
              'argrupo = @id'#10'   set @idcampopadre = @idcampo'#10'   set @idpadre = ' +
              '@id'#10'   set @id = 1 + @id'#10'   set @codigo = null'#10#10'   set @nombre =' +
              ' '#39'Materias del Grupo'#39#10'   set @tipo = -3'#10'   set @imageindex = 41'#10 +
              '   set @stateindex = 40'#10#10'   INSERT INTO #TEMP1(ID, IDPadre, IDCa' +
              'mpo, IDCampoPadre, Tipo, Codigo, Nombre, ImageIndex, StateIndex)' +
              'VALUES'#10'      (@id, @idpadre, @idcampo, @idcampopadre, @tipo, @co' +
              'digo, @nombre, @imageindex, @stateindex)'#10#10'      set @idpadre = @' +
              'vargrupo'#10'      set @id = 1 + @id'#10'      set @idcampopadre = @varg' +
              'ruporeal'#10'      set @varpago = @id'#10'      set @codigo = null'#10'     ' +
              ' set @nombre = '#39'Pagos del Grupo'#39#10'      set @tipo = -4'#10'      set ' +
              '@imageindex = 41'#10'      set @stateindex = 40'#10#10'   INSERT INTO #TEM' +
              'P1(ID, IDPadre, IDCampo, IDCampoPadre, Tipo, Codigo, Nombre, Ima' +
              'geIndex, StateIndex)VALUES'#10'      (@id, @idpadre, @idcampo, @idca' +
              'mpopadre, @tipo, @codigo, @nombre, @imageindex, @stateindex)'#10#10'op' +
              'en cursoMateriasGrupos'#10'fetch next from cursoMateriasGrupos'#10'into ' +
              '@idcampo, @nada, @codigo, @nombre, @tipo, @idpadre, @imageindex,' +
              ' @stateindex, @idcampopadre'#10#10'while @@fetch_status = 0'#10'begin'#10'   s' +
              'et @vargruporeal = @idcampo'#10'   set @id = 1 + @id'#10'   set @idpadre' +
              ' = @idpadre + 1'#10'   set @codigo = null'#10#10'   INSERT INTO #TEMP1(ID,' +
              ' IDPadre, IDCampo, IDCampoPadre, Tipo, Codigo, Nombre, ImageInde' +
              'x, StateIndex)VALUES'#10'      (@id, @idpadre, @idcampo, @idcampopad' +
              're, @tipo, @codigo, @nombre, @imageindex, @stateindex)'#10#10'/*******' +
              '****************************************************************' +
              '***************************/'#10#10'   fetch next from cursoMateriasGr' +
              'upos'#10'   into @idcampo, @nada, @codigo, @nombre, @tipo, @idpadre,' +
              ' @imageindex, @stateindex, @idcampopadre'#10'/**********************' +
              '****************************************************************' +
              '************/'#10#10'end'#10'   deallocate cursoMateriasGrupos'#10#10'/*********' +
              '****************************************************************' +
              '*******************************************/'#10'/******************' +
              '****************************************************************' +
              '****************/'#10'set @vargruporeal = @idcampopadre'#10'declare curs' +
              'oPagosGrupo SCROLL CURSOR FOR'#10'select SUBTIPOPAGO.idsubtipopago, ' +
              '@id+1, SUBTIPOPAGO.codigo, SUBTIPOPAGO.nombre, 3, @varpago, 42, ' +
              '42, @vargruporeal'#10'FROM GRUPOPAGO'#10'INNER JOIN SUBTIPOPAGO ON GRUPO' +
              'PAGO.IDSUBTIPOPAGO = SUBTIPOPAGO.IDSUBTIPOPAGO'#10'INNER JOIN TIPOSP' +
              'AGO ON SUBTIPOPAGO.IDTIPOPAGO = TIPOSPAGO.IDTIPOPAGO'#10'WHERE GRUPO' +
              'PAGO.IDGRUPO = @vargruporeal'#10'order by SUBTIPOPAGO.Nombre'#10#10'open c' +
              'ursoPagosGrupo'#10'fetch next from cursoPagosGrupo'#10'into @idcampo, @n' +
              'ada, @codigo, @nombre, @tipo, @idpadre, @imageindex, @stateindex' +
              ', @idcampopadre'#10'while @@fetch_status = 0'#10'begin'#10'      set @idpadr' +
              'e = @id'#10'      set @id = 1 + @id'#10'      set @idcampopadre = @vargr' +
              'uporeal'#10'      set @codigo = null'#10#10#10'   INSERT INTO #TEMP1(ID, IDP' +
              'adre, IDCampo, IDCampoPadre, Tipo, Codigo, Nombre, ImageIndex, S' +
              'tateIndex)VALUES'#10'      (@id, @varpago, @idcampo, @idcampopadre, ' +
              '@Tipo, @codigo, @nombre, @imageindex, @stateindex)'#10#10'   fetch nex' +
              't from cursoPagosGrupo'#10'   into @idcampo, @nada, @codigo, @nombre' +
              ', @tipo, @idpadre, @imageindex, @stateindex, @idcampopadre'#10'end'#10' ' +
              '  deallocate cursoPagosGrupo'#10'/**********************************' +
              '****************************************************************' +
              '*********************/'#10#10'   fetch next from cursoGrupos'#10'   into @' +
              'idcampo, @nada, @codigo, @nombre, @tipo, @idpadre, @imageindex, ' +
              '@stateindex'#10'end'#10'   deallocate cursoGrupos'#10#10' fetch next from curs' +
              'oNivelEscolar'#10' into @idcampo, @codigo, @nombre, @tipo, @idpadre,' +
              ' @imageindex, @stateindex'#10'end'#10#10'deallocate cursoNivelEscolar'#10#10'sel' +
              'ect * from #TEMP1'#10'DROP TABLE #TEMP1'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'ID'
                TableField = 'ID'
              end
              item
                DatasetField = 'IDPadre'
                TableField = 'IDPadre'
              end
              item
                DatasetField = 'IDCampo'
                TableField = 'IDCampo'
              end
              item
                DatasetField = 'IDCampoPadre'
                TableField = 'IDCampoPadre'
              end
              item
                DatasetField = 'Tipo'
                TableField = 'Tipo'
              end
              item
                DatasetField = 'Codigo'
                TableField = 'Codigo'
              end
              item
                DatasetField = 'Nombre'
                TableField = 'Nombre'
              end
              item
                DatasetField = 'ImageIndex'
                TableField = 'ImageIndex'
              end
              item
                DatasetField = 'StateIndex'
                TableField = 'StateIndex'
              end>
          end>
        Name = 'spNiveles'
        Fields = <
          item
            Name = 'ID'
            DataType = datInteger
          end
          item
            Name = 'IDPadre'
            DataType = datInteger
          end
          item
            Name = 'IDCampo'
            DataType = datInteger
          end
          item
            Name = 'IDCampoPadre'
            DataType = datInteger
          end
          item
            Name = 'Tipo'
            DataType = datString
            Size = 50
          end
          item
            Name = 'Codigo'
            DataType = datString
            Size = 50
          end
          item
            Name = 'Nombre'
            DataType = datString
            Size = 50
          end
          item
            Name = 'ImageIndex'
            DataType = datInteger
          end
          item
            Name = 'StateIndex'
            DataType = datInteger
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
            SQL = 'SELECT IDMAESTRO, CODIGO, NOMBRE FROM MAESTRO'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDMAESTRO'
                TableField = 'IDMAESTRO'
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
        Name = 'spMaestro2'
        Fields = <
          item
            Name = 'IDMAESTRO'
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
            Size = 70
          end>
      end
      item
        Params = <
          item
            Name = 'IDMAESTRO'
            Value = '1'
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
            SQL = 
              'SELECT IDMAESTRO, CODIGO, NOMBRE FROM MAESTRO'#10'WHERE IDMAESTRO = ' +
              ':IDMAESTRO'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDMAESTRO'
                TableField = 'IDMAESTRO'
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
        Name = 'spMaestros'
        Fields = <
          item
            Name = 'IDMAESTRO'
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
            Size = 70
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
            SQL = 
              'SELECT'#10'    IDTIPOCALIFICACION, CODIGO, NOMBRE, NOMBREAUX1, NOMBR' +
              'EAUX2, CAPTURAR'#10'  FROM'#10'    dbo.TIPOCALIFICACION'#10'  WHERE'#10'    CAPT' +
              'URAR > 0'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDTIPOCALIFICACION'
                TableField = 'IDTIPOCALIFICACION'
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
                DatasetField = 'NOMBREAUX1'
                TableField = 'NOMBREAUX1'
              end
              item
                DatasetField = 'NOMBREAUX2'
                TableField = 'NOMBREAUX2'
              end
              item
                DatasetField = 'CAPTURAR'
                TableField = 'CAPTURAR'
              end>
          end>
        Name = 'spTipoCalificaciones'
        Fields = <
          item
            Name = 'IDTIPOCALIFICACION'
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
            Name = 'NOMBREAUX1'
            DataType = datString
            Size = 50
          end
          item
            Name = 'NOMBREAUX2'
            DataType = datString
            Size = 50
          end
          item
            Name = 'CAPTURAR'
            DataType = datBoolean
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
            SQL = 
              'create table #temp1'#10'(ID int,'#10' IDPadre int,'#10' IDCampo int,'#10' IDCamp' +
              'oPadre int,'#10' Tipo varchar(50),'#10' Nombre varchar(50),'#10' ImageIndex ' +
              'int'#10')'#10#10#10'DECLARE @VARTIPOS int'#10'DECLARE @VARIDPADRE int'#10'DECLARE @I' +
              'D INT'#10'DECLARE @NOMBRE VARCHAR(100)'#10'DECLARE @TIPO INT'#10'DECLARE @ID' +
              'PADRE INT'#10'DECLARE @IDCAMPOPADRE INT'#10'DECLARE @IDCAMPO INT'#10'DECLARE' +
              ' @IMAGEINDEX INT'#10'DECLARE @OTROINDEX INT'#10#10'  SET @ID = 0'#10'  SET @NO' +
              'MBRE = '#39'Cat'#225'logo de Tipos de Pago'#39#10'  SET @TIPO = -1'#10'  SET @IDPAD' +
              'RE = -1'#10'  SET @IMAGEINDEX = 41'#10'  '#10'  INSERT INTO #TEMP1(ID, IDPad' +
              're, IDCampo, IDCampoPadre, Tipo, Nombre, ImageIndex)VALUES'#10'     ' +
              ' (@ID, @IDPadre, @IDCampo, @IDCampoPadre, @Tipo, @Nombre, @Image' +
              'Index)'#10#10'declare cursoPagosTipo SCROLL CURSOR FOR'#10'SELECT IDTIPOPA' +
              'GO, IDTIPOPAGO, NOMBRE, @ID + 1, 0, 0, 42 FROM TIPOSPAGO'#10'ORDER B' +
              'Y NOMBRE'#10#10'open cursoPagosTipo'#10'fetch next from cursoPagosTipo'#10'int' +
              'o @IDCAMPO, @IDCAMPOPADRE, @NOMBRE, @OTROINDEX, @TIPO, @IDPADRE,' +
              ' @IMAGEINDEX'#10'while @@fetch_status = 0'#10'begin'#10'   SET @id = 1 + @id' +
              #10'   SET @VARTIPOS = @IDCAMPO'#10'   SET @VARIDPADRE = @ID'#10#10'   INSERT' +
              ' INTO #TEMP1(ID, IDPadre, IDCampo, IDCampoPadre, Tipo, Nombre, I' +
              'mageIndex)VALUES'#10'      (@ID, @IDPadre, @IDCampo, @IDCampoPadre, ' +
              '@Tipo, @Nombre, @ImageIndex)'#10#10'/*********************************' +
              '****************************************************************' +
              '**********************/'#10'   declare cursoPagosSubTipo SCROLL CURS' +
              'OR FOR'#10'   SELECT IDSUBTIPOPAGO, NOMBRE, @ID + 1, 1, @VARIDPADRE,' +
              ' 56 FROM SUBTIPOPAGO'#10'   WHERE IDTIPOPAGO = @VARTIPOS'#10'   ORDER BY' +
              ' NOMBRE'#10#10'   open cursoPagosSubTipo'#10'   fetch next from cursoPagos' +
              'SubTipo'#10'   into @IDCAMPOPADRE, @NOMBRE, @OTROINDEX, @TIPO, @IDPA' +
              'DRE, @IMAGEINDEX'#10'   while @@fetch_status = 0'#10'   begin'#10'      SET ' +
              '@id = 1 + @id'#10'      INSERT INTO #TEMP1(ID, IDPadre, IDCampo, IDC' +
              'ampoPadre, Tipo, Nombre, ImageIndex)VALUES'#10'      (@ID, @IDPadre,' +
              ' @IDCampo, @IDCampoPadre, @Tipo, @Nombre, @ImageIndex)'#10#10'      fe' +
              'tch next from cursoPagosSubTipo'#10'      into @IDCAMPOPADRE, @NOMBR' +
              'E, @OTROINDEX, @TIPO, @IDPADRE, @IMAGEINDEX'#10'   end'#10'   deallocate' +
              ' cursoPagosSubTipo'#10'/********************************************' +
              '****************************************************************' +
              '***********/'#10#10'   fetch next from cursoPagosTipo'#10'   into @IDCAMPO' +
              ', @IDCAMPOPADRE, @NOMBRE, @OTROINDEX, @TIPO, @IDPADRE, @IMAGEIND' +
              'EX'#10'end'#10'   deallocate cursoPagosTipo'#10'/***************************' +
              '****************************************************************' +
              '****************************/'#10#10'SELECT * FROM #TEMP1'#10'DROP TABLE #' +
              'TEMP1'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'ID'
                TableField = 'ID'
              end
              item
                DatasetField = 'IDPadre'
                TableField = 'IDPadre'
              end
              item
                DatasetField = 'IDCampo'
                TableField = 'IDCampo'
              end
              item
                DatasetField = 'IDCampoPadre'
                TableField = 'IDCampoPadre'
              end
              item
                DatasetField = 'Tipo'
                TableField = 'Tipo'
              end
              item
                DatasetField = 'Nombre'
                TableField = 'Nombre'
              end
              item
                DatasetField = 'ImageIndex'
                TableField = 'ImageIndex'
              end>
          end>
        Name = 'spTiposPago'
        Fields = <
          item
            Name = 'ID'
            DataType = datInteger
          end
          item
            Name = 'IDPadre'
            DataType = datInteger
          end
          item
            Name = 'IDCampo'
            DataType = datInteger
          end
          item
            Name = 'IDCampoPadre'
            DataType = datInteger
          end
          item
            Name = 'Tipo'
            DataType = datString
            Size = 50
          end
          item
            Name = 'Nombre'
            DataType = datString
            Size = 50
          end
          item
            Name = 'ImageIndex'
            DataType = datInteger
          end>
      end
      item
        Params = <
          item
            Name = 'IDHISTORIALGRUPO'
            Value = '1'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
            SQL = 
              'declare @inscribir int'#10'declare @Fecha datetime'#10'declare @Hoy date' +
              'time'#10#10'  SELECT @Fecha = CICLO.FECHAFINAL, @Hoy = GETDATE()'#10'  FRO' +
              'M HISTORIALGRUPO INNER JOIN CICLO ON (HISTORIALGRUPO.IDCICLO = C' +
              'ICLO.IDCICLO)'#10'  WHERE (HISTORIALGRUPO.IDHISTORIALGRUPO = :IDHIST' +
              'ORIALGRUPO)'#10#10'    set @inscribir = 0'#10'  if (@Fecha < @Hoy)'#10'    set' +
              ' @inscribir = 1'#10#10'select @inscribir as inscribir'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'inscribir'
                TableField = 'inscribir'
              end>
          end>
        Name = 'spLimiteInscribe'
        Fields = <
          item
            Name = 'inscribir'
            DataType = datInteger
          end>
        ReadOnly = True
      end
      item
        Params = <
          item
            Name = 'IDCICLO'
            Value = ''
          end
          item
            Name = 'IDGRUPO'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
            SQL = 
              'SELECT ALUMNO.idalumno,'#10'       HISTORIALALUMNO.IDHISTORIALALUMNO' +
              ','#10'       ALUMNO.NUMCONTROL,'#10'       ALUMNO.NOMBRE AS NOMBREALUMNO' +
              ','#10'       alumno.idstatus,'#10'       GRUPO.IDGRUPO,'#10'       CICLO.IDC' +
              'ICLO,'#10'       CICLO.CODIGO AS CODIGOCICLO,'#10'       CICLO.NOMBRE AS' +
              ' NOMBRECICLO,'#10'       GRUPO.CODIGO AS CODIGOGRUPO,'#10'       GRUPO.N' +
              'OMBRE AS NOMBREGRUPO,'#10'       CICLO.FECHAINICIO,'#10'       CICLO.FEC' +
              'HAFINAL'#10'FROM GRUPO'#10'   INNER JOIN HISTORIALGRUPO ON (GRUPO.IDGRUP' +
              'O = HISTORIALGRUPO.IDGRUPO)'#10'   INNER JOIN CICLO ON (HISTORIALGRU' +
              'PO.IDCICLO = CICLO.IDCICLO)'#10'   INNER JOIN HISTORIALALUMNO ON (HI' +
              'STORIALGRUPO.IDHISTORIALGRUPO ='#10#10'HISTORIALALUMNO.IDHISTORIALGRUP' +
              'O)'#10'   INNER JOIN ALUMNO ON (HISTORIALALUMNO.IDALUMNO = ALUMNO.ID' +
              'ALUMNO)'#10'WHERE CICLO.IDCICLO = :IDCICLO AND GRUPO.IDGRUPO = :IDGR' +
              'UPO'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'idalumno'
                TableField = 'idalumno'
              end
              item
                DatasetField = 'IDHISTORIALALUMNO'
                TableField = 'IDHISTORIALALUMNO'
              end
              item
                DatasetField = 'NUMCONTROL'
                TableField = 'NUMCONTROL'
              end
              item
                DatasetField = 'NOMBREALUMNO'
                TableField = 'NOMBREALUMNO'
              end
              item
                DatasetField = 'idstatus'
                TableField = 'idstatus'
              end
              item
                DatasetField = 'IDGRUPO'
                TableField = 'IDGRUPO'
              end
              item
                DatasetField = 'IDCICLO'
                TableField = 'IDCICLO'
              end
              item
                DatasetField = 'CODIGOCICLO'
                TableField = 'CODIGOCICLO'
              end
              item
                DatasetField = 'NOMBRECICLO'
                TableField = 'NOMBRECICLO'
              end
              item
                DatasetField = 'CODIGOGRUPO'
                TableField = 'CODIGOGRUPO'
              end
              item
                DatasetField = 'NOMBREGRUPO'
                TableField = 'NOMBREGRUPO'
              end
              item
                DatasetField = 'FECHAINICIO'
                TableField = 'FECHAINICIO'
              end
              item
                DatasetField = 'FECHAFINAL'
                TableField = 'FECHAFINAL'
              end>
          end>
        Name = 'spListas'
        Fields = <
          item
            Name = 'idalumno'
            DataType = datInteger
          end
          item
            Name = 'IDHISTORIALALUMNO'
            DataType = datInteger
          end
          item
            Name = 'NUMCONTROL'
            DataType = datString
            Size = 12
          end
          item
            Name = 'NOMBREALUMNO'
            DataType = datString
            Size = 70
          end
          item
            Name = 'idstatus'
            DataType = datInteger
          end
          item
            Name = 'IDGRUPO'
            DataType = datInteger
          end
          item
            Name = 'IDCICLO'
            DataType = datInteger
          end
          item
            Name = 'CODIGOCICLO'
            DataType = datString
            Size = 10
          end
          item
            Name = 'NOMBRECICLO'
            DataType = datString
            Size = 50
          end
          item
            Name = 'CODIGOGRUPO'
            DataType = datString
            Size = 10
          end
          item
            Name = 'NOMBREGRUPO'
            DataType = datString
            Size = 50
          end
          item
            Name = 'FECHAINICIO'
            DataType = datDateTime
          end
          item
            Name = 'FECHAFINAL'
            DataType = datDateTime
          end>
      end
      item
        Params = <
          item
            Name = 'IDPAGO'
            Value = '1'
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
            SQL = 
              'SELECT *'#10'FROM'#10'(SELECT PAGO.IDPAGO,'#10'       PAGO.NUMPAGO,'#10'       P' +
              'AGO.IMPORTE,'#10'       PAGO.FECHA,'#10'       PAGO.FECHAPAGO,'#10'       PA' +
              'GO.STATUS,'#10'       PAGO.INTERES,'#10'       PAGO.IDEMPLEADO,'#10'       P' +
              'AGO.IDSUBTIPOPAGO,'#10'       ALUMNO.NOMBRE AS ALUMNONOMBRE,'#10'       ' +
              'ALUMNO.NUMCONTROL AS ALUMNONUMCONTROL,'#10'       VWHISTORIALALUMNO.' +
              'IDALUMNO,'#10'       VWHISTORIALALUMNO.IDHISTORIALGRUPO,'#10'       VWTI' +
              'POPAGO.TIPOCODIGO,'#10'       VWTIPOPAGO.SUBTIPOCODIGO,'#10'       VWHIS' +
              'TORIALALUMNO.IDHISTORIALALUMNO,'#10'       USUARIO.CODIGO AS EMPLEAD' +
              'OCODIGO,'#10'       USUARIO.NOMBRE AS EMPLEADONOMBRE,'#10'       VWHISTO' +
              'RIALALUMNO.IDGRUPO,'#10'       VWHISTORIALALUMNO.GRUPOCODIGO,'#10'      ' +
              ' VWHISTORIALALUMNO.GRUPONOMBRE'#10'FROM'#10'(SELECT HISTORIALALUMNO.IDHI' +
              'STORIALALUMNO,'#10'       HISTORIALALUMNO.DOCUMENTOSFALTANTES,'#10'     ' +
              '  VWHISTORIALGRUPO.IDHISTORIALGRUPO,'#10'       VWHISTORIALGRUPO.IDC' +
              'ICLO,'#10'       VWHISTORIALGRUPO.IDGRUPO,'#10'       VWHISTORIALGRUPO.I' +
              'DNIVEL,'#10'       ALUMNO.IDALUMNO,'#10'       ALUMNO.NOMBRE AS ALUMNONO' +
              'MBRE,'#10'       ALUMNO.NUMCONTROL AS ALUMNONUMCONTROL,'#10'       ALUMN' +
              'O.SEXO AS ALUMNOSEXO,'#10'       VWHISTORIALGRUPO.GRUPOCODIGO,'#10'     ' +
              '  VWHISTORIALGRUPO.GRUPONOMBRE,'#10'       VWHISTORIALGRUPO.GRUPOAUX' +
              '1,'#10'       VWHISTORIALGRUPO.GRUPOAUX2,'#10'       VWHISTORIALGRUPO.NI' +
              'VELCODIGO,'#10'       VWHISTORIALGRUPO.NIVELNOMBRE,'#10'       VWHISTORI' +
              'ALGRUPO.NIVELAUX1,'#10'       VWHISTORIALGRUPO.NIVELAUX2,'#10'       VWH' +
              'ISTORIALGRUPO.CICLOCODIGO,'#10'       VWHISTORIALGRUPO.CICLONOMBRE,'#10 +
              '       VWHISTORIALGRUPO.CICLOAUX1,'#10'       VWHISTORIALGRUPO.CICLO' +
              'AUX2,'#10'       VWHISTORIALGRUPO.CICLOFECHAINICIO,'#10'       VWHISTORI' +
              'ALGRUPO.CICLOFECHAFINAL,'#10'       STATUS.IDSTATUS,'#10'       STATUS.C' +
              'ODIGO AS STATUSCODIGO,'#10'       STATUS.NOMBRE AS STATUSNOMBRE,'#10'   ' +
              '    HISTORIALALUMNO.BECA,'#10'       HISTORIALALUMNO.DESCUENTO'#10'FROM ' +
              'STATUS'#10'   INNER JOIN ALUMNO ON (STATUS.IDSTATUS = ALUMNO.IDSTATU' +
              'S)'#10'   INNER JOIN HISTORIALALUMNO ON (ALUMNO.IDALUMNO = HISTORIAL' +
              'ALUMNO.IDALUMNO)'#10'   INNER JOIN'#10'   (SELECT HISTORIALGRUPO.IDHISTO' +
              'RIALGRUPO,'#10'       NIVEL.IDNIVEL,'#10'       CICLO.IDCICLO,'#10'       GR' +
              'UPO.IDGRUPO,'#10'       GRUPO.CODIGO AS GRUPOCODIGO,'#10'       GRUPO.NO' +
              'MBRE AS GRUPONOMBRE,'#10'       GRUPO.NOMBREaux1 AS GRUPOaux1,'#10'     ' +
              '  GRUPO.NOMBREaux2 AS GRUPOaux2,'#10'       grupo.cupo,'#10'       NIVEL' +
              '.CODIGO AS NIVELCODIGO,'#10'       NIVEL.NOMBRE AS NIVELNOMBRE,'#10'    ' +
              '   NIVEL.NOMBREaux1 AS NIVELaux1,'#10'       NIVEL.NOMBREaux2 AS NIV' +
              'ELaux2,'#10'       CICLO.CODIGO AS CICLOCODIGO,'#10'       CICLO.NOMBRE ' +
              'AS CICLONOMBRE,'#10'       CICLO.NOMBREaux1 AS CICLOaux1,'#10'       CIC' +
              'LO.NOMBREaux2 AS CICLOaux2,'#10'       CICLO.FECHAFINAL AS CICLOFECH' +
              'AFINAL,'#10'       CICLO.FECHAINICIO AS CICLOFECHAINICIO'#10'FROM GRUPO'#10 +
              '   INNER JOIN NIVEL ON (GRUPO.IDNIVEL = NIVEL.IDNIVEL)'#10'   INNER ' +
              'JOIN HISTORIALGRUPO ON (GRUPO.IDGRUPO = HISTORIALGRUPO.IDGRUPO)'#10 +
              '   INNER JOIN CICLO ON (HISTORIALGRUPO.IDCICLO = CICLO.IDCICLO))' +
              #10'   VWHISTORIALGRUPO ON (HISTORIALALUMNO.IDHISTORIALGRUPO = VWHI' +
              'STORIALGRUPO.IDHISTORIALGRUPO))'#10'   VWHISTORIALALUMNO'#10#10'   INNER J' +
              'OIN ALUMNO ON (VWHISTORIALALUMNO.IDALUMNO = ALUMNO.IDALUMNO)'#10'   ' +
              'INNER JOIN PAGO ON (VWHISTORIALALUMNO.IDHISTORIALALUMNO = PAGO.I' +
              'DHISTORIALALUMNO)'#10'   INNER JOIN USUARIO ON (PAGO.IDEMPLEADO = US' +
              'UARIO.IDEMPLEADO)'#10'   INNER JOIN'#10'   (SELECT TIPOSPAGO.IDTIPOPAGO,' +
              #10'       TIPOSPAGO.CODIGO AS TIPOCODIGO,'#10'       TIPOSPAGO.NOMBRE ' +
              'AS TIPONOMBRE,'#10'       tipospago.aplicabeca,'#10'       tipospago.apl' +
              'icadescuento,'#10'       SUBTIPOPAGO.IDSUBTIPOPAGO,'#10'       SUBTIPOPA' +
              'GO.CODIGO AS SUBTIPOCODIGO,'#10'       SUBTIPOPAGO.NOMBRE AS SUBTIPO' +
              'NOMBRE,'#10'       SUBTIPOPAGO.FECHA,'#10'       SUBTIPOPAGO.NUMPAGOS,'#10' ' +
              '      SUBTIPOPAGO.PLAZO,'#10'       SUBTIPOPAGO.IMPORTE'#10'FROM SUBTIPO' +
              'PAGO'#10'   RIGHT OUTER JOIN TIPOSPAGO ON (SUBTIPOPAGO.IDTIPOPAGO = ' +
              'TIPOSPAGO.IDTIPOPAGO))'#10'   VWTIPOPAGO ON (PAGO.IDSUBTIPOPAGO = VW' +
              'TIPOPAGO.IDSUBTIPOPAGO))'#10#10'VWPAGOCAJA'#10'WHERE IDPAGO = :IDPAGO'#10#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDPAGO'
                TableField = 'IDPAGO'
              end
              item
                DatasetField = 'NUMPAGO'
                TableField = 'NUMPAGO'
              end
              item
                DatasetField = 'IMPORTE'
                TableField = 'IMPORTE'
              end
              item
                DatasetField = 'FECHA'
                TableField = 'FECHA'
              end
              item
                DatasetField = 'FECHAPAGO'
                TableField = 'FECHAPAGO'
              end
              item
                DatasetField = 'STATUS'
                TableField = 'STATUS'
              end
              item
                DatasetField = 'INTERES'
                TableField = 'INTERES'
              end
              item
                DatasetField = 'IDEMPLEADO'
                TableField = 'IDEMPLEADO'
              end
              item
                DatasetField = 'IDSUBTIPOPAGO'
                TableField = 'IDSUBTIPOPAGO'
              end
              item
                DatasetField = 'ALUMNONOMBRE'
                TableField = 'ALUMNONOMBRE'
              end
              item
                DatasetField = 'ALUMNONUMCONTROL'
                TableField = 'ALUMNONUMCONTROL'
              end
              item
                DatasetField = 'IDALUMNO'
                TableField = 'IDALUMNO'
              end
              item
                DatasetField = 'IDHISTORIALGRUPO'
                TableField = 'IDHISTORIALGRUPO'
              end
              item
                DatasetField = 'TIPOCODIGO'
                TableField = 'TIPOCODIGO'
              end
              item
                DatasetField = 'SUBTIPOCODIGO'
                TableField = 'SUBTIPOCODIGO'
              end
              item
                DatasetField = 'IDHISTORIALALUMNO'
                TableField = 'IDHISTORIALALUMNO'
              end
              item
                DatasetField = 'EMPLEADOCODIGO'
                TableField = 'EMPLEADOCODIGO'
              end
              item
                DatasetField = 'EMPLEADONOMBRE'
                TableField = 'EMPLEADONOMBRE'
              end
              item
                DatasetField = 'IDGRUPO'
                TableField = 'IDGRUPO'
              end
              item
                DatasetField = 'GRUPOCODIGO'
                TableField = 'GRUPOCODIGO'
              end
              item
                DatasetField = 'GRUPONOMBRE'
                TableField = 'GRUPONOMBRE'
              end>
          end>
        Name = 'spPagosCaja2'
        Fields = <
          item
            Name = 'IDPAGO'
            DataType = datInteger
          end
          item
            Name = 'NUMPAGO'
            DataType = datInteger
          end
          item
            Name = 'IMPORTE'
            DataType = datFloat
          end
          item
            Name = 'FECHA'
            DataType = datDateTime
          end
          item
            Name = 'FECHAPAGO'
            DataType = datDateTime
          end
          item
            Name = 'STATUS'
            DataType = datString
            Size = 1
          end
          item
            Name = 'INTERES'
            DataType = datFloat
          end
          item
            Name = 'IDEMPLEADO'
            DataType = datInteger
          end
          item
            Name = 'IDSUBTIPOPAGO'
            DataType = datInteger
          end
          item
            Name = 'ALUMNONOMBRE'
            DataType = datString
            Size = 70
          end
          item
            Name = 'ALUMNONUMCONTROL'
            DataType = datString
            Size = 12
          end
          item
            Name = 'IDALUMNO'
            DataType = datInteger
          end
          item
            Name = 'IDHISTORIALGRUPO'
            DataType = datInteger
          end
          item
            Name = 'TIPOCODIGO'
            DataType = datString
            Size = 10
          end
          item
            Name = 'SUBTIPOCODIGO'
            DataType = datString
            Size = 10
          end
          item
            Name = 'IDHISTORIALALUMNO'
            DataType = datInteger
          end
          item
            Name = 'EMPLEADOCODIGO'
            DataType = datString
            Size = 10
          end
          item
            Name = 'EMPLEADONOMBRE'
            DataType = datString
            Size = 70
          end
          item
            Name = 'IDGRUPO'
            DataType = datInteger
          end
          item
            Name = 'GRUPOCODIGO'
            DataType = datString
            Size = 10
          end
          item
            Name = 'GRUPONOMBRE'
            DataType = datString
            Size = 50
          end>
      end
      item
        Params = <
          item
            Name = 'IDHISTORIALALUMNO'
            Value = '1'
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
            SQL = 
              'SELECT VWPAGOCAJA.IDPAGO,'#10'       VWPAGOCAJA.NUMPAGO,'#10'       VWPA' +
              'GOCAJA.STATUS,'#10'       VWPAGOCAJA.TIPOCODIGO,'#10'       VWPAGOCAJA.S' +
              'UBTIPOCODIGO,'#10'       VWPAGOCAJA.FECHA,'#10'       VWPAGOCAJA.FECHAPA' +
              'GO,'#10'       VWPAGOCAJA.EMPLEADOCODIGO,'#10'       VWPAGOCAJA.IMPORTE,' +
              #10'       VWPAGOCAJA.INTERES,'#10'       (VWPAGOCAJA.INTERES + VWPAGOC' +
              'AJA.IMPORTE) as TOTAL'#10'FROM'#10'(SELECT PAGO.IDPAGO,'#10'       PAGO.NUMP' +
              'AGO,'#10'       PAGO.IMPORTE,'#10'       PAGO.FECHA,'#10'       PAGO.FECHAPA' +
              'GO,'#10'       PAGO.STATUS,'#10'       PAGO.INTERES,'#10'       PAGO.IDEMPLE' +
              'ADO,'#10'       PAGO.IDSUBTIPOPAGO,'#10'       ALUMNO.NOMBRE AS ALUMNONO' +
              'MBRE,'#10'       ALUMNO.NUMCONTROL AS ALUMNONUMCONTROL,'#10'       VWHIS' +
              'TORIALALUMNO.IDALUMNO,'#10'       VWHISTORIALALUMNO.IDHISTORIALGRUPO' +
              ','#10'       VWTIPOPAGO.TIPOCODIGO,'#10'       VWTIPOPAGO.SUBTIPOCODIGO,' +
              #10'       VWHISTORIALALUMNO.IDHISTORIALALUMNO,'#10'       USUARIO.CODI' +
              'GO AS EMPLEADOCODIGO,'#10'       USUARIO.NOMBRE AS EMPLEADONOMBRE,'#10' ' +
              '      VWHISTORIALALUMNO.IDGRUPO,'#10'       VWHISTORIALALUMNO.GRUPOC' +
              'ODIGO,'#10'       VWHISTORIALALUMNO.GRUPONOMBRE'#10'FROM'#10'(SELECT HISTORI' +
              'ALALUMNO.IDHISTORIALALUMNO,'#10'       HISTORIALALUMNO.DOCUMENTOSFAL' +
              'TANTES,'#10'       VWHISTORIALGRUPO.IDHISTORIALGRUPO,'#10'       VWHISTO' +
              'RIALGRUPO.IDCICLO,'#10'       VWHISTORIALGRUPO.IDGRUPO,'#10'       VWHIS' +
              'TORIALGRUPO.IDNIVEL,'#10'       ALUMNO.IDALUMNO,'#10'       ALUMNO.NOMBR' +
              'E AS ALUMNONOMBRE,'#10'       ALUMNO.NUMCONTROL AS ALUMNONUMCONTROL,' +
              #10'       ALUMNO.SEXO AS ALUMNOSEXO,'#10'       VWHISTORIALGRUPO.GRUPO' +
              'CODIGO,'#10'       VWHISTORIALGRUPO.GRUPONOMBRE,'#10'       VWHISTORIALG' +
              'RUPO.GRUPOAUX1,'#10'       VWHISTORIALGRUPO.GRUPOAUX2,'#10'       VWHIST' +
              'ORIALGRUPO.NIVELCODIGO,'#10'       VWHISTORIALGRUPO.NIVELNOMBRE,'#10'   ' +
              '    VWHISTORIALGRUPO.NIVELAUX1,'#10'       VWHISTORIALGRUPO.NIVELAUX' +
              '2,'#10'       VWHISTORIALGRUPO.CICLOCODIGO,'#10'       VWHISTORIALGRUPO.' +
              'CICLONOMBRE,'#10'       VWHISTORIALGRUPO.CICLOAUX1,'#10'       VWHISTORI' +
              'ALGRUPO.CICLOAUX2,'#10'       VWHISTORIALGRUPO.CICLOFECHAINICIO,'#10'   ' +
              '    VWHISTORIALGRUPO.CICLOFECHAFINAL,'#10'       STATUS.IDSTATUS,'#10'  ' +
              '     STATUS.CODIGO AS STATUSCODIGO,'#10'       STATUS.NOMBRE AS STAT' +
              'USNOMBRE,'#10'       HISTORIALALUMNO.BECA,'#10'       HISTORIALALUMNO.DE' +
              'SCUENTO'#10'FROM STATUS'#10'   INNER JOIN ALUMNO ON (STATUS.IDSTATUS = A' +
              'LUMNO.IDSTATUS)'#10'   INNER JOIN HISTORIALALUMNO ON (ALUMNO.IDALUMN' +
              'O = HISTORIALALUMNO.IDALUMNO)'#10'   INNER JOIN'#10'   (SELECT HISTORIAL' +
              'GRUPO.IDHISTORIALGRUPO,'#10'       NIVEL.IDNIVEL,'#10'       CICLO.IDCIC' +
              'LO,'#10'       GRUPO.IDGRUPO,'#10'       GRUPO.CODIGO AS GRUPOCODIGO,'#10'  ' +
              '     GRUPO.NOMBRE AS GRUPONOMBRE,'#10'       GRUPO.NOMBREaux1 AS GRU' +
              'POaux1,'#10'       GRUPO.NOMBREaux2 AS GRUPOaux2,'#10'       grupo.cupo,' +
              #10'       NIVEL.CODIGO AS NIVELCODIGO,'#10'       NIVEL.NOMBRE AS NIVE' +
              'LNOMBRE,'#10'       NIVEL.NOMBREaux1 AS NIVELaux1,'#10'       NIVEL.NOMB' +
              'REaux2 AS NIVELaux2,'#10'       CICLO.CODIGO AS CICLOCODIGO,'#10'       ' +
              'CICLO.NOMBRE AS CICLONOMBRE,'#10'       CICLO.NOMBREaux1 AS CICLOaux' +
              '1,'#10'       CICLO.NOMBREaux2 AS CICLOaux2,'#10'       CICLO.FECHAFINAL' +
              ' AS CICLOFECHAFINAL,'#10'       CICLO.FECHAINICIO AS CICLOFECHAINICI' +
              'O'#10'FROM GRUPO'#10'   INNER JOIN NIVEL ON (GRUPO.IDNIVEL = NIVEL.IDNIV' +
              'EL)'#10'   INNER JOIN HISTORIALGRUPO ON (GRUPO.IDGRUPO = HISTORIALGR' +
              'UPO.IDGRUPO)'#10'   INNER JOIN CICLO ON (HISTORIALGRUPO.IDCICLO = CI' +
              'CLO.IDCICLO))'#10'   VWHISTORIALGRUPO ON (HISTORIALALUMNO.IDHISTORIA' +
              'LGRUPO = VWHISTORIALGRUPO.IDHISTORIALGRUPO))'#10'   VWHISTORIALALUMN' +
              'O'#10#10'   INNER JOIN ALUMNO ON (VWHISTORIALALUMNO.IDALUMNO = ALUMNO.' +
              'IDALUMNO)'#10'   INNER JOIN PAGO ON (VWHISTORIALALUMNO.IDHISTORIALAL' +
              'UMNO = PAGO.IDHISTORIALALUMNO)'#10'   INNER JOIN USUARIO ON (PAGO.ID' +
              'EMPLEADO = USUARIO.IDEMPLEADO)'#10'   INNER JOIN'#10'   (SELECT TIPOSPAG' +
              'O.IDTIPOPAGO,'#10'       TIPOSPAGO.CODIGO AS TIPOCODIGO,'#10'       TIPO' +
              'SPAGO.NOMBRE AS TIPONOMBRE,'#10'       tipospago.aplicabeca,'#10'       ' +
              'tipospago.aplicadescuento,'#10'       SUBTIPOPAGO.IDSUBTIPOPAGO,'#10'   ' +
              '    SUBTIPOPAGO.CODIGO AS SUBTIPOCODIGO,'#10'       SUBTIPOPAGO.NOMB' +
              'RE AS SUBTIPONOMBRE,'#10'       SUBTIPOPAGO.FECHA,'#10'       SUBTIPOPAG' +
              'O.NUMPAGOS,'#10'       SUBTIPOPAGO.PLAZO,'#10'       SUBTIPOPAGO.IMPORTE' +
              #10'FROM SUBTIPOPAGO'#10'   RIGHT OUTER JOIN TIPOSPAGO ON (SUBTIPOPAGO.' +
              'IDTIPOPAGO = TIPOSPAGO.IDTIPOPAGO))'#10'   VWTIPOPAGO ON (PAGO.IDSUB' +
              'TIPOPAGO = VWTIPOPAGO.IDSUBTIPOPAGO))'#10#10'VWPAGOCAJA'#10'where (status ' +
              '<> '#39'P'#39') and (IDHISTORIALALUMNO = :IDHISTORIALALUMNO)'#10#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDPAGO'
                TableField = 'IDPAGO'
              end
              item
                DatasetField = 'NUMPAGO'
                TableField = 'NUMPAGO'
              end
              item
                DatasetField = 'STATUS'
                TableField = 'STATUS'
              end
              item
                DatasetField = 'TIPOCODIGO'
                TableField = 'TIPOCODIGO'
              end
              item
                DatasetField = 'SUBTIPOCODIGO'
                TableField = 'SUBTIPOCODIGO'
              end
              item
                DatasetField = 'FECHA'
                TableField = 'FECHA'
              end
              item
                DatasetField = 'FECHAPAGO'
                TableField = 'FECHAPAGO'
              end
              item
                DatasetField = 'EMPLEADOCODIGO'
                TableField = 'EMPLEADOCODIGO'
              end
              item
                DatasetField = 'IMPORTE'
                TableField = 'IMPORTE'
              end
              item
                DatasetField = 'INTERES'
                TableField = 'INTERES'
              end
              item
                DatasetField = 'TOTAL'
                TableField = 'TOTAL'
              end>
          end>
        Name = 'spPagosCaja'
        Fields = <
          item
            Name = 'IDPAGO'
            DataType = datInteger
          end
          item
            Name = 'NUMPAGO'
            DataType = datInteger
          end
          item
            Name = 'STATUS'
            DataType = datString
            Size = 1
          end
          item
            Name = 'TIPOCODIGO'
            DataType = datString
            Size = 10
          end
          item
            Name = 'SUBTIPOCODIGO'
            DataType = datString
            Size = 10
          end
          item
            Name = 'FECHA'
            DataType = datDateTime
          end
          item
            Name = 'FECHAPAGO'
            DataType = datDateTime
          end
          item
            Name = 'EMPLEADOCODIGO'
            DataType = datString
            Size = 10
          end
          item
            Name = 'IMPORTE'
            DataType = datFloat
          end
          item
            Name = 'INTERES'
            DataType = datFloat
          end
          item
            Name = 'TOTAL'
            DataType = datFloat
          end>
      end
      item
        Params = <
          item
            Name = 'IDCICLO'
            Value = '5'
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
            SQL = 
              'SELECT  idhistorialalumno, idstatus, documentosfaltantes, idhist' +
              'orialgrupo, idalumno, alumnonumcontrol, alumnonombre, grupocodig' +
              'o, BECA, DESCUENTO'#10'FROM'#10'(SELECT HISTORIALALUMNO.IDHISTORIALALUMN' +
              'O,'#10'       HISTORIALALUMNO.DOCUMENTOSFALTANTES,'#10'       VWHISTORIA' +
              'LGRUPO.IDHISTORIALGRUPO,'#10'       VWHISTORIALGRUPO.IDCICLO,'#10'      ' +
              ' VWHISTORIALGRUPO.IDGRUPO,'#10'       VWHISTORIALGRUPO.IDNIVEL,'#10'    ' +
              '   ALUMNO.IDALUMNO,'#10'       ALUMNO.NOMBRE AS ALUMNONOMBRE,'#10'      ' +
              ' ALUMNO.NUMCONTROL AS ALUMNONUMCONTROL,'#10'       ALUMNO.SEXO AS AL' +
              'UMNOSEXO,'#10'       VWHISTORIALGRUPO.GRUPOCODIGO,'#10'       VWHISTORIA' +
              'LGRUPO.GRUPONOMBRE,'#10'       VWHISTORIALGRUPO.GRUPOAUX1,'#10'       VW' +
              'HISTORIALGRUPO.GRUPOAUX2,'#10'       VWHISTORIALGRUPO.NIVELCODIGO,'#10' ' +
              '      VWHISTORIALGRUPO.NIVELNOMBRE,'#10'       VWHISTORIALGRUPO.NIVE' +
              'LAUX1,'#10'       VWHISTORIALGRUPO.NIVELAUX2,'#10'       VWHISTORIALGRUP' +
              'O.CICLOCODIGO,'#10'       VWHISTORIALGRUPO.CICLONOMBRE,'#10'       VWHIS' +
              'TORIALGRUPO.CICLOAUX1,'#10'       VWHISTORIALGRUPO.CICLOAUX2,'#10'      ' +
              ' VWHISTORIALGRUPO.CICLOFECHAINICIO,'#10'       VWHISTORIALGRUPO.CICL' +
              'OFECHAFINAL,'#10'       STATUS.IDSTATUS,'#10'       STATUS.CODIGO AS STA' +
              'TUSCODIGO,'#10'       STATUS.NOMBRE AS STATUSNOMBRE,'#10'       HISTORIA' +
              'LALUMNO.BECA,'#10'       HISTORIALALUMNO.DESCUENTO'#10'FROM STATUS'#10'   IN' +
              'NER JOIN ALUMNO ON (STATUS.IDSTATUS = ALUMNO.IDSTATUS)'#10'   INNER ' +
              'JOIN HISTORIALALUMNO ON (ALUMNO.IDALUMNO = HISTORIALALUMNO.IDALU' +
              'MNO)'#10'   INNER JOIN'#10'   (SELECT HISTORIALGRUPO.IDHISTORIALGRUPO,'#10' ' +
              '      NIVEL.IDNIVEL,'#10'       CICLO.IDCICLO,'#10'       GRUPO.IDGRUPO,' +
              #10'       GRUPO.CODIGO AS GRUPOCODIGO,'#10'       GRUPO.NOMBRE AS GRUP' +
              'ONOMBRE,'#10'       GRUPO.NOMBREaux1 AS GRUPOaux1,'#10'       GRUPO.NOMB' +
              'REaux2 AS GRUPOaux2,'#10'       grupo.cupo,'#10'       NIVEL.CODIGO AS N' +
              'IVELCODIGO,'#10'       NIVEL.NOMBRE AS NIVELNOMBRE,'#10'       NIVEL.NOM' +
              'BREaux1 AS NIVELaux1,'#10'       NIVEL.NOMBREaux2 AS NIVELaux2,'#10'    ' +
              '   CICLO.CODIGO AS CICLOCODIGO,'#10'       CICLO.NOMBRE AS CICLONOMB' +
              'RE,'#10'       CICLO.NOMBREaux1 AS CICLOaux1,'#10'       CICLO.NOMBREaux' +
              '2 AS CICLOaux2,'#10'       CICLO.FECHAFINAL AS CICLOFECHAFINAL,'#10'    ' +
              '   CICLO.FECHAINICIO AS CICLOFECHAINICIO'#10'FROM GRUPO'#10'   INNER JOI' +
              'N NIVEL ON (GRUPO.IDNIVEL = NIVEL.IDNIVEL)'#10'   INNER JOIN HISTORI' +
              'ALGRUPO ON (GRUPO.IDGRUPO = HISTORIALGRUPO.IDGRUPO)'#10'   INNER JOI' +
              'N CICLO ON (HISTORIALGRUPO.IDCICLO = CICLO.IDCICLO))'#10'   VWHISTOR' +
              'IALGRUPO ON (HISTORIALALUMNO.IDHISTORIALGRUPO = VWHISTORIALGRUPO' +
              '.IDHISTORIALGRUPO))'#10'VWHISTORIALALUMNO'#10'WHERE IDCICLO = :IDCICLO'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'idhistorialalumno'
                TableField = 'idhistorialalumno'
              end
              item
                DatasetField = 'idstatus'
                TableField = 'idstatus'
              end
              item
                DatasetField = 'documentosfaltantes'
                TableField = 'documentosfaltantes'
              end
              item
                DatasetField = 'idhistorialgrupo'
                TableField = 'idhistorialgrupo'
              end
              item
                DatasetField = 'idalumno'
                TableField = 'idalumno'
              end
              item
                DatasetField = 'alumnonumcontrol'
                TableField = 'alumnonumcontrol'
              end
              item
                DatasetField = 'alumnonombre'
                TableField = 'alumnonombre'
              end
              item
                DatasetField = 'grupocodigo'
                TableField = 'grupocodigo'
              end
              item
                DatasetField = 'BECA'
                TableField = 'BECA'
              end
              item
                DatasetField = 'DESCUENTO'
                TableField = 'DESCUENTO'
              end>
          end>
        Name = 'spHistorialAlumnoInscripcion'
        Fields = <
          item
            Name = 'idhistorialalumno'
            DataType = datInteger
          end
          item
            Name = 'idstatus'
            DataType = datInteger
          end
          item
            Name = 'documentosfaltantes'
            DataType = datString
            Size = 150
          end
          item
            Name = 'idhistorialgrupo'
            DataType = datInteger
          end
          item
            Name = 'idalumno'
            DataType = datInteger
          end
          item
            Name = 'alumnonumcontrol'
            DataType = datString
            Size = 12
          end
          item
            Name = 'alumnonombre'
            DataType = datString
            Size = 70
          end
          item
            Name = 'grupocodigo'
            DataType = datString
            Size = 10
          end
          item
            Name = 'BECA'
            DataType = datFloat
          end
          item
            Name = 'DESCUENTO'
            DataType = datFloat
          end>
      end
      item
        Params = <
          item
            Name = 'IDALUMNO'
            Value = '1'
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
            SQL = 
              'SELECT IDHISTORIALALUMNO, IDALUMNO, GRUPOCODIGO, CICLOCODIGO, ID' +
              'HISTORIALGRUPO, IDCICLO'#10'FROM'#10'(SELECT HISTORIALALUMNO.IDHISTORIAL' +
              'ALUMNO,'#10'       HISTORIALALUMNO.DOCUMENTOSFALTANTES,'#10'       VWHIS' +
              'TORIALGRUPO.IDHISTORIALGRUPO,'#10'       VWHISTORIALGRUPO.IDCICLO,'#10' ' +
              '      VWHISTORIALGRUPO.IDGRUPO,'#10'       VWHISTORIALGRUPO.IDNIVEL,' +
              #10'       ALUMNO.IDALUMNO,'#10'       ALUMNO.NOMBRE AS ALUMNONOMBRE,'#10' ' +
              '      ALUMNO.NUMCONTROL AS ALUMNONUMCONTROL,'#10'       ALUMNO.SEXO ' +
              'AS ALUMNOSEXO,'#10'       VWHISTORIALGRUPO.GRUPOCODIGO,'#10'       VWHIS' +
              'TORIALGRUPO.GRUPONOMBRE,'#10'       VWHISTORIALGRUPO.GRUPOAUX1,'#10'    ' +
              '   VWHISTORIALGRUPO.GRUPOAUX2,'#10'       VWHISTORIALGRUPO.NIVELCODI' +
              'GO,'#10'       VWHISTORIALGRUPO.NIVELNOMBRE,'#10'       VWHISTORIALGRUPO' +
              '.NIVELAUX1,'#10'       VWHISTORIALGRUPO.NIVELAUX2,'#10'       VWHISTORIA' +
              'LGRUPO.CICLOCODIGO,'#10'       VWHISTORIALGRUPO.CICLONOMBRE,'#10'       ' +
              'VWHISTORIALGRUPO.CICLOAUX1,'#10'       VWHISTORIALGRUPO.CICLOAUX2,'#10' ' +
              '      VWHISTORIALGRUPO.CICLOFECHAINICIO,'#10'       VWHISTORIALGRUPO' +
              '.CICLOFECHAFINAL,'#10'       STATUS.IDSTATUS,'#10'       STATUS.CODIGO A' +
              'S STATUSCODIGO,'#10'       STATUS.NOMBRE AS STATUSNOMBRE,'#10'       HIS' +
              'TORIALALUMNO.BECA,'#10'       HISTORIALALUMNO.DESCUENTO'#10'FROM STATUS'#10 +
              '   INNER JOIN ALUMNO ON (STATUS.IDSTATUS = ALUMNO.IDSTATUS)'#10'   I' +
              'NNER JOIN HISTORIALALUMNO ON (ALUMNO.IDALUMNO = HISTORIALALUMNO.' +
              'IDALUMNO)'#10'   INNER JOIN'#10'   (SELECT HISTORIALGRUPO.IDHISTORIALGRU' +
              'PO,'#10'       NIVEL.IDNIVEL,'#10'       CICLO.IDCICLO,'#10'       GRUPO.IDG' +
              'RUPO,'#10'       GRUPO.CODIGO AS GRUPOCODIGO,'#10'       GRUPO.NOMBRE AS' +
              ' GRUPONOMBRE,'#10'       GRUPO.NOMBREaux1 AS GRUPOaux1,'#10'       GRUPO' +
              '.NOMBREaux2 AS GRUPOaux2,'#10'       grupo.cupo,'#10'       NIVEL.CODIGO' +
              ' AS NIVELCODIGO,'#10'       NIVEL.NOMBRE AS NIVELNOMBRE,'#10'       NIVE' +
              'L.NOMBREaux1 AS NIVELaux1,'#10'       NIVEL.NOMBREaux2 AS NIVELaux2,' +
              #10'       CICLO.CODIGO AS CICLOCODIGO,'#10'       CICLO.NOMBRE AS CICL' +
              'ONOMBRE,'#10'       CICLO.NOMBREaux1 AS CICLOaux1,'#10'       CICLO.NOMB' +
              'REaux2 AS CICLOaux2,'#10'       CICLO.FECHAFINAL AS CICLOFECHAFINAL,' +
              #10'       CICLO.FECHAINICIO AS CICLOFECHAINICIO'#10'FROM GRUPO'#10'   INNE' +
              'R JOIN NIVEL ON (GRUPO.IDNIVEL = NIVEL.IDNIVEL)'#10'   INNER JOIN HI' +
              'STORIALGRUPO ON (GRUPO.IDGRUPO = HISTORIALGRUPO.IDGRUPO)'#10'   INNE' +
              'R JOIN CICLO ON (HISTORIALGRUPO.IDCICLO = CICLO.IDCICLO))'#10'   VWH' +
              'ISTORIALGRUPO ON (HISTORIALALUMNO.IDHISTORIALGRUPO = VWHISTORIAL' +
              'GRUPO.IDHISTORIALGRUPO))'#10'VWHISTORIALALUMNO'#10'WHERE IDALUMNO = :IDA' +
              'LUMNO'#10#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDHISTORIALALUMNO'
                TableField = 'IDHISTORIALALUMNO'
              end
              item
                DatasetField = 'IDALUMNO'
                TableField = 'IDALUMNO'
              end
              item
                DatasetField = 'GRUPOCODIGO'
                TableField = 'GRUPOCODIGO'
              end
              item
                DatasetField = 'CICLOCODIGO'
                TableField = 'CICLOCODIGO'
              end
              item
                DatasetField = 'IDHISTORIALGRUPO'
                TableField = 'IDHISTORIALGRUPO'
              end
              item
                DatasetField = 'IDCICLO'
                TableField = 'IDCICLO'
              end>
          end>
        Name = 'spHistorialAlumnoCaja'
        Fields = <
          item
            Name = 'IDHISTORIALALUMNO'
            DataType = datInteger
          end
          item
            Name = 'IDALUMNO'
            DataType = datInteger
          end
          item
            Name = 'GRUPOCODIGO'
            DataType = datString
            Size = 10
          end
          item
            Name = 'CICLOCODIGO'
            DataType = datString
            Size = 10
          end
          item
            Name = 'IDHISTORIALGRUPO'
            DataType = datInteger
          end
          item
            Name = 'IDCICLO'
            DataType = datInteger
          end>
      end
      item
        Params = <
          item
            Name = 'idAlumno'
            Value = '1'
          end
          item
            Name = 'numcontrol'
            Value = '1'
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
            SQL = 
              'select idalumno,numcontrol, nombre from Alumno'#10'where (idAlumno =' +
              ' :idAlumno) or (numcontrol like :numcontrol)'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'idalumno'
                TableField = 'idalumno'
              end
              item
                DatasetField = 'numcontrol'
                TableField = 'numcontrol'
              end
              item
                DatasetField = 'nombre'
                TableField = 'nombre'
              end>
          end>
        Name = 'spAlumnosCaja'
        Fields = <
          item
            Name = 'idalumno'
            DataType = datInteger
          end
          item
            Name = 'numcontrol'
            DataType = datString
            Size = 12
          end
          item
            Name = 'nombre'
            DataType = datString
            Size = 70
          end>
      end
      item
        Params = <
          item
            Name = 'idcalificacion'
            Value = '1'
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
            SQL = 
              'SELECT IDCALIFICACION, IDMATERIA, IDHISTORIALALUMNO, IDHISTORIAL' +
              'GRUPO, IDTIPOCALIFICACION, CALIFICACION,'#10'       CALIFAUX1, CALIF' +
              'AUX2, STATUS, FALTAS, FECHA, CALIF01, CALIF02, CALIF03, CALIF04,' +
              ' CALIF05, CALIF06,'#10'       CALIF07, CALIF08, CALIF09, CALIF10, CA' +
              'LIF11, CALIF12, CALIF13, CALIF14, CALIF15, CALIF16, CALIFA01,'#10'  ' +
              '     CALIFA02, CALIFA03, CALIFA04, CALIFA05, CALIFA06, CALIFA07,' +
              ' CALIFA08, CALIFA09, CALIFA10, CALIFA11,'#10'       CALIFA12, CALIFA' +
              '13, CALIFA14, CALIFA15, CALIFA16, CALIFB01, CALIFB02, CALIFB03, ' +
              'CALIFB04, CALIFB05,'#10'       CALIFB06,  CALIFB07, CALIFB08, CALIFB' +
              '09, CALIFB10, CALIFB11, CALIFB12, CALIFB13, CALIFB14, CALIFB15,'#10 +
              '       CALIFB16, FALTAS01, FALTAS02, FALTAS03, FALTAS04, FALTAS0' +
              '5, FALTAS06, FALTAS07, FALTAS08, FALTAS09,'#10'       FALTAS10, FALT' +
              'AS11, FALTAS12, FALTAS13, FALTAS14, FALTAS15, FALTAS16, REGU01, ' +
              'REGU02, REGU03, REGU04,'#10'       REGU05, CALIFC01, CALIFC02, CALIF' +
              'C03, CALIFC04, CALIFC05, CALIFC06, CALIFC07, CALIFC08, CALIFC09,' +
              ' CALIFC10,'#10'       CALIFC11, CALIFC12, CALIFC13, CALIFC14, CALIFC' +
              '15, CALIFC16, CALIFAUX3'#10'FROM CALIFICACION'#10'where idcalificacion =' +
              ' :idcalificacion'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDCALIFICACION'
                TableField = 'IDCALIFICACION'
              end
              item
                DatasetField = 'IDMATERIA'
                TableField = 'IDMATERIA'
              end
              item
                DatasetField = 'IDHISTORIALALUMNO'
                TableField = 'IDHISTORIALALUMNO'
              end
              item
                DatasetField = 'IDHISTORIALGRUPO'
                TableField = 'IDHISTORIALGRUPO'
              end
              item
                DatasetField = 'IDTIPOCALIFICACION'
                TableField = 'IDTIPOCALIFICACION'
              end
              item
                DatasetField = 'CALIFICACION'
                TableField = 'CALIFICACION'
              end
              item
                DatasetField = 'CALIFAUX1'
                TableField = 'CALIFAUX1'
              end
              item
                DatasetField = 'CALIFAUX2'
                TableField = 'CALIFAUX2'
              end
              item
                DatasetField = 'STATUS'
                TableField = 'STATUS'
              end
              item
                DatasetField = 'FALTAS'
                TableField = 'FALTAS'
              end
              item
                DatasetField = 'FECHA'
                TableField = 'FECHA'
              end
              item
                DatasetField = 'CALIF01'
                TableField = 'CALIF01'
              end
              item
                DatasetField = 'CALIF02'
                TableField = 'CALIF02'
              end
              item
                DatasetField = 'CALIF03'
                TableField = 'CALIF03'
              end
              item
                DatasetField = 'CALIF04'
                TableField = 'CALIF04'
              end
              item
                DatasetField = 'CALIF05'
                TableField = 'CALIF05'
              end
              item
                DatasetField = 'CALIF06'
                TableField = 'CALIF06'
              end
              item
                DatasetField = 'CALIF07'
                TableField = 'CALIF07'
              end
              item
                DatasetField = 'CALIF08'
                TableField = 'CALIF08'
              end
              item
                DatasetField = 'CALIF09'
                TableField = 'CALIF09'
              end
              item
                DatasetField = 'CALIF10'
                TableField = 'CALIF10'
              end
              item
                DatasetField = 'CALIF11'
                TableField = 'CALIF11'
              end
              item
                DatasetField = 'CALIF12'
                TableField = 'CALIF12'
              end
              item
                DatasetField = 'CALIF13'
                TableField = 'CALIF13'
              end
              item
                DatasetField = 'CALIF14'
                TableField = 'CALIF14'
              end
              item
                DatasetField = 'CALIF15'
                TableField = 'CALIF15'
              end
              item
                DatasetField = 'CALIF16'
                TableField = 'CALIF16'
              end
              item
                DatasetField = 'CALIFA01'
                TableField = 'CALIFA01'
              end
              item
                DatasetField = 'CALIFA02'
                TableField = 'CALIFA02'
              end
              item
                DatasetField = 'CALIFA03'
                TableField = 'CALIFA03'
              end
              item
                DatasetField = 'CALIFA04'
                TableField = 'CALIFA04'
              end
              item
                DatasetField = 'CALIFA05'
                TableField = 'CALIFA05'
              end
              item
                DatasetField = 'CALIFA06'
                TableField = 'CALIFA06'
              end
              item
                DatasetField = 'CALIFA07'
                TableField = 'CALIFA07'
              end
              item
                DatasetField = 'CALIFA08'
                TableField = 'CALIFA08'
              end
              item
                DatasetField = 'CALIFA09'
                TableField = 'CALIFA09'
              end
              item
                DatasetField = 'CALIFA10'
                TableField = 'CALIFA10'
              end
              item
                DatasetField = 'CALIFA11'
                TableField = 'CALIFA11'
              end
              item
                DatasetField = 'CALIFA12'
                TableField = 'CALIFA12'
              end
              item
                DatasetField = 'CALIFA13'
                TableField = 'CALIFA13'
              end
              item
                DatasetField = 'CALIFA14'
                TableField = 'CALIFA14'
              end
              item
                DatasetField = 'CALIFA15'
                TableField = 'CALIFA15'
              end
              item
                DatasetField = 'CALIFA16'
                TableField = 'CALIFA16'
              end
              item
                DatasetField = 'CALIFB01'
                TableField = 'CALIFB01'
              end
              item
                DatasetField = 'CALIFB02'
                TableField = 'CALIFB02'
              end
              item
                DatasetField = 'CALIFB03'
                TableField = 'CALIFB03'
              end
              item
                DatasetField = 'CALIFB04'
                TableField = 'CALIFB04'
              end
              item
                DatasetField = 'CALIFB05'
                TableField = 'CALIFB05'
              end
              item
                DatasetField = 'CALIFB07'
                TableField = 'CALIFB07'
              end
              item
                DatasetField = 'CALIFB08'
                TableField = 'CALIFB08'
              end
              item
                DatasetField = 'CALIFB09'
                TableField = 'CALIFB09'
              end
              item
                DatasetField = 'CALIFB10'
                TableField = 'CALIFB10'
              end
              item
                DatasetField = 'CALIFB11'
                TableField = 'CALIFB11'
              end
              item
                DatasetField = 'CALIFB12'
                TableField = 'CALIFB12'
              end
              item
                DatasetField = 'CALIFB13'
                TableField = 'CALIFB13'
              end
              item
                DatasetField = 'CALIFB14'
                TableField = 'CALIFB14'
              end
              item
                DatasetField = 'CALIFB15'
                TableField = 'CALIFB15'
              end
              item
                DatasetField = 'CALIFB16'
                TableField = 'CALIFB16'
              end
              item
                DatasetField = 'FALTAS01'
                TableField = 'FALTAS01'
              end
              item
                DatasetField = 'FALTAS02'
                TableField = 'FALTAS02'
              end
              item
                DatasetField = 'FALTAS03'
                TableField = 'FALTAS03'
              end
              item
                DatasetField = 'FALTAS04'
                TableField = 'FALTAS04'
              end
              item
                DatasetField = 'FALTAS05'
                TableField = 'FALTAS05'
              end
              item
                DatasetField = 'FALTAS06'
                TableField = 'FALTAS06'
              end
              item
                DatasetField = 'FALTAS07'
                TableField = 'FALTAS07'
              end
              item
                DatasetField = 'FALTAS08'
                TableField = 'FALTAS08'
              end
              item
                DatasetField = 'FALTAS09'
                TableField = 'FALTAS09'
              end
              item
                DatasetField = 'FALTAS10'
                TableField = 'FALTAS10'
              end
              item
                DatasetField = 'FALTAS11'
                TableField = 'FALTAS11'
              end
              item
                DatasetField = 'FALTAS12'
                TableField = 'FALTAS12'
              end
              item
                DatasetField = 'FALTAS13'
                TableField = 'FALTAS13'
              end
              item
                DatasetField = 'FALTAS14'
                TableField = 'FALTAS14'
              end
              item
                DatasetField = 'FALTAS15'
                TableField = 'FALTAS15'
              end
              item
                DatasetField = 'FALTAS16'
                TableField = 'FALTAS16'
              end
              item
                DatasetField = 'REGU01'
                TableField = 'REGU01'
              end
              item
                DatasetField = 'REGU02'
                TableField = 'REGU02'
              end
              item
                DatasetField = 'REGU03'
                TableField = 'REGU03'
              end
              item
                DatasetField = 'REGU04'
                TableField = 'REGU04'
              end
              item
                DatasetField = 'REGU05'
                TableField = 'REGU05'
              end
              item
                DatasetField = 'CALIFC01'
                TableField = 'CALIFC01'
              end
              item
                DatasetField = 'CALIFC02'
                TableField = 'CALIFC02'
              end
              item
                DatasetField = 'CALIFC03'
                TableField = 'CALIFC03'
              end
              item
                DatasetField = 'CALIFC04'
                TableField = 'CALIFC04'
              end
              item
                DatasetField = 'CALIFC05'
                TableField = 'CALIFC05'
              end
              item
                DatasetField = 'CALIFC06'
                TableField = 'CALIFC06'
              end
              item
                DatasetField = 'CALIFC07'
                TableField = 'CALIFC07'
              end
              item
                DatasetField = 'CALIFC08'
                TableField = 'CALIFC08'
              end
              item
                DatasetField = 'CALIFC09'
                TableField = 'CALIFC09'
              end
              item
                DatasetField = 'CALIFC10'
                TableField = 'CALIFC10'
              end
              item
                DatasetField = 'CALIFC11'
                TableField = 'CALIFC11'
              end
              item
                DatasetField = 'CALIFC12'
                TableField = 'CALIFC12'
              end
              item
                DatasetField = 'CALIFC13'
                TableField = 'CALIFC13'
              end
              item
                DatasetField = 'CALIFC14'
                TableField = 'CALIFC14'
              end
              item
                DatasetField = 'CALIFC15'
                TableField = 'CALIFC15'
              end
              item
                DatasetField = 'CALIFC16'
                TableField = 'CALIFC16'
              end
              item
                DatasetField = 'CALIFAUX3'
                TableField = 'CALIFAUX3'
              end
              item
                DatasetField = 'CALIFB06'
                TableField = 'CALIFB06'
              end>
          end>
        Name = 'spCalificacion'
        Fields = <
          item
            Name = 'IDCALIFICACION'
            DataType = datInteger
            InPrimaryKey = True
          end
          item
            Name = 'IDMATERIA'
            DataType = datInteger
          end
          item
            Name = 'IDHISTORIALALUMNO'
            DataType = datInteger
          end
          item
            Name = 'IDHISTORIALGRUPO'
            DataType = datInteger
          end
          item
            Name = 'IDTIPOCALIFICACION'
            DataType = datInteger
          end
          item
            Name = 'CALIFICACION'
            DataType = datFloat
          end
          item
            Name = 'CALIFAUX1'
            DataType = datFloat
          end
          item
            Name = 'CALIFAUX2'
            DataType = datFloat
          end
          item
            Name = 'STATUS'
            DataType = datString
            Size = 1
          end
          item
            Name = 'FALTAS'
            DataType = datInteger
          end
          item
            Name = 'FECHA'
            DataType = datDateTime
          end
          item
            Name = 'CALIF01'
            DataType = datFloat
          end
          item
            Name = 'CALIF02'
            DataType = datFloat
          end
          item
            Name = 'CALIF03'
            DataType = datFloat
          end
          item
            Name = 'CALIF04'
            DataType = datFloat
          end
          item
            Name = 'CALIF05'
            DataType = datFloat
          end
          item
            Name = 'CALIF06'
            DataType = datFloat
          end
          item
            Name = 'CALIF07'
            DataType = datFloat
          end
          item
            Name = 'CALIF08'
            DataType = datFloat
          end
          item
            Name = 'CALIF09'
            DataType = datFloat
          end
          item
            Name = 'CALIF10'
            DataType = datFloat
          end
          item
            Name = 'CALIF11'
            DataType = datFloat
          end
          item
            Name = 'CALIF12'
            DataType = datFloat
          end
          item
            Name = 'CALIF13'
            DataType = datFloat
          end
          item
            Name = 'CALIF14'
            DataType = datFloat
          end
          item
            Name = 'CALIF15'
            DataType = datFloat
          end
          item
            Name = 'CALIF16'
            DataType = datFloat
          end
          item
            Name = 'CALIFA01'
            DataType = datFloat
          end
          item
            Name = 'CALIFA02'
            DataType = datFloat
          end
          item
            Name = 'CALIFA03'
            DataType = datFloat
          end
          item
            Name = 'CALIFA04'
            DataType = datFloat
          end
          item
            Name = 'CALIFA05'
            DataType = datFloat
          end
          item
            Name = 'CALIFA06'
            DataType = datFloat
          end
          item
            Name = 'CALIFA07'
            DataType = datFloat
          end
          item
            Name = 'CALIFA08'
            DataType = datFloat
          end
          item
            Name = 'CALIFA09'
            DataType = datFloat
          end
          item
            Name = 'CALIFA10'
            DataType = datFloat
          end
          item
            Name = 'CALIFA11'
            DataType = datFloat
          end
          item
            Name = 'CALIFA12'
            DataType = datFloat
          end
          item
            Name = 'CALIFA13'
            DataType = datFloat
          end
          item
            Name = 'CALIFA14'
            DataType = datFloat
          end
          item
            Name = 'CALIFA15'
            DataType = datFloat
          end
          item
            Name = 'CALIFA16'
            DataType = datFloat
          end
          item
            Name = 'CALIFB01'
            DataType = datFloat
          end
          item
            Name = 'CALIFB02'
            DataType = datFloat
          end
          item
            Name = 'CALIFB03'
            DataType = datFloat
          end
          item
            Name = 'CALIFB04'
            DataType = datFloat
          end
          item
            Name = 'CALIFB05'
            DataType = datFloat
          end
          item
            Name = 'CALIFB06'
            DataType = datFloat
          end
          item
            Name = 'CALIFB07'
            DataType = datFloat
          end
          item
            Name = 'CALIFB08'
            DataType = datFloat
          end
          item
            Name = 'CALIFB09'
            DataType = datFloat
          end
          item
            Name = 'CALIFB10'
            DataType = datFloat
          end
          item
            Name = 'CALIFB11'
            DataType = datFloat
          end
          item
            Name = 'CALIFB12'
            DataType = datFloat
          end
          item
            Name = 'CALIFB13'
            DataType = datFloat
          end
          item
            Name = 'CALIFB14'
            DataType = datFloat
          end
          item
            Name = 'CALIFB15'
            DataType = datFloat
          end
          item
            Name = 'CALIFB16'
            DataType = datFloat
          end
          item
            Name = 'FALTAS01'
            DataType = datFloat
          end
          item
            Name = 'FALTAS02'
            DataType = datFloat
          end
          item
            Name = 'FALTAS03'
            DataType = datFloat
          end
          item
            Name = 'FALTAS04'
            DataType = datFloat
          end
          item
            Name = 'FALTAS05'
            DataType = datFloat
          end
          item
            Name = 'FALTAS06'
            DataType = datFloat
          end
          item
            Name = 'FALTAS07'
            DataType = datFloat
          end
          item
            Name = 'FALTAS08'
            DataType = datFloat
          end
          item
            Name = 'FALTAS09'
            DataType = datFloat
          end
          item
            Name = 'FALTAS10'
            DataType = datFloat
          end
          item
            Name = 'FALTAS11'
            DataType = datFloat
          end
          item
            Name = 'FALTAS12'
            DataType = datFloat
          end
          item
            Name = 'FALTAS13'
            DataType = datFloat
          end
          item
            Name = 'FALTAS14'
            DataType = datFloat
          end
          item
            Name = 'FALTAS15'
            DataType = datFloat
          end
          item
            Name = 'FALTAS16'
            DataType = datFloat
          end
          item
            Name = 'REGU01'
            DataType = datFloat
          end
          item
            Name = 'REGU02'
            DataType = datFloat
          end
          item
            Name = 'REGU03'
            DataType = datFloat
          end
          item
            Name = 'REGU04'
            DataType = datFloat
          end
          item
            Name = 'REGU05'
            DataType = datFloat
          end
          item
            Name = 'CALIFC01'
            DataType = datFloat
          end
          item
            Name = 'CALIFC02'
            DataType = datFloat
          end
          item
            Name = 'CALIFC03'
            DataType = datFloat
          end
          item
            Name = 'CALIFC04'
            DataType = datFloat
          end
          item
            Name = 'CALIFC05'
            DataType = datFloat
          end
          item
            Name = 'CALIFC06'
            DataType = datFloat
          end
          item
            Name = 'CALIFC07'
            DataType = datFloat
          end
          item
            Name = 'CALIFC08'
            DataType = datFloat
          end
          item
            Name = 'CALIFC09'
            DataType = datFloat
          end
          item
            Name = 'CALIFC10'
            DataType = datFloat
          end
          item
            Name = 'CALIFC11'
            DataType = datFloat
          end
          item
            Name = 'CALIFC12'
            DataType = datFloat
          end
          item
            Name = 'CALIFC13'
            DataType = datFloat
          end
          item
            Name = 'CALIFC14'
            DataType = datFloat
          end
          item
            Name = 'CALIFC15'
            DataType = datFloat
          end
          item
            Name = 'CALIFC16'
            DataType = datFloat
          end
          item
            Name = 'CALIFAUX3'
            DataType = datFloat
          end>
      end
      item
        Params = <
          item
            Name = 'IDCICLO'
            Value = '5'
            ParamType = daptInput
          end
          item
            Name = 'IDNIVEL'
            Value = '1'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
            SQL = 
              'SELECT'#10'  CALIFICACION.IDCALIFICACION'#10'FROM'#10'  (SELECT HISTORIALALU' +
              'MNO.IDHISTORIALALUMNO,'#10'       HISTORIALALUMNO.DOCUMENTOSFALTANTE' +
              'S,'#10'       VWHISTORIALGRUPO.IDHISTORIALGRUPO,'#10'       VWHISTORIALG' +
              'RUPO.IDCICLO,'#10'       VWHISTORIALGRUPO.IDGRUPO,'#10'       VWHISTORIA' +
              'LGRUPO.IDNIVEL,'#10'       ALUMNO.IDALUMNO,'#10'       ALUMNO.NOMBRE AS ' +
              'ALUMNONOMBRE,'#10'       ALUMNO.NUMCONTROL AS ALUMNONUMCONTROL,'#10'    ' +
              '   ALUMNO.SEXO AS ALUMNOSEXO,'#10'       VWHISTORIALGRUPO.GRUPOCODIG' +
              'O,'#10'       VWHISTORIALGRUPO.GRUPONOMBRE,'#10'       VWHISTORIALGRUPO.' +
              'GRUPOAUX1,'#10'       VWHISTORIALGRUPO.GRUPOAUX2,'#10'       VWHISTORIAL' +
              'GRUPO.NIVELCODIGO,'#10'       VWHISTORIALGRUPO.NIVELNOMBRE,'#10'       V' +
              'WHISTORIALGRUPO.NIVELAUX1,'#10'       VWHISTORIALGRUPO.NIVELAUX2,'#10'  ' +
              '     VWHISTORIALGRUPO.CICLOCODIGO,'#10'       VWHISTORIALGRUPO.CICLO' +
              'NOMBRE,'#10'       VWHISTORIALGRUPO.CICLOAUX1,'#10'       VWHISTORIALGRU' +
              'PO.CICLOAUX2,'#10'       VWHISTORIALGRUPO.CICLOFECHAINICIO,'#10'       V' +
              'WHISTORIALGRUPO.CICLOFECHAFINAL,'#10'       STATUS.IDSTATUS,'#10'       ' +
              'STATUS.CODIGO AS STATUSCODIGO,'#10'       STATUS.NOMBRE AS STATUSNOM' +
              'BRE,'#10'       HISTORIALALUMNO.BECA,'#10'       HISTORIALALUMNO.DESCUEN' +
              'TO'#10'FROM STATUS'#10'   INNER JOIN ALUMNO ON (STATUS.IDSTATUS = ALUMNO' +
              '.IDSTATUS)'#10'   INNER JOIN HISTORIALALUMNO ON (ALUMNO.IDALUMNO = H' +
              'ISTORIALALUMNO.IDALUMNO)'#10'   INNER JOIN'#10'   (SELECT HISTORIALGRUPO' +
              '.IDHISTORIALGRUPO,'#10'       NIVEL.IDNIVEL,'#10'       CICLO.IDCICLO,'#10' ' +
              '      GRUPO.IDGRUPO,'#10'       GRUPO.CODIGO AS GRUPOCODIGO,'#10'       ' +
              'GRUPO.NOMBRE AS GRUPONOMBRE,'#10'       GRUPO.NOMBREaux1 AS GRUPOaux' +
              '1,'#10'       GRUPO.NOMBREaux2 AS GRUPOaux2,'#10'       grupo.cupo,'#10'    ' +
              '   NIVEL.CODIGO AS NIVELCODIGO,'#10'       NIVEL.NOMBRE AS NIVELNOMB' +
              'RE,'#10'       NIVEL.NOMBREaux1 AS NIVELaux1,'#10'       NIVEL.NOMBREaux' +
              '2 AS NIVELaux2,'#10'       CICLO.CODIGO AS CICLOCODIGO,'#10'       CICLO' +
              '.NOMBRE AS CICLONOMBRE,'#10'       CICLO.NOMBREaux1 AS CICLOaux1,'#10'  ' +
              '     CICLO.NOMBREaux2 AS CICLOaux2,'#10'       CICLO.FECHAFINAL AS C' +
              'ICLOFECHAFINAL,'#10'       CICLO.FECHAINICIO AS CICLOFECHAINICIO'#10'FRO' +
              'M GRUPO'#10'   INNER JOIN NIVEL ON (GRUPO.IDNIVEL = NIVEL.IDNIVEL)'#10' ' +
              '  INNER JOIN HISTORIALGRUPO ON (GRUPO.IDGRUPO = HISTORIALGRUPO.I' +
              'DGRUPO)'#10'   INNER JOIN CICLO ON (HISTORIALGRUPO.IDCICLO = CICLO.I' +
              'DCICLO))'#10'   VWHISTORIALGRUPO ON (HISTORIALALUMNO.IDHISTORIALGRUP' +
              'O = VWHISTORIALGRUPO.IDHISTORIALGRUPO))'#10'   VWHISTORIALALUMNO'#10'   ' +
              'INNER JOIN CALIFICACION ON (VWHISTORIALALUMNO.IDHISTORIALALUMNO ' +
              '= CALIFICACION.IDHISTORIALALUMNO)'#10'WHERE'#10'  (VWHISTORIALALUMNO.IDC' +
              'ICLO = :IDCICLO) AND'#10'  (VWHISTORIALALUMNO.IDNIVEL = :IDNIVEL)'#10#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDCALIFICACION'
                TableField = 'IDCALIFICACION'
              end>
          end>
        Name = 'spAlumnosCalculaPromedio'
        Fields = <
          item
            Name = 'IDCALIFICACION'
            DataType = datInteger
          end>
      end
      item
        Params = <
          item
            Name = 'grupo'
            Value = '5'
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
            SQL = 
              'select distinct idmateria, materianombre, materiacodigo'#10'from'#10'(SE' +
              'LECT VWCALIFICACIONES.IDCALIFICACION,'#10'       VWCALIFICACIONES.ID' +
              'MATERIA,'#10'       VWCALIFICACIONES.CALIFICACION,'#10'       VWCALIFICA' +
              'CIONES.STATUS,'#10'       VWCALIFICACIONES.FALTAS,'#10'       VWCALIFICA' +
              'CIONES.FECHACALIFICACION,'#10'       VWCALIFICACIONES.IDHISTORIALALU' +
              'MNO,'#10'       VWCALIFICACIONES.IDHISTORIALGRUPO,'#10'       VWCALIFICA' +
              'CIONES.IDTIPOCALIFICACION,'#10'       VWCALIFICACIONES.CODIGOTIPOCAL' +
              'IFICACION,'#10'       VWCALIFICACIONES.NOMBRETIPOCALIFICACION,'#10'     ' +
              '  VWCALIFICACIONES.TIPOCALIFICACIONAUX1,'#10'       VWCALIFICACIONES' +
              '.TIPOCALIFICACIONAUX2,'#10'       VWCALIFICACIONES.MATERIACODIGO,'#10'  ' +
              '     VWCALIFICACIONES.MATERIANOMBRE,'#10'       VWCALIFICACIONES.MAT' +
              'ERIAAUX1,'#10'       VWCALIFICACIONES.MATERIAAUX2,'#10'       VWCALIFICA' +
              'CIONES.CREDITOS,'#10'       VWCALIFICACIONES.MINIMOAPRO,'#10'       VWCA' +
              'LIFICACIONES.MAXIMOFALTAS,'#10'       VWCALIFICACIONES.SERIADACONCOD' +
              'IGO,'#10'       VWCALIFICACIONES.SERIADACONNOMBRE,'#10'       VWGRUPOSAL' +
              'UMNOSACTUALES.IDALUMNO,'#10'       VWGRUPOSALUMNOSACTUALES.ALUMNONOM' +
              'BRE,'#10'       VWGRUPOSALUMNOSACTUALES.ALUMNONUMCONTROL,'#10'       VWG' +
              'RUPOSALUMNOSACTUALES.IDSTATUSALUMNO,'#10'       VWGRUPOSALUMNOSACTUA' +
              'LES.IDGRUPO,'#10'       VWGRUPOSALUMNOSACTUALES.GRUPOCODIGO,'#10'       ' +
              'VWGRUPOSALUMNOSACTUALES.GRUPONOMBRE,'#10'       VWGRUPOSALUMNOSACTUA' +
              'LES.NIVELCODIGO,'#10'       VWGRUPOSALUMNOSACTUALES.NIVELNOMBRE,'#10'   ' +
              '    VWGRUPOSALUMNOSACTUALES.IdNivel,'#10'       VWGRUPOSALUMNOSACTUA' +
              'LES.IDCICLO,'#10'       VWGRUPOSALUMNOSACTUALES.CICLOCODIGO,'#10'       ' +
              'VWGRUPOSALUMNOSACTUALES.CICLONOMBRE,'#10'       vwcalificaciones.CAL' +
              'IFAUX2,'#10'       vwcalificaciones.CALIFAUX1'#10'FROM'#10'   (SELECT HISTOR' +
              'IALALUMNO.IDHISTORIALALUMNO,'#10'       VWHISTORIALGRUPO.IDHISTORIAL' +
              'GRUPO,'#10'       ALUMNO.IDALUMNO,'#10'       ALUMNO.NOMBRE AS ALUMNONOM' +
              'BRE,'#10'       ALUMNO.NUMCONTROL AS ALUMNONUMCONTROL,'#10'       ALUMNO' +
              '.idstatus AS IDSTATUSALUMNO,'#10'       VWHISTORIALGRUPO.IDGRUPO,'#10'  ' +
              '     VWHISTORIALGRUPO.GRUPOCODIGO,'#10'       VWHISTORIALGRUPO.GRUPO' +
              'NOMBRE,'#10'       VWHISTORIALGRUPO.NIVELCODIGO,'#10'       VWHISTORIALG' +
              'RUPO.NIVELNOMBRE,'#10'       VWHISTORIALGRUPO.IDCICLO,'#10'       VWHIST' +
              'ORIALGRUPO.IDNIVEL,'#10'       VWHISTORIALGRUPO.CICLOCODIGO,'#10'       ' +
              'VWHISTORIALGRUPO.CICLONOMBRE'#10'FROM ALUMNO'#10'   INNER JOIN HISTORIAL' +
              'ALUMNO ON (ALUMNO.IDALUMNO = HISTORIALALUMNO.IDALUMNO)'#10'   INNER ' +
              'JOIN (SELECT HISTORIALGRUPO.IDHISTORIALGRUPO,'#10'       NIVEL.IDNIV' +
              'EL,'#10'       CICLO.IDCICLO,'#10'       GRUPO.IDGRUPO,'#10'       GRUPO.COD' +
              'IGO AS GRUPOCODIGO,'#10'       GRUPO.NOMBRE AS GRUPONOMBRE,'#10'       G' +
              'RUPO.NOMBREaux1 AS GRUPOaux1,'#10'       GRUPO.NOMBREaux2 AS GRUPOau' +
              'x2,'#10'       grupo.cupo,'#10'       NIVEL.CODIGO AS NIVELCODIGO,'#10'     ' +
              '  NIVEL.NOMBRE AS NIVELNOMBRE,'#10'       NIVEL.NOMBREaux1 AS NIVELa' +
              'ux1,'#10'       NIVEL.NOMBREaux2 AS NIVELaux2,'#10'       CICLO.CODIGO A' +
              'S CICLOCODIGO,'#10'       CICLO.NOMBRE AS CICLONOMBRE,'#10'       CICLO.' +
              'NOMBREaux1 AS CICLOaux1,'#10'       CICLO.NOMBREaux2 AS CICLOaux2,'#10' ' +
              '      CICLO.FECHAFINAL AS CICLOFECHAFINAL,'#10'       CICLO.FECHAINI' +
              'CIO AS CICLOFECHAINICIO'#10'FROM GRUPO'#10'   INNER JOIN NIVEL ON (GRUPO' +
              '.IDNIVEL = NIVEL.IDNIVEL)'#10'   INNER JOIN HISTORIALGRUPO ON (GRUPO' +
              '.IDGRUPO = HISTORIALGRUPO.IDGRUPO)'#10'   INNER JOIN CICLO ON (HISTO' +
              'RIALGRUPO.IDCICLO = CICLO.IDCICLO))'#10#10'   VWHISTORIALGRUPO ON (HIS' +
              'TORIALALUMNO.IDHISTORIALGRUPO = VWHISTORIALGRUPO.IDHISTORIALGRUP' +
              'O))'#10#10'VWGRUPOSALUMNOSACTUALES'#10'   INNER JOIN'#10'   (SELECT CALIFICACI' +
              'ON.IDCALIFICACION,'#10'       CALIFICACION.IDMATERIA,'#10'       CALIFIC' +
              'ACION.CALIFICACION,'#10'       CALIFICACION.STATUS,'#10'       CALIFICAC' +
              'ION.FALTAS,'#10'       CALIFICACION.FECHA AS FECHACALIFICACION,'#10'    ' +
              '   CALIFICACION.IDHISTORIALALUMNO,'#10'       CALIFICACION.IDHISTORI' +
              'ALGRUPO,'#10'       CALIFICACION.IDTIPOCALIFICACION,'#10'       TIPOCALI' +
              'FICACION.CODIGO AS CODIGOTIPOCALIFICACION,'#10'       TIPOCALIFICACI' +
              'ON.NOMBRE AS NOMBRETIPOCALIFICACION,'#10'       TIPOCALIFICACION.NOM' +
              'BREAUX1 AS TIPOCALIFICACIONAUX1,'#10'       TIPOCALIFICACION.NOMBREA' +
              'UX2 AS TIPOCALIFICACIONAUX2,'#10'       VWMATERIAS.CODIGO AS MATERIA' +
              'CODIGO,'#10'       VWMATERIAS.NOMBRE AS MATERIANOMBRE,'#10'       VWMATE' +
              'RIAS.MATERIAAUX1,'#10'       VWMATERIAS.MATERIAAUX2,'#10'       VWMATERI' +
              'AS.CREDITOS,'#10'       VWMATERIAS.MINIMOAPRO,'#10'       VWMATERIAS.MAX' +
              'IMOFALTAS,'#10'       VWMATERIAS.SERIADACONCODIGO,'#10'       VWMATERIAS' +
              '.SERIADACONNOMBRE,'#10'       calificacion.califaux2,'#10'       calific' +
              'acion.califaux1'#10'FROM'#10'   (SELECT MATERIA.IDMATERIA,'#10'       MATERI' +
              'A.codigo,'#10'       MATERIA.nombre,'#10'       MATERIA.nombreaux1 AS MA' +
              'TERIAAUX1,'#10'       MATERIA.nombreaux2 AS MATERIAAUX2,'#10'       MATE' +
              'RIA.CREDITOS,'#10'       MATERIA.MINIMOAPRO,'#10'       MATERIA.MAXIMOFA' +
              'LTAS,'#10'       MATERIA.promedio,'#10'       MATERIA1.CODIGO AS SERIADA' +
              'CONCODIGO,'#10'       MATERIA1.NOMBRE AS SERIADACONNOMBRE'#10'FROM MATER' +
              'IA MATERIA1'#10'   RIGHT OUTER JOIN MATERIA ON (MATERIA1.IDMATERIA =' +
              ' MATERIA.SERIADACON))'#10'   VWMATERIAS'#10'   INNER JOIN CALIFICACION O' +
              'N (VWMATERIAS.IDMATERIA = CALIFICACION.IDMATERIA)'#10'   INNER JOIN ' +
              'TIPOCALIFICACION ON (CALIFICACION.IDTIPOCALIFICACION = TIPOCALIF' +
              'ICACION.IDTIPOCALIFICACION))'#10#10'VWCALIFICACIONES ON (VWGRUPOSALUMN' +
              'OSACTUALES.IDHISTORIALALUMNO = VWCALIFICACIONES.IDHISTORIALALUMN' +
              'O) AND (VWGRUPOSALUMNOSACTUALES.IDHISTORIALGRUPO = VWCALIFICACIO' +
              'NES.IDHISTORIALGRUPO))'#10#10'VWCALIFALUMNOSACTUAL'#10'where idgrupo=:grup' +
              'o'#10'order by materianombre'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'idmateria'
                TableField = 'idmateria'
              end
              item
                DatasetField = 'materianombre'
                TableField = 'materianombre'
              end
              item
                DatasetField = 'materiacodigo'
                TableField = 'materiacodigo'
              end>
          end>
        Name = 'spMateriaCaptura'
        Fields = <
          item
            Name = 'idmateria'
            DataType = datInteger
          end
          item
            Name = 'materianombre'
            DataType = datString
            Size = 50
          end
          item
            Name = 'materiacodigo'
            DataType = datString
            Size = 10
          end>
      end
      item
        Params = <
          item
            Name = 'IDNIVEL'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
            SQL = 
              'SELECT GRUPO.IDGRUPO,'#10'       GRUPO.CODIGO AS GRUPOCODIGO,'#10'      ' +
              ' GRUPO.NOMBRE AS GRUPONOMBRE'#10'FROM GRUPO'#10'WHERE IDNIVEL = :IDNIVEL' +
              #10'ORDER BY NOMBRE'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDGRUPO'
                TableField = 'IDGRUPO'
              end
              item
                DatasetField = 'GRUPOCODIGO'
                TableField = 'GRUPOCODIGO'
              end
              item
                DatasetField = 'GRUPONOMBRE'
                TableField = 'GRUPONOMBRE'
              end>
          end>
        Name = 'spGrupoCaptura'
        Fields = <
          item
            Name = 'IDGRUPO'
            DataType = datInteger
          end
          item
            Name = 'GRUPOCODIGO'
            DataType = datString
            Size = 10
          end
          item
            Name = 'GRUPONOMBRE'
            DataType = datString
            Size = 50
          end>
      end
      item
        Params = <
          item
            Name = 'idgrupop'
            Value = '0'
            ParamType = daptInput
          end
          item
            Name = 'idmateriaP'
            Value = '1'
            ParamType = daptInput
          end
          item
            Name = 'idcicloP'
            Value = '6'
            ParamType = daptInput
          end
          item
            Name = 'tipocalificacion'
            Value = '1'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
            SQL = 
              'create table #temp1'#10'(idalumno int,'#10' idHistorialAlumno int,'#10' idHi' +
              'storialGrupo int,'#10' idmateria int,'#10' idAlumnoNombre VARCHAR(70),'#10' ' +
              'alumnoNumControl VARCHAR(12),'#10' Calificacion FLOAT,'#10' Faltas int,'#10 +
              ' NOTA varchar(250),'#10' idTipoCalificacion FLOAT,'#10' idCiclo FLOAT,'#10' ' +
              'idGrupo INT,'#10' conducta FLOAT,'#10' CALIFAUX1 FLOAT,'#10' CALIFAUX3 FLOAT' +
              #10')'#10#10'DECLARE @sql as Varchar(500)'#10'DECLARE @formato varchar(2)'#10'DEC' +
              'LARE @Expresion varchar(60)'#10#10'DECLARE @idalumno INT'#10'DECLARE @idHi' +
              'storialAlumno INT'#10'DECLARE @idHistorialGrupo INT'#10'DECLARE @idMATer' +
              'ia INT'#10'DECLARE @idtipocalificacion INT'#10'DECLARE @alumnoNombre VAR' +
              'CHAR(100)'#10'DECLARE @alumnoNumControl VARCHAR(50)'#10'DECLARE @calific' +
              'acion FLOAT'#10'DECLARE @faltas FLOAT'#10'DECLARE @idciclo INT'#10'DECLARE @' +
              'idgrupo INT'#10'DECLARE @conducta FLOAT'#10'DECLARE @CALIFAUX1 FLOAT'#10'DEC' +
              'LARE @CALIFAUX3 FLOAT'#10'DECLARE @NOTA VARCHAR(250)'#10#10'declare Cursor' +
              'TipoCalificacion SCROLL CURSOR FOR'#10'SELECT distinct idalumno, idh' +
              'istorialAlumno,idhistorialgrupo, idmateria, idtipocalificacion,'#10 +
              '                alumnoNombre, alumnoNumControl, calificacion, fa' +
              'ltas, NOTA, idciclo, idgrupo, conducta, CALIFAUX1, CALIFAUX3'#10'   ' +
              '   FROM'#10'      /*VWCALIFICAALUMNOSACTUALES*/'#10'      (SELECT VWCALI' +
              'FICACIONES.IDCALIFICACION,'#10'       VWCALIFICACIONES.IDMATERIA,'#10'  ' +
              '     VWCALIFICACIONES.CALIFICACION,'#10'       VWCALIFICACIONES.NOTA' +
              ','#10'       VWCALIFICACIONES.STATUS,'#10'       VWCALIFICACIONES.FALTAS' +
              ','#10'       VWCALIFICACIONES.FECHACALIFICACION,'#10'       VWCALIFICACI' +
              'ONES.IDHISTORIALALUMNO,'#10'       VWCALIFICACIONES.IDHISTORIALGRUPO' +
              ','#10'       VWCALIFICACIONES.IDTIPOCALIFICACION,'#10'       VWCALIFICAC' +
              'IONES.CODIGOTIPOCALIFICACION,'#10'       VWCALIFICACIONES.NOMBRETIPO' +
              'CALIFICACION,'#10'       VWCALIFICACIONES.TIPOCALIFICACIONAUX1,'#10'    ' +
              '   VWCALIFICACIONES.TIPOCALIFICACIONAUX2,'#10'       VWCALIFICACIONE' +
              'S.MATERIACODIGO,'#10'       VWCALIFICACIONES.MATERIANOMBRE,'#10'       V' +
              'WCALIFICACIONES.MATERIAAUX1,'#10'       VWCALIFICACIONES.MATERIAAUX2' +
              ','#10'       VWCALIFICACIONES.CREDITOS,'#10'       VWCALIFICACIONES.MINI' +
              'MOAPRO,'#10'       VWCALIFICACIONES.MAXIMOFALTAS,'#10'       VWCALIFICAC' +
              'IONES.SERIADACONCODIGO,'#10'       VWCALIFICACIONES.SERIADACONNOMBRE' +
              ','#10'       VWGRUPOSALUMNOSACTUALES.IDALUMNO,'#10'       VWGRUPOSALUMNO' +
              'SACTUALES.ALUMNONOMBRE,'#10'       VWGRUPOSALUMNOSACTUALES.ALUMNONUM' +
              'CONTROL,'#10'       VWGRUPOSALUMNOSACTUALES.IDSTATUSALUMNO,'#10'       V' +
              'WGRUPOSALUMNOSACTUALES.IDGRUPO,'#10'       VWGRUPOSALUMNOSACTUALES.G' +
              'RUPOCODIGO,'#10'       VWGRUPOSALUMNOSACTUALES.GRUPONOMBRE,'#10'       V' +
              'WGRUPOSALUMNOSACTUALES.NIVELCODIGO,'#10'       VWGRUPOSALUMNOSACTUAL' +
              'ES.NIVELNOMBRE,'#10'       VWGRUPOSALUMNOSACTUALES.IdNivel,'#10'       V' +
              'WGRUPOSALUMNOSACTUALES.IDCICLO,'#10'       VWGRUPOSALUMNOSACTUALES.C' +
              'ICLOCODIGO,'#10'       VWGRUPOSALUMNOSACTUALES.CICLONOMBRE,'#10'       v' +
              'wcalificaciones.conducta,'#10'       vwcalificaciones.CALIFAUX1,'#10'   ' +
              '    vwcalificaciones.CALIFAUX3'#10'FROM'#10'/*vwgruposAlumnosActuales*/'#10 +
              '(SELECT HISTORIALALUMNO.IDHISTORIALALUMNO,'#10'       VWHISTORIALGRU' +
              'PO.IDHISTORIALGRUPO,'#10'       ALUMNO.IDALUMNO,'#10'       ALUMNO.NOMBR' +
              'E AS ALUMNONOMBRE,'#10'       ALUMNO.NUMCONTROL AS ALUMNONUMCONTROL,' +
              #10'       ALUMNO.idstatus AS IDSTATUSALUMNO,'#10'       VWHISTORIALGRU' +
              'PO.IDGRUPO,'#10'       VWHISTORIALGRUPO.GRUPOCODIGO,'#10'       VWHISTOR' +
              'IALGRUPO.GRUPONOMBRE,'#10'       VWHISTORIALGRUPO.NIVELCODIGO,'#10'     ' +
              '  VWHISTORIALGRUPO.NIVELNOMBRE,'#10'       VWHISTORIALGRUPO.IDCICLO,' +
              #10'       VWHISTORIALGRUPO.IDNIVEL,'#10'       VWHISTORIALGRUPO.CICLOC' +
              'ODIGO,'#10'       VWHISTORIALGRUPO.CICLONOMBRE'#10'FROM ALUMNO'#10'   INNER ' +
              'JOIN HISTORIALALUMNO ON (ALUMNO.IDALUMNO = HISTORIALALUMNO.IDALU' +
              'MNO)'#10'   INNER JOIN'#10'   (SELECT HISTORIALGRUPO.IDHISTORIALGRUPO,'#10' ' +
              '      NIVEL.IDNIVEL,'#10'       CICLO.IDCICLO,'#10'       GRUPO.IDGRUPO,' +
              #10'       GRUPO.CODIGO AS GRUPOCODIGO,'#10'       GRUPO.NOMBRE AS GRUP' +
              'ONOMBRE,'#10'       GRUPO.NOMBREaux1 AS GRUPOaux1,'#10'       GRUPO.NOMB' +
              'REaux2 AS GRUPOaux2,'#10'       grupo.cupo,'#10'       NIVEL.CODIGO AS N' +
              'IVELCODIGO,'#10'       NIVEL.NOMBRE AS NIVELNOMBRE,'#10'       NIVEL.NOM' +
              'BREaux1 AS NIVELaux1,'#10'       NIVEL.NOMBREaux2 AS NIVELaux2,'#10'    ' +
              '   CICLO.CODIGO AS CICLOCODIGO,'#10'       CICLO.NOMBRE AS CICLONOMB' +
              'RE,'#10'       CICLO.NOMBREaux1 AS CICLOaux1,'#10'       CICLO.NOMBREaux' +
              '2 AS CICLOaux2,'#10'       CICLO.FECHAFINAL AS CICLOFECHAFINAL,'#10'    ' +
              '   CICLO.FECHAINICIO AS CICLOFECHAINICIO'#10'FROM GRUPO'#10'   INNER JOI' +
              'N NIVEL ON (GRUPO.IDNIVEL = NIVEL.IDNIVEL)'#10'   INNER JOIN HISTORI' +
              'ALGRUPO ON (GRUPO.IDGRUPO = HISTORIALGRUPO.IDGRUPO)'#10'   INNER JOI' +
              'N CICLO ON (HISTORIALGRUPO.IDCICLO = CICLO.IDCICLO))'#10'   VWHISTOR' +
              'IALGRUPO ON (HISTORIALALUMNO.IDHISTORIALGRUPO = VWHISTORIALGRUPO' +
              '.IDHISTORIALGRUPO))'#10'VWGRUPOSALUMNOSACTUALES'#10'   INNER JOIN'#10'/*vwca' +
              'lificaciones*/'#10'(SELECT CALIFICACION.IDCALIFICACION,'#10'       CALIF' +
              'ICACION.IDMATERIA,'#10'       CALIFICACION.CALIFICACION,'#10'       CALI' +
              'FICACION.NOTA,'#10'       CALIFICACION.STATUS,'#10'       CALIFICACION.F' +
              'ALTAS,'#10'       CALIFICACION.FECHA AS FECHACALIFICACION,'#10'       CA' +
              'LIFICACION.IDHISTORIALALUMNO,'#10'       CALIFICACION.IDHISTORIALGRU' +
              'PO,'#10'       CALIFICACION.IDTIPOCALIFICACION,'#10'       TIPOCALIFICAC' +
              'ION.CODIGO AS CODIGOTIPOCALIFICACION,'#10'       TIPOCALIFICACION.NO' +
              'MBRE AS NOMBRETIPOCALIFICACION,'#10'       TIPOCALIFICACION.NOMBREAU' +
              'X1 AS TIPOCALIFICACIONAUX1,'#10'       TIPOCALIFICACION.NOMBREAUX2 A' +
              'S TIPOCALIFICACIONAUX2,'#10'       VWMATERIAS.CODIGO AS MATERIACODIG' +
              'O,'#10'       VWMATERIAS.NOMBRE AS MATERIANOMBRE,'#10'       VWMATERIAS.' +
              'MATERIAAUX1,'#10'       VWMATERIAS.MATERIAAUX2,'#10'       VWMATERIAS.CR' +
              'EDITOS,'#10'       VWMATERIAS.MINIMOAPRO,'#10'       VWMATERIAS.MAXIMOFA' +
              'LTAS,'#10'       VWMATERIAS.SERIADACONCODIGO,'#10'       VWMATERIAS.SERI' +
              'ADACONNOMBRE,'#10'       calificacion.califaux2 AS CONDUCTA,'#10'       ' +
              'calificacion.califaux1,'#10'       calificacion.califaux3'#10'FROM'#10'  /*V' +
              'WMATERIAS*/'#10'  (SELECT MATERIA.IDMATERIA,'#10'       MATERIA.codigo,'#10 +
              '       MATERIA.nombre,'#10'       MATERIA.nombreaux1 AS MATERIAAUX1,' +
              #10'       MATERIA.nombreaux2 AS MATERIAAUX2,'#10'       MATERIA.CREDIT' +
              'OS,'#10'       MATERIA.MINIMOAPRO,'#10'       MATERIA.MAXIMOFALTAS,'#10'    ' +
              '   MATERIA.promedio,'#10'       MATERIA1.CODIGO AS SERIADACONCODIGO,' +
              #10'       MATERIA1.NOMBRE AS SERIADACONNOMBRE'#10'   FROM MATERIA MATE' +
              'RIA1'#10'   RIGHT OUTER JOIN MATERIA ON (MATERIA1.IDMATERIA = MATERI' +
              'A.SERIADACON))'#10'   VWMATERIAS'#10'   INNER JOIN CALIFICACION ON (VWMA' +
              'TERIAS.IDMATERIA = CALIFICACION.IDMATERIA)'#10'   INNER JOIN TIPOCAL' +
              'IFICACION ON (CALIFICACION.IDTIPOCALIFICACION = TIPOCALIFICACION' +
              '.IDTIPOCALIFICACION))'#10'   VWCALIFICACIONES ON (VWGRUPOSALUMNOSACT' +
              'UALES.IDHISTORIALALUMNO = VWCALIFICACIONES.IDHISTORIALALUMNO) AN' +
              'D (VWGRUPOSALUMNOSACTUALES.IDHISTORIALGRUPO = VWCALIFICACIONES.I' +
              'DHISTORIALGRUPO))'#10'   VWCALIFALUMNOSACTUAL'#10'   WHERE idgrupo = :id' +
              'grupop and idmateria = :idmateriaP'#10'         and idciclo = :idcic' +
              'loP and IDSTATUSALUMNO <> 3'#10#10'open CursorTipoCalificacion'#10'fetch n' +
              'ext from CursorTipoCalificacion'#10'into @idalumno, @idhistorialAlum' +
              'no, @idhistorialgrupo, @idmateria, @idtipocalificacion, @alumnoN' +
              'ombre,'#10'     @alumnoNumControl, @calificacion, @faltas, @NOTA, @i' +
              'dciclo, @idgrupo, @conducta, @CALIFAUX1, @CALIFAUX3'#10#10#10'while @@fe' +
              'tch_status = 0'#10'begin'#10#10'/*****************************************' +
              '****************************************************************' +
              '****************************************************************' +
              '****************/'#10'    declare CursorTiposSin SCROLL CURSOR FOR'#10' ' +
              '   SELECT null,null, null, null, idTipoCalificacion'#10'           F' +
              'ROM  TipoCALIFICACION'#10'           WHERE idtipocalificacion not in' +
              ' (select idtipocalificacion'#10'                                    ' +
              '        from calificacion where'#10'                                ' +
              '            idhistorialalumno    = @idhistorialalumno'#10'          ' +
              '                                  and idhistorialgrupo = @idhist' +
              'orialgrupo'#10'                                            and idmat' +
              'eria        = @idmateria)'#10'    open CursorTiposSin'#10'    fetch next' +
              ' from CursorTiposSin'#10'    into @calificacion, @faltas, @conducta,' +
              ' @CalifAux1, @idtipocalificacion'#10#10'    while @@fetch_status = 0'#10' ' +
              '   begin'#10#10'    INSERT INTO #TEMP1(idalumno, idHistorialAlumno, id' +
              'HistorialGrupo, idmateria, idAlumnoNombre, alumnoNumControl,'#10'   ' +
              '                Calificacion, Faltas, NOTA, idTipoCalificacion, ' +
              'idCiclo, idGrupo, conducta, CALIFAUX1, CALIFAUX3)'#10'              ' +
              '  VALUES(@idalumno, @idhistorialAlumno, @idhistorialgrupo, @idma' +
              'teria, @alumnoNombre, @alumnoNumControl,'#10'                       ' +
              '@calificacion, @faltas, @NOTA, @idtipocalificacion, @idciclo, @i' +
              'dgrupo, @conducta, @CALIFAUX1, @CALIFAUX3)'#10'    fetch next from C' +
              'ursorTiposSin'#10'    into @calificacion, @faltas, @conducta, @Calif' +
              'Aux1, @idtipocalificacion'#10'    end'#10'    DEALLOCATE CursorTiposSin'#10 +
              #10'    SET @formato = '#39'00'#39#10'    SET @expresion = RIGHT( @formato + ' +
              'cast(:tipocalificacion AS varchar), 2)'#10'    SET @expresion = '#39'NOT' +
              'A'#39'+@expresion'#10#10'    SET @sql = '#39'UPDATE CALIFICACION SET NOTA = '#39'+' +
              '@expresion+'#10'               '#39' WHERE idhistorialalumno    = '#39'+CAST' +
              '(@idhistorialalumno AS VARCHAR(100))+'#10'               '#39' and idhis' +
              'torialgrupo = '#39'+CAST(@idhistorialgrupo AS VARCHAR(100))+'#10'       ' +
              '        '#39' and idmateria        = '#39'+CAST(@idmateria AS VARCHAR(10' +
              '0))'#10#10'    EXEC (@sql)'#10#10'    SET @formato = '#39'00'#39#10'    SET @expresion' +
              ' = RIGHT( @formato + cast(:tipocalificacion AS varchar), 2)'#10'    ' +
              'SET @expresion = '#39'CALIF'#39'+@expresion'#10#10'    SET @sql = '#39'UPDATE CALI' +
              'FICACION SET CALIFICACION = '#39'+@expresion+'#10'               '#39' WHERE' +
              ' idhistorialalumno    = '#39'+CAST(@idhistorialalumno AS VARCHAR(100' +
              '))+'#10'               '#39' and idhistorialgrupo = '#39'+CAST(@idhistorialg' +
              'rupo AS VARCHAR(100))+'#10'               '#39' and idmateria        = '#39 +
              '+CAST(@idmateria AS VARCHAR(100))'#10#10'    EXEC (@sql)'#10#10'    SET @for' +
              'mato = '#39'00'#39#10'    SET @expresion = RIGHT( @formato + cast(:tipocal' +
              'ificacion AS varchar), 2)'#10'    SET @expresion = '#39'FALTAS'#39'+@expresi' +
              'on'#10#10'    SET @sql = '#39'UPDATE CALIFICACION SET FALTAS = '#39'+@expresio' +
              'n+'#10'               '#39' WHERE idhistorialalumno    = '#39'+CAST(@idhisto' +
              'rialalumno AS VARCHAR(100))+'#10'               '#39' and idhistorialgru' +
              'po = '#39'+CAST(@idhistorialgrupo AS VARCHAR(100))+'#10'               '#39 +
              ' and idmateria        = '#39'+CAST(@idmateria AS VARCHAR(100))'#10#10'    ' +
              'EXEC (@sql)'#10#10'    SET @formato = '#39'00'#39#10'    SET @expresion = RIGHT(' +
              ' @formato + cast(:tipocalificacion AS varchar), 2)'#10'    SET @expr' +
              'esion = '#39'CALIFA'#39'+@expresion'#10#10'    SET @sql = '#39'UPDATE CALIFICACION' +
              ' SET CALIFAUX1 = '#39'+@expresion+'#10'               '#39' WHERE idhistoria' +
              'lalumno    = '#39'+CAST(@idhistorialalumno AS VARCHAR(100))+'#10'       ' +
              '        '#39' and idhistorialgrupo = '#39'+CAST(@idhistorialgrupo AS VAR' +
              'CHAR(100))+'#10'               '#39' and idmateria        = '#39'+CAST(@idma' +
              'teria AS VARCHAR(100))'#10#10'    EXEC (@sql)'#10#10'    SET @formato = '#39'00'#39 +
              #10'    SET @expresion = RIGHT( @formato + cast(:tipocalificacion A' +
              'S varchar), 2)'#10'    SET @expresion = '#39'CALIFB'#39'+@expresion'#10#10'    SET' +
              ' @sql = '#39'UPDATE CALIFICACION SET CALIFAUX2 = '#39'+@expresion+'#10'     ' +
              '          '#39' WHERE idhistorialalumno    = '#39'+CAST(@idhistorialalum' +
              'no AS VARCHAR(100))+'#10'               '#39' and idhistorialgrupo = '#39'+C' +
              'AST(@idhistorialgrupo AS VARCHAR(100))+'#10'               '#39' and idm' +
              'ateria        = '#39'+CAST(@idmateria AS VARCHAR(100))'#10#10'    EXEC (@s' +
              'ql)'#10#10'    SET @formato = '#39'00'#39#10'    SET @expresion = RIGHT( @format' +
              'o + cast(:tipocalificacion AS varchar), 2)'#10'    SET @expresion = ' +
              #39'CALIFC'#39'+@expresion'#10#10'    SET @sql = '#39'UPDATE CALIFICACION SET CAL' +
              'IFAUX3 = '#39'+@expresion+'#10'               '#39' WHERE idhistorialalumno ' +
              '   = '#39'+CAST(@idhistorialalumno AS VARCHAR(100))+'#10'               ' +
              #39' and idhistorialgrupo = '#39'+CAST(@idhistorialgrupo AS VARCHAR(100' +
              '))+'#10'               '#39' and idmateria        = '#39'+CAST(@idmateria AS' +
              ' VARCHAR(100))'#10#10'    EXEC (@sql)'#10#10'    declare CursorTiposCon SCRO' +
              'LL CURSOR FOR'#10'    SELECT idTipoCalificacion, Calificacion = (sel' +
              'ect Calificacion'#10'                                            fro' +
              'm calificacion where'#10'                                           ' +
              ' idhistorialalumno    = @idhistorialalumno'#10'                     ' +
              '                       and idhistorialgrupo = @idhistorialgrupo'#10 +
              '                                            and idmateria       ' +
              ' = @idmateria'#10'                                            and id' +
              'tipocalificacion=1),'#10'                               Faltas = (se' +
              'lect Faltas'#10'                                            from cal' +
              'ificacion where'#10'                                            idhi' +
              'storialalumno    = @idhistorialalumno'#10'                          ' +
              '                  and idhistorialgrupo = @idhistorialgrupo'#10'     ' +
              '                                       and idmateria        = @i' +
              'dmateria'#10'                                            and idtipoc' +
              'alificacion=1),'#10'                               CALIFAUX1 = (sele' +
              'ct CALIFAUX1'#10'                                            from ca' +
              'lificacion where'#10'                                            idh' +
              'istorialalumno    = @idhistorialalumno'#10'                         ' +
              '                   and idhistorialgrupo = @idhistorialgrupo'#10'    ' +
              '                                        and idmateria        = @' +
              'idmateria'#10'                                            and idtipo' +
              'calificacion=1),'#10'                               conducta = (sele' +
              'ct CALIFAUX2'#10'                                            from ca' +
              'lificacion where'#10'                                            idh' +
              'istorialalumno    = @idhistorialalumno'#10'                         ' +
              '                   and idhistorialgrupo = @idhistorialgrupo'#10'    ' +
              '                                        and idmateria        = @' +
              'idmateria'#10'                                            and idtipo' +
              'calificacion=1),'#10'                               CALIFAUX3 = (sel' +
              'ect CALIFAUX3'#10'                                            from c' +
              'alificacion where'#10'                                            id' +
              'historialalumno    = @idhistorialalumno'#10'                        ' +
              '                    and idhistorialgrupo = @idhistorialgrupo'#10'   ' +
              '                                         and idmateria        = ' +
              '@idmateria'#10'                                            and idtip' +
              'ocalificacion=1),'#10'                               NOTA      = (se' +
              'lect NOTA'#10'                                            from calif' +
              'icacion where'#10'                                            idhist' +
              'orialalumno    = @idhistorialalumno'#10'                            ' +
              '                and idhistorialgrupo = @idhistorialgrupo'#10'       ' +
              '                                     and idmateria        = @idm' +
              'ateria'#10'                                            and idtipocal' +
              'ificacion=1)'#10'           FROM  TipoCALIFICACION'#10'           WHERE ' +
              'idtipocalificacion in (select idtipocalificacion'#10'               ' +
              '                             from calificacion where'#10'           ' +
              '                                 idhistorialalumno    = @idhisto' +
              'rialalumno'#10'                                            and idhis' +
              'torialgrupo = @idhistorialgrupo'#10'                                ' +
              '            and idmateria        = @idmateria)'#10'    open CursorTi' +
              'posCon'#10'    fetch next from CursorTiposCon'#10'    into @idtipocalifi' +
              'cacion, @Calificacion, @Faltas, @CALIFAUX1, @conducta, @CALIFAUX' +
              '3, @NOTA'#10#10'    while @@fetch_status = 0'#10'    begin'#10#10'    INSERT INT' +
              'O #TEMP1(idalumno, idHistorialAlumno, idHistorialGrupo, idmateri' +
              'a, idAlumnoNombre, alumnoNumControl,'#10'                   Califica' +
              'cion, Faltas, NOTA, idTipoCalificacion, idCiclo, idGrupo, conduc' +
              'ta, CALIFAUX1, CALIFAUX3)'#10'                VALUES(@idalumno, @idh' +
              'istorialAlumno, @idhistorialgrupo, @idmateria, @alumnoNombre, @a' +
              'lumnoNumControl,'#10'                       @calificacion, @faltas, ' +
              '@NOTA, @idtipocalificacion, @idciclo, @idgrupo, @conducta, @CALI' +
              'FAUX1, @CALIFAUX3)'#10'    fetch next from CursorTiposCon'#10'    into @' +
              'idtipocalificacion, @Calificacion, @Faltas, @NOTA, @CALIFAUX1, @' +
              'conducta, @CALIFAUX3'#10'    end'#10'    DEALLOCATE CursorTiposCon'#10#10'    ' +
              'fetch next from CursorTipoCalificacion'#10'    into @idalumno, @idhi' +
              'storialAlumno, @idhistorialgrupo, @idmateria, @idtipocalificacio' +
              'n, @alumnoNombre,'#10'    @alumnoNumControl, @calificacion, @faltas,' +
              ' @NOTA, @idciclo, @idgrupo, @conducta, @CALIFAUX1, @CALIFAUX3'#10'en' +
              'd'#10#10'SELECT DISTINCT * FROM #TEMP1 Where idTipoCalificacion = 1'#10#10'D' +
              'ROP TABLE #TEMP1'#10'DEALLOCATE CursorTipoCalificacion'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'idalumno'
                TableField = 'idalumno'
              end
              item
                DatasetField = 'idHistorialAlumno'
                TableField = 'idHistorialAlumno'
              end
              item
                DatasetField = 'idHistorialGrupo'
                TableField = 'idHistorialGrupo'
              end
              item
                DatasetField = 'idmateria'
                TableField = 'idmateria'
              end
              item
                DatasetField = 'idAlumnoNombre'
                TableField = 'idAlumnoNombre'
              end
              item
                DatasetField = 'alumnoNumControl'
                TableField = 'alumnoNumControl'
              end
              item
                DatasetField = 'Calificacion'
                TableField = 'Calificacion'
              end
              item
                DatasetField = 'Faltas'
                TableField = 'Faltas'
              end
              item
                DatasetField = 'NOTA'
                TableField = 'NOTA'
              end
              item
                DatasetField = 'idTipoCalificacion'
                TableField = 'idTipoCalificacion'
              end
              item
                DatasetField = 'idCiclo'
                TableField = 'idCiclo'
              end
              item
                DatasetField = 'idGrupo'
                TableField = 'idGrupo'
              end
              item
                DatasetField = 'conducta'
                TableField = 'conducta'
              end
              item
                DatasetField = 'CALIFAUX1'
                TableField = 'CALIFAUX1'
              end
              item
                DatasetField = 'CALIFAUX3'
                TableField = 'CALIFAUX3'
              end>
          end>
        Name = 'spAlumnoTipoCalificacion'
        Fields = <
          item
            Name = 'idalumno'
            DataType = datInteger
          end
          item
            Name = 'idHistorialAlumno'
            DataType = datInteger
          end
          item
            Name = 'idHistorialGrupo'
            DataType = datInteger
          end
          item
            Name = 'idmateria'
            DataType = datInteger
          end
          item
            Name = 'idAlumnoNombre'
            DataType = datString
            Size = 70
          end
          item
            Name = 'alumnoNumControl'
            DataType = datString
            Size = 12
          end
          item
            Name = 'Calificacion'
            DataType = datFloat
          end
          item
            Name = 'Faltas'
            DataType = datInteger
          end
          item
            Name = 'NOTA'
            DataType = datString
            Size = 250
          end
          item
            Name = 'idTipoCalificacion'
            DataType = datFloat
          end
          item
            Name = 'idCiclo'
            DataType = datFloat
          end
          item
            Name = 'idGrupo'
            DataType = datInteger
          end
          item
            Name = 'conducta'
            DataType = datFloat
          end
          item
            Name = 'CALIFAUX1'
            DataType = datFloat
          end
          item
            Name = 'CALIFAUX3'
            DataType = datFloat
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
            SQL = 
              '/*VWCALIFICAALUMNOSACTUALES*/'#10'select VWCALIFALUMNOSACTUAL.* FROM' +
              ' (SELECT VWCALIFICACIONES.IDCALIFICACION,'#10'       VWCALIFICACIONE' +
              'S.IDMATERIA,'#10'       VWCALIFICACIONES.CALIFICACION,'#10'       VWCALI' +
              'FICACIONES.STATUS,'#10'       VWCALIFICACIONES.FALTAS,'#10'       VWCALI' +
              'FICACIONES.FECHACALIFICACION,'#10'       VWCALIFICACIONES.IDHISTORIA' +
              'LALUMNO,'#10'       VWCALIFICACIONES.IDHISTORIALGRUPO,'#10'       VWCALI' +
              'FICACIONES.IDTIPOCALIFICACION,'#10'       VWCALIFICACIONES.CODIGOTIP' +
              'OCALIFICACION,'#10'       VWCALIFICACIONES.NOMBRETIPOCALIFICACION,'#10' ' +
              '      VWCALIFICACIONES.TIPOCALIFICACIONAUX1,'#10'       VWCALIFICACI' +
              'ONES.TIPOCALIFICACIONAUX2,'#10'       VWCALIFICACIONES.MATERIACODIGO' +
              ','#10'       VWCALIFICACIONES.MATERIANOMBRE,'#10'       VWCALIFICACIONES' +
              '.MATERIAAUX1,'#10'       VWCALIFICACIONES.MATERIAAUX2,'#10'       VWCALI' +
              'FICACIONES.CREDITOS,'#10'       VWCALIFICACIONES.MINIMOAPRO,'#10'       ' +
              'VWCALIFICACIONES.MAXIMOFALTAS,'#10'       VWCALIFICACIONES.SERIADACO' +
              'NCODIGO,'#10'       VWCALIFICACIONES.SERIADACONNOMBRE,'#10'       VWGRUP' +
              'OSALUMNOSACTUALES.IDALUMNO,'#10'       VWGRUPOSALUMNOSACTUALES.ALUMN' +
              'ONOMBRE,'#10'       VWGRUPOSALUMNOSACTUALES.ALUMNONUMCONTROL,'#10'      ' +
              ' VWGRUPOSALUMNOSACTUALES.IDSTATUSALUMNO,'#10'       VWGRUPOSALUMNOSA' +
              'CTUALES.IDGRUPO,'#10'       VWGRUPOSALUMNOSACTUALES.GRUPOCODIGO,'#10'   ' +
              '    VWGRUPOSALUMNOSACTUALES.GRUPONOMBRE,'#10'       VWGRUPOSALUMNOSA' +
              'CTUALES.NIVELCODIGO,'#10'       VWGRUPOSALUMNOSACTUALES.NIVELNOMBRE,' +
              #10'       VWGRUPOSALUMNOSACTUALES.IdNivel,'#10'       VWGRUPOSALUMNOSA' +
              'CTUALES.IDCICLO,'#10'       VWGRUPOSALUMNOSACTUALES.CICLOCODIGO,'#10'   ' +
              '    VWGRUPOSALUMNOSACTUALES.CICLONOMBRE,'#10'       vwcalificaciones' +
              '.conducta,'#10'       vwcalificaciones.CALIFAUX1'#10'FROM'#10'/*vwgruposAlum' +
              'nosActuales*/'#10'(SELECT HISTORIALALUMNO.IDHISTORIALALUMNO,'#10'       ' +
              'VWHISTORIALGRUPO.IDHISTORIALGRUPO,'#10'       ALUMNO.IDALUMNO,'#10'     ' +
              '  ALUMNO.NOMBRE AS ALUMNONOMBRE,'#10'       ALUMNO.NUMCONTROL AS ALU' +
              'MNONUMCONTROL,'#10'       ALUMNO.idstatus AS IDSTATUSALUMNO,'#10'       ' +
              'VWHISTORIALGRUPO.IDGRUPO,'#10'       VWHISTORIALGRUPO.GRUPOCODIGO,'#10' ' +
              '      VWHISTORIALGRUPO.GRUPONOMBRE,'#10'       VWHISTORIALGRUPO.NIVE' +
              'LCODIGO,'#10'       VWHISTORIALGRUPO.NIVELNOMBRE,'#10'       VWHISTORIAL' +
              'GRUPO.IDCICLO,'#10'       VWHISTORIALGRUPO.IDNIVEL,'#10'       VWHISTORI' +
              'ALGRUPO.CICLOCODIGO,'#10'       VWHISTORIALGRUPO.CICLONOMBRE'#10'FROM AL' +
              'UMNO'#10'   INNER JOIN HISTORIALALUMNO ON (ALUMNO.IDALUMNO = HISTORI' +
              'ALALUMNO.IDALUMNO)'#10'   INNER JOIN'#10'   (SELECT HISTORIALGRUPO.IDHIS' +
              'TORIALGRUPO,'#10'       NIVEL.IDNIVEL,'#10'       CICLO.IDCICLO,'#10'       ' +
              'GRUPO.IDGRUPO,'#10'       GRUPO.CODIGO AS GRUPOCODIGO,'#10'       GRUPO.' +
              'NOMBRE AS GRUPONOMBRE,'#10'       GRUPO.NOMBREaux1 AS GRUPOaux1,'#10'   ' +
              '    GRUPO.NOMBREaux2 AS GRUPOaux2,'#10'       grupo.cupo,'#10'       NIV' +
              'EL.CODIGO AS NIVELCODIGO,'#10'       NIVEL.NOMBRE AS NIVELNOMBRE,'#10'  ' +
              '     NIVEL.NOMBREaux1 AS NIVELaux1,'#10'       NIVEL.NOMBREaux2 AS N' +
              'IVELaux2,'#10'       CICLO.CODIGO AS CICLOCODIGO,'#10'       CICLO.NOMBR' +
              'E AS CICLONOMBRE,'#10'       CICLO.NOMBREaux1 AS CICLOaux1,'#10'       C' +
              'ICLO.NOMBREaux2 AS CICLOaux2,'#10'       CICLO.FECHAFINAL AS CICLOFE' +
              'CHAFINAL,'#10'       CICLO.FECHAINICIO AS CICLOFECHAINICIO'#10'FROM GRUP' +
              'O'#10'   INNER JOIN NIVEL ON (GRUPO.IDNIVEL = NIVEL.IDNIVEL)'#10'   INNE' +
              'R JOIN HISTORIALGRUPO ON (GRUPO.IDGRUPO = HISTORIALGRUPO.IDGRUPO' +
              ')'#10'   INNER JOIN CICLO ON (HISTORIALGRUPO.IDCICLO = CICLO.IDCICLO' +
              '))'#10'   VWHISTORIALGRUPO ON (HISTORIALALUMNO.IDHISTORIALGRUPO = VW' +
              'HISTORIALGRUPO.IDHISTORIALGRUPO))'#10'VWGRUPOSALUMNOSACTUALES'#10'   INN' +
              'ER JOIN'#10'/*vwcalificaciones*/'#10'(SELECT CALIFICACION.IDCALIFICACION' +
              ','#10'       CALIFICACION.IDMATERIA,'#10'       CALIFICACION.CALIFICACIO' +
              'N,'#10'       CALIFICACION.STATUS,'#10'       CALIFICACION.FALTAS,'#10'     ' +
              '  CALIFICACION.FECHA AS FECHACALIFICACION,'#10'       CALIFICACION.I' +
              'DHISTORIALALUMNO,'#10'       CALIFICACION.IDHISTORIALGRUPO,'#10'       C' +
              'ALIFICACION.IDTIPOCALIFICACION,'#10'       TIPOCALIFICACION.CODIGO A' +
              'S CODIGOTIPOCALIFICACION,'#10'       TIPOCALIFICACION.NOMBRE AS NOMB' +
              'RETIPOCALIFICACION,'#10'       TIPOCALIFICACION.NOMBREAUX1 AS TIPOCA' +
              'LIFICACIONAUX1,'#10'       TIPOCALIFICACION.NOMBREAUX2 AS TIPOCALIFI' +
              'CACIONAUX2,'#10'       VWMATERIAS.CODIGO AS MATERIACODIGO,'#10'       VW' +
              'MATERIAS.NOMBRE AS MATERIANOMBRE,'#10'       VWMATERIAS.MATERIAAUX1,' +
              #10'       VWMATERIAS.MATERIAAUX2,'#10'       VWMATERIAS.CREDITOS,'#10'    ' +
              '   VWMATERIAS.MINIMOAPRO,'#10'       VWMATERIAS.MAXIMOFALTAS,'#10'      ' +
              ' VWMATERIAS.SERIADACONCODIGO,'#10'       VWMATERIAS.SERIADACONNOMBRE' +
              ','#10'       calificacion.califaux2 AS CONDUCTA,'#10'       calificacion' +
              '.califaux1'#10'FROM'#10'  /*VWMATERIAS*/'#10'  (SELECT MATERIA.IDMATERIA,'#10'  ' +
              '     MATERIA.codigo,'#10'       MATERIA.nombre,'#10'       MATERIA.nombr' +
              'eaux1 AS MATERIAAUX1,'#10'       MATERIA.nombreaux2 AS MATERIAAUX2,'#10 +
              '       MATERIA.CREDITOS,'#10'       MATERIA.MINIMOAPRO,'#10'       MATER' +
              'IA.MAXIMOFALTAS,'#10'       MATERIA.promedio,'#10'       MATERIA1.CODIGO' +
              ' AS SERIADACONCODIGO,'#10'       MATERIA1.NOMBRE AS SERIADACONNOMBRE' +
              #10'   FROM MATERIA MATERIA1'#10'   RIGHT OUTER JOIN MATERIA ON (MATERI' +
              'A1.IDMATERIA = MATERIA.SERIADACON))'#10'   VWMATERIAS'#10'   INNER JOIN ' +
              'CALIFICACION ON (VWMATERIAS.IDMATERIA = CALIFICACION.IDMATERIA)'#10 +
              '   INNER JOIN TIPOCALIFICACION ON (CALIFICACION.IDTIPOCALIFICACI' +
              'ON = TIPOCALIFICACION.IDTIPOCALIFICACION))'#10'   VWCALIFICACIONES O' +
              'N (VWGRUPOSALUMNOSACTUALES.IDHISTORIALALUMNO = VWCALIFICACIONES.' +
              'IDHISTORIALALUMNO) AND (VWGRUPOSALUMNOSACTUALES.IDHISTORIALGRUPO' +
              ' = VWCALIFICACIONES.IDHISTORIALGRUPO))'#10'   VWCALIFALUMNOSACTUAL'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDCALIFICACION'
                TableField = 'IDCALIFICACION'
              end
              item
                DatasetField = 'IDMATERIA'
                TableField = 'IDMATERIA'
              end
              item
                DatasetField = 'CALIFICACION'
                TableField = 'CALIFICACION'
              end
              item
                DatasetField = 'STATUS'
                TableField = 'STATUS'
              end
              item
                DatasetField = 'FALTAS'
                TableField = 'FALTAS'
              end
              item
                DatasetField = 'FECHACALIFICACION'
                TableField = 'FECHACALIFICACION'
              end
              item
                DatasetField = 'IDHISTORIALALUMNO'
                TableField = 'IDHISTORIALALUMNO'
              end
              item
                DatasetField = 'IDHISTORIALGRUPO'
                TableField = 'IDHISTORIALGRUPO'
              end
              item
                DatasetField = 'IDTIPOCALIFICACION'
                TableField = 'IDTIPOCALIFICACION'
              end
              item
                DatasetField = 'CODIGOTIPOCALIFICACION'
                TableField = 'CODIGOTIPOCALIFICACION'
              end
              item
                DatasetField = 'NOMBRETIPOCALIFICACION'
                TableField = 'NOMBRETIPOCALIFICACION'
              end
              item
                DatasetField = 'TIPOCALIFICACIONAUX1'
                TableField = 'TIPOCALIFICACIONAUX1'
              end
              item
                DatasetField = 'TIPOCALIFICACIONAUX2'
                TableField = 'TIPOCALIFICACIONAUX2'
              end
              item
                DatasetField = 'MATERIACODIGO'
                TableField = 'MATERIACODIGO'
              end
              item
                DatasetField = 'MATERIANOMBRE'
                TableField = 'MATERIANOMBRE'
              end
              item
                DatasetField = 'MATERIAAUX1'
                TableField = 'MATERIAAUX1'
              end
              item
                DatasetField = 'MATERIAAUX2'
                TableField = 'MATERIAAUX2'
              end
              item
                DatasetField = 'CREDITOS'
                TableField = 'CREDITOS'
              end
              item
                DatasetField = 'MINIMOAPRO'
                TableField = 'MINIMOAPRO'
              end
              item
                DatasetField = 'MAXIMOFALTAS'
                TableField = 'MAXIMOFALTAS'
              end
              item
                DatasetField = 'SERIADACONCODIGO'
                TableField = 'SERIADACONCODIGO'
              end
              item
                DatasetField = 'SERIADACONNOMBRE'
                TableField = 'SERIADACONNOMBRE'
              end
              item
                DatasetField = 'IDALUMNO'
                TableField = 'IDALUMNO'
              end
              item
                DatasetField = 'ALUMNONOMBRE'
                TableField = 'ALUMNONOMBRE'
              end
              item
                DatasetField = 'ALUMNONUMCONTROL'
                TableField = 'ALUMNONUMCONTROL'
              end
              item
                DatasetField = 'IDSTATUSALUMNO'
                TableField = 'IDSTATUSALUMNO'
              end
              item
                DatasetField = 'IDGRUPO'
                TableField = 'IDGRUPO'
              end
              item
                DatasetField = 'GRUPOCODIGO'
                TableField = 'GRUPOCODIGO'
              end
              item
                DatasetField = 'GRUPONOMBRE'
                TableField = 'GRUPONOMBRE'
              end
              item
                DatasetField = 'NIVELCODIGO'
                TableField = 'NIVELCODIGO'
              end
              item
                DatasetField = 'NIVELNOMBRE'
                TableField = 'NIVELNOMBRE'
              end
              item
                DatasetField = 'IdNivel'
                TableField = 'IdNivel'
              end
              item
                DatasetField = 'IDCICLO'
                TableField = 'IDCICLO'
              end
              item
                DatasetField = 'CICLOCODIGO'
                TableField = 'CICLOCODIGO'
              end
              item
                DatasetField = 'CICLONOMBRE'
                TableField = 'CICLONOMBRE'
              end
              item
                DatasetField = 'conducta'
                TableField = 'conducta'
              end
              item
                DatasetField = 'CALIFAUX1'
                TableField = 'CALIFAUX1'
              end>
          end>
        Name = 'vwCalificaAlumnosActuales'
        Fields = <
          item
            Name = 'IDCALIFICACION'
            DataType = datInteger
          end
          item
            Name = 'IDMATERIA'
            DataType = datInteger
          end
          item
            Name = 'CALIFICACION'
            DataType = datFloat
          end
          item
            Name = 'STATUS'
            DataType = datString
            Size = 1
          end
          item
            Name = 'FALTAS'
            DataType = datInteger
          end
          item
            Name = 'FECHACALIFICACION'
            DataType = datBlob
          end
          item
            Name = 'IDHISTORIALALUMNO'
            DataType = datInteger
          end
          item
            Name = 'IDHISTORIALGRUPO'
            DataType = datInteger
          end
          item
            Name = 'IDTIPOCALIFICACION'
            DataType = datInteger
          end
          item
            Name = 'CODIGOTIPOCALIFICACION'
            DataType = datString
            Size = 10
          end
          item
            Name = 'NOMBRETIPOCALIFICACION'
            DataType = datString
            Size = 50
          end
          item
            Name = 'TIPOCALIFICACIONAUX1'
            DataType = datString
            Size = 50
          end
          item
            Name = 'TIPOCALIFICACIONAUX2'
            DataType = datString
            Size = 50
          end
          item
            Name = 'MATERIACODIGO'
            DataType = datString
            Size = 10
          end
          item
            Name = 'MATERIANOMBRE'
            DataType = datString
            Size = 50
          end
          item
            Name = 'MATERIAAUX1'
            DataType = datString
            Size = 50
          end
          item
            Name = 'MATERIAAUX2'
            DataType = datString
            Size = 50
          end
          item
            Name = 'CREDITOS'
            DataType = datInteger
          end
          item
            Name = 'MINIMOAPRO'
            DataType = datFloat
          end
          item
            Name = 'MAXIMOFALTAS'
            DataType = datInteger
          end
          item
            Name = 'SERIADACONCODIGO'
            DataType = datString
            Size = 10
          end
          item
            Name = 'SERIADACONNOMBRE'
            DataType = datString
            Size = 50
          end
          item
            Name = 'IDALUMNO'
            DataType = datInteger
          end
          item
            Name = 'ALUMNONOMBRE'
            DataType = datString
            Size = 70
          end
          item
            Name = 'ALUMNONUMCONTROL'
            DataType = datString
            Size = 12
          end
          item
            Name = 'IDSTATUSALUMNO'
            DataType = datInteger
          end
          item
            Name = 'IDGRUPO'
            DataType = datInteger
          end
          item
            Name = 'GRUPOCODIGO'
            DataType = datString
            Size = 10
          end
          item
            Name = 'GRUPONOMBRE'
            DataType = datString
            Size = 50
          end
          item
            Name = 'NIVELCODIGO'
            DataType = datString
            Size = 10
          end
          item
            Name = 'NIVELNOMBRE'
            DataType = datString
            Size = 50
          end
          item
            Name = 'IdNivel'
            DataType = datInteger
          end
          item
            Name = 'IDCICLO'
            DataType = datInteger
          end
          item
            Name = 'CICLOCODIGO'
            DataType = datString
            Size = 10
          end
          item
            Name = 'CICLONOMBRE'
            DataType = datString
            Size = 50
          end
          item
            Name = 'conducta'
            DataType = datFloat
          end
          item
            Name = 'CALIFAUX1'
            DataType = datFloat
          end>
      end
      item
        Params = <
          item
            Name = 'grupo'
            Value = '1'
            ParamType = daptInput
          end
          item
            Name = 'materia'
            Value = '1'
            ParamType = daptInput
          end
          item
            Name = 'ciclo'
            Value = '1'
            ParamType = daptInput
          end
          item
            Name = 'nocontrol'
            Value = '1'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
            SQL = 
              '/*VWCALIFICAALUMNOSACTUALES*/'#10'select idHistorialAlumno, idHistor' +
              'ialGrupo, idmateria FROM (SELECT VWCALIFICACIONES.IDCALIFICACION' +
              ','#10'       VWCALIFICACIONES.IDMATERIA,'#10'       VWCALIFICACIONES.CAL' +
              'IFICACION,'#10'       VWCALIFICACIONES.STATUS,'#10'       VWCALIFICACION' +
              'ES.FALTAS,'#10'       VWCALIFICACIONES.FECHACALIFICACION,'#10'       VWC' +
              'ALIFICACIONES.IDHISTORIALALUMNO,'#10'       VWCALIFICACIONES.IDHISTO' +
              'RIALGRUPO,'#10'       VWCALIFICACIONES.IDTIPOCALIFICACION,'#10'       VW' +
              'CALIFICACIONES.CODIGOTIPOCALIFICACION,'#10'       VWCALIFICACIONES.N' +
              'OMBRETIPOCALIFICACION,'#10'       VWCALIFICACIONES.TIPOCALIFICACIONA' +
              'UX1,'#10'       VWCALIFICACIONES.TIPOCALIFICACIONAUX2,'#10'       VWCALI' +
              'FICACIONES.MATERIACODIGO,'#10'       VWCALIFICACIONES.MATERIANOMBRE,' +
              #10'       VWCALIFICACIONES.MATERIAAUX1,'#10'       VWCALIFICACIONES.MA' +
              'TERIAAUX2,'#10'       VWCALIFICACIONES.CREDITOS,'#10'       VWCALIFICACI' +
              'ONES.MINIMOAPRO,'#10'       VWCALIFICACIONES.MAXIMOFALTAS,'#10'       VW' +
              'CALIFICACIONES.SERIADACONCODIGO,'#10'       VWCALIFICACIONES.SERIADA' +
              'CONNOMBRE,'#10'       VWGRUPOSALUMNOSACTUALES.IDALUMNO,'#10'       VWGRU' +
              'POSALUMNOSACTUALES.ALUMNONOMBRE,'#10'       VWGRUPOSALUMNOSACTUALES.' +
              'ALUMNONUMCONTROL,'#10'       VWGRUPOSALUMNOSACTUALES.IDSTATUSALUMNO,' +
              #10'       VWGRUPOSALUMNOSACTUALES.IDGRUPO,'#10'       VWGRUPOSALUMNOSA' +
              'CTUALES.GRUPOCODIGO,'#10'       VWGRUPOSALUMNOSACTUALES.GRUPONOMBRE,' +
              #10'       VWGRUPOSALUMNOSACTUALES.NIVELCODIGO,'#10'       VWGRUPOSALUM' +
              'NOSACTUALES.NIVELNOMBRE,'#10'       VWGRUPOSALUMNOSACTUALES.IdNivel,' +
              #10'       VWGRUPOSALUMNOSACTUALES.IDCICLO,'#10'       VWGRUPOSALUMNOSA' +
              'CTUALES.CICLOCODIGO,'#10'       VWGRUPOSALUMNOSACTUALES.CICLONOMBRE,' +
              #10'       vwcalificaciones.conducta,'#10'       vwcalificaciones.CALIF' +
              'AUX1'#10'FROM'#10'/*vwgruposAlumnosActuales*/'#10'(SELECT HISTORIALALUMNO.ID' +
              'HISTORIALALUMNO,'#10'       VWHISTORIALGRUPO.IDHISTORIALGRUPO,'#10'     ' +
              '  ALUMNO.IDALUMNO,'#10'       ALUMNO.NOMBRE AS ALUMNONOMBRE,'#10'       ' +
              'ALUMNO.NUMCONTROL AS ALUMNONUMCONTROL,'#10'       ALUMNO.idstatus AS' +
              ' IDSTATUSALUMNO,'#10'       VWHISTORIALGRUPO.IDGRUPO,'#10'       VWHISTO' +
              'RIALGRUPO.GRUPOCODIGO,'#10'       VWHISTORIALGRUPO.GRUPONOMBRE,'#10'    ' +
              '   VWHISTORIALGRUPO.NIVELCODIGO,'#10'       VWHISTORIALGRUPO.NIVELNO' +
              'MBRE,'#10'       VWHISTORIALGRUPO.IDCICLO,'#10'       VWHISTORIALGRUPO.I' +
              'DNIVEL,'#10'       VWHISTORIALGRUPO.CICLOCODIGO,'#10'       VWHISTORIALG' +
              'RUPO.CICLONOMBRE'#10'FROM ALUMNO'#10'   INNER JOIN HISTORIALALUMNO ON (A' +
              'LUMNO.IDALUMNO = HISTORIALALUMNO.IDALUMNO)'#10'   INNER JOIN'#10'   (SEL' +
              'ECT HISTORIALGRUPO.IDHISTORIALGRUPO,'#10'       NIVEL.IDNIVEL,'#10'     ' +
              '  CICLO.IDCICLO,'#10'       GRUPO.IDGRUPO,'#10'       GRUPO.CODIGO AS GR' +
              'UPOCODIGO,'#10'       GRUPO.NOMBRE AS GRUPONOMBRE,'#10'       GRUPO.NOMB' +
              'REaux1 AS GRUPOaux1,'#10'       GRUPO.NOMBREaux2 AS GRUPOaux2,'#10'     ' +
              '  grupo.cupo,'#10'       NIVEL.CODIGO AS NIVELCODIGO,'#10'       NIVEL.N' +
              'OMBRE AS NIVELNOMBRE,'#10'       NIVEL.NOMBREaux1 AS NIVELaux1,'#10'    ' +
              '   NIVEL.NOMBREaux2 AS NIVELaux2,'#10'       CICLO.CODIGO AS CICLOCO' +
              'DIGO,'#10'       CICLO.NOMBRE AS CICLONOMBRE,'#10'       CICLO.NOMBREaux' +
              '1 AS CICLOaux1,'#10'       CICLO.NOMBREaux2 AS CICLOaux2,'#10'       CIC' +
              'LO.FECHAFINAL AS CICLOFECHAFINAL,'#10'       CICLO.FECHAINICIO AS CI' +
              'CLOFECHAINICIO'#10'FROM GRUPO'#10'   INNER JOIN NIVEL ON (GRUPO.IDNIVEL ' +
              '= NIVEL.IDNIVEL)'#10'   INNER JOIN HISTORIALGRUPO ON (GRUPO.IDGRUPO ' +
              '= HISTORIALGRUPO.IDGRUPO)'#10'   INNER JOIN CICLO ON (HISTORIALGRUPO' +
              '.IDCICLO = CICLO.IDCICLO))'#10'   VWHISTORIALGRUPO ON (HISTORIALALUM' +
              'NO.IDHISTORIALGRUPO = VWHISTORIALGRUPO.IDHISTORIALGRUPO))'#10'VWGRUP' +
              'OSALUMNOSACTUALES'#10'   INNER JOIN'#10'/*vwcalificaciones*/'#10'(SELECT CAL' +
              'IFICACION.IDCALIFICACION,'#10'       CALIFICACION.IDMATERIA,'#10'       ' +
              'CALIFICACION.CALIFICACION,'#10'       CALIFICACION.STATUS,'#10'       CA' +
              'LIFICACION.FALTAS,'#10'       CALIFICACION.FECHA AS FECHACALIFICACIO' +
              'N,'#10'       CALIFICACION.IDHISTORIALALUMNO,'#10'       CALIFICACION.ID' +
              'HISTORIALGRUPO,'#10'       CALIFICACION.IDTIPOCALIFICACION,'#10'       T' +
              'IPOCALIFICACION.CODIGO AS CODIGOTIPOCALIFICACION,'#10'       TIPOCAL' +
              'IFICACION.NOMBRE AS NOMBRETIPOCALIFICACION,'#10'       TIPOCALIFICAC' +
              'ION.NOMBREAUX1 AS TIPOCALIFICACIONAUX1,'#10'       TIPOCALIFICACION.' +
              'NOMBREAUX2 AS TIPOCALIFICACIONAUX2,'#10'       VWMATERIAS.CODIGO AS ' +
              'MATERIACODIGO,'#10'       VWMATERIAS.NOMBRE AS MATERIANOMBRE,'#10'      ' +
              ' VWMATERIAS.MATERIAAUX1,'#10'       VWMATERIAS.MATERIAAUX2,'#10'       V' +
              'WMATERIAS.CREDITOS,'#10'       VWMATERIAS.MINIMOAPRO,'#10'       VWMATER' +
              'IAS.MAXIMOFALTAS,'#10'       VWMATERIAS.SERIADACONCODIGO,'#10'       VWM' +
              'ATERIAS.SERIADACONNOMBRE,'#10'       calificacion.califaux2 AS CONDU' +
              'CTA,'#10'       calificacion.califaux1'#10'FROM'#10'  /*VWMATERIAS*/'#10'  (SELE' +
              'CT MATERIA.IDMATERIA,'#10'       MATERIA.codigo,'#10'       MATERIA.nomb' +
              're,'#10'       MATERIA.nombreaux1 AS MATERIAAUX1,'#10'       MATERIA.nom' +
              'breaux2 AS MATERIAAUX2,'#10'       MATERIA.CREDITOS,'#10'       MATERIA.' +
              'MINIMOAPRO,'#10'       MATERIA.MAXIMOFALTAS,'#10'       MATERIA.promedio' +
              ','#10'       MATERIA1.CODIGO AS SERIADACONCODIGO,'#10'       MATERIA1.NO' +
              'MBRE AS SERIADACONNOMBRE'#10'   FROM MATERIA MATERIA1'#10'   RIGHT OUTER' +
              ' JOIN MATERIA ON (MATERIA1.IDMATERIA = MATERIA.SERIADACON))'#10'   V' +
              'WMATERIAS'#10'   INNER JOIN CALIFICACION ON (VWMATERIAS.IDMATERIA = ' +
              'CALIFICACION.IDMATERIA)'#10'   INNER JOIN TIPOCALIFICACION ON (CALIF' +
              'ICACION.IDTIPOCALIFICACION = TIPOCALIFICACION.IDTIPOCALIFICACION' +
              '))'#10'   VWCALIFICACIONES ON (VWGRUPOSALUMNOSACTUALES.IDHISTORIALAL' +
              'UMNO = VWCALIFICACIONES.IDHISTORIALALUMNO) AND (VWGRUPOSALUMNOSA' +
              'CTUALES.IDHISTORIALGRUPO = VWCALIFICACIONES.IDHISTORIALGRUPO))'#10' ' +
              '  VWCALIFALUMNOSACTUAL'#10'where idgrupo =:grupo'#10'and idmateria =:mat' +
              'eria'#10'and idciclo =:ciclo'#10'and alumnonumcontrol=:nocontrol'#10#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'idHistorialAlumno'
                TableField = 'idHistorialAlumno'
              end
              item
                DatasetField = 'idHistorialGrupo'
                TableField = 'idHistorialGrupo'
              end
              item
                DatasetField = 'idmateria'
                TableField = 'idmateria'
              end>
          end>
        Name = 'spCalificaAlumnosActuales'
        Fields = <
          item
            Name = 'idHistorialAlumno'
            DataType = datInteger
          end
          item
            Name = 'idHistorialGrupo'
            DataType = datInteger
          end
          item
            Name = 'idmateria'
            DataType = datInteger
          end>
      end
      item
        Params = <
          item
            Name = 'idciclo'
            Value = '5'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
            SQL = 
              'SELECT idhistorialalumno, idstatus, documentosfaltantes, idhisto' +
              'rialgrupo, idalumno, alumnonumcontrol, alumnonombre, grupocodigo' +
              ', BECA, DESCUENTO'#10'  FROM'#10'  (/*vwhistorialalumno*/'#10'   SELECT HIST' +
              'ORIALALUMNO.IDHISTORIALALUMNO,'#10'       HISTORIALALUMNO.DOCUMENTOS' +
              'FALTANTES,'#10'       VWHISTORIALGRUPO.IDHISTORIALGRUPO,'#10'       VWHI' +
              'STORIALGRUPO.IDCICLO,'#10'       VWHISTORIALGRUPO.IDGRUPO,'#10'       AL' +
              'UMNO.IDALUMNO,'#10'       ALUMNO.NOMBRE AS ALUMNONOMBRE,'#10'       ALUM' +
              'NO.NUMCONTROL AS ALUMNONUMCONTROL,'#10'       ALUMNO.SEXO AS ALUMNOS' +
              'EXO,'#10'       VWHISTORIALGRUPO.GRUPOCODIGO,'#10'       VWHISTORIALGRUP' +
              'O.GRUPONOMBRE,'#10'       VWHISTORIALGRUPO.GRUPOAUX1,'#10'       VWHISTO' +
              'RIALGRUPO.GRUPOAUX2,'#10'       VWHISTORIALGRUPO.NIVELCODIGO,'#10'      ' +
              ' VWHISTORIALGRUPO.NIVELNOMBRE,'#10'       VWHISTORIALGRUPO.NIVELAUX1' +
              ','#10'       VWHISTORIALGRUPO.NIVELAUX2,'#10'       VWHISTORIALGRUPO.CIC' +
              'LOCODIGO,'#10'       VWHISTORIALGRUPO.CICLONOMBRE,'#10'       VWHISTORIA' +
              'LGRUPO.CICLOAUX1,'#10'       VWHISTORIALGRUPO.CICLOAUX2,'#10'       VWHI' +
              'STORIALGRUPO.CICLOFECHAINICIO,'#10'       VWHISTORIALGRUPO.CICLOFECH' +
              'AFINAL,'#10'       STATUS.IDSTATUS,'#10'       STATUS.CODIGO AS STATUSCO' +
              'DIGO,'#10'       STATUS.NOMBRE AS STATUSNOMBRE,'#10'       HISTORIALALUM' +
              'NO.BECA,'#10'       HISTORIALALUMNO.DESCUENTO'#10'FROM STATUS'#10'   INNER J' +
              'OIN ALUMNO ON (STATUS.IDSTATUS = ALUMNO.IDSTATUS)'#10'   INNER JOIN ' +
              'HISTORIALALUMNO ON (ALUMNO.IDALUMNO = HISTORIALALUMNO.IDALUMNO)'#10 +
              '   INNER JOIN'#10'(/*vwhistorialgrupo*/'#10'SELECT HISTORIALGRUPO.IDHIST' +
              'ORIALGRUPO,'#10'       NIVEL.IDNIVEL,'#10'       CICLO.IDCICLO,'#10'       G' +
              'RUPO.IDGRUPO,'#10'       GRUPO.CODIGO AS GRUPOCODIGO,'#10'       GRUPO.N' +
              'OMBRE AS GRUPONOMBRE,'#10'       GRUPO.NOMBREaux1 AS GRUPOaux1,'#10'    ' +
              '   GRUPO.NOMBREaux2 AS GRUPOaux2,'#10'       grupo.cupo,'#10'       NIVE' +
              'L.CODIGO AS NIVELCODIGO,'#10'       NIVEL.NOMBRE AS NIVELNOMBRE,'#10'   ' +
              '    NIVEL.NOMBREaux1 AS NIVELaux1,'#10'       NIVEL.NOMBREaux2 AS NI' +
              'VELaux2,'#10'       CICLO.CODIGO AS CICLOCODIGO,'#10'       CICLO.NOMBRE' +
              ' AS CICLONOMBRE,'#10'       CICLO.NOMBREaux1 AS CICLOaux1,'#10'       CI' +
              'CLO.NOMBREaux2 AS CICLOaux2,'#10'       CICLO.FECHAFINAL AS CICLOFEC' +
              'HAFINAL,'#10'       CICLO.FECHAINICIO AS CICLOFECHAINICIO'#10'FROM GRUPO' +
              #10'   INNER JOIN NIVEL ON (GRUPO.IDNIVEL = NIVEL.IDNIVEL)'#10'   INNER' +
              ' JOIN HISTORIALGRUPO ON (GRUPO.IDGRUPO = HISTORIALGRUPO.IDGRUPO)' +
              #10'   INNER JOIN CICLO ON (HISTORIALGRUPO.IDCICLO = CICLO.IDCICLO)' +
              ')'#10'VWHISTORIALGRUPO ON (HISTORIALALUMNO.IDHISTORIALGRUPO ='#10'VWHIST' +
              'ORIALGRUPO.IDHISTORIALGRUPO))'#10'  VWHISTORIALALUMNO'#10'  /***********' +
              '***********************************************************/'#10'whe' +
              're idciclo = :idciclo'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'idhistorialalumno'
                TableField = 'idhistorialalumno'
              end
              item
                DatasetField = 'idstatus'
                TableField = 'idstatus'
              end
              item
                DatasetField = 'documentosfaltantes'
                TableField = 'documentosfaltantes'
              end
              item
                DatasetField = 'idhistorialgrupo'
                TableField = 'idhistorialgrupo'
              end
              item
                DatasetField = 'idalumno'
                TableField = 'idalumno'
              end
              item
                DatasetField = 'alumnonumcontrol'
                TableField = 'alumnonumcontrol'
              end
              item
                DatasetField = 'alumnonombre'
                TableField = 'alumnonombre'
              end
              item
                DatasetField = 'grupocodigo'
                TableField = 'grupocodigo'
              end
              item
                DatasetField = 'BECA'
                TableField = 'BECA'
              end
              item
                DatasetField = 'DESCUENTO'
                TableField = 'DESCUENTO'
              end>
          end>
        Name = 'vwHistorialAlumno'
        Fields = <
          item
            Name = 'idhistorialalumno'
            DataType = datInteger
            InPrimaryKey = True
          end
          item
            Name = 'idstatus'
            DataType = datInteger
          end
          item
            Name = 'documentosfaltantes'
            DataType = datString
            Size = 150
          end
          item
            Name = 'idhistorialgrupo'
            DataType = datInteger
          end
          item
            Name = 'idalumno'
            DataType = datInteger
          end
          item
            Name = 'alumnonumcontrol'
            DataType = datString
            Size = 12
          end
          item
            Name = 'alumnonombre'
            DataType = datString
            Size = 70
          end
          item
            Name = 'grupocodigo'
            DataType = datString
            Size = 10
          end
          item
            Name = 'BECA'
            DataType = datFloat
          end
          item
            Name = 'DESCUENTO'
            DataType = datFloat
          end>
      end
      item
        Params = <
          item
            Name = 'IDCICLO'
            Value = '5'
            ParamType = daptInput
          end
          item
            Name = 'IDGRUPO'
            Value = '2'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
            SQL = 
              'SELECT VWHISTORIALALUMNO.IDALUMNO,'#10'  VWHISTORIALALUMNO.ALUMNONOM' +
              'BRE,'#10'  VWHISTORIALALUMNO.ALUMNONUMCONTROL'#10'  FROM'#10'  (/*vwhistoria' +
              'lalumno*/'#10'   SELECT HISTORIALALUMNO.IDHISTORIALALUMNO,'#10'       HI' +
              'STORIALALUMNO.DOCUMENTOSFALTANTES,'#10'       VWHISTORIALGRUPO.IDHIS' +
              'TORIALGRUPO,'#10'       VWHISTORIALGRUPO.IDCICLO,'#10'       VWHISTORIAL' +
              'GRUPO.IDGRUPO,'#10'       ALUMNO.IDALUMNO,'#10'       ALUMNO.NOMBRE AS A' +
              'LUMNONOMBRE,'#10'       ALUMNO.NUMCONTROL AS ALUMNONUMCONTROL,'#10'     ' +
              '  ALUMNO.SEXO AS ALUMNOSEXO,'#10'       VWHISTORIALGRUPO.GRUPOCODIGO' +
              ','#10'       VWHISTORIALGRUPO.GRUPONOMBRE,'#10'       VWHISTORIALGRUPO.G' +
              'RUPOAUX1,'#10'       VWHISTORIALGRUPO.GRUPOAUX2,'#10'       VWHISTORIALG' +
              'RUPO.NIVELCODIGO,'#10'       VWHISTORIALGRUPO.NIVELNOMBRE,'#10'       VW' +
              'HISTORIALGRUPO.NIVELAUX1,'#10'       VWHISTORIALGRUPO.NIVELAUX2,'#10'   ' +
              '    VWHISTORIALGRUPO.CICLOCODIGO,'#10'       VWHISTORIALGRUPO.CICLON' +
              'OMBRE,'#10'       VWHISTORIALGRUPO.CICLOAUX1,'#10'       VWHISTORIALGRUP' +
              'O.CICLOAUX2,'#10'       VWHISTORIALGRUPO.CICLOFECHAINICIO,'#10'       VW' +
              'HISTORIALGRUPO.CICLOFECHAFINAL,'#10'       STATUS.IDSTATUS,'#10'       S' +
              'TATUS.CODIGO AS STATUSCODIGO,'#10'       STATUS.NOMBRE AS STATUSNOMB' +
              'RE,'#10'       HISTORIALALUMNO.BECA,'#10'       HISTORIALALUMNO.DESCUENT' +
              'O'#10'FROM STATUS'#10'   INNER JOIN ALUMNO ON (STATUS.IDSTATUS = ALUMNO.' +
              'IDSTATUS)'#10'   INNER JOIN HISTORIALALUMNO ON (ALUMNO.IDALUMNO = HI' +
              'STORIALALUMNO.IDALUMNO)'#10'   INNER JOIN'#10'(/*vwhistorialgrupo*/'#10'SELE' +
              'CT HISTORIALGRUPO.IDHISTORIALGRUPO,'#10'       NIVEL.IDNIVEL,'#10'      ' +
              ' CICLO.IDCICLO,'#10'       GRUPO.IDGRUPO,'#10'       GRUPO.CODIGO AS GRU' +
              'POCODIGO,'#10'       GRUPO.NOMBRE AS GRUPONOMBRE,'#10'       GRUPO.NOMBR' +
              'Eaux1 AS GRUPOaux1,'#10'       GRUPO.NOMBREaux2 AS GRUPOaux2,'#10'      ' +
              ' grupo.cupo,'#10'       NIVEL.CODIGO AS NIVELCODIGO,'#10'       NIVEL.NO' +
              'MBRE AS NIVELNOMBRE,'#10'       NIVEL.NOMBREaux1 AS NIVELaux1,'#10'     ' +
              '  NIVEL.NOMBREaux2 AS NIVELaux2,'#10'       CICLO.CODIGO AS CICLOCOD' +
              'IGO,'#10'       CICLO.NOMBRE AS CICLONOMBRE,'#10'       CICLO.NOMBREaux1' +
              ' AS CICLOaux1,'#10'       CICLO.NOMBREaux2 AS CICLOaux2,'#10'       CICL' +
              'O.FECHAFINAL AS CICLOFECHAFINAL,'#10'       CICLO.FECHAINICIO AS CIC' +
              'LOFECHAINICIO'#10'FROM GRUPO'#10'   INNER JOIN NIVEL ON (GRUPO.IDNIVEL =' +
              ' NIVEL.IDNIVEL)'#10'   INNER JOIN HISTORIALGRUPO ON (GRUPO.IDGRUPO =' +
              ' HISTORIALGRUPO.IDGRUPO)'#10'   INNER JOIN CICLO ON (HISTORIALGRUPO.' +
              'IDCICLO = CICLO.IDCICLO))'#10'VWHISTORIALGRUPO ON (HISTORIALALUMNO.I' +
              'DHISTORIALGRUPO ='#10'VWHISTORIALGRUPO.IDHISTORIALGRUPO))'#10'  VWHISTOR' +
              'IALALUMNO'#10'  /***************************************************' +
              '*******************/'#10'  WHERE IDCICLO = :IDCICLO AND IDGRUPO = :I' +
              'DGRUPO'#10'  ORDER BY ALUMNONOMBRE'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDALUMNO'
                TableField = 'IDALUMNO'
              end
              item
                DatasetField = 'ALUMNONOMBRE'
                TableField = 'ALUMNONOMBRE'
              end
              item
                DatasetField = 'ALUMNONUMCONTROL'
                TableField = 'ALUMNONUMCONTROL'
              end>
          end>
        Name = 'vwHistorialAlumnoInscripcion'
        Fields = <
          item
            Name = 'IDALUMNO'
            DataType = datInteger
          end
          item
            Name = 'ALUMNONOMBRE'
            DataType = datString
            Size = 70
          end
          item
            Name = 'ALUMNONUMCONTROL'
            DataType = datString
            Size = 12
          end>
      end
      item
        Params = <
          item
            Name = 'IDCICLO'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'IDGRUPO'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'IDTIPOCALIFICACION'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'IDMATERIA'
            Value = ''
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
            SQL = 
              'create table #temp1'#10'(IDCICLO int,'#10' IDGRUPO int,'#10' IDTIPOCALIFICAC' +
              'ION int,'#10' IDALUMNO int,'#10' ALUMNONOMBRE VARCHAR(70),'#10' ALUMNOCONTRO' +
              'L VARCHAR(12),'#10' CALIFICACION FLOAT,'#10' FALTAS int,'#10' CONDUCTA FLOAT' +
              ','#10' CALIFAUX1 FLOAT,'#10' IDMATERIA INT'#10')'#10#10'declare @IDALUMNO int'#10'decl' +
              'are @ALUMNONOMBRE varchar(50)'#10'declare @ALUMNONUMCONTROL varchar(' +
              '50)'#10'declare @IDMATERIA int'#10'declare @IDTIPOCALIFICACION int'#10'decla' +
              're @CALIFICACION FLOAT'#10'declare @FALTAS INT'#10'declare @CONDUCTA FLO' +
              'AT'#10'DECLARE @CALIFAUX1 FLOAT'#10#10'declare @idhistorialalumno int'#10'  /*' +
              ' ***************************************************************' +
              '*** */'#10#10'  declare CursorHistorialAlumno SCROLL CURSOR FOR'#10'  SELE' +
              'CT IDALUMNO, ALUMNONOMBRE, ALUMNONUMCONTROL, IDHISTORIALALUMNO'#10' ' +
              ' FROM'#10'  (/*vwhistorialalumno*/'#10'   SELECT HISTORIALALUMNO.IDHISTO' +
              'RIALALUMNO,'#10'       HISTORIALALUMNO.DOCUMENTOSFALTANTES,'#10'       V' +
              'WHISTORIALGRUPO.IDHISTORIALGRUPO,'#10'       VWHISTORIALGRUPO.IDCICL' +
              'O,'#10'       VWHISTORIALGRUPO.IDGRUPO,'#10'       ALUMNO.IDALUMNO,'#10'    ' +
              '   ALUMNO.NOMBRE AS ALUMNONOMBRE,'#10'       ALUMNO.NUMCONTROL AS AL' +
              'UMNONUMCONTROL,'#10'       ALUMNO.SEXO AS ALUMNOSEXO,'#10'       VWHISTO' +
              'RIALGRUPO.GRUPOCODIGO,'#10'       VWHISTORIALGRUPO.GRUPONOMBRE,'#10'    ' +
              '   VWHISTORIALGRUPO.GRUPOAUX1,'#10'       VWHISTORIALGRUPO.GRUPOAUX2' +
              ','#10'       VWHISTORIALGRUPO.NIVELCODIGO,'#10'       VWHISTORIALGRUPO.N' +
              'IVELNOMBRE,'#10'       VWHISTORIALGRUPO.NIVELAUX1,'#10'       VWHISTORIA' +
              'LGRUPO.NIVELAUX2,'#10'       VWHISTORIALGRUPO.CICLOCODIGO,'#10'       VW' +
              'HISTORIALGRUPO.CICLONOMBRE,'#10'       VWHISTORIALGRUPO.CICLOAUX1,'#10' ' +
              '      VWHISTORIALGRUPO.CICLOAUX2,'#10'       VWHISTORIALGRUPO.CICLOF' +
              'ECHAINICIO,'#10'       VWHISTORIALGRUPO.CICLOFECHAFINAL,'#10'       STAT' +
              'US.IDSTATUS,'#10'       STATUS.CODIGO AS STATUSCODIGO,'#10'       STATUS' +
              '.NOMBRE AS STATUSNOMBRE,'#10'       HISTORIALALUMNO.BECA,'#10'       HIS' +
              'TORIALALUMNO.DESCUENTO'#10'FROM STATUS'#10'   INNER JOIN ALUMNO ON (STAT' +
              'US.IDSTATUS = ALUMNO.IDSTATUS)'#10'   INNER JOIN HISTORIALALUMNO ON ' +
              '(ALUMNO.IDALUMNO = HISTORIALALUMNO.IDALUMNO)'#10'   INNER JOIN'#10'(/*vw' +
              'historialgrupo*/'#10'SELECT HISTORIALGRUPO.IDHISTORIALGRUPO,'#10'       ' +
              'NIVEL.IDNIVEL,'#10'       CICLO.IDCICLO,'#10'       GRUPO.IDGRUPO,'#10'     ' +
              '  GRUPO.CODIGO AS GRUPOCODIGO,'#10'       GRUPO.NOMBRE AS GRUPONOMBR' +
              'E,'#10'       GRUPO.NOMBREaux1 AS GRUPOaux1,'#10'       GRUPO.NOMBREaux2' +
              ' AS GRUPOaux2,'#10'       grupo.cupo,'#10'       NIVEL.CODIGO AS NIVELCO' +
              'DIGO,'#10'       NIVEL.NOMBRE AS NIVELNOMBRE,'#10'       NIVEL.NOMBREaux' +
              '1 AS NIVELaux1,'#10'       NIVEL.NOMBREaux2 AS NIVELaux2,'#10'       CIC' +
              'LO.CODIGO AS CICLOCODIGO,'#10'       CICLO.NOMBRE AS CICLONOMBRE,'#10'  ' +
              '     CICLO.NOMBREaux1 AS CICLOaux1,'#10'       CICLO.NOMBREaux2 AS C' +
              'ICLOaux2,'#10'       CICLO.FECHAFINAL AS CICLOFECHAFINAL,'#10'       CIC' +
              'LO.FECHAINICIO AS CICLOFECHAINICIO'#10'FROM GRUPO'#10'   INNER JOIN NIVE' +
              'L ON (GRUPO.IDNIVEL = NIVEL.IDNIVEL)'#10'   INNER JOIN HISTORIALGRUP' +
              'O ON (GRUPO.IDGRUPO = HISTORIALGRUPO.IDGRUPO)'#10'   INNER JOIN CICL' +
              'O ON (HISTORIALGRUPO.IDCICLO = CICLO.IDCICLO))'#10'VWHISTORIALGRUPO ' +
              'ON (HISTORIALALUMNO.IDHISTORIALGRUPO ='#10'VWHISTORIALGRUPO.IDHISTOR' +
              'IALGRUPO))'#10'  VWHISTORIALALUMNO'#10'  /******************************' +
              '****************************************/'#10'  WHERE IDCICLO = :IDC' +
              'ICLO AND IDGRUPO = :IDGRUPO and IDSTATUS <> 3'#10'  ORDER BY ALUMNON' +
              'OMBRE'#10'  /*******************************************************' +
              '***************/'#10#10'open CursorHistorialAlumno'#10'fetch next from Cur' +
              'sorHistorialAlumno'#10'into @IDALUMNO, @ALUMNONOMBRE, @ALUMNONUMCONT' +
              'ROL, @IDHISTORIALALUMNO'#10#10'while @@fetch_status = 0'#10'begin'#10#10'    dec' +
              'lare CursorCalifAlumno SCROLL CURSOR FOR'#10'    SELECT IDMATERIA, C' +
              'ALIFICACION, FALTAS, CALIFAUX2, CALIFAUX1'#10'    FROM CALIFICACION'#10 +
              '    WHERE (IDHISTORIALALUMNO = @IDHISTORIALALUMNO)'#10'    AND IDTIP' +
              'OCALIFICACION = :IDTIPOCALIFICACION AND IDMATERIA = :IDMATERIA'#10#10 +
              '    open CursorCalifAlumno'#10'    fetch next from CursorCalifAlumno' +
              #10'    into @IDMATERIA, @CALIFICACION, @FALTAS, @CONDUCTA, @CALIFA' +
              'UX1'#10#10'    while @@fetch_status = 0'#10'    begin'#10'    INSERT INTO #TEM' +
              'P1(IDCICLO,IDGRUPO,IDTIPOCALIFICACION,IDALUMNO,ALUMNONOMBRE,'#10'   ' +
              '                    ALUMNOCONTROL,CALIFICACION,FALTAS,CONDUCTA,C' +
              'ALIFAUX1,IDMATERIA)'#10'    VALUES(:IDCICLO, :IDGRUPO, :IDTIPOCALIFI' +
              'CACION, @IDALUMNO, @ALUMNONOMBRE, @ALUMNONUMCONTROL,'#10'           ' +
              '@CALIFICACION, @FALTAS, @CONDUCTA, @CALIFAUX1, @IDMATERIA)'#10'    f' +
              'etch next from CursorCalifAlumno'#10'    into @IDMATERIA, @CALIFICAC' +
              'ION, @FALTAS, @CONDUCTA, @CALIFAUX1'#10'    end'#10#10'    DEALLOCATE Curs' +
              'orCalifAlumno'#10'    fetch next from CursorHistorialAlumno'#10'    into' +
              ' @IDALUMNO, @ALUMNONOMBRE, @ALUMNONUMCONTROL, @IDHISTORIALALUMNO' +
              #10'end'#10#10'SELECT * FROM #TEMP1'#10#10'DEALLOCATE cursorHistorialAlumno'#10'DRO' +
              'P TABLE #TEMP1'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDCICLO'
                TableField = 'IDCICLO'
              end
              item
                DatasetField = 'IDGRUPO'
                TableField = 'IDGRUPO'
              end
              item
                DatasetField = 'IDTIPOCALIFICACION'
                TableField = 'IDTIPOCALIFICACION'
              end
              item
                DatasetField = 'IDALUMNO'
                TableField = 'IDALUMNO'
              end
              item
                DatasetField = 'ALUMNONOMBRE'
                TableField = 'ALUMNONOMBRE'
              end
              item
                DatasetField = 'ALUMNOCONTROL'
                TableField = 'ALUMNOCONTROL'
              end
              item
                DatasetField = 'CALIFICACION'
                TableField = 'CALIFICACION'
              end
              item
                DatasetField = 'FALTAS'
                TableField = 'FALTAS'
              end
              item
                DatasetField = 'CONDUCTA'
                TableField = 'CONDUCTA'
              end
              item
                DatasetField = 'CALIFAUX1'
                TableField = 'CALIFAUX1'
              end
              item
                DatasetField = 'IDMATERIA'
                TableField = 'IDMATERIA'
              end>
          end>
        Name = 'spConcentradoCalif'
        Fields = <
          item
            Name = 'IDCICLO'
            DataType = datInteger
          end
          item
            Name = 'IDGRUPO'
            DataType = datInteger
          end
          item
            Name = 'IDTIPOCALIFICACION'
            DataType = datInteger
          end
          item
            Name = 'IDALUMNO'
            DataType = datInteger
          end
          item
            Name = 'ALUMNONOMBRE'
            DataType = datString
            Size = 70
          end
          item
            Name = 'ALUMNOCONTROL'
            DataType = datString
            Size = 12
          end
          item
            Name = 'CALIFICACION'
            DataType = datFloat
          end
          item
            Name = 'FALTAS'
            DataType = datInteger
          end
          item
            Name = 'CONDUCTA'
            DataType = datFloat
          end
          item
            Name = 'CALIFAUX1'
            DataType = datFloat
          end
          item
            Name = 'IDMATERIA'
            DataType = datInteger
          end>
      end
      item
        Params = <
          item
            Name = 'idgrupo'
            Value = '2'
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
            SQL = 
              'SELECT MATERIA.CODIGO,'#10'       MATERIA.NOMBRE,'#10'       MATERIA.PRO' +
              'MEDIO,'#10'       MATERIA.IDMATERIA,'#10'       MATERIAGRUPO.IDGRUPO'#10'FRO' +
              'M MATERIA'#10'   INNER JOIN MATERIAGRUPO ON (MATERIA.IDMATERIA = MAT' +
              'ERIAGRUPO.IDMATERIA)'#10'where MATERIAGRUPO.idgrupo = :idgrupo'#10'order' +
              ' by MATERIA.NOMbreAUX2'#10#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'CODIGO'
                TableField = 'CODIGO'
              end
              item
                DatasetField = 'NOMBRE'
                TableField = 'NOMBRE'
              end
              item
                DatasetField = 'PROMEDIO'
                TableField = 'PROMEDIO'
              end
              item
                DatasetField = 'IDMATERIA'
                TableField = 'IDMATERIA'
              end
              item
                DatasetField = 'IDGRUPO'
                TableField = 'IDGRUPO'
              end>
          end>
        Name = 'spConcentradoMat'
        Fields = <
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
            Name = 'PROMEDIO'
            DataType = datInteger
          end
          item
            Name = 'IDMATERIA'
            DataType = datInteger
          end
          item
            Name = 'IDGRUPO'
            DataType = datInteger
          end>
      end
      item
        Params = <
          item
            Name = 'Cual'
            Value = '34'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
            SQL = 
              'CREATE TABLE #TEMP1'#10'('#10'  MATERIA VARCHAR(50),'#10'  MATERIACODIGO VAR' +
              'CHAR(10),'#10'  NOMBRE VARCHAR(70),'#10'  NUMCONTROL VARCHAR(12),'#10'  PROM' +
              'EDIO INT,'#10'  GRUPOCODIGO VARCHAR(10),'#10'  GRUPO VARCHAR(50),'#10'  CICL' +
              'O VARCHAR(50),'#10'  IDCALIFICACION INT,'#10'  IDMATERIA INT,'#10'  IDHISTOR' +
              'IALALUMNO INT,'#10'  IDHISTORIALGRUPO INT,'#10'  IDTIPOCALIFICACION INT,' +
              #10'  CALIFICACION FLOAT,'#10'  CALIFAUX1 FLOAT,'#10'  CALIFAUX2 FLOAT,'#10'  S' +
              'TATUS VARCHAR(1),'#10'  FALTAS INT,'#10'  FECHA DATETIME,'#10'  CALIF01 FLOA' +
              'T,'#10'  CALIF02 FLOAT,'#10'  CALIF03 FLOAT,'#10'  CALIF04 FLOAT,'#10'  CALIF05 ' +
              'FLOAT,'#10'  CALIF06 FLOAT,'#10'  CALIF07 FLOAT,'#10'  CALIF08 FLOAT,'#10'  CALI' +
              'F09 FLOAT,'#10'  CALIF10 FLOAT,'#10'  CALIF11 FLOAT,'#10'  CALIF12 FLOAT,'#10'  ' +
              'CALIF13 FLOAT,'#10'  CALIF14 FLOAT,'#10'  CALIF15 FLOAT,'#10'  CALIF16 FLOAT' +
              ','#10'  CALIFA01 FLOAT,'#10'  CALIFA02 FLOAT,'#10'  CALIFA03 FLOAT,'#10'  CALIFA' +
              '04 FLOAT,'#10'  CALIFA05 FLOAT,'#10'  CALIFA06 FLOAT,'#10'  CALIFA07 FLOAT,'#10 +
              '  CALIFA08 FLOAT,'#10'  CALIFA09 FLOAT,'#10'  CALIFA10 FLOAT,'#10'  CALIFA11' +
              ' FLOAT,'#10'  CALIFA12 FLOAT,'#10'  CALIFA13 FLOAT,'#10'  CALIFA14 FLOAT,'#10'  ' +
              'CALIFA15 FLOAT,'#10'  CALIFA16 FLOAT,'#10'  CALIFB01 FLOAT,'#10'  CALIFB02 F' +
              'LOAT,'#10'  CALIFB03 FLOAT,'#10'  CALIFB04 FLOAT,'#10'  CALIFB05 FLOAT,'#10'  CA' +
              'LIFB06 FLOAT,'#10'  CALIFB07 FLOAT,'#10'  CALIFB08 FLOAT,'#10'  CALIFB09 FLO' +
              'AT,'#10'  CALIFB10 FLOAT,'#10'  CALIFB11 FLOAT,'#10'  CALIFB12 FLOAT,'#10'  CALI' +
              'FB13 FLOAT,'#10'  CALIFB14 FLOAT,'#10'  CALIFB15 FLOAT,'#10'  CALIFB16 FLOAT' +
              ','#10'  FALTAS01 FLOAT,'#10'  FALTAS02 FLOAT,'#10'  FALTAS03 FLOAT,'#10'  FALTAS' +
              '04 FLOAT,'#10'  FALTAS05 FLOAT,'#10'  FALTAS06 FLOAT,'#10'  FALTAS07 FLOAT,'#10 +
              '  FALTAS08 FLOAT,'#10'  FALTAS09 FLOAT,'#10'  FALTAS10 FLOAT,'#10'  FALTAS11' +
              ' FLOAT,'#10'  FALTAS12 FLOAT,'#10'  FALTAS13 FLOAT,'#10'  FALTAS14 FLOAT,'#10'  ' +
              'FALTAS15 FLOAT,'#10'  FALTAS16 FLOAT,'#10'  REGU01 FLOAT,'#10'  REGU02 FLOAT' +
              ','#10'  REGU03 FLOAT,'#10'  REGU04 FLOAT,'#10'  REGU05 FLOAT,'#10'  PROM01 FLOAT' +
              ','#10'  PROM02 FLOAT,'#10'  PROM03 FLOAT,'#10'  PROM04 FLOAT,'#10'  PROM05 FLOAT' +
              ','#10'  PROM06 FLOAT,'#10'  PROM07 FLOAT,'#10'  PROM08 FLOAT,'#10'  PROM09 FLOAT' +
              ','#10'  PROM10 FLOAT,'#10'  PROM11 FLOAT,'#10'  PROM12 FLOAT,'#10'  PROM13 FLOAT' +
              ','#10'  PROM14 FLOAT,'#10'  PROM15 FLOAT,'#10'  PROM16 FLOAT,'#10'  ORDEN INTEGE' +
              'R,'#10'  NOTA01 VARCHAR(250),'#10'  NOTA02 VARCHAR(250),'#10'  NOTA03 VARCHA' +
              'R(250),'#10'  NOTA04 VARCHAR(250),'#10'  NOTA05 VARCHAR(250),'#10'  NOTA06 V' +
              'ARCHAR(250),'#10'  NOTA07 VARCHAR(250),'#10'  NOTA08 VARCHAR(250),'#10'  NOT' +
              'A09 VARCHAR(250),'#10'  NOTA10 VARCHAR(250),'#10'  NOTA11 VARCHAR(250),'#10 +
              '  NOTA12 VARCHAR(250),'#10'  NOTA13 VARCHAR(250),'#10'  NOTA14 VARCHAR(2' +
              '50),'#10'  NOTA15 VARCHAR(250),'#10'  NOTA16 VARCHAR(250)'#10')'#10#10' DECLARE @M' +
              'ATERIA VARCHAR(50)'#10' DECLARE @MATERIACODIGO VARCHAR(10)'#10' DECLARE ' +
              '@ORDEN INT'#10' DECLARE @NOMBRE VARCHAR(70)'#10' DECLARE @NUMCONTROL VAR' +
              'CHAR(12)'#10' DECLARE @PROMEDIO INT'#10' DECLARE @GRUPOCODIGO VARCHAR(10' +
              ')'#10' DECLARE @GRUPO VARCHAR(50)'#10' DECLARE @CICLO VARCHAR(50)'#10' DECLA' +
              'RE @IDCALIFICACION INT'#10' DECLARE @IDMATERIA INT'#10' DECLARE @IDHISTO' +
              'RIALALUMNO INT'#10' DECLARE @IDHISTORIALGRUPO INT'#10' DECLARE @IDTIPOCA' +
              'LIFICACION INT'#10' DECLARE @CALIFICACION FLOAT'#10' DECLARE @CALIFAUX1 ' +
              'FLOAT'#10' DECLARE @CALIFAUX2 FLOAT'#10' DECLARE @STATUS VARCHAR(1)'#10' DEC' +
              'LARE @FALTAS INT'#10' DECLARE @FECHA DATETIME'#10' DECLARE @CALIF01 FLOA' +
              'T'#10' DECLARE @CALIF02 FLOAT'#10' DECLARE @CALIF03 FLOAT'#10' DECLARE @CALI' +
              'F04 FLOAT'#10' DECLARE @CALIF05 FLOAT'#10' DECLARE @CALIF06 FLOAT'#10' DECLA' +
              'RE @CALIF07 FLOAT'#10' DECLARE @CALIF08 FLOAT'#10' DECLARE @CALIF09 FLOA' +
              'T'#10' DECLARE @CALIF10 FLOAT'#10' DECLARE @CALIF11 FLOAT'#10' DECLARE @CALI' +
              'F12 FLOAT'#10' DECLARE @CALIF13 FLOAT'#10' DECLARE @CALIF14 FLOAT'#10' DECLA' +
              'RE @CALIF15 FLOAT'#10' DECLARE @CALIF16 FLOAT'#10' DECLARE @CALIFA01 FLO' +
              'AT'#10' DECLARE @CALIFA02 FLOAT'#10' DECLARE @CALIFA03 FLOAT'#10' DECLARE @C' +
              'ALIFA04 FLOAT'#10' DECLARE @CALIFA05 FLOAT'#10' DECLARE @CALIFA06 FLOAT'#10 +
              ' DECLARE @CALIFA07 FLOAT'#10' DECLARE @CALIFA08 FLOAT'#10' DECLARE @CALI' +
              'FA09 FLOAT'#10' DECLARE @CALIFA10 FLOAT'#10' DECLARE @CALIFA11 FLOAT'#10' DE' +
              'CLARE @CALIFA12 FLOAT'#10' DECLARE @CALIFA13 FLOAT'#10' DECLARE @CALIFA1' +
              '4 FLOAT'#10' DECLARE @CALIFA15 FLOAT'#10' DECLARE @CALIFA16 FLOAT'#10' DECLA' +
              'RE @CALIFB01 FLOAT'#10' DECLARE @CALIFB02 FLOAT'#10' DECLARE @CALIFB03 F' +
              'LOAT'#10' DECLARE @CALIFB04 FLOAT'#10' DECLARE @CALIFB05 FLOAT'#10' DECLARE ' +
              '@CALIFB06 FLOAT'#10' DECLARE @CALIFB07 FLOAT'#10' DECLARE @CALIFB08 FLOA' +
              'T'#10' DECLARE @CALIFB09 FLOAT'#10' DECLARE @CALIFB10 FLOAT'#10' DECLARE @CA' +
              'LIFB11 FLOAT'#10' DECLARE @CALIFB12 FLOAT'#10' DECLARE @CALIFB13 FLOAT'#10' ' +
              'DECLARE @CALIFB14 FLOAT'#10' DECLARE @CALIFB15 FLOAT'#10' DECLARE @CALIF' +
              'B16 FLOAT'#10' DECLARE @FALTAS01 FLOAT'#10' DECLARE @FALTAS02 FLOAT'#10' DEC' +
              'LARE @FALTAS03 FLOAT'#10' DECLARE @FALTAS04 FLOAT'#10' DECLARE @FALTAS05' +
              ' FLOAT'#10' DECLARE @FALTAS06 FLOAT'#10' DECLARE @FALTAS07 FLOAT'#10' DECLAR' +
              'E @FALTAS08 FLOAT'#10' DECLARE @FALTAS09 FLOAT'#10' DECLARE @FALTAS10 FL' +
              'OAT'#10' DECLARE @FALTAS11 FLOAT'#10' DECLARE @FALTAS12 FLOAT'#10' DECLARE @' +
              'FALTAS13 FLOAT'#10' DECLARE @FALTAS14 FLOAT'#10' DECLARE @FALTAS15 FLOAT' +
              #10' DECLARE @FALTAS16 FLOAT'#10' DECLARE @REGU01 FLOAT'#10' DECLARE @REGU0' +
              '2 FLOAT'#10' DECLARE @REGU03 FLOAT'#10' DECLARE @REGU04 FLOAT'#10' DECLARE @' +
              'REGU05 FLOAT'#10' DECLARE @PROM01 FLOAT'#10' DECLARE @PROM02 FLOAT'#10' DECL' +
              'ARE @PROM03 FLOAT'#10' DECLARE @PROM04 FLOAT'#10' DECLARE @PROM05 FLOAT'#10 +
              ' DECLARE @PROM06 FLOAT'#10' DECLARE @PROM07 FLOAT'#10' DECLARE @PROM08 F' +
              'LOAT'#10' DECLARE @PROM09 FLOAT'#10' DECLARE @PROM10 FLOAT'#10' DECLARE @PRO' +
              'M11 FLOAT'#10' DECLARE @PROM12 FLOAT'#10' DECLARE @PROM13 FLOAT'#10' DECLARE' +
              ' @PROM14 FLOAT'#10' DECLARE @PROM15 FLOAT'#10' DECLARE @PROM16 FLOAT'#10' DE' +
              'CLARE @NOTA01 VARCHAR(250)'#10' DECLARE @NOTA02 VARCHAR(250)'#10' DECLAR' +
              'E @NOTA03 VARCHAR(250)'#10' DECLARE @NOTA04 VARCHAR(250)'#10' DECLARE @N' +
              'OTA05 VARCHAR(250)'#10' DECLARE @NOTA06 VARCHAR(250)'#10' DECLARE @NOTA0' +
              '7 VARCHAR(250)'#10' DECLARE @NOTA08 VARCHAR(250)'#10' DECLARE @NOTA09 VA' +
              'RCHAR(250)'#10' DECLARE @NOTA10 VARCHAR(250)'#10' DECLARE @NOTA11 VARCHA' +
              'R(250)'#10' DECLARE @NOTA12 VARCHAR(250)'#10' DECLARE @NOTA13 VARCHAR(25' +
              '0)'#10' DECLARE @NOTA14 VARCHAR(250)'#10' DECLARE @NOTA15 VARCHAR(250)'#10' ' +
              'DECLARE @NOTA16 VARCHAR(250)'#10#10#10'declare CursorBoletaInterna SCROL' +
              'L CURSOR FOR'#10'SELECT'#10'      MATERIA.NOMBRE AS MATERIA,'#10'      MATER' +
              'IA.CODIGO AS MATERIACODIGO,'#10'      MATERIA.ORDENINTERNO,'#10'      AL' +
              'UMNO.NOMBRE,'#10'      ALUMNO.NUMCONTROL,'#10'      MATERIA.PROMEDIO,'#10'  ' +
              '    GRUPO.CODIGO AS GRUPOCODIGO,'#10'      GRUPO.NOMBRE AS GRUPO,'#10'  ' +
              '    CICLO.CODIGO AS CICLO,'#10'      CALIFICACION.IDCALIFICACION,'#10'  ' +
              '    CALIFICACION.IDMATERIA,'#10'      CALIFICACION.IDHISTORIALALUMNO' +
              ','#10'      CALIFICACION.IDHISTORIALGRUPO,'#10'      CALIFICACION.IDTIPO' +
              'CALIFICACION,'#10'      CALIFICACION.CALIFICACION,'#10'      CALIFICACIO' +
              'N.CALIFAUX1,'#10'      CALIFICACION.CALIFAUX2,'#10'      CALIFICACION.ST' +
              'ATUS,'#10'      CALIFICACION.FALTAS,'#10'      CALIFICACION.FECHA,'#10'     ' +
              ' CALIFICACION.CALIF01,'#10'      CALIFICACION.CALIF02,'#10'      CALIFIC' +
              'ACION.CALIF03,'#10'      CALIFICACION.CALIF04,'#10'      CALIFICACION.CA' +
              'LIF05,'#10'      CALIFICACION.CALIF06,'#10'      CALIFICACION.CALIF07,'#10' ' +
              '     CALIFICACION.CALIF08,'#10'      CALIFICACION.CALIF09,'#10'      CAL' +
              'IFICACION.CALIF10,'#10'      CALIFICACION.CALIF11,'#10'      CALIFICACIO' +
              'N.CALIF12,'#10'      CALIFICACION.CALIF13,'#10'      CALIFICACION.CALIF1' +
              '4,'#10'      CALIFICACION.CALIF15,'#10'      CALIFICACION.CALIF16,'#10'     ' +
              ' CALIFICACION.CALIFA01,'#10'      CALIFICACION.CALIFA02,'#10'      CALIF' +
              'ICACION.CALIFA03,'#10'      CALIFICACION.CALIFA04,'#10'      CALIFICACIO' +
              'N.CALIFA05,'#10'      CALIFICACION.CALIFA06,'#10'      CALIFICACION.CALI' +
              'FA07,'#10'      CALIFICACION.CALIFA08,'#10'      CALIFICACION.CALIFA09,'#10 +
              '      CALIFICACION.CALIFA10,'#10'      CALIFICACION.CALIFA11,'#10'      ' +
              'CALIFICACION.CALIFA12,'#10'      CALIFICACION.CALIFA13,'#10'      CALIFI' +
              'CACION.CALIFA14,'#10'      CALIFICACION.CALIFA15,'#10'      CALIFICACION' +
              '.CALIFA16,'#10'      CALIFICACION.CALIFB01,'#10'      CALIFICACION.CALIF' +
              'B02,'#10'      CALIFICACION.CALIFB03,'#10'      CALIFICACION.CALIFB04,'#10' ' +
              '     CALIFICACION.CALIFB05,'#10'      CALIFICACION.CALIFB06,'#10'      C' +
              'ALIFICACION.CALIFB07,'#10'      CALIFICACION.CALIFB08,'#10'      CALIFIC' +
              'ACION.CALIFB09,'#10'      CALIFICACION.CALIFB10,'#10'      CALIFICACION.' +
              'CALIFB11,'#10'      CALIFICACION.CALIFB12,'#10'      CALIFICACION.CALIFB' +
              '13,'#10'      CALIFICACION.CALIFB14,'#10'      CALIFICACION.CALIFB15,'#10'  ' +
              '    CALIFICACION.CALIFB16,'#10'      CALIFICACION.FALTAS01,'#10'      CA' +
              'LIFICACION.FALTAS02,'#10'      CALIFICACION.FALTAS03,'#10'      CALIFICA' +
              'CION.FALTAS04,'#10'      CALIFICACION.FALTAS05,'#10'      CALIFICACION.F' +
              'ALTAS06,'#10'      CALIFICACION.FALTAS07,'#10'      CALIFICACION.FALTAS0' +
              '8,'#10'      CALIFICACION.FALTAS09,'#10'      CALIFICACION.FALTAS10,'#10'   ' +
              '   CALIFICACION.FALTAS11,'#10'      CALIFICACION.FALTAS12,'#10'      CAL' +
              'IFICACION.FALTAS13,'#10'      CALIFICACION.FALTAS14,'#10'      CALIFICAC' +
              'ION.FALTAS15,'#10'      CALIFICACION.FALTAS16,'#10'      CALIFICACION.RE' +
              'GU01,'#10'      CALIFICACION.REGU02,'#10'      CALIFICACION.REGU03,'#10'    ' +
              '  CALIFICACION.REGU04,'#10'      CALIFICACION.REGU05,'#10'      CALIFICA' +
              'CION.NOTA01,'#10'      CALIFICACION.NOTA02,'#10'      CALIFICACION.NOTA0' +
              '3,'#10'      CALIFICACION.NOTA04,'#10'      CALIFICACION.NOTA05,'#10'      C' +
              'ALIFICACION.NOTA06,'#10'      CALIFICACION.NOTA07,'#10'      CALIFICACIO' +
              'N.NOTA08,'#10'      CALIFICACION.NOTA09,'#10'      CALIFICACION.NOTA10,'#10 +
              '      CALIFICACION.NOTA11,'#10'      CALIFICACION.NOTA12,'#10'      CALI' +
              'FICACION.NOTA13,'#10'      CALIFICACION.NOTA14,'#10'      CALIFICACION.N' +
              'OTA15,'#10'      CALIFICACION.NOTA16'#10'    FROM'#10'      CALIFICACION'#10'   ' +
              '   INNER JOIN MATERIA ON (CALIFICACION.IDMATERIA = MATERIA.IDMAT' +
              'ERIA)'#10'      INNER JOIN HISTORIALALUMNO ON (CALIFICACION.IDHISTOR' +
              'IALALUMNO = HISTORIALALUMNO.IDHISTORIALALUMNO)'#10'      INNER JOIN ' +
              'ALUMNO ON (HISTORIALALUMNO.IDALUMNO = ALUMNO.IDALUMNO)'#10'      INN' +
              'ER JOIN HISTORIALGRUPO ON (HISTORIALALUMNO.IDHISTORIALGRUPO = HI' +
              'STORIALGRUPO.IDHISTORIALGRUPO)'#10'      INNER JOIN GRUPO ON (HISTOR' +
              'IALGRUPO.IDGRUPO = GRUPO.IDGRUPO)'#10'      INNER JOIN CICLO ON (HIS' +
              'TORIALGRUPO.IDCICLO = CICLO.IDCICLO)'#10'    WHERE'#10'      (HISTORIALA' +
              'LUMNO.IDHISTORIALALUMNO = :Cual) AND (MATERIA.INGLES > 0)'#10'    OR' +
              'DER BY'#10'      MATERIA.ORDENINTERNO'#10#10'open CursorBoletaInterna'#10'fetc' +
              'h next from CursorBoletaInterna'#10'into @MATERIA, @MATERIACODIGO,@O' +
              'RDEN, @NOMBRE, @NUMCONTROL, @PROMEDIO, @GRUPOCODIGO, @GRUPO, @CI' +
              'CLO,'#10'     @IDCALIFICACION, @IDMATERIA, @IDHISTORIALALUMNO, @IDHI' +
              'STORIALGRUPO, @IDTIPOCALIFICACION, @CALIFICACION,'#10'     @CALIFAUX' +
              '1, @CALIFAUX2, @STATUS, @FALTAS, @FECHA, @CALIF01, @CALIF02, @CA' +
              'LIF03, @CALIF04, @CALIF05,'#10'     @CALIF06, @CALIF07, @CALIF08, @C' +
              'ALIF09, @CALIF10, @CALIF11, @CALIF12, @CALIF13, @CALIF14, @CALIF' +
              '15,'#10'     @CALIF16, @CALIFA01, @CALIFA02, @CALIFA03, @CALIFA04, @' +
              'CALIFA05, @CALIFA06, @CALIFA07, @CALIFA08, @CALIFA09,'#10'     @CALI' +
              'FA10, @CALIFA11, @CALIFA12, @CALIFA13, @CALIFA14, @CALIFA15, @CA' +
              'LIFA16, @CALIFB01, @CALIFB02, @CALIFB03,'#10'     @CALIFB04, @CALIFB' +
              '05, @CALIFB06, @CALIFB07, @CALIFB08, @CALIFB09, @CALIFB10, @CALI' +
              'FB11, @CALIFB12, @CALIFB13,'#10'     @CALIFB14, @CALIFB15, @CALIFB16' +
              ', @FALTAS01, @FALTAS02, @FALTAS03, @FALTAS04, @FALTAS05, @FALTAS' +
              '06, @FALTAS07,'#10'     @FALTAS08, @FALTAS09, @FALTAS10, @FALTAS11, ' +
              '@FALTAS12, @FALTAS13, @FALTAS14, @FALTAS15, @FALTAS16, @REGU01,'#10 +
              '     @REGU02, @REGU03, @REGU04, @REGU05, @NOTA01, @NOTA02, @NOTA' +
              '03,@NOTA04,@NOTA05,@NOTA06,@NOTA07,@NOTA08,@NOTA09,'#10'     @NOTA10' +
              ',@NOTA11,@NOTA12,@NOTA13,@NOTA14,@NOTA15,@NOTA16'#10'while @@fetch_s' +
              'tatus = 0'#10'begin'#10'   declare CursorCalif SCROLL CURSOR FOR'#10'   SELE' +
              'CT AVG(CALIF01), AVG(CALIF02), AVG(CALIF03), AVG(CALIF04), AVG(C' +
              'ALIF05),'#10'          AVG(CALIF06), AVG(CALIF07), AVG(CALIF08), AVG' +
              '(CALIF09), AVG(CALIF10),'#10'          AVG(CALIF11), AVG(CALIF12), A' +
              'VG(CALIF13), AVG(CALIF14), AVG(CALIF15),'#10'          AVG(CALIF16) ' +
              'FROM CALIFICACION'#10'   WHERE IDMATERIA = @IDMATERIA AND IDHISTORIA' +
              'LGRUPO = @IDHISTORIALGRUPO'#10#10'   open CursorCalif'#10#10'   fetch next f' +
              'rom CursorCalif'#10'   into @PROM01, @PROM02, @PROM03, @PROM04, @PRO' +
              'M05, @PROM06, @PROM07, @PROM08, @PROM09, @PROM10,'#10'        @PROM1' +
              '1, @PROM12, @PROM13, @PROM14, @PROM15, @PROM16'#10#10'   DEALLOCATE Cu' +
              'rsorCalif'#10'   INSERT INTO #TEMP1(MATERIA, MATERIACODIGO, NOMBRE, ' +
              'NUMCONTROL, PROMEDIO, GRUPOCODIGO, GRUPO, CICLO,'#10'               ' +
              '       IDCALIFICACION, IDMATERIA, IDHISTORIALALUMNO, IDHISTORIAL' +
              'GRUPO, IDTIPOCALIFICACION, CALIFICACION,'#10'                      C' +
              'ALIFAUX1, CALIFAUX2, STATUS, FALTAS, FECHA, CALIF01, CALIF02, CA' +
              'LIF03, CALIF04, CALIF05, CALIF06,'#10'                      CALIF07,' +
              ' CALIF08, CALIF09, CALIF10, CALIF11, CALIF12, CALIF13, CALIF14, ' +
              'CALIF15, CALIF16, CALIFA01,'#10'                      CALIFA02, CALI' +
              'FA03, CALIFA04, CALIFA05, CALIFA06, CALIFA07, CALIFA08, CALIFA09' +
              ', CALIFA10, CALIFA11,'#10'                      CALIFA12, CALIFA13, ' +
              'CALIFA14, CALIFA15, CALIFA16, CALIFB01, CALIFB02, CALIFB03, CALI' +
              'FB04, CALIFB05,'#10'                      CALIFB06, CALIFB07, CALIFB' +
              '08, CALIFB09, CALIFB10, CALIFB11, CALIFB12, CALIFB13, CALIFB14, ' +
              'CALIFB15,'#10'                      CALIFB16, FALTAS01, FALTAS02, FA' +
              'LTAS03, FALTAS04, FALTAS05, FALTAS06, FALTAS07, FALTAS08, FALTAS' +
              '09,'#10'                      FALTAS10, FALTAS11, FALTAS12, FALTAS13' +
              ', FALTAS14, FALTAS15, FALTAS16, REGU01, REGU02, REGU03, REGU04,'#10 +
              '                      REGU05, PROM01, PROM02, PROM03, PROM04, PR' +
              'OM05, PROM06, PROM07, PROM08, PROM09, PROM10, PROM11, PROM12,'#10'  ' +
              '                    PROM13, PROM14, PROM15, PROM16, ORDEN, NOTA0' +
              '1, NOTA02, NOTA03, NOTA04, NOTA05, NOTA06, NOTA07, NOTA08,'#10'     ' +
              '                 NOTA09, NOTA10, NOTA11, NOTA12, NOTA13, NOTA14,' +
              ' NOTA15, NOTA16)'#10'   VALUES(@MATERIA, @MATERIACODIGO, @NOMBRE, @N' +
              'UMCONTROL, @PROMEDIO, @GRUPOCODIGO, @GRUPO, @CICLO,'#10'            ' +
              '          @IDCALIFICACION, @IDMATERIA, @IDHISTORIALALUMNO, @IDHI' +
              'STORIALGRUPO, @IDTIPOCALIFICACION, @CALIFICACION,'#10'              ' +
              '        @CALIFAUX1, @CALIFAUX2, @STATUS, @FALTAS, @FECHA, @CALIF' +
              '01, @CALIF02, @CALIF03, @CALIF04, @CALIF05, @CALIF06,'#10'          ' +
              '            @CALIF07, @CALIF08, @CALIF09, @CALIF10, @CALIF11, @C' +
              'ALIF12, @CALIF13, @CALIF14, @CALIF15, @CALIF16, @CALIFA01,'#10'     ' +
              '                 @CALIFA02, @CALIFA03, @CALIFA04, @CALIFA05, @CA' +
              'LIFA06, @CALIFA07, @CALIFA08, @CALIFA09, @CALIFA10, @CALIFA11,'#10' ' +
              '                     @CALIFA12, @CALIFA13, @CALIFA14, @CALIFA15,' +
              ' @CALIFA16, @CALIFB01, @CALIFB02, @CALIFB03, @CALIFB04, @CALIFB0' +
              '5,'#10'                      @CALIFB06, @CALIFB07, @CALIFB08, @CALIF' +
              'B09, @CALIFB10, @CALIFB11, @CALIFB12, @CALIFB13, @CALIFB14, @CAL' +
              'IFB15,'#10'                      @CALIFB16, @FALTAS01, @FALTAS02, @F' +
              'ALTAS03, @FALTAS04, @FALTAS05, @FALTAS06, @FALTAS07, @FALTAS08, ' +
              '@FALTAS09,'#10'                      @FALTAS10, @FALTAS11, @FALTAS12' +
              ', @FALTAS13, @FALTAS14, @FALTAS15, @FALTAS16, @REGU01, @REGU02, ' +
              '@REGU03, @REGU04,'#10'                      @REGU05, @PROM01, @PROM0' +
              '2, @PROM03, @PROM04, @PROM05, @PROM06, @PROM07, @PROM08, @PROM09' +
              ', @PROM10, @PROM11, @PROM12,'#10'                      @PROM13, @PRO' +
              'M14, @PROM15, @PROM16, @ORDEN, @NOTA01, @NOTA02, @NOTA03, @NOTA0' +
              '4, @NOTA05, @NOTA06, @NOTA07, @NOTA08,'#10'                      @NO' +
              'TA09, @NOTA10, @NOTA11, @NOTA12, @NOTA13, @NOTA14, @NOTA15, @NOT' +
              'A16)'#10'fetch next from CursorBoletaInterna'#10'into @MATERIA, @MATERIA' +
              'CODIGO,@ORDEN, @NOMBRE, @NUMCONTROL, @PROMEDIO, @GRUPOCODIGO, @G' +
              'RUPO, @CICLO,'#10'     @IDCALIFICACION, @IDMATERIA, @IDHISTORIALALUM' +
              'NO, @IDHISTORIALGRUPO, @IDTIPOCALIFICACION, @CALIFICACION,'#10'     ' +
              '@CALIFAUX1, @CALIFAUX2, @STATUS, @FALTAS, @FECHA, @CALIF01, @CAL' +
              'IF02, @CALIF03, @CALIF04, @CALIF05,'#10'     @CALIF06, @CALIF07, @CA' +
              'LIF08, @CALIF09, @CALIF10, @CALIF11, @CALIF12, @CALIF13, @CALIF1' +
              '4, @CALIF15,'#10'     @CALIF16, @CALIFA01, @CALIFA02, @CALIFA03, @CA' +
              'LIFA04, @CALIFA05, @CALIFA06, @CALIFA07, @CALIFA08, @CALIFA09,'#10' ' +
              '    @CALIFA10, @CALIFA11, @CALIFA12, @CALIFA13, @CALIFA14, @CALI' +
              'FA15, @CALIFA16, @CALIFB01, @CALIFB02, @CALIFB03,'#10'     @CALIFB04' +
              ', @CALIFB05, @CALIFB06, @CALIFB07, @CALIFB08, @CALIFB09, @CALIFB' +
              '10, @CALIFB11, @CALIFB12, @CALIFB13,'#10'     @CALIFB14, @CALIFB15, ' +
              '@CALIFB16, @FALTAS01, @FALTAS02, @FALTAS03, @FALTAS04, @FALTAS05' +
              ', @FALTAS06, @FALTAS07,'#10'     @FALTAS08, @FALTAS09, @FALTAS10, @F' +
              'ALTAS11, @FALTAS12, @FALTAS13, @FALTAS14, @FALTAS15, @FALTAS16, ' +
              '@REGU01,'#10'     @REGU02, @REGU03, @REGU04, @REGU05, @NOTA01, @NOTA' +
              '02, @NOTA03, @NOTA04, @NOTA05, @NOTA06, @NOTA07, @NOTA08,'#10'     @' +
              'NOTA09, @NOTA10, @NOTA11, @NOTA12, @NOTA13, @NOTA14, @NOTA15, @N' +
              'OTA16'#10'end'#10#10'SELECT DISTINCT * FROM #TEMP1'#10'DEALLOCATE CursorBoleta' +
              'Interna'#10'DROP TABLE #TEMP1'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'MATERIA'
                TableField = 'MATERIA'
              end
              item
                DatasetField = 'MATERIACODIGO'
                TableField = 'MATERIACODIGO'
              end
              item
                DatasetField = 'NOMBRE'
                TableField = 'NOMBRE'
              end
              item
                DatasetField = 'NUMCONTROL'
                TableField = 'NUMCONTROL'
              end
              item
                DatasetField = 'PROMEDIO'
                TableField = 'PROMEDIO'
              end
              item
                DatasetField = 'GRUPOCODIGO'
                TableField = 'GRUPOCODIGO'
              end
              item
                DatasetField = 'GRUPO'
                TableField = 'GRUPO'
              end
              item
                DatasetField = 'CICLO'
                TableField = 'CICLO'
              end
              item
                DatasetField = 'IDCALIFICACION'
                TableField = 'IDCALIFICACION'
              end
              item
                DatasetField = 'IDMATERIA'
                TableField = 'IDMATERIA'
              end
              item
                DatasetField = 'IDHISTORIALALUMNO'
                TableField = 'IDHISTORIALALUMNO'
              end
              item
                DatasetField = 'IDHISTORIALGRUPO'
                TableField = 'IDHISTORIALGRUPO'
              end
              item
                DatasetField = 'IDTIPOCALIFICACION'
                TableField = 'IDTIPOCALIFICACION'
              end
              item
                DatasetField = 'CALIFICACION'
                TableField = 'CALIFICACION'
              end
              item
                DatasetField = 'CALIFAUX1'
                TableField = 'CALIFAUX1'
              end
              item
                DatasetField = 'CALIFAUX2'
                TableField = 'CALIFAUX2'
              end
              item
                DatasetField = 'STATUS'
                TableField = 'STATUS'
              end
              item
                DatasetField = 'FALTAS'
                TableField = 'FALTAS'
              end
              item
                DatasetField = 'FECHA'
                TableField = 'FECHA'
              end
              item
                DatasetField = 'CALIF01'
                TableField = 'CALIF01'
              end
              item
                DatasetField = 'CALIF02'
                TableField = 'CALIF02'
              end
              item
                DatasetField = 'CALIF03'
                TableField = 'CALIF03'
              end
              item
                DatasetField = 'CALIF04'
                TableField = 'CALIF04'
              end
              item
                DatasetField = 'CALIF05'
                TableField = 'CALIF05'
              end
              item
                DatasetField = 'CALIF06'
                TableField = 'CALIF06'
              end
              item
                DatasetField = 'CALIF07'
                TableField = 'CALIF07'
              end
              item
                DatasetField = 'CALIF08'
                TableField = 'CALIF08'
              end
              item
                DatasetField = 'CALIF09'
                TableField = 'CALIF09'
              end
              item
                DatasetField = 'CALIF10'
                TableField = 'CALIF10'
              end
              item
                DatasetField = 'CALIF11'
                TableField = 'CALIF11'
              end
              item
                DatasetField = 'CALIF12'
                TableField = 'CALIF12'
              end
              item
                DatasetField = 'CALIF13'
                TableField = 'CALIF13'
              end
              item
                DatasetField = 'CALIF14'
                TableField = 'CALIF14'
              end
              item
                DatasetField = 'CALIF15'
                TableField = 'CALIF15'
              end
              item
                DatasetField = 'CALIF16'
                TableField = 'CALIF16'
              end
              item
                DatasetField = 'CALIFA01'
                TableField = 'CALIFA01'
              end
              item
                DatasetField = 'CALIFA02'
                TableField = 'CALIFA02'
              end
              item
                DatasetField = 'CALIFA03'
                TableField = 'CALIFA03'
              end
              item
                DatasetField = 'CALIFA04'
                TableField = 'CALIFA04'
              end
              item
                DatasetField = 'CALIFA05'
                TableField = 'CALIFA05'
              end
              item
                DatasetField = 'CALIFA06'
                TableField = 'CALIFA06'
              end
              item
                DatasetField = 'CALIFA07'
                TableField = 'CALIFA07'
              end
              item
                DatasetField = 'CALIFA08'
                TableField = 'CALIFA08'
              end
              item
                DatasetField = 'CALIFA09'
                TableField = 'CALIFA09'
              end
              item
                DatasetField = 'CALIFA10'
                TableField = 'CALIFA10'
              end
              item
                DatasetField = 'CALIFA11'
                TableField = 'CALIFA11'
              end
              item
                DatasetField = 'CALIFA12'
                TableField = 'CALIFA12'
              end
              item
                DatasetField = 'CALIFA13'
                TableField = 'CALIFA13'
              end
              item
                DatasetField = 'CALIFA14'
                TableField = 'CALIFA14'
              end
              item
                DatasetField = 'CALIFA15'
                TableField = 'CALIFA15'
              end
              item
                DatasetField = 'CALIFA16'
                TableField = 'CALIFA16'
              end
              item
                DatasetField = 'CALIFB01'
                TableField = 'CALIFB01'
              end
              item
                DatasetField = 'CALIFB02'
                TableField = 'CALIFB02'
              end
              item
                DatasetField = 'CALIFB03'
                TableField = 'CALIFB03'
              end
              item
                DatasetField = 'CALIFB04'
                TableField = 'CALIFB04'
              end
              item
                DatasetField = 'CALIFB05'
                TableField = 'CALIFB05'
              end
              item
                DatasetField = 'CALIFB06'
                TableField = 'CALIFB06'
              end
              item
                DatasetField = 'CALIFB07'
                TableField = 'CALIFB07'
              end
              item
                DatasetField = 'CALIFB08'
                TableField = 'CALIFB08'
              end
              item
                DatasetField = 'CALIFB09'
                TableField = 'CALIFB09'
              end
              item
                DatasetField = 'CALIFB10'
                TableField = 'CALIFB10'
              end
              item
                DatasetField = 'CALIFB11'
                TableField = 'CALIFB11'
              end
              item
                DatasetField = 'CALIFB12'
                TableField = 'CALIFB12'
              end
              item
                DatasetField = 'CALIFB13'
                TableField = 'CALIFB13'
              end
              item
                DatasetField = 'CALIFB14'
                TableField = 'CALIFB14'
              end
              item
                DatasetField = 'CALIFB15'
                TableField = 'CALIFB15'
              end
              item
                DatasetField = 'CALIFB16'
                TableField = 'CALIFB16'
              end
              item
                DatasetField = 'FALTAS01'
                TableField = 'FALTAS01'
              end
              item
                DatasetField = 'FALTAS02'
                TableField = 'FALTAS02'
              end
              item
                DatasetField = 'FALTAS03'
                TableField = 'FALTAS03'
              end
              item
                DatasetField = 'FALTAS04'
                TableField = 'FALTAS04'
              end
              item
                DatasetField = 'FALTAS05'
                TableField = 'FALTAS05'
              end
              item
                DatasetField = 'FALTAS06'
                TableField = 'FALTAS06'
              end
              item
                DatasetField = 'FALTAS07'
                TableField = 'FALTAS07'
              end
              item
                DatasetField = 'FALTAS08'
                TableField = 'FALTAS08'
              end
              item
                DatasetField = 'FALTAS09'
                TableField = 'FALTAS09'
              end
              item
                DatasetField = 'FALTAS10'
                TableField = 'FALTAS10'
              end
              item
                DatasetField = 'FALTAS11'
                TableField = 'FALTAS11'
              end
              item
                DatasetField = 'FALTAS12'
                TableField = 'FALTAS12'
              end
              item
                DatasetField = 'FALTAS13'
                TableField = 'FALTAS13'
              end
              item
                DatasetField = 'FALTAS14'
                TableField = 'FALTAS14'
              end
              item
                DatasetField = 'FALTAS15'
                TableField = 'FALTAS15'
              end
              item
                DatasetField = 'FALTAS16'
                TableField = 'FALTAS16'
              end
              item
                DatasetField = 'REGU01'
                TableField = 'REGU01'
              end
              item
                DatasetField = 'REGU02'
                TableField = 'REGU02'
              end
              item
                DatasetField = 'REGU03'
                TableField = 'REGU03'
              end
              item
                DatasetField = 'REGU04'
                TableField = 'REGU04'
              end
              item
                DatasetField = 'REGU05'
                TableField = 'REGU05'
              end
              item
                DatasetField = 'PROM01'
                TableField = 'PROM01'
              end
              item
                DatasetField = 'PROM02'
                TableField = 'PROM02'
              end
              item
                DatasetField = 'PROM03'
                TableField = 'PROM03'
              end
              item
                DatasetField = 'PROM04'
                TableField = 'PROM04'
              end
              item
                DatasetField = 'PROM05'
                TableField = 'PROM05'
              end
              item
                DatasetField = 'PROM06'
                TableField = 'PROM06'
              end
              item
                DatasetField = 'PROM07'
                TableField = 'PROM07'
              end
              item
                DatasetField = 'PROM08'
                TableField = 'PROM08'
              end
              item
                DatasetField = 'PROM09'
                TableField = 'PROM09'
              end
              item
                DatasetField = 'PROM10'
                TableField = 'PROM10'
              end
              item
                DatasetField = 'PROM11'
                TableField = 'PROM11'
              end
              item
                DatasetField = 'PROM12'
                TableField = 'PROM12'
              end
              item
                DatasetField = 'PROM13'
                TableField = 'PROM13'
              end
              item
                DatasetField = 'PROM14'
                TableField = 'PROM14'
              end
              item
                DatasetField = 'PROM15'
                TableField = 'PROM15'
              end
              item
                DatasetField = 'PROM16'
                TableField = 'PROM16'
              end
              item
                DatasetField = 'ORDEN'
                TableField = 'ORDEN'
              end
              item
                DatasetField = 'NOTA01'
                TableField = 'NOTA01'
              end
              item
                DatasetField = 'NOTA02'
                TableField = 'NOTA02'
              end
              item
                DatasetField = 'NOTA03'
                TableField = 'NOTA03'
              end
              item
                DatasetField = 'NOTA04'
                TableField = 'NOTA04'
              end
              item
                DatasetField = 'NOTA05'
                TableField = 'NOTA05'
              end
              item
                DatasetField = 'NOTA06'
                TableField = 'NOTA06'
              end
              item
                DatasetField = 'NOTA07'
                TableField = 'NOTA07'
              end
              item
                DatasetField = 'NOTA08'
                TableField = 'NOTA08'
              end
              item
                DatasetField = 'NOTA09'
                TableField = 'NOTA09'
              end
              item
                DatasetField = 'NOTA10'
                TableField = 'NOTA10'
              end
              item
                DatasetField = 'NOTA11'
                TableField = 'NOTA11'
              end
              item
                DatasetField = 'NOTA12'
                TableField = 'NOTA12'
              end
              item
                DatasetField = 'NOTA13'
                TableField = 'NOTA13'
              end
              item
                DatasetField = 'NOTA14'
                TableField = 'NOTA14'
              end
              item
                DatasetField = 'NOTA15'
                TableField = 'NOTA15'
              end
              item
                DatasetField = 'NOTA16'
                TableField = 'NOTA16'
              end>
          end>
        Name = 'spBoletaIngles'
        Fields = <
          item
            Name = 'MATERIA'
            DataType = datString
            Size = 50
          end
          item
            Name = 'MATERIACODIGO'
            DataType = datString
            Size = 10
          end
          item
            Name = 'NOMBRE'
            DataType = datString
            Size = 70
          end
          item
            Name = 'NUMCONTROL'
            DataType = datString
            Size = 12
          end
          item
            Name = 'PROMEDIO'
            DataType = datInteger
          end
          item
            Name = 'GRUPOCODIGO'
            DataType = datString
            Size = 10
          end
          item
            Name = 'GRUPO'
            DataType = datString
            Size = 50
          end
          item
            Name = 'CICLO'
            DataType = datString
            Size = 50
          end
          item
            Name = 'IDCALIFICACION'
            DataType = datInteger
          end
          item
            Name = 'IDMATERIA'
            DataType = datInteger
          end
          item
            Name = 'IDHISTORIALALUMNO'
            DataType = datInteger
          end
          item
            Name = 'IDHISTORIALGRUPO'
            DataType = datInteger
          end
          item
            Name = 'IDTIPOCALIFICACION'
            DataType = datInteger
          end
          item
            Name = 'CALIFICACION'
            DataType = datFloat
          end
          item
            Name = 'CALIFAUX1'
            DataType = datFloat
          end
          item
            Name = 'CALIFAUX2'
            DataType = datFloat
          end
          item
            Name = 'STATUS'
            DataType = datString
            Size = 1
          end
          item
            Name = 'FALTAS'
            DataType = datInteger
          end
          item
            Name = 'FECHA'
            DataType = datDateTime
          end
          item
            Name = 'CALIF01'
            DataType = datFloat
          end
          item
            Name = 'CALIF02'
            DataType = datFloat
          end
          item
            Name = 'CALIF03'
            DataType = datFloat
          end
          item
            Name = 'CALIF04'
            DataType = datFloat
          end
          item
            Name = 'CALIF05'
            DataType = datFloat
          end
          item
            Name = 'CALIF06'
            DataType = datFloat
          end
          item
            Name = 'CALIF07'
            DataType = datFloat
          end
          item
            Name = 'CALIF08'
            DataType = datFloat
          end
          item
            Name = 'CALIF09'
            DataType = datFloat
          end
          item
            Name = 'CALIF10'
            DataType = datFloat
          end
          item
            Name = 'CALIF11'
            DataType = datFloat
          end
          item
            Name = 'CALIF12'
            DataType = datFloat
          end
          item
            Name = 'CALIF13'
            DataType = datFloat
          end
          item
            Name = 'CALIF14'
            DataType = datFloat
          end
          item
            Name = 'CALIF15'
            DataType = datFloat
          end
          item
            Name = 'CALIF16'
            DataType = datFloat
          end
          item
            Name = 'CALIFA01'
            DataType = datFloat
          end
          item
            Name = 'CALIFA02'
            DataType = datFloat
          end
          item
            Name = 'CALIFA03'
            DataType = datFloat
          end
          item
            Name = 'CALIFA04'
            DataType = datFloat
          end
          item
            Name = 'CALIFA05'
            DataType = datFloat
          end
          item
            Name = 'CALIFA06'
            DataType = datFloat
          end
          item
            Name = 'CALIFA07'
            DataType = datFloat
          end
          item
            Name = 'CALIFA08'
            DataType = datFloat
          end
          item
            Name = 'CALIFA09'
            DataType = datFloat
          end
          item
            Name = 'CALIFA10'
            DataType = datFloat
          end
          item
            Name = 'CALIFA11'
            DataType = datFloat
          end
          item
            Name = 'CALIFA12'
            DataType = datFloat
          end
          item
            Name = 'CALIFA13'
            DataType = datFloat
          end
          item
            Name = 'CALIFA14'
            DataType = datFloat
          end
          item
            Name = 'CALIFA15'
            DataType = datFloat
          end
          item
            Name = 'CALIFA16'
            DataType = datFloat
          end
          item
            Name = 'CALIFB01'
            DataType = datFloat
          end
          item
            Name = 'CALIFB02'
            DataType = datFloat
          end
          item
            Name = 'CALIFB03'
            DataType = datFloat
          end
          item
            Name = 'CALIFB04'
            DataType = datFloat
          end
          item
            Name = 'CALIFB05'
            DataType = datFloat
          end
          item
            Name = 'CALIFB06'
            DataType = datFloat
          end
          item
            Name = 'CALIFB07'
            DataType = datFloat
          end
          item
            Name = 'CALIFB08'
            DataType = datFloat
          end
          item
            Name = 'CALIFB09'
            DataType = datFloat
          end
          item
            Name = 'CALIFB10'
            DataType = datFloat
          end
          item
            Name = 'CALIFB11'
            DataType = datFloat
          end
          item
            Name = 'CALIFB12'
            DataType = datFloat
          end
          item
            Name = 'CALIFB13'
            DataType = datFloat
          end
          item
            Name = 'CALIFB14'
            DataType = datFloat
          end
          item
            Name = 'CALIFB15'
            DataType = datFloat
          end
          item
            Name = 'CALIFB16'
            DataType = datFloat
          end
          item
            Name = 'FALTAS01'
            DataType = datFloat
          end
          item
            Name = 'FALTAS02'
            DataType = datFloat
          end
          item
            Name = 'FALTAS03'
            DataType = datFloat
          end
          item
            Name = 'FALTAS04'
            DataType = datFloat
          end
          item
            Name = 'FALTAS05'
            DataType = datFloat
          end
          item
            Name = 'FALTAS06'
            DataType = datFloat
          end
          item
            Name = 'FALTAS07'
            DataType = datFloat
          end
          item
            Name = 'FALTAS08'
            DataType = datFloat
          end
          item
            Name = 'FALTAS09'
            DataType = datFloat
          end
          item
            Name = 'FALTAS10'
            DataType = datFloat
          end
          item
            Name = 'FALTAS11'
            DataType = datFloat
          end
          item
            Name = 'FALTAS12'
            DataType = datFloat
          end
          item
            Name = 'FALTAS13'
            DataType = datFloat
          end
          item
            Name = 'FALTAS14'
            DataType = datFloat
          end
          item
            Name = 'FALTAS15'
            DataType = datFloat
          end
          item
            Name = 'FALTAS16'
            DataType = datFloat
          end
          item
            Name = 'REGU01'
            DataType = datFloat
          end
          item
            Name = 'REGU02'
            DataType = datFloat
          end
          item
            Name = 'REGU03'
            DataType = datFloat
          end
          item
            Name = 'REGU04'
            DataType = datFloat
          end
          item
            Name = 'REGU05'
            DataType = datFloat
          end
          item
            Name = 'PROM01'
            DataType = datFloat
          end
          item
            Name = 'PROM02'
            DataType = datFloat
          end
          item
            Name = 'PROM03'
            DataType = datFloat
          end
          item
            Name = 'PROM04'
            DataType = datFloat
          end
          item
            Name = 'PROM05'
            DataType = datFloat
          end
          item
            Name = 'PROM06'
            DataType = datFloat
          end
          item
            Name = 'PROM07'
            DataType = datFloat
          end
          item
            Name = 'PROM08'
            DataType = datFloat
          end
          item
            Name = 'PROM09'
            DataType = datFloat
          end
          item
            Name = 'PROM10'
            DataType = datFloat
          end
          item
            Name = 'PROM11'
            DataType = datFloat
          end
          item
            Name = 'PROM12'
            DataType = datFloat
          end
          item
            Name = 'PROM13'
            DataType = datFloat
          end
          item
            Name = 'PROM14'
            DataType = datFloat
          end
          item
            Name = 'PROM15'
            DataType = datFloat
          end
          item
            Name = 'PROM16'
            DataType = datFloat
          end
          item
            Name = 'ORDEN'
            DataType = datInteger
          end
          item
            Name = 'NOTA01'
            DataType = datString
            Size = 250
          end
          item
            Name = 'NOTA02'
            DataType = datString
            Size = 250
          end
          item
            Name = 'NOTA03'
            DataType = datString
            Size = 250
          end
          item
            Name = 'NOTA04'
            DataType = datString
            Size = 250
          end
          item
            Name = 'NOTA05'
            DataType = datString
            Size = 250
          end
          item
            Name = 'NOTA06'
            DataType = datString
            Size = 250
          end
          item
            Name = 'NOTA07'
            DataType = datString
            Size = 250
          end
          item
            Name = 'NOTA08'
            DataType = datString
            Size = 250
          end
          item
            Name = 'NOTA09'
            DataType = datString
            Size = 250
          end
          item
            Name = 'NOTA10'
            DataType = datString
            Size = 250
          end
          item
            Name = 'NOTA11'
            DataType = datString
            Size = 250
          end
          item
            Name = 'NOTA12'
            DataType = datString
            Size = 250
          end
          item
            Name = 'NOTA13'
            DataType = datString
            Size = 250
          end
          item
            Name = 'NOTA14'
            DataType = datString
            Size = 250
          end
          item
            Name = 'NOTA15'
            DataType = datString
            Size = 250
          end
          item
            Name = 'NOTA16'
            DataType = datString
            Size = 250
          end>
      end
      item
        Params = <
          item
            Name = 'Cual'
            Value = '34'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
            SQL = 
              'CREATE TABLE #TEMP1'#10'('#10'  MATERIA VARCHAR(50),'#10'  MATERIACODIGO VAR' +
              'CHAR(10),'#10'  NOMBRE VARCHAR(70),'#10'  NUMCONTROL VARCHAR(12),'#10'  PROM' +
              'EDIO INT,'#10'  GRUPOCODIGO VARCHAR(10),'#10'  GRUPO VARCHAR(50),'#10'  CICL' +
              'O VARCHAR(50),'#10'  IDCALIFICACION INT,'#10'  IDMATERIA INT,'#10'  IDHISTOR' +
              'IALALUMNO INT,'#10'  IDHISTORIALGRUPO INT,'#10'  IDTIPOCALIFICACION INT,' +
              #10'  CALIFICACION FLOAT,'#10'  CALIFAUX1 FLOAT,'#10'  CALIFAUX2 FLOAT,'#10'  S' +
              'TATUS VARCHAR(1),'#10'  FALTAS INT,'#10'  FECHA DATETIME,'#10'  CALIF01 FLOA' +
              'T,'#10'  CALIF02 FLOAT,'#10'  CALIF03 FLOAT,'#10'  CALIF04 FLOAT,'#10'  CALIF05 ' +
              'FLOAT,'#10'  CALIF06 FLOAT,'#10'  CALIF07 FLOAT,'#10'  CALIF08 FLOAT,'#10'  CALI' +
              'F09 FLOAT,'#10'  CALIF10 FLOAT,'#10'  CALIF11 FLOAT,'#10'  CALIF12 FLOAT,'#10'  ' +
              'CALIF13 FLOAT,'#10'  CALIF14 FLOAT,'#10'  CALIF15 FLOAT,'#10'  CALIF16 FLOAT' +
              ','#10'  CALIFA01 FLOAT,'#10'  CALIFA02 FLOAT,'#10'  CALIFA03 FLOAT,'#10'  CALIFA' +
              '04 FLOAT,'#10'  CALIFA05 FLOAT,'#10'  CALIFA06 FLOAT,'#10'  CALIFA07 FLOAT,'#10 +
              '  CALIFA08 FLOAT,'#10'  CALIFA09 FLOAT,'#10'  CALIFA10 FLOAT,'#10'  CALIFA11' +
              ' FLOAT,'#10'  CALIFA12 FLOAT,'#10'  CALIFA13 FLOAT,'#10'  CALIFA14 FLOAT,'#10'  ' +
              'CALIFA15 FLOAT,'#10'  CALIFA16 FLOAT,'#10'  CALIFB01 FLOAT,'#10'  CALIFB02 F' +
              'LOAT,'#10'  CALIFB03 FLOAT,'#10'  CALIFB04 FLOAT,'#10'  CALIFB05 FLOAT,'#10'  CA' +
              'LIFB06 FLOAT,'#10'  CALIFB07 FLOAT,'#10'  CALIFB08 FLOAT,'#10'  CALIFB09 FLO' +
              'AT,'#10'  CALIFB10 FLOAT,'#10'  CALIFB11 FLOAT,'#10'  CALIFB12 FLOAT,'#10'  CALI' +
              'FB13 FLOAT,'#10'  CALIFB14 FLOAT,'#10'  CALIFB15 FLOAT,'#10'  CALIFB16 FLOAT' +
              ','#10'  FALTAS01 FLOAT,'#10'  FALTAS02 FLOAT,'#10'  FALTAS03 FLOAT,'#10'  FALTAS' +
              '04 FLOAT,'#10'  FALTAS05 FLOAT,'#10'  FALTAS06 FLOAT,'#10'  FALTAS07 FLOAT,'#10 +
              '  FALTAS08 FLOAT,'#10'  FALTAS09 FLOAT,'#10'  FALTAS10 FLOAT,'#10'  FALTAS11' +
              ' FLOAT,'#10'  FALTAS12 FLOAT,'#10'  FALTAS13 FLOAT,'#10'  FALTAS14 FLOAT,'#10'  ' +
              'FALTAS15 FLOAT,'#10'  FALTAS16 FLOAT,'#10'  REGU01 FLOAT,'#10'  REGU02 FLOAT' +
              ','#10'  REGU03 FLOAT,'#10'  REGU04 FLOAT,'#10'  REGU05 FLOAT,'#10'  PROM01 FLOAT' +
              ','#10'  PROM02 FLOAT,'#10'  PROM03 FLOAT,'#10'  PROM04 FLOAT,'#10'  PROM05 FLOAT' +
              ','#10'  PROM06 FLOAT,'#10'  PROM07 FLOAT,'#10'  PROM08 FLOAT,'#10'  PROM09 FLOAT' +
              ','#10'  PROM10 FLOAT,'#10'  PROM11 FLOAT,'#10'  PROM12 FLOAT,'#10'  PROM13 FLOAT' +
              ','#10'  PROM14 FLOAT,'#10'  PROM15 FLOAT,'#10'  PROM16 FLOAT,'#10'  ORDEN INTEGE' +
              'R,'#10'  NOTA01 VARCHAR(250),'#10'  NOTA02 VARCHAR(250),'#10'  NOTA03 VARCHA' +
              'R(250),'#10'  NOTA04 VARCHAR(250),'#10'  NOTA05 VARCHAR(250),'#10'  NOTA06 V' +
              'ARCHAR(250),'#10'  NOTA07 VARCHAR(250),'#10'  NOTA08 VARCHAR(250),'#10'  NOT' +
              'A09 VARCHAR(250),'#10'  NOTA10 VARCHAR(250),'#10'  NOTA11 VARCHAR(250),'#10 +
              '  NOTA12 VARCHAR(250),'#10'  NOTA13 VARCHAR(250),'#10'  NOTA14 VARCHAR(2' +
              '50),'#10'  NOTA15 VARCHAR(250),'#10'  NOTA16 VARCHAR(250),'#10'  ORDENINTERN' +
              'O INT,'#10'  ORDENOFICIAL INT'#10')'#10#10' DECLARE @MATERIA VARCHAR(50)'#10' DECL' +
              'ARE @MATERIACODIGO VARCHAR(10)'#10' DECLARE @ORDEN INT'#10' DECLARE @NOM' +
              'BRE VARCHAR(70)'#10' DECLARE @NUMCONTROL VARCHAR(12)'#10' DECLARE @PROME' +
              'DIO INT'#10' DECLARE @GRUPOCODIGO VARCHAR(10)'#10' DECLARE @GRUPO VARCHA' +
              'R(50)'#10' DECLARE @CICLO VARCHAR(50)'#10' DECLARE @IDCALIFICACION INT'#10' ' +
              'DECLARE @IDMATERIA INT'#10' DECLARE @IDHISTORIALALUMNO INT'#10' DECLARE ' +
              '@IDHISTORIALGRUPO INT'#10' DECLARE @IDTIPOCALIFICACION INT'#10' DECLARE ' +
              '@CALIFICACION FLOAT'#10' DECLARE @CALIFAUX1 FLOAT'#10' DECLARE @CALIFAUX' +
              '2 FLOAT'#10' DECLARE @STATUS VARCHAR(1)'#10' DECLARE @FALTAS INT'#10' DECLAR' +
              'E @FECHA DATETIME'#10' DECLARE @CALIF01 FLOAT'#10' DECLARE @CALIF02 FLOA' +
              'T'#10' DECLARE @CALIF03 FLOAT'#10' DECLARE @CALIF04 FLOAT'#10' DECLARE @CALI' +
              'F05 FLOAT'#10' DECLARE @CALIF06 FLOAT'#10' DECLARE @CALIF07 FLOAT'#10' DECLA' +
              'RE @CALIF08 FLOAT'#10' DECLARE @CALIF09 FLOAT'#10' DECLARE @CALIF10 FLOA' +
              'T'#10' DECLARE @CALIF11 FLOAT'#10' DECLARE @CALIF12 FLOAT'#10' DECLARE @CALI' +
              'F13 FLOAT'#10' DECLARE @CALIF14 FLOAT'#10' DECLARE @CALIF15 FLOAT'#10' DECLA' +
              'RE @CALIF16 FLOAT'#10' DECLARE @CALIFA01 FLOAT'#10' DECLARE @CALIFA02 FL' +
              'OAT'#10' DECLARE @CALIFA03 FLOAT'#10' DECLARE @CALIFA04 FLOAT'#10' DECLARE @' +
              'CALIFA05 FLOAT'#10' DECLARE @CALIFA06 FLOAT'#10' DECLARE @CALIFA07 FLOAT' +
              #10' DECLARE @CALIFA08 FLOAT'#10' DECLARE @CALIFA09 FLOAT'#10' DECLARE @CAL' +
              'IFA10 FLOAT'#10' DECLARE @CALIFA11 FLOAT'#10' DECLARE @CALIFA12 FLOAT'#10' D' +
              'ECLARE @CALIFA13 FLOAT'#10' DECLARE @CALIFA14 FLOAT'#10' DECLARE @CALIFA' +
              '15 FLOAT'#10' DECLARE @CALIFA16 FLOAT'#10' DECLARE @CALIFB01 FLOAT'#10' DECL' +
              'ARE @CALIFB02 FLOAT'#10' DECLARE @CALIFB03 FLOAT'#10' DECLARE @CALIFB04 ' +
              'FLOAT'#10' DECLARE @CALIFB05 FLOAT'#10' DECLARE @CALIFB06 FLOAT'#10' DECLARE' +
              ' @CALIFB07 FLOAT'#10' DECLARE @CALIFB08 FLOAT'#10' DECLARE @CALIFB09 FLO' +
              'AT'#10' DECLARE @CALIFB10 FLOAT'#10' DECLARE @CALIFB11 FLOAT'#10' DECLARE @C' +
              'ALIFB12 FLOAT'#10' DECLARE @CALIFB13 FLOAT'#10' DECLARE @CALIFB14 FLOAT'#10 +
              ' DECLARE @CALIFB15 FLOAT'#10' DECLARE @CALIFB16 FLOAT'#10' DECLARE @FALT' +
              'AS01 FLOAT'#10' DECLARE @FALTAS02 FLOAT'#10' DECLARE @FALTAS03 FLOAT'#10' DE' +
              'CLARE @FALTAS04 FLOAT'#10' DECLARE @FALTAS05 FLOAT'#10' DECLARE @FALTAS0' +
              '6 FLOAT'#10' DECLARE @FALTAS07 FLOAT'#10' DECLARE @FALTAS08 FLOAT'#10' DECLA' +
              'RE @FALTAS09 FLOAT'#10' DECLARE @FALTAS10 FLOAT'#10' DECLARE @FALTAS11 F' +
              'LOAT'#10' DECLARE @FALTAS12 FLOAT'#10' DECLARE @FALTAS13 FLOAT'#10' DECLARE ' +
              '@FALTAS14 FLOAT'#10' DECLARE @FALTAS15 FLOAT'#10' DECLARE @FALTAS16 FLOA' +
              'T'#10' DECLARE @REGU01 FLOAT'#10' DECLARE @REGU02 FLOAT'#10' DECLARE @REGU03' +
              ' FLOAT'#10' DECLARE @REGU04 FLOAT'#10' DECLARE @REGU05 FLOAT'#10' DECLARE @P' +
              'ROM01 FLOAT'#10' DECLARE @PROM02 FLOAT'#10' DECLARE @PROM03 FLOAT'#10' DECLA' +
              'RE @PROM04 FLOAT'#10' DECLARE @PROM05 FLOAT'#10' DECLARE @PROM06 FLOAT'#10' ' +
              'DECLARE @PROM07 FLOAT'#10' DECLARE @PROM08 FLOAT'#10' DECLARE @PROM09 FL' +
              'OAT'#10' DECLARE @PROM10 FLOAT'#10' DECLARE @PROM11 FLOAT'#10' DECLARE @PROM' +
              '12 FLOAT'#10' DECLARE @PROM13 FLOAT'#10' DECLARE @PROM14 FLOAT'#10' DECLARE ' +
              '@PROM15 FLOAT'#10' DECLARE @PROM16 FLOAT'#10' DECLARE @NOTA01 VARCHAR(25' +
              '0)'#10' DECLARE @NOTA02 VARCHAR(250)'#10' DECLARE @NOTA03 VARCHAR(250)'#10' ' +
              'DECLARE @NOTA04 VARCHAR(250)'#10' DECLARE @NOTA05 VARCHAR(250)'#10' DECL' +
              'ARE @NOTA06 VARCHAR(250)'#10' DECLARE @NOTA07 VARCHAR(250)'#10' DECLARE ' +
              '@NOTA08 VARCHAR(250)'#10' DECLARE @NOTA09 VARCHAR(250)'#10' DECLARE @NOT' +
              'A10 VARCHAR(250)'#10' DECLARE @NOTA11 VARCHAR(250)'#10' DECLARE @NOTA12 ' +
              'VARCHAR(250)'#10' DECLARE @NOTA13 VARCHAR(250)'#10' DECLARE @NOTA14 VARC' +
              'HAR(250)'#10' DECLARE @NOTA15 VARCHAR(250)'#10' DECLARE @NOTA16 VARCHAR(' +
              '250)'#10' DECLARE @ORDENINTERNO INT'#10' DECLARE @ORDENOFICIAL INT'#10#10#10'dec' +
              'lare CursorBoletaInterna SCROLL CURSOR FOR'#10'SELECT'#10'      MATERIA.' +
              'NOMBRE AS MATERIA,'#10'      MATERIA.CODIGO AS MATERIACODIGO,'#10'      ' +
              'MATERIA.ORDENINTERNO,'#10'      ALUMNO.NOMBRE,'#10'      ALUMNO.NUMCONTR' +
              'OL,'#10'      MATERIA.PROMEDIO,'#10'      GRUPO.CODIGO AS GRUPOCODIGO,'#10' ' +
              '     GRUPO.NOMBRE AS GRUPO,'#10'      CICLO.CODIGO AS CICLO,'#10'      C' +
              'ALIFICACION.IDCALIFICACION,'#10'      CALIFICACION.IDMATERIA,'#10'      ' +
              'CALIFICACION.IDHISTORIALALUMNO,'#10'      CALIFICACION.IDHISTORIALGR' +
              'UPO,'#10'      CALIFICACION.IDTIPOCALIFICACION,'#10'      CALIFICACION.C' +
              'ALIFICACION,'#10'      CALIFICACION.CALIFAUX1,'#10'      CALIFICACION.CA' +
              'LIFAUX2,'#10'      CALIFICACION.STATUS,'#10'      CALIFICACION.FALTAS,'#10' ' +
              '     CALIFICACION.FECHA,'#10'      CALIFICACION.CALIF01,'#10'      CALIF' +
              'ICACION.CALIF02,'#10'      CALIFICACION.CALIF03,'#10'      CALIFICACION.' +
              'CALIF04,'#10'      CALIFICACION.CALIF05,'#10'      CALIFICACION.CALIF06,' +
              #10'      CALIFICACION.CALIF07,'#10'      CALIFICACION.CALIF08,'#10'      C' +
              'ALIFICACION.CALIF09,'#10'      CALIFICACION.CALIF10,'#10'      CALIFICAC' +
              'ION.CALIF11,'#10'      CALIFICACION.CALIF12,'#10'      CALIFICACION.CALI' +
              'F13,'#10'      CALIFICACION.CALIF14,'#10'      CALIFICACION.CALIF15,'#10'   ' +
              '   CALIFICACION.CALIF16,'#10'      CALIFICACION.CALIFA01,'#10'      CALI' +
              'FICACION.CALIFA02,'#10'      CALIFICACION.CALIFA03,'#10'      CALIFICACI' +
              'ON.CALIFA04,'#10'      CALIFICACION.CALIFA05,'#10'      CALIFICACION.CAL' +
              'IFA06,'#10'      CALIFICACION.CALIFA07,'#10'      CALIFICACION.CALIFA08,' +
              #10'      CALIFICACION.CALIFA09,'#10'      CALIFICACION.CALIFA10,'#10'     ' +
              ' CALIFICACION.CALIFA11,'#10'      CALIFICACION.CALIFA12,'#10'      CALIF' +
              'ICACION.CALIFA13,'#10'      CALIFICACION.CALIFA14,'#10'      CALIFICACIO' +
              'N.CALIFA15,'#10'      CALIFICACION.CALIFA16,'#10'      CALIFICACION.CALI' +
              'FB01,'#10'      CALIFICACION.CALIFB02,'#10'      CALIFICACION.CALIFB03,'#10 +
              '      CALIFICACION.CALIFB04,'#10'      CALIFICACION.CALIFB05,'#10'      ' +
              'CALIFICACION.CALIFB06,'#10'      CALIFICACION.CALIFB07,'#10'      CALIFI' +
              'CACION.CALIFB08,'#10'      CALIFICACION.CALIFB09,'#10'      CALIFICACION' +
              '.CALIFB10,'#10'      CALIFICACION.CALIFB11,'#10'      CALIFICACION.CALIF' +
              'B12,'#10'      CALIFICACION.CALIFB13,'#10'      CALIFICACION.CALIFB14,'#10' ' +
              '     CALIFICACION.CALIFB15,'#10'      CALIFICACION.CALIFB16,'#10'      C' +
              'ALIFICACION.FALTAS01,'#10'      CALIFICACION.FALTAS02,'#10'      CALIFIC' +
              'ACION.FALTAS03,'#10'      CALIFICACION.FALTAS04,'#10'      CALIFICACION.' +
              'FALTAS05,'#10'      CALIFICACION.FALTAS06,'#10'      CALIFICACION.FALTAS' +
              '07,'#10'      CALIFICACION.FALTAS08,'#10'      CALIFICACION.FALTAS09,'#10'  ' +
              '    CALIFICACION.FALTAS10,'#10'      CALIFICACION.FALTAS11,'#10'      CA' +
              'LIFICACION.FALTAS12,'#10'      CALIFICACION.FALTAS13,'#10'      CALIFICA' +
              'CION.FALTAS14,'#10'      CALIFICACION.FALTAS15,'#10'      CALIFICACION.F' +
              'ALTAS16,'#10'      CALIFICACION.REGU01,'#10'      CALIFICACION.REGU02,'#10' ' +
              '     CALIFICACION.REGU03,'#10'      CALIFICACION.REGU04,'#10'      CALIF' +
              'ICACION.REGU05,'#10'      CALIFICACION.NOTA01,'#10'      CALIFICACION.NO' +
              'TA02,'#10'      CALIFICACION.NOTA03,'#10'      CALIFICACION.NOTA04,'#10'    ' +
              '  CALIFICACION.NOTA05,'#10'      CALIFICACION.NOTA06,'#10'      CALIFICA' +
              'CION.NOTA07,'#10'      CALIFICACION.NOTA08,'#10'      CALIFICACION.NOTA0' +
              '9,'#10'      CALIFICACION.NOTA10,'#10'      CALIFICACION.NOTA11,'#10'      C' +
              'ALIFICACION.NOTA12,'#10'      CALIFICACION.NOTA13,'#10'      CALIFICACIO' +
              'N.NOTA14,'#10'      CALIFICACION.NOTA15,'#10'      CALIFICACION.NOTA16,'#10 +
              '      MATERIA.ORDENINTERNO,'#10'      MATERIA.ORDENOFICIAL'#10'    FROM'#10 +
              '      CALIFICACION'#10'      INNER JOIN MATERIA ON (CALIFICACION.IDM' +
              'ATERIA = MATERIA.IDMATERIA)'#10'      INNER JOIN HISTORIALALUMNO ON ' +
              '(CALIFICACION.IDHISTORIALALUMNO = HISTORIALALUMNO.IDHISTORIALALU' +
              'MNO)'#10'      INNER JOIN ALUMNO ON (HISTORIALALUMNO.IDALUMNO = ALUM' +
              'NO.IDALUMNO)'#10'      INNER JOIN HISTORIALGRUPO ON (HISTORIALALUMNO' +
              '.IDHISTORIALGRUPO = HISTORIALGRUPO.IDHISTORIALGRUPO)'#10'      INNER' +
              ' JOIN GRUPO ON (HISTORIALGRUPO.IDGRUPO = GRUPO.IDGRUPO)'#10'      IN' +
              'NER JOIN CICLO ON (HISTORIALGRUPO.IDCICLO = CICLO.IDCICLO)'#10'    W' +
              'HERE'#10'      (HISTORIALALUMNO.IDHISTORIALALUMNO = :Cual)AND (ISNUL' +
              'L(MATERIA.INGLES,0) < 1)'#10'    ORDER BY'#10'      MATERIA.ORDENINTERNO' +
              ' ASC'#10#10'open CursorBoletaInterna'#10'fetch next from CursorBoletaInter' +
              'na'#10'into @MATERIA, @MATERIACODIGO,@ORDEN, @NOMBRE, @NUMCONTROL, @' +
              'PROMEDIO, @GRUPOCODIGO, @GRUPO, @CICLO,'#10'     @IDCALIFICACION, @I' +
              'DMATERIA, @IDHISTORIALALUMNO, @IDHISTORIALGRUPO, @IDTIPOCALIFICA' +
              'CION, @CALIFICACION,'#10'     @CALIFAUX1, @CALIFAUX2, @STATUS, @FALT' +
              'AS, @FECHA, @CALIF01, @CALIF02, @CALIF03, @CALIF04, @CALIF05,'#10'  ' +
              '   @CALIF06, @CALIF07, @CALIF08, @CALIF09, @CALIF10, @CALIF11, @' +
              'CALIF12, @CALIF13, @CALIF14, @CALIF15,'#10'     @CALIF16, @CALIFA01,' +
              ' @CALIFA02, @CALIFA03, @CALIFA04, @CALIFA05, @CALIFA06, @CALIFA0' +
              '7, @CALIFA08, @CALIFA09,'#10'     @CALIFA10, @CALIFA11, @CALIFA12, @' +
              'CALIFA13, @CALIFA14, @CALIFA15, @CALIFA16, @CALIFB01, @CALIFB02,' +
              ' @CALIFB03,'#10'     @CALIFB04, @CALIFB05, @CALIFB06, @CALIFB07, @CA' +
              'LIFB08, @CALIFB09, @CALIFB10, @CALIFB11, @CALIFB12, @CALIFB13,'#10' ' +
              '    @CALIFB14, @CALIFB15, @CALIFB16, @FALTAS01, @FALTAS02, @FALT' +
              'AS03, @FALTAS04, @FALTAS05, @FALTAS06, @FALTAS07,'#10'     @FALTAS08' +
              ', @FALTAS09, @FALTAS10, @FALTAS11, @FALTAS12, @FALTAS13, @FALTAS' +
              '14, @FALTAS15, @FALTAS16, @REGU01,'#10'     @REGU02, @REGU03, @REGU0' +
              '4, @REGU05, @NOTA01, @NOTA02, @NOTA03,@NOTA04,@NOTA05,@NOTA06,@N' +
              'OTA07,@NOTA08,@NOTA09,'#10'     @NOTA10,@NOTA11,@NOTA12,@NOTA13,@NOT' +
              'A14,@NOTA15,@NOTA16, @ORDENINTERNO, @ORDENOFICIAL'#10'while @@fetch_' +
              'status = 0'#10'begin'#10'   declare CursorCalif SCROLL CURSOR FOR'#10'   SEL' +
              'ECT AVG(CALIF01), AVG(CALIF02), AVG(CALIF03), AVG(CALIF04), AVG(' +
              'CALIF05),'#10'          AVG(CALIF06), AVG(CALIF07), AVG(CALIF08), AV' +
              'G(CALIF09), AVG(CALIF10),'#10'          AVG(CALIF11), AVG(CALIF12), ' +
              'AVG(CALIF13), AVG(CALIF14), AVG(CALIF15),'#10'          AVG(CALIF16)' +
              ' FROM CALIFICACION'#10'   WHERE IDMATERIA = @IDMATERIA AND IDHISTORI' +
              'ALGRUPO = @IDHISTORIALGRUPO'#10#10'   open CursorCalif'#10#10'   fetch next ' +
              'from CursorCalif'#10'   into @PROM01, @PROM02, @PROM03, @PROM04, @PR' +
              'OM05, @PROM06, @PROM07, @PROM08, @PROM09, @PROM10,'#10'        @PROM' +
              '11, @PROM12, @PROM13, @PROM14, @PROM15, @PROM16'#10#10'   DEALLOCATE C' +
              'ursorCalif'#10'   INSERT INTO #TEMP1(MATERIA, MATERIACODIGO, NOMBRE,' +
              ' NUMCONTROL, PROMEDIO, GRUPOCODIGO, GRUPO, CICLO,'#10'              ' +
              '        IDCALIFICACION, IDMATERIA, IDHISTORIALALUMNO, IDHISTORIA' +
              'LGRUPO, IDTIPOCALIFICACION, CALIFICACION,'#10'                      ' +
              'CALIFAUX1, CALIFAUX2, STATUS, FALTAS, FECHA, CALIF01, CALIF02, C' +
              'ALIF03, CALIF04, CALIF05, CALIF06,'#10'                      CALIF07' +
              ', CALIF08, CALIF09, CALIF10, CALIF11, CALIF12, CALIF13, CALIF14,' +
              ' CALIF15, CALIF16, CALIFA01,'#10'                      CALIFA02, CAL' +
              'IFA03, CALIFA04, CALIFA05, CALIFA06, CALIFA07, CALIFA08, CALIFA0' +
              '9, CALIFA10, CALIFA11,'#10'                      CALIFA12, CALIFA13,' +
              ' CALIFA14, CALIFA15, CALIFA16, CALIFB01, CALIFB02, CALIFB03, CAL' +
              'IFB04, CALIFB05,'#10'                      CALIFB06, CALIFB07, CALIF' +
              'B08, CALIFB09, CALIFB10, CALIFB11, CALIFB12, CALIFB13, CALIFB14,' +
              ' CALIFB15,'#10'                      CALIFB16, FALTAS01, FALTAS02, F' +
              'ALTAS03, FALTAS04, FALTAS05, FALTAS06, FALTAS07, FALTAS08, FALTA' +
              'S09,'#10'                      FALTAS10, FALTAS11, FALTAS12, FALTAS1' +
              '3, FALTAS14, FALTAS15, FALTAS16, REGU01, REGU02, REGU03, REGU04,' +
              #10'                      REGU05, PROM01, PROM02, PROM03, PROM04, P' +
              'ROM05, PROM06, PROM07, PROM08, PROM09, PROM10, PROM11, PROM12,'#10' ' +
              '                     PROM13, PROM14, PROM15, PROM16, ORDEN, NOTA' +
              '01, NOTA02, NOTA03, NOTA04, NOTA05, NOTA06, NOTA07, NOTA08,'#10'    ' +
              '                  NOTA09, NOTA10, NOTA11, NOTA12, NOTA13, NOTA14' +
              ', NOTA15, NOTA16, ORDENINTERNO, ORDENOFICIAL)'#10'   VALUES(@MATERIA' +
              ', @MATERIACODIGO, @NOMBRE, @NUMCONTROL, @PROMEDIO, @GRUPOCODIGO,' +
              ' @GRUPO, @CICLO,'#10'                      @IDCALIFICACION, @IDMATER' +
              'IA, @IDHISTORIALALUMNO, @IDHISTORIALGRUPO, @IDTIPOCALIFICACION, ' +
              '@CALIFICACION,'#10'                      @CALIFAUX1, @CALIFAUX2, @ST' +
              'ATUS, @FALTAS, @FECHA, @CALIF01, @CALIF02, @CALIF03, @CALIF04, @' +
              'CALIF05, @CALIF06,'#10'                      @CALIF07, @CALIF08, @CA' +
              'LIF09, @CALIF10, @CALIF11, @CALIF12, @CALIF13, @CALIF14, @CALIF1' +
              '5, @CALIF16, @CALIFA01,'#10'                      @CALIFA02, @CALIFA' +
              '03, @CALIFA04, @CALIFA05, @CALIFA06, @CALIFA07, @CALIFA08, @CALI' +
              'FA09, @CALIFA10, @CALIFA11,'#10'                      @CALIFA12, @CA' +
              'LIFA13, @CALIFA14, @CALIFA15, @CALIFA16, @CALIFB01, @CALIFB02, @' +
              'CALIFB03, @CALIFB04, @CALIFB05,'#10'                      @CALIFB06,' +
              ' @CALIFB07, @CALIFB08, @CALIFB09, @CALIFB10, @CALIFB11, @CALIFB1' +
              '2, @CALIFB13, @CALIFB14, @CALIFB15,'#10'                      @CALIF' +
              'B16, @FALTAS01, @FALTAS02, @FALTAS03, @FALTAS04, @FALTAS05, @FAL' +
              'TAS06, @FALTAS07, @FALTAS08, @FALTAS09,'#10'                      @F' +
              'ALTAS10, @FALTAS11, @FALTAS12, @FALTAS13, @FALTAS14, @FALTAS15, ' +
              '@FALTAS16, @REGU01, @REGU02, @REGU03, @REGU04,'#10'                 ' +
              '     @REGU05, @PROM01, @PROM02, @PROM03, @PROM04, @PROM05, @PROM' +
              '06, @PROM07, @PROM08, @PROM09, @PROM10, @PROM11, @PROM12,'#10'      ' +
              '                @PROM13, @PROM14, @PROM15, @PROM16, @ORDEN, @NOT' +
              'A01, @NOTA02, @NOTA03, @NOTA04, @NOTA05, @NOTA06, @NOTA07, @NOTA' +
              '08,'#10'                      @NOTA09, @NOTA10, @NOTA11, @NOTA12, @N' +
              'OTA13, @NOTA14, @NOTA15, @NOTA16, @ORDENINTERNO, @ORDENOFICIAL)'#10 +
              'fetch next from CursorBoletaInterna'#10'into @MATERIA, @MATERIACODIG' +
              'O,@ORDEN, @NOMBRE, @NUMCONTROL, @PROMEDIO, @GRUPOCODIGO, @GRUPO,' +
              ' @CICLO,'#10'     @IDCALIFICACION, @IDMATERIA, @IDHISTORIALALUMNO, @' +
              'IDHISTORIALGRUPO, @IDTIPOCALIFICACION, @CALIFICACION,'#10'     @CALI' +
              'FAUX1, @CALIFAUX2, @STATUS, @FALTAS, @FECHA, @CALIF01, @CALIF02,' +
              ' @CALIF03, @CALIF04, @CALIF05,'#10'     @CALIF06, @CALIF07, @CALIF08' +
              ', @CALIF09, @CALIF10, @CALIF11, @CALIF12, @CALIF13, @CALIF14, @C' +
              'ALIF15,'#10'     @CALIF16, @CALIFA01, @CALIFA02, @CALIFA03, @CALIFA0' +
              '4, @CALIFA05, @CALIFA06, @CALIFA07, @CALIFA08, @CALIFA09,'#10'     @' +
              'CALIFA10, @CALIFA11, @CALIFA12, @CALIFA13, @CALIFA14, @CALIFA15,' +
              ' @CALIFA16, @CALIFB01, @CALIFB02, @CALIFB03,'#10'     @CALIFB04, @CA' +
              'LIFB05, @CALIFB06, @CALIFB07, @CALIFB08, @CALIFB09, @CALIFB10, @' +
              'CALIFB11, @CALIFB12, @CALIFB13,'#10'     @CALIFB14, @CALIFB15, @CALI' +
              'FB16, @FALTAS01, @FALTAS02, @FALTAS03, @FALTAS04, @FALTAS05, @FA' +
              'LTAS06, @FALTAS07,'#10'     @FALTAS08, @FALTAS09, @FALTAS10, @FALTAS' +
              '11, @FALTAS12, @FALTAS13, @FALTAS14, @FALTAS15, @FALTAS16, @REGU' +
              '01,'#10'     @REGU02, @REGU03, @REGU04, @REGU05, @NOTA01, @NOTA02, @' +
              'NOTA03, @NOTA04, @NOTA05, @NOTA06, @NOTA07, @NOTA08,'#10'     @NOTA0' +
              '9, @NOTA10, @NOTA11, @NOTA12, @NOTA13, @NOTA14, @NOTA15, @NOTA16' +
              ', @ORDENINTERNO, @ORDENOFICIAL'#10'end'#10#10'SELECT DISTINCT * FROM #TEMP' +
              '1'#10'ORDER BY ORDENINTERNO'#10'DEALLOCATE CursorBoletaInterna'#10'DROP TABL' +
              'E #TEMP1'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'MATERIA'
                TableField = 'MATERIA'
              end
              item
                DatasetField = 'MATERIACODIGO'
                TableField = 'MATERIACODIGO'
              end
              item
                DatasetField = 'NOMBRE'
                TableField = 'NOMBRE'
              end
              item
                DatasetField = 'NUMCONTROL'
                TableField = 'NUMCONTROL'
              end
              item
                DatasetField = 'PROMEDIO'
                TableField = 'PROMEDIO'
              end
              item
                DatasetField = 'GRUPOCODIGO'
                TableField = 'GRUPOCODIGO'
              end
              item
                DatasetField = 'GRUPO'
                TableField = 'GRUPO'
              end
              item
                DatasetField = 'CICLO'
                TableField = 'CICLO'
              end
              item
                DatasetField = 'IDCALIFICACION'
                TableField = 'IDCALIFICACION'
              end
              item
                DatasetField = 'IDMATERIA'
                TableField = 'IDMATERIA'
              end
              item
                DatasetField = 'IDHISTORIALALUMNO'
                TableField = 'IDHISTORIALALUMNO'
              end
              item
                DatasetField = 'IDHISTORIALGRUPO'
                TableField = 'IDHISTORIALGRUPO'
              end
              item
                DatasetField = 'IDTIPOCALIFICACION'
                TableField = 'IDTIPOCALIFICACION'
              end
              item
                DatasetField = 'CALIFICACION'
                TableField = 'CALIFICACION'
              end
              item
                DatasetField = 'CALIFAUX1'
                TableField = 'CALIFAUX1'
              end
              item
                DatasetField = 'CALIFAUX2'
                TableField = 'CALIFAUX2'
              end
              item
                DatasetField = 'STATUS'
                TableField = 'STATUS'
              end
              item
                DatasetField = 'FALTAS'
                TableField = 'FALTAS'
              end
              item
                DatasetField = 'FECHA'
                TableField = 'FECHA'
              end
              item
                DatasetField = 'CALIF01'
                TableField = 'CALIF01'
              end
              item
                DatasetField = 'CALIF02'
                TableField = 'CALIF02'
              end
              item
                DatasetField = 'CALIF03'
                TableField = 'CALIF03'
              end
              item
                DatasetField = 'CALIF04'
                TableField = 'CALIF04'
              end
              item
                DatasetField = 'CALIF05'
                TableField = 'CALIF05'
              end
              item
                DatasetField = 'CALIF06'
                TableField = 'CALIF06'
              end
              item
                DatasetField = 'CALIF07'
                TableField = 'CALIF07'
              end
              item
                DatasetField = 'CALIF08'
                TableField = 'CALIF08'
              end
              item
                DatasetField = 'CALIF09'
                TableField = 'CALIF09'
              end
              item
                DatasetField = 'CALIF10'
                TableField = 'CALIF10'
              end
              item
                DatasetField = 'CALIF11'
                TableField = 'CALIF11'
              end
              item
                DatasetField = 'CALIF12'
                TableField = 'CALIF12'
              end
              item
                DatasetField = 'CALIF13'
                TableField = 'CALIF13'
              end
              item
                DatasetField = 'CALIF14'
                TableField = 'CALIF14'
              end
              item
                DatasetField = 'CALIF15'
                TableField = 'CALIF15'
              end
              item
                DatasetField = 'CALIF16'
                TableField = 'CALIF16'
              end
              item
                DatasetField = 'CALIFA01'
                TableField = 'CALIFA01'
              end
              item
                DatasetField = 'CALIFA02'
                TableField = 'CALIFA02'
              end
              item
                DatasetField = 'CALIFA03'
                TableField = 'CALIFA03'
              end
              item
                DatasetField = 'CALIFA04'
                TableField = 'CALIFA04'
              end
              item
                DatasetField = 'CALIFA05'
                TableField = 'CALIFA05'
              end
              item
                DatasetField = 'CALIFA06'
                TableField = 'CALIFA06'
              end
              item
                DatasetField = 'CALIFA07'
                TableField = 'CALIFA07'
              end
              item
                DatasetField = 'CALIFA08'
                TableField = 'CALIFA08'
              end
              item
                DatasetField = 'CALIFA09'
                TableField = 'CALIFA09'
              end
              item
                DatasetField = 'CALIFA10'
                TableField = 'CALIFA10'
              end
              item
                DatasetField = 'CALIFA11'
                TableField = 'CALIFA11'
              end
              item
                DatasetField = 'CALIFA12'
                TableField = 'CALIFA12'
              end
              item
                DatasetField = 'CALIFA13'
                TableField = 'CALIFA13'
              end
              item
                DatasetField = 'CALIFA14'
                TableField = 'CALIFA14'
              end
              item
                DatasetField = 'CALIFA15'
                TableField = 'CALIFA15'
              end
              item
                DatasetField = 'CALIFA16'
                TableField = 'CALIFA16'
              end
              item
                DatasetField = 'CALIFB01'
                TableField = 'CALIFB01'
              end
              item
                DatasetField = 'CALIFB02'
                TableField = 'CALIFB02'
              end
              item
                DatasetField = 'CALIFB03'
                TableField = 'CALIFB03'
              end
              item
                DatasetField = 'CALIFB04'
                TableField = 'CALIFB04'
              end
              item
                DatasetField = 'CALIFB05'
                TableField = 'CALIFB05'
              end
              item
                DatasetField = 'CALIFB06'
                TableField = 'CALIFB06'
              end
              item
                DatasetField = 'CALIFB07'
                TableField = 'CALIFB07'
              end
              item
                DatasetField = 'CALIFB08'
                TableField = 'CALIFB08'
              end
              item
                DatasetField = 'CALIFB09'
                TableField = 'CALIFB09'
              end
              item
                DatasetField = 'CALIFB10'
                TableField = 'CALIFB10'
              end
              item
                DatasetField = 'CALIFB11'
                TableField = 'CALIFB11'
              end
              item
                DatasetField = 'CALIFB12'
                TableField = 'CALIFB12'
              end
              item
                DatasetField = 'CALIFB13'
                TableField = 'CALIFB13'
              end
              item
                DatasetField = 'CALIFB14'
                TableField = 'CALIFB14'
              end
              item
                DatasetField = 'CALIFB15'
                TableField = 'CALIFB15'
              end
              item
                DatasetField = 'CALIFB16'
                TableField = 'CALIFB16'
              end
              item
                DatasetField = 'FALTAS01'
                TableField = 'FALTAS01'
              end
              item
                DatasetField = 'FALTAS02'
                TableField = 'FALTAS02'
              end
              item
                DatasetField = 'FALTAS03'
                TableField = 'FALTAS03'
              end
              item
                DatasetField = 'FALTAS04'
                TableField = 'FALTAS04'
              end
              item
                DatasetField = 'FALTAS05'
                TableField = 'FALTAS05'
              end
              item
                DatasetField = 'FALTAS06'
                TableField = 'FALTAS06'
              end
              item
                DatasetField = 'FALTAS07'
                TableField = 'FALTAS07'
              end
              item
                DatasetField = 'FALTAS08'
                TableField = 'FALTAS08'
              end
              item
                DatasetField = 'FALTAS09'
                TableField = 'FALTAS09'
              end
              item
                DatasetField = 'FALTAS10'
                TableField = 'FALTAS10'
              end
              item
                DatasetField = 'FALTAS11'
                TableField = 'FALTAS11'
              end
              item
                DatasetField = 'FALTAS12'
                TableField = 'FALTAS12'
              end
              item
                DatasetField = 'FALTAS13'
                TableField = 'FALTAS13'
              end
              item
                DatasetField = 'FALTAS14'
                TableField = 'FALTAS14'
              end
              item
                DatasetField = 'FALTAS15'
                TableField = 'FALTAS15'
              end
              item
                DatasetField = 'FALTAS16'
                TableField = 'FALTAS16'
              end
              item
                DatasetField = 'REGU01'
                TableField = 'REGU01'
              end
              item
                DatasetField = 'REGU02'
                TableField = 'REGU02'
              end
              item
                DatasetField = 'REGU03'
                TableField = 'REGU03'
              end
              item
                DatasetField = 'REGU04'
                TableField = 'REGU04'
              end
              item
                DatasetField = 'REGU05'
                TableField = 'REGU05'
              end
              item
                DatasetField = 'PROM01'
                TableField = 'PROM01'
              end
              item
                DatasetField = 'PROM02'
                TableField = 'PROM02'
              end
              item
                DatasetField = 'PROM03'
                TableField = 'PROM03'
              end
              item
                DatasetField = 'PROM04'
                TableField = 'PROM04'
              end
              item
                DatasetField = 'PROM05'
                TableField = 'PROM05'
              end
              item
                DatasetField = 'PROM06'
                TableField = 'PROM06'
              end
              item
                DatasetField = 'PROM07'
                TableField = 'PROM07'
              end
              item
                DatasetField = 'PROM08'
                TableField = 'PROM08'
              end
              item
                DatasetField = 'PROM09'
                TableField = 'PROM09'
              end
              item
                DatasetField = 'PROM10'
                TableField = 'PROM10'
              end
              item
                DatasetField = 'PROM11'
                TableField = 'PROM11'
              end
              item
                DatasetField = 'PROM12'
                TableField = 'PROM12'
              end
              item
                DatasetField = 'PROM13'
                TableField = 'PROM13'
              end
              item
                DatasetField = 'PROM14'
                TableField = 'PROM14'
              end
              item
                DatasetField = 'PROM15'
                TableField = 'PROM15'
              end
              item
                DatasetField = 'PROM16'
                TableField = 'PROM16'
              end
              item
                DatasetField = 'ORDEN'
                TableField = 'ORDEN'
              end
              item
                DatasetField = 'NOTA01'
                TableField = 'NOTA01'
              end
              item
                DatasetField = 'NOTA02'
                TableField = 'NOTA02'
              end
              item
                DatasetField = 'NOTA03'
                TableField = 'NOTA03'
              end
              item
                DatasetField = 'NOTA04'
                TableField = 'NOTA04'
              end
              item
                DatasetField = 'NOTA05'
                TableField = 'NOTA05'
              end
              item
                DatasetField = 'NOTA06'
                TableField = 'NOTA06'
              end
              item
                DatasetField = 'NOTA07'
                TableField = 'NOTA07'
              end
              item
                DatasetField = 'NOTA08'
                TableField = 'NOTA08'
              end
              item
                DatasetField = 'NOTA09'
                TableField = 'NOTA09'
              end
              item
                DatasetField = 'NOTA10'
                TableField = 'NOTA10'
              end
              item
                DatasetField = 'NOTA11'
                TableField = 'NOTA11'
              end
              item
                DatasetField = 'NOTA12'
                TableField = 'NOTA12'
              end
              item
                DatasetField = 'NOTA13'
                TableField = 'NOTA13'
              end
              item
                DatasetField = 'NOTA14'
                TableField = 'NOTA14'
              end
              item
                DatasetField = 'NOTA15'
                TableField = 'NOTA15'
              end
              item
                DatasetField = 'NOTA16'
                TableField = 'NOTA16'
              end
              item
                DatasetField = 'ORDENINTERNO'
                TableField = 'ORDENINTERNO'
              end
              item
                DatasetField = 'ORDENOFICIAL'
                TableField = 'ORDENOFICIAL'
              end>
          end>
        Name = 'spBoletaTodos'
        Fields = <
          item
            Name = 'MATERIA'
            DataType = datString
            Size = 50
          end
          item
            Name = 'MATERIACODIGO'
            DataType = datString
            Size = 10
          end
          item
            Name = 'NOMBRE'
            DataType = datString
            Size = 70
          end
          item
            Name = 'NUMCONTROL'
            DataType = datString
            Size = 12
          end
          item
            Name = 'PROMEDIO'
            DataType = datInteger
          end
          item
            Name = 'GRUPOCODIGO'
            DataType = datString
            Size = 10
          end
          item
            Name = 'GRUPO'
            DataType = datString
            Size = 50
          end
          item
            Name = 'CICLO'
            DataType = datString
            Size = 50
          end
          item
            Name = 'IDCALIFICACION'
            DataType = datInteger
          end
          item
            Name = 'IDMATERIA'
            DataType = datInteger
          end
          item
            Name = 'IDHISTORIALALUMNO'
            DataType = datInteger
          end
          item
            Name = 'IDHISTORIALGRUPO'
            DataType = datInteger
          end
          item
            Name = 'IDTIPOCALIFICACION'
            DataType = datInteger
          end
          item
            Name = 'CALIFICACION'
            DataType = datFloat
          end
          item
            Name = 'CALIFAUX1'
            DataType = datFloat
          end
          item
            Name = 'CALIFAUX2'
            DataType = datFloat
          end
          item
            Name = 'STATUS'
            DataType = datString
            Size = 1
          end
          item
            Name = 'FALTAS'
            DataType = datInteger
          end
          item
            Name = 'FECHA'
            DataType = datDateTime
          end
          item
            Name = 'CALIF01'
            DataType = datFloat
          end
          item
            Name = 'CALIF02'
            DataType = datFloat
          end
          item
            Name = 'CALIF03'
            DataType = datFloat
          end
          item
            Name = 'CALIF04'
            DataType = datFloat
          end
          item
            Name = 'CALIF05'
            DataType = datFloat
          end
          item
            Name = 'CALIF06'
            DataType = datFloat
          end
          item
            Name = 'CALIF07'
            DataType = datFloat
          end
          item
            Name = 'CALIF08'
            DataType = datFloat
          end
          item
            Name = 'CALIF09'
            DataType = datFloat
          end
          item
            Name = 'CALIF10'
            DataType = datFloat
          end
          item
            Name = 'CALIF11'
            DataType = datFloat
          end
          item
            Name = 'CALIF12'
            DataType = datFloat
          end
          item
            Name = 'CALIF13'
            DataType = datFloat
          end
          item
            Name = 'CALIF14'
            DataType = datFloat
          end
          item
            Name = 'CALIF15'
            DataType = datFloat
          end
          item
            Name = 'CALIF16'
            DataType = datFloat
          end
          item
            Name = 'CALIFA01'
            DataType = datFloat
          end
          item
            Name = 'CALIFA02'
            DataType = datFloat
          end
          item
            Name = 'CALIFA03'
            DataType = datFloat
          end
          item
            Name = 'CALIFA04'
            DataType = datFloat
          end
          item
            Name = 'CALIFA05'
            DataType = datFloat
          end
          item
            Name = 'CALIFA06'
            DataType = datFloat
          end
          item
            Name = 'CALIFA07'
            DataType = datFloat
          end
          item
            Name = 'CALIFA08'
            DataType = datFloat
          end
          item
            Name = 'CALIFA09'
            DataType = datFloat
          end
          item
            Name = 'CALIFA10'
            DataType = datFloat
          end
          item
            Name = 'CALIFA11'
            DataType = datFloat
          end
          item
            Name = 'CALIFA12'
            DataType = datFloat
          end
          item
            Name = 'CALIFA13'
            DataType = datFloat
          end
          item
            Name = 'CALIFA14'
            DataType = datFloat
          end
          item
            Name = 'CALIFA15'
            DataType = datFloat
          end
          item
            Name = 'CALIFA16'
            DataType = datFloat
          end
          item
            Name = 'CALIFB01'
            DataType = datFloat
          end
          item
            Name = 'CALIFB02'
            DataType = datFloat
          end
          item
            Name = 'CALIFB03'
            DataType = datFloat
          end
          item
            Name = 'CALIFB04'
            DataType = datFloat
          end
          item
            Name = 'CALIFB05'
            DataType = datFloat
          end
          item
            Name = 'CALIFB06'
            DataType = datFloat
          end
          item
            Name = 'CALIFB07'
            DataType = datFloat
          end
          item
            Name = 'CALIFB08'
            DataType = datFloat
          end
          item
            Name = 'CALIFB09'
            DataType = datFloat
          end
          item
            Name = 'CALIFB10'
            DataType = datFloat
          end
          item
            Name = 'CALIFB11'
            DataType = datFloat
          end
          item
            Name = 'CALIFB12'
            DataType = datFloat
          end
          item
            Name = 'CALIFB13'
            DataType = datFloat
          end
          item
            Name = 'CALIFB14'
            DataType = datFloat
          end
          item
            Name = 'CALIFB15'
            DataType = datFloat
          end
          item
            Name = 'CALIFB16'
            DataType = datFloat
          end
          item
            Name = 'FALTAS01'
            DataType = datFloat
          end
          item
            Name = 'FALTAS02'
            DataType = datFloat
          end
          item
            Name = 'FALTAS03'
            DataType = datFloat
          end
          item
            Name = 'FALTAS04'
            DataType = datFloat
          end
          item
            Name = 'FALTAS05'
            DataType = datFloat
          end
          item
            Name = 'FALTAS06'
            DataType = datFloat
          end
          item
            Name = 'FALTAS07'
            DataType = datFloat
          end
          item
            Name = 'FALTAS08'
            DataType = datFloat
          end
          item
            Name = 'FALTAS09'
            DataType = datFloat
          end
          item
            Name = 'FALTAS10'
            DataType = datFloat
          end
          item
            Name = 'FALTAS11'
            DataType = datFloat
          end
          item
            Name = 'FALTAS12'
            DataType = datFloat
          end
          item
            Name = 'FALTAS13'
            DataType = datFloat
          end
          item
            Name = 'FALTAS14'
            DataType = datFloat
          end
          item
            Name = 'FALTAS15'
            DataType = datFloat
          end
          item
            Name = 'FALTAS16'
            DataType = datFloat
          end
          item
            Name = 'REGU01'
            DataType = datFloat
          end
          item
            Name = 'REGU02'
            DataType = datFloat
          end
          item
            Name = 'REGU03'
            DataType = datFloat
          end
          item
            Name = 'REGU04'
            DataType = datFloat
          end
          item
            Name = 'REGU05'
            DataType = datFloat
          end
          item
            Name = 'PROM01'
            DataType = datFloat
          end
          item
            Name = 'PROM02'
            DataType = datFloat
          end
          item
            Name = 'PROM03'
            DataType = datFloat
          end
          item
            Name = 'PROM04'
            DataType = datFloat
          end
          item
            Name = 'PROM05'
            DataType = datFloat
          end
          item
            Name = 'PROM06'
            DataType = datFloat
          end
          item
            Name = 'PROM07'
            DataType = datFloat
          end
          item
            Name = 'PROM08'
            DataType = datFloat
          end
          item
            Name = 'PROM09'
            DataType = datFloat
          end
          item
            Name = 'PROM10'
            DataType = datFloat
          end
          item
            Name = 'PROM11'
            DataType = datFloat
          end
          item
            Name = 'PROM12'
            DataType = datFloat
          end
          item
            Name = 'PROM13'
            DataType = datFloat
          end
          item
            Name = 'PROM14'
            DataType = datFloat
          end
          item
            Name = 'PROM15'
            DataType = datFloat
          end
          item
            Name = 'PROM16'
            DataType = datFloat
          end
          item
            Name = 'ORDEN'
            DataType = datInteger
          end
          item
            Name = 'NOTA01'
            DataType = datString
            Size = 250
          end
          item
            Name = 'NOTA02'
            DataType = datString
            Size = 250
          end
          item
            Name = 'NOTA03'
            DataType = datString
            Size = 250
          end
          item
            Name = 'NOTA04'
            DataType = datString
            Size = 250
          end
          item
            Name = 'NOTA05'
            DataType = datString
            Size = 250
          end
          item
            Name = 'NOTA06'
            DataType = datString
            Size = 250
          end
          item
            Name = 'NOTA07'
            DataType = datString
            Size = 250
          end
          item
            Name = 'NOTA08'
            DataType = datString
            Size = 250
          end
          item
            Name = 'NOTA09'
            DataType = datString
            Size = 250
          end
          item
            Name = 'NOTA10'
            DataType = datString
            Size = 250
          end
          item
            Name = 'NOTA11'
            DataType = datString
            Size = 250
          end
          item
            Name = 'NOTA12'
            DataType = datString
            Size = 250
          end
          item
            Name = 'NOTA13'
            DataType = datString
            Size = 250
          end
          item
            Name = 'NOTA14'
            DataType = datString
            Size = 250
          end
          item
            Name = 'NOTA15'
            DataType = datString
            Size = 250
          end
          item
            Name = 'NOTA16'
            DataType = datString
            Size = 250
          end
          item
            Name = 'ORDENINTERNO'
            DataType = datInteger
          end
          item
            Name = 'ORDENOFICIAL'
            DataType = datInteger
          end>
      end
      item
        Params = <
          item
            Name = 'Cual'
            Value = '1'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
            SQL = 
              'CREATE TABLE #TEMP1'#10'('#10'  MATERIA VARCHAR(50),'#10'  MATERIACODIGO VAR' +
              'CHAR(10),'#10'  NOMBRE VARCHAR(70),'#10'  NUMCONTROL VARCHAR(12),'#10'  PROM' +
              'EDIO INT,'#10'  GRUPOCODIGO VARCHAR(10),'#10'  GRUPO VARCHAR(50),'#10'  CICL' +
              'O VARCHAR(50),'#10'  IDCALIFICACION INT,'#10'  IDMATERIA INT,'#10'  IDHISTOR' +
              'IALALUMNO INT,'#10'  IDHISTORIALGRUPO INT,'#10'  IDTIPOCALIFICACION INT,' +
              #10'  CALIFICACION FLOAT,'#10'  CALIFAUX1 FLOAT,'#10'  CALIFAUX2 FLOAT,'#10'  S' +
              'TATUS VARCHAR(1),'#10'  FALTAS INT,'#10'  FECHA DATETIME,'#10'  CALIF01 FLOA' +
              'T,'#10'  CALIF02 FLOAT,'#10'  CALIF03 FLOAT,'#10'  CALIF04 FLOAT,'#10'  CALIF05 ' +
              'FLOAT,'#10'  CALIF06 FLOAT,'#10'  CALIF07 FLOAT,'#10'  CALIF08 FLOAT,'#10'  CALI' +
              'F09 FLOAT,'#10'  CALIF10 FLOAT,'#10'  CALIF11 FLOAT,'#10'  CALIF12 FLOAT,'#10'  ' +
              'CALIF13 FLOAT,'#10'  CALIF14 FLOAT,'#10'  CALIF15 FLOAT,'#10'  CALIF16 FLOAT' +
              ','#10'  CALIFA01 FLOAT,'#10'  CALIFA02 FLOAT,'#10'  CALIFA03 FLOAT,'#10'  CALIFA' +
              '04 FLOAT,'#10'  CALIFA05 FLOAT,'#10'  CALIFA06 FLOAT,'#10'  CALIFA07 FLOAT,'#10 +
              '  CALIFA08 FLOAT,'#10'  CALIFA09 FLOAT,'#10'  CALIFA10 FLOAT,'#10'  CALIFA11' +
              ' FLOAT,'#10'  CALIFA12 FLOAT,'#10'  CALIFA13 FLOAT,'#10'  CALIFA14 FLOAT,'#10'  ' +
              'CALIFA15 FLOAT,'#10'  CALIFA16 FLOAT,'#10'  CALIFB01 FLOAT,'#10'  CALIFB02 F' +
              'LOAT,'#10'  CALIFB03 FLOAT,'#10'  CALIFB04 FLOAT,'#10'  CALIFB05 FLOAT,'#10'  CA' +
              'LIFB06 FLOAT,'#10'  CALIFB07 FLOAT,'#10'  CALIFB08 FLOAT,'#10'  CALIFB09 FLO' +
              'AT,'#10'  CALIFB10 FLOAT,'#10'  CALIFB11 FLOAT,'#10'  CALIFB12 FLOAT,'#10'  CALI' +
              'FB13 FLOAT,'#10'  CALIFB14 FLOAT,'#10'  CALIFB15 FLOAT,'#10'  CALIFB16 FLOAT' +
              ','#10'  FALTAS01 FLOAT,'#10'  FALTAS02 FLOAT,'#10'  FALTAS03 FLOAT,'#10'  FALTAS' +
              '04 FLOAT,'#10'  FALTAS05 FLOAT,'#10'  FALTAS06 FLOAT,'#10'  FALTAS07 FLOAT,'#10 +
              '  FALTAS08 FLOAT,'#10'  FALTAS09 FLOAT,'#10'  FALTAS10 FLOAT,'#10'  FALTAS11' +
              ' FLOAT,'#10'  FALTAS12 FLOAT,'#10'  FALTAS13 FLOAT,'#10'  FALTAS14 FLOAT,'#10'  ' +
              'FALTAS15 FLOAT,'#10'  FALTAS16 FLOAT,'#10'  REGU01 FLOAT,'#10'  REGU02 FLOAT' +
              ','#10'  REGU03 FLOAT,'#10'  REGU04 FLOAT,'#10'  REGU05 FLOAT,'#10'  PROM01 FLOAT' +
              ','#10'  PROM02 FLOAT,'#10'  PROM03 FLOAT,'#10'  PROM04 FLOAT,'#10'  PROM05 FLOAT' +
              ','#10'  PROM06 FLOAT,'#10'  PROM07 FLOAT,'#10'  PROM08 FLOAT,'#10'  PROM09 FLOAT' +
              ','#10'  PROM10 FLOAT,'#10'  PROM11 FLOAT,'#10'  PROM12 FLOAT,'#10'  PROM13 FLOAT' +
              ','#10'  PROM14 FLOAT,'#10'  PROM15 FLOAT,'#10'  PROM16 FLOAT,'#10'  ORDEN INTEGE' +
              'R,'#10'  NOTA01 VARCHAR(250),'#10'  NOTA02 VARCHAR(250),'#10'  NOTA03 VARCHA' +
              'R(250),'#10'  NOTA04 VARCHAR(250),'#10'  NOTA05 VARCHAR(250),'#10'  NOTA06 V' +
              'ARCHAR(250),'#10'  NOTA07 VARCHAR(250),'#10'  NOTA08 VARCHAR(250),'#10'  NOT' +
              'A09 VARCHAR(250),'#10'  NOTA10 VARCHAR(250),'#10'  NOTA11 VARCHAR(250),'#10 +
              '  NOTA12 VARCHAR(250),'#10'  NOTA13 VARCHAR(250),'#10'  NOTA14 VARCHAR(2' +
              '50),'#10'  NOTA15 VARCHAR(250),'#10'  NOTA16 VARCHAR(250)'#10')'#10#10' DECLARE @M' +
              'ATERIA VARCHAR(50)'#10' DECLARE @MATERIACODIGO VARCHAR(10)'#10' DECLARE ' +
              '@ORDEN INT'#10' DECLARE @NOMBRE VARCHAR(70)'#10' DECLARE @NUMCONTROL VAR' +
              'CHAR(12)'#10' DECLARE @PROMEDIO INT'#10' DECLARE @GRUPOCODIGO VARCHAR(10' +
              ')'#10' DECLARE @GRUPO VARCHAR(50)'#10' DECLARE @CICLO VARCHAR(50)'#10' DECLA' +
              'RE @IDCALIFICACION INT'#10' DECLARE @IDMATERIA INT'#10' DECLARE @IDHISTO' +
              'RIALALUMNO INT'#10' DECLARE @IDHISTORIALGRUPO INT'#10' DECLARE @IDTIPOCA' +
              'LIFICACION INT'#10' DECLARE @CALIFICACION FLOAT'#10' DECLARE @CALIFAUX1 ' +
              'FLOAT'#10' DECLARE @CALIFAUX2 FLOAT'#10' DECLARE @STATUS VARCHAR(1)'#10' DEC' +
              'LARE @FALTAS INT'#10' DECLARE @FECHA DATETIME'#10' DECLARE @CALIF01 FLOA' +
              'T'#10' DECLARE @CALIF02 FLOAT'#10' DECLARE @CALIF03 FLOAT'#10' DECLARE @CALI' +
              'F04 FLOAT'#10' DECLARE @CALIF05 FLOAT'#10' DECLARE @CALIF06 FLOAT'#10' DECLA' +
              'RE @CALIF07 FLOAT'#10' DECLARE @CALIF08 FLOAT'#10' DECLARE @CALIF09 FLOA' +
              'T'#10' DECLARE @CALIF10 FLOAT'#10' DECLARE @CALIF11 FLOAT'#10' DECLARE @CALI' +
              'F12 FLOAT'#10' DECLARE @CALIF13 FLOAT'#10' DECLARE @CALIF14 FLOAT'#10' DECLA' +
              'RE @CALIF15 FLOAT'#10' DECLARE @CALIF16 FLOAT'#10' DECLARE @CALIFA01 FLO' +
              'AT'#10' DECLARE @CALIFA02 FLOAT'#10' DECLARE @CALIFA03 FLOAT'#10' DECLARE @C' +
              'ALIFA04 FLOAT'#10' DECLARE @CALIFA05 FLOAT'#10' DECLARE @CALIFA06 FLOAT'#10 +
              ' DECLARE @CALIFA07 FLOAT'#10' DECLARE @CALIFA08 FLOAT'#10' DECLARE @CALI' +
              'FA09 FLOAT'#10' DECLARE @CALIFA10 FLOAT'#10' DECLARE @CALIFA11 FLOAT'#10' DE' +
              'CLARE @CALIFA12 FLOAT'#10' DECLARE @CALIFA13 FLOAT'#10' DECLARE @CALIFA1' +
              '4 FLOAT'#10' DECLARE @CALIFA15 FLOAT'#10' DECLARE @CALIFA16 FLOAT'#10' DECLA' +
              'RE @CALIFB01 FLOAT'#10' DECLARE @CALIFB02 FLOAT'#10' DECLARE @CALIFB03 F' +
              'LOAT'#10' DECLARE @CALIFB04 FLOAT'#10' DECLARE @CALIFB05 FLOAT'#10' DECLARE ' +
              '@CALIFB06 FLOAT'#10' DECLARE @CALIFB07 FLOAT'#10' DECLARE @CALIFB08 FLOA' +
              'T'#10' DECLARE @CALIFB09 FLOAT'#10' DECLARE @CALIFB10 FLOAT'#10' DECLARE @CA' +
              'LIFB11 FLOAT'#10' DECLARE @CALIFB12 FLOAT'#10' DECLARE @CALIFB13 FLOAT'#10' ' +
              'DECLARE @CALIFB14 FLOAT'#10' DECLARE @CALIFB15 FLOAT'#10' DECLARE @CALIF' +
              'B16 FLOAT'#10' DECLARE @FALTAS01 FLOAT'#10' DECLARE @FALTAS02 FLOAT'#10' DEC' +
              'LARE @FALTAS03 FLOAT'#10' DECLARE @FALTAS04 FLOAT'#10' DECLARE @FALTAS05' +
              ' FLOAT'#10' DECLARE @FALTAS06 FLOAT'#10' DECLARE @FALTAS07 FLOAT'#10' DECLAR' +
              'E @FALTAS08 FLOAT'#10' DECLARE @FALTAS09 FLOAT'#10' DECLARE @FALTAS10 FL' +
              'OAT'#10' DECLARE @FALTAS11 FLOAT'#10' DECLARE @FALTAS12 FLOAT'#10' DECLARE @' +
              'FALTAS13 FLOAT'#10' DECLARE @FALTAS14 FLOAT'#10' DECLARE @FALTAS15 FLOAT' +
              #10' DECLARE @FALTAS16 FLOAT'#10' DECLARE @REGU01 FLOAT'#10' DECLARE @REGU0' +
              '2 FLOAT'#10' DECLARE @REGU03 FLOAT'#10' DECLARE @REGU04 FLOAT'#10' DECLARE @' +
              'REGU05 FLOAT'#10' DECLARE @PROM01 FLOAT'#10' DECLARE @PROM02 FLOAT'#10' DECL' +
              'ARE @PROM03 FLOAT'#10' DECLARE @PROM04 FLOAT'#10' DECLARE @PROM05 FLOAT'#10 +
              ' DECLARE @PROM06 FLOAT'#10' DECLARE @PROM07 FLOAT'#10' DECLARE @PROM08 F' +
              'LOAT'#10' DECLARE @PROM09 FLOAT'#10' DECLARE @PROM10 FLOAT'#10' DECLARE @PRO' +
              'M11 FLOAT'#10' DECLARE @PROM12 FLOAT'#10' DECLARE @PROM13 FLOAT'#10' DECLARE' +
              ' @PROM14 FLOAT'#10' DECLARE @PROM15 FLOAT'#10' DECLARE @PROM16 FLOAT'#10' DE' +
              'CLARE @NOTA01 VARCHAR(250)'#10' DECLARE @NOTA02 VARCHAR(250)'#10' DECLAR' +
              'E @NOTA03 VARCHAR(250)'#10' DECLARE @NOTA04 VARCHAR(250)'#10' DECLARE @N' +
              'OTA05 VARCHAR(250)'#10' DECLARE @NOTA06 VARCHAR(250)'#10' DECLARE @NOTA0' +
              '7 VARCHAR(250)'#10' DECLARE @NOTA08 VARCHAR(250)'#10' DECLARE @NOTA09 VA' +
              'RCHAR(250)'#10' DECLARE @NOTA10 VARCHAR(250)'#10' DECLARE @NOTA11 VARCHA' +
              'R(250)'#10' DECLARE @NOTA12 VARCHAR(250)'#10' DECLARE @NOTA13 VARCHAR(25' +
              '0)'#10' DECLARE @NOTA14 VARCHAR(250)'#10' DECLARE @NOTA15 VARCHAR(250)'#10' ' +
              'DECLARE @NOTA16 VARCHAR(250)'#10#10#10'declare CursorBoletaInterna SCROL' +
              'L CURSOR FOR'#10'SELECT'#10'      MATERIA.NOMBRE AS MATERIA,'#10'      MATER' +
              'IA.CODIGO AS MATERIACODIGO,'#10'      MATERIA.ORDENINTERNO,'#10'      AL' +
              'UMNO.NOMBRE,'#10'      ALUMNO.NUMCONTROL,'#10'      MATERIA.PROMEDIO,'#10'  ' +
              '    GRUPO.CODIGO AS GRUPOCODIGO,'#10'      GRUPO.NOMBRE AS GRUPO,'#10'  ' +
              '    CICLO.CODIGO AS CICLO,'#10'      CALIFICACION.IDCALIFICACION,'#10'  ' +
              '    CALIFICACION.IDMATERIA,'#10'      CALIFICACION.IDHISTORIALALUMNO' +
              ','#10'      CALIFICACION.IDHISTORIALGRUPO,'#10'      CALIFICACION.IDTIPO' +
              'CALIFICACION,'#10'      CALIFICACION.CALIFICACION,'#10'      CALIFICACIO' +
              'N.CALIFAUX1,'#10'      CALIFICACION.CALIFAUX2,'#10'      CALIFICACION.ST' +
              'ATUS,'#10'      CALIFICACION.FALTAS,'#10'      CALIFICACION.FECHA,'#10'     ' +
              ' CALIFICACION.CALIF01,'#10'      CALIFICACION.CALIF02,'#10'      CALIFIC' +
              'ACION.CALIF03,'#10'      CALIFICACION.CALIF04,'#10'      CALIFICACION.CA' +
              'LIF05,'#10'      CALIFICACION.CALIF06,'#10'      CALIFICACION.CALIF07,'#10' ' +
              '     CALIFICACION.CALIF08,'#10'      CALIFICACION.CALIF09,'#10'      CAL' +
              'IFICACION.CALIF10,'#10'      CALIFICACION.CALIF11,'#10'      CALIFICACIO' +
              'N.CALIF12,'#10'      CALIFICACION.CALIF13,'#10'      CALIFICACION.CALIF1' +
              '4,'#10'      CALIFICACION.CALIF15,'#10'      CALIFICACION.CALIF16,'#10'     ' +
              ' CALIFICACION.CALIFA01,'#10'      CALIFICACION.CALIFA02,'#10'      CALIF' +
              'ICACION.CALIFA03,'#10'      CALIFICACION.CALIFA04,'#10'      CALIFICACIO' +
              'N.CALIFA05,'#10'      CALIFICACION.CALIFA06,'#10'      CALIFICACION.CALI' +
              'FA07,'#10'      CALIFICACION.CALIFA08,'#10'      CALIFICACION.CALIFA09,'#10 +
              '      CALIFICACION.CALIFA10,'#10'      CALIFICACION.CALIFA11,'#10'      ' +
              'CALIFICACION.CALIFA12,'#10'      CALIFICACION.CALIFA13,'#10'      CALIFI' +
              'CACION.CALIFA14,'#10'      CALIFICACION.CALIFA15,'#10'      CALIFICACION' +
              '.CALIFA16,'#10'      CALIFICACION.CALIFB01,'#10'      CALIFICACION.CALIF' +
              'B02,'#10'      CALIFICACION.CALIFB03,'#10'      CALIFICACION.CALIFB04,'#10' ' +
              '     CALIFICACION.CALIFB05,'#10'      CALIFICACION.CALIFB06,'#10'      C' +
              'ALIFICACION.CALIFB07,'#10'      CALIFICACION.CALIFB08,'#10'      CALIFIC' +
              'ACION.CALIFB09,'#10'      CALIFICACION.CALIFB10,'#10'      CALIFICACION.' +
              'CALIFB11,'#10'      CALIFICACION.CALIFB12,'#10'      CALIFICACION.CALIFB' +
              '13,'#10'      CALIFICACION.CALIFB14,'#10'      CALIFICACION.CALIFB15,'#10'  ' +
              '    CALIFICACION.CALIFB16,'#10'      CALIFICACION.FALTAS01,'#10'      CA' +
              'LIFICACION.FALTAS02,'#10'      CALIFICACION.FALTAS03,'#10'      CALIFICA' +
              'CION.FALTAS04,'#10'      CALIFICACION.FALTAS05,'#10'      CALIFICACION.F' +
              'ALTAS06,'#10'      CALIFICACION.FALTAS07,'#10'      CALIFICACION.FALTAS0' +
              '8,'#10'      CALIFICACION.FALTAS09,'#10'      CALIFICACION.FALTAS10,'#10'   ' +
              '   CALIFICACION.FALTAS11,'#10'      CALIFICACION.FALTAS12,'#10'      CAL' +
              'IFICACION.FALTAS13,'#10'      CALIFICACION.FALTAS14,'#10'      CALIFICAC' +
              'ION.FALTAS15,'#10'      CALIFICACION.FALTAS16,'#10'      CALIFICACION.RE' +
              'GU01,'#10'      CALIFICACION.REGU02,'#10'      CALIFICACION.REGU03,'#10'    ' +
              '  CALIFICACION.REGU04,'#10'      CALIFICACION.REGU05,'#10'      CALIFICA' +
              'CION.NOTA01,'#10'      CALIFICACION.NOTA02,'#10'      CALIFICACION.NOTA0' +
              '3,'#10'      CALIFICACION.NOTA04,'#10'      CALIFICACION.NOTA05,'#10'      C' +
              'ALIFICACION.NOTA06,'#10'      CALIFICACION.NOTA07,'#10'      CALIFICACIO' +
              'N.NOTA08,'#10'      CALIFICACION.NOTA09,'#10'      CALIFICACION.NOTA10,'#10 +
              '      CALIFICACION.NOTA11,'#10'      CALIFICACION.NOTA12,'#10'      CALI' +
              'FICACION.NOTA13,'#10'      CALIFICACION.NOTA14,'#10'      CALIFICACION.N' +
              'OTA15,'#10'      CALIFICACION.NOTA16'#10'    FROM'#10'      CALIFICACION'#10'   ' +
              '   INNER JOIN MATERIA ON (CALIFICACION.IDMATERIA = MATERIA.IDMAT' +
              'ERIA)'#10'      INNER JOIN HISTORIALALUMNO ON (CALIFICACION.IDHISTOR' +
              'IALALUMNO = HISTORIALALUMNO.IDHISTORIALALUMNO)'#10'      INNER JOIN ' +
              'ALUMNO ON (HISTORIALALUMNO.IDALUMNO = ALUMNO.IDALUMNO)'#10'      INN' +
              'ER JOIN HISTORIALGRUPO ON (HISTORIALALUMNO.IDHISTORIALGRUPO = HI' +
              'STORIALGRUPO.IDHISTORIALGRUPO)'#10'      INNER JOIN GRUPO ON (HISTOR' +
              'IALGRUPO.IDGRUPO = GRUPO.IDGRUPO)'#10'      INNER JOIN CICLO ON (HIS' +
              'TORIALGRUPO.IDCICLO = CICLO.IDCICLO)'#10'    WHERE'#10'      (HISTORIALA' +
              'LUMNO.IDHISTORIALALUMNO = :Cual) AND (MATERIA.ORDENOFICIAL < 0)'#10 +
              '    ORDER BY'#10'      MATERIA.ORDENINTERNO'#10#10'open CursorBoletaIntern' +
              'a'#10'fetch next from CursorBoletaInterna'#10'into @MATERIA, @MATERIACOD' +
              'IGO,@ORDEN, @NOMBRE, @NUMCONTROL, @PROMEDIO, @GRUPOCODIGO, @GRUP' +
              'O, @CICLO,'#10'     @IDCALIFICACION, @IDMATERIA, @IDHISTORIALALUMNO,' +
              ' @IDHISTORIALGRUPO, @IDTIPOCALIFICACION, @CALIFICACION,'#10'     @CA' +
              'LIFAUX1, @CALIFAUX2, @STATUS, @FALTAS, @FECHA, @CALIF01, @CALIF0' +
              '2, @CALIF03, @CALIF04, @CALIF05,'#10'     @CALIF06, @CALIF07, @CALIF' +
              '08, @CALIF09, @CALIF10, @CALIF11, @CALIF12, @CALIF13, @CALIF14, ' +
              '@CALIF15,'#10'     @CALIF16, @CALIFA01, @CALIFA02, @CALIFA03, @CALIF' +
              'A04, @CALIFA05, @CALIFA06, @CALIFA07, @CALIFA08, @CALIFA09,'#10'    ' +
              ' @CALIFA10, @CALIFA11, @CALIFA12, @CALIFA13, @CALIFA14, @CALIFA1' +
              '5, @CALIFA16, @CALIFB01, @CALIFB02, @CALIFB03,'#10'     @CALIFB04, @' +
              'CALIFB05, @CALIFB06, @CALIFB07, @CALIFB08, @CALIFB09, @CALIFB10,' +
              ' @CALIFB11, @CALIFB12, @CALIFB13,'#10'     @CALIFB14, @CALIFB15, @CA' +
              'LIFB16, @FALTAS01, @FALTAS02, @FALTAS03, @FALTAS04, @FALTAS05, @' +
              'FALTAS06, @FALTAS07,'#10'     @FALTAS08, @FALTAS09, @FALTAS10, @FALT' +
              'AS11, @FALTAS12, @FALTAS13, @FALTAS14, @FALTAS15, @FALTAS16, @RE' +
              'GU01,'#10'     @REGU02, @REGU03, @REGU04, @REGU05, @NOTA01, @NOTA02,' +
              ' @NOTA03,@NOTA04,@NOTA05,@NOTA06,@NOTA07,@NOTA08,@NOTA09,'#10'     @' +
              'NOTA10,@NOTA11,@NOTA12,@NOTA13,@NOTA14,@NOTA15,@NOTA16'#10'while @@f' +
              'etch_status = 0'#10'begin'#10'   declare CursorCalif SCROLL CURSOR FOR'#10' ' +
              '  SELECT AVG(CALIF01), AVG(CALIF02), AVG(CALIF03), AVG(CALIF04),' +
              ' AVG(CALIF05),'#10'          AVG(CALIF06), AVG(CALIF07), AVG(CALIF08' +
              '), AVG(CALIF09), AVG(CALIF10),'#10'          AVG(CALIF11), AVG(CALIF' +
              '12), AVG(CALIF13), AVG(CALIF14), AVG(CALIF15),'#10'          AVG(CAL' +
              'IF16) FROM CALIFICACION'#10'   WHERE IDMATERIA = @IDMATERIA AND IDHI' +
              'STORIALGRUPO = @IDHISTORIALGRUPO'#10#10'   open CursorCalif'#10#10'   fetch ' +
              'next from CursorCalif'#10'   into @PROM01, @PROM02, @PROM03, @PROM04' +
              ', @PROM05, @PROM06, @PROM07, @PROM08, @PROM09, @PROM10,'#10'        ' +
              '@PROM11, @PROM12, @PROM13, @PROM14, @PROM15, @PROM16'#10#10'   DEALLOC' +
              'ATE CursorCalif'#10'   INSERT INTO #TEMP1(MATERIA, MATERIACODIGO, NO' +
              'MBRE, NUMCONTROL, PROMEDIO, GRUPOCODIGO, GRUPO, CICLO,'#10'         ' +
              '             IDCALIFICACION, IDMATERIA, IDHISTORIALALUMNO, IDHIS' +
              'TORIALGRUPO, IDTIPOCALIFICACION, CALIFICACION,'#10'                 ' +
              '     CALIFAUX1, CALIFAUX2, STATUS, FALTAS, FECHA, CALIF01, CALIF' +
              '02, CALIF03, CALIF04, CALIF05, CALIF06,'#10'                      CA' +
              'LIF07, CALIF08, CALIF09, CALIF10, CALIF11, CALIF12, CALIF13, CAL' +
              'IF14, CALIF15, CALIF16, CALIFA01,'#10'                      CALIFA02' +
              ', CALIFA03, CALIFA04, CALIFA05, CALIFA06, CALIFA07, CALIFA08, CA' +
              'LIFA09, CALIFA10, CALIFA11,'#10'                      CALIFA12, CALI' +
              'FA13, CALIFA14, CALIFA15, CALIFA16, CALIFB01, CALIFB02, CALIFB03' +
              ', CALIFB04, CALIFB05,'#10'                      CALIFB06, CALIFB07, ' +
              'CALIFB08, CALIFB09, CALIFB10, CALIFB11, CALIFB12, CALIFB13, CALI' +
              'FB14, CALIFB15,'#10'                      CALIFB16, FALTAS01, FALTAS' +
              '02, FALTAS03, FALTAS04, FALTAS05, FALTAS06, FALTAS07, FALTAS08, ' +
              'FALTAS09,'#10'                      FALTAS10, FALTAS11, FALTAS12, FA' +
              'LTAS13, FALTAS14, FALTAS15, FALTAS16, REGU01, REGU02, REGU03, RE' +
              'GU04,'#10'                      REGU05, PROM01, PROM02, PROM03, PROM' +
              '04, PROM05, PROM06, PROM07, PROM08, PROM09, PROM10, PROM11, PROM' +
              '12,'#10'                      PROM13, PROM14, PROM15, PROM16, ORDEN,' +
              ' NOTA01, NOTA02, NOTA03, NOTA04, NOTA05, NOTA06, NOTA07, NOTA08,' +
              #10'                      NOTA09, NOTA10, NOTA11, NOTA12, NOTA13, N' +
              'OTA14, NOTA15, NOTA16)'#10'   VALUES(@MATERIA, @MATERIACODIGO, @NOMB' +
              'RE, @NUMCONTROL, @PROMEDIO, @GRUPOCODIGO, @GRUPO, @CICLO,'#10'      ' +
              '                @IDCALIFICACION, @IDMATERIA, @IDHISTORIALALUMNO,' +
              ' @IDHISTORIALGRUPO, @IDTIPOCALIFICACION, @CALIFICACION,'#10'        ' +
              '              @CALIFAUX1, @CALIFAUX2, @STATUS, @FALTAS, @FECHA, ' +
              '@CALIF01, @CALIF02, @CALIF03, @CALIF04, @CALIF05, @CALIF06,'#10'    ' +
              '                  @CALIF07, @CALIF08, @CALIF09, @CALIF10, @CALIF' +
              '11, @CALIF12, @CALIF13, @CALIF14, @CALIF15, @CALIF16, @CALIFA01,' +
              #10'                      @CALIFA02, @CALIFA03, @CALIFA04, @CALIFA0' +
              '5, @CALIFA06, @CALIFA07, @CALIFA08, @CALIFA09, @CALIFA10, @CALIF' +
              'A11,'#10'                      @CALIFA12, @CALIFA13, @CALIFA14, @CAL' +
              'IFA15, @CALIFA16, @CALIFB01, @CALIFB02, @CALIFB03, @CALIFB04, @C' +
              'ALIFB05,'#10'                      @CALIFB06, @CALIFB07, @CALIFB08, ' +
              '@CALIFB09, @CALIFB10, @CALIFB11, @CALIFB12, @CALIFB13, @CALIFB14' +
              ', @CALIFB15,'#10'                      @CALIFB16, @FALTAS01, @FALTAS' +
              '02, @FALTAS03, @FALTAS04, @FALTAS05, @FALTAS06, @FALTAS07, @FALT' +
              'AS08, @FALTAS09,'#10'                      @FALTAS10, @FALTAS11, @FA' +
              'LTAS12, @FALTAS13, @FALTAS14, @FALTAS15, @FALTAS16, @REGU01, @RE' +
              'GU02, @REGU03, @REGU04,'#10'                      @REGU05, @PROM01, ' +
              '@PROM02, @PROM03, @PROM04, @PROM05, @PROM06, @PROM07, @PROM08, @' +
              'PROM09, @PROM10, @PROM11, @PROM12,'#10'                      @PROM13' +
              ', @PROM14, @PROM15, @PROM16, @ORDEN, @NOTA01, @NOTA02, @NOTA03, ' +
              '@NOTA04, @NOTA05, @NOTA06, @NOTA07, @NOTA08,'#10'                   ' +
              '   @NOTA09, @NOTA10, @NOTA11, @NOTA12, @NOTA13, @NOTA14, @NOTA15' +
              ', @NOTA16)'#10'fetch next from CursorBoletaInterna'#10'into @MATERIA, @M' +
              'ATERIACODIGO,@ORDEN, @NOMBRE, @NUMCONTROL, @PROMEDIO, @GRUPOCODI' +
              'GO, @GRUPO, @CICLO,'#10'     @IDCALIFICACION, @IDMATERIA, @IDHISTORI' +
              'ALALUMNO, @IDHISTORIALGRUPO, @IDTIPOCALIFICACION, @CALIFICACION,' +
              #10'     @CALIFAUX1, @CALIFAUX2, @STATUS, @FALTAS, @FECHA, @CALIF01' +
              ', @CALIF02, @CALIF03, @CALIF04, @CALIF05,'#10'     @CALIF06, @CALIF0' +
              '7, @CALIF08, @CALIF09, @CALIF10, @CALIF11, @CALIF12, @CALIF13, @' +
              'CALIF14, @CALIF15,'#10'     @CALIF16, @CALIFA01, @CALIFA02, @CALIFA0' +
              '3, @CALIFA04, @CALIFA05, @CALIFA06, @CALIFA07, @CALIFA08, @CALIF' +
              'A09,'#10'     @CALIFA10, @CALIFA11, @CALIFA12, @CALIFA13, @CALIFA14,' +
              ' @CALIFA15, @CALIFA16, @CALIFB01, @CALIFB02, @CALIFB03,'#10'     @CA' +
              'LIFB04, @CALIFB05, @CALIFB06, @CALIFB07, @CALIFB08, @CALIFB09, @' +
              'CALIFB10, @CALIFB11, @CALIFB12, @CALIFB13,'#10'     @CALIFB14, @CALI' +
              'FB15, @CALIFB16, @FALTAS01, @FALTAS02, @FALTAS03, @FALTAS04, @FA' +
              'LTAS05, @FALTAS06, @FALTAS07,'#10'     @FALTAS08, @FALTAS09, @FALTAS' +
              '10, @FALTAS11, @FALTAS12, @FALTAS13, @FALTAS14, @FALTAS15, @FALT' +
              'AS16, @REGU01,'#10'     @REGU02, @REGU03, @REGU04, @REGU05, @NOTA01,' +
              ' @NOTA02, @NOTA03, @NOTA04, @NOTA05, @NOTA06, @NOTA07, @NOTA08,'#10 +
              '     @NOTA09, @NOTA10, @NOTA11, @NOTA12, @NOTA13, @NOTA14, @NOTA' +
              '15, @NOTA16'#10'end'#10#10'SELECT DISTINCT * FROM #TEMP1'#10'DEALLOCATE Cursor' +
              'BoletaInterna'#10'DROP TABLE #TEMP1'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'MATERIA'
                TableField = 'MATERIA'
              end
              item
                DatasetField = 'MATERIACODIGO'
                TableField = 'MATERIACODIGO'
              end
              item
                DatasetField = 'NOMBRE'
                TableField = 'NOMBRE'
              end
              item
                DatasetField = 'NUMCONTROL'
                TableField = 'NUMCONTROL'
              end
              item
                DatasetField = 'PROMEDIO'
                TableField = 'PROMEDIO'
              end
              item
                DatasetField = 'GRUPOCODIGO'
                TableField = 'GRUPOCODIGO'
              end
              item
                DatasetField = 'GRUPO'
                TableField = 'GRUPO'
              end
              item
                DatasetField = 'CICLO'
                TableField = 'CICLO'
              end
              item
                DatasetField = 'IDCALIFICACION'
                TableField = 'IDCALIFICACION'
              end
              item
                DatasetField = 'IDMATERIA'
                TableField = 'IDMATERIA'
              end
              item
                DatasetField = 'IDHISTORIALALUMNO'
                TableField = 'IDHISTORIALALUMNO'
              end
              item
                DatasetField = 'IDHISTORIALGRUPO'
                TableField = 'IDHISTORIALGRUPO'
              end
              item
                DatasetField = 'IDTIPOCALIFICACION'
                TableField = 'IDTIPOCALIFICACION'
              end
              item
                DatasetField = 'CALIFICACION'
                TableField = 'CALIFICACION'
              end
              item
                DatasetField = 'CALIFAUX1'
                TableField = 'CALIFAUX1'
              end
              item
                DatasetField = 'CALIFAUX2'
                TableField = 'CALIFAUX2'
              end
              item
                DatasetField = 'STATUS'
                TableField = 'STATUS'
              end
              item
                DatasetField = 'FALTAS'
                TableField = 'FALTAS'
              end
              item
                DatasetField = 'FECHA'
                TableField = 'FECHA'
              end
              item
                DatasetField = 'CALIF01'
                TableField = 'CALIF01'
              end
              item
                DatasetField = 'CALIF02'
                TableField = 'CALIF02'
              end
              item
                DatasetField = 'CALIF03'
                TableField = 'CALIF03'
              end
              item
                DatasetField = 'CALIF04'
                TableField = 'CALIF04'
              end
              item
                DatasetField = 'CALIF05'
                TableField = 'CALIF05'
              end
              item
                DatasetField = 'CALIF06'
                TableField = 'CALIF06'
              end
              item
                DatasetField = 'CALIF07'
                TableField = 'CALIF07'
              end
              item
                DatasetField = 'CALIF08'
                TableField = 'CALIF08'
              end
              item
                DatasetField = 'CALIF09'
                TableField = 'CALIF09'
              end
              item
                DatasetField = 'CALIF10'
                TableField = 'CALIF10'
              end
              item
                DatasetField = 'CALIF11'
                TableField = 'CALIF11'
              end
              item
                DatasetField = 'CALIF12'
                TableField = 'CALIF12'
              end
              item
                DatasetField = 'CALIF13'
                TableField = 'CALIF13'
              end
              item
                DatasetField = 'CALIF14'
                TableField = 'CALIF14'
              end
              item
                DatasetField = 'CALIF15'
                TableField = 'CALIF15'
              end
              item
                DatasetField = 'CALIF16'
                TableField = 'CALIF16'
              end
              item
                DatasetField = 'CALIFA01'
                TableField = 'CALIFA01'
              end
              item
                DatasetField = 'CALIFA02'
                TableField = 'CALIFA02'
              end
              item
                DatasetField = 'CALIFA03'
                TableField = 'CALIFA03'
              end
              item
                DatasetField = 'CALIFA04'
                TableField = 'CALIFA04'
              end
              item
                DatasetField = 'CALIFA05'
                TableField = 'CALIFA05'
              end
              item
                DatasetField = 'CALIFA06'
                TableField = 'CALIFA06'
              end
              item
                DatasetField = 'CALIFA07'
                TableField = 'CALIFA07'
              end
              item
                DatasetField = 'CALIFA08'
                TableField = 'CALIFA08'
              end
              item
                DatasetField = 'CALIFA09'
                TableField = 'CALIFA09'
              end
              item
                DatasetField = 'CALIFA10'
                TableField = 'CALIFA10'
              end
              item
                DatasetField = 'CALIFA11'
                TableField = 'CALIFA11'
              end
              item
                DatasetField = 'CALIFA12'
                TableField = 'CALIFA12'
              end
              item
                DatasetField = 'CALIFA13'
                TableField = 'CALIFA13'
              end
              item
                DatasetField = 'CALIFA14'
                TableField = 'CALIFA14'
              end
              item
                DatasetField = 'CALIFA15'
                TableField = 'CALIFA15'
              end
              item
                DatasetField = 'CALIFA16'
                TableField = 'CALIFA16'
              end
              item
                DatasetField = 'CALIFB01'
                TableField = 'CALIFB01'
              end
              item
                DatasetField = 'CALIFB02'
                TableField = 'CALIFB02'
              end
              item
                DatasetField = 'CALIFB03'
                TableField = 'CALIFB03'
              end
              item
                DatasetField = 'CALIFB04'
                TableField = 'CALIFB04'
              end
              item
                DatasetField = 'CALIFB05'
                TableField = 'CALIFB05'
              end
              item
                DatasetField = 'CALIFB06'
                TableField = 'CALIFB06'
              end
              item
                DatasetField = 'CALIFB07'
                TableField = 'CALIFB07'
              end
              item
                DatasetField = 'CALIFB08'
                TableField = 'CALIFB08'
              end
              item
                DatasetField = 'CALIFB09'
                TableField = 'CALIFB09'
              end
              item
                DatasetField = 'CALIFB10'
                TableField = 'CALIFB10'
              end
              item
                DatasetField = 'CALIFB11'
                TableField = 'CALIFB11'
              end
              item
                DatasetField = 'CALIFB12'
                TableField = 'CALIFB12'
              end
              item
                DatasetField = 'CALIFB13'
                TableField = 'CALIFB13'
              end
              item
                DatasetField = 'CALIFB14'
                TableField = 'CALIFB14'
              end
              item
                DatasetField = 'CALIFB15'
                TableField = 'CALIFB15'
              end
              item
                DatasetField = 'CALIFB16'
                TableField = 'CALIFB16'
              end
              item
                DatasetField = 'FALTAS01'
                TableField = 'FALTAS01'
              end
              item
                DatasetField = 'FALTAS02'
                TableField = 'FALTAS02'
              end
              item
                DatasetField = 'FALTAS03'
                TableField = 'FALTAS03'
              end
              item
                DatasetField = 'FALTAS04'
                TableField = 'FALTAS04'
              end
              item
                DatasetField = 'FALTAS05'
                TableField = 'FALTAS05'
              end
              item
                DatasetField = 'FALTAS06'
                TableField = 'FALTAS06'
              end
              item
                DatasetField = 'FALTAS07'
                TableField = 'FALTAS07'
              end
              item
                DatasetField = 'FALTAS08'
                TableField = 'FALTAS08'
              end
              item
                DatasetField = 'FALTAS09'
                TableField = 'FALTAS09'
              end
              item
                DatasetField = 'FALTAS10'
                TableField = 'FALTAS10'
              end
              item
                DatasetField = 'FALTAS11'
                TableField = 'FALTAS11'
              end
              item
                DatasetField = 'FALTAS12'
                TableField = 'FALTAS12'
              end
              item
                DatasetField = 'FALTAS13'
                TableField = 'FALTAS13'
              end
              item
                DatasetField = 'FALTAS14'
                TableField = 'FALTAS14'
              end
              item
                DatasetField = 'FALTAS15'
                TableField = 'FALTAS15'
              end
              item
                DatasetField = 'FALTAS16'
                TableField = 'FALTAS16'
              end
              item
                DatasetField = 'REGU01'
                TableField = 'REGU01'
              end
              item
                DatasetField = 'REGU02'
                TableField = 'REGU02'
              end
              item
                DatasetField = 'REGU03'
                TableField = 'REGU03'
              end
              item
                DatasetField = 'REGU04'
                TableField = 'REGU04'
              end
              item
                DatasetField = 'REGU05'
                TableField = 'REGU05'
              end
              item
                DatasetField = 'PROM01'
                TableField = 'PROM01'
              end
              item
                DatasetField = 'PROM02'
                TableField = 'PROM02'
              end
              item
                DatasetField = 'PROM03'
                TableField = 'PROM03'
              end
              item
                DatasetField = 'PROM04'
                TableField = 'PROM04'
              end
              item
                DatasetField = 'PROM05'
                TableField = 'PROM05'
              end
              item
                DatasetField = 'PROM06'
                TableField = 'PROM06'
              end
              item
                DatasetField = 'PROM07'
                TableField = 'PROM07'
              end
              item
                DatasetField = 'PROM08'
                TableField = 'PROM08'
              end
              item
                DatasetField = 'PROM09'
                TableField = 'PROM09'
              end
              item
                DatasetField = 'PROM10'
                TableField = 'PROM10'
              end
              item
                DatasetField = 'PROM11'
                TableField = 'PROM11'
              end
              item
                DatasetField = 'PROM12'
                TableField = 'PROM12'
              end
              item
                DatasetField = 'PROM13'
                TableField = 'PROM13'
              end
              item
                DatasetField = 'PROM14'
                TableField = 'PROM14'
              end
              item
                DatasetField = 'PROM15'
                TableField = 'PROM15'
              end
              item
                DatasetField = 'PROM16'
                TableField = 'PROM16'
              end
              item
                DatasetField = 'ORDEN'
                TableField = 'ORDEN'
              end
              item
                DatasetField = 'NOTA01'
                TableField = 'NOTA01'
              end
              item
                DatasetField = 'NOTA02'
                TableField = 'NOTA02'
              end
              item
                DatasetField = 'NOTA03'
                TableField = 'NOTA03'
              end
              item
                DatasetField = 'NOTA04'
                TableField = 'NOTA04'
              end
              item
                DatasetField = 'NOTA05'
                TableField = 'NOTA05'
              end
              item
                DatasetField = 'NOTA06'
                TableField = 'NOTA06'
              end
              item
                DatasetField = 'NOTA07'
                TableField = 'NOTA07'
              end
              item
                DatasetField = 'NOTA08'
                TableField = 'NOTA08'
              end
              item
                DatasetField = 'NOTA09'
                TableField = 'NOTA09'
              end
              item
                DatasetField = 'NOTA10'
                TableField = 'NOTA10'
              end
              item
                DatasetField = 'NOTA11'
                TableField = 'NOTA11'
              end
              item
                DatasetField = 'NOTA12'
                TableField = 'NOTA12'
              end
              item
                DatasetField = 'NOTA13'
                TableField = 'NOTA13'
              end
              item
                DatasetField = 'NOTA14'
                TableField = 'NOTA14'
              end
              item
                DatasetField = 'NOTA15'
                TableField = 'NOTA15'
              end
              item
                DatasetField = 'NOTA16'
                TableField = 'NOTA16'
              end>
          end>
        Name = 'spBoletaOficial'
        Fields = <
          item
            Name = 'MATERIA'
            DataType = datString
            Size = 50
          end
          item
            Name = 'MATERIACODIGO'
            DataType = datString
            Size = 10
          end
          item
            Name = 'NOMBRE'
            DataType = datString
            Size = 70
          end
          item
            Name = 'NUMCONTROL'
            DataType = datString
            Size = 12
          end
          item
            Name = 'PROMEDIO'
            DataType = datInteger
          end
          item
            Name = 'GRUPOCODIGO'
            DataType = datString
            Size = 10
          end
          item
            Name = 'GRUPO'
            DataType = datString
            Size = 50
          end
          item
            Name = 'CICLO'
            DataType = datString
            Size = 50
          end
          item
            Name = 'IDCALIFICACION'
            DataType = datInteger
          end
          item
            Name = 'IDMATERIA'
            DataType = datInteger
          end
          item
            Name = 'IDHISTORIALALUMNO'
            DataType = datInteger
          end
          item
            Name = 'IDHISTORIALGRUPO'
            DataType = datInteger
          end
          item
            Name = 'IDTIPOCALIFICACION'
            DataType = datInteger
          end
          item
            Name = 'CALIFICACION'
            DataType = datFloat
          end
          item
            Name = 'CALIFAUX1'
            DataType = datFloat
          end
          item
            Name = 'CALIFAUX2'
            DataType = datFloat
          end
          item
            Name = 'STATUS'
            DataType = datString
            Size = 1
          end
          item
            Name = 'FALTAS'
            DataType = datInteger
          end
          item
            Name = 'FECHA'
            DataType = datDateTime
          end
          item
            Name = 'CALIF01'
            DataType = datFloat
          end
          item
            Name = 'CALIF02'
            DataType = datFloat
          end
          item
            Name = 'CALIF03'
            DataType = datFloat
          end
          item
            Name = 'CALIF04'
            DataType = datFloat
          end
          item
            Name = 'CALIF05'
            DataType = datFloat
          end
          item
            Name = 'CALIF06'
            DataType = datFloat
          end
          item
            Name = 'CALIF07'
            DataType = datFloat
          end
          item
            Name = 'CALIF08'
            DataType = datFloat
          end
          item
            Name = 'CALIF09'
            DataType = datFloat
          end
          item
            Name = 'CALIF10'
            DataType = datFloat
          end
          item
            Name = 'CALIF11'
            DataType = datFloat
          end
          item
            Name = 'CALIF12'
            DataType = datFloat
          end
          item
            Name = 'CALIF13'
            DataType = datFloat
          end
          item
            Name = 'CALIF14'
            DataType = datFloat
          end
          item
            Name = 'CALIF15'
            DataType = datFloat
          end
          item
            Name = 'CALIF16'
            DataType = datFloat
          end
          item
            Name = 'CALIFA01'
            DataType = datFloat
          end
          item
            Name = 'CALIFA02'
            DataType = datFloat
          end
          item
            Name = 'CALIFA03'
            DataType = datFloat
          end
          item
            Name = 'CALIFA04'
            DataType = datFloat
          end
          item
            Name = 'CALIFA05'
            DataType = datFloat
          end
          item
            Name = 'CALIFA06'
            DataType = datFloat
          end
          item
            Name = 'CALIFA07'
            DataType = datFloat
          end
          item
            Name = 'CALIFA08'
            DataType = datFloat
          end
          item
            Name = 'CALIFA09'
            DataType = datFloat
          end
          item
            Name = 'CALIFA10'
            DataType = datFloat
          end
          item
            Name = 'CALIFA11'
            DataType = datFloat
          end
          item
            Name = 'CALIFA12'
            DataType = datFloat
          end
          item
            Name = 'CALIFA13'
            DataType = datFloat
          end
          item
            Name = 'CALIFA14'
            DataType = datFloat
          end
          item
            Name = 'CALIFA15'
            DataType = datFloat
          end
          item
            Name = 'CALIFA16'
            DataType = datFloat
          end
          item
            Name = 'CALIFB01'
            DataType = datFloat
          end
          item
            Name = 'CALIFB02'
            DataType = datFloat
          end
          item
            Name = 'CALIFB03'
            DataType = datFloat
          end
          item
            Name = 'CALIFB04'
            DataType = datFloat
          end
          item
            Name = 'CALIFB05'
            DataType = datFloat
          end
          item
            Name = 'CALIFB06'
            DataType = datFloat
          end
          item
            Name = 'CALIFB07'
            DataType = datFloat
          end
          item
            Name = 'CALIFB08'
            DataType = datFloat
          end
          item
            Name = 'CALIFB09'
            DataType = datFloat
          end
          item
            Name = 'CALIFB10'
            DataType = datFloat
          end
          item
            Name = 'CALIFB11'
            DataType = datFloat
          end
          item
            Name = 'CALIFB12'
            DataType = datFloat
          end
          item
            Name = 'CALIFB13'
            DataType = datFloat
          end
          item
            Name = 'CALIFB14'
            DataType = datFloat
          end
          item
            Name = 'CALIFB15'
            DataType = datFloat
          end
          item
            Name = 'CALIFB16'
            DataType = datFloat
          end
          item
            Name = 'FALTAS01'
            DataType = datFloat
          end
          item
            Name = 'FALTAS02'
            DataType = datFloat
          end
          item
            Name = 'FALTAS03'
            DataType = datFloat
          end
          item
            Name = 'FALTAS04'
            DataType = datFloat
          end
          item
            Name = 'FALTAS05'
            DataType = datFloat
          end
          item
            Name = 'FALTAS06'
            DataType = datFloat
          end
          item
            Name = 'FALTAS07'
            DataType = datFloat
          end
          item
            Name = 'FALTAS08'
            DataType = datFloat
          end
          item
            Name = 'FALTAS09'
            DataType = datFloat
          end
          item
            Name = 'FALTAS10'
            DataType = datFloat
          end
          item
            Name = 'FALTAS11'
            DataType = datFloat
          end
          item
            Name = 'FALTAS12'
            DataType = datFloat
          end
          item
            Name = 'FALTAS13'
            DataType = datFloat
          end
          item
            Name = 'FALTAS14'
            DataType = datFloat
          end
          item
            Name = 'FALTAS15'
            DataType = datFloat
          end
          item
            Name = 'FALTAS16'
            DataType = datFloat
          end
          item
            Name = 'REGU01'
            DataType = datFloat
          end
          item
            Name = 'REGU02'
            DataType = datFloat
          end
          item
            Name = 'REGU03'
            DataType = datFloat
          end
          item
            Name = 'REGU04'
            DataType = datFloat
          end
          item
            Name = 'REGU05'
            DataType = datFloat
          end
          item
            Name = 'PROM01'
            DataType = datFloat
          end
          item
            Name = 'PROM02'
            DataType = datFloat
          end
          item
            Name = 'PROM03'
            DataType = datFloat
          end
          item
            Name = 'PROM04'
            DataType = datFloat
          end
          item
            Name = 'PROM05'
            DataType = datFloat
          end
          item
            Name = 'PROM06'
            DataType = datFloat
          end
          item
            Name = 'PROM07'
            DataType = datFloat
          end
          item
            Name = 'PROM08'
            DataType = datFloat
          end
          item
            Name = 'PROM09'
            DataType = datFloat
          end
          item
            Name = 'PROM10'
            DataType = datFloat
          end
          item
            Name = 'PROM11'
            DataType = datFloat
          end
          item
            Name = 'PROM12'
            DataType = datFloat
          end
          item
            Name = 'PROM13'
            DataType = datFloat
          end
          item
            Name = 'PROM14'
            DataType = datFloat
          end
          item
            Name = 'PROM15'
            DataType = datFloat
          end
          item
            Name = 'PROM16'
            DataType = datFloat
          end
          item
            Name = 'ORDEN'
            DataType = datInteger
          end
          item
            Name = 'NOTA01'
            DataType = datString
            Size = 250
          end
          item
            Name = 'NOTA02'
            DataType = datString
            Size = 250
          end
          item
            Name = 'NOTA03'
            DataType = datString
            Size = 250
          end
          item
            Name = 'NOTA04'
            DataType = datString
            Size = 250
          end
          item
            Name = 'NOTA05'
            DataType = datString
            Size = 250
          end
          item
            Name = 'NOTA06'
            DataType = datString
            Size = 250
          end
          item
            Name = 'NOTA07'
            DataType = datString
            Size = 250
          end
          item
            Name = 'NOTA08'
            DataType = datString
            Size = 250
          end
          item
            Name = 'NOTA09'
            DataType = datString
            Size = 250
          end
          item
            Name = 'NOTA10'
            DataType = datString
            Size = 250
          end
          item
            Name = 'NOTA11'
            DataType = datString
            Size = 250
          end
          item
            Name = 'NOTA12'
            DataType = datString
            Size = 250
          end
          item
            Name = 'NOTA13'
            DataType = datString
            Size = 250
          end
          item
            Name = 'NOTA14'
            DataType = datString
            Size = 250
          end
          item
            Name = 'NOTA15'
            DataType = datString
            Size = 250
          end
          item
            Name = 'NOTA16'
            DataType = datString
            Size = 250
          end>
      end
      item
        Params = <
          item
            Name = 'Cual'
            Value = '1'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
            SQL = 
              'CREATE TABLE #TEMP1'#10'('#10'  MATERIA VARCHAR(50),'#10'  MATERIACODIGO VAR' +
              'CHAR(10),'#10'  NOMBRE VARCHAR(70),'#10'  NUMCONTROL VARCHAR(12),'#10'  PROM' +
              'EDIO INT,'#10'  GRUPOCODIGO VARCHAR(10),'#10'  GRUPO VARCHAR(50),'#10'  CICL' +
              'O VARCHAR(50),'#10'  IDCALIFICACION INT,'#10'  IDMATERIA INT,'#10'  IDHISTOR' +
              'IALALUMNO INT,'#10'  IDHISTORIALGRUPO INT,'#10'  IDTIPOCALIFICACION INT,' +
              #10'  CALIFICACION FLOAT,'#10'  CALIFAUX1 FLOAT,'#10'  CALIFAUX2 FLOAT,'#10'  S' +
              'TATUS VARCHAR(1),'#10'  FALTAS INT,'#10'  FECHA DATETIME,'#10'  CALIF01 FLOA' +
              'T,'#10'  CALIF02 FLOAT,'#10'  CALIF03 FLOAT,'#10'  CALIF04 FLOAT,'#10'  CALIF05 ' +
              'FLOAT,'#10'  CALIF06 FLOAT,'#10'  CALIF07 FLOAT,'#10'  CALIF08 FLOAT,'#10'  CALI' +
              'F09 FLOAT,'#10'  CALIF10 FLOAT,'#10'  CALIF11 FLOAT,'#10'  CALIF12 FLOAT,'#10'  ' +
              'CALIF13 FLOAT,'#10'  CALIF14 FLOAT,'#10'  CALIF15 FLOAT,'#10'  CALIF16 FLOAT' +
              ','#10'  CALIFA01 FLOAT,'#10'  CALIFA02 FLOAT,'#10'  CALIFA03 FLOAT,'#10'  CALIFA' +
              '04 FLOAT,'#10'  CALIFA05 FLOAT,'#10'  CALIFA06 FLOAT,'#10'  CALIFA07 FLOAT,'#10 +
              '  CALIFA08 FLOAT,'#10'  CALIFA09 FLOAT,'#10'  CALIFA10 FLOAT,'#10'  CALIFA11' +
              ' FLOAT,'#10'  CALIFA12 FLOAT,'#10'  CALIFA13 FLOAT,'#10'  CALIFA14 FLOAT,'#10'  ' +
              'CALIFA15 FLOAT,'#10'  CALIFA16 FLOAT,'#10'  CALIFB01 FLOAT,'#10'  CALIFB02 F' +
              'LOAT,'#10'  CALIFB03 FLOAT,'#10'  CALIFB04 FLOAT,'#10'  CALIFB05 FLOAT,'#10'  CA' +
              'LIFB06 FLOAT,'#10'  CALIFB07 FLOAT,'#10'  CALIFB08 FLOAT,'#10'  CALIFB09 FLO' +
              'AT,'#10'  CALIFB10 FLOAT,'#10'  CALIFB11 FLOAT,'#10'  CALIFB12 FLOAT,'#10'  CALI' +
              'FB13 FLOAT,'#10'  CALIFB14 FLOAT,'#10'  CALIFB15 FLOAT,'#10'  CALIFB16 FLOAT' +
              ','#10'  FALTAS01 FLOAT,'#10'  FALTAS02 FLOAT,'#10'  FALTAS03 FLOAT,'#10'  FALTAS' +
              '04 FLOAT,'#10'  FALTAS05 FLOAT,'#10'  FALTAS06 FLOAT,'#10'  FALTAS07 FLOAT,'#10 +
              '  FALTAS08 FLOAT,'#10'  FALTAS09 FLOAT,'#10'  FALTAS10 FLOAT,'#10'  FALTAS11' +
              ' FLOAT,'#10'  FALTAS12 FLOAT,'#10'  FALTAS13 FLOAT,'#10'  FALTAS14 FLOAT,'#10'  ' +
              'FALTAS15 FLOAT,'#10'  FALTAS16 FLOAT,'#10'  REGU01 FLOAT,'#10'  REGU02 FLOAT' +
              ','#10'  REGU03 FLOAT,'#10'  REGU04 FLOAT,'#10'  REGU05 FLOAT,'#10'  PROM01 FLOAT' +
              ','#10'  PROM02 FLOAT,'#10'  PROM03 FLOAT,'#10'  PROM04 FLOAT,'#10'  PROM05 FLOAT' +
              ','#10'  PROM06 FLOAT,'#10'  PROM07 FLOAT,'#10'  PROM08 FLOAT,'#10'  PROM09 FLOAT' +
              ','#10'  PROM10 FLOAT,'#10'  PROM11 FLOAT,'#10'  PROM12 FLOAT,'#10'  PROM13 FLOAT' +
              ','#10'  PROM14 FLOAT,'#10'  PROM15 FLOAT,'#10'  PROM16 FLOAT,'#10'  ORDEN INTEGE' +
              'R,'#10'  NOTA01 VARCHAR(250),'#10'  NOTA02 VARCHAR(250),'#10'  NOTA03 VARCHA' +
              'R(250),'#10'  NOTA04 VARCHAR(250),'#10'  NOTA05 VARCHAR(250),'#10'  NOTA06 V' +
              'ARCHAR(250),'#10'  NOTA07 VARCHAR(250),'#10'  NOTA08 VARCHAR(250),'#10'  NOT' +
              'A09 VARCHAR(250),'#10'  NOTA10 VARCHAR(250),'#10'  NOTA11 VARCHAR(250),'#10 +
              '  NOTA12 VARCHAR(250),'#10'  NOTA13 VARCHAR(250),'#10'  NOTA14 VARCHAR(2' +
              '50),'#10'  NOTA15 VARCHAR(250),'#10'  NOTA16 VARCHAR(250)'#10')'#10#10' DECLARE @M' +
              'ATERIA VARCHAR(50)'#10' DECLARE @MATERIACODIGO VARCHAR(10)'#10' DECLARE ' +
              '@ORDEN INT'#10' DECLARE @NOMBRE VARCHAR(70)'#10' DECLARE @NUMCONTROL VAR' +
              'CHAR(12)'#10' DECLARE @PROMEDIO INT'#10' DECLARE @GRUPOCODIGO VARCHAR(10' +
              ')'#10' DECLARE @GRUPO VARCHAR(50)'#10' DECLARE @CICLO VARCHAR(50)'#10' DECLA' +
              'RE @IDCALIFICACION INT'#10' DECLARE @IDMATERIA INT'#10' DECLARE @IDHISTO' +
              'RIALALUMNO INT'#10' DECLARE @IDHISTORIALGRUPO INT'#10' DECLARE @IDTIPOCA' +
              'LIFICACION INT'#10' DECLARE @CALIFICACION FLOAT'#10' DECLARE @CALIFAUX1 ' +
              'FLOAT'#10' DECLARE @CALIFAUX2 FLOAT'#10' DECLARE @STATUS VARCHAR(1)'#10' DEC' +
              'LARE @FALTAS INT'#10' DECLARE @FECHA DATETIME'#10' DECLARE @CALIF01 FLOA' +
              'T'#10' DECLARE @CALIF02 FLOAT'#10' DECLARE @CALIF03 FLOAT'#10' DECLARE @CALI' +
              'F04 FLOAT'#10' DECLARE @CALIF05 FLOAT'#10' DECLARE @CALIF06 FLOAT'#10' DECLA' +
              'RE @CALIF07 FLOAT'#10' DECLARE @CALIF08 FLOAT'#10' DECLARE @CALIF09 FLOA' +
              'T'#10' DECLARE @CALIF10 FLOAT'#10' DECLARE @CALIF11 FLOAT'#10' DECLARE @CALI' +
              'F12 FLOAT'#10' DECLARE @CALIF13 FLOAT'#10' DECLARE @CALIF14 FLOAT'#10' DECLA' +
              'RE @CALIF15 FLOAT'#10' DECLARE @CALIF16 FLOAT'#10' DECLARE @CALIFA01 FLO' +
              'AT'#10' DECLARE @CALIFA02 FLOAT'#10' DECLARE @CALIFA03 FLOAT'#10' DECLARE @C' +
              'ALIFA04 FLOAT'#10' DECLARE @CALIFA05 FLOAT'#10' DECLARE @CALIFA06 FLOAT'#10 +
              ' DECLARE @CALIFA07 FLOAT'#10' DECLARE @CALIFA08 FLOAT'#10' DECLARE @CALI' +
              'FA09 FLOAT'#10' DECLARE @CALIFA10 FLOAT'#10' DECLARE @CALIFA11 FLOAT'#10' DE' +
              'CLARE @CALIFA12 FLOAT'#10' DECLARE @CALIFA13 FLOAT'#10' DECLARE @CALIFA1' +
              '4 FLOAT'#10' DECLARE @CALIFA15 FLOAT'#10' DECLARE @CALIFA16 FLOAT'#10' DECLA' +
              'RE @CALIFB01 FLOAT'#10' DECLARE @CALIFB02 FLOAT'#10' DECLARE @CALIFB03 F' +
              'LOAT'#10' DECLARE @CALIFB04 FLOAT'#10' DECLARE @CALIFB05 FLOAT'#10' DECLARE ' +
              '@CALIFB06 FLOAT'#10' DECLARE @CALIFB07 FLOAT'#10' DECLARE @CALIFB08 FLOA' +
              'T'#10' DECLARE @CALIFB09 FLOAT'#10' DECLARE @CALIFB10 FLOAT'#10' DECLARE @CA' +
              'LIFB11 FLOAT'#10' DECLARE @CALIFB12 FLOAT'#10' DECLARE @CALIFB13 FLOAT'#10' ' +
              'DECLARE @CALIFB14 FLOAT'#10' DECLARE @CALIFB15 FLOAT'#10' DECLARE @CALIF' +
              'B16 FLOAT'#10' DECLARE @FALTAS01 FLOAT'#10' DECLARE @FALTAS02 FLOAT'#10' DEC' +
              'LARE @FALTAS03 FLOAT'#10' DECLARE @FALTAS04 FLOAT'#10' DECLARE @FALTAS05' +
              ' FLOAT'#10' DECLARE @FALTAS06 FLOAT'#10' DECLARE @FALTAS07 FLOAT'#10' DECLAR' +
              'E @FALTAS08 FLOAT'#10' DECLARE @FALTAS09 FLOAT'#10' DECLARE @FALTAS10 FL' +
              'OAT'#10' DECLARE @FALTAS11 FLOAT'#10' DECLARE @FALTAS12 FLOAT'#10' DECLARE @' +
              'FALTAS13 FLOAT'#10' DECLARE @FALTAS14 FLOAT'#10' DECLARE @FALTAS15 FLOAT' +
              #10' DECLARE @FALTAS16 FLOAT'#10' DECLARE @REGU01 FLOAT'#10' DECLARE @REGU0' +
              '2 FLOAT'#10' DECLARE @REGU03 FLOAT'#10' DECLARE @REGU04 FLOAT'#10' DECLARE @' +
              'REGU05 FLOAT'#10' DECLARE @PROM01 FLOAT'#10' DECLARE @PROM02 FLOAT'#10' DECL' +
              'ARE @PROM03 FLOAT'#10' DECLARE @PROM04 FLOAT'#10' DECLARE @PROM05 FLOAT'#10 +
              ' DECLARE @PROM06 FLOAT'#10' DECLARE @PROM07 FLOAT'#10' DECLARE @PROM08 F' +
              'LOAT'#10' DECLARE @PROM09 FLOAT'#10' DECLARE @PROM10 FLOAT'#10' DECLARE @PRO' +
              'M11 FLOAT'#10' DECLARE @PROM12 FLOAT'#10' DECLARE @PROM13 FLOAT'#10' DECLARE' +
              ' @PROM14 FLOAT'#10' DECLARE @PROM15 FLOAT'#10' DECLARE @PROM16 FLOAT'#10' DE' +
              'CLARE @NOTA01 VARCHAR(250)'#10' DECLARE @NOTA02 VARCHAR(250)'#10' DECLAR' +
              'E @NOTA03 VARCHAR(250)'#10' DECLARE @NOTA04 VARCHAR(250)'#10' DECLARE @N' +
              'OTA05 VARCHAR(250)'#10' DECLARE @NOTA06 VARCHAR(250)'#10' DECLARE @NOTA0' +
              '7 VARCHAR(250)'#10' DECLARE @NOTA08 VARCHAR(250)'#10' DECLARE @NOTA09 VA' +
              'RCHAR(250)'#10' DECLARE @NOTA10 VARCHAR(250)'#10' DECLARE @NOTA11 VARCHA' +
              'R(250)'#10' DECLARE @NOTA12 VARCHAR(250)'#10' DECLARE @NOTA13 VARCHAR(25' +
              '0)'#10' DECLARE @NOTA14 VARCHAR(250)'#10' DECLARE @NOTA15 VARCHAR(250)'#10' ' +
              'DECLARE @NOTA16 VARCHAR(250)'#10' '#10#10'declare CursorBoletaInterna SCRO' +
              'LL CURSOR FOR'#10'SELECT'#10'      MATERIA.NOMBRE AS MATERIA,'#10'      MATE' +
              'RIA.CODIGO AS MATERIACODIGO,'#10'      MATERIA.ORDENINTERNO,'#10'      A' +
              'LUMNO.NOMBRE,'#10'      ALUMNO.NUMCONTROL,'#10'      MATERIA.PROMEDIO,'#10' ' +
              '     GRUPO.CODIGO AS GRUPOCODIGO,'#10'      GRUPO.NOMBRE AS GRUPO,'#10' ' +
              '     CICLO.CODIGO AS CICLO,'#10'      CALIFICACION.IDCALIFICACION,'#10' ' +
              '     CALIFICACION.IDMATERIA,'#10'      CALIFICACION.IDHISTORIALALUMN' +
              'O,'#10'      CALIFICACION.IDHISTORIALGRUPO,'#10'      CALIFICACION.IDTIP' +
              'OCALIFICACION,'#10'      CALIFICACION.CALIFICACION,'#10'      CALIFICACI' +
              'ON.CALIFAUX1,'#10'      CALIFICACION.CALIFAUX2,'#10'      CALIFICACION.S' +
              'TATUS,'#10'      CALIFICACION.FALTAS,'#10'      CALIFICACION.FECHA,'#10'    ' +
              '  CALIFICACION.CALIF01,'#10'      CALIFICACION.CALIF02,'#10'      CALIFI' +
              'CACION.CALIF03,'#10'      CALIFICACION.CALIF04,'#10'      CALIFICACION.C' +
              'ALIF05,'#10'      CALIFICACION.CALIF06,'#10'      CALIFICACION.CALIF07,'#10 +
              '      CALIFICACION.CALIF08,'#10'      CALIFICACION.CALIF09,'#10'      CA' +
              'LIFICACION.CALIF10,'#10'      CALIFICACION.CALIF11,'#10'      CALIFICACI' +
              'ON.CALIF12,'#10'      CALIFICACION.CALIF13,'#10'      CALIFICACION.CALIF' +
              '14,'#10'      CALIFICACION.CALIF15,'#10'      CALIFICACION.CALIF16,'#10'    ' +
              '  CALIFICACION.CALIFA01,'#10'      CALIFICACION.CALIFA02,'#10'      CALI' +
              'FICACION.CALIFA03,'#10'      CALIFICACION.CALIFA04,'#10'      CALIFICACI' +
              'ON.CALIFA05,'#10'      CALIFICACION.CALIFA06,'#10'      CALIFICACION.CAL' +
              'IFA07,'#10'      CALIFICACION.CALIFA08,'#10'      CALIFICACION.CALIFA09,' +
              #10'      CALIFICACION.CALIFA10,'#10'      CALIFICACION.CALIFA11,'#10'     ' +
              ' CALIFICACION.CALIFA12,'#10'      CALIFICACION.CALIFA13,'#10'      CALIF' +
              'ICACION.CALIFA14,'#10'      CALIFICACION.CALIFA15,'#10'      CALIFICACIO' +
              'N.CALIFA16,'#10'      CALIFICACION.CALIFB01,'#10'      CALIFICACION.CALI' +
              'FB02,'#10'      CALIFICACION.CALIFB03,'#10'      CALIFICACION.CALIFB04,'#10 +
              '      CALIFICACION.CALIFB05,'#10'      CALIFICACION.CALIFB06,'#10'      ' +
              'CALIFICACION.CALIFB07,'#10'      CALIFICACION.CALIFB08,'#10'      CALIFI' +
              'CACION.CALIFB09,'#10'      CALIFICACION.CALIFB10,'#10'      CALIFICACION' +
              '.CALIFB11,'#10'      CALIFICACION.CALIFB12,'#10'      CALIFICACION.CALIF' +
              'B13,'#10'      CALIFICACION.CALIFB14,'#10'      CALIFICACION.CALIFB15,'#10' ' +
              '     CALIFICACION.CALIFB16,'#10'      CALIFICACION.FALTAS01,'#10'      C' +
              'ALIFICACION.FALTAS02,'#10'      CALIFICACION.FALTAS03,'#10'      CALIFIC' +
              'ACION.FALTAS04,'#10'      CALIFICACION.FALTAS05,'#10'      CALIFICACION.' +
              'FALTAS06,'#10'      CALIFICACION.FALTAS07,'#10'      CALIFICACION.FALTAS' +
              '08,'#10'      CALIFICACION.FALTAS09,'#10'      CALIFICACION.FALTAS10,'#10'  ' +
              '    CALIFICACION.FALTAS11,'#10'      CALIFICACION.FALTAS12,'#10'      CA' +
              'LIFICACION.FALTAS13,'#10'      CALIFICACION.FALTAS14,'#10'      CALIFICA' +
              'CION.FALTAS15,'#10'      CALIFICACION.FALTAS16,'#10'      CALIFICACION.R' +
              'EGU01,'#10'      CALIFICACION.REGU02,'#10'      CALIFICACION.REGU03,'#10'   ' +
              '   CALIFICACION.REGU04,'#10'      CALIFICACION.REGU05,'#10'      CALIFIC' +
              'ACION.NOTA01,'#10'      CALIFICACION.NOTA02,'#10'      CALIFICACION.NOTA' +
              '03,'#10'      CALIFICACION.NOTA04,'#10'      CALIFICACION.NOTA05,'#10'      ' +
              'CALIFICACION.NOTA06,'#10'      CALIFICACION.NOTA07,'#10'      CALIFICACI' +
              'ON.NOTA08,'#10'      CALIFICACION.NOTA09,'#10'      CALIFICACION.NOTA10,' +
              #10'      CALIFICACION.NOTA11,'#10'      CALIFICACION.NOTA12,'#10'      CAL' +
              'IFICACION.NOTA13,'#10'      CALIFICACION.NOTA14,'#10'      CALIFICACION.' +
              'NOTA15,'#10'      CALIFICACION.NOTA16'#10'    FROM'#10'      CALIFICACION'#10'  ' +
              '    INNER JOIN MATERIA ON (CALIFICACION.IDMATERIA = MATERIA.IDMA' +
              'TERIA)'#10'      INNER JOIN HISTORIALALUMNO ON (CALIFICACION.IDHISTO' +
              'RIALALUMNO = HISTORIALALUMNO.IDHISTORIALALUMNO)'#10'      INNER JOIN' +
              ' ALUMNO ON (HISTORIALALUMNO.IDALUMNO = ALUMNO.IDALUMNO)'#10'      IN' +
              'NER JOIN HISTORIALGRUPO ON (HISTORIALALUMNO.IDHISTORIALGRUPO = H' +
              'ISTORIALGRUPO.IDHISTORIALGRUPO)'#10'      INNER JOIN GRUPO ON (HISTO' +
              'RIALGRUPO.IDGRUPO = GRUPO.IDGRUPO)'#10'      INNER JOIN CICLO ON (HI' +
              'STORIALGRUPO.IDCICLO = CICLO.IDCICLO)'#10'    WHERE'#10'      (HISTORIAL' +
              'ALUMNO.IDHISTORIALALUMNO = :Cual) AND (MATERIA.ORDENINTERNO < 0)' +
              #10'    ORDER BY'#10'      MATERIA.ORDENINTERNO'#10#10'open CursorBoletaInter' +
              'na'#10'fetch next from CursorBoletaInterna'#10'into @MATERIA, @MATERIACO' +
              'DIGO,@ORDEN, @NOMBRE, @NUMCONTROL, @PROMEDIO, @GRUPOCODIGO, @GRU' +
              'PO, @CICLO,'#10'     @IDCALIFICACION, @IDMATERIA, @IDHISTORIALALUMNO' +
              ', @IDHISTORIALGRUPO, @IDTIPOCALIFICACION, @CALIFICACION,'#10'     @C' +
              'ALIFAUX1, @CALIFAUX2, @STATUS, @FALTAS, @FECHA, @CALIF01, @CALIF' +
              '02, @CALIF03, @CALIF04, @CALIF05,'#10'     @CALIF06, @CALIF07, @CALI' +
              'F08, @CALIF09, @CALIF10, @CALIF11, @CALIF12, @CALIF13, @CALIF14,' +
              ' @CALIF15,'#10'     @CALIF16, @CALIFA01, @CALIFA02, @CALIFA03, @CALI' +
              'FA04, @CALIFA05, @CALIFA06, @CALIFA07, @CALIFA08, @CALIFA09,'#10'   ' +
              '  @CALIFA10, @CALIFA11, @CALIFA12, @CALIFA13, @CALIFA14, @CALIFA' +
              '15, @CALIFA16, @CALIFB01, @CALIFB02, @CALIFB03,'#10'     @CALIFB04, ' +
              '@CALIFB05, @CALIFB06, @CALIFB07, @CALIFB08, @CALIFB09, @CALIFB10' +
              ', @CALIFB11, @CALIFB12, @CALIFB13,'#10'     @CALIFB14, @CALIFB15, @C' +
              'ALIFB16, @FALTAS01, @FALTAS02, @FALTAS03, @FALTAS04, @FALTAS05, ' +
              '@FALTAS06, @FALTAS07,'#10'     @FALTAS08, @FALTAS09, @FALTAS10, @FAL' +
              'TAS11, @FALTAS12, @FALTAS13, @FALTAS14, @FALTAS15, @FALTAS16, @R' +
              'EGU01,'#10'     @REGU02, @REGU03, @REGU04, @REGU05, @NOTA01, @NOTA02' +
              ', @NOTA03,@NOTA04,@NOTA05,@NOTA06,@NOTA07,@NOTA08,@NOTA09,'#10'     ' +
              '@NOTA10,@NOTA11,@NOTA12,@NOTA13,@NOTA14,@NOTA15,@NOTA16'#10'while @@' +
              'fetch_status = 0'#10'begin'#10'   declare CursorCalif SCROLL CURSOR FOR'#10 +
              '   SELECT AVG(CALIF01), AVG(CALIF02), AVG(CALIF03), AVG(CALIF04)' +
              ', AVG(CALIF05),'#10'          AVG(CALIF06), AVG(CALIF07), AVG(CALIF0' +
              '8), AVG(CALIF09), AVG(CALIF10),'#10'          AVG(CALIF11), AVG(CALI' +
              'F12), AVG(CALIF13), AVG(CALIF14), AVG(CALIF15),'#10'          AVG(CA' +
              'LIF16) FROM CALIFICACION'#10'   WHERE IDMATERIA = @IDMATERIA AND IDH' +
              'ISTORIALGRUPO = @IDHISTORIALGRUPO'#10#10'   open CursorCalif'#10#10'   fetch' +
              ' next from CursorCalif'#10'   into @PROM01, @PROM02, @PROM03, @PROM0' +
              '4, @PROM05, @PROM06, @PROM07, @PROM08, @PROM09, @PROM10,'#10'       ' +
              ' @PROM11, @PROM12, @PROM13, @PROM14, @PROM15, @PROM16'#10#10'   DEALLO' +
              'CATE CursorCalif'#10'   INSERT INTO #TEMP1(MATERIA, MATERIACODIGO, N' +
              'OMBRE, NUMCONTROL, PROMEDIO, GRUPOCODIGO, GRUPO, CICLO,'#10'        ' +
              '              IDCALIFICACION, IDMATERIA, IDHISTORIALALUMNO, IDHI' +
              'STORIALGRUPO, IDTIPOCALIFICACION, CALIFICACION,'#10'                ' +
              '      CALIFAUX1, CALIFAUX2, STATUS, FALTAS, FECHA, CALIF01, CALI' +
              'F02, CALIF03, CALIF04, CALIF05, CALIF06,'#10'                      C' +
              'ALIF07, CALIF08, CALIF09, CALIF10, CALIF11, CALIF12, CALIF13, CA' +
              'LIF14, CALIF15, CALIF16, CALIFA01,'#10'                      CALIFA0' +
              '2, CALIFA03, CALIFA04, CALIFA05, CALIFA06, CALIFA07, CALIFA08, C' +
              'ALIFA09, CALIFA10, CALIFA11,'#10'                      CALIFA12, CAL' +
              'IFA13, CALIFA14, CALIFA15, CALIFA16, CALIFB01, CALIFB02, CALIFB0' +
              '3, CALIFB04, CALIFB05,'#10'                      CALIFB06, CALIFB07,' +
              ' CALIFB08, CALIFB09, CALIFB10, CALIFB11, CALIFB12, CALIFB13, CAL' +
              'IFB14, CALIFB15,'#10'                      CALIFB16, FALTAS01, FALTA' +
              'S02, FALTAS03, FALTAS04, FALTAS05, FALTAS06, FALTAS07, FALTAS08,' +
              ' FALTAS09,'#10'                      FALTAS10, FALTAS11, FALTAS12, F' +
              'ALTAS13, FALTAS14, FALTAS15, FALTAS16, REGU01, REGU02, REGU03, R' +
              'EGU04,'#10'                      REGU05, PROM01, PROM02, PROM03, PRO' +
              'M04, PROM05, PROM06, PROM07, PROM08, PROM09, PROM10, PROM11, PRO' +
              'M12,'#10'                      PROM13, PROM14, PROM15, PROM16, ORDEN' +
              ', NOTA01, NOTA02, NOTA03, NOTA04, NOTA05, NOTA06, NOTA07, NOTA08' +
              ','#10'                      NOTA09, NOTA10, NOTA11, NOTA12, NOTA13, ' +
              'NOTA14, NOTA15, NOTA16)'#10'   VALUES(@MATERIA, @MATERIACODIGO, @NOM' +
              'BRE, @NUMCONTROL, @PROMEDIO, @GRUPOCODIGO, @GRUPO, @CICLO,'#10'     ' +
              '                 @IDCALIFICACION, @IDMATERIA, @IDHISTORIALALUMNO' +
              ', @IDHISTORIALGRUPO, @IDTIPOCALIFICACION, @CALIFICACION,'#10'       ' +
              '               @CALIFAUX1, @CALIFAUX2, @STATUS, @FALTAS, @FECHA,' +
              ' @CALIF01, @CALIF02, @CALIF03, @CALIF04, @CALIF05, @CALIF06,'#10'   ' +
              '                   @CALIF07, @CALIF08, @CALIF09, @CALIF10, @CALI' +
              'F11, @CALIF12, @CALIF13, @CALIF14, @CALIF15, @CALIF16, @CALIFA01' +
              ','#10'                      @CALIFA02, @CALIFA03, @CALIFA04, @CALIFA' +
              '05, @CALIFA06, @CALIFA07, @CALIFA08, @CALIFA09, @CALIFA10, @CALI' +
              'FA11,'#10'                      @CALIFA12, @CALIFA13, @CALIFA14, @CA' +
              'LIFA15, @CALIFA16, @CALIFB01, @CALIFB02, @CALIFB03, @CALIFB04, @' +
              'CALIFB05,'#10'                      @CALIFB06, @CALIFB07, @CALIFB08,' +
              ' @CALIFB09, @CALIFB10, @CALIFB11, @CALIFB12, @CALIFB13, @CALIFB1' +
              '4, @CALIFB15,'#10'                      @CALIFB16, @FALTAS01, @FALTA' +
              'S02, @FALTAS03, @FALTAS04, @FALTAS05, @FALTAS06, @FALTAS07, @FAL' +
              'TAS08, @FALTAS09,'#10'                      @FALTAS10, @FALTAS11, @F' +
              'ALTAS12, @FALTAS13, @FALTAS14, @FALTAS15, @FALTAS16, @REGU01, @R' +
              'EGU02, @REGU03, @REGU04,'#10'                      @REGU05, @PROM01,' +
              ' @PROM02, @PROM03, @PROM04, @PROM05, @PROM06, @PROM07, @PROM08, ' +
              '@PROM09, @PROM10, @PROM11, @PROM12,'#10'                      @PROM1' +
              '3, @PROM14, @PROM15, @PROM16, @ORDEN, @NOTA01, @NOTA02, @NOTA03,' +
              ' @NOTA04, @NOTA05, @NOTA06, @NOTA07, @NOTA08,'#10'                  ' +
              '    @NOTA09, @NOTA10, @NOTA11, @NOTA12, @NOTA13, @NOTA14, @NOTA1' +
              '5, @NOTA16)'#10'fetch next from CursorBoletaInterna'#10'into @MATERIA, @' +
              'MATERIACODIGO,@ORDEN, @NOMBRE, @NUMCONTROL, @PROMEDIO, @GRUPOCOD' +
              'IGO, @GRUPO, @CICLO,'#10'     @IDCALIFICACION, @IDMATERIA, @IDHISTOR' +
              'IALALUMNO, @IDHISTORIALGRUPO, @IDTIPOCALIFICACION, @CALIFICACION' +
              ','#10'     @CALIFAUX1, @CALIFAUX2, @STATUS, @FALTAS, @FECHA, @CALIF0' +
              '1, @CALIF02, @CALIF03, @CALIF04, @CALIF05,'#10'     @CALIF06, @CALIF' +
              '07, @CALIF08, @CALIF09, @CALIF10, @CALIF11, @CALIF12, @CALIF13, ' +
              '@CALIF14, @CALIF15,'#10'     @CALIF16, @CALIFA01, @CALIFA02, @CALIFA' +
              '03, @CALIFA04, @CALIFA05, @CALIFA06, @CALIFA07, @CALIFA08, @CALI' +
              'FA09,'#10'     @CALIFA10, @CALIFA11, @CALIFA12, @CALIFA13, @CALIFA14' +
              ', @CALIFA15, @CALIFA16, @CALIFB01, @CALIFB02, @CALIFB03,'#10'     @C' +
              'ALIFB04, @CALIFB05, @CALIFB06, @CALIFB07, @CALIFB08, @CALIFB09, ' +
              '@CALIFB10, @CALIFB11, @CALIFB12, @CALIFB13,'#10'     @CALIFB14, @CAL' +
              'IFB15, @CALIFB16, @FALTAS01, @FALTAS02, @FALTAS03, @FALTAS04, @F' +
              'ALTAS05, @FALTAS06, @FALTAS07,'#10'     @FALTAS08, @FALTAS09, @FALTA' +
              'S10, @FALTAS11, @FALTAS12, @FALTAS13, @FALTAS14, @FALTAS15, @FAL' +
              'TAS16, @REGU01,'#10'     @REGU02, @REGU03, @REGU04, @REGU05, @NOTA01' +
              ', @NOTA02, @NOTA03, @NOTA04, @NOTA05, @NOTA06, @NOTA07, @NOTA08,' +
              #10'     @NOTA09, @NOTA10, @NOTA11, @NOTA12, @NOTA13, @NOTA14, @NOT' +
              'A15, @NOTA16'#10'end'#10#10'SELECT DISTINCT * FROM #TEMP1'#10'DEALLOCATE Curso' +
              'rBoletaInterna'#10'DROP TABLE #TEMP1'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'MATERIA'
                TableField = 'MATERIA'
              end
              item
                DatasetField = 'MATERIACODIGO'
                TableField = 'MATERIACODIGO'
              end
              item
                DatasetField = 'NOMBRE'
                TableField = 'NOMBRE'
              end
              item
                DatasetField = 'NUMCONTROL'
                TableField = 'NUMCONTROL'
              end
              item
                DatasetField = 'PROMEDIO'
                TableField = 'PROMEDIO'
              end
              item
                DatasetField = 'GRUPOCODIGO'
                TableField = 'GRUPOCODIGO'
              end
              item
                DatasetField = 'GRUPO'
                TableField = 'GRUPO'
              end
              item
                DatasetField = 'CICLO'
                TableField = 'CICLO'
              end
              item
                DatasetField = 'IDCALIFICACION'
                TableField = 'IDCALIFICACION'
              end
              item
                DatasetField = 'IDMATERIA'
                TableField = 'IDMATERIA'
              end
              item
                DatasetField = 'IDHISTORIALALUMNO'
                TableField = 'IDHISTORIALALUMNO'
              end
              item
                DatasetField = 'IDHISTORIALGRUPO'
                TableField = 'IDHISTORIALGRUPO'
              end
              item
                DatasetField = 'IDTIPOCALIFICACION'
                TableField = 'IDTIPOCALIFICACION'
              end
              item
                DatasetField = 'CALIFICACION'
                TableField = 'CALIFICACION'
              end
              item
                DatasetField = 'CALIFAUX1'
                TableField = 'CALIFAUX1'
              end
              item
                DatasetField = 'CALIFAUX2'
                TableField = 'CALIFAUX2'
              end
              item
                DatasetField = 'STATUS'
                TableField = 'STATUS'
              end
              item
                DatasetField = 'FALTAS'
                TableField = 'FALTAS'
              end
              item
                DatasetField = 'FECHA'
                TableField = 'FECHA'
              end
              item
                DatasetField = 'CALIF01'
                TableField = 'CALIF01'
              end
              item
                DatasetField = 'CALIF02'
                TableField = 'CALIF02'
              end
              item
                DatasetField = 'CALIF03'
                TableField = 'CALIF03'
              end
              item
                DatasetField = 'CALIF04'
                TableField = 'CALIF04'
              end
              item
                DatasetField = 'CALIF05'
                TableField = 'CALIF05'
              end
              item
                DatasetField = 'CALIF06'
                TableField = 'CALIF06'
              end
              item
                DatasetField = 'CALIF07'
                TableField = 'CALIF07'
              end
              item
                DatasetField = 'CALIF08'
                TableField = 'CALIF08'
              end
              item
                DatasetField = 'CALIF09'
                TableField = 'CALIF09'
              end
              item
                DatasetField = 'CALIF10'
                TableField = 'CALIF10'
              end
              item
                DatasetField = 'CALIF11'
                TableField = 'CALIF11'
              end
              item
                DatasetField = 'CALIF12'
                TableField = 'CALIF12'
              end
              item
                DatasetField = 'CALIF13'
                TableField = 'CALIF13'
              end
              item
                DatasetField = 'CALIF14'
                TableField = 'CALIF14'
              end
              item
                DatasetField = 'CALIF15'
                TableField = 'CALIF15'
              end
              item
                DatasetField = 'CALIF16'
                TableField = 'CALIF16'
              end
              item
                DatasetField = 'CALIFA01'
                TableField = 'CALIFA01'
              end
              item
                DatasetField = 'CALIFA02'
                TableField = 'CALIFA02'
              end
              item
                DatasetField = 'CALIFA03'
                TableField = 'CALIFA03'
              end
              item
                DatasetField = 'CALIFA04'
                TableField = 'CALIFA04'
              end
              item
                DatasetField = 'CALIFA05'
                TableField = 'CALIFA05'
              end
              item
                DatasetField = 'CALIFA06'
                TableField = 'CALIFA06'
              end
              item
                DatasetField = 'CALIFA07'
                TableField = 'CALIFA07'
              end
              item
                DatasetField = 'CALIFA08'
                TableField = 'CALIFA08'
              end
              item
                DatasetField = 'CALIFA09'
                TableField = 'CALIFA09'
              end
              item
                DatasetField = 'CALIFA10'
                TableField = 'CALIFA10'
              end
              item
                DatasetField = 'CALIFA11'
                TableField = 'CALIFA11'
              end
              item
                DatasetField = 'CALIFA12'
                TableField = 'CALIFA12'
              end
              item
                DatasetField = 'CALIFA13'
                TableField = 'CALIFA13'
              end
              item
                DatasetField = 'CALIFA14'
                TableField = 'CALIFA14'
              end
              item
                DatasetField = 'CALIFA15'
                TableField = 'CALIFA15'
              end
              item
                DatasetField = 'CALIFA16'
                TableField = 'CALIFA16'
              end
              item
                DatasetField = 'CALIFB01'
                TableField = 'CALIFB01'
              end
              item
                DatasetField = 'CALIFB02'
                TableField = 'CALIFB02'
              end
              item
                DatasetField = 'CALIFB03'
                TableField = 'CALIFB03'
              end
              item
                DatasetField = 'CALIFB04'
                TableField = 'CALIFB04'
              end
              item
                DatasetField = 'CALIFB05'
                TableField = 'CALIFB05'
              end
              item
                DatasetField = 'CALIFB06'
                TableField = 'CALIFB06'
              end
              item
                DatasetField = 'CALIFB07'
                TableField = 'CALIFB07'
              end
              item
                DatasetField = 'CALIFB08'
                TableField = 'CALIFB08'
              end
              item
                DatasetField = 'CALIFB09'
                TableField = 'CALIFB09'
              end
              item
                DatasetField = 'CALIFB10'
                TableField = 'CALIFB10'
              end
              item
                DatasetField = 'CALIFB11'
                TableField = 'CALIFB11'
              end
              item
                DatasetField = 'CALIFB12'
                TableField = 'CALIFB12'
              end
              item
                DatasetField = 'CALIFB13'
                TableField = 'CALIFB13'
              end
              item
                DatasetField = 'CALIFB14'
                TableField = 'CALIFB14'
              end
              item
                DatasetField = 'CALIFB15'
                TableField = 'CALIFB15'
              end
              item
                DatasetField = 'CALIFB16'
                TableField = 'CALIFB16'
              end
              item
                DatasetField = 'FALTAS01'
                TableField = 'FALTAS01'
              end
              item
                DatasetField = 'FALTAS02'
                TableField = 'FALTAS02'
              end
              item
                DatasetField = 'FALTAS03'
                TableField = 'FALTAS03'
              end
              item
                DatasetField = 'FALTAS04'
                TableField = 'FALTAS04'
              end
              item
                DatasetField = 'FALTAS05'
                TableField = 'FALTAS05'
              end
              item
                DatasetField = 'FALTAS06'
                TableField = 'FALTAS06'
              end
              item
                DatasetField = 'FALTAS07'
                TableField = 'FALTAS07'
              end
              item
                DatasetField = 'FALTAS08'
                TableField = 'FALTAS08'
              end
              item
                DatasetField = 'FALTAS09'
                TableField = 'FALTAS09'
              end
              item
                DatasetField = 'FALTAS10'
                TableField = 'FALTAS10'
              end
              item
                DatasetField = 'FALTAS11'
                TableField = 'FALTAS11'
              end
              item
                DatasetField = 'FALTAS12'
                TableField = 'FALTAS12'
              end
              item
                DatasetField = 'FALTAS13'
                TableField = 'FALTAS13'
              end
              item
                DatasetField = 'FALTAS14'
                TableField = 'FALTAS14'
              end
              item
                DatasetField = 'FALTAS15'
                TableField = 'FALTAS15'
              end
              item
                DatasetField = 'FALTAS16'
                TableField = 'FALTAS16'
              end
              item
                DatasetField = 'REGU01'
                TableField = 'REGU01'
              end
              item
                DatasetField = 'REGU02'
                TableField = 'REGU02'
              end
              item
                DatasetField = 'REGU03'
                TableField = 'REGU03'
              end
              item
                DatasetField = 'REGU04'
                TableField = 'REGU04'
              end
              item
                DatasetField = 'REGU05'
                TableField = 'REGU05'
              end
              item
                DatasetField = 'PROM01'
                TableField = 'PROM01'
              end
              item
                DatasetField = 'PROM02'
                TableField = 'PROM02'
              end
              item
                DatasetField = 'PROM03'
                TableField = 'PROM03'
              end
              item
                DatasetField = 'PROM04'
                TableField = 'PROM04'
              end
              item
                DatasetField = 'PROM05'
                TableField = 'PROM05'
              end
              item
                DatasetField = 'PROM06'
                TableField = 'PROM06'
              end
              item
                DatasetField = 'PROM07'
                TableField = 'PROM07'
              end
              item
                DatasetField = 'PROM08'
                TableField = 'PROM08'
              end
              item
                DatasetField = 'PROM09'
                TableField = 'PROM09'
              end
              item
                DatasetField = 'PROM10'
                TableField = 'PROM10'
              end
              item
                DatasetField = 'PROM11'
                TableField = 'PROM11'
              end
              item
                DatasetField = 'PROM12'
                TableField = 'PROM12'
              end
              item
                DatasetField = 'PROM13'
                TableField = 'PROM13'
              end
              item
                DatasetField = 'PROM14'
                TableField = 'PROM14'
              end
              item
                DatasetField = 'PROM15'
                TableField = 'PROM15'
              end
              item
                DatasetField = 'PROM16'
                TableField = 'PROM16'
              end
              item
                DatasetField = 'ORDEN'
                TableField = 'ORDEN'
              end
              item
                DatasetField = 'NOTA01'
                TableField = 'NOTA01'
              end
              item
                DatasetField = 'NOTA02'
                TableField = 'NOTA02'
              end
              item
                DatasetField = 'NOTA03'
                TableField = 'NOTA03'
              end
              item
                DatasetField = 'NOTA04'
                TableField = 'NOTA04'
              end
              item
                DatasetField = 'NOTA05'
                TableField = 'NOTA05'
              end
              item
                DatasetField = 'NOTA06'
                TableField = 'NOTA06'
              end
              item
                DatasetField = 'NOTA07'
                TableField = 'NOTA07'
              end
              item
                DatasetField = 'NOTA08'
                TableField = 'NOTA08'
              end
              item
                DatasetField = 'NOTA09'
                TableField = 'NOTA09'
              end
              item
                DatasetField = 'NOTA10'
                TableField = 'NOTA10'
              end
              item
                DatasetField = 'NOTA11'
                TableField = 'NOTA11'
              end
              item
                DatasetField = 'NOTA12'
                TableField = 'NOTA12'
              end
              item
                DatasetField = 'NOTA13'
                TableField = 'NOTA13'
              end
              item
                DatasetField = 'NOTA14'
                TableField = 'NOTA14'
              end
              item
                DatasetField = 'NOTA15'
                TableField = 'NOTA15'
              end
              item
                DatasetField = 'NOTA16'
                TableField = 'NOTA16'
              end>
          end>
        Name = 'spBoletaInterna'
        Fields = <
          item
            Name = 'MATERIA'
            DataType = datString
            Size = 50
          end
          item
            Name = 'MATERIACODIGO'
            DataType = datString
            Size = 10
          end
          item
            Name = 'NOMBRE'
            DataType = datString
            Size = 70
          end
          item
            Name = 'NUMCONTROL'
            DataType = datString
            Size = 12
          end
          item
            Name = 'PROMEDIO'
            DataType = datInteger
          end
          item
            Name = 'GRUPOCODIGO'
            DataType = datString
            Size = 10
          end
          item
            Name = 'GRUPO'
            DataType = datString
            Size = 50
          end
          item
            Name = 'CICLO'
            DataType = datString
            Size = 50
          end
          item
            Name = 'IDCALIFICACION'
            DataType = datInteger
          end
          item
            Name = 'IDMATERIA'
            DataType = datInteger
          end
          item
            Name = 'IDHISTORIALALUMNO'
            DataType = datInteger
          end
          item
            Name = 'IDHISTORIALGRUPO'
            DataType = datInteger
          end
          item
            Name = 'IDTIPOCALIFICACION'
            DataType = datInteger
          end
          item
            Name = 'CALIFICACION'
            DataType = datFloat
          end
          item
            Name = 'CALIFAUX1'
            DataType = datFloat
          end
          item
            Name = 'CALIFAUX2'
            DataType = datFloat
          end
          item
            Name = 'STATUS'
            DataType = datString
            Size = 1
          end
          item
            Name = 'FALTAS'
            DataType = datInteger
          end
          item
            Name = 'FECHA'
            DataType = datDateTime
          end
          item
            Name = 'CALIF01'
            DataType = datFloat
          end
          item
            Name = 'CALIF02'
            DataType = datFloat
          end
          item
            Name = 'CALIF03'
            DataType = datFloat
          end
          item
            Name = 'CALIF04'
            DataType = datFloat
          end
          item
            Name = 'CALIF05'
            DataType = datFloat
          end
          item
            Name = 'CALIF06'
            DataType = datFloat
          end
          item
            Name = 'CALIF07'
            DataType = datFloat
          end
          item
            Name = 'CALIF08'
            DataType = datFloat
          end
          item
            Name = 'CALIF09'
            DataType = datFloat
          end
          item
            Name = 'CALIF10'
            DataType = datFloat
          end
          item
            Name = 'CALIF11'
            DataType = datFloat
          end
          item
            Name = 'CALIF12'
            DataType = datFloat
          end
          item
            Name = 'CALIF13'
            DataType = datFloat
          end
          item
            Name = 'CALIF14'
            DataType = datFloat
          end
          item
            Name = 'CALIF15'
            DataType = datFloat
          end
          item
            Name = 'CALIF16'
            DataType = datFloat
          end
          item
            Name = 'CALIFA01'
            DataType = datFloat
          end
          item
            Name = 'CALIFA02'
            DataType = datFloat
          end
          item
            Name = 'CALIFA03'
            DataType = datFloat
          end
          item
            Name = 'CALIFA04'
            DataType = datFloat
          end
          item
            Name = 'CALIFA05'
            DataType = datFloat
          end
          item
            Name = 'CALIFA06'
            DataType = datFloat
          end
          item
            Name = 'CALIFA07'
            DataType = datFloat
          end
          item
            Name = 'CALIFA08'
            DataType = datFloat
          end
          item
            Name = 'CALIFA09'
            DataType = datFloat
          end
          item
            Name = 'CALIFA10'
            DataType = datFloat
          end
          item
            Name = 'CALIFA11'
            DataType = datFloat
          end
          item
            Name = 'CALIFA12'
            DataType = datFloat
          end
          item
            Name = 'CALIFA13'
            DataType = datFloat
          end
          item
            Name = 'CALIFA14'
            DataType = datFloat
          end
          item
            Name = 'CALIFA15'
            DataType = datFloat
          end
          item
            Name = 'CALIFA16'
            DataType = datFloat
          end
          item
            Name = 'CALIFB01'
            DataType = datFloat
          end
          item
            Name = 'CALIFB02'
            DataType = datFloat
          end
          item
            Name = 'CALIFB03'
            DataType = datFloat
          end
          item
            Name = 'CALIFB04'
            DataType = datFloat
          end
          item
            Name = 'CALIFB05'
            DataType = datFloat
          end
          item
            Name = 'CALIFB06'
            DataType = datFloat
          end
          item
            Name = 'CALIFB07'
            DataType = datFloat
          end
          item
            Name = 'CALIFB08'
            DataType = datFloat
          end
          item
            Name = 'CALIFB09'
            DataType = datFloat
          end
          item
            Name = 'CALIFB10'
            DataType = datFloat
          end
          item
            Name = 'CALIFB11'
            DataType = datFloat
          end
          item
            Name = 'CALIFB12'
            DataType = datFloat
          end
          item
            Name = 'CALIFB13'
            DataType = datFloat
          end
          item
            Name = 'CALIFB14'
            DataType = datFloat
          end
          item
            Name = 'CALIFB15'
            DataType = datFloat
          end
          item
            Name = 'CALIFB16'
            DataType = datFloat
          end
          item
            Name = 'FALTAS01'
            DataType = datFloat
          end
          item
            Name = 'FALTAS02'
            DataType = datFloat
          end
          item
            Name = 'FALTAS03'
            DataType = datFloat
          end
          item
            Name = 'FALTAS04'
            DataType = datFloat
          end
          item
            Name = 'FALTAS05'
            DataType = datFloat
          end
          item
            Name = 'FALTAS06'
            DataType = datFloat
          end
          item
            Name = 'FALTAS07'
            DataType = datFloat
          end
          item
            Name = 'FALTAS08'
            DataType = datFloat
          end
          item
            Name = 'FALTAS09'
            DataType = datFloat
          end
          item
            Name = 'FALTAS10'
            DataType = datFloat
          end
          item
            Name = 'FALTAS11'
            DataType = datFloat
          end
          item
            Name = 'FALTAS12'
            DataType = datFloat
          end
          item
            Name = 'FALTAS13'
            DataType = datFloat
          end
          item
            Name = 'FALTAS14'
            DataType = datFloat
          end
          item
            Name = 'FALTAS15'
            DataType = datFloat
          end
          item
            Name = 'FALTAS16'
            DataType = datFloat
          end
          item
            Name = 'REGU01'
            DataType = datFloat
          end
          item
            Name = 'REGU02'
            DataType = datFloat
          end
          item
            Name = 'REGU03'
            DataType = datFloat
          end
          item
            Name = 'REGU04'
            DataType = datFloat
          end
          item
            Name = 'REGU05'
            DataType = datFloat
          end
          item
            Name = 'PROM01'
            DataType = datFloat
          end
          item
            Name = 'PROM02'
            DataType = datFloat
          end
          item
            Name = 'PROM03'
            DataType = datFloat
          end
          item
            Name = 'PROM04'
            DataType = datFloat
          end
          item
            Name = 'PROM05'
            DataType = datFloat
          end
          item
            Name = 'PROM06'
            DataType = datFloat
          end
          item
            Name = 'PROM07'
            DataType = datFloat
          end
          item
            Name = 'PROM08'
            DataType = datFloat
          end
          item
            Name = 'PROM09'
            DataType = datFloat
          end
          item
            Name = 'PROM10'
            DataType = datFloat
          end
          item
            Name = 'PROM11'
            DataType = datFloat
          end
          item
            Name = 'PROM12'
            DataType = datFloat
          end
          item
            Name = 'PROM13'
            DataType = datFloat
          end
          item
            Name = 'PROM14'
            DataType = datFloat
          end
          item
            Name = 'PROM15'
            DataType = datFloat
          end
          item
            Name = 'PROM16'
            DataType = datFloat
          end
          item
            Name = 'ORDEN'
            DataType = datInteger
          end
          item
            Name = 'NOTA01'
            DataType = datString
            Size = 250
          end
          item
            Name = 'NOTA02'
            DataType = datString
            Size = 250
          end
          item
            Name = 'NOTA03'
            DataType = datString
            Size = 250
          end
          item
            Name = 'NOTA04'
            DataType = datString
            Size = 250
          end
          item
            Name = 'NOTA05'
            DataType = datString
            Size = 250
          end
          item
            Name = 'NOTA06'
            DataType = datString
            Size = 250
          end
          item
            Name = 'NOTA07'
            DataType = datString
            Size = 250
          end
          item
            Name = 'NOTA08'
            DataType = datString
            Size = 250
          end
          item
            Name = 'NOTA09'
            DataType = datString
            Size = 250
          end
          item
            Name = 'NOTA10'
            DataType = datString
            Size = 250
          end
          item
            Name = 'NOTA11'
            DataType = datString
            Size = 250
          end
          item
            Name = 'NOTA12'
            DataType = datString
            Size = 250
          end
          item
            Name = 'NOTA13'
            DataType = datString
            Size = 250
          end
          item
            Name = 'NOTA14'
            DataType = datString
            Size = 250
          end
          item
            Name = 'NOTA15'
            DataType = datString
            Size = 250
          end
          item
            Name = 'NOTA16'
            DataType = datString
            Size = 250
          end>
      end
      item
        Params = <
          item
            Name = 'idalumno'
            Value = '1'
            ParamType = daptInput
          end
          item
            Name = 'idciclo'
            Value = '5'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
            SQL = 
              'DECLARE @EXISTE AS INT'#10#10'SELECT @EXISTE = (SELECT COUNT( HISTORIA' +
              'LALUMNO.IDALUMNO )'#10'FROM HISTORIALGRUPO'#10'   INNER JOIN HISTORIALAL' +
              'UMNO ON (HISTORIALGRUPO.IDHISTORIALGRUPO = HISTORIALALUMNO.IDHIS' +
              'TORIALGRUPO)'#10'WHERE'#10'   ('#10'      (HISTORIALALUMNO.IDALUMNO = :idalu' +
              'mno)'#10'   and'#10'      (HISTORIALGRUPO.IDCICLO = :idciclo)'#10'   ))'#10#10'SEL' +
              'ECT @EXISTE AS EXISTE'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'EXISTE'
                TableField = 'EXISTE'
              end>
          end>
        Name = 'spExisteAlumno'
        Fields = <
          item
            Name = 'EXISTE'
            DataType = datInteger
          end>
      end
      item
        Params = <
          item
            Name = 'idAlumno'
            Value = '1'
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
            SQL = 
              'select idAlumno, NumControl, Nombre from Alumno'#10'where idAlumno =' +
              ' :idAlumno'#10#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'idAlumno'
                TableField = 'idAlumno'
              end
              item
                DatasetField = 'NumControl'
                TableField = 'NumControl'
              end
              item
                DatasetField = 'Nombre'
                TableField = 'Nombre'
              end>
          end>
        Name = 'spAlumno'
        Fields = <
          item
            Name = 'idAlumno'
            DataType = datInteger
          end
          item
            Name = 'NumControl'
            DataType = datString
            Size = 12
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
            Name = 'idciclo'
            Value = '5'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
            SQL = 
              'select * from'#10'(/*vwhistorialgrupo*/'#10'SELECT HISTORIALGRUPO.IDHIST' +
              'ORIALGRUPO,'#10'       NIVEL.IDNIVEL,'#10'       CICLO.IDCICLO,'#10'       G' +
              'RUPO.IDGRUPO,'#10'       GRUPO.CODIGO AS GRUPOCODIGO,'#10'       GRUPO.N' +
              'OMBRE AS GRUPONOMBRE,'#10'       GRUPO.NOMBREaux1 AS GRUPOaux1,'#10'    ' +
              '   GRUPO.NOMBREaux2 AS GRUPOaux2,'#10'       grupo.cupo,'#10'       NIVE' +
              'L.CODIGO AS NIVELCODIGO,'#10'       NIVEL.NOMBRE AS NIVELNOMBRE,'#10'   ' +
              '    NIVEL.NOMBREaux1 AS NIVELaux1,'#10'       NIVEL.NOMBREaux2 AS NI' +
              'VELaux2,'#10'       CICLO.CODIGO AS CICLOCODIGO,'#10'       CICLO.NOMBRE' +
              ' AS CICLONOMBRE,'#10'       CICLO.NOMBREaux1 AS CICLOaux1,'#10'       CI' +
              'CLO.NOMBREaux2 AS CICLOaux2,'#10'       CICLO.FECHAFINAL AS CICLOFEC' +
              'HAFINAL,'#10'       CICLO.FECHAINICIO AS CICLOFECHAINICIO'#10'FROM GRUPO' +
              #10'   INNER JOIN NIVEL ON (GRUPO.IDNIVEL = NIVEL.IDNIVEL)'#10'   INNER' +
              ' JOIN HISTORIALGRUPO ON (GRUPO.IDGRUPO = HISTORIALGRUPO.IDGRUPO)' +
              #10'   INNER JOIN CICLO ON (HISTORIALGRUPO.IDCICLO = CICLO.IDCICLO)' +
              ')'#10'VWHISTORIALGRUPO'#10'where idciclo = :idciclo'#10'order by GRUPOCODIGO' +
              #10#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDHISTORIALGRUPO'
                TableField = 'IDHISTORIALGRUPO'
              end
              item
                DatasetField = 'IDNIVEL'
                TableField = 'IDNIVEL'
              end
              item
                DatasetField = 'IDCICLO'
                TableField = 'IDCICLO'
              end
              item
                DatasetField = 'IDGRUPO'
                TableField = 'IDGRUPO'
              end
              item
                DatasetField = 'GRUPOCODIGO'
                TableField = 'GRUPOCODIGO'
              end
              item
                DatasetField = 'GRUPONOMBRE'
                TableField = 'GRUPONOMBRE'
              end
              item
                DatasetField = 'GRUPOaux1'
                TableField = 'GRUPOaux1'
              end
              item
                DatasetField = 'GRUPOaux2'
                TableField = 'GRUPOaux2'
              end
              item
                DatasetField = 'cupo'
                TableField = 'cupo'
              end
              item
                DatasetField = 'NIVELCODIGO'
                TableField = 'NIVELCODIGO'
              end
              item
                DatasetField = 'NIVELNOMBRE'
                TableField = 'NIVELNOMBRE'
              end
              item
                DatasetField = 'NIVELaux1'
                TableField = 'NIVELaux1'
              end
              item
                DatasetField = 'NIVELaux2'
                TableField = 'NIVELaux2'
              end
              item
                DatasetField = 'CICLOCODIGO'
                TableField = 'CICLOCODIGO'
              end
              item
                DatasetField = 'CICLONOMBRE'
                TableField = 'CICLONOMBRE'
              end
              item
                DatasetField = 'CICLOaux1'
                TableField = 'CICLOaux1'
              end
              item
                DatasetField = 'CICLOaux2'
                TableField = 'CICLOaux2'
              end
              item
                DatasetField = 'CICLOFECHAFINAL'
                TableField = 'CICLOFECHAFINAL'
              end
              item
                DatasetField = 'CICLOFECHAINICIO'
                TableField = 'CICLOFECHAINICIO'
              end>
          end>
        Name = 'spGrupoInscripcion'
        Fields = <
          item
            Name = 'IDHISTORIALGRUPO'
            DataType = datInteger
          end
          item
            Name = 'IDNIVEL'
            DataType = datInteger
          end
          item
            Name = 'IDCICLO'
            DataType = datInteger
          end
          item
            Name = 'IDGRUPO'
            DataType = datInteger
          end
          item
            Name = 'GRUPOCODIGO'
            DataType = datString
            Size = 10
          end
          item
            Name = 'GRUPONOMBRE'
            DataType = datString
            Size = 50
          end
          item
            Name = 'GRUPOaux1'
            DataType = datString
            Size = 50
          end
          item
            Name = 'GRUPOaux2'
            DataType = datString
            Size = 50
          end
          item
            Name = 'cupo'
            DataType = datInteger
          end
          item
            Name = 'NIVELCODIGO'
            DataType = datString
            Size = 10
          end
          item
            Name = 'NIVELNOMBRE'
            DataType = datString
            Size = 50
          end
          item
            Name = 'NIVELaux1'
            DataType = datString
            Size = 50
          end
          item
            Name = 'NIVELaux2'
            DataType = datString
            Size = 50
          end
          item
            Name = 'CICLOCODIGO'
            DataType = datString
            Size = 10
          end
          item
            Name = 'CICLONOMBRE'
            DataType = datString
            Size = 50
          end
          item
            Name = 'CICLOaux1'
            DataType = datString
            Size = 50
          end
          item
            Name = 'CICLOaux2'
            DataType = datString
            Size = 50
          end
          item
            Name = 'CICLOFECHAFINAL'
            DataType = datDateTime
          end
          item
            Name = 'CICLOFECHAINICIO'
            DataType = datDateTime
          end>
      end
      item
        Params = <
          item
            Name = 'idgrupo'
            Value = '2'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
            SQL = 
              'SELECT DISTINCT IDGRUPO, IDMATERIA, GRUPONOMBRE, GRUPOCODIGO, MA' +
              'TERIACODIGO, MATERIANOMBRE'#10'FROM'#10'--vwnivelgrupomateriapago'#10'('#10'SELE' +
              'CT VWNIVELGRUPOMATERIA.IDNIVEL,'#10'       VWNIVELGRUPOMATERIA.IDGRU' +
              'PO,'#10'       VWNIVELGRUPOMATERIA.IDMATERIA,'#10'       VWNIVELGRUPOMAT' +
              'ERIA.IDMAESTRO,'#10'       VWNIVELGRUPOMATERIA.NIVELNOMBRE,'#10'       V' +
              'WNIVELGRUPOMATERIA.NIVELCODIGO,'#10'       VWNIVELGRUPOMATERIA.NIVEL' +
              'aux1,'#10'       VWNIVELGRUPOMATERIA.NIVELaux2,'#10'       VWNIVELGRUPOM' +
              'ATERIA.GRUPONOMBRE,'#10'       VWNIVELGRUPOMATERIA.GRUPOCODIGO,'#10'    ' +
              '   VWNIVELGRUPOMATERIA.GRUPOaux1,'#10'       VWNIVELGRUPOMATERIA.GRU' +
              'POaux2,'#10#9'   VWNIVELGRUPOMATERIA.CUPO,'#10'       VWNIVELGRUPOMATERIA' +
              '.MATERIACODIGO,'#10'       VWNIVELGRUPOMATERIA.MATERIANOMBRE,'#10'      ' +
              ' VWGRUPOPAGO.IDSUBTIPOPAGO,'#10'       VWGRUPOPAGO.SUBTIPONOMBRE'#10'FRO' +
              'M'#10'(--vwgrupopago'#10'SELECT GRUPOPAGO.IDGRUPO,'#10'       GRUPOPAGO.IDSU' +
              'BTIPOPAGO,'#10'       VWTIPOPAGO.TIPOCODIGO,'#10'       VWTIPOPAGO.TIPON' +
              'OMBRE,'#10'       vwtipopago.aplicabeca,'#10'       vwtipopago.aplicades' +
              'cuento,'#10'       VWTIPOPAGO.SUBTIPOCODIGO,'#10'       VWTIPOPAGO.SUBTI' +
              'PONOMBRE,'#10'       VWTIPOPAGO.FECHA,'#10'       VWTIPOPAGO.NUMPAGOS,'#10' ' +
              '      VWTIPOPAGO.IMPORTE,'#10'       VWTIPOPAGO.PLAZO'#10'FROM GRUPOPAGO' +
              #10'   INNER JOIN'#10'(--vwtipopago'#10'SELECT TIPOSPAGO.IDTIPOPAGO,'#10'      ' +
              ' TIPOSPAGO.CODIGO AS TIPOCODIGO,'#10'       TIPOSPAGO.NOMBRE AS TIPO' +
              'NOMBRE,'#10'       tipospago.aplicabeca,'#10'       tipospago.aplicadesc' +
              'uento,'#10'       SUBTIPOPAGO.IDSUBTIPOPAGO,'#10'       SUBTIPOPAGO.CODI' +
              'GO AS SUBTIPOCODIGO,'#10'       SUBTIPOPAGO.NOMBRE AS SUBTIPONOMBRE,' +
              #10'       SUBTIPOPAGO.FECHA,'#10'       SUBTIPOPAGO.NUMPAGOS,'#10'       S' +
              'UBTIPOPAGO.PLAZO,'#10'       SUBTIPOPAGO.IMPORTE'#10'FROM SUBTIPOPAGO'#10'  ' +
              ' RIGHT OUTER JOIN TIPOSPAGO ON (SUBTIPOPAGO.IDTIPOPAGO = TIPOSPA' +
              'GO.IDTIPOPAGO))'#10'VWTIPOPAGO'#10'ON (GRUPOPAGO.IDSUBTIPOPAGO ='#10'VWTIPOP' +
              'AGO.IDSUBTIPOPAGO))'#10'VWGRUPOPAGO'#10'   RIGHT OUTER JOIN'#10'(--vwnivelgr' +
              'upomateria'#10'  SELECT VWNIVELGRUPO.IDNIVEL,'#10'       VWNIVELGRUPO.ID' +
              'GRUPO,'#10'       VWGRUPOMATERIA.IDMATERIA,'#10'       VWGRUPOMATERIA.ID' +
              'MAESTRO,'#10'       VWNIVELGRUPO.NIVELNOMBRE,'#10'       VWNIVELGRUPO.NI' +
              'VELCODIGO,'#10'       VWNIVELGRUPO.NIVELaux1,'#10'       VWNIVELGRUPO.NI' +
              'VELaux2,'#10'       VWNIVELGRUPO.GRUPONOMBRE,'#10'       VWNIVELGRUPO.GR' +
              'UPOCODIGO,'#10'       VWNIVELGRUPO.GRUPOaux1,'#10'       VWNIVELGRUPO.GR' +
              'UPOaux2,'#10'       VWNIVELGRUPO.CUPO,'#10'       VWGRUPOMATERIA.MATERIA' +
              'CODIGO,'#10'       VWGRUPOMATERIA.MATERIANOMBRE'#10'FROM'#10'(--vwgrupoMater' +
              'ia'#10'SELECT MATERIAGRUPO.IDGRUPO,'#10'       materiagrupo.idmaestro,'#10' ' +
              '      MATERIAGRUPO.IDMATERIA,'#10'       MATERIA.CODIGO AS MATERIACO' +
              'DIGO,'#10'       MATERIA.NOMBRE AS MATERIANOMBRE,'#10'       materia.hor' +
              'asxsemana,'#10'       MATERIA.NOMBREAUX1,'#10'       MATERIA.NOMBREAUX2'#10 +
              'FROM MATERIA'#10'   INNER JOIN MATERIAGRUPO ON (MATERIA.IDMATERIA = ' +
              'MATERIAGRUPO.IDMATERIA))'#10'VWGRUPOMATERIA'#10'   RIGHT OUTER JOIN'#10'(--v' +
              'wnivelgrupo'#10'SELECT NIVEL.IDNIVEL,'#10'       GRUPO.IDGRUPO,'#10'       N' +
              'IVEL.NOMBRE AS NIVELNOMBRE,'#10'       NIVEL.CODIGO AS NIVELCODIGO,'#10 +
              '       nivel.nombreaux1 as nivelaux1,'#10'       nivel.nombreaux2 as' +
              ' nivelaux2,'#10'       GRUPO.NOMBRE AS GRUPONOMBRE,'#10'       GRUPO.COD' +
              'IGO AS GRUPOCODIGO,'#10'       grupo.nombreaux1 as grupoaux1,'#10'      ' +
              ' grupo.nombreaux2 as grupoaux2,'#10'       GRUPO.CUPO'#10'FROM GRUPO'#10'   ' +
              'RIGHT OUTER JOIN NIVEL ON (GRUPO.IDNIVEL = NIVEL.IDNIVEL))'#10'VWNIV' +
              'ELGRUPO ON (VWGRUPOMATERIA.IDGRUPO ='#10#10'VWNIVELGRUPO.IDGRUPO))'#10'VWN' +
              'IVELGRUPOMATERIA ON (VWGRUPOPAGO.IDGRUPO = VWNIVELGRUPOMATERIA.I' +
              'DGRUPO)'#10')'#10'VWNIVELGRUPOMATERIAPAGO'#10#10#10#10#10'WHERE  (IDMATERIA >= 0 ) a' +
              'nd (idgrupo = :idgrupo)'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDGRUPO'
                TableField = 'IDGRUPO'
              end
              item
                DatasetField = 'IDMATERIA'
                TableField = 'IDMATERIA'
              end
              item
                DatasetField = 'GRUPONOMBRE'
                TableField = 'GRUPONOMBRE'
              end
              item
                DatasetField = 'GRUPOCODIGO'
                TableField = 'GRUPOCODIGO'
              end
              item
                DatasetField = 'MATERIACODIGO'
                TableField = 'MATERIACODIGO'
              end
              item
                DatasetField = 'MATERIANOMBRE'
                TableField = 'MATERIANOMBRE'
              end>
          end>
        Name = 'spNivelGrupoMateriaPago'
        Fields = <
          item
            Name = 'IDGRUPO'
            DataType = datInteger
          end
          item
            Name = 'IDMATERIA'
            DataType = datInteger
          end
          item
            Name = 'GRUPONOMBRE'
            DataType = datString
            Size = 50
          end
          item
            Name = 'GRUPOCODIGO'
            DataType = datString
            Size = 10
          end
          item
            Name = 'MATERIACODIGO'
            DataType = datString
            Size = 10
          end
          item
            Name = 'MATERIANOMBRE'
            DataType = datString
            Size = 50
          end>
      end
      item
        Params = <
          item
            Name = 'idgrupo'
            Value = '2'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
            SQL = 
              'select * from'#10'(--vwgrupopago'#10'SELECT GRUPOPAGO.IDGRUPO,'#10'       GR' +
              'UPOPAGO.IDSUBTIPOPAGO,'#10'       VWTIPOPAGO.TIPOCODIGO,'#10'       VWTI' +
              'POPAGO.TIPONOMBRE,'#10'       vwtipopago.aplicabeca,'#10'       vwtipopa' +
              'go.aplicadescuento,'#10'       VWTIPOPAGO.SUBTIPOCODIGO,'#10'       VWTI' +
              'POPAGO.SUBTIPONOMBRE,'#10'       VWTIPOPAGO.FECHA,'#10'       VWTIPOPAGO' +
              '.NUMPAGOS,'#10'       VWTIPOPAGO.IMPORTE,'#10'       VWTIPOPAGO.PLAZO'#10'FR' +
              'OM GRUPOPAGO'#10'   INNER JOIN'#10'(--vwtipopago'#10'SELECT TIPOSPAGO.IDTIPO' +
              'PAGO,'#10'       TIPOSPAGO.CODIGO AS TIPOCODIGO,'#10'       TIPOSPAGO.NO' +
              'MBRE AS TIPONOMBRE,'#10'       tipospago.aplicabeca,'#10'       tipospag' +
              'o.aplicadescuento,'#10'       SUBTIPOPAGO.IDSUBTIPOPAGO,'#10'       SUBT' +
              'IPOPAGO.CODIGO AS SUBTIPOCODIGO,'#10'       SUBTIPOPAGO.NOMBRE AS SU' +
              'BTIPONOMBRE,'#10'       SUBTIPOPAGO.FECHA,'#10'       SUBTIPOPAGO.NUMPAG' +
              'OS,'#10'       SUBTIPOPAGO.PLAZO,'#10'       SUBTIPOPAGO.IMPORTE'#10'FROM SU' +
              'BTIPOPAGO'#10'   RIGHT OUTER JOIN TIPOSPAGO ON (SUBTIPOPAGO.IDTIPOPA' +
              'GO = TIPOSPAGO.IDTIPOPAGO))'#10'VWTIPOPAGO'#10'ON (GRUPOPAGO.IDSUBTIPOPA' +
              'GO ='#10'VWTIPOPAGO.IDSUBTIPOPAGO))'#10'VWGRUPOPAGO'#10'where idgrupo = :idg' +
              'rupo'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDGRUPO'
                TableField = 'IDGRUPO'
              end
              item
                DatasetField = 'IDSUBTIPOPAGO'
                TableField = 'IDSUBTIPOPAGO'
              end
              item
                DatasetField = 'TIPOCODIGO'
                TableField = 'TIPOCODIGO'
              end
              item
                DatasetField = 'TIPONOMBRE'
                TableField = 'TIPONOMBRE'
              end
              item
                DatasetField = 'aplicabeca'
                TableField = 'aplicabeca'
              end
              item
                DatasetField = 'aplicadescuento'
                TableField = 'aplicadescuento'
              end
              item
                DatasetField = 'SUBTIPOCODIGO'
                TableField = 'SUBTIPOCODIGO'
              end
              item
                DatasetField = 'SUBTIPONOMBRE'
                TableField = 'SUBTIPONOMBRE'
              end
              item
                DatasetField = 'FECHA'
                TableField = 'FECHA'
              end
              item
                DatasetField = 'NUMPAGOS'
                TableField = 'NUMPAGOS'
              end
              item
                DatasetField = 'IMPORTE'
                TableField = 'IMPORTE'
              end
              item
                DatasetField = 'PLAZO'
                TableField = 'PLAZO'
              end>
          end>
        Name = 'spGrupoPago'
        Fields = <
          item
            Name = 'IDGRUPO'
            DataType = datInteger
          end
          item
            Name = 'IDSUBTIPOPAGO'
            DataType = datInteger
          end
          item
            Name = 'TIPOCODIGO'
            DataType = datString
            Size = 10
          end
          item
            Name = 'TIPONOMBRE'
            DataType = datString
            Size = 50
          end
          item
            Name = 'aplicabeca'
            DataType = datInteger
          end
          item
            Name = 'aplicadescuento'
            DataType = datInteger
          end
          item
            Name = 'SUBTIPOCODIGO'
            DataType = datString
            Size = 10
          end
          item
            Name = 'SUBTIPONOMBRE'
            DataType = datString
            Size = 50
          end
          item
            Name = 'FECHA'
            DataType = datDateTime
          end
          item
            Name = 'NUMPAGOS'
            DataType = datInteger
          end
          item
            Name = 'IMPORTE'
            DataType = datFloat
          end
          item
            Name = 'PLAZO'
            DataType = datInteger
          end>
      end
      item
        Params = <
          item
            Name = 'idhistorialalumno'
            Value = '1'
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
            SQL = 
              'select * from calificacion'#10'where idhistorialalumno = :idhistoria' +
              'lalumno'#10'and idtipocalificacion = 1'#10#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDCALIFICACION'
                TableField = 'IDCALIFICACION'
              end
              item
                DatasetField = 'IDMATERIA'
                TableField = 'IDMATERIA'
              end
              item
                DatasetField = 'IDHISTORIALALUMNO'
                TableField = 'IDHISTORIALALUMNO'
              end
              item
                DatasetField = 'IDHISTORIALGRUPO'
                TableField = 'IDHISTORIALGRUPO'
              end
              item
                DatasetField = 'IDTIPOCALIFICACION'
                TableField = 'IDTIPOCALIFICACION'
              end
              item
                DatasetField = 'CALIFICACION'
                TableField = 'CALIFICACION'
              end
              item
                DatasetField = 'CALIFAUX1'
                TableField = 'CALIFAUX1'
              end
              item
                DatasetField = 'CALIFAUX2'
                TableField = 'CALIFAUX2'
              end
              item
                DatasetField = 'STATUS'
                TableField = 'STATUS'
              end
              item
                DatasetField = 'FALTAS'
                TableField = 'FALTAS'
              end
              item
                DatasetField = 'FECHA'
                TableField = 'FECHA'
              end
              item
                DatasetField = 'CALIF01'
                TableField = 'CALIF01'
              end
              item
                DatasetField = 'CALIF02'
                TableField = 'CALIF02'
              end
              item
                DatasetField = 'CALIF03'
                TableField = 'CALIF03'
              end
              item
                DatasetField = 'CALIF04'
                TableField = 'CALIF04'
              end
              item
                DatasetField = 'CALIF05'
                TableField = 'CALIF05'
              end
              item
                DatasetField = 'CALIF06'
                TableField = 'CALIF06'
              end
              item
                DatasetField = 'CALIF07'
                TableField = 'CALIF07'
              end
              item
                DatasetField = 'CALIF08'
                TableField = 'CALIF08'
              end
              item
                DatasetField = 'CALIF09'
                TableField = 'CALIF09'
              end
              item
                DatasetField = 'CALIF10'
                TableField = 'CALIF10'
              end
              item
                DatasetField = 'CALIF11'
                TableField = 'CALIF11'
              end
              item
                DatasetField = 'CALIF12'
                TableField = 'CALIF12'
              end
              item
                DatasetField = 'CALIF13'
                TableField = 'CALIF13'
              end
              item
                DatasetField = 'CALIF14'
                TableField = 'CALIF14'
              end
              item
                DatasetField = 'CALIF15'
                TableField = 'CALIF15'
              end
              item
                DatasetField = 'CALIF16'
                TableField = 'CALIF16'
              end
              item
                DatasetField = 'CALIFA01'
                TableField = 'CALIFA01'
              end
              item
                DatasetField = 'CALIFA02'
                TableField = 'CALIFA02'
              end
              item
                DatasetField = 'CALIFA03'
                TableField = 'CALIFA03'
              end
              item
                DatasetField = 'CALIFA04'
                TableField = 'CALIFA04'
              end
              item
                DatasetField = 'CALIFA05'
                TableField = 'CALIFA05'
              end
              item
                DatasetField = 'CALIFA06'
                TableField = 'CALIFA06'
              end
              item
                DatasetField = 'CALIFA07'
                TableField = 'CALIFA07'
              end
              item
                DatasetField = 'CALIFA08'
                TableField = 'CALIFA08'
              end
              item
                DatasetField = 'CALIFA09'
                TableField = 'CALIFA09'
              end
              item
                DatasetField = 'CALIFA10'
                TableField = 'CALIFA10'
              end
              item
                DatasetField = 'CALIFA11'
                TableField = 'CALIFA11'
              end
              item
                DatasetField = 'CALIFA12'
                TableField = 'CALIFA12'
              end
              item
                DatasetField = 'CALIFA13'
                TableField = 'CALIFA13'
              end
              item
                DatasetField = 'CALIFA14'
                TableField = 'CALIFA14'
              end
              item
                DatasetField = 'CALIFA15'
                TableField = 'CALIFA15'
              end
              item
                DatasetField = 'CALIFA16'
                TableField = 'CALIFA16'
              end
              item
                DatasetField = 'CALIFB01'
                TableField = 'CALIFB01'
              end
              item
                DatasetField = 'CALIFB02'
                TableField = 'CALIFB02'
              end
              item
                DatasetField = 'CALIFB03'
                TableField = 'CALIFB03'
              end
              item
                DatasetField = 'CALIFB04'
                TableField = 'CALIFB04'
              end
              item
                DatasetField = 'CALIFB05'
                TableField = 'CALIFB05'
              end
              item
                DatasetField = 'CALIFB06'
                TableField = 'CALIFB06'
              end
              item
                DatasetField = 'CALIFB07'
                TableField = 'CALIFB07'
              end
              item
                DatasetField = 'CALIFB08'
                TableField = 'CALIFB08'
              end
              item
                DatasetField = 'CALIFB09'
                TableField = 'CALIFB09'
              end
              item
                DatasetField = 'CALIFB10'
                TableField = 'CALIFB10'
              end
              item
                DatasetField = 'CALIFB11'
                TableField = 'CALIFB11'
              end
              item
                DatasetField = 'CALIFB12'
                TableField = 'CALIFB12'
              end
              item
                DatasetField = 'CALIFB13'
                TableField = 'CALIFB13'
              end
              item
                DatasetField = 'CALIFB14'
                TableField = 'CALIFB14'
              end
              item
                DatasetField = 'CALIFB15'
                TableField = 'CALIFB15'
              end
              item
                DatasetField = 'CALIFB16'
                TableField = 'CALIFB16'
              end
              item
                DatasetField = 'FALTAS01'
                TableField = 'FALTAS01'
              end
              item
                DatasetField = 'FALTAS02'
                TableField = 'FALTAS02'
              end
              item
                DatasetField = 'FALTAS03'
                TableField = 'FALTAS03'
              end
              item
                DatasetField = 'FALTAS04'
                TableField = 'FALTAS04'
              end
              item
                DatasetField = 'FALTAS05'
                TableField = 'FALTAS05'
              end
              item
                DatasetField = 'FALTAS06'
                TableField = 'FALTAS06'
              end
              item
                DatasetField = 'FALTAS07'
                TableField = 'FALTAS07'
              end
              item
                DatasetField = 'FALTAS08'
                TableField = 'FALTAS08'
              end
              item
                DatasetField = 'FALTAS09'
                TableField = 'FALTAS09'
              end
              item
                DatasetField = 'FALTAS10'
                TableField = 'FALTAS10'
              end
              item
                DatasetField = 'FALTAS11'
                TableField = 'FALTAS11'
              end
              item
                DatasetField = 'FALTAS12'
                TableField = 'FALTAS12'
              end
              item
                DatasetField = 'FALTAS13'
                TableField = 'FALTAS13'
              end
              item
                DatasetField = 'FALTAS14'
                TableField = 'FALTAS14'
              end
              item
                DatasetField = 'FALTAS15'
                TableField = 'FALTAS15'
              end
              item
                DatasetField = 'FALTAS16'
                TableField = 'FALTAS16'
              end
              item
                DatasetField = 'REGU01'
                TableField = 'REGU01'
              end
              item
                DatasetField = 'REGU02'
                TableField = 'REGU02'
              end
              item
                DatasetField = 'REGU03'
                TableField = 'REGU03'
              end
              item
                DatasetField = 'REGU04'
                TableField = 'REGU04'
              end
              item
                DatasetField = 'REGU05'
                TableField = 'REGU05'
              end>
          end>
        Name = 'spCalificacionesInscripcion'
        Fields = <
          item
            Name = 'IDCALIFICACION'
            DataType = datInteger
            InPrimaryKey = True
          end
          item
            Name = 'IDMATERIA'
            DataType = datInteger
          end
          item
            Name = 'IDHISTORIALALUMNO'
            DataType = datInteger
          end
          item
            Name = 'IDHISTORIALGRUPO'
            DataType = datInteger
          end
          item
            Name = 'IDTIPOCALIFICACION'
            DataType = datInteger
          end
          item
            Name = 'CALIFICACION'
            DataType = datFloat
          end
          item
            Name = 'CALIFAUX1'
            DataType = datFloat
          end
          item
            Name = 'CALIFAUX2'
            DataType = datFloat
          end
          item
            Name = 'STATUS'
            DataType = datString
            Size = 1
          end
          item
            Name = 'FALTAS'
            DataType = datInteger
          end
          item
            Name = 'FECHA'
            DataType = datDateTime
          end
          item
            Name = 'CALIF01'
            DataType = datFloat
          end
          item
            Name = 'CALIF02'
            DataType = datFloat
          end
          item
            Name = 'CALIF03'
            DataType = datFloat
          end
          item
            Name = 'CALIF04'
            DataType = datFloat
          end
          item
            Name = 'CALIF05'
            DataType = datFloat
          end
          item
            Name = 'CALIF06'
            DataType = datFloat
          end
          item
            Name = 'CALIF07'
            DataType = datFloat
          end
          item
            Name = 'CALIF08'
            DataType = datFloat
          end
          item
            Name = 'CALIF09'
            DataType = datFloat
          end
          item
            Name = 'CALIF10'
            DataType = datFloat
          end
          item
            Name = 'CALIF11'
            DataType = datFloat
          end
          item
            Name = 'CALIF12'
            DataType = datFloat
          end
          item
            Name = 'CALIF13'
            DataType = datFloat
          end
          item
            Name = 'CALIF14'
            DataType = datFloat
          end
          item
            Name = 'CALIF15'
            DataType = datFloat
          end
          item
            Name = 'CALIF16'
            DataType = datFloat
          end
          item
            Name = 'CALIFA01'
            DataType = datFloat
          end
          item
            Name = 'CALIFA02'
            DataType = datFloat
          end
          item
            Name = 'CALIFA03'
            DataType = datFloat
          end
          item
            Name = 'CALIFA04'
            DataType = datFloat
          end
          item
            Name = 'CALIFA05'
            DataType = datFloat
          end
          item
            Name = 'CALIFA06'
            DataType = datFloat
          end
          item
            Name = 'CALIFA07'
            DataType = datFloat
          end
          item
            Name = 'CALIFA08'
            DataType = datFloat
          end
          item
            Name = 'CALIFA09'
            DataType = datFloat
          end
          item
            Name = 'CALIFA10'
            DataType = datFloat
          end
          item
            Name = 'CALIFA11'
            DataType = datFloat
          end
          item
            Name = 'CALIFA12'
            DataType = datFloat
          end
          item
            Name = 'CALIFA13'
            DataType = datFloat
          end
          item
            Name = 'CALIFA14'
            DataType = datFloat
          end
          item
            Name = 'CALIFA15'
            DataType = datFloat
          end
          item
            Name = 'CALIFA16'
            DataType = datFloat
          end
          item
            Name = 'CALIFB01'
            DataType = datFloat
          end
          item
            Name = 'CALIFB02'
            DataType = datFloat
          end
          item
            Name = 'CALIFB03'
            DataType = datFloat
          end
          item
            Name = 'CALIFB04'
            DataType = datFloat
          end
          item
            Name = 'CALIFB05'
            DataType = datFloat
          end
          item
            Name = 'CALIFB06'
            DataType = datFloat
          end
          item
            Name = 'CALIFB07'
            DataType = datFloat
          end
          item
            Name = 'CALIFB08'
            DataType = datFloat
          end
          item
            Name = 'CALIFB09'
            DataType = datFloat
          end
          item
            Name = 'CALIFB10'
            DataType = datFloat
          end
          item
            Name = 'CALIFB11'
            DataType = datFloat
          end
          item
            Name = 'CALIFB12'
            DataType = datFloat
          end
          item
            Name = 'CALIFB13'
            DataType = datFloat
          end
          item
            Name = 'CALIFB14'
            DataType = datFloat
          end
          item
            Name = 'CALIFB15'
            DataType = datFloat
          end
          item
            Name = 'CALIFB16'
            DataType = datFloat
          end
          item
            Name = 'FALTAS01'
            DataType = datFloat
          end
          item
            Name = 'FALTAS02'
            DataType = datFloat
          end
          item
            Name = 'FALTAS03'
            DataType = datFloat
          end
          item
            Name = 'FALTAS04'
            DataType = datFloat
          end
          item
            Name = 'FALTAS05'
            DataType = datFloat
          end
          item
            Name = 'FALTAS06'
            DataType = datFloat
          end
          item
            Name = 'FALTAS07'
            DataType = datFloat
          end
          item
            Name = 'FALTAS08'
            DataType = datFloat
          end
          item
            Name = 'FALTAS09'
            DataType = datFloat
          end
          item
            Name = 'FALTAS10'
            DataType = datFloat
          end
          item
            Name = 'FALTAS11'
            DataType = datFloat
          end
          item
            Name = 'FALTAS12'
            DataType = datFloat
          end
          item
            Name = 'FALTAS13'
            DataType = datFloat
          end
          item
            Name = 'FALTAS14'
            DataType = datFloat
          end
          item
            Name = 'FALTAS15'
            DataType = datFloat
          end
          item
            Name = 'FALTAS16'
            DataType = datFloat
          end
          item
            Name = 'REGU01'
            DataType = datFloat
          end
          item
            Name = 'REGU02'
            DataType = datFloat
          end
          item
            Name = 'REGU03'
            DataType = datFloat
          end
          item
            Name = 'REGU04'
            DataType = datFloat
          end
          item
            Name = 'REGU05'
            DataType = datFloat
          end>
      end
      item
        Params = <
          item
            Name = 'idhistorialalumno'
            Value = '1'
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
            SQL = 'select * from pago'#10'where idhistorialalumno = :idhistorialalumno'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDPAGO'
                TableField = 'IDPAGO'
              end
              item
                DatasetField = 'NUMPAGO'
                TableField = 'NUMPAGO'
              end
              item
                DatasetField = 'IMPORTE'
                TableField = 'IMPORTE'
              end
              item
                DatasetField = 'FECHA'
                TableField = 'FECHA'
              end
              item
                DatasetField = 'FECHAPAGO'
                TableField = 'FECHAPAGO'
              end
              item
                DatasetField = 'STATUS'
                TableField = 'STATUS'
              end
              item
                DatasetField = 'INTERES'
                TableField = 'INTERES'
              end
              item
                DatasetField = 'IDEMPLEADO'
                TableField = 'IDEMPLEADO'
              end
              item
                DatasetField = 'IDSUBTIPOPAGO'
                TableField = 'IDSUBTIPOPAGO'
              end
              item
                DatasetField = 'IDHISTORIALALUMNO'
                TableField = 'IDHISTORIALALUMNO'
              end
              item
                DatasetField = 'EMITIDO'
                TableField = 'EMITIDO'
              end>
          end>
        Name = 'spPagosInscripcion'
        Fields = <
          item
            Name = 'IDPAGO'
            DataType = datInteger
            InPrimaryKey = True
          end
          item
            Name = 'NUMPAGO'
            DataType = datInteger
          end
          item
            Name = 'IMPORTE'
            DataType = datFloat
          end
          item
            Name = 'FECHA'
            DataType = datDateTime
          end
          item
            Name = 'FECHAPAGO'
            DataType = datDateTime
          end
          item
            Name = 'STATUS'
            DataType = datString
            Size = 2
          end
          item
            Name = 'INTERES'
            DataType = datFloat
          end
          item
            Name = 'IDEMPLEADO'
            DataType = datInteger
          end
          item
            Name = 'IDSUBTIPOPAGO'
            DataType = datInteger
          end
          item
            Name = 'IDHISTORIALALUMNO'
            DataType = datInteger
          end
          item
            Name = 'EMITIDO'
            DataType = datInteger
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
            SQL = 
              'SELECT TIPOSPAGO.IDTIPOPAGO,'#10'       TIPOSPAGO.CODIGO AS TIPOCODI' +
              'GO,'#10'       TIPOSPAGO.NOMBRE AS TIPONOMBRE,'#10'       tipospago.apli' +
              'cabeca,'#10'       tipospago.aplicadescuento,'#10'       SUBTIPOPAGO.IDS' +
              'UBTIPOPAGO,'#10'       SUBTIPOPAGO.CODIGO AS SUBTIPOCODIGO,'#10'       S' +
              'UBTIPOPAGO.NOMBRE AS SUBTIPONOMBRE,'#10'       SUBTIPOPAGO.FECHA,'#10'  ' +
              '     SUBTIPOPAGO.NUMPAGOS,'#10'       SUBTIPOPAGO.PLAZO,'#10'       SUBT' +
              'IPOPAGO.IMPORTE'#10'FROM SUBTIPOPAGO'#10'   RIGHT OUTER JOIN TIPOSPAGO O' +
              'N (SUBTIPOPAGO.IDTIPOPAGO = TIPOSPAGO.IDTIPOPAGO)'#10'ORDER BY SUBTI' +
              'POCODIGO'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDTIPOPAGO'
                TableField = 'IDTIPOPAGO'
              end
              item
                DatasetField = 'TIPOCODIGO'
                TableField = 'TIPOCODIGO'
              end
              item
                DatasetField = 'TIPONOMBRE'
                TableField = 'TIPONOMBRE'
              end
              item
                DatasetField = 'aplicabeca'
                TableField = 'aplicabeca'
              end
              item
                DatasetField = 'aplicadescuento'
                TableField = 'aplicadescuento'
              end
              item
                DatasetField = 'IDSUBTIPOPAGO'
                TableField = 'IDSUBTIPOPAGO'
              end
              item
                DatasetField = 'SUBTIPOCODIGO'
                TableField = 'SUBTIPOCODIGO'
              end
              item
                DatasetField = 'SUBTIPONOMBRE'
                TableField = 'SUBTIPONOMBRE'
              end
              item
                DatasetField = 'FECHA'
                TableField = 'FECHA'
              end
              item
                DatasetField = 'NUMPAGOS'
                TableField = 'NUMPAGOS'
              end
              item
                DatasetField = 'PLAZO'
                TableField = 'PLAZO'
              end
              item
                DatasetField = 'IMPORTE'
                TableField = 'IMPORTE'
              end>
          end>
        Name = 'vwTipoPagoInscripciones'
        Fields = <
          item
            Name = 'IDTIPOPAGO'
            DataType = datInteger
          end
          item
            Name = 'TIPOCODIGO'
            DataType = datString
            Size = 10
          end
          item
            Name = 'TIPONOMBRE'
            DataType = datString
            Size = 50
          end
          item
            Name = 'aplicabeca'
            DataType = datInteger
          end
          item
            Name = 'aplicadescuento'
            DataType = datInteger
          end
          item
            Name = 'IDSUBTIPOPAGO'
            DataType = datInteger
          end
          item
            Name = 'SUBTIPOCODIGO'
            DataType = datString
            Size = 10
          end
          item
            Name = 'SUBTIPONOMBRE'
            DataType = datString
            Size = 50
          end
          item
            Name = 'FECHA'
            DataType = datDateTime
          end
          item
            Name = 'NUMPAGOS'
            DataType = datInteger
          end
          item
            Name = 'PLAZO'
            DataType = datInteger
          end
          item
            Name = 'IMPORTE'
            DataType = datFloat
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
            SQL = 'SELECT IDSTATUS, Codigo, nombre'#10'FROM STATUS'#10#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDSTATUS'
                TableField = 'IDSTATUS'
              end
              item
                DatasetField = 'Codigo'
                TableField = 'Codigo'
              end
              item
                DatasetField = 'nombre'
                TableField = 'nombre'
              end>
          end>
        Name = 'spStatusInscripcion'
        Fields = <
          item
            Name = 'IDSTATUS'
            DataType = datInteger
          end
          item
            Name = 'Codigo'
            DataType = datString
            Size = 10
          end
          item
            Name = 'nombre'
            DataType = datString
            Size = 50
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
            SQL = 'select idciclo, nombre'#10'from ciclo'#10'order by nombre'#10#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'idciclo'
                TableField = 'idciclo'
              end
              item
                DatasetField = 'nombre'
                TableField = 'nombre'
              end>
          end>
        Name = 'spCicloInscripcion'
        Fields = <
          item
            Name = 'idciclo'
            DataType = datInteger
          end
          item
            Name = 'nombre'
            DataType = datString
            Size = 50
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
            SQL = 'select idCiclo, Nombre from ciclo'#10'order by Nombre'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'idCiclo'
                TableField = 'idCiclo'
              end
              item
                DatasetField = 'Nombre'
                TableField = 'Nombre'
              end>
          end>
        Name = 'spCicloInscripciones'
        Fields = <
          item
            Name = 'idCiclo'
            DataType = datInteger
          end
          item
            Name = 'Nombre'
            DataType = datString
            Size = 50
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'GAUSS'
            SQL = 'select idgrupo, Nombre from grupo'#10'order by nombre'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'idgrupo'
                TableField = 'idgrupo'
              end
              item
                DatasetField = 'Nombre'
                TableField = 'Nombre'
              end>
          end>
        Name = 'spGrupoInscripciones'
        Fields = <
          item
            Name = 'idgrupo'
            DataType = datInteger
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
            Name = 'idGrupo'
            Value = '1'
          end
          item
            Name = 'idCiclo'
            Value = '5'
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
            SQL = 
              'select idhistorialgrupo from historialgrupo'#10'WHERE'#10'  (idGrupo = :' +
              'idGrupo) and (idCiclo = :idCiclo)'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'idhistorialgrupo'
                TableField = 'idhistorialgrupo'
              end>
          end>
        Name = 'spHistorialGrupoInscripcion'
        Fields = <
          item
            Name = 'idhistorialgrupo'
            DataType = datInteger
          end>
      end
      item
        Params = <
          item
            Name = 'idStatus'
            Value = ''
          end
          item
            Name = 'idalumno'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
            SQL = 
              'update alumno'#10'set idstatus = :idStatus'#10'where idalumno = :idalumn' +
              'o'#10#10'SELECT 1 AS RESULT'#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'spModificaStatus'
        Fields = <>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
            SQL = 
              'SELECT TIPOSPAGO.IDTIPOPAGO,'#10'       TIPOSPAGO.CODIGO AS TIPOCODI' +
              'GO,'#10'       TIPOSPAGO.NOMBRE AS TIPONOMBRE,'#10'       tipospago.apli' +
              'cabeca,'#10'       tipospago.aplicadescuento,'#10'       SUBTIPOPAGO.IDS' +
              'UBTIPOPAGO,'#10'       SUBTIPOPAGO.CODIGO AS SUBTIPOCODIGO,'#10'       S' +
              'UBTIPOPAGO.NOMBRE AS SUBTIPONOMBRE,'#10'       SUBTIPOPAGO.FECHA,'#10'  ' +
              '     SUBTIPOPAGO.NUMPAGOS,'#10'       SUBTIPOPAGO.PLAZO,'#10'       SUBT' +
              'IPOPAGO.IMPORTE'#10'FROM SUBTIPOPAGO'#10'   RIGHT OUTER JOIN TIPOSPAGO O' +
              'N (SUBTIPOPAGO.IDTIPOPAGO = TIPOSPAGO.IDTIPOPAGO)'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDTIPOPAGO'
                TableField = 'IDTIPOPAGO'
              end
              item
                DatasetField = 'TIPOCODIGO'
                TableField = 'TIPOCODIGO'
              end
              item
                DatasetField = 'TIPONOMBRE'
                TableField = 'TIPONOMBRE'
              end
              item
                DatasetField = 'aplicabeca'
                TableField = 'aplicabeca'
              end
              item
                DatasetField = 'aplicadescuento'
                TableField = 'aplicadescuento'
              end
              item
                DatasetField = 'IDSUBTIPOPAGO'
                TableField = 'IDSUBTIPOPAGO'
              end
              item
                DatasetField = 'SUBTIPOCODIGO'
                TableField = 'SUBTIPOCODIGO'
              end
              item
                DatasetField = 'SUBTIPONOMBRE'
                TableField = 'SUBTIPONOMBRE'
              end
              item
                DatasetField = 'FECHA'
                TableField = 'FECHA'
              end
              item
                DatasetField = 'NUMPAGOS'
                TableField = 'NUMPAGOS'
              end
              item
                DatasetField = 'PLAZO'
                TableField = 'PLAZO'
              end
              item
                DatasetField = 'IMPORTE'
                TableField = 'IMPORTE'
              end>
          end>
        Name = 'vwTipoPago'
        Fields = <
          item
            Name = 'IDTIPOPAGO'
            DataType = datInteger
          end
          item
            Name = 'TIPOCODIGO'
            DataType = datString
            Size = 10
          end
          item
            Name = 'TIPONOMBRE'
            DataType = datString
            Size = 50
          end
          item
            Name = 'aplicabeca'
            DataType = datInteger
          end
          item
            Name = 'aplicadescuento'
            DataType = datInteger
          end
          item
            Name = 'IDSUBTIPOPAGO'
            DataType = datInteger
          end
          item
            Name = 'SUBTIPOCODIGO'
            DataType = datString
            Size = 10
          end
          item
            Name = 'SUBTIPONOMBRE'
            DataType = datString
            Size = 50
          end
          item
            Name = 'FECHA'
            DataType = datDateTime
          end
          item
            Name = 'NUMPAGOS'
            DataType = datInteger
          end
          item
            Name = 'PLAZO'
            DataType = datInteger
          end
          item
            Name = 'IMPORTE'
            DataType = datFloat
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
            SQL = 
              'SELECT MAX(IDTIPOCALIFICACION)+1 AS IDTIPOCALIFICACION FROM TIPO' +
              'CALIFICACION'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDTIPOCALIFICACION'
                TableField = 'IDTIPOCALIFICACION'
              end>
          end>
        Name = 'spFolioTipoCalificacion'
        Fields = <
          item
            Name = 'IDTIPOCALIFICACION'
            DataType = datInteger
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
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
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
            Name = 'IDPAGO'
            Value = '1'
            ParamType = daptInput
          end
          item
            Name = 'FECHAPAGO'
            Value = '01/01/2010'
            ParamType = daptInput
          end
          item
            Name = 'MONTO'
            Value = '100'
            ParamType = daptInput
          end
          item
            Name = 'IDEMPLEADO'
            Value = '1'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
            SQL = 
              #10'DECLARE @IMPORTE FLOAT'#10'DECLARE @AUX FLOAT'#10'DECLARE @STATUS INT'#10#10 +
              '  SET @IMPORTE = (SELECT IMPORTE FROM PAGO WHERE'#10'  IDPAGO = :IDP' +
              'AGO)'#10#10'  SET @AUX = 0'#10'  SET @STATUS = 0 /* EL PAGO SE LIQUIDO COR' +
              'RECTAMENTE */'#10#10'  SET @AUX = (SELECT COUNT(*) FROM PAGO'#10'  WHERE I' +
              'DPAGO = :IDPAGO)'#10#10'  IF (@AUX < 1 )'#10'  BEGIN'#10'    SET @STATUS = 1 /' +
              '* NO EXISTE EL PAGO */'#10'  END'#10'  ELSE'#10'  BEGIN'#10'    SET @AUX = (SELE' +
              'CT COUNT(*) FROM PAGO'#10'    WHERE IDPAGO = :IDPAGO AND STATUS = '#39'D' +
              #39')'#10#10'    IF (@AUX < 1 )'#10'    BEGIN'#10'      SET @STATUS = 2; /* YA ES' +
              'TA LIQUIDADO EL PAGO */'#10'    END'#10'  END'#10#10#10'  if (@status = 0)'#10'  beg' +
              'in'#10#10'  UPDATE PAGO'#10'  SET'#10'    FECHAPAGO = :FECHAPAGO,'#10'    STATUS =' +
              ' '#39'P'#39','#10'    INTERES = :MONTO - @IMPORTE,'#10'    IDEMPLEADO = :IDEMPLE' +
              'ADO'#10'  WHERE'#10'    (IDPAGO = :IDPAGO)'#10'  end'#10'  '#10'SELECT @STATUS AS ST' +
              'ATUS'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'STATUS'
                TableField = 'STATUS'
              end>
          end>
        Name = 'spPagoBanco'
        Fields = <
          item
            Name = 'STATUS'
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
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
            SQL = 
              'declare @ProductoID as integer'#10#10'select @ProductoID = (select :Pr' +
              'oductoID)'#10#10'SELECT PrecioVenta from Producto where ProductoID = @' +
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
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
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
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
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
            Connection = 'GAUSS'
            Default = True
            TargetTable = 'dbo.DetalleFactura'
            Name = 'GAUSS'
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
            Name = 'AlumnoID'
            Value = '1'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
            SQL = 
              'declare @AlumnoID as integer'#10#10'Select  @AlumnoID = (select :Alumn' +
              'oID)'#10#10'SELECT'#10'    *'#10'  FROM'#10'    dbo.Alumno'#10'  WHERE IDALUMNO = @Alu' +
              'mnoID'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDALUMNO'
                TableField = 'IDALUMNO'
              end
              item
                DatasetField = 'NUMCONTROL'
                TableField = 'NUMCONTROL'
              end
              item
                DatasetField = 'NOMBRE'
                TableField = 'NOMBRE'
              end
              item
                DatasetField = 'FECHANACIMIENTO'
                TableField = 'FECHANACIMIENTO'
              end
              item
                DatasetField = 'CURP'
                TableField = 'CURP'
              end
              item
                DatasetField = 'SEXO'
                TableField = 'SEXO'
              end
              item
                DatasetField = 'CIUDADNACIMIENTO'
                TableField = 'CIUDADNACIMIENTO'
              end
              item
                DatasetField = 'DIRECCION'
                TableField = 'DIRECCION'
              end
              item
                DatasetField = 'PADRE'
                TableField = 'PADRE'
              end
              item
                DatasetField = 'MADRE'
                TableField = 'MADRE'
              end
              item
                DatasetField = 'TELEFONOCASA'
                TableField = 'TELEFONOCASA'
              end
              item
                DatasetField = 'TELEFONOPADRE'
                TableField = 'TELEFONOPADRE'
              end
              item
                DatasetField = 'TELEFONOMADRE'
                TableField = 'TELEFONOMADRE'
              end
              item
                DatasetField = 'FECHAINICIO'
                TableField = 'FECHAINICIO'
              end
              item
                DatasetField = 'EMAIL'
                TableField = 'EMAIL'
              end
              item
                DatasetField = 'EMAILPADRE'
                TableField = 'EMAILPADRE'
              end
              item
                DatasetField = 'EMAILMADRE'
                TableField = 'EMAILMADRE'
              end
              item
                DatasetField = 'OBSERVACIONES'
                TableField = 'OBSERVACIONES'
              end
              item
                DatasetField = 'IDSTATUS'
                TableField = 'IDSTATUS'
              end
              item
                DatasetField = 'FOTO'
                TableField = 'FOTO'
              end
              item
                DatasetField = 'FACTURADOMICILIO'
                TableField = 'FACTURADOMICILIO'
              end
              item
                DatasetField = 'FACTURANOMBRE'
                TableField = 'FACTURANOMBRE'
              end
              item
                DatasetField = 'FACTURATELEFONO'
                TableField = 'FACTURATELEFONO'
              end
              item
                DatasetField = 'RFC'
                TableField = 'RFC'
              end
              item
                DatasetField = 'EMPRESAPADRE'
                TableField = 'EMPRESAPADRE'
              end
              item
                DatasetField = 'EMPRESAMADRE'
                TableField = 'EMPRESAMADRE'
              end
              item
                DatasetField = 'PUESTOMADRE'
                TableField = 'PUESTOMADRE'
              end
              item
                DatasetField = 'PUESTOPADRE'
                TableField = 'PUESTOPADRE'
              end
              item
                DatasetField = 'APATERNO'
                TableField = 'APATERNO'
              end
              item
                DatasetField = 'AMATERNO'
                TableField = 'AMATERNO'
              end
              item
                DatasetField = 'NOMBRES'
                TableField = 'NOMBRES'
              end
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
                DatasetField = 'CIUDAD'
                TableField = 'CIUDAD'
              end
              item
                DatasetField = 'CALLE'
                TableField = 'CALLE'
              end>
          end>
        Name = 'ObtenerDatosAlumno'
        Fields = <
          item
            Name = 'IDALUMNO'
            DataType = datInteger
          end
          item
            Name = 'NUMCONTROL'
            DataType = datString
            Size = 12
          end
          item
            Name = 'NOMBRE'
            DataType = datString
            Size = 70
          end
          item
            Name = 'FECHANACIMIENTO'
            DataType = datDateTime
          end
          item
            Name = 'CURP'
            DataType = datString
            Size = 40
          end
          item
            Name = 'SEXO'
            DataType = datString
            Size = 1
          end
          item
            Name = 'CIUDADNACIMIENTO'
            DataType = datString
            Size = 30
          end
          item
            Name = 'DIRECCION'
            DataType = datString
            Size = 75
          end
          item
            Name = 'PADRE'
            DataType = datString
            Size = 70
          end
          item
            Name = 'MADRE'
            DataType = datString
            Size = 70
          end
          item
            Name = 'TELEFONOCASA'
            DataType = datString
            Size = 20
          end
          item
            Name = 'TELEFONOPADRE'
            DataType = datString
            Size = 20
          end
          item
            Name = 'TELEFONOMADRE'
            DataType = datString
            Size = 20
          end
          item
            Name = 'FECHAINICIO'
            DataType = datDateTime
          end
          item
            Name = 'EMAIL'
            DataType = datString
            Size = 40
          end
          item
            Name = 'EMAILPADRE'
            DataType = datString
            Size = 40
          end
          item
            Name = 'EMAILMADRE'
            DataType = datString
            Size = 40
          end
          item
            Name = 'OBSERVACIONES'
            DataType = datMemo
          end
          item
            Name = 'IDSTATUS'
            DataType = datInteger
          end
          item
            Name = 'FOTO'
            DataType = datMemo
          end
          item
            Name = 'FACTURADOMICILIO'
            DataType = datString
            Size = 70
          end
          item
            Name = 'FACTURANOMBRE'
            DataType = datString
            Size = 70
          end
          item
            Name = 'FACTURATELEFONO'
            DataType = datString
            Size = 20
          end
          item
            Name = 'RFC'
            DataType = datString
            Size = 20
          end
          item
            Name = 'EMPRESAPADRE'
            DataType = datString
            Size = 50
          end
          item
            Name = 'EMPRESAMADRE'
            DataType = datString
            Size = 50
          end
          item
            Name = 'PUESTOMADRE'
            DataType = datString
            Size = 25
          end
          item
            Name = 'PUESTOPADRE'
            DataType = datString
            Size = 25
          end
          item
            Name = 'APATERNO'
            DataType = datString
            Size = 20
          end
          item
            Name = 'AMATERNO'
            DataType = datString
            Size = 20
          end
          item
            Name = 'NOMBRES'
            DataType = datString
            Size = 25
          end
          item
            Name = 'NOEXTERIOR'
            DataType = datString
            Size = 20
          end
          item
            Name = 'COLONIA'
            DataType = datString
            Size = 40
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
          end
          item
            Name = 'CIUDAD'
            DataType = datString
            Size = 50
          end
          item
            Name = 'CALLE'
            DataType = datWideString
            Size = 10
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
            SQL = 'SELECT * FROM PRODUCTO'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'ProductoID'
                TableField = 'ProductoID'
              end
              item
                DatasetField = 'Codigo'
                TableField = 'Codigo'
              end
              item
                DatasetField = 'Nombre'
                TableField = 'Nombre'
              end
              item
                DatasetField = 'PrecioVenta'
                TableField = 'PrecioVenta'
              end
              item
                DatasetField = 'Costo'
                TableField = 'Costo'
              end
              item
                DatasetField = 'IEPS'
                TableField = 'IEPS'
              end>
          end>
        Name = 'spProducto'
        Fields = <
          item
            Name = 'ProductoID'
            DataType = datInteger
          end
          item
            Name = 'Codigo'
            DataType = datString
            Size = 10
          end
          item
            Name = 'Nombre'
            DataType = datString
            Size = 150
          end
          item
            Name = 'PrecioVenta'
            DataType = datFloat
          end
          item
            Name = 'Costo'
            DataType = datFloat
          end
          item
            Name = 'IEPS'
            DataType = datFloat
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
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
            SQL = 
              'declare @ProductoID int'#10'select @ProductoID = (select :ProductoID' +
              ')'#10'select IEPS from producto'#10'where productoid = @ProductoID or co' +
              'digo = cast(@ProductoID as varchar(10))'#10
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
            Name = 'IDPROSPECTO'
            Value = '0'
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
            SQL = 'SELECT * FROM PROSPECTO'#10'WHERE IDPROSPECTO = :IDPROSPECTO'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDPROSPECTO'
                TableField = 'IDPROSPECTO'
              end
              item
                DatasetField = 'NOMBRE'
                TableField = 'NOMBRE'
              end
              item
                DatasetField = 'FECHANACIMIENTO'
                TableField = 'FECHANACIMIENTO'
              end
              item
                DatasetField = 'SEXO'
                TableField = 'SEXO'
              end
              item
                DatasetField = 'CIUDADNACIMIENTO'
                TableField = 'CIUDADNACIMIENTO'
              end
              item
                DatasetField = 'DIRECCION'
                TableField = 'DIRECCION'
              end
              item
                DatasetField = 'PADRE'
                TableField = 'PADRE'
              end
              item
                DatasetField = 'MADRE'
                TableField = 'MADRE'
              end
              item
                DatasetField = 'TELEFONOCASA'
                TableField = 'TELEFONOCASA'
              end
              item
                DatasetField = 'EMAIL'
                TableField = 'EMAIL'
              end
              item
                DatasetField = 'EMAILPADRE'
                TableField = 'EMAILPADRE'
              end
              item
                DatasetField = 'EMAILMADRE'
                TableField = 'EMAILMADRE'
              end
              item
                DatasetField = 'APATERNO'
                TableField = 'APATERNO'
              end
              item
                DatasetField = 'AMATERNO'
                TableField = 'AMATERNO'
              end
              item
                DatasetField = 'NOMBRES'
                TableField = 'NOMBRES'
              end
              item
                DatasetField = 'ESCUELAPROCEDENCIA'
                TableField = 'ESCUELAPROCEDENCIA'
              end>
          end>
        Name = 'spProspecto'
        Fields = <
          item
            Name = 'IDPROSPECTO'
            DataType = datInteger
          end
          item
            Name = 'NOMBRE'
            DataType = datString
            Size = 70
          end
          item
            Name = 'FECHANACIMIENTO'
            DataType = datDateTime
          end
          item
            Name = 'SEXO'
            DataType = datString
            Size = 1
          end
          item
            Name = 'CIUDADNACIMIENTO'
            DataType = datString
            Size = 30
          end
          item
            Name = 'DIRECCION'
            DataType = datString
            Size = 75
          end
          item
            Name = 'PADRE'
            DataType = datString
            Size = 70
          end
          item
            Name = 'MADRE'
            DataType = datString
            Size = 70
          end
          item
            Name = 'TELEFONOCASA'
            DataType = datString
            Size = 20
          end
          item
            Name = 'EMAIL'
            DataType = datString
            Size = 40
          end
          item
            Name = 'EMAILPADRE'
            DataType = datString
            Size = 40
          end
          item
            Name = 'EMAILMADRE'
            DataType = datString
            Size = 40
          end
          item
            Name = 'APATERNO'
            DataType = datString
            Size = 20
          end
          item
            Name = 'AMATERNO'
            DataType = datString
            Size = 20
          end
          item
            Name = 'NOMBRES'
            DataType = datString
            Size = 25
          end
          item
            Name = 'ESCUELAPROCEDENCIA'
            DataType = datString
            Size = 200
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
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
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
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
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
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
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
            Connection = 'GAUSS'
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
            Connection = 'GAUSS'
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
            Connection = 'GAUSS'
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
            Connection = 'GAUSS'
            Default = True
            TargetTable = 'dbo.CICLO'
            SQL = 
              'SELECT '#10'    IDCICLO, CODIGO, NOMBRE, FECHAINICIO, FECHAFINAL, NO' +
              'MBREAUX1, '#10'    NOMBREAUX2'#10'  FROM'#10'    dbo.CICLO'#10'  WHERE {Where}'
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDCICLO'
                TableField = 'IDCICLO'
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
                DatasetField = 'FECHAINICIO'
                TableField = 'FECHAINICIO'
              end
              item
                DatasetField = 'FECHAFINAL'
                TableField = 'FECHAFINAL'
              end
              item
                DatasetField = 'NOMBREAUX1'
                TableField = 'NOMBREAUX1'
              end
              item
                DatasetField = 'NOMBREAUX2'
                TableField = 'NOMBREAUX2'
              end>
          end>
        Name = 'dbo CICLO'
        Fields = <
          item
            Name = 'IDCICLO'
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
          end
          item
            Name = 'FECHAINICIO'
            DataType = datDateTime
            Required = True
          end
          item
            Name = 'FECHAFINAL'
            DataType = datDateTime
          end
          item
            Name = 'NOMBREAUX1'
            DataType = datString
            Size = 50
          end
          item
            Name = 'NOMBREAUX2'
            DataType = datString
            Size = 50
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            TargetTable = 'dbo.FAMILIA'
            SQL = 
              'SELECT '#10'    IDFAMILIA, CODIGO, NOMBRE, PADRE, MADRE, TELEFONOCAS' +
              'A, '#10'    TELEFONOPADRE, TELEFONOMADRE, EMAILPADRE, EMAILMADRE, '#10' ' +
              '   FACTURADOMICILIO, FACTURANOMBRE, FACTURATELEFONO, RFC, '#10'    E' +
              'MPRESAPADRE, EMPRESAMADRE, PUESTOMADRE, PUESTOPADRE'#10'  FROM'#10'    d' +
              'bo.FAMILIA'#10'  WHERE {Where}'
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDFAMILIA'
                TableField = 'IDFAMILIA'
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
                DatasetField = 'PADRE'
                TableField = 'PADRE'
              end
              item
                DatasetField = 'MADRE'
                TableField = 'MADRE'
              end
              item
                DatasetField = 'TELEFONOCASA'
                TableField = 'TELEFONOCASA'
              end
              item
                DatasetField = 'TELEFONOPADRE'
                TableField = 'TELEFONOPADRE'
              end
              item
                DatasetField = 'TELEFONOMADRE'
                TableField = 'TELEFONOMADRE'
              end
              item
                DatasetField = 'EMAILPADRE'
                TableField = 'EMAILPADRE'
              end
              item
                DatasetField = 'EMAILMADRE'
                TableField = 'EMAILMADRE'
              end
              item
                DatasetField = 'FACTURADOMICILIO'
                TableField = 'FACTURADOMICILIO'
              end
              item
                DatasetField = 'FACTURANOMBRE'
                TableField = 'FACTURANOMBRE'
              end
              item
                DatasetField = 'FACTURATELEFONO'
                TableField = 'FACTURATELEFONO'
              end
              item
                DatasetField = 'RFC'
                TableField = 'RFC'
              end
              item
                DatasetField = 'EMPRESAPADRE'
                TableField = 'EMPRESAPADRE'
              end
              item
                DatasetField = 'EMPRESAMADRE'
                TableField = 'EMPRESAMADRE'
              end
              item
                DatasetField = 'PUESTOMADRE'
                TableField = 'PUESTOMADRE'
              end
              item
                DatasetField = 'PUESTOPADRE'
                TableField = 'PUESTOPADRE'
              end>
          end>
        Name = 'dbo FAMILIA'
        Fields = <
          item
            Name = 'IDFAMILIA'
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
            Size = 70
          end
          item
            Name = 'PADRE'
            DataType = datString
            Size = 70
          end
          item
            Name = 'MADRE'
            DataType = datString
            Size = 70
          end
          item
            Name = 'TELEFONOCASA'
            DataType = datString
            Size = 20
          end
          item
            Name = 'TELEFONOPADRE'
            DataType = datString
            Size = 20
          end
          item
            Name = 'TELEFONOMADRE'
            DataType = datString
            Size = 20
          end
          item
            Name = 'EMAILPADRE'
            DataType = datString
            Size = 40
          end
          item
            Name = 'EMAILMADRE'
            DataType = datString
            Size = 40
          end
          item
            Name = 'FACTURADOMICILIO'
            DataType = datString
            Size = 70
          end
          item
            Name = 'FACTURANOMBRE'
            DataType = datString
            Size = 70
          end
          item
            Name = 'FACTURATELEFONO'
            DataType = datString
            Size = 20
          end
          item
            Name = 'RFC'
            DataType = datString
            Size = 20
          end
          item
            Name = 'EMPRESAPADRE'
            DataType = datString
            Size = 50
          end
          item
            Name = 'EMPRESAMADRE'
            DataType = datString
            Size = 50
          end
          item
            Name = 'PUESTOMADRE'
            DataType = datString
            Size = 50
          end
          item
            Name = 'PUESTOPADRE'
            DataType = datString
            Size = 50
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            TargetTable = 'dbo.FAMILIAALUMNO'
            SQL = 
              'SELECT '#10'    IDFAMILIAALUMNO, IDFAMILIA, IDALUMNO'#10'  FROM'#10'    dbo.' +
              'FAMILIAALUMNO'#10'  WHERE {Where}'
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDFAMILIAALUMNO'
                TableField = 'IDFAMILIAALUMNO'
              end
              item
                DatasetField = 'IDFAMILIA'
                TableField = 'IDFAMILIA'
              end
              item
                DatasetField = 'IDALUMNO'
                TableField = 'IDALUMNO'
              end>
          end>
        Name = 'dbo FAMILIAALUMNO'
        Fields = <
          item
            Name = 'IDFAMILIAALUMNO'
            DataType = datInteger
            Required = True
            InPrimaryKey = True
          end
          item
            Name = 'IDFAMILIA'
            DataType = datInteger
            Required = True
          end
          item
            Name = 'IDALUMNO'
            DataType = datInteger
            Required = True
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            TargetTable = 'dbo.GRUPO'
            SQL = 
              'SELECT '#10'    IDGRUPO, CODIGO, NOMBRE, IDNIVEL, CUPO, NOMBREAUX1, ' +
              #10'    NOMBREAUX2'#10'  FROM'#10'    dbo.GRUPO'#10'  WHERE {Where}'
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDGRUPO'
                TableField = 'IDGRUPO'
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
                DatasetField = 'IDNIVEL'
                TableField = 'IDNIVEL'
              end
              item
                DatasetField = 'CUPO'
                TableField = 'CUPO'
              end
              item
                DatasetField = 'NOMBREAUX1'
                TableField = 'NOMBREAUX1'
              end
              item
                DatasetField = 'NOMBREAUX2'
                TableField = 'NOMBREAUX2'
              end>
          end>
        Name = 'dbo GRUPO'
        Fields = <
          item
            Name = 'IDGRUPO'
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
          end
          item
            Name = 'IDNIVEL'
            DataType = datInteger
            Required = True
          end
          item
            Name = 'CUPO'
            DataType = datInteger
            Required = True
          end
          item
            Name = 'NOMBREAUX1'
            DataType = datString
            Size = 50
          end
          item
            Name = 'NOMBREAUX2'
            DataType = datString
            Size = 50
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            TargetTable = 'dbo.NIVEL'
            SQL = 
              'SELECT '#10'    IDNIVEL, CODIGO, NOMBRE, NOMBREAUX1, NOMBREAUX2'#10'  FR' +
              'OM'#10'    dbo.NIVEL'#10'  WHERE {Where}'
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDNIVEL'
                TableField = 'IDNIVEL'
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
                DatasetField = 'NOMBREAUX1'
                TableField = 'NOMBREAUX1'
              end
              item
                DatasetField = 'NOMBREAUX2'
                TableField = 'NOMBREAUX2'
              end>
          end>
        Name = 'dbo NIVEL'
        Fields = <
          item
            Name = 'IDNIVEL'
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
          end
          item
            Name = 'NOMBREAUX1'
            DataType = datString
            Size = 50
          end
          item
            Name = 'NOMBREAUX2'
            DataType = datString
            Size = 50
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            TargetTable = 'dbo.MAESTRO'
            SQL = 
              'SELECT '#10'    IDMAESTRO, CODIGO, NOMBRE, CURRICULUM, IMSS, DIRECCI' +
              'ON, '#10'    FECHAINICIO, TELEFONO, CELULAR, EMAIL, SEXO, RFC, FECHA' +
              'NACIMIENTO, '#10'    LUGARNACIMIENTO, STATUS, CURP, FOTO, COLOR'#10'  FR' +
              'OM'#10'    dbo.MAESTRO'#10'  WHERE {Where}'
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDMAESTRO'
                TableField = 'IDMAESTRO'
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
                DatasetField = 'CURRICULUM'
                TableField = 'CURRICULUM'
              end
              item
                DatasetField = 'IMSS'
                TableField = 'IMSS'
              end
              item
                DatasetField = 'DIRECCION'
                TableField = 'DIRECCION'
              end
              item
                DatasetField = 'FECHAINICIO'
                TableField = 'FECHAINICIO'
              end
              item
                DatasetField = 'TELEFONO'
                TableField = 'TELEFONO'
              end
              item
                DatasetField = 'CELULAR'
                TableField = 'CELULAR'
              end
              item
                DatasetField = 'EMAIL'
                TableField = 'EMAIL'
              end
              item
                DatasetField = 'SEXO'
                TableField = 'SEXO'
              end
              item
                DatasetField = 'RFC'
                TableField = 'RFC'
              end
              item
                DatasetField = 'FECHANACIMIENTO'
                TableField = 'FECHANACIMIENTO'
              end
              item
                DatasetField = 'LUGARNACIMIENTO'
                TableField = 'LUGARNACIMIENTO'
              end
              item
                DatasetField = 'STATUS'
                TableField = 'STATUS'
              end
              item
                DatasetField = 'CURP'
                TableField = 'CURP'
              end
              item
                DatasetField = 'FOTO'
                TableField = 'FOTO'
              end
              item
                DatasetField = 'COLOR'
                TableField = 'COLOR'
              end>
          end>
        Name = 'dbo MAESTRO'
        Fields = <
          item
            Name = 'IDMAESTRO'
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
            Required = True
          end
          item
            Name = 'CURRICULUM'
            DataType = datMemo
          end
          item
            Name = 'IMSS'
            DataType = datString
            Size = 30
          end
          item
            Name = 'DIRECCION'
            DataType = datString
            Size = 70
          end
          item
            Name = 'FECHAINICIO'
            DataType = datDateTime
            Required = True
          end
          item
            Name = 'TELEFONO'
            DataType = datString
            Size = 20
          end
          item
            Name = 'CELULAR'
            DataType = datString
            Size = 20
          end
          item
            Name = 'EMAIL'
            DataType = datString
            Size = 40
          end
          item
            Name = 'SEXO'
            DataType = datString
            Size = 1
          end
          item
            Name = 'RFC'
            DataType = datString
            Size = 20
          end
          item
            Name = 'FECHANACIMIENTO'
            DataType = datBlob
            BlobType = dabtTimestamp
            LogChanges = False
            Required = True
          end
          item
            Name = 'LUGARNACIMIENTO'
            DataType = datString
            Size = 25
          end
          item
            Name = 'STATUS'
            DataType = datString
            Size = 1
            Required = True
          end
          item
            Name = 'CURP'
            DataType = datString
            Size = 40
          end
          item
            Name = 'FOTO'
            DataType = datMemo
          end
          item
            Name = 'COLOR'
            DataType = datInteger
          end>
      end
      item
        Params = <
          item
            Name = 'IDMAESTRO'
            DataType = datInteger
            Value = ''
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            TargetTable = 'dbo.MAESTROMATERIA'
            SQL = 
              'SELECT '#10'    IDMATERIA, IDMAESTRO'#10'  FROM'#10'    dbo.MAESTROMATERIA'#10' ' +
              ' WHERE IDMAESTRO = :IDMAESTRO'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDMATERIA'
                TableField = 'IDMATERIA'
              end
              item
                DatasetField = 'IDMAESTRO'
                TableField = 'IDMAESTRO'
              end>
          end>
        Name = 'dbo MAESTROMATERIA'
        Fields = <
          item
            Name = 'IDMATERIA'
            DataType = datInteger
            Required = True
            InPrimaryKey = True
          end
          item
            Name = 'IDMAESTRO'
            DataType = datInteger
            Required = True
            InPrimaryKey = True
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            TargetTable = 'dbo.MATERIA'
            SQL = 
              'SELECT '#10'    IDMATERIA, CODIGO, NOMBRE, CREDITOS, MINIMOAPRO, MAX' +
              'IMOFALTAS, '#10'    SERIADACON, NOMBREAUX1, NOMBREAUX2, HORASXSEMANA' +
              ', PROMEDIO, '#10'    ORDENOFICIAL, ORDENINTERNO, INGLES'#10'  FROM'#10'    d' +
              'bo.MATERIA'#10'  WHERE {Where}'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDMATERIA'
                TableField = 'IDMATERIA'
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
                DatasetField = 'CREDITOS'
                TableField = 'CREDITOS'
              end
              item
                DatasetField = 'MINIMOAPRO'
                TableField = 'MINIMOAPRO'
              end
              item
                DatasetField = 'MAXIMOFALTAS'
                TableField = 'MAXIMOFALTAS'
              end
              item
                DatasetField = 'SERIADACON'
                TableField = 'SERIADACON'
              end
              item
                DatasetField = 'NOMBREAUX1'
                TableField = 'NOMBREAUX1'
              end
              item
                DatasetField = 'NOMBREAUX2'
                TableField = 'NOMBREAUX2'
              end
              item
                DatasetField = 'HORASXSEMANA'
                TableField = 'HORASXSEMANA'
              end
              item
                DatasetField = 'PROMEDIO'
                TableField = 'PROMEDIO'
              end
              item
                DatasetField = 'ORDENOFICIAL'
                TableField = 'ORDENOFICIAL'
              end
              item
                DatasetField = 'ORDENINTERNO'
                TableField = 'ORDENINTERNO'
              end
              item
                DatasetField = 'INGLES'
                TableField = 'INGLES'
              end>
          end>
        Name = 'dbo MATERIA'
        Fields = <
          item
            Name = 'IDMATERIA'
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
          end
          item
            Name = 'CREDITOS'
            DataType = datInteger
            Required = True
          end
          item
            Name = 'MINIMOAPRO'
            DataType = datFloat
            Required = True
          end
          item
            Name = 'MAXIMOFALTAS'
            DataType = datInteger
            Required = True
          end
          item
            Name = 'SERIADACON'
            DataType = datInteger
          end
          item
            Name = 'NOMBREAUX1'
            DataType = datString
            Size = 50
          end
          item
            Name = 'NOMBREAUX2'
            DataType = datString
            Size = 50
          end
          item
            Name = 'HORASXSEMANA'
            DataType = datInteger
          end
          item
            Name = 'PROMEDIO'
            DataType = datInteger
          end
          item
            Name = 'ORDENOFICIAL'
            DataType = datInteger
            Required = True
          end
          item
            Name = 'ORDENINTERNO'
            DataType = datInteger
            Required = True
          end
          item
            Name = 'INGLES'
            DataType = datBoolean
          end>
      end
      item
        Params = <
          item
            Name = 'IDMAESTRO'
            DataType = datInteger
            Value = '1'
          end
          item
            Name = 'MES'
            Value = '1'
          end
          item
            Name = 'ANIO'
            Value = '1'
          end
          item
            Name = 'DIAINI'
            Value = '1'
          end
          item
            Name = 'DIAFIN'
            Value = '1'
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            TargetTable = 'dbo.MAESTRODISPONIBILIDAD'
            SQL = 
              'SELECT '#10'    IDMAESTRODISPONIBILIDAD, INICIO, FIN, IDMAESTRO, TEX' +
              'TO, COLOR'#10'  FROM'#10'    dbo.MAESTRODISPONIBILIDAD'#10'  WHERE'#10'    dbo.M' +
              'AESTRODISPONIBILIDAD.IDMAESTRO = :IDMAESTRO'#10'    and'#10'    MONTH(db' +
              'o.MAESTRODISPONIBILIDAD.INICIO) = :MES'#10'    and'#10'    YEAR(dbo.MAES' +
              'TRODISPONIBILIDAD.INICIO) = :ANIO'#10'    and'#10'    DAY(dbo.MAESTRODIS' +
              'PONIBILIDAD.INICIO)BETWEEN :DIAINI AND :DIAFIN'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDMAESTRODISPONIBILIDAD'
                TableField = 'IDMAESTRODISPONIBILIDAD'
              end
              item
                DatasetField = 'INICIO'
                TableField = 'INICIO'
              end
              item
                DatasetField = 'FIN'
                TableField = 'FIN'
              end
              item
                DatasetField = 'IDMAESTRO'
                TableField = 'IDMAESTRO'
              end
              item
                DatasetField = 'TEXTO'
                TableField = 'TEXTO'
              end
              item
                DatasetField = 'COLOR'
                TableField = 'COLOR'
              end>
          end>
        Name = 'dbo MAESTRODISPONIBILIDAD'
        Fields = <
          item
            Name = 'IDMAESTRODISPONIBILIDAD'
            DataType = datInteger
          end
          item
            Name = 'INICIO'
            DataType = datDateTime
          end
          item
            Name = 'FIN'
            DataType = datDateTime
          end
          item
            Name = 'IDMAESTRO'
            DataType = datInteger
          end
          item
            Name = 'TEXTO'
            DataType = datString
            Size = 150
          end
          item
            Name = 'COLOR'
            DataType = datInteger
          end>
      end
      item
        Params = <
          item
            Name = 'IDCAMPO'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            TargetTable = 'dbo.NIVEL'
            SQL = 
              'SELECT '#10'    IDNIVEL, CODIGO, NOMBRE, NOMBREAUX1, NOMBREAUX2'#10'  FR' +
              'OM'#10'    dbo.NIVEL'#10'  WHERE'#10'    dbo.NIVEL.IDNIVEL = :IDCAMPO'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDNIVEL'
                TableField = 'IDNIVEL'
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
                DatasetField = 'NOMBREAUX1'
                TableField = 'NOMBREAUX1'
              end
              item
                DatasetField = 'NOMBREAUX2'
                TableField = 'NOMBREAUX2'
              end>
          end>
        Name = 'spNivel'
        Fields = <
          item
            Name = 'IDNIVEL'
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
          end
          item
            Name = 'NOMBREAUX1'
            DataType = datString
            Size = 50
          end
          item
            Name = 'NOMBREAUX2'
            DataType = datString
            Size = 50
          end>
      end
      item
        Params = <
          item
            Name = 'IDCAMPO'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            TargetTable = 'dbo.GRUPO'
            SQL = 
              'SELECT '#10'    IDGRUPO, CODIGO, NOMBRE, IDNIVEL, CUPO, NOMBREAUX1, ' +
              #10'    NOMBREAUX2'#10'  FROM'#10'    dbo.GRUPO'#10'  WHERE'#10'    dbo.GRUPO.IDGRU' +
              'PO = :IDCAMPO'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDGRUPO'
                TableField = 'IDGRUPO'
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
                DatasetField = 'IDNIVEL'
                TableField = 'IDNIVEL'
              end
              item
                DatasetField = 'CUPO'
                TableField = 'CUPO'
              end
              item
                DatasetField = 'NOMBREAUX1'
                TableField = 'NOMBREAUX1'
              end
              item
                DatasetField = 'NOMBREAUX2'
                TableField = 'NOMBREAUX2'
              end>
          end>
        Name = 'spGrupo'
        Fields = <
          item
            Name = 'IDGRUPO'
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
          end
          item
            Name = 'IDNIVEL'
            DataType = datInteger
            Required = True
          end
          item
            Name = 'CUPO'
            DataType = datInteger
            Required = True
          end
          item
            Name = 'NOMBREAUX1'
            DataType = datString
            Size = 50
          end
          item
            Name = 'NOMBREAUX2'
            DataType = datString
            Size = 50
          end>
      end
      item
        Params = <
          item
            Name = 'IDCAMPO'
            Value = '1'
          end
          item
            Name = 'IDCAMPOPADRE'
            Value = '2'
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            TargetTable = 'dbo.MATERIAGRUPO'
            SQL = 
              'SELECT '#10'    IDMATERIA, IDGRUPO, IDMAESTRO'#10'  FROM'#10'    dbo.MATERIA' +
              'GRUPO'#10'  WHERE'#10'    dbo.MATERIAGRUPO.IDMATERIA = :IDCAMPO AND'#10'    ' +
              'dbo.MATERIAGRUPO.IDGRUPO = :IDCAMPOPADRE'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDMATERIA'
                TableField = 'IDMATERIA'
              end
              item
                DatasetField = 'IDGRUPO'
                TableField = 'IDGRUPO'
              end
              item
                DatasetField = 'IDMAESTRO'
                TableField = 'IDMAESTRO'
              end>
          end>
        Name = 'spMateria'
        Fields = <
          item
            Name = 'IDMATERIA'
            DataType = datInteger
          end
          item
            Name = 'IDGRUPO'
            DataType = datInteger
          end
          item
            Name = 'IDMAESTRO'
            DataType = datInteger
          end>
      end
      item
        Params = <
          item
            Name = 'IDCAMPO'
            Value = ''
          end
          item
            Name = 'IDCAMPOPADRE'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            TargetTable = 'dbo.GRUPOPAGO'
            SQL = 
              'SELECT '#10'    IDGRUPO, IDSUBTIPOPAGO'#10'  FROM'#10'    dbo.GRUPOPAGO'#10'  WH' +
              'ERE'#10'    dbo.GRUPOPAGO.IDSUBTIPOPAGO = :IDCAMPO AND  dbo.GRUPOPAG' +
              'O.IDGRUPO = :IDCAMPOPADRE'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDGRUPO'
                TableField = 'IDGRUPO'
              end
              item
                DatasetField = 'IDSUBTIPOPAGO'
                TableField = 'IDSUBTIPOPAGO'
              end>
          end>
        Name = 'spPago'
        Fields = <
          item
            Name = 'IDGRUPO'
            DataType = datInteger
            Required = True
            InPrimaryKey = True
          end
          item
            Name = 'IDSUBTIPOPAGO'
            DataType = datInteger
            Required = True
            InPrimaryKey = True
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            TargetTable = 'dbo.SUBTIPOPAGO'
            SQL = 
              'SELECT '#10'    IDSUBTIPOPAGO, CODIGO, NOMBRE, IDTIPOPAGO, FECHA, NU' +
              'MPAGOS, '#10'    PLAZO, IMPORTE'#10'  FROM'#10'    dbo.SUBTIPOPAGO'#10'  WHERE {' +
              'Where}'
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDSUBTIPOPAGO'
                TableField = 'IDSUBTIPOPAGO'
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
                DatasetField = 'IDTIPOPAGO'
                TableField = 'IDTIPOPAGO'
              end
              item
                DatasetField = 'FECHA'
                TableField = 'FECHA'
              end
              item
                DatasetField = 'NUMPAGOS'
                TableField = 'NUMPAGOS'
              end
              item
                DatasetField = 'PLAZO'
                TableField = 'PLAZO'
              end
              item
                DatasetField = 'IMPORTE'
                TableField = 'IMPORTE'
              end>
          end>
        Name = 'dbo SUBTIPOPAGO'
        Fields = <
          item
            Name = 'IDSUBTIPOPAGO'
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
          end
          item
            Name = 'IDTIPOPAGO'
            DataType = datInteger
            Required = True
          end
          item
            Name = 'FECHA'
            DataType = datDateTime
            Required = True
          end
          item
            Name = 'NUMPAGOS'
            DataType = datInteger
          end
          item
            Name = 'PLAZO'
            DataType = datInteger
          end
          item
            Name = 'IMPORTE'
            DataType = datFloat
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            TargetTable = 'dbo.TIPOCALIFICACION'
            SQL = 
              'SELECT '#10'    IDTIPOCALIFICACION, CODIGO, NOMBRE, NOMBREAUX1, NOMB' +
              'REAUX2, CAPTURAR'#10'  FROM'#10'    dbo.TIPOCALIFICACION'#10'  WHERE {Where}' +
              #10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDTIPOCALIFICACION'
                TableField = 'IDTIPOCALIFICACION'
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
                DatasetField = 'NOMBREAUX1'
                TableField = 'NOMBREAUX1'
              end
              item
                DatasetField = 'NOMBREAUX2'
                TableField = 'NOMBREAUX2'
              end
              item
                DatasetField = 'CAPTURAR'
                TableField = 'CAPTURAR'
              end>
          end>
        Name = 'dbo TIPOCALIFICACION'
        Fields = <
          item
            Name = 'IDTIPOCALIFICACION'
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
          end
          item
            Name = 'NOMBREAUX1'
            DataType = datString
            Size = 50
          end
          item
            Name = 'NOMBREAUX2'
            DataType = datString
            Size = 50
          end
          item
            Name = 'CAPTURAR'
            DataType = datBoolean
          end>
      end
      item
        Params = <
          item
            Name = 'IDCAMPO'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            TargetTable = 'dbo.TIPOSPAGO'
            SQL = 
              'SELECT '#10'    IDTIPOPAGO, CODIGO, NOMBRE, APLICABECA, APLICADESCUE' +
              'NTO'#10'  FROM'#10'    dbo.TIPOSPAGO'#10'  WHERE'#10'    dbo.TIPOSPAGO.IDTIPOPAG' +
              'O = :IDCAMPO'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDTIPOPAGO'
                TableField = 'IDTIPOPAGO'
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
                DatasetField = 'APLICABECA'
                TableField = 'APLICABECA'
              end
              item
                DatasetField = 'APLICADESCUENTO'
                TableField = 'APLICADESCUENTO'
              end>
          end>
        Name = 'dbo TIPOSPAGO'
        Fields = <
          item
            Name = 'IDTIPOPAGO'
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
          end
          item
            Name = 'APLICABECA'
            DataType = datInteger
            Required = True
          end
          item
            Name = 'APLICADESCUENTO'
            DataType = datInteger
            Required = True
          end>
      end
      item
        Params = <
          item
            Name = 'IDCAMPO'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            TargetTable = 'dbo.SUBTIPOPAGO'
            SQL = 
              'SELECT '#10'    IDSUBTIPOPAGO, CODIGO, NOMBRE, IDTIPOPAGO, FECHA, NU' +
              'MPAGOS, '#10'    PLAZO, IMPORTE'#10'  FROM'#10'    dbo.SUBTIPOPAGO'#10'  WHERE'#10' ' +
              '   dbo.SUBTIPOPAGO.IDTIPOPAGO = :IDCAMPO'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDSUBTIPOPAGO'
                TableField = 'IDSUBTIPOPAGO'
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
                DatasetField = 'IDTIPOPAGO'
                TableField = 'IDTIPOPAGO'
              end
              item
                DatasetField = 'FECHA'
                TableField = 'FECHA'
              end
              item
                DatasetField = 'NUMPAGOS'
                TableField = 'NUMPAGOS'
              end
              item
                DatasetField = 'PLAZO'
                TableField = 'PLAZO'
              end
              item
                DatasetField = 'IMPORTE'
                TableField = 'IMPORTE'
              end>
          end>
        Name = 'dbo SUBTIPOPAGO1'
        Fields = <
          item
            Name = 'IDSUBTIPOPAGO'
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
          end
          item
            Name = 'IDTIPOPAGO'
            DataType = datInteger
            Required = True
          end
          item
            Name = 'FECHA'
            DataType = datDateTime
            Required = True
          end
          item
            Name = 'NUMPAGOS'
            DataType = datInteger
          end
          item
            Name = 'PLAZO'
            DataType = datInteger
          end
          item
            Name = 'IMPORTE'
            DataType = datFloat
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            TargetTable = 'dbo.DATOPROMEDIO'
            SQL = 
              'SELECT '#10'    IDDATOPROMEDIO, NOMBRE, PROMEDIO, CALIFICACIONES, ID' +
              'NIVEL, '#10'    CODIGO, TIPOPROMEDIO, CUAL'#10'  FROM'#10'    dbo.DATOPROMED' +
              'IO'#10'  ORDER BY NOMBRE'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDDATOPROMEDIO'
                TableField = 'IDDATOPROMEDIO'
              end
              item
                DatasetField = 'NOMBRE'
                TableField = 'NOMBRE'
              end
              item
                DatasetField = 'PROMEDIO'
                TableField = 'PROMEDIO'
              end
              item
                DatasetField = 'CALIFICACIONES'
                TableField = 'CALIFICACIONES'
              end
              item
                DatasetField = 'IDNIVEL'
                TableField = 'IDNIVEL'
              end
              item
                DatasetField = 'CODIGO'
                TableField = 'CODIGO'
              end
              item
                DatasetField = 'TIPOPROMEDIO'
                TableField = 'TIPOPROMEDIO'
              end
              item
                DatasetField = 'CUAL'
                TableField = 'CUAL'
              end>
          end>
        Name = 'dbo DATOPROMEDIO'
        Fields = <
          item
            Name = 'IDDATOPROMEDIO'
            DataType = datInteger
            Required = True
            InPrimaryKey = True
          end
          item
            Name = 'NOMBRE'
            DataType = datString
            Size = 50
            Required = True
          end
          item
            Name = 'PROMEDIO'
            DataType = datInteger
            Required = True
          end
          item
            Name = 'CALIFICACIONES'
            DataType = datString
            Size = 40
            Required = True
          end
          item
            Name = 'IDNIVEL'
            DataType = datInteger
            Required = True
          end
          item
            Name = 'CODIGO'
            DataType = datMemo
            Required = True
          end
          item
            Name = 'TIPOPROMEDIO'
            DataType = datInteger
            Required = True
          end
          item
            Name = 'CUAL'
            DataType = datInteger
            Required = True
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            TargetTable = 'dbo.PAGO'
            SQL = 
              'SELECT '#10'    IDPAGO, NUMPAGO, IMPORTE, FECHA, FECHAPAGO, STATUS, ' +
              #10'    INTERES, IDEMPLEADO, IDSUBTIPOPAGO, IDHISTORIALALUMNO, '#10'   ' +
              ' EMITIDO'#10'  FROM'#10'    dbo.PAGO'#10'  WHERE'#10'    dbo.PAGO.IDPAGO = -1'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDPAGO'
                TableField = 'IDPAGO'
              end
              item
                DatasetField = 'NUMPAGO'
                TableField = 'NUMPAGO'
              end
              item
                DatasetField = 'IMPORTE'
                TableField = 'IMPORTE'
              end
              item
                DatasetField = 'FECHA'
                TableField = 'FECHA'
              end
              item
                DatasetField = 'FECHAPAGO'
                TableField = 'FECHAPAGO'
              end
              item
                DatasetField = 'STATUS'
                TableField = 'STATUS'
              end
              item
                DatasetField = 'INTERES'
                TableField = 'INTERES'
              end
              item
                DatasetField = 'IDEMPLEADO'
                TableField = 'IDEMPLEADO'
              end
              item
                DatasetField = 'IDSUBTIPOPAGO'
                TableField = 'IDSUBTIPOPAGO'
              end
              item
                DatasetField = 'IDHISTORIALALUMNO'
                TableField = 'IDHISTORIALALUMNO'
              end
              item
                DatasetField = 'EMITIDO'
                TableField = 'EMITIDO'
              end>
          end>
        Name = 'dbo PAGO'
        Fields = <
          item
            Name = 'IDPAGO'
            DataType = datInteger
            Required = True
            InPrimaryKey = True
          end
          item
            Name = 'NUMPAGO'
            DataType = datInteger
            Required = True
          end
          item
            Name = 'IMPORTE'
            DataType = datFloat
            Required = True
          end
          item
            Name = 'FECHA'
            DataType = datDateTime
            Required = True
          end
          item
            Name = 'FECHAPAGO'
            DataType = datDateTime
          end
          item
            Name = 'STATUS'
            DataType = datString
            Size = 1
            Required = True
          end
          item
            Name = 'INTERES'
            DataType = datFloat
            Required = True
          end
          item
            Name = 'IDEMPLEADO'
            DataType = datInteger
            Required = True
          end
          item
            Name = 'IDSUBTIPOPAGO'
            DataType = datInteger
            Required = True
          end
          item
            Name = 'IDHISTORIALALUMNO'
            DataType = datInteger
            Required = True
          end
          item
            Name = 'EMITIDO'
            DataType = datInteger
            Required = True
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            TargetTable = 'dbo.MENSAJE'
            SQL = 
              'SELECT '#10'    IDMENSAJE, CODIGO, NOMBRE'#10'  FROM'#10'    dbo.MENSAJE'#10'  W' +
              'HERE {Where}'
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDMENSAJE'
                TableField = 'IDMENSAJE'
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
        Name = 'dbo MENSAJE'
        Fields = <
          item
            Name = 'IDMENSAJE'
            DataType = datInteger
            Required = True
            InPrimaryKey = True
          end
          item
            Name = 'CODIGO'
            DataType = datString
            Size = 15
            Required = True
          end
          item
            Name = 'NOMBRE'
            DataType = datString
            Size = 150
            Required = True
          end>
      end
      item
        Params = <
          item
            Name = 'idalumno'
            Value = '1'
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
            SQL = 
              'SELECT MENSAJE.NOMBRE'#10'FROM MENSAJE'#10'   INNER JOIN ALUMNOMENSAJE O' +
              'N (MENSAJE.IDMENSAJE = ALUMNOMENSAJE.IDMENSAJE)'#10'WHERE'#10'   ('#10'     ' +
              ' (ALUMNOMENSAJE.IDALUMNO = :idalumno)'#10'   )'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'NOMBRE'
                TableField = 'NOMBRE'
              end>
          end>
        Name = 'spMensajesBoleta'
        Fields = <
          item
            Name = 'NOMBRE'
            DataType = datString
            Size = 150
          end>
      end
      item
        Params = <
          item
            Name = 'IDALUMNO'
            DataType = datInteger
            Value = ''
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            TargetTable = 'dbo.ALUMNOMENSAJE'
            SQL = 
              'SELECT '#10'    IDALUMNO, IDMENSAJE'#10'  FROM'#10'    dbo.ALUMNOMENSAJE'#10'  W' +
              'HERE'#10'    IDALUMNO = :IDALUMNO'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDALUMNO'
                TableField = 'IDALUMNO'
              end
              item
                DatasetField = 'IDMENSAJE'
                TableField = 'IDMENSAJE'
              end>
          end>
        Name = 'dbo ALUMNOMENSAJE'
        Fields = <
          item
            Name = 'IDALUMNO'
            DataType = datInteger
            Required = True
            InPrimaryKey = True
          end
          item
            Name = 'IDMENSAJE'
            DataType = datInteger
            Required = True
            InPrimaryKey = True
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'GAUSS'
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
            Connection = 'GAUSS'
            Default = True
            TargetTable = 'dbo.Factura'
            SQL = 
              'SELECT '#10'    FacturaID, Folio, Serie, Ejercicio, Periodo, Dia, Fe' +
              'cha, '#10'    Subtotal, Impuesto, Total, ImpuestoPorcentaje, Cancela' +
              'da, '#10'    ClienteID, FormaPagoID, UsuarioID, TipoFacturaID'#10'  FROM' +
              #10'    dbo.Factura'#10'  WHERE 2 = 1'#10
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
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'GAUSS'
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
            Connection = 'GAUSS'
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
            Connection = 'GAUSS'
            Default = True
            TargetTable = 'dbo.Producto'
            SQL = 
              'SELECT '#10'    ProductoID, Codigo, Nombre, PrecioVenta, Costo, IEPS' +
              #10'  FROM'#10'    dbo.Producto'#10'  WHERE {Where}'
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'ProductoID'
                TableField = 'ProductoID'
              end
              item
                DatasetField = 'Codigo'
                TableField = 'Codigo'
              end
              item
                DatasetField = 'Nombre'
                TableField = 'Nombre'
              end
              item
                DatasetField = 'PrecioVenta'
                TableField = 'PrecioVenta'
              end
              item
                DatasetField = 'Costo'
                TableField = 'Costo'
              end
              item
                DatasetField = 'IEPS'
                TableField = 'IEPS'
              end>
          end>
        Name = 'dbo Producto'
        Fields = <
          item
            Name = 'ProductoID'
            DataType = datInteger
            Required = True
          end
          item
            Name = 'Codigo'
            DataType = datString
            Size = 10
            Required = True
          end
          item
            Name = 'Nombre'
            DataType = datString
            Size = 150
          end
          item
            Name = 'PrecioVenta'
            DataType = datFloat
            Required = True
          end
          item
            Name = 'Costo'
            DataType = datFloat
          end
          item
            Name = 'IEPS'
            DataType = datFloat
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            TargetTable = 'dbo.CONFIGURACION'
            SQL = 
              'SELECT '#10'    TIPOCAMBIO, FORMATOCONTROL, ESCUELA, MNIMACAL, MAXIM' +
              'ACAL, '#10'    LOGO, CICLOACTUAL, DIRECCION, TELEFONO, IMAGEN1, IMAG' +
              'EN2, '#10'    FAX, DIRECTOR, MINUTOSXHORA, EMPRESAS, CALIFICACION1, ' +
              #10'    CALIFICACION2, CALIFICACION3, CUENTABANCO1, BOLETAS, FECHAB' +
              'OLETAOFICIAL,'#10'    RFC, NoExterior, Localidad, Municipio, Estado,' +
              ' Pais, noAprobacion,'#10'    Colonia, CodigoPostal, NoCertificado, A' +
              'rchivoClavePrivada, '#10'    ArchivoCertificado, ClavePriv, Certific' +
              'ado, PasswordFCTElect, '#10'    EstacionID, Sucursal, SucursalDE, Te' +
              'lefono1, Telefono2, '#10'    AnoAprobacion, FolioInicial, FolioFinal' +
              ', ImpuestoPorcentaje'#10'  FROM'#10'    dbo.CONFIGURACION'#10'  WHERE {Where' +
              '}'#10
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
                DatasetField = 'CALIFICACION3'
                TableField = 'CALIFICACION3'
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
                DatasetField = 'RFC'
                TableField = 'RFC'
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
            Name = 'CALIFICACION3'
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
            Name = 'RFC'
            DataType = datString
            Size = 50
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
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            TargetTable = 'dbo.ALUMNO'
            SQL = 
              'SELECT '#10'    IDALUMNO, NUMCONTROL, NOMBRE, FECHANACIMIENTO, CURP,' +
              ' '#10'    SEXO, CIUDADNACIMIENTO, DIRECCION, PADRE, MADRE, TELEFONOC' +
              'ASA, '#10'    TELEFONOPADRE, TELEFONOMADRE, FECHAINICIO, EMAIL, EMAI' +
              'LPADRE, '#10'    EMAILMADRE, OBSERVACIONES, IDSTATUS, FOTO, FACTURAD' +
              'OMICILIO, '#10'    FACTURANOMBRE, FACTURATELEFONO, RFC, EMPRESAPADRE' +
              ', '#10'    EMPRESAMADRE, PUESTOMADRE, PUESTOPADRE, APATERNO, AMATERN' +
              'O, '#10'    NOMBRES, NOEXTERIOR, COLONIA, LOCALIDAD, MUNICIPIO, '#10'   ' +
              ' ESTADO, PAIS, CODIGOPOSTAL, GENERARNUMCONTROL'#10'  FROM'#10'    dbo.AL' +
              'UMNO'#10'  WHERE {Where}'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDALUMNO'
                TableField = 'IDALUMNO'
              end
              item
                DatasetField = 'NUMCONTROL'
                TableField = 'NUMCONTROL'
              end
              item
                DatasetField = 'NOMBRE'
                TableField = 'NOMBRE'
              end
              item
                DatasetField = 'FECHANACIMIENTO'
                TableField = 'FECHANACIMIENTO'
              end
              item
                DatasetField = 'CURP'
                TableField = 'CURP'
              end
              item
                DatasetField = 'SEXO'
                TableField = 'SEXO'
              end
              item
                DatasetField = 'CIUDADNACIMIENTO'
                TableField = 'CIUDADNACIMIENTO'
              end
              item
                DatasetField = 'DIRECCION'
                TableField = 'DIRECCION'
              end
              item
                DatasetField = 'PADRE'
                TableField = 'PADRE'
              end
              item
                DatasetField = 'MADRE'
                TableField = 'MADRE'
              end
              item
                DatasetField = 'TELEFONOCASA'
                TableField = 'TELEFONOCASA'
              end
              item
                DatasetField = 'TELEFONOPADRE'
                TableField = 'TELEFONOPADRE'
              end
              item
                DatasetField = 'TELEFONOMADRE'
                TableField = 'TELEFONOMADRE'
              end
              item
                DatasetField = 'FECHAINICIO'
                TableField = 'FECHAINICIO'
              end
              item
                DatasetField = 'EMAIL'
                TableField = 'EMAIL'
              end
              item
                DatasetField = 'EMAILPADRE'
                TableField = 'EMAILPADRE'
              end
              item
                DatasetField = 'EMAILMADRE'
                TableField = 'EMAILMADRE'
              end
              item
                DatasetField = 'OBSERVACIONES'
                TableField = 'OBSERVACIONES'
              end
              item
                DatasetField = 'IDSTATUS'
                TableField = 'IDSTATUS'
              end
              item
                DatasetField = 'FOTO'
                TableField = 'FOTO'
              end
              item
                DatasetField = 'FACTURADOMICILIO'
                TableField = 'FACTURADOMICILIO'
              end
              item
                DatasetField = 'FACTURANOMBRE'
                TableField = 'FACTURANOMBRE'
              end
              item
                DatasetField = 'FACTURATELEFONO'
                TableField = 'FACTURATELEFONO'
              end
              item
                DatasetField = 'RFC'
                TableField = 'RFC'
              end
              item
                DatasetField = 'EMPRESAPADRE'
                TableField = 'EMPRESAPADRE'
              end
              item
                DatasetField = 'EMPRESAMADRE'
                TableField = 'EMPRESAMADRE'
              end
              item
                DatasetField = 'PUESTOMADRE'
                TableField = 'PUESTOMADRE'
              end
              item
                DatasetField = 'PUESTOPADRE'
                TableField = 'PUESTOPADRE'
              end
              item
                DatasetField = 'APATERNO'
                TableField = 'APATERNO'
              end
              item
                DatasetField = 'AMATERNO'
                TableField = 'AMATERNO'
              end
              item
                DatasetField = 'NOMBRES'
                TableField = 'NOMBRES'
              end
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
                DatasetField = 'GENERARNUMCONTROL'
                TableField = 'GENERARNUMCONTROL'
              end>
          end>
        Name = 'dbo ALUMNO'
        Fields = <
          item
            Name = 'IDALUMNO'
            DataType = datInteger
          end
          item
            Name = 'NUMCONTROL'
            DataType = datString
            Size = 12
          end
          item
            Name = 'NOMBRE'
            DataType = datString
            Size = 70
          end
          item
            Name = 'FECHANACIMIENTO'
            DataType = datDateTime
          end
          item
            Name = 'CURP'
            DataType = datString
            Size = 40
          end
          item
            Name = 'SEXO'
            DataType = datString
            Size = 1
          end
          item
            Name = 'CIUDADNACIMIENTO'
            DataType = datString
            Size = 30
          end
          item
            Name = 'DIRECCION'
            DataType = datString
            Size = 75
          end
          item
            Name = 'PADRE'
            DataType = datString
            Size = 70
          end
          item
            Name = 'MADRE'
            DataType = datString
            Size = 70
          end
          item
            Name = 'TELEFONOCASA'
            DataType = datString
            Size = 20
          end
          item
            Name = 'TELEFONOPADRE'
            DataType = datString
            Size = 20
          end
          item
            Name = 'TELEFONOMADRE'
            DataType = datString
            Size = 20
          end
          item
            Name = 'FECHAINICIO'
            DataType = datDateTime
          end
          item
            Name = 'EMAIL'
            DataType = datString
            Size = 40
          end
          item
            Name = 'EMAILPADRE'
            DataType = datString
            Size = 40
          end
          item
            Name = 'EMAILMADRE'
            DataType = datString
            Size = 40
          end
          item
            Name = 'OBSERVACIONES'
            DataType = datMemo
          end
          item
            Name = 'IDSTATUS'
            DataType = datInteger
          end
          item
            Name = 'FOTO'
            DataType = datMemo
          end
          item
            Name = 'FACTURADOMICILIO'
            DataType = datString
            Size = 70
          end
          item
            Name = 'FACTURANOMBRE'
            DataType = datString
            Size = 70
          end
          item
            Name = 'FACTURATELEFONO'
            DataType = datString
            Size = 20
          end
          item
            Name = 'RFC'
            DataType = datString
            Size = 20
          end
          item
            Name = 'EMPRESAPADRE'
            DataType = datString
            Size = 50
          end
          item
            Name = 'EMPRESAMADRE'
            DataType = datString
            Size = 50
          end
          item
            Name = 'PUESTOMADRE'
            DataType = datString
            Size = 25
          end
          item
            Name = 'PUESTOPADRE'
            DataType = datString
            Size = 25
          end
          item
            Name = 'APATERNO'
            DataType = datString
            Size = 20
          end
          item
            Name = 'AMATERNO'
            DataType = datString
            Size = 20
          end
          item
            Name = 'NOMBRES'
            DataType = datString
            Size = 25
          end
          item
            Name = 'NOEXTERIOR'
            DataType = datString
            Size = 20
          end
          item
            Name = 'COLONIA'
            DataType = datString
            Size = 40
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
          end
          item
            Name = 'GENERARNUMCONTROL'
            DataType = datBoolean
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            TargetTable = 'dbo.PROSPECTO'
            SQL = 
              'SELECT '#10'    IDPROSPECTO, NOMBRE, FECHANACIMIENTO, SEXO, CIUDADNA' +
              'CIMIENTO, '#10'    DIRECCION, PADRE, MADRE, TELEFONOCASA, EMAIL, EMA' +
              'ILPADRE, '#10'    EMAILMADRE, APATERNO, AMATERNO, NOMBRES, ESCUELAPR' +
              'OCEDENCIA'#10'  FROM'#10'    dbo.PROSPECTO'#10'  WHERE {Where}'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IDPROSPECTO'
                TableField = 'IDPROSPECTO'
              end
              item
                DatasetField = 'NOMBRE'
                TableField = 'NOMBRE'
              end
              item
                DatasetField = 'FECHANACIMIENTO'
                TableField = 'FECHANACIMIENTO'
              end
              item
                DatasetField = 'SEXO'
                TableField = 'SEXO'
              end
              item
                DatasetField = 'CIUDADNACIMIENTO'
                TableField = 'CIUDADNACIMIENTO'
              end
              item
                DatasetField = 'DIRECCION'
                TableField = 'DIRECCION'
              end
              item
                DatasetField = 'PADRE'
                TableField = 'PADRE'
              end
              item
                DatasetField = 'MADRE'
                TableField = 'MADRE'
              end
              item
                DatasetField = 'TELEFONOCASA'
                TableField = 'TELEFONOCASA'
              end
              item
                DatasetField = 'EMAIL'
                TableField = 'EMAIL'
              end
              item
                DatasetField = 'EMAILPADRE'
                TableField = 'EMAILPADRE'
              end
              item
                DatasetField = 'EMAILMADRE'
                TableField = 'EMAILMADRE'
              end
              item
                DatasetField = 'APATERNO'
                TableField = 'APATERNO'
              end
              item
                DatasetField = 'AMATERNO'
                TableField = 'AMATERNO'
              end
              item
                DatasetField = 'NOMBRES'
                TableField = 'NOMBRES'
              end
              item
                DatasetField = 'ESCUELAPROCEDENCIA'
                TableField = 'ESCUELAPROCEDENCIA'
              end>
          end>
        Name = 'dbo PROSPECTO'
        Fields = <
          item
            Name = 'IDPROSPECTO'
            DataType = datInteger
          end
          item
            Name = 'NOMBRE'
            DataType = datString
            Size = 70
          end
          item
            Name = 'FECHANACIMIENTO'
            DataType = datDateTime
          end
          item
            Name = 'SEXO'
            DataType = datString
            Size = 1
          end
          item
            Name = 'CIUDADNACIMIENTO'
            DataType = datString
            Size = 30
          end
          item
            Name = 'DIRECCION'
            DataType = datString
            Size = 75
          end
          item
            Name = 'PADRE'
            DataType = datString
            Size = 70
          end
          item
            Name = 'MADRE'
            DataType = datString
            Size = 70
          end
          item
            Name = 'TELEFONOCASA'
            DataType = datString
            Size = 20
          end
          item
            Name = 'EMAIL'
            DataType = datString
            Size = 40
          end
          item
            Name = 'EMAILPADRE'
            DataType = datString
            Size = 40
          end
          item
            Name = 'EMAILMADRE'
            DataType = datString
            Size = 40
          end
          item
            Name = 'APATERNO'
            DataType = datString
            Size = 20
          end
          item
            Name = 'AMATERNO'
            DataType = datString
            Size = 20
          end
          item
            Name = 'NOMBRES'
            DataType = datString
            Size = 25
          end
          item
            Name = 'ESCUELAPROCEDENCIA'
            DataType = datString
            Size = 200
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
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
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
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
            SQL = 
              'insert into dbo.Factura'#10'   (FacturaID, Folio, Serie, Fecha, Ejer' +
              'cicio, Periodo, Dia, Subtotal, Impuesto,'#10'    Total, ImpuestoPorc' +
              'entaje, Cancelada, ClienteID, FormaPagoID, UsuarioID)'#10'    Values' +
              #10'    (:FacturaID, :Folio, :Serie, :Fecha, :Ejercicio, :Periodo, ' +
              ':Dia, :Subtotal, :Impuesto,'#10'     :Total, :ImpuestoPorcentaje, 0,' +
              ' :ClienteID,:FormaPagoID, :UsuarioID)'#10
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
            Connection = 'GAUSS'
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
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
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
            Name = 'IDCICLO'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
            SQL = 
              'declare @idhistorialgrupo as int'#10'declare @i as int'#10'declare curso' +
              'grupo SCROLL CURSOR FOR'#10'select idgrupo from grupo where idgrupo ' +
              'not in (select idgrupo from historialgrupo where idciclo = :IDCI' +
              'CLO)'#10#10'open cursogrupo'#10'fetch next from cursogrupo'#10'into @i'#10'while @' +
              '@fetch_status = 0'#10'begin'#10'    select @idhistorialgrupo = (select M' +
              'ax(idhistorialgrupo) from historialgrupo) + 1'#10#10'    INSERT INTO H' +
              'ISTORIALGRUPO ('#10'    IDHISTORIALGRUPO,'#10'    IDGRUPO,'#10'    IDCICLO)'#10 +
              '    VALUES ('#10'    @idhistorialgrupo,'#10'    @i,'#10'    :IDCICLO);'#10#10'    ' +
              'fetch next from cursogrupo'#10'    into @i'#10'end'#10#10'deallocate cursogrup' +
              'o'#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'spInicioCiclo'
      end
      item
        Params = <
          item
            Name = 'IDMATERIA'
            Value = ''
          end
          item
            Name = 'IDMAESTRO'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
            SQL = 
              'DELETE FROM MAESTROMATERIA'#10'WHERE IDMATERIA=:IDMATERIA AND IDMAES' +
              'TRO=:IDMAESTRO'#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'EliminaMateriaMaestro'
      end
      item
        Params = <
          item
            Name = 'pagomateria'
            Value = ''
          end
          item
            Name = 'idgrupotarget'
            Value = ''
          end
          item
            Name = 'idgruposource'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
            SQL = 
              'declare @aux int'#10'declare @aux2 int'#10#10'if (:pagomateria = 1)'#10'Begin'#10 +
              '  delete from grupopago where idgrupo = :idgrupotarget'#10'  declare' +
              ' cursoGrupoPago SCROLL CURSOR FOR'#10'  select idsubtipopago from gr' +
              'upopago where idgrupo = :idgruposource'#10#10'  open cursoGrupoPago'#10'  ' +
              'fetch next from cursoGrupoPago'#10'  into @aux'#10'  while @@fetch_statu' +
              's = 0'#10'  begin'#10'     insert into grupopago (idsubtipopago, idgrupo' +
              ') values (@aux, :idgrupotarget)'#10'     fetch next from cursoGrupoP' +
              'ago'#10'     into @aux'#10'  end'#10'  deallocate cursoGrupoPago'#10'End'#10'Else be' +
              'gin'#10#10'  delete from materiagrupo where idgrupo = :idgrupotarget'#10' ' +
              ' declare cursoMateriaGrupo SCROLL CURSOR FOR'#10'  select idmateria,' +
              ' idmaestro from materiagrupo where idgrupo = :idgruposource'#10#10'  o' +
              'pen cursoMateriaGrupo'#10'  fetch next from cursoMateriaGrupo'#10'  into' +
              ' @aux,@aux2'#10'  while @@fetch_status = 0'#10'  begin'#10'     insert into ' +
              'materiagrupo (idmateria, idgrupo, idmaestro) values (@aux, :idgr' +
              'upotarget, @aux2)'#10'     fetch next from cursoMateriaGrupo'#10'     in' +
              'to @aux,@aux2'#10'  end'#10'  deallocate cursoMateriaGrupo'#10'end'#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'spDragPagoMateria'
      end
      item
        Params = <
          item
            Name = 'IDHISTORIALGRUPO'
            Value = ''
          end
          item
            Name = 'DOCUMENTOSFALTANTES'
            Value = ''
          end
          item
            Name = 'BECA'
            Value = ''
          end
          item
            Name = 'DESCUENTO'
            Value = ''
          end
          item
            Name = 'IDHISTORIALALUMNO'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
            SQL = 
              'UPDATE HISTORIALALUMNO'#10'  SET'#10'    IDHISTORIALGRUPO = :IDHISTORIAL' +
              'GRUPO,'#10'    DOCUMENTOSFALTANTES=:DOCUMENTOSFALTANTES,'#10'    BECA = ' +
              ':BECA,'#10'    DESCUENTO = :DESCUENTO'#10'  WHERE'#10'    (IDHISTORIALALUMNO' +
              ' = :IDHISTORIALALUMNO)'#10#10'  UPDATE CALIFICACION'#10'  SET'#10'    IDHISTOR' +
              'IALGRUPO = :IDHISTORIALGRUPO'#10'  WHERE'#10'    (IDHISTORIALALUMNO = :I' +
              'DHISTORIALALUMNO)'#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'spCambioGrupo'
      end
      item
        Params = <
          item
            Name = 'IDTIPOPAGO'
            Value = ''
          end
          item
            Name = 'IDSUBTIPOPAGO'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
            SQL = 
              'UPDATE SUBTIPOPAGO'#10'SET IDTIPOPAGO = :IDTIPOPAGO'#10'WHERE IDSUBTIPOP' +
              'AGO = :IDSUBTIPOPAGO'#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'spActualizaSubTipoPago'
      end
      item
        Params = <
          item
            Name = 'idsubtipopago'
            Value = ''
          end
          item
            Name = 'idciclo'
            Value = ''
          end
          item
            Name = 'idgrupo'
            Value = ''
          end
          item
            Name = 'status'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
            SQL = 
              'delete from pagocaja where idpago in (select idpago from'#10'(SELECT' +
              ' ALUMNO.IDALUMNO,'#10'       ALUMNO.NUMCONTROL,'#10'       ALUMNO.NOMBRE' +
              ','#10'       VWTIPOPAGO.SUBTIPOCODIGO,'#10'       VWTIPOPAGO.SUBTIPONOMB' +
              'RE,'#10'       ALUMNO.IDSTATUS,'#10'       HISTORIALGRUPO.IDCICLO,'#10'     ' +
              '  historialgrupo.idgrupo,'#10'       PAGO.IDPAGO,'#10'       PAGO.NUMPAG' +
              'O,'#10'       PAGO.IMPORTE,'#10'       PAGO.FECHA,'#10'       PAGO.FECHAPAGO' +
              ','#10'       PAGO.STATUS,'#10'       PAGO.INTERES,'#10'       pago.idsubtipo' +
              'pago,'#10'       HISTORIALALUMNO.BECA,'#10'       HISTORIALALUMNO.DESCUE' +
              'NTO'#10'FROM PAGO'#10'   INNER JOIN HISTORIALALUMNO ON (PAGO.IDHISTORIAL' +
              'ALUMNO = HISTORIALALUMNO.IDHISTORIALALUMNO)'#10'   INNER JOIN ALUMNO' +
              ' ON (HISTORIALALUMNO.IDALUMNO = ALUMNO.IDALUMNO)'#10'   INNER JOIN H' +
              'ISTORIALGRUPO ON (HISTORIALALUMNO.IDHISTORIALGRUPO = HISTORIALGR' +
              'UPO.IDHISTORIALGRUPO)'#10'   INNER JOIN'#10'   (SELECT TIPOSPAGO.IDTIPOP' +
              'AGO,'#10'       TIPOSPAGO.CODIGO AS TIPOCODIGO,'#10'       TIPOSPAGO.NOM' +
              'BRE AS TIPONOMBRE,'#10'       tipospago.aplicabeca,'#10'       tipospago' +
              '.aplicadescuento,'#10'       SUBTIPOPAGO.IDSUBTIPOPAGO,'#10'       SUBTI' +
              'POPAGO.CODIGO AS SUBTIPOCODIGO,'#10'       SUBTIPOPAGO.NOMBRE AS SUB' +
              'TIPONOMBRE,'#10'       SUBTIPOPAGO.FECHA,'#10'       SUBTIPOPAGO.NUMPAGO' +
              'S,'#10'       SUBTIPOPAGO.PLAZO,'#10'       SUBTIPOPAGO.IMPORTE'#10'     FRO' +
              'M SUBTIPOPAGO'#10'       RIGHT OUTER JOIN TIPOSPAGO ON (SUBTIPOPAGO.' +
              'IDTIPOPAGO = TIPOSPAGO.IDTIPOPAGO))'#10'     VWTIPOPAGO ON (PAGO.IDS' +
              'UBTIPOPAGO = VWTIPOPAGO.IDSUBTIPOPAGO))'#10'VWTODOSLOSPAGOS'#10'where id' +
              'subtipopago = :idsubtipopago and'#10'idciclo = :idciclo and idgrupo ' +
              '= :idgrupo and '#39'||'#39'+:status +'#39'||'#39' like '#39'%'#39'+'#39'||'#39'+ status +'#39'||'#39'+'#39'%' +
              #39')'#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'spEliminaPagoCaja'
      end
      item
        Params = <
          item
            Name = 'idsubtipopago'
            Value = ''
          end
          item
            Name = 'status'
            Value = ''
          end
          item
            Name = 'idciclo'
            Value = ''
          end
          item
            Name = 'idgrupo'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
            SQL = 
              'delete from pago'#10'where idsubtipopago = :idsubtipopago and '#39'||'#39'+:' +
              'status +'#39'||'#39' like '#39'%'#39'+'#39'||'#39'+ status +'#39'||'#39'+'#39'%'#39'  and'#10'idhistorialalu' +
              'mno in (select idhistorialalumno from'#10'(SELECT HISTORIALALUMNO.ID' +
              'HISTORIALALUMNO,'#10'       HISTORIALALUMNO.DOCUMENTOSFALTANTES,'#10'   ' +
              '    VWHISTORIALGRUPO.IDHISTORIALGRUPO,'#10'       VWHISTORIALGRUPO.I' +
              'DCICLO,'#10'       VWHISTORIALGRUPO.IDGRUPO,'#10'       VWHISTORIALGRUPO' +
              '.IDNIVEL,'#10'       ALUMNO.IDALUMNO,'#10'       ALUMNO.NOMBRE AS ALUMNO' +
              'NOMBRE,'#10'       ALUMNO.NUMCONTROL AS ALUMNONUMCONTROL,'#10'       ALU' +
              'MNO.SEXO AS ALUMNOSEXO,'#10'       VWHISTORIALGRUPO.GRUPOCODIGO,'#10'   ' +
              '    VWHISTORIALGRUPO.GRUPONOMBRE,'#10'       VWHISTORIALGRUPO.GRUPOA' +
              'UX1,'#10'       VWHISTORIALGRUPO.GRUPOAUX2,'#10'       VWHISTORIALGRUPO.' +
              'NIVELCODIGO,'#10'       VWHISTORIALGRUPO.NIVELNOMBRE,'#10'       VWHISTO' +
              'RIALGRUPO.NIVELAUX1,'#10'       VWHISTORIALGRUPO.NIVELAUX2,'#10'       V' +
              'WHISTORIALGRUPO.CICLOCODIGO,'#10'       VWHISTORIALGRUPO.CICLONOMBRE' +
              ','#10'       VWHISTORIALGRUPO.CICLOAUX1,'#10'       VWHISTORIALGRUPO.CIC' +
              'LOAUX2,'#10'       VWHISTORIALGRUPO.CICLOFECHAINICIO,'#10'       VWHISTO' +
              'RIALGRUPO.CICLOFECHAFINAL,'#10'       STATUS.IDSTATUS,'#10'       STATUS' +
              '.CODIGO AS STATUSCODIGO,'#10'       STATUS.NOMBRE AS STATUSNOMBRE,'#10' ' +
              '      HISTORIALALUMNO.BECA,'#10'       HISTORIALALUMNO.DESCUENTO'#10'FRO' +
              'M STATUS'#10'   INNER JOIN ALUMNO ON (STATUS.IDSTATUS = ALUMNO.IDSTA' +
              'TUS)'#10'   INNER JOIN HISTORIALALUMNO ON (ALUMNO.IDALUMNO = HISTORI' +
              'ALALUMNO.IDALUMNO)'#10'   INNER JOIN'#10'   (SELECT HISTORIALGRUPO.IDHIS' +
              'TORIALGRUPO,'#10'    NIVEL.IDNIVEL,'#10'    CICLO.IDCICLO,'#10'    GRUPO.IDG' +
              'RUPO,'#10'    GRUPO.CODIGO AS GRUPOCODIGO,'#10'    GRUPO.NOMBRE AS GRUPO' +
              'NOMBRE,'#10'    GRUPO.NOMBREaux1 AS GRUPOaux1,'#10'    GRUPO.NOMBREaux2 ' +
              'AS GRUPOaux2,'#10'    grupo.cupo,'#10'    NIVEL.CODIGO AS NIVELCODIGO,'#10' ' +
              '   NIVEL.NOMBRE AS NIVELNOMBRE,'#10'    NIVEL.NOMBREaux1 AS NIVELaux' +
              '1,'#10'    NIVEL.NOMBREaux2 AS NIVELaux2,'#10'    CICLO.CODIGO AS CICLOC' +
              'ODIGO,'#10'    CICLO.NOMBRE AS CICLONOMBRE,'#10'    CICLO.NOMBREaux1 AS ' +
              'CICLOaux1,'#10'    CICLO.NOMBREaux2 AS CICLOaux2,'#10'    CICLO.FECHAFIN' +
              'AL AS CICLOFECHAFINAL,'#10'    CICLO.FECHAINICIO AS CICLOFECHAINICIO' +
              #10'    FROM GRUPO'#10'    INNER JOIN NIVEL ON (GRUPO.IDNIVEL = NIVEL.I' +
              'DNIVEL)'#10'    INNER JOIN HISTORIALGRUPO ON (GRUPO.IDGRUPO = HISTOR' +
              'IALGRUPO.IDGRUPO)'#10'    INNER JOIN CICLO ON (HISTORIALGRUPO.IDCICL' +
              'O = CICLO.IDCICLO))'#10'    VWHISTORIALGRUPO'#10'    ON (HISTORIALALUMNO' +
              '.IDHISTORIALGRUPO = VWHISTORIALGRUPO.IDHISTORIALGRUPO))'#10'    vwhi' +
              'storialalumno'#10'where idciclo = :idciclo and idgrupo = :idgrupo )'#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'spEliminaPago'
      end
      item
        Params = <
          item
            Name = 'IDCAJA'
            Value = ''
          end
          item
            Name = 'IDEMPLEADO'
            Value = ''
          end
          item
            Name = 'TIPOPAGO'
            Value = ''
          end
          item
            Name = 'OBSERVACIONES'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
            SQL = 
              'INSERT INTO CAJA ('#10'    IDCAJA,'#10'    FECHA,'#10'    IDEMPLEADO,'#10'    TI' +
              'POPAGO,'#10'    OBSERVACIONES,'#10'    STATUS,'#10'    IMPORTE)'#10'  VALUES ('#10' ' +
              '   :IDCAJA,'#10'    GETDATE(),'#10'    :IDEMPLEADO,'#10'    :TIPOPAGO,'#10'    :' +
              'OBSERVACIONES,'#10'    '#39'P'#39','#10'    0)'#10#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'spInsertaCaja'
      end
      item
        Params = <
          item
            Name = 'INTERES'
            Value = ''
          end
          item
            Name = 'IDEMPLEADO'
            Value = ''
          end
          item
            Name = 'IDPAGO'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
            SQL = 
              '  UPDATE PAGO'#10'  SET'#10'    FECHAPAGO = GETDATE(),'#10'    STATUS = '#39'P'#39',' +
              #10'    INTERES = :INTERES,'#10'    IDEMPLEADO = :IDEMPLEADO'#10'  WHERE'#10'  ' +
              '  (IDPAGO = :IDPAGO)'#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'spLiquidaPago'
      end
      item
        Params = <
          item
            Name = 'idpago'
            Value = ''
          end
          item
            Name = 'IDPAGO_2'
            Value = ''
          end
          item
            Name = 'importes'
            Value = ''
          end
          item
            Name = 'interes'
            Value = ''
          end
          item
            Name = 'IDEMPLEADO'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
            SQL = 
              'declare @importe int'#10'declare @numpago int'#10'declare @idsubtipo int' +
              #10'declare @fecha datetime'#10'declare @idhistorial int'#10'declare @id in' +
              't'#10#10'  select @importe = importe, @numpago = ISNULL(numpago,0), @i' +
              'dsubtipo = ISNULL(idsubtipopago,0),'#10'         @fecha= fecha, @idh' +
              'istorial = idhistorialalumno from pago'#10'  where idpago = :idpago'#10 +
              #10'  Set @id = :IDPAGO_2'#10'  '#10'  INSERT INTO PAGO ('#10'    IDPAGO,'#10'    N' +
              'UMPAGO,'#10'    IMPORTE,'#10'    FECHA,'#10'    STATUS,'#10'    INTERES,'#10'    IDE' +
              'MPLEADO,'#10'    IDSUBTIPOPAGO,'#10'    IDHISTORIALALUMNO,'#10'    fechapago' +
              ','#10'    EMITIDO)'#10'  VALUES ('#10'    @id,'#10'    @numpago,'#10'    :importes,'#10 +
              '    @fecha,'#10'    '#39'P'#39','#10'    :interes,'#10'    :IDEMPLEADO,'#10'    @idsubti' +
              'po,'#10'    @idhistorial,'#10'    GETDATE(),'#10'    0)'#10#10'  update pago'#10'  set' +
              ' importe = @IMPORTE + :INTERES - :IMPORTES,'#10'      interes = 0'#10'  ' +
              'where idpago = :idpago'#10#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'spDividePago'
      end
      item
        Params = <
          item
            Name = 'IDPAGO'
            Value = ''
          end
          item
            Name = 'IDCAJA'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
            SQL = 
              '  INSERT INTO PAGOCAJA ('#10'    IDPAGO,'#10'    IDCAJA)'#10'  VALUES ('#10'    ' +
              ':IDPAGO,'#10'    :IDCAJA);'#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'spInsertPagoCaja'
      end
      item
        Params = <
          item
            Name = 'idmateria'
            Value = ''
          end
          item
            Name = 'idhistorialalumno'
            Value = ''
          end
          item
            Name = 'idHistorialGRupo'
            Value = ''
          end
          item
            Name = 'IDTIPOCALIFICACION'
            Value = ''
          end
          item
            Name = 'calificacion'
            Value = ''
          end
          item
            Name = 'faltas'
            Value = ''
          end
          item
            Name = 'fecha'
            Value = ''
          end
          item
            Name = 'califaux2'
            Value = ''
          end
          item
            Name = 'califaux1'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
            SQL = 
              'declare @letra as varchar(1)'#10'DECLARE @enc as int'#10'declare @minimo' +
              ' as float'#10#10'  select @enc = (select count(*)'#10'  from calificacion'#10 +
              '  where'#10'  idmateria =:idmateria'#10'  and IDHISTORIALALUMNO =:idhist' +
              'orialalumno'#10'  and idHistorialGrupo =:idHistorialGRupo'#10'  and IDTI' +
              'POCALIFICACION =:IDTIPOCALIFICACION)'#10#10'if (@enc > 0)'#10'    update c' +
              'alificacion'#10'    set'#10'      calificacion = :calificacion,'#10'      fa' +
              'ltas = :faltas,'#10'      fecha  = :fecha,'#10'      califaux2 =:califau' +
              'x2,'#10'      califaux1 =:califaux1'#10'    where'#10'      idhistorialalumn' +
              'o=:IDHISTORIALALUMNO'#10'    and'#10'      IDHISTORIALGRUPO=:IDHISTORIAL' +
              'GRUPO'#10'    and'#10'      idMateria = :idMateria'#10'    and'#10'     idTipoCa' +
              'lificacion=:idtipocalificacion'#10'else'#10'begin'#10#10'    set @letra = '#39'A'#39#10 +
              '    if (@minimo > :calificacion)'#10'    set @letra = '#39'R'#39#10#10'    selec' +
              't @minimo = (select minimoApro from materia'#10'                    ' +
              '  where idmateria = :idmateria)'#10'                      '#10'    inser' +
              't into calificacion (calificacion, status, faltas, idmateria,'#10'  ' +
              '         idhistorialalumno, idhistorialgrupo, fecha, idtipocalif' +
              'icacion,califaux2,califaux1)'#10'    values (:calificacion, @letra, ' +
              ':faltas, :idmateria,'#10'           :idhistorialalumno, :idhistorial' +
              'grupo, :fecha, :idtipocalificacion, :califaux2,:califaux1)'#10#10#10'end' +
              #10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'spAplicaCalif'
      end
      item
        Params = <
          item
            Name = 'idhistorialalumno'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
            SQL = 
              '  delete from PAGOcaja where idPAGO in (select IDPAGO from pago ' +
              'where idhistorialalumno = :idhistorialalumno)'#10'  delete from pago' +
              ' where idhistorialalumno = :idhistorialalumno'#10'  delete from cali' +
              'ficacion where idhistorialalumno = :idhistorialalumno'#10'  DELETE F' +
              'ROM HISTORIALALUMNO  WHERE (IDHISTORIALALUMNO = :IDHISTORIALALUM' +
              'NO)'#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'spHistorialAlumnoDel'
      end
      item
        Params = <
          item
            Name = 'IDHISTORIALALUMNO'
            Value = ''
          end
          item
            Name = 'BECA'
            Value = ''
          end
          item
            Name = 'DESCUENTO'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
            SQL = 
              'DECLARE @APLICA INT'#10'DECLARE @IDPAGO INT'#10'DECLARE @IDSUBTIPOPAGO I' +
              'NT'#10'DECLARE @IMPORTES FLOAT'#10'DECLARE @MENOS FLOAT'#10#10'  /* Procedure ' +
              'body */'#10'  declare CursorPago SCROLL CURSOR FOR'#10'  SELECT IDPAGO, ' +
              'IDSUBTIPOPAGO, IMPORTE FROM PAGO'#10'  WHERE IDHISTORIALALUMNO = :ID' +
              'HISTORIALALUMNO AND STATUS = '#39'D'#39#10#10'open CursorPago'#10'fetch next fro' +
              'm CursorPago'#10'into @IDPAGO, @IDSUBTIPOPAGO, @IMPORTES'#10#10'while @@fe' +
              'tch_status = 0'#10'begin'#10#10#10'    SET @MENOS = 0'#10'    SET @APLICA = 0'#10#10' ' +
              '   SELECT @APLICA = APLICABECA FROM'#10'    (SELECT TIPOSPAGO.IDTIPO' +
              'PAGO,'#10'       TIPOSPAGO.CODIGO AS TIPOCODIGO,'#10'       TIPOSPAGO.NO' +
              'MBRE AS TIPONOMBRE,'#10'       tipospago.aplicabeca,'#10'       tipospag' +
              'o.aplicadescuento,'#10'       SUBTIPOPAGO.IDSUBTIPOPAGO,'#10'       SUBT' +
              'IPOPAGO.CODIGO AS SUBTIPOCODIGO,'#10'       SUBTIPOPAGO.NOMBRE AS SU' +
              'BTIPONOMBRE,'#10'       SUBTIPOPAGO.FECHA,'#10'       SUBTIPOPAGO.NUMPAG' +
              'OS,'#10'       SUBTIPOPAGO.PLAZO,'#10'       SUBTIPOPAGO.IMPORTE'#10'       ' +
              'FROM SUBTIPOPAGO'#10'       RIGHT OUTER JOIN TIPOSPAGO ON (SUBTIPOPA' +
              'GO.IDTIPOPAGO = TIPOSPAGO.IDTIPOPAGO))'#10'    VWTIPOPAGO'#10'    WHERE ' +
              'IDSUBTIPOPAGO = @IDSUBTIPOPAGO'#10#10'    IF (@APLICA = 1)'#10'    SET @ME' +
              'NOS = @MENOS + @IMPORTES - (@IMPORTES * ((100 - :BECA) / 100))'#10#10 +
              '    SET @APLICA=0'#10#10'     SELECT @APLICA = APLICADESCUENTO FROM'#10'  ' +
              '  (SELECT TIPOSPAGO.IDTIPOPAGO,'#10'       TIPOSPAGO.CODIGO AS TIPOC' +
              'ODIGO,'#10'       TIPOSPAGO.NOMBRE AS TIPONOMBRE,'#10'       tipospago.a' +
              'plicabeca,'#10'       tipospago.aplicadescuento,'#10'       SUBTIPOPAGO.' +
              'IDSUBTIPOPAGO,'#10'       SUBTIPOPAGO.CODIGO AS SUBTIPOCODIGO,'#10'     ' +
              '  SUBTIPOPAGO.NOMBRE AS SUBTIPONOMBRE,'#10'       SUBTIPOPAGO.FECHA,' +
              #10'       SUBTIPOPAGO.NUMPAGOS,'#10'       SUBTIPOPAGO.PLAZO,'#10'       S' +
              'UBTIPOPAGO.IMPORTE'#10'       FROM SUBTIPOPAGO'#10'       RIGHT OUTER JO' +
              'IN TIPOSPAGO ON (SUBTIPOPAGO.IDTIPOPAGO = TIPOSPAGO.IDTIPOPAGO))' +
              #10'    VWTIPOPAGO'#10'    WHERE IDSUBTIPOPAGO = @IDSUBTIPOPAGO'#10#10'    IF' +
              ' (@APLICA = 1)'#10'    SET @MENOS = @MENOS  + (@IMPORTES - (@IMPORTE' +
              'S * ((100 - :DESCUENTO) / 100)))'#10'    '#10'    UPDATE PAGO'#10'    SET IM' +
              'PORTE = @IMPORTES - @MENOS'#10'    WHERE IDPAGO = @IDPAGO'#10'    '#10'    f' +
              'etch next from CursorPago'#10'    into @IDPAGO, @IDSUBTIPOPAGO, @IMP' +
              'ORTES'#10#10'END'#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'spBecaDescuento'
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
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
            SQL = 
              'DECLARE @CONT INT'#10#10'SELECT @CONT = (SELECT 0)'#10#10'SELECT @CONT = (SE' +
              'LECT COUNT(*) FROM DBO.FACTURAELECTRONICA WHERE DBO.FACTURAELECT' +
              'RONICA.FACTURAID = :FacturaID)'#10#10'IF @CONT = 0'#10'BEGIN'#10'insert into'#10' ' +
              '  dbo.FacturaElectronica'#10'  (FacturaElectornicaID, CadenaOriginal' +
              ', SelloDigital, FacturaID, Vigencia, Enviado, NoCertificado, Noa' +
              'probacion, FechaAprobacion)'#10'   values'#10'  (:FacturaElectornicaID, ' +
              ':CadenaOriginal, :SelloDigital, :FacturaID, :Vigencia, :Enviado,' +
              ' :NoCertificado, :Noaprobacion, :FechaAprobacion)'#10'END'#10#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'spInsertaFCTELECTRONICA'
      end
      item
        Params = <
          item
            Name = 'UsuarioID'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
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
            Connection = 'GAUSS'
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
            Connection = 'GAUSS'
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
            Name = 'IDMAESTRODISPONIBILIDAD'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'INICIO'
            DataType = datDateTime
            Value = ''
          end
          item
            Name = 'FIN'
            DataType = datDateTime
            Value = ''
          end
          item
            Name = 'IDMAESTRO'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'TEXTO'
            DataType = datString
            Size = 150
            Value = ''
          end
          item
            Name = 'COLOR'
            DataType = datInteger
            Value = ''
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            TargetTable = 'dbo.MAESTRODISPONIBILIDAD'
            SQL = 
              'INSERT'#10'  INTO dbo.MAESTRODISPONIBILIDAD'#10'    (IDMAESTRODISPONIBIL' +
              'IDAD, INICIO, FIN, IDMAESTRO, TEXTO, COLOR)'#10'  VALUES'#10'    (:IDMAE' +
              'STRODISPONIBILIDAD, :INICIO, :FIN, :IDMAESTRO, :TEXTO, :COLOR)'#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'Insert_dbo MAESTRODISPONIBILIDAD'
      end
      item
        Params = <
          item
            Name = 'OLD_IDMAESTRODISPONIBILIDAD'
            DataType = datInteger
            Value = ''
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            TargetTable = 'dbo.MAESTRODISPONIBILIDAD'
            SQL = 
              'DELETE '#10'  FROM'#10'    dbo.MAESTRODISPONIBILIDAD'#10'  WHERE'#10'    (IDMAES' +
              'TRODISPONIBILIDAD = :OLD_IDMAESTRODISPONIBILIDAD)'
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'Delete_dbo MAESTRODISPONIBILIDAD'
      end
      item
        Params = <
          item
            Name = 'IDMAESTRODISPONIBILIDAD'
            Value = ''
          end
          item
            Name = 'INICIO'
            Value = ''
          end
          item
            Name = 'FIN'
            Value = ''
          end
          item
            Name = 'IDMAESTRO'
            Value = ''
          end
          item
            Name = '='
            Value = ''
          end
          item
            Name = 'TEXTO'
            Value = ''
          end
          item
            Name = 'COLOR'
            Value = ''
          end
          item
            Name = 'OLD_IDMAESTRODISPONIBILIDAD'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            TargetTable = 'dbo.MAESTRODISPONIBILIDAD'
            SQL = 
              'UPDATE dbo.MAESTRODISPONIBILIDAD'#10'  SET '#10'    IDMAESTRODISPONIBILI' +
              'DAD = :IDMAESTRODISPONIBILIDAD, '#10'    INICIO = :INICIO, '#10'    FIN ' +
              '= :FIN, '#10'    IDMAESTRO = :IDMAESTRO,'#10'    TEXTO:= :TEXTO,'#10'    COL' +
              'OR:= :COLOR'#10'  WHERE'#10'    (IDMAESTRODISPONIBILIDAD = :OLD_IDMAESTR' +
              'ODISPONIBILIDAD)'#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'Update_dbo MAESTRODISPONIBILIDAD'
      end
      item
        Params = <
          item
            Name = 'IDHISTORIALALUMNO'
            Value = ''
          end
          item
            Name = 'IDHISTORIALGRUPO'
            Value = ''
          end
          item
            Name = 'IDALUMNO'
            Value = ''
          end
          item
            Name = 'DOCUMENTOSFALTANTES'
            Value = ''
          end
          item
            Name = 'BECA'
            Value = ''
          end
          item
            Name = 'DESCUENTO'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            Name = 'GAUSS'
            SQL = 
              '  INSERT INTO HISTORIALALUMNO ('#10'    IDHISTORIALALUMNO,'#10'    IDHIS' +
              'TORIALGRUPO,'#10'    IDALUMNO,'#10'    DOCUMENTOSFALTANTES,'#10'    BECA,'#10'  ' +
              '  DESCUENTO)'#10'  VALUES ('#10'    :IDHISTORIALALUMNO,'#10'    :IDHISTORIAL' +
              'GRUPO,'#10'    :IDALUMNO,'#10'    :DOCUMENTOSFALTANTES,'#10'    :BECA,'#10'    :' +
              'DESCUENTO)'#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'spInsertHistorialAlumno'
      end
      item
        Params = <
          item
            Name = 'IDCALIFICACION'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'IDMATERIA'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'CALIFICACION'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'STATUS'
            DataType = datString
            Size = 1
            Value = ''
          end
          item
            Name = 'FALTAS'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'FECHACALIFICACION'
            DataType = datBlob
            Value = ''
          end
          item
            Name = 'IDHISTORIALALUMNO'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'IDHISTORIALGRUPO'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'IDTIPOCALIFICACION'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'CODIGOTIPOCALIFICACION'
            DataType = datString
            Size = 10
            Value = ''
          end
          item
            Name = 'NOMBRETIPOCALIFICACION'
            DataType = datString
            Size = 50
            Value = ''
          end
          item
            Name = 'TIPOCALIFICACIONAUX1'
            DataType = datString
            Size = 50
            Value = ''
          end
          item
            Name = 'TIPOCALIFICACIONAUX2'
            DataType = datString
            Size = 50
            Value = ''
          end
          item
            Name = 'MATERIACODIGO'
            DataType = datString
            Size = 10
            Value = ''
          end
          item
            Name = 'MATERIANOMBRE'
            DataType = datString
            Size = 50
            Value = ''
          end
          item
            Name = 'MATERIAAUX1'
            DataType = datString
            Size = 50
            Value = ''
          end
          item
            Name = 'MATERIAAUX2'
            DataType = datString
            Size = 50
            Value = ''
          end
          item
            Name = 'CREDITOS'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'MINIMOAPRO'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'MAXIMOFALTAS'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'SERIADACONCODIGO'
            DataType = datString
            Size = 10
            Value = ''
          end
          item
            Name = 'SERIADACONNOMBRE'
            DataType = datString
            Size = 50
            Value = ''
          end
          item
            Name = 'IDALUMNO'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'ALUMNONOMBRE'
            DataType = datString
            Size = 70
            Value = ''
          end
          item
            Name = 'ALUMNONUMCONTROL'
            DataType = datString
            Size = 12
            Value = ''
          end
          item
            Name = 'IDSTATUSALUMNO'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'IDGRUPO'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'GRUPOCODIGO'
            DataType = datString
            Size = 10
            Value = ''
          end
          item
            Name = 'GRUPONOMBRE'
            DataType = datString
            Size = 50
            Value = ''
          end
          item
            Name = 'NIVELCODIGO'
            DataType = datString
            Size = 10
            Value = ''
          end
          item
            Name = 'NIVELNOMBRE'
            DataType = datString
            Size = 50
            Value = ''
          end
          item
            Name = 'IdNivel'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'IDCICLO'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'CICLOCODIGO'
            DataType = datString
            Size = 10
            Value = ''
          end
          item
            Name = 'CICLONOMBRE'
            DataType = datString
            Size = 50
            Value = ''
          end
          item
            Name = 'conducta'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFAUX1'
            DataType = datFloat
            Value = ''
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            TargetTable = '[TABLENAME]'
            SQL = 
              'INSERT'#10'  INTO "[TABLENAME]"'#10'    (IDCALIFICACION, IDMATERIA, CALI' +
              'FICACION, STATUS, FALTAS, '#10'     FECHACALIFICACION, IDHISTORIALAL' +
              'UMNO, IDHISTORIALGRUPO, '#10'     IDTIPOCALIFICACION, CODIGOTIPOCALI' +
              'FICACION, NOMBRETIPOCALIFICACION, '#10'     TIPOCALIFICACIONAUX1, TI' +
              'POCALIFICACIONAUX2, MATERIACODIGO, '#10'     MATERIANOMBRE, MATERIAA' +
              'UX1, MATERIAAUX2, CREDITOS, '#10'     MINIMOAPRO, MAXIMOFALTAS, SERI' +
              'ADACONCODIGO, SERIADACONNOMBRE, '#10'     IDALUMNO, ALUMNONOMBRE, AL' +
              'UMNONUMCONTROL, IDSTATUSALUMNO, '#10'     IDGRUPO, GRUPOCODIGO, GRUP' +
              'ONOMBRE, NIVELCODIGO, NIVELNOMBRE, '#10'     IdNivel, IDCICLO, CICLO' +
              'CODIGO, CICLONOMBRE, conducta, '#10'     CALIFAUX1)'#10'  VALUES'#10'    (:I' +
              'DCALIFICACION, :IDMATERIA, :CALIFICACION, :STATUS, '#10'     :FALTAS' +
              ', :FECHACALIFICACION, :IDHISTORIALALUMNO, :IDHISTORIALGRUPO, '#10'  ' +
              '   :IDTIPOCALIFICACION, :CODIGOTIPOCALIFICACION, :NOMBRETIPOCALI' +
              'FICACION, '#10'     :TIPOCALIFICACIONAUX1, :TIPOCALIFICACIONAUX2, :M' +
              'ATERIACODIGO, '#10'     :MATERIANOMBRE, :MATERIAAUX1, :MATERIAAUX2, ' +
              ':CREDITOS, '#10'     :MINIMOAPRO, :MAXIMOFALTAS, :SERIADACONCODIGO, ' +
              ':SERIADACONNOMBRE, '#10'     :IDALUMNO, :ALUMNONOMBRE, :ALUMNONUMCON' +
              'TROL, :IDSTATUSALUMNO, '#10'     :IDGRUPO, :GRUPOCODIGO, :GRUPONOMBR' +
              'E, :NIVELCODIGO, '#10'     :NIVELNOMBRE, :IdNivel, :IDCICLO, :CICLOC' +
              'ODIGO, :CICLONOMBRE, '#10'     :conducta, :CALIFAUX1)'
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'Insert_vwCalificaAlumnosActuales'
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            TargetTable = '[TABLENAME]'
            SQL = 'DELETE '#10'  FROM'#10'    "[TABLENAME]"'#10'  WHERE'
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'Delete_vwCalificaAlumnosActuales'
      end
      item
        Params = <
          item
            Name = 'IDCALIFICACION'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'IDMATERIA'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'CALIFICACION'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'STATUS'
            DataType = datString
            Size = 1
            Value = ''
          end
          item
            Name = 'FALTAS'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'FECHACALIFICACION'
            DataType = datBlob
            Value = ''
          end
          item
            Name = 'IDHISTORIALALUMNO'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'IDHISTORIALGRUPO'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'IDTIPOCALIFICACION'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'CODIGOTIPOCALIFICACION'
            DataType = datString
            Size = 10
            Value = ''
          end
          item
            Name = 'NOMBRETIPOCALIFICACION'
            DataType = datString
            Size = 50
            Value = ''
          end
          item
            Name = 'TIPOCALIFICACIONAUX1'
            DataType = datString
            Size = 50
            Value = ''
          end
          item
            Name = 'TIPOCALIFICACIONAUX2'
            DataType = datString
            Size = 50
            Value = ''
          end
          item
            Name = 'MATERIACODIGO'
            DataType = datString
            Size = 10
            Value = ''
          end
          item
            Name = 'MATERIANOMBRE'
            DataType = datString
            Size = 50
            Value = ''
          end
          item
            Name = 'MATERIAAUX1'
            DataType = datString
            Size = 50
            Value = ''
          end
          item
            Name = 'MATERIAAUX2'
            DataType = datString
            Size = 50
            Value = ''
          end
          item
            Name = 'CREDITOS'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'MINIMOAPRO'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'MAXIMOFALTAS'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'SERIADACONCODIGO'
            DataType = datString
            Size = 10
            Value = ''
          end
          item
            Name = 'SERIADACONNOMBRE'
            DataType = datString
            Size = 50
            Value = ''
          end
          item
            Name = 'IDALUMNO'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'ALUMNONOMBRE'
            DataType = datString
            Size = 70
            Value = ''
          end
          item
            Name = 'ALUMNONUMCONTROL'
            DataType = datString
            Size = 12
            Value = ''
          end
          item
            Name = 'IDSTATUSALUMNO'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'IDGRUPO'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'GRUPOCODIGO'
            DataType = datString
            Size = 10
            Value = ''
          end
          item
            Name = 'GRUPONOMBRE'
            DataType = datString
            Size = 50
            Value = ''
          end
          item
            Name = 'NIVELCODIGO'
            DataType = datString
            Size = 10
            Value = ''
          end
          item
            Name = 'NIVELNOMBRE'
            DataType = datString
            Size = 50
            Value = ''
          end
          item
            Name = 'IdNivel'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'IDCICLO'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'CICLOCODIGO'
            DataType = datString
            Size = 10
            Value = ''
          end
          item
            Name = 'CICLONOMBRE'
            DataType = datString
            Size = 50
            Value = ''
          end
          item
            Name = 'conducta'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFAUX1'
            DataType = datFloat
            Value = ''
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            TargetTable = '[TABLENAME]'
            SQL = 
              'UPDATE "[TABLENAME]"'#10'  SET '#10'    IDCALIFICACION = :IDCALIFICACION' +
              ', '#10'    IDMATERIA = :IDMATERIA, '#10'    CALIFICACION = :CALIFICACION' +
              ', '#10'    STATUS = :STATUS, '#10'    FALTAS = :FALTAS, '#10'    FECHACALIFI' +
              'CACION = :FECHACALIFICACION, '#10'    IDHISTORIALALUMNO = :IDHISTORI' +
              'ALALUMNO, '#10'    IDHISTORIALGRUPO = :IDHISTORIALGRUPO, '#10'    IDTIPO' +
              'CALIFICACION = :IDTIPOCALIFICACION, '#10'    CODIGOTIPOCALIFICACION ' +
              '= :CODIGOTIPOCALIFICACION, '#10'    NOMBRETIPOCALIFICACION = :NOMBRE' +
              'TIPOCALIFICACION, '#10'    TIPOCALIFICACIONAUX1 = :TIPOCALIFICACIONA' +
              'UX1, '#10'    TIPOCALIFICACIONAUX2 = :TIPOCALIFICACIONAUX2, '#10'    MAT' +
              'ERIACODIGO = :MATERIACODIGO, '#10'    MATERIANOMBRE = :MATERIANOMBRE' +
              ', '#10'    MATERIAAUX1 = :MATERIAAUX1, '#10'    MATERIAAUX2 = :MATERIAAU' +
              'X2, '#10'    CREDITOS = :CREDITOS, '#10'    MINIMOAPRO = :MINIMOAPRO, '#10' ' +
              '   MAXIMOFALTAS = :MAXIMOFALTAS, '#10'    SERIADACONCODIGO = :SERIAD' +
              'ACONCODIGO, '#10'    SERIADACONNOMBRE = :SERIADACONNOMBRE, '#10'    IDAL' +
              'UMNO = :IDALUMNO, '#10'    ALUMNONOMBRE = :ALUMNONOMBRE, '#10'    ALUMNO' +
              'NUMCONTROL = :ALUMNONUMCONTROL, '#10'    IDSTATUSALUMNO = :IDSTATUSA' +
              'LUMNO, '#10'    IDGRUPO = :IDGRUPO, '#10'    GRUPOCODIGO = :GRUPOCODIGO,' +
              ' '#10'    GRUPONOMBRE = :GRUPONOMBRE, '#10'    NIVELCODIGO = :NIVELCODIG' +
              'O, '#10'    NIVELNOMBRE = :NIVELNOMBRE, '#10'    IdNivel = :IdNivel, '#10'  ' +
              '  IDCICLO = :IDCICLO, '#10'    CICLOCODIGO = :CICLOCODIGO, '#10'    CICL' +
              'ONOMBRE = :CICLONOMBRE, '#10'    conducta = :conducta, '#10'    CALIFAUX' +
              '1 = :CALIFAUX1'#10'  WHERE'
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'Update_vwCalificaAlumnosActuales'
      end
      item
        Params = <
          item
            Name = 'IDCALIFICACION'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'IDMATERIA'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'IDHISTORIALALUMNO'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'IDHISTORIALGRUPO'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'IDTIPOCALIFICACION'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'CALIFICACION'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFAUX1'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFAUX2'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'STATUS'
            DataType = datString
            Size = 1
            Value = ''
          end
          item
            Name = 'FALTAS'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'FECHA'
            DataType = datDateTime
            Value = ''
          end
          item
            Name = 'CALIF01'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIF02'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIF03'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIF04'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIF05'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIF06'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIF07'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIF08'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIF09'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIF10'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIF11'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIF12'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIF13'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIF14'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIF15'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIF16'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFA01'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFA02'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFA03'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFA04'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFA05'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFA06'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFA07'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFA08'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFA09'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFA10'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFA11'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFA12'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFA13'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFA14'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFA15'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFA16'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFB01'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFB02'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFB03'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFB04'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFB05'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFB06'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFB07'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFB08'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFB09'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFB10'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFB11'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFB12'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFB13'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFB14'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFB15'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFB16'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'FALTAS01'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'FALTAS02'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'FALTAS03'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'FALTAS04'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'FALTAS05'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'FALTAS06'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'FALTAS07'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'FALTAS08'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'FALTAS09'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'FALTAS10'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'FALTAS11'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'FALTAS12'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'FALTAS13'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'FALTAS14'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'FALTAS15'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'FALTAS16'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'REGU01'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'REGU02'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'REGU03'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'REGU04'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'REGU05'
            DataType = datFloat
            Value = ''
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            TargetTable = 'CALIFICACION'
            SQL = 
              'INSERT'#10'  INTO CALIFICACION'#10'    (IDCALIFICACION, IDMATERIA, IDHIS' +
              'TORIALALUMNO, IDHISTORIALGRUPO, '#10'     IDTIPOCALIFICACION, CALIFI' +
              'CACION, CALIFAUX1, CALIFAUX2, '#10'     STATUS, FALTAS, FECHA, CALIF' +
              '01, CALIF02, CALIF03, CALIF04, '#10'     CALIF05, CALIF06, CALIF07, ' +
              'CALIF08, CALIF09, CALIF10, '#10'     CALIF11, CALIF12, CALIF13, CALI' +
              'F14, CALIF15, CALIF16, '#10'     CALIFA01, CALIFA02, CALIFA03, CALIF' +
              'A04, CALIFA05, CALIFA06, '#10'     CALIFA07, CALIFA08, CALIFA09, CAL' +
              'IFA10, CALIFA11, CALIFA12, '#10'     CALIFA13, CALIFA14, CALIFA15, C' +
              'ALIFA16, CALIFB01, CALIFB02, '#10'     CALIFB03, CALIFB04, CALIFB05,' +
              ' CALIFB06, CALIFB07, CALIFB08, '#10'     CALIFB09, CALIFB10, CALIFB1' +
              '1, CALIFB12, CALIFB13, CALIFB14, '#10'     CALIFB15, CALIFB16, FALTA' +
              'S01, FALTAS02, FALTAS03, FALTAS04, '#10'     FALTAS05, FALTAS06, FAL' +
              'TAS07, FALTAS08, FALTAS09, FALTAS10, '#10'     FALTAS11, FALTAS12, F' +
              'ALTAS13, FALTAS14, FALTAS15, FALTAS16, '#10'     REGU01, REGU02, REG' +
              'U03, REGU04, REGU05)'#10'  VALUES'#10'    (:IDCALIFICACION, :IDMATERIA, ' +
              ':IDHISTORIALALUMNO, :IDHISTORIALGRUPO, '#10'     :IDTIPOCALIFICACION' +
              ', :CALIFICACION, :CALIFAUX1, :CALIFAUX2, '#10'     :STATUS, :FALTAS,' +
              ' :FECHA, :CALIF01, :CALIF02, :CALIF03, '#10'     :CALIF04, :CALIF05,' +
              ' :CALIF06, :CALIF07, :CALIF08, :CALIF09, '#10'     :CALIF10, :CALIF1' +
              '1, :CALIF12, :CALIF13, :CALIF14, :CALIF15, '#10'     :CALIF16, :CALI' +
              'FA01, :CALIFA02, :CALIFA03, :CALIFA04, '#10'     :CALIFA05, :CALIFA0' +
              '6, :CALIFA07, :CALIFA08, :CALIFA09, '#10'     :CALIFA10, :CALIFA11, ' +
              ':CALIFA12, :CALIFA13, :CALIFA14, '#10'     :CALIFA15, :CALIFA16, :CA' +
              'LIFB01, :CALIFB02, :CALIFB03, '#10'     :CALIFB04, :CALIFB05, :CALIF' +
              'B06, :CALIFB07, :CALIFB08, '#10'     :CALIFB09, :CALIFB10, :CALIFB11' +
              ', :CALIFB12, :CALIFB13, '#10'     :CALIFB14, :CALIFB15, :CALIFB16, :' +
              'FALTAS01, :FALTAS02, '#10'     :FALTAS03, :FALTAS04, :FALTAS05, :FAL' +
              'TAS06, :FALTAS07, '#10'     :FALTAS08, :FALTAS09, :FALTAS10, :FALTAS' +
              '11, :FALTAS12, '#10'     :FALTAS13, :FALTAS14, :FALTAS15, :FALTAS16,' +
              ' :REGU01, '#10'     :REGU02, :REGU03, :REGU04, :REGU05)'#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'Insert_spCalificacionesInscripcion'
      end
      item
        Params = <
          item
            Name = 'OLD_IDCALIFICACION'
            DataType = datInteger
            Value = ''
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            TargetTable = 'CALIFICACION'
            SQL = 
              'DELETE '#10'  FROM'#10'    CALIFICACION'#10'  WHERE'#10'    (IDCALIFICACION = :O' +
              'LD_IDCALIFICACION)'#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'Delete_spCalificacionesInscripcion'
      end
      item
        Params = <
          item
            Name = 'IDCALIFICACION'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'IDMATERIA'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'IDHISTORIALALUMNO'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'IDHISTORIALGRUPO'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'IDTIPOCALIFICACION'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'CALIFICACION'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFAUX1'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFAUX2'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'STATUS'
            DataType = datString
            Size = 1
            Value = ''
          end
          item
            Name = 'FALTAS'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'FECHA'
            DataType = datDateTime
            Value = ''
          end
          item
            Name = 'CALIF01'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIF02'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIF03'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIF04'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIF05'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIF06'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIF07'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIF08'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIF09'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIF10'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIF11'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIF12'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIF13'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIF14'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIF15'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIF16'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFA01'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFA02'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFA03'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFA04'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFA05'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFA06'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFA07'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFA08'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFA09'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFA10'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFA11'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFA12'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFA13'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFA14'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFA15'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFA16'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFB01'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFB02'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFB03'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFB04'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFB05'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFB06'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFB07'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFB08'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFB09'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFB10'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFB11'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFB12'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFB13'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFB14'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFB15'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFB16'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'FALTAS01'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'FALTAS02'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'FALTAS03'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'FALTAS04'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'FALTAS05'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'FALTAS06'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'FALTAS07'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'FALTAS08'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'FALTAS09'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'FALTAS10'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'FALTAS11'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'FALTAS12'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'FALTAS13'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'FALTAS14'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'FALTAS15'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'FALTAS16'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'REGU01'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'REGU02'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'REGU03'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'REGU04'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'REGU05'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'OLD_IDCALIFICACION'
            DataType = datInteger
            Value = ''
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            TargetTable = 'CALIFICACION'
            SQL = 
              'UPDATE CALIFICACION'#10'  SET '#10'    IDCALIFICACION = :IDCALIFICACION,' +
              ' '#10'    IDMATERIA = :IDMATERIA, '#10'    IDHISTORIALALUMNO = :IDHISTOR' +
              'IALALUMNO, '#10'    IDHISTORIALGRUPO = :IDHISTORIALGRUPO, '#10'    IDTIP' +
              'OCALIFICACION = :IDTIPOCALIFICACION, '#10'    CALIFICACION = :CALIFI' +
              'CACION, '#10'    CALIFAUX1 = :CALIFAUX1, '#10'    CALIFAUX2 = :CALIFAUX2' +
              ', '#10'    STATUS = :STATUS, '#10'    FALTAS = :FALTAS, '#10'    FECHA = :FE' +
              'CHA, '#10'    CALIF01 = :CALIF01, '#10'    CALIF02 = :CALIF02, '#10'    CALI' +
              'F03 = :CALIF03, '#10'    CALIF04 = :CALIF04, '#10'    CALIF05 = :CALIF05' +
              ', '#10'    CALIF06 = :CALIF06, '#10'    CALIF07 = :CALIF07, '#10'    CALIF08' +
              ' = :CALIF08, '#10'    CALIF09 = :CALIF09, '#10'    CALIF10 = :CALIF10, '#10 +
              '    CALIF11 = :CALIF11, '#10'    CALIF12 = :CALIF12, '#10'    CALIF13 = ' +
              ':CALIF13, '#10'    CALIF14 = :CALIF14, '#10'    CALIF15 = :CALIF15, '#10'   ' +
              ' CALIF16 = :CALIF16, '#10'    CALIFA01 = :CALIFA01, '#10'    CALIFA02 = ' +
              ':CALIFA02, '#10'    CALIFA03 = :CALIFA03, '#10'    CALIFA04 = :CALIFA04,' +
              ' '#10'    CALIFA05 = :CALIFA05, '#10'    CALIFA06 = :CALIFA06, '#10'    CALI' +
              'FA07 = :CALIFA07, '#10'    CALIFA08 = :CALIFA08, '#10'    CALIFA09 = :CA' +
              'LIFA09, '#10'    CALIFA10 = :CALIFA10, '#10'    CALIFA11 = :CALIFA11, '#10' ' +
              '   CALIFA12 = :CALIFA12, '#10'    CALIFA13 = :CALIFA13, '#10'    CALIFA1' +
              '4 = :CALIFA14, '#10'    CALIFA15 = :CALIFA15, '#10'    CALIFA16 = :CALIF' +
              'A16, '#10'    CALIFB01 = :CALIFB01, '#10'    CALIFB02 = :CALIFB02, '#10'    ' +
              'CALIFB03 = :CALIFB03, '#10'    CALIFB04 = :CALIFB04, '#10'    CALIFB05 =' +
              ' :CALIFB05, '#10'    CALIFB06 = :CALIFB06, '#10'    CALIFB07 = :CALIFB07' +
              ', '#10'    CALIFB08 = :CALIFB08, '#10'    CALIFB09 = :CALIFB09, '#10'    CAL' +
              'IFB10 = :CALIFB10, '#10'    CALIFB11 = :CALIFB11, '#10'    CALIFB12 = :C' +
              'ALIFB12, '#10'    CALIFB13 = :CALIFB13, '#10'    CALIFB14 = :CALIFB14, '#10 +
              '    CALIFB15 = :CALIFB15, '#10'    CALIFB16 = :CALIFB16, '#10'    FALTAS' +
              '01 = :FALTAS01, '#10'    FALTAS02 = :FALTAS02, '#10'    FALTAS03 = :FALT' +
              'AS03, '#10'    FALTAS04 = :FALTAS04, '#10'    FALTAS05 = :FALTAS05, '#10'   ' +
              ' FALTAS06 = :FALTAS06, '#10'    FALTAS07 = :FALTAS07, '#10'    FALTAS08 ' +
              '= :FALTAS08, '#10'    FALTAS09 = :FALTAS09, '#10'    FALTAS10 = :FALTAS1' +
              '0, '#10'    FALTAS11 = :FALTAS11, '#10'    FALTAS12 = :FALTAS12, '#10'    FA' +
              'LTAS13 = :FALTAS13, '#10'    FALTAS14 = :FALTAS14, '#10'    FALTAS15 = :' +
              'FALTAS15, '#10'    FALTAS16 = :FALTAS16, '#10'    REGU01 = :REGU01, '#10'   ' +
              ' REGU02 = :REGU02, '#10'    REGU03 = :REGU03, '#10'    REGU04 = :REGU04,' +
              ' '#10'    REGU05 = :REGU05'#10'  WHERE'#10'    (IDCALIFICACION = :OLD_IDCALI' +
              'FICACION)'#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'Update_spCalificacionesInscripcion'
      end
      item
        Params = <
          item
            Name = 'IDGRUPO'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'IDSUBTIPOPAGO'
            DataType = datInteger
            Value = ''
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            TargetTable = 'dbo.GRUPOPAGO'
            SQL = 
              'INSERT'#10'  INTO dbo.GRUPOPAGO'#10'    (IDGRUPO, IDSUBTIPOPAGO)'#10'  VALUE' +
              'S'#10'    (:IDGRUPO, :IDSUBTIPOPAGO)'
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'Insert_spPago'
      end
      item
        Params = <
          item
            Name = 'OLD_IDGRUPO'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'OLD_IDSUBTIPOPAGO'
            DataType = datInteger
            Value = ''
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            TargetTable = 'dbo.GRUPOPAGO'
            SQL = 
              'DELETE '#10'  FROM'#10'    dbo.GRUPOPAGO'#10'  WHERE'#10'    (IDGRUPO = :OLD_IDG' +
              'RUPO) AND '#10'    (IDSUBTIPOPAGO = :OLD_IDSUBTIPOPAGO)'
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'Delete_spPago'
      end
      item
        Params = <
          item
            Name = 'IDGRUPO'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'IDSUBTIPOPAGO'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'OLD_IDGRUPO'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'OLD_IDSUBTIPOPAGO'
            DataType = datInteger
            Value = ''
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            TargetTable = 'dbo.GRUPOPAGO'
            SQL = 
              'UPDATE dbo.GRUPOPAGO'#10'  SET '#10'    IDGRUPO = :IDGRUPO, '#10'    IDSUBTI' +
              'POPAGO = :IDSUBTIPOPAGO'#10'  WHERE'#10'    (IDGRUPO = :OLD_IDGRUPO) AND' +
              ' '#10'    (IDSUBTIPOPAGO = :OLD_IDSUBTIPOPAGO)'
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'Update_spPago'
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            TargetTable = '[TABLENAME]'
            SQL = 'SELECT 1'#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'Insert_vwHistorialAlumno'
      end
      item
        Params = <
          item
            Name = 'OLD_idhistorialalumno'
            DataType = datInteger
            Value = ''
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            TargetTable = '[TABLENAME]'
            SQL = 
              'DELETE '#10'  FROM'#10'    HISTORIALALUMNO'#10'  WHERE'#10'    (idhistorialalumn' +
              'o = :OLD_idhistorialalumno)'#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'Delete_vwHistorialAlumno'
      end
      item
        Params = <
          item
            Name = 'documentosfaltantes'
            DataType = datString
            Value = ''
          end
          item
            Name = 'idhistorialgrupo'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'idalumno'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'BECA'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'DESCUENTO'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'OLD_idhistorialalumno'
            DataType = datInteger
            Value = ''
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            TargetTable = '[TABLENAME]'
            SQL = 
              'UPDATE HISTORIALALUMNO'#10'  SET '#10'    documentosfaltantes = CAST(:do' +
              'cumentosfaltantes AS VARCHAR (150)),'#10'    idhistorialgrupo = :idh' +
              'istorialgrupo, '#10'    idalumno = :idalumno, '#10'    BECA = :BECA, '#10'  ' +
              '  DESCUENTO = :DESCUENTO'#10'  WHERE'#10'    (idhistorialalumno = :OLD_i' +
              'dhistorialalumno)'#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'Update_vwHistorialAlumno'
      end
      item
        Params = <
          item
            Name = 'IDPAGO'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'NUMPAGO'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'IMPORTE'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'FECHA'
            DataType = datDateTime
            Value = ''
          end
          item
            Name = 'FECHAPAGO'
            DataType = datDateTime
            Value = ''
          end
          item
            Name = 'STATUS'
            DataType = datString
            Size = 2
            Value = ''
          end
          item
            Name = 'INTERES'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'IDEMPLEADO'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'IDSUBTIPOPAGO'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'IDHISTORIALALUMNO'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'EMITIDO'
            DataType = datInteger
            Value = ''
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            TargetTable = 'PAGO'
            SQL = 
              'INSERT'#10'  INTO PAGO'#10'    (IDPAGO, NUMPAGO, IMPORTE, FECHA, FECHAPA' +
              'GO, STATUS, '#10'     INTERES, IDEMPLEADO, IDSUBTIPOPAGO, IDHISTORIA' +
              'LALUMNO, '#10'     EMITIDO)'#10'  VALUES'#10'    (:IDPAGO, :NUMPAGO, :IMPORT' +
              'E, :FECHA, :FECHAPAGO, :STATUS, '#10'     :INTERES, :IDEMPLEADO, :ID' +
              'SUBTIPOPAGO, :IDHISTORIALALUMNO, '#10'     :EMITIDO)'#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'Insert_spPagosInscripcion'
      end
      item
        Params = <
          item
            Name = 'OLD_IDPAGO'
            DataType = datInteger
            Value = ''
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            TargetTable = 'PAGO'
            SQL = 'DELETE '#10'  FROM'#10'    PAGO'#10'  WHERE'#10'    (IDPAGO = :OLD_IDPAGO)'#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'Delete_spPagosInscripcion'
      end
      item
        Params = <
          item
            Name = 'IDPAGO'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'NUMPAGO'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'IMPORTE'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'FECHA'
            DataType = datDateTime
            Value = ''
          end
          item
            Name = 'FECHAPAGO'
            DataType = datDateTime
            Value = ''
          end
          item
            Name = 'STATUS'
            DataType = datString
            Size = 2
            Value = ''
          end
          item
            Name = 'INTERES'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'IDEMPLEADO'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'IDSUBTIPOPAGO'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'IDHISTORIALALUMNO'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'EMITIDO'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'OLD_IDPAGO'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            TargetTable = 'PAGO'
            SQL = 
              'UPDATE PAGO'#10'  SET '#10'    IDPAGO = :IDPAGO, '#10'    NUMPAGO = :NUMPAGO' +
              ', '#10'    IMPORTE = :IMPORTE, '#10'    FECHA = :FECHA, '#10'    FECHAPAGO =' +
              ' :FECHAPAGO, '#10'    STATUS = :STATUS, '#10'    INTERES = :INTERES, '#10'  ' +
              '  IDEMPLEADO = :IDEMPLEADO, '#10'    IDSUBTIPOPAGO = :IDSUBTIPOPAGO,' +
              ' '#10'    IDHISTORIALALUMNO = :IDHISTORIALALUMNO, '#10'    EMITIDO = :EM' +
              'ITIDO'#10'  WHERE'#10'    (IDPAGO = :OLD_IDPAGO)'#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'Update_spPagosInscripcion'
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
            Connection = 'GAUSS'
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
            Connection = 'GAUSS'
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
            Connection = 'GAUSS'
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
      end
      item
        Params = <
          item
            Name = 'IDCALIFICACION'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'IDMATERIA'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'IDHISTORIALALUMNO'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'IDHISTORIALGRUPO'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'IDTIPOCALIFICACION'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'CALIFICACION'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFAUX1'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFAUX2'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'STATUS'
            DataType = datString
            Size = 1
            Value = ''
          end
          item
            Name = 'FALTAS'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'FECHA'
            DataType = datDateTime
            Value = ''
          end
          item
            Name = 'CALIF01'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIF02'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIF03'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIF04'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIF05'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIF06'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIF07'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIF08'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIF09'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIF10'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIF11'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIF12'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIF13'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIF14'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIF15'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIF16'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFA01'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFA02'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFA03'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFA04'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFA05'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFA06'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFA07'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFA08'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFA09'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFA10'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFA11'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFA12'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFA13'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFA14'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFA15'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFA16'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFB01'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFB02'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFB03'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFB04'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFB05'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFB07'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFB08'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFB09'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFB10'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFB11'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFB12'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFB13'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFB14'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFB15'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFB16'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'FALTAS01'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'FALTAS02'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'FALTAS03'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'FALTAS04'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'FALTAS05'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'FALTAS06'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'FALTAS07'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'FALTAS08'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'FALTAS09'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'FALTAS10'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'FALTAS11'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'FALTAS12'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'FALTAS13'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'FALTAS14'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'FALTAS15'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'FALTAS16'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'REGU01'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'REGU02'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'REGU03'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'REGU04'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'REGU05'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFC01'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFC02'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFC03'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFC04'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFC05'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFC06'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFC07'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFC08'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFC09'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFC10'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFC11'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFC12'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFC13'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFC14'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFC15'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFC16'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFAUX3'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFB06'
            DataType = datFloat
            Value = ''
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            TargetTable = 'CALIFICACION'
            SQL = 
              'INSERT'#10'  INTO CALIFICACION'#10'    (IDCALIFICACION, IDMATERIA, IDHIS' +
              'TORIALALUMNO, IDHISTORIALGRUPO, '#10'     IDTIPOCALIFICACION, CALIFI' +
              'CACION, CALIFAUX1, CALIFAUX2, '#10'     STATUS, FALTAS, FECHA, CALIF' +
              '01, CALIF02, CALIF03, CALIF04, '#10'     CALIF05, CALIF06, CALIF07, ' +
              'CALIF08, CALIF09, CALIF10, '#10'     CALIF11, CALIF12, CALIF13, CALI' +
              'F14, CALIF15, CALIF16, '#10'     CALIFA01, CALIFA02, CALIFA03, CALIF' +
              'A04, CALIFA05, CALIFA06, '#10'     CALIFA07, CALIFA08, CALIFA09, CAL' +
              'IFA10, CALIFA11, CALIFA12, '#10'     CALIFA13, CALIFA14, CALIFA15, C' +
              'ALIFA16, CALIFB01, CALIFB02, '#10'     CALIFB03, CALIFB04, CALIFB05,' +
              ' CALIFB07, CALIFB08, CALIFB09, '#10'     CALIFB10, CALIFB11, CALIFB1' +
              '2, CALIFB13, CALIFB14, CALIFB15, '#10'     CALIFB16, FALTAS01, FALTA' +
              'S02, FALTAS03, FALTAS04, FALTAS05, '#10'     FALTAS06, FALTAS07, FAL' +
              'TAS08, FALTAS09, FALTAS10, FALTAS11, '#10'     FALTAS12, FALTAS13, F' +
              'ALTAS14, FALTAS15, FALTAS16, REGU01, '#10'     REGU02, REGU03, REGU0' +
              '4, REGU05, CALIFC01, CALIFC02, '#10'     CALIFC03, CALIFC04, CALIFC0' +
              '5, CALIFC06, CALIFC07, CALIFC08, '#10'     CALIFC09, CALIFC10, CALIF' +
              'C11, CALIFC12, CALIFC13, CALIFC14, '#10'     CALIFC15, CALIFC16, CAL' +
              'IFAUX3, CALIFB06)'#10'  VALUES'#10'    (:IDCALIFICACION, :IDMATERIA, :ID' +
              'HISTORIALALUMNO, :IDHISTORIALGRUPO, '#10'     :IDTIPOCALIFICACION, :' +
              'CALIFICACION, :CALIFAUX1, :CALIFAUX2, '#10'     :STATUS, :FALTAS, :F' +
              'ECHA, :CALIF01, :CALIF02, :CALIF03, '#10'     :CALIF04, :CALIF05, :C' +
              'ALIF06, :CALIF07, :CALIF08, :CALIF09, '#10'     :CALIF10, :CALIF11, ' +
              ':CALIF12, :CALIF13, :CALIF14, :CALIF15, '#10'     :CALIF16, :CALIFA0' +
              '1, :CALIFA02, :CALIFA03, :CALIFA04, '#10'     :CALIFA05, :CALIFA06, ' +
              ':CALIFA07, :CALIFA08, :CALIFA09, '#10'     :CALIFA10, :CALIFA11, :CA' +
              'LIFA12, :CALIFA13, :CALIFA14, '#10'     :CALIFA15, :CALIFA16, :CALIF' +
              'B01, :CALIFB02, :CALIFB03, '#10'     :CALIFB04, :CALIFB05, :CALIFB07' +
              ', :CALIFB08, :CALIFB09, '#10'     :CALIFB10, :CALIFB11, :CALIFB12, :' +
              'CALIFB13, :CALIFB14, '#10'     :CALIFB15, :CALIFB16, :FALTAS01, :FAL' +
              'TAS02, :FALTAS03, '#10'     :FALTAS04, :FALTAS05, :FALTAS06, :FALTAS' +
              '07, :FALTAS08, '#10'     :FALTAS09, :FALTAS10, :FALTAS11, :FALTAS12,' +
              ' :FALTAS13, '#10'     :FALTAS14, :FALTAS15, :FALTAS16, :REGU01, :REG' +
              'U02, '#10'     :REGU03, :REGU04, :REGU05, :CALIFC01, :CALIFC02, :CAL' +
              'IFC03, '#10'     :CALIFC04, :CALIFC05, :CALIFC06, :CALIFC07, :CALIFC' +
              '08, '#10'     :CALIFC09, :CALIFC10, :CALIFC11, :CALIFC12, :CALIFC13,' +
              ' '#10'     :CALIFC14, :CALIFC15, :CALIFC16, :CALIFAUX3, :CALIFB06)'#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'Insert_spCalificacion'
      end
      item
        Params = <
          item
            Name = 'OLD_IDCALIFICACION'
            DataType = datInteger
            Value = ''
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            TargetTable = 'CALIFICACION'
            SQL = 
              'DELETE '#10'  FROM'#10'    CALIFICACION'#10'  WHERE'#10'    (IDCALIFICACION = :O' +
              'LD_IDCALIFICACION)'#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'Delete_spCalificacion'
      end
      item
        Params = <
          item
            Name = 'IDCALIFICACION'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'IDMATERIA'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'IDHISTORIALALUMNO'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'IDHISTORIALGRUPO'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'IDTIPOCALIFICACION'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'CALIFICACION'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFAUX1'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFAUX2'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'STATUS'
            DataType = datString
            Size = 1
            Value = ''
          end
          item
            Name = 'FALTAS'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'FECHA'
            DataType = datDateTime
            Value = ''
          end
          item
            Name = 'CALIF01'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIF02'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIF03'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIF04'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIF05'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIF06'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIF07'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIF08'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIF09'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIF10'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIF11'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIF12'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIF13'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIF14'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIF15'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIF16'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFA01'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFA02'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFA03'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFA04'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFA05'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFA06'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFA07'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFA08'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFA09'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFA10'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFA11'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFA12'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFA13'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFA14'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFA15'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFA16'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFB01'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFB02'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFB03'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFB04'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFB05'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFB07'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFB08'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFB09'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFB10'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFB11'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFB12'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFB13'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFB14'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFB15'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFB16'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'FALTAS01'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'FALTAS02'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'FALTAS03'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'FALTAS04'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'FALTAS05'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'FALTAS06'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'FALTAS07'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'FALTAS08'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'FALTAS09'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'FALTAS10'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'FALTAS11'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'FALTAS12'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'FALTAS13'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'FALTAS14'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'FALTAS15'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'FALTAS16'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'REGU01'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'REGU02'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'REGU03'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'REGU04'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'REGU05'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFC01'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFC02'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFC03'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFC04'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFC05'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFC06'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFC07'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFC08'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFC09'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFC10'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFC11'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFC12'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFC13'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFC14'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFC15'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFC16'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFAUX3'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'CALIFB06'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'OLD_IDCALIFICACION'
            DataType = datInteger
            Value = ''
          end>
        Statements = <
          item
            Connection = 'GAUSS'
            Default = True
            TargetTable = 'CALIFICACION'
            SQL = 
              'UPDATE CALIFICACION'#10'  SET '#10'    IDCALIFICACION = :IDCALIFICACION,' +
              ' '#10'    IDMATERIA = :IDMATERIA, '#10'    IDHISTORIALALUMNO = :IDHISTOR' +
              'IALALUMNO, '#10'    IDHISTORIALGRUPO = :IDHISTORIALGRUPO, '#10'    IDTIP' +
              'OCALIFICACION = :IDTIPOCALIFICACION, '#10'    CALIFICACION = :CALIFI' +
              'CACION, '#10'    CALIFAUX1 = :CALIFAUX1, '#10'    CALIFAUX2 = :CALIFAUX2' +
              ', '#10'    STATUS = :STATUS, '#10'    FALTAS = :FALTAS, '#10'    FECHA = :FE' +
              'CHA, '#10'    CALIF01 = :CALIF01, '#10'    CALIF02 = :CALIF02, '#10'    CALI' +
              'F03 = :CALIF03, '#10'    CALIF04 = :CALIF04, '#10'    CALIF05 = :CALIF05' +
              ', '#10'    CALIF06 = :CALIF06, '#10'    CALIF07 = :CALIF07, '#10'    CALIF08' +
              ' = :CALIF08, '#10'    CALIF09 = :CALIF09, '#10'    CALIF10 = :CALIF10, '#10 +
              '    CALIF11 = :CALIF11, '#10'    CALIF12 = :CALIF12, '#10'    CALIF13 = ' +
              ':CALIF13, '#10'    CALIF14 = :CALIF14, '#10'    CALIF15 = :CALIF15, '#10'   ' +
              ' CALIF16 = :CALIF16, '#10'    CALIFA01 = :CALIFA01, '#10'    CALIFA02 = ' +
              ':CALIFA02, '#10'    CALIFA03 = :CALIFA03, '#10'    CALIFA04 = :CALIFA04,' +
              ' '#10'    CALIFA05 = :CALIFA05, '#10'    CALIFA06 = :CALIFA06, '#10'    CALI' +
              'FA07 = :CALIFA07, '#10'    CALIFA08 = :CALIFA08, '#10'    CALIFA09 = :CA' +
              'LIFA09, '#10'    CALIFA10 = :CALIFA10, '#10'    CALIFA11 = :CALIFA11, '#10' ' +
              '   CALIFA12 = :CALIFA12, '#10'    CALIFA13 = :CALIFA13, '#10'    CALIFA1' +
              '4 = :CALIFA14, '#10'    CALIFA15 = :CALIFA15, '#10'    CALIFA16 = :CALIF' +
              'A16, '#10'    CALIFB01 = :CALIFB01, '#10'    CALIFB02 = :CALIFB02, '#10'    ' +
              'CALIFB03 = :CALIFB03, '#10'    CALIFB04 = :CALIFB04, '#10'    CALIFB05 =' +
              ' :CALIFB05, '#10'    CALIFB07 = :CALIFB07, '#10'    CALIFB08 = :CALIFB08' +
              ', '#10'    CALIFB09 = :CALIFB09, '#10'    CALIFB10 = :CALIFB10, '#10'    CAL' +
              'IFB11 = :CALIFB11, '#10'    CALIFB12 = :CALIFB12, '#10'    CALIFB13 = :C' +
              'ALIFB13, '#10'    CALIFB14 = :CALIFB14, '#10'    CALIFB15 = :CALIFB15, '#10 +
              '    CALIFB16 = :CALIFB16, '#10'    FALTAS01 = :FALTAS01, '#10'    FALTAS' +
              '02 = :FALTAS02, '#10'    FALTAS03 = :FALTAS03, '#10'    FALTAS04 = :FALT' +
              'AS04, '#10'    FALTAS05 = :FALTAS05, '#10'    FALTAS06 = :FALTAS06, '#10'   ' +
              ' FALTAS07 = :FALTAS07, '#10'    FALTAS08 = :FALTAS08, '#10'    FALTAS09 ' +
              '= :FALTAS09, '#10'    FALTAS10 = :FALTAS10, '#10'    FALTAS11 = :FALTAS1' +
              '1, '#10'    FALTAS12 = :FALTAS12, '#10'    FALTAS13 = :FALTAS13, '#10'    FA' +
              'LTAS14 = :FALTAS14, '#10'    FALTAS15 = :FALTAS15, '#10'    FALTAS16 = :' +
              'FALTAS16, '#10'    REGU01 = :REGU01, '#10'    REGU02 = :REGU02, '#10'    REG' +
              'U03 = :REGU03, '#10'    REGU04 = :REGU04, '#10'    REGU05 = :REGU05, '#10'  ' +
              '  CALIFC01 = :CALIFC01, '#10'    CALIFC02 = :CALIFC02, '#10'    CALIFC03' +
              ' = :CALIFC03, '#10'    CALIFC04 = :CALIFC04, '#10'    CALIFC05 = :CALIFC' +
              '05, '#10'    CALIFC06 = :CALIFC06, '#10'    CALIFC07 = :CALIFC07, '#10'    C' +
              'ALIFC08 = :CALIFC08, '#10'    CALIFC09 = :CALIFC09, '#10'    CALIFC10 = ' +
              ':CALIFC10, '#10'    CALIFC11 = :CALIFC11, '#10'    CALIFC12 = :CALIFC12,' +
              ' '#10'    CALIFC13 = :CALIFC13, '#10'    CALIFC14 = :CALIFC14, '#10'    CALI' +
              'FC15 = :CALIFC15, '#10'    CALIFC16 = :CALIFC16, '#10'    CALIFAUX3 = :C' +
              'ALIFAUX3, '#10'    CALIFB06 = :CALIFB06'#10'  WHERE'#10'    (IDCALIFICACION ' +
              '= :OLD_IDCALIFICACION)'#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'Update_spCalificacion'
      end>
    RelationShips = <
      item
        Name = 'FK_dbo MATERIA_dbo MATERIA'
        MasterDatasetName = 'dbo MATERIA'
        MasterFields = 'IDMATERIA'
        DetailDatasetName = 'dbo MATERIA'
        DetailFields = 'SERIADACON'
        RelationshipType = rtForeignKey
      end>
    UpdateRules = <>
    Version = 0
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
  object bpMateriaDispinibilidad: TDABusinessProcessor
    Schema = Schema
    InsertCommandName = 'Insert_dbo MAESTRODISPONIBILIDAD'
    DeleteCommandName = 'Delete_dbo MAESTRODISPONIBILIDAD'
    UpdateCommandName = 'Update_dbo MAESTRODISPONIBILIDAD'
    ReferencedDataset = 'dbo MAESTRODISPONIBILIDAD'
    ProcessorOptions = [poAutoGenerateRefreshDataset, poPrepareCommands]
    UpdateMode = updWhereKeyOnly
    Left = 112
    Top = 64
  end
  object bpCalificaAlumnosActuales: TDABusinessProcessor
    Schema = Schema
    InsertCommandName = 'Insert_dbo MAESTRODISPONIBILIDAD'
    DeleteCommandName = 'Delete_dbo MAESTRODISPONIBILIDAD'
    UpdateCommandName = 'Update_dbo MAESTRODISPONIBILIDAD'
    ReferencedDataset = 'vwCalificaAlumnosActuales'
    ProcessorOptions = [poAutoGenerateRefreshDataset, poPrepareCommands]
    UpdateMode = updWhereKeyOnly
    Left = 112
    Top = 120
  end
  object bpCalificacionesInscripcion: TDABusinessProcessor
    Schema = Schema
    InsertCommandName = 'Insert_spCalificacionesInscripcion'
    DeleteCommandName = 'Delete_spCalificacionesInscripcion'
    UpdateCommandName = 'Update_spCalificacionesInscripcion'
    ReferencedDataset = 'spCalificacionesInscripcion'
    ProcessorOptions = [poAutoGenerateRefreshDataset, poPrepareCommands]
    UpdateMode = updWhereKeyOnly
    Left = 232
    Top = 8
  end
  object bpPagos: TDABusinessProcessor
    Schema = Schema
    InsertCommandName = 'Insert_spPagosInscripcion'
    DeleteCommandName = 'Delete_spPagosInscripcion'
    UpdateCommandName = 'Update_spPagosInscripcion'
    ReferencedDataset = 'spPagosInscripcion'
    ProcessorOptions = [poAutoGenerateRefreshDataset, poPrepareCommands]
    UpdateMode = updWhereKeyOnly
    Left = 232
    Top = 64
  end
  object bpvwHistorialAlumno: TDABusinessProcessor
    Schema = Schema
    InsertCommandName = 'Insert_vwHistorialAlumno'
    DeleteCommandName = 'Delete_vwHistorialAlumno'
    UpdateCommandName = 'Update_vwHistorialAlumno'
    ReferencedDataset = 'vwHistorialAlumno'
    ProcessorOptions = [poAutoGenerateRefreshDataset, poPrepareCommands]
    UpdateMode = updWhereKeyOnly
    Left = 232
    Top = 120
  end
  object spCalificacion: TDABusinessProcessor
    Schema = Schema
    InsertCommandName = 'Insert_spCalificacion'
    DeleteCommandName = 'Delete_spCalificacion'
    UpdateCommandName = 'Update_spCalificacion'
    ReferencedDataset = 'spCalificacion'
    ProcessorOptions = [poAutoGenerateRefreshDataset, poPrepareCommands]
    UpdateMode = updWhereKeyOnly
    Left = 232
    Top = 176
  end
end
