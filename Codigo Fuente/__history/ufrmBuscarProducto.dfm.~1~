inherited FrmBuscarProducto: TFrmBuscarProducto
  Caption = 'Buscar Producto'
  ExplicitWidth = 625
  ExplicitHeight = 445
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcBuscar: TcxPageControl
    ClientRectBottom = 387
    inherited tsBuscar: TcxTabSheet
      TabVisible = False
      ExplicitHeight = 384
      inherited dbgBuscar: TcxGrid
        Height = 318
        ExplicitHeight = 318
        inherited dbgBuscarDBTableView2: TcxGridDBTableView
          object dbgBuscarDBTableView2ProductoID: TcxGridDBColumn
            DataBinding.FieldName = 'ProductoID'
            Width = 96
          end
          object dbgBuscarDBTableView2Codigo: TcxGridDBColumn
            DataBinding.FieldName = 'Codigo'
            Width = 91
          end
          object dbgBuscarDBTableView2Nombre: TcxGridDBColumn
            DataBinding.FieldName = 'Nombre'
            Width = 284
          end
          object dbgBuscarDBTableView2PrecioVenta: TcxGridDBColumn
            DataBinding.FieldName = 'PrecioVenta'
            Width = 102
          end
        end
      end
      inherited cxGroupBox1: TcxGroupBox
        Visible = False
      end
    end
    inherited tsAgregar: TcxTabSheet
      TabVisible = False
      ExplicitLeft = 3
      ExplicitTop = 3
      ExplicitWidth = 610
      ExplicitHeight = 384
    end
  end
  inherited cdsBuscar: TDACDSDataTable
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
        Name = 'ClavePemex'
        DataType = datString
        Size = 10
      end
      item
        Name = 'Costo'
        DataType = datFloat
      end
      item
        Name = 'Status'
        DataType = datBoolean
      end
      item
        Name = 'Barras'
        DataType = datString
        Size = 50
      end
      item
        Name = 'CuentaContableCompra'
        DataType = datString
        Size = 20
      end
      item
        Name = 'CuentaContableVenta'
        DataType = datString
        Size = 20
      end
      item
        Name = 'Inventariable'
        DataType = datBoolean
      end
      item
        Name = 'CategoriaID'
        DataType = datInteger
      end
      item
        Name = 'Puntos'
        DataType = datInteger
      end>
    Params = <
      item
        Name = 'Tipo'
        Value = '1'
        ParamType = daptInput
      end
      item
        Name = 'EstacionID'
        Value = '4120'
        ParamType = daptInput
      end>
    LogicalName = 'ObtenerProductoPorTipo'
  end
  inherited dsBuscar: TDADataSource
    DataSet = cdsBuscar.Dataset
    Top = 312
  end
end
