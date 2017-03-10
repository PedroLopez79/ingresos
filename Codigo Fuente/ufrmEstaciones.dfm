inherited FrmEstaciones: TFrmEstaciones
  Caption = 'FrmEstaciones'
  ClientHeight = 386
  ClientWidth = 788
  ExplicitWidth = 788
  ExplicitHeight = 386
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcCatalogo: TcxPageControl
    Width = 788
    Height = 386
    Properties.ActivePage = cxTabSheet2
    ExplicitWidth = 788
    ExplicitHeight = 386
    ClientRectBottom = 356
    ClientRectRight = 782
    inherited cxTabSheet1: TcxTabSheet
      ExplicitLeft = 3
      ExplicitTop = 3
      ExplicitWidth = 779
      ExplicitHeight = 353
      inherited dbgCatalogo: TcxGrid
        Width = 779
        Height = 353
        LevelTabs.Style = 5
        ExplicitWidth = 779
        ExplicitHeight = 353
        inherited dbgCatalogoDBTableView1: TcxGridDBTableView
          object dbgCatalogoDBTableView1EstacionID: TcxGridDBColumn
            DataBinding.FieldName = 'IDESTACION'
          end
          object dbgCatalogoDBTableView1Nombre: TcxGridDBColumn
            DataBinding.FieldName = 'Nombre'
            Width = 170
          end
          object dbgCatalogoDBTableView1RazonSocial: TcxGridDBColumn
            DataBinding.FieldName = 'RAZONSOCIAL'
            Width = 275
          end
          object dbgCatalogoDBTableView1RFC: TcxGridDBColumn
            DataBinding.FieldName = 'RFC'
          end
          object dbgCatalogoDBTableView1Colonia: TcxGridDBColumn
            DataBinding.FieldName = 'Colonia'
            Width = 143
          end
          object dbgCatalogoDBTableView1Ciudad: TcxGridDBColumn
            DataBinding.FieldName = 'LOCALIDAD'
            Width = 78
          end
          object dbgCatalogoDBTableView1CodigoPostal: TcxGridDBColumn
            DataBinding.FieldName = 'CodigoPostal'
            Width = 81
          end
          object dbgCatalogoDBTableView1Host: TcxGridDBColumn
            DataBinding.FieldName = 'Host'
          end
          object dbgCatalogoDBTableView1CuentaContable: TcxGridDBColumn
            DataBinding.FieldName = 'CUENTACONTABLE'
          end
          object dbgCatalogoDBTableView1Impuesto: TcxGridDBColumn
            DataBinding.FieldName = 'Impuesto'
          end
        end
      end
    end
    inherited cxTabSheet2: TcxTabSheet
      ExplicitWidth = 779
      ExplicitHeight = 353
      object GrpBoxDatos: TcxGroupBox
        Left = 3
        Top = 3
        Hint = ''
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 0
        Height = 342
        Width = 582
        object TxtNoEstacion: TcxDBTextEdit
          Left = 16
          Top = 38
          Hint = ''
          DataBinding.DataField = 'IDESTACION'
          DataBinding.DataSource = dsCatalogo
          Properties.CharCase = ecUpperCase
          Properties.ReadOnly = False
          Style.BorderStyle = ebsUltraFlat
          Style.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 0
          Width = 81
        end
        object LblNoEstacion: TcxLabel
          Left = 16
          Top = 22
          Hint = ''
          Caption = 'Estaci'#243'n'
          Style.BorderStyle = ebsNone
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          Transparent = True
        end
        object LblDireccion: TcxLabel
          Left = 16
          Top = 142
          Hint = ''
          Caption = 'Calle'
          Style.BorderStyle = ebsNone
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          Transparent = True
        end
        object LblRFC: TcxLabel
          Left = 16
          Top = 60
          Hint = ''
          Caption = 'R.F.C.'
          Style.BorderStyle = ebsNone
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          Transparent = True
        end
        object LblHost: TcxLabel
          Left = 183
          Top = 60
          Hint = ''
          Caption = 'Host'
          Style.BorderStyle = ebsNone
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          Transparent = True
        end
        object LblNombre: TcxLabel
          Left = 103
          Top = 22
          Hint = ''
          Caption = 'Nombre'
          Style.BorderStyle = ebsNone
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          Transparent = True
        end
        object TxtNombre: TcxDBTextEdit
          Left = 103
          Top = 38
          Hint = ''
          DataBinding.DataField = 'Nombre'
          DataBinding.DataSource = dsCatalogo
          Properties.CharCase = ecUpperCase
          Style.BorderStyle = ebsUltraFlat
          Style.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 1
          Width = 474
        end
        object TxtDireccion: TcxDBTextEdit
          Left = 16
          Top = 158
          Hint = ''
          DataBinding.DataField = 'CALLE'
          DataBinding.DataSource = dsCatalogo
          Properties.CharCase = ecUpperCase
          Style.BorderStyle = ebsUltraFlat
          Style.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 3
          Width = 201
        end
        object TxtRFC: TcxDBTextEdit
          Left = 16
          Top = 76
          Hint = ''
          DataBinding.DataField = 'RFC'
          DataBinding.DataSource = dsCatalogo
          Properties.CharCase = ecUpperCase
          Style.BorderStyle = ebsUltraFlat
          Style.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 5
          OnExit = TxtRFCExit
          Width = 161
        end
        object TxtHost: TcxDBTextEdit
          Left = 183
          Top = 76
          Hint = ''
          DataBinding.DataField = 'Host'
          DataBinding.DataSource = dsCatalogo
          Properties.CharCase = ecUpperCase
          Style.BorderStyle = ebsUltraFlat
          Style.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 6
          Width = 169
        end
        object cxDBTextEdit1: TcxDBTextEdit
          Left = 16
          Top = 198
          Hint = ''
          DataBinding.DataField = 'LOCALIDAD'
          DataBinding.DataSource = dsCatalogo
          Properties.CharCase = ecUpperCase
          Style.BorderStyle = ebsUltraFlat
          Style.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 4
          Width = 201
        end
        object cxLabel1: TcxLabel
          Left = 16
          Top = 182
          Hint = ''
          Caption = 'Ciudad'
          Style.BorderStyle = ebsNone
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          Transparent = True
        end
        object LblCuentaContable: TcxLabel
          Left = 358
          Top = 60
          Hint = ''
          Caption = 'Cuenta Contable'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
        object TxtCuentaContable: TcxDBTextEdit
          Left = 358
          Top = 76
          Hint = ''
          DataBinding.DataField = 'CuentaContable'
          DataBinding.DataSource = dsCatalogo
          Properties.CharCase = ecUpperCase
          Style.BorderStyle = ebsUltraFlat
          Style.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 9
          Width = 219
        end
        object TxtIva: TcxDBTextEdit
          Left = 223
          Top = 198
          Hint = ''
          DataBinding.DataField = 'Impuesto'
          DataBinding.DataSource = dsCatalogo
          Properties.CharCase = ecUpperCase
          Style.BorderStyle = ebsUltraFlat
          Style.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 8
          OnExit = TxtIvaExit
          Width = 140
        end
        object LblImpuento: TcxLabel
          Left = 223
          Top = 182
          Hint = ''
          Caption = 'Porcentaje de Impuesto'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
        object cxLabel2: TcxLabel
          Left = 16
          Top = 103
          Hint = ''
          Caption = 'Razon Social'
          Style.BorderStyle = ebsNone
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          Transparent = True
        end
        object cxDBTextEdit2: TcxDBTextEdit
          Left = 16
          Top = 119
          Hint = ''
          DataBinding.DataField = 'RazonSocial'
          DataBinding.DataSource = dsCatalogo
          Properties.CharCase = ecUpperCase
          Style.BorderStyle = ebsUltraFlat
          Style.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 2
          Width = 561
        end
        object cxLabel3: TcxLabel
          Left = 222
          Top = 142
          Hint = ''
          Caption = 'Colonia'
          Style.BorderStyle = ebsNone
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          Transparent = True
        end
        object cxDBTextEdit3: TcxDBTextEdit
          Left = 223
          Top = 158
          Hint = ''
          DataBinding.DataField = 'COLONIA'
          DataBinding.DataSource = dsCatalogo
          Properties.CharCase = ecUpperCase
          Style.BorderStyle = ebsUltraFlat
          Style.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 19
          Width = 201
        end
        object cxDBTextEdit4: TcxDBTextEdit
          Left = 426
          Top = 158
          Hint = ''
          DataBinding.DataField = 'MUNICIPIO'
          DataBinding.DataSource = dsCatalogo
          Properties.CharCase = ecUpperCase
          Style.BorderStyle = ebsUltraFlat
          Style.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 20
          Width = 151
        end
        object cxLabel4: TcxLabel
          Left = 426
          Top = 142
          Hint = ''
          Caption = 'Municipio'
          Style.BorderStyle = ebsNone
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          Transparent = True
        end
        object cxDBImage1: TcxDBImage
          Left = 437
          Top = 268
          Hint = ''
          DataBinding.DataField = 'LOGOESTACION'
          DataBinding.DataSource = dsCatalogo
          Properties.GraphicClassName = 'TJPEGImage'
          Properties.Proportional = False
          Properties.Stretch = True
          TabOrder = 22
          Transparent = True
          Height = 71
          Width = 140
        end
        object cxLabel5: TcxLabel
          Left = 479
          Top = 250
          Hint = ''
          Caption = 'Logo de la Estacion'
          Style.BorderStyle = ebsNone
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          Transparent = True
        end
        object Button1: TButton
          Left = 392
          Top = 314
          Width = 39
          Height = 25
          Caption = '...'
          TabOrder = 24
          OnClick = Button1Click
        end
        object cxLabel19: TcxLabel
          Left = 426
          Top = 182
          Hint = ''
          Caption = 'Codigo Postal'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
        object cxDBTextEdit11: TcxDBTextEdit
          Left = 426
          Top = 198
          Hint = ''
          DataBinding.DataField = 'CODIGOPOSTAL'
          DataBinding.DataSource = dsCatalogo
          Properties.CharCase = ecUpperCase
          Style.BorderStyle = ebsUltraFlat
          Style.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 26
          OnExit = TxtIvaExit
          Width = 140
        end
        object cxLabel21: TcxLabel
          Left = 16
          Top = 230
          Hint = ''
          Caption = 'Pais'
          Style.BorderStyle = ebsNone
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          Transparent = True
        end
        object cxDBTextEdit18: TcxDBTextEdit
          Left = 16
          Top = 246
          Hint = ''
          DataBinding.DataField = 'PAIS'
          DataBinding.DataSource = dsCatalogo
          Properties.CharCase = ecUpperCase
          Style.BorderStyle = ebsUltraFlat
          Style.LookAndFeel.NativeStyle = False
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 28
          Width = 113
        end
      end
    end
    object cxTabSheet3: TcxTabSheet
      Caption = 'Datos Expedicion'
      ImageIndex = 15
      object cxGroupBox4: TcxGroupBox
        Left = 3
        Top = 3
        Hint = ''
        Caption = 'Datos de Expedicion de Factura Electronica'
        ParentFont = False
        Style.BorderStyle = ebsUltraFlat
        Style.Font.Charset = ANSI_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Arial'
        Style.Font.Style = [fsBold]
        Style.LookAndFeel.NativeStyle = True
        Style.TextStyle = [fsBold]
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 0
        Height = 262
        Width = 649
        object cxLabel6: TcxLabel
          Left = 7
          Top = 29
          Hint = ''
          Caption = 'Ex-Calle'
          ParentFont = False
          Style.BorderStyle = ebsNone
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Arial'
          Style.Font.Style = [fsBold]
          Style.LookAndFeel.NativeStyle = True
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          Transparent = True
        end
        object cxDBTextEdit5: TcxDBTextEdit
          Left = 7
          Top = 49
          Hint = ''
          DataBinding.DataField = 'EXCALLE'
          DataBinding.DataSource = dsCatalogo
          ParentFont = False
          Properties.CharCase = ecUpperCase
          Style.BorderStyle = ebsUltraFlat
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Arial'
          Style.Font.Style = [fsBold]
          Style.LookAndFeel.NativeStyle = False
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 1
          Width = 318
        end
        object cxLabel7: TcxLabel
          Left = 304
          Top = 78
          Hint = ''
          Caption = 'Ex-NoInterior'
          ParentFont = False
          Style.BorderStyle = ebsNone
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Arial'
          Style.Font.Style = [fsBold]
          Style.LookAndFeel.NativeStyle = True
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          Transparent = True
        end
        object cxDBTextEdit6: TcxDBTextEdit
          Left = 304
          Top = 96
          Hint = ''
          DataBinding.DataField = 'EXNOINTERIOR'
          DataBinding.DataSource = dsCatalogo
          ParentFont = False
          Properties.CharCase = ecUpperCase
          Style.BorderStyle = ebsUltraFlat
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Arial'
          Style.Font.Style = [fsBold]
          Style.LookAndFeel.NativeStyle = False
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 3
          Width = 82
        end
        object cxLabel8: TcxLabel
          Left = 538
          Top = 30
          Hint = ''
          Caption = 'Ex-Codigo Postal'
          ParentFont = False
          Style.BorderStyle = ebsNone
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Arial'
          Style.Font.Style = [fsBold]
          Style.LookAndFeel.NativeStyle = True
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          Transparent = True
        end
        object cxDBTextEdit7: TcxDBTextEdit
          Left = 538
          Top = 49
          Hint = ''
          DataBinding.DataField = 'EXCODIGOPOSTAL'
          DataBinding.DataSource = dsCatalogo
          ParentFont = False
          Properties.CharCase = ecUpperCase
          Style.BorderStyle = ebsUltraFlat
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Arial'
          Style.Font.Style = [fsBold]
          Style.LookAndFeel.NativeStyle = False
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 5
          Width = 108
        end
        object cxLabel9: TcxLabel
          Left = 119
          Top = 172
          Hint = ''
          Caption = 'Regimen Fiscal'
          ParentFont = False
          Style.BorderStyle = ebsNone
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Arial'
          Style.Font.Style = [fsBold]
          Style.LookAndFeel.NativeStyle = True
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          Transparent = True
        end
        object cxDBTextEdit8: TcxDBTextEdit
          Left = 119
          Top = 192
          Hint = ''
          DataBinding.DataField = 'REGIMENFISCAL'
          DataBinding.DataSource = dsCatalogo
          ParentFont = False
          Properties.CharCase = ecUpperCase
          Style.BorderStyle = ebsUltraFlat
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Arial'
          Style.Font.Style = [fsBold]
          Style.LookAndFeel.NativeStyle = False
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 7
          Width = 267
        end
        object cxLabel10: TcxLabel
          Left = 331
          Top = 30
          Hint = ''
          Caption = 'Ex-Colonia'
          ParentFont = False
          Style.BorderStyle = ebsNone
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Arial'
          Style.Font.Style = [fsBold]
          Style.LookAndFeel.NativeStyle = True
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          Transparent = True
        end
        object cxDBTextEdit9: TcxDBTextEdit
          Left = 331
          Top = 49
          Hint = ''
          DataBinding.DataField = 'EXCOLONIA'
          DataBinding.DataSource = dsCatalogo
          ParentFont = False
          Properties.CharCase = ecUpperCase
          Style.BorderStyle = ebsUltraFlat
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Arial'
          Style.Font.Style = [fsBold]
          Style.LookAndFeel.NativeStyle = False
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 9
          Width = 201
        end
        object cxLabel11: TcxLabel
          Left = 7
          Top = 78
          Hint = ''
          Caption = 'Ex-Municipio'
          ParentFont = False
          Style.BorderStyle = ebsNone
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Arial'
          Style.Font.Style = [fsBold]
          Style.LookAndFeel.NativeStyle = True
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          Transparent = True
        end
        object cxDBTextEdit10: TcxDBTextEdit
          Left = 7
          Top = 97
          Hint = ''
          DataBinding.DataField = 'EXMUNICIPIO'
          DataBinding.DataSource = dsCatalogo
          ParentFont = False
          Properties.CharCase = ecUpperCase
          Style.BorderStyle = ebsUltraFlat
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Arial'
          Style.Font.Style = [fsBold]
          Style.LookAndFeel.NativeStyle = False
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 11
          Width = 201
        end
        object cxLabel12: TcxLabel
          Left = 7
          Top = 125
          Hint = ''
          Caption = 'Ex-Estado'
          ParentFont = False
          Style.BorderStyle = ebsNone
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Arial'
          Style.Font.Style = [fsBold]
          Style.LookAndFeel.NativeStyle = True
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          Transparent = True
        end
        object cxLabel13: TcxLabel
          Left = 214
          Top = 125
          Hint = ''
          Caption = 'NoAprobacion'
          ParentFont = False
          Style.BorderStyle = ebsNone
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Arial'
          Style.Font.Style = [fsBold]
          Style.LookAndFeel.NativeStyle = True
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          Transparent = True
        end
        object cxDBTextEdit12: TcxDBTextEdit
          Left = 214
          Top = 144
          Hint = ''
          DataBinding.DataField = 'NOAPROBACION'
          DataBinding.DataSource = dsCatalogo
          ParentFont = False
          Properties.CharCase = ecUpperCase
          Style.BorderStyle = ebsUltraFlat
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Arial'
          Style.Font.Style = [fsBold]
          Style.LookAndFeel.NativeStyle = False
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 14
          Width = 172
        end
        object cxLabel14: TcxLabel
          Left = 214
          Top = 78
          Hint = ''
          Caption = 'Ex-NoExterio'
          ParentFont = False
          Style.BorderStyle = ebsNone
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Arial'
          Style.Font.Style = [fsBold]
          Style.LookAndFeel.NativeStyle = True
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          Transparent = True
        end
        object cxDBTextEdit13: TcxDBTextEdit
          Left = 214
          Top = 97
          Hint = ''
          DataBinding.DataField = 'EXNOEXTERIOR'
          DataBinding.DataSource = dsCatalogo
          ParentFont = False
          Properties.CharCase = ecUpperCase
          Style.BorderStyle = ebsUltraFlat
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Arial'
          Style.Font.Style = [fsBold]
          Style.LookAndFeel.NativeStyle = False
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 16
          Width = 84
        end
        object cxLabel15: TcxLabel
          Left = 392
          Top = 77
          Hint = ''
          Caption = 'Ex-Localidad'
          ParentFont = False
          Style.BorderStyle = ebsNone
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Arial'
          Style.Font.Style = [fsBold]
          Style.LookAndFeel.NativeStyle = True
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          Transparent = True
        end
        object cxDBTextEdit14: TcxDBTextEdit
          Left = 392
          Top = 97
          Hint = ''
          DataBinding.DataField = 'LOCALIDAD'
          DataBinding.DataSource = dsCatalogo
          ParentFont = False
          Properties.CharCase = ecUpperCase
          Style.BorderStyle = ebsUltraFlat
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Arial'
          Style.Font.Style = [fsBold]
          Style.LookAndFeel.NativeStyle = False
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 18
          Width = 254
        end
        object cxLabel16: TcxLabel
          Left = 392
          Top = 125
          Hint = ''
          Caption = 'Fecha de Aprobacion'
          ParentFont = False
          Style.BorderStyle = ebsNone
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Arial'
          Style.Font.Style = [fsBold]
          Style.LookAndFeel.NativeStyle = True
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          Transparent = True
        end
        object cxLabel17: TcxLabel
          Left = 392
          Top = 172
          Hint = ''
          Caption = 'Codigo Factura'
          ParentFont = False
          Style.BorderStyle = ebsNone
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Arial'
          Style.Font.Style = [fsBold]
          Style.LookAndFeel.NativeStyle = True
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          Transparent = True
        end
        object cxDBTextEdit16: TcxDBTextEdit
          Left = 392
          Top = 192
          Hint = ''
          DataBinding.DataField = 'CODIGOFACTURA'
          DataBinding.DataSource = dsCatalogo
          ParentFont = False
          Properties.CharCase = ecUpperCase
          Style.BorderStyle = ebsUltraFlat
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Arial'
          Style.Font.Style = [fsBold]
          Style.LookAndFeel.NativeStyle = False
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 21
          Width = 86
        end
        object cxLabel18: TcxLabel
          Left = 7
          Top = 172
          Hint = ''
          Caption = 'Version CFD'
          ParentFont = False
          Style.BorderStyle = ebsNone
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Arial'
          Style.Font.Style = [fsBold]
          Style.LookAndFeel.NativeStyle = True
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          Transparent = True
        end
        object cxDBTextEdit17: TcxDBTextEdit
          Left = 7
          Top = 192
          Hint = ''
          DataBinding.DataField = 'VERSIONCFD'
          DataBinding.DataSource = dsCatalogo
          ParentFont = False
          Properties.CharCase = ecUpperCase
          Style.BorderStyle = ebsUltraFlat
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Arial'
          Style.Font.Style = [fsBold]
          Style.LookAndFeel.NativeStyle = False
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 23
          Width = 106
        end
        object cxDBComboBox1: TcxDBComboBox
          Left = 7
          Top = 144
          Hint = ''
          DataBinding.DataField = 'EXESTADO'
          DataBinding.DataSource = dsCatalogo
          ParentFont = False
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
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Arial'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          TabOrder = 24
          Width = 201
        end
        object DateUltimoPago: TcxDBDateEdit
          Left = 392
          Top = 144
          Hint = ''
          DataBinding.DataField = 'FECHAAPROBACION'
          DataBinding.DataSource = dsCatalogo
          ParentFont = False
          Properties.ButtonGlyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000000000020000
            000A000000100000001100000011000000110000001200000012000000120000
            0012000000120000001300000013000000120000000C000000030000000A8159
            4CC2B47C69FFB37B69FFB37B68FFB37A68FFB37A68FFB27A68FFB37968FFB279
            68FFB27967FFB27867FFB17867FFB17866FF7F5649C30000000B0000000EB77F
            6EFFFBF7F4FFF8EEE9FFF8EEE8FFF7EFE8FFFBF6F3FFFBF6F3FFF7EDE7FFF7ED
            E6FFF6EDE6FFF6ECE6FFF6ECE6FFF6ECE5FFB47B69FF000000110000000EB984
            72FFFBF8F5FFF8F0EAFFF7EFE9FFF8EFE9FF96847BFF998982FFF8EFEAFFF8EE
            E8FFF7EDE7FFF7ECE7FFF6ECE6FFF7EDE7FFB77F6EFF000000110000000EBC89
            78FFFCF9F7FFF9F1EDFFF8F0ECFFF8F0EBFFF9F0EBFF6A5249FFEAE3E0FFF8EF
            EAFFF7EFE9FFF8EEE9FFF7EEE8FFF8EEE9FFB98472FF000000100000000DC08E
            7DFFFCFAF8FFFAF3EFFFF9F2EEFFF9F2EEFFF9F2EDFFA6948CFF9B8C85FFF9F2
            EDFFF8F1EBFFF9F0EBFFF8EFEAFFF8F1EBFFBC8977FF000000100000000CC394
            82FFFCFBF9FFFBF5F2FFFBF4F1FFFAF4F1FFFAF3F0FFFAF3F0FF6E574CFFECE6
            E3FFF9F2EEFFF9F2EDFFF9F2EDFFF9F2EEFFC08E7CFF0000000F0000000BC798
            87FFFDFCFAFFFBF7F4FFFBF6F4FFFBF6F2FFFDFBFAFFFBF5F2FFA99990FF9F8F
            87FFFBF5F3FFFAF3F0FFFAF3F0FFFAF4F0FFC49381FF0000000E0000000BC99D
            8CFFFDFCFBFFFCF8F6FFFCF7F5FFFCF7F5FF8F7B72FFFFFFFFFFFFFFFFFF7C65
            5AFFDFD8D5FFFBF6F2FFFAF5F2FFFAF6F2FFC69886FF0000000D0000000ACDA1
            90FFFEFDFCFFFCF9F8FFFCF8F7FFFCF9F7FF664B3CFF654A3CFF65493BFF6448
            3BFF8E796EFFFCF7F5FFFBF6F5FFFBF7F5FFC99D8BFF0000000D00000009CFA5
            94FFFEFDFDFFFDFAF9FFFDF9F9FFFDFAF8FFFDF9F8FFFDFAF8FFFCF9F7FFFCF9
            F7FFFCF9F7FFFDF8F7FFFCF9F7FFFCF9F7FFCCA290FF0000000C000000084B53
            C3FF8D9EECFF687CE3FF6678E2FF6476E1FF6172E0FF5F70DFFF5D6CDEFF5B69
            DCFF5966DBFF5664DAFF5462D9FF616DDCFF3337AAFF0000000B000000084C55
            C4FF93A4EEFF6C80E6FF6A7EE4FF687BE4FF6678E2FF6375E1FF6172E0FF5E6F
            DEFF5C6CDDFF5A69DCFF5766DAFF6472DDFF3538ABFF0000000A000000074D56
            C6FF96A7EFFF95A6EFFF93A4EDFF90A2EDFF8F9FEDFF8B9BEBFF8898EAFF8595
            EAFF8291E7FF7F8DE7FF7D89E5FF7987E5FF3539ACFF00000009000000043A40
            93C14D55C5FF4B53C3FF4A51C1FF484FBFFF464DBEFF444BBBFF4249B9FF4046
            B7FF3E44B4FF3C41B3FF3A3EB0FF393CAEFF282B80C200000006000000010000
            0004000000060000000600000006000000070000000700000007000000070000
            0007000000070000000800000008000000070000000500000001}
          Properties.DisplayFormat = 'dd/mm/yyyy'
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Arial'
          Style.Font.Style = [fsBold]
          Style.IsFontAssigned = True
          TabOrder = 25
          Width = 201
        end
        object cxDBTextEdit15: TcxDBTextEdit
          Left = 507
          Top = 192
          Hint = ''
          DataBinding.DataField = 'EXPAIS'
          DataBinding.DataSource = dsCatalogo
          ParentFont = False
          Properties.CharCase = ecUpperCase
          Style.BorderStyle = ebsUltraFlat
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Arial'
          Style.Font.Style = [fsBold]
          Style.LookAndFeel.NativeStyle = False
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = False
          StyleFocused.LookAndFeel.NativeStyle = False
          StyleHot.LookAndFeel.NativeStyle = False
          TabOrder = 26
          Width = 86
        end
        object cxLabel20: TcxLabel
          Left = 507
          Top = 172
          Hint = ''
          Caption = 'Pais'
          ParentFont = False
          Style.BorderStyle = ebsNone
          Style.Font.Charset = ANSI_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -11
          Style.Font.Name = 'Arial'
          Style.Font.Style = [fsBold]
          Style.LookAndFeel.NativeStyle = True
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.NativeStyle = True
          Transparent = True
        end
      end
    end
  end
  inherited cdsCatalogo: TDAMemDataTable
    Fields = <
      item
        Name = 'IDESTACION'
        DataType = datInteger
        Required = True
        InPrimaryKey = True
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
    LogicalName = 'dbo.ESTACION'
    RemoteDataAdapter = DM.RemoteDataAdapter
    OnNewRecord = cdsCatalogoNewRecord
    Left = 664
    Top = 16
  end
  inherited dsCatalogo: TDADataSource
    DataSet = cdsCatalogo.Dataset
    Left = 664
    Top = 64
  end
  inherited tblCatalogo: TdxMemData
    Left = 728
    Top = 16
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Filter = 'JPEG Image File (*.jpg)|*.jpg'
    Left = 726
    Top = 62
  end
end
