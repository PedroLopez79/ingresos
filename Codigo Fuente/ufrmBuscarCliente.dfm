inherited frmBuscarCliente: TfrmBuscarCliente
  Caption = 'Buscar Cliente'
  ClientWidth = 752
  OnCreate = FormCreate
  ExplicitWidth = 758
  ExplicitHeight = 446
  PixelsPerInch = 96
  TextHeight = 13
  inherited dbgBuscar: TcxGrid
    Width = 752
    ExplicitTop = 73
    ExplicitWidth = 752
    ExplicitHeight = 287
    inherited cxGridDBTableView1: TcxGridDBTableView
      OnKeyDown = cxGridDBTableView1KeyDown
      object cxGridDBTableView1Column1: TcxGridDBColumn
        DataBinding.FieldName = 'IDCLIENTE'
        Width = 68
      end
      object cxGridDBTableView1Column2: TcxGridDBColumn
        DataBinding.FieldName = 'NOMBRE'
        Width = 216
      end
      object cxGridDBTableView1Column6: TcxGridDBColumn
        DataBinding.FieldName = 'RFC'
        Width = 164
      end
      object cxGridDBTableView1Column3: TcxGridDBColumn
        DataBinding.FieldName = 'CIUDAD'
        Width = 106
      end
      object cxGridDBTableView1Column4: TcxGridDBColumn
        DataBinding.FieldName = 'COLONIA'
        Width = 110
      end
      object cxGridDBTableView1Column5: TcxGridDBColumn
        DataBinding.FieldName = 'CALLE'
        Width = 153
      end
    end
  end
  inherited dxRibbon1: TdxRibbon
    Width = 752
    ExplicitWidth = 752
  end
  inherited cxGroupBox1: TcxGroupBox
    ExplicitWidth = 752
    Width = 752
  end
  inherited Panel1: TPanel
    Width = 752
    ExplicitTop = 24
    ExplicitWidth = 752
  end
  inherited cdsBuscar: TDACDSDataTable
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
        Size = 15
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
      end
      item
        Name = 'REFERENCIA'
        DataType = datString
        Size = 100
      end
      item
        Name = 'AUTORIZACHEQUE'
        DataType = datBoolean
      end>
    LogicalName = 'BuscaCliente'
    Params = <
      item
        Name = 'Parametro'
        DataType = datString
        Size = 65536
        Value = '170'
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
