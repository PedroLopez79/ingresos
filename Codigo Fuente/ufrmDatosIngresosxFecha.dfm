object frmDatosIngresosxFecha: TfrmDatosIngresosxFecha
  Left = 303
  Top = 281
  Caption = 'Datos Ingresos x Fecha'
  ClientHeight = 355
  ClientWidth = 783
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 783
    Height = 324
    Align = alClient
    TabOrder = 0
    object Bevel1: TBevel
      Left = 14
      Top = 218
      Width = 739
      Height = 10
      Shape = bsBottomLine
    end
    object pgcConceptos: TcxPageControl
      Left = 0
      Top = 0
      Width = 783
      Height = 217
      Hint = ''
      TabOrder = 0
      Properties.ActivePage = Conceptos
      Properties.CustomButtons.Buttons = <>
      Properties.Images = dmImages.Imagenes2
      OnPageChanging = pgcConceptosPageChanging
      ClientRectBottom = 211
      ClientRectLeft = 3
      ClientRectRight = 777
      ClientRectTop = 27
      object Conceptos: TcxTabSheet
        Caption = 'Conceptos'
        ImageIndex = 59
        object dbgConceptos: TcxGrid
          Left = 0
          Top = 0
          Width = 774
          Height = 184
          Hint = ''
          Align = alClient
          TabOrder = 0
          object dbgConceptosDBTableView1: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            DataController.DataSource = dsDetalleIngreso
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsData.Deleting = False
            OptionsData.Editing = False
            OptionsView.GroupByBox = False
            object Descripcion: TcxGridDBColumn
              DataBinding.FieldName = 'DESCRIPCION'
              Width = 174
            end
            object Producto: TcxGridDBColumn
              Caption = 'Producto'
              DataBinding.FieldName = 'IDPRODUCTO'
              PropertiesClassName = 'TcxLookupComboBoxProperties'
              Properties.KeyFieldNames = 'IDPRODUCTO'
              Properties.ListColumns = <
                item
                  FieldName = 'NOMBRE'
                end>
              Width = 98
            end
            object Precio: TcxGridDBColumn
              Caption = 'Precio'
              DataBinding.FieldName = 'PRECIO'
              Width = 75
            end
            object LtsInicio: TcxGridDBColumn
              Caption = 'Lts Inicio'
              DataBinding.FieldName = 'LTSINI'
              Width = 72
            end
            object LtsFinal: TcxGridDBColumn
              Caption = 'Lts Final'
              DataBinding.FieldName = 'LTSFIN'
              Width = 80
            end
            object Cantidad: TcxGridDBColumn
              Caption = 'Lts Cantidad'
              DataBinding.FieldName = 'CANTIDAD'
              PropertiesClassName = 'TcxTextEditProperties'
              Width = 72
            end
            object Jarreos: TcxGridDBColumn
              Caption = 'Jarreos'
              DataBinding.FieldName = 'JARREOS'
            end
            object Entregado: TcxGridDBColumn
              Caption = 'Entregado'
              DataBinding.FieldName = 'ENTREGADO'
              Width = 63
            end
            object Importe: TcxGridDBColumn
              Caption = 'Importe'
              DataBinding.FieldName = 'IMPORTE'
              PropertiesClassName = 'TcxTextEditProperties'
              Width = 68
            end
          end
          object dbgConceptosLevel1: TcxGridLevel
            GridView = dbgConceptosDBTableView1
          end
        end
      end
      object cxTabSheet2: TcxTabSheet
        Caption = 'Creditos,Debitos o Cupones'
        ImageIndex = 58
        object dbgCreditosDebitosCupones: TcxGrid
          Left = 0
          Top = 0
          Width = 774
          Height = 184
          Hint = ''
          Align = alClient
          TabOrder = 0
          object cxGridDBTableView2: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            DataController.DataSource = dsDetalleIngreso
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            NewItemRow.InfoText = 'Precione aqui para agregar un Registro nuevo'
            OptionsBehavior.FocusCellOnTab = True
            OptionsBehavior.GoToNextCellOnEnter = True
            OptionsBehavior.FocusCellOnCycle = True
            OptionsData.Editing = False
            OptionsView.GroupByBox = False
            OptionsView.Indicator = True
            object Tarjetas: TcxGridDBColumn
              Caption = 'Tarjetas o Cupones'
              DataBinding.FieldName = 'DESCRIPCION'
              Width = 184
            end
            object Ticket: TcxGridDBColumn
              Caption = 'Ticket'
              DataBinding.FieldName = 'TICKET'
              HeaderGlyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000120B0000120B00000000000000000000A449A3A449A3
                A449A3A449A3BDC5CD6C7D8FCCD2D8A449A3A449A3A449A3A449A3A449A3A449
                A3A449A3A449A3A449A3A449A3A449A3A449A3C2CAD278899AD1E1F178899ACF
                D5DCA449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3
                A449A38496A8D1E1F1C1D2E3D4E3F28496A8D4DBE1A449A3A449A3A449A3A449
                A3A449A3A449A3A449A3A449A3CBD3DB8B9DAF667788CADAEAC3D4E5C4D5E6D6
                E5F38B9DAFD6DCE3A449A3A449A3A449A3A449A3A449A3A449A3CCD4DD8FA1B2
                D1E1F1CADAEAC7D8E8C4D5E6C5D6E7C7D8E9D9E7F58FA1B2D7DEE4A449A3A449
                A3A449A3A449A3A449A392A4B5D1E1F1C1D2E3C3D4E5C4D5E6C5D6E7C7D8E9C8
                D9EACADBECDCE9F692A4B5D9DFE5A449A3A449A3A449A3A449A3DAE0E696A7B9
                D4E3F2C4D5E6C5D6E7C7D8E9C8D9EACADBECCBDCEDCDDEEFDFEBF896A7B9DAE0
                E6A449A3A449A3A449A3A449A3DBE1E798AABBD6E5F3C7D8E9C8D9EA99BACD44
                7D94000000CEDFF0D0E1F2E2EDF998AABBDBE1E7A449A3A449A3A449A3A449A3
                DBE2E89BACBED9E7F594C0D23496ABD9F4FF68A6C0D0E1F2D1E2F38A9BACE5EF
                FB9BACBEDBE2E8A449A3A449A3A449A3A449A3DCE3E9759DB13999AD79E6F73D
                ADC3B1D2E6D1E2F38FA0B1D4E5F6D5E6F7E8F1FC9EAFC0DCE3E9A449A3A449A3
                A449A3BBD9E03998AA79E6F742B0C59ED1E4D1E2F395A6B7D4E5F6D5E6F7D7E8
                F9D8E9FAEAF3FDA0B1C2A449A3A449A3C0CFD2429FB079E6F741AEC17DABBFE2
                EDF999AABBD4E5F6D5E6F7DBEAF9E0EDFBEAF3FDA2B4C5D4DCE4A449A3D4D4D4
                93939379E6F74BB5C7C0E8EEDFE5EBA5B6C7E5EFFBD5E6F7D7E8F9E0EDFB8899
                AAA5B6C7D7DEE6A449A3B9B9E57F7F98F7F7F7B2B2B2C0E8EEA449A3A449A3E0
                E6ECA7B8C9E8F1FCD8E9FAEAF3FDA7B8C9A449A3A449A3A449A33F3FC48080FF
                9E9EB9E7E7E7A449A3A449A3A449A3A449A3E0E6ECA8B9CAEAF3FDA8B9CAD8DF
                E7A449A3A449A3A449A3BFBFF15151E8D0D0E9A449A3A449A3A449A3A449A3A4
                49A3A449A3E1E7EDA9BACBD8E0E7A449A3A449A3A449A3A449A3}
              Width = 98
            end
            object CreditosProducto: TcxGridDBColumn
              Caption = 'Producto'
              DataBinding.FieldName = 'IDPRODUCTO'
              PropertiesClassName = 'TcxLookupComboBoxProperties'
              Properties.KeyFieldNames = 'IDPRODUCTO'
              Properties.ListColumns = <
                item
                  FieldName = 'NOMBRE'
                end>
              Width = 126
            end
            object CreditosCantidad: TcxGridDBColumn
              Caption = 'Lts Cantidad'
              DataBinding.FieldName = 'CANTIDAD'
              Width = 118
            end
            object CreditosImporte: TcxGridDBColumn
              Caption = 'Importe'
              DataBinding.FieldName = 'IMPORTE'
              Width = 83
            end
          end
          object cxGridLevel2: TcxGridLevel
            GridView = cxGridDBTableView2
          end
        end
      end
      object cxTabSheet1: TcxTabSheet
        Caption = 'Venta de Productos'
        ImageIndex = 62
        object dbgProductos: TcxGrid
          Left = 0
          Top = 0
          Width = 774
          Height = 184
          Hint = ''
          Align = alClient
          TabOrder = 0
          object cxGridDBTableView1: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            DataController.DataSource = dsDetalleIngreso
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            NewItemRow.InfoText = 'Precione aqui para agregar un Registro nuevo'
            OptionsBehavior.FocusCellOnTab = True
            OptionsBehavior.GoToNextCellOnEnter = True
            OptionsBehavior.FocusCellOnCycle = True
            OptionsData.Editing = False
            OptionsView.GroupByBox = False
            OptionsView.Indicator = True
            object ProductoDescripcion: TcxGridDBColumn
              Caption = 'Producto'
              DataBinding.FieldName = 'IDPRODUCTO'
              PropertiesClassName = 'TcxLookupComboBoxProperties'
              Properties.KeyFieldNames = 'IDPRODUCTO'
              Properties.ListColumns = <
                item
                  FieldName = 'NOMBRE'
                end>
              Width = 288
            end
            object ProductoPrecio: TcxGridDBColumn
              Caption = 'Precio'
              DataBinding.FieldName = 'PRECIO'
              Width = 69
            end
            object Recibido: TcxGridDBColumn
              Caption = 'Recibido'
              DataBinding.FieldName = 'RECIBIDO'
            end
            object Resurtido: TcxGridDBColumn
              Caption = 'Resurtido'
              DataBinding.FieldName = 'RESURTIDO'
            end
            object ProductoEntregado: TcxGridDBColumn
              Caption = 'Entregado'
              DataBinding.FieldName = 'ENTREGADO'
            end
            object ProductoCantidad: TcxGridDBColumn
              Caption = 'Cantidad'
              DataBinding.FieldName = 'CANTIDAD'
              PropertiesClassName = 'TcxTextEditProperties'
              Width = 96
            end
            object ProductoImporte: TcxGridDBColumn
              Caption = 'Importe'
              DataBinding.FieldName = 'IMPORTE'
              PropertiesClassName = 'TcxTextEditProperties'
              Width = 105
            end
          end
          object cxGridLevel1: TcxGridLevel
            GridView = cxGridDBTableView1
          end
        end
      end
      object cxTabSheet3: TcxTabSheet
        Caption = 'Clientes'
        ImageIndex = 51
        object dbgClientes: TcxGrid
          Left = 0
          Top = 0
          Width = 774
          Height = 184
          Hint = ''
          Align = alClient
          TabOrder = 0
          object cxGridDBTableView3: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            DataController.DataSource = dsDetalleIngreso
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            NewItemRow.InfoText = 'Precione aqui para agregar un Registro nuevo'
            OptionsBehavior.FocusCellOnTab = True
            OptionsBehavior.GoToNextCellOnEnter = True
            OptionsBehavior.FocusCellOnCycle = True
            OptionsData.Editing = False
            OptionsView.GroupByBox = False
            OptionsView.Indicator = True
            object IDCliente: TcxGridDBColumn
              Caption = 'IDCliente'
              DataBinding.FieldName = 'IDCLIENTE'
              Width = 70
            end
            object ClienteNombre: TcxGridDBColumn
              Caption = 'Nombre'
              DataBinding.FieldName = 'DESCRIPCION'
              Width = 321
            end
            object ClienteTicket: TcxGridDBColumn
              Caption = 'Ticket'
              DataBinding.FieldName = 'TICKET'
              HeaderGlyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000120B0000120B00000000000000000000A449A3A449A3
                A449A3A449A3BDC5CD6C7D8FCCD2D8A449A3A449A3A449A3A449A3A449A3A449
                A3A449A3A449A3A449A3A449A3A449A3A449A3C2CAD278899AD1E1F178899ACF
                D5DCA449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3A449A3
                A449A38496A8D1E1F1C1D2E3D4E3F28496A8D4DBE1A449A3A449A3A449A3A449
                A3A449A3A449A3A449A3A449A3CBD3DB8B9DAF667788CADAEAC3D4E5C4D5E6D6
                E5F38B9DAFD6DCE3A449A3A449A3A449A3A449A3A449A3A449A3CCD4DD8FA1B2
                D1E1F1CADAEAC7D8E8C4D5E6C5D6E7C7D8E9D9E7F58FA1B2D7DEE4A449A3A449
                A3A449A3A449A3A449A392A4B5D1E1F1C1D2E3C3D4E5C4D5E6C5D6E7C7D8E9C8
                D9EACADBECDCE9F692A4B5D9DFE5A449A3A449A3A449A3A449A3DAE0E696A7B9
                D4E3F2C4D5E6C5D6E7C7D8E9C8D9EACADBECCBDCEDCDDEEFDFEBF896A7B9DAE0
                E6A449A3A449A3A449A3A449A3DBE1E798AABBD6E5F3C7D8E9C8D9EA99BACD44
                7D94000000CEDFF0D0E1F2E2EDF998AABBDBE1E7A449A3A449A3A449A3A449A3
                DBE2E89BACBED9E7F594C0D23496ABD9F4FF68A6C0D0E1F2D1E2F38A9BACE5EF
                FB9BACBEDBE2E8A449A3A449A3A449A3A449A3DCE3E9759DB13999AD79E6F73D
                ADC3B1D2E6D1E2F38FA0B1D4E5F6D5E6F7E8F1FC9EAFC0DCE3E9A449A3A449A3
                A449A3BBD9E03998AA79E6F742B0C59ED1E4D1E2F395A6B7D4E5F6D5E6F7D7E8
                F9D8E9FAEAF3FDA0B1C2A449A3A449A3C0CFD2429FB079E6F741AEC17DABBFE2
                EDF999AABBD4E5F6D5E6F7DBEAF9E0EDFBEAF3FDA2B4C5D4DCE4A449A3D4D4D4
                93939379E6F74BB5C7C0E8EEDFE5EBA5B6C7E5EFFBD5E6F7D7E8F9E0EDFB8899
                AAA5B6C7D7DEE6A449A3B9B9E57F7F98F7F7F7B2B2B2C0E8EEA449A3A449A3E0
                E6ECA7B8C9E8F1FCD8E9FAEAF3FDA7B8C9A449A3A449A3A449A33F3FC48080FF
                9E9EB9E7E7E7A449A3A449A3A449A3A449A3E0E6ECA8B9CAEAF3FDA8B9CAD8DF
                E7A449A3A449A3A449A3BFBFF15151E8D0D0E9A449A3A449A3A449A3A449A3A4
                49A3A449A3E1E7EDA9BACBD8E0E7A449A3A449A3A449A3A449A3}
              Width = 105
            end
            object ClienteImporte: TcxGridDBColumn
              Caption = 'Importe'
              DataBinding.FieldName = 'IMPORTE'
              Width = 118
            end
          end
          object cxGridLevel3: TcxGridLevel
            GridView = cxGridDBTableView3
          end
        end
      end
      object cxTabSheet4: TcxTabSheet
        Caption = 'Efectivo'
        ImageIndex = 56
        object dbgEfectivo: TcxGrid
          Left = 0
          Top = 0
          Width = 774
          Height = 184
          Hint = ''
          Align = alClient
          TabOrder = 0
          object cxGridDBTableView4: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            DataController.DataSource = dsDetalleIngreso
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            NewItemRow.InfoText = 'Precione aqui para agregar un Registro nuevo'
            OptionsBehavior.FocusCellOnTab = True
            OptionsBehavior.GoToNextCellOnEnter = True
            OptionsBehavior.FocusCellOnCycle = True
            OptionsData.Editing = False
            OptionsView.GroupByBox = False
            OptionsView.Indicator = True
            object EfectivoDescripcion: TcxGridDBColumn
              Caption = 'Descripcion'
              DataBinding.FieldName = 'IDTIPOMONEDA'
              PropertiesClassName = 'TcxLookupComboBoxProperties'
              Properties.KeyFieldNames = 'IDMONEDA'
              Properties.ListColumns = <
                item
                  FieldName = 'DESCRIPCION'
                end>
              Width = 205
            end
            object EfectivoCantidad: TcxGridDBColumn
              Caption = 'Cantidad'
              DataBinding.FieldName = 'CANTIDAD'
              PropertiesClassName = 'TcxTextEditProperties'
              Width = 112
            end
            object EfectivoImporte: TcxGridDBColumn
              Caption = 'Importe'
              DataBinding.FieldName = 'IMPORTE'
              Width = 117
            end
          end
          object cxGridLevel4: TcxGridLevel
            GridView = cxGridDBTableView4
          end
        end
      end
      object cxTabSheet5: TcxTabSheet
        Caption = 'Salida de Efectivo'
        ImageIndex = 60
        object dbgSalidaEfectivos: TcxGrid
          Left = 0
          Top = 0
          Width = 774
          Height = 184
          Hint = ''
          Align = alClient
          TabOrder = 0
          object cxGridDBTableView5: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            DataController.DataSource = dsDetalleIngreso
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            NewItemRow.InfoText = 'Precione aqui para agregar un Registro nuevo'
            OptionsBehavior.FocusCellOnTab = True
            OptionsBehavior.GoToNextCellOnEnter = True
            OptionsBehavior.FocusCellOnCycle = True
            OptionsData.Editing = False
            OptionsView.GroupByBox = False
            OptionsView.Indicator = True
            object SalidaEfectivoDescripcion: TcxGridDBColumn
              Caption = 'Descripcion'
              DataBinding.FieldName = 'DESCRIPCION'
              Width = 274
            end
            object SalidaEfectivoImporte: TcxGridDBColumn
              Caption = 'Importe'
              DataBinding.FieldName = 'IMPORTE'
              Width = 131
            end
          end
          object cxGridLevel5: TcxGridLevel
            GridView = cxGridDBTableView5
          end
        end
      end
    end
    object cxLabel3: TcxLabel
      Left = 542
      Top = 234
      Hint = ''
      Caption = 'Total de la Venta'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
    end
    object cxDBLabel1: TcxDBLabel
      Left = 672
      Top = 233
      Hint = ''
      DataBinding.DataField = 'VENTATOTAL'
      DataBinding.DataSource = dsIngresos
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlue
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      Style.TextColor = clBlue
      Style.IsFontAssigned = True
      Height = 21
      Width = 110
    end
    object cxLabel4: TcxLabel
      Left = 542
      Top = 254
      Hint = ''
      Caption = 'Total Entregado'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
    end
    object cxDBLabel2: TcxDBLabel
      Left = 672
      Top = 254
      Hint = ''
      DataBinding.DataField = 'EFECTIVOENTREGADO'
      DataBinding.DataSource = dsIngresos
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      Style.TextColor = clBlue
      Style.IsFontAssigned = True
      Height = 21
      Width = 110
    end
    object cxLabel5: TcxLabel
      Left = 542
      Top = 274
      Hint = ''
      Caption = 'Salida de Ingresos'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
    end
    object cxDBLabel3: TcxDBLabel
      Left = 672
      Top = 274
      Hint = ''
      DataBinding.DataField = 'SALIDAEFECTIVO'
      DataBinding.DataSource = dsIngresos
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      Style.TextColor = clBlue
      Style.IsFontAssigned = True
      Height = 21
      Width = 110
    end
    object cxLabel6: TcxLabel
      Left = 542
      Top = 295
      Hint = ''
      Caption = 'Falta por Entregar'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
    end
    object cxDBLabel4: TcxDBLabel
      Left = 672
      Top = 295
      Hint = ''
      DataBinding.DataField = 'DIFERENCIA'
      DataBinding.DataSource = dsIngresos
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      Style.TextColor = clBlue
      Style.IsFontAssigned = True
      Height = 21
      Width = 110
    end
  end
  object Pa_ayuda: TPanel
    Left = 0
    Top = 324
    Width = 783
    Height = 31
    Align = alBottom
    TabOrder = 1
    object Button2: TButton
      Left = 702
      Top = 2
      Width = 75
      Height = 25
      Caption = 'Aceptar'
      TabOrder = 0
      OnClick = Button2Click
    end
  end
  object cdsDetalleIngreso: TDACDSDataTable
    Fields = <
      item
        Name = 'IDDETALLEINGRESOS'
        DataType = datInteger
        Required = True
        InPrimaryKey = True
      end
      item
        Name = 'IDENCARGADOINGRESOS'
        DataType = datInteger
      end
      item
        Name = 'IDTIPOCOMPROBACION'
        DataType = datInteger
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
        Name = 'DESCRIPCION'
        DataType = datString
        Size = 150
      end
      item
        Name = 'TICKET'
        DataType = datInteger
      end
      item
        Name = 'IDPRODUCTO'
        DataType = datInteger
      end
      item
        Name = 'COSTO'
        DataType = datFloat
      end
      item
        Name = 'PUNTOS'
        DataType = datInteger
      end
      item
        Name = 'NUMEROESTACION'
        DataType = datInteger
      end
      item
        Name = 'LTSINI'
        DataType = datFloat
      end
      item
        Name = 'LTSFIN'
        DataType = datFloat
      end
      item
        Name = 'JARREOS'
        DataType = datFloat
      end
      item
        Name = 'RECIBIDO'
        DataType = datInteger
      end
      item
        Name = 'RESURTIDO'
        DataType = datInteger
      end
      item
        Name = 'ENTREGADO'
        DataType = datInteger
      end
      item
        Name = 'IDTIPOMONEDA'
        DataType = datInteger
      end
      item
        Name = 'PRECIO'
        DataType = datFloat
      end
      item
        Name = 'TIPOCAMBIO'
        DataType = datFloat
      end
      item
        Name = 'CLIENTE'
        DataType = datString
        Size = 150
      end
      item
        Name = 'VEHICULO'
        DataType = datString
        Size = 150
      end
      item
        Name = 'IDCLIENTE'
        DataType = datInteger
      end>
    LogicalName = 'dbo DETALLEINGRESOS'
    Params = <
      item
        Name = 'IDINGRESO'
        Value = '1'
        ParamType = daptInput
      end>
    RemoteDataAdapter = DM.RemoteDataAdapter
    RemoteUpdatesOptions = []
    StreamingOptions = [soDisableEventsWhileStreaming]
    IndexDefs = <>
    Left = 48
    Top = 256
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
    Left = 16
    Top = 256
  end
  object dsIngresos: TDADataSource
    DataSet = cdsIngresos.Dataset
    DataTable = cdsIngresos
    Left = 16
    Top = 288
  end
  object dsDetalleIngreso: TDADataSource
    DataSet = cdsDetalleIngreso.Dataset
    DataTable = cdsDetalleIngreso
    Left = 48
    Top = 288
  end
  object cdsIDTipoValores: TDACDSDataTable
    Fields = <>
    LogicalName = 'Reporte'
    Params = <
      item
        Name = 'TurnoID'
        Value = '1'
        ParamType = daptInput
      end>
    ReadOnly = True
    RemoteDataAdapter = rdaIDTipoValores
    RemoteUpdatesOptions = []
    StreamingOptions = [soDisableEventsWhileStreaming]
    IndexDefs = <>
    Left = 24
    Top = 56
  end
  object rdaIDTipoValores: TDARemoteDataAdapter
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
      end
      item
        Name = 'Parametros'
        DataType = rtUserDefined
        Flag = fIn
        TypeName = 'TParametros'
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
    Left = 24
    Top = 104
  end
end
