inherited frmBuscar1: TfrmBuscar1
  Caption = 'Buscar Tarjeta Aditivos'
  ClientWidth = 621
  ExplicitWidth = 627
  PixelsPerInch = 96
  TextHeight = 13
  inherited dbgAgrupacion: TcxGrid
    Width = 621
    ExplicitWidth = 621
    inherited cxGridDBTableView1: TcxGridDBTableView
      OnCellDblClick = cxGridDBTableView1CellDblClick
      object cxGridDBTableView1Column1: TcxGridDBColumn
        DataBinding.FieldName = 'VehiculoID'
        Width = 73
      end
      object cxGridDBTableView1Column2: TcxGridDBColumn
        DataBinding.FieldName = 'ClienteID'
      end
      object cxGridDBTableView1Column3: TcxGridDBColumn
        DataBinding.FieldName = 'Nombre'
        Width = 241
      end
    end
  end
  inherited dxRibbon1: TdxRibbon
    Width = 621
    ExplicitWidth = 621
  end
  inherited cxGroupBox1: TcxGroupBox
    ExplicitWidth = 621
    Width = 621
  end
  inherited cdsBuscar: TDACDSDataTable
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
    Params = <
      item
        Name = 'ClienteID'
        Value = '1'
        ParamType = daptInput
      end>
    RemoteDataAdapter = rdaTarjetasAditivos
    LogicalName = 'Reporte'
  end
  inherited dsBuscar: TDADataSource
    DataSet = cdsBuscar.Dataset
  end
  object rdaTarjetasAditivos: TDARemoteDataAdapter
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
      end
      item
        Name = 'Parametros'
        DataType = rtUserDefined
        Flag = fIn
        TypeName = 'TParametros'
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
    Left = 552
    Top = 264
  end
end
