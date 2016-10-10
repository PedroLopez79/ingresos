inherited frmBuscaMateria: TfrmBuscaMateria
  Caption = 'frmBuscaMateria'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited dbgAgrupacion: TcxGrid
    inherited cxGridDBTableView1: TcxGridDBTableView
      object cxGridDBTableView1IDMATERIA: TcxGridDBColumn
        DataBinding.FieldName = 'IDMATERIA'
      end
      object cxGridDBTableView1CODIGO: TcxGridDBColumn
        DataBinding.FieldName = 'CODIGO'
      end
      object cxGridDBTableView1NOMBRE: TcxGridDBColumn
        DataBinding.FieldName = 'NOMBRE'
      end
      object cxGridDBTableView1CREDITOS: TcxGridDBColumn
        DataBinding.FieldName = 'CREDITOS'
      end
      object cxGridDBTableView1MINIMOAPRO: TcxGridDBColumn
        DataBinding.FieldName = 'MINIMOAPRO'
      end
      object cxGridDBTableView1MAXIMOFALTAS: TcxGridDBColumn
        DataBinding.FieldName = 'MAXIMOFALTAS'
      end
      object cxGridDBTableView1SERIADACON: TcxGridDBColumn
        DataBinding.FieldName = 'SERIADACON'
      end
      object cxGridDBTableView1NOMBREAUX1: TcxGridDBColumn
        DataBinding.FieldName = 'NOMBREAUX1'
      end
      object cxGridDBTableView1NOMBREAUX2: TcxGridDBColumn
        DataBinding.FieldName = 'NOMBREAUX2'
      end
      object cxGridDBTableView1HORASXSEMANA: TcxGridDBColumn
        DataBinding.FieldName = 'HORASXSEMANA'
      end
      object cxGridDBTableView1PROMEDIO: TcxGridDBColumn
        DataBinding.FieldName = 'PROMEDIO'
      end
      object cxGridDBTableView1ORDENOFICIAL: TcxGridDBColumn
        DataBinding.FieldName = 'ORDENOFICIAL'
      end
      object cxGridDBTableView1ORDENINTERNO: TcxGridDBColumn
        DataBinding.FieldName = 'ORDENINTERNO'
      end
    end
  end
  inherited cdsBuscar: TDACDSDataTable
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
      end>
    RemoteDataAdapter = DM.RemoteDataAdapter
    LogicalName = 'dbo MATERIA'
  end
  inherited dsBuscar: TDADataSource
    DataSet = cdsBuscar.Dataset
  end
end
