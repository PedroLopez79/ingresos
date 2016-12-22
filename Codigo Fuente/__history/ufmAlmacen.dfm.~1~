inherited frmAlmacen: TfrmAlmacen
  Caption = 'frmAlmacen'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcCatalogo: TcxPageControl
    inherited cxTabSheet1: TcxTabSheet
      ExplicitLeft = 3
      ExplicitTop = 3
      ExplicitWidth = 616
      ExplicitHeight = 416
      inherited dbgCatalogo: TcxGrid
        inherited dbgCatalogoDBTableView1: TcxGridDBTableView
          object dbgCatalogoDBTableView1RecID: TcxGridDBColumn
            DataBinding.FieldName = 'RecID'
            Visible = False
          end
          object dbgCatalogoDBTableView1IDALMACEN: TcxGridDBColumn
            Caption = 'ID'
            DataBinding.FieldName = 'IDALMACEN'
            Width = 51
          end
          object dbgCatalogoDBTableView1NOMBRE: TcxGridDBColumn
            DataBinding.FieldName = 'NOMBRE'
            Width = 378
          end
          object dbgCatalogoDBTableView1IDEMPRESA: TcxGridDBColumn
            DataBinding.FieldName = 'IDEMPRESA'
            Width = 107
          end
        end
      end
    end
    inherited cxTabSheet2: TcxTabSheet
      ExplicitLeft = 3
      ExplicitTop = 3
      ExplicitWidth = 616
      ExplicitHeight = 416
      object LblNoProducto: TcxLabel
        Left = 16
        Top = 48
        Caption = 'Almacen'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object TxtNoProducto: TcxDBTextEdit
        Left = 173
        Top = 47
        TabStop = False
        DataBinding.DataField = 'IDALMACEN'
        DataBinding.DataSource = dsCatalogo
        Enabled = False
        Properties.CharCase = ecUpperCase
        Properties.ReadOnly = False
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 0
        Width = 97
      end
      object LblNombre: TcxLabel
        Left = 16
        Top = 76
        Caption = 'Nombre'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object TxtNombre: TcxDBTextEdit
        Left = 173
        Top = 75
        DataBinding.DataField = 'NOMBRE'
        DataBinding.DataSource = dsCatalogo
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 1
        Width = 412
      end
      object cxLabel11: TcxLabel
        Left = 16
        Top = 104
        Caption = 'Empresa (Estacion de Servicio)'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object cxDBLookupComboBox1: TcxDBLookupComboBox
        Left = 173
        Top = 102
        DataBinding.DataField = 'IDEMPRESA'
        DataBinding.DataSource = dsCatalogo
        Properties.KeyFieldNames = 'NUMEROESTACION'
        Properties.ListColumns = <
          item
            FieldName = 'EMPRESA'
          end>
        Properties.ListSource = dsEmpresa
        TabOrder = 2
        Width = 412
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 616
        Height = 30
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Caption = ' Informacion de Clientes'
        Color = clBtnShadow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 6
      end
      object Panel2: TPanel
        Left = 0
        Top = 30
        Width = 616
        Height = 2
        Align = alTop
        BevelOuter = bvNone
        Color = clNone
        ParentBackground = False
        TabOrder = 7
      end
    end
  end
  inherited cdsCatalogo: TDAMemDataTable
    Fields = <
      item
        Name = 'IDALMACEN'
        DataType = datInteger
        Required = True
        InPrimaryKey = True
      end
      item
        Name = 'NOMBRE'
        DataType = datString
        Size = 70
      end
      item
        Name = 'IDEMPRESA'
        DataType = datInteger
      end>
    RemoteDataAdapter = DM.RemoteDataAdapter
    OnNewRecord = cdsCatalogoNewRecord
    LogicalName = 'dbo ALMACEN'
  end
  inherited dsCatalogo: TDADataSource
    DataSet = cdsCatalogo.Dataset
    Top = 344
  end
  object cdsEmpresa: TDAMemDataTable
    RemoteUpdatesOptions = []
    Fields = <
      item
        Name = 'IDCONFIGURACION'
        DataType = datInteger
      end
      item
        Name = 'TIPOCAMBIO'
        DataType = datFloat
      end
      item
        Name = 'EMPRESA'
        DataType = datString
        Size = 50
      end
      item
        Name = 'LOGO'
        DataType = datMemo
      end
      item
        Name = 'DIRECCION'
        DataType = datString
        Size = 70
      end
      item
        Name = 'TELEFONO'
        DataType = datString
        Size = 20
      end
      item
        Name = 'FORMATOCONTROL'
        DataType = datMemo
      end
      item
        Name = 'FAX'
        DataType = datString
        Size = 20
      end
      item
        Name = 'CUENTABANCO1'
        DataType = datString
        Size = 25
      end
      item
        Name = 'RFC'
        DataType = datString
        Size = 50
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
      end
      item
        Name = 'ImpuestoPorcentaje'
        DataType = datFloat
      end
      item
        Name = 'CC'
        DataType = datString
        Size = 20
      end
      item
        Name = 'CLAVEPEMEX'
        DataType = datString
        Size = 50
      end
      item
        Name = 'CIUDAD'
        DataType = datString
        Size = 30
      end
      item
        Name = 'BOMBAS'
        DataType = datInteger
      end
      item
        Name = 'HOST'
        DataType = datString
        Size = 30
      end
      item
        Name = 'NUMEROESTACION'
        DataType = datInteger
      end
      item
        Name = 'EMAIL'
        DataType = datString
        Size = 50
      end>
    Params = <>
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = DM.RemoteDataAdapter
    AfterPost = cdsCatalogoAfterPost
    AfterDelete = cdsCatalogoAfterPost
    LogicalName = 'dbo CONFIGURACION'
    IndexDefs = <>
    Left = 464
    Top = 312
  end
  object dsEmpresa: TDADataSource
    DataSet = cdsEmpresa.Dataset
    OnStateChange = dsCatalogoStateChange
    DataTable = cdsEmpresa
    Left = 464
    Top = 344
  end
end
