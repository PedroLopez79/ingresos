inherited frmTanque: TfrmTanque
  Caption = 'frmTanque'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcCatalogo: TcxPageControl
    ActivePage = cxTabSheet2
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
          object dbgCatalogoDBTableView1NUMTANQUE: TcxGridDBColumn
            Caption = '# TANQUE'
            DataBinding.FieldName = 'NUMTANQUE'
            Width = 86
          end
          object dbgCatalogoDBTableView1NOMBRE: TcxGridDBColumn
            DataBinding.FieldName = 'NOMBRE'
            Width = 231
          end
          object dbgCatalogoDBTableView1CAPACIDAD: TcxGridDBColumn
            DataBinding.FieldName = 'CAPACIDAD'
            Width = 110
          end
          object dbgCatalogoDBTableView1FONDAJE: TcxGridDBColumn
            DataBinding.FieldName = 'FONDAJE'
          end
          object dbgCatalogoDBTableView1IDPRODUCTO: TcxGridDBColumn
            Caption = 'PRODUCTO'
            DataBinding.FieldName = 'IDPRODUCTO'
            Width = 93
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
        Top = 56
        Caption = 'ID'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object TxtNoProducto: TcxDBTextEdit
        Left = 77
        Top = 55
        TabStop = False
        DataBinding.DataField = 'IDTANQUE'
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
        Width = 51
      end
      object TxtNombre: TcxDBTextEdit
        Left = 77
        Top = 93
        DataBinding.DataField = 'NUMTANQUE'
        DataBinding.DataSource = dsCatalogo
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 1
        Width = 81
      end
      object LblNombre: TcxLabel
        Left = 16
        Top = 94
        Caption = '# Tanque'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object cxLabel11: TcxLabel
        Left = 16
        Top = 254
        Caption = 'Producto'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object cxDBLookupComboBox1: TcxDBLookupComboBox
        Left = 77
        Top = 253
        DataBinding.DataField = 'IDPRODUCTO'
        DataBinding.DataSource = dsCatalogo
        Properties.KeyFieldNames = 'IDPRODUCTO'
        Properties.ListColumns = <
          item
            FieldName = 'NOMBRE'
          end
          item
            FieldName = 'CODIGOPRODUCTO'
          end>
        Properties.ListSource = dsProductos
        TabOrder = 5
        Width = 210
      end
      object cxLabel2: TcxLabel
        Left = 16
        Top = 134
        Caption = 'Nombre'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object cxDBTextEdit2: TcxDBTextEdit
        Left = 77
        Top = 133
        DataBinding.DataField = 'NOMBRE'
        DataBinding.DataSource = dsCatalogo
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 2
        Width = 210
      end
      object cxLabel10: TcxLabel
        Left = 16
        Top = 174
        Caption = 'Capacidad'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object cxDBTextEdit10: TcxDBTextEdit
        Left = 77
        Top = 173
        DataBinding.DataField = 'CAPACIDAD'
        DataBinding.DataSource = dsCatalogo
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 3
        Width = 169
      end
      object Panel2: TPanel
        Left = 0
        Top = 30
        Width = 616
        Height = 2
        Align = alTop
        BevelOuter = bvNone
        Caption = ' Informacion de Tanque'
        Color = clNone
        ParentBackground = False
        TabOrder = 11
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 616
        Height = 30
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Caption = ' Informacion de Tanque'
        Color = clBtnShadow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 12
      end
      object cxLabel1: TcxLabel
        Left = 16
        Top = 214
        Caption = 'Fondaje'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object cxDBTextEdit1: TcxDBTextEdit
        Left = 77
        Top = 213
        DataBinding.DataField = 'FONDAJE'
        DataBinding.DataSource = dsCatalogo
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 4
        Width = 169
      end
    end
  end
  inherited cdsCatalogo: TDAMemDataTable
    Fields = <
      item
        Name = 'IDTANQUE'
        DataType = datInteger
        Required = True
        InPrimaryKey = True
      end
      item
        Name = 'NUMTANQUE'
        DataType = datInteger
      end
      item
        Name = 'NOMBRE'
        DataType = datString
        Size = 50
      end
      item
        Name = 'CAPACIDAD'
        DataType = datFloat
      end
      item
        Name = 'FONDAJE'
        DataType = datFloat
      end
      item
        Name = 'IDPRODUCTO'
        DataType = datInteger
        Required = True
      end>
    RemoteDataAdapter = DM.RemoteDataAdapter
    OnNewRecord = cdsCatalogoNewRecord
    LogicalName = 'dbo TANQUE'
  end
  inherited dsCatalogo: TDADataSource
    DataSet = cdsCatalogo.Dataset
  end
  object dsProductos: TDADataSource
    DataSet = cdsProducto.Dataset
    OnStateChange = dsCatalogoStateChange
    DataTable = cdsProducto
    Left = 456
    Top = 360
  end
  object cdsProducto: TDAMemDataTable
    RemoteUpdatesOptions = []
    Fields = <
      item
        Name = 'IDPRODUCTO'
        DataType = datInteger
        Required = True
      end
      item
        Name = 'CODIGOPRODUCTO'
        DataType = datString
        Size = 10
        Required = True
      end
      item
        Name = 'NOMBRE'
        DataType = datString
        Size = 150
      end
      item
        Name = 'PRECIOVENTA'
        DataType = datFloat
        Required = True
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
        Name = 'CCCOMPRA'
        DataType = datString
        Size = 20
      end
      item
        Name = 'CCIVA'
        DataType = datString
        Size = 20
      end
      item
        Name = 'IEPS'
        DataType = datFloat
      end
      item
        Name = 'PUNTOS'
        DataType = datInteger
      end
      item
        Name = 'IDLINEA'
        DataType = datInteger
      end
      item
        Name = 'IDUNIDADMEDIDA'
        DataType = datInteger
      end>
    Params = <>
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = DM.RemoteDataAdapter
    AfterPost = cdsCatalogoAfterPost
    AfterDelete = cdsCatalogoAfterPost
    LogicalName = 'dbo PRODUCTO'
    IndexDefs = <>
    Left = 456
    Top = 312
  end
end
