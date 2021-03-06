inherited frmVales: TfrmVales
  Caption = 'frmVales'
  ClientHeight = 407
  ClientWidth = 594
  ExplicitWidth = 594
  ExplicitHeight = 407
  PixelsPerInch = 96
  TextHeight = 13
  object dbgCupones: TcxGrid
    Left = 0
    Top = 121
    Width = 594
    Height = 286
    Align = alClient
    TabOrder = 2
    LookAndFeel.Kind = lfStandard
    LookAndFeel.NativeStyle = True
    ExplicitWidth = 533
    ExplicitHeight = 407
    object dbgCuponesDBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsCuponesGrid
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '##,###,##0.#0'
          Kind = skSum
        end
        item
          Format = '##,###,##0.#0'
          Kind = skSum
        end
        item
          Format = '##,###,##0.#0'
          Kind = skSum
        end
        item
          Format = '$#,#0.00'
          Kind = skSum
          Column = dbgCuponesDBTableView1Total
        end>
      DataController.Summary.SummaryGroups = <>
      NewItemRow.Visible = True
      OptionsBehavior.FocusCellOnTab = True
      OptionsBehavior.FocusFirstCellOnNewRecord = True
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.FocusCellOnCycle = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      Styles.ContentEven = DM.cxStyle1
      object dbgCuponesDBTableView1Cantidad: TcxGridDBColumn
        DataBinding.FieldName = 'Cantidad'
        Width = 90
      end
      object dbgCuponesDBTableView1Denominacion: TcxGridDBColumn
        DataBinding.FieldName = 'Denominacion'
        Width = 84
      end
      object dbgCuponesDBTableView1Referencia: TcxGridDBColumn
        DataBinding.FieldName = 'Referencia'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
      end
      object dbgCuponesDBTableView1Total: TcxGridDBColumn
        DataBinding.FieldName = 'Total'
        Options.Editing = False
        Options.Focusing = False
        Width = 106
      end
    end
    object cxGridLevel5: TcxGridLevel
      GridView = dbgCuponesDBTableView1
    end
  end
  object cxGroupBox2: TcxGroupBox
    Left = 0
    Top = 0
    Align = alTop
    Caption = 'Datos de la Factura'
    TabOrder = 0
    ExplicitWidth = 533
    Height = 121
    Width = 594
    object Label8: TLabel
      Left = 16
      Top = 56
      Width = 32
      Height = 13
      Caption = 'Cliente'
      Transparent = True
    end
    object Label10: TLabel
      Left = 155
      Top = 27
      Width = 30
      Height = 13
      Caption = 'Fecha'
      Transparent = True
    end
    object Label1: TLabel
      Left = 18
      Top = 27
      Width = 21
      Height = 13
      Caption = 'Lote'
      Transparent = True
    end
    object Label2: TLabel
      Left = 16
      Top = 88
      Width = 24
      Height = 13
      Caption = 'Total'
      Transparent = True
    end
    object Label3: TLabel
      Left = 290
      Top = 27
      Width = 58
      Height = 13
      Caption = 'Vencimineto'
      Transparent = True
    end
    object Label4: TLabel
      Left = 262
      Top = 88
      Width = 27
      Height = 13
      Caption = 'Saldo'
      Transparent = True
    end
    object dbeCliente: TcxDBTextEdit
      Left = 56
      Top = 51
      DataBinding.DataField = 'ClienteID'
      DataBinding.DataSource = dsLoteCupon
      TabOrder = 1
      OnEnter = dbeClienteEnter
      OnExit = dbeClienteExit
      OnKeyDown = dbeClienteKeyDown
      Width = 93
    end
    object cxDBDateEdit2: TcxDBDateEdit
      Left = 191
      Top = 24
      DataBinding.DataField = 'Fecha'
      DataBinding.DataSource = dsLoteCupon
      Enabled = False
      TabOrder = 0
      Width = 93
    end
    object cxDBTextEdit1: TcxDBTextEdit
      Left = 56
      Top = 24
      DataBinding.DataField = 'LoteCuponID'
      DataBinding.DataSource = dsLoteCupon
      Enabled = False
      TabOrder = 3
      Width = 93
    end
    object cxDBTextEdit2: TcxDBTextEdit
      Left = 56
      Top = 83
      DataBinding.DataField = 'Total'
      DataBinding.DataSource = dsLoteCupon
      TabOrder = 2
      Width = 93
    end
    object cxDBDateEdit1: TcxDBDateEdit
      Left = 354
      Top = 24
      DataBinding.DataField = 'FechaValido'
      DataBinding.DataSource = dsLoteCupon
      TabOrder = 4
      Width = 93
    end
    object cxDBLookupComboBox1: TcxDBLookupComboBox
      Left = 155
      Top = 51
      DataBinding.DataField = 'ClienteID'
      DataBinding.DataSource = dsLoteCupon
      Enabled = False
      Properties.KeyFieldNames = 'ClienteID'
      Properties.ListColumns = <
        item
          FieldName = 'Nombre'
        end>
      Properties.ListSource = dsCliente
      TabOrder = 5
      Width = 292
    end
    object cxCurrencyEdit1: TcxCurrencyEdit
      Left = 295
      Top = 83
      Enabled = False
      Properties.DisplayFormat = ',#.00;(,#.00);#'
      TabOrder = 6
      Width = 152
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 121
    Width = 594
    Height = 286
    Align = alClient
    TabOrder = 1
    LookAndFeel.Kind = lfStandard
    LookAndFeel.NativeStyle = False
    ExplicitLeft = 53
    ExplicitTop = 127
    ExplicitWidth = 533
    ExplicitHeight = 407
    object cxGridDBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      OnFocusedRecordChanged = cxGridDBTableView1FocusedRecordChanged
      DataController.DataSource = dsCuponesGrid
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '##,###,##0.#0'
          Kind = skSum
        end
        item
          Format = '##,###,##0.#0'
          Kind = skSum
        end
        item
          Format = '##,###,##0.#0'
          Kind = skSum
        end
        item
          Format = '$#,#0.00'
          Kind = skSum
          Column = cxGridDBColumn4
        end>
      DataController.Summary.SummaryGroups = <>
      NewItemRow.Visible = True
      OptionsBehavior.FocusCellOnTab = True
      OptionsBehavior.FocusFirstCellOnNewRecord = True
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.FocusCellOnCycle = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object cxGridDBColumn1: TcxGridDBColumn
        DataBinding.FieldName = 'Cantidad'
        Width = 90
      end
      object cxGridDBColumn2: TcxGridDBColumn
        DataBinding.FieldName = 'Denominacion'
        Width = 84
      end
      object cxGridDBColumn3: TcxGridDBColumn
        DataBinding.FieldName = 'Referencia'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.CharCase = ecUpperCase
      end
      object cxGridDBColumn4: TcxGridDBColumn
        DataBinding.FieldName = 'Total'
        Options.Editing = False
        Options.Focusing = False
        Width = 106
      end
    end
    object cxGridLevel1: TcxGridLevel
      GridView = cxGridDBTableView1
    end
  end
  object tblCuponesGrid: TdxMemData
    Indexes = <>
    SortOptions = []
    BeforePost = tblCuponesGridBeforePost
    Left = 200
    Top = 224
    object tblCuponesGridCantidad: TIntegerField
      FieldName = 'Cantidad'
    end
    object tblCuponesGridDenominacion: TFloatField
      FieldName = 'Denominacion'
      DisplayFormat = '#,#0.00'
    end
    object tblCuponesGridReferencia: TStringField
      FieldName = 'Referencia'
      Size = 50
    end
    object tblCuponesGridTotal: TFloatField
      FieldName = 'Total'
      DisplayFormat = '$#,#0.00'
    end
  end
  object dsCuponesGrid: TDataSource
    DataSet = tblCuponesGrid
    Left = 232
    Top = 224
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
      end>
    Params = <>
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = DMFlotillas.RemoteDataAdapter
    LogicalName = 'ClienteCupon'
    IndexDefs = <>
    Left = 32
    Top = 304
  end
  object dsCliente: TDADataSource
    DataSet = cdsCliente.Dataset
    DataTable = cdsCliente
    Left = 64
    Top = 304
  end
  object cdsLoteCupon: TDACDSDataTable
    RemoteUpdatesOptions = []
    Fields = <
      item
        Name = 'LoteCuponID'
        DataType = datInteger
        Required = True
        InPrimaryKey = True
      end
      item
        Name = 'Fecha'
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
        Name = 'Dia'
        DataType = datInteger
      end
      item
        Name = 'FechaValido'
        DataType = datDateTime
      end
      item
        Name = 'Total'
        DataType = datFloat
        DisplayFormat = '$#,#0.00'
        Alignment = taRightJustify
      end
      item
        Name = 'Status'
        DataType = datString
        Size = 1
      end
      item
        Name = 'EstacionID'
        DataType = datInteger
      end
      item
        Name = 'ClienteID'
        DataType = datInteger
      end
      item
        Name = 'UsuarioID'
        DataType = datInteger
      end>
    Params = <
      item
        Name = 'LoteCuponID'
        Value = ''
        ParamType = daptInput
      end>
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = DMFlotillas.RemoteDataAdapter
    BeforePost = cdsLoteCuponBeforePost
    OnNewRecord = cdsLoteCuponNewRecord
    LogicalName = 'dbo LoteCupon'
    IndexDefs = <>
    Left = 256
    Top = 312
  end
  object cdsCupones: TDACDSDataTable
    RemoteUpdatesOptions = []
    Fields = <
      item
        Name = 'CuponID'
        DataType = datInteger
        Required = True
        InPrimaryKey = True
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
        Name = 'FechaConsumo'
        DataType = datDateTime
      end
      item
        Name = 'FechaValido'
        DataType = datDateTime
      end
      item
        Name = 'VolumenImporte'
        DataType = datString
        Size = 1
      end
      item
        Name = 'Status'
        DataType = datString
        Size = 1
      end
      item
        Name = 'Barras'
        DataType = datString
        Size = 16
      end
      item
        Name = 'ClienteID'
        DataType = datInteger
      end
      item
        Name = 'EstacionID'
        DataType = datInteger
      end
      item
        Name = 'LoteCuponID'
        DataType = datInteger
        Required = True
      end>
    Params = <
      item
        Name = 'LoteCuponID'
        Value = '1'
        ParamType = daptInput
      end>
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = DMFlotillas.RemoteDataAdapter
    LogicalName = 'dbo Cupon'
    IndexDefs = <>
    Left = 256
    Top = 344
  end
  object dsCupones: TDADataSource
    DataSet = cdsCupones.Dataset
    DataTable = cdsCupones
    Left = 288
    Top = 344
  end
  object dsLoteCupon: TDADataSource
    DataSet = cdsLoteCupon.Dataset
    DataTable = cdsLoteCupon
    Left = 288
    Top = 312
  end
  object cdsSaldoEjercicio: TDACDSDataTable
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
        Name = 'Limite'
        DataType = datCurrency
      end
      item
        Name = 'ConsumosPendientes'
        DataType = datCurrency
      end
      item
        Name = 'CuponesPendientes'
        DataType = datCurrency
      end
      item
        Name = 'Movimientos'
        DataType = datCurrency
      end
      item
        Name = 'Saldo'
        DataType = datCurrency
      end>
    Params = <
      item
        Name = 'ClienteIni'
        Value = '1'
        ParamType = daptInput
      end
      item
        Name = 'ClienteFin'
        Value = '1'
        ParamType = daptInput
      end>
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = DMFlotillas.RemoteDataAdapter
    OnNewRecord = cdsSaldoEjercicioNewRecord
    LogicalName = 'ValidarTarSaldoEjercicio'
    IndexDefs = <>
    Left = 328
    Top = 311
  end
  object dsSaldoEjercicio: TDADataSource
    DataSet = cdsSaldoEjercicio.Dataset
    DataTable = cdsSaldoEjercicio
    Left = 360
    Top = 311
  end
end
