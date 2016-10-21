inherited frmBuscarProducto: TfrmBuscarProducto
  Caption = 'Buscar Producto'
  ExplicitWidth = 625
  ExplicitHeight = 446
  PixelsPerInch = 96
  TextHeight = 13
  inherited dbgAgrupacion: TcxGrid
    ExplicitTop = 18
    inherited cxGridDBTableView1: TcxGridDBTableView
      OnKeyDown = cxGridDBTableView1KeyDown
      object cxGridDBTableView1Codigo: TcxGridDBColumn
        DataBinding.FieldName = 'CODIGOPRODUCTO'
        Width = 109
      end
      object cxGridDBTableView1Nombre: TcxGridDBColumn
        DataBinding.FieldName = 'NOMBRE'
        Width = 241
      end
      object cxGridDBTableView1PrecioVenta: TcxGridDBColumn
        DataBinding.FieldName = 'PRECIOVENTA'
        Width = 96
      end
      object cxGridDBTableView1Costo: TcxGridDBColumn
        DataBinding.FieldName = 'COSTO'
        Width = 73
      end
      object cxGridDBTableView1IEPS: TcxGridDBColumn
        DataBinding.FieldName = 'IEPS'
        Width = 85
      end
    end
  end
  inherited cdsBuscar: TDACDSDataTable
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
    LogicalName = 'Obtenproductoportipo'
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
    RemoteDataAdapter = DM.RemoteDataAdapter
    OnFilterRecord = cdsBuscarFilterRecord
    Left = 511
    Top = 272
  end
  inherited dsBuscar: TDADataSource
    DataSet = cdsBuscar.Dataset
  end
end
