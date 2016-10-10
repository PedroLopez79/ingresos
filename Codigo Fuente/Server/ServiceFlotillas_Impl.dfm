object ServiceFlotillas: TServiceFlotillas
  OldCreateOrder = True
  ServiceSchema = Schema
  ServiceDataStreamer = DataStreamer
  AllowExecuteSQL = True
  ExportedDataTables = <>
  Height = 266
  Width = 245
  object Schema: TDASchema
    ConnectionManager = ServerDataModule.ConnectionManager
    Datasets = <
      item
        Params = <
          item
            Name = 'ProductoID'
            Value = '1'
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            Name = 'Flotillas'
            SQL = 'select IEPS from producto'#10'where productoid = :ProductoID'#10
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
            Name = 'Fecha'
            Value = '1/1/1'
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            Name = 'Flotillas'
            SQL = 
              'select sum(importe) as Total from recibo'#10'where FechaMovimiento =' +
              ' :Fecha'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'Total'
                TableField = 'Total'
              end>
          end>
        Name = 'spTotalDeposito'
        Fields = <
          item
            Name = 'Total'
            DataType = datFloat
          end>
      end
      item
        Params = <
          item
            Name = 'LoteID'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'UsuarioID'
            Value = ''
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            Name = 'Flotillas'
            SQL = 
              'declare @LoteID int'#10'declare @Fecha datetime'#10'declare @usuarioid i' +
              'nt'#10'declare @Resultado varchar(100)'#10#10#10'select @LoteID = (Select :L' +
              'oteID)'#10'select @usuarioid = (select :UsuarioID)'#10'select @Fecha = (' +
              'select GetDate())'#10#10'if ((select Count(*) from lotecupon where Lot' +
              'eCuponID = @LoteID and Status = '#39'A'#39') > 0)'#10'begin'#10#9'if ((select cou' +
              'nt(*) from cupon where lotecuponid = @LoteID and status = '#39'A'#39') >' +
              ' 0)'#10#9'begin'#10#9#9'Update LoteCupon set Status = '#39'C'#39', UsuarioCanceloID' +
              ' = @UsuarioID, FechaCancelo = @Fecha'#10#9#9'where LoteCuponID = @Lote' +
              'ID'#10#10#9#9'update Cupon'#10'                set Status = '#39'I'#39', UsuarioCanc' +
              'eloID = @UsuarioID, FechaCancelo = @Fecha'#10#9#9'where LoteCuponID = ' +
              '@LoteID and status = '#39'A'#39#10#9#9#10#9#9'select @Resultado = (select '#39'la ca' +
              'ncelacion del lote fue exitosa.'#39')'#10#9'end'#10#9'else'#10#9'begin'#10'  '#9#9'select @' +
              'Resultado = (select '#39'El Lote no contiene cupones activos.'#39')'#10#9'end' +
              #10'end'#10'else'#10'begin'#10#9'select @Resultado = (select '#39'El Lote no existe ' +
              'o ya fue cancelado.'#39')'#10'end'#10#10'select @Resultado as Resultado'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'Resultado'
                TableField = 'Resultado'
              end>
          end>
        Name = 'spCancelaLote'
        Fields = <
          item
            Name = 'Resultado'
            DataType = datString
            Size = 100
          end>
      end
      item
        Params = <
          item
            Name = 'Codigo'
            Value = '1743'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            Name = 'Flotillas'
            SQL = 
              'declare @Codigo as varchar(20)'#10'declare @CuponID as int'#10'declare @' +
              'Ticket as int'#10'declare @EstacionID as int'#10#10'select @Codigo = (Sele' +
              'ct :Codigo)'#10#10'select @CuponID = ISNULL((SELECT CuponID FROM Cupon' +
              ' WHERE  (Barras = @Codigo) or (CAST(CuponID as varchar(10)) = @C' +
              'odigo)), 0)'#10#10'if (@CuponID > 0)'#10'begin'#10#9'select @Ticket = ISNULL((s' +
              'elect ConsumoSecuencia FROM Cupon WHERE CuponID = @CuponID), 0)'#10 +
              #9'select @EstacionID = ISNULL((select ConsumoEstacionID FROM Cupo' +
              'n WHERE CuponID = @CuponID), 0)'#10#9'if (@Ticket > 0)'#10#9'begin'#10#9#9'SELEC' +
              'T     CuponID, Importe, VolumenImporte, Status, FechaConsumo, Co' +
              'nsumoEstacionID, ConsumoSecuencia, ConsumoBombaID, ConsumoTurnoI' +
              'D, ConsumoImporte, ClienteID'#10#9#9'FROM         Cupon'#10#9#9'WHERE     (C' +
              'onsumoEstacionID = @EstacionID) and (ConsumoSecuencia = @Ticket)' +
              #10#9'end'#10#9'else'#10#9'begin'#10#9#9'SELECT     CuponID, Importe, VolumenImporte' +
              ', Status, FechaConsumo, ConsumoEstacionID, ConsumoSecuencia, Con' +
              'sumoBombaID, ConsumoTurnoID, ConsumoImporte, ClienteID'#10#9#9'FROM   ' +
              '      Cupon'#10#9#9'WHERE     (CuponID = @CuponID)'#10#9'end'#10'end'#10'else'#10'begin' +
              #10#9'SELECT     CuponID, Importe, VolumenImporte, Status, FechaCons' +
              'umo, ConsumoEstacionID, ConsumoSecuencia, ConsumoBombaID, Consum' +
              'oTurnoID, ConsumoImporte, ClienteID'#10#9'FROM         Cupon'#10#9'WHERE  ' +
              '   (1=2)'#10'end'#10#10#10#10#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'CuponID'
                TableField = 'CuponID'
              end
              item
                DatasetField = 'Importe'
                TableField = 'Importe'
              end
              item
                DatasetField = 'VolumenImporte'
                TableField = 'VolumenImporte'
              end
              item
                DatasetField = 'Status'
                TableField = 'Status'
              end
              item
                DatasetField = 'FechaConsumo'
                TableField = 'FechaConsumo'
              end
              item
                DatasetField = 'ConsumoEstacionID'
                TableField = 'ConsumoEstacionID'
              end
              item
                DatasetField = 'ConsumoSecuencia'
                TableField = 'ConsumoSecuencia'
              end
              item
                DatasetField = 'ConsumoBombaID'
                TableField = 'ConsumoBombaID'
              end
              item
                DatasetField = 'ConsumoTurnoID'
                TableField = 'ConsumoTurnoID'
              end
              item
                DatasetField = 'ConsumoImporte'
                TableField = 'ConsumoImporte'
              end
              item
                DatasetField = 'ClienteID'
                TableField = 'ClienteID'
              end>
          end>
        Name = 'spStatusCupon'
        Fields = <
          item
            Name = 'CuponID'
            DataType = datInteger
          end
          item
            Name = 'Importe'
            DataType = datFloat
          end
          item
            Name = 'VolumenImporte'
            DataType = datString
            Size = 1
          end
          item
            Name = 'Status'
            DataType = datString
            Size = 1
          end
          item
            Name = 'FechaConsumo'
            DataType = datDateTime
          end
          item
            Name = 'ConsumoEstacionID'
            DataType = datInteger
          end
          item
            Name = 'ConsumoSecuencia'
            DataType = datInteger
          end
          item
            Name = 'ConsumoBombaID'
            DataType = datInteger
          end
          item
            Name = 'ConsumoTurnoID'
            DataType = datInteger
          end
          item
            Name = 'ConsumoImporte'
            DataType = datFloat
          end
          item
            Name = 'ClienteID'
            DataType = datInteger
          end>
      end
      item
        Params = <
          item
            Name = 'Codigo'
            Value = '1'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            Name = 'Flotillas'
            SQL = 
              'declare @Codigo as varchar(20)'#10'declare @CuponID as int'#10#10'select @' +
              'Codigo = (Select :Codigo)'#10#10'select @CuponID = ISNULL((SELECT Cupo' +
              'nID FROM Cupon WHERE  (Barras = @Codigo) or (CAST(CuponID as var' +
              'char(10)) = @Codigo)), 0)'#10#10'select Status from Cupon where cuponi' +
              'd = @CuponID'#10#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'Status'
                TableField = 'Status'
              end>
          end>
        Name = 'spStatusCuponCancelar'
        Fields = <
          item
            Name = 'Status'
            DataType = datString
            Size = 1
          end>
      end
      item
        Params = <
          item
            Name = 'LoteCuponID'
            Value = '1'
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            Name = 'Flotillas'
            SQL = 
              'SELECT     CuponID, Importe, VolumenImporte, Status, FechaConsum' +
              'o, ConsumoEstacionID, ConsumoSecuencia, ConsumoBombaID, ConsumoT' +
              'urnoID, ConsumoImporte'#10#9#9'FROM         Cupon'#10#9#9'WHERE     (LoteCup' +
              'onID = :LoteCuponID)'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'Status'
                TableField = 'Status'
              end
              item
                DatasetField = 'CuponID'
                TableField = 'CuponID'
              end
              item
                DatasetField = 'Importe'
                TableField = 'Importe'
              end
              item
                DatasetField = 'VolumenImporte'
                TableField = 'VolumenImporte'
              end
              item
                DatasetField = 'FechaConsumo'
                TableField = 'FechaConsumo'
              end
              item
                DatasetField = 'ConsumoEstacionID'
                TableField = 'ConsumoEstacionID'
              end
              item
                DatasetField = 'ConsumoSecuencia'
                TableField = 'ConsumoSecuencia'
              end
              item
                DatasetField = 'ConsumoBombaID'
                TableField = 'ConsumoBombaID'
              end
              item
                DatasetField = 'ConsumoTurnoID'
                TableField = 'ConsumoTurnoID'
              end
              item
                DatasetField = 'ConsumoImporte'
                TableField = 'ConsumoImporte'
              end>
          end>
        Name = 'spCuponesPorLote'
        Fields = <
          item
            Name = 'CuponID'
            DataType = datInteger
          end
          item
            Name = 'Importe'
            DataType = datFloat
          end
          item
            Name = 'VolumenImporte'
            DataType = datString
            Size = 1
          end
          item
            Name = 'Status'
            DataType = datString
            Size = 1
          end
          item
            Name = 'FechaConsumo'
            DataType = datDateTime
          end
          item
            Name = 'ConsumoEstacionID'
            DataType = datInteger
          end
          item
            Name = 'ConsumoSecuencia'
            DataType = datInteger
          end
          item
            Name = 'ConsumoBombaID'
            DataType = datInteger
          end
          item
            Name = 'ConsumoTurnoID'
            DataType = datInteger
          end
          item
            Name = 'ConsumoImporte'
            DataType = datFloat
          end>
      end
      item
        Params = <
          item
            Name = 'EstacionID'
            Value = '1'
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            Name = 'Flotillas'
            SQL = 
              'SELECT     Estacion.IVA, A.Precio'#10'FROM         Estacion CROSS JO' +
              'IN'#10'                          (SELECT     Precio'#10'                ' +
              '            FROM          Producto'#10'                            W' +
              'HERE      productoid = 1) A'#10'WHERE     (Estacion.EstacionID = :Es' +
              'tacionID)'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IVA'
                TableField = 'IVA'
              end
              item
                DatasetField = 'Precio'
                TableField = 'Precio'
              end>
          end>
        Name = 'IVAEstacion'
        Fields = <
          item
            Name = 'IVA'
            DataType = datFloat
          end
          item
            Name = 'Precio'
            DataType = datFloat
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            Name = 'Flotillas'
            SQL = 'Select ClienteID, Nombre from Cliente'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'ClienteID'
                TableField = 'ClienteID'
              end
              item
                DatasetField = 'Nombre'
                TableField = 'Nombre'
              end>
          end>
        Name = 'ClienteCupon'
        Fields = <
          item
            Name = 'ClienteID'
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
            Name = 'VehiculoID'
            Value = '17'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            Name = 'Flotillas'
            SQL = 
              'Select dbo.Vehiculo.ClienteID,dbo.Vehiculo.GasolineroID,dbo.Clie' +
              'nte.FormaCompraID, dbo.Cliente.CuentaContable'#10'From dbo.Vehiculo ' +
              'Inner Join dbo.Cliente ON Vehiculo.ClienteID = Cliente.ClienteID' +
              #10'Where dbo.Vehiculo.VehiculoID = :VehiculoID'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'ClienteID'
                TableField = 'ClienteID'
              end
              item
                DatasetField = 'GasolineroID'
                TableField = 'GasolineroID'
              end
              item
                DatasetField = 'FormaCompraID'
                TableField = 'FormaCompraID'
              end
              item
                DatasetField = 'CuentaContable'
                TableField = 'CuentaContable'
              end>
          end>
        Name = 'dbo ObtenClienteCM'
        Fields = <
          item
            Name = 'ClienteID'
            DataType = datInteger
          end
          item
            Name = 'GasolineroID'
            DataType = datInteger
          end
          item
            Name = 'FormaCompraID'
            DataType = datInteger
          end
          item
            Name = 'CuentaContable'
            DataType = datString
            Size = 15
          end>
      end
      item
        Params = <
          item
            Name = 'EstacionID'
            Value = '4120'
            ParamType = daptInput
          end
          item
            Name = 'FechaIni'
            Value = '01/01/2008'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            TargetTable = 'dbo.SaldoEstacion'
            Name = 'Flotillas'
            SQL = 
              'create table #Saldo'#10'(SaldoInicial float,'#10' EstacionID int'#10')'#10#10'inse' +
              'rt into #Saldo(SaldoInicial, EstacionID)'#10'(SELECT SUM(IMPORTE), E' +
              'STACIONID FROM CONSUMO WHERE ESTACIONID = :EstacionID AND FECHAC' +
              'ARGA < :FechaIni'#10' GROUP BY ESTACIONID)'#10#10'insert into #Saldo(Saldo' +
              'Inicial, EstacionID)'#10'SELECT'#10'    Cast((Sum(Cargo))- Sum(Abono)as ' +
              'money)as SaldoInicial, dbo.SaldoEstacion.EstacionID'#10'FROM'#10'    dbo' +
              '.SaldoEstacion'#10'WHERE'#10'    (dbo.SaldoEstacion.EstacionID = :Estaci' +
              'onID) And (Fecha < :FechaIni)'#10'GROUP BY dbo.SaldoEstacion.Estacio' +
              'nID'#10#10'SELECT SUM(SaldoInicial) as SaldoInicial, EstacionID from #' +
              'Saldo'#10'GROUP BY ESTACIONID'#10#10'Drop Table #Saldo'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'SaldoInicial'
                TableField = '<unknown>'
                SQLOrigin = 'SaldoInicial'
              end
              item
                DatasetField = 'EstacionID'
                TableField = 'EstacionID'
              end>
          end>
        Name = 'dbo SaldoInicialEstacion'
        Fields = <
          item
            Name = 'SaldoInicial'
            DataType = datFloat
          end
          item
            Name = 'EstacionID'
            DataType = datInteger
          end>
      end
      item
        Params = <
          item
            Name = 'EstacionID'
            Value = '5306'
            ParamType = daptInput
          end
          item
            Name = 'FechaIni'
            Value = '04/04/2011'
            ParamType = daptInput
          end
          item
            Name = 'FechaFin'
            Value = '04/04/2011'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            TargetTable = 'dbo.SaldoEstacion'
            Name = 'FlotillasNew'
            SQL = 
              'create table #Saldo2'#10'(ClienteID int,'#10' Nombre varchar(200),'#10' Desc' +
              'ripcion varchar(50),'#10' cantidad money,'#10' precio money,'#10' fecha date' +
              'time,'#10' venta money,'#10' cargos money,'#10' abono money,'#10')'#10#10'declare @fec' +
              'haini as datetime'#10'declare @fechafin as datetime'#10'declare @aux as ' +
              'datetime'#10'declare @estacion as int'#10#10'select @estacion = (select :E' +
              'stacionID)'#10'select @Fechaini = (select :FechaIni)'#10'select @Fechafi' +
              'n = (select :FechaFin)'#10#10'insert into #Saldo2 (ClienteID, Nombre, ' +
              'Descripcion, cantidad, precio, fecha, venta, cargos, abono)'#10'(SEL' +
              'ECT DISTINCT 0, REFERENCIA, '#39#39', 0, 0, FECHA, 0, Cast(CARGO as Mo' +
              'ney)as Cargo, Cast(ABONO as Money)as Abono FROM SALDOESTACION WH' +
              'ERE'#10'(EstacionID = @Estacion) AND'#10'cast(FECHA as int) BETWEEN cast' +
              '(@fechaIni as int) and cast(@fechafin as int))'#10#10'insert into #Sal' +
              'do2 (ClienteID, Nombre, Descripcion, cantidad, precio, fecha, ve' +
              'nta, cargos, abono)'#10'(SELECT  DISTINCT Cliente.ClienteID, Cliente' +
              '.Nombre, Producto.Descripcion, SUM(Cantidad) As Cantidad, Consum' +
              'o.Precio, FechaMovimiento AS Fecha, SUM(Importe) AS Venta, 0 , 0' +
              #10'FROM         Consumo'#10'INNER JOIN Cliente on Cliente.ClienteID = ' +
              'Consumo.ClienteID'#10'INNER JOIN Producto on Consumo.ProductoID = Pr' +
              'oducto.ProductoID'#10'WHERE     (EstacionID = @Estacion) AND cast(Fe' +
              'chaMovimiento as int) BETWEEN cast(@fechaIni as int) and cast(@f' +
              'echafin as int)'#10'GROUP BY FechaMovimiento, Cliente.Nombre, Client' +
              'e.ClienteID, Consumo.Precio, Producto.Descripcion)'#10#10'SELECT * FRO' +
              'M #Saldo2'#10#10'drop table #Saldo2'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'ClienteID'
                TableField = '<unknown>'
                SQLOrigin = 'ClienteID'
              end
              item
                DatasetField = 'Nombre'
                TableField = '<unknown>'
                SQLOrigin = 'Nombre'
              end
              item
                DatasetField = 'Descripcion'
                TableField = '<unknown>'
                SQLOrigin = 'Descripcion'
              end
              item
                DatasetField = 'cantidad'
                TableField = '<unknown>'
                SQLOrigin = 'cantidad'
              end
              item
                DatasetField = 'precio'
                TableField = '<unknown>'
                SQLOrigin = 'precio'
              end
              item
                DatasetField = 'fecha'
                TableField = 'fecha'
              end
              item
                DatasetField = 'venta'
                TableField = '<unknown>'
                SQLOrigin = 'venta'
              end
              item
                DatasetField = 'cargos'
                TableField = '<unknown>'
                SQLOrigin = 'cargos'
              end
              item
                DatasetField = 'abono'
                TableField = 'abono'
              end>
          end>
        Name = 'dbo ConsultaSaldoEstacion'
        Fields = <
          item
            Name = 'ClienteID'
            DataType = datInteger
          end
          item
            Name = 'Nombre'
            DataType = datString
            Size = 200
          end
          item
            Name = 'Descripcion'
            DataType = datString
            Size = 50
          end
          item
            Name = 'cantidad'
            DataType = datFloat
          end
          item
            Name = 'precio'
            DataType = datFloat
          end
          item
            Name = 'fecha'
            DataType = datDateTime
          end
          item
            Name = 'venta'
            DataType = datFloat
          end
          item
            Name = 'cargos'
            DataType = datFloat
          end
          item
            Name = 'abono'
            DataType = datFloat
          end>
      end
      item
        Params = <
          item
            Name = 'ClienteID'
            Value = '1'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            SQL = 
              'SELECT     Vehiculo.VehiculoID, Vehiculo.Nombre, Vehiculo.Client' +
              'eID, Vehiculo.GasolineroID, Vehiculo.Identificacion, Cliente.For' +
              'maCompraID'#10'FROM         Vehiculo INNER JOIN'#10'                    ' +
              '  Cliente ON Vehiculo.ClienteID = Cliente.ClienteID'#10'WHERE     (V' +
              'ehiculo.ClienteID = :ClienteID)'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'VehiculoID'
                TableField = 'VehiculoID'
              end
              item
                DatasetField = 'Nombre'
                TableField = 'Nombre'
              end
              item
                DatasetField = 'ClienteID'
                TableField = 'ClienteID'
              end
              item
                DatasetField = 'GasolineroID'
                TableField = 'GasolineroID'
              end
              item
                DatasetField = 'Identificacion'
                TableField = 'Identificacion'
              end
              item
                DatasetField = 'FormaCompraID'
                TableField = 'FormaCompraID'
              end>
          end>
        Name = 'BuscaVehiculo'
        Fields = <
          item
            Name = 'VehiculoID'
            DataType = datInteger
          end
          item
            Name = 'Nombre'
            DataType = datString
            Size = 30
          end
          item
            Name = 'ClienteID'
            DataType = datInteger
          end
          item
            Name = 'GasolineroID'
            DataType = datInteger
          end
          item
            Name = 'Identificacion'
            DataType = datString
            Size = 30
          end
          item
            Name = 'FormaCompraID'
            DataType = datInteger
          end>
      end
      item
        Params = <
          item
            Name = 'Nombre'
            Value = 's'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'Flotillas'
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
              end>
          end>
        Name = 'ReportesWEB'
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
          end>
      end
      item
        Params = <
          item
            Name = 'ClienteID'
            Value = '1'
            ParamType = daptInput
          end
          item
            Name = 'Periodo'
            Value = '1'
            ParamType = daptInput
          end
          item
            Name = 'Ejercicio'
            Value = '1'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            SQL = 
              'Select Sum(Importe) as importe from dbo.Consumo'#10'inner join dbo.C' +
              'liente on (dbo.Cliente.ClienteID = dbo.Consumo.ClienteID)'#10'Where(' +
              'dbo.Consumo.ClienteID = :ClienteID)and(dbo.Consumo.Facturado = 0' +
              ')and'#10'     (dbo.Consumo.Periodo = :Periodo)and(dbo.Consumo.Ejerci' +
              'cio = :Ejercicio)and'#10'     (dbo.Cliente.FormaPagoID <> 1)'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'importe'
                TableField = 'importe'
              end>
          end>
        Name = 'CargoCierreCliente'
        Fields = <
          item
            Name = 'importe'
            DataType = datFloat
          end>
      end
      item
        Params = <
          item
            Name = 'Referencia'
            Value = '0005100000000004'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            SQL = 
              'IF (SUBSTRING(:Referencia,1,4) = '#39'0005'#39') OR (LEN(:Referencia)<=1' +
              '0)'#10'BEGIN'#10'   IF LEN(:Referencia)<=10'#10'   BEGIN'#10'   SELECT  0 AS Veh' +
              'iculoID, Cliente.ClienteID, Cliente.GasolineroID'#10'   FROM CUPON I' +
              'NNER JOIN'#10'   CLIENTE ON CLIENTE.CLIENTEID = CUPON.CLIENTEID'#10'   W' +
              'HERE (CAST(dbo.Cupon.CuponID as varchar(50)) = :Referencia)'#10'   E' +
              'ND'#10'   ELSE'#10'   BEGIN'#10'   SELECT  0 AS VehiculoID, Cliente.ClienteI' +
              'D, Cliente.GasolineroID'#10'   FROM CUPON INNER JOIN'#10'   CLIENTE ON C' +
              'LIENTE.CLIENTEID = CUPON.CLIENTEID'#10'   WHERE (CUPON.BARRAS = :Ref' +
              'erencia)'#10'   END'#10'END'#10'ELSE'#10'BEGIN'#10'SELECT  Distinct Referencia.Vehic' +
              'uloID, Vehiculo.ClienteID, Vehiculo.GasolineroID'#10'FROM         Re' +
              'ferencia INNER JOIN'#10'             Vehiculo ON Referencia.Vehiculo' +
              'ID = Vehiculo.VehiculoID'#10'WHERE     (Referencia.Referencia = :Ref' +
              'erencia)'#10'END'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'VehiculoID'
                TableField = 'VehiculoID'
              end
              item
                DatasetField = 'ClienteID'
                TableField = 'ClienteID'
              end
              item
                DatasetField = 'GasolineroID'
                TableField = 'GasolineroID'
              end>
          end>
        Name = 'spBuscaReferencia'
        Fields = <
          item
            Name = 'VehiculoID'
            DataType = datInteger
          end
          item
            Name = 'ClienteID'
            DataType = datInteger
          end
          item
            Name = 'GasolineroID'
            DataType = datInteger
          end>
      end
      item
        Params = <
          item
            Name = 'VehiculoID'
            Value = '4'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            SQL = 
              'SELECT   Distinct  Vehiculo.DigitoSeguridad, Cliente.FormaCompra' +
              'ID'#10'FROM         Vehiculo INNER JOIN'#10'                      Client' +
              'e ON Vehiculo.ClienteID = Cliente.ClienteID'#10'WHERE     (Vehiculo.' +
              'VehiculoID = :VehiculoID)'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'DigitoSeguridad'
                TableField = 'DigitoSeguridad'
              end
              item
                DatasetField = 'FormaCompraID'
                TableField = 'FormaCompraID'
              end>
          end>
        Name = 'ReferenciaTarjeta'
        Fields = <
          item
            Name = 'DigitoSeguridad'
            DataType = datInteger
          end
          item
            Name = 'FormaCompraID'
            DataType = datInteger
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'Flotillas'
            SQL = 'Select TipoReferenciaID,Nombre'#10'From TipoReferencia'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'TipoReferenciaID'
                TableField = 'TipoReferenciaID'
              end
              item
                DatasetField = 'Nombre'
                TableField = 'Nombre'
              end>
          end>
        Name = 'dbo TipoReferencia'
        Fields = <
          item
            Name = 'TipoReferenciaID'
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
            Name = 'Ejercicio'
            Value = '1'
            ParamType = daptInput
          end
          item
            Name = 'ClienteID'
            Value = '1'
            ParamType = daptInput
          end
          item
            Name = 'GasolineroID'
            Value = '1'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            SQL = 
              'SELECT'#10'    Ejercicio, ClienteID, GasolineroID, SaldoInicial,'#10'   ' +
              ' CargosAcumulados, AbonosAcumulados, SaldoFinal, Cargo01,'#10'    Ca' +
              'rgo02, Cargo03, Cargo04, Cargo05, Cargo06, Cargo07,'#10'    Cargo08,' +
              ' Cargo09, Cargo10, Cargo11, Cargo12, Abono01,'#10'    Abono02, Abono' +
              '03, Abono04, Abono05, Abono06, Abono07,'#10'    Abono08, Abono09, Ab' +
              'ono10, Abono11, Abono12'#10'  FROM'#10'    dbo.SaldoEjercicio'#10'  WHERE'#10'  ' +
              '  Ejercicio = :Ejercicio and ClienteID = :ClienteID ANd Gasoline' +
              'roID = :GasolineroID'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'Ejercicio'
                TableField = 'Ejercicio'
              end
              item
                DatasetField = 'ClienteID'
                TableField = 'ClienteID'
              end
              item
                DatasetField = 'GasolineroID'
                TableField = 'GasolineroID'
              end
              item
                DatasetField = 'SaldoInicial'
                TableField = 'SaldoInicial'
              end
              item
                DatasetField = 'CargosAcumulados'
                TableField = 'CargosAcumulados'
              end
              item
                DatasetField = 'AbonosAcumulados'
                TableField = 'AbonosAcumulados'
              end
              item
                DatasetField = 'SaldoFinal'
                TableField = 'SaldoFinal'
              end
              item
                DatasetField = 'Cargo01'
                TableField = 'Cargo01'
              end
              item
                DatasetField = 'Cargo02'
                TableField = 'Cargo02'
              end
              item
                DatasetField = 'Cargo03'
                TableField = 'Cargo03'
              end
              item
                DatasetField = 'Cargo04'
                TableField = 'Cargo04'
              end
              item
                DatasetField = 'Cargo05'
                TableField = 'Cargo05'
              end
              item
                DatasetField = 'Cargo06'
                TableField = 'Cargo06'
              end
              item
                DatasetField = 'Cargo07'
                TableField = 'Cargo07'
              end
              item
                DatasetField = 'Cargo08'
                TableField = 'Cargo08'
              end
              item
                DatasetField = 'Cargo09'
                TableField = 'Cargo09'
              end
              item
                DatasetField = 'Cargo10'
                TableField = 'Cargo10'
              end
              item
                DatasetField = 'Cargo11'
                TableField = 'Cargo11'
              end
              item
                DatasetField = 'Cargo12'
                TableField = 'Cargo12'
              end
              item
                DatasetField = 'Abono01'
                TableField = 'Abono01'
              end
              item
                DatasetField = 'Abono02'
                TableField = 'Abono02'
              end
              item
                DatasetField = 'Abono03'
                TableField = 'Abono03'
              end
              item
                DatasetField = 'Abono04'
                TableField = 'Abono04'
              end
              item
                DatasetField = 'Abono05'
                TableField = 'Abono05'
              end
              item
                DatasetField = 'Abono06'
                TableField = 'Abono06'
              end
              item
                DatasetField = 'Abono07'
                TableField = 'Abono07'
              end
              item
                DatasetField = 'Abono08'
                TableField = 'Abono08'
              end
              item
                DatasetField = 'Abono09'
                TableField = 'Abono09'
              end
              item
                DatasetField = 'Abono10'
                TableField = 'Abono10'
              end
              item
                DatasetField = 'Abono11'
                TableField = 'Abono11'
              end
              item
                DatasetField = 'Abono12'
                TableField = 'Abono12'
              end>
          end>
        Name = 'SaldoEjercicio'
        Fields = <
          item
            Name = 'Ejercicio'
            DataType = datInteger
          end
          item
            Name = 'ClienteID'
            DataType = datInteger
          end
          item
            Name = 'GasolineroID'
            DataType = datInteger
          end
          item
            Name = 'SaldoInicial'
            DataType = datFloat
          end
          item
            Name = 'CargosAcumulados'
            DataType = datFloat
          end
          item
            Name = 'AbonosAcumulados'
            DataType = datFloat
          end
          item
            Name = 'SaldoFinal'
            DataType = datFloat
          end
          item
            Name = 'Cargo01'
            DataType = datFloat
          end
          item
            Name = 'Cargo02'
            DataType = datFloat
          end
          item
            Name = 'Cargo03'
            DataType = datFloat
          end
          item
            Name = 'Cargo04'
            DataType = datFloat
          end
          item
            Name = 'Cargo05'
            DataType = datFloat
          end
          item
            Name = 'Cargo06'
            DataType = datFloat
          end
          item
            Name = 'Cargo07'
            DataType = datFloat
          end
          item
            Name = 'Cargo08'
            DataType = datFloat
          end
          item
            Name = 'Cargo09'
            DataType = datFloat
          end
          item
            Name = 'Cargo10'
            DataType = datFloat
          end
          item
            Name = 'Cargo11'
            DataType = datFloat
          end
          item
            Name = 'Cargo12'
            DataType = datFloat
          end
          item
            Name = 'Abono01'
            DataType = datFloat
          end
          item
            Name = 'Abono02'
            DataType = datFloat
          end
          item
            Name = 'Abono03'
            DataType = datFloat
          end
          item
            Name = 'Abono04'
            DataType = datFloat
          end
          item
            Name = 'Abono05'
            DataType = datFloat
          end
          item
            Name = 'Abono06'
            DataType = datFloat
          end
          item
            Name = 'Abono07'
            DataType = datFloat
          end
          item
            Name = 'Abono08'
            DataType = datFloat
          end
          item
            Name = 'Abono09'
            DataType = datFloat
          end
          item
            Name = 'Abono10'
            DataType = datFloat
          end
          item
            Name = 'Abono11'
            DataType = datFloat
          end
          item
            Name = 'Abono12'
            DataType = datFloat
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
            Name = 'ClienteID'
            Value = '1'
            ParamType = daptInput
          end
          item
            Name = 'TarjetaID'
            Value = '2'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            SQL = 
              'SELECT'#10'    dbo.Vehiculo.VehiculoID, dbo.Vehiculo.ClienteID, dbo.' +
              'Vehiculo.GasolineroID, dbo.Cliente.FormaCompraID,'#10'    dbo.Vehicu' +
              'lo.DigitoSeguridad, dbo.Vehiculo.Nombre, dbo.Vehiculo.Identifica' +
              'cion, dbo.Vehiculo.Departamento,'#10'    dbo.Vehiculo.CuentaContable' +
              ', dbo.Vehiculo.CentroCostos, dbo.Vehiculo.NumeroEconomico, dbo.V' +
              'ehiculo.NIP,'#10'    dbo.Vehiculo.Estatus, dbo.Vehiculo.CargasMaxima' +
              's, dbo.Vehiculo.Odometro, dbo.Vehiculo.Firma, dbo.Vehiculo.Placa' +
              's, dbo.Vehiculo.FechaAlta,'#10'    dbo.Vehiculo.FechaExpira, dbo.Veh' +
              'iculo.FechaBaja, dbo.Vehiculo.FechaCancelacion, dbo.Vehiculo.Fec' +
              'haBloqueada,'#10'    dbo.Vehiculo.FechaInactiva, dbo.Vehiculo.Mensaj' +
              'e, dbo.Vehiculo.LimiteLTTurno, dbo.Vehiculo.LimiteLTDia,'#10'    dbo' +
              '.Vehiculo.LimiteLTSemana, dbo.Vehiculo.LimiteLTMes, dbo.Vehiculo' +
              '.LimiteMNTurno, dbo.Vehiculo.LimiteMNDia,'#10'    dbo.Vehiculo.Limit' +
              'eMNSemana, dbo.Vehiculo.LimiteMNMes, dbo.Vehiculo.ActualLTTurno,' +
              ' dbo.Vehiculo.ActualLTDia,'#10'    dbo.Vehiculo.ActualLTSemana, dbo.' +
              'Vehiculo.ActualLTMes, dbo.Vehiculo.ActualMNTurno, dbo.Vehiculo.A' +
              'ctualMNDia,'#10'    dbo.Vehiculo.ActualMNSemana, dbo.Vehiculo.Actual' +
              'MNMes, dbo.Vehiculo.ActualCargas, dbo.Vehiculo.Clasificacion,'#10'  ' +
              '  dbo.Vehiculo.Generada, dbo.Vehiculo.Lunes, dbo.Vehiculo.Martes' +
              ', dbo.Vehiculo.Miercoles,'#10'    dbo.Vehiculo.Jueves, dbo.Vehiculo.' +
              'Viernes, dbo.Vehiculo.Sabado, dbo.Vehiculo.Domingo, dbo.Vehiculo' +
              '.ProductoAutorizado'#10'  FROM'#10'    dbo.Vehiculo'#10'  INNER JOIN'#10'    dbo' +
              '.Cliente on (dbo.Vehiculo.ClienteID = dbo.Cliente.ClienteID)'#10'  W' +
              'HERE'#10'    dbo.Vehiculo.GasolineroID = :Identificador AND dbo.Vehi' +
              'culo.ClienteID = :ClienteID AND dbo.Vehiculo.VehiculoID = :Tarje' +
              'taID'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'VehiculoID'
                TableField = 'VehiculoID'
              end
              item
                DatasetField = 'ClienteID'
                TableField = 'ClienteID'
              end
              item
                DatasetField = 'GasolineroID'
                TableField = 'GasolineroID'
              end
              item
                DatasetField = 'FormaCompraID'
                TableField = 'FormaCompraID'
              end
              item
                DatasetField = 'DigitoSeguridad'
                TableField = 'DigitoSeguridad'
              end
              item
                DatasetField = 'Nombre'
                TableField = 'Nombre'
              end
              item
                DatasetField = 'Identificacion'
                TableField = 'Identificacion'
              end
              item
                DatasetField = 'Departamento'
                TableField = 'Departamento'
              end
              item
                DatasetField = 'CuentaContable'
                TableField = 'CuentaContable'
              end
              item
                DatasetField = 'CentroCostos'
                TableField = 'CentroCostos'
              end
              item
                DatasetField = 'NumeroEconomico'
                TableField = 'NumeroEconomico'
              end
              item
                DatasetField = 'NIP'
                TableField = 'NIP'
              end
              item
                DatasetField = 'Estatus'
                TableField = 'Estatus'
              end
              item
                DatasetField = 'CargasMaximas'
                TableField = 'CargasMaximas'
              end
              item
                DatasetField = 'Odometro'
                TableField = 'Odometro'
              end
              item
                DatasetField = 'Firma'
                TableField = 'Firma'
              end
              item
                DatasetField = 'Placas'
                TableField = 'Placas'
              end
              item
                DatasetField = 'FechaAlta'
                TableField = 'FechaAlta'
              end
              item
                DatasetField = 'FechaExpira'
                TableField = 'FechaExpira'
              end
              item
                DatasetField = 'FechaBaja'
                TableField = 'FechaBaja'
              end
              item
                DatasetField = 'FechaCancelacion'
                TableField = 'FechaCancelacion'
              end
              item
                DatasetField = 'FechaBloqueada'
                TableField = 'FechaBloqueada'
              end
              item
                DatasetField = 'FechaInactiva'
                TableField = 'FechaInactiva'
              end
              item
                DatasetField = 'Mensaje'
                TableField = 'Mensaje'
              end
              item
                DatasetField = 'LimiteLTTurno'
                TableField = 'LimiteLTTurno'
              end
              item
                DatasetField = 'LimiteLTDia'
                TableField = 'LimiteLTDia'
              end
              item
                DatasetField = 'LimiteLTSemana'
                TableField = 'LimiteLTSemana'
              end
              item
                DatasetField = 'LimiteLTMes'
                TableField = 'LimiteLTMes'
              end
              item
                DatasetField = 'LimiteMNTurno'
                TableField = 'LimiteMNTurno'
              end
              item
                DatasetField = 'LimiteMNDia'
                TableField = 'LimiteMNDia'
              end
              item
                DatasetField = 'LimiteMNSemana'
                TableField = 'LimiteMNSemana'
              end
              item
                DatasetField = 'LimiteMNMes'
                TableField = 'LimiteMNMes'
              end
              item
                DatasetField = 'ActualLTTurno'
                TableField = 'ActualLTTurno'
              end
              item
                DatasetField = 'ActualLTDia'
                TableField = 'ActualLTDia'
              end
              item
                DatasetField = 'ActualLTSemana'
                TableField = 'ActualLTSemana'
              end
              item
                DatasetField = 'ActualLTMes'
                TableField = 'ActualLTMes'
              end
              item
                DatasetField = 'ActualMNTurno'
                TableField = 'ActualMNTurno'
              end
              item
                DatasetField = 'ActualMNDia'
                TableField = 'ActualMNDia'
              end
              item
                DatasetField = 'ActualMNSemana'
                TableField = 'ActualMNSemana'
              end
              item
                DatasetField = 'ActualMNMes'
                TableField = 'ActualMNMes'
              end
              item
                DatasetField = 'ActualCargas'
                TableField = 'ActualCargas'
              end
              item
                DatasetField = 'Clasificacion'
                TableField = 'Clasificacion'
              end
              item
                DatasetField = 'Generada'
                TableField = 'Generada'
              end
              item
                DatasetField = 'Lunes'
                TableField = 'Lunes'
              end
              item
                DatasetField = 'Martes'
                TableField = 'Martes'
              end
              item
                DatasetField = 'Miercoles'
                TableField = 'Miercoles'
              end
              item
                DatasetField = 'Jueves'
                TableField = 'Jueves'
              end
              item
                DatasetField = 'Viernes'
                TableField = 'Viernes'
              end
              item
                DatasetField = 'Sabado'
                TableField = 'Sabado'
              end
              item
                DatasetField = 'Domingo'
                TableField = 'Domingo'
              end
              item
                DatasetField = 'ProductoAutorizado'
                TableField = 'ProductoAutorizado'
              end>
          end>
        Name = 'SaldoTarjeta'
        Fields = <
          item
            Name = 'VehiculoID'
            DataType = datInteger
          end
          item
            Name = 'ClienteID'
            DataType = datInteger
          end
          item
            Name = 'GasolineroID'
            DataType = datInteger
          end
          item
            Name = 'FormaCompraID'
            DataType = datInteger
          end
          item
            Name = 'DigitoSeguridad'
            DataType = datInteger
          end
          item
            Name = 'Nombre'
            DataType = datString
            Size = 30
          end
          item
            Name = 'Identificacion'
            DataType = datString
            Size = 30
          end
          item
            Name = 'Departamento'
            DataType = datString
            Size = 20
          end
          item
            Name = 'CuentaContable'
            DataType = datString
            Size = 15
          end
          item
            Name = 'CentroCostos'
            DataType = datString
            Size = 15
          end
          item
            Name = 'NumeroEconomico'
            DataType = datString
            Size = 15
          end
          item
            Name = 'NIP'
            DataType = datString
            Size = 8
          end
          item
            Name = 'Estatus'
            DataType = datString
            Size = 1
          end
          item
            Name = 'CargasMaximas'
            DataType = datInteger
          end
          item
            Name = 'Odometro'
            DataType = datBoolean
          end
          item
            Name = 'Firma'
            DataType = datBoolean
          end
          item
            Name = 'Placas'
            DataType = datBoolean
          end
          item
            Name = 'FechaAlta'
            DataType = datDateTime
          end
          item
            Name = 'FechaExpira'
            DataType = datDateTime
          end
          item
            Name = 'FechaBaja'
            DataType = datDateTime
          end
          item
            Name = 'FechaCancelacion'
            DataType = datDateTime
          end
          item
            Name = 'FechaBloqueada'
            DataType = datDateTime
          end
          item
            Name = 'FechaInactiva'
            DataType = datDateTime
          end
          item
            Name = 'Mensaje'
            DataType = datString
            Size = 50
          end
          item
            Name = 'LimiteLTTurno'
            DataType = datFloat
          end
          item
            Name = 'LimiteLTDia'
            DataType = datFloat
          end
          item
            Name = 'LimiteLTSemana'
            DataType = datFloat
          end
          item
            Name = 'LimiteLTMes'
            DataType = datFloat
          end
          item
            Name = 'LimiteMNTurno'
            DataType = datFloat
          end
          item
            Name = 'LimiteMNDia'
            DataType = datFloat
          end
          item
            Name = 'LimiteMNSemana'
            DataType = datFloat
          end
          item
            Name = 'LimiteMNMes'
            DataType = datFloat
          end
          item
            Name = 'ActualLTTurno'
            DataType = datFloat
          end
          item
            Name = 'ActualLTDia'
            DataType = datFloat
          end
          item
            Name = 'ActualLTSemana'
            DataType = datFloat
          end
          item
            Name = 'ActualLTMes'
            DataType = datFloat
          end
          item
            Name = 'ActualMNTurno'
            DataType = datFloat
          end
          item
            Name = 'ActualMNDia'
            DataType = datFloat
          end
          item
            Name = 'ActualMNSemana'
            DataType = datFloat
          end
          item
            Name = 'ActualMNMes'
            DataType = datFloat
          end
          item
            Name = 'ActualCargas'
            DataType = datInteger
          end
          item
            Name = 'Clasificacion'
            DataType = datInteger
          end
          item
            Name = 'Generada'
            DataType = datBoolean
          end
          item
            Name = 'Lunes'
            DataType = datString
            Size = 24
          end
          item
            Name = 'Martes'
            DataType = datString
            Size = 24
          end
          item
            Name = 'Miercoles'
            DataType = datString
            Size = 24
          end
          item
            Name = 'Jueves'
            DataType = datString
            Size = 24
          end
          item
            Name = 'Viernes'
            DataType = datString
            Size = 24
          end
          item
            Name = 'Sabado'
            DataType = datString
            Size = 24
          end
          item
            Name = 'Domingo'
            DataType = datString
            Size = 24
          end
          item
            Name = 'ProductoAutorizado'
            DataType = datString
            Size = 10
          end>
      end
      item
        Params = <
          item
            Name = 'ClienteID'
            Value = '1'
            ParamType = daptInput
          end
          item
            Name = 'GasolineroID'
            Value = '1'
            ParamType = daptInput
          end
          item
            Name = 'VehiculoID'
            Value = '1'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            SQL = 
              'Select * from Autorizacion'#10'Where (ClienteID = :ClienteID) and (G' +
              'asolineroID = :GasolineroID) and'#10'      (VehiculoID = :VehiculoID' +
              ') and (Tipo = 1)'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'AutorizacionID'
                TableField = 'AutorizacionID'
              end
              item
                DatasetField = 'Fecha'
                TableField = 'Fecha'
              end
              item
                DatasetField = 'Importe'
                TableField = 'Importe'
              end
              item
                DatasetField = 'Cantidad'
                TableField = 'Cantidad'
              end
              item
                DatasetField = 'ImporteCantidad'
                TableField = 'ImporteCantidad'
              end
              item
                DatasetField = 'PosicionCarga'
                TableField = 'PosicionCarga'
              end
              item
                DatasetField = 'Referencia'
                TableField = 'Referencia'
              end
              item
                DatasetField = 'EstacionID'
                TableField = 'EstacionID'
              end
              item
                DatasetField = 'VehiculoID'
                TableField = 'VehiculoID'
              end
              item
                DatasetField = 'ClienteID'
                TableField = 'ClienteID'
              end
              item
                DatasetField = 'GasolineroID'
                TableField = 'GasolineroID'
              end
              item
                DatasetField = 'Tipo'
                TableField = 'Tipo'
              end>
          end>
        Name = 'spBuscaAutorizacionTarjeta'
        Fields = <
          item
            Name = 'AutorizacionID'
            DataType = datInteger
          end
          item
            Name = 'Fecha'
            DataType = datDateTime
          end
          item
            Name = 'Importe'
            DataType = datFloat
          end
          item
            Name = 'Cantidad'
            DataType = datFloat
          end
          item
            Name = 'ImporteCantidad'
            DataType = datString
            Size = 1
          end
          item
            Name = 'PosicionCarga'
            DataType = datInteger
          end
          item
            Name = 'Referencia'
            DataType = datString
            Size = 50
          end
          item
            Name = 'EstacionID'
            DataType = datInteger
          end
          item
            Name = 'VehiculoID'
            DataType = datInteger
          end
          item
            Name = 'ClienteID'
            DataType = datInteger
          end
          item
            Name = 'GasolineroID'
            DataType = datInteger
          end
          item
            Name = 'Tipo'
            DataType = datInteger
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
            Name = 'ClienteID'
            Value = '1'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'Flotillas'
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
            Connection = 'Flotillas'
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
            Connection = 'Flotillas'
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
            Name = 'Barras'
            Value = '1009'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            SQL = 
              'Declare @Barras as Varchar(300)'#10'Select @Barras = (Select :Barras' +
              ')'#10#10'Select * from dbo.Autorizacion'#10'Where (dbo.Autorizacion.Refere' +
              'ncia = @Barras)'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'AutorizacionID'
                TableField = 'AutorizacionID'
              end
              item
                DatasetField = 'Fecha'
                TableField = 'Fecha'
              end
              item
                DatasetField = 'Importe'
                TableField = 'Importe'
              end
              item
                DatasetField = 'Cantidad'
                TableField = 'Cantidad'
              end
              item
                DatasetField = 'ImporteCantidad'
                TableField = 'ImporteCantidad'
              end
              item
                DatasetField = 'PosicionCarga'
                TableField = 'PosicionCarga'
              end
              item
                DatasetField = 'Referencia'
                TableField = 'Referencia'
              end
              item
                DatasetField = 'EstacionID'
                TableField = 'EstacionID'
              end
              item
                DatasetField = 'VehiculoID'
                TableField = 'VehiculoID'
              end
              item
                DatasetField = 'ClienteID'
                TableField = 'ClienteID'
              end>
          end>
        Name = 'spBuscaAutorizacion'
        Fields = <
          item
            Name = 'AutorizacionID'
            DataType = datInteger
          end
          item
            Name = 'Fecha'
            DataType = datDateTime
          end
          item
            Name = 'Importe'
            DataType = datFloat
          end
          item
            Name = 'Cantidad'
            DataType = datFloat
          end
          item
            Name = 'ImporteCantidad'
            DataType = datString
            Size = 1
          end
          item
            Name = 'PosicionCarga'
            DataType = datInteger
          end
          item
            Name = 'Referencia'
            DataType = datString
            Size = 50
          end
          item
            Name = 'EstacionID'
            DataType = datInteger
          end
          item
            Name = 'VehiculoID'
            DataType = datInteger
          end
          item
            Name = 'ClienteID'
            DataType = datInteger
          end>
      end
      item
        Params = <
          item
            Name = 'Barras'
            Value = '100334'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            SQL = 
              'declare @Barras varchar(50)'#10#10'select @Barras = (Select :Barras)'#10#10 +
              'if (Len(@Barras) <= 10)'#10'begin'#10#9'SELECT     Cupon.CuponID, Cupon.I' +
              'mporte, Cupon.Status, Cupon.Referencia, Cupon.Barras, Cupon.Clie' +
              'nteID, Cliente.Nombre, Cliente.RazonSocial, Cliente.Domicilio,'#10#9 +
              '                      Cliente.RFC, Cliente.CuentaContable, Clien' +
              'te.TarjetaID, Cliente.GasolineroID,'#10#9'                      LoteC' +
              'upon.FechaValido'#10#9'FROM         Cupon INNER JOIN'#10#9'               ' +
              '       Cliente ON Cliente.ClienteID = Cupon.ClienteID INNER JOIN' +
              #10#9'                      LoteCupon ON Cupon.LoteCuponID = LoteCup' +
              'on.LoteCuponID'#10#9'where (cast(dbo.Cupon.CuponID as varchar(50)) = ' +
              '@Barras)'#10'end'#10'else'#10'begin'#10#9'SELECT     Cupon.CuponID, Cupon.Importe' +
              ', Cupon.Status, Cupon.Referencia, Cupon.Barras, Cupon.ClienteID,' +
              ' Cliente.Nombre, Cliente.RazonSocial, Cliente.Domicilio,'#10#9'      ' +
              '                Cliente.RFC, Cliente.CuentaContable, Cliente.Tar' +
              'jetaID, Cliente.GasolineroID,'#10'                              Lote' +
              'Cupon.FechaValido'#10#9'FROM         Cupon INNER JOIN'#10#9'              ' +
              '        Cliente ON Cliente.ClienteID = Cupon.ClienteID INNER JOI' +
              'N'#10#9'                      LoteCupon ON Cupon.LoteCuponID = LoteCu' +
              'pon.LoteCuponID'#10#9'where (dbo.Cupon.Barras = @Barras)'#10'end'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'CuponID'
                TableField = 'CuponID'
              end
              item
                DatasetField = 'Importe'
                TableField = 'Importe'
              end
              item
                DatasetField = 'Status'
                TableField = 'Status'
              end
              item
                DatasetField = 'Referencia'
                TableField = 'Referencia'
              end
              item
                DatasetField = 'ClienteID'
                TableField = 'ClienteID'
              end
              item
                DatasetField = 'Nombre'
                TableField = 'Nombre'
              end
              item
                DatasetField = 'RazonSocial'
                TableField = 'RazonSocial'
              end
              item
                DatasetField = 'Domicilio'
                TableField = 'Domicilio'
              end
              item
                DatasetField = 'RFC'
                TableField = 'RFC'
              end
              item
                DatasetField = 'CuentaContable'
                TableField = 'CuentaContable'
              end
              item
                DatasetField = 'TarjetaID'
                TableField = 'TarjetaID'
              end
              item
                DatasetField = 'GasolineroID'
                TableField = 'GasolineroID'
              end
              item
                DatasetField = 'Barras'
                TableField = 'Barras'
              end
              item
                DatasetField = 'FechaValido'
                TableField = 'FechaValido'
              end>
          end>
        Name = 'spObtenCuponValido'
        Fields = <
          item
            Name = 'CuponID'
            DataType = datInteger
          end
          item
            Name = 'Importe'
            DataType = datFloat
          end
          item
            Name = 'Status'
            DataType = datString
            Size = 1
          end
          item
            Name = 'Referencia'
            DataType = datString
            Size = 50
          end
          item
            Name = 'Barras'
            DataType = datString
            Size = 16
          end
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
            Name = 'RazonSocial'
            DataType = datString
            Size = 70
          end
          item
            Name = 'Domicilio'
            DataType = datString
            Size = 80
          end
          item
            Name = 'RFC'
            DataType = datString
            Size = 20
          end
          item
            Name = 'CuentaContable'
            DataType = datString
            Size = 15
          end
          item
            Name = 'TarjetaID'
            DataType = datInteger
          end
          item
            Name = 'GasolineroID'
            DataType = datInteger
          end
          item
            Name = 'FechaValido'
            DataType = datDateTime
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'Flotillas'
            SQL = 'Select * From Gasolinero'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'GasolineroID'
                TableField = 'GasolineroID'
              end
              item
                DatasetField = 'Nombre'
                TableField = 'Nombre'
              end
              item
                DatasetField = 'Domicilio'
                TableField = 'Domicilio'
              end
              item
                DatasetField = 'RFC'
                TableField = 'RFC'
              end
              item
                DatasetField = 'Iva'
                TableField = 'Iva'
              end>
          end>
        Name = 'Gasolinero'
        Fields = <
          item
            Name = 'GasolineroID'
            DataType = datInteger
          end
          item
            Name = 'Nombre'
            DataType = datString
            Size = 70
          end
          item
            Name = 'Domicilio'
            DataType = datString
            Size = 100
          end
          item
            Name = 'RFC'
            DataType = datString
            Size = 20
          end
          item
            Name = 'Iva'
            DataType = datFloat
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'Flotillas'
            SQL = 'Select Distinct Grupo from Cliente'#10'order by grupo'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'Grupo'
                TableField = 'Grupo'
              end>
          end>
        Name = 'Grupos'
        Fields = <
          item
            Name = 'Grupo'
            DataType = datString
            Size = 50
          end>
      end
      item
        Params = <
          item
            Name = 'VehiculoID'
            Value = '17'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            Name = 'Flotillas'
            SQL = 
              'SELECT     Cliente.ClienteID, Cliente.Nombre, Vehiculo.VehiculoI' +
              'D, Referencia.Referencia'#10'FROM         Cliente INNER JOIN'#10'       ' +
              '               Vehiculo ON Cliente.ClienteID = Vehiculo.ClienteI' +
              'D INNER JOIN'#10'                      Referencia ON Vehiculo.Vehicu' +
              'loID = Referencia.VehiculoID'#10'Where Vehiculo.VehiculoID = :Vehicu' +
              'loID'#10
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
                DatasetField = 'VehiculoID'
                TableField = 'VehiculoID'
              end
              item
                DatasetField = 'Referencia'
                TableField = 'Referencia'
              end>
          end>
        Name = 'DatosVehiculo'
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
            Name = 'VehiculoID'
            DataType = datInteger
          end
          item
            Name = 'Referencia'
            DataType = datString
            Size = 50
          end>
      end
      item
        Params = <
          item
            Name = 'MovimientoID'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'SaldodocumentoID'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'Fecha'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'FechaVencimiento'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'Cargo'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'Abono'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'Referencia'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'ClienteID'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'ReciboID'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'BancoID'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'Folio'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'Ejercicio'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'Periodo'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'Cheque'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'Importe'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'CuentaContableCliente'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'UsuarioID'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'EstacionID'
            Value = ''
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            Name = 'Flotillas'
            SQL = 
              'DECLARE @REGISTRO AS INT'#10#10'SELECT @REGISTRO = (SELECT COUNT(*) FR' +
              'OM SALDODOCUMENTO WHERE MOVIMIENTOID = :MovimientoID)'#10#10'IF @REGIS' +
              'TRO > 0'#10'BEGIN'#10#10'INSERT INTO SALDODOCUMENTO(SaldodocumentoID,Fecha' +
              ',FechaVencimiento,Cargo,Abono,Referencia,ClienteID,MovimientoID,' +
              'ReciboID,BancoID)'#10'VALUES(:SaldodocumentoID,:Fecha,:FechaVencimie' +
              'nto,:Cargo,:Abono,:Referencia,:ClienteID,:MovimientoID,:ReciboID' +
              ',:BancoID)'#10#10'INSERT INTO RECIBO(ReciboID,Folio,FechaMovimiento,Ej' +
              'ercicio,Periodo,Cheque,Referencia,Importe,CuentaContableCliente,' +
              'FechaCaptura,FechaAplicacion,UsuarioID,ClienteID,MovimientoID,Ba' +
              'ncoID,EstacionID)'#10'VALUES (:ReciboID,:Folio,:Fecha,:Ejercicio,:Pe' +
              'riodo,:Cheque,:Referencia,:Importe,:CuentaContableCliente,:Fecha' +
              ',:Fecha,:UsuarioID,:ClienteID,:MovimientoID,:BancoID,:EstacionID' +
              ')'#10#10'SELECT 1 AS RESULT'#10#10'END'#10'ELSE SELECT -1 AS RESULT'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'RESULT'
                TableField = 'RESULT'
              end>
          end>
        Name = 'spRegistraPagosFaltantes'
        Fields = <
          item
            Name = 'RESULT'
            DataType = datInteger
          end>
      end
      item
        Params = <
          item
            Name = 'ClienteID'
            Value = '1'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            SQL = 
              'SELECT'#10'    ClienteID, Nombre, RazonSocial, Domicilio,'#10'    Grupo,' +
              ' Colonia, CodigoPostal, Ciudad, Telefono, RFC,'#10'    CuentaContabl' +
              'e, PlazoPago, Estatus, FechaIngreso, NIP,'#10'    FechaBaja, LimiteC' +
              'redito, Deposito, CambioCredito,'#10'    CambioCreditoAnterior, Ulti' +
              'moPago, ClienteNuevo,'#10'    FormaPagoID, TarjetaID'#10'  FROM'#10'    dbo.' +
              'Cliente'#10'  WHERE'#10'    ClienteID = :ClienteID'#10
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
                DatasetField = 'RazonSocial'
                TableField = 'RazonSocial'
              end
              item
                DatasetField = 'Domicilio'
                TableField = 'Domicilio'
              end
              item
                DatasetField = 'Grupo'
                TableField = 'Grupo'
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
                DatasetField = 'Ciudad'
                TableField = 'Ciudad'
              end
              item
                DatasetField = 'Telefono'
                TableField = 'Telefono'
              end
              item
                DatasetField = 'RFC'
                TableField = 'RFC'
              end
              item
                DatasetField = 'CuentaContable'
                TableField = 'CuentaContable'
              end
              item
                DatasetField = 'PlazoPago'
                TableField = 'PlazoPago'
              end
              item
                DatasetField = 'Estatus'
                TableField = 'Estatus'
              end
              item
                DatasetField = 'FechaIngreso'
                TableField = 'FechaIngreso'
              end
              item
                DatasetField = 'NIP'
                TableField = 'NIP'
              end
              item
                DatasetField = 'FechaBaja'
                TableField = 'FechaBaja'
              end
              item
                DatasetField = 'LimiteCredito'
                TableField = 'LimiteCredito'
              end
              item
                DatasetField = 'Deposito'
                TableField = 'Deposito'
              end
              item
                DatasetField = 'CambioCredito'
                TableField = 'CambioCredito'
              end
              item
                DatasetField = 'CambioCreditoAnterior'
                TableField = 'CambioCreditoAnterior'
              end
              item
                DatasetField = 'UltimoPago'
                TableField = 'UltimoPago'
              end
              item
                DatasetField = 'ClienteNuevo'
                TableField = 'ClienteNuevo'
              end
              item
                DatasetField = 'FormaPagoID'
                TableField = 'FormaPagoID'
              end
              item
                DatasetField = 'TarjetaID'
                TableField = 'TarjetaID'
              end>
          end>
        Name = 'DatosCliente'
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
            Name = 'RazonSocial'
            DataType = datString
            Size = 70
          end
          item
            Name = 'Domicilio'
            DataType = datString
            Size = 80
          end
          item
            Name = 'Grupo'
            DataType = datString
            Size = 50
          end
          item
            Name = 'Colonia'
            DataType = datString
            Size = 25
          end
          item
            Name = 'CodigoPostal'
            DataType = datInteger
          end
          item
            Name = 'Ciudad'
            DataType = datString
            Size = 30
          end
          item
            Name = 'Telefono'
            DataType = datString
            Size = 20
          end
          item
            Name = 'RFC'
            DataType = datString
            Size = 20
          end
          item
            Name = 'CuentaContable'
            DataType = datString
            Size = 15
          end
          item
            Name = 'PlazoPago'
            DataType = datInteger
          end
          item
            Name = 'Estatus'
            DataType = datString
            Size = 1
          end
          item
            Name = 'FechaIngreso'
            DataType = datDateTime
          end
          item
            Name = 'NIP'
            DataType = datString
            Size = 8
          end
          item
            Name = 'FechaBaja'
            DataType = datDateTime
          end
          item
            Name = 'LimiteCredito'
            DataType = datFloat
          end
          item
            Name = 'Deposito'
            DataType = datFloat
          end
          item
            Name = 'CambioCredito'
            DataType = datDateTime
          end
          item
            Name = 'CambioCreditoAnterior'
            DataType = datDateTime
          end
          item
            Name = 'UltimoPago'
            DataType = datDateTime
          end
          item
            Name = 'ClienteNuevo'
            DataType = datBoolean
          end
          item
            Name = 'FormaPagoID'
            DataType = datInteger
          end
          item
            Name = 'TarjetaID'
            DataType = datInteger
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
            Connection = 'Flotillas'
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
            DataType = datWideMemo
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
            Name = 'Cliente'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'Vehiculo'
            Value = ''
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            SQL = 
              'Declare @Cliente Integer'#10'Declare @Vehiculo Integer'#10'SELECT      V' +
              'ehiculoID, Vehi.ClienteID AS NoCliente, Vehi.DigitoSeguridad, Cl' +
              'nt.Nombre, Clnt.RazonSocial, Clnt.Domicilio AS Calle,'#10'          ' +
              '            Clnt.Colonia, Clnt.Ciudad AS Delegacion, Clnt.Codigo' +
              'Postal AS CP, Clnt.RFC,'#10'                      Clnt.Telefono, Veh' +
              'i.NIP, Vehi.Identificacion, Vehi.Nombre AS Usuario,'#10'            ' +
              '          Vehi.FechaExpira AS Expiracion, Vehi.Clasificacion'#10'FRO' +
              'M         Vehiculo as Vehi INNER JOIN Cliente as Clnt ON Vehi.Cl' +
              'ienteID = Clnt.ClienteID'#10'WHERE        (Vehi.ClienteID = :Cliente' +
              ') AND (Vehi.VehiculoID= :Vehiculo)'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'VehiculoID'
                TableField = 'VehiculoID'
              end
              item
                DatasetField = 'NoCliente'
                TableField = 'NoCliente'
              end
              item
                DatasetField = 'DigitoSeguridad'
                TableField = 'DigitoSeguridad'
              end
              item
                DatasetField = 'Nombre'
                TableField = 'Nombre'
              end
              item
                DatasetField = 'RazonSocial'
                TableField = 'RazonSocial'
              end
              item
                DatasetField = 'Calle'
                TableField = 'Calle'
              end
              item
                DatasetField = 'Colonia'
                TableField = 'Colonia'
              end
              item
                DatasetField = 'Delegacion'
                TableField = 'Delegacion'
              end
              item
                DatasetField = 'CP'
                TableField = 'CP'
              end
              item
                DatasetField = 'RFC'
                TableField = 'RFC'
              end
              item
                DatasetField = 'Telefono'
                TableField = 'Telefono'
              end
              item
                DatasetField = 'NIP'
                TableField = 'NIP'
              end
              item
                DatasetField = 'Identificacion'
                TableField = 'Identificacion'
              end
              item
                DatasetField = 'Usuario'
                TableField = 'Usuario'
              end
              item
                DatasetField = 'Expiracion'
                TableField = 'Expiracion'
              end
              item
                DatasetField = 'Clasificacion'
                TableField = 'Clasificacion'
              end>
          end>
        Name = 'dbo GeneraArchivo'
        Fields = <
          item
            Name = 'VehiculoID'
            DataType = datInteger
          end
          item
            Name = 'NoCliente'
            DataType = datInteger
          end
          item
            Name = 'DigitoSeguridad'
            DataType = datInteger
          end
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
            Name = 'Calle'
            DataType = datString
            Size = 80
          end
          item
            Name = 'Colonia'
            DataType = datString
            Size = 25
          end
          item
            Name = 'Delegacion'
            DataType = datString
            Size = 30
          end
          item
            Name = 'CP'
            DataType = datInteger
          end
          item
            Name = 'RFC'
            DataType = datString
            Size = 20
          end
          item
            Name = 'Telefono'
            DataType = datString
            Size = 20
          end
          item
            Name = 'NIP'
            DataType = datString
            Size = 8
          end
          item
            Name = 'Identificacion'
            DataType = datString
            Size = 30
          end
          item
            Name = 'Usuario'
            DataType = datString
            Size = 30
          end
          item
            Name = 'Expiracion'
            DataType = datDateTime
          end
          item
            Name = 'Clasificacion'
            DataType = datInteger
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
            Value = '3'
            ParamType = daptInput
          end
          item
            Name = 'PeriodoIni'
            Value = '2'
            ParamType = daptInput
          end
          item
            Name = 'PeriodoFin'
            Value = '2'
            ParamType = daptInput
          end
          item
            Name = 'Ejercicio'
            Value = '2'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            SQL = 
              'SELECT     dbo.Movimiento.ClienteID, dbo.Movimiento.FECHAMOVIMIE' +
              'NTO as Fecha, dbo.Movimiento.Referencia,'#10#9'                      ' +
              #9'dbo.Movimiento.MovimientoID as Documento, dbo.Movimiento.Cargo,' +
              ' dbo.Movimiento.Abono'#10#9#9'FROM         dbo.Movimiento'#10#9#9'WHERE'#10'    ' +
              '            dbo.Movimiento.CLIENTEID between :ClienteIni and :Cl' +
              'ienteFin AND'#10'                dbo.Movimiento.Periodo BETWEEN :Per' +
              'iodoIni AND :PeriodoFin AND'#10'                dbo.Movimiento.Ejerc' +
              'icio = :Ejercicio'#10#9#9'ORDER BY dbo.Movimiento.FECHAMOVIMIENTO'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'ClienteID'
                TableField = 'ClienteID'
              end
              item
                DatasetField = 'Fecha'
                TableField = 'Fecha'
              end
              item
                DatasetField = 'Referencia'
                TableField = 'Referencia'
              end
              item
                DatasetField = 'Documento'
                TableField = 'Documento'
              end
              item
                DatasetField = 'Cargo'
                TableField = 'Cargo'
              end
              item
                DatasetField = 'Abono'
                TableField = 'Abono'
              end>
          end>
        Name = 'spConsultaSaldoDetalle'
        Fields = <
          item
            Name = 'ClienteID'
            DataType = datInteger
          end
          item
            Name = 'Fecha'
            DataType = datDateTime
          end
          item
            Name = 'Referencia'
            DataType = datString
            Size = 50
          end
          item
            Name = 'Documento'
            DataType = datInteger
          end
          item
            Name = 'Cargo'
            DataType = datFloat
          end
          item
            Name = 'Abono'
            DataType = datFloat
          end>
      end
      item
        Params = <
          item
            Name = 'Ejercicio'
            Value = '2'
            ParamType = daptInput
          end
          item
            Name = 'PeriodoIni'
            Value = '10'
            ParamType = daptInput
          end
          item
            Name = 'PeriodoFin'
            Value = '1'
            ParamType = daptInput
          end
          item
            Name = 'Identificador'
            Value = '1'
            ParamType = daptInput
          end
          item
            Name = 'ClienteIni'
            Value = '1'
            ParamType = daptInput
          end
          item
            Name = 'ClienteFin'
            Value = '3'
            ParamType = daptInput
          end
          item
            Name = 'FormaCompra'
            Value = '1'
            ParamType = daptInput
          end
          item
            Name = 'Diafacturar'
            Value = '1'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            SQL = 
              'DECLARE @Ejercicio Integer'#10'DECLARE @Ini Integer'#10'DECLARE @Fin Int' +
              'eger'#10'DECLARE @Identificador INTEGER'#10'DECLARE @GRUPO VARCHAR(100)'#10 +
              'DECLARE @ClienteIni INTEGER'#10'DECLARE @ClienteFin INTEGER'#10'DECLARE ' +
              '@FormaCompra INTEGER'#10'DECLARE @DiaFacturar INTEGER'#10#10#10'Select @ejer' +
              'cicio = (select :Ejercicio)'#10'select @ini = (select :PeriodoIni)'#10's' +
              'elect @fin = (select :PeriodoFin)'#10'select @Identificador = (selec' +
              't :Identificador)'#10'select @Clienteini =  (select :ClienteIni)'#10'sel' +
              'ect @clientefin = (select :ClienteFin)'#10'select @Formacompra = (se' +
              'lect :FormaCompra)'#10'select @Diafacturar = (select :Diafacturar)'#10#10 +
              #10'DECLARE @CONSUMOS MONEY'#10'DECLARE @SALDOINICIAL MONEY'#10'DECLARE @SA' +
              'LDOFINAL MONEY'#10'DECLARE @TOTALCARGOS MONEY'#10'DECLARE @TOTALABONOS M' +
              'ONEY'#10'DECLARE @SUBTOTAL MONEY'#10'DECLARE @SALDO MONEY'#10'DECLARE @CUANT' +
              'OS MONEY'#10#10#10#10#9#9' DECLARE @XCLIENTE AS INT'#10#9#9' DECLARE @XNOMBRE AS V' +
              'ARCHAR(100)'#10#9#9' DECLARE @XRFC AS VARCHAR(25)'#10#9#9' DECLARE @XCALLE A' +
              'S VARCHAR(100)'#10#9#9' DECLARE @XFECHA AS DATETIME'#10#9#9' DECLARE @XREFER' +
              'ENCIA AS VARCHAR(80)'#10#9#9' DECLARE @XFACTURA AS VARCHAR(6)'#10#9#9' DECLA' +
              'RE @XCARGO AS FLOAT'#10#9#9' DECLARE @XABONO AS FLOAT'#10#9#9' DECLARE @XLIM' +
              'ITECREDITO AS FLOAT'#10#9#9' DECLARE @XSALDOINICIAL AS FLOAT'#10#9#9' DECLAR' +
              'E @XCONSUMOS AS FLOAT'#10#9#9' DECLARE @XTOTALCARGOS AS FLOAT'#10#9#9' DECLA' +
              'RE @XTOTALABONOS AS FLOAT'#10#9#9' DECLARE @XSUBTOTAL AS FLOAT'#10#9#9' DECL' +
              'ARE @XSALDO AS FLOAT'#10#9#9' DECLARE @XDISPONIBLE AS FLOAT'#10#9#9' DECLARE' +
              ' @XSALDOPARCIAL AS FLOAT'#10#9#9' DECLARE @XOK AS INT'#10' '#9#9' DECLARE @XFC' +
              ' AS INT'#10#10#9#9'CREATE TABLE #SALDOCLIENTE'#10#9#9'(CLIENTE INT,'#10#9#9' NOMBRE ' +
              'VARCHAR(100),'#10#9#9' GRUPO VARCHAR(100),'#10#9#9' LIMITECREDITO MONEY,'#10#9#9' ' +
              'SALDOINICIAL MONEY,'#10#9#9' CONSUMOS MONEY,'#10#9#9' TOTALCARGOS MONEY,'#10#9#9' ' +
              'TOTALABONOS MONEY,'#10#9#9' SALDO MONEY,'#10#9#9' DISPONIBLE MONEY)'#10#10#10#9'WHILE' +
              ' (@CLIENTEINI <= @CLIENTEFIN)'#10'     BEGIN'#10#9'SELECT @XOK = 0'#10#9'selec' +
              't @GRUPO = (SELECT Grupo FROM dbo.Cliente WHERE ClienteID = @CLI' +
              'ENTEINI)'#10#10#9'IF (@FORMACOMPRA > 0 AND (SELECT COUNT(*) FROM dbo.Cl' +
              'iente WHERE ClienteID = @CLIENTEINI AND FORMACOMPRAID = @FORMACO' +
              'MPRA) < 1)'#10#9#9'SELECT @XOK = 1'#10#9'IF (@DIAFACTURAR > 0 AND (SELECT C' +
              'OUNT(*) FROM dbo.Cliente WHERE ClienteID = @CLIENTEINI AND Grupo' +
              'FacturarID = @DIAFACTURAR) < 1)'#10#9#9'SELECT @XOK = 1'#10#9'IF (@XOK = 0)' +
              #10#9'BEGIN'#10#10#9'SELECT @XNOMBRE = (SELECT NOMBRE FROM dbo.Cliente wher' +
              'e clienteid = @Clienteini)'#10#9'IF (@XNOMBRE IS NOT NULL)'#10#9'BEGIN'#10#9'SE' +
              'LECT @xlimiteCredito = (SELECT LimiteCredito FROM dbo.Cliente wh' +
              'ere clienteid = @Clienteini)'#10#10#9'SELECT @XFC = (SELECT FORMACOMPRA' +
              'ID FROM dbo.Cliente WHERE ClienteID = @CLIENTEINI)'#10#10#9'IF (@XFC = ' +
              '1)'#10#9'BEGIN'#10#10#9#9'SELECT @CONSUMOS = (SELECT SUM(Importe) FROM dbo.Co' +
              'nsumo WHERE ClienteID = @CLIENTEINI AND FACTURADO = 0)'#10#9'END'#10#9'ELS' +
              'E'#10#9'BEGIN'#10#9#9'SELECT @CONSUMOS = (SELECT SUM(Importe) FROM dbo.Cons' +
              'umo WHERE (ClienteID = @CLIENTEINI)'#10#9#9#9#9#9'    AND (Ejercicio >= @' +
              'EJERCICIO) AND (Periodo Between @INI AND @FIN))'#10#9'END'#10#10#9'SELECT @C' +
              'ONSUMOS = ISNULL(@CONSUMOS, 0)'#10#10#9'SELECT @SALDOINICIAL = (SELECT ' +
              'SUM(CARGO - Abono) FROM dbo.Movimiento where (ClienteID = @Clien' +
              'teIni) AND ((ejercicio < @Ejercicio) or (ejercicio = @ejercicio ' +
              'and periodo < @ini)))'#10#10#10#9'SELECT @SALDOINICIAL = ISNULL(@SALDOINI' +
              'CIAL, 0)'#10#10#10#10#9'SELECT @TOTALCARGOS = ISNULL((SELECT SUM(CARGO) FRO' +
              'M         dbo.Movimiento'#10#9'WHERE  ClienteID = @CLIENTEINI AND Per' +
              'iodo Between @INI AND @FIN AND EJERCICIO = @Ejercicio), 0)'#10#10#10#9'SE' +
              'LECT @TOTALABONOS = ISNULL((SELECT SUM(ABONO) FROM         dbo.M' +
              'ovimiento'#10#9'WHERE  ClienteID = @CLIENTEINI AND Periodo Between @I' +
              'NI AND @FIN AND EJERCICIO = @Ejercicio), 0)'#10#10#9'SELECT @SUBTOTAL =' +
              ' ISNULL(@SALDOINICIAL + @TOTALCARGOS - @TOTALABONOS, 0)'#10#10#9'SELECT' +
              ' @SALDO = ISNULL(@SUBTOTAL + @CONSUMOS, 0)'#10#10'        SELECT @CUAN' +
              'TOS = (SELECT     COUNT(*)'#10#10#9'FROM    dbo.Movimiento'#10#9'WHERE  Clie' +
              'nteID = @CLIENTEINI AND Periodo Between @INI AND @FIN AND EJERCI' +
              'CIO = @Ejercicio)'#10#10#9'INSERT INTO #SALDOCLIENTE VALUES (@CLIENTEIN' +
              'I, @XNOMBRE, @GRUPO, @XLIMITECREDITO, @SALDOINICIAL, @CONSUMOS,'#10 +
              #9#9'@TOTALCARGOS, @TOTALABONOS, @SALDO, @XLIMITECREDITO - @SALDO)'#10 +
              #9'END'#10#10#9'SELECT @CLIENTEINI = @CLIENTEINI + 1'#10#10#9'END'#10#9#9'END'#10#10'SELECT ' +
              '* FROM #SALDOCLIENTE'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'CLIENTE'
                TableField = 'CLIENTE'
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
                DatasetField = 'LIMITECREDITO'
                TableField = 'LIMITECREDITO'
              end
              item
                DatasetField = 'SALDOINICIAL'
                TableField = 'SALDOINICIAL'
              end
              item
                DatasetField = 'CONSUMOS'
                TableField = 'CONSUMOS'
              end
              item
                DatasetField = 'TOTALCARGOS'
                TableField = 'TOTALCARGOS'
              end
              item
                DatasetField = 'TOTALABONOS'
                TableField = 'TOTALABONOS'
              end
              item
                DatasetField = 'SALDO'
                TableField = 'SALDO'
              end
              item
                DatasetField = 'DISPONIBLE'
                TableField = 'DISPONIBLE'
              end>
          end>
        Name = 'spConsultaSaldosMaster'
        Fields = <
          item
            Name = 'CLIENTE'
            DataType = datInteger
          end
          item
            Name = 'NOMBRE'
            DataType = datString
            Size = 100
          end
          item
            Name = 'GRUPO'
            DataType = datString
            Size = 100
          end
          item
            Name = 'LIMITECREDITO'
            DataType = datCurrency
          end
          item
            Name = 'SALDOINICIAL'
            DataType = datCurrency
          end
          item
            Name = 'CONSUMOS'
            DataType = datCurrency
          end
          item
            Name = 'TOTALCARGOS'
            DataType = datCurrency
          end
          item
            Name = 'TOTALABONOS'
            DataType = datCurrency
          end
          item
            Name = 'SALDO'
            DataType = datCurrency
          end
          item
            Name = 'DISPONIBLE'
            DataType = datCurrency
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
            Connection = 'Flotillas'
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
            Name = 'ClienteID'
            Value = '1'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            SQL = 
              'Declare @ClienteID as integer'#10#10'Select @ClienteID = (Select :Clie' +
              'nteID)'#10#10'SELECT distinct * FROM'#10'(SELECT distinct a.SaldoDocumento' +
              'ID, a.ClienteID, x.Saldo, b.Referencia, b.Importe, b.Fecha, b.Ve' +
              'ncimiento, a.MovimientoID'#10' FROM   (SELECT  distinct  SaldoDocume' +
              'ntoID, ClienteID, MovimientoID, SUM(Cargo - Abono) AS Saldo'#10'    ' +
              '    FROM        dbo.SaldoDocumento'#10'        GROUP BY    SaldoDocu' +
              'mentoID, ClienteID, MovimientoID'#10'        HAVING      (SUM(Cargo ' +
              '- Abono) > 0)) AS a INNER JOIN'#10'        (SELECT DISTINCT SaldoDoc' +
              'umentoID, Referencia, Cargo AS Importe, Fecha, MovimientoID, Fec' +
              'haVencimiento AS Vencimiento'#10'        FROM          dbo.SaldoDocu' +
              'mento'#10'        WHERE      (Abono = 0)) AS b ON a.MovimientoID = b' +
              '.MovimientoID and a.SaldoDocumentoID = b.SaldoDocumentoID Inner ' +
              'Join'#10'        (Select sum(Cargo - Abono) as saldo, MovimientoID'#10' ' +
              '        from dbo.SaldoDocumento'#10'         where(dbo.SaldoDocument' +
              'o.ClienteID = @ClienteID)'#10'         Group By MovimientoID)as x ON' +
              ' a.MovimientoID = x.MovimientoID ) AS c'#10#10'Where (c.ClienteID = @C' +
              'lienteID) and (c.saldo > 0.5)'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'SaldoDocumentoID'
                TableField = 'SaldoDocumentoID'
              end
              item
                DatasetField = 'ClienteID'
                TableField = 'ClienteID'
              end
              item
                DatasetField = 'Saldo'
                TableField = 'Saldo'
              end
              item
                DatasetField = 'Referencia'
                TableField = 'Referencia'
              end
              item
                DatasetField = 'Importe'
                TableField = 'Importe'
              end
              item
                DatasetField = 'Fecha'
                TableField = 'Fecha'
              end
              item
                DatasetField = 'Vencimiento'
                TableField = 'Vencimiento'
              end
              item
                DatasetField = 'MovimientoID'
                TableField = 'MovimientoID'
              end>
          end>
        Name = 'spSaldoDocumento'
        Fields = <
          item
            Name = 'SaldoDocumentoID'
            DataType = datInteger
          end
          item
            Name = 'ClienteID'
            DataType = datInteger
          end
          item
            Name = 'Saldo'
            DataType = datFloat
          end
          item
            Name = 'Referencia'
            DataType = datString
            Size = 50
          end
          item
            Name = 'Importe'
            DataType = datFloat
          end
          item
            Name = 'Fecha'
            DataType = datDateTime
          end
          item
            Name = 'Vencimiento'
            DataType = datDateTime
          end
          item
            Name = 'MovimientoID'
            DataType = datInteger
          end>
      end
      item
        Params = <
          item
            Name = 'Serie'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'Folio'
            Value = ''
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            SQL = 
              'declare @Serie as varchar(5)'#10'declare @Folio as integer'#10#10'select @' +
              'Serie = (:Serie)'#10'select @Folio = (:Folio)'#10#10'select cli.Nombre, fc' +
              't.Fecha, fct.Total from dbo.Factura fct'#10'inner join dbo.Cliente c' +
              'li on (cli.ClienteID = fct.ClienteID)'#10'Where(fct.Serie = @Serie)a' +
              'nd(fct.Folio = @Folio)'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'Nombre'
                TableField = 'Nombre'
              end
              item
                DatasetField = 'Fecha'
                TableField = 'Fecha'
              end
              item
                DatasetField = 'Total'
                TableField = 'Total'
              end>
          end>
        Name = 'obtenDatosFactura'
        Fields = <
          item
            Name = 'Nombre'
            DataType = datString
            Size = 70
          end
          item
            Name = 'Fecha'
            DataType = datDateTime
          end
          item
            Name = 'Total'
            DataType = datFloat
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'Flotillas'
            SQL = 'SELECT * FROM SaldoEjercicio'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'ClienteID'
                TableField = 'ClienteID'
              end
              item
                DatasetField = 'Ejercicio'
                TableField = 'Ejercicio'
              end
              item
                DatasetField = 'SaldoInicial'
                TableField = 'SaldoInicial'
              end
              item
                DatasetField = 'CargosAcumulados'
                TableField = 'CargosAcumulados'
              end
              item
                DatasetField = 'AbonosAcumulados'
                TableField = 'AbonosAcumulados'
              end
              item
                DatasetField = 'SaldoFinal'
                TableField = 'SaldoFinal'
              end
              item
                DatasetField = 'Cargo01'
                TableField = 'Cargo01'
              end
              item
                DatasetField = 'Cargo02'
                TableField = 'Cargo02'
              end
              item
                DatasetField = 'Cargo03'
                TableField = 'Cargo03'
              end
              item
                DatasetField = 'Cargo04'
                TableField = 'Cargo04'
              end
              item
                DatasetField = 'Cargo05'
                TableField = 'Cargo05'
              end
              item
                DatasetField = 'Cargo06'
                TableField = 'Cargo06'
              end
              item
                DatasetField = 'Cargo07'
                TableField = 'Cargo07'
              end
              item
                DatasetField = 'Cargo08'
                TableField = 'Cargo08'
              end
              item
                DatasetField = 'Cargo09'
                TableField = 'Cargo09'
              end
              item
                DatasetField = 'Cargo10'
                TableField = 'Cargo10'
              end
              item
                DatasetField = 'Cargo11'
                TableField = 'Cargo11'
              end
              item
                DatasetField = 'Cargo12'
                TableField = 'Cargo12'
              end
              item
                DatasetField = 'Abono01'
                TableField = 'Abono01'
              end
              item
                DatasetField = 'Abono02'
                TableField = 'Abono02'
              end
              item
                DatasetField = 'Abono03'
                TableField = 'Abono03'
              end
              item
                DatasetField = 'Abono04'
                TableField = 'Abono04'
              end
              item
                DatasetField = 'Abono05'
                TableField = 'Abono05'
              end
              item
                DatasetField = 'Abono06'
                TableField = 'Abono06'
              end
              item
                DatasetField = 'Abono07'
                TableField = 'Abono07'
              end
              item
                DatasetField = 'Abono08'
                TableField = 'Abono08'
              end
              item
                DatasetField = 'Abono09'
                TableField = 'Abono09'
              end
              item
                DatasetField = 'Abono10'
                TableField = 'Abono10'
              end
              item
                DatasetField = 'Abono11'
                TableField = 'Abono11'
              end
              item
                DatasetField = 'Abono12'
                TableField = 'Abono12'
              end>
          end>
        Name = 'dbo CargoAbono'
        Fields = <
          item
            Name = 'ClienteID'
            DataType = datInteger
          end
          item
            Name = 'Ejercicio'
            DataType = datInteger
          end
          item
            Name = 'SaldoInicial'
            DataType = datFloat
          end
          item
            Name = 'CargosAcumulados'
            DataType = datFloat
          end
          item
            Name = 'AbonosAcumulados'
            DataType = datFloat
          end
          item
            Name = 'SaldoFinal'
            DataType = datFloat
          end
          item
            Name = 'Cargo01'
            DataType = datFloat
          end
          item
            Name = 'Cargo02'
            DataType = datFloat
          end
          item
            Name = 'Cargo03'
            DataType = datFloat
          end
          item
            Name = 'Cargo04'
            DataType = datFloat
          end
          item
            Name = 'Cargo05'
            DataType = datFloat
          end
          item
            Name = 'Cargo06'
            DataType = datFloat
          end
          item
            Name = 'Cargo07'
            DataType = datFloat
          end
          item
            Name = 'Cargo08'
            DataType = datFloat
          end
          item
            Name = 'Cargo09'
            DataType = datFloat
          end
          item
            Name = 'Cargo10'
            DataType = datFloat
          end
          item
            Name = 'Cargo11'
            DataType = datFloat
          end
          item
            Name = 'Cargo12'
            DataType = datFloat
          end
          item
            Name = 'Abono01'
            DataType = datFloat
          end
          item
            Name = 'Abono02'
            DataType = datFloat
          end
          item
            Name = 'Abono03'
            DataType = datFloat
          end
          item
            Name = 'Abono04'
            DataType = datFloat
          end
          item
            Name = 'Abono05'
            DataType = datFloat
          end
          item
            Name = 'Abono06'
            DataType = datFloat
          end
          item
            Name = 'Abono07'
            DataType = datFloat
          end
          item
            Name = 'Abono08'
            DataType = datFloat
          end
          item
            Name = 'Abono09'
            DataType = datFloat
          end
          item
            Name = 'Abono10'
            DataType = datFloat
          end
          item
            Name = 'Abono11'
            DataType = datFloat
          end
          item
            Name = 'Abono12'
            DataType = datFloat
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'Flotillas'
            SQL = 'SELECT'#10'      FormaPagoID,Nombre'#10'FROM'#10'      dbo.FormaPago'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'FormaPagoID'
                TableField = 'FormaPagoID'
              end
              item
                DatasetField = 'Nombre'
                TableField = 'Nombre'
              end>
          end>
        Name = 'dbo FormaPago'
        Fields = <
          item
            Name = 'FormaPagoID'
            DataType = datInteger
          end
          item
            Name = 'Nombre'
            DataType = datString
            Size = 70
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'Flotillas'
            SQL = 'SELECT'#10'      FormaCompraID, Nombre'#10'FROM'#10'     dbo.FormaCompra'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'FormaCompraID'
                TableField = 'FormaCompraID'
              end
              item
                DatasetField = 'Nombre'
                TableField = 'Nombre'
              end>
          end>
        Name = 'dbo FormaCompra'
        Fields = <
          item
            Name = 'FormaCompraID'
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
            Name = 'param'
            Value = '1'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            SQL = 
              'declare @param as Int'#10#10'select @param = (select :param)'#10#10'Select P' +
              'recio, Descripcion FROM dbo.Producto'#10'WHERE (ProductoID = @param)' +
              #10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'Precio'
                TableField = 'Precio'
              end
              item
                DatasetField = 'Descripcion'
                TableField = 'Descripcion'
              end>
          end>
        Name = 'obtenDescPrecio'
        Fields = <
          item
            Name = 'Precio'
            DataType = datFloat
          end
          item
            Name = 'Descripcion'
            DataType = datString
            Size = 80
          end>
      end
      item
        Params = <
          item
            Name = 'param'
            Value = 'FacturaID'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            SQL = 
              'declare @param as Varchar(15)'#10'select @param = (select :param)'#10#10's' +
              'elect Serie from dbo.Folio'#10'where (Campo = @param)'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'Serie'
                TableField = 'Serie'
              end>
          end>
        Name = 'obtenSerie'
        Fields = <
          item
            Name = 'Serie'
            DataType = datString
            Size = 5
          end>
      end
      item
        Params = <
          item
            Name = 'FechaCorte'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'GrupoFacturar'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'Magna'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'Premium'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'Diesel'
            Value = ''
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            SQL = 
              'CREATE TABLE #TEMP1('#10'IVA FLOAT,'#10'CLIENTEID INT,'#10'PRECIO FLOAT,'#10'CAN' +
              'TIDAD FLOAT,'#10'PRODUCTOID INT,'#10'PLAZOPAGO INT,'#10'IMPORTE FLOAT,'#10'IMPUE' +
              'STOIMPORTE FLOAT'#10')'#10#10'declare @FechaCorte as DateTime'#10'declare @Gru' +
              'poFacturar as int'#10'declare @Magna as int'#10'declare @Premium as int'#10 +
              'declare @Diesel as int'#10#10'select @FechaCorte = (Select :FechaCorte' +
              ')'#10'select @GrupoFacturar = (Select :GrupoFacturar)'#10#10'INSERT INTO #' +
              'TEMP1'#10'SELECT     Estacion.IVA, cns.ClienteID, cns.Precio, SUM(cn' +
              's.Cantidad) AS Cantidad, cns.ProductoID, cli.PlazoPago, SUM(cns.' +
              'Importe) AS Importe, SUM(cns.ImpuestoImporte)'#10'                  ' +
              '    AS ImpuestoImporte'#10'from dbo.Consumo cns'#10'inner join dbo.Clien' +
              'te cli on (cns.ClienteID = cli.ClienteID) inner join Estacion on' +
              ' Estacion.EstacionID = cns.EstacionID'#10'Where (cli.GrupoFacturarID' +
              ' = @GrupoFacturar)and(cns.Facturado = 0)and (cns.FechaMovimiento' +
              ' <= @FechaCorte)'#10'AND (CLI.FACTURACONSUMOCUPON = 1)AND(SUBSTRING(' +
              'CNS.TARJETA,1,4)<>'#39'0005'#39')AND(LEN(CNS.TARJETA)>=10)'#10'AND (CNS.TARJ' +
              'ETA <> '#39'GRUPO CUPONES'#39') AND ((cns.ProductoID = :Magna) OR (cns.P' +
              'roductoID = :Premium) OR (cns.ProductoID = :Diesel) OR'#10'      (cn' +
              's.ProductoID >= 10))'#10'GROUP BY Estacion.IVA, cns.ClienteID, cns.P' +
              'recio, cli.PlazoPago, cns.ProductoID'#10'having sum(cns.Importe) > 0' +
              #10'order by cns.ClienteID'#10#10'INSERT INTO #TEMP1'#10'SELECT     Estacion.' +
              'IVA, cns.ClienteID, cns.Precio, SUM(cns.Cantidad) AS Cantidad, c' +
              'ns.ProductoID, cli.PlazoPago, SUM(cns.Importe) AS Importe, SUM(c' +
              'ns.ImpuestoImporte)'#10'                      AS ImpuestoImporte'#10'fro' +
              'm dbo.Consumo cns'#10'inner join dbo.Cliente cli on (cns.ClienteID =' +
              ' cli.ClienteID) inner join Estacion on Estacion.EstacionID = cns' +
              '.EstacionID'#10'Where (cli.GrupoFacturarID = @GrupoFacturar)and(cns.' +
              'Facturado = 0)and (cns.FechaMovimiento <= @FechaCorte)'#10'AND (ISNU' +
              'LL(CLI.FACTURACONSUMOCUPON,0) = 0) AND'#10'(CNS.TARJETA <> '#39'GRUPO CU' +
              'PONES'#39') AND ((cns.ProductoID = :Magna) OR (cns.ProductoID = :Pre' +
              'mium) OR (cns.ProductoID = :Diesel) OR'#10'      (cns.ProductoID >= ' +
              '10))'#10'GROUP BY Estacion.IVA, cns.ClienteID, cns.Precio, cli.Plazo' +
              'Pago, cns.ProductoID'#10'having sum(cns.Importe) > 0'#10'order by cns.Cl' +
              'ienteID'#10#10#10'SELECT IVA, ClienteID, Precio, SUM(Cantidad) AS Cantid' +
              'ad, ProductoID, PlazoPago, SUM(Importe) AS Importe, SUM(Impuesto' +
              'Importe)'#10'                      AS ImpuestoImporte'#10'FROM #TEMP1'#10'GR' +
              'OUP BY IVA, ClienteID, Precio, PlazoPago, ProductoID'#10'ORDER BY CL' +
              'IENTEID'#10#10'DROP TABLE #TEMP1'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IVA'
                TableField = 'IVA'
              end
              item
                DatasetField = 'ClienteID'
                TableField = 'ClienteID'
              end
              item
                DatasetField = 'Precio'
                TableField = 'Precio'
              end
              item
                DatasetField = 'Cantidad'
                TableField = 'Cantidad'
              end
              item
                DatasetField = 'ProductoID'
                TableField = 'ProductoID'
              end
              item
                DatasetField = 'PlazoPago'
                TableField = 'PlazoPago'
              end
              item
                DatasetField = 'Importe'
                TableField = 'Importe'
              end
              item
                DatasetField = 'ImpuestoImporte'
                TableField = 'ImpuestoImporte'
              end>
          end>
        Name = 'spObtenClientesConsumos'
        Fields = <
          item
            Name = 'IVA'
            DataType = datFloat
          end
          item
            Name = 'ClienteID'
            DataType = datInteger
          end
          item
            Name = 'Precio'
            DataType = datFloat
          end
          item
            Name = 'Cantidad'
            DataType = datFloat
          end
          item
            Name = 'ProductoID'
            DataType = datInteger
          end
          item
            Name = 'PlazoPago'
            DataType = datInteger
          end
          item
            Name = 'Importe'
            DataType = datFloat
          end
          item
            Name = 'ImpuestoImporte'
            DataType = datFloat
          end>
      end
      item
        Params = <
          item
            Name = 'Fecha'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'Tarjeta'
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
            Connection = 'Flotillas'
            Default = True
            Name = 'Flotillas'
            SQL = 
              'declare @Fecha as datetime'#10'select @Fecha = (select :Fecha)'#10'selec' +
              't count(*) as Total from bancaria'#10'where Tarjeta = :Tarjeta and S' +
              'erie = :Serie And Resultado not like '#39'%ERROR%'#39#10'and year(Fecha) =' +
              ' Year(@Fecha) and Month(Fecha) = Month(@Fecha) and'#10'day(Fecha) = ' +
              'day(@Fecha)'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'Total'
                TableField = 'Total'
              end>
          end>
        Name = 'spBuscaBancariaFecha'
        Fields = <
          item
            Name = 'Total'
            DataType = datInteger
          end>
      end
      item
        Params = <
          item
            Name = 'Ticket'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'EstacionID'
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
            Connection = 'Flotillas'
            Default = True
            Name = 'Flotillas'
            SQL = 
              'Select Aprobada, Resultado'#10'from Bancaria'#10'where Ticket=:Ticket an' +
              'd EstacionID = :EstacionID and Serie = :Serie'#10'order by Aprobada ' +
              'Desc'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'Resultado'
                TableField = 'Resultado'
              end
              item
                DatasetField = 'Aprobada'
                TableField = 'Aprobada'
              end>
          end>
        Name = 'spBuscaBancaria'
        Fields = <
          item
            Name = 'Aprobada'
            DataType = datBoolean
          end
          item
            Name = 'Resultado'
            DataType = datString
            Size = 80
          end>
      end
      item
        Params = <
          item
            Name = 'Serie'
            DataType = datString
            Size = 5
            Value = 'A'
          end
          item
            Name = 'Folio'
            DataType = datInteger
            Value = '19'
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            TargetTable = 'dbo.Factura'
            Name = 'Flotillas'
            SQL = 
              'SELECT '#10'    FacturaID, Serie, Folio'#10'  FROM'#10'    dbo.Factura'#10'  WHE' +
              'RE'#10'    Serie = :Serie And Folio = :Folio'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'FacturaID'
                TableField = 'FacturaID'
              end
              item
                DatasetField = 'Serie'
                TableField = 'Serie'
              end
              item
                DatasetField = 'Folio'
                TableField = 'Folio'
              end>
          end>
        Name = 'dbo ExisteFactura'
        Fields = <
          item
            Name = 'FacturaID'
            DataType = datInteger
          end
          item
            Name = 'Serie'
            DataType = datString
            Size = 5
          end
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
            ParamType = daptInput
          end
          item
            Name = 'Folio'
            Value = '18'
            ParamType = daptInput
          end
          item
            Name = 'NewSerie'
            Value = 'A'
            ParamType = daptInput
          end
          item
            Name = 'NewFolio'
            Value = '19'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            TargetTable = 'dbo.Factura'
            SQL = 
              'declare @Resultado varchar(100)'#10'declare @Serie varchar(5)'#10'declar' +
              'e @Folio int'#10'declare @NewSerie varchar(5)'#10'declare @NewFolio int'#10 +
              #10'declare @FacturaID int'#10'declare @NewFacturaID int'#10#10#10'select @Seri' +
              'e = (Select :Serie)'#10'select @Folio = (Select :Folio)'#10'select @NewS' +
              'erie = (Select :NewSerie)'#10'select @NewFolio = (Select :NewFolio)'#10 +
              #10'select @FacturaID = IsNull((Select FacturaID from Factura where' +
              ' Serie = @Serie and Folio = @Folio), 0)'#10'select @NewFacturaID = I' +
              'sNull((Select FacturaID from Factura where Serie = @NewSerie and' +
              ' Folio = @NewFolio), 0)'#10#10'if (@FacturaID > 0)'#10'begin'#10'  if (@NewFac' +
              'turaID = 0)'#10'  begin'#10'    update factura set serie = @NewSerie, Fo' +
              'lio = @NewFolio where serie = @Serie and Folio = @Folio'#10'    sele' +
              'ct @Resultado = (Select '#39'El cambio de folio de la factura fue ex' +
              'itoso.'#39')'#10'  end'#10'  else'#10'  begin'#10'    select @Resultado = (Select '#39'E' +
              'l nuevo folio de la factura ya existe.'#39')'#10'  end'#10'end'#10'else'#10'begin'#10'  ' +
              'select @Resultado = (Select '#39'El folio de la factura no existe.'#39')' +
              #10'end'#10#10'Select @Resultado as Resultado'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'Resultado'
                TableField = '<unknown>'
                SQLOrigin = 'Resultado'
              end>
          end>
        Name = 'spCambiaFactura'
        Fields = <
          item
            Name = 'Resultado'
            DataType = datString
            Size = 100
          end>
      end
      item
        Params = <
          item
            Name = 'Folio'
            Value = '1'
          end
          item
            Name = 'Campo'
            Value = ''
          end
          item
            Name = 'Serie'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            Name = 'Flotillas'
            SQL = 
              'UPDATE Folio'#10'Set Folio = :Folio'#10'where Campo = :Campo and Serie =' +
              ' :Serie'#10'select '#39'El Folio se modifico correctamente.'#39' As Resultad' +
              'o'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'Resultado'
                TableField = 'Resultado'
              end>
          end>
        Name = 'spModificaFolioFactura'
        Fields = <
          item
            Name = 'Resultado'
            DataType = datString
            Size = 35
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            Name = 'Flotillas'
            SQL = 
              'SELECT     UsuarioID, Nombre, Activo, Tarjeta, EstacionID'#10'FROM  ' +
              '       Usuario'#10'WHERE     (Tarjeta <> '#39#39')'#10'order by usuarioid'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'UsuarioID'
                TableField = 'UsuarioID'
              end
              item
                DatasetField = 'Nombre'
                TableField = 'Nombre'
              end
              item
                DatasetField = 'Activo'
                TableField = 'Activo'
              end
              item
                DatasetField = 'Tarjeta'
                TableField = 'Tarjeta'
              end
              item
                DatasetField = 'EstacionID'
                TableField = 'EstacionID'
              end>
          end>
        Name = 'spTarjetasLLave'
        Fields = <
          item
            Name = 'UsuarioID'
            DataType = datInteger
          end
          item
            Name = 'Nombre'
            DataType = datString
            Size = 70
          end
          item
            Name = 'Activo'
            DataType = datBoolean
          end
          item
            Name = 'Tarjeta'
            DataType = datString
            Size = 16
          end
          item
            Name = 'EstacionID'
            DataType = datInteger
          end>
      end
      item
        Params = <
          item
            Name = 'Folio'
            Value = '3332'
            ParamType = daptInput
          end
          item
            Name = 'Serie'
            Value = 'df'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            Name = 'Flotillas'
            SQL = 
              'declare @FacturaID as int'#10'declare @MovimientoID as int'#10'declare @' +
              'MiError as int'#10'declare @OK as bit'#10'declare @Pagos as float'#10#10'selec' +
              't @facturaid = (select top 1 isnull(facturaid, 0) from factura w' +
              'here folio = :Folio and Serie = :Serie)'#10'select @Ok = (select 0)'#10 +
              #10'if (@facturaid > 0)'#10'begin'#10#9'select @movimientoid = (select top 1' +
              ' movimientoid from factura where facturaid = @facturaid)'#10#10#9'selec' +
              't @pagos = isnull((select sum(abono) from saldodocumento where m' +
              'ovimientoid = @movimientoid), 0)'#10#10#9'if (@pagos = 0)'#10'    begin'#10#10#9#9 +
              'BEGIN TRANSACTION'#10#10#9#9'delete from detallefactura'#10#9#9'where facturai' +
              'd = @facturaid'#10#9#9'select @MiError = (Select @@ERROR)'#10#10#9#9'if (@MiEr' +
              'ror = 0)'#10#9#9'begin'#10#9#9#9'delete from movimiento'#10#9#9#9'where movimientoid' +
              ' = @movimientoid'#10#9#9#9'select @MiError = (Select @@ERROR)'#10#10#9#9#9'if (@' +
              'MiError = 0)'#10#9#9#9'begin'#10#9#9#9#9'delete from saldodocumento'#10#9#9#9#9'where m' +
              'ovimientoid = @movimientoid'#10#9#9#9#9'select @MiError = (Select @@ERRO' +
              'R)'#10#10#9#9#9#9'if (@MiError = 0)'#10#9#9#9#9'begin'#10#9#9#9#9#9'delete from factura'#10#9#9#9 +
              #9#9'where facturaid = @facturaid'#10#9#9#9#9#9'select @MiError = (Select @@' +
              'ERROR)'#10#10#9#9#9#9#9'if (@MiError = 0)'#10#9#9#9#9#9'begin'#10#9#9#9#9#9#9'update consumo s' +
              'et'#10#9#9#9#9#9#9'facturado = 0, facturaid = 0'#10#9#9#9#9#9#9'where facturaid = @F' +
              'acturaID'#10#9#9#9#9#9#9'select @MiError = (Select @@ERROR)'#10#9#9#9#9#9#9#10#9#9#9#9#9#9'i' +
              'f (@MiError = 0)'#10#9#9#9#9#9#9'begin'#10'                                   ' +
              '                delete from FacturaElectronica'#10'                 ' +
              '                                  where facturaid = @facturaid'#10' ' +
              '                                                  select @MiErro' +
              'r = (Select @@ERROR)'#10#9#9#9#9#9#9'end'#10#9#9#9#9#9'end'#10#9#9#9#9'end'#10#9#9#9'end'#10#9#9'end'#10#10#9#9 +
              'if (@MiError = 0)'#10#9#9'begin'#10#9#9'  COMMIT TRANSACTION'#10#9#9'  select @Ok ' +
              '= (select 1)'#10#9#9'end'#10#9#9'else'#10#9#9'begin'#10'                  ROLLBACK TRA' +
              'NSACTION'#10#9#9'end'#10#9'end'#10'end'#10#10'select @ok as Resultado'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'Resultado'
                TableField = 'Resultado'
              end>
          end>
        Name = 'spEliminaFactura'
        Fields = <
          item
            Name = 'Resultado'
            DataType = datBoolean
          end>
      end
      item
        Params = <
          item
            Name = 'AutorizacionID'
            Value = '1'
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            Name = 'Flotillas'
            SQL = 
              'SELECT     A.AutorizacionID, A.Fecha, A.Importe, A.Cantidad, A.I' +
              'mporteCantidad, A.PosicionCarga, A.Referencia, A.EstacionID, A.V' +
              'ehiculoID, A.ClienteID, A.GasolineroID, A.Tipo,'#10'                ' +
              '      A.Odometro, A.Nombre, Vehiculo.Identificacion, Vehiculo.No' +
              'mbre AS VehiculoNombre'#10'FROM         (SELECT     Autorizacion.Aut' +
              'orizacionID, Autorizacion.Fecha, Autorizacion.Importe, Autorizac' +
              'ion.Cantidad, Autorizacion.ImporteCantidad, Autorizacion.Posicio' +
              'nCarga,'#10'                                              Autorizaci' +
              'on.Referencia, Autorizacion.EstacionID, Autorizacion.VehiculoID,' +
              ' Autorizacion.ClienteID, Autorizacion.GasolineroID, Autorizacion' +
              '.Tipo,'#10'                                              Autorizacio' +
              'n.Odometro, Cliente.Nombre'#10'                       FROM          ' +
              'Autorizacion LEFT OUTER JOIN'#10'                                   ' +
              '           Cliente ON Autorizacion.ClienteID = Cliente.ClienteID' +
              ') AS A LEFT OUTER JOIN'#10'                      Vehiculo ON A.Vehic' +
              'uloID = Vehiculo.VehiculoID'#10'  WHERE'#10'    AutorizacionID = :Autori' +
              'zacionID'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'AutorizacionID'
                TableField = 'AutorizacionID'
              end
              item
                DatasetField = 'Fecha'
                TableField = 'Fecha'
              end
              item
                DatasetField = 'Importe'
                TableField = 'Importe'
              end
              item
                DatasetField = 'Cantidad'
                TableField = 'Cantidad'
              end
              item
                DatasetField = 'ImporteCantidad'
                TableField = 'ImporteCantidad'
              end
              item
                DatasetField = 'PosicionCarga'
                TableField = 'PosicionCarga'
              end
              item
                DatasetField = 'Referencia'
                TableField = 'Referencia'
              end
              item
                DatasetField = 'EstacionID'
                TableField = 'EstacionID'
              end
              item
                DatasetField = 'VehiculoID'
                TableField = 'VehiculoID'
              end
              item
                DatasetField = 'ClienteID'
                TableField = 'ClienteID'
              end
              item
                DatasetField = 'GasolineroID'
                TableField = 'GasolineroID'
              end
              item
                DatasetField = 'Tipo'
                TableField = 'Tipo'
              end
              item
                DatasetField = 'Odometro'
                TableField = 'Odometro'
              end
              item
                DatasetField = 'Nombre'
                TableField = 'Nombre'
              end
              item
                DatasetField = 'Identificacion'
                TableField = 'Identificacion'
              end
              item
                DatasetField = 'VehiculoNombre'
                TableField = 'VehiculoNombre'
              end>
          end>
        Name = 'spAutorizacion'
        Fields = <
          item
            Name = 'AutorizacionID'
            DataType = datInteger
          end
          item
            Name = 'Fecha'
            DataType = datDateTime
          end
          item
            Name = 'Importe'
            DataType = datFloat
          end
          item
            Name = 'Cantidad'
            DataType = datFloat
          end
          item
            Name = 'ImporteCantidad'
            DataType = datString
            Size = 1
          end
          item
            Name = 'PosicionCarga'
            DataType = datInteger
          end
          item
            Name = 'Referencia'
            DataType = datString
            Size = 50
          end
          item
            Name = 'EstacionID'
            DataType = datInteger
          end
          item
            Name = 'VehiculoID'
            DataType = datInteger
          end
          item
            Name = 'ClienteID'
            DataType = datInteger
          end
          item
            Name = 'GasolineroID'
            DataType = datInteger
          end
          item
            Name = 'Tipo'
            DataType = datInteger
          end
          item
            Name = 'Odometro'
            DataType = datInteger
          end
          item
            Name = 'Nombre'
            DataType = datString
            Size = 70
          end
          item
            Name = 'Identificacion'
            DataType = datString
            Size = 30
          end
          item
            Name = 'VehiculoNombre'
            DataType = datString
            Size = 30
          end>
      end
      item
        Params = <
          item
            Name = 'EstacionID'
            Value = '4120'
          end
          item
            Name = 'BombaID'
            Value = '1'
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            Name = 'Flotillas'
            SQL = 
              'SELECT     Autorizacion.AutorizacionID, Autorizacion.Fecha, Auto' +
              'rizacion.Importe, Autorizacion.Cantidad, Autorizacion.ImporteCan' +
              'tidad,'#10'                      Autorizacion.PosicionCarga, Autoriz' +
              'acion.Referencia, Autorizacion.EstacionID, Autorizacion.Vehiculo' +
              'ID, Autorizacion.ClienteID,'#10'                      Autorizacion.G' +
              'asolineroID, Autorizacion.Tipo, Cliente.Nombre, Vehiculo.Product' +
              'oAutorizado'#10'FROM         Autorizacion INNER JOIN'#10'               ' +
              '       Cliente ON Autorizacion.ClienteID = Cliente.ClienteID INN' +
              'ER JOIN'#10'                      Vehiculo ON Autorizacion.VehiculoI' +
              'D = Vehiculo.VehiculoID'#10'WHERE     (Autorizacion.EstacionID = :Es' +
              'tacionID) AND (Autorizacion.PosicionCarga = :BombaID) AND (Autor' +
              'izacion.Tipo = 1)'#10'ORDER BY Autorizacion.Fecha DESC'#10#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'AutorizacionID'
                TableField = 'AutorizacionID'
              end
              item
                DatasetField = 'Fecha'
                TableField = 'Fecha'
              end
              item
                DatasetField = 'Importe'
                TableField = 'Importe'
              end
              item
                DatasetField = 'Cantidad'
                TableField = 'Cantidad'
              end
              item
                DatasetField = 'ImporteCantidad'
                TableField = 'ImporteCantidad'
              end
              item
                DatasetField = 'PosicionCarga'
                TableField = 'PosicionCarga'
              end
              item
                DatasetField = 'Referencia'
                TableField = 'Referencia'
              end
              item
                DatasetField = 'EstacionID'
                TableField = 'EstacionID'
              end
              item
                DatasetField = 'VehiculoID'
                TableField = 'VehiculoID'
              end
              item
                DatasetField = 'ClienteID'
                TableField = 'ClienteID'
              end
              item
                DatasetField = 'GasolineroID'
                TableField = 'GasolineroID'
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
                DatasetField = 'ProductoAutorizado'
                TableField = 'ProductoAutorizado'
              end>
          end>
        Name = 'spREDAutorizaciones'
        Fields = <
          item
            Name = 'AutorizacionID'
            DataType = datInteger
          end
          item
            Name = 'Fecha'
            DataType = datDateTime
          end
          item
            Name = 'Importe'
            DataType = datFloat
          end
          item
            Name = 'Cantidad'
            DataType = datFloat
          end
          item
            Name = 'ImporteCantidad'
            DataType = datString
            Size = 1
          end
          item
            Name = 'PosicionCarga'
            DataType = datInteger
          end
          item
            Name = 'Referencia'
            DataType = datString
            Size = 50
          end
          item
            Name = 'EstacionID'
            DataType = datInteger
          end
          item
            Name = 'VehiculoID'
            DataType = datInteger
          end
          item
            Name = 'ClienteID'
            DataType = datInteger
          end
          item
            Name = 'GasolineroID'
            DataType = datInteger
          end
          item
            Name = 'Tipo'
            DataType = datInteger
          end
          item
            Name = 'Nombre'
            DataType = datString
            Size = 70
          end
          item
            Name = 'ProductoAutorizado'
            DataType = datWideString
            Size = 10
          end>
      end
      item
        Params = <
          item
            Name = 'ProductoID'
            Value = '1'
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            Name = 'Flotillas'
            SQL = 'select Precio from producto'#10'where productoID = :ProductoID'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'Precio'
                TableField = 'Precio'
              end>
          end>
        Name = 'spPrecioProducto'
        Fields = <
          item
            Name = 'Precio'
            DataType = datFloat
          end>
      end
      item
        Params = <
          item
            Name = 'EstacionID'
            Value = '1'
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            Name = 'Flotillas'
            SQL = 'select IVA from estacion'#10'where estacionid = :EstacionID'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IVA'
                TableField = 'IVA'
              end>
          end>
        Name = 'spIVAEstacion'
        Fields = <
          item
            Name = 'IVA'
            DataType = datFloat
          end>
      end
      item
        Params = <
          item
            Name = 'ProductoID'
            Value = '1'
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            Name = 'Flotillas'
            SQL = 'select Descripcion from producto'#10'where productoid = :ProductoID'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'Descripcion'
                TableField = 'Descripcion'
              end>
          end>
        Name = 'spNombreProducto'
        Fields = <
          item
            Name = 'Descripcion'
            DataType = datString
            Size = 80
          end>
      end
      item
        Params = <
          item
            Name = 'ID'
            Value = '0'
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            Name = 'Flotillas'
            SQL = 
              'SELECT '#10'    ProductoID, Descripcion, Precio'#10'  FROM'#10'    dbo.Produ' +
              'cto'#10'  WHERE'#10'    ProductoID = :ID'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'ProductoID'
                TableField = 'ProductoID'
              end
              item
                DatasetField = 'Descripcion'
                TableField = 'Descripcion'
              end
              item
                DatasetField = 'Precio'
                TableField = 'Precio'
              end>
          end>
        Name = 'spDatosProducto'
        Fields = <
          item
            Name = 'ProductoID'
            DataType = datInteger
          end
          item
            Name = 'Descripcion'
            DataType = datString
            Size = 80
          end
          item
            Name = 'Precio'
            DataType = datFloat
          end>
      end
      item
        Params = <
          item
            Name = 'Tarjeta'
            Value = ' '
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            Name = 'Flotillas'
            SQL = 
              'SELECT     Cliente.ClienteID, Vehiculo.VehiculoID, Cliente.Nombr' +
              'e, Vehiculo.Identificacion'#10'FROM         Referencia INNER JOIN'#10'  ' +
              '                    Vehiculo ON Referencia.VehiculoID = Vehiculo' +
              '.VehiculoID INNER JOIN'#10'                      Cliente ON Vehiculo' +
              '.ClienteID = Cliente.ClienteID'#10'WHERE     (Referencia.Referencia ' +
              '= :Tarjeta)'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'ClienteID'
                TableField = 'ClienteID'
              end
              item
                DatasetField = 'VehiculoID'
                TableField = 'VehiculoID'
              end
              item
                DatasetField = 'Nombre'
                TableField = 'Nombre'
              end
              item
                DatasetField = 'Identificacion'
                TableField = 'Identificacion'
              end>
          end>
        Name = 'spDatosClienteOtros'
        Fields = <
          item
            Name = 'ClienteID'
            DataType = datInteger
          end
          item
            Name = 'VehiculoID'
            DataType = datInteger
          end
          item
            Name = 'Nombre'
            DataType = datString
            Size = 70
          end
          item
            Name = 'Identificacion'
            DataType = datString
            Size = 30
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            Name = 'Flotillas'
            SQL = 
              'SELECT     ClienteID, VehiculoID, Identificacion, Clasificacion'#10 +
              'FROM         Vehiculo'#10'ORDER BY ClienteID, VehiculoID'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'ClienteID'
                TableField = 'ClienteID'
              end
              item
                DatasetField = 'VehiculoID'
                TableField = 'VehiculoID'
              end
              item
                DatasetField = 'Identificacion'
                TableField = 'Identificacion'
              end
              item
                DatasetField = 'Clasificacion'
                TableField = 'Clasificacion'
              end>
          end>
        Name = 'spAUDVehiculos'
        Fields = <
          item
            Name = 'ClienteID'
            DataType = datInteger
          end
          item
            Name = 'VehiculoID'
            DataType = datInteger
          end
          item
            Name = 'Identificacion'
            DataType = datString
            Size = 30
          end
          item
            Name = 'Clasificacion'
            DataType = datInteger
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            Name = 'Flotillas'
            SQL = 
              'declare @Clasificacion as Int'#10#10'select @clasificacion = ('#10'select ' +
              'top 1 clasificacion from ('#10'select clasificacion, count(*) as Tot' +
              'al from'#10'vehiculo'#10'group by clasificacion ) A order by total desc)' +
              #10#10'SELECT     Cliente.ClienteID, Cliente.Nombre, ISNULL(C.Total, ' +
              '0) AS Total, ISNULL(C.Inactivas, 0) AS Inactivas, @Clasificacion' +
              ' As Clasificacion'#10'FROM         (SELECT     A.ClienteID, A.Total,' +
              ' ISNULL(B.Diferentes, 0) AS Inactivas, A.Total - ISNULL(B.Difere' +
              'ntes, 0) AS Diferencial'#10'                       FROM          (SE' +
              'LECT     ClienteID, COUNT(*) AS Total'#10'                          ' +
              '                     FROM          Vehiculo AS Vehiculo_2'#10'      ' +
              '                                         GROUP BY ClienteID) AS ' +
              'A LEFT OUTER JOIN'#10'                                              ' +
              '    (SELECT     ClienteID, COUNT(*) AS Diferentes'#10'              ' +
              '                                      FROM          Vehiculo AS ' +
              'Vehiculo_1'#10'                                                    W' +
              'HERE      (Clasificacion <> @Clasificacion)'#10'                    ' +
              '                                GROUP BY ClienteID) AS B ON A.Cl' +
              'ienteID = B.ClienteID) AS C RIGHT OUTER JOIN'#10'                   ' +
              '   Cliente ON C.ClienteID = Cliente.ClienteID'#10'ORDER BY Cliente.C' +
              'lienteID'#10
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
                DatasetField = 'Total'
                TableField = 'Total'
              end
              item
                DatasetField = 'Inactivas'
                TableField = 'Inactivas'
              end
              item
                DatasetField = 'Clasificacion'
                TableField = 'Clasificacion'
              end>
          end>
        Name = 'spAUDClientes'
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
            Name = 'Total'
            DataType = datInteger
          end
          item
            Name = 'Inactivas'
            DataType = datInteger
          end
          item
            Name = 'Clasificacion'
            DataType = datInteger
          end>
      end
      item
        Params = <
          item
            Name = 'Externa'
            Value = ''
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            Name = 'Flotillas'
            SQL = 
              'declare @Externa bit'#10'select @Externa = (Select :Externa)'#10#10'select' +
              ' * from estacion where'#10'externa=1 or (@Externa = 1)'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'EstacionID'
                TableField = 'EstacionID'
              end
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
                DatasetField = 'ClavePemex'
                TableField = 'ClavePemex'
              end
              item
                DatasetField = 'Estatus'
                TableField = 'Estatus'
              end
              item
                DatasetField = 'CuentaContable'
                TableField = 'CuentaContable'
              end
              item
                DatasetField = 'CuentaIVANoCobrado'
                TableField = 'CuentaIVANoCobrado'
              end
              item
                DatasetField = 'CuentaIVACobrado'
                TableField = 'CuentaIVACobrado'
              end
              item
                DatasetField = 'CuentaVentas'
                TableField = 'CuentaVentas'
              end
              item
                DatasetField = 'CuentaAnticipos'
                TableField = 'CuentaAnticipos'
              end
              item
                DatasetField = 'IVA'
                TableField = 'IVA'
              end
              item
                DatasetField = 'GasolineroID'
                TableField = 'GasolineroID'
              end
              item
                DatasetField = 'Host'
                TableField = 'Host'
              end
              item
                DatasetField = 'Externa'
                TableField = 'Externa'
              end>
          end>
        Name = 'spEstacionesExternas'
        Fields = <
          item
            Name = 'EstacionID'
            DataType = datInteger
          end
          item
            Name = 'Nombre'
            DataType = datString
            Size = 30
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
            Name = 'ClavePemex'
            DataType = datString
            Size = 15
          end
          item
            Name = 'Estatus'
            DataType = datString
            Size = 1
          end
          item
            Name = 'CuentaContable'
            DataType = datString
            Size = 50
          end
          item
            Name = 'CuentaIVANoCobrado'
            DataType = datString
            Size = 50
          end
          item
            Name = 'CuentaIVACobrado'
            DataType = datString
            Size = 50
          end
          item
            Name = 'CuentaVentas'
            DataType = datString
            Size = 50
          end
          item
            Name = 'CuentaAnticipos'
            DataType = datString
            Size = 50
          end
          item
            Name = 'IVA'
            DataType = datFloat
          end
          item
            Name = 'GasolineroID'
            DataType = datInteger
          end
          item
            Name = 'Host'
            DataType = datString
            Size = 50
          end
          item
            Name = 'Externa'
            DataType = datBoolean
          end>
      end
      item
        Params = <
          item
            Name = 'VehiculoID'
            Value = '7'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            Name = 'Flotillas'
            SQL = 
              'declare @vehiculoid as int'#10'declare @AfectarHistorico bit'#10'declare' +
              ' @KMS integer'#10'select @vehiculoid = (select :VehiculoID)'#10#10'select ' +
              '@afectarhistorico = isnull((Select afectarhistorico from Cliente' +
              #10'inner join Vehiculo on Cliente.ClienteID = Vehiculo.ClienteID'#10'w' +
              'here VehiculoID = @VehiculoID), 0)'#10#10'select @kms = isnull((select' +
              ' top 1 Kilometraje from Consumo'#10'where vehiculoid = @vehiculoid a' +
              'nd productoid < 4'#10'order by FechaCarga desc), 0)'#10#10'select @afectar' +
              'historico as AfectarHistorico, @kms as KMS'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'AfectarHistorico'
                TableField = 'AfectarHistorico'
              end
              item
                DatasetField = 'KMS'
                TableField = 'KMS'
              end>
          end>
        Name = 'spDatosVerifica'
        Fields = <
          item
            Name = 'AfectarHistorico'
            DataType = datBoolean
          end
          item
            Name = 'KMS'
            DataType = datInteger
          end>
      end
      item
        Params = <
          item
            Name = 'EstacionID'
            Value = '1'
          end
          item
            Name = 'TicketID'
            Value = '1'
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            Name = 'Flotillas'
            SQL = 
              'Select Rendimiento from consumo'#10'where estacionid = :EstacionID a' +
              'nd SecuenciaVenta = :TicketID and serie = '#39'C'#39#10#10#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'Rendimiento'
                TableField = 'Rendimiento'
              end>
          end>
        Name = 'spRendimiento'
        Fields = <
          item
            Name = 'Rendimiento'
            DataType = datFloat
          end>
      end
      item
        Params = <
          item
            Name = 'VehiculoID'
            Value = '0'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            Name = 'Flotillas'
            SQL = 
              'declare @vehiculoid as int'#10'declare @AfectarHistorico bit'#10'declare' +
              ' @KMS integer'#10'declare @Referencia as varchar(50)'#10'select @vehicul' +
              'oid = (select :VehiculoID)'#10#10'select @kms = isnull((select top 1 K' +
              'ilometraje from Consumo'#10'where vehiculoid = @vehiculoid and produ' +
              'ctoid < 4'#10'order by FechaCarga desc), 0)'#10#10'select @Referencia = (s' +
              'elect top 1 referencia from referencia where vehiculoid = @vehic' +
              'uloid)'#10#10'SELECT     Cliente.GasolineroID, Cliente.ClienteID, Clie' +
              'nte.Nombre, Cliente.RazonSocial, Cliente.Domicilio, Cliente.Colo' +
              'nia, Cliente.Ciudad, Cliente.RFC, Vehiculo.VehiculoID, Vehiculo.' +
              'NIP, Vehiculo.Identificacion,'#10'                      Vehiculo.Act' +
              'ualMNMes, Vehiculo.Nombre As Usuario, @kms as KMS, @referencia a' +
              's Referencia'#10'FROM         Cliente INNER JOIN'#10'                   ' +
              '   Vehiculo ON Cliente.ClienteID = Vehiculo.ClienteID'#10'WHERE     ' +
              '(Vehiculo.VehiculoID = @VehiculoID)'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'GasolineroID'
                TableField = 'GasolineroID'
              end
              item
                DatasetField = 'ClienteID'
                TableField = 'ClienteID'
              end
              item
                DatasetField = 'Nombre'
                TableField = 'Nombre'
              end
              item
                DatasetField = 'Domicilio'
                TableField = 'Domicilio'
              end
              item
                DatasetField = 'Colonia'
                TableField = 'Colonia'
              end
              item
                DatasetField = 'Ciudad'
                TableField = 'Ciudad'
              end
              item
                DatasetField = 'RFC'
                TableField = 'RFC'
              end
              item
                DatasetField = 'VehiculoID'
                TableField = 'VehiculoID'
              end
              item
                DatasetField = 'NIP'
                TableField = 'NIP'
              end
              item
                DatasetField = 'Identificacion'
                TableField = 'Identificacion'
              end
              item
                DatasetField = 'ActualMNMes'
                TableField = 'ActualMNMes'
              end
              item
                DatasetField = 'KMS'
                TableField = 'KMS'
              end
              item
                DatasetField = 'Referencia'
                TableField = 'Referencia'
              end
              item
                DatasetField = 'RazonSocial'
                TableField = 'RazonSocial'
              end
              item
                DatasetField = 'Usuario'
                TableField = 'Usuario'
              end>
          end>
        Name = 'spDatosVerifone'
        Fields = <
          item
            Name = 'GasolineroID'
            DataType = datInteger
          end
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
            Name = 'RazonSocial'
            DataType = datString
            Size = 70
          end
          item
            Name = 'Domicilio'
            DataType = datString
            Size = 90
          end
          item
            Name = 'Colonia'
            DataType = datString
            Size = 40
          end
          item
            Name = 'Ciudad'
            DataType = datString
            Size = 30
          end
          item
            Name = 'RFC'
            DataType = datString
            Size = 20
          end
          item
            Name = 'VehiculoID'
            DataType = datInteger
          end
          item
            Name = 'NIP'
            DataType = datString
            Size = 8
          end
          item
            Name = 'Identificacion'
            DataType = datString
            Size = 30
          end
          item
            Name = 'ActualMNMes'
            DataType = datFloat
          end
          item
            Name = 'Usuario'
            DataType = datString
            Size = 30
          end
          item
            Name = 'KMS'
            DataType = datInteger
          end
          item
            Name = 'Referencia'
            DataType = datString
            Size = 50
          end>
      end
      item
        Params = <
          item
            Name = 'SinFacturar'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'EstacionID'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'FechaIni'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'FechaFin'
            Value = ''
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            Name = 'Flotillas'
            SQL = 
              'Declare @SinFacturar as Int'#10'select @SinFacturar = (Select :SinFa' +
              'cturar)'#10'DEClARE @EstacionID as Integer'#10'SELECT @EstacionID = (Sel' +
              'ect :EstacionID)'#10#10'SELECT     Consumo.ClienteID, Cliente.Nombre, ' +
              'FormaCompra.Nombre AS Tipo, CAST(SUM(Consumo.Cantidad) AS Decima' +
              'l(15, 2)) AS Cantidad,'#10'                      CAST(SUM(Consumo.Im' +
              'porte) AS Decimal(15, 2)) AS Importe, COUNT(*) AS Consumos'#10'FROM ' +
              '        Consumo INNER JOIN'#10'                      Cliente ON Clie' +
              'nte.ClienteID = Consumo.ClienteID INNER JOIN'#10'                   ' +
              '   FormaCompra ON Cliente.FormaCompraID = FormaCompra.FormaCompr' +
              'aID'#10'WHERE ((Consumo.EstacionID = @EstacionID) OR (@EstacionID = ' +
              '0)) AND Consumo.FechaCarga BETWEEN :FechaIni AND :FechaFin AND (' +
              '@SinFacturar = -1 or Facturado = @SinFacturar)'#10'GROUP BY Consumo.' +
              'ClienteID, Cliente.Nombre, FormaCompra.Nombre'#10'ORDER BY Cliente.N' +
              'ombre'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'ClienteID'
                TableField = 'ClienteID'
              end
              item
                DatasetField = 'Cantidad'
                TableField = 'Cantidad'
              end
              item
                DatasetField = 'Importe'
                TableField = 'Importe'
              end
              item
                DatasetField = 'Consumos'
                TableField = 'Consumos'
              end
              item
                DatasetField = 'Nombre'
                TableField = 'Nombre'
              end
              item
                DatasetField = 'Tipo'
                TableField = 'Tipo'
              end>
          end>
        Name = 'spAnaliticoConsumosC'
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
            Name = 'Tipo'
            DataType = datString
            Size = 50
          end
          item
            Name = 'Cantidad'
            DataType = datFloat
          end
          item
            Name = 'Importe'
            DataType = datFloat
          end
          item
            Name = 'Consumos'
            DataType = datInteger
          end>
      end
      item
        Params = <
          item
            Name = 'SinFacturar'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'EstacionID'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'FechaIni'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'FechaFin'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'ClienteID'
            Value = ''
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            Name = 'Flotillas'
            SQL = 
              'Declare @SinFacturar as Int'#10'select @SinFacturar = (Select :SinFa' +
              'cturar)'#10'DEClARE @EstacionID as Integer'#10'SELECT @EstacionID = (Sel' +
              'ect :EstacionID)'#10'SELECT     Estacion.Nombre AS Estacion, Consumo' +
              '.EstacionID, Consumo.SecuenciaVenta AS Ticket, Consumo.Serie, Co' +
              'nsumo.FechaCarga AS Fecha, Consumo.PosicionCarga AS Bomba, Produ' +
              'cto.Descripcion AS Producto,'#10'                      Consumo.Canti' +
              'dad, Consumo.Precio, Consumo.Importe, Consumo.ClienteID, Consumo' +
              '.VehiculoID, Vehiculo.Nombre, Vehiculo.Identificacion, Consumo.F' +
              'acturado'#10'FROM         Consumo INNER JOIN'#10'                      E' +
              'stacion ON Consumo.EstacionID = Estacion.EstacionID INNER JOIN'#10' ' +
              '                     Producto ON Consumo.ProductoID = Producto.P' +
              'roductoID LEFT JOIN'#10'                      Vehiculo ON Consumo.Ve' +
              'hiculoID = Vehiculo.VehiculoID'#10'WHERE FechaCarga BETWEEN :FechaIn' +
              'i AND :FechaFin AND ((Consumo.EstacionID = @EstacionID) OR (@Est' +
              'acionID = 0)) AND Consumo.ClienteID = :ClienteID and (@SinFactur' +
              'ar = -1 or Facturado = @SinFacturar)'#10'ORDER BY Fecha'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'Ticket'
                TableField = 'Ticket'
              end
              item
                DatasetField = 'Serie'
                TableField = 'Serie'
              end
              item
                DatasetField = 'Fecha'
                TableField = 'Fecha'
              end
              item
                DatasetField = 'Bomba'
                TableField = 'Bomba'
              end
              item
                DatasetField = 'Producto'
                TableField = 'Producto'
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
                DatasetField = 'ClienteID'
                TableField = 'ClienteID'
              end
              item
                DatasetField = 'VehiculoID'
                TableField = 'VehiculoID'
              end
              item
                DatasetField = 'Nombre'
                TableField = 'Nombre'
              end
              item
                DatasetField = 'Identificacion'
                TableField = 'Identificacion'
              end
              item
                DatasetField = 'EstacionID'
                TableField = 'EstacionID'
              end
              item
                DatasetField = 'Estacion'
                TableField = 'Estacion'
              end
              item
                DatasetField = 'Facturado'
                TableField = 'Facturado'
              end>
          end>
        Name = 'spAnaliticoConsumos'
        Fields = <
          item
            Name = 'Estacion'
            DataType = datString
            Size = 30
          end
          item
            Name = 'EstacionID'
            DataType = datInteger
          end
          item
            Name = 'Ticket'
            DataType = datInteger
          end
          item
            Name = 'Serie'
            DataType = datString
            Size = 5
          end
          item
            Name = 'Fecha'
            DataType = datDateTime
          end
          item
            Name = 'Bomba'
            DataType = datInteger
          end
          item
            Name = 'Producto'
            DataType = datString
            Size = 80
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
            Name = 'ClienteID'
            DataType = datInteger
          end
          item
            Name = 'VehiculoID'
            DataType = datInteger
          end
          item
            Name = 'Nombre'
            DataType = datString
            Size = 30
          end
          item
            Name = 'Identificacion'
            DataType = datString
            Size = 30
          end
          item
            Name = 'Facturado'
            DataType = datBoolean
          end>
      end
      item
        Params = <
          item
            Name = 'SinFacturar'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'FechaIni'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'FechaFin'
            Value = ''
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            Name = 'Flotillas'
            SQL = 
              'Declare @SinFacturar as Int'#10'select @SinFacturar = (Select :SinFa' +
              'cturar)'#10'SELECT     Consumo.EstacionID, Estacion.Nombre AS Estaci' +
              'on, CAST(SUM(Consumo.Cantidad) AS Decimal(15, 2)) AS Cantidad, C' +
              'AST(SUM(Consumo.Importe) AS Decimal(15, 2))'#10'                    ' +
              '  AS Importe, COUNT(*) AS Consumos'#10'FROM         Consumo INNER JO' +
              'IN'#10'                      Estacion ON Consumo.EstacionID = Estaci' +
              'on.EstacionID'#10'WHERE Consumo.FechaCarga BETWEEN :FechaIni AND :Fe' +
              'chaFin And (@SinFacturar = -1 or Facturado = @SinFacturar)'#10'GROUP' +
              ' BY Consumo.EstacionID, Estacion.Nombre'#10'ORDER BY Consumo.Estacio' +
              'nID'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'EstacionID'
                TableField = 'EstacionID'
              end
              item
                DatasetField = 'Estacion'
                TableField = 'Estacion'
              end
              item
                DatasetField = 'Cantidad'
                TableField = 'Cantidad'
              end
              item
                DatasetField = 'Importe'
                TableField = 'Importe'
              end
              item
                DatasetField = 'Consumos'
                TableField = 'Consumos'
              end>
          end>
        Name = 'spAnaliticoConsumosE'
        Fields = <
          item
            Name = 'EstacionID'
            DataType = datInteger
          end
          item
            Name = 'Estacion'
            DataType = datString
            Size = 30
          end
          item
            Name = 'Cantidad'
            DataType = datFloat
          end
          item
            Name = 'Importe'
            DataType = datFloat
          end
          item
            Name = 'Consumos'
            DataType = datInteger
          end>
      end
      item
        Params = <
          item
            Name = 'EstacionID'
            Value = ''
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            Name = 'Flotillas'
            SQL = 
              'declare @ClienteTAID int'#10'declare @EstacionID int'#10'declare @Tiempo' +
              'AireGrupoID int'#10'declare @Cargos float'#10'declare @Abonos float'#10#10'sel' +
              'ect @ClienteTAID = (Select 4)'#10'select @EstacionID = (select :Esta' +
              'cionID)'#10#10'select @TiempoAireGrupoID = (select TiempoAireGrupoID f' +
              'rom estacion where estacionid = @EstacionID)'#10#10'select @Cargos = (' +
              'select sum(importe) from consumo'#10'where clienteid = @ClienteTAID ' +
              'and estacionid in (select estacionID from estacion where TiempoA' +
              'ireGrupoID = @TiempoAireGrupoID))'#10'select @Cargos = isnull(@Cargo' +
              's, 0)'#10#10'select @Abonos = (select sum(Abono) from tiempoairesaldo ' +
              'where TiempoAireGrupoID = @TiempoAireGrupoID)'#10'select @Abonos = i' +
              'snull(@Abonos, 0)'#10#10'select cast(@Abonos - @Cargos as decimal(10,2' +
              ')) AS Saldo'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'Saldo'
                TableField = 'Saldo'
              end>
          end>
        Name = 'spSaldoTiempoAire'
        Fields = <
          item
            Name = 'Saldo'
            DataType = datFloat
          end>
      end
      item
        Params = <
          item
            Name = 'TiempoAireGrupoID'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'FechaINI'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'FechaFIN'
            Value = ''
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            SQL = 
              'Declare @TiempoAireGrupoID INT'#10'Declare @ID int'#10'Declare @Fecha da' +
              'tetime'#10'Declare @Nota varchar(150)'#10'Declare @Cargo float'#10'Declare @' +
              'Abono float'#10'Declare @Saldo float'#10'Declare @FechaINI datetime'#10'Decl' +
              'are @FechaFIN datetime'#10#10'select @TiempoAireGrupoID = (select :Tie' +
              'mpoAireGrupoID)'#10'select @FechaINI = (select :FechaINI)'#10'select @Fe' +
              'chaFIN = (select :FechaFIN)'#10#10'create table #SaldoTiempo'#10'('#10'ID int,' +
              #10'Fecha datetime,'#10'Nota varchar(150),'#10'Cargo float,'#10'Abono float,'#10'Sa' +
              'ldo float'#10')'#10#10#10'select @Cargo = isnull((select sum(Cargo) from Tie' +
              'mpoAireSaldo where fecha < @FechaINI and TiempoAireGrupoID = @Ti' +
              'empoAireGrupoID), 0)'#10'select @Abono = isnull((select sum(Abono) f' +
              'rom TiempoAireSaldo where fecha < @FechaINI and TiempoAireGrupoI' +
              'D = @TiempoAireGrupoID), 0)'#10'select @Saldo = @Abono - @Cargo'#10#10'ins' +
              'ert into #SaldoTiempo'#10'select 0, @FechaINI, '#39'-=SALDO INICIAL=-'#39', ' +
              '@Cargo, @Abono, @Saldo'#10#10#10'DECLARE cMiSaldo CURSOR FOR'#10'SELECT     ' +
              'TiempoAireSaldo.TiempoAireSaldoID AS ID, TiempoAireSaldo.Fecha, ' +
              'TiempoAireSaldo.Nota, TiempoAireSaldo.Cargo,'#10'                   ' +
              '   TiempoAireSaldo.Abono'#10'FROM         TiempoAireSaldo INNER JOIN' +
              #10'                      TiempoAireGrupo ON TiempoAireSaldo.Tiempo' +
              'AireGrupoID = TiempoAireGrupo.TiempoAireGrupoID'#10'where fecha betw' +
              'een @FechaINI and @FechaFIN AND TiempoAireGrupo.TiempoAireGrupoI' +
              'D = @TiempoAireGrupoID'#10'order by Fecha'#10#10'OPEN cMiSaldo'#10'FETCH NEXT ' +
              'FROM cMiSaldo INTO @ID, @Fecha, @Nota, @Cargo, @Abono'#10'WHILE (@@F' +
              'ETCH_STATUS = 0)'#10'BEGIN'#10#9'select @Saldo = (select @Saldo + @Abono ' +
              '- @Cargo)'#10#9'insert into #SaldoTiempo(ID, Fecha, Nota, Cargo, Abon' +
              'o, Saldo) values (@ID, @Fecha, @Nota, @Cargo, @Abono, @Saldo)'#10#9'F' +
              'ETCH NEXT FROM cMiSaldo INTO @ID, @Fecha, @Nota, @Cargo, @Abono'#10 +
              'END'#10'CLOSE cMiSaldo'#10'DEALLOCATE cMiSaldo'#10#10#10#10#10'select @Cargo = (sele' +
              'ct sum(importe) from consumo where clienteid = 4 and Estacionid ' +
              'in (select estacionid from estacion where TiempoAireGrupoID = @T' +
              'iempoAireGrupoID))'#10'select @Cargo = isnull(@Cargo, 0)'#10'select @Sal' +
              'do = (select @Saldo - @Cargo)'#10#10'insert into #SaldoTiempo'#10'select 0' +
              ' as ID, GetDate() as Fecha, '#39'-=PENDIENTE DE FACTURAR=-'#39' as Nota,' +
              ' @Cargo as Cargo, 0 as Abono, @Saldo as Saldo'#10#10'select * from #Sa' +
              'ldoTiempo'#10#10'drop table #SaldoTiempo'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'ID'
                TableField = 'ID'
              end
              item
                DatasetField = 'Fecha'
                TableField = 'Fecha'
              end
              item
                DatasetField = 'Nota'
                TableField = 'Nota'
              end
              item
                DatasetField = 'Cargo'
                TableField = 'Cargo'
              end
              item
                DatasetField = 'Abono'
                TableField = 'Abono'
              end
              item
                DatasetField = 'Saldo'
                TableField = 'Saldo'
              end>
          end
          item
            Connection = 'Flotillas'
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'spSaldoTA'
        Fields = <
          item
            Name = 'ID'
            DataType = datInteger
          end
          item
            Name = 'Fecha'
            DataType = datDateTime
          end
          item
            Name = 'Nota'
            DataType = datString
            Size = 150
          end
          item
            Name = 'Cargo'
            DataType = datFloat
          end
          item
            Name = 'Abono'
            DataType = datFloat
          end
          item
            Name = 'Saldo'
            DataType = datFloat
          end>
      end
      item
        Params = <
          item
            Name = 'FechaCorte'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'ClienteID'
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'CadTicket'
            Value = ''
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            Name = 'Flotillas'
            SQL = 
              'declare @FechaCorte as DateTime'#10'declare @ClienteID as int'#10'declar' +
              'e @CadTicket as Varchar(500)'#10#10'select @FechaCorte = (Select :Fech' +
              'aCorte)'#10'select @ClienteID = (Select :ClienteID)'#10'select @CadTicke' +
              't = (Select :CadTicket)'#10#10#10'SELECT Estacion.IVA, cns.ClienteID, cn' +
              's.Precio, SUM(cns.Cantidad) AS Cantidad, cns.ProductoID, cli.Pla' +
              'zoPago,'#10'       SUM(cns.Importe) AS Importe, SUM(cns.ImpuestoImpo' +
              'rte) AS ImpuestoImporte'#10'FROM dbo.Consumo cns'#10'INNER JOIN dbo.Clie' +
              'nte cli on (cns.ClienteID = cli.ClienteID)'#10'INNER JOIN Estacion o' +
              'n Estacion.EstacionID = cns.EstacionID'#10'WHERE (CLI.FACTURACONSUMO' +
              'CUPON = 1)AND((SUBSTRING(CNS.TARJETA,1,4)='#39'0005'#39')OR(LEN(CNS.TARJ' +
              'ETA)<10)OR'#10'(CNS.TARJETA = '#39'GRUPO CUPONES'#39'))AND(CNS.TARJETA <> '#39#39 +
              ')AND'#10'      @CadTicket Like '#39'%@'#39'+ Cast(cns.SecuenciaVenta as Varc' +
              'har(50)) + '#39'@%'#39#10'AND(cli.ClienteID = @ClienteID) AND (cns.Factura' +
              'do = 0) AND (cns.FechaMovimiento <= @FechaCorte)'#10'GROUP BY Estaci' +
              'on.IVA, cns.ClienteID, cns.Precio, cli.PlazoPago, cns.ProductoID' +
              #10'ORDER BY cns.ClienteID'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IVA'
                TableField = 'IVA'
              end
              item
                DatasetField = 'ClienteID'
                TableField = 'ClienteID'
              end
              item
                DatasetField = 'Precio'
                TableField = 'Precio'
              end
              item
                DatasetField = 'Cantidad'
                TableField = 'Cantidad'
              end
              item
                DatasetField = 'ProductoID'
                TableField = 'ProductoID'
              end
              item
                DatasetField = 'PlazoPago'
                TableField = 'PlazoPago'
              end
              item
                DatasetField = 'Importe'
                TableField = 'Importe'
              end
              item
                DatasetField = 'ImpuestoImporte'
                TableField = 'ImpuestoImporte'
              end>
          end>
        Name = 'spObtenConsumosXClienteCupones'
        Fields = <
          item
            Name = 'IVA'
            DataType = datFloat
          end
          item
            Name = 'ClienteID'
            DataType = datInteger
          end
          item
            Name = 'Precio'
            DataType = datFloat
          end
          item
            Name = 'Cantidad'
            DataType = datFloat
          end
          item
            Name = 'ProductoID'
            DataType = datInteger
          end
          item
            Name = 'PlazoPago'
            DataType = datInteger
          end
          item
            Name = 'Importe'
            DataType = datFloat
          end
          item
            Name = 'ImpuestoImporte'
            DataType = datFloat
          end>
      end
      item
        Params = <
          item
            Name = 'FechaCorte'
            Value = '10/10/01'
            ParamType = daptInput
          end
          item
            Name = 'ClienteID'
            Value = '1'
            ParamType = daptInput
          end
          item
            Name = 'Productos'
            Value = '1'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            Name = 'Flotillas'
            SQL = 
              'declare @FacturaConsumo as bit'#10'declare @FechaCorte as DateTime'#10'd' +
              'eclare @ClienteID as int'#10'declare @Productos as Varchar(100)'#10#10'sel' +
              'ect @FechaCorte = (Select :FechaCorte)'#10'select @ClienteID = (Sele' +
              'ct :ClienteID)'#10'select @Productos = (Select :Productos)'#10#10'Select @' +
              'FacturaConsumo = (SELECT FacturaConsumoCupon from'#10'              ' +
              '            dbo.Cliente  where (ClienteID = @ClienteID))'#10'       ' +
              '                   '#10'IF @FACTURACONSUMO = 1'#10'BEGIN'#10#10'SELECT Estacio' +
              'n.IVA, cns.ClienteID, cns.Precio, SUM(cns.Cantidad) AS Cantidad,' +
              ' cns.ProductoID, cli.PlazoPago,'#10'       SUM(cns.Importe) AS Impor' +
              'te, SUM(cns.ImpuestoImporte) AS ImpuestoImporte'#10'FROM dbo.Consumo' +
              ' cns'#10'INNER JOIN dbo.Cliente cli on (cns.ClienteID = cli.ClienteI' +
              'D)'#10'INNER JOIN Estacion on Estacion.EstacionID = cns.EstacionID'#10'W' +
              'HERE (ISNULL(CLI.FACTURACONSUMOCUPON,0) = 1)AND((SUBSTRING(CNS.T' +
              'ARJETA,1,4)<>'#39'0005'#39')AND(LEN(CNS.TARJETA)>=10)AND'#10'(CNS.TARJETA <>' +
              ' '#39'GRUPO CUPONES'#39'))'#10'AND (cns.Facturado = 0) AND (cns.FechaMovimie' +
              'nto <= @FechaCorte) AND'#10'      @Productos Like '#39'%'#39'+ Cast(cns.Prod' +
              'uctoID as Varchar(50)) + '#39'%'#39#10'GROUP BY Estacion.IVA, cns.ClienteI' +
              'D, cns.Precio, cli.PlazoPago, cns.ProductoID'#10'ORDER BY cns.Client' +
              'eID'#10#10'END'#10#10'ELSE'#10#10'BEGIN'#10#10'SELECT Estacion.IVA, cns.ClienteID, cns.P' +
              'recio, SUM(cns.Cantidad) AS Cantidad, cns.ProductoID, cli.PlazoP' +
              'ago,'#10'       SUM(cns.Importe) AS Importe, SUM(cns.ImpuestoImporte' +
              ') AS ImpuestoImporte'#10'FROM dbo.Consumo cns'#10'INNER JOIN dbo.Cliente' +
              ' cli on (cns.ClienteID = cli.ClienteID)'#10'INNER JOIN Estacion on E' +
              'stacion.EstacionID = cns.EstacionID'#10'WHERE (ISNULL(CLI.FACTURACON' +
              'SUMOCUPON,0) = 0)AND(cli.ClienteID = @ClienteID) AND (cns.Factur' +
              'ado = 0) AND (cns.FechaMovimiento <= @FechaCorte) AND'#10'      @Pro' +
              'ductos Like '#39'%'#39'+ Cast(cns.ProductoID as Varchar(50)) + '#39'%'#39#10'GROUP' +
              ' BY Estacion.IVA, cns.ClienteID, cns.Precio, cli.PlazoPago, cns.' +
              'ProductoID'#10'ORDER BY cns.ClienteID'#10#10'END'#10#10#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'IVA'
                TableField = 'IVA'
              end
              item
                DatasetField = 'ClienteID'
                TableField = 'ClienteID'
              end
              item
                DatasetField = 'Precio'
                TableField = 'Precio'
              end
              item
                DatasetField = 'Cantidad'
                TableField = 'Cantidad'
              end
              item
                DatasetField = 'ProductoID'
                TableField = 'ProductoID'
              end
              item
                DatasetField = 'PlazoPago'
                TableField = 'PlazoPago'
              end
              item
                DatasetField = 'Importe'
                TableField = 'Importe'
              end
              item
                DatasetField = 'ImpuestoImporte'
                TableField = 'ImpuestoImporte'
              end>
          end>
        Name = 'spObtenConsumosXCliente'
        Fields = <
          item
            Name = 'IVA'
            DataType = datFloat
          end
          item
            Name = 'ClienteID'
            DataType = datInteger
          end
          item
            Name = 'Precio'
            DataType = datFloat
          end
          item
            Name = 'Cantidad'
            DataType = datFloat
          end
          item
            Name = 'ProductoID'
            DataType = datInteger
          end
          item
            Name = 'PlazoPago'
            DataType = datInteger
          end
          item
            Name = 'Importe'
            DataType = datFloat
          end
          item
            Name = 'ImpuestoImporte'
            DataType = datFloat
          end>
      end
      item
        Params = <
          item
            Name = 'Folio'
            Value = '1110'
          end
          item
            Name = 'Serie'
            Value = 'GMM'
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            Name = 'Flotillas'
            SQL = 
              'SELECT FacturaID, MovimientoID'#10'FROM Factura'#10'WHERE (Folio = :Foli' +
              'o) AND (Serie = :Serie)'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'FacturaID'
                TableField = 'FacturaID'
              end
              item
                DatasetField = 'MovimientoID'
                TableField = 'MovimientoID'
              end>
          end>
        Name = 'spBuscaFolioCupon'
        Fields = <
          item
            Name = 'FacturaID'
            DataType = datInteger
          end
          item
            Name = 'MovimientoID'
            DataType = datInteger
          end>
      end
      item
        Params = <
          item
            Name = 'Folio'
            Value = '1'
          end
          item
            Name = 'Serie'
            Value = 'A'
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            Name = 'Flotillas'
            SQL = 
              'SELECT FacturaID'#10'FROM Factura'#10'WHERE (Folio = :Folio) AND (Serie ' +
              '= :Serie)'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'FacturaID'
                TableField = 'FacturaID'
              end>
          end>
        Name = 'spBuscaFolio'
        Fields = <
          item
            Name = 'FacturaID'
            DataType = datInteger
          end>
      end
      item
        Params = <
          item
            Name = 'ClienteID'
            Value = '9'
          end
          item
            Name = 'FechaCorte'
            Value = '09/01/2010'
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            Name = 'Flotillas'
            SQL = 
              'Select Consumo.SECUENCIAVENTA, Descripcion, Sum(Cantidad) as Can' +
              'tidad, Sum(Importe) as Importe,'#10'       CONSUMO.TARJETA'#10'from Cons' +
              'umo inner join'#10'       Producto on Producto.ProductoID = Consumo.' +
              'ProductoID'#10'Where Consumo.ClienteID = :ClienteID and Consumo.Fech' +
              'aCarga <= :FechaCorte and Consumo.Facturado = 0'#10'AND((SUBSTRING(C' +
              'ONSUMO.TARJETA,1,4)='#39'0005'#39')OR(LEN(CONSUMO.TARJETA)<10)OR'#10'(CONSUM' +
              'O.TARJETA = '#39'GRUPO CUPONES'#39'))AND(CONSUMO.TARJETA <> '#39#39')'#10'Group by' +
              ' Consumo.SECUENCIAVENTA, Producto.Descripcion, CONSUMO.TARJETA'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'SECUENCIAVENTA'
                TableField = 'SECUENCIAVENTA'
              end
              item
                DatasetField = 'Descripcion'
                TableField = 'Descripcion'
              end
              item
                DatasetField = 'Cantidad'
                TableField = 'Cantidad'
              end
              item
                DatasetField = 'Importe'
                TableField = 'Importe'
              end
              item
                DatasetField = 'TARJETA'
                TableField = 'TARJETA'
              end>
          end>
        Name = 'spPrevisualizacionCuponesClientes'
        Fields = <
          item
            Name = 'SECUENCIAVENTA'
            DataType = datInteger
          end
          item
            Name = 'Descripcion'
            DataType = datString
            Size = 80
          end
          item
            Name = 'Cantidad'
            DataType = datFloat
          end
          item
            Name = 'Importe'
            DataType = datFloat
          end
          item
            Name = 'TARJETA'
            DataType = datString
            Size = 50
          end>
      end
      item
        Params = <
          item
            Name = 'FechaCorte'
            Value = '01/01/2010'
            ParamType = daptInput
          end
          item
            Name = 'ClienteID'
            Value = '1'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            Name = 'Flotillas'
            SQL = 
              'declare @FacturaConsumo as bit'#10'declare @FechaCorte as DateTime'#10'd' +
              'eclare @ClienteID as int'#10#10'select @FechaCorte = (Select :FechaCor' +
              'te)'#10'select @ClienteID = (Select :ClienteID)'#10#10#10'Select @FacturaCon' +
              'sumo = (SELECT FacturaConsumoCupon from'#10'                        ' +
              '  dbo.Cliente  where (ClienteID = @ClienteID))'#10#10'IF @FACTURACONSU' +
              'MO = 1'#10'BEGIN'#10#10'Select Consumo.ProductoID, Descripcion, Sum(Cantid' +
              'ad) as Cantidad, Sum(Importe) as Importe'#10'from Consumo inner join' +
              #10'       Producto on Producto.ProductoID = Consumo.ProductoID'#10'Whe' +
              're Consumo.ClienteID = :ClienteID and Consumo.FechaCarga <= :Fec' +
              'haCorte and Consumo.Facturado = 0'#10'AND((SUBSTRING(Consumo.TARJETA' +
              ',1,4)<>'#39'0005'#39')AND(LEN(Consumo.TARJETA)>=10)AND'#10'(Consumo.TARJETA ' +
              '<> '#39'GRUPO CUPONES'#39'))'#10'Group by Consumo.ProductoID, Producto.Descr' +
              'ipcion'#10#10'END'#10'ELSE'#10'BEGIN'#10#10'Select Consumo.ProductoID, Descripcion, ' +
              'Sum(Cantidad) as Cantidad, Sum(Importe) as Importe'#10'from Consumo ' +
              'inner join'#10'       Producto on Producto.ProductoID = Consumo.Prod' +
              'uctoID'#10'Where Consumo.ClienteID = :ClienteID and Consumo.FechaCar' +
              'ga <= :FechaCorte and Consumo.Facturado = 0'#10'Group by Consumo.Pro' +
              'ductoID, Producto.Descripcion'#10#10'END'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'ProductoID'
                TableField = 'ProductoID'
              end
              item
                DatasetField = 'Descripcion'
                TableField = 'Descripcion'
              end
              item
                DatasetField = 'Cantidad'
                TableField = 'Cantidad'
              end
              item
                DatasetField = 'Importe'
                TableField = 'Importe'
              end>
          end>
        Name = 'spPrevisualizaFacturaCliente'
        Fields = <
          item
            Name = 'ProductoID'
            DataType = datInteger
          end
          item
            Name = 'Descripcion'
            DataType = datString
            Size = 80
          end
          item
            Name = 'Cantidad'
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
            Name = 'SecuenciaVenta'
            Value = '1'
          end
          item
            Name = 'Serie'
            Value = '1'
          end
          item
            Name = 'EstacionID'
            Value = '1'
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            Name = 'Flotillas'
            SQL = 
              'select SecuenciaVenta'#10'from consumo'#10'where secuenciaventa = :Secue' +
              'nciaVenta and serie = :Serie and estacionid = :EstacionID'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'SecuenciaVenta'
                TableField = 'SecuenciaVenta'
              end>
          end>
        Name = 'spValidaConsumo'
        Fields = <
          item
            Name = 'SecuenciaVenta'
            DataType = datInteger
          end>
      end
      item
        Params = <
          item
            Name = 'CUPONID'
            Value = '2'
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            Name = 'Flotillas'
            SQL = 
              'if (Len(:CUPONID) <= 10)'#10'begin'#10'        SELECT ISNULL(TIPOCUPON, ' +
              '0) AS TIPOCUPON FROM CUPON WHERE CUPONID =  :CUPONID'#10'end'#10'else'#10'be' +
              'gin'#10#10'        SELECT ISNULL(TIPOCUPON, 0) AS TIPOCUPON FROM CUPON' +
              ' WHERE BARRAS =  :CUPONID'#10'end'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'TIPOCUPON'
                TableField = 'TIPOCUPON'
              end>
          end>
        Name = 'spTipoCupon'
        Fields = <
          item
            Name = 'TIPOCUPON'
            DataType = datBoolean
          end>
      end
      item
        Params = <
          item
            Name = 'PRODUCTOID'
            Value = '1'
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            Name = 'Flotillas'
            SQL = 'SELECT * FROM PRODUCTO WHERE PRODUCTOID = :PRODUCTOID'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'ProductoID'
                TableField = 'ProductoID'
              end
              item
                DatasetField = 'Descripcion'
                TableField = 'Descripcion'
              end
              item
                DatasetField = 'Precio'
                TableField = 'Precio'
              end
              item
                DatasetField = 'PorcentajeImpuesto'
                TableField = 'PorcentajeImpuesto'
              end
              item
                DatasetField = 'IEPS'
                TableField = 'IEPS'
              end>
          end>
        Name = 'obtenProducto'
        Fields = <
          item
            Name = 'ProductoID'
            DataType = datInteger
          end
          item
            Name = 'Descripcion'
            DataType = datString
            Size = 80
          end
          item
            Name = 'Precio'
            DataType = datFloat
          end
          item
            Name = 'PorcentajeImpuesto'
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
            Name = 'FacturaID'
            Value = '25'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            Name = 'Flotillas'
            SQL = 
              'DECLARE @CAD AS VARCHAR(4000)'#10'DECLARE @SUCURSAL AS INT'#10'DECLARE @' +
              'NOAPROBFCTELECT AS INT'#10'DECLARE @NOAPROBACION AS INT'#10#10'SELECT @CAD' +
              ' = (SELECT '#39#39')'#10#10'SELECT @NOAPROBACION = (SELECT GASOLINERO.NOAPRO' +
              'BACION FROM GASOLINERO)'#10'SELECT @NOAPROBFCTELECT = ISNULL((SELECT' +
              ' NOAPROBACION FROM FACTURAELECTRONICA WHERE FACTURAELECTRONICA.F' +
              'ACTURAID = :FacturaID),0)'#10#10'IF @NOAPROBFCTELECT > 0'#10'   SELECT @NO' +
              'APROBACION = (SELECT @NOAPROBFCTELECT)'#10#10'SELECT FACTURA.SERIE,RTR' +
              'IM(CAST(FACTURA.FOLIO AS VARCHAR(50))) AS FOLIO,'#10'       LEFT(CON' +
              'VERT(VARCHAR, FACTURA.FECHA, 120), 10)+'#10'       '#39'T'#39'+'#10#10'       Subs' +
              'tring(convert(varchar, FACTURA.FECHA, 14),1,8) AS FECHA,LTRIM(CA' +
              'ST(@NOAPROBFCTELECT AS VARCHAR (10))) AS NOAPROBACION,'#10'       CA' +
              'ST(YEAR(GASOLINERO.ANOAPROBACION) AS VARCHAR(4)) AS ANOAPROBACIO' +
              'N, FORMAPAGO.NOMBRE AS FORMAPAGO,'#10'       CONVERT(VARCHAR,CONVERT' +
              '(MONEY,FACTURA.SUBTOTAL),0) AS SUBTOTAL,CONVERT(VARCHAR,CONVERT(' +
              'MONEY,FACTURA.TOTAL),0) AS TOTAL,'#10'       GASOLINERO.RFC AS RFCEM' +
              'ISOR, GASOLINERO.NOMBRE AS NOMEMPRESAEMISOR, GASOLINERO.DOMICILI' +
              'O AS DOMEMISOR, ISNULL(GASOLINERO.NOEXTERIOR,'#39#39') NOEXTERIOREMISO' +
              'R,'#10'       ISNULL(GASOLINERO.COLONIA,'#39#39') AS COLONIAEMISOR,ISNULL(' +
              'GASOLINERO.MUNICIPIO,'#39#39') AS MUNICIPIOEMISOR,ISNULL(GASOLINERO.ES' +
              'TADO,'#39#39') AS ESTADOEMISOR,'#10'       ISNULL(GASOLINERO.PAIS,'#39#39') AS P' +
              'AISEMISOR,ISNULL(GASOLINERO.CODIGOPOSTAL,'#39#39') AS CODIGOPOSTALEMIS' +
              'OR,'#10'       ISNULL(CLIENTE.RFC,'#39#39') AS RFCRECEPTOR, ISNULL(CLIENTE' +
              '.RAZONSOCIAL,'#39#39') AS NOMBREEMPRECEPTOR, ISNULL(CLIENTE.DOMICILIO,' +
              #39#39') AS DOMICILIORECEPTOR, ISNULL(CLIENTE.NOEXTERIOR,'#39#39') AS NOEXT' +
              'ERIORRECEPTOR,'#10'       ISNULL(CLIENTE.COLONIA,'#39#39') AS COLONIARECEP' +
              'TOR,ISNULL(CLIENTE.LOCALIDAD,'#39#39') AS LOCALIDADRECEPTOR,ISNULL(CLI' +
              'ENTE.MUNICIPIO,'#39#39') AS MUNICIPIORECEPTOR,'#10'       ISNULL(CLIENTE.E' +
              'STADO,'#39#39') AS ESTADORECEPTOR,ISNULL(CLIENTE.PAIS,'#39#39') AS PAISRECEP' +
              'TOR,ISNULL(CAST(CLIENTE.CODIGOPOSTAL AS VARCHAR(20)),'#39#39') AS CODI' +
              'GOPOSTALRECEPTOR,'#10'       ISNULL(CLIENTE.EMAIL,'#39#39') AS EMAIL'#10'FROM ' +
              'FACTURA INNER JOIN CLIENTE ON CLIENTE.CLIENTEID = FACTURA.CLIENT' +
              'EID'#10'INNER JOIN GASOLINERO ON GASOLINERO.GASOLINEROID = GASOLINER' +
              'O.GASOLINEROID'#10'INNER JOIN FORMAPAGO ON CLIENTE.FORMAPAGOID = FOR' +
              'MAPAGO.FORMAPAGOID'#10'WHERE FACTURAID = :FacturaID'#10
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
            Size = 70
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
            Size = 20
          end
          item
            Name = 'NOMEMPRESAEMISOR'
            DataType = datString
            Size = 70
          end
          item
            Name = 'DOMEMISOR'
            DataType = datString
            Size = 100
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
            Size = 90
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
            Size = 100
          end>
      end
      item
        Params = <
          item
            Name = 'GASOLINEROID'
            Value = '10'
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            Name = 'Flotillas'
            SQL = 
              'SELECT DOMICILIO=ISNULL(DOMICILIO,'#39#39'),NOEXTERIOR=ISNULL(NOEXTERI' +
              'OR,'#39#39'),COLONIA=ISNULL(COLONIA,'#39#39'),LOCALIDAD=ISNULL(LOCALIDAD,'#39#39')' +
              ','#10'             MUNICIPIO=ISNULL(MUNICIPIO,'#39#39'),ESTADO=ISNULL(ESTA' +
              'DO,'#39#39'),PAIS=ISNULL(PAIS,'#39#39'),CODIGOPOSTAL=ISNULL(CODIGOPOSTAL,'#39#39')' +
              #10'FROM GASOLINERO WHERE GASOLINEROID=:GASOLINEROID'#10
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
              end>
          end>
        Name = 'spDatosCadenaExpedidoEn'
        Fields = <
          item
            Name = 'DOMICILIO'
            DataType = datString
            Size = 100
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
            Connection = 'Flotillas'
            Default = True
            Name = 'Flotillas'
            SQL = 
              'SELECT DETALLEFACTURA.PRODUCTOID, DETALLEFACTURA.IMPORTE, DETALL' +
              'EFACTURA.CANTIDAD,'#10'       DETALLEFACTURA.PRECIO, PRODUCTO.DESCRI' +
              'PCION FROM DETALLEFACTURA INNER JOIN'#10'       PRODUCTO ON PRODUCTO' +
              '.PRODUCTOID = DETALLEFACTURA.PRODUCTOID'#10'WHERE DETALLEFACTURA.FAC' +
              'TURAID = :FacturaID'#10'ORDER BY DETALLEFACTURA.PRODUCTOID ASC'#10
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
            Size = 800
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
            Connection = 'Flotillas'
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
            Connection = 'Flotillas'
            Default = True
            Name = 'Flotillas'
            SQL = 
              'SELECT SUM(IMPUESTO) AS IVA, IVA AS TASAIVA'#10'FROM FACTURA'#10'WHERE (' +
              'FACTURA.FACTURAID = :FACTURAID)'#10'GROUP BY IVA'#10
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
            Connection = 'Flotillas'
            Default = True
            Name = 'Flotillas'
            SQL = 
              'SELECT TOP 1 NOCERTIFICADO, Certificado, ArchivoCertificado, Pas' +
              'swordFCTELECT,'#10'ArchivoClavePrivada, ClavePriv FROM GASOLINERO'#10
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
            Name = 'FECHAINI'
            Value = ''
          end
          item
            Name = 'FECHAFIN'
            Value = ''
          end
          item
            Name = 'SERIE'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            Name = 'Flotillas'
            SQL = 
              'SELECT CLIENTE.RFC, FACTURA.SERIE, FACTURA.FOLIO, CONVERT(VARCHA' +
              'R(4), FACTURA.FECHA, 20) + CAST(GASOLINERO.NOAPROBACION AS VARCH' +
              'AR(100)) AS FECHANOAPROBACION, CONVERT(VARCHAR(2), FACTURA.FECHA' +
              ', 5)+ '#39'/'#39' + CONVERT(VARCHAR(2), FACTURA.FECHA, 10) + '#39'/'#39' + CONVE' +
              'RT(VARCHAR(4), FACTURA.FECHA, 20) + '#39' '#39' + CONVERT(Char(8), FACTU' +
              'RA.FECHA, 108) AS FECHAHORA, Factura.Total,'#10'Factura.Impuesto, Fa' +
              'cturaElectronica.Vigencia, FacturaElectronica.FacturaID From Fac' +
              'tura'#10'INNER JOIN FacturaElectronica on FacturaElectronica.Factura' +
              'ID = Factura.FacturaID'#10'INNER JOIN GASOLINERO ON GASOLINERO.GASOL' +
              'INEROID = GASOLINERO.GASOLINEROID'#10'INNER JOIN CLIENTE ON CLIENTE.' +
              'CLIENTEID = FACTURA.CLIENTEID'#10'WHERE FACTURA.FECHA BETWEEN :FECHA' +
              'INI AND :FECHAFIN AND SERIE = :SERIE'#10'ORDER BY FOLIO'#10
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
            Size = 20
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
            Name = 'VIGENCIA'
            Value = '1'
          end
          item
            Name = 'FACTURAID'
            Value = '1'
          end>
        Statements = <
          item
            Connection = 'Flotillas'
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
            Name = 'GASOLINERO'
            Value = '18'
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            Name = 'Flotillas'
            SQL = 
              'SELECT NOCERTIFICADO, NOAPROBACION, ANOAPROBACION, FOLIOINICIAL,' +
              ' FOLIOFINAL,'#10'CODIGOPOSTAL, RFC, DOMICILIO, NOMBRE, SUCURSAL, SUC' +
              'URSALDE, TELEFONO1, TELEFONO2'#10'FROM GASOLINERO WHERE GASOLINEROID' +
              ' = :GASOLINERO'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'NOCERTIFICADO'
                TableField = 'NOCERTIFICADO'
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
                DatasetField = 'FOLIOINICIAL'
                TableField = 'FOLIOINICIAL'
              end
              item
                DatasetField = 'FOLIOFINAL'
                TableField = 'FOLIOFINAL'
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
                DatasetField = 'DOMICILIO'
                TableField = 'DOMICILIO'
              end
              item
                DatasetField = 'NOMBRE'
                TableField = 'NOMBRE'
              end
              item
                DatasetField = 'SUCURSAL'
                TableField = 'SUCURSAL'
              end
              item
                DatasetField = 'SUCURSALDE'
                TableField = 'SUCURSALDE'
              end
              item
                DatasetField = 'TELEFONO1'
                TableField = 'TELEFONO1'
              end
              item
                DatasetField = 'TELEFONO2'
                TableField = 'TELEFONO2'
              end>
          end>
        Name = 'spObtenDatosGasolinero'
        Fields = <
          item
            Name = 'NOCERTIFICADO'
            DataType = datString
            Size = 50
          end
          item
            Name = 'NOAPROBACION'
            DataType = datInteger
          end
          item
            Name = 'ANOAPROBACION'
            DataType = datDateTime
          end
          item
            Name = 'FOLIOINICIAL'
            DataType = datInteger
          end
          item
            Name = 'FOLIOFINAL'
            DataType = datInteger
          end
          item
            Name = 'CODIGOPOSTAL'
            DataType = datString
            Size = 50
          end
          item
            Name = 'RFC'
            DataType = datString
            Size = 20
          end
          item
            Name = 'DOMICILIO'
            DataType = datString
            Size = 100
          end
          item
            Name = 'NOMBRE'
            DataType = datString
            Size = 70
          end
          item
            Name = 'SUCURSAL'
            DataType = datBoolean
          end
          item
            Name = 'SUCURSALDE'
            DataType = datInteger
          end
          item
            Name = 'TELEFONO1'
            DataType = datString
            Size = 50
          end
          item
            Name = 'TELEFONO2'
            DataType = datString
            Size = 50
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
            Connection = 'Flotillas'
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
            Name = 'ESTACIONID'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            Name = 'Flotillas'
            SQL = 
              'SELECT TOP 1 VEHICULO.VEHICULOID, ESTACION.CLIENTEID from ESTACI' +
              'ON INNER JOIN CLIENTE ON CLIENTE.CLIENTEID = ESTACION.CLIENTEID'#10 +
              'INNER JOIN VEHICULO ON VEHICULO.CLIENTEID = CLIENTE.CLIENTEID'#10'WH' +
              'ERE ESTACION.ESTACIONID = :ESTACIONID'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'VEHICULOID'
                TableField = 'VEHICULOID'
              end
              item
                DatasetField = 'CLIENTEID'
                TableField = 'CLIENTEID'
              end>
          end>
        Name = 'BuscaClienteEmpresaDebito'
        Fields = <
          item
            Name = 'VEHICULOID'
            DataType = datInteger
          end
          item
            Name = 'CLIENTEID'
            DataType = datInteger
          end>
      end
      item
        Params = <
          item
            Name = 'FacturaID'
            Value = '48343'
            ParamType = daptInput
          end
          item
            Name = 'GasolineroID'
            Value = '1000'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            Name = 'Flotillas'
            SQL = 
              'DECLARE @Identificador AS INT'#10'DECLARE @SELECCION AS INT'#10'DECLARE ' +
              '@CLI AS INT'#10#10'SELECT @SELECCION = :FACTURAID'#10'SELECT @Identificado' +
              'r = :GASOLINEROID'#10'SELECT @CLI = (SELECT CLIENTEID FROM FACTURA W' +
              'HERE FACTURAID = @SELECCION)'#10#10'SELECT  A.* ,FECINI = (Select Top ' +
              '1 Consumo.FechaCarga from Consumo INNER JOIN  Factura FCT  on Co' +
              'nsumo.FacturaID = FCT.FACTURAID'#10'                    WHERE (Consu' +
              'mo.GasolineroID = @Identificador) AND (Consumo.ClienteID = @CLI)' +
              #10'                    AND (Consumo.Facturado = 1) AND (FCT.FACTUR' +
              'AID=@SELECCION) ORDER BY Consumo.FechaCarga ASC),'#10'          FECF' +
              'IN = (Select Max(Consumo.FechaCarga) from Consumo INNER JOIN  Fa' +
              'ctura FCT on Consumo.FacturaID = FCT.FACTURAID'#10'                 ' +
              '   WHERE (Consumo.GasolineroID = @Identificador) AND (Consumo.Cl' +
              'ienteID = @CLI)'#10'                    AND (Consumo.Facturado = 1) ' +
              'AND (FCT.FACTURAID=@SELECCION))'#10'FROM (SELECT distinct Consumo.Cl' +
              'ienteID, Consumo.FechaCarga, Consumo.FechaMovimiento, Consumo.Es' +
              'tacionID, Cliente.Nombre,'#10'          Consumo.Precio, Sum(Consumo.' +
              'Importe) as Importe, Sum(Consumo.Cantidad) as Cantidad,'#10'        ' +
              '  Consumo.VehiculoID Tarjeta, Consumo.Turno as Liquidacion, Gaso' +
              'linero.Nombre AS Gasolinero,'#10'          Gasolinero.GasolineroID a' +
              's Grupo, Producto.ProductoID, Producto.Descripcion, Consumo.Vehi' +
              'culoID as FlotillaID, Gasolinero.IVA AS IVA, Producto.IEPS,'#10'    ' +
              '      (SUM(Consumo.Cantidad) * (Producto.IEPS)) as ImporteIEPS, ' +
              'CAST(Sum(Consumo.Importe) - CAST(Sum(Consumo.Importe) - Sum(Cons' +
              'umo.Importe) / (1 + Gasolinero.IVA / 100) AS money) AS money) AS' +
              ' Subtotal,'#10'          (SUM(Consumo.Importe) - CAST(Sum(Consumo.Im' +
              'porte) - CAST(Sum(Consumo.Importe) - Sum(Consumo.Importe) / (1 +' +
              ' Gasolinero.IVA / 100) AS money) AS money)) as ImpuestoImporte,'#10 +
              '          Cliente.Grupo Grupo2, Cliente.RFC,'#10'          Consumo.S' +
              'ecuenciaVenta TramaID, Consumo.FacturaID, Producto.Descripcion a' +
              's NomProducto,'#10'          Consumo.Facturado, Estacion.Nombre as N' +
              'ombreEstacion, Estacion.RFC as RFCEstacion, Estacion.ClavePemex,' +
              ' Estacion.RazonSocial,'#10'          Factura.Folio,'#10'          ISNULL' +
              '(LEFT(CONVERT(VARCHAR, FACTURA.FECHA, 120), 10),'#39#39')+'#39'T'#39'+ISNULL(S' +
              'ubstring(convert(varchar, FACTURA.FECHA, 14),1,8),'#39#39') AS FECHAHO' +
              'RAFACTURA'#10'FROM      Consumo INNER JOIN'#10'           Cliente ON Con' +
              'sumo.ClienteID = Cliente.ClienteID AND Consumo.GasolineroID = Cl' +
              'iente.GasolineroID INNER JOIN'#10'           Gasolinero ON Consumo.G' +
              'asolineroID = Gasolinero.GasolineroID INNER JOIN'#10'           Prod' +
              'ucto ON Consumo.ProductoID = Producto.ProductoID INNER JOIN'#10'    ' +
              '       Estacion ON Consumo.EstacionID = Estacion.EstacionID INNE' +
              'R JOIN'#10'           Factura  on Consumo.FacturaID = Factura.Factur' +
              'aID'#10'           GROUP BY Consumo.ClienteID, Consumo.FechaCarga, C' +
              'onsumo.FechaMovimiento, Consumo.EstacionID, Cliente.Nombre,'#10'Cons' +
              'umo.Precio, Consumo.VehiculoID, Consumo.Turno, Gasolinero.Nombre' +
              ', Gasolinero.GasolineroID,'#10'Producto.ProductoID, Producto.Descrip' +
              'cion, Consumo.VehiculoID, Gasolinero.IVA, Cliente.Grupo,'#10'Cliente' +
              '.RFC, Consumo.SecuenciaVenta, Consumo.IEPS,'#10'Consumo.FacturaID, P' +
              'roducto.Descripcion, Consumo.Facturado, Factura.Fecha, Producto.' +
              'IEPS,'#10'Estacion.Nombre, Estacion.RFC, Estacion.ClavePemex, Estaci' +
              'on.RazonSocial,Factura.Folio'#10') AS A LEFT OUTER JOIN'#10'           V' +
              'ehiculo ON A.FlotillaID = Vehiculo.VehiculoID AND A.Grupo = Vehi' +
              'culo.GasolineroID AND A.ClienteID = Vehiculo.ClienteID'#10'WHERE    ' +
              ' (A.Grupo = @Identificador) AND (A.Facturado = 1) AND (A.FACTURA' +
              'ID = @SELECCION) AND (A.ClienteID = @CLI)'#10'ORDER BY   A.FOLIO, A.' +
              'ESTACIONID, A.Tarjeta'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'ClienteID'
                TableField = 'ClienteID'
              end
              item
                DatasetField = 'FechaCarga'
                TableField = 'FechaCarga'
              end
              item
                DatasetField = 'FechaMovimiento'
                TableField = 'FechaMovimiento'
              end
              item
                DatasetField = 'EstacionID'
                TableField = 'EstacionID'
              end
              item
                DatasetField = 'Nombre'
                TableField = 'Nombre'
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
                DatasetField = 'Cantidad'
                TableField = 'Cantidad'
              end
              item
                DatasetField = 'Tarjeta'
                TableField = 'Tarjeta'
              end
              item
                DatasetField = 'Liquidacion'
                TableField = 'Liquidacion'
              end
              item
                DatasetField = 'Gasolinero'
                TableField = 'Gasolinero'
              end
              item
                DatasetField = 'Grupo'
                TableField = 'Grupo'
              end
              item
                DatasetField = 'ProductoID'
                TableField = 'ProductoID'
              end
              item
                DatasetField = 'Descripcion'
                TableField = 'Descripcion'
              end
              item
                DatasetField = 'FlotillaID'
                TableField = 'FlotillaID'
              end
              item
                DatasetField = 'IVA'
                TableField = 'IVA'
              end
              item
                DatasetField = 'Subtotal'
                TableField = 'Subtotal'
              end
              item
                DatasetField = 'ImpuestoImporte'
                TableField = 'ImpuestoImporte'
              end
              item
                DatasetField = 'Grupo2'
                TableField = 'Grupo2'
              end
              item
                DatasetField = 'RFC'
                TableField = 'RFC'
              end
              item
                DatasetField = 'TramaID'
                TableField = 'TramaID'
              end
              item
                DatasetField = 'FacturaID'
                TableField = 'FacturaID'
              end
              item
                DatasetField = 'NomProducto'
                TableField = 'NomProducto'
              end
              item
                DatasetField = 'Facturado'
                TableField = 'Facturado'
              end
              item
                DatasetField = 'NombreEstacion'
                TableField = 'NombreEstacion'
              end
              item
                DatasetField = 'RFCEstacion'
                TableField = 'RFCEstacion'
              end
              item
                DatasetField = 'ClavePemex'
                TableField = 'ClavePemex'
              end
              item
                DatasetField = 'RazonSocial'
                TableField = 'RazonSocial'
              end
              item
                DatasetField = 'Folio'
                TableField = 'Folio'
              end
              item
                DatasetField = 'FECINI'
                TableField = 'FECINI'
              end
              item
                DatasetField = 'FECFIN'
                TableField = 'FECFIN'
              end
              item
                DatasetField = 'IEPS'
                TableField = 'IEPS'
              end
              item
                DatasetField = 'ImporteIEPS'
                TableField = 'ImporteIEPS'
              end
              item
                DatasetField = 'FECHAHORAFACTURA'
                TableField = 'FECHAHORAFACTURA'
              end>
          end>
        Name = 'spDatosMonedero'
        Fields = <
          item
            Name = 'ClienteID'
            DataType = datInteger
          end
          item
            Name = 'FechaCarga'
            DataType = datDateTime
          end
          item
            Name = 'FechaMovimiento'
            DataType = datDateTime
          end
          item
            Name = 'EstacionID'
            DataType = datInteger
          end
          item
            Name = 'Nombre'
            DataType = datString
            Size = 70
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
            Name = 'Cantidad'
            DataType = datFloat
          end
          item
            Name = 'Tarjeta'
            DataType = datInteger
          end
          item
            Name = 'Liquidacion'
            DataType = datInteger
          end
          item
            Name = 'Gasolinero'
            DataType = datString
            Size = 70
          end
          item
            Name = 'Grupo'
            DataType = datInteger
          end
          item
            Name = 'ProductoID'
            DataType = datInteger
          end
          item
            Name = 'Descripcion'
            DataType = datString
            Size = 80
          end
          item
            Name = 'FlotillaID'
            DataType = datInteger
          end
          item
            Name = 'IVA'
            DataType = datFloat
          end
          item
            Name = 'IEPS'
            DataType = datFloat
          end
          item
            Name = 'ImporteIEPS'
            DataType = datFloat
          end
          item
            Name = 'Subtotal'
            DataType = datFloat
          end
          item
            Name = 'ImpuestoImporte'
            DataType = datFloat
          end
          item
            Name = 'Grupo2'
            DataType = datString
            Size = 50
          end
          item
            Name = 'RFC'
            DataType = datString
            Size = 20
          end
          item
            Name = 'TramaID'
            DataType = datInteger
          end
          item
            Name = 'FacturaID'
            DataType = datInteger
          end
          item
            Name = 'NomProducto'
            DataType = datString
            Size = 80
          end
          item
            Name = 'Facturado'
            DataType = datBoolean
          end
          item
            Name = 'NombreEstacion'
            DataType = datString
            Size = 30
          end
          item
            Name = 'RFCEstacion'
            DataType = datString
            Size = 20
          end
          item
            Name = 'ClavePemex'
            DataType = datString
            Size = 15
          end
          item
            Name = 'RazonSocial'
            DataType = datString
            Size = 70
          end
          item
            Name = 'Folio'
            DataType = datInteger
          end
          item
            Name = 'FECHAHORAFACTURA'
            DataType = datString
            Size = 19
          end
          item
            Name = 'FECINI'
            DataType = datDateTime
          end
          item
            Name = 'FECFIN'
            DataType = datDateTime
          end>
      end
      item
        Params = <
          item
            Name = 'NUMEROECONOMICO'
            Value = ''
          end
          item
            Name = 'IDRFID'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            Name = 'Flotillas'
            SQL = 
              'UPDATE VEHICULO'#10'SET    ESTATUS = '#39'A'#39#10'WHERE'#10'(ISNULL(NUMEROECONOMI' +
              'CO,'#39'-1'#39') = :NUMEROECONOMICO AND (RTRIM(NUMEROECONOMICO) <> '#39#39'))'#10 +
              #10'SELECT TOP 1 VEHICULO.CLIENTEID, VEHICULO.VEHICULOID, VEHICULO.' +
              'GASOLINEROID, REFERENCIA.REFERENCIA,'#10'VEHICULO.IDRFID, VEHICULO.C' +
              'LASIFICACION FROM VEHICULO'#10'INNER JOIN REFERENCIA ON REFERENCIA.V' +
              'EHICULOID = VEHICULO.VEHICULOID WHERE'#10'(ISNULL(NUMEROECONOMICO,'#39'-' +
              '1'#39') = :NUMEROECONOMICO AND (RTRIM(NUMEROECONOMICO) <> '#39#39')) OR (I' +
              'SNULL(IDRFID,'#39'-1'#39') = :IDRFID)'#10'AND (VEHICULO.ESTATUS = '#39'A'#39')'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'CLIENTEID'
                TableField = 'CLIENTEID'
              end
              item
                DatasetField = 'VEHICULOID'
                TableField = 'VEHICULOID'
              end
              item
                DatasetField = 'GASOLINEROID'
                TableField = 'GASOLINEROID'
              end
              item
                DatasetField = 'REFERENCIA'
                TableField = 'REFERENCIA'
              end
              item
                DatasetField = 'IDRFID'
                TableField = 'IDRFID'
              end
              item
                DatasetField = 'CLASIFICACION'
                TableField = 'CLASIFICACION'
              end>
          end>
        Name = 'spDatosVehiculoGOB'
        Fields = <
          item
            Name = 'CLIENTEID'
            DataType = datInteger
          end
          item
            Name = 'VEHICULOID'
            DataType = datInteger
          end
          item
            Name = 'GASOLINEROID'
            DataType = datInteger
          end
          item
            Name = 'REFERENCIA'
            DataType = datString
            Size = 50
          end
          item
            Name = 'IDRFID'
            DataType = datString
            Size = 20
          end
          item
            Name = 'CLASIFICACION'
            DataType = datInteger
          end>
      end
      item
        Params = <
          item
            Name = 'FACTURAID'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            Name = 'Flotillas'
            SQL = 
              'SELECT SecuenciaVenta'#10'FROM Consumo'#10'WHERE (FACTURAID = :FACTURAID' +
              ')'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'SecuenciaVenta'
                TableField = 'SecuenciaVenta'
              end>
          end>
        Name = 'spBuscaTicketFactura'
        Fields = <
          item
            Name = 'SecuenciaVenta'
            DataType = datInteger
          end>
      end
      item
        Params = <
          item
            Name = 'VEHICULOID'
            Value = '1'
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            Name = 'Flotillas'
            SQL = 
              'SELECT MES1, MES2, MONTO FROM VEHICULO'#10'WHERE VEHICULOID = :VEHIC' +
              'ULOID'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'MES1'
                TableField = 'MES1'
              end
              item
                DatasetField = 'MES2'
                TableField = 'MES2'
              end
              item
                DatasetField = 'MONTO'
                TableField = 'MONTO'
              end>
          end>
        Name = 'spAutorizaImporteTemporal'
        Fields = <
          item
            Name = 'MES1'
            DataType = datDateTime
          end
          item
            Name = 'MES2'
            DataType = datDateTime
          end
          item
            Name = 'MONTO'
            DataType = datFloat
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
            Connection = 'Flotillas'
            SQL = 
              'Select ClienteID, Nombre, Estatus, FormaPagoID, CuentaContable, ' +
              'FormaCompraID From dbo.Cliente'#10'Where(ClienteID = :Cliente)'#10'order' +
              ' by Nombre'#10
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
                DatasetField = 'Estatus'
                TableField = 'Estatus'
              end
              item
                DatasetField = 'FormaPagoID'
                TableField = 'FormaPagoID'
              end
              item
                DatasetField = 'CuentaContable'
                TableField = 'CuentaContable'
              end
              item
                DatasetField = 'FormaCompraID'
                TableField = 'FormaCompraID'
              end>
          end>
        Name = 'BuscaCliente'
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
            Name = 'Estatus'
            DataType = datString
            Size = 1
          end
          item
            Name = 'FormaPagoID'
            DataType = datInteger
          end
          item
            Name = 'CuentaContable'
            DataType = datString
            Size = 15
          end
          item
            Name = 'FormaCompraID'
            DataType = datInteger
          end>
      end
      item
        Params = <
          item
            Name = 'FacturaID'
            Value = '0'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            SQL = 
              'SELECT dtf.DetalleFacturaID, dtf.FacturaID, dtf.Cantidad, dtf.Pr' +
              'ecio,'#10'       dtf.Importe, dtf.ProductoID, pdt.Descripcion'#10'FROM  ' +
              'dbo.DetalleFactura dtf'#10'inner join dbo.Producto pdt on (pdt.Produ' +
              'ctoID = dtf.ProductoID)'#10'Where (dtf.FacturaID = :FacturaID)'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'DetalleFacturaID'
                TableField = 'DetalleFacturaID'
              end
              item
                DatasetField = 'FacturaID'
                TableField = 'FacturaID'
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
                DatasetField = 'ProductoID'
                TableField = 'ProductoID'
              end
              item
                DatasetField = 'Descripcion'
                TableField = 'Descripcion'
              end>
          end>
        Name = 'dbo DetalleFactura'
        Fields = <
          item
            Name = 'DetalleFacturaID'
            DataType = datInteger
          end
          item
            Name = 'FacturaID'
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
            Name = 'ProductoID'
            DataType = datInteger
          end
          item
            Name = 'Descripcion'
            DataType = datString
            Size = 80
          end>
      end
      item
        Params = <
          item
            Name = 'Folio'
            Value = '4070'
            ParamType = daptInput
          end
          item
            Name = 'Serie'
            Value = 'a'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            SQL = 
              'SELECT FACTURAID, SERIE, FOLIO, FECHA, FECHAVENCIMIENTO, FECHAIM' +
              'PRESION,'#10'       EJERCICIO, PERIODO, SUBTOTAL, IMPUESTO, TOTAL, S' +
              'ALDO, TICKETS, CLIENTEID,'#10'       USUARIOID, MOVIMIENTOID'#10'FROM'#10'  ' +
              '     dbo.Factura'#10'WHERE  (FOLIO = :Folio)and(SERIE = :Serie)'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'FACTURAID'
                TableField = 'FACTURAID'
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
                DatasetField = 'FECHA'
                TableField = 'FECHA'
              end
              item
                DatasetField = 'FECHAVENCIMIENTO'
                TableField = 'FECHAVENCIMIENTO'
              end
              item
                DatasetField = 'FECHAIMPRESION'
                TableField = 'FECHAIMPRESION'
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
                DatasetField = 'SUBTOTAL'
                TableField = 'SUBTOTAL'
              end
              item
                DatasetField = 'IMPUESTO'
                TableField = 'IMPUESTO'
              end
              item
                DatasetField = 'TOTAL'
                TableField = 'TOTAL'
              end
              item
                DatasetField = 'SALDO'
                TableField = 'SALDO'
              end
              item
                DatasetField = 'TICKETS'
                TableField = 'TICKETS'
              end
              item
                DatasetField = 'CLIENTEID'
                TableField = 'CLIENTEID'
              end
              item
                DatasetField = 'USUARIOID'
                TableField = 'USUARIOID'
              end
              item
                DatasetField = 'MOVIMIENTOID'
                TableField = 'MOVIMIENTOID'
              end>
          end>
        Name = 'dbo Factura'
        Fields = <
          item
            Name = 'FACTURAID'
            DataType = datInteger
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
            Name = 'FECHA'
            DataType = datDateTime
          end
          item
            Name = 'FECHAVENCIMIENTO'
            DataType = datDateTime
          end
          item
            Name = 'FECHAIMPRESION'
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
            Name = 'SUBTOTAL'
            DataType = datFloat
          end
          item
            Name = 'IMPUESTO'
            DataType = datFloat
          end
          item
            Name = 'TOTAL'
            DataType = datFloat
          end
          item
            Name = 'SALDO'
            DataType = datFloat
          end
          item
            Name = 'TICKETS'
            DataType = datMemo
          end
          item
            Name = 'CLIENTEID'
            DataType = datInteger
          end
          item
            Name = 'USUARIOID'
            DataType = datInteger
          end
          item
            Name = 'MOVIMIENTOID'
            DataType = datInteger
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'Flotillas'
            TargetTable = 'dbo.TipoMovimiento'
            SQL = 
              'SELECT '#10'    TipoMovimientoID, Descripcion, CargoAbono'#10'  FROM'#10'   ' +
              ' dbo.TipoMovimiento'
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'TipoMovimientoID'
                TableField = 'TipoMovimientoID'
              end
              item
                DatasetField = 'Descripcion'
                TableField = 'Descripcion'
              end
              item
                DatasetField = 'CargoAbono'
                TableField = 'CargoAbono'
              end>
          end>
        Name = 'dbo TipoMovimiento'
        Fields = <
          item
            Name = 'TipoMovimientoID'
            DataType = datString
            Size = 10
            Required = True
            InPrimaryKey = True
          end
          item
            Name = 'Descripcion'
            DataType = datString
            Size = 70
            Required = True
          end
          item
            Name = 'CargoAbono'
            DataType = datString
            Size = 1
            Required = True
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'Flotillas'
            TargetTable = 'dbo.Vendedor'
            SQL = 'SELECT '#10'    VendedorID, Nombre'#10'  FROM'#10'    dbo.Vendedor'
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'VendedorID'
                TableField = 'VendedorID'
              end
              item
                DatasetField = 'Nombre'
                TableField = 'Nombre'
              end>
          end>
        Name = 'dbo Vendedor'
        Fields = <
          item
            Name = 'VendedorID'
            DataType = datInteger
            Required = True
            InPrimaryKey = True
          end
          item
            Name = 'Nombre'
            DataType = datString
            Size = 70
            Required = True
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'Flotillas'
            TargetTable = 'dbo.GrupoFacturar'
            SQL = 'SELECT '#10'    GrupoFacturarID, Nombre'#10'  FROM'#10'    dbo.GrupoFacturar'
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'GrupoFacturarID'
                TableField = 'GrupoFacturarID'
              end
              item
                DatasetField = 'Nombre'
                TableField = 'Nombre'
              end>
          end>
        Name = 'dbo GrupoFacturar'
        Fields = <
          item
            Name = 'GrupoFacturarID'
            DataType = datInteger
            Required = True
            InPrimaryKey = True
          end
          item
            Name = 'Nombre'
            DataType = datString
            Size = 50
            Required = True
          end>
      end
      item
        Params = <
          item
            Name = 'Ejercicio'
            Value = '2006'
            ParamType = daptInput
          end
          item
            Name = 'Ini'
            Value = '1'
            ParamType = daptInput
          end
          item
            Name = 'Fin'
            Value = '12'
            ParamType = daptInput
          end
          item
            Name = 'ClienteIni'
            Value = '1'
            ParamType = daptInput
          end
          item
            Name = 'ClienteFin'
            Value = '9999'
            ParamType = daptInput
          end
          item
            Name = 'Grupo'
            DataType = datString
            Value = ''
            ParamType = daptInput
          end
          item
            Name = 'FormaCompraID'
            Value = '1'
            ParamType = daptInput
          end
          item
            Name = 'GrupoFacturarID'
            Value = '1'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            SQL = 
              'declare @Ejercicio Integer'#10'declare @Ini Integer'#10'declare @Fin Int' +
              'eger'#10'declare @ClienteIni INTEGER'#10'declare @ClienteFin INTEGER'#10'dec' +
              'lare @Grupo VARCHAR(100)'#10'declare @FormaCompra INTEGER'#10'declare @G' +
              'RUPOFacturar INTEGER'#10#10'select @ejercicio = (select :Ejercicio)'#10'se' +
              'lect @ini = (select :Ini)'#10'select @fin = (select :Fin)'#10'select @cl' +
              'ienteini = (select :ClienteIni)'#10'select @clientefin = (select :Cl' +
              'ienteFin)'#10'select @grupo = (select :Grupo)'#10'select @formacompra = ' +
              '(select :FormaCompraID)'#10'select @GRUPOfacturar = (select :GrupoFa' +
              'cturarID)'#10#10#10'/*================*/'#10#10'DECLARE @CONSUMOS MONEY'#10'DECLAR' +
              'E @CUPONES MONEY'#10'DECLARE @SALDOINICIAL MONEY'#10'DECLARE @SALDOFINAL' +
              ' MONEY'#10'DECLARE @TOTALCARGOS MONEY'#10'DECLARE @TOTALABONOS MONEY'#10'DEC' +
              'LARE @SUBTOTAL MONEY'#10'DECLARE @SALDO MONEY'#10'DECLARE @CUANTOS MONEY' +
              #10#9#9' DECLARE @XCLIENTE AS INT'#10#9#9' DECLARE @XNOMBRE AS VARCHAR(100)' +
              #10#9#9' DECLARE @XRFC AS VARCHAR(25)'#10#9#9' DECLARE @XCALLE AS VARCHAR(1' +
              '00)'#10#9#9' DECLARE @XFECHA AS DATETIME'#10#9#9' DECLARE @XREFERENCIA AS VA' +
              'RCHAR(80)'#10#9#9' DECLARE @XFACTURA AS VARCHAR(6)'#10#9#9' DECLARE @XCARGO ' +
              'AS FLOAT'#10#9#9' DECLARE @XABONO AS FLOAT'#10#9#9' DECLARE @XLIMITECREDITO ' +
              'AS FLOAT'#10#9#9' DECLARE @XSALDOINICIAL AS FLOAT'#10#9#9' DECLARE @XCONSUMO' +
              'S AS FLOAT'#10#9#9' DECLARE @XTOTALCARGOS AS FLOAT'#10#9#9' DECLARE @XTOTALA' +
              'BONOS AS FLOAT'#10#9#9' DECLARE @XSUBTOTAL AS FLOAT'#10#9#9' DECLARE @XSALDO' +
              ' AS FLOAT'#10#9#9' DECLARE @XDISPONIBLE AS FLOAT'#10#9#9' DECLARE @XSALDOPAR' +
              'CIAL AS FLOAT'#10#9#9' DECLARE @XOK AS INT'#10' '#9#9' DECLARE @XFC AS INT'#10#9#9'C' +
              'REATE TABLE #SALDOCLIENTE'#10#9#9'(CLIENTE INT,'#10#9#9' NOMBRE VARCHAR(100)' +
              ','#10#9#9' RFC VARCHAR(25),'#10#9#9' CALLE VARCHAR(100),'#10#9#9' FECHA DATETIME,'#10 +
              #9#9' REFERENCIA VARCHAR(80),'#10#9#9' DOCUMENTOID INT,'#10#9#9' CARGO MONEY,'#10#9 +
              #9' ABONO MONEY,'#10#9#9' LIMITECREDITO MONEY,'#10#9#9' SALDOINICIAL MONEY,'#10#9#9 +
              ' CONSUMOS MONEY,'#10#9#9' TOTALCARGOS MONEY,'#10#9#9' TOTALABONOS MONEY,'#10#9#9' ' +
              'SUBTOTAL MONEY,'#10#9#9' SALDO MONEY,'#10#9#9' DISPONIBLE MONEY,'#10#9#9' SALDOPAR' +
              'CIAL MONEY)'#10#9'WHILE (@CLIENTEINI <= @CLIENTEFIN)'#10'     BEGIN'#10#9'SELE' +
              'CT @XOK = 0'#10#9'IF (@GRUPO <> '#39#39' AND (SELECT COUNT(*) FROM Cliente ' +
              'WHERE ClienteID = @CLIENTEINI AND GRUPO = @GRUPO) < 1)'#10#9#9'SELECT ' +
              '@XOK = 1'#10#9'IF (@FORMACOMPRA > 0 AND (SELECT COUNT(*) FROM Cliente' +
              ' WHERE ClienteID = @CLIENTEINI AND FORMACOMPRAID = @FORMACOMPRA)' +
              ' < 1)'#10#9#9'SELECT @XOK = 1'#10#9'IF (@GRUPOFACTURAR > 0 AND (SELECT COUN' +
              'T(*) FROM Cliente WHERE ClienteID = @CLIENTEINI AND GrupoFactura' +
              'rID = @GRUPOFACTURAR) < 1)'#10#9#9'SELECT @XOK = 1'#10#9'IF (@XOK = 0)'#10#9'BEG' +
              'IN'#10#10#10#9'SELECT @XFC = (SELECT FORMACOMPRAID FROM Cliente WHERE Cli' +
              'enteID = @CLIENTEINI)'#10#9'IF (@XFC = 1)'#10#9'BEGIN'#10#9#9'SELECT @CONSUMOS =' +
              ' (SELECT SUM(IMPORTE) FROM Consumo WHERE (ClienteID = @CLIENTEIN' +
              'I) AND (FACTURADO = 0) AND ((Ejercicio < @EJERCICIO) OR ((Ejerci' +
              'cio = @EJERCICIO) AND (Periodo <= @FIN))))'#10#9'END'#10#9'ELSE'#10#9'BEGIN'#10#9#9'S' +
              'ELECT @CONSUMOS = (SELECT SUM(IMPORTE) FROM Consumo WHERE (Clien' +
              'teID = @CLIENTEINI) AND (FACTURADO = 0)'#10#9#9#9#9#9'    AND ((Ejercicio' +
              ' < @EJERCICIO) OR ((Ejercicio = @EJERCICIO) AND (Periodo <= @FIN' +
              '))))'#10#9'END'#10#9'SELECT @CONSUMOS = ISNULL(@CONSUMOS, 0)'#10'        SELEC' +
              'T @CUPONES = ISNULL((SELECT SUM(IMPORTE) FROM CUPON WHERE STATUS' +
              ' = '#39'A'#39' AND CLIENTEID = @CLIENTEINI), 0)'#10#9'SELECT @SALDOINICIAL = ' +
              '(SELECT SUM(CARGO - Abono) FROM Movimiento where (ClienteID = @C' +
              'lienteIni) AND ((ejercicio < @Ejercicio) or (ejercicio = @ejerci' +
              'cio and periodo < @ini)))'#10#9'SELECT @SALDOINICIAL = ISNULL(@SALDOI' +
              'NICIAL, 0)'#10#10#9'SELECT @TOTALCARGOS = ISNULL((SELECT SUM(CARGO) FRO' +
              'M         Movimiento'#10#9'WHERE  ClienteID = @CLIENTEINI AND Periodo' +
              ' Between @INI AND @FIN AND EJERCICIO = @Ejercicio), 0)'#10#10#9'SELECT ' +
              '@TOTALABONOS = ISNULL((SELECT SUM(ABONO) FROM         Movimiento' +
              #10#9'WHERE  ClienteID = @CLIENTEINI AND Periodo Between @INI AND @F' +
              'IN AND EJERCICIO = @Ejercicio), 0)'#10#10#9'SELECT @SUBTOTAL = ISNULL(@' +
              'SALDOINICIAL + @TOTALCARGOS - @TOTALABONOS, 0)'#10#9'SELECT @SALDO = ' +
              'ISNULL(@SUBTOTAL + @CONSUMOS + @CUPONES, 0)'#10'        SELECT @CUAN' +
              'TOS = (SELECT     COUNT(*)'#10#9'FROM    Movimiento'#10#9'WHERE  ClienteID' +
              ' = @CLIENTEINI AND Periodo Between @INI AND @FIN AND EJERCICIO =' +
              ' @Ejercicio)'#10#10#9'select @XSALDOPARCIAL = @SaldoInicial'#10#10#9'INSERT IN' +
              'TO #SALDOCLIENTE'#10#9'SELECT     Cliente.CLIENTEID, Cliente.NOMBRE, ' +
              'Cliente.RFC, Cliente.DOMICILIO, null, '#39'-= SALDO INICIAL =-'#39' AS R' +
              'EFERENCIA,'#10'                      '#9'null AS FACTURA, @SALDOINICIAL' +
              ' AS CARGO, 0.0 AS ABONO, Cliente.LIMITECREDITO, @SALDOINICIAL AS' +
              ' SALDOINICIAL,'#10#9#9'@CONSUMOS AS CONSUMOS, @TOTALCARGOS AS TOTALCAR' +
              'GOS, @TOTALABONOS AS TOTALABONOS, @SUBTOTAL AS SUBTOTAL,'#10#9#9'@SALD' +
              'O AS SALDO, (Cliente.LIMITECREDITO - @SALDO) AS DISPONIBLE, @SAL' +
              'DOINICIAL'#10#9'FROM         Cliente  '#9#9'WHERE  ClienteID = @CLIENTEIN' +
              'I'#10#10#9'IF (@CUANTOS > 0)'#10#9'BEGIN'#10#9#9'DECLARE CMISALDO1 CURSOR FOR'#10#9#9'SE' +
              'LECT     Cliente.CLIENTEID, Cliente.NOMBRE, Cliente.RFC, Cliente' +
              '.DOMICILIO, Movimiento.FECHAMOVIMIENTO, Movimiento.REFERENCIA,'#10#9 +
              '                      '#9'Movimiento.MovimientoID, Movimiento.CARGO' +
              ', Movimiento.ABONO, Cliente.LIMITECREDITO, @SALDOINICIAL AS SALD' +
              'OINICIAL,'#10#9#9#9'@CONSUMOS AS CONSUMOS, @TOTALCARGOS AS TOTALCARGOS,' +
              ' @TOTALABONOS AS TOTALABONOS, @SUBTOTAL AS SUBTOTAL,'#10#9#9#9'@SALDO A' +
              'S SALDO, (Cliente.LIMITECREDITO - @SALDO) AS DISPONIBLE, 0'#10#9#9'FRO' +
              'M         Movimiento INNER JOIN'#10#9'                      '#9'Cliente ' +
              'ON Movimiento.CLIENTEID = Cliente.CLIENTEID'#10#9#9'WHERE  Cliente.CLI' +
              'ENTEID = @CLIENTEINI AND Movimiento.Periodo BETWEEN @INI AND @FI' +
              'N AND Ejercicio = @Ejercicio'#10#9#9'ORDER BY Movimiento.FECHAMOVIMIEN' +
              'TO'#10#9#9'OPEN CMISALDO1'#10#9#9'FETCH NEXT FROM CMISALDO1 INTO @XCLIENTE, ' +
              '@XNOMBRE, @XRFC, @XCALLE, @XFECHA,'#10#9#9'@XREFERENCIA, @XFACTURA, @X' +
              'CARGO, @XABONO, @XLIMITECREDITO, @XSALDOINICIAL, @XCONSUMOS,'#10#9#9'@' +
              'XTOTALCARGOS, @XTOTALABONOS, @XSUBTOTAL, @XSALDO, @XDISPONIBLE, ' +
              '@XSALDOPARCIAL'#10#9#9'WHILE (@@FETCH_STATUS = 0)'#10#9#9'BEGIN'#10#9#9#9'SELECT @X' +
              'SALDOPARCIAL = @SALDOINICIAL + @XCARGO - @XABONO'#10#9#9#9'SELECT @SALD' +
              'OINICIAL = @XSALDOPARCIAL'#10#9#9#9'INSERT INTO #SALDOCLIENTE VALUES (@' +
              'XCLIENTE, @XNOMBRE, @XRFC, @XCALLE, @XFECHA,'#10#9#9#9'@XREFERENCIA, @X' +
              'FACTURA, @XCARGO, @XABONO, @XLIMITECREDITO, @XSALDOINICIAL, @XCO' +
              'NSUMOS,'#10#9#9#9'@XTOTALCARGOS, @XTOTALABONOS, @XSUBTOTAL, @XSALDO, @X' +
              'DISPONIBLE, @XSALDOPARCIAL)'#10#9#9#9'FETCH NEXT FROM CMISALDO1 INTO @X' +
              'CLIENTE, @XNOMBRE, @XRFC, @XCALLE, @XFECHA,'#10#9#9#9'@XREFERENCIA, @XF' +
              'ACTURA, @XCARGO, @XABONO, @XLIMITECREDITO, @XSALDOINICIAL, @XCON' +
              'SUMOS,'#10#9#9#9'@XTOTALCARGOS, @XTOTALABONOS, @XSUBTOTAL, @XSALDO, @XD' +
              'ISPONIBLE, @XSALDOPARCIAL'#10#9#9'END'#10#9#9'CLOSE CMISALDO1'#10#9#9'DEALLOCATE C' +
              'MISALDO1'#10#9'END'#10#9#9'INSERT INTO #SALDOCLIENTE'#10#9#9'SELECT     Cliente.C' +
              'LIENTEID, Cliente.NOMBRE, Cliente.RFC, Cliente.DOMICILIO, null, ' +
              #39'-= CONSUMOS PENDIENTES DE APLICAR =-'#39' AS REFERENCIA,'#10#9'         ' +
              '             '#9'null AS FACTURA, @CONSUMOS AS CARGO, 0.0 AS ABONO,' +
              ' Cliente.LIMITECREDITO, @SALDOINICIAL AS SALDOINICIAL,'#10#9#9#9'@CONSU' +
              'MOS AS CONSUMOS, @TOTALCARGOS AS TOTALCARGOS, @TOTALABONOS AS TO' +
              'TALABONOS, @SUBTOTAL AS SUBTOTAL,'#10#9#9#9'@SALDO AS SALDO, (Cliente.L' +
              'IMITECREDITO - @SALDO) AS DISPONIBLE, @XSALDOPARCIAL+ @CONSUMOS'#10 +
              #9#9'FROM         Cliente  '#9#9'WHERE  ClienteID = @CLIENTEINI'#10#10#9#9'INSE' +
              'RT INTO #SALDOCLIENTE'#10#9#9'SELECT     Cliente.CLIENTEID, Cliente.NO' +
              'MBRE, Cliente.RFC, Cliente.DOMICILIO, null, '#39'-= CUPONES ACTIVOS ' +
              '=-'#39' AS REFERENCIA,'#10#9'                      '#9'null AS FACTURA, @CUP' +
              'ONES AS CARGO, 0.0 AS ABONO, Cliente.LIMITECREDITO, @SALDOINICIA' +
              'L AS SALDOINICIAL,'#10#9#9#9'@CONSUMOS AS CONSUMOS, @TOTALCARGOS AS TOT' +
              'ALCARGOS, @TOTALABONOS AS TOTALABONOS, @SUBTOTAL AS SUBTOTAL,'#10#9#9 +
              #9'@SALDO AS SALDO, (Cliente.LIMITECREDITO - @SALDO) AS DISPONIBLE' +
              ', @XSALDOPARCIAL + @CONSUMOS + @CUPONES'#10#9#9'FROM         Cliente  ' +
              #9#9'WHERE  ClienteID = @CLIENTEINI'#10#10#9'SELECT @CLIENTEINI = @CLIENTE' +
              'INI + 1'#10'end'#10#9'END'#10'SELECT * FROM #SALDOCLIENTE'#10#10'drop table #SALDOC' +
              'LIENTE'#10#10#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'CLIENTE'
                TableField = 'CLIENTE'
              end
              item
                DatasetField = 'NOMBRE'
                TableField = 'NOMBRE'
              end
              item
                DatasetField = 'RFC'
                TableField = 'RFC'
              end
              item
                DatasetField = 'CALLE'
                TableField = 'CALLE'
              end
              item
                DatasetField = 'FECHA'
                TableField = 'FECHA'
              end
              item
                DatasetField = 'REFERENCIA'
                TableField = 'REFERENCIA'
              end
              item
                DatasetField = 'DOCUMENTOID'
                TableField = 'DOCUMENTOID'
              end
              item
                DatasetField = 'CARGO'
                TableField = 'CARGO'
              end
              item
                DatasetField = 'ABONO'
                TableField = 'ABONO'
              end
              item
                DatasetField = 'LIMITECREDITO'
                TableField = 'LIMITECREDITO'
              end
              item
                DatasetField = 'SALDOINICIAL'
                TableField = 'SALDOINICIAL'
              end
              item
                DatasetField = 'CONSUMOS'
                TableField = 'CONSUMOS'
              end
              item
                DatasetField = 'TOTALCARGOS'
                TableField = 'TOTALCARGOS'
              end
              item
                DatasetField = 'TOTALABONOS'
                TableField = 'TOTALABONOS'
              end
              item
                DatasetField = 'SUBTOTAL'
                TableField = 'SUBTOTAL'
              end
              item
                DatasetField = 'SALDO'
                TableField = 'SALDO'
              end
              item
                DatasetField = 'DISPONIBLE'
                TableField = 'DISPONIBLE'
              end
              item
                DatasetField = 'SALDOPARCIAL'
                TableField = 'SALDOPARCIAL'
              end>
          end>
        Name = 'spSaldos'
        Fields = <
          item
            Name = 'CLIENTE'
            DataType = datInteger
          end
          item
            Name = 'NOMBRE'
            DataType = datString
            Size = 100
          end
          item
            Name = 'RFC'
            DataType = datString
            Size = 25
          end
          item
            Name = 'CALLE'
            DataType = datString
            Size = 100
          end
          item
            Name = 'FECHA'
            DataType = datDateTime
          end
          item
            Name = 'REFERENCIA'
            DataType = datString
            Size = 80
          end
          item
            Name = 'DOCUMENTOID'
            DataType = datInteger
          end
          item
            Name = 'CARGO'
            DataType = datCurrency
          end
          item
            Name = 'ABONO'
            DataType = datCurrency
          end
          item
            Name = 'LIMITECREDITO'
            DataType = datCurrency
          end
          item
            Name = 'SALDOINICIAL'
            DataType = datCurrency
          end
          item
            Name = 'CONSUMOS'
            DataType = datCurrency
          end
          item
            Name = 'TOTALCARGOS'
            DataType = datCurrency
          end
          item
            Name = 'TOTALABONOS'
            DataType = datCurrency
          end
          item
            Name = 'SUBTOTAL'
            DataType = datCurrency
          end
          item
            Name = 'SALDO'
            DataType = datCurrency
          end
          item
            Name = 'DISPONIBLE'
            DataType = datCurrency
          end
          item
            Name = 'SALDOPARCIAL'
            DataType = datCurrency
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
            Connection = 'Flotillas'
            SQL = 
              'SELECT UsuarioID, Nombre'#10'FROM Usuario'#10'WHERE (Usuario = :Usuario)' +
              ' AND (Clave = :Clave)'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'UsuarioID'
                TableField = 'UsuarioID'
              end
              item
                DatasetField = 'Nombre'
                TableField = 'Nombre'
              end>
          end>
        Name = 'spValidaUsuario'
        Fields = <
          item
            Name = 'UsuarioID'
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
            Connection = 'Flotillas'
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
            Name = 'ClienteIni'
            Value = '1'
            ParamType = daptInput
          end
          item
            Name = 'ClienteFin'
            Value = '1'
            ParamType = daptInput
          end
          item
            Name = 'FECHACORTE'
            Value = '02/02/2007'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            SQL = 
              'SELECT     A.ClienteID, A.MovimientoID, A.Referencia, A.FechaMov' +
              'imiento, A.FechaVencimiento, B.Cargo, B.Abono, B.Saldo'#10'FROM     ' +
              '    (SELECT     SaldoDocumento.ClienteID, SaldoDocumento.Movimie' +
              'ntoID, Movimiento.Referencia, Movimiento.FechaMovimiento, Movimi' +
              'ento.FechaVencimiento,'#10'                      SaldoDocumento.Carg' +
              'o, SaldoDocumento.Abono, SaldoDocumento.Cargo - SaldoDocumento.A' +
              'bono AS Saldo'#10'FROM         SaldoDocumento INNER JOIN'#10'           ' +
              '           Movimiento ON SaldoDocumento.MovimientoID = Movimient' +
              'o.MovimientoID AND SaldoDocumento.ClienteID = Movimiento.Cliente' +
              'ID INNER JOIN'#10'                      Cliente ON Movimiento.Client' +
              'eID = Cliente.ClienteID'#10'                       WHERE      (Clien' +
              'te.FORMACOMPRAID = 1) and (dbo.SaldoDocumento.Cargo - dbo.SaldoD' +
              'ocumento.Abono > 0)AND(dbo.Movimiento.ClienteID BETWEEN :Cliente' +
              'Ini AND :ClienteFin) AND (dbo.SaldoDocumento.FECHA <= :FECHACORT' +
              'E)) A INNER JOIN'#10'                          (SELECT     Movimient' +
              'oID, SUM(Cargo) AS Cargo, SUM(Abono) AS Abono, SUM(Cargo - Abono' +
              ') AS Saldo'#10'                            FROM          SaldoDocume' +
              'nto'#10'                            GROUP BY MovimientoID) B ON A.Mo' +
              'vimientoID = B.MovimientoID'#10'WHERE     (B.Saldo > .05)'#10'ORDER BY A' +
              '.ClienteID, A.MovimientoID'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'ClienteID'
                TableField = 'ClienteID'
              end
              item
                DatasetField = 'Referencia'
                TableField = 'Referencia'
              end
              item
                DatasetField = 'FechaMovimiento'
                TableField = 'FechaMovimiento'
              end
              item
                DatasetField = 'FechaVencimiento'
                TableField = 'FechaVencimiento'
              end
              item
                DatasetField = 'Cargo'
                TableField = 'Cargo'
              end
              item
                DatasetField = 'Abono'
                TableField = 'Abono'
              end
              item
                DatasetField = 'Saldo'
                TableField = 'Saldo'
              end
              item
                DatasetField = 'MovimientoID'
                TableField = 'MovimientoID'
              end>
          end>
        Name = 'spAnalisisSaldosDetalles'
        Fields = <
          item
            Name = 'ClienteID'
            DataType = datInteger
          end
          item
            Name = 'MovimientoID'
            DataType = datInteger
          end
          item
            Name = 'Referencia'
            DataType = datString
            Size = 50
          end
          item
            Name = 'FechaMovimiento'
            DataType = datDateTime
          end
          item
            Name = 'FechaVencimiento'
            DataType = datDateTime
          end
          item
            Name = 'Cargo'
            DataType = datFloat
          end
          item
            Name = 'Abono'
            DataType = datFloat
          end
          item
            Name = 'Saldo'
            DataType = datFloat
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
            Value = '3'
            ParamType = daptInput
          end
          item
            Name = 'FechaCorte'
            Value = '03/02/2007'
            ParamType = daptInput
          end
          item
            Name = 'Venc0'
            Value = '1'
            ParamType = daptInput
          end
          item
            Name = 'Venc1'
            Value = '1'
            ParamType = daptInput
          end
          item
            Name = 'Venc2'
            Value = '1'
            ParamType = daptInput
          end
          item
            Name = 'Venc3'
            Value = '1'
            ParamType = daptInput
          end
          item
            Name = 'Venc4'
            Value = '1'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            SQL = 
              'declare @Identificador as Integer'#10'declare @ClienteIni as Integer' +
              #10'declare @ClienteFin as Integer'#10'declare @FechaCorte as DateTime'#10 +
              'declare @Venc0 as Integer'#10'declare @Venc1 as Integer'#10'declare @Ven' +
              'c2 as Integer'#10'declare @Venc3 as Integer'#10'declare @Venc4 as Intege' +
              'r'#10#10'Select @ClienteIni = :ClienteIni'#10'Select @ClienteFin = :Client' +
              'eFin'#10'Select @FechaCorte = :FechaCorte'#10'Select @Venc0 = :Venc0'#10'Sel' +
              'ect @Venc1 = :Venc1'#10'Select @Venc2 = :Venc2'#10'Select @Venc3 = :Venc' +
              '3'#10'Select @Venc4 = :Venc4'#10#10'CREATE TABLE #SALDOS'#10'    (CLIENTEID IN' +
              'T,'#10'     MOVIMIENTOID INT,'#10#9'FECHAVENCIMIENTO DATETIME,'#10'    SALDO ' +
              'FLOAT)'#10#10'        INSERT INTO #SALDOS'#10#9'SELECT     ClienteID, Saldo' +
              'Documento.MOVIMIENTOID, A.Fecha, SUM(CARGO - ABONO) AS SALDO'#10'   ' +
              '     FROM         dbo.SaldoDocumento inner join (select FechaVen' +
              'cimiento as Fecha, MovimientoID from movimiento'#10'where cargo > 0'#10 +
              ')A ON SaldoDocumento.MovimientoID = A.MovimientoID'#10'        WHERE' +
              ' ClienteID BETWEEN @CLIENTEINI AND @CLIENTEFIN AND dbo.SaldoDocu' +
              'mento.Fecha <= @FECHACORTE'#10'        GROUP BY ClienteID, SaldoDocu' +
              'mento.MOVIMIENTOID, A.Fecha'#10'        HAVING SUM(CARGO - ABONO) <>' +
              ' 0'#10#10#10'SELECT ClienteID, Nombre, Max(Fecha) As UltimoMovimiento, c' +
              'ast(Sum(Saldo)as money) As Saldo, cast(Sum(SinVencer)as money) A' +
              's SinVencer, cast(Sum(Vence1)as money) AS Vence1, cast(Sum(Vence' +
              '2)as money) AS Vence2, cast(Sum(Vence3)as money) AS Vence3, cast' +
              '(Sum(Vence4)as money) AS Vence4, cast(Sum(MASVENC4) as money) as' +
              ' MasVence4 FROM'#10'(SELECT DISTINCT dbo.SaldoDocumento.CLIENTEID, d' +
              'bo.Cliente.NOMBRE,'#10'dbo.SaldoDocumento.FECHA,'#10'            #SALDOS' +
              '.SALDO AS SALDO,'#10'            CASE WHEN DATEDIFF(DAY,#SALDOS.FECH' +
              'AVENCIMIENTO, @FECHACORTE )  <   @VENC0                         ' +
              '                                                            THEN' +
              ' SALDO ELSE 0 END AS SINVENCER,'#10'            CASE WHEN DATEDIFF(D' +
              'AY,#SALDOS.FECHAVENCIMIENTO, @FECHACORTE )  >=  @VENC0     AND D' +
              'ATEDIFF(DAY,#SALDOS.FECHAVENCIMIENTO, @FECHACORTE )  <= @VENC1  ' +
              'THEN SALDO ELSE 0 END AS VENCE1,'#10'            CASE WHEN DATEDIFF(' +
              'DAY,#SALDOS.FECHAVENCIMIENTO, @FECHACORTE )  >=  @VENC1 + 1 AND ' +
              'DATEDIFF(DAY,#SALDOS.FECHAVENCIMIENTO,  @FECHACORTE ) <= @VENC2 ' +
              ' THEN SALDO ELSE 0 END AS VENCE2,'#10'            CASE WHEN DATEDIFF' +
              '(DAY,#SALDOS.FECHAVENCIMIENTO, @FECHACORTE )  >=  @VENC2 + 1 AND' +
              ' DATEDIFF(DAY,#SALDOS.FECHAVENCIMIENTO,  @FECHACORTE ) <= @VENC3' +
              '  THEN SALDO ELSE 0 END AS VENCE3,'#10'            CASE WHEN DATEDIF' +
              'F(DAY,#SALDOS.FECHAVENCIMIENTO, @FECHACORTE )  >=  @VENC3 + 1 AN' +
              'D DATEDIFF(DAY,#SALDOS.FECHAVENCIMIENTO,  @FECHACORTE ) <= @VENC' +
              '4  THEN SALDO ELSE 0 END AS VENCE4,'#10'            CASE WHEN DATEDI' +
              'FF(DAY,#SALDOS.FECHAVENCIMIENTO, @FECHACORTE )  >   @VENC4      ' +
              '                                                                ' +
              '               THEN SALDO ELSE 0 END AS MASVENC4'#10'        FROM   ' +
              '      dbo.SaldoDocumento INNER JOIN'#10'                          #S' +
              'ALDOS ON dbo.SaldoDocumento.CLIENTEID = #SALDOS.CLIENTEID AND db' +
              'o.SaldoDocumento.MOVIMIENTOID = #SALDOS.MOVIMIENTOID LEFT OUTER ' +
              'JOIN'#10'                          dbo.Cliente ON dbo.SaldoDocumento' +
              '.CLIENTEID = dbo.Cliente.CLIENTEID'#10#9'WHERE dbo.SaldoDocumento.CLI' +
              'ENTEID BETWEEN @CLIENTEINI AND @CLIENTEFIN  AND dbo.SaldoDocumen' +
              'to.FECHA <= @FECHACORTE  AND dbo.SaldoDocumento.CARGO > 0 AND db' +
              'o.Cliente.FORMACOMPRAID = 1) A'#10'Group BY ClienteID, Nombre'#10'Order ' +
              'by Clienteid'#10#10#10
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
                DatasetField = 'UltimoMovimiento'
                TableField = 'UltimoMovimiento'
              end
              item
                DatasetField = 'Saldo'
                TableField = 'Saldo'
              end
              item
                DatasetField = 'SinVencer'
                TableField = 'SinVencer'
              end
              item
                DatasetField = 'Vence1'
                TableField = 'Vence1'
              end
              item
                DatasetField = 'Vence2'
                TableField = 'Vence2'
              end
              item
                DatasetField = 'Vence3'
                TableField = 'Vence3'
              end
              item
                DatasetField = 'Vence4'
                TableField = 'Vence4'
              end
              item
                DatasetField = 'MasVence4'
                TableField = 'MasVence4'
              end>
          end>
        Name = 'spAnalisisSaldosMaster'
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
            Name = 'UltimoMovimiento'
            DataType = datDateTime
          end
          item
            Name = 'Saldo'
            DataType = datCurrency
          end
          item
            Name = 'SinVencer'
            DataType = datCurrency
          end
          item
            Name = 'Vence1'
            DataType = datCurrency
          end
          item
            Name = 'Vence2'
            DataType = datCurrency
          end
          item
            Name = 'Vence3'
            DataType = datCurrency
          end
          item
            Name = 'Vence4'
            DataType = datCurrency
          end
          item
            Name = 'MasVence4'
            DataType = datCurrency
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
            Connection = 'Flotillas'
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
        Params = <>
        Statements = <
          item
            Connection = 'Flotillas'
            TargetTable = 'dbo.Banco'
            SQL = 
              'SELECT '#10'    BancoID, Nombre, CuentaContable'#10'  FROM'#10'    dbo.Banco' +
              #10#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'BancoID'
                TableField = 'BancoID'
              end
              item
                DatasetField = 'Nombre'
                TableField = 'Nombre'
              end
              item
                DatasetField = 'CuentaContable'
                TableField = 'CuentaContable'
              end>
          end>
        Name = 'dbo Banco'
        Fields = <
          item
            Name = 'BancoID'
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
            Name = 'CuentaContable'
            DataType = datString
            Size = 50
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'Flotillas'
            TargetTable = 'dbo.Producto'
            SQL = 
              'SELECT '#10'    ProductoID, Descripcion, Precio, PorcentajeImpuesto,' +
              ' IEPS'#10'  FROM'#10'    dbo.Producto'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'ProductoID'
                TableField = 'ProductoID'
              end
              item
                DatasetField = 'Descripcion'
                TableField = 'Descripcion'
              end
              item
                DatasetField = 'Precio'
                TableField = 'Precio'
              end
              item
                DatasetField = 'PorcentajeImpuesto'
                TableField = 'PorcentajeImpuesto'
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
            InPrimaryKey = True
          end
          item
            Name = 'Descripcion'
            DataType = datString
            Size = 80
            Required = True
          end
          item
            Name = 'Precio'
            DataType = datFloat
            Required = True
          end
          item
            Name = 'PorcentajeImpuesto'
            DataType = datFloat
            Required = True
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
            Connection = 'Flotillas'
            TargetTable = 'dbo.Cliente'
            SQL = 
              'SELECT '#10'    ClienteID, Nombre, RazonSocial, Domicilio, Grupo, Co' +
              'lonia, '#10'    CodigoPostal, Ciudad, Telefono, RFC, CuentaContable,' +
              ' '#10'    PlazoPago, Estatus, FechaIngreso, NIP, FechaBaja, LimiteCr' +
              'edito, '#10'    Deposito, CambioCredito, CambioCreditoAnterior, Ulti' +
              'moPago, '#10'    DiaCorteSemana, ClienteNuevo, Tasa, TarjetaID, Form' +
              'aPagoID,'#10'    GrupoFacturarID, VendedorID, GasolineroID, FormaCom' +
              'praID, ClasificacionID,'#10'    FacturaConsumoCupon, NoExterior, Loc' +
              'alidad, Municipio, Estado, Pais, email,'#10'    FechaAniversario'#10'  F' +
              'ROM'#10'    dbo.Cliente'#10#10'order by ClienteID'#10
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
                DatasetField = 'RazonSocial'
                TableField = 'RazonSocial'
              end
              item
                DatasetField = 'Domicilio'
                TableField = 'Domicilio'
              end
              item
                DatasetField = 'Grupo'
                TableField = 'Grupo'
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
                DatasetField = 'Ciudad'
                TableField = 'Ciudad'
              end
              item
                DatasetField = 'Telefono'
                TableField = 'Telefono'
              end
              item
                DatasetField = 'RFC'
                TableField = 'RFC'
              end
              item
                DatasetField = 'CuentaContable'
                TableField = 'CuentaContable'
              end
              item
                DatasetField = 'PlazoPago'
                TableField = 'PlazoPago'
              end
              item
                DatasetField = 'Estatus'
                TableField = 'Estatus'
              end
              item
                DatasetField = 'FechaIngreso'
                TableField = 'FechaIngreso'
              end
              item
                DatasetField = 'NIP'
                TableField = 'NIP'
              end
              item
                DatasetField = 'FechaBaja'
                TableField = 'FechaBaja'
              end
              item
                DatasetField = 'LimiteCredito'
                TableField = 'LimiteCredito'
              end
              item
                DatasetField = 'Deposito'
                TableField = 'Deposito'
              end
              item
                DatasetField = 'CambioCredito'
                TableField = 'CambioCredito'
              end
              item
                DatasetField = 'CambioCreditoAnterior'
                TableField = 'CambioCreditoAnterior'
              end
              item
                DatasetField = 'UltimoPago'
                TableField = 'UltimoPago'
              end
              item
                DatasetField = 'DiaCorteSemana'
                TableField = 'DiaCorteSemana'
              end
              item
                DatasetField = 'ClienteNuevo'
                TableField = 'ClienteNuevo'
              end
              item
                DatasetField = 'TarjetaID'
                TableField = 'TarjetaID'
              end
              item
                DatasetField = 'FormaPagoID'
                TableField = 'FormaPagoID'
              end
              item
                DatasetField = 'GrupoFacturarID'
                TableField = 'GrupoFacturarID'
              end
              item
                DatasetField = 'VendedorID'
                TableField = 'VendedorID'
              end
              item
                DatasetField = 'GasolineroID'
                TableField = 'GasolineroID'
              end
              item
                DatasetField = 'FormaCompraID'
                TableField = 'FormaCompraID'
              end
              item
                DatasetField = 'ClasificacionID'
                TableField = 'ClasificacionID'
              end
              item
                DatasetField = 'Tasa'
                TableField = 'Tasa'
              end
              item
                DatasetField = 'FacturaConsumoCupon'
                TableField = 'FacturaConsumoCupon'
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
                DatasetField = 'Pais'
                TableField = 'Pais'
              end
              item
                DatasetField = 'email'
                TableField = 'email'
              end
              item
                DatasetField = 'Estado'
                TableField = 'Estado'
              end
              item
                DatasetField = 'FechaAniversario'
                TableField = 'FechaAniversario'
              end>
          end>
        Name = 'dbo Cliente'
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
            Name = 'RazonSocial'
            DataType = datString
            Size = 70
          end
          item
            Name = 'Domicilio'
            DataType = datString
            Size = 90
          end
          item
            Name = 'Grupo'
            DataType = datString
            Size = 50
          end
          item
            Name = 'Colonia'
            DataType = datString
            Size = 40
          end
          item
            Name = 'CodigoPostal'
            DataType = datString
            Size = 10
          end
          item
            Name = 'Ciudad'
            DataType = datString
            Size = 30
          end
          item
            Name = 'Telefono'
            DataType = datString
            Size = 20
          end
          item
            Name = 'RFC'
            DataType = datString
            Size = 20
          end
          item
            Name = 'CuentaContable'
            DataType = datString
            Size = 20
          end
          item
            Name = 'PlazoPago'
            DataType = datInteger
          end
          item
            Name = 'Estatus'
            DataType = datString
            Size = 1
          end
          item
            Name = 'FechaIngreso'
            DataType = datDateTime
          end
          item
            Name = 'NIP'
            DataType = datString
            Size = 8
          end
          item
            Name = 'FechaBaja'
            DataType = datDateTime
          end
          item
            Name = 'LimiteCredito'
            DataType = datFloat
          end
          item
            Name = 'Deposito'
            DataType = datFloat
          end
          item
            Name = 'CambioCredito'
            DataType = datDateTime
          end
          item
            Name = 'CambioCreditoAnterior'
            DataType = datDateTime
          end
          item
            Name = 'UltimoPago'
            DataType = datDateTime
          end
          item
            Name = 'DiaCorteSemana'
            DataType = datInteger
          end
          item
            Name = 'ClienteNuevo'
            DataType = datBoolean
          end
          item
            Name = 'Tasa'
            DataType = datFloat
          end
          item
            Name = 'TarjetaID'
            DataType = datInteger
          end
          item
            Name = 'FormaPagoID'
            DataType = datInteger
          end
          item
            Name = 'GrupoFacturarID'
            DataType = datInteger
          end
          item
            Name = 'VendedorID'
            DataType = datInteger
          end
          item
            Name = 'GasolineroID'
            DataType = datInteger
          end
          item
            Name = 'FormaCompraID'
            DataType = datInteger
          end
          item
            Name = 'ClasificacionID'
            DataType = datInteger
          end
          item
            Name = 'FacturaConsumoCupon'
            DataType = datBoolean
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
            Name = 'email'
            DataType = datString
            Size = 100
          end
          item
            Name = 'FechaAniversario'
            DataType = datDateTime
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'Flotillas'
            TargetTable = 'dbo.Opcion'
            SQL = 
              'SELECT '#10'    OpcionID, Descripcion, ImageIndex, PadreID, Orden'#10'  ' +
              'FROM'#10'    dbo.Opcion'#10'  ORDER BY PadreID, Orden'#10
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
            InPrimaryKey = True
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
            Name = 'BARRAS'
            Value = '54545'
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            Name = 'Flotillas'
            SQL = 
              'SELECT CLIENTEID FROM CUPON'#10'WHERE BARRAS = :BARRAS'#10'ORDER BY CUPO' +
              'NID DESC'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'CLIENTEID'
                TableField = 'CLIENTEID'
              end>
          end>
        Name = 'spClienteCupon'
        Fields = <
          item
            Name = 'CLIENTEID'
            DataType = datInteger
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'Flotillas'
            TargetTable = 'dbo.Acceso'
            SQL = 'SELECT '#10'    UsuarioID, OpcionID'#10'  FROM'#10'    dbo.Acceso'
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
            InPrimaryKey = True
          end
          item
            Name = 'OpcionID'
            DataType = datInteger
            Required = True
            InPrimaryKey = True
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            Name = 'Flotillas'
            SQL = 
              'SELECT '#10'    EstacionID, Nombre, Host'#10'  FROM'#10'    dbo.Estacion'#10'  W' +
              'HERE Host <> '#39#39#10'  order By estacionID'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'EstacionID'
                TableField = 'EstacionID'
              end
              item
                DatasetField = 'Nombre'
                TableField = 'Nombre'
              end
              item
                DatasetField = 'Host'
                TableField = 'Host'
              end>
          end>
        Name = 'spHostEstacion'
        Fields = <
          item
            Name = 'EstacionID'
            DataType = datInteger
          end
          item
            Name = 'Nombre'
            DataType = datString
            Size = 30
          end
          item
            Name = 'Host'
            DataType = datString
            Size = 50
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'Flotillas'
            TargetTable = 'dbo.Estacion'
            SQL = 
              'SELECT '#10'    EstacionID, Nombre, RazonSocial, RFC, ClavePemex, Es' +
              'tatus, '#10'    CuentaContable, CuentaIVANoCobrado, CuentaIVACobrado' +
              ', '#10'    CuentaVentas, IVA, GasolineroID'#10'  FROM'#10'    dbo.Estacion'#10'o' +
              'rder by estacionid'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'EstacionID'
                TableField = 'EstacionID'
              end
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
                DatasetField = 'ClavePemex'
                TableField = 'ClavePemex'
              end
              item
                DatasetField = 'Estatus'
                TableField = 'Estatus'
              end
              item
                DatasetField = 'GasolineroID'
                TableField = 'GasolineroID'
              end
              item
                DatasetField = 'CuentaContable'
                TableField = 'CuentaContable'
              end
              item
                DatasetField = 'CuentaIVANoCobrado'
                TableField = 'CuentaIVANoCobrado'
              end
              item
                DatasetField = 'CuentaIVACobrado'
                TableField = 'CuentaIVACobrado'
              end
              item
                DatasetField = 'CuentaVentas'
                TableField = 'CuentaVentas'
              end
              item
                DatasetField = 'IVA'
                TableField = 'IVA'
              end>
          end>
        Name = 'dbo Estacion'
        Fields = <
          item
            Name = 'EstacionID'
            DataType = datInteger
            Required = True
            InPrimaryKey = True
          end
          item
            Name = 'Nombre'
            DataType = datString
            Size = 30
            Required = True
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
            Name = 'ClavePemex'
            DataType = datString
            Size = 15
          end
          item
            Name = 'Estatus'
            DataType = datString
            Size = 1
            Required = True
          end
          item
            Name = 'CuentaContable'
            DataType = datString
            Size = 50
          end
          item
            Name = 'CuentaIVANoCobrado'
            DataType = datString
            Size = 50
          end
          item
            Name = 'CuentaIVACobrado'
            DataType = datString
            Size = 50
          end
          item
            Name = 'CuentaVentas'
            DataType = datString
            Size = 50
          end
          item
            Name = 'IVA'
            DataType = datFloat
          end
          item
            Name = 'GasolineroID'
            DataType = datInteger
            Required = True
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'Flotillas'
            TargetTable = 'dbo.Gasolinero'
            SQL = 
              'SELECT'#10'    GasolineroID, Nombre, Domicilio, RFC, IVA, NoExterior' +
              ','#10'    Localidad, Municipio, Estado, Pais, noAprobacion, Colonia,' +
              #10'    CodigoPostal, NoCertificado, ArchivoClavePrivada, ArchivoCe' +
              'rtificado,'#10'    ClavePriv, Certificado, PasswordFCTElect, Sucursa' +
              'l, SucursalDE,'#10'    Telefono1, Telefono2, AnoAprobacion, FolioIni' +
              'cial, FolioFinal'#10'  FROM'#10'    dbo.Gasolinero'#10'  WHERE {Where}'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'GasolineroID'
                TableField = 'GasolineroID'
              end
              item
                DatasetField = 'Nombre'
                TableField = 'Nombre'
              end
              item
                DatasetField = 'Domicilio'
                TableField = 'Domicilio'
              end
              item
                DatasetField = 'RFC'
                TableField = 'RFC'
              end
              item
                DatasetField = 'IVA'
                TableField = 'IVA'
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
              end>
          end>
        Name = 'dbo Gasolinero'
        Fields = <
          item
            Name = 'GasolineroID'
            DataType = datInteger
            Required = True
            InPrimaryKey = True
          end
          item
            Name = 'Nombre'
            DataType = datString
            Size = 70
            Required = True
          end
          item
            Name = 'Domicilio'
            DataType = datString
            Size = 100
            Required = True
          end
          item
            Name = 'RFC'
            DataType = datString
            Size = 20
            Required = True
          end
          item
            Name = 'IVA'
            DataType = datFloat
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
            Connection = 'Flotillas'
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
            Connection = 'Flotillas'
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
            Connection = 'Flotillas'
            TargetTable = 'dbo.Autorizacion'
            SQL = 
              'SELECT     Autorizacion.AutorizacionID, Autorizacion.ClienteID, ' +
              'Autorizacion.Tipo, Autorizacion.Fecha, Autorizacion.Importe,'#10'   ' +
              '                   Autorizacion.Cantidad, Autorizacion.ImporteCa' +
              'ntidad, Autorizacion.PosicionCarga, Autorizacion.EstacionID, Aut' +
              'orizacion.VehiculoID'#10'FROM         Autorizacion'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'AutorizacionID'
                TableField = 'AutorizacionID'
              end
              item
                DatasetField = 'Fecha'
                TableField = 'Fecha'
              end
              item
                DatasetField = 'Importe'
                TableField = 'Importe'
              end
              item
                DatasetField = 'Cantidad'
                TableField = 'Cantidad'
              end
              item
                DatasetField = 'ImporteCantidad'
                TableField = 'ImporteCantidad'
              end
              item
                DatasetField = 'PosicionCarga'
                TableField = 'PosicionCarga'
              end
              item
                DatasetField = 'EstacionID'
                TableField = 'EstacionID'
              end
              item
                DatasetField = 'VehiculoID'
                TableField = 'VehiculoID'
              end
              item
                DatasetField = 'ClienteID'
                TableField = 'ClienteID'
              end
              item
                DatasetField = 'Tipo'
                TableField = 'Tipo'
              end>
          end>
        Name = 'cdsAutorizacion'
        Fields = <
          item
            Name = 'AutorizacionID'
            DataType = datInteger
          end
          item
            Name = 'ClienteID'
            DataType = datInteger
          end
          item
            Name = 'Tipo'
            DataType = datInteger
          end
          item
            Name = 'Fecha'
            DataType = datDateTime
          end
          item
            Name = 'Importe'
            DataType = datFloat
          end
          item
            Name = 'Cantidad'
            DataType = datFloat
          end
          item
            Name = 'ImporteCantidad'
            DataType = datString
            Size = 1
          end
          item
            Name = 'PosicionCarga'
            DataType = datInteger
          end
          item
            Name = 'EstacionID'
            DataType = datInteger
          end
          item
            Name = 'VehiculoID'
            DataType = datInteger
          end>
      end
      item
        Params = <
          item
            Name = 'ClienteID'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            TargetTable = 'dbo.Contacto'
            SQL = 
              'SELECT '#10'    ContactoID, Nombre, Empresa, Puesto, Departamento, '#10 +
              '    FechaNacimiento, TelefonoOficina, Celular, email, email2, '#10' ' +
              '   Observaciones, MensajesCelular, MensajesEmail, TipoMensajes, ' +
              #10'    ClienteID'#10'  FROM'#10'    dbo.Contacto'#10'  WHERE'#10'    ClienteID = :' +
              'ClienteID'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'ContactoID'
                TableField = 'ContactoID'
              end
              item
                DatasetField = 'Nombre'
                TableField = 'Nombre'
              end
              item
                DatasetField = 'Empresa'
                TableField = 'Empresa'
              end
              item
                DatasetField = 'Puesto'
                TableField = 'Puesto'
              end
              item
                DatasetField = 'Departamento'
                TableField = 'Departamento'
              end
              item
                DatasetField = 'FechaNacimiento'
                TableField = 'FechaNacimiento'
              end
              item
                DatasetField = 'TelefonoOficina'
                TableField = 'TelefonoOficina'
              end
              item
                DatasetField = 'Celular'
                TableField = 'Celular'
              end
              item
                DatasetField = 'email'
                TableField = 'email'
              end
              item
                DatasetField = 'email2'
                TableField = 'email2'
              end
              item
                DatasetField = 'Observaciones'
                TableField = 'Observaciones'
              end
              item
                DatasetField = 'MensajesCelular'
                TableField = 'MensajesCelular'
              end
              item
                DatasetField = 'MensajesEmail'
                TableField = 'MensajesEmail'
              end
              item
                DatasetField = 'TipoMensajes'
                TableField = 'TipoMensajes'
              end
              item
                DatasetField = 'ClienteID'
                TableField = 'ClienteID'
              end>
          end>
        Name = 'dbo Contacto'
        Fields = <
          item
            Name = 'ContactoID'
            DataType = datInteger
          end
          item
            Name = 'Nombre'
            DataType = datString
            Size = 80
          end
          item
            Name = 'Empresa'
            DataType = datString
            Size = 80
          end
          item
            Name = 'Puesto'
            DataType = datString
            Size = 50
          end
          item
            Name = 'Departamento'
            DataType = datString
            Size = 50
          end
          item
            Name = 'FechaNacimiento'
            DataType = datDateTime
          end
          item
            Name = 'TelefonoOficina'
            DataType = datString
            Size = 25
          end
          item
            Name = 'Celular'
            DataType = datString
            Size = 25
          end
          item
            Name = 'email'
            DataType = datString
            Size = 70
          end
          item
            Name = 'email2'
            DataType = datString
            Size = 70
          end
          item
            Name = 'Observaciones'
            DataType = datMemo
          end
          item
            Name = 'MensajesCelular'
            DataType = datBoolean
          end
          item
            Name = 'MensajesEmail'
            DataType = datBoolean
          end
          item
            Name = 'TipoMensajes'
            DataType = datInteger
          end
          item
            Name = 'ClienteID'
            DataType = datInteger
          end>
      end
      item
        Params = <
          item
            Name = 'ClienteID'
            Value = '1'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            SQL = 
              'SELECT'#10'    VehiculoID, DigitoSeguridad, Nombre, Identificacion,C' +
              'lienteID'#10'  FROM'#10'    dbo.Vehiculo'#10'  WHERE'#10'    ClienteID = :Client' +
              'eID'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'VehiculoID'
                TableField = 'VehiculoID'
              end
              item
                DatasetField = 'DigitoSeguridad'
                TableField = 'DigitoSeguridad'
              end
              item
                DatasetField = 'Nombre'
                TableField = 'Nombre'
              end
              item
                DatasetField = 'Identificacion'
                TableField = 'Identificacion'
              end
              item
                DatasetField = 'ClienteID'
                TableField = 'ClienteID'
              end>
          end>
        Name = 'dbo VehiCheck'
        Fields = <
          item
            Name = 'VehiculoID'
            DataType = datInteger
            InPrimaryKey = True
          end
          item
            Name = 'DigitoSeguridad'
            DataType = datInteger
          end
          item
            Name = 'Nombre'
            DataType = datString
            Size = 30
          end
          item
            Name = 'Identificacion'
            DataType = datString
            Size = 30
          end
          item
            Name = 'ClienteID'
            DataType = datInteger
          end>
      end
      item
        Params = <
          item
            Name = 'ClienteID'
            Value = '1'
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            TargetTable = 'dbo.Vehiculo'
            SQL = 
              'SELECT '#10'    VehiculoID, DigitoSeguridad, Nombre, Identificacion,' +
              ' '#10'    Departamento, CuentaContable, CentroCostos, NumeroEconomic' +
              'o, '#10'    NIP, Estatus, CargasMaximas, Odometro, Firma, Placas, '#10' ' +
              '   FechaAlta, FechaExpira, FechaBaja, FechaCancelacion, '#10'    Fec' +
              'haBloqueada, FechaInactiva, Mensaje, LimiteLTTurno, '#10'    LimiteL' +
              'TDia, LimiteLTSemana, LimiteLTMes, LimiteMNTurno, '#10'    LimiteMND' +
              'ia, LimiteMNSemana, LimiteMNMes, ActualLTTurno, '#10'    ActualLTDia' +
              ', ActualLTSemana, ActualLTMes, ActualMNTurno, '#10'    ActualMNDia, ' +
              'ActualMNSemana, ActualMNMes, ActualCargas, '#10'    Clasificacion, G' +
              'enerada, Lunes, Martes, Miercoles, '#10'    Jueves, Viernes, Sabado,' +
              ' Domingo, Productoautorizado, ClienteID, GasolineroID,'#10'    MES1,' +
              ' MES2, MONTO'#10'  FROM'#10'    dbo.Vehiculo'#10'  WHERE'#10'    ClienteID = :Cl' +
              'ienteID'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'VehiculoID'
                TableField = 'VehiculoID'
              end
              item
                DatasetField = 'DigitoSeguridad'
                TableField = 'DigitoSeguridad'
              end
              item
                DatasetField = 'Nombre'
                TableField = 'Nombre'
              end
              item
                DatasetField = 'Identificacion'
                TableField = 'Identificacion'
              end
              item
                DatasetField = 'Departamento'
                TableField = 'Departamento'
              end
              item
                DatasetField = 'CuentaContable'
                TableField = 'CuentaContable'
              end
              item
                DatasetField = 'CentroCostos'
                TableField = 'CentroCostos'
              end
              item
                DatasetField = 'NumeroEconomico'
                TableField = 'NumeroEconomico'
              end
              item
                DatasetField = 'NIP'
                TableField = 'NIP'
              end
              item
                DatasetField = 'Estatus'
                TableField = 'Estatus'
              end
              item
                DatasetField = 'CargasMaximas'
                TableField = 'CargasMaximas'
              end
              item
                DatasetField = 'Odometro'
                TableField = 'Odometro'
              end
              item
                DatasetField = 'Firma'
                TableField = 'Firma'
              end
              item
                DatasetField = 'Placas'
                TableField = 'Placas'
              end
              item
                DatasetField = 'FechaAlta'
                TableField = 'FechaAlta'
              end
              item
                DatasetField = 'FechaExpira'
                TableField = 'FechaExpira'
              end
              item
                DatasetField = 'FechaBaja'
                TableField = 'FechaBaja'
              end
              item
                DatasetField = 'FechaCancelacion'
                TableField = 'FechaCancelacion'
              end
              item
                DatasetField = 'FechaBloqueada'
                TableField = 'FechaBloqueada'
              end
              item
                DatasetField = 'FechaInactiva'
                TableField = 'FechaInactiva'
              end
              item
                DatasetField = 'Mensaje'
                TableField = 'Mensaje'
              end
              item
                DatasetField = 'LimiteLTTurno'
                TableField = 'LimiteLTTurno'
              end
              item
                DatasetField = 'LimiteLTDia'
                TableField = 'LimiteLTDia'
              end
              item
                DatasetField = 'LimiteLTSemana'
                TableField = 'LimiteLTSemana'
              end
              item
                DatasetField = 'LimiteLTMes'
                TableField = 'LimiteLTMes'
              end
              item
                DatasetField = 'LimiteMNTurno'
                TableField = 'LimiteMNTurno'
              end
              item
                DatasetField = 'LimiteMNDia'
                TableField = 'LimiteMNDia'
              end
              item
                DatasetField = 'LimiteMNSemana'
                TableField = 'LimiteMNSemana'
              end
              item
                DatasetField = 'LimiteMNMes'
                TableField = 'LimiteMNMes'
              end
              item
                DatasetField = 'ActualLTTurno'
                TableField = 'ActualLTTurno'
              end
              item
                DatasetField = 'ActualLTDia'
                TableField = 'ActualLTDia'
              end
              item
                DatasetField = 'ActualLTSemana'
                TableField = 'ActualLTSemana'
              end
              item
                DatasetField = 'ActualLTMes'
                TableField = 'ActualLTMes'
              end
              item
                DatasetField = 'ActualMNTurno'
                TableField = 'ActualMNTurno'
              end
              item
                DatasetField = 'ActualMNDia'
                TableField = 'ActualMNDia'
              end
              item
                DatasetField = 'ActualMNSemana'
                TableField = 'ActualMNSemana'
              end
              item
                DatasetField = 'ActualMNMes'
                TableField = 'ActualMNMes'
              end
              item
                DatasetField = 'ActualCargas'
                TableField = 'ActualCargas'
              end
              item
                DatasetField = 'Clasificacion'
                TableField = 'Clasificacion'
              end
              item
                DatasetField = 'Generada'
                TableField = 'Generada'
              end
              item
                DatasetField = 'Lunes'
                TableField = 'Lunes'
              end
              item
                DatasetField = 'Martes'
                TableField = 'Martes'
              end
              item
                DatasetField = 'Miercoles'
                TableField = 'Miercoles'
              end
              item
                DatasetField = 'Jueves'
                TableField = 'Jueves'
              end
              item
                DatasetField = 'Viernes'
                TableField = 'Viernes'
              end
              item
                DatasetField = 'Sabado'
                TableField = 'Sabado'
              end
              item
                DatasetField = 'Domingo'
                TableField = 'Domingo'
              end
              item
                DatasetField = 'Productoautorizado'
                TableField = 'Productoautorizado'
              end
              item
                DatasetField = 'ClienteID'
                TableField = 'ClienteID'
              end
              item
                DatasetField = 'GasolineroID'
                TableField = 'GasolineroID'
              end
              item
                DatasetField = 'MES1'
                TableField = 'MES1'
              end
              item
                DatasetField = 'MES2'
                TableField = 'MES2'
              end
              item
                DatasetField = 'MONTO'
                TableField = 'MONTO'
              end>
          end>
        Name = 'dbo Vehiculo'
        Fields = <
          item
            Name = 'VehiculoID'
            DataType = datInteger
          end
          item
            Name = 'DigitoSeguridad'
            DataType = datInteger
          end
          item
            Name = 'Nombre'
            DataType = datString
            Size = 30
          end
          item
            Name = 'Identificacion'
            DataType = datString
            Size = 30
          end
          item
            Name = 'Departamento'
            DataType = datString
            Size = 20
          end
          item
            Name = 'CuentaContable'
            DataType = datString
            Size = 20
          end
          item
            Name = 'CentroCostos'
            DataType = datString
            Size = 15
          end
          item
            Name = 'NumeroEconomico'
            DataType = datString
            Size = 15
          end
          item
            Name = 'NIP'
            DataType = datString
            Size = 8
          end
          item
            Name = 'Estatus'
            DataType = datString
            Size = 1
          end
          item
            Name = 'CargasMaximas'
            DataType = datInteger
          end
          item
            Name = 'Odometro'
            DataType = datBoolean
          end
          item
            Name = 'Firma'
            DataType = datBoolean
          end
          item
            Name = 'Placas'
            DataType = datBoolean
          end
          item
            Name = 'FechaAlta'
            DataType = datDateTime
          end
          item
            Name = 'FechaExpira'
            DataType = datDateTime
          end
          item
            Name = 'FechaBaja'
            DataType = datDateTime
          end
          item
            Name = 'FechaCancelacion'
            DataType = datDateTime
          end
          item
            Name = 'FechaBloqueada'
            DataType = datDateTime
          end
          item
            Name = 'FechaInactiva'
            DataType = datDateTime
          end
          item
            Name = 'Mensaje'
            DataType = datString
            Size = 50
          end
          item
            Name = 'LimiteLTTurno'
            DataType = datFloat
          end
          item
            Name = 'LimiteLTDia'
            DataType = datFloat
          end
          item
            Name = 'LimiteLTSemana'
            DataType = datFloat
          end
          item
            Name = 'LimiteLTMes'
            DataType = datFloat
          end
          item
            Name = 'LimiteMNTurno'
            DataType = datFloat
          end
          item
            Name = 'LimiteMNDia'
            DataType = datFloat
          end
          item
            Name = 'LimiteMNSemana'
            DataType = datFloat
          end
          item
            Name = 'LimiteMNMes'
            DataType = datFloat
          end
          item
            Name = 'ActualLTTurno'
            DataType = datFloat
          end
          item
            Name = 'ActualLTDia'
            DataType = datFloat
          end
          item
            Name = 'ActualLTSemana'
            DataType = datFloat
          end
          item
            Name = 'ActualLTMes'
            DataType = datFloat
          end
          item
            Name = 'ActualMNTurno'
            DataType = datFloat
          end
          item
            Name = 'ActualMNDia'
            DataType = datFloat
          end
          item
            Name = 'ActualMNSemana'
            DataType = datFloat
          end
          item
            Name = 'ActualMNMes'
            DataType = datFloat
          end
          item
            Name = 'ActualCargas'
            DataType = datInteger
          end
          item
            Name = 'Clasificacion'
            DataType = datInteger
          end
          item
            Name = 'Generada'
            DataType = datBoolean
          end
          item
            Name = 'Lunes'
            DataType = datString
            Size = 24
          end
          item
            Name = 'Martes'
            DataType = datString
            Size = 24
          end
          item
            Name = 'Miercoles'
            DataType = datString
            Size = 24
          end
          item
            Name = 'Jueves'
            DataType = datString
            Size = 24
          end
          item
            Name = 'Viernes'
            DataType = datString
            Size = 24
          end
          item
            Name = 'Sabado'
            DataType = datString
            Size = 24
          end
          item
            Name = 'Domingo'
            DataType = datString
            Size = 24
          end
          item
            Name = 'Productoautorizado'
            DataType = datWideString
            Size = 10
          end
          item
            Name = 'ClienteID'
            DataType = datInteger
          end
          item
            Name = 'GasolineroID'
            DataType = datInteger
          end
          item
            Name = 'MES1'
            DataType = datDateTime
          end
          item
            Name = 'MES2'
            DataType = datDateTime
          end
          item
            Name = 'MONTO'
            DataType = datFloat
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'Flotillas'
            TargetTable = 'dbo.SaldoDocumento'
            SQL = 
              'SELECT '#10'    SaldodocumentoID, Fecha, FechaVencimiento, Cargo, Ab' +
              'ono, '#10'    Referencia, ClienteID, MovimientoID, ReciboID, BancoID' +
              #10'  FROM'#10'    dbo.SaldoDocumento'#10'  WHERE (2 = 1)'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'SaldodocumentoID'
                TableField = 'SaldodocumentoID'
              end
              item
                DatasetField = 'Fecha'
                TableField = 'Fecha'
              end
              item
                DatasetField = 'FechaVencimiento'
                TableField = 'FechaVencimiento'
              end
              item
                DatasetField = 'Cargo'
                TableField = 'Cargo'
              end
              item
                DatasetField = 'Abono'
                TableField = 'Abono'
              end
              item
                DatasetField = 'Referencia'
                TableField = 'Referencia'
              end
              item
                DatasetField = 'ClienteID'
                TableField = 'ClienteID'
              end
              item
                DatasetField = 'MovimientoID'
                TableField = 'MovimientoID'
              end
              item
                DatasetField = 'ReciboID'
                TableField = 'ReciboID'
              end
              item
                DatasetField = 'BancoID'
                TableField = 'BancoID'
              end>
          end>
        Name = 'dbo SaldoDocumento'
        Fields = <
          item
            Name = 'SaldodocumentoID'
            DataType = datInteger
            Required = True
            InPrimaryKey = True
          end
          item
            Name = 'Fecha'
            DataType = datDateTime
            Required = True
          end
          item
            Name = 'FechaVencimiento'
            DataType = datDateTime
            Required = True
          end
          item
            Name = 'Cargo'
            DataType = datFloat
            Required = True
          end
          item
            Name = 'Abono'
            DataType = datFloat
            Required = True
          end
          item
            Name = 'Referencia'
            DataType = datString
            Size = 50
            Required = True
          end
          item
            Name = 'ClienteID'
            DataType = datInteger
            Required = True
          end
          item
            Name = 'MovimientoID'
            DataType = datInteger
            Required = True
          end
          item
            Name = 'ReciboID'
            DataType = datInteger
          end
          item
            Name = 'BancoID'
            DataType = datInteger
          end>
      end
      item
        Params = <
          item
            Name = 'Recibo'
            Value = '1'
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            TargetTable = 'dbo.Recibo'
            SQL = 
              'SELECT '#10'    ReciboID, Folio, FechaMovimiento, Ejercicio, Periodo' +
              ', '#10'    Cheque, Referencia, Importe, CuentaContableCliente, '#10'    ' +
              'FechaCaptura, FechaAplicacion, UsuarioID, ClienteID, '#10'    Movimi' +
              'entoID, BancoID, EstacionID'#10'  FROM'#10'    dbo.Recibo'#10'WHERE (ReciboI' +
              'D = :Recibo)'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'ReciboID'
                TableField = 'ReciboID'
              end
              item
                DatasetField = 'Folio'
                TableField = 'Folio'
              end
              item
                DatasetField = 'FechaMovimiento'
                TableField = 'FechaMovimiento'
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
                DatasetField = 'Cheque'
                TableField = 'Cheque'
              end
              item
                DatasetField = 'Referencia'
                TableField = 'Referencia'
              end
              item
                DatasetField = 'Importe'
                TableField = 'Importe'
              end
              item
                DatasetField = 'CuentaContableCliente'
                TableField = 'CuentaContableCliente'
              end
              item
                DatasetField = 'FechaCaptura'
                TableField = 'FechaCaptura'
              end
              item
                DatasetField = 'FechaAplicacion'
                TableField = 'FechaAplicacion'
              end
              item
                DatasetField = 'UsuarioID'
                TableField = 'UsuarioID'
              end
              item
                DatasetField = 'ClienteID'
                TableField = 'ClienteID'
              end
              item
                DatasetField = 'MovimientoID'
                TableField = 'MovimientoID'
              end
              item
                DatasetField = 'BancoID'
                TableField = 'BancoID'
              end
              item
                DatasetField = 'EstacionID'
                TableField = 'EstacionID'
              end>
          end>
        Name = 'dbo Recibo'
        Fields = <
          item
            Name = 'ReciboID'
            DataType = datInteger
            InPrimaryKey = True
          end
          item
            Name = 'Folio'
            DataType = datInteger
          end
          item
            Name = 'FechaMovimiento'
            DataType = datDateTime
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
            Name = 'Cheque'
            DataType = datString
            Size = 50
          end
          item
            Name = 'Referencia'
            DataType = datString
            Size = 50
          end
          item
            Name = 'Importe'
            DataType = datFloat
          end
          item
            Name = 'CuentaContableCliente'
            DataType = datString
            Size = 15
          end
          item
            Name = 'FechaCaptura'
            DataType = datDateTime
          end
          item
            Name = 'FechaAplicacion'
            DataType = datDateTime
          end
          item
            Name = 'UsuarioID'
            DataType = datInteger
          end
          item
            Name = 'ClienteID'
            DataType = datInteger
          end
          item
            Name = 'MovimientoID'
            DataType = datInteger
          end
          item
            Name = 'BancoID'
            DataType = datInteger
          end
          item
            Name = 'EstacionID'
            DataType = datInteger
          end>
      end
      item
        Params = <
          item
            Name = 'Movimiento'
            Value = '1'
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            TargetTable = 'dbo.Movimiento'
            SQL = 
              'SELECT '#10'    MovimientoID, FechaMovimiento, FechaVencimiento, Ref' +
              'erencia, '#10'    Ejercicio, Periodo, CargoAbono, Cargo, Abono, Fech' +
              'aRegistro, '#10'    Origen, AfectaSaldos, TipoMovimientoID, UsuarioI' +
              'D, '#10'    ClienteID'#10'  FROM'#10'    dbo.Movimiento'#10'WHERE (MovimientoID ' +
              '= :Movimiento)'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'MovimientoID'
                TableField = 'MovimientoID'
              end
              item
                DatasetField = 'FechaMovimiento'
                TableField = 'FechaMovimiento'
              end
              item
                DatasetField = 'FechaVencimiento'
                TableField = 'FechaVencimiento'
              end
              item
                DatasetField = 'Referencia'
                TableField = 'Referencia'
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
                DatasetField = 'CargoAbono'
                TableField = 'CargoAbono'
              end
              item
                DatasetField = 'Cargo'
                TableField = 'Cargo'
              end
              item
                DatasetField = 'Abono'
                TableField = 'Abono'
              end
              item
                DatasetField = 'FechaRegistro'
                TableField = 'FechaRegistro'
              end
              item
                DatasetField = 'Origen'
                TableField = 'Origen'
              end
              item
                DatasetField = 'AfectaSaldos'
                TableField = 'AfectaSaldos'
              end
              item
                DatasetField = 'TipoMovimientoID'
                TableField = 'TipoMovimientoID'
              end
              item
                DatasetField = 'UsuarioID'
                TableField = 'UsuarioID'
              end
              item
                DatasetField = 'ClienteID'
                TableField = 'ClienteID'
              end>
          end>
        Name = 'dbo Movimiento'
        Fields = <
          item
            Name = 'MovimientoID'
            DataType = datInteger
            InPrimaryKey = True
          end
          item
            Name = 'FechaMovimiento'
            DataType = datDateTime
          end
          item
            Name = 'FechaVencimiento'
            DataType = datDateTime
          end
          item
            Name = 'Referencia'
            DataType = datString
            Size = 50
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
            Name = 'CargoAbono'
            DataType = datString
            Size = 1
          end
          item
            Name = 'Cargo'
            DataType = datFloat
          end
          item
            Name = 'Abono'
            DataType = datFloat
          end
          item
            Name = 'FechaRegistro'
            DataType = datDateTime
          end
          item
            Name = 'Origen'
            DataType = datString
            Size = 5
          end
          item
            Name = 'AfectaSaldos'
            DataType = datBoolean
          end
          item
            Name = 'TipoMovimientoID'
            DataType = datString
            Size = 10
          end
          item
            Name = 'UsuarioID'
            DataType = datInteger
          end
          item
            Name = 'ClienteID'
            DataType = datInteger
          end>
      end
      item
        Params = <
          item
            Name = 'VehiculoID'
            Value = '2'
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            TargetTable = 'dbo.VehiculoProducto'
            SQL = 
              'SELECT '#10'    ProductoID, VehiculoID'#10'  FROM'#10'    dbo.VehiculoProduc' +
              'to'#10'  WHERE'#10'    dbo.VehiculoProducto.VehiculoID= :VehiculoID'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'ProductoID'
                TableField = 'ProductoID'
              end
              item
                DatasetField = 'VehiculoID'
                TableField = 'VehiculoID'
              end>
          end>
        Name = 'dbo VehiculoProducto'
        Fields = <
          item
            Name = 'ProductoID'
            DataType = datInteger
            InPrimaryKey = True
          end
          item
            Name = 'VehiculoID'
            DataType = datInteger
            InPrimaryKey = True
          end>
      end
      item
        Params = <
          item
            Name = 'VehiculoID'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            TargetTable = 'dbo.Referencia'
            SQL = 
              'SELECT '#10'    VehiculoID, TipoReferenciaID, Referencia'#10'  FROM'#10'    ' +
              'dbo.Referencia'#10'  WHERE'#10'    dbo.Referencia.VehiculoID = :Vehiculo' +
              'ID'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'VehiculoID'
                TableField = 'VehiculoID'
              end
              item
                DatasetField = 'TipoReferenciaID'
                TableField = 'TipoReferenciaID'
              end
              item
                DatasetField = 'Referencia'
                TableField = 'Referencia'
              end>
          end>
        Name = 'dbo Referencia'
        Fields = <
          item
            Name = 'VehiculoID'
            DataType = datInteger
            InPrimaryKey = True
          end
          item
            Name = 'TipoReferenciaID'
            DataType = datInteger
            InPrimaryKey = True
          end
          item
            Name = 'Referencia'
            DataType = datString
            Size = 50
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'Flotillas'
            TargetTable = 'dbo.Factura'
            SQL = 'SELECT DISTINCT'#10'    Serie'#10'  FROM'#10'    dbo.Factura'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'Serie'
                TableField = 'Serie'
              end>
          end>
        Name = 'dbo Serie'
        Fields = <
          item
            Name = 'Serie'
            DataType = datString
            Size = 5
          end>
      end
      item
        Params = <
          item
            Name = 'ProductoID'
            Value = '1'
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            TargetTable = 'dbo.PuntoVentaProducto'
            SQL = 
              'SELECT'#10'    ProductoID, ProductoNombre, Cantidad, Precio'#10'  FROM'#10' ' +
              '   dbo.PuntoVentaProducto'#10'  WHERE'#10'    ProductoID = :ProductoID'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'ProductoID'
                TableField = 'ProductoID'
              end
              item
                DatasetField = 'ProductoNombre'
                TableField = 'ProductoNombre'
              end
              item
                DatasetField = 'Cantidad'
                TableField = 'Cantidad'
              end
              item
                DatasetField = 'Precio'
                TableField = 'Precio'
              end>
          end>
        Name = 'dbo PuntoVentaProducto'
        Fields = <
          item
            Name = 'ProductoID'
            DataType = datInteger
          end
          item
            Name = 'ProductoNombre'
            DataType = datString
            Size = 50
          end
          item
            Name = 'Cantidad'
            DataType = datInteger
          end
          item
            Name = 'Precio'
            DataType = datFloat
          end>
      end
      item
        Params = <
          item
            Name = 'ClienteID'
            Value = '5'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            Name = 'FlotillasNew'
            SQL = 'Select VehiculoID'#10'From Vehiculo'#10'Where ClienteID = :ClienteID'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'VehiculoID'
                TableField = 'VehiculoID'
              end>
          end>
        Name = 'dbo VehiculosParametros'
        Fields = <
          item
            Name = 'VehiculoID'
            DataType = datInteger
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            TargetTable = 'dbo.SaldoEstacion'
            SQL = 
              'SELECT '#10'    SaldoEstacionID, Fecha, Ejercicio, Periodo, Dia, Ref' +
              'erencia, '#10'    Cargo, Abono, FechaRegistro, EstacionID, UsuarioID' +
              #10'  FROM'#10'    dbo.SaldoEstacion'#10'  WHERE (1=2)'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'SaldoEstacionID'
                TableField = 'SaldoEstacionID'
              end
              item
                DatasetField = 'Fecha'
                TableField = 'Fecha'
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
                DatasetField = 'Referencia'
                TableField = 'Referencia'
              end
              item
                DatasetField = 'Cargo'
                TableField = 'Cargo'
              end
              item
                DatasetField = 'Abono'
                TableField = 'Abono'
              end
              item
                DatasetField = 'FechaRegistro'
                TableField = 'FechaRegistro'
              end
              item
                DatasetField = 'EstacionID'
                TableField = 'EstacionID'
              end
              item
                DatasetField = 'UsuarioID'
                TableField = 'UsuarioID'
              end>
          end>
        Name = 'dbo SaldoEstacion'
        Fields = <
          item
            Name = 'SaldoEstacionID'
            DataType = datInteger
            Required = True
            InPrimaryKey = True
          end
          item
            Name = 'Fecha'
            DataType = datDateTime
            Required = True
          end
          item
            Name = 'Ejercicio'
            DataType = datInteger
            Required = True
          end
          item
            Name = 'Periodo'
            DataType = datInteger
            Required = True
          end
          item
            Name = 'Dia'
            DataType = datInteger
            Required = True
          end
          item
            Name = 'Referencia'
            DataType = datString
            Size = 80
            Required = True
          end
          item
            Name = 'Cargo'
            DataType = datFloat
            Required = True
          end
          item
            Name = 'Abono'
            DataType = datFloat
            Required = True
          end
          item
            Name = 'FechaRegistro'
            DataType = datDateTime
            Required = True
          end
          item
            Name = 'EstacionID'
            DataType = datInteger
            Required = True
          end
          item
            Name = 'UsuarioID'
            DataType = datInteger
            Required = True
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            TargetTable = 'dbo.Reporte'
            SQL = 
              'SELECT '#10'    ReporteID, Nombre, Tipo, Parametros, Template, Templ' +
              'ateMedia, '#10'    TemplateBaja, TemplateExportar, SQL1, SQL2, Campo' +
              'Join, '#10'    IdentificadorID, Usuarios'#10'  FROM'#10'    dbo.Reporte'#10'  WH' +
              'ERE {Where}'#10'  ORDER BY ReporteID'#10
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
        Params = <
          item
            Name = 'LoteCuponID'
            Value = '1'
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            TargetTable = 'dbo.Cupon'
            SQL = 
              'SELECT '#10'    CuponID, Referencia, Importe, FechaConsumo, FechaVal' +
              'ido, VolumenImporte,'#10'    Status, Barras, ClienteID, EstacionID, ' +
              'LoteCuponID'#10'  FROM'#10'    dbo.Cupon'#10'  WHERE LoteCuponID = :LoteCupo' +
              'nID'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'CuponID'
                TableField = 'CuponID'
              end
              item
                DatasetField = 'Importe'
                TableField = 'Importe'
              end
              item
                DatasetField = 'FechaConsumo'
                TableField = 'FechaConsumo'
              end
              item
                DatasetField = 'FechaValido'
                TableField = 'FechaValido'
              end
              item
                DatasetField = 'VolumenImporte'
                TableField = 'VolumenImporte'
              end
              item
                DatasetField = 'Status'
                TableField = 'Status'
              end
              item
                DatasetField = 'Barras'
                TableField = 'Barras'
              end
              item
                DatasetField = 'ClienteID'
                TableField = 'ClienteID'
              end
              item
                DatasetField = 'EstacionID'
                TableField = 'EstacionID'
              end
              item
                DatasetField = 'LoteCuponID'
                TableField = 'LoteCuponID'
              end
              item
                DatasetField = 'Referencia'
                TableField = 'Referencia'
              end>
          end>
        Name = 'dbo Cupon'
        Fields = <
          item
            Name = 'CuponID'
            DataType = datInteger
            Required = True
            InPrimaryKey = True
          end
          item
            Name = 'Referencia'
            DataType = datString
            Size = 50
          end
          item
            Name = 'Importe'
            DataType = datFloat
          end
          item
            Name = 'FechaConsumo'
            DataType = datDateTime
          end
          item
            Name = 'FechaValido'
            DataType = datDateTime
          end
          item
            Name = 'VolumenImporte'
            DataType = datString
            Size = 1
          end
          item
            Name = 'Status'
            DataType = datString
            Size = 1
          end
          item
            Name = 'Barras'
            DataType = datString
            Size = 16
          end
          item
            Name = 'ClienteID'
            DataType = datInteger
          end
          item
            Name = 'EstacionID'
            DataType = datInteger
          end
          item
            Name = 'LoteCuponID'
            DataType = datInteger
            Required = True
          end>
      end
      item
        Params = <
          item
            Name = 'LoteCuponID'
            Value = '1'
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            Name = 'Flotillas'
            SQL = 
              'SELECT     LoteCupon.LoteCuponID, LoteCupon.Fecha, LoteCupon.Sta' +
              'tus, LoteCupon.Total, Estacion.EstacionID, Estacion.Nombre AS Es' +
              'tacion, Cliente.ClienteID,'#10'                      Cliente.Nombre ' +
              'AS Cliente, Usuario.UsuarioID, Usuario.Nombre AS Usuario'#10'FROM   ' +
              '      LoteCupon INNER JOIN'#10'                      Estacion ON Lot' +
              'eCupon.EstacionID = Estacion.EstacionID INNER JOIN'#10'             ' +
              '         Cliente ON LoteCupon.ClienteID = Cliente.ClienteID INNE' +
              'R JOIN'#10'                      Usuario ON LoteCupon.UsuarioID = Us' +
              'uario.UsuarioID'#10'WHERE     (LoteCuponID = :LoteCuponID)'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'LoteCuponID'
                TableField = 'LoteCuponID'
              end
              item
                DatasetField = 'Fecha'
                TableField = 'Fecha'
              end
              item
                DatasetField = 'Status'
                TableField = 'Status'
              end
              item
                DatasetField = 'EstacionID'
                TableField = 'EstacionID'
              end
              item
                DatasetField = 'Estacion'
                TableField = 'Estacion'
              end
              item
                DatasetField = 'ClienteID'
                TableField = 'ClienteID'
              end
              item
                DatasetField = 'Cliente'
                TableField = 'Cliente'
              end
              item
                DatasetField = 'UsuarioID'
                TableField = 'UsuarioID'
              end
              item
                DatasetField = 'Usuario'
                TableField = 'Usuario'
              end
              item
                DatasetField = 'Total'
                TableField = 'Total'
              end>
          end>
        Name = 'spBuscaLoteCupon'
        Fields = <
          item
            Name = 'LoteCuponID'
            DataType = datInteger
          end
          item
            Name = 'Fecha'
            DataType = datDateTime
          end
          item
            Name = 'Status'
            DataType = datString
            Size = 1
          end
          item
            Name = 'Total'
            DataType = datFloat
          end
          item
            Name = 'EstacionID'
            DataType = datInteger
          end
          item
            Name = 'Estacion'
            DataType = datString
            Size = 30
          end
          item
            Name = 'ClienteID'
            DataType = datInteger
          end
          item
            Name = 'Cliente'
            DataType = datString
            Size = 70
          end
          item
            Name = 'UsuarioID'
            DataType = datInteger
          end
          item
            Name = 'Usuario'
            DataType = datString
            Size = 70
          end>
      end
      item
        Params = <
          item
            Name = 'LoteCuponID'
            Value = ''
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            TargetTable = 'dbo.LoteCupon'
            SQL = 
              'SELECT '#10'    LoteCuponID, Fecha, Ejercicio, Periodo, Dia, FechaVa' +
              'lido, '#10'    Total, Status, EstacionID, ClienteID, UsuarioID'#10'  FRO' +
              'M'#10'    dbo.LoteCupon'#10'  WHERE LoteCuponID = :LoteCuponID'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'LoteCuponID'
                TableField = 'LoteCuponID'
              end
              item
                DatasetField = 'Fecha'
                TableField = 'Fecha'
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
                DatasetField = 'FechaValido'
                TableField = 'FechaValido'
              end
              item
                DatasetField = 'Total'
                TableField = 'Total'
              end
              item
                DatasetField = 'Status'
                TableField = 'Status'
              end
              item
                DatasetField = 'EstacionID'
                TableField = 'EstacionID'
              end
              item
                DatasetField = 'ClienteID'
                TableField = 'ClienteID'
              end
              item
                DatasetField = 'UsuarioID'
                TableField = 'UsuarioID'
              end>
          end>
        Name = 'dbo LoteCupon'
        Fields = <
          item
            Name = 'LoteCuponID'
            DataType = datInteger
            Required = True
            InPrimaryKey = True
          end
          item
            Name = 'Fecha'
            DataType = datDateTime
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
            Name = 'FechaValido'
            DataType = datDateTime
          end
          item
            Name = 'Total'
            DataType = datFloat
          end
          item
            Name = 'Status'
            DataType = datString
            Size = 1
          end
          item
            Name = 'EstacionID'
            DataType = datInteger
          end
          item
            Name = 'ClienteID'
            DataType = datInteger
          end
          item
            Name = 'UsuarioID'
            DataType = datInteger
          end>
      end
      item
        Params = <
          item
            Name = 'Fecha'
            DataType = datDateTime
            Value = ''
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            TargetTable = 'dbo.Conciliacion'
            SQL = 
              'SELECT '#10'    ConciliacionID, Fecha, Ejercicio, Periodo, Dia, Tota' +
              'l, '#10'    Entregado, Diferencia'#10'  FROM'#10'    dbo.Conciliacion'#10'  WHER' +
              'E'#10'    Fecha = :Fecha'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'ConciliacionID'
                TableField = 'ConciliacionID'
              end
              item
                DatasetField = 'Fecha'
                TableField = 'Fecha'
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
                DatasetField = 'Total'
                TableField = 'Total'
              end
              item
                DatasetField = 'Entregado'
                TableField = 'Entregado'
              end
              item
                DatasetField = 'Diferencia'
                TableField = 'Diferencia'
              end>
          end>
        Name = 'dbo Conciliacion'
        Fields = <
          item
            Name = 'ConciliacionID'
            DataType = datInteger
            Required = True
            InPrimaryKey = True
          end
          item
            Name = 'Fecha'
            DataType = datDateTime
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
            Name = 'Total'
            DataType = datFloat
          end
          item
            Name = 'Entregado'
            DataType = datFloat
          end
          item
            Name = 'Diferencia'
            DataType = datFloat
          end>
      end
      item
        Params = <
          item
            Name = 'ConciliacionID'
            DataType = datInteger
            Value = ''
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            TargetTable = 'dbo.DetalleConciliacion'
            SQL = 
              'SELECT '#10'    DetalleConciliacionID, FechaAplicacion, Tipo, Descri' +
              'pcion, '#10'    Importe, BancoID, ConciliacionID, UsuarioID, ReciboI' +
              'D'#10'  FROM'#10'    dbo.DetalleConciliacion'#10'  WHERE'#10'    ConciliacionID=' +
              ' :ConciliacionID'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'DetalleConciliacionID'
                TableField = 'DetalleConciliacionID'
              end
              item
                DatasetField = 'FechaAplicacion'
                TableField = 'FechaAplicacion'
              end
              item
                DatasetField = 'Tipo'
                TableField = 'Tipo'
              end
              item
                DatasetField = 'Descripcion'
                TableField = 'Descripcion'
              end
              item
                DatasetField = 'Importe'
                TableField = 'Importe'
              end
              item
                DatasetField = 'BancoID'
                TableField = 'BancoID'
              end
              item
                DatasetField = 'ConciliacionID'
                TableField = 'ConciliacionID'
              end
              item
                DatasetField = 'UsuarioID'
                TableField = 'UsuarioID'
              end
              item
                DatasetField = 'ReciboID'
                TableField = 'ReciboID'
              end>
          end>
        Name = 'dbo DetalleConciliacion'
        Fields = <
          item
            Name = 'DetalleConciliacionID'
            DataType = datInteger
            Required = True
            InPrimaryKey = True
          end
          item
            Name = 'FechaAplicacion'
            DataType = datDateTime
          end
          item
            Name = 'Tipo'
            DataType = datInteger
          end
          item
            Name = 'Descripcion'
            DataType = datString
            Size = 50
          end
          item
            Name = 'Importe'
            DataType = datFloat
          end
          item
            Name = 'BancoID'
            DataType = datInteger
            Required = True
          end
          item
            Name = 'ConciliacionID'
            DataType = datInteger
            Required = True
          end
          item
            Name = 'UsuarioID'
            DataType = datInteger
            Required = True
          end
          item
            Name = 'ReciboID'
            DataType = datInteger
            Required = True
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            TargetTable = 'dbo.Usuario'
            StatementType = stAutoSQL
            ColumnMappings = <
              item
                DatasetField = 'UsuarioID'
                TableField = 'UsuarioID'
              end
              item
                DatasetField = 'Nombre'
                TableField = 'Nombre'
              end
              item
                DatasetField = 'Usuario'
                TableField = 'Usuario'
              end
              item
                DatasetField = 'Clave'
                TableField = 'Clave'
              end
              item
                DatasetField = 'Activo'
                TableField = 'Activo'
              end
              item
                DatasetField = 'Tarjeta'
                TableField = 'Tarjeta'
              end
              item
                DatasetField = 'EstacionID'
                TableField = 'EstacionID'
              end>
          end>
        Name = 'dbo Usuario'
        Fields = <
          item
            Name = 'UsuarioID'
            DataType = datInteger
            Required = True
          end
          item
            Name = 'Nombre'
            DataType = datString
            Size = 70
            Required = True
          end
          item
            Name = 'Usuario'
            DataType = datString
            Size = 15
            Required = True
          end
          item
            Name = 'Clave'
            DataType = datString
            Size = 8
            Required = True
          end
          item
            Name = 'Activo'
            DataType = datBoolean
          end
          item
            Name = 'Tarjeta'
            DataType = datString
            Size = 16
          end
          item
            Name = 'EstacionID'
            DataType = datInteger
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            TargetTable = 'dbo.Clasificacion'
            StatementType = stAutoSQL
            ColumnMappings = <
              item
                DatasetField = 'ClasificacionID'
                TableField = 'ClasificacionID'
              end
              item
                DatasetField = 'Codigo'
                TableField = 'Codigo'
              end
              item
                DatasetField = 'Nombre'
                TableField = 'Nombre'
              end>
          end>
        Name = 'dbo Clasificacion'
        Fields = <
          item
            Name = 'ClasificacionID'
            DataType = datInteger
          end
          item
            Name = 'Codigo'
            DataType = datString
            Size = 5
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
            Name = 'Referencia'
            Value = ''
            ParamType = daptInput
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            SQL = 
              'declare @vehiculoid as int'#10'declare @AfectarHistorico bit'#10'declare' +
              ' @KMS integer'#10'select @vehiculoid = (select top 1 vehiculoid from' +
              ' referencia where referencia = :Referencia)'#10#10'select @afectarhist' +
              'orico = isnull((Select afectarhistorico from Cliente'#10'inner join ' +
              'Vehiculo on Cliente.ClienteID = Vehiculo.ClienteID'#10'where Vehicul' +
              'oID = @VehiculoID), 0)'#10#10'select @kms = isnull((select top 1 Kilom' +
              'etraje from Consumo'#10'where vehiculoid = @vehiculoid and productoi' +
              'd < 4'#10'order by FechaCarga desc), 0)'#10#10'select @afectarhistorico as' +
              ' AfectarHistorico, @kms as KMS'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'AfectarHistorico'
                TableField = 'AfectarHistorico'
              end
              item
                DatasetField = 'KMS'
                TableField = 'KMS'
              end>
          end>
        Name = 'spDatosVerificaReferencia'
        Fields = <
          item
            Name = 'AfectarHistorico'
            DataType = datBoolean
          end
          item
            Name = 'KMS'
            DataType = datInteger
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            TargetTable = 'dbo.TiempoAireGrupo'
            SQL = 
              'SELECT '#10'    TiempoAireGrupoID, Nombre, RazonSocial, RFC, email, ' +
              #10'    Telefono, Contacto, Comision, Domicilio, Colonia, CP'#10'  FROM' +
              #10'    dbo.TiempoAireGrupo'#10'  WHERE {Where}'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'TiempoAireGrupoID'
                TableField = 'TiempoAireGrupoID'
              end
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
                DatasetField = 'email'
                TableField = 'email'
              end
              item
                DatasetField = 'Telefono'
                TableField = 'Telefono'
              end
              item
                DatasetField = 'Contacto'
                TableField = 'Contacto'
              end
              item
                DatasetField = 'Comision'
                TableField = 'Comision'
              end
              item
                DatasetField = 'Domicilio'
                TableField = 'Domicilio'
              end
              item
                DatasetField = 'Colonia'
                TableField = 'Colonia'
              end
              item
                DatasetField = 'CP'
                TableField = 'CP'
              end>
          end>
        Name = 'dbo TiempoAireGrupo'
        Fields = <
          item
            Name = 'TiempoAireGrupoID'
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
            Name = 'RazonSocial'
            DataType = datString
            Size = 80
          end
          item
            Name = 'RFC'
            DataType = datString
            Size = 20
          end
          item
            Name = 'email'
            DataType = datString
            Size = 150
          end
          item
            Name = 'Telefono'
            DataType = datString
            Size = 30
          end
          item
            Name = 'Contacto'
            DataType = datString
            Size = 100
          end
          item
            Name = 'Comision'
            DataType = datFloat
          end
          item
            Name = 'Domicilio'
            DataType = datString
            Size = 80
          end
          item
            Name = 'Colonia'
            DataType = datString
            Size = 50
          end
          item
            Name = 'CP'
            DataType = datString
            Size = 6
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            TargetTable = 'dbo.TiempoAireSaldo'
            SQL = 
              'SELECT '#10'    TiempoAireSaldoID, Fecha, Cargo, Abono, Nota, Tiempo' +
              'AireGrupoID, UsuarioID'#10'  FROM'#10'    dbo.TiempoAireSaldo'#10'  WHERE'#10'  ' +
              '  (1=2)'#10
            StatementType = stSQL
            ColumnMappings = <
              item
                DatasetField = 'TiempoAireSaldoID'
                TableField = 'TiempoAireSaldoID'
              end
              item
                DatasetField = 'Fecha'
                TableField = 'Fecha'
              end
              item
                DatasetField = 'Cargo'
                TableField = 'Cargo'
              end
              item
                DatasetField = 'Abono'
                TableField = 'Abono'
              end
              item
                DatasetField = 'Nota'
                TableField = 'Nota'
              end
              item
                DatasetField = 'TiempoAireGrupoID'
                TableField = 'TiempoAireGrupoID'
              end
              item
                DatasetField = 'UsuarioID'
                TableField = 'UsuarioID'
              end>
          end>
        Name = 'dbo TiempoAireSaldo'
        Fields = <
          item
            Name = 'TiempoAireSaldoID'
            DataType = datInteger
            Required = True
            InPrimaryKey = True
          end
          item
            Name = 'Fecha'
            DataType = datDateTime
          end
          item
            Name = 'Cargo'
            DataType = datFloat
          end
          item
            Name = 'Abono'
            DataType = datFloat
          end
          item
            Name = 'Nota'
            DataType = datString
            Size = 150
          end
          item
            Name = 'TiempoAireGrupoID'
            DataType = datInteger
          end
          item
            Name = 'UsuarioID'
            DataType = datInteger
          end>
      end
      item
        Params = <>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            TargetTable = 'dbo.Estacion'
            StatementType = stAutoSQL
            ColumnMappings = <
              item
                DatasetField = 'EstacionID'
                TableField = 'EstacionID'
              end
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
                DatasetField = 'ClavePemex'
                TableField = 'ClavePemex'
              end
              item
                DatasetField = 'Estatus'
                TableField = 'Estatus'
              end
              item
                DatasetField = 'CuentaContable'
                TableField = 'CuentaContable'
              end
              item
                DatasetField = 'CuentaIVANoCobrado'
                TableField = 'CuentaIVANoCobrado'
              end
              item
                DatasetField = 'CuentaIVACobrado'
                TableField = 'CuentaIVACobrado'
              end
              item
                DatasetField = 'CuentaVentas'
                TableField = 'CuentaVentas'
              end
              item
                DatasetField = 'CuentaAnticipos'
                TableField = 'CuentaAnticipos'
              end
              item
                DatasetField = 'IVA'
                TableField = 'IVA'
              end
              item
                DatasetField = 'GasolineroID'
                TableField = 'GasolineroID'
              end
              item
                DatasetField = 'Host'
                TableField = 'Host'
              end
              item
                DatasetField = 'Externa'
                TableField = 'Externa'
              end
              item
                DatasetField = 'TiempoAireGrupoID'
                TableField = 'TiempoAireGrupoID'
              end>
          end>
        Name = 'dbo EstacionCatalogo'
        Fields = <
          item
            Name = 'EstacionID'
            DataType = datInteger
            Required = True
          end
          item
            Name = 'Nombre'
            DataType = datString
            Size = 30
            Required = True
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
            Name = 'ClavePemex'
            DataType = datString
            Size = 15
          end
          item
            Name = 'Estatus'
            DataType = datString
            Size = 1
            Required = True
          end
          item
            Name = 'CuentaContable'
            DataType = datString
            Size = 50
          end
          item
            Name = 'CuentaIVANoCobrado'
            DataType = datString
            Size = 50
          end
          item
            Name = 'CuentaIVACobrado'
            DataType = datString
            Size = 50
          end
          item
            Name = 'CuentaVentas'
            DataType = datString
            Size = 50
          end
          item
            Name = 'CuentaAnticipos'
            DataType = datString
            Size = 50
          end
          item
            Name = 'IVA'
            DataType = datFloat
          end
          item
            Name = 'GasolineroID'
            DataType = datInteger
            Required = True
          end
          item
            Name = 'Host'
            DataType = datString
            Size = 50
          end
          item
            Name = 'Externa'
            DataType = datBoolean
          end
          item
            Name = 'TiempoAireGrupoID'
            DataType = datInteger
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
            Connection = 'Flotillas'
            SQL = 
              'Select ClienteID, Nombre, Estatus, FormaPagoID, CuentaContable, ' +
              'FormaCompraID, RFC From dbo.Cliente'#10'Where(ClienteID = :Cliente)'#10 +
              'order by Nombre'#10
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
                DatasetField = 'Estatus'
                TableField = 'Estatus'
              end
              item
                DatasetField = 'FormaPagoID'
                TableField = 'FormaPagoID'
              end
              item
                DatasetField = 'CuentaContable'
                TableField = 'CuentaContable'
              end
              item
                DatasetField = 'FormaCompraID'
                TableField = 'FormaCompraID'
              end
              item
                DatasetField = 'RFC'
                TableField = 'RFC'
              end>
          end>
        Name = 'spBuscaCliente'
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
            Name = 'Estatus'
            DataType = datString
            Size = 1
          end
          item
            Name = 'FormaPagoID'
            DataType = datInteger
          end
          item
            Name = 'CuentaContable'
            DataType = datString
            Size = 20
          end
          item
            Name = 'FormaCompraID'
            DataType = datInteger
          end
          item
            Name = 'RFC'
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
            Name = 'IDRFID'
            Value = ''
          end
          item
            Name = 'VehiculoID'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            Name = 'Flotillas'
            SQL = 
              'update'#10'  Vehiculo'#10'set'#10'  IDRFID = :IDRFID'#10'where'#10'  VehiculoID = :V' +
              'ehiculoID'#10'  '#10'  '#10'update'#10'  Vehiculo'#10'set'#10'  Estatus = '#39'A'#39#10'where'#10'  Ve' +
              'hiculoID = :VehiculoID'#10'  '#10#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'UPDIDRFIDGOB'
      end
      item
        Params = <
          item
            Name = 'Codigo'
            Value = ''
          end
          item
            Name = 'Fecha'
            Value = ''
          end
          item
            Name = 'UsuarioID'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            Name = 'Flotillas'
            SQL = 
              'declare @Codigo as varchar(20)'#10'declare @CuponID as int'#10#10'select @' +
              'Codigo = (Select :Codigo)'#10#10'select @CuponID = ISNULL((SELECT Cupo' +
              'nID FROM Cupon WHERE  (Barras = @Codigo) or (CAST(CuponID as var' +
              'char(10)) = @Codigo)), 0)'#10#10'update'#10'  cupon'#10'set'#10'  status = '#39'X'#39','#10'  ' +
              'FechaCancelo = :Fecha,'#10'  UsuarioCanceloID = :UsuarioID'#10'where'#10'  c' +
              'uponid = @CuponID'#10#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'UPDCancelaCupon'
      end
      item
        Params = <
          item
            Name = 'Grupo'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            Name = 'Flotillas'
            SQL = 'delete from Autorizacion'#10'where Tipo = 2 AND ClienteID = :Grupo'#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'spCancelaGrupo'
      end
      item
        Params = <
          item
            Name = 'ClienteID'
            Value = ''
          end
          item
            Name = 'Periodo'
            Value = ''
          end
          item
            Name = 'Ejercicio'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            SQL = 
              'Update dbo.Consumo'#10'Set    dbo.Consumo.Facturado = 1'#10'Where (dbo.C' +
              'onsumo.ClienteID = :ClienteID)and'#10'      (dbo.Consumo.Periodo = :' +
              'Periodo)and'#10'      (dbo.Consumo.Ejercicio = :Ejercicio)'#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'spActualizaConsumo'
      end
      item
        Params = <
          item
            Name = 'Cantidad'
            Value = ''
          end
          item
            Name = 'Importe'
            Value = ''
          end
          item
            Name = 'ClienteID'
            Value = ''
          end
          item
            Name = 'VehiculoID'
            Value = ''
          end
          item
            Name = 'GasolineroID'
            Value = ''
          end
          item
            Name = 'Fecha'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            SQL = 
              'SET DATEFIRST 1'#10#10'declare @Cantidad as float'#10'declare @Importe as ' +
              'float'#10'declare @Fecha datetime'#10'declare @Dia Integer'#10'declare @DiaF' +
              'echa integer'#10'declare @DiaGetDate Integer'#10'declare @ClienteID Inte' +
              'ger'#10'declare @VehiculoID Integer'#10'declare @GasolineroID Integer'#10#10'S' +
              'elect @Cantidad = (Select :Cantidad)'#10'Select @Importe = (Select :' +
              'Importe)'#10'select @ClienteID = (Select :ClienteID)'#10'select @Vehicul' +
              'oID = (Select :VehiculoID)'#10'select @GasolineroID = (Select :Gasol' +
              'ineroID)'#10'select @Fecha = (select :Fecha)'#10#10'if (month(getdate()) =' +
              ' month(@fecha) and year(getdate()) = year(@fecha))'#10'begin'#10'update ' +
              'dbo.Vehiculo set'#10'       ActualLTMes = ActualLTMes + @Cantidad,'#10' ' +
              '      ActualMNMes = ActualMNMes + @Importe'#10'WHERE (ClienteID = @C' +
              'lienteID)and(VehiculoID = @VehiculoID)and'#10'      (GasolineroID = ' +
              '@GasolineroID)'#10'end'#10#10'if (month(getdate()) = month(@fecha) and yea' +
              'r(getdate()) = year(@fecha) and day(getdate()) = day(@fecha))'#10'be' +
              'gin'#10'update dbo.Vehiculo set'#10'       ActualLTDia   = ActualLTDia +' +
              ' @Cantidad,'#10'       ActualMNDia = ActualMNDia + @Importe,'#10'       ' +
              'ActualCargas = ActualCargas + 1,'#10'       Mensaje = '#39#39#10'WHERE (Clie' +
              'nteID = @ClienteID)and(VehiculoID = @VehiculoID)and'#10'      (Gasol' +
              'ineroID = @GasolineroID)'#10'end'#10#10'select @DiaFecha = (select cast(ca' +
              'st(convert(varchar, @fecha, 101) as datetime) as int))'#10'select @D' +
              'ia = DATEPART(dw, cast(convert(varchar, getdate(), 101) as datet' +
              'ime))'#10'select @DiaGetDate = (select cast(cast(convert(varchar, ge' +
              'tdate(), 101) as datetime) as int)-@Dia+1)'#10#10'if (@DiaFecha >= @Di' +
              'aGetDate and @DiaFecha <= (@DiaGetDate + 6))'#10'begin'#10'update dbo.Ve' +
              'hiculo set'#10'       ActualLTSemana= ActualLTSemana + @Cantidad,'#10'  ' +
              '     ActualMNSemana = ActualMNSemana + @Importe'#10'WHERE (ClienteID' +
              ' = @ClienteID)and(VehiculoID = @VehiculoID) and'#10'      (Gasoliner' +
              'oID = @GasolineroID)'#10'end'#10#10'update dbo.Vehiculo set'#10'       ActualL' +
              'TTurno = ActualLTTurno + @Cantidad,'#10'       ActualMNTurno = Actua' +
              'lMNTurno + @Importe'#10'WHERE (ClienteID = @ClienteID)and(VehiculoID' +
              ' = @VehiculoID)and'#10'      (GasolineroID = @GasolineroID)'#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'spActualizaHistorial'
      end
      item
        Params = <
          item
            Name = 'Ejercicio'
            Value = ''
          end
          item
            Name = 'ClienteID'
            Value = ''
          end
          item
            Name = 'GasolineroID'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            SQL = 
              'insert into dbo.SaldoEjercicio(Ejercicio, ClienteID, SaldoInicia' +
              'l, SaldoFinal, GasolineroID, CargosAcumulados, AbonosAcumulados,' +
              #10'                               Cargo01, Cargo02, Cargo03, Cargo' +
              '04, Cargo05, Cargo06, Cargo07, Cargo08, Cargo09, Cargo10, Cargo1' +
              '1,'#10'                               Cargo12, Abono01, Abono02, Abo' +
              'no03, Abono04, Abono05, Abono06, Abono07, Abono08, Abono09, Abon' +
              'o10,'#10'                               Abono11, Abono12)'#10'values (:E' +
              'jercicio, :ClienteID,  0, 0, :GasolineroID, 0, 0, 0, 0, 0, 0, 0,' +
              ' 0, 0, 0, 0, 0, 0, 0,'#10'        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0' +
              ')'#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'spInsertaSaldoEjercicio'
      end
      item
        Params = <
          item
            Name = 'BitacoraID'
            Value = ''
          end
          item
            Name = 'ClienteID'
            Value = ''
          end
          item
            Name = 'GasolineroID'
            Value = ''
          end
          item
            Name = 'UsuarioID'
            Value = ''
          end
          item
            Name = 'Tabla'
            Value = ''
          end
          item
            Name = 'Campo'
            Value = ''
          end
          item
            Name = 'ValorAnterior'
            Value = ''
          end
          item
            Name = 'ValorNuevo'
            Value = ''
          end
          item
            Name = 'Fecha'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            SQL = 
              'declare @BitacoraID as integer'#10'declare @ClienteID as integer'#10'dec' +
              'lare @GasolineroID as integer'#10'declare @UsuarioID as integer'#10'decl' +
              'are @Tabla as varchar(50)'#10'declare @Campo as varchar(50)'#10'declare ' +
              '@ValorAnterior as varchar(50)'#10'declare @ValorNuevo as varchar(50)' +
              #10'declare @Fecha as DateTime'#10#10'select @BitacoraID = (select :Bitac' +
              'oraID)'#10'select @ClienteID= (select :ClienteID)'#10'select @Gasolinero' +
              'ID = (select :GasolineroID)'#10'select @UsuarioID = (select :Usuario' +
              'ID)'#10'select @Tabla = (select :Tabla)'#10'select @Campo = (select :Cam' +
              'po)'#10'select @ValorAnterior = (select :ValorAnterior)'#10'select @Valo' +
              'rNuevo = (select :ValorNuevo)'#10'select @Fecha = (select :Fecha)'#10#10'i' +
              'nsert into dbo.Bitacora'#10'   (BitacoraID, ClienteID, GasolineroID,' +
              ' UsuarioID, Tabla, Campo, ValorAnterior, ValorNuevo, Fecha)'#10'    ' +
              'Values'#10'   (@BitacoraID, @ClienteID, @GasolineroID, @UsuarioID, @' +
              'Tabla, @Campo, @ValorAnterior, @ValorNuevo, @Fecha)'#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'spInsertaBitacora'
      end
      item
        Params = <
          item
            Name = 'FechaCarga'
            Value = ''
          end
          item
            Name = 'EstacionID'
            Value = ''
          end
          item
            Name = 'Secuencia'
            Value = ''
          end
          item
            Name = 'TurnoID'
            Value = ''
          end
          item
            Name = 'BombaID'
            Value = ''
          end
          item
            Name = 'Importe'
            Value = ''
          end
          item
            Name = 'CuponID'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            Name = 'Flotillas'
            SQL = 
              'update'#10'  cupon'#10'set'#10'  Status = '#39'C'#39','#10'  FechaConsumo = :FechaCarga,' +
              #10'  ConsumoEstacionID = :EstacionID,'#10'  ConsumoSecuencia = :Secuen' +
              'cia,'#10'  ConsumoTurnoID = :TurnoID,'#10'  ConsumoBombaID = :BombaID,'#10' ' +
              ' ConsumoImporte = :Importe'#10'where'#10'  CuponID = :CuponID'#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'spModificaCuponIndividual'
      end
      item
        Params = <
          item
            Name = 'FechaCarga'
            Value = ''
          end
          item
            Name = 'EstacionID'
            Value = ''
          end
          item
            Name = 'Secuencia'
            Value = ''
          end
          item
            Name = 'TurnoID'
            Value = ''
          end
          item
            Name = 'BombaID'
            Value = ''
          end
          item
            Name = 'Importe'
            Value = ''
          end
          item
            Name = 'Barras'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            SQL = 
              'update'#10'  cupon'#10'set'#10'  Status = '#39'C'#39','#10'  FechaConsumo = :FechaCarga,' +
              #10'  ConsumoEstacionID = :EstacionID,'#10'  ConsumoSecuencia = :Secuen' +
              'cia,'#10'  ConsumoTurnoID = :TurnoID,'#10'  ConsumoBombaID = :BombaID,'#10' ' +
              ' ConsumoImporte = :Importe'#10'from'#10'  cupon, Autorizacion'#10'where'#10'  cu' +
              'pon.cuponid = autorizacion.vehiculoid and autorizacion.Tipo = 2 ' +
              'and autorizacion.ClienteID = :Barras'#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'spModificaCupon'
      end
      item
        Params = <
          item
            Name = 'SecuenciaVenta'
            Value = ''
          end
          item
            Name = 'Serie'
            Value = ''
          end
          item
            Name = 'EstacionID'
            Value = ''
          end
          item
            Name = 'FechaMovimiento'
            Value = ''
          end
          item
            Name = 'FechaCarga'
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
            Name = 'Turno'
            Value = ''
          end
          item
            Name = 'Kilometraje'
            Value = ''
          end
          item
            Name = 'Tarjeta'
            Value = ''
          end
          item
            Name = 'PosicionCarga'
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
            Name = 'ImpuestoImporte'
            Value = ''
          end
          item
            Name = 'ImpuestoPorcentaje'
            Value = ''
          end
          item
            Name = 'CuentaContable'
            Value = ''
          end
          item
            Name = 'ManualAutomatico'
            Value = ''
          end
          item
            Name = 'Facturado'
            Value = ''
          end
          item
            Name = 'EnIngresos'
            Value = ''
          end
          item
            Name = 'Auditado'
            Value = ''
          end
          item
            Name = 'FacturaID'
            Value = ''
          end
          item
            Name = 'ProductoID'
            Value = ''
          end
          item
            Name = 'GasolineroID'
            Value = ''
          end
          item
            Name = 'ClienteID'
            Value = ''
          end
          item
            Name = 'VehiculoID'
            Value = ''
          end
          item
            Name = 'IEPS'
            Value = ''
          end
          item
            Name = 'Rendimiento'
            Value = ''
          end
          item
            Name = 'UsuarioID'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            SQL = 
              'insert into'#10'       dbo.Consumo'#10'  (SecuenciaVenta, Serie, Estacio' +
              'nID, FechaMovimiento, FechaCarga, Ejercicio,Periodo, Dia, Turno,' +
              ' Kilometraje,'#10'   Tarjeta, PosicionCarga, Cantidad, Precio, Impor' +
              'te, ImpuestoImporte, ImpuestoPorcentaje, CuentaContable,'#10'   Manu' +
              'alAutomatico, Facturado, EnIngresos, Auditado, FacturaID, Produc' +
              'toID, GasolineroID, ClienteID, VehiculoID,'#10'   IEPS, Rendimiento,' +
              ' UsuarioID)'#10'   values'#10'  (:SecuenciaVenta, :Serie, :EstacionID, :' +
              'FechaMovimiento, :FechaCarga, :Ejercicio, :Periodo, :Dia, :Turno' +
              ', :Kilometraje,'#10'   :Tarjeta, :PosicionCarga, :Cantidad, :Precio,' +
              ' :Importe, :ImpuestoImporte, :ImpuestoPorcentaje, :CuentaContabl' +
              'e,'#10'   :ManualAutomatico, :Facturado, :EnIngresos, :Auditado, :Fa' +
              'cturaID, :ProductoID, :GasolineroID, :ClienteID, :VehiculoID,'#10'  ' +
              ' :IEPS, :Rendimiento, :UsuarioID)'#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'spInsertaConsumo'
      end
      item
        Params = <
          item
            Name = 'SaldoDocumentoID'
            Value = ''
          end
          item
            Name = 'Fecha'
            Value = ''
          end
          item
            Name = 'FechaVencimiento'
            Value = ''
          end
          item
            Name = 'Cargo'
            Value = ''
          end
          item
            Name = 'Abono'
            Value = ''
          end
          item
            Name = 'Referencia'
            Value = ''
          end
          item
            Name = 'ClienteID'
            Value = ''
          end
          item
            Name = 'MovimientoID'
            Value = ''
          end
          item
            Name = 'ReciboID'
            Value = ''
          end
          item
            Name = 'BancoID'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            SQL = 
              'insert into dbo.SaldoDocumento'#10'            (SaldoDocumentoID, Fe' +
              'cha, FechaVencimiento, Cargo,'#10'             Abono, Referencia, Cl' +
              'ienteID, MovimientoID, ReciboID, BancoID)'#10'values'#10'            (:S' +
              'aldoDocumentoID, :Fecha, :FechaVencimiento, :Cargo,'#10'            ' +
              ' :Abono, :Referencia, :ClienteID, :MovimientoID, :ReciboID, :Ban' +
              'coID)'#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'spInsertaSaldoDocumentos'
      end
      item
        Params = <
          item
            Name = 'Serie'
            Value = ''
          end
          item
            Name = 'Folio'
            Value = ''
          end
          item
            Name = 'FechaImpresion'
            Value = ''
          end
          item
            Name = 'NuevaSerie'
            Value = ''
          end
          item
            Name = 'NuevoFolio'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            SQL = 
              'declare @Serie as varchar(10)'#10'declare @Folio as integer'#10'declare ' +
              '@FechaImpresion as DateTime'#10'declare @NuevaSerie as varchar(10)'#10'd' +
              'eclare @NuevoFolio as integer'#10'declare @MovimientoID as integer'#10#10 +
              'select @Serie = (select :Serie)'#10'select @Folio = (select :Folio)'#10 +
              'select @FechaImpresion = (select :FechaImpresion)'#10'select @NuevaS' +
              'erie = (select :NuevaSerie)'#10'select @NuevoFolio = (select :NuevoF' +
              'olio)'#10'select @MovimientoID = (select MovimientoID from Factura W' +
              'here Serie=@Serie'#10'                        and Folio = @Folio)'#10#10'u' +
              'pdate dbo.Factura'#10'set   Serie = @NuevaSerie,'#10'      Folio = @Nuev' +
              'oFolio,'#10'      FechaImpresion = @FechaImpresion'#10'Where (Serie = @S' +
              'erie)and(Folio = @Folio)'#10#10'update dbo.Movimiento'#10'set Referencia =' +
              ' '#39'FACTURA: '#39'+@NuevaSerie+Cast(@NuevoFolio as Varchar(20))'#10'Where ' +
              'MovimientoID = @MovimientoID'#10#10'update dbo.SaldoDocumento'#10'set Refe' +
              'rencia = '#39'FACTURA: '#39'+@NuevaSerie+Cast(@NuevoFolio as Varchar(20)' +
              ')'#10'Where MovimientoID = @MovimientoID'#10#10'update dbo.Movimiento'#10'set ' +
              'Referencia = '#39'FACTURA: '#39'+@NuevaSerie+Cast(@NuevoFolio as Varchar' +
              '(20))'#10'Where Referencia LIKE '#39'%FACTURA: '#39'+@Serie+Cast(@Folio as V' +
              'archar(20))+'#39'%'#39#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'spCambioNumeroFactura'
      end
      item
        Params = <
          item
            Name = 'ClientID'
            Value = ''
          end
          item
            Name = 'FechaCorte'
            Value = ''
          end
          item
            Name = 'FacturaID'
            Value = ''
          end
          item
            Name = 'IVA'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            SQL = 
              'declare @ClientID   as integer'#10'declare @FacturaID  as integer'#10'de' +
              'clare @FechaCorte as DateTime'#10'declare @IVA as float'#10'declare @Fac' +
              'turaConsumo as bit'#10#10'select @ClientID = (select :ClientID)'#10'select' +
              ' @FechaCorte = (select :FechaCorte)'#10'select @FacturaID = (select ' +
              ':FacturaID)'#10'select @IVA = (select :IVA)'#10#10#10'Select @FacturaConsumo' +
              ' = (SELECT FacturaConsumoCupon from'#10'                          db' +
              'o.Cliente  where (ClienteID = @ClientID))'#10#10'if @FacturaConsumo = ' +
              '1'#10#10'BEGIN'#10#10'UPDATE    Consumo'#10'SET              Facturado = 1, Fact' +
              'uraID = @FacturaID'#10'FROM         Consumo INNER JOIN'#10'             ' +
              '         Estacion ON Consumo.EstacionID = Estacion.EstacionID'#10'WH' +
              'ERE     ((SUBSTRING(Consumo.TARJETA,1,4)<>'#39'0005'#39')AND(LEN(Consumo' +
              '.TARJETA)>=10)AND(Consumo.TARJETA <> '#39'GRUPO CUPONES'#39'))'#10'AND (Cons' +
              'umo.ClienteID = @ClientID) AND (Consumo.FechaMovimiento <= @Fech' +
              'aCorte) AND (Consumo.Facturado = 0) AND (Estacion.IVA = @IVA)'#10#10#10 +
              'END'#10#10'ELSE'#10'BEGIN'#10#10'UPDATE    Consumo'#10'SET              Facturado = ' +
              '1, FacturaID = @FacturaID'#10'FROM         Consumo INNER JOIN'#10'      ' +
              '                Estacion ON Consumo.EstacionID = Estacion.Estaci' +
              'onID'#10'WHERE     (Consumo.ClienteID = @ClientID) AND (Consumo.Fech' +
              'aMovimiento <= @FechaCorte) AND (Consumo.Facturado = 0) AND (Est' +
              'acion.IVA = @IVA)'#10#10'END'#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'spActualizaConsumoGenFact'
      end
      item
        Params = <
          item
            Name = 'DetalleFacturaID'
            Value = ''
          end
          item
            Name = 'FacturaID'
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
            Name = 'ProductoID'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            SQL = 
              'declare @DetalleFacturaID as integer'#10'declare @FacturaID as integ' +
              'er'#10'declare @Cantidad as float'#10'declare @Precio as float'#10'declare @' +
              'Importe as float'#10'declare @ProductoID as integer'#10#10'select @Detalle' +
              'FacturaID = (select :DetalleFacturaID)'#10'select @FacturaID= (selec' +
              't :FacturaID)'#10'select @Cantidad = (Select :Cantidad)'#10'select @Prec' +
              'io = (select :Precio)'#10'select @Importe = (select :Importe)'#10'select' +
              ' @ProductoID = (select :ProductoID)'#10#10'insert into'#10'  dbo.DetalleFa' +
              'ctura'#10'  (DetalleFacturaID, FacturaID, Cantidad, Precio, Importe,' +
              ' ProductoID)'#10'  values'#10'  (@DetalleFacturaID, @FacturaID, @Cantida' +
              'd, @Precio, @Importe, @ProductoID)'#10#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'spInsertarDetalleFactura'
      end
      item
        Params = <
          item
            Name = 'MovimientoID'
            Value = ''
          end
          item
            Name = 'FechaMovimiento'
            Value = ''
          end
          item
            Name = 'FechaVencimiento'
            Value = ''
          end
          item
            Name = 'Referencia'
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
            Name = 'CargoAbono'
            Value = ''
          end
          item
            Name = 'Cargo'
            Value = ''
          end
          item
            Name = 'Abono'
            Value = ''
          end
          item
            Name = 'FechaRegistro'
            Value = ''
          end
          item
            Name = 'Origen'
            Value = ''
          end
          item
            Name = 'AfectaSaldos'
            Value = ''
          end
          item
            Name = 'TipoMovimientoID'
            Value = ''
          end
          item
            Name = 'UsuarioID'
            Value = ''
          end
          item
            Name = 'ClienteID'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            SQL = 
              'declare @MovimientoID as integer'#10'declare @FechaMovimiento as Dat' +
              'eTime'#10'declare @FechaVencimiento as DateTime'#10'declare @Referencia ' +
              'as varchar(50)'#10'declare @Ejercicio as integer'#10'declare @Periodo as' +
              ' integer'#10'declare @CargoAbono as varchar(1)'#10'declare @Cargo as flo' +
              'at'#10'declare @Abono as float'#10'declare @FechaRegistro as DateTime'#10'de' +
              'clare @Origen as varchar(5)'#10'declare @AfectaSaldos as bit'#10'declare' +
              ' @TipoMovimientoID as varchar(10)'#10'declare @UsuarioID as integer'#10 +
              'declare @ClienteID as integer'#10#10'select @MovimientoID = (select :M' +
              'ovimientoID)'#10'select @FechaMovimiento = (select :FechaMovimiento)' +
              #10'select @FechaVencimiento = (select :FechaVencimiento)'#10'select @R' +
              'eferencia = (select :Referencia)'#10'select @Ejercicio = (select :Ej' +
              'ercicio)'#10'select @Periodo = (select :Periodo)'#10'select @CargoAbono ' +
              '= (select :CargoAbono)'#10'select @Cargo = (select :Cargo)'#10'select @A' +
              'bono = (select :Abono)'#10'select @FechaRegistro = (select :FechaReg' +
              'istro)'#10'select @Origen = (select :Origen)'#10'select @AfectaSaldos = ' +
              '(select :AfectaSaldos)'#10'select @TipoMovimientoID = (select :TipoM' +
              'ovimientoID)'#10'select @UsuarioID = (select :UsuarioID)'#10'select @Cli' +
              'enteID = (select :ClienteID)'#10#10'insert into dbo.Movimiento'#10'       ' +
              '     (MovimientoID, FechaMovimiento, FechaVencimiento, Referenci' +
              'a,'#10'             Ejercicio, Periodo, CargoAbono, Cargo, Abono, Fe' +
              'chaRegistro,'#10'             Origen, AfectaSaldos, TipoMovimientoID' +
              ', UsuarioID, ClienteID)'#10'values'#10'            (@MovimientoID, @Fech' +
              'aMovimiento, @FechaVencimiento, @Referencia,'#10'             @Ejerc' +
              'icio, @Periodo, @CargoAbono, @Cargo, @Abono, @FechaRegistro,'#10'   ' +
              '          @Origen, @AfectaSaldos, @TipoMovimientoID, @UsuarioID,' +
              ' @ClienteID)'#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'spInsertarMovimiento'
      end
      item
        Params = <
          item
            Name = 'FacturaID'
            Value = ''
          end
          item
            Name = 'Serie'
            Value = ''
          end
          item
            Name = 'Folio'
            Value = ''
          end
          item
            Name = 'Fecha'
            Value = ''
          end
          item
            Name = 'FechaVencimiento'
            Value = ''
          end
          item
            Name = 'FechaImpresion'
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
            Name = 'Saldo'
            Value = ''
          end
          item
            Name = 'Tickets'
            Value = ''
          end
          item
            Name = 'ClienteID'
            Value = ''
          end
          item
            Name = 'UsuarioID'
            Value = ''
          end
          item
            Name = 'MovimientoID'
            Value = ''
          end
          item
            Name = 'IVA'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            SQL = 
              'insert into dbo.Factura'#10'   (FacturaID, Serie, Folio, Fecha, Fech' +
              'aVencimiento, FechaImpresion, Ejercicio, Periodo, Subtotal,'#10'    ' +
              'Impuesto, Total, Saldo, Tickets, ClienteID, UsuarioID, Movimient' +
              'oID, IVA)'#10'    Values'#10'    (:FacturaID, :Serie, :Folio, :Fecha, :F' +
              'echaVencimiento, :FechaImpresion, :Ejercicio, :Periodo, :Subtota' +
              'l,'#10'    :Impuesto, :Total, :Saldo, :Tickets, :ClienteID, :Usuario' +
              'ID, :MovimientoID, :IVA)'#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'spInsertarFactura'
      end
      item
        Params = <
          item
            Name = 'AutorizacionID'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            SQL = 
              'DELETE'#10'  FROM'#10'    Autorizacion'#10'  WHERE'#10'    AutorizacionID = :Aut' +
              'orizacionID'#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'AutorizacionEliminar'
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
            Connection = 'Flotillas'
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
            Name = 'DetalleCuponID'
            Value = ''
          end
          item
            Name = 'Denominacion'
            Value = ''
          end
          item
            Name = 'Cantidad'
            Value = ''
          end
          item
            Name = 'Referencia'
            Value = ''
          end
          item
            Name = 'FacturaID'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            SQL = 
              'declare @DetalleCuponID as integer'#10'declare @Denominacion as floa' +
              't'#10'declare @Cantidad as float'#10'declare @Referencia as varchar(50)'#10 +
              'declare @FacturaID as integer'#10#10'select @DetalleCuponID = (select ' +
              ':DetalleCuponID)'#10'select @Denominacion = (select :Denominacion)'#10's' +
              'elect @Cantidad = (select :Cantidad)'#10'select @Referencia = (selec' +
              't :Referencia)'#10'select @FacturaID = (select :FacturaID)'#10#10'insert i' +
              'nto dbo.DetalleCupon'#10'   (DetalleCuponID, Denominacion, Cantidad,' +
              ' Referencia, FacturaID)'#10'   values'#10'   (@DetalleCuponID, @Denomina' +
              'cion, @Cantidad, @Referencia, @FacturaID)'#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'spInsertaDetalleCupon'
      end
      item
        Params = <
          item
            Name = 'ClienteID'
            Value = ''
          end
          item
            Name = 'VehiculoID'
            Value = ''
          end
          item
            Name = 'GasolineroID'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            SQL = 
              'Delete from'#10'       dbo.Autorizacion'#10'Where'#10'     (dbo.Autorizacion' +
              '.ClienteID = :ClienteID) and'#10'     (dbo.Autorizacion.VehiculoID =' +
              ' :VehiculoID) and'#10'     (dbo.Autorizacion.GasolineroID = :Gasolin' +
              'eroID)'#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'spAutorizacionEliminarTarjeta'
      end
      item
        Params = <
          item
            Name = 'Barras'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            SQL = 
              'declare @Barras as Varchar(300)'#10'Select @Barras= (Select :Barras)' +
              #10#10'Delete from dbo.Autorizacion'#10'Where(dbo.Autorizacion.Referencia' +
              ' = @Barras)'#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'spEliminaAutorizacion'
      end
      item
        Params = <
          item
            Name = 'CuponID'
            Value = ''
          end
          item
            Name = 'Importe'
            Value = ''
          end
          item
            Name = 'Status'
            Value = ''
          end
          item
            Name = 'FechaEmision'
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
            Name = 'Barras'
            Value = ''
          end
          item
            Name = 'Secuencia'
            Value = ''
          end
          item
            Name = 'ClienteID'
            Value = ''
          end
          item
            Name = 'FacturaID'
            Value = ''
          end
          item
            Name = 'DetalleCuponID'
            Value = ''
          end
          item
            Name = 'EstacionID'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            SQL = 
              'insert into'#10'       dbo.Cupon'#10'  (CuponID, Importe, Status, FechaE' +
              'mision, EjercicioEmision, PeriodoEmision, DiaEmision, Barras, Se' +
              'cuencia,'#10'   ClienteID, FacturaID, DetalleCuponID, EstacionID)'#10'  ' +
              ' values'#10'  (:CuponID, :Importe, :Status, :FechaEmision, :Ejercici' +
              'o, :Periodo, :Dia,'#10'   :Barras, :Secuencia, :ClienteID, :FacturaI' +
              'D, :DetalleCuponID, :EstacionID)'#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'spInsertarCupon'
      end
      item
        Params = <
          item
            Name = 'Clasificacion'
            Value = ''
          end
          item
            Name = 'ClienteID'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            Name = 'Flotillas'
            SQL = 
              'update vehiculo'#10'set Clasificacion = :Clasificacion'#10'where Cliente' +
              'ID = :ClienteID'#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'spClasificacionCliente'
      end
      item
        Params = <
          item
            Name = 'Clasificacion'
            Value = ''
          end
          item
            Name = 'VehiculoID'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            Name = 'Flotillas'
            SQL = 
              'update vehiculo'#10'set clasificacion = :Clasificacion'#10'where vehicul' +
              'oID = :VehiculoID'#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'spClasificacionVehiculo'
      end
      item
        Params = <
          item
            Name = 'NIP'
            Value = ''
          end
          item
            Name = 'Referencia'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            Name = 'Flotillas'
            SQL = 
              'update vehiculo set nip = :NIP'#10'from referencia'#10'where vehiculo.ve' +
              'hiculoid = referencia.vehiculoid and referencia.referencia = :Re' +
              'ferencia'#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'spCambiaNIP'
      end
      item
        Params = <
          item
            Name = 'ClienteID'
            Value = ''
          end
          item
            Name = 'VehiculoID'
            Value = ''
          end
          item
            Name = 'EstacionID'
            Value = ''
          end
          item
            Name = 'SecuenciaVenta'
            Value = ''
          end
          item
            Name = 'Serie'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            Name = 'Flotillas'
            SQL = 
              'update'#10'  consumo'#10'set'#10'  ClienteID = :ClienteID,'#10'  VehiculoID = :V' +
              'ehiculoID'#10'where'#10'  EstacionID = :EstacionID AND SecuenciaVenta= :' +
              'SecuenciaVenta AND Serie = :Serie'#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'spCambiaClienteConsumo'
      end
      item
        Params = <
          item
            Name = 'ClientID'
            Value = ''
          end
          item
            Name = 'FechaCorte'
            Value = ''
          end
          item
            Name = 'FacturaID'
            Value = ''
          end
          item
            Name = 'CadTicket'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            Name = 'Flotillas'
            SQL = 
              'declare @ClientID   as integer'#10'declare @FacturaID  as integer'#10'de' +
              'clare @CadTicket as Varchar(500)'#10'declare @FechaCorte as DateTime' +
              #10'declare @FacturaConsumo as bit'#10#10'select @ClientID = (select :Cli' +
              'entID)'#10'select @FechaCorte = (select :FechaCorte)'#10'select @Factura' +
              'ID = (select :FacturaID)'#10'select @CadTicket = (select :CadTicket)' +
              #10#10'Select @FacturaConsumo = (SELECT FacturaConsumoCupon from'#10'    ' +
              '                      dbo.Cliente  where (ClienteID = @ClientID)' +
              ')'#10#10'if @FacturaConsumo = 1'#10'BEGIN'#10#10'Update dbo.Consumo'#10'set    Factu' +
              'rado = 1,'#10'       FacturaID = @FacturaID'#10'where (ClienteID = @Clie' +
              'ntID)AND'#10'      ((SUBSTRING(Consumo.TARJETA,1,4)='#39'0005'#39')OR(LEN(Co' +
              'nsumo.TARJETA)<10)OR(Consumo.TARJETA = '#39'GRUPO CUPONES'#39'))AND(CONS' +
              'UMO.TARJETA <> '#39#39')'#10'      AND'#10'      (@FechaCorte >= FechaMovimien' +
              'to) and'#10'      (Facturado = 0)AND'#10'      @CadTicket Like '#39'%@'#39'+ Cas' +
              't(Consumo.SecuenciaVenta as Varchar(50)) + '#39'@%'#39#10'END'#10#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'spActualizaConsumoGenFact2Cupones'
      end
      item
        Params = <
          item
            Name = 'ClientID'
            Value = ''
          end
          item
            Name = 'FechaCorte'
            Value = ''
          end
          item
            Name = 'FacturaID'
            Value = ''
          end
          item
            Name = 'Productos'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            Name = 'Flotillas'
            SQL = 
              'declare @ClientID   as integer'#10'declare @FacturaID  as integer'#10'de' +
              'clare @FechaCorte as DateTime'#10'declare @Productos as Varchar(100)' +
              #10'DECLARE @FacturaConsumo as bit'#10#10'select @ClientID = (select :Cli' +
              'entID)'#10'select @FechaCorte = (select :FechaCorte)'#10'select @Factura' +
              'ID = (select :FacturaID)'#10'select @Productos = (select :Productos)' +
              #10#10'Select @FacturaConsumo = (SELECT FacturaConsumoCupon from'#10'    ' +
              '                      dbo.Cliente  where (ClienteID = @ClientID)' +
              ')'#10'                          '#10'IF @FacturaConsumo = 1'#10'BEGIN'#10#10'Updat' +
              'e dbo.Consumo'#10'set    Facturado = 1,'#10'       FacturaID = @FacturaI' +
              'D'#10'where (ClienteID = @ClientID)AND'#10'      ((SUBSTRING(Consumo.TAR' +
              'JETA,1,4)<>'#39'0005'#39')AND(LEN(Consumo.TARJETA)>=10)AND(Consumo.TARJE' +
              'TA <> '#39'GRUPO CUPONES'#39'))'#10'      AND'#10'      (@FechaCorte >= FechaMov' +
              'imiento) and'#10'      (Facturado = 0) and'#10'      @Productos Like '#39'%@' +
              #39'+ Cast(ProductoID as Varchar(50)) + '#39'@%'#39#10#10'END'#10#10'ELSE'#10'BEGIN'#10#10'Upda' +
              'te dbo.Consumo'#10'set    Facturado = 1,'#10'       FacturaID = @Factura' +
              'ID'#10'where (ClienteID = @ClientID)and'#10'      (@FechaCorte >= FechaM' +
              'ovimiento) and'#10'      (Facturado = 0) and'#10'      @Productos Like '#39 +
              '%@'#39'+ Cast(ProductoID as Varchar(50)) + '#39'@%'#39#10#10'END'#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'spActualizaConsumoGenFact2'
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
            Name = 'NoAprobacion'
            Value = ''
          end
          item
            Name = 'FechaAprobacion'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            Name = 'Flotillas'
            SQL = 
              'DECLARE @CONT INT'#10#10'SELECT @CONT = (SELECT 0)'#10#10'SELECT @CONT = (SE' +
              'LECT COUNT(*) FROM DBO.FACTURAELECTRONICA WHERE DBO.FACTURAELECT' +
              'RONICA.FACTURAID = :FacturaID)'#10#10'IF @CONT = 0'#10'BEGIN'#10'insert into'#10' ' +
              '  dbo.FacturaElectronica'#10'  (FacturaElectornicaID, CadenaOriginal' +
              ', SelloDigital, FacturaID, Vigencia, Enviado, NoCertificado, NoA' +
              'probacion, FechaAprobacion)'#10'   values'#10'  (:FacturaElectornicaID, ' +
              ':CadenaOriginal, :SelloDigital, :FacturaID, :Vigencia, :Enviado,' +
              ' :NoCertificado, :NoAprobacion, :FechaAprobacion)'#10'END'#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'spInsertaFCTELECTRONICA'
      end
      item
        Params = <
          item
            Name = 'Certificado'
            Value = ''
          end
          item
            Name = 'GasolineroID'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            Name = 'Flotillas'
            SQL = 
              'UPDATE dbo.Gasolinero'#10'  SET'#10'    Certificado = :Certificado'#10'  WHE' +
              'RE'#10'    (GasolineroID = :GasolineroID)'#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'spLlavePrivadaCertificado'
      end
      item
        Params = <
          item
            Name = 'BitacoraGOBID'
            Value = ''
          end
          item
            Name = 'SecuenciaVenta'
            Value = ''
          end
          item
            Name = 'Fecha'
            Value = ''
          end
          item
            Name = 'IDAutorizacion'
            Value = ''
          end
          item
            Name = 'IDConsumoGuardaGOB'
            Value = ''
          end
          item
            Name = 'FechaCarga'
            Value = ''
          end
          item
            Name = 'RFID'
            Value = ''
          end
          item
            Name = 'Turno'
            Value = ''
          end
          item
            Name = 'Kilometraje'
            Value = ''
          end
          item
            Name = 'PosicionCarga'
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
            Name = 'ImpuestoImporte'
            Value = ''
          end
          item
            Name = 'ImpuestoPorcentaje'
            Value = ''
          end
          item
            Name = 'ProductoID'
            Value = ''
          end
          item
            Name = 'GasolineroID'
            Value = ''
          end
          item
            Name = 'IEPS'
            Value = ''
          end
          item
            Name = 'EstacionID'
            Value = ''
          end
          item
            Name = 'Saldo'
            Value = ''
          end
          item
            Name = 'ClienteID'
            Value = ''
          end
          item
            Name = 'VehiculoID'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            Name = 'Flotillas'
            SQL = 
              'insert into dbo.BitacoraGOB'#10'   (BitacoraGOBID, SecuenciaVenta, F' +
              'echa, IDAutorizacion, IDConsumoGuardadoGOB, FechaCarga, RFID, Tu' +
              'rno, Kilometraje, PosicionCarga,'#10'    Cantidad, Precio, Importe, ' +
              'ImpuestoImporte, ImpuestoPorcentaje, ProductoID, GasolineroID, I' +
              'EPS, EstacionID, Saldo, ClienteID,'#10'    VehiculoID)'#10'    Values'#10'  ' +
              ' (:BitacoraGOBID, :SecuenciaVenta, :Fecha, :IDAutorizacion, :IDC' +
              'onsumoGuardaGOB, :FechaCarga, :RFID, :Turno, :Kilometraje, :Posi' +
              'cionCarga,'#10'    :Cantidad, :Precio, :Importe, :ImpuestoImporte, :' +
              'ImpuestoPorcentaje, :ProductoID, :GasolineroID, :IEPS, :Estacion' +
              'ID, :Saldo, :ClienteID,'#10'    :VehiculoID)'#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'spInsertaBitacoraGOB'
      end
      item
        Params = <
          item
            Name = 'SaldoEstacionID'
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
            Name = 'Referencia'
            Value = ''
          end
          item
            Name = 'Cargo'
            Value = ''
          end
          item
            Name = 'Abono'
            Value = ''
          end
          item
            Name = 'FechaRegistro'
            Value = ''
          end
          item
            Name = 'EstacionID'
            Value = ''
          end
          item
            Name = 'UsuarioID'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            Name = 'Flotillas'
            SQL = 
              'insert into dbo.SaldoEstacion'#10'   (SaldoEstacionID,Fecha,Ejercici' +
              'o,Periodo,Dia,Referencia,Cargo,Abono,FechaRegistro,EstacionID,Us' +
              'uarioID)'#10'   values'#10'   (:SaldoEstacionID,:Fecha,:Ejercicio,:Perio' +
              'do,:Dia,:Referencia,:Cargo,:Abono,:FechaRegistro,:EstacionID,:Us' +
              'uarioID)'#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'spInsertaFacturaSaldoEstacion'
      end
      item
        Params = <
          item
            Name = 'UsuarioID'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            SQL = 'DELETE'#10'  FROM'#10'    Acceso'#10'  WHERE'#10'    UsuarioID = :UsuarioID'#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'AccesosEliminar'
      end
      item
        Params = <
          item
            Name = 'AutorizacionID'
            Value = ''
          end
          item
            Name = 'Fecha'
            Value = ''
          end
          item
            Name = 'Importe'
            Value = ''
          end
          item
            Name = 'Cantidad'
            Value = ''
          end
          item
            Name = 'ImporteCantidad'
            Value = ''
          end
          item
            Name = 'PosicionCarga'
            Value = ''
          end
          item
            Name = 'Referencia'
            Value = ''
          end
          item
            Name = 'EstacionID'
            Value = ''
          end
          item
            Name = 'VehiculoID'
            Value = ''
          end
          item
            Name = 'ClienteID'
            Value = ''
          end
          item
            Name = 'GasolineroID'
            Value = ''
          end
          item
            Name = 'Tipo'
            Value = ''
          end
          item
            Name = 'Odometro'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            TargetTable = 'dbo.Autorizacion'
            SQL = 
              'INSERT'#10'  INTO dbo.Autorizacion'#10'    (AutorizacionID, Fecha, Impor' +
              'te, Cantidad, ImporteCantidad, '#10'     PosicionCarga, Referencia, ' +
              'EstacionID, VehiculoID, '#10'     ClienteID, GasolineroID, Tipo, Odo' +
              'metro)'#10'  VALUES'#10'    (:AutorizacionID, :Fecha, :Importe, :Cantida' +
              'd, :ImporteCantidad, '#10'     :PosicionCarga, :Referencia, :Estacio' +
              'nID, :VehiculoID, '#10'     :ClienteID, :GasolineroID, :Tipo, :Odome' +
              'tro)'#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'spInsertarAutorizacion'
      end
      item
        Params = <
          item
            Name = 'VehiculoID'
            Value = ''
          end
          item
            Name = 'TipoReferenciaID'
            Value = ''
          end
          item
            Name = 'Referencia'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            TargetTable = 'dbo.Referencia'
            SQL = 
              'INSERT'#10'  INTO dbo.Referencia'#10'    (VehiculoID, TipoReferenciaID, ' +
              'Referencia)'#10'  VALUES'#10'    (:VehiculoID, :TipoReferenciaID, :Refer' +
              'encia)'
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'Insert_dbo Referencia'
      end
      item
        Params = <
          item
            Name = 'VehiculoID'
            Value = ''
          end
          item
            Name = 'TipoReferenciaID'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            TargetTable = 'dbo.Referencia'
            SQL = 
              'DELETE '#10'  FROM'#10'    dbo.Referencia'#10'  WHERE'#10'    (VehiculoID = :Veh' +
              'iculoID) AND'#10'    (TipoReferenciaID = :TipoReferenciaID)'#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'Delete_dbo Referencia'
      end
      item
        Params = <
          item
            Name = 'ProductoID'
            Value = ''
          end
          item
            Name = 'VehiculoID'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            TargetTable = 'dbo.VehiculoProducto'
            SQL = 
              'INSERT'#10'  INTO dbo.VehiculoProducto'#10'    (ProductoID, VehiculoID)'#10 +
              '  VALUES'#10'    (:ProductoID, :VehiculoID)'
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'Insert_dbo VehiculoProducto'
      end
      item
        Params = <
          item
            Name = 'ProductoID'
            Value = ''
          end
          item
            Name = 'VehiculoID'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            TargetTable = 'dbo.VehiculoProducto'
            SQL = 
              'DELETE '#10'  FROM'#10'    dbo.VehiculoProducto'#10'  WHERE'#10'    (ProductoID ' +
              '= :ProductoID) AND'#10'    (VehiculoID = :VehiculoID)'#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'Delete_dbo VehiculoProducto'
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
            Connection = 'Flotillas'
            TargetTable = 'dbo.Reporte'
            SQL = 
              'INSERT'#10'  INTO dbo.Reporte'#10'    (ReporteID, Nombre, Tipo, Parametr' +
              'os, Template, TemplateMedia, '#10'     TemplateBaja, TemplateExporta' +
              'r, SQL1, SQL2, CampoJoin, '#10'     IdentificadorID, Usuarios)'#10'  VAL' +
              'UES'#10'    (:ReporteID, :Nombre, :Tipo, :Parametros, :Template, '#10'  ' +
              '   :TemplateMedia, :TemplateBaja, :TemplateExportar, :SQL1, '#10'   ' +
              '  :SQL2, :CampoJoin, :IdentificadorID, :Usuarios)'#10
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
            Connection = 'Flotillas'
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
            Value = ''
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            TargetTable = 'dbo.Reporte'
            SQL = 
              'UPDATE dbo.Reporte'#10'  SET '#10'    ReporteID = :ReporteID, '#10'    Nombr' +
              'e = :Nombre, '#10'    Tipo = :Tipo, '#10'    Parametros = :Parametros, '#10 +
              '    Template = :Template, '#10'    TemplateMedia = :TemplateMedia, '#10 +
              '    TemplateBaja = :TemplateBaja, '#10'    TemplateExportar = :Templ' +
              'ateExportar, '#10'    SQL1 = :SQL1, '#10'    SQL2 = :SQL2, '#10'    CampoJoi' +
              'n = :CampoJoin, '#10'    IdentificadorID = :IdentificadorID,'#10'    Usu' +
              'arios = :Usuarios'#10'  WHERE'#10'    (ReporteID = :OLD_ReporteID)'#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'Update_dbo Reporte'
      end
      item
        Params = <
          item
            Name = 'BancariaID'
            Value = ''
          end
          item
            Name = 'Terminal'
            Value = ''
          end
          item
            Name = 'Fecha'
            Value = ''
          end
          item
            Name = 'Importe'
            Value = ''
          end
          item
            Name = 'Comision'
            Value = ''
          end
          item
            Name = 'Supervisor'
            Value = ''
          end
          item
            Name = 'Tarjeta'
            Value = ''
          end
          item
            Name = 'Track1'
            Value = ''
          end
          item
            Name = 'Track2'
            Value = ''
          end
          item
            Name = 'Resultado'
            Value = ''
          end
          item
            Name = 'BombaID'
            Value = ''
          end
          item
            Name = 'EstacionID'
            Value = ''
          end
          item
            Name = 'Ticket'
            Value = ''
          end
          item
            Name = 'Serie'
            Value = ''
          end
          item
            Name = 'Aprobada'
            Value = ''
          end
          item
            Name = 'TxID'
            Value = ''
          end
          item
            Name = 'Type'
            Value = ''
          end
          item
            Name = 'CardType'
            Value = ''
          end
          item
            Name = 'BancoEmisor'
            Value = ''
          end
          item
            Name = 'GrupoCaja'
            Value = ''
          end
          item
            Name = 'TipoBancariaID'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            TargetTable = 'dbo.Bancaria'
            SQL = 
              'INSERT'#10'  INTO dbo.Bancaria'#10'    (BancariaID, Terminal, Fecha, Imp' +
              'orte, Comision, Supervisor, Tarjeta, Track1,'#10'     Track2, Result' +
              'ado, BombaID, EstacionID, Ticket, Serie, Aprobada, TxID, Type,'#10' ' +
              '    CardType, BancoEmisor, GrupoCaja, TipoBancariaID)'#10'  VALUES'#10' ' +
              '   (:BancariaID, :Terminal, :Fecha, :Importe, :Comision, :Superv' +
              'isor, :Tarjeta,'#10'     :Track1, :Track2, :Resultado, :BombaID, :Es' +
              'tacionID, :Ticket, :Serie, :Aprobada, :TxID,'#10'     :Type, :CardTy' +
              'pe, :BancoEmisor, :GrupoCaja, :TipoBancariaID)'#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'Insert_dbo Bancaria'
      end
      item
        Params = <
          item
            Name = 'CuponID'
            Value = ''
          end
          item
            Name = 'Importe'
            Value = ''
          end
          item
            Name = 'FechaValido'
            Value = ''
          end
          item
            Name = 'VolumenImporte'
            Value = ''
          end
          item
            Name = 'Status'
            Value = ''
          end
          item
            Name = 'Barras'
            Value = ''
          end
          item
            Name = 'ClienteID'
            Value = ''
          end
          item
            Name = 'EstacionID'
            Value = ''
          end
          item
            Name = 'LoteCuponID'
            Value = ''
          end
          item
            Name = 'Referencia'
            Value = ''
          end
          item
            Name = 'TipoCupon'
            Value = ''
          end
          item
            Name = 'Serie'
            Value = ''
          end
          item
            Name = 'Folio'
            Value = ''
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            TargetTable = 'dbo.Cupon'
            SQL = 
              'INSERT'#10'  INTO dbo.Cupon'#10'    (CuponID, Importe, FechaValido, Volu' +
              'menImporte,'#10'     Status, Barras, ClienteID, EstacionID, LoteCupo' +
              'nID, '#10'     Referencia, TipoCupon, Serie, Folio)'#10'  VALUES'#10'    (:C' +
              'uponID, :Importe, :FechaValido, :VolumenImporte,'#10'     :Status, :' +
              'Barras, :ClienteID, :EstacionID, :LoteCuponID, '#10'     :Referencia' +
              ', :TipoCupon, :Serie, :Folio)'#10
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'Insert_dbo Cupon'
      end
      item
        Params = <
          item
            Name = 'TiempoAireID'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'Fecha'
            DataType = datDateTime
            Value = ''
          end
          item
            Name = 'Telefono'
            DataType = datString
            Size = 15
            Value = ''
          end
          item
            Name = 'Importe'
            DataType = datFloat
            Value = ''
          end
          item
            Name = 'ProveedorID'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'CajaID'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'EstacionID'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'BombaID'
            DataType = datInteger
            Value = ''
          end
          item
            Name = 'TimeStampID'
            DataType = datString
            Size = 25
            Value = ''
          end
          item
            Name = 'TransID'
            DataType = datString
            Size = 15
            Value = ''
          end
          item
            Name = 'Trans'
            DataType = datString
            Size = 15
            Value = ''
          end
          item
            Name = 'LLave'
            DataType = datString
            Size = 20
            Value = ''
          end
          item
            Name = 'Accepted'
            DataType = datBoolean
            Value = ''
          end>
        Statements = <
          item
            Connection = 'Flotillas'
            Default = True
            TargetTable = 'dbo.TiempoAire'
            SQL = 
              'INSERT'#10'  INTO dbo.TiempoAire'#10'    (TiempoAireID, Fecha, Telefono,' +
              ' Importe, ProveedorID, '#10'     CajaID, EstacionID, BombaID, TimeSt' +
              'ampID, TransID, '#10'     Trans, LLave, Accepted)'#10'  VALUES'#10'    (:Tie' +
              'mpoAireID, :Fecha, :Telefono, :Importe, :ProveedorID, '#10'     :Caj' +
              'aID, :EstacionID, :BombaID, :TimeStampID, :TransID, '#10'     :Trans' +
              ', :LLave, :Accepted)'
            StatementType = stSQL
            ColumnMappings = <>
          end>
        Name = 'Insert_dbo TiempoAire'
      end>
    RelationShips = <>
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
end
