inherited frmIngresos: TfrmIngresos
  Caption = 'frmIngresos'
  ClientHeight = 526
  ClientWidth = 1107
  OnShow = FormShow
  ExplicitWidth = 1107
  ExplicitHeight = 526
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 0
    Hint = ''
    Align = alTop
    TabOrder = 0
    Height = 125
    Width = 1107
    object cxLabel1: TcxLabel
      Left = 645
      Top = 13
      Hint = ''
      Caption = 'El corte Inicio'
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
      Left = 213
      Top = 92
      Hint = ''
      Enabled = False
      Properties.DecimalPlaces = 0
      Properties.DisplayFormat = '#'
      Properties.ReadOnly = True
      TabOrder = 1
      Width = 98
    end
    object dtpFecha: TcxDBDateEdit
      Left = 166
      Top = 12
      Hint = ''
      DataBinding.DataField = 'FECHA'
      DataBinding.DataSource = dsIngresos
      Enabled = False
      Properties.ReadOnly = False
      TabOrder = 2
      Width = 145
    end
    object cxLabel9: TcxLabel
      Left = 24
      Top = 67
      Hint = ''
      Caption = 'Encargado'
      Style.BorderStyle = ebsNone
      Style.LookAndFeel.Kind = lfUltraFlat
      StyleDisabled.LookAndFeel.Kind = lfUltraFlat
      StyleFocused.LookAndFeel.Kind = lfUltraFlat
      StyleHot.LookAndFeel.Kind = lfUltraFlat
      Transparent = True
    end
    object cbEncargado: TcxDBLookupComboBox
      Left = 86
      Top = 65
      Hint = ''
      DataBinding.DataField = 'IDEMPLEADO'
      DataBinding.DataSource = dsEncargadoIngreso
      Properties.KeyFieldNames = 'IDEMPLEADO'
      Properties.ListColumns = <
        item
          FieldName = 'NOMBRE'
        end>
      Properties.ListSource = dsEmpleado
      Style.BorderStyle = ebsUltraFlat
      TabOrder = 4
      Width = 225
    end
    object cxLabel14: TcxLabel
      Left = 24
      Top = 13
      Hint = ''
      Caption = 'Fecha'
      Style.BorderStyle = ebsNone
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      Transparent = True
    end
    object cxDBLookupComboBox1: TcxDBLookupComboBox
      Left = 166
      Top = 39
      Hint = ''
      DataBinding.DataField = 'IDHORARIO'
      DataBinding.DataSource = dsIngresos
      Properties.KeyFieldNames = 'IDHORARIO'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRIPCION'
        end>
      Properties.ListSource = dsTurno
      TabOrder = 6
      Width = 145
    end
    object cxLabel2: TcxLabel
      Left = 24
      Top = 40
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
    object cxGroupBox2: TcxGroupBox
      Left = 317
      Top = 3
      Hint = ''
      Caption = 'Totales'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -16
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      TabOrder = 8
      Height = 116
      Width = 322
      object cxLabel3: TcxLabel
        Left = 7
        Top = 23
        Hint = ''
        Caption = 'Total de la Venta'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        Transparent = True
      end
      object cxLabel4: TcxLabel
        Left = 7
        Top = 44
        Hint = ''
        Caption = 'Total Entregado'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        Transparent = True
      end
      object cxLabel5: TcxLabel
        Left = 7
        Top = 64
        Hint = ''
        Caption = 'Salida de Ingresos'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        Transparent = True
      end
      object cxLabel6: TcxLabel
        Left = 7
        Top = 85
        Hint = ''
        Caption = 'Falta por Entregar'
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        Transparent = True
      end
      object cxDBLabel1: TcxDBLabel
        Left = 139
        Top = 23
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
        Transparent = True
        Height = 21
        Width = 158
      end
      object cxDBLabel2: TcxDBLabel
        Left = 139
        Top = 44
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
        Transparent = True
        Height = 21
        Width = 158
      end
      object cxDBLabel3: TcxDBLabel
        Left = 139
        Top = 64
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
        Transparent = True
        Height = 21
        Width = 158
      end
      object cxDBLabel4: TcxDBLabel
        Left = 139
        Top = 85
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
        Transparent = True
        Height = 21
        Width = 158
      end
    end
    object cxLabel7: TcxLabel
      Left = 24
      Top = 93
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
    object cxLabel8: TcxLabel
      Left = 645
      Top = 67
      Hint = ''
      Caption = 'El corte Termino'
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
    object tInicio: TcxTimeEdit
      Left = 645
      Top = 39
      Hint = ''
      EditValue = 0d
      Enabled = False
      Properties.Use24HourFormat = False
      TabOrder = 11
      Width = 121
    end
    object tFin: TcxTimeEdit
      Left = 645
      Top = 92
      Hint = ''
      EditValue = 0d
      Enabled = False
      Properties.Use24HourFormat = False
      TabOrder = 12
      Width = 121
    end
    object cxGroupBox4: TcxGroupBox
      Left = 772
      Top = 3
      Hint = ''
      Caption = 'Totales Creditos, Debitos y Cupones'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -16
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      TabOrder = 13
      Height = 65
      Width = 317
      object cxLabel10: TcxLabel
        Left = 79
        Top = 30
        Hint = ''
        Transparent = True
      end
      object cxLabel11: TcxLabel
        Left = 6
        Top = 30
        Hint = ''
        Caption = 'Importe'
        Transparent = True
      end
    end
  end
  object cxGroupBox3: TcxGroupBox
    Left = 0
    Top = 125
    Hint = ''
    Align = alClient
    TabOrder = 1
    Height = 401
    Width = 1107
    object pgcConceptos: TcxPageControl
      Left = 3
      Top = 22
      Width = 1101
      Height = 376
      Hint = ''
      Align = alClient
      TabOrder = 0
      Properties.ActivePage = cxTabSheet6
      Properties.CustomButtons.Buttons = <>
      Properties.Images = dmImages.Imagenes2
      OnPageChanging = pgcConceptosPageChanging
      ClientRectBottom = 370
      ClientRectLeft = 3
      ClientRectRight = 1095
      ClientRectTop = 27
      object cxTabSheet6: TcxTabSheet
        Caption = 'Totales'
        ImageIndex = 24
      end
      object Conceptos: TcxTabSheet
        Caption = 'Venta'
        ImageIndex = 59
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object dbgConceptos: TcxGrid
          Left = 0
          Top = 0
          Width = 1095
          Height = 365
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
            OptionsView.GroupByBox = False
            object Descripcion: TcxGridDBColumn
              DataBinding.FieldName = 'DESCRIPCION'
              HeaderGlyph.Data = {
                36040000424D3604000000000000360000002800000010000000100000000100
                20000000000000040000D60D0000D60D00000000000000000000FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009F9F
                9F005F5F5F005D5D5D005D5D5D005D5D5D005F5F5F009F9F9F00FFFFFF00F0F0
                F000A0A0A0006C6C6C0073737300D3D3D300FFFFFF00FFFFFF00FFFFFF006666
                6600646464006464640064646400646464006464640066666600FFFFFF009999
                990099999900E9E9E900C2C2C20076767600FFFFFF00FFFFFF00FFFFFF006B6B
                6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B00FFFFFF007171
                7100FAFAFA00E8E8E8007B7B7B00C1C1C100FFFFFF00FFFFFF00FFFFFF007373
                7300737373007373730073737300737373007373730073737300FFFFFF007777
                7700FFFFFF008A8A8A00BABABA00FFFFFF00FFFFFF00FFFFFF00FFFFFF007A7A
                7A007A7A7A007A7A7A007A7A7A007A7A7A007A7A7A007A7A7A00F3F3F3007D7D
                7D00FFFFFF007A7A7A00F9F9F900FFFFFF00FFFFFF00FFFFFF00FFFFFF008181
                8100818181008181810081818100818181008181810081818100818181009E9E
                9E00FFFFFF0081818100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008888
                8800888888008888880088888800888888008888880088888800D5D5D500F8F8
                F800FFFFFF0088888800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008F8F
                8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F8F008F8F8F00FFFFFF00F6F6
                F600D5D5D50090909000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009696
                9600EFEFEF00FFFFFF00FFFFFF00FFFFFF00EFEFEF0096969600FFFFFF00BABA
                BA0096969600A6A6A600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009D9D
                9D00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009D9D9D00FFFFFF00AAAA
                AA009D9D9D00BDBDBD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A4A4
                A400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A4A4A400FFFFFF00BEBE
                BE00A4A4A400D1D1D100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ABAB
                AB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ABABAB00CECECE00BCBC
                BC00D4D4D400F3F3F300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B4B4
                B400F3F3F300FFFFFF00FFFFFF00FFFFFF00F3F3F300B4B4B400DFDFDF00FEFE
                FE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D6D6
                D600BBBBBB00BABABA00BABABA00BABABA00BBBBBB00DADADA00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
              Width = 222
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
              Properties.ListSource = dsProductosCombustibles
              Properties.OnValidate = ProductoPropertiesValidate
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
              Properties.OnValidate = CantidadPropertiesValidate
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
              Properties.OnValidate = ImportePropertiesValidate
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
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object dbgCreditosDebitosCupones: TcxGrid
          Left = 0
          Top = 0
          Width = 1095
          Height = 365
          Hint = ''
          Align = alClient
          TabOrder = 0
          object cxGridDBTableView2: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            OnFocusedRecordChanged = dbgConceptos1DBTableView1FocusedRecordChanged
            DataController.DataSource = dsDetalleIngreso
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Kind = skSum
                FieldName = 'CANTIDAD'
                Column = CreditosCantidad
              end
              item
                Kind = skSum
                FieldName = 'IMPORTE'
                Column = CreditosImporte
              end>
            DataController.Summary.SummaryGroups = <>
            NewItemRow.InfoText = 'Precione aqui para agregar un Registro nuevo'
            NewItemRow.Visible = True
            OptionsBehavior.FocusCellOnTab = True
            OptionsBehavior.GoToNextCellOnEnter = True
            OptionsBehavior.FocusCellOnCycle = True
            OptionsView.Footer = True
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
              Properties.ListSource = dsProductosCombustibles
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
              Width = 100
            end
          end
          object cxGridLevel2: TcxGridLevel
            GridView = cxGridDBTableView2
          end
        end
      end
      object cxTabSheet1: TcxTabSheet
        Caption = 'Otros Productos'
        ImageIndex = 62
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object cxGrid1: TcxGrid
          Left = 0
          Top = 0
          Width = 1095
          Height = 365
          Hint = ''
          Align = alClient
          TabOrder = 0
          object cxGridDBTableView1: TcxGridDBTableView
            OnKeyDown = cxGridDBTableView1KeyDown
            Navigator.Buttons.CustomButtons = <>
            OnFocusedRecordChanged = dbgConceptos1DBTableView1FocusedRecordChanged
            DataController.DataSource = dsDetalleIngreso
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            NewItemRow.InfoText = 'Precione aqui para agregar un Registro nuevo'
            NewItemRow.Visible = True
            OptionsBehavior.FocusCellOnTab = True
            OptionsBehavior.GoToNextCellOnEnter = True
            OptionsBehavior.FocusCellOnCycle = True
            OptionsView.GroupByBox = False
            OptionsView.Indicator = True
            object ProductoDescripcion: TcxGridDBColumn
              Caption = 'Descripcion'
              DataBinding.FieldName = 'IDPRODUCTO'
              PropertiesClassName = 'TcxLookupComboBoxProperties'
              Properties.KeyFieldNames = 'IDPRODUCTO'
              Properties.ListColumns = <
                item
                  FieldName = 'NOMBRE'
                end>
              Properties.ListSource = dsProductos
              Properties.OnValidate = ProductoDescripcionPropertiesValidate
              HeaderGlyph.Data = {
                B6020000424DB60200000000000036000000280000000A000000100000000100
                20000000000080020000120B0000120B00000000000000000000D2C3B600BD9B
                7A00C19F7E00C29F7E00C39F7E00C3A07E00C2A07E00C09E7E00BFA17F00C5A7
                B100C3823E00D9872000E1891D00E18E2500E4952700E4952700E28F2500E28B
                1F00D9821900C68C4700CB873C00DC963E00422ECE00241EEB002920E8002820
                E700211BE9003C2ACB00DA8C2C00CB843500CA8A4300D59445004B48C7004142
                D2004A4AD7004F50DC005254E4005D5ADD00D1862E00C9873E00C88B4900D091
                3D009E987D009C998100AAA78D00B9B69C00C8C7AD00D5D0B400D0882C00C586
                4200C98E4E00C98B3900958F8A009B9999009C989700A9A5A400B7B6B500C3BE
                B900C8842B00C4884500CA905400C7883600918B8500A1A19E00ABA7A400ADA8
                A400B6B6B300C4BEB700C5822A00C78B4900CB945B00C68735008E8983009E9D
                9B00B1AEAB00BCB9B500BFBFBD00C5C1BA00C6832D00C78D4E00CD996200C584
                2F008C878100989DA200ABADAF00BCBEC000CBCFD200D4D2CD00D6A36100C990
                5300CF9F6300CB8C3400B67D3500BA8C5000C2965D00C89E6800D0A87500D4AC
                7800DBAB6F00CB935B00EDDADD00DFBE9E00DDAE6A00CB832700CB862F00CF8E
                3F00D1944700D29A5300D9AA6C00CC976100FFFFFF00FFFFFF00E2C7B800E1C0
                9100CD903E00CA8B3D00CF954C00D19B5600D8A96B00CC9A6400FFFFFF00FFFF
                FF00FFFFFF00EBD8DA00E3C5A400D39E5300CD924600CF975000D8A96A00CF9E
                6900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFCFD00E5CAB900ECC99F00DDA0
                5800DDA45E00CF9B6F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00B5A49B0074553500876C480096618100FFFFFF00FFFFFF00FFFFFF00FFFF
                FF00FFFFFF00FFFFFF0089868C002E363900596562008F699300}
              Width = 191
            end
            object ProductoPrecio: TcxGridDBColumn
              Caption = 'Precio'
              DataBinding.FieldName = 'PRECIO'
              Width = 76
            end
            object Recibido: TcxGridDBColumn
              Caption = 'Recibido'
              DataBinding.FieldName = 'RECIBIDO'
              Width = 78
            end
            object Resurtido: TcxGridDBColumn
              Caption = 'Resurtido'
              DataBinding.FieldName = 'RESURTIDO'
              Width = 70
            end
            object ProductoEntregado: TcxGridDBColumn
              Caption = 'Entregado'
              DataBinding.FieldName = 'ENTREGADO'
            end
            object ProductoCantidad: TcxGridDBColumn
              Caption = 'Cantidad'
              DataBinding.FieldName = 'CANTIDAD'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.OnValidate = ProductoCantidadPropertiesValidate
            end
            object ProductoImporte: TcxGridDBColumn
              Caption = 'Importe'
              DataBinding.FieldName = 'IMPORTE'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.OnValidate = ProductoImportePropertiesValidate
            end
          end
          object cxGridLevel1: TcxGridLevel
            GridView = cxGridDBTableView1
          end
        end
      end
      object cxTabSheet3: TcxTabSheet
        Caption = 'Documentos'
        ImageIndex = 39
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object dbgClientes: TcxGrid
          Left = 0
          Top = 0
          Width = 1095
          Height = 365
          Hint = ''
          Align = alClient
          TabOrder = 0
          object cxGridDBTableView3: TcxGridDBTableView
            OnKeyDown = cxGridDBTableView3KeyDown
            Navigator.Buttons.CustomButtons = <>
            OnFocusedRecordChanged = dbgConceptos1DBTableView1FocusedRecordChanged
            DataController.DataSource = dsDetalleIngreso
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            NewItemRow.InfoText = 'Precione aqui para agregar un Registro nuevo'
            NewItemRow.Visible = True
            OptionsBehavior.FocusCellOnTab = True
            OptionsBehavior.GoToNextCellOnEnter = True
            OptionsBehavior.FocusCellOnCycle = True
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
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object dbgEfectivo: TcxGrid
          Left = 0
          Top = 0
          Width = 1095
          Height = 365
          Hint = ''
          Align = alClient
          TabOrder = 0
          object cxGridDBTableView4: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            OnFocusedRecordChanged = dbgConceptos1DBTableView1FocusedRecordChanged
            DataController.DataSource = dsDetalleIngreso
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            NewItemRow.InfoText = 'Precione aqui para agregar un Registro nuevo'
            NewItemRow.Visible = True
            OptionsBehavior.FocusCellOnTab = True
            OptionsBehavior.GoToNextCellOnEnter = True
            OptionsBehavior.FocusCellOnCycle = True
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
              Properties.ListSource = dsTipoCambio
              Properties.OnValidate = EfectivoDescripcionPropertiesValidate
              Width = 205
            end
            object EfectivoCantidad: TcxGridDBColumn
              Caption = 'Cantidad'
              DataBinding.FieldName = 'CANTIDAD'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.OnValidate = EfectivoCantidadPropertiesValidate
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
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object dbgSalidaEfectivos: TcxGrid
          Left = 0
          Top = 0
          Width = 1095
          Height = 365
          Hint = ''
          Align = alClient
          TabOrder = 0
          object cxGridDBTableView5: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            OnFocusedRecordChanged = dbgConceptos1DBTableView1FocusedRecordChanged
            DataController.DataSource = dsDetalleIngreso
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            NewItemRow.InfoText = 'Precione aqui para agregar un Registro nuevo'
            NewItemRow.Visible = True
            OptionsBehavior.FocusCellOnTab = True
            OptionsBehavior.GoToNextCellOnEnter = True
            OptionsBehavior.FocusCellOnCycle = True
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
  end
  object cdsIngresos: TDACDSDataTable
    Fields = <
      item
        Name = 'IDINGRESO'
        DataType = datInteger
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
        DisplayFormat = '#0.00'
      end
      item
        Name = 'EFECTIVOENTREGADO'
        DataType = datFloat
        DisplayFormat = '#0.00'
      end
      item
        Name = 'SALIDAEFECTIVO'
        DataType = datFloat
        DisplayFormat = '#0.00'
      end
      item
        Name = 'DIFERENCIA'
        DataType = datFloat
        DisplayFormat = '#0.00'
      end>
    LogicalName = 'dbo INGRESOS'
    Params = <
      item
        Name = 'NUMEROESTACION'
        DataType = datInteger
        Value = '1'
      end
      item
        Name = 'IDTURNO'
        DataType = datInteger
        Value = '1'
      end>
    RemoteDataAdapter = DM.RemoteDataAdapter
    RemoteUpdatesOptions = []
    StreamingOptions = [soDisableEventsWhileStreaming]
    IndexDefs = <>
    Left = 16
    Top = 224
  end
  object dsIngresos: TDADataSource
    DataSet = cdsIngresos.Dataset
    DataTable = cdsIngresos
    Left = 16
    Top = 256
  end
  object dsDetalleIngreso: TDADataSource
    DataSet = cdsDetalleIngreso.Dataset
    DataTable = cdsDetalleIngreso
    Left = 48
    Top = 256
  end
  object cdsDetalleIngreso: TDACDSDataTable
    Fields = <
      item
        Name = 'IDDETALLEINGRESOS'
        DataType = datInteger
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
        Name = 'IMPUESTOPORCENTAJE'
        DataType = datFloat
      end
      item
        Name = 'IEPS'
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
    LogicalName = 'dbo.DETALLEINGRESOS'
    Params = <
      item
        Name = 'IDINGRESO'
        DataType = datInteger
        Value = ''
        ParamType = daptInput
      end>
    RemoteDataAdapter = DM.RemoteDataAdapter
    RemoteUpdatesOptions = []
    StreamingOptions = [soDisableEventsWhileStreaming]
    AfterDelete = cdsDetalleIngresoAfterDelete
    AfterPost = cdsDetalleIngresoAfterPost
    BeforePost = cdsDetalleIngresoBeforePost
    OnNewRecord = cdsDetalleIngresoNewRecord
    IndexDefs = <>
    Left = 48
    Top = 224
  end
  object dsEncargadoIngreso: TDADataSource
    DataSet = cdsEncargadoIngreso.Dataset
    DataTable = cdsEncargadoIngreso
    Left = 80
    Top = 256
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
    Left = 136
    Top = 224
  end
  object dsTipoValor: TDADataSource
    DataSet = cdsTipoComprobacion.Dataset
    DataTable = cdsTipoComprobacion
    Left = 136
    Top = 256
  end
  object cdsProductosCombustibles: TDACDSDataTable
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
    LogicalName = 'dbo PRODUCTO'
    Params = <>
    RemoteDataAdapter = DM.RemoteDataAdapter
    RemoteUpdatesOptions = []
    StreamingOptions = [soDisableEventsWhileStreaming]
    IndexDefs = <>
    Left = 288
    Top = 224
  end
  object dsProductosCombustibles: TDADataSource
    DataSet = cdsProductosCombustibles.Dataset
    DataTable = cdsProductosCombustibles
    Left = 288
    Top = 256
  end
  object cdsEncargadoIngreso: TDACDSDataTable
    Fields = <
      item
        Name = 'IDENCARGADOINGRESOS'
        DataType = datInteger
        Required = True
        InPrimaryKey = True
      end
      item
        Name = 'IDEMPLEADO'
        DataType = datInteger
        Required = True
      end
      item
        Name = 'IDINGRESO'
        DataType = datInteger
        Required = True
      end
      item
        Name = 'OBSERVACIONES'
        DataType = datString
        Size = 150
      end>
    LogicalName = 'dbo.ENCARGADOINGRESOS'
    Params = <
      item
        Name = 'IDINGRESO'
        DataType = datInteger
        Value = ''
        ParamType = daptInput
      end>
    RemoteDataAdapter = DM.RemoteDataAdapter
    RemoteUpdatesOptions = []
    StreamingOptions = [soDisableEventsWhileStreaming]
    IndexDefs = <>
    Left = 80
    Top = 224
  end
  object rdaConsumos: TDARemoteDataAdapter
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
    UpdateDataCall.RemoteService = DMFlotillas.RemoteService
    GetScriptsCall.RemoteService = DMFlotillas.RemoteService
    RemoteService = DMFlotillas.RemoteService
    DataStreamer = DM.DataStreamer
    Left = 48
    Top = 304
  end
  object cdsConsumos: TDACDSDataTable
    Fields = <>
    LogicalName = 'Reporte'
    Params = <
      item
        Name = 'TurnoID'
        Value = '1'
        ParamType = daptInput
      end>
    ReadOnly = True
    RemoteDataAdapter = rdaConsumos
    RemoteUpdatesOptions = []
    StreamingOptions = [soDisableEventsWhileStreaming]
    IndexDefs = <>
    Left = 16
    Top = 304
  end
  object cdsEmpleado: TDACDSDataTable
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
    LogicalName = 'dbo EMPLEADO'
    Params = <>
    RemoteDataAdapter = DM.RemoteDataAdapter
    RemoteUpdatesOptions = []
    StreamingOptions = [soDisableEventsWhileStreaming]
    IndexDefs = <>
    Left = 168
    Top = 224
  end
  object dsEmpleado: TDADataSource
    DataSet = cdsEmpleado.Dataset
    DataTable = cdsEmpleado
    Left = 168
    Top = 256
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
    Left = 200
    Top = 224
  end
  object dsTurno: TDADataSource
    DataSet = cdsTurno.Dataset
    DataTable = cdsTurno
    Left = 200
    Top = 256
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
    Left = 48
    Top = 336
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
    Left = 16
    Top = 336
  end
  object cdsHorasCortes: TDACDSDataTable
    Fields = <>
    LogicalName = 'Reporte'
    Params = <
      item
        Name = 'TurnoID'
        Value = '1'
        ParamType = daptInput
      end>
    ReadOnly = True
    RemoteDataAdapter = rdaHorasCortes
    RemoteUpdatesOptions = []
    StreamingOptions = [soDisableEventsWhileStreaming]
    IndexDefs = <>
    Left = 80
    Top = 304
  end
  object rdaHorasCortes: TDARemoteDataAdapter
    GetSchemaCall.RemoteService = DMCistemGas.RemoteService
    GetDataCall.RemoteService = DMCistemGas.RemoteService
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
    UpdateDataCall.RemoteService = DMCistemGas.RemoteService
    GetScriptsCall.RemoteService = DMCistemGas.RemoteService
    RemoteService = DMCistemGas.RemoteService
    DataStreamer = DM.DataStreamer
    Left = 112
    Top = 304
  end
  object cdsProductos: TDACDSDataTable
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
    LogicalName = 'dbo PRODUCTO'
    Params = <>
    RemoteDataAdapter = DM.RemoteDataAdapter
    RemoteUpdatesOptions = []
    StreamingOptions = [soDisableEventsWhileStreaming]
    IndexDefs = <>
    Left = 320
    Top = 224
  end
  object dsProductos: TDADataSource
    DataSet = cdsProductos.Dataset
    DataTable = cdsProductos
    Left = 320
    Top = 256
  end
  object cdsClientes: TDACDSDataTable
    Fields = <
      item
        Name = 'IDCLIENTE'
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
        Size = 80
      end
      item
        Name = 'GRUPO'
        DataType = datString
        Size = 30
      end
      item
        Name = 'CALLE'
        DataType = datString
        Size = 60
      end
      item
        Name = 'COLONIA'
        DataType = datString
        Size = 30
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
        Name = 'CODIGOPOSTAL'
        DataType = datString
        Size = 5
      end
      item
        Name = 'RFC'
        DataType = datString
        Size = 15
      end
      item
        Name = 'CURP'
        DataType = datString
        Size = 20
      end
      item
        Name = 'STATUS'
        DataType = datInteger
      end
      item
        Name = 'CCA'
        DataType = datString
        Size = 20
      end
      item
        Name = 'CCC'
        DataType = datString
        Size = 20
      end
      item
        Name = 'LOCALIDAD'
        DataType = datString
        Size = 25
      end
      item
        Name = 'DIRECCION'
        DataType = datString
        Size = 100
      end
      item
        Name = 'NOEXTERIOR'
        DataType = datString
        Size = 50
      end
      item
        Name = 'NOINTERIOR'
        DataType = datString
        Size = 50
      end
      item
        Name = 'MUNICIPIO'
        DataType = datString
        Size = 100
      end
      item
        Name = 'ESTADO'
        DataType = datString
        Size = 100
      end
      item
        Name = 'PAIS'
        DataType = datString
        Size = 100
      end
      item
        Name = 'EMAIL'
        DataType = datString
        Size = 150
      end>
    LogicalName = 'dbo CLIENTE EFECTIVO'
    Params = <>
    RemoteDataAdapter = DM.RemoteDataAdapter
    RemoteUpdatesOptions = []
    StreamingOptions = [soDisableEventsWhileStreaming]
    IndexDefs = <>
    Left = 352
    Top = 224
  end
  object dsClientes: TDADataSource
    DataSet = cdsClientes.Dataset
    DataTable = cdsClientes
    Left = 352
    Top = 256
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
    Left = 384
    Top = 224
  end
  object dsTipoCambio: TDADataSource
    DataSet = cdsTipoCambio.Dataset
    DataTable = cdsTipoCambio
    Left = 384
    Top = 256
  end
end
