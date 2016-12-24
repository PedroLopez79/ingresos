inherited frmConfiguracion: TfrmConfiguracion
  Caption = 'frmConfiguracion'
  ClientHeight = 522
  ClientWidth = 1085
  ExplicitWidth = 1085
  ExplicitHeight = 522
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcCatalogo: TcxPageControl
    Width = 1085
    Height = 522
    TabStop = False
    Properties.ActivePage = cxTabSheet2
    ExplicitWidth = 1085
    ExplicitHeight = 522
    ClientRectBottom = 492
    ClientRectRight = 1079
    inherited cxTabSheet1: TcxTabSheet
      ExplicitLeft = 3
      ExplicitTop = 3
      ExplicitWidth = 1076
      ExplicitHeight = 489
      inherited dbgCatalogo: TcxGrid
        Width = 1076
        Height = 489
        ExplicitWidth = 1076
        ExplicitHeight = 489
        inherited dbgCatalogoDBTableView1: TcxGridDBTableView
          object dbgCatalogoDBTableView1EMPRESA: TcxGridDBColumn
            DataBinding.FieldName = 'EMPRESA'
          end
          object dbgCatalogoDBTableView1DIRECCION: TcxGridDBColumn
            DataBinding.FieldName = 'DIRECCION'
          end
          object dbgCatalogoDBTableView1RFC: TcxGridDBColumn
            DataBinding.FieldName = 'RFC'
          end
          object dbgCatalogoDBTableView1TELEFONO: TcxGridDBColumn
            DataBinding.FieldName = 'TELEFONO'
          end
        end
      end
    end
    inherited cxTabSheet2: TcxTabSheet
      ExplicitLeft = 3
      ExplicitTop = 3
      ExplicitWidth = 1076
      ExplicitHeight = 489
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 1076
        Height = 30
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Caption = ' Configuracion de Parametros del Sistema'
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
      object cxPageControl1: TcxPageControl
        Left = 0
        Top = 32
        Width = 1076
        Height = 457
        Hint = ''
        Align = alClient
        TabOrder = 0
        Properties.ActivePage = cxTabSheet3
        Properties.CustomButtons.Buttons = <>
        Properties.Images = dmImages.Imagenes2
        ClientRectBottom = 451
        ClientRectLeft = 3
        ClientRectRight = 1070
        ClientRectTop = 27
        object cxTabSheet3: TcxTabSheet
          Caption = 'Datos Generales'
          ImageIndex = 50
          object Shape1: TShape
            Left = 6
            Top = 148
            Width = 546
            Height = 7
            Brush.Color = clNavy
            Brush.Style = bsDiagCross
          end
          object cxDBTextEdit1: TcxDBTextEdit
            Left = 120
            Top = 14
            Hint = ''
            DataBinding.DataField = 'NOMBRECOMERCIAL'
            DataBinding.DataSource = dsCatalogo
            TabOrder = 0
            Width = 439
          end
          object cxDBTextEdit2: TcxDBTextEdit
            Left = 120
            Top = 40
            Hint = ''
            DataBinding.DataField = 'DIRECCION'
            DataBinding.DataSource = dsCatalogo
            TabOrder = 1
            Width = 439
          end
          object cxDBTextEdit8: TcxDBTextEdit
            Left = 120
            Top = 65
            Hint = ''
            DataBinding.DataField = 'TELEFONO'
            DataBinding.DataSource = dsCatalogo
            TabOrder = 2
            Width = 166
          end
          object cxDBTextEdit9: TcxDBTextEdit
            Left = 120
            Top = 91
            Hint = ''
            DataBinding.DataField = 'FAX'
            DataBinding.DataSource = dsCatalogo
            TabOrder = 3
            Width = 166
          end
          object cxLabel1: TcxLabel
            Left = 6
            Top = 15
            Hint = ''
            Caption = 'Nomre Comercial'
            Transparent = True
          end
          object cxLabel3: TcxLabel
            Left = 6
            Top = 41
            Hint = ''
            Caption = 'Direccion'
            Transparent = True
          end
          object cxLabel11: TcxLabel
            Left = 6
            Top = 66
            Hint = ''
            Caption = 'Telefono'
            Transparent = True
          end
          object cxLabel12: TcxLabel
            Left = 6
            Top = 92
            Hint = ''
            Caption = 'Fax'
            Transparent = True
          end
          object cxLabel2: TcxLabel
            Left = 326
            Top = 368
            Hint = ''
            Caption = 'Tipo Cambio'
          end
          object cxDBTextEdit4: TcxDBTextEdit
            Left = 433
            Top = 367
            Hint = ''
            DataBinding.DataField = 'TIPOCAMBIO'
            DataBinding.DataSource = dsCatalogo
            TabOrder = 10
            Width = 119
          end
          object cxLabel5: TcxLabel
            Left = 326
            Top = 395
            Hint = ''
            Caption = 'Impuesto Porcentaje'
          end
          object cxDBTextEdit5: TcxDBTextEdit
            Left = 433
            Top = 394
            Hint = ''
            DataBinding.DataField = 'ImpuestoPorcentaje'
            DataBinding.DataSource = dsCatalogo
            TabOrder = 11
            Width = 119
          end
          object cxLabel4: TcxLabel
            Left = 6
            Top = 339
            Hint = ''
            Caption = 'E-mail'
            Style.BorderStyle = ebsNone
            Transparent = True
          end
          object cxDBTextEdit12: TcxDBTextEdit
            Left = 120
            Top = 338
            Hint = ''
            DataBinding.DataField = 'EMAIL'
            DataBinding.DataSource = dsCatalogo
            Properties.CharCase = ecUpperCase
            Style.BorderStyle = ebsUltraFlat
            Style.LookAndFeel.NativeStyle = False
            StyleDisabled.LookAndFeel.NativeStyle = False
            StyleFocused.LookAndFeel.NativeStyle = False
            StyleHot.LookAndFeel.NativeStyle = False
            TabOrder = 9
            Width = 439
          end
          object cxLabel7: TcxLabel
            Left = 6
            Top = 122
            Hint = ''
            Caption = 'Cuenta Contable'
            Transparent = True
          end
          object cxDBTextEdit6: TcxDBTextEdit
            Left = 120
            Top = 121
            Hint = ''
            DataBinding.DataField = 'CC'
            DataBinding.DataSource = dsCatalogo
            TabOrder = 4
            Width = 166
          end
          object cxLabel13: TcxLabel
            Left = 6
            Top = 204
            Hint = ''
            Caption = 'Clave Pemex'
            Transparent = True
          end
          object cxDBTextEdit7: TcxDBTextEdit
            Left = 120
            Top = 203
            Hint = ''
            DataBinding.DataField = 'CLAVEPEMEX'
            DataBinding.DataSource = dsCatalogo
            TabOrder = 5
            Width = 119
          end
          object cxLabel14: TcxLabel
            Left = 6
            Top = 231
            Hint = ''
            Caption = '# Bombas'
            Transparent = True
          end
          object cxDBTextEdit10: TcxDBTextEdit
            Left = 120
            Top = 230
            Hint = ''
            DataBinding.DataField = 'BOMBAS'
            DataBinding.DataSource = dsCatalogo
            TabOrder = 6
            Width = 119
          end
          object cxDBTextEdit11: TcxDBTextEdit
            Left = 120
            Top = 257
            Hint = ''
            DataBinding.DataField = 'HOSTVOLUMETRICO'
            DataBinding.DataSource = dsCatalogo
            TabOrder = 7
            Width = 119
          end
          object cxLabel16: TcxLabel
            Left = 6
            Top = 311
            Hint = ''
            Caption = 'Numero Estacion'
            Transparent = True
          end
          object cxDBTextEdit13: TcxDBTextEdit
            Left = 120
            Top = 310
            Hint = ''
            DataBinding.DataField = 'NUMEROESTACION'
            DataBinding.DataSource = dsCatalogo
            TabOrder = 8
            Width = 119
          end
          object cxLabel15: TcxLabel
            Left = 6
            Top = 258
            Hint = ''
            Caption = 'Host Volumetrico'
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
          object cxDBTextEdit14: TcxDBTextEdit
            Left = 120
            Top = 284
            Hint = ''
            DataBinding.DataField = 'PUERTOVOLUMETRICO'
            DataBinding.DataSource = dsCatalogo
            TabOrder = 24
            Width = 119
          end
          object cxLabel17: TcxLabel
            Left = 6
            Top = 285
            Hint = ''
            Caption = 'Puerto Volumetrico'
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
        end
        object cxTabSheet7: TcxTabSheet
          Caption = 'Facturar  -=(factura electronica)=-'
          ImageIndex = 56
          object cxDBTextEdit27: TcxDBTextEdit
            Left = 191
            Top = 24
            Hint = ''
            DataBinding.DataField = 'EMPRESA'
            DataBinding.DataSource = dsCatalogo
            TabOrder = 0
            Width = 363
          end
          object cxLabel30: TcxLabel
            Left = 6
            Top = 25
            Hint = ''
            Caption = 'Facturar a Nombre de (Razon Social)'
            Transparent = True
          end
          object cxDBTextEdit28: TcxDBTextEdit
            Left = 191
            Top = 51
            Hint = ''
            DataBinding.DataField = 'DIRECCION'
            DataBinding.DataSource = dsCatalogo
            TabOrder = 1
            Width = 363
          end
          object cxLabel31: TcxLabel
            Left = 6
            Top = 52
            Hint = ''
            Caption = 'Domicilio'
            Transparent = True
          end
          object cxDBTextEdit29: TcxDBTextEdit
            Left = 191
            Top = 267
            Hint = ''
            DataBinding.DataField = 'Telefono1'
            DataBinding.DataSource = dsCatalogo
            TabOrder = 10
            Width = 187
          end
          object cxLabel32: TcxLabel
            Left = 6
            Top = 268
            Hint = ''
            Caption = 'Factura Telefono'
            Transparent = True
          end
          object cxLabel33: TcxLabel
            Left = 6
            Top = 294
            Hint = ''
            Caption = 'R.F.C.'
            Transparent = True
          end
          object cxDBTextEdit30: TcxDBTextEdit
            Left = 191
            Top = 293
            Hint = ''
            DataBinding.DataField = 'RFC'
            DataBinding.DataSource = dsCatalogo
            TabOrder = 11
            Width = 187
          end
          object cxLabel34: TcxLabel
            Left = 384
            Top = 82
            Hint = ''
            Caption = 'Numero Exterior'
            Style.BorderStyle = ebsNone
            Transparent = True
          end
          object cxDBTextEdit31: TcxDBTextEdit
            Left = 191
            Top = 78
            Hint = ''
            DataBinding.DataField = 'COLONIA'
            DataBinding.DataSource = dsCatalogo
            TabOrder = 2
            Width = 187
          end
          object cxLabel35: TcxLabel
            Left = 6
            Top = 79
            Hint = ''
            Caption = 'Colonia'
            Style.BorderStyle = ebsNone
            Transparent = True
          end
          object cxDBTextEdit32: TcxDBTextEdit
            Left = 469
            Top = 78
            Hint = ''
            DataBinding.DataField = 'NOEXTERIOR'
            DataBinding.DataSource = dsCatalogo
            TabOrder = 3
            Width = 85
          end
          object cxLabel36: TcxLabel
            Left = 6
            Top = 106
            Hint = ''
            Caption = 'Localidad'
            Style.BorderStyle = ebsNone
            Transparent = True
          end
          object cxDBTextEdit33: TcxDBTextEdit
            Left = 191
            Top = 105
            Hint = ''
            DataBinding.DataField = 'LOCALIDAD'
            DataBinding.DataSource = dsCatalogo
            TabOrder = 4
            Width = 187
          end
          object cxLabel37: TcxLabel
            Left = 6
            Top = 160
            Hint = ''
            Caption = 'Municipio'
            Style.BorderStyle = ebsNone
            Transparent = True
          end
          object cxDBTextEdit34: TcxDBTextEdit
            Left = 191
            Top = 159
            Hint = ''
            DataBinding.DataField = 'MUNICIPIO'
            DataBinding.DataSource = dsCatalogo
            TabOrder = 6
            Width = 187
          end
          object cxLabel38: TcxLabel
            Left = 6
            Top = 133
            Hint = ''
            Caption = 'Estado'
            Style.BorderStyle = ebsNone
            Transparent = True
          end
          object cxDBTextEdit35: TcxDBTextEdit
            Left = 191
            Top = 132
            Hint = ''
            DataBinding.DataField = 'ESTADO'
            DataBinding.DataSource = dsCatalogo
            TabOrder = 5
            Width = 187
          end
          object cxLabel27: TcxLabel
            Left = 6
            Top = 213
            Hint = ''
            Caption = 'Pais'
            Style.BorderStyle = ebsNone
            Transparent = True
          end
          object cxDBTextEdit15: TcxDBTextEdit
            Left = 191
            Top = 212
            Hint = ''
            DataBinding.DataField = 'PAIS'
            DataBinding.DataSource = dsCatalogo
            TabOrder = 8
            Width = 187
          end
          object cxLabel28: TcxLabel
            Left = 6
            Top = 240
            Hint = ''
            Caption = 'Codigo Postal'
            Style.BorderStyle = ebsNone
            Transparent = True
          end
          object cxDBTextEdit18: TcxDBTextEdit
            Left = 191
            Top = 239
            Hint = ''
            DataBinding.DataField = 'CODIGOPOSTAL'
            DataBinding.DataSource = dsCatalogo
            TabOrder = 9
            Width = 187
          end
          object cxLabel6: TcxLabel
            Left = 6
            Top = 187
            Hint = ''
            Caption = 'Ciudad'
            Style.BorderStyle = ebsNone
            Transparent = True
          end
          object cxDBTextEdit3: TcxDBTextEdit
            Left = 191
            Top = 186
            Hint = ''
            DataBinding.DataField = 'CIUDAD'
            DataBinding.DataSource = dsCatalogo
            TabOrder = 7
            Width = 187
          end
          object cxButton2: TcxButton
            Left = 384
            Top = 290
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
            TabOrder = 24
          end
          object cxDBTextEdit39: TcxDBTextEdit
            Left = 469
            Top = 105
            Hint = ''
            DataBinding.DataField = 'NoInterior'
            DataBinding.DataSource = dsCatalogo
            TabOrder = 25
            Width = 85
          end
          object cxLabel45: TcxLabel
            Left = 384
            Top = 109
            Hint = ''
            Caption = 'Numero Interior'
            Style.BorderStyle = ebsNone
            Transparent = True
          end
        end
        object cxTabSheet5: TcxTabSheet
          Caption = 'Configuracion Factura Electronica'
          ImageIndex = 55
          object cxLabel8: TcxLabel
            Left = 15
            Top = 51
            Hint = ''
            Caption = 'Archivo de Clave Privada'
            Style.BorderStyle = ebsNone
            Transparent = True
          end
          object cxLabel9: TcxLabel
            Left = 279
            Top = 94
            Hint = ''
            Caption = 'Password Clave Fiel'
            Style.BorderStyle = ebsNone
            Transparent = True
          end
          object cxLabel10: TcxLabel
            Left = 16
            Top = 139
            Hint = ''
            Caption = 'Telefono 1'
            Style.BorderStyle = ebsNone
            Transparent = True
          end
          object cxDBTextEdit16: TcxDBTextEdit
            Left = 16
            Top = 156
            Hint = ''
            DataBinding.DataField = 'Telefono1'
            DataBinding.DataSource = dsCatalogo
            Properties.CharCase = ecUpperCase
            TabOrder = 9
            Width = 241
          end
          object cxLabel20: TcxLabel
            Left = 16
            Top = 188
            Hint = ''
            Caption = 'Telefono 2'
            Style.BorderStyle = ebsNone
            Transparent = True
          end
          object cxDBTextEdit17: TcxDBTextEdit
            Left = 15
            Top = 206
            Hint = ''
            DataBinding.DataField = 'Telefono2'
            DataBinding.DataSource = dsCatalogo
            Properties.CharCase = ecUpperCase
            TabOrder = 12
            Width = 242
          end
          object cxLabel21: TcxLabel
            Left = 16
            Top = 94
            Hint = ''
            Caption = 'Archivo de Certificado'
            Style.BorderStyle = ebsNone
            Transparent = True
          end
          object cxLabel23: TcxLabel
            Left = 16
            Top = 245
            Hint = ''
            Caption = 'Folio Inicial'
            Style.BorderStyle = ebsNone
            Transparent = True
          end
          object cxDBTextEdit19: TcxDBTextEdit
            Left = 16
            Top = 264
            Hint = ''
            DataBinding.DataField = 'FolioInicial'
            DataBinding.DataSource = dsCatalogo
            Properties.CharCase = ecUpperCase
            TabOrder = 14
            Width = 104
          end
          object cxLabel24: TcxLabel
            Left = 133
            Top = 245
            Hint = ''
            Caption = 'Folio Final'
            Style.BorderStyle = ebsNone
            Transparent = True
          end
          object cxDBTextEdit20: TcxDBTextEdit
            Left = 133
            Top = 264
            Hint = ''
            DataBinding.DataField = 'FolioFinal'
            DataBinding.DataSource = dsCatalogo
            Properties.CharCase = ecUpperCase
            TabOrder = 17
            Width = 124
          end
          object cxLabel25: TcxLabel
            Left = 15
            Top = 8
            Hint = ''
            Caption = '# de Aprobacion'
            Style.BorderStyle = ebsNone
            Transparent = True
          end
          object cxDBTextEdit21: TcxDBTextEdit
            Left = 15
            Top = 24
            Hint = ''
            DataBinding.DataField = 'noAprobacion'
            DataBinding.DataSource = dsCatalogo
            Properties.CharCase = ecUpperCase
            TabOrder = 3
            Width = 83
          end
          object cxLabel26: TcxLabel
            Left = 104
            Top = 8
            Hint = ''
            Caption = 'A'#241'o Aprobacion'
            Style.BorderStyle = ebsNone
            Transparent = True
          end
          object cxDBDateEdit1: TcxDBDateEdit
            Left = 104
            Top = 24
            Hint = ''
            DataBinding.DataField = 'AnoAprobacion'
            DataBinding.DataSource = dsCatalogo
            TabOrder = 4
            Width = 153
          end
          object cxDBTextEdit22: TcxDBTextEdit
            Left = 279
            Top = 112
            Hint = ''
            DataBinding.DataField = 'PasswordFCTElect'
            DataBinding.DataSource = dsCatalogo
            Properties.EchoMode = eemPassword
            Properties.PasswordChar = '*'
            TabOrder = 7
            Width = 230
          end
          object opClavePriv: TAdvFileNameEdit
            Left = 16
            Top = 67
            Width = 241
            Height = 21
            EmptyTextStyle = []
            Flat = False
            FocusColor = clWindow
            LabelFont.Charset = DEFAULT_CHARSET
            LabelFont.Color = clWindowText
            LabelFont.Height = -11
            LabelFont.Name = 'MS Sans Serif'
            LabelFont.Style = []
            Lookup.Font.Charset = DEFAULT_CHARSET
            Lookup.Font.Color = clWindowText
            Lookup.Font.Height = -11
            Lookup.Font.Name = 'Arial'
            Lookup.Font.Style = []
            Lookup.Separator = ';'
            Color = clWindow
            ReadOnly = False
            TabOrder = 5
            Text = ''
            Visible = True
            Version = '1.3.5.0'
            ButtonStyle = bsButton
            ButtonWidth = 18
            Etched = False
            Glyph.Data = {
              CE000000424DCE0000000000000076000000280000000C0000000B0000000100
              0400000000005800000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00D00000000DDD
              00000077777770DD00000F077777770D00000FF07777777000000FFF00000000
              00000FFFFFFF0DDD00000FFF00000DDD0000D000DDDDD0000000DDDDDDDDDD00
              0000DDDDD0DDD0D00000DDDDDD000DDD0000}
            Filter = 'Archivo de Clave Privada|*.key'
            FilterIndex = 0
            DialogOptions = []
            DialogKind = fdOpen
          end
          object opCertificado: TAdvFileNameEdit
            Left = 16
            Top = 112
            Width = 241
            Height = 21
            EmptyTextStyle = []
            Flat = False
            FocusColor = clWindow
            LabelFont.Charset = DEFAULT_CHARSET
            LabelFont.Color = clWindowText
            LabelFont.Height = -11
            LabelFont.Name = 'MS Sans Serif'
            LabelFont.Style = []
            Lookup.Font.Charset = DEFAULT_CHARSET
            Lookup.Font.Color = clWindowText
            Lookup.Font.Height = -11
            Lookup.Font.Name = 'Arial'
            Lookup.Font.Style = []
            Lookup.Separator = ';'
            Color = clWindow
            ReadOnly = False
            TabOrder = 6
            Text = ''
            Visible = True
            Version = '1.3.5.0'
            ButtonStyle = bsButton
            ButtonWidth = 18
            Etched = False
            Glyph.Data = {
              CE000000424DCE0000000000000076000000280000000C0000000B0000000100
              0400000000005800000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00D00000000DDD
              00000077777770DD00000F077777770D00000FF07777777000000FFF00000000
              00000FFFFFFF0DDD00000FFF00000DDD0000D000DDDDD0000000DDDDDDDDDD00
              0000DDDDD0DDD0D00000DDDDDD000DDD0000}
            Filter = 'Archivo de Certificado|*.cer'
            FilterIndex = 0
            DialogOptions = []
            DialogKind = fdOpen
          end
        end
        object cxTabSheet6: TcxTabSheet
          Caption = 'Configuraciones Servidor Creditos'
          ImageIndex = 58
          object cxLabel18: TcxLabel
            Left = 22
            Top = 26
            Hint = ''
            Caption = 'Host Servidor Creditos'
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
          object cxLabel19: TcxLabel
            Left = 22
            Top = 53
            Hint = ''
            Caption = 'Puerto Servidor Creditos'
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
          object cxDBTextEdit23: TcxDBTextEdit
            Left = 167
            Top = 52
            Hint = ''
            DataBinding.DataField = 'PUERTOFLOTILLAS'
            DataBinding.DataSource = dsCatalogo
            TabOrder = 2
            Width = 119
          end
          object cxDBTextEdit24: TcxDBTextEdit
            Left = 167
            Top = 25
            Hint = ''
            DataBinding.DataField = 'HOSTFLOTILLAS'
            DataBinding.DataSource = dsCatalogo
            TabOrder = 3
            Width = 119
          end
          object cxLabel29: TcxLabel
            Left = 22
            Top = 80
            Hint = ''
            Caption = 'Serie Factura Creditos'
            Transparent = True
          end
          object cxLabel39: TcxLabel
            Left = 22
            Top = 107
            Hint = ''
            Caption = 'Serie Factura Debitos'
            Transparent = True
          end
          object cxDBTextEdit25: TcxDBTextEdit
            Left = 167
            Top = 106
            Hint = ''
            DataBinding.DataField = 'SERIEFACTURADEBITO'
            DataBinding.DataSource = dsCatalogo
            TabOrder = 6
            Width = 119
          end
          object cxDBTextEdit26: TcxDBTextEdit
            Left = 167
            Top = 79
            Hint = ''
            DataBinding.DataField = 'SERIEFACTURACREDITO'
            DataBinding.DataSource = dsCatalogo
            TabOrder = 7
            Width = 119
          end
          object cxLabel40: TcxLabel
            Left = 22
            Top = 134
            Hint = ''
            Caption = 'Reporte Facturas Credito - Debito'
            Transparent = True
          end
          object cxDBTextEdit36: TcxDBTextEdit
            Left = 190
            Top = 133
            Hint = ''
            DataBinding.DataField = 'REPORTEFACTURACREDITODEBITO'
            DataBinding.DataSource = dsCatalogo
            TabOrder = 9
            Width = 416
          end
        end
        object cxTabSheet8: TcxTabSheet
          Caption = 'Acerca de'
          ImageIndex = 31
          object cxLabel41: TcxLabel
            Left = 13
            Top = 35
            Hint = ''
            Caption = 'Licencia'
            Transparent = True
          end
          object cxDBTextEdit37: TcxDBTextEdit
            Left = 97
            Top = 34
            Hint = ''
            DataBinding.DataField = 'LICENCIA'
            DataBinding.DataSource = dsCatalogo
            TabOrder = 1
            Width = 405
          end
          object cxButton1: TcxButton
            Left = 508
            Top = 31
            Width = 37
            Height = 27
            OptionsImage.Glyph.Data = {
              36040000424D3604000000000000360000002800000010000000100000000100
              2000000000000004000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              000000000000000000000122005C024A00CC024A00CC024A00CC024A00CC024A
              00CC024A00CC0122005C00000000000000000000000000000000000000000000
              0000000000000328005C055700CC22D911FF22D911FF22D911FF22D911FF22D9
              11FF22D911FF055700CC0328005C000000000000000000000000000000000000
              0000042E005C086400CC28D317FF22D111FF22D111FF22B611FF22B611FF22D1
              11FF22D111FF22D111FF086400CC042E005C0000000000000000000000000430
              005C0A6A00CC31CF20FF22C811FF22C811FF22BC11FFE8E8E8FFECECECFF22BC
              11FF22C811FF22C811FF22C811FF0A6A00CC0430005C00000000000000000A6E
              00CC3DCD2CFF22BE11FF22BE11FF22BE11FF22B511FFE4E4E4FFE8E8E8FF22B5
              11FF22BE11FF22BE11FF22BE11FF23BE12FF0A6E00CC00000000000000000B71
              00CC41C330FF23B412FF22A811FF22A811FF22A411FFE0E0E0FFE4E4E4FF22A4
              11FF22A811FF22A811FF22B411FF25B514FF0B7100CC00000000000000000C75
              00CC52C941FF33AF22FFD4D4D4FFD3D3D3FFD7D7D7FFDCDCDCFFE0E0E0FFE4E4
              E4FFE8E8E8FFECECECFF22A611FF28AF17FF0C7500CC00000000000000000D78
              00CC55CC44FF3CB32BFFF8F8F8FFE1E1E1FFD5D5D5FFD7D7D7FFDCDCDCFFE0E0
              E0FFE4E4E4FFE8E8E8FF22A011FF2CAA1BFF0D7800CC00000000000000000E7B
              00CC5AD149FF47BE36FF3EB52DFF3EB52DFF37AE26FFEBEBEBFFE2E2E2FF259D
              14FF239B12FF239B12FF279F16FF39B128FF0E7B00CC00000000000000000E7E
              00CC72E961FF4EC53DFF4EC53DFF4EC53DFF44BB33FFFFFFFFFFFFFFFFFF44BB
              33FF4EC53DFF4EC53DFF4EC53DFF62D951FF0E7E00CC0000000000000000073A
              005C0F8200CC75EC64FF57CE46FF57CE46FF4AC139FFFFFFFFFFFFFFFFFF4AC1
              39FF57CE46FF57CE46FF6BE25AFF0F8200CC073A005C00000000000000000000
              0000073C005C108400CC77EE66FF5FD64EFF5FD64EFF50C73FFF50C73FFF5FD6
              4EFF5FD64EFF72E961FF108400CC073C005C0000000000000000000000000000
              000000000000073D005C108600CC77EE66FF6EE55DFF6EE55DFF6DE45CFF6DE4
              5CFF76ED65FF108600CC073D005C000000000000000000000000000000000000
              00000000000000000000083D005C118800CC118800CC118800CC118800CC1188
              00CC118800CC083D005C00000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000}
            TabOrder = 2
            OnClick = cxButton1Click
          end
          object cxLabel43: TcxLabel
            Left = 13
            Top = 66
            Hint = ''
            Caption = 'Version Sistema'
            Transparent = True
          end
          object cxDBComboBox1: TcxDBComboBox
            Left = 97
            Top = 65
            Hint = ''
            DataBinding.DataField = 'VERSION'
            DataBinding.DataSource = dsCatalogo
            Properties.Items.Strings = (
              'STANDARD'
              'IMPI')
            TabOrder = 4
            Width = 136
          end
          object cxDBComboBox2: TcxDBComboBox
            Left = 97
            Top = 97
            Hint = ''
            DataBinding.DataField = 'TIPOINGRESO'
            DataBinding.DataSource = dsCatalogo
            Properties.Items.Strings = (
              'INGRESO POR TURNO'
              'INGRESO POR FECHA')
            TabOrder = 5
            Width = 136
          end
          object cxLabel44: TcxLabel
            Left = 13
            Top = 98
            Hint = ''
            Caption = 'Tipo Ingreso'
            Transparent = True
          end
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 30
        Width = 1076
        Height = 2
        Align = alTop
        BevelOuter = bvNone
        Color = clNone
        ParentBackground = False
        TabOrder = 2
      end
    end
  end
  inherited cdsCatalogo: TDAMemDataTable
    Fields = <
      item
        Name = 'TIPOCAMBIO'
        DataType = datFloat
      end
      item
        Name = 'FORMATOCONTROL'
        DataType = datMemo
      end
      item
        Name = 'ESCUELA'
        DataType = datString
        Size = 50
      end
      item
        Name = 'MNIMACAL'
        DataType = datFloat
      end
      item
        Name = 'MAXIMACAL'
        DataType = datFloat
      end
      item
        Name = 'LOGO'
        DataType = datMemo
      end
      item
        Name = 'CICLOACTUAL'
        DataType = datInteger
      end
      item
        Name = 'DIRECCION'
        DataType = datString
        Size = 70
      end
      item
        Name = 'TELEFONO'
        DataType = datString
        Size = 20
      end
      item
        Name = 'IMAGEN1'
        DataType = datMemo
      end
      item
        Name = 'IMAGEN2'
        DataType = datMemo
      end
      item
        Name = 'FAX'
        DataType = datString
        Size = 20
      end
      item
        Name = 'DIRECTOR'
        DataType = datString
        Size = 70
      end
      item
        Name = 'MINUTOSXHORA'
        DataType = datInteger
      end
      item
        Name = 'EMPRESAS'
        DataType = datString
        Size = 10
      end
      item
        Name = 'CALIFICACION1'
        DataType = datString
        Size = 30
      end
      item
        Name = 'CALIFICACION2'
        DataType = datString
        Size = 30
      end
      item
        Name = 'CUENTABANCO1'
        DataType = datString
        Size = 25
      end
      item
        Name = 'BOLETAS'
        DataType = datString
        Size = 150
      end
      item
        Name = 'FECHABOLETAOFICIAL'
        DataType = datDateTime
      end
      item
        Name = 'NoExterior'
        DataType = datString
        Size = 20
      end
      item
        Name = 'Localidad'
        DataType = datString
        Size = 50
      end
      item
        Name = 'Municipio'
        DataType = datString
        Size = 50
      end
      item
        Name = 'Estado'
        DataType = datString
        Size = 50
      end
      item
        Name = 'Pais'
        DataType = datString
        Size = 50
      end
      item
        Name = 'noAprobacion'
        DataType = datInteger
      end
      item
        Name = 'Colonia'
        DataType = datString
        Size = 50
      end
      item
        Name = 'CodigoPostal'
        DataType = datString
        Size = 50
      end
      item
        Name = 'NoCertificado'
        DataType = datString
        Size = 50
      end
      item
        Name = 'ArchivoClavePrivada'
        DataType = datString
        Size = 200
      end
      item
        Name = 'ArchivoCertificado'
        DataType = datString
        Size = 200
      end
      item
        Name = 'ClavePriv'
        DataType = datString
        Size = 200
      end
      item
        Name = 'Certificado'
        DataType = datString
        Size = 4000
      end
      item
        Name = 'PasswordFCTElect'
        DataType = datString
        Size = 200
      end
      item
        Name = 'EstacionID'
        DataType = datInteger
      end
      item
        Name = 'Sucursal'
        DataType = datBoolean
      end
      item
        Name = 'SucursalDE'
        DataType = datInteger
      end
      item
        Name = 'Telefono1'
        DataType = datString
        Size = 50
      end
      item
        Name = 'Telefono2'
        DataType = datString
        Size = 50
      end
      item
        Name = 'AnoAprobacion'
        DataType = datDateTime
      end
      item
        Name = 'FolioInicial'
        DataType = datInteger
      end
      item
        Name = 'FolioFinal'
        DataType = datInteger
      end
      item
        Name = 'ImpuestoPorcentaje'
        DataType = datFloat
      end
      item
        Name = 'RFC'
        DataType = datString
        Size = 50
      end
      item
        Name = 'CALIFICACION3'
        DataType = datString
        Size = 30
      end
      item
        Name = 'SITIOTIMBREFISCAL'
        DataType = datString
        Size = 200
      end
      item
        Name = 'USUARIOTIMBREFISCAL'
        DataType = datString
        Size = 150
      end
      item
        Name = 'PASSWORDTIMBREFISCAL'
        DataType = datString
        Size = 150
      end
      item
        Name = 'NUMEROESTACION'
        DataType = datInteger
      end
      item
        Name = 'SerieFacturaDebito'
        DataType = datString
        Size = 100
      end
      item
        Name = 'SerieFacturaCredito'
        DataType = datString
        Size = 100
      end
      item
        Name = 'ReporteFacturaCreditoDebito'
        DataType = datString
        Size = 100
      end
      item
        Name = 'NOMBRECOMERCIAL'
        DataType = datString
        Size = 100
      end
      item
        Name = 'TIPOINGRESO'
        DataType = datString
        Size = 50
      end>
    LogicalName = 'dbo CONFIGURACION'
    RemoteDataAdapter = DM.RemoteDataAdapter
    AfterScroll = cdsCatalogoAfterScroll
    BeforePost = cdsCatalogoBeforePost
    OnNewRecord = cdsCatalogoNewRecord
  end
  inherited dsCatalogo: TDADataSource
    DataSet = cdsCatalogo.Dataset
  end
  object AdvSQLMemoStyler1: TAdvSQLMemoStyler
    AutoCompletion.Strings = (
      'SELECT'
      'WHERE')
    HintParameter.TextColor = clBlack
    HintParameter.BkColor = clInfoBk
    HintParameter.HintCharStart = '('
    HintParameter.HintCharEnd = ')'
    HintParameter.HintCharDelimiter = ';'
    HintParameter.HintClassDelimiter = '.'
    HintParameter.HintCharWriteDelimiter = ','
    LineComment = #39
    MultiCommentLeft = '{'
    MultiCommentRight = '}'
    CommentStyle.TextColor = clNavy
    CommentStyle.BkColor = clWhite
    CommentStyle.Style = [fsItalic]
    NumberStyle.TextColor = clFuchsia
    NumberStyle.BkColor = clWhite
    NumberStyle.Style = [fsBold]
    AllStyles = <
      item
        KeyWords.Strings = (
          'and'
          'begin'
          'begin'
          'break'
          'by'
          'close'
          'continue'
          'create'
          'deallocate'
          'declare'
          'delete'
          'delete'
          'do'
          'else'
          'end'
          'end'
          'exec'
          'fetch'
          'for'
          'from'
          'group'
          'having'
          'if'
          'inner'
          'insert'
          'join'
          'left'
          'like'
          'not'
          'on'
          'open'
          'or'
          'order'
          'outer'
          'proc'
          'procedure'
          'repeat'
          'return'
          'right'
          'rollback'
          'select'
          'set'
          'to'
          'trans'
          'transaction'
          'until'
          'update'
          'values'
          'where'
          'while'
          'while')
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        BGColor = clWhite
        StyleType = stKeyword
        BracketStart = #0
        BracketEnd = #0
        Info = 'SQL Standard Default'
      end
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        BGColor = clWhite
        StyleType = stBracket
        BracketStart = '"'
        BracketEnd = '"'
        Info = 'Double Quote'
      end
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        BGColor = clWhite
        StyleType = stSymbol
        BracketStart = #0
        BracketEnd = #0
        Symbols = ' ,;:.(){}[]=-*/^%<>#'#13#10
        Info = 'Symbols Delimiters'
      end>
    Description = 'SQL'
    Filter = 'SQL Files (*.sql)|*.sql'
    DefaultExtension = '.sql'
    StylerName = 'SQL'
    Extensions = 'sql'
    Left = 464
    Top = 312
  end
  object cdsConfiguracion: TDAMemDataTable
    Fields = <
      item
        Name = 'TIPOCAMBIO'
        DataType = datFloat
      end
      item
        Name = 'FORMATOCONTROL'
        DataType = datMemo
      end
      item
        Name = 'ESCUELA'
        DataType = datString
        Size = 50
      end
      item
        Name = 'MNIMACAL'
        DataType = datFloat
      end
      item
        Name = 'MAXIMACAL'
        DataType = datFloat
      end
      item
        Name = 'LOGO'
        DataType = datMemo
      end
      item
        Name = 'CICLOACTUAL'
        DataType = datInteger
      end
      item
        Name = 'DIRECCION'
        DataType = datString
        Size = 70
      end
      item
        Name = 'TELEFONO'
        DataType = datString
        Size = 20
      end
      item
        Name = 'IMAGEN1'
        DataType = datMemo
      end
      item
        Name = 'IMAGEN2'
        DataType = datMemo
      end
      item
        Name = 'FAX'
        DataType = datString
        Size = 20
      end
      item
        Name = 'DIRECTOR'
        DataType = datString
        Size = 70
      end
      item
        Name = 'MINUTOSXHORA'
        DataType = datInteger
      end
      item
        Name = 'EMPRESAS'
        DataType = datString
        Size = 10
      end
      item
        Name = 'CALIFICACION1'
        DataType = datString
        Size = 30
      end
      item
        Name = 'CALIFICACION2'
        DataType = datString
        Size = 30
      end
      item
        Name = 'CUENTABANCO1'
        DataType = datString
        Size = 25
      end
      item
        Name = 'BOLETAS'
        DataType = datString
        Size = 150
      end
      item
        Name = 'FECHABOLETAOFICIAL'
        DataType = datDateTime
      end
      item
        Name = 'NoExterior'
        DataType = datString
        Size = 20
      end
      item
        Name = 'Localidad'
        DataType = datString
        Size = 50
      end
      item
        Name = 'Municipio'
        DataType = datString
        Size = 50
      end
      item
        Name = 'Estado'
        DataType = datString
        Size = 50
      end
      item
        Name = 'Pais'
        DataType = datString
        Size = 50
      end
      item
        Name = 'noAprobacion'
        DataType = datInteger
      end
      item
        Name = 'Colonia'
        DataType = datString
        Size = 50
      end
      item
        Name = 'CodigoPostal'
        DataType = datString
        Size = 50
      end
      item
        Name = 'NoCertificado'
        DataType = datString
        Size = 50
      end
      item
        Name = 'ArchivoClavePrivada'
        DataType = datString
        Size = 200
      end
      item
        Name = 'ArchivoCertificado'
        DataType = datString
        Size = 200
      end
      item
        Name = 'ClavePriv'
        DataType = datString
        Size = 200
      end
      item
        Name = 'Certificado'
        DataType = datString
        Size = 4000
      end
      item
        Name = 'PasswordFCTElect'
        DataType = datString
        Size = 200
      end
      item
        Name = 'EstacionID'
        DataType = datInteger
      end
      item
        Name = 'Sucursal'
        DataType = datBoolean
      end
      item
        Name = 'SucursalDE'
        DataType = datInteger
      end
      item
        Name = 'Telefono1'
        DataType = datString
        Size = 50
      end
      item
        Name = 'Telefono2'
        DataType = datString
        Size = 50
      end
      item
        Name = 'AnoAprobacion'
        DataType = datDateTime
      end
      item
        Name = 'FolioInicial'
        DataType = datInteger
      end
      item
        Name = 'FolioFinal'
        DataType = datInteger
      end
      item
        Name = 'ImpuestoPorcentaje'
        DataType = datFloat
      end
      item
        Name = 'RFC'
        DataType = datString
        Size = 50
      end
      item
        Name = 'CALIFICACION3'
        DataType = datString
        Size = 30
      end
      item
        Name = 'SITIOTIMBREFISCAL'
        DataType = datString
        Size = 200
      end
      item
        Name = 'USUARIOTIMBREFISCAL'
        DataType = datString
        Size = 150
      end
      item
        Name = 'PASSWORDTIMBREFISCAL'
        DataType = datString
        Size = 150
      end
      item
        Name = 'NUMEROESTACION'
        DataType = datInteger
      end
      item
        Name = 'SerieFacturaDebito'
        DataType = datString
        Size = 100
      end
      item
        Name = 'SerieFacturaCredito'
        DataType = datString
        Size = 100
      end
      item
        Name = 'ReporteFacturaCreditoDebito'
        DataType = datString
        Size = 100
      end
      item
        Name = 'NOMBRECOMERCIAL'
        DataType = datString
        Size = 100
      end
      item
        Name = 'TIPOINGRESO'
        DataType = datString
        Size = 50
      end>
    LogicalName = 'dbo CONFIGURACION'
    Params = <>
    RemoteDataAdapter = DM.RemoteDataAdapter
    RemoteUpdatesOptions = []
    StreamingOptions = [soDisableEventsWhileStreaming]
    AfterDelete = cdsCatalogoAfterPost
    AfterPost = cdsCatalogoAfterPost
    AfterScroll = cdsCatalogoAfterScroll
    BeforePost = cdsCatalogoBeforePost
    OnNewRecord = cdsCatalogoNewRecord
    IndexDefs = <>
    Left = 616
    Top = 312
  end
  object dsConfiguracion: TDADataSource
    DataSet = cdsConfiguracion.Dataset
    OnStateChange = dsCatalogoStateChange
    DataTable = cdsConfiguracion
    Left = 616
    Top = 360
  end
  object OpenDialog: TOpenDialog
    Left = 464
    Top = 360
  end
end
