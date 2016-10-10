inherited frmClienteEfectivo: TfrmClienteEfectivo
  Caption = 'frmClienteEfectivo'
  ClientHeight = 478
  ClientWidth = 632
  ExplicitWidth = 632
  ExplicitHeight = 478
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcCatalogo: TcxPageControl
    Top = 32
    Width = 632
    Height = 446
    Properties.ActivePage = cxTabSheet2
    ExplicitTop = 32
    ExplicitWidth = 632
    ExplicitHeight = 446
    ClientRectBottom = 416
    ClientRectRight = 626
    inherited cxTabSheet1: TcxTabSheet
      ExplicitLeft = 3
      ExplicitTop = 3
      ExplicitWidth = 623
      ExplicitHeight = 413
      inherited dbgCatalogo: TcxGrid
        Width = 623
        Height = 413
        ExplicitWidth = 623
        ExplicitHeight = 413
        inherited dbgCatalogoDBTableView1: TcxGridDBTableView
          object dbgCatalogoDBTableView1IDCLIENTE: TcxGridDBColumn
            Caption = 'ID'
            DataBinding.FieldName = 'IDCLIENTE'
            Width = 51
          end
          object dbgCatalogoDBTableView1CODIGO: TcxGridDBColumn
            DataBinding.FieldName = 'CODIGO'
          end
          object dbgCatalogoDBTableView1NOMBRE: TcxGridDBColumn
            DataBinding.FieldName = 'NOMBRE'
            Width = 263
          end
          object dbgCatalogoDBTableView1RFC: TcxGridDBColumn
            DataBinding.FieldName = 'RFC'
          end
          object dbgCatalogoDBTableView1CODIGOPOSTAL: TcxGridDBColumn
            DataBinding.FieldName = 'CODIGOPOSTAL'
            Width = 108
          end
          object dbgCatalogoDBTableView1CURP: TcxGridDBColumn
            DataBinding.FieldName = 'CURP'
          end
          object dbgCatalogoDBTableView1GRUPO: TcxGridDBColumn
            DataBinding.FieldName = 'GRUPO'
          end
          object dbgCatalogoDBTableView1CALLE: TcxGridDBColumn
            DataBinding.FieldName = 'CALLE'
          end
          object dbgCatalogoDBTableView1COLONIA: TcxGridDBColumn
            DataBinding.FieldName = 'COLONIA'
          end
          object dbgCatalogoDBTableView1CIUDAD: TcxGridDBColumn
            DataBinding.FieldName = 'CIUDAD'
          end
          object dbgCatalogoDBTableView1TELEFONO: TcxGridDBColumn
            DataBinding.FieldName = 'TELEFONO'
          end
        end
      end
    end
    inherited cxTabSheet2: TcxTabSheet
      Color = clGradientActiveCaption
      ParentColor = False
      ExplicitLeft = 3
      ExplicitTop = 3
      ExplicitWidth = 623
      ExplicitHeight = 413
      object TxtNoProducto: TcxDBTextEdit
        Left = 80
        Top = 47
        Hint = ''
        TabStop = False
        DataBinding.DataField = 'IDCLIENTE'
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
        Width = 97
      end
      object LblNoProducto: TcxLabel
        Left = 16
        Top = 48
        Hint = ''
        Caption = 'Empresa'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object TxtNombre: TcxDBTextEdit
        Left = 80
        Top = 74
        Hint = ''
        DataBinding.DataField = 'NOMBRE'
        DataBinding.DataSource = dsCatalogo
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 2
        Width = 330
      end
      object LblNombre: TcxLabel
        Left = 16
        Top = 75
        Hint = ''
        Caption = 'Nombre'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object cxDBTextEdit1: TcxDBTextEdit
        Left = 80
        Top = 101
        Hint = ''
        DataBinding.DataField = 'GRUPO'
        DataBinding.DataSource = dsCatalogo
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 4
        Width = 330
      end
      object cxLabel1: TcxLabel
        Left = 16
        Top = 102
        Hint = ''
        Caption = 'Agrupacion'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object cxLabel2: TcxLabel
        Left = 16
        Top = 129
        Hint = ''
        Caption = 'RFC'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object cxDBTextEdit2: TcxDBTextEdit
        Left = 80
        Top = 128
        Hint = ''
        DataBinding.DataField = 'RFC'
        DataBinding.DataSource = dsCatalogo
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 7
        OnExit = cxDBTextEdit2Exit
        Width = 166
      end
      object cxLabel9: TcxLabel
        Left = 286
        Top = 292
        Hint = ''
        Caption = 'Telefono'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object cxDBTextEdit9: TcxDBTextEdit
        Left = 338
        Top = 291
        Hint = ''
        DataBinding.DataField = 'TELEFONO'
        DataBinding.DataSource = dsCatalogo
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 9
        Width = 258
      end
      object cxDBTextEdit10: TcxDBTextEdit
        Left = 80
        Top = 156
        Hint = ''
        DataBinding.DataField = 'CURP'
        DataBinding.DataSource = dsCatalogo
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 10
        Width = 166
      end
      object cxLabel10: TcxLabel
        Left = 16
        Top = 157
        Hint = ''
        Caption = 'Curp'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object cxDBTextEdit3: TcxDBTextEdit
        Left = 80
        Top = 210
        Hint = ''
        DataBinding.DataField = 'CALLE'
        DataBinding.DataSource = dsCatalogo
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 12
        Width = 166
      end
      object cxLabel3: TcxLabel
        Left = 16
        Top = 211
        Hint = ''
        Caption = 'Calle'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object cxDBTextEdit4: TcxDBTextEdit
        Left = 80
        Top = 237
        Hint = ''
        DataBinding.DataField = 'COLONIA'
        DataBinding.DataSource = dsCatalogo
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 14
        Width = 166
      end
      object cxLabel4: TcxLabel
        Left = 16
        Top = 238
        Hint = ''
        Caption = 'Colonia'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object cxLabel8: TcxLabel
        Left = 16
        Top = 319
        Hint = ''
        Caption = 'Ciudad'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object cxDBTextEdit8: TcxDBTextEdit
        Left = 80
        Top = 318
        Hint = ''
        DataBinding.DataField = 'CIUDAD'
        DataBinding.DataSource = dsCatalogo
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 17
        Width = 166
      end
      object cxDBTextEdit7: TcxDBTextEdit
        Left = 338
        Top = 237
        Hint = ''
        DataBinding.DataField = 'CODIGOPOSTAL'
        DataBinding.DataSource = dsCatalogo
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 18
        Width = 258
      end
      object cxLabel7: TcxLabel
        Left = 308
        Top = 238
        Hint = ''
        Caption = 'C.P.'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object cxLabel12: TcxLabel
        Left = 300
        Top = 129
        Hint = ''
        Caption = 'Cuenta Contable Anticipo'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object cxDBTextEdit11: TcxDBTextEdit
        Left = 430
        Top = 128
        Hint = ''
        DataBinding.DataField = 'CCC'
        DataBinding.DataSource = dsCatalogo
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 21
        Width = 166
      end
      object cxLabel13: TcxLabel
        Left = 300
        Top = 157
        Hint = ''
        Caption = 'Cuenta Contable Credito'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object cxDBTextEdit12: TcxDBTextEdit
        Left = 430
        Top = 154
        Hint = ''
        DataBinding.DataField = 'CCA'
        DataBinding.DataSource = dsCatalogo
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 23
        Width = 166
      end
      object cxDBLookupComboBox1: TcxDBLookupComboBox
        Left = 338
        Top = 264
        Hint = ''
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
        TabOrder = 24
        Width = 258
      end
      object cxLabel11: TcxLabel
        Left = 291
        Top = 265
        Hint = ''
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
      object cxButton2: TcxButton
        Left = 252
        Top = 125
        Width = 42
        Height = 27
        OptionsImage.Glyph.Data = {
          FA090000424DFA09000000000000360000002800000019000000190000000100
          200000000000C409000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000010000000100000001000000010000
          0001000000020000000200000002000000020000000200000002000000010000
          0001000000010000000100000001000000010000000100000001000000010000
          0001000000000000000000000000000000010000000100000002000000040000
          00060000000700000007000000090000000A0000000A00000009000000070000
          0006000000050000000500000006000000070000000800000008000000070000
          0004000000030000000000000000000000000000000100000004000000060000
          00090000000D0000001000000012000000150000001600000014000000130000
          00110000000D0000000C0000000D0000000F0000001000000012000000100000
          000D000000090000000500000000000000000000000000000001000000060000
          000A00000011000000190000001F000000220000002500000027000000250000
          0022000000200000001C00000019000000190000001C0000001C0000001D0000
          001A000000150000000D00000007000000000000000000000000000000030000
          000A000000110000001C0000002800000031000000360000003C0000003D0000
          003A00000037000000340000002E0000002B0000002B0000002C0000002C0000
          002A000000250000001C000000120000000A0000000000000000000000000000
          00040000000D000000180000002600000039000000450000004B000000520000
          00540000004F0000004B00000049000000410000003D0000003E000000400000
          003D000000380000003000000025000000160000000C00000000000000000000
          000000000004000000100000001D0000003000000047000000560000005E0000
          006700000067000000600000005C0000005B00000054000000500000004F0000
          004F00000049000000410000003500000028000000180000000D000000000000
          00000000000000000005000000100000001F000000340000004F0000005F0000
          00670000007000000070000000690000006600000066000000600000005C0000
          005B000000580000004F000000450000003700000029000000180000000D0000
          00000000000000000000000000050101016A0202028F00000034000000590101
          01AF010101AA010101A6010101B7000000680000006600000066000000610000
          0071010101A3010101A100000070000000450000003700000029000000180000
          000D00000000000000000000000000000004020202C3030303FF0000002F0101
          01AE030303FF010101A5030303D9030303FF0000005E0000005B0000005B0202
          02C1030303FF030303FF030303FF020202D20000004000000035000000280000
          00180000000D00000000000000000000000000000004020202C3030303FF0101
          014F030303FF030303DD0000004C020202D4030303FF0000004C0000004A0000
          0061030303FF030303DD000000660000004E00000062000000360000002D0000
          0022000000160000000C00000000000000000000000000000002020202C20303
          03FF030303FF030303FF0101016200000033020202CE030303FF030303FF0303
          03FF0101018C030303FF0101017D0000002E0000002E0000002B000000270000
          00220000001A000000110000000A000000000000000000000000000000010202
          02C1030303FF01010169030303E3030303F20000001F020202C8030303FF0202
          028F0202028F02020281030303FF0202029C0000001C0000001C0000001C0000
          001A00000017000000130000000C000000070000000000000000000000000000
          0001020202C0030303FF01010164030303F1030303FF0000003D020202C40303
          03FF0101014C0101014C0000002D030303FF030303F102020296010101690101
          01780000000F0000000D0000000B000000070000000400000000000000000000
          000000000000020202C0030303FF030303FF030303FF020202B2000000050202
          02C1030303FF030303FF030303FF0000000501010144020202B2030303FF0303
          03FF020202C10000000600000005000000040000000300000002000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0020010101300000000000000001000000010000000000000000000000000000
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
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000}
        TabOrder = 26
        OnClick = cxButton2Click
      end
      object cxButton1: TcxButton
        Left = 252
        Top = 153
        Width = 42
        Height = 27
        OptionsImage.Glyph.Data = {
          FA090000424DFA09000000000000360000002800000019000000190000000100
          200000000000C409000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000100000001000000010000000100000001000000020000
          0002000000020000000200000002000000020000000200000001000000010000
          0001000000020000000200000002000000020000000200000002000000010000
          0001000000010000000100000003000000040000000700000008000000090000
          000A0000000A0000000A0000000A0000000A0000000A0000000A000000080000
          00080000000800000008000000090000000A0000000A00000009000000070000
          0005000000030000000100000004000000070000000C0000000F000000120000
          0013000000150000001500000016000000160000001600000017000000160000
          0013000000130000001400000013000000150000001600000016000000130000
          00110000000C0000000700000004000000080000000D000000150000001A0000
          001E000000200000002200000022000000250000002600000026000000280000
          0027000000240000002400000025000000250000002700000028000000270000
          0024000000200000001800000010000000070000000D00000016000000210000
          00280000002D0000003000000031000000310000003600000038000000390000
          003C0000003C00000037000000390000003B0000003A0000003D000000400000
          003D0000003A00000034000000280000001E0000000A00000014000000200000
          002F000000380000003D0000003F0000004000000040000000460000004A0000
          004B0000004F000000500000004C0000004F0000005300000052000000550000
          00580000005400000050000000490000003C0000002E0000000D000000190000
          00280000003800000042000000460000004900000048000000470000004F0000
          0053000000540000005A0000005E0000005C0000006200000067000000670000
          006A0000006B00000066000000640000005E0000004F000000400000000E0000
          001C0000002B0000003D000000460000004A0000004C0000004B000000490000
          005100000054000000550000005B00000062000000610000006A000000710000
          00710000007400000074000000700000006F0000006A0000005D0000004F0000
          000E0000001B0101017B0101019E0101017F0000004900000057010101990101
          01A30101019B0000005A0000004F01010180010101AF00000072000000680101
          01B8010101B8010101A8010101B90000006F0000006F0000006D000000610000
          005501010149030303F1030303FF030303FF030303FF00000043020202D10303
          03FF030303FF030303FF030303E80000004E010101A4030303FF0101017D0101
          01A4030303FF010101BC030303D9030303FF0000006400000065000000640000
          005B00000051020202A3030303FF020202800000002A01010165000000370303
          03FF020202CE0000004D030303F3030303FF010101650101019B030303FF0101
          0194030303F4030303EA0000005D030303D5030303FF0101017C0000005D0000
          00520000004C00000045030303FF030303E1000000130000001C000000220000
          0028030303FF020202940000002501010169030303FF01010158020202910303
          03FF030303FF030303FF0101018E00000037020202CE030303FF030303FF0303
          03FF0101019C0000003400000030030303FF030303F00000001A000000110000
          001600000019030303FF0202028D0000001801010152030303FF0101014E0202
          028A030303FF0202028C030303E4030303FF0000003E020202C8030303FF0101
          014B030303F2030303FF0000002D0000001D020202A0030303FF020202C10101
          0156020202950000000E030303FF020202880000000D0101014A030303FF0101
          014702020285030303FF02020286030303F1030303FF0101014D020202C40303
          03FF01010179030303FF030303FF0000003D0000000F00000010020202800303
          03E0030303FF030303FF00000005030303FF0202028300000005010101430303
          03FF0101014302020282030303FF030303FF030303FF020202C1000000160202
          02C1030303FF030303FF030303FF020202A20000000500000005000000000000
          0000000000000101014000000010000000000000000100000001000000000000
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
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000}
        SpeedButtonOptions.Transparent = True
        TabOrder = 27
        OnClick = cxButton1Click
      end
      object cxLabel5: TcxLabel
        Left = 16
        Top = 265
        Hint = ''
        Caption = 'Localidad'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object cxDBTextEdit5: TcxDBTextEdit
        Left = 80
        Top = 264
        Hint = ''
        DataBinding.DataField = 'LOCALIDAD'
        DataBinding.DataSource = dsCatalogo
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 29
        Width = 166
      end
      object cxLabel6: TcxLabel
        Left = 16
        Top = 184
        Hint = ''
        Caption = 'Direccion'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object cxDBTextEdit6: TcxDBTextEdit
        Left = 80
        Top = 183
        Hint = ''
        DataBinding.DataField = 'DIRECCION'
        DataBinding.DataSource = dsCatalogo
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 31
        Width = 516
      end
      object cxDBTextEdit13: TcxDBTextEdit
        Left = 334
        Top = 210
        Hint = ''
        DataBinding.DataField = 'NOEXTERIOR'
        DataBinding.DataSource = dsCatalogo
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 32
        Width = 87
      end
      object cxLabel14: TcxLabel
        Left = 276
        Top = 211
        Hint = ''
        Caption = 'No Exterior'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object cxLabel15: TcxLabel
        Left = 16
        Top = 292
        Hint = ''
        Caption = 'Municipio'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object cxDBTextEdit14: TcxDBTextEdit
        Left = 80
        Top = 291
        Hint = ''
        DataBinding.DataField = 'MUNICIPIO'
        DataBinding.DataSource = dsCatalogo
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 35
        Width = 166
      end
      object cxLabel16: TcxLabel
        Left = 297
        Top = 319
        Hint = ''
        Caption = 'Email'
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
      object cxDBTextEdit15: TcxDBTextEdit
        Left = 338
        Top = 318
        Hint = ''
        DataBinding.DataField = 'EMAIL'
        DataBinding.DataSource = dsCatalogo
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 37
        Width = 258
      end
      object cxDBComboBox1: TcxDBComboBox
        Left = 80
        Top = 345
        Hint = ''
        DataBinding.DataField = 'ESTADO'
        DataBinding.DataSource = dsCatalogo
        Properties.Items.Strings = (
          'AGUASCALIENTES'
          'BAJA CALIFORNIA'
          'BAJA CALIFORNIA SUR'
          'CAMPECHE'
          'CHIAPAS'
          'CHIHUAHUA'
          'COAHUILA'
          'COLIMA'
          'DISTRITO FEDERAL'
          'DURANGO'
          'GUANAJUATO'
          'GUERRERO'
          'HIDALGO'
          'JALISCO'
          'MEXICO'
          'MICHOACAN'
          'MORELOS'
          'NAYARIT'
          'NUEVO LEON'
          'OAXACA'
          'PUEBLA'
          'QUERETARO'
          'QUINTANA ROO'
          'SAN LUIS POTOSI'
          'SINALOA'
          'SONORA'
          'TABASCO'
          'TAMAULIPAS'
          'TLAXCALA'
          'VERACRUZ'
          'YUCATAN'
          'ZACATECAS'
          'EXTRANJERO')
        TabOrder = 38
        Width = 166
      end
      object cxLabel18: TcxLabel
        Left = 16
        Top = 346
        Hint = ''
        Caption = 'Estado'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object cxLabel17: TcxLabel
        Left = 16
        Top = 376
        Hint = ''
        Caption = 'Pais'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object cxDBTextEdit16: TcxDBTextEdit
        Left = 80
        Top = 372
        Hint = ''
        DataBinding.DataField = 'PAIS'
        DataBinding.DataSource = dsCatalogo
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 41
        Width = 166
      end
      object cxDBTextEdit17: TcxDBTextEdit
        Left = 489
        Top = 210
        Hint = ''
        DataBinding.DataField = 'NOINTERIOR'
        DataBinding.DataSource = dsCatalogo
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 42
        Width = 106
      end
      object cxLabel19: TcxLabel
        Left = 427
        Top = 211
        Hint = ''
        Caption = 'No Exterior'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
    end
  end
  object Panel1: TPanel [1]
    Left = 0
    Top = 0
    Width = 632
    Height = 30
    Align = alTop
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Caption = ' Informacion de Clientes de Efectivo'
    Color = clBtnShadow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
  end
  object Panel2: TPanel [2]
    Left = 0
    Top = 30
    Width = 632
    Height = 2
    Align = alTop
    BevelOuter = bvNone
    Color = clNone
    ParentBackground = False
    TabOrder = 2
  end
  inherited cdsCatalogo: TDAMemDataTable
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
    RemoteDataAdapter = DM.RemoteDataAdapter
    BeforePost = cdsCatalogoBeforePost
    OnNewRecord = cdsCatalogoNewRecord
    Left = 480
    Top = 48
  end
  inherited dsCatalogo: TDADataSource
    DataSet = cdsCatalogo.Dataset
    Left = 480
    Top = 80
  end
  inherited tblCatalogo: TdxMemData
    Left = 512
    Top = 48
  end
  object cdsStatus: TDAMemDataTable
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
    LogicalName = 'dbo STATUS'
    Params = <>
    RemoteDataAdapter = DM.RemoteDataAdapter
    RemoteUpdatesOptions = []
    StreamingOptions = [soDisableEventsWhileStreaming]
    AfterDelete = cdsCatalogoAfterPost
    AfterPost = cdsCatalogoAfterPost
    IndexDefs = <>
    Left = 440
    Top = 48
  end
  object dsStatus: TDADataSource
    DataSet = cdsStatus.Dataset
    OnStateChange = dsCatalogoStateChange
    DataTable = cdsStatus
    Left = 440
    Top = 80
  end
end
