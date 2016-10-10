inherited frmBuscarAlumno: TfrmBuscarAlumno
  Caption = 'Buscar Alumno'
  ExplicitWidth = 625
  ExplicitHeight = 445
  PixelsPerInch = 96
  TextHeight = 13
  inherited dbgAgrupacion: TcxGrid
    inherited cxGridDBTableView1: TcxGridDBTableView
      object cxGridDBTableView1IDALUMNO: TcxGridDBColumn
        DataBinding.FieldName = 'IDALUMNO'
      end
      object cxGridDBTableView1NUMCONTROL: TcxGridDBColumn
        DataBinding.FieldName = 'NUMCONTROL'
        Width = 118
      end
      object cxGridDBTableView1NOMBRE: TcxGridDBColumn
        DataBinding.FieldName = 'NOMBRE'
        Width = 210
      end
      object cxGridDBTableView1PADRE: TcxGridDBColumn
        DataBinding.FieldName = 'PADRE'
        Width = 245
      end
      object cxGridDBTableView1MADRE: TcxGridDBColumn
        DataBinding.FieldName = 'MADRE'
        Width = 172
      end
      object cxGridDBTableView1DIRECCION: TcxGridDBColumn
        DataBinding.FieldName = 'DIRECCION'
      end
      object cxGridDBTableView1TELEFONOCASA: TcxGridDBColumn
        DataBinding.FieldName = 'TELEFONOCASA'
      end
    end
  end
  inherited cdsBuscar: TDACDSDataTable
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
    RemoteDataAdapter = DM.RemoteDataAdapter
    OnFilterRecord = cdsBuscarFilterRecord
    LogicalName = 'dbo ALUMNO'
    Left = 511
    Top = 272
  end
  inherited dsBuscar: TDADataSource
    DataSet = cdsBuscar.Dataset
  end
end
