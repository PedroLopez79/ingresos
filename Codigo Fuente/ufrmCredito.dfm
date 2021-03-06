inherited frmCredito: TfrmCredito
  Caption = 'frmCredito'
  ClientHeight = 524
  ClientWidth = 781
  ExplicitWidth = 781
  ExplicitHeight = 524
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox2: TcxGroupBox
    Left = 0
    Top = 0
    Align = alLeft
    TabOrder = 0
    Height = 524
    Width = 477
    object cxGroupBox4: TcxGroupBox
      Left = 2
      Top = 5
      TabStop = True
      Align = alTop
      Style.Edges = []
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 0
      Height = 175
      Width = 473
      object Label3: TLabel
        Left = 12
        Top = 124
        Width = 31
        Height = 13
        Caption = 'Banco'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label5: TLabel
        Left = 12
        Top = 54
        Width = 30
        Height = 13
        Caption = 'Fecha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label6: TLabel
        Left = 12
        Top = 78
        Width = 82
        Height = 13
        Caption = 'Fecha Aplicacion'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label7: TLabel
        Left = 12
        Top = 101
        Width = 52
        Height = 13
        Caption = 'Referencia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label8: TLabel
        Left = 12
        Top = 147
        Width = 37
        Height = 13
        Caption = 'Cheque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label13: TLabel
        Left = 12
        Top = 30
        Width = 37
        Height = 13
        Caption = 'Nombre'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label2: TLabel
        Left = 12
        Top = 6
        Width = 42
        Height = 13
        Caption = '# Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label1: TLabel
        Left = 324
        Top = 78
        Width = 122
        Height = 13
        Caption = 'Total A pagar Recibo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object dtpFecha: TcxDBDateEdit
        Left = 105
        Top = 51
        DataBinding.DataField = 'FechaMovimiento'
        DataBinding.DataSource = dsRecibo
        Enabled = False
        TabOrder = 6
        Width = 121
      end
      object cxDBDateEdit3: TcxDBDateEdit
        Left = 105
        Top = 75
        DataBinding.DataField = 'FechaAplicacion'
        DataBinding.DataSource = dsRecibo
        TabOrder = 1
        Width = 121
      end
      object dbeCheque: TcxDBTextEdit
        Left = 105
        Top = 144
        DataBinding.DataField = 'Cheque'
        DataBinding.DataSource = dsRecibo
        Properties.CharCase = ecUpperCase
        TabOrder = 4
        Width = 205
      end
      object cxDBTextEdit2: TcxDBTextEdit
        Left = 105
        Top = 98
        DataBinding.DataField = 'Referencia'
        DataBinding.DataSource = dsRecibo
        Properties.CharCase = ecUpperCase
        TabOrder = 2
        Width = 205
      end
      object cxDBLookupComboBox1: TcxDBLookupComboBox
        Left = 105
        Top = 121
        DataBinding.DataField = 'BancoID'
        DataBinding.DataSource = dsRecibo
        Properties.KeyFieldNames = 'BancoID'
        Properties.ListColumns = <
          item
            FieldName = 'Nombre'
          end>
        Properties.ListSource = dsBancos
        TabOrder = 3
        Width = 205
      end
      object edtNombre: TcxTextEdit
        Left = 105
        Top = 27
        TabStop = False
        Enabled = False
        Properties.ReadOnly = True
        Style.TextColor = clNavy
        TabOrder = 5
        Width = 363
      end
      object edtCliente: TcxCurrencyEdit
        Left = 105
        Top = 3
        EditValue = 0
        Properties.DisplayFormat = '#'
        TabOrder = 0
        OnEnter = edtClienteEnter
        OnExit = edtClienteExit
        OnKeyDown = edtClienteKeyDown
        Width = 97
      end
      object cxDBTextEdit1: TcxDBTextEdit
        Left = 324
        Top = 98
        DataBinding.DataField = 'Importe'
        DataBinding.DataSource = dsRecibo
        Properties.CharCase = ecUpperCase
        TabOrder = 7
        Width = 144
      end
    end
    object cxGroupBox1: TcxGroupBox
      Left = 2
      Top = 180
      Align = alClient
      Caption = 'Facturas que se deben.'
      Style.LookAndFeel.NativeStyle = False
      Style.Shadow = False
      Style.TextStyle = [fsBold]
      Style.TransparentBorder = True
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 1
      Height = 342
      Width = 473
      object cxGrid1: TcxGrid
        Left = 2
        Top = 63
        Width = 469
        Height = 277
        Align = alClient
        TabOrder = 0
        RootLevelOptions.TabsForEmptyDetails = False
        object cxGrid1DBTableView1: TcxGridDBTableView
          DataController.DataSource = dsFacturas
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsView.GroupByBox = False
          OptionsView.Indicator = True
          object cxGrid1DBTableView1RecId: TcxGridDBColumn
            DataBinding.FieldName = 'RecId'
            Visible = False
          end
          object cxGrid1DBTableView1Incluir: TcxGridDBColumn
            Caption = '-->'
            DataBinding.FieldName = 'Incluir'
          end
          object cxGrid1DBTableView1Referencia: TcxGridDBColumn
            DataBinding.FieldName = 'Referencia'
            Width = 249
          end
          object cxGrid1DBTableView1Importe: TcxGridDBColumn
            DataBinding.FieldName = 'Importe'
            Width = 100
          end
          object cxGrid1DBTableView1MovimientoID: TcxGridDBColumn
            Caption = 'ID'
            DataBinding.FieldName = 'MovimientoID'
            Width = 68
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = cxGrid1DBTableView1
        end
      end
      object cxGroupBox3: TcxGroupBox
        Left = 2
        Top = 18
        Align = alTop
        TabOrder = 1
        Height = 45
        Width = 469
        object cxButton1: TcxButton
          Left = 3
          Top = 9
          Width = 220
          Height = 25
          Caption = 'Agregar a Facturas para Pagar'
          TabOrder = 0
          OnClick = cxButton1Click
        end
      end
    end
  end
  object cxGroupBox5: TcxGroupBox
    Left = 477
    Top = 0
    Align = alClient
    Caption = 'Facturas para Pagar'
    Style.TextStyle = [fsBold]
    TabOrder = 1
    Height = 524
    Width = 304
    object dbgFacturas: TcxGrid
      Left = 2
      Top = 18
      Width = 300
      Height = 504
      Align = alClient
      TabOrder = 0
      LookAndFeel.Kind = lfStandard
      LookAndFeel.NativeStyle = False
      object dbtvFacturas: TcxGridDBTableView
        OnEditValueChanged = dbtvFacturasEditValueChanged
        DataController.DataSource = dsReciboFactura
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = '$#,#0.00'
            Kind = skSum
            Column = dbtvFacturasColumn2
          end>
        DataController.Summary.SummaryGroups = <>
        NewItemRow.InfoText = 'Haga click aqui para agregar un registro nuevo'
        NewItemRow.Visible = True
        OptionsBehavior.FocusFirstCellOnNewRecord = True
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.IncSearch = True
        OptionsBehavior.FocusCellOnCycle = True
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnSorting = False
        OptionsData.Appending = True
        OptionsSelection.MultiSelect = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        object dbtvFacturasColumn1: TcxGridDBColumn
          Caption = 'Documento'
          DataBinding.FieldName = 'MovimientoID'
          PropertiesClassName = 'TcxImageComboBoxProperties'
          Properties.Items = <>
          Width = 317
        end
        object dbtvFacturasColumn2: TcxGridDBColumn
          Caption = 'Importe'
          DataBinding.FieldName = 'Abono'
          Width = 97
        end
      end
      object cxGridLevel1: TcxGridLevel
        GridView = dbtvFacturas
      end
    end
  end
  object dsBancos: TDADataSource
    DataSet = cdsBancos.Dataset
    DataTable = cdsBancos
    Left = 168
    Top = 368
  end
  object cdsBancos: TDACDSDataTable
    RemoteUpdatesOptions = []
    Fields = <
      item
        Name = 'BancoID'
        DataType = datInteger
        Required = True
        InPrimaryKey = True
      end
      item
        Name = 'Nombre'
        DataType = datString
        Size = 50
        Required = True
      end
      item
        Name = 'CuentaContable'
        DataType = datString
        Size = 50
      end>
    Params = <>
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = DMFlotillas.RemoteDataAdapter
    LogicalName = 'dbo Banco'
    IndexDefs = <>
    Left = 136
    Top = 368
  end
  object cdsTipoMovimiento: TDACDSDataTable
    RemoteUpdatesOptions = []
    Fields = <
      item
        Name = 'TipoMovimientoID'
        DataType = datString
        Size = 10
        Required = True
        InPrimaryKey = True
      end
      item
        Name = 'Descripcion'
        DataType = datString
        Size = 70
        Required = True
      end
      item
        Name = 'CargoAbono'
        DataType = datString
        Size = 1
        Required = True
      end>
    Params = <>
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = DMFlotillas.RemoteDataAdapter
    LogicalName = 'dbo TipoMovimiento'
    IndexDefs = <>
    Left = 136
    Top = 400
  end
  object dsTipoMovimiento: TDADataSource
    DataSet = cdsTipoMovimiento.Dataset
    DataTable = cdsTipoMovimiento
    Left = 168
    Top = 400
  end
  object dsMovimientos: TDADataSource
    DataSet = cdsMovimientos.Dataset
    DataTable = cdsMovimientos
    Left = 104
    Top = 400
  end
  object dsReciboFactura: TDADataSource
    DataSet = cdsReciboFactura.Dataset
    DataTable = cdsReciboFactura
    Left = 104
    Top = 368
  end
  object cdsMovimientos: TDACDSDataTable
    RemoteUpdatesOptions = []
    Fields = <
      item
        Name = 'MovimientoID'
        DataType = datInteger
        InPrimaryKey = True
      end
      item
        Name = 'FechaMovimiento'
        DataType = datDateTime
      end
      item
        Name = 'FechaVencimiento'
        DataType = datDateTime
      end
      item
        Name = 'Referencia'
        DataType = datString
        Size = 50
      end
      item
        Name = 'Ejercicio'
        DataType = datInteger
      end
      item
        Name = 'Periodo'
        DataType = datInteger
      end
      item
        Name = 'CargoAbono'
        DataType = datString
        Size = 1
      end
      item
        Name = 'Cargo'
        DataType = datFloat
      end
      item
        Name = 'Abono'
        DataType = datFloat
      end
      item
        Name = 'FechaRegistro'
        DataType = datDateTime
      end
      item
        Name = 'Origen'
        DataType = datString
        Size = 5
      end
      item
        Name = 'AfectaSaldos'
        DataType = datBoolean
      end
      item
        Name = 'TipoMovimientoID'
        DataType = datString
        Size = 10
      end
      item
        Name = 'UsuarioID'
        DataType = datInteger
      end
      item
        Name = 'ClienteID'
        DataType = datInteger
      end>
    Params = <
      item
        Name = 'Movimiento'
        Value = '1'
      end>
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = DMFlotillas.RemoteDataAdapter
    LogicalName = 'dbo Movimiento'
    IndexDefs = <>
    Left = 72
    Top = 400
  end
  object cdsReciboFactura: TDACDSDataTable
    RemoteUpdatesOptions = []
    Fields = <
      item
        Name = 'SaldodocumentoID'
        DataType = datInteger
      end
      item
        Name = 'Fecha'
        DataType = datDateTime
      end
      item
        Name = 'FechaVencimiento'
        DataType = datDateTime
      end
      item
        Name = 'Cargo'
        DataType = datFloat
      end
      item
        Name = 'Abono'
        DataType = datFloat
      end
      item
        Name = 'Referencia'
        DataType = datString
        Size = 50
      end
      item
        Name = 'ClienteID'
        DataType = datInteger
      end
      item
        Name = 'MovimientoID'
        DataType = datInteger
      end
      item
        Name = 'ReciboID'
        DataType = datInteger
      end
      item
        Name = 'BancoID'
        DataType = datInteger
      end>
    Params = <>
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = DMFlotillas.RemoteDataAdapter
    OnNewRecord = cdsReciboFacturaNewRecord
    LogicalName = 'dbo SaldoDocumento'
    IndexDefs = <>
    Left = 72
    Top = 368
  end
  object dsRecibo: TDADataSource
    DataSet = cdsRecibo.Dataset
    DataTable = cdsRecibo
    Left = 40
    Top = 368
  end
  object dsCliente: TDADataSource
    DataSet = cdsCliente.Dataset
    DataTable = cdsCliente
    Left = 40
    Top = 400
  end
  object cdsCliente: TDACDSDataTable
    RemoteUpdatesOptions = []
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
        Name = 'Estatus'
        DataType = datString
        Size = 1
      end
      item
        Name = 'FormaPagoID'
        DataType = datInteger
      end
      item
        Name = 'CuentaContable'
        DataType = datString
        Size = 15
      end
      item
        Name = 'FormaCompraID'
        DataType = datInteger
      end>
    Params = <
      item
        Name = 'Cliente'
        Value = '1'
        ParamType = daptInput
      end>
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = DMFlotillas.RemoteDataAdapter
    LogicalName = 'BuscaCliente'
    IndexDefs = <>
    Left = 8
    Top = 400
  end
  object cdsRecibo: TDACDSDataTable
    RemoteUpdatesOptions = []
    Fields = <
      item
        Name = 'ReciboID'
        DataType = datInteger
        InPrimaryKey = True
      end
      item
        Name = 'Folio'
        DataType = datInteger
      end
      item
        Name = 'FechaMovimiento'
        DataType = datDateTime
      end
      item
        Name = 'Ejercicio'
        DataType = datInteger
      end
      item
        Name = 'Periodo'
        DataType = datInteger
      end
      item
        Name = 'Cheque'
        DataType = datString
        Size = 50
      end
      item
        Name = 'Referencia'
        DataType = datString
        Size = 50
      end
      item
        Name = 'Importe'
        DataType = datFloat
      end
      item
        Name = 'CuentaContableCliente'
        DataType = datString
        Size = 15
      end
      item
        Name = 'FechaCaptura'
        DataType = datDateTime
      end
      item
        Name = 'FechaAplicacion'
        DataType = datDateTime
      end
      item
        Name = 'UsuarioID'
        DataType = datInteger
      end
      item
        Name = 'ClienteID'
        DataType = datInteger
      end
      item
        Name = 'MovimientoID'
        DataType = datInteger
      end
      item
        Name = 'BancoID'
        DataType = datInteger
      end
      item
        Name = 'EstacionID'
        DataType = datInteger
      end>
    Params = <
      item
        Name = 'Recibo'
        Value = '1'
      end>
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = DMFlotillas.RemoteDataAdapter
    BeforePost = cdsReciboBeforePost
    AfterPost = cdsReciboAfterPost
    OnNewRecord = cdsReciboNewRecord
    LogicalName = 'dbo Recibo'
    IndexDefs = <>
    Left = 8
    Top = 368
  end
  object tblFacturas: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 8
    Top = 336
    object tblFacturasIncluir: TBooleanField
      FieldName = 'Incluir'
    end
    object tblFacturasReferencia: TStringField
      FieldName = 'Referencia'
      Size = 150
    end
    object tblFacturasImporte: TFloatField
      FieldName = 'Importe'
    end
    object tblFacturasMovimientoID: TIntegerField
      FieldName = 'MovimientoID'
    end
    object tblFacturasVencimiento: TDateTimeField
      FieldName = 'Vencimiento'
    end
  end
  object dsFacturas: TDataSource
    DataSet = tblFacturas
    Left = 40
    Top = 336
  end
end
