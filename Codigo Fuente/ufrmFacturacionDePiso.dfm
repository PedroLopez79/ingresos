inherited FrmFacturacionDePiso: TFrmFacturacionDePiso
  Left = 320
  Align = alClient
  Caption = 'FrmFacturacionDePiso'
  ClientHeight = 618
  ClientWidth = 812
  Position = poDesigned
  ExplicitWidth = 812
  ExplicitHeight = 618
  PixelsPerInch = 96
  TextHeight = 13
  object pgcFacturacion: TcxPageControl
    Left = 9
    Top = 32
    Width = 792
    Height = 586
    Hint = ''
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Properties.ActivePage = cxTabFacturacion
    Properties.CustomButtons.Buttons = <>
    Properties.Images = dmImages.Imagenes
    Properties.TabPosition = tpBottom
    LookAndFeel.NativeStyle = False
    ClientRectBottom = 556
    ClientRectLeft = 3
    ClientRectRight = 786
    ClientRectTop = 3
    object cxTabFacturacion: TcxTabSheet
      Caption = 'Facturaci'#243'n '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImageIndex = 37
      ParentFont = False
      object GrBoxDatos: TcxGroupBox
        Left = 0
        Top = 0
        Hint = ''
        TabStop = True
        Align = alTop
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 0
        Height = 171
        Width = 783
        object LblFolio: TcxLabel
          Left = 204
          Top = 8
          Hint = ''
          Caption = 'Folio'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
        object LblNoCliente: TcxLabel
          Left = 8
          Top = 47
          Hint = ''
          Caption = 'Cliente'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
        object LblRFC: TcxLabel
          Left = 450
          Top = 47
          Hint = ''
          Caption = 'RFC'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
        object LblFecha: TcxLabel
          Left = 10
          Top = 8
          Hint = ''
          Caption = 'Fecha'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
        object LblDireccion: TcxLabel
          Left = 8
          Top = 87
          Hint = ''
          Caption = 'Direcci'#243'n'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
        object LblColnia: TcxLabel
          Left = 450
          Top = 87
          Hint = ''
          Caption = 'Colonia'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
        object LblCiudad: TcxLabel
          Left = 8
          Top = 124
          Hint = ''
          Caption = 'Ciudad'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
        object LblCodigoPostal: TcxLabel
          Left = 312
          Top = 124
          Hint = ''
          Caption = 'Codigo Postal'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
        object cxLabel1: TcxLabel
          Left = 93
          Top = 47
          Hint = ''
          Caption = 'Nombre'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
        object cxDbTxtFolio: TcxDBTextEdit
          Left = 204
          Top = 24
          Hint = ''
          DataBinding.DataField = 'Folio'
          DataBinding.DataSource = dsFactura
          Properties.CharCase = ecUpperCase
          TabOrder = 1
          Width = 117
        end
        object cxDBTxtCliente: TcxDBTextEdit
          Left = 10
          Top = 20
          Hint = ''
          DataBinding.DataField = 'ClienteID'
          DataBinding.DataSource = dsFactura
          Properties.CharCase = ecUpperCase
          TabOrder = 4
          OnExit = cxDBTxtClienteExit
          Width = 77
        end
        object cxDBTxtNombre: TcxDBTextEdit
          Left = 93
          Top = 64
          Hint = ''
          DataBinding.DataField = 'Nombre'
          DataBinding.DataSource = dsCliente
          Enabled = False
          Properties.CharCase = ecUpperCase
          TabOrder = 14
          Width = 351
        end
        object cxDBTxtRFC: TcxDBTextEdit
          Left = 450
          Top = 64
          Hint = ''
          DataBinding.DataField = 'RFC'
          DataBinding.DataSource = dsCliente
          Enabled = False
          Properties.CharCase = ecUpperCase
          TabOrder = 15
          Width = 161
        end
        object cxDBTxtDireccion: TcxDBTextEdit
          Left = 10
          Top = 102
          Hint = ''
          DataBinding.DataField = 'Calle'
          DataBinding.DataSource = dsCliente
          Enabled = False
          Properties.CharCase = ecUpperCase
          TabOrder = 16
          Width = 434
        end
        object cxDBTxtColonia: TcxDBTextEdit
          Left = 450
          Top = 102
          Hint = ''
          DataBinding.DataField = 'Colonia'
          DataBinding.DataSource = dsCliente
          Enabled = False
          Properties.CharCase = ecUpperCase
          TabOrder = 17
          Width = 161
        end
        object cxDBTxtCiudad: TcxDBTextEdit
          Left = 10
          Top = 140
          Hint = ''
          DataBinding.DataField = 'Ciudad'
          DataBinding.DataSource = dsCliente
          Enabled = False
          Properties.CharCase = ecUpperCase
          TabOrder = 18
          Width = 296
        end
        object cxDBTxtCP: TcxDBTextEdit
          Left = 312
          Top = 140
          Hint = ''
          DataBinding.DataField = 'CodigoPostal'
          DataBinding.DataSource = dsCliente
          Enabled = False
          Properties.CharCase = ecUpperCase
          TabOrder = 19
          Width = 132
        end
        object cxDBDateFecha: TcxDBDateEdit
          Left = 10
          Top = 24
          Hint = ''
          TabStop = False
          DataBinding.DataField = 'Fecha'
          DataBinding.DataSource = dsFactura
          Enabled = False
          TabOrder = 20
          Width = 132
        end
        object cxDBTxtSerie: TcxDBTextEdit
          Left = 150
          Top = 24
          Hint = ''
          DataBinding.DataField = 'Serie'
          DataBinding.DataSource = dsFactura
          Properties.CharCase = ecUpperCase
          TabOrder = 0
          Width = 47
        end
        object cxLabel3: TcxLabel
          Left = 150
          Top = 8
          Hint = ''
          Caption = 'Serie'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
        object cbxFormaPago: TcxDBLookupComboBox
          Left = 450
          Top = 24
          Hint = ''
          DataBinding.DataField = 'FormaPagoID'
          DataBinding.DataSource = dsFactura
          Properties.KeyFieldNames = 'FormaPagoID'
          Properties.ListColumns = <
            item
              FieldName = 'FormaPagoID'
            end
            item
              Caption = 'Descripci'#243'n'
              FieldName = 'Descripcion'
            end>
          Properties.ListSource = dsFormaPago
          TabOrder = 3
          Width = 161
        end
        object cxLabel2: TcxLabel
          Left = 450
          Top = 8
          Hint = ''
          Caption = 'Forma de Pago'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
        object cbxTipoFactura: TcxDBLookupComboBox
          Left = 327
          Top = 24
          Hint = ''
          DataBinding.DataField = 'TipoFacturaID'
          DataBinding.DataSource = dsFactura
          Properties.KeyFieldNames = 'TipoFacturaID'
          Properties.ListColumns = <
            item
              FieldName = 'Descripcion'
            end>
          TabOrder = 2
          Width = 117
        end
        object cxLabel4: TcxLabel
          Left = 325
          Top = 8
          Hint = ''
          Caption = 'Tipo Factura'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
      end
      object cxGroupBox1: TcxGroupBox
        Left = 0
        Top = 481
        Hint = ''
        Align = alBottom
        TabOrder = 1
        Height = 72
        Width = 783
        object LblFacturacionIva: TcxLabel
          Left = 439
          Top = 32
          Hint = ''
          Caption = 'IVA'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
        object LblFacturacionTotal: TcxLabel
          Left = 439
          Top = 55
          Hint = ''
          Caption = 'Total'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
        object txtTotalFactura: TcxDBTextEdit
          Left = 495
          Top = 51
          Hint = ''
          TabStop = False
          DataBinding.DataField = 'Total'
          DataBinding.DataSource = dsFactura
          Enabled = False
          Properties.Alignment.Horz = taRightJustify
          Properties.ReadOnly = True
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 2
          Width = 121
        end
        object txtImpuestoFactura: TcxDBTextEdit
          Left = 495
          Top = 29
          Hint = ''
          TabStop = False
          DataBinding.DataField = 'Impuesto'
          DataBinding.DataSource = dsFactura
          Enabled = False
          Properties.Alignment.Horz = taRightJustify
          Properties.ReadOnly = True
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 3
          Width = 121
        end
        object txtSubTotalFactura: TcxDBTextEdit
          Left = 495
          Top = 7
          Hint = ''
          TabStop = False
          DataBinding.DataField = 'Subtotal'
          DataBinding.DataSource = dsFactura
          Enabled = False
          Properties.Alignment.Horz = taRightJustify
          Properties.ReadOnly = True
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 4
          Width = 121
        end
        object LblFacturacionSubtotal: TcxLabel
          Left = 439
          Top = 11
          Hint = ''
          Caption = 'Subtotal'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
      end
      object cxGroupBox2: TcxGroupBox
        Left = 0
        Top = 171
        Hint = ''
        Align = alClient
        TabOrder = 2
        Height = 310
        Width = 783
        object GridFacturacion: TcxGrid
          Left = 3
          Top = 22
          Width = 777
          Height = 285
          Hint = ''
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          LookAndFeel.Kind = lfStandard
          LookAndFeel.NativeStyle = True
          object GridFacturacionDBTableView1: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            DataController.DataSource = dsDetalleFactura
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            NewItemRow.Visible = True
            OptionsBehavior.FocusCellOnTab = True
            OptionsBehavior.FocusFirstCellOnNewRecord = True
            OptionsBehavior.GoToNextCellOnEnter = True
            OptionsBehavior.FocusCellOnCycle = True
            object GridFacturacionDBTableView1ProductoID: TcxGridDBColumn
              DataBinding.FieldName = 'ProductoID'
            end
            object GridFacturacionDBTableView1Descripcion: TcxGridDBColumn
              DataBinding.FieldName = 'Descripcion'
              Width = 342
            end
            object GridFacturacionDBTableView1Cantidad: TcxGridDBColumn
              DataBinding.FieldName = 'Cantidad'
            end
            object GridFacturacionDBTableView1PrecioCalculado: TcxGridDBColumn
              Caption = 'Precio'
              DataBinding.FieldName = 'PrecioCalculado'
              Options.Editing = False
              Options.Focusing = False
            end
            object GridFacturacionDBTableView1Importe: TcxGridDBColumn
              DataBinding.FieldName = 'Importe'
              Options.Editing = False
              Options.Focusing = False
              Width = 77
            end
          end
          object GridFacturacionLevel1: TcxGridLevel
            GridView = GridFacturacionDBTableView1
          end
        end
      end
    end
    object cxTabTicket: TcxTabSheet
      Caption = 'Tickets '
      ImageIndex = 21
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object cxGroupBox3: TcxGroupBox
        Left = 0
        Top = 0
        Hint = ''
        Align = alClient
        TabOrder = 0
        Height = 553
        Width = 783
        object grdTicket: TcxGrid
          Left = 3
          Top = 22
          Width = 777
          Height = 528
          Hint = ''
          Align = alClient
          TabOrder = 0
          LookAndFeel.Kind = lfStandard
          LookAndFeel.NativeStyle = True
          object cxGridDBTableView1: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            DataController.Summary.DefaultGroupSummaryItems = <
              item
                Kind = skSum
                Position = spFooter
                Column = cxGridDBTableView1Volumen
              end>
            DataController.Summary.FooterSummaryItems = <
              item
                Format = '##,###,##0.#0'
                Kind = skSum
                Column = cxGridDBTableView1Volumen
              end
              item
                Kind = skSum
                Column = cxGridDBTableView1Importe
              end>
            DataController.Summary.SummaryGroups = <>
            NewItemRow.Visible = True
            OptionsBehavior.FocusCellOnTab = True
            OptionsBehavior.FocusFirstCellOnNewRecord = True
            OptionsBehavior.GoToNextCellOnEnter = True
            OptionsBehavior.FocusCellOnCycle = True
            OptionsView.Footer = True
            object cxGridDBTableView1TicketID: TcxGridDBColumn
              DataBinding.FieldName = 'TicketID'
              PropertiesClassName = 'TcxTextEditProperties'
            end
            object cxGridDBTableView1Fecha: TcxGridDBColumn
              DataBinding.FieldName = 'Fecha'
            end
            object cxGridDBTableView1Producto: TcxGridDBColumn
              DataBinding.FieldName = 'ProductoID'
              Width = 62
            end
            object cxGridDBTableView1Nombre: TcxGridDBColumn
              DataBinding.FieldName = 'Nombre'
              Width = 167
            end
            object cxGridDBTableView1Volumen: TcxGridDBColumn
              DataBinding.FieldName = 'Volumen'
            end
            object cxGridDBTableView1Precio: TcxGridDBColumn
              DataBinding.FieldName = 'Precio'
            end
            object cxGridDBTableView1Importe: TcxGridDBColumn
              DataBinding.FieldName = 'Importe'
            end
          end
          object cxGridLevel1: TcxGridLevel
            GridView = cxGridDBTableView1
          end
        end
        object cbxListaTicket: TcxComboBox
          Left = 504
          Top = 348
          Hint = ''
          TabStop = False
          TabOrder = 1
          Text = 'cbxListaTicket'
          Visible = False
          Width = 121
        end
        object cxGrid4: TcxGrid
          Left = 152
          Top = 128
          Width = 250
          Height = 200
          Hint = ''
          TabOrder = 2
          object cxGrid4DBTableView1: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
          end
          object cxGrid4Level1: TcxGridLevel
            GridView = cxGrid4DBTableView1
          end
        end
      end
    end
    object cxTabCupones: TcxTabSheet
      Caption = 'Cupones  '
      ImageIndex = 23
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object cxGrdCupon: TcxGrid
        Left = 0
        Top = 0
        Width = 783
        Height = 553
        Hint = ''
        Align = alClient
        TabOrder = 0
        LookAndFeel.Kind = lfStandard
        LookAndFeel.NativeStyle = True
        object cxGridDBTableView2: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          NewItemRow.Visible = True
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.FocusFirstCellOnNewRecord = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.FocusCellOnCycle = True
          object cxGridDBTableView2Importe: TcxGridDBColumn
            DataBinding.FieldName = 'Importe'
          end
          object cxGridDBTableView2Referencia: TcxGridDBColumn
            DataBinding.FieldName = 'Referencia'
          end
        end
        object cxGridLevel2: TcxGridLevel
          GridView = cxGridDBTableView2
        end
      end
    end
  end
  object cxPagFacturacion: TcxPageControl
    Left = 9
    Top = 32
    Width = 792
    Height = 586
    Hint = ''
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Properties.ActivePage = cxTabSheet1
    Properties.CustomButtons.Buttons = <>
    Properties.Images = dmImages.Imagenes
    Properties.TabPosition = tpBottom
    LookAndFeel.NativeStyle = False
    OnPageChanging = cxPagFacturacionPageChanging
    ClientRectBottom = 556
    ClientRectLeft = 3
    ClientRectRight = 786
    ClientRectTop = 3
    object cxTabSheet1: TcxTabSheet
      Caption = 'Facturaci'#243'n '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImageIndex = 37
      ParentFont = False
      object grbEncabezado: TcxGroupBox
        Left = 0
        Top = 0
        Hint = ''
        TabStop = True
        Align = alTop
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 0
        Height = 177
        Width = 783
        object cxLabel5: TcxLabel
          Left = 665
          Top = 32
          Hint = ''
          Caption = 'Folio'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
        object cxLabel6: TcxLabel
          Left = 10
          Top = 84
          Hint = ''
          Caption = 'Cliente'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
        object cxLabel7: TcxLabel
          Left = 573
          Top = 83
          Hint = ''
          Caption = 'RFC'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
        object cxLabel8: TcxLabel
          Left = 580
          Top = 9
          Hint = ''
          Caption = 'Fecha'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
        object cxLabel9: TcxLabel
          Left = 10
          Top = 106
          Hint = ''
          Caption = 'Direccion'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
        object cxLabel10: TcxLabel
          Left = 232
          Top = 131
          Hint = ''
          Caption = 'Colonia'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
        object cxLabel11: TcxLabel
          Left = 232
          Top = 154
          Hint = ''
          Caption = 'Estado'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
        object cxLabel12: TcxLabel
          Left = 574
          Top = 106
          Hint = ''
          Caption = 'Codigo Postal'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
        object cxLabel13: TcxLabel
          Left = 143
          Top = 81
          Hint = ''
          Caption = 'Nombre'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
        object cxDBTextEdit3: TcxDBTextEdit
          Left = 186
          Top = 80
          Hint = ''
          DataBinding.DataField = 'Nombre'
          DataBinding.DataSource = dsCliente
          Enabled = False
          ParentFont = False
          Properties.CharCase = ecUpperCase
          Properties.ReadOnly = True
          Style.BorderStyle = ebsUltraFlat
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = []
          Style.TextStyle = [fsBold]
          Style.IsFontAssigned = True
          TabOrder = 12
          Width = 385
        end
        object cxDBTextEdit4: TcxDBTextEdit
          Left = 604
          Top = 80
          Hint = ''
          DataBinding.DataField = 'RFC'
          DataBinding.DataSource = dsCliente
          Enabled = False
          Properties.CharCase = ecUpperCase
          Properties.ReadOnly = True
          Style.BorderStyle = ebsUltraFlat
          Style.TextStyle = [fsBold]
          TabOrder = 13
          Width = 169
        end
        object cxDBTextEdit5: TcxDBTextEdit
          Left = 61
          Top = 105
          Hint = ''
          DataBinding.DataField = 'DIRECCION'
          DataBinding.DataSource = dsCliente
          Enabled = False
          Properties.CharCase = ecUpperCase
          Properties.ReadOnly = True
          Style.BorderStyle = ebsUltraFlat
          Style.TextStyle = [fsBold]
          TabOrder = 14
          Width = 399
        end
        object cxDBTextEdit6: TcxDBTextEdit
          Left = 283
          Top = 130
          Hint = ''
          DataBinding.DataField = 'COLONIA'
          DataBinding.DataSource = dsCliente
          Enabled = False
          Properties.CharCase = ecUpperCase
          Properties.ReadOnly = True
          Style.BorderStyle = ebsUltraFlat
          Style.TextStyle = [fsBold]
          TabOrder = 15
          Width = 177
        end
        object cxDBTextEdit8: TcxDBTextEdit
          Left = 644
          Top = 105
          Hint = ''
          DataBinding.DataField = 'CODIGOPOSTAL'
          DataBinding.DataSource = dsCliente
          Enabled = False
          Properties.CharCase = ecUpperCase
          Properties.ReadOnly = True
          Style.BorderStyle = ebsUltraFlat
          Style.TextStyle = [fsBold]
          TabOrder = 16
          Width = 129
        end
        object cxDBDateEdit1: TcxDBDateEdit
          Left = 617
          Top = 8
          Hint = ''
          TabStop = False
          DataBinding.DataField = 'Fecha'
          DataBinding.DataSource = dsFactura
          Enabled = False
          Style.BorderStyle = ebsUltraFlat
          TabOrder = 17
          Width = 156
        end
        object cxLabel14: TcxLabel
          Left = 580
          Top = 32
          Hint = ''
          Caption = 'Serie'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
        object dbTxtSerie: TcxDBTextEdit
          Left = 617
          Top = 31
          Hint = ''
          DataBinding.DataField = 'Serie'
          DataBinding.DataSource = dsFactura
          Enabled = False
          Properties.CharCase = ecUpperCase
          Properties.ReadOnly = True
          Style.BorderStyle = ebsUltraFlat
          Style.TextStyle = [fsBold]
          TabOrder = 0
          OnExit = dbTxtSerieExit
          Width = 47
        end
        object dbTxtFolio: TcxDBTextEdit
          Left = 693
          Top = 31
          Hint = ''
          DataBinding.DataField = 'Folio'
          DataBinding.DataSource = dsFactura
          Enabled = False
          Properties.CharCase = ecUpperCase
          Properties.ReadOnly = True
          Style.BorderStyle = ebsUltraFlat
          Style.TextStyle = [fsBold]
          TabOrder = 1
          OnEnter = dbTxtFolioEnter
          Width = 80
        end
        object dbTxtCliente: TcxDBTextEdit
          Left = 61
          Top = 80
          Hint = ''
          DataBinding.DataField = 'ClienteID'
          DataBinding.DataSource = dsFactura
          Properties.CharCase = ecUpperCase
          Style.BorderStyle = ebsUltraFlat
          TabOrder = 2
          OnEnter = dbTxtClienteEnter
          OnExit = cxDBTxtClienteExit
          OnKeyDown = dbTxtClienteKeyDown
          Width = 56
        end
        object cxButton1: TcxButton
          Left = 117
          Top = 78
          Width = 25
          Height = 25
          OptionsImage.Glyph.Data = {
            36050000424D3605000000000000360400002800000010000000100000000100
            08000000000000010000120B0000120B0000000100000000000000000000FFFF
            FF0089819900FF00FF001F1E1F0062555D00745D65008C6D73005D484A007D52
            5400865151008E5757008652520087535300B6757500B4767600B8797900B275
            7500B074740087595900CA8B8B00CE8F8F00CF909000CC8E8E00EFAAA900E2A1
            A100E1A1A100E6A6A600845250009A6B6A00DD908C00E9A4A100814844009E5C
            5600895753005D3D3600FF5D3500F39681005A3C35005D3E3600D7C2BC008936
            1C00F0C5B800CB532A0086391F00572D1F00D0A09000C0582D00DDCFC9007242
            2700DCCFC700BD4C0000BC4B0000B84A0000B64A0000A3420100883A0300A746
            05006C300400FFF8F200B4916D00FECB9600E1B58600C59F7600A18363007F68
            4F00846C530093A5A500EEEFEF001C41450007BCED000C98BD00068FC1002180
            A300F0F6F8002D84A7000D222B000196DE00036292000D466300165E82001F23
            2500C9E0EB00008EDE0006365100157BB6005896B800145C8C00D8E6EF00004B
            820084C1ED00319FFC0035A3FF0084BCEA00B0D7F6000263BF001F87E9007E91
            A700161A1F003E4145001031D3000320BA000318B200000F95002F45ED000C19
            B400010B9900010A95002732D000000081000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000000000000000000003030304514C
            03030303030303030303030303034F4E54620303030303030303333434364550
            06092D3A3837353434033301013B43051E100B2342403E3D340333012F292C08
            1F16110D26413F3D340333012B2401251C19150F0C273C3D340333012A025561
            2E131A17120A313D340333015D5560555E32221B140E206334033301575B5C55
            5A01391D1807494747033301595B5B5952013430214B4653676D330158595956
            4A01340128484D65666A33010101010101013401013B5F68646B330101010101
            010134010101446C690334333333333333333333333333333303033434343434
            3434343434343434030303030303030303030303030303030303}
          TabOrder = 19
          OnClick = cxButton1Click
        end
        object cxLabel16: TcxLabel
          Left = 462
          Top = 106
          Hint = ''
          Caption = 'No. Ext.'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
        object cxDBTextEdit1: TcxDBTextEdit
          Left = 517
          Top = 105
          Hint = ''
          DataBinding.DataField = 'NOEXTERIOR'
          DataBinding.DataSource = dsCliente
          Enabled = False
          Properties.CharCase = ecUpperCase
          Properties.ReadOnly = True
          Style.BorderStyle = ebsUltraFlat
          Style.TextStyle = [fsBold]
          TabOrder = 21
          Width = 54
        end
        object cxLabel20: TcxLabel
          Left = 10
          Top = 154
          Hint = ''
          Caption = 'Localidad'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
        object cxDBTextEdit2: TcxDBTextEdit
          Left = 61
          Top = 154
          Hint = ''
          DataBinding.DataField = 'LOCALIDAD'
          DataBinding.DataSource = dsCliente
          Enabled = False
          Properties.CharCase = ecUpperCase
          Properties.ReadOnly = True
          Style.BorderStyle = ebsUltraFlat
          Style.TextStyle = [fsBold]
          TabOrder = 23
          Width = 161
        end
        object cxLabel21: TcxLabel
          Left = 462
          Top = 131
          Hint = ''
          Caption = 'Municipio'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
        object cxDBTextEdit9: TcxDBTextEdit
          Left = 517
          Top = 130
          Hint = ''
          DataBinding.DataField = 'MUNICIPIO'
          DataBinding.DataSource = dsCliente
          Enabled = False
          Properties.CharCase = ecUpperCase
          Properties.ReadOnly = True
          Style.BorderStyle = ebsUltraFlat
          Style.TextStyle = [fsBold]
          TabOrder = 25
          Width = 256
        end
        object cxDBTextEdit7: TcxDBTextEdit
          Left = 61
          Top = 130
          Hint = ''
          DataBinding.DataField = 'CALLE'
          DataBinding.DataSource = dsCliente
          Enabled = False
          Properties.CharCase = ecUpperCase
          Properties.ReadOnly = True
          Style.BorderStyle = ebsUltraFlat
          Style.TextStyle = [fsBold]
          TabOrder = 26
          Width = 161
        end
        object cxLabel24: TcxLabel
          Left = 10
          Top = 131
          Hint = ''
          Caption = 'Calle'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
        object cxDBTextEdit13: TcxDBTextEdit
          Left = 283
          Top = 153
          Hint = ''
          DataBinding.DataField = 'ESTADO'
          DataBinding.DataSource = dsCliente
          Enabled = False
          Properties.CharCase = ecUpperCase
          Properties.ReadOnly = True
          Style.BorderStyle = ebsUltraFlat
          Style.TextStyle = [fsBold]
          TabOrder = 28
          Width = 177
        end
        object dbCbxFormaPago: TcxDBLookupComboBox
          Left = 617
          Top = 54
          Hint = ''
          DataBinding.DataField = 'FormaPagoID'
          DataBinding.DataSource = dsFactura
          Properties.KeyFieldNames = 'FormaPagoID'
          Properties.ListColumns = <
            item
              FieldName = 'Descripcion'
            end>
          Properties.ListSource = dsFormaPago
          Style.BorderStyle = ebsUltraFlat
          TabOrder = 29
          Width = 156
        end
        object cxLabel15: TcxLabel
          Left = 521
          Top = 55
          Hint = ''
          Caption = 'Forma de Pago'
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
        object cxDBImage1: TcxDBImage
          Left = 13
          Top = 3
          Hint = ''
          DataBinding.DataField = 'LOGOESTACION'
          DataBinding.DataSource = dsEstacion
          Properties.GraphicClassName = 'TJPEGImage'
          Properties.Proportional = False
          Properties.Stretch = True
          TabOrder = 31
          Transparent = True
          Height = 73
          Width = 140
        end
        object cxLabel23: TcxLabel
          Left = 462
          Top = 154
          Hint = ''
          Caption = 'Tipo Pago'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
        object cxDBLookupComboBox1: TcxDBLookupComboBox
          Left = 517
          Top = 154
          Hint = ''
          DataBinding.DataField = 'TipoFacturaID'
          DataBinding.DataSource = dsFactura
          Properties.KeyFieldNames = 'TipoFacturaID'
          Properties.ListColumns = <
            item
              FieldName = 'Descripcion'
            end>
          Properties.ListSource = dsTipoFactura
          Style.BorderStyle = ebsUltraFlat
          TabOrder = 33
          Width = 256
        end
        object Memo1: TMemo
          Left = 155
          Top = 4
          Width = 367
          Height = 71
          BorderStyle = bsNone
          Color = clInactiveCaption
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 34
        end
      end
      object cxGroupBox5: TcxGroupBox
        Left = 0
        Top = 481
        Hint = ''
        Align = alBottom
        Enabled = False
        Style.BorderStyle = ebsUltraFlat
        TabOrder = 1
        Height = 72
        Width = 783
        object cxLabel17: TcxLabel
          Left = 597
          Top = 27
          Hint = ''
          Caption = 'IVA'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
        object cxLabel18: TcxLabel
          Left = 597
          Top = 49
          Hint = ''
          Caption = 'Total'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
        object cxDBTextEdit10: TcxDBTextEdit
          Left = 653
          Top = 47
          Hint = ''
          TabStop = False
          DataBinding.DataField = 'Total'
          DataBinding.DataSource = dsFactura
          Enabled = False
          Properties.Alignment.Horz = taRightJustify
          Properties.ReadOnly = True
          Properties.OnChange = cxDBTextEdit10PropertiesChange
          Style.BorderStyle = ebsUltraFlat
          Style.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 2
          Visible = False
          Width = 121
        end
        object cxDBTextEdit11: TcxDBTextEdit
          Left = 653
          Top = 25
          Hint = ''
          TabStop = False
          DataBinding.DataField = 'Impuesto'
          DataBinding.DataSource = dsFactura
          Enabled = False
          Properties.Alignment.Horz = taRightJustify
          Properties.ReadOnly = True
          Properties.OnChange = cxDBTextEdit11PropertiesChange
          Style.BorderStyle = ebsUltraFlat
          Style.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 3
          Visible = False
          Width = 121
        end
        object cxDBTextEdit12: TcxDBTextEdit
          Left = 653
          Top = 3
          Hint = ''
          TabStop = False
          DataBinding.DataField = 'Subtotal'
          DataBinding.DataSource = dsFactura
          Enabled = False
          Properties.Alignment.Horz = taRightJustify
          Properties.ReadOnly = True
          Properties.OnChange = cxDBTextEdit12PropertiesChange
          Style.BorderStyle = ebsUltraFlat
          Style.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 4
          Visible = False
          Width = 121
        end
        object cxLabel19: TcxLabel
          Left = 597
          Top = 5
          Hint = ''
          Caption = 'Subtotal'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
        object cxCurrencyEdit1: TcxCurrencyEdit
          Left = 653
          Top = 3
          Hint = ''
          Enabled = False
          Properties.Alignment.Horz = taRightJustify
          Properties.EditFormat = '$,0.00;-$,0.00'
          Properties.ReadOnly = True
          Style.TextStyle = [fsBold]
          TabOrder = 6
          Width = 121
        end
        object cxCurrencyEdit2: TcxCurrencyEdit
          Left = 653
          Top = 25
          Hint = ''
          Enabled = False
          Properties.Alignment.Horz = taRightJustify
          Properties.EditFormat = '$,0.00;-$,0.00'
          Properties.ReadOnly = True
          Style.TextStyle = [fsBold]
          TabOrder = 7
          Width = 121
        end
        object cxCurrencyEdit3: TcxCurrencyEdit
          Left = 653
          Top = 47
          Hint = ''
          Enabled = False
          Properties.Alignment.Horz = taRightJustify
          Properties.EditFormat = '$,0.00;-$,0.00'
          Properties.ReadOnly = True
          Style.TextStyle = [fsBold]
          TabOrder = 8
          Width = 121
        end
        object mDescripcion: TMemo
          Left = 8
          Top = 15
          Width = 583
          Height = 53
          TabOrder = 9
        end
        object cxLabel29: TcxLabel
          Left = 8
          Top = 0
          Hint = ''
          Caption = 'Descripcion'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
      end
      object grbDetalles: TcxGroupBox
        Left = 0
        Top = 177
        Hint = ''
        Align = alClient
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 2
        Height = 304
        Width = 783
        object cxGrid1: TcxGrid
          Tag = 1
          Left = 3
          Top = 22
          Width = 777
          Height = 279
          Hint = ''
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnEnter = cxGrid1Enter
          OnExit = cxGrid1Exit
          LookAndFeel.Kind = lfStandard
          LookAndFeel.NativeStyle = False
          object cxGridDBTableView3: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            OnEditKeyDown = cxGridDBTableView3EditKeyDown
            DataController.DataSource = dsDetalleFactura
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            NewItemRow.Visible = True
            OptionsBehavior.FocusCellOnTab = True
            OptionsBehavior.FocusFirstCellOnNewRecord = True
            OptionsBehavior.GoToNextCellOnEnter = True
            OptionsBehavior.FocusCellOnCycle = True
            OptionsView.NoDataToDisplayInfoText = '<No Hay Informacion Para Desplegar>'
            OptionsView.GroupByBox = False
            object cxGridDBTableView3ProductoID: TcxGridDBColumn
              Tag = 1
              Caption = 'Producto'
              DataBinding.FieldName = 'ProductoID'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.OnValidate = cxGridDBTableView3ProductoIDPropertiesValidate
              Options.Editing = False
            end
            object cxGridDBTableView3Descripcion: TcxGridDBColumn
              DataBinding.FieldName = 'Descripcion'
              PropertiesClassName = 'TcxTextEditProperties'
              Options.Editing = False
              Options.Focusing = False
              Width = 321
            end
            object cxGridDBTableView3Cantidad: TcxGridDBColumn
              DataBinding.FieldName = 'Cantidad'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.OnValidate = cxGridDBTableView3CantidadPropertiesValidate
              Options.Editing = False
              Width = 89
            end
            object cxGridDBTableView3Precio: TcxGridDBColumn
              DataBinding.FieldName = 'Precio'
              Options.Editing = False
              Options.Focusing = False
              Width = 107
            end
            object cxGridDBTableView3Importe: TcxGridDBColumn
              DataBinding.FieldName = 'Importe'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.OnValidate = cxGridDBTableView3ImportePropertiesValidate
              Options.Editing = False
              Width = 189
            end
          end
          object cxGridLevel3: TcxGridLevel
            GridView = cxGridDBTableView3
          end
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 812
    Height = 30
    Align = alTop
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Caption = ' Modulo de Facturacion'
    Color = clBtnShadow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 2
  end
  object Panel2: TPanel
    Left = 0
    Top = 30
    Width = 812
    Height = 2
    Align = alTop
    BevelOuter = bvNone
    Caption = ' Asignar Pagos a un Grupo'
    Color = clNone
    ParentBackground = False
    TabOrder = 3
  end
  object Panel3: TPanel
    Left = 0
    Top = 32
    Width = 9
    Height = 586
    Align = alLeft
    BevelOuter = bvNone
    Caption = '_____________'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    StyleElements = [seFont, seClient]
  end
  object Panel4: TPanel
    Left = 801
    Top = 32
    Width = 11
    Height = 586
    Align = alRight
    BevelOuter = bvNone
    Caption = '___________'
    TabOrder = 5
  end
  object dsCliente: TDADataSource
    DataSet = cdsCliente.Dataset
    DataTable = cdsCliente
    Left = 608
    Top = 328
  end
  object dsProducto: TDADataSource
    DataSet = cdsProducto.Dataset
    DataTable = cdsProducto
    Left = 544
    Top = 328
  end
  object cdsProducto: TDACDSDataTable
    Fields = <
      item
        Name = 'IDPRODUCTO'
        DataType = datInteger
      end
      item
        Name = 'CODIGOPRODUCTO'
        DataType = datString
        Size = 10
      end
      item
        Name = 'NOMBRE'
        DataType = datString
        Size = 150
      end
      item
        Name = 'PRECIOVENTA'
        DataType = datFloat
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
      end
      item
        Name = 'INVENTARIABLE'
        DataType = datBoolean
      end
      item
        Name = 'BARRAS'
        DataType = datString
        Size = 50
      end
      item
        Name = 'CCVENTA'
        DataType = datBlob
      end
      item
        Name = 'UNIDADMEDIDA'
        DataType = datString
        Size = 100
      end>
    LogChanges = False
    LogicalName = 'spProducto'
    Params = <>
    RemoteDataAdapter = DM.RemoteDataAdapter
    RemoteUpdatesOptions = []
    StreamingOptions = [soDisableEventsWhileStreaming]
    IndexDefs = <>
    Left = 544
    Top = 280
  end
  object dsDetalleFactura: TDADataSource
    DataSet = cdsDetalleFactura.Dataset
    DataTable = cdsDetalleFactura
    Left = 72
    Top = 408
  end
  object dsFactura: TDADataSource
    DataSet = cdsFactura.Dataset
    DataTable = cdsFactura
    Left = 32
    Top = 409
  end
  object cdsFormaPago: TDACDSDataTable
    Fields = <
      item
        Name = 'FormaPagoID'
        DataType = datInteger
        Required = True
      end
      item
        Name = 'Descripcion'
        DataType = datString
        Size = 50
        Required = True
      end
      item
        Name = 'Codigo'
        DataType = datString
        Size = 5
      end>
    LogicalName = 'dbo FormaPago'
    Params = <>
    RemoteDataAdapter = DM.RemoteDataAdapter
    RemoteUpdatesOptions = []
    StreamingOptions = [soDisableEventsWhileStreaming]
    IndexDefs = <>
    Left = 472
    Top = 280
  end
  object dsFormaPago: TDADataSource
    DataSet = cdsFormaPago.Dataset
    DataTable = cdsFormaPago
    Left = 472
    Top = 328
  end
  object cdsDetalleFactura: TDACDSDataTable
    DetailFields = 'FacturaID'
    Fields = <
      item
        Name = 'DetalleFacturaID'
        DataType = datInteger
      end
      item
        Name = 'Cantidad'
        DataType = datFloat
      end
      item
        Name = 'Precio'
        DataType = datFloat
      end
      item
        Name = 'Importe'
        DataType = datFloat
      end
      item
        Name = 'ItemNo'
        DataType = datInteger
      end
      item
        Name = 'FacturaID'
        DataType = datInteger
      end
      item
        Name = 'ProductoID'
        DataType = datInteger
      end
      item
        Name = 'Descripcion'
        DataType = datString
        Size = 30
        LogChanges = False
        DisplayLabel = 'Descripci'#243'n'
        Lookup = True
        LookupSource = dsProducto
        LookupKeyFields = 'IDPRODUCTO'
        LookupResultField = 'Nombre'
        KeyFields = 'ProductoID'
        LookupCache = True
      end>
    LogicalName = 'DetalleFactura'
    MasterFields = 'FacturaID'
    MasterParamsMappings.Strings = (
      'FacturaID=FacturaID')
    MasterSource = dsFactura
    Params = <
      item
        Name = 'FacturaID'
        Value = '1'
        ParamType = daptInput
      end>
    RemoteDataAdapter = DM.RemoteDataAdapter
    RemoteUpdatesOptions = []
    StreamingOptions = [soDisableEventsWhileStreaming]
    AfterDelete = cdsDetalleFacturaAfterDelete
    AfterPost = cdsDetalleFacturaAfterPost
    BeforePost = cdsDetalleFacturaBeforePost
    OnNewRecord = cdsDetalleFacturaNewRecord
    IndexDefs = <>
    Left = 72
    Top = 360
  end
  object cdsFactura: TDACDSDataTable
    Fields = <
      item
        Name = 'FacturaID'
        DataType = datInteger
      end
      item
        Name = 'Folio'
        DataType = datInteger
      end
      item
        Name = 'Serie'
        DataType = datString
        Size = 5
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
        Name = 'Fecha'
        DataType = datDateTime
      end
      item
        Name = 'Subtotal'
        DataType = datFloat
      end
      item
        Name = 'Impuesto'
        DataType = datFloat
      end
      item
        Name = 'Total'
        DataType = datFloat
      end
      item
        Name = 'ImpuestoPorcentaje'
        DataType = datFloat
      end
      item
        Name = 'Cancelada'
        DataType = datBoolean
      end
      item
        Name = 'ClienteID'
        DataType = datInteger
      end
      item
        Name = 'FormaPagoID'
        DataType = datInteger
      end
      item
        Name = 'UsuarioID'
        DataType = datInteger
      end
      item
        Name = 'TipoFacturaID'
        DataType = datInteger
      end
      item
        Name = 'Turno'
        DataType = datInteger
      end
      item
        Name = 'EstacionID'
        DataType = datInteger
      end
      item
        Name = 'IDINGRESO'
        DataType = datInteger
      end
      item
        Name = 'Tickets'
        DataType = datString
        Size = 350
      end
      item
        Name = 'CADENAORIGINAL'
        DataType = datMemo
      end
      item
        Name = 'SELLODIGITAL'
        DataType = datMemo
      end
      item
        Name = 'XML'
        DataType = datMemo
      end
      item
        Name = 'NoCertificado'
        DataType = datString
        Size = 30
      end
      item
        Name = 'FechaCancelada'
        DataType = datDateTime
      end
      item
        Name = 'FechaFacturaE'
        DataType = datDateTime
      end
      item
        Name = 'NoAprobacion'
        DataType = datInteger
      end
      item
        Name = 'EjercicioAprobacion'
        DataType = datInteger
      end
      item
        Name = 'VersionSAT'
        DataType = datString
        Size = 10
      end
      item
        Name = 'UUID'
        DataType = datString
        Size = 50
      end
      item
        Name = 'FechaTimbrado'
        DataType = datDateTime
      end
      item
        Name = 'NoCertificadoSAT'
        DataType = datString
        Size = 30
      end
      item
        Name = 'SELLOSAT'
        DataType = datMemo
      end
      item
        Name = 'ACUSE'
        DataType = datMemo
      end>
    LogicalName = 'dbo Factura'
    Params = <>
    RemoteDataAdapter = DM.RemoteDataAdapter
    RemoteUpdatesOptions = []
    StreamingOptions = [soDisableEventsWhileStreaming]
    AfterPost = cdsFacturaAfterPost
    BeforePost = cdsFacturaBeforePost
    OnNewRecord = cdsFacturaNewRecord
    IndexDefs = <>
    Left = 32
    Top = 360
  end
  object cdsComparaFechas: TDACDSDataTable
    Fields = <
      item
        Name = 'Diferencia'
        DataType = datInteger
      end>
    LogicalName = 'ComparaFechas'
    Params = <
      item
        Name = 'FechaServidor'
        Value = '01/02/2010'
        ParamType = daptInput
      end
      item
        Name = 'FechaFactura'
        Value = '01/01/2010'
        ParamType = daptInput
      end>
    RemoteDataAdapter = DM.RemoteDataAdapter
    RemoteUpdatesOptions = []
    StreamingOptions = [soDisableEventsWhileStreaming]
    IndexDefs = <>
    Left = 400
    Top = 376
  end
  object dsComparaFechas: TDADataSource
    DataSet = cdsComparaFechas.Dataset
    DataTable = cdsComparaFechas
    Left = 400
    Top = 424
  end
  object cdsTipoFactura: TDACDSDataTable
    Fields = <
      item
        Name = 'TipoFacturaID'
        DataType = datInteger
      end
      item
        Name = 'Descripcion'
        DataType = datString
        Size = 50
      end>
    LogicalName = 'dbo.TipoFactura'
    Params = <>
    RemoteDataAdapter = DM.RemoteDataAdapter
    RemoteUpdatesOptions = []
    StreamingOptions = [soDisableEventsWhileStreaming]
    IndexDefs = <>
    Left = 672
    Top = 280
  end
  object dsTipoFactura: TDADataSource
    DataSet = cdsTipoFactura.Dataset
    DataTable = cdsTipoFactura
    Left = 672
    Top = 328
  end
  object cdsEstacion: TDACDSDataTable
    Fields = <
      item
        Name = 'IDESTACION'
        DataType = datInteger
      end
      item
        Name = 'NOMBRE'
        DataType = datString
        Size = 100
      end
      item
        Name = 'RAZONSOCIAL'
        DataType = datString
        Size = 100
      end
      item
        Name = 'RFC'
        DataType = datString
        Size = 30
      end
      item
        Name = 'HOST'
        DataType = datString
        Size = 30
      end
      item
        Name = 'CUENTACONTABLE'
        DataType = datString
        Size = 20
      end
      item
        Name = 'IMPUESTO'
        DataType = datFloat
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
        Name = 'NOEXTERIOR'
        DataType = datString
        Size = 10
      end
      item
        Name = 'NOINTERIOR'
        DataType = datString
        Size = 10
      end
      item
        Name = 'CODIGOPOSTAL'
        DataType = datString
        Size = 10
      end
      item
        Name = 'MUNICIPIO'
        DataType = datString
        Size = 30
      end
      item
        Name = 'LOCALIDAD'
        DataType = datString
        Size = 30
      end
      item
        Name = 'ESTADO'
        DataType = datString
        Size = 30
      end
      item
        Name = 'EXCALLE'
        DataType = datString
        Size = 60
      end
      item
        Name = 'EXCOLONIA'
        DataType = datString
        Size = 30
      end
      item
        Name = 'EXNOEXTERIOR'
        DataType = datString
        Size = 10
      end
      item
        Name = 'EXNOINTERIOR'
        DataType = datString
        Size = 10
      end
      item
        Name = 'EXCODIGOPOSTAL'
        DataType = datString
        Size = 10
      end
      item
        Name = 'EXMUNICIPIO'
        DataType = datString
        Size = 30
      end
      item
        Name = 'EXLOCALIDAD'
        DataType = datString
        Size = 30
      end
      item
        Name = 'EXESTADO'
        DataType = datString
        Size = 30
      end
      item
        Name = 'NOAPROBACION'
        DataType = datInteger
      end
      item
        Name = 'FECHAAPROBACION'
        DataType = datInteger
      end
      item
        Name = 'NOAPROBACIONES'
        DataType = datString
        Size = 150
      end
      item
        Name = 'VERSIONCFD'
        DataType = datInteger
      end
      item
        Name = 'REGIMENFISCAL'
        DataType = datString
        Size = 150
      end
      item
        Name = 'CODIGOFACTURA'
        DataType = datString
        Size = 2
      end
      item
        Name = 'FORMATOFACTURAWEB'
        DataType = datString
        Size = 100
      end
      item
        Name = 'SERIEENLINEA'
        DataType = datString
        Size = 5
      end
      item
        Name = 'TELEFONO'
        DataType = datString
        Size = 20
      end
      item
        Name = 'IDESTACIONBANCARIA'
        DataType = datInteger
      end
      item
        Name = 'SERIEBANCARIA'
        DataType = datString
        Size = 5
      end
      item
        Name = 'LOGOESTACION'
        DataType = datBlob
      end
      item
        Name = 'PAIS'
        DataType = datString
        Size = 100
      end
      item
        Name = 'EXPAIS'
        DataType = datString
        Size = 100
      end
      item
        Name = 'EXREFERENCIA'
        DataType = datString
        Size = 100
      end>
    LogChanges = False
    LogicalName = 'ObtenerDatosEstacion'
    Params = <
      item
        Name = 'EstacionID'
        DataType = datInteger
        Value = '1'
        ParamType = daptInput
      end>
    RemoteDataAdapter = DM.RemoteDataAdapter
    RemoteUpdatesOptions = []
    StreamingOptions = [soDisableEventsWhileStreaming]
    IndexDefs = <>
    Left = 400
    Top = 280
  end
  object dsEstacion: TDADataSource
    DataSet = cdsEstacion.Dataset
    DataTable = cdsEstacion
    Left = 400
    Top = 328
  end
  object cdsCliente: TDACDSDataTable
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
        Size = 15
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
      end
      item
        Name = 'REFERENCIA'
        DataType = datString
        Size = 100
      end
      item
        Name = 'AUTORIZACHEQUE'
        DataType = datBoolean
      end>
    LogicalName = 'spObtenerDatosCliente'
    Params = <
      item
        Name = 'ClienteID'
        DataType = datInteger
        Value = '1'
        ParamType = daptInput
      end>
    RemoteDataAdapter = DM.RemoteDataAdapter
    RemoteUpdatesOptions = []
    StreamingOptions = [soDisableEventsWhileStreaming, soDisableFiltering]
    IndexDefs = <>
    Left = 607
    Top = 280
  end
end
