inherited frmBuscarPago: TfrmBuscarPago
  Caption = 'Buscar Pagos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited dbgAgrupacion: TcxGrid
    inherited cxGridDBTableView1: TcxGridDBTableView
      DataController.DataSource = dsPagos
      object cxGridDBTableView1RecId: TcxGridDBColumn
        DataBinding.FieldName = 'RecId'
        Visible = False
      end
      object cxGridDBTableView1ReciboID: TcxGridDBColumn
        DataBinding.FieldName = 'ReciboID'
      end
      object cxGridDBTableView1Folio: TcxGridDBColumn
        DataBinding.FieldName = 'Folio'
      end
      object cxGridDBTableView1FechaMovimiento: TcxGridDBColumn
        DataBinding.FieldName = 'FechaMovimiento'
      end
      object cxGridDBTableView1Referencia: TcxGridDBColumn
        DataBinding.FieldName = 'Referencia'
        Width = 240
      end
      object cxGridDBTableView1Importe: TcxGridDBColumn
        DataBinding.FieldName = 'Importe'
      end
      object cxGridDBTableView1FechaCaptura: TcxGridDBColumn
        DataBinding.FieldName = 'FechaCaptura'
      end
      object cxGridDBTableView1FechaAplicacion: TcxGridDBColumn
        DataBinding.FieldName = 'FechaAplicacion'
      end
      object cxGridDBTableView1ClienteID: TcxGridDBColumn
        DataBinding.FieldName = 'ClienteID'
      end
    end
  end
  inherited cdsBuscar: TDACDSDataTable
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
    LogicalName = 'dbo Recibo'
    Params = <
      item
        Name = 'Recibo'
        Value = '1'
      end>
    Left = 511
    Top = 272
  end
  inherited dsBuscar: TDADataSource
    DataSet = cdsBuscar.Dataset
  end
  object rdaBuscarPagos: TDARemoteDataAdapter
    GetSchemaCall.RemoteService = DMFlotillas.RemoteService
    GetDataCall.RemoteService = DMFlotillas.RemoteService
    GetDataCall.MethodName = 'AbreDataSetReportes'
    GetDataCall.Params = <
      item
        Name = 'Result'
        DataType = rtBinary
        Flag = fResult
        Value = Null
      end
      item
        Name = 'SQL'
        DataType = rtString
        Flag = fIn
        Value = Null
      end
      item
        Name = 'Parametros'
        DataType = rtUserDefined
        Flag = fIn
        TypeName = 'TParametrosF'
        Value = Null
      end>
    GetDataCall.Default = False
    GetDataCall.OutgoingTableNamesParameter = 'aTableNameArray'
    GetDataCall.OutgoingTableRequestInfosParameter = 'aTableRequestInfoArray'
    GetDataCall.IncomingDataParameter = 'Result'
    UpdateDataCall.RemoteService = DMFlotillas.RemoteService
    GetScriptsCall.RemoteService = DMFlotillas.RemoteService
    RemoteService = DMFlotillas.RemoteService
    DataStreamer = DM.DataStreamer
    Left = 16
    Top = 368
  end
  object cdsPagos: TDAMemDataTable
    Fields = <>
    LogicalName = 'Reporte'
    Params = <>
    RemoteDataAdapter = rdaBuscarPagos
    RemoteUpdatesOptions = []
    StreamingOptions = [soDisableEventsWhileStreaming]
    IndexDefs = <>
    Left = 48
    Top = 368
  end
  object tblPagos: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 112
    Top = 368
    object tblPagosReciboID: TIntegerField
      FieldName = 'ReciboID'
    end
    object tblPagosFolio: TIntegerField
      FieldName = 'Folio'
    end
    object tblPagosFechaMovimiento: TDateTimeField
      FieldName = 'FechaMovimiento'
    end
    object tblPagosReferencia: TStringField
      FieldName = 'Referencia'
      Size = 150
    end
    object tblPagosImporte: TFloatField
      FieldName = 'Importe'
    end
    object tblPagosFechaCaptura: TDateTimeField
      FieldName = 'FechaCaptura'
    end
    object tblPagosFechaAplicacion: TDateTimeField
      FieldName = 'FechaAplicacion'
    end
    object tblPagosClienteID: TIntegerField
      FieldName = 'ClienteID'
    end
  end
  object dsPagos: TDataSource
    DataSet = tblPagos
    Left = 144
    Top = 368
  end
end
