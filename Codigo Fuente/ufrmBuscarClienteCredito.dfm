inherited frmBuscarClienteCredito: TfrmBuscarClienteCredito
  Caption = 'Buscar Cliente Credito'
  ExplicitWidth = 625
  ExplicitHeight = 445
  PixelsPerInch = 96
  TextHeight = 13
  inherited dbgAgrupacion: TcxGrid
    inherited cxGridDBTableView1: TcxGridDBTableView
      OnKeyDown = cxGridDBTableView1KeyDown
      object cxGridDBTableView1Column1: TcxGridDBColumn
        DataBinding.FieldName = 'ClienteID'
      end
      object cxGridDBTableView1Column2: TcxGridDBColumn
        DataBinding.FieldName = 'Nombre'
        Width = 153
      end
      object cxGridDBTableView1Column3: TcxGridDBColumn
        DataBinding.FieldName = 'Ciudad'
        Width = 106
      end
      object cxGridDBTableView1Column4: TcxGridDBColumn
        DataBinding.FieldName = 'Colonia'
        Width = 110
      end
      object cxGridDBTableView1Column5: TcxGridDBColumn
        DataBinding.FieldName = 'Domicilio'
      end
    end
  end
  inherited cdsBuscar: TDACDSDataTable
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
        Name = 'NoInterior'
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
    OnFilterRecord = cdsBuscarFilterRecord
    LogicalName = 'dbo CLIENTE'
    Left = 511
    Top = 272
  end
  inherited dsBuscar: TDADataSource
    DataSet = cdsBuscar.Dataset
  end
end
