inherited frmDepositosxFecha: TfrmDepositosxFecha
  Caption = 'frmDepositosxFecha'
  ClientHeight = 443
  ClientWidth = 795
  OnShow = FormShow
  ExplicitWidth = 795
  ExplicitHeight = 443
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Hint = ''
    Align = alTop
    Caption = 'Datos'
    TabOrder = 0
    Height = 73
    Width = 795
    object cxLabel14: TcxLabel
      Left = 24
      Top = 29
      Hint = ''
      Caption = 'Fecha'
      Style.BorderStyle = ebsNone
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      Transparent = True
    end
    object cxLabel2: TcxLabel
      Left = 426
      Top = 29
      Hint = ''
      Caption = 'Turno'
      ParentFont = False
      Style.BorderStyle = ebsNone
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      Transparent = True
    end
    object dtpFecha: TcxDateEdit
      Left = 64
      Top = 28
      Hint = ''
      Enabled = False
      TabOrder = 2
      Width = 145
    end
    object cxLabel7: TcxLabel
      Left = 216
      Top = 29
      Hint = ''
      Caption = 'Numero de Corte'
      ParentFont = False
      Style.BorderStyle = ebsNone
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      Transparent = True
    end
    object edtSecuencia: TcxCurrencyEdit
      Left = 322
      Top = 28
      Hint = ''
      Enabled = False
      Properties.DecimalPlaces = 0
      Properties.DisplayFormat = '#'
      Properties.ReadOnly = True
      TabOrder = 4
      Width = 98
    end
    object cxComboBox1: TcxComboBox
      Left = 470
      Top = 28
      Hint = ''
      Properties.OnChange = cxComboBox1PropertiesChange
      TabOrder = 5
      Width = 121
    end
  end
  object cxGroupBox3: TcxGroupBox
    Left = 0
    Top = 73
    Hint = ''
    Align = alClient
    TabOrder = 1
    Height = 288
    Width = 795
    object pgcConceptos: TcxPageControl
      Left = 3
      Top = 22
      Width = 789
      Height = 263
      Hint = ''
      Align = alClient
      TabOrder = 0
      Properties.ActivePage = Conceptos
      Properties.CustomButtons.Buttons = <>
      Properties.Images = dmImages.Imagenes2
      OnPageChanging = pgcConceptosPageChanging
      ClientRectBottom = 257
      ClientRectLeft = 3
      ClientRectRight = 783
      ClientRectTop = 27
      object Conceptos: TcxTabSheet
        Caption = 'Monedas'
        ImageIndex = 63
        object cxGrid2: TcxGrid
          Left = 0
          Top = 0
          Width = 780
          Height = 230
          Hint = ''
          Align = alClient
          TabOrder = 0
          object cxGridDBTableView1: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            DataController.DataSource = dsDetalleDeposito
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            NewItemRow.Visible = True
            OptionsBehavior.FocusCellOnTab = True
            OptionsBehavior.GoToNextCellOnEnter = True
            OptionsBehavior.FocusCellOnCycle = True
            OptionsView.GroupByBox = False
            OptionsView.Indicator = True
            object IDBANCO: TcxGridDBColumn
              DataBinding.FieldName = 'IDBANCO'
              PropertiesClassName = 'TcxLookupComboBoxProperties'
              Properties.KeyFieldNames = 'IDBANCO'
              Properties.ListColumns = <
                item
                  FieldName = 'NOMBRE'
                end>
              Properties.ListSource = dsBanco
              Width = 147
            end
            object IDTIPOMONEDA: TcxGridDBColumn
              DataBinding.FieldName = 'IDTIPOMONEDA'
              PropertiesClassName = 'TcxLookupComboBoxProperties'
              Properties.KeyFieldNames = 'IDMONEDA'
              Properties.ListColumns = <
                item
                  FieldName = 'DESCRIPCION'
                end>
              Properties.ListSource = dsTipoCambio
              Properties.OnValidate = IDTIPOMONEDAPropertiesValidate
              Width = 142
            end
            object REFERENCIA: TcxGridDBColumn
              DataBinding.FieldName = 'REFERENCIA'
              Width = 157
            end
            object CANTIDAD: TcxGridDBColumn
              DataBinding.FieldName = 'CANTIDAD'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.OnValidate = CANTIDADPropertiesValidate
            end
            object IMPORTE: TcxGridDBColumn
              DataBinding.FieldName = 'IMPORTE'
              Width = 77
            end
          end
          object cxGridLevel1: TcxGridLevel
            GridView = cxGridDBTableView1
          end
        end
      end
      object cxTabSheet2: TcxTabSheet
        Caption = 'Billetes'
        ImageIndex = 64
        object cxGrid1: TcxGrid
          Left = 0
          Top = 0
          Width = 780
          Height = 230
          Hint = ''
          Align = alClient
          TabOrder = 0
          object cxGrid1DBTableView1: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            DataController.DataSource = dsDetalleDeposito
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            NewItemRow.Visible = True
            OptionsBehavior.FocusCellOnTab = True
            OptionsBehavior.GoToNextCellOnEnter = True
            OptionsBehavior.FocusCellOnCycle = True
            OptionsView.GroupByBox = False
            OptionsView.Indicator = True
            object cxGrid1DBTableView1IDBANCO: TcxGridDBColumn
              DataBinding.FieldName = 'IDBANCO'
              PropertiesClassName = 'TcxLookupComboBoxProperties'
              Properties.KeyFieldNames = 'IDBANCO'
              Properties.ListColumns = <
                item
                  FieldName = 'NOMBRE'
                end>
              Properties.ListSource = dsBanco
              Width = 122
            end
            object cxGrid1DBTableView1IDTIPOMONEDA: TcxGridDBColumn
              DataBinding.FieldName = 'IDTIPOMONEDA'
              PropertiesClassName = 'TcxLookupComboBoxProperties'
              Properties.KeyFieldNames = 'IDMONEDA'
              Properties.ListColumns = <
                item
                  FieldName = 'DESCRIPCION'
                end>
              Properties.ListSource = dsTipoCambio
              Properties.OnValidate = cxGrid1DBTableView1IDTIPOMONEDAPropertiesValidate
              Width = 163
            end
            object cxGrid1DBTableView1REFERENCIA: TcxGridDBColumn
              DataBinding.FieldName = 'REFERENCIA'
              Width = 132
            end
            object cxGrid1DBTableView1CANTIDAD: TcxGridDBColumn
              DataBinding.FieldName = 'CANTIDAD'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.OnValidate = cxGrid1DBTableView1CANTIDADPropertiesValidate
              Width = 104
            end
            object cxGrid1DBTableView1IMPORTE: TcxGridDBColumn
              DataBinding.FieldName = 'IMPORTE'
              Width = 96
            end
          end
          object cxGrid1Level1: TcxGridLevel
            GridView = cxGrid1DBTableView1
          end
        end
      end
    end
  end
  object cxGroupBox2: TcxGroupBox
    Left = 0
    Top = 361
    Hint = ''
    Align = alBottom
    Caption = '?'
    TabOrder = 2
    Height = 82
    Width = 795
    object cxLabel1: TcxLabel
      Left = 522
      Top = 21
      Hint = ''
      Caption = 'Total Depositado'
      ParentFont = False
      Style.BorderStyle = ebsNone
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      Transparent = True
    end
    object cxLabel3: TcxLabel
      Left = 511
      Top = 44
      Hint = ''
      Caption = 'Falta por Depositar'
      ParentFont = False
      Style.BorderStyle = ebsNone
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      Transparent = True
    end
    object cxDBLabel1: TcxDBLabel
      Left = 630
      Top = 21
      Hint = ''
      DataBinding.DataField = 'TOTALDEPOSITADO'
      DataBinding.DataSource = dsDepositos
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlue
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      Style.TextColor = clBlue
      Style.IsFontAssigned = True
      Height = 21
      Width = 158
    end
    object cxButton1: TcxButton
      Left = 6
      Top = 21
      Width = 104
      Height = 44
      Caption = 'Ver Ingresos'
      TabOrder = 3
      OnClick = cxButton1Click
    end
    object cxLabel4: TcxLabel
      Left = 455
      Top = 44
      Hint = ''
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlue
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
    end
    object cxDBLabel2: TcxDBLabel
      Left = 630
      Top = 44
      Hint = ''
      DataBinding.DataField = 'FALTAPORDEPOSITAR'
      DataBinding.DataSource = dsDepositos
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlue
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      Style.TextColor = clBlue
      Style.IsFontAssigned = True
      Height = 21
      Width = 158
    end
  end
  object cdsDepositos: TDACDSDataTable
    Fields = <
      item
        Name = 'IDDEPOSITO'
        DataType = datInteger
      end
      item
        Name = 'IDTURNO'
        DataType = datInteger
      end
      item
        Name = 'NUMEROESTACION'
        DataType = datInteger
      end
      item
        Name = 'TOTALDEPOSITADO'
        DataType = datFloat
      end
      item
        Name = 'FALTAPORDEPOSITAR'
        DataType = datFloat
      end
      item
        Name = 'FECHA'
        DataType = datDateTime
      end>
    LogicalName = 'dbo DEPOSITOS2'
    Params = <
      item
        Name = 'FECHA'
        Value = ''
        ParamType = daptInput
      end
      item
        Name = 'NUMEROESTACION'
        Value = ''
        ParamType = daptInput
      end>
    RemoteDataAdapter = DM.RemoteDataAdapter
    RemoteUpdatesOptions = []
    StreamingOptions = [soDisableEventsWhileStreaming]
    AfterDelete = cdsDepositosAfterDelete
    AfterPost = cdsDepositosAfterPost
    OnNewRecord = cdsDepositosNewRecord
    IndexDefs = <>
    Left = 48
    Top = 176
  end
  object dsDepositos: TDADataSource
    DataSet = cdsDepositos.Dataset
    DataTable = cdsDepositos
    Left = 48
    Top = 208
  end
  object dsTurno: TDADataSource
    DataSet = cdsTurno.Dataset
    DataTable = cdsTurno
    Left = 176
    Top = 208
  end
  object cdsTurno: TDACDSDataTable
    Fields = <
      item
        Name = 'IDHORARIO'
        DataType = datInteger
        Required = True
        InPrimaryKey = True
      end
      item
        Name = 'HORAINICIO'
        DataType = datDateTime
      end
      item
        Name = 'HORAFINAL'
        DataType = datDateTime
      end
      item
        Name = 'DESCRIPCION'
        DataType = datString
        Size = 50
      end>
    LogicalName = 'dbo HORARIO'
    Params = <>
    RemoteDataAdapter = DM.RemoteDataAdapter
    RemoteUpdatesOptions = []
    StreamingOptions = [soDisableEventsWhileStreaming]
    IndexDefs = <>
    Left = 176
    Top = 176
  end
  object cdsTipoComprobacion: TDACDSDataTable
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
    Params = <>
    RemoteDataAdapter = DM.RemoteDataAdapter
    RemoteUpdatesOptions = []
    StreamingOptions = [soDisableEventsWhileStreaming]
    IndexDefs = <>
    Left = 144
    Top = 176
  end
  object dsTipoValor: TDADataSource
    DataSet = cdsTipoComprobacion.Dataset
    DataTable = cdsTipoComprobacion
    Left = 144
    Top = 208
  end
  object cdsTipoCambio: TDACDSDataTable
    Fields = <
      item
        Name = 'IDMONEDA'
        DataType = datInteger
        Required = True
        InPrimaryKey = True
      end
      item
        Name = 'DESCRIPCION'
        DataType = datString
        Size = 100
      end>
    LogicalName = 'dbo MONEDA'
    Params = <>
    RemoteDataAdapter = DM.RemoteDataAdapter
    RemoteUpdatesOptions = []
    StreamingOptions = [soDisableEventsWhileStreaming]
    IndexDefs = <>
    Left = 208
    Top = 176
  end
  object dsTipoCambio: TDADataSource
    DataSet = cdsTipoCambio.Dataset
    DataTable = cdsTipoCambio
    Left = 208
    Top = 208
  end
  object cdsBanco: TDACDSDataTable
    Fields = <
      item
        Name = 'IDBANCO'
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
        Size = 50
      end
      item
        Name = 'CUENTA'
        DataType = datString
        Size = 25
      end
      item
        Name = 'FORMATO'
        DataType = datMemo
      end
      item
        Name = 'IDEMPLEADO'
        DataType = datInteger
      end>
    LogicalName = 'dbo BANCO'
    Params = <>
    RemoteDataAdapter = DM.RemoteDataAdapter
    RemoteUpdatesOptions = []
    StreamingOptions = [soDisableEventsWhileStreaming]
    IndexDefs = <>
    Left = 240
    Top = 176
  end
  object dsBanco: TDADataSource
    DataSet = cdsBanco.Dataset
    DataTable = cdsBanco
    Left = 240
    Top = 208
  end
  object cdsIngresos: TDACDSDataTable
    Fields = <
      item
        Name = 'IDINGRESO'
        DataType = datInteger
        Required = True
        InPrimaryKey = True
      end
      item
        Name = 'FECHA'
        DataType = datDateTime
      end
      item
        Name = 'EJERCICIO'
        DataType = datInteger
      end
      item
        Name = 'PERIODO'
        DataType = datInteger
      end
      item
        Name = 'DIA'
        DataType = datInteger
      end
      item
        Name = 'IDTURNO'
        DataType = datInteger
      end
      item
        Name = 'NUMEROESTACION'
        DataType = datInteger
      end
      item
        Name = 'IDUSUARIO'
        DataType = datInteger
      end
      item
        Name = 'INICIOTURNO'
        DataType = datDateTime
      end
      item
        Name = 'FINTURNO'
        DataType = datDateTime
      end
      item
        Name = 'TERMINADA'
        DataType = datBoolean
      end
      item
        Name = 'IDHORARIO'
        DataType = datInteger
      end
      item
        Name = 'VENTATOTAL'
        DataType = datFloat
      end
      item
        Name = 'EFECTIVOENTREGADO'
        DataType = datFloat
      end
      item
        Name = 'SALIDAEFECTIVO'
        DataType = datFloat
      end
      item
        Name = 'DIFERENCIA'
        DataType = datFloat
      end>
    LogicalName = 'dbo INGRESOS2'
    Params = <
      item
        Name = 'NUMEROESTACION'
        Value = ''
        ParamType = daptInput
      end
      item
        Name = 'FECHA'
        Value = ''
        ParamType = daptInput
      end>
    RemoteDataAdapter = DM.RemoteDataAdapter
    RemoteUpdatesOptions = []
    StreamingOptions = [soDisableEventsWhileStreaming]
    IndexDefs = <>
    Left = 736
    Top = 176
  end
  object dsIngresos: TDADataSource
    DataSet = cdsIngresos.Dataset
    DataTable = cdsIngresos
    Left = 736
    Top = 208
  end
  object cdsDetalleDeposito: TDACDSDataTable
    Fields = <
      item
        Name = 'IDDETALLEDEPOSITO'
        DataType = datInteger
      end
      item
        Name = 'REFERENCIA'
        DataType = datString
        Size = 50
      end
      item
        Name = 'CANTIDAD'
        DataType = datFloat
      end
      item
        Name = 'IMPORTE'
        DataType = datFloat
      end
      item
        Name = 'IDTIPOMONEDA'
        DataType = datInteger
      end
      item
        Name = 'TIPOCAMBIO'
        DataType = datFloat
      end
      item
        Name = 'TIPO'
        DataType = datInteger
      end
      item
        Name = 'IDBANCO'
        DataType = datInteger
      end
      item
        Name = 'IDDEPOSITO'
        DataType = datInteger
      end
      item
        Name = 'IDHORARIO'
        DataType = datInteger
      end>
    LogicalName = 'dbo DETALLEDEPOSITO'
    Params = <
      item
        Name = 'IDDEPOSITO'
        DataType = datInteger
        Value = ''
      end
      item
        Name = 'IDHORARIO'
        DataType = datInteger
        Value = ''
      end>
    RemoteDataAdapter = DM.RemoteDataAdapter
    RemoteUpdatesOptions = []
    StreamingOptions = [soDisableEventsWhileStreaming]
    AfterDelete = cdsDepositosAfterDelete
    AfterPost = cdsDepositosAfterPost
    OnNewRecord = cdsDetalleDepositoNewRecord
    IndexDefs = <>
    Left = 80
    Top = 176
  end
  object dsDetalleDeposito: TDADataSource
    DataSet = cdsDetalleDeposito.Dataset
    DataTable = cdsDetalleDeposito
    Left = 80
    Top = 208
  end
  object spTotalDepositado: TDACDSDataTable
    Fields = <
      item
        Name = 'IMPORTE'
        DataType = datFloat
      end>
    LogicalName = 'spTotalDepositado'
    Params = <
      item
        Name = 'IDDEPOSITO'
        Value = ''
      end>
    RemoteDataAdapter = DM.RemoteDataAdapter
    RemoteUpdatesOptions = []
    StreamingOptions = [soDisableEventsWhileStreaming]
    AfterDelete = cdsDepositosAfterDelete
    AfterPost = cdsDepositosAfterPost
    OnNewRecord = cdsDepositosNewRecord
    IndexDefs = <>
    Left = 48
    Top = 240
  end
  object dsTotalDepositado: TDADataSource
    DataSet = spTotalDepositado.Dataset
    DataTable = spTotalDepositado
    Left = 48
    Top = 272
  end
end
