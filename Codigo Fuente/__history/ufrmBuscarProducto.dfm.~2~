inherited frmBuscarMaestro: TfrmBuscarMaestro
  Caption = 'Buscar Alumno'
  ExplicitWidth = 625
  ExplicitHeight = 445
  PixelsPerInch = 96
  TextHeight = 13
  inherited dbgAgrupacion: TcxGrid
    inherited cxGridDBTableView1: TcxGridDBTableView
      object cxGridDBTableView1CODIGO: TcxGridDBColumn
        DataBinding.FieldName = 'CODIGO'
      end
      object cxGridDBTableView1NOMBRE: TcxGridDBColumn
        DataBinding.FieldName = 'NOMBRE'
        Width = 248
      end
      object cxGridDBTableView1IMSS: TcxGridDBColumn
        DataBinding.FieldName = 'IMSS'
        Width = 127
      end
      object cxGridDBTableView1DIRECCION: TcxGridDBColumn
        DataBinding.FieldName = 'DIRECCION'
        Width = 305
      end
      object cxGridDBTableView1FECHAINICIO: TcxGridDBColumn
        DataBinding.FieldName = 'FECHAINICIO'
      end
      object cxGridDBTableView1TELEFONO: TcxGridDBColumn
        DataBinding.FieldName = 'TELEFONO'
      end
      object cxGridDBTableView1CELULAR: TcxGridDBColumn
        DataBinding.FieldName = 'CELULAR'
      end
      object cxGridDBTableView1EMAIL: TcxGridDBColumn
        DataBinding.FieldName = 'EMAIL'
        Width = 190
      end
      object cxGridDBTableView1RFC: TcxGridDBColumn
        DataBinding.FieldName = 'RFC'
      end
      object cxGridDBTableView1STATUS: TcxGridDBColumn
        DataBinding.FieldName = 'STATUS'
        Width = 50
      end
      object cxGridDBTableView1CURP: TcxGridDBColumn
        DataBinding.FieldName = 'CURP'
      end
    end
  end
  inherited cdsBuscar: TDACDSDataTable
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
    RemoteDataAdapter = DM.RemoteDataAdapter
    OnFilterRecord = cdsBuscarFilterRecord
    LogicalName = 'dbo MAESTRO'
    Left = 511
    Top = 272
  end
  inherited dsBuscar: TDADataSource
    DataSet = cdsBuscar.Dataset
  end
end
