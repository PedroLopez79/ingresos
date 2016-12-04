inherited frmIngresosXfecha: TfrmIngresosXfecha
  Left = 146
  Top = 0
  Caption = 'frmIngresosXfecha'
  ClientHeight = 536
  ClientWidth = 1107
  Position = poDesigned
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  ExplicitWidth = 1107
  ExplicitHeight = 536
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox1: TcxGroupBox
    Left = 0
    Top = 30
    Hint = ''
    Align = alTop
    TabOrder = 0
    Height = 152
    Width = 1107
    object lblCerrada: TLabel
      Left = 27
      Top = 5
      Width = 185
      Height = 16
      Caption = 'LIQUIDACION CERRADA!!!'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
      Transparent = True
      Visible = False
    end
    object cxLabel1: TcxLabel
      Left = 645
      Top = 52
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
      Top = 121
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
      Top = 40
      Hint = ''
      DataBinding.DataField = 'FECHA'
      DataBinding.DataSource = dsIngresos
      Enabled = False
      Properties.ReadOnly = False
      TabOrder = 2
      Width = 145
    end
    object cxLabel9: TcxLabel
      Left = 27
      Top = 95
      Hint = ''
      Caption = 'Encargado'
      ParentFont = False
      Style.BorderStyle = ebsNone
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.Kind = lfUltraFlat
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.Kind = lfUltraFlat
      StyleFocused.LookAndFeel.Kind = lfUltraFlat
      StyleHot.LookAndFeel.Kind = lfUltraFlat
      Transparent = True
    end
    object cbEncargado: TcxDBLookupComboBox
      Left = 96
      Top = 94
      Hint = ''
      DataBinding.DataField = 'IDEMPLEADO'
      DataBinding.DataSource = dsEncargadoIngreso
      Properties.KeyFieldNames = 'IDEMPLEADO'
      Properties.ListColumns = <
        item
          FieldName = 'NOMBRE'
        end>
      Properties.ListSource = dsEmpleado
      StyleFocused.BorderColor = clWindowFrame
      TabOrder = 4
      Width = 215
    end
    object cxLabel14: TcxLabel
      Left = 24
      Top = 41
      Hint = ''
      Caption = 'Fecha'
      ParentFont = False
      Style.BorderStyle = ebsNone
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.NativeStyle = False
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      Transparent = True
    end
    object cbTurno: TcxDBLookupComboBox
      Left = 645
      Top = 25
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
      Left = 645
      Top = 2
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
      Top = 2
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
      Height = 139
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
        Top = 54
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
        Top = 83
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
        Top = 111
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
        Top = 54
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
        Top = 83
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
        Top = 111
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
      Top = 122
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
      Top = 100
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
      Top = 70
      Hint = ''
      EditValue = 0d
      Properties.Use24HourFormat = False
      TabOrder = 11
      Width = 121
    end
    object tFin: TcxTimeEdit
      Left = 645
      Top = 120
      Hint = ''
      EditValue = 0d
      Properties.Use24HourFormat = False
      TabOrder = 12
      Width = 121
    end
    object cxLabel24: TcxLabel
      Left = 24
      Top = 68
      Hint = ''
      Caption = 'Departamento'
      ParentFont = False
      Style.BorderStyle = ebsNone
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.Kind = lfUltraFlat
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.Kind = lfUltraFlat
      StyleFocused.LookAndFeel.Kind = lfUltraFlat
      StyleHot.LookAndFeel.Kind = lfUltraFlat
      Transparent = True
    end
    object cbDepartamento: TcxLookupComboBox
      Left = 114
      Top = 67
      Hint = ''
      Properties.KeyFieldNames = 'IDAGRUPACION'
      Properties.ListColumns = <
        item
          FieldName = 'NOMBRE'
        end>
      Properties.ListSource = dsAgrupacion
      Properties.OnChange = cbDepartamentoPropertiesChange
      Style.BorderStyle = ebsUltraFlat
      TabOrder = 14
      Width = 197
    end
  end
  object cxGroupBox3: TcxGroupBox
    Left = 0
    Top = 182
    Hint = ''
    Align = alClient
    Style.Edges = [bLeft, bTop, bRight, bBottom]
    Style.Shadow = False
    StyleDisabled.BorderStyle = ebsUltraFlat
    TabOrder = 1
    Height = 354
    Width = 1107
    object pgcConceptos: TcxPageControl
      Left = 3
      Top = 22
      Width = 1101
      Height = 329
      Hint = ''
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Properties.ActivePage = cxTabSheet6
      Properties.CustomButtons.Buttons = <>
      Properties.Images = dmImages.Imagenes2
      OnChange = pgcConceptosChange
      OnPageChanging = pgcConceptosPageChanging
      ClientRectBottom = 323
      ClientRectLeft = 3
      ClientRectRight = 1095
      ClientRectTop = 27
      object cxTabSheet6: TcxTabSheet
        Caption = 'Totales'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ImageIndex = 67
        ParentFont = False
        object CShape1: TShape
          Left = 36
          Top = 103
          Width = 382
          Height = 94
          Brush.Color = clLime
          Brush.Style = bsDiagCross
          Pen.Color = clGreen
          Pen.Width = 2
        end
        object AGBTotalesConceptos: TGroupBox
          Left = 21
          Top = 17
          Width = 407
          Height = 277
          Caption = 'Totales Conceptos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object Bevel1: TBevel
            Left = 18
            Top = 236
            Width = 386
            Height = 7
            Shape = bsBottomLine
          end
          object Bevel3: TBevel
            Left = 18
            Top = 19
            Width = 386
            Height = 7
            Shape = bsBottomLine
          end
          object cxLabel12: TcxLabel
            Left = 18
            Top = 32
            Hint = ''
            Caption = 'Efectivo.......................:'
            ParentColor = False
            ParentFont = False
            Style.BorderStyle = ebsUltraFlat
            Style.Color = clBtnFace
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -16
            Style.Font.Name = 'Arial'
            Style.Font.Style = [fsBold]
            Style.LookAndFeel.NativeStyle = False
            Style.IsFontAssigned = True
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
          end
          object cxLabel13: TcxLabel
            Left = 18
            Top = 90
            Hint = ''
            Caption = 'Clientes.......................:'
            ParentColor = False
            ParentFont = False
            Style.BorderStyle = ebsUltraFlat
            Style.Color = clBtnFace
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -16
            Style.Font.Name = 'Arial'
            Style.Font.Style = [fsBold]
            Style.IsFontAssigned = True
          end
          object cxLabel15: TcxLabel
            Left = 18
            Top = 61
            Hint = ''
            Caption = 'Cheques.....................:'
            ParentFont = False
            Style.BorderStyle = ebsUltraFlat
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -16
            Style.Font.Name = 'Arial'
            Style.Font.Style = [fsBold]
            Style.IsFontAssigned = True
          end
          object cxLabel16: TcxLabel
            Left = 18
            Top = 119
            Hint = ''
            Caption = 'Tarjetas y Cupones.:'
            ParentFont = False
            Style.BorderStyle = ebsUltraFlat
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -16
            Style.Font.Name = 'Arial'
            Style.Font.Style = [fsBold]
            Style.IsFontAssigned = True
          end
          object cxLabel17: TcxLabel
            Left = 18
            Top = 184
            Hint = ''
            Caption = 'Otros...........................:'
            ParentFont = False
            Style.BorderStyle = ebsUltraFlat
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -16
            Style.Font.Name = 'Arial'
            Style.Font.Style = [fsBold]
            Style.IsFontAssigned = True
          end
          object cxLabel18: TcxLabel
            Left = 18
            Top = 213
            Hint = ''
            Caption = 'Faltantes....................:'
            ParentFont = False
            Style.BorderStyle = ebsUltraFlat
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -16
            Style.Font.Name = 'Arial'
            Style.Font.Style = [fsBold]
            Style.IsFontAssigned = True
          end
          object LEfectivo: TcxLabel
            Left = 200
            Top = 32
            Hint = ''
            Caption = '0'
            ParentFont = False
            Style.BorderStyle = ebsUltraFlat
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -16
            Style.Font.Name = 'Arial'
            Style.Font.Style = [fsBold]
            Style.TextColor = clBlue
            Style.IsFontAssigned = True
          end
          object LClientes: TcxLabel
            Left = 200
            Top = 90
            Hint = ''
            Caption = '0'
            Style.BorderStyle = ebsUltraFlat
            Style.TextColor = clBlue
          end
          object LCheques: TcxLabel
            Left = 200
            Top = 61
            Hint = ''
            Caption = '0'
            Style.BorderStyle = ebsUltraFlat
            Style.TextColor = clBlue
          end
          object LTarjetasyCupones: TcxLabel
            Left = 200
            Top = 119
            Hint = ''
            Caption = '0'
            Style.BorderStyle = ebsUltraFlat
            Style.TextColor = clBlue
          end
          object LOtros: TcxLabel
            Left = 200
            Top = 184
            Hint = ''
            Caption = '0'
            Style.BorderStyle = ebsUltraFlat
            Style.TextColor = clBlue
          end
          object LFaltantes: TcxLabel
            Left = 200
            Top = 213
            Hint = ''
            Caption = '0'
            Style.BorderStyle = ebsUltraFlat
            Style.TextColor = clBlue
          end
          object cxLabel19: TcxLabel
            Left = 18
            Top = 247
            Hint = ''
            Caption = 'Entregado.................:'
            ParentFont = False
            Style.BorderStyle = ebsUltraFlat
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -16
            Style.Font.Name = 'Arial'
            Style.Font.Style = [fsBold]
            Style.IsFontAssigned = True
          end
          object LEntregado: TcxLabel
            Left = 200
            Top = 247
            Hint = ''
            Caption = '0'
            ParentFont = False
            Style.BorderStyle = ebsUltraFlat
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -16
            Style.Font.Name = 'Arial'
            Style.Font.Style = [fsBold]
            Style.TextColor = clBlue
            Style.IsFontAssigned = True
          end
          object cxLabel25: TcxLabel
            Left = 200
            Top = 155
            Hint = ''
            Caption = 'Totales Credito, Debito y Cupones'
            ParentFont = False
            Style.BorderStyle = ebsUltraFlat
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'Arial'
            Style.Font.Style = [fsBold]
            Style.IsFontAssigned = True
          end
          object LTotCreditoDebitoCupones: TcxLabel
            Left = 67
            Top = 152
            Hint = ''
            Caption = '0'
            ParentFont = False
            Style.BorderStyle = ebsUltraFlat
            Style.Edges = [bLeft, bTop, bRight, bBottom]
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -16
            Style.Font.Name = 'Arial'
            Style.Font.Style = [fsBold]
            Style.LookAndFeel.NativeStyle = False
            Style.Shadow = True
            Style.TextColor = clGreen
            Style.IsFontAssigned = True
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleFocused.TextColor = clGreen
            StyleHot.LookAndFeel.NativeStyle = False
            Transparent = True
          end
        end
        object BGBVenta: TGroupBox
          Left = 448
          Top = 25
          Width = 407
          Height = 160
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          object Bevel2: TBevel
            Left = 18
            Top = 110
            Width = 375
            Height = 7
            Shape = bsBottomLine
          end
          object cxLabel20: TcxLabel
            Left = 18
            Top = 23
            Hint = ''
            Caption = 'Venta............................:'
            Style.BorderStyle = ebsUltraFlat
          end
          object cxLabel21: TcxLabel
            Left = 18
            Top = 52
            Hint = ''
            Caption = 'Otros Productos.......:'
            Style.BorderStyle = ebsUltraFlat
          end
          object cxLabel22: TcxLabel
            Left = 18
            Top = 81
            Hint = ''
            Caption = 'Sobrantes..................:'
            Style.BorderStyle = ebsUltraFlat
          end
          object LEVenta: TcxLabel
            Left = 200
            Top = 23
            Hint = ''
            Caption = '0'
            ParentFont = False
            Style.BorderStyle = ebsUltraFlat
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -16
            Style.Font.Name = 'Arial'
            Style.Font.Style = [fsBold]
            Style.TextColor = clBlue
            Style.IsFontAssigned = True
          end
          object LOtrosProductos: TcxLabel
            Left = 200
            Top = 52
            Hint = ''
            Caption = '0'
            Style.BorderStyle = ebsUltraFlat
            Style.TextColor = clBlue
          end
          object LSobrantes: TcxLabel
            Left = 200
            Top = 81
            Hint = ''
            Caption = '0'
            Style.BorderStyle = ebsUltraFlat
            Style.TextColor = clBlue
          end
          object cxLabel32: TcxLabel
            Left = 18
            Top = 123
            Hint = ''
            Caption = 'Venta...........................:'
            Style.BorderStyle = ebsUltraFlat
          end
          object LVentaTot: TcxLabel
            Left = 200
            Top = 123
            Hint = ''
            Caption = '0'
            Style.BorderStyle = ebsUltraFlat
            Style.TextColor = clBlue
          end
        end
        object FcxGroupBox5: TcxGroupBox
          Left = 448
          Top = 231
          Hint = ''
          Caption = 'Diferencia'
          Style.LookAndFeel.NativeStyle = False
          Style.Shadow = False
          Style.TextStyle = [fsBold]
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 2
          Height = 61
          Width = 240
          object LDiferencia: TcxLabel
            Left = 84
            Top = 19
            Hint = ''
            Caption = '0'
            ParentFont = False
            Style.BorderStyle = ebsUltraFlat
            Style.Edges = [bLeft, bTop, bRight, bBottom]
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -16
            Style.Font.Name = 'Arial'
            Style.Font.Style = [fsBold]
            Style.LookAndFeel.NativeStyle = False
            Style.Shadow = True
            Style.TextColor = clGreen
            Style.IsFontAssigned = True
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleFocused.TextColor = clGreen
            StyleHot.LookAndFeel.NativeStyle = False
            Transparent = True
          end
        end
      end
      object Conceptos: TcxTabSheet
        Caption = 'Ventas'
        ImageIndex = 61
        object dbgConceptos: TcxGrid
          Left = 0
          Top = 0
          Width = 1092
          Height = 296
          Hint = ''
          Align = alClient
          TabOrder = 0
          object dbgConceptosDBTableView1: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            DataController.DataSource = dsDetalleIngreso
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Format = '$#,#0.00'
                Kind = skSum
                Column = Importe
              end
              item
                Format = '#,#0.00'
                Kind = skSum
                Column = Cantidad
              end>
            DataController.Summary.SummaryGroups = <>
            OptionsSelection.CellSelect = False
            OptionsView.Footer = True
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
              Properties.ListSource = dsProductosCombustibles
              Properties.OnValidate = ProductoPropertiesValidate
              Width = 98
            end
            object Precio: TcxGridDBColumn
              Caption = 'Precio'
              DataBinding.FieldName = 'PRECIO'
              Width = 75
            end
            object Cantidad: TcxGridDBColumn
              Caption = 'Cantidad'
              DataBinding.FieldName = 'CANTIDAD'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.OnValidate = CantidadPropertiesValidate
              Width = 89
            end
            object Importe: TcxGridDBColumn
              Caption = 'Importe'
              DataBinding.FieldName = 'IMPORTE'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.OnValidate = ImportePropertiesValidate
              Width = 107
            end
            object NoTicket: TcxGridDBColumn
              Caption = 'No Ticket'
              DataBinding.FieldName = 'TICKET'
              Width = 145
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
          Width = 1092
          Height = 296
          Hint = ''
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object cxGridDBTableView2: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            OnFocusedRecordChanged = dbgConceptos1DBTableView1FocusedRecordChanged
            DataController.DataSource = dsDetalleIngreso
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Format = '#,#0.00'
                Kind = skSum
                FieldName = 'CANTIDAD'
                Column = CreditosCantidad
              end
              item
                Format = '$#,#0.00'
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
              Caption = 'Cantidad'
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
        object cxGrid1: TcxGrid
          Left = 0
          Top = 0
          Width = 1092
          Height = 296
          Hint = ''
          Align = alClient
          TabOrder = 0
          object cxGridDBTableView1: TcxGridDBTableView
            OnKeyDown = cxGridDBTableView1KeyDown
            Navigator.Buttons.CustomButtons = <>
            OnFocusedRecordChanged = dbgConceptos1DBTableView1FocusedRecordChanged
            DataController.DataSource = dsDetalleIngreso
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Format = '$#,#0.00'
                Kind = skSum
                Column = ProductoImporte
              end
              item
                Format = '#,#0.00'
                Kind = skSum
                Column = ProductoCantidad
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
            object ProductoDescripcion: TcxGridDBColumn
              Caption = 'Descripcion'
              DataBinding.FieldName = 'DESCRIPCION'
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
              Width = 82
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
              Width = 128
            end
            object ProductoReferencia: TcxGridDBColumn
              Caption = 'Referencia'
              DataBinding.FieldName = 'DESCRIPCION'
              Width = 151
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
        object dbgClientes: TcxGrid
          Left = 0
          Top = 0
          Width = 1092
          Height = 296
          Hint = ''
          Align = alClient
          TabOrder = 0
          object cxGridDBTableView3: TcxGridDBTableView
            OnKeyDown = cxGridDBTableView3KeyDown
            Navigator.Buttons.CustomButtons = <>
            OnFocusedRecordChanged = dbgConceptos1DBTableView1FocusedRecordChanged
            DataController.DataSource = dsDetalleIngreso
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Format = '$#,#0.00'
                Kind = skSum
                Column = ClienteImporte
              end
              item
                Format = '#,#0.00'
                Kind = skSum
                Column = CantidadProducto
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
            object IDCliente: TcxGridDBColumn
              Caption = '#Cliente'
              DataBinding.FieldName = 'IDCLIENTE'
              Width = 70
            end
            object ClienteNombre: TcxGridDBColumn
              Caption = 'Nombre'
              DataBinding.FieldName = 'CLIENTE'
              Width = 320
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
            object IDProducto: TcxGridDBColumn
              Caption = '#Producto'
              DataBinding.FieldName = 'IDPRODUCTO'
              Width = 68
            end
            object DescripcionProducto: TcxGridDBColumn
              Caption = 'Producto Descripcion'
              DataBinding.FieldName = 'IDPRODUCTO'
              PropertiesClassName = 'TcxLookupComboBoxProperties'
              Properties.KeyFieldNames = 'IDLINEA'
              Properties.ListColumns = <
                item
                  FieldName = 'NOMBRE'
                end>
              Properties.ListSource = dsProductosCombustibles
              Options.Editing = False
              Width = 210
            end
            object CantidadProducto: TcxGridDBColumn
              Caption = 'Cantidad'
              DataBinding.FieldName = 'CANTIDAD'
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
          Width = 1092
          Height = 296
          Hint = ''
          Align = alClient
          TabOrder = 0
          object cxGridDBTableView4: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            OnFocusedRecordChanged = dbgConceptos1DBTableView1FocusedRecordChanged
            DataController.DataSource = dsDetalleIngreso
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Format = '$#,#0.00'
                Kind = skSum
                Column = EfectivoImporte
              end
              item
                Format = '#,#0.00'
                Kind = skSum
                Column = EfectivoCantidad
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
            object EfectivoDescripcion: TcxGridDBColumn
              Caption = 'Descripcion'
              DataBinding.FieldName = 'IDTIPOCOMPROBACION'
              PropertiesClassName = 'TcxLookupComboBoxProperties'
              Properties.KeyFieldNames = 'IDTIPOCOMPROBACION'
              Properties.ListColumns = <
                item
                  FieldName = 'DESCRIPCION'
                end>
              Properties.ListSource = dsTipoValor
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
        object dbgSalidaEfectivos: TcxGrid
          Left = 0
          Top = 0
          Width = 1092
          Height = 296
          Hint = ''
          Align = alClient
          TabOrder = 0
          object cxGridDBTableView5: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            OnFocusedRecordChanged = dbgConceptos1DBTableView1FocusedRecordChanged
            DataController.DataSource = dsDetalleIngreso
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Format = '$#,#0.00'
                Kind = skSum
                Column = SalidaEfectivoImporte
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
      object cxTabSheet7: TcxTabSheet
        Caption = 'Cheques'
        ImageIndex = 65
        object dbgCheques: TcxGrid
          Left = 0
          Top = 0
          Width = 1092
          Height = 296
          Hint = ''
          Align = alClient
          TabOrder = 0
          LookAndFeel.NativeStyle = False
          object dbgChequesDBTableView1: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            DataController.DataSource = dsDetalleIngreso
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Format = '$#,#0.00'
                Kind = skSum
                Column = dbgChequesDBTableView1Importe
              end>
            DataController.Summary.SummaryGroups = <>
            NewItemRow.Visible = True
            OptionsBehavior.AlwaysShowEditor = True
            OptionsBehavior.FocusCellOnTab = True
            OptionsBehavior.FocusFirstCellOnNewRecord = True
            OptionsBehavior.GoToNextCellOnEnter = True
            OptionsBehavior.FocusCellOnCycle = True
            OptionsView.Footer = True
            OptionsView.GroupByBox = False
            OptionsView.Indicator = True
            object dbgChequesDBTableView1TipoValorID: TcxGridDBColumn
              Caption = 'Tipo'
              DataBinding.FieldName = 'IDTIPOCOMPROBACION'
              PropertiesClassName = 'TcxLookupComboBoxProperties'
              Properties.ImmediatePost = True
              Properties.KeyFieldNames = 'IDTIPOCOMPROBACION'
              Properties.ListColumns = <
                item
                  FieldName = 'DESCRIPCION'
                end>
              Properties.ListSource = dsTipoValor
              Width = 108
            end
            object dbgChequesDBTableView1ClienteID: TcxGridDBColumn
              Caption = 'Cliente'
              DataBinding.FieldName = 'IDCLIENTE'
              Width = 69
            end
            object dbgChequesDBTableView1Column1: TcxGridDBColumn
              Caption = 'Nombre del Cliente'
              DataBinding.FieldName = 'CLIENTE'
              PropertiesClassName = 'TcxLookupComboBoxProperties'
              Properties.KeyFieldNames = 'ClienteID'
              Properties.ListColumns = <
                item
                  FieldName = 'Nombre'
                end>
              Properties.ListSource = dsClientes
              Properties.ReadOnly = True
              Options.Focusing = False
              Width = 216
            end
            object dbgChequesDBTableView1BancoID: TcxGridDBColumn
              Caption = 'Banco'
              DataBinding.FieldName = 'IDBANCO'
              PropertiesClassName = 'TcxLookupComboBoxProperties'
              Properties.KeyFieldNames = 'IDBANCO'
              Properties.ListColumns = <
                item
                  FieldName = 'NOMBRE'
                end>
              Properties.ListSource = dsBanco
              Width = 136
            end
            object dbgChequesDBTableView1Referencia: TcxGridDBColumn
              Caption = 'Descripcion'
              DataBinding.FieldName = 'DESCRIPCION'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.CharCase = ecUpperCase
              Width = 204
            end
            object dbgChequesDBTableView1Importe: TcxGridDBColumn
              Caption = 'Importe'
              DataBinding.FieldName = 'IMPORTE'
              PropertiesClassName = 'TcxCurrencyEditProperties'
              Width = 98
            end
          end
          object cxGridLevel6: TcxGridLevel
            GridView = dbgChequesDBTableView1
          end
        end
      end
      object cxTabSheet8: TcxTabSheet
        Caption = 'Otros'
        ImageIndex = 68
        object dbgOtros: TcxGrid
          Left = 0
          Top = 0
          Width = 1092
          Height = 296
          Hint = ''
          Align = alClient
          TabOrder = 0
          LookAndFeel.NativeStyle = False
          object dbgOtrosDBTableView1: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            DataController.DataSource = dsDetalleIngreso
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Kind = skSum
              end
              item
                Format = '$#,#0.00'
                Kind = skSum
                Column = dbgOtrosDBTableView1Importe
              end>
            DataController.Summary.SummaryGroups = <>
            NewItemRow.Visible = True
            OptionsBehavior.AlwaysShowEditor = True
            OptionsBehavior.FocusCellOnTab = True
            OptionsBehavior.FocusFirstCellOnNewRecord = True
            OptionsBehavior.GoToNextCellOnEnter = True
            OptionsBehavior.FocusCellOnCycle = True
            OptionsView.Footer = True
            OptionsView.GroupByBox = False
            OptionsView.Indicator = True
            object dbgOtrosDBTableView1Ticket: TcxGridDBColumn
              DataBinding.FieldName = 'Ticket'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.ValidateOnEnter = True
              Width = 93
            end
            object dbgOtrosDBTableView1SalidaID: TcxGridDBColumn
              Caption = 'Salida'
              DataBinding.FieldName = 'IDSALIDA'
              PropertiesClassName = 'TcxLookupComboBoxProperties'
              Properties.KeyFieldNames = 'IDSALIDA'
              Properties.ListColumns = <
                item
                  FieldName = 'NOMBRE'
                end>
              Properties.ListSource = dsSalida
              Width = 154
            end
            object dbgOtrosDBTableView1Referencia: TcxGridDBColumn
              DataBinding.FieldName = 'DESCRIPCION'
              PropertiesClassName = 'TcxTextEditProperties'
              Properties.CharCase = ecUpperCase
              Width = 278
            end
            object dbgOtrosDBTableView1Importe: TcxGridDBColumn
              DataBinding.FieldName = 'Importe'
              Options.Focusing = False
              Width = 123
            end
          end
          object dbgOtrosLevel1: TcxGridLevel
            GridView = dbgOtrosDBTableView1
          end
        end
      end
      object cxTabSheet9: TcxTabSheet
        Caption = 'Diferencias'
        ImageIndex = 66
        object dbgDiferencias: TcxGrid
          Left = 0
          Top = 0
          Width = 1092
          Height = 296
          Hint = ''
          Align = alClient
          TabOrder = 0
          LookAndFeel.NativeStyle = False
          object dbgDiferenciasDBTableView1: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            DataController.DataSource = dsDetalleIngreso
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <
              item
                Format = '$#,#0.00'
                Kind = skSum
                Column = cxGridDBColumn3
              end>
            DataController.Summary.SummaryGroups = <>
            OptionsData.Deleting = False
            OptionsData.Editing = False
            OptionsData.Inserting = False
            OptionsView.Footer = True
            OptionsView.GroupByBox = False
            OptionsView.Indicator = True
            object cxGridDBColumn1: TcxGridDBColumn
              Caption = 'Tipo'
              DataBinding.FieldName = 'IDTIPOCOMPROBACION'
              PropertiesClassName = 'TcxLookupComboBoxProperties'
              Properties.KeyFieldNames = 'IDTIPOCOMPROBACION'
              Properties.ListColumns = <
                item
                  FieldName = 'DESCRIPCION'
                end>
              Properties.ListSource = dsTipoValor
              Width = 144
            end
            object dbgDiferenciasDBTableView1Column1: TcxGridDBColumn
              DataBinding.FieldName = 'DESCRIPCION'
              Width = 216
            end
            object cxGridDBColumn3: TcxGridDBColumn
              DataBinding.FieldName = 'IMPORTE'
              Width = 139
            end
          end
          object cxGridLevel7: TcxGridLevel
            GridView = dbgDiferenciasDBTableView1
          end
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1107
    Height = 30
    Align = alTop
    BevelOuter = bvNone
    Color = clInactiveCaption
    ParentBackground = False
    TabOrder = 2
    object cxButton1: TcxButton
      Left = 0
      Top = 2
      Width = 124
      Height = 27
      Caption = 'F2-Agregar Venta'
      OptionsImage.ImageIndex = 23
      OptionsImage.Images = dmImages.Imagenes2
      TabOrder = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = cxButton1Click
    end
    object cxButton2: TcxButton
      Left = 126
      Top = 2
      Width = 214
      Height = 27
      Caption = 'F3-(Creditos, Debitos o Cupones)'
      OptionsImage.ImageIndex = 58
      OptionsImage.Images = dmImages.Imagenes2
      TabOrder = 1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = cxButton2Click
    end
    object cxButton3: TcxButton
      Left = 342
      Top = 2
      Width = 134
      Height = 27
      Caption = 'F4-Otros Productos'
      OptionsImage.ImageIndex = 62
      OptionsImage.Images = dmImages.Imagenes2
      TabOrder = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = cxButton3Click
    end
    object cxButton4: TcxButton
      Left = 478
      Top = 2
      Width = 120
      Height = 27
      Caption = 'F5-Documentos'
      OptionsImage.ImageIndex = 39
      OptionsImage.Images = dmImages.Imagenes2
      TabOrder = 3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = cxButton4Click
    end
    object cxButton5: TcxButton
      Left = 600
      Top = 2
      Width = 92
      Height = 27
      Caption = 'F6-Efectivo'
      OptionsImage.ImageIndex = 64
      OptionsImage.Images = dmImages.Imagenes2
      TabOrder = 4
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = cxButton5Click
    end
    object cxButton6: TcxButton
      Left = 694
      Top = 2
      Width = 132
      Height = 27
      Caption = 'F7-Salida Efectivo'
      OptionsImage.ImageIndex = 60
      OptionsImage.Images = dmImages.Imagenes2
      TabOrder = 5
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = cxButton6Click
    end
    object cxButton7: TcxButton
      Left = 828
      Top = 2
      Width = 96
      Height = 27
      Caption = 'F8-Cheques'
      OptionsImage.ImageIndex = 50
      OptionsImage.Images = dmImages.Imagenes2
      TabOrder = 6
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = cxButton7Click
    end
    object cxButton8: TcxButton
      Left = 926
      Top = 2
      Width = 78
      Height = 27
      Caption = 'F9-Otros'
      OptionsImage.ImageIndex = 59
      OptionsImage.Images = dmImages.Imagenes2
      TabOrder = 7
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = cxButton8Click
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
    AfterScroll = cdsIngresosAfterScroll
    IndexDefs = <>
    Left = 904
    Top = 312
  end
  object dsIngresos: TDADataSource
    DataSet = cdsIngresos.Dataset
    OnStateChange = dsIngresosStateChange
    DataTable = cdsIngresos
    Left = 904
    Top = 344
  end
  object dsDetalleIngreso: TDADataSource
    DataSet = cdsDetalleIngreso.Dataset
    DataTable = cdsDetalleIngreso
    Left = 936
    Top = 344
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
        OnValidate = cdsDetalleIngresoIDCLIENTEValidate
      end
      item
        Name = 'IDCUPON'
        DataType = datInteger
      end
      item
        Name = 'IDBANCO'
        DataType = datInteger
      end
      item
        Name = 'IDAUXILIAR'
        DataType = datInteger
      end
      item
        Name = 'IDSALIDA'
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
    BeforeDelete = cdsDetalleIngresoBeforeDelete
    BeforeInsert = cdsDetalleIngresoBeforeInsert
    BeforePost = cdsDetalleIngresoBeforePost
    OnNewRecord = cdsDetalleIngresoNewRecord
    IndexDefs = <>
    Left = 936
    Top = 312
  end
  object dsEncargadoIngreso: TDADataSource
    DataSet = cdsEncargadoIngreso.Dataset
    OnStateChange = dsEncargadoIngresoStateChange
    DataTable = cdsEncargadoIngreso
    Left = 968
    Top = 344
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
      end
      item
        Name = 'GRUPO'
        DataType = datString
        Size = 50
      end
      item
        Name = 'GRUPOCIERRE'
        DataType = datString
        Size = 50
      end
      item
        Name = 'FACTOR'
        DataType = datFloat
      end
      item
        Name = 'OPERADOR'
        DataType = datInteger
      end>
    LogicalName = 'dbo TIPOCOMPROBACION'
    Params = <>
    RemoteDataAdapter = DM.RemoteDataAdapter
    RemoteUpdatesOptions = []
    StreamingOptions = [soDisableEventsWhileStreaming]
    IndexDefs = <>
    Left = 904
    Top = 232
  end
  object dsTipoValor: TDADataSource
    DataSet = cdsTipoComprobacion.Dataset
    DataTable = cdsTipoComprobacion
    Left = 904
    Top = 264
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
    Left = 904
    Top = 152
  end
  object dsProductosCombustibles: TDADataSource
    DataSet = cdsProductosCombustibles.Dataset
    DataTable = cdsProductosCombustibles
    Left = 904
    Top = 184
  end
  object cdsEncargadoIngreso: TDACDSDataTable
    Fields = <
      item
        Name = 'IDENCARGADOINGRESOS'
        DataType = datInteger
      end
      item
        Name = 'IDEMPLEADO'
        DataType = datInteger
      end
      item
        Name = 'IDINGRESO'
        DataType = datInteger
      end
      item
        Name = 'OBSERVACIONES'
        DataType = datString
        Size = 150
      end
      item
        Name = 'IMPORTE'
        DataType = datFloat
      end
      item
        Name = 'ENTREGADO'
        DataType = datFloat
      end
      item
        Name = 'DIFERENCIA'
        DataType = datFloat
      end
      item
        Name = 'IDAGRUPACION'
        DataType = datInteger
      end>
    LogicalName = 'dbo.ENCARGADOINGRESOS'
    Params = <
      item
        Name = 'IDINGRESO'
        DataType = datInteger
        ParamType = daptInput
      end>
    RemoteDataAdapter = DM.RemoteDataAdapter
    RemoteUpdatesOptions = []
    StreamingOptions = [soDisableEventsWhileStreaming]
    AfterScroll = cdsEncargadoIngresoAfterScroll
    IndexDefs = <>
    Left = 968
    Top = 312
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
    Left = 936
    Top = 392
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
    Left = 904
    Top = 392
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
    Left = 936
    Top = 232
  end
  object dsEmpleado: TDADataSource
    DataSet = cdsEmpleado.Dataset
    DataTable = cdsEmpleado
    Left = 936
    Top = 264
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
    Left = 968
    Top = 232
  end
  object dsTurno: TDADataSource
    DataSet = cdsTurno.Dataset
    DataTable = cdsTurno
    Left = 968
    Top = 264
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
    Left = 936
    Top = 424
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
    Left = 904
    Top = 424
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
    Left = 936
    Top = 152
  end
  object dsProductos: TDADataSource
    DataSet = cdsProductos.Dataset
    DataTable = cdsProductos
    Left = 936
    Top = 184
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
      end>
    LogicalName = 'dbo CLIENTE EFECTIVO'
    Params = <>
    RemoteDataAdapter = DM.RemoteDataAdapter
    RemoteUpdatesOptions = []
    StreamingOptions = [soDisableEventsWhileStreaming]
    IndexDefs = <>
    Left = 968
    Top = 152
  end
  object dsClientes: TDADataSource
    DataSet = cdsClientes.Dataset
    DataTable = cdsClientes
    Left = 968
    Top = 184
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
    Left = 1000
    Top = 152
  end
  object dsTipoCambio: TDADataSource
    DataSet = cdsTipoCambio.Dataset
    DataTable = cdsTipoCambio
    Left = 1000
    Top = 184
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
    Left = 968
    Top = 392
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
    Left = 1000
    Top = 392
  end
  object cdsAgrupacion: TDACDSDataTable
    Fields = <
      item
        Name = 'IDAGRUPACION'
        DataType = datInteger
      end
      item
        Name = 'NOMBRE'
        DataType = datString
        Size = 70
      end
      item
        Name = 'IDESTACION'
        DataType = datInteger
      end>
    LogicalName = 'AGRUPACION'
    Params = <
      item
        Name = 'IDESTACION'
        DataType = datInteger
        Value = ''
        ParamType = daptInput
      end>
    RemoteDataAdapter = DM.RemoteDataAdapter
    RemoteUpdatesOptions = []
    StreamingOptions = [soDisableEventsWhileStreaming]
    IndexDefs = <>
    Left = 904
    Top = 88
  end
  object cdsAgrupacionCajas: TDACDSDataTable
    Fields = <
      item
        Name = 'IDAGRUPACION'
        DataType = datInteger
      end
      item
        Name = 'IDCAJA'
        DataType = datInteger
      end>
    LogicalName = 'AGRUPACIONCAJAS'
    Params = <
      item
        Name = 'IDESTACION'
        Value = ''
        ParamType = daptInput
      end>
    RemoteDataAdapter = DM.RemoteDataAdapter
    RemoteUpdatesOptions = []
    StreamingOptions = [soDisableEventsWhileStreaming]
    IndexDefs = <>
    Left = 968
    Top = 88
  end
  object dsAgrupacionCajas: TDADataSource
    DataSet = cdsAgrupacionCajas.Dataset
    DataTable = cdsAgrupacionCajas
    Left = 1000
    Top = 88
  end
  object dsAgrupacion: TDADataSource
    DataSet = cdsAgrupacion.Dataset
    DataTable = cdsAgrupacion
    Left = 936
    Top = 88
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
    Left = 902
    Top = 457
  end
  object dsBanco: TDADataSource
    DataSet = cdsBanco.Dataset
    DataTable = cdsBanco
    Left = 966
    Top = 457
  end
  object cdsSalida: TDACDSDataTable
    Fields = <
      item
        Name = 'IDSALIDA'
        DataType = datInteger
        Required = True
      end
      item
        Name = 'NOMBRE'
        DataType = datString
        Size = 100
        Required = True
      end>
    LogicalName = 'dbo.SALIDA'
    Params = <>
    RemoteDataAdapter = DM.RemoteDataAdapter
    RemoteUpdatesOptions = []
    StreamingOptions = [soDisableEventsWhileStreaming]
    IndexDefs = <>
    Left = 798
    Top = 457
  end
  object dsSalida: TDADataSource
    DataSet = cdsSalida.Dataset
    DataTable = cdsSalida
    Left = 854
    Top = 457
  end
  object cdsHorario: TDACDSDataTable
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
    Left = 798
    Top = 121
  end
  object dsHorario: TDADataSource
    DataSet = cdsHorario.Dataset
    DataTable = cdsHorario
    Left = 798
    Top = 169
  end
end
