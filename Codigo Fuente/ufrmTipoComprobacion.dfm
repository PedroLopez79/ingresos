inherited frmTipoComprobacion: TfrmTipoComprobacion
  Caption = 'frmTipoComprobacion'
  ExplicitWidth = 625
  ExplicitHeight = 449
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
            Caption = 'ID'
            DataBinding.FieldName = 'RecID'
            Visible = False
          end
          object dbgCatalogoDBTableView1IDTIPOCOMPROBACION: TcxGridDBColumn
            Caption = 'ID'
            DataBinding.FieldName = 'IDTIPOCOMPROBACION'
            Width = 46
          end
          object dbgCatalogoDBTableView1DESCRIPCION: TcxGridDBColumn
            DataBinding.FieldName = 'DESCRIPCION'
            Width = 298
          end
          object dbgCatalogoDBTableView1CUENTACONCENTRADORA: TcxGridDBColumn
            DataBinding.FieldName = 'CUENTACONCENTRADORA'
            Width = 158
          end
          object dbgCatalogoDBTableView1CC: TcxGridDBColumn
            DataBinding.FieldName = 'CC'
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
        Caption = ' Informacion de Tipos de Comprobacion'
        Color = clBtnShadow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 4
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
        TabOrder = 5
      end
      object LblNoProducto: TcxLabel
        Left = 16
        Top = 48
        Hint = ''
        Caption = 'ID'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object TxtNoProducto: TcxDBTextEdit
        Left = 133
        Top = 47
        Hint = ''
        TabStop = False
        DataBinding.DataField = 'IDTIPOCOMPROBACION'
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
        Width = 67
      end
      object LblNombre: TcxLabel
        Left = 16
        Top = 88
        Hint = ''
        Caption = 'Descripcion'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object TxtNombre: TcxDBTextEdit
        Left = 133
        Top = 87
        Hint = ''
        DataBinding.DataField = 'DESCRIPCION'
        DataBinding.DataSource = dsCatalogo
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 1
        Width = 337
      end
      object cxLabel1: TcxLabel
        Left = 16
        Top = 131
        Hint = ''
        Caption = 'Cuenta Concentradora'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object cxDBTextEdit1: TcxDBTextEdit
        Left = 133
        Top = 130
        Hint = ''
        DataBinding.DataField = 'CUENTACONCENTRADORA'
        DataBinding.DataSource = dsCatalogo
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 2
        Width = 166
      end
      object cxLabel2: TcxLabel
        Left = 16
        Top = 179
        Hint = ''
        Caption = 'Cuenta Contable'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object cxDBTextEdit2: TcxDBTextEdit
        Left = 133
        Top = 178
        Hint = ''
        DataBinding.DataField = 'CC'
        DataBinding.DataSource = dsCatalogo
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 3
        Width = 166
      end
      object cxDBCheckBox1: TcxDBCheckBox
        Left = 133
        Top = 224
        Hint = ''
        Caption = 'Es Credito, Debito o Cupon ?'
        DataBinding.DataField = 'ESCREDITODEBITOYCUPON'
        DataBinding.DataSource = dsCatalogo
        TabOrder = 10
        Transparent = True
        OnMouseDown = cxDBCheckBox1MouseDown
        Width = 161
      end
      object cxDBCheckBox3: TcxDBCheckBox
        Left = 16
        Top = 247
        Hint = ''
        Caption = 'Es Producto ?'
        DataBinding.DataField = 'ESPRODUCTO'
        DataBinding.DataSource = dsCatalogo
        TabOrder = 11
        Transparent = True
        OnMouseDown = cxDBCheckBox3MouseDown
        Width = 97
      end
      object cxDBCheckBox2: TcxDBCheckBox
        Left = 16
        Top = 224
        Hint = ''
        Caption = 'Es Combustible ?'
        DataBinding.DataField = 'ESCOMBUSTIBLE'
        DataBinding.DataSource = dsCatalogo
        TabOrder = 12
        Transparent = True
        OnMouseDown = cxDBCheckBox2MouseDown
        Width = 111
      end
      object cxDBCheckBox4: TcxDBCheckBox
        Left = 133
        Top = 247
        Hint = ''
        Caption = 'Es Efectivos ?'
        DataBinding.DataField = 'ESEFECTIVO'
        DataBinding.DataSource = dsCatalogo
        TabOrder = 13
        Transparent = True
        OnMouseDown = cxDBCheckBox4MouseDown
        Width = 97
      end
      object cxDBCheckBox5: TcxDBCheckBox
        Left = 300
        Top = 224
        Hint = ''
        Caption = 'Es Salida de Efectivos ?'
        DataBinding.DataField = 'ESSALIDAEFECTIVO'
        DataBinding.DataSource = dsCatalogo
        TabOrder = 14
        Transparent = True
        OnMouseDown = cxDBCheckBox5MouseDown
        Width = 137
      end
      object cxDBCheckBox6: TcxDBCheckBox
        Left = 300
        Top = 247
        Hint = ''
        Caption = 'Es Cliente ?'
        DataBinding.DataField = 'ESCLIENTE'
        DataBinding.DataSource = dsCatalogo
        TabOrder = 15
        Transparent = True
        OnMouseDown = cxDBCheckBox6MouseDown
        Width = 97
      end
    end
  end
  inherited cdsCatalogo: TDAMemDataTable
    Fields = <
      item
        Name = 'IDTIPOCOMPROBACION'
        DataType = datInteger
      end
      item
        Name = 'DESCRIPCION'
        DataType = datString
        Size = 50
      end
      item
        Name = 'CUENTACONCENTRADORA'
        DataType = datString
        Size = 25
      end
      item
        Name = 'CC'
        DataType = datString
        Size = 25
      end
      item
        Name = 'ESCREDITODEBITOYCUPON'
        DataType = datBoolean
      end
      item
        Name = 'ESPRODUCTO'
        DataType = datBoolean
      end
      item
        Name = 'ESCOMBUSTIBLE'
        DataType = datBoolean
      end
      item
        Name = 'ESCLIENTE'
        DataType = datBoolean
      end
      item
        Name = 'ESEFECTIVO'
        DataType = datBoolean
      end
      item
        Name = 'ESSALIDAEFECTIVO'
        DataType = datBoolean
      end>
    LogicalName = 'dbo TIPOCOMPROBACION'
    RemoteDataAdapter = DM.RemoteDataAdapter
    AfterEdit = cdsCatalogoAfterEdit
    OnNewRecord = cdsCatalogoNewRecord
  end
  inherited dsCatalogo: TDADataSource
    DataSet = cdsCatalogo.Dataset
  end
  object cdsBuscaTiposFijos: TDACDSDataTable
    Fields = <>
    LogicalName = 'Reporte'
    Params = <
      item
        Name = 'TurnoID'
        Value = '1'
        ParamType = daptInput
      end>
    ReadOnly = True
    RemoteDataAdapter = rdaBuscaTiposFijos
    RemoteUpdatesOptions = []
    StreamingOptions = [soDisableEventsWhileStreaming]
    IndexDefs = <>
    Left = 8
    Top = 368
  end
  object rdaBuscaTiposFijos: TDARemoteDataAdapter
    GetSchemaCall.RemoteService = DM.RemoteService
    GetDataCall.RemoteService = DM.RemoteService
    GetDataCall.MethodName = 'AbreDataSetReportes'
    GetDataCall.Params = <
      item
        Name = 'Result'
        DataType = rtBinary
        Flag = fResult
        Value = Null
      end
      item
        Name = 'SQL'
        DataType = rtString
        Flag = fIn
        Value = Null
      end
      item
        Name = 'Parametros'
        DataType = rtUserDefined
        Flag = fIn
        TypeName = 'TParametrosBI'
        Value = Null
      end>
    GetDataCall.Default = False
    GetDataCall.OutgoingTableNamesParameter = 'aTableNameArray'
    GetDataCall.OutgoingTableRequestInfosParameter = 'aTableRequestInfoArray'
    GetDataCall.IncomingDataParameter = 'Result'
    UpdateDataCall.RemoteService = DM.RemoteService
    GetScriptsCall.RemoteService = DM.RemoteService
    RemoteService = DM.RemoteService
    DataStreamer = DM.DataStreamer
    Left = 40
    Top = 368
  end
end
