inherited frmFacturacionXCliente: TfrmFacturacionXCliente
  Caption = 'frmFacturacionXCliente'
  ClientHeight = 578
  ClientWidth = 775
  OnShow = FormShow
  ExplicitTop = -96
  ExplicitWidth = 775
  ExplicitHeight = 578
  PixelsPerInch = 96
  TextHeight = 13
  object pgcFacturas: TcxPageControl
    Left = 0
    Top = 0
    Width = 775
    Height = 578
    ActivePage = cxTabSheet4
    Align = alClient
    Images = dmImages.Imagenes
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    TabOrder = 0
    TabPosition = tpBottom
    TabSlants.Kind = skCutCorner
    ExplicitWidth = 708
    ClientRectBottom = 548
    ClientRectLeft = 3
    ClientRectRight = 769
    ClientRectTop = 3
    object cxTabSheet4: TcxTabSheet
      Caption = 'Generar Facturas'
      ImageIndex = 45
      ExplicitWidth = 699
      object cxGroupBox4: TcxGroupBox
        Left = 0
        Top = 0
        Align = alClient
        Caption = '  Parametros para facturar  '
        Style.BorderStyle = ebsThick
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 1
        ExplicitWidth = 699
        Height = 184
        Width = 766
        object Label18: TLabel
          Left = 31
          Top = 68
          Width = 73
          Height = 13
          Caption = 'Fecha de Corte'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label19: TLabel
          Left = 31
          Top = 88
          Width = 75
          Height = 13
          Caption = 'Fecha Contable'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label2: TLabel
          Left = 31
          Top = 46
          Width = 32
          Height = 13
          Caption = 'Cliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label17: TLabel
          Left = 31
          Top = 24
          Width = 24
          Height = 13
          Caption = 'Serie'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object btnPreeliminar: TcxButton
          Left = 431
          Top = 21
          Width = 210
          Height = 86
          Caption = 'Preeliminar'
          TabOrder = 4
          OnClick = btnPreeliminarClick
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF004A66
            7C00BE959600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF006B9CC3001E89
            E8004B7AA300C8969300FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF004BB4FE0051B5
            FF002089E9004B7AA200C6959200FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0051B7
            FE0051B3FF001D87E6004E7AA000CA979200FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF0051B7FE004EB2FF001F89E6004E7BA200B9949700FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF0052B8FE004BB1FF002787D9005F6A7600FF00FF00B0857F00C09F
            9400C09F9600BC988E00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF0055BDFF00B5D6ED00BF9D9200BB9B8C00E7DAC200FFFF
            E300FFFFE500FDFADA00D8C3B300B58D8500FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00CEA79500FDEEBE00FFFFD800FFFF
            DA00FFFFDB00FFFFE600FFFFFB00EADDDC00AE837F00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00C1A09100FBDCA800FEF7D000FFFF
            DB00FFFFE300FFFFF800FFFFFD00FFFFFD00C6A99C00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00C1A09100FEE3AC00F1C49100FCF2CA00FFFF
            DD00FFFFE400FFFFF700FFFFF700FFFFE900EEE5CB00B9948C00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00C2A19100FFE6AE00EEB58100F7DCAE00FEFD
            D800FFFFDF00FFFFE300FFFFE400FFFFE000F3ECD200BB968E00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00BC978C00FBE7B700F4C79100F2C99400F8E5
            B900FEFCD800FFFFDD00FFFFDC00FFFFE000E2D2BA00B68E8600FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00D9C3A900FFFEE500F7DCB800F2C9
            9400F5D4A500FAE8BD00FDF4C900FDFBD600B6908900FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00B58D8500E8DEDD00FFFEF200F9D8
            A300F4C48C00F9D49F00FDEAB800D0B49F00B8908600FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00AD827F00C9AA9E00EFE0
            B700EFDFB200E7CEAC00B8908600B8908600FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00BA96
            8A00BB988C00B7918800FF00FF00FF00FF00FF00FF00FF00FF00}
          LookAndFeel.Kind = lfOffice11
        end
        object dtpCorte: TcxDateEdit
          Left = 140
          Top = 65
          Properties.ButtonGlyph.Data = {
            46020000424D460200000000000036000000280000000E0000000C0000000100
            1800000000001002000000000000000000000000000000000000FF00FFFF00FF
            8080808080808080808080808080808080808080808080808080808080808080
            80FF00FF0000FF00FF0000000000008000000000008000008000000000008000
            00000000000000800000808080FF00FF0000FF00FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF800000808080FF00FF0000FF00
            FFFFFFFF000000000000000000FFFFFF000000000000000000C0C0C0FFFFFF80
            0000808080FF00FF0000FF00FFFFFFFFFFFFFF000000FFFFFFFFFFFFC0C0C0FF
            FFFFC0C0C0000000FFFFFF800000808080FF00FF0000FF00FFFFFFFFFFFFFF00
            0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF800000808080FF00FF
            0000FF00FFFFFFFFFFFFFF000000FFFFFFFFFFFF000000000000000000C0C0C0
            FFFFFF800000808080FF00FF0000FF00FFFFFFFF000000000000FFFFFFFFFFFF
            000000FFFFFFFFFFFFFFFFFFFFFFFF800000808080FF00FF0000FF00FFFFFFFF
            FFFFFF000000FFFFFFFFFFFF000000000000000000000000FFFFFF8000008080
            80FF00FF0000FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF800000808080FF00FF0000FF00FFFFFFFFC0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0FFFFFF800000808080FF00FF0000FF00
            FF000000000000000000000000000000000000000000000000000000000000FF
            00FFFF00FFFF00FF0000}
          TabOrder = 2
          Width = 121
        end
        object dtpContable: TcxDateEdit
          Left = 140
          Top = 86
          Properties.ButtonGlyph.Data = {
            46020000424D460200000000000036000000280000000E0000000C0000000100
            1800000000001002000000000000000000000000000000000000FF00FFFF00FF
            8080808080808080808080808080808080808080808080808080808080808080
            80FF00FF0000FF00FF0000000000008000000000008000008000000000008000
            00000000000000800000808080FF00FF0000FF00FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF800000808080FF00FF0000FF00
            FFFFFFFF000000000000000000FFFFFF000000000000000000C0C0C0FFFFFF80
            0000808080FF00FF0000FF00FFFFFFFFFFFFFF000000FFFFFFFFFFFFC0C0C0FF
            FFFFC0C0C0000000FFFFFF800000808080FF00FF0000FF00FFFFFFFFFFFFFF00
            0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF800000808080FF00FF
            0000FF00FFFFFFFFFFFFFF000000FFFFFFFFFFFF000000000000000000C0C0C0
            FFFFFF800000808080FF00FF0000FF00FFFFFFFF000000000000FFFFFFFFFFFF
            000000FFFFFFFFFFFFFFFFFFFFFFFF800000808080FF00FF0000FF00FFFFFFFF
            FFFFFF000000FFFFFFFFFFFF000000000000000000000000FFFFFF8000008080
            80FF00FF0000FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFF800000808080FF00FF0000FF00FFFFFFFFC0C0C0C0C0C0C0C0
            C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0FFFFFF800000808080FF00FF0000FF00
            FF000000000000000000000000000000000000000000000000000000000000FF
            00FFFF00FFFF00FF0000}
          TabOrder = 3
          Width = 121
        end
        object edtCliente: TcxCurrencyEdit
          Left = 76
          Top = 43
          EditValue = 0
          Properties.DisplayFormat = '#'
          TabOrder = 1
          OnEnter = edtClienteEnter
          OnExit = edtClienteExit
          OnKeyDown = edtClienteKeyDown
          Width = 58
        end
        object edtNombre: TcxTextEdit
          Left = 140
          Top = 43
          TabStop = False
          Enabled = False
          Properties.ReadOnly = True
          Style.TextColor = clNavy
          TabOrder = 5
          Width = 271
        end
        object edtSerieGenera: TcxTextEdit
          Left = 76
          Top = 21
          Enabled = False
          Properties.CharCase = ecUpperCase
          Style.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 0
          Width = 58
        end
        object dtpTimer: TcxTimeEdit
          Left = 267
          Top = 65
          EditValue = 0.999988425925926d
          TabOrder = 6
          Width = 144
        end
        object prgBar: TProgressBar
          Left = 3
          Top = 159
          Width = 760
          Height = 17
          Align = alBottom
          TabOrder = 7
          ExplicitWidth = 693
        end
      end
      object cxGrid1: TcxGrid
        Left = 0
        Top = 184
        Width = 766
        Height = 344
        Align = alBottom
        TabOrder = 0
        ExplicitTop = 182
        ExplicitWidth = 699
        object cxGrid1DBTableView1: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsFactura
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = '#,#0.00'
              Kind = skSum
              FieldName = 'Cantidad'
            end
            item
              Format = '$0,0.00'
              Kind = skSum
              FieldName = 'Importe'
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          object cxGrid1DBTableView1RecId: TcxGridDBColumn
            DataBinding.FieldName = 'RecId'
            Visible = False
          end
          object cxGrid1DBTableView1Facturado: TcxGridDBColumn
            DataBinding.FieldName = 'Facturado'
            Width = 60
          end
          object cxGrid1DBTableView1Ticket: TcxGridDBColumn
            DataBinding.FieldName = 'Ticket'
            Width = 75
          end
          object cxGrid1DBTableView1ProductoID: TcxGridDBColumn
            DataBinding.FieldName = 'ProductoID'
            Width = 68
          end
          object cxGrid1DBTableView1Descripcion: TcxGridDBColumn
            DataBinding.FieldName = 'Descripcion'
            Width = 318
          end
          object cxGrid1DBTableView1Cantidad: TcxGridDBColumn
            DataBinding.FieldName = 'Cantidad'
          end
          object cxGrid1DBTableView1Importe: TcxGridDBColumn
            DataBinding.FieldName = 'Importe'
          end
          object cxGrid1DBTableView1FechaConsumo: TcxGridDBColumn
            DataBinding.FieldName = 'FechaConsumo'
            PropertiesClassName = 'TcxDateEditProperties'
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = cxGrid1DBTableView1
        end
      end
      object prgBar2: TProgressBar
        Left = 0
        Top = 528
        Width = 766
        Height = 17
        Align = alBottom
        TabOrder = 2
        ExplicitWidth = 699
      end
    end
    object cxTabSheet3: TcxTabSheet
      Caption = 'Impresion de Facturas'
      ImageIndex = 48
      ExplicitWidth = 699
      object cxGroupBox3: TcxGroupBox
        Left = 19
        Top = 17
        Caption = 'Rango de Facturas'
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 0
        Height = 88
        Width = 436
        object Label14: TLabel
          Left = 12
          Top = 27
          Width = 24
          Height = 13
          Caption = 'Serie'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label15: TLabel
          Left = 102
          Top = 27
          Width = 65
          Height = 13
          Caption = 'Factura inicial'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label16: TLabel
          Left = 269
          Top = 27
          Width = 61
          Height = 13
          Caption = 'Factura Final'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object edtSerie: TcxTextEdit
          Left = 48
          Top = 23
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clNavy
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = []
          Style.IsFontAssigned = True
          TabOrder = 0
          Width = 41
        end
        object edtRangoFacturaIni: TcxCurrencyEdit
          Left = 189
          Top = 23
          EditValue = 0
          ParentFont = False
          Properties.DecimalPlaces = 0
          Properties.DisplayFormat = '#0'
          Style.BorderStyle = ebsOffice11
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clNavy
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = []
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clNavy
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 1
          Width = 65
        end
        object edtRangoFacturaFin: TcxCurrencyEdit
          Left = 350
          Top = 23
          EditValue = '0'
          ParentFont = False
          Properties.DecimalPlaces = 0
          Properties.DisplayFormat = '#0'
          Style.BorderStyle = ebsOffice11
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clNavy
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = []
          Style.LookAndFeel.NativeStyle = False
          Style.TextColor = clNavy
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 2
          Width = 65
        end
        object cxCheckBox4: TcxCheckBox
          Left = 12
          Top = 52
          Caption = 'Imprimir Tickets'
          TabOrder = 3
          Transparent = True
          Width = 101
        end
      end
    end
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
    Top = 208
  end
  object tblFactura: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 40
    Top = 208
    object tblFacturaFacturado: TBooleanField
      FieldName = 'Facturado'
    end
    object tblFacturaTicket: TIntegerField
      FieldName = 'Ticket'
    end
    object tblFacturaProductoID: TIntegerField
      FieldName = 'ProductoID'
    end
    object tblFacturaDescripcion: TStringField
      FieldName = 'Descripcion'
      Size = 100
    end
    object tblFacturaCantidad: TFloatField
      FieldName = 'Cantidad'
    end
    object tblFacturaImporte: TFloatField
      FieldName = 'Importe'
      DisplayFormat = '#,#0.00'
    end
    object tblFacturaIVA: TFloatField
      FieldName = 'IVA'
    end
    object tblFacturaPlazoPago: TIntegerField
      FieldName = 'PlazoPago'
    end
    object tblFacturaClienteID: TIntegerField
      FieldName = 'ClienteID'
    end
    object tblFacturaFechaConsumo: TDateTimeField
      FieldName = 'FechaConsumo'
      ReadOnly = True
    end
  end
  object dsFactura: TDataSource
    DataSet = tblFactura
    Left = 72
    Top = 208
  end
  object dsCliente: TDADataSource
    DataSet = cdsCliente.Dataset
    DataTable = cdsCliente
    Left = 8
    Top = 240
  end
  object spBuscaFactura: TDACDSDataTable
    RemoteUpdatesOptions = []
    Fields = <
      item
        Name = 'FacturaID'
        DataType = datInteger
      end>
    Params = <
      item
        Name = 'Folio'
        Value = '1'
      end
      item
        Name = 'Serie'
        Value = 'A'
      end>
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = DMFlotillas.RemoteDataAdapter
    LogicalName = 'spBuscaFolio'
    IndexDefs = <>
    Left = 8
    Top = 272
  end
  object dsBuscaFactura: TDADataSource
    DataSet = spBuscaFactura.Dataset
    DataTable = spBuscaFactura
    Left = 8
    Top = 304
  end
  object cdsPrevisualizaFacturasCliente: TDAMemDataTable
    RemoteUpdatesOptions = []
    Fields = <>
    Params = <>
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = rdaPrevisualizaFacturasCliente
    LogicalName = 'Reporte'
    IndexDefs = <>
    Left = 608
    Top = 40
  end
  object rdaPrevisualizaFacturasCliente: TDARemoteDataAdapter
    GetSchemaCall.RemoteService = DMFlotillas.RemoteService
    GetDataCall.RemoteService = DMFlotillas.RemoteService
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
        TypeName = 'TParametrosF'
        Value = Null
      end>
    GetDataCall.Default = False
    GetDataCall.OutgoingTableNamesParameter = 'aTableNameArray'
    GetDataCall.OutgoingTableRequestInfosParameter = 'aTableRequestInfoArray'
    GetDataCall.IncomingDataParameter = 'Result'
    UpdateDataCall.RemoteService = DMFlotillas.RemoteService
    GetScriptsCall.RemoteService = DMFlotillas.RemoteService
    RemoteService = DMFlotillas.RemoteService
    DataStreamer = DM.DataStreamer
    Left = 576
    Top = 40
  end
  object cdsObtenFactura: TDAMemDataTable
    RemoteUpdatesOptions = []
    Fields = <>
    Params = <>
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = rdaObtenFactura
    LogicalName = 'Reporte'
    IndexDefs = <>
    Left = 608
    Top = 72
  end
  object rdaObtenFactura: TDARemoteDataAdapter
    GetSchemaCall.RemoteService = DMFlotillas.RemoteService
    GetDataCall.RemoteService = DMFlotillas.RemoteService
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
        TypeName = 'TParametrosF'
        Value = Null
      end>
    GetDataCall.Default = False
    GetDataCall.OutgoingTableNamesParameter = 'aTableNameArray'
    GetDataCall.OutgoingTableRequestInfosParameter = 'aTableRequestInfoArray'
    GetDataCall.IncomingDataParameter = 'Result'
    UpdateDataCall.RemoteService = DMFlotillas.RemoteService
    GetScriptsCall.RemoteService = DMFlotillas.RemoteService
    RemoteService = DMFlotillas.RemoteService
    DataStreamer = DM.DataStreamer
    Left = 576
    Top = 72
  end
  object cmdAfectaConsumos: TDARemoteDataAdapter
    GetSchemaCall.RemoteService = DMFlotillas.RemoteService
    GetDataCall.RemoteService = DMFlotillas.RemoteService
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
        TypeName = 'TParametrosF'
        Value = Null
      end>
    GetDataCall.Default = False
    GetDataCall.OutgoingTableNamesParameter = 'aTableNameArray'
    GetDataCall.OutgoingTableRequestInfosParameter = 'aTableRequestInfoArray'
    GetDataCall.IncomingDataParameter = 'Result'
    UpdateDataCall.RemoteService = DMFlotillas.RemoteService
    GetScriptsCall.RemoteService = DMFlotillas.RemoteService
    RemoteService = DMFlotillas.RemoteService
    DataStreamer = DM.DataStreamer
    Left = 624
    Top = 392
  end
  object cdsAfectaConsumos: TDAMemDataTable
    RemoteUpdatesOptions = []
    Fields = <>
    Params = <>
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = cmdAfectaConsumos
    LogicalName = 'Reporte'
    IndexDefs = <>
    Left = 656
    Top = 392
  end
  object cmdInsertaMovimientos: TDARemoteDataAdapter
    GetSchemaCall.RemoteService = DMFlotillas.RemoteService
    GetDataCall.RemoteService = DMFlotillas.RemoteService
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
        TypeName = 'TParametrosF'
        Value = Null
      end>
    GetDataCall.Default = False
    GetDataCall.OutgoingTableNamesParameter = 'aTableNameArray'
    GetDataCall.OutgoingTableRequestInfosParameter = 'aTableRequestInfoArray'
    GetDataCall.IncomingDataParameter = 'Result'
    UpdateDataCall.RemoteService = DMFlotillas.RemoteService
    GetScriptsCall.RemoteService = DMFlotillas.RemoteService
    RemoteService = DMFlotillas.RemoteService
    DataStreamer = DM.DataStreamer
    Left = 624
    Top = 360
  end
  object cdsInsertaMovimientos: TDAMemDataTable
    RemoteUpdatesOptions = []
    Fields = <>
    Params = <>
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = cmdInsertaMovimientos
    LogicalName = 'Reporte'
    IndexDefs = <>
    Left = 656
    Top = 360
  end
  object cmdInsertaSaldoDocumento: TDARemoteDataAdapter
    GetSchemaCall.RemoteService = DMFlotillas.RemoteService
    GetDataCall.RemoteService = DMFlotillas.RemoteService
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
        TypeName = 'TParametrosF'
        Value = Null
      end>
    GetDataCall.Default = False
    GetDataCall.OutgoingTableNamesParameter = 'aTableNameArray'
    GetDataCall.OutgoingTableRequestInfosParameter = 'aTableRequestInfoArray'
    GetDataCall.IncomingDataParameter = 'Result'
    UpdateDataCall.RemoteService = DMFlotillas.RemoteService
    GetScriptsCall.RemoteService = DMFlotillas.RemoteService
    RemoteService = DMFlotillas.RemoteService
    DataStreamer = DM.DataStreamer
    Left = 624
    Top = 328
  end
  object cdsInsertaSaldoDocumento: TDAMemDataTable
    RemoteUpdatesOptions = []
    Fields = <>
    Params = <>
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = cmdInsertaSaldoDocumento
    LogicalName = 'Reporte'
    IndexDefs = <>
    Left = 656
    Top = 328
  end
  object rdaFolioActual: TDARemoteDataAdapter
    GetSchemaCall.RemoteService = DMFlotillas.RemoteService
    GetDataCall.RemoteService = DMFlotillas.RemoteService
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
        TypeName = 'TParametrosF'
        Value = Null
      end>
    GetDataCall.Default = False
    GetDataCall.OutgoingTableNamesParameter = 'aTableNameArray'
    GetDataCall.OutgoingTableRequestInfosParameter = 'aTableRequestInfoArray'
    GetDataCall.IncomingDataParameter = 'Result'
    UpdateDataCall.RemoteService = DMFlotillas.RemoteService
    GetScriptsCall.RemoteService = DMFlotillas.RemoteService
    RemoteService = DMFlotillas.RemoteService
    DataStreamer = DM.DataStreamer
    Left = 16
    Top = 400
  end
  object cdsFolioActual: TDAMemDataTable
    RemoteUpdatesOptions = []
    Fields = <>
    Params = <>
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = rdaFolioActual
    LogicalName = 'Reporte'
    IndexDefs = <>
    Left = 48
    Top = 400
  end
end
