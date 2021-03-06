inherited frmEmpleado: TfrmEmpleado
  Caption = 'frmEmpleado'
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
          object dbgCatalogoDBTableView1IDEMPLEADO: TcxGridDBColumn
            Caption = 'ID'
            DataBinding.FieldName = 'IDEMPLEADO'
            Width = 54
          end
          object dbgCatalogoDBTableView1CODIGOEMPLEADO: TcxGridDBColumn
            DataBinding.FieldName = 'CODIGOEMPLEADO'
            Width = 113
          end
          object dbgCatalogoDBTableView1NOMBRE: TcxGridDBColumn
            DataBinding.FieldName = 'NOMBRE'
          end
          object dbgCatalogoDBTableView1DOMICILIO: TcxGridDBColumn
            DataBinding.FieldName = 'DOMICILIO'
          end
          object dbgCatalogoDBTableView1CIUDAD: TcxGridDBColumn
            DataBinding.FieldName = 'CIUDAD'
          end
          object dbgCatalogoDBTableView1TELEFONO: TcxGridDBColumn
            DataBinding.FieldName = 'TELEFONO'
          end
          object dbgCatalogoDBTableView1STATUS: TcxGridDBColumn
            DataBinding.FieldName = 'STATUS'
          end
          object dbgCatalogoDBTableView1CUENTACONTABLE: TcxGridDBColumn
            DataBinding.FieldName = 'CUENTACONTABLE'
          end
          object dbgCatalogoDBTableView1FECHAALTA: TcxGridDBColumn
            DataBinding.FieldName = 'FECHAALTA'
          end
          object dbgCatalogoDBTableView1FECHABAJA: TcxGridDBColumn
            DataBinding.FieldName = 'FECHABAJA'
          end
        end
      end
    end
    inherited cxTabSheet2: TcxTabSheet
      ExplicitLeft = 3
      ExplicitTop = 3
      ExplicitWidth = 616
      ExplicitHeight = 416
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 616
        Height = 30
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Caption = ' Informacion del Empleado'
        Color = clBtnShadow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 11
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
        TabOrder = 12
      end
      object TxtNoProducto: TcxDBTextEdit
        Left = 126
        Top = 47
        TabStop = False
        DataBinding.DataField = 'IDEMPLEADO'
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
        Width = 65
      end
      object TxtNombre: TcxDBTextEdit
        Left = 126
        Top = 74
        DataBinding.DataField = 'NOMBRE'
        DataBinding.DataSource = dsCatalogo
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 1
        Width = 342
      end
      object LblNombre: TcxLabel
        Left = 16
        Top = 75
        Caption = 'Nombre'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object LblNoProducto: TcxLabel
        Left = 16
        Top = 48
        Caption = 'ID'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object cxLabel1: TcxLabel
        Left = 16
        Top = 102
        Caption = 'Codigo del Empleado'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object cxDBTextEdit1: TcxDBTextEdit
        Left = 126
        Top = 101
        DataBinding.DataField = 'CODIGOEMPLEADO'
        DataBinding.DataSource = dsCatalogo
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 2
        Width = 104
      end
      object cxLabel2: TcxLabel
        Left = 16
        Top = 128
        Caption = 'Domicilio'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object cxDBTextEdit2: TcxDBTextEdit
        Left = 126
        Top = 127
        DataBinding.DataField = 'DOMICILIO'
        DataBinding.DataSource = dsCatalogo
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 3
        Width = 342
      end
      object cxDBTextEdit3: TcxDBTextEdit
        Left = 126
        Top = 154
        DataBinding.DataField = 'CIUDAD'
        DataBinding.DataSource = dsCatalogo
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 4
        Width = 166
      end
      object cxLabel3: TcxLabel
        Left = 16
        Top = 156
        Caption = 'Ciudad'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object cxLabel4: TcxLabel
        Left = 16
        Top = 183
        Caption = 'Telefono'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object cxDBTextEdit4: TcxDBTextEdit
        Left = 126
        Top = 182
        DataBinding.DataField = 'TELEFONO'
        DataBinding.DataSource = dsCatalogo
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 5
        Width = 166
      end
      object cxLabel8: TcxLabel
        Left = 16
        Top = 212
        Caption = 'Status'
        ParentFont = False
        Style.BorderStyle = ebsNone
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        Style.Shadow = False
        Style.IsFontAssigned = True
        Transparent = True
      end
      object cxDBTextEdit9: TcxDBTextEdit
        Left = 152
        Top = 264
        DataBinding.DataField = 'CUENTACONTABLE'
        DataBinding.DataSource = dsCatalogo
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 8
        Width = 140
      end
      object cxLabel9: TcxLabel
        Left = 16
        Top = 265
        Caption = 'Cuenta Contable (Faltante)'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object cxLabel10: TcxLabel
        Left = 16
        Top = 292
        Caption = 'Fecha Alta'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object cxLabel5: TcxLabel
        Left = 16
        Top = 318
        Caption = 'Fecha Baja'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object cxDBDateEdit1: TcxDBDateEdit
        Left = 126
        Top = 291
        DataBinding.DataField = 'FECHAALTA'
        DataBinding.DataSource = dsCatalogo
        TabOrder = 9
        Width = 166
      end
      object cxDBDateEdit2: TcxDBDateEdit
        Left = 126
        Top = 317
        DataBinding.DataField = 'FECHABAJA'
        DataBinding.DataSource = dsCatalogo
        TabOrder = 10
        Width = 166
      end
      object cxDBLookupComboBox1: TcxDBLookupComboBox
        Left = 126
        Top = 209
        DataBinding.DataField = 'STATUS'
        DataBinding.DataSource = dsCatalogo
        Properties.KeyFieldNames = 'IDSTATUS'
        Properties.ListColumns = <
          item
            FieldName = 'NOMBRE'
          end
          item
            FieldName = 'CODIGO'
          end>
        Properties.ListSource = dsStatus
        TabOrder = 6
        Width = 166
      end
      object cxLabel6: TcxLabel
        Left = 16
        Top = 238
        Caption = 'IMSS'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object cxDBTextEdit5: TcxDBTextEdit
        Left = 126
        Top = 237
        DataBinding.DataField = 'IMSS'
        DataBinding.DataSource = dsCatalogo
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 7
        Width = 166
      end
    end
  end
  inherited cdsCatalogo: TDAMemDataTable
    Fields = <
      item
        Name = 'IDEMPLEADO'
        DataType = datInteger
      end
      item
        Name = 'NOMBRE'
        DataType = datString
        Size = 50
      end
      item
        Name = 'CODIGOEMPLEADO'
        DataType = datString
        Size = 10
      end
      item
        Name = 'DOMICILIO'
        DataType = datString
        Size = 80
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
        Name = 'STATUS'
        DataType = datInteger
      end
      item
        Name = 'CUENTACONTABLE'
        DataType = datString
        Size = 20
      end
      item
        Name = 'FECHAALTA'
        DataType = datDateTime
      end
      item
        Name = 'FECHABAJA'
        DataType = datDateTime
      end
      item
        Name = 'IMSS'
        DataType = datString
        Size = 50
      end>
    RemoteDataAdapter = DM.RemoteDataAdapter
    OnNewRecord = cdsCatalogoNewRecord
    LogicalName = 'dbo EMPLEADO'
  end
  inherited dsCatalogo: TDADataSource
    DataSet = cdsCatalogo.Dataset
    Top = 344
  end
  object cdsStatus: TDAMemDataTable
    RemoteUpdatesOptions = []
    Fields = <
      item
        Name = 'IDSTATUS'
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
      end>
    Params = <>
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = DM.RemoteDataAdapter
    AfterPost = cdsCatalogoAfterPost
    AfterDelete = cdsCatalogoAfterPost
    LogicalName = 'dbo STATUS'
    IndexDefs = <>
    Left = 464
    Top = 312
  end
  object dsStatus: TDADataSource
    DataSet = cdsStatus.Dataset
    OnStateChange = dsCatalogoStateChange
    DataTable = cdsStatus
    Left = 464
    Top = 344
  end
end
