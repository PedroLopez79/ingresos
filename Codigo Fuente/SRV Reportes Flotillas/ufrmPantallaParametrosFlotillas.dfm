object frmPantallaParametrosFlotillas: TfrmPantallaParametrosFlotillas
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'frmPantallaParametrosFlotillas'
  ClientHeight = 1596
  ClientWidth = 1472
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object rbImporteLitros: TcxRadioGroup
    Tag = 100
    Left = 608
    Top = 368
    Caption = ' Importe / Litros '
    Properties.Columns = 3
    Properties.DefaultValue = '0'
    Properties.Items = <
      item
        Caption = 'Importe'
        Value = '0'
      end
      item
        Caption = 'Litros'
        Value = '1'
      end>
    ItemIndex = 0
    Style.LookAndFeel.NativeStyle = False
    Style.TextColor = clNavy
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 0
    Height = 65
    Width = 577
  end
  object rbMovimientos: TcxRadioGroup
    Tag = 100
    Left = 24
    Top = 704
    Caption = ' Movimientos '
    Properties.Columns = 3
    Properties.DefaultValue = 'AC'
    Properties.Items = <
      item
        Caption = 'Todos'
        Value = 'AC'
      end
      item
        Caption = 'Cargos'
        Value = 'C'
      end
      item
        Caption = 'Abonos'
        Value = 'A'
      end>
    ItemIndex = 0
    Style.LookAndFeel.NativeStyle = False
    Style.TextColor = clNavy
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 1
    Height = 65
    Width = 577
  end
  object gbHora: TcxGroupBox
    Tag = 100
    Left = 25
    Top = 192
    Caption = '  Rango de Hora  '
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 2
    Visible = False
    Height = 65
    Width = 577
    object Label39: TLabel
      Left = 59
      Top = 28
      Width = 53
      Height = 13
      Caption = 'Hora Inicial'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label40: TLabel
      Left = 267
      Top = 28
      Width = 48
      Height = 13
      Caption = 'Hora Final'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object edtHoraIni: TcxTimeEdit
      Left = 128
      Top = 24
      EditValue = 0d
      Style.TextColor = clNavy
      TabOrder = 0
      Width = 73
    end
    object edtHoraFin: TcxTimeEdit
      Left = 330
      Top = 24
      EditValue = 0.999988425925926d
      Style.TextColor = clNavy
      TabOrder = 1
      Width = 72
    end
  end
  object gbAgentes: TcxGroupBox
    Tag = 100
    Left = 24
    Top = 545
    Caption = '  Agentes  '
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 3
    Height = 89
    Width = 577
    object Label32: TLabel
      Left = 27
      Top = 28
      Width = 63
      Height = 13
      Caption = 'Agente inicial'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label33: TLabel
      Left = 27
      Top = 60
      Width = 59
      Height = 13
      Caption = 'Agente Final'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object edtNombreAgenteIni: TcxTextEdit
      Left = 175
      Top = 29
      TabStop = False
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 0
      Width = 305
    end
    object edtNombreAgenteFin: TcxTextEdit
      Left = 175
      Top = 56
      TabStop = False
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 1
      Width = 305
    end
    object edtAgenteIni: TcxCurrencyEdit
      Left = 112
      Top = 29
      EditValue = '0'
      ParentFont = False
      Properties.DecimalPlaces = 0
      Properties.DisplayFormat = '0000'
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
      Width = 57
    end
    object edtAgenteFin: TcxCurrencyEdit
      Left = 112
      Top = 56
      EditValue = '9999'
      ParentFont = False
      Properties.DecimalPlaces = 0
      Properties.DisplayFormat = '0000'
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
      TabOrder = 3
      Width = 57
    end
  end
  object gbAnioComparar: TcxGroupBox
    Tag = 100
    Left = 610
    Top = 440
    Caption = '  A'#241'o a Comparar  '
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 4
    Visible = False
    Height = 65
    Width = 577
    object Label26: TLabel
      Left = 67
      Top = 27
      Width = 19
      Height = 13
      Caption = 'A'#241'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object edtAnioComparar: TcxCurrencyEdit
      Left = 96
      Top = 24
      EditValue = '2006'
      ParentFont = False
      Properties.DecimalPlaces = 0
      Properties.DisplayFormat = '#'
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
      TabOrder = 0
      Width = 65
    end
  end
  object gbGrupo: TcxGroupBox
    Tag = 100
    Left = 24
    Top = 408
    Caption = '  Grupo    '
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 5
    Height = 65
    Width = 577
    object Label7: TLabel
      Left = 72
      Top = 30
      Width = 29
      Height = 13
      Caption = 'Grupo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object dbcGrupo: TcxLookupComboBox
      Left = 112
      Top = 26
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Properties.KeyFieldNames = 'Grupo'
      Properties.ListColumns = <
        item
          FieldName = 'Grupo'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsGrupo
      EditValue = ''
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 0
      Width = 273
    end
  end
  object gbClientes: TcxGroupBox
    Tag = 100
    Left = 24
    Top = 228
    Caption = '  Clientes  '
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 6
    Height = 109
    Width = 577
    object Label3: TLabel
      Left = 3
      Top = 35
      Width = 62
      Height = 13
      Caption = 'Cliente Inicial'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label4: TLabel
      Left = 3
      Top = 75
      Width = 57
      Height = 13
      Caption = 'Cliente Final'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label27: TLabel
      Left = 449
      Top = 16
      Width = 83
      Height = 13
      Caption = 'Forma de Compra'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label28: TLabel
      Left = 449
      Top = 56
      Width = 69
      Height = 13
      Caption = 'D'#237'a a Facturar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object edtClienteIni: TcxCurrencyEdit
      Tag = 1
      Left = 89
      Top = 32
      EditValue = '0'
      ParentFont = False
      Properties.DecimalPlaces = 0
      Properties.DisplayFormat = '0000'
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
      TabOrder = 0
      OnExit = edtClienteIniExit
      Width = 57
    end
    object edtClienteFin: TcxCurrencyEdit
      Tag = 2
      Left = 88
      Top = 72
      EditValue = '99999999'
      ParentFont = False
      Properties.DecimalPlaces = 0
      Properties.DisplayFormat = '0000'
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
      OnExit = edtClienteIniExit
      Width = 57
    end
    object edtNombreClienteIni: TcxTextEdit
      Left = 152
      Top = 32
      TabStop = False
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 3
      Width = 225
    end
    object edtNombreClienteFin: TcxTextEdit
      Left = 152
      Top = 72
      TabStop = False
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 2
      Width = 225
    end
    object edtBuscaClienteIni: TcxButton
      Tag = 1
      Left = 380
      Top = 29
      Width = 66
      Height = 25
      Caption = 'Buscar'
      TabOrder = 4
      TabStop = False
      OnClick = edtBuscaClienteIniClick
      Colors.Default = clWhite
      Colors.Normal = clWhite
      Colors.Hot = clWhite
      Colors.Pressed = clWhite
      Colors.Disabled = clWhite
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000120B0000120B0000000100000000000000000000FFFF
        FF00FF00FF00623C230062442D005339240072503300CB925E00DAA97600836E
        5800695A4600FFCF8900C2AC8600D4D0C9000A0A0900EDFFFF00F8FFFF0064A5
        AD003692AD0051D4FF00EEFBFF000089BC0039CAFF005CD3FF00091114000493
        C9000C96CF000FA1DC001CBFFF001EC1FF0021BCFB0021BAFA002BC2FE0031C2
        FF002882A50057D0FF005DBAE0008CDDFF00C1EDFF00D0F2FF000075AA00027F
        B600129DDD0017A1E0001CB1F2001BADEB001AA5E0001FB7F8001FB4F4001EAF
        ED003FC5FE0045ABD7004AADD7004093B8007ACEF40072BBDD008AC5DE009DCC
        E200D0EBF700006FA5000173AA000774AC00087AB5000B84C0001498D700148A
        C5001697D50018445B0044ABDE0041A0D00099D3EF00AAD0E300BFE5F7000474
        AF00056BA5000B5B88000C4B6D001680B8002182B60000578A00035A91000464
        9E00046099000454860000518800002A470000243D0002558E0002416A000351
        8800033E640006609A000E6096000D24330000447600013B650000386C00161D
        2300000000000000000000000000000000000000000000000000000000000000
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
        0000000000000000000000000000000000000000000000000000020202020202
        0202020202020202020202020202020202020202020202020202020202020202
        02505853020202020202020202020202572205184B0202020202020202020257
        1C120B045D0260600202020202572D4232240807615C60605A02020257201345
        460F0D094344340A0E5F524D1725263A3539374E1A212E0C0356595748101427
        3329283B192F1D11065557475738362316313F3C151B1E2A4C5E025757574140
        2C1F302B3D4F5B02020202020202024A513E4954020202020202020202020202
        0202020202020202020202020202020202020202020202020202020202020202
        0202020202020202020202020202020202020202020202020202}
      LookAndFeel.NativeStyle = False
    end
    object edtBuscaClienteFin: TcxButton
      Tag = 2
      Left = 380
      Top = 69
      Width = 66
      Height = 25
      Caption = 'Buscar'
      TabOrder = 5
      TabStop = False
      OnClick = edtBuscaClienteIniClick
      Colors.Default = clWhite
      Colors.Normal = clWhite
      Colors.Hot = clWhite
      Colors.Pressed = clWhite
      Colors.Disabled = clWhite
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000120B0000120B0000000100000000000000000000FFFF
        FF00FF00FF00623C230062442D005339240072503300CB925E00DAA97600836E
        5800695A4600FFCF8900C2AC8600D4D0C9000A0A0900EDFFFF00F8FFFF0064A5
        AD003692AD0051D4FF00EEFBFF000089BC0039CAFF005CD3FF00091114000493
        C9000C96CF000FA1DC001CBFFF001EC1FF0021BCFB0021BAFA002BC2FE0031C2
        FF002882A50057D0FF005DBAE0008CDDFF00C1EDFF00D0F2FF000075AA00027F
        B600129DDD0017A1E0001CB1F2001BADEB001AA5E0001FB7F8001FB4F4001EAF
        ED003FC5FE0045ABD7004AADD7004093B8007ACEF40072BBDD008AC5DE009DCC
        E200D0EBF700006FA5000173AA000774AC00087AB5000B84C0001498D700148A
        C5001697D50018445B0044ABDE0041A0D00099D3EF00AAD0E300BFE5F7000474
        AF00056BA5000B5B88000C4B6D001680B8002182B60000578A00035A91000464
        9E00046099000454860000518800002A470000243D0002558E0002416A000351
        8800033E640006609A000E6096000D24330000447600013B650000386C00161D
        2300000000000000000000000000000000000000000000000000000000000000
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
        0000000000000000000000000000000000000000000000000000020202020202
        0202020202020202020202020202020202020202020202020202020202020202
        02505853020202020202020202020202572205184B0202020202020202020257
        1C120B045D0260600202020202572D4232240807615C60605A02020257201345
        460F0D094344340A0E5F524D1725263A3539374E1A212E0C0356595748101427
        3329283B192F1D11065557475738362316313F3C151B1E2A4C5E025757574140
        2C1F302B3D4F5B02020202020202024A513E4954020202020202020202020202
        0202020202020202020202020202020202020202020202020202020202020202
        0202020202020202020202020202020202020202020202020202}
      LookAndFeel.NativeStyle = False
    end
    object edtFormaDeCompra: TcxImageComboBox
      Left = 448
      Top = 32
      TabStop = False
      Properties.Items = <>
      TabOrder = 6
      Width = 121
    end
    object edtDiaFacturar: TcxImageComboBox
      Left = 448
      Top = 72
      TabStop = False
      Properties.Items = <>
      TabOrder = 7
      Width = 121
    end
  end
  object gbCliente: TcxGroupBox
    Tag = 100
    Left = 24
    Top = 640
    Caption = '  Cliente  '
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 7
    Height = 65
    Width = 577
    object Label8: TLabel
      Left = 27
      Top = 30
      Width = 32
      Height = 13
      Caption = 'Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object edtCliente: TcxCurrencyEdit
      Tag = 3
      Left = 72
      Top = 27
      EditValue = '0'
      ParentFont = False
      Properties.DecimalPlaces = 0
      Properties.DisplayFormat = '0000'
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
      TabOrder = 0
      OnExit = edtClienteExit
      Width = 57
    end
    object edtNombreCliente: TcxTextEdit
      Left = 136
      Top = 27
      TabStop = False
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      Style.LookAndFeel.NativeStyle = False
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 1
      Width = 257
    end
    object cxButton1: TcxButton
      Tag = 3
      Left = 396
      Top = 24
      Width = 66
      Height = 25
      Caption = 'Buscar'
      TabOrder = 2
      OnClick = edtBuscaClienteIniClick
      Colors.Default = clWhite
      Colors.Normal = clWhite
      Colors.Hot = clWhite
      Colors.Pressed = clWhite
      Colors.Disabled = clWhite
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000120B0000120B0000000100000000000000000000FFFF
        FF00FF00FF00623C230062442D005339240072503300CB925E00DAA97600836E
        5800695A4600FFCF8900C2AC8600D4D0C9000A0A0900EDFFFF00F8FFFF0064A5
        AD003692AD0051D4FF00EEFBFF000089BC0039CAFF005CD3FF00091114000493
        C9000C96CF000FA1DC001CBFFF001EC1FF0021BCFB0021BAFA002BC2FE0031C2
        FF002882A50057D0FF005DBAE0008CDDFF00C1EDFF00D0F2FF000075AA00027F
        B600129DDD0017A1E0001CB1F2001BADEB001AA5E0001FB7F8001FB4F4001EAF
        ED003FC5FE0045ABD7004AADD7004093B8007ACEF40072BBDD008AC5DE009DCC
        E200D0EBF700006FA5000173AA000774AC00087AB5000B84C0001498D700148A
        C5001697D50018445B0044ABDE0041A0D00099D3EF00AAD0E300BFE5F7000474
        AF00056BA5000B5B88000C4B6D001680B8002182B60000578A00035A91000464
        9E00046099000454860000518800002A470000243D0002558E0002416A000351
        8800033E640006609A000E6096000D24330000447600013B650000386C00161D
        2300000000000000000000000000000000000000000000000000000000000000
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
        0000000000000000000000000000000000000000000000000000020202020202
        0202020202020202020202020202020202020202020202020202020202020202
        02505853020202020202020202020202572205184B0202020202020202020257
        1C120B045D0260600202020202572D4232240807615C60605A02020257201345
        460F0D094344340A0E5F524D1725263A3539374E1A212E0C0356595748101427
        3329283B192F1D11065557475738362316313F3C151B1E2A4C5E025757574140
        2C1F302B3D4F5B02020202020202024A513E4954020202020202020202020202
        0202020202020202020202020202020202020202020202020202020202020202
        0202020202020202020202020202020202020202020202020202}
      LookAndFeel.NativeStyle = False
    end
  end
  object gbRangoFechas: TcxGroupBox
    Tag = 100
    Left = 24
    Top = 112
    Caption = '  Rango de fechas  '
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 8
    Height = 57
    Width = 577
    object Label1: TLabel
      Left = 43
      Top = 25
      Width = 60
      Height = 13
      Caption = 'Fecha Inicial'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label2: TLabel
      Left = 312
      Top = 25
      Width = 55
      Height = 13
      Caption = 'Fecha Final'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object dtpInicial: TcxDateEdit
      Left = 114
      Top = 22
      ParentFont = False
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
      Properties.InputKind = ikMask
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      Style.TextColor = clNavy
      Style.IsFontAssigned = True
      TabOrder = 0
      Width = 88
    end
    object dtpFinal: TcxDateEdit
      Left = 384
      Top = 22
      ParentFont = False
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
      Properties.InputKind = ikMask
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      Style.TextColor = clNavy
      Style.IsFontAssigned = True
      TabOrder = 1
      Width = 88
    end
  end
  object gbFactura: TcxGroupBox
    Tag = 100
    Left = 608
    Top = 296
    Caption = '  Factura  '
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 9
    Height = 57
    Width = 577
    object Label12: TLabel
      Left = 251
      Top = 27
      Width = 88
      Height = 13
      Caption = 'N'#250'mero de factura'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label10: TLabel
      Left = 131
      Top = 27
      Width = 21
      Height = 13
      Caption = 'Seie'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object edtFactura: TcxCurrencyEdit
      Left = 344
      Top = 24
      EditValue = '1'
      ParentFont = False
      Properties.DecimalPlaces = 0
      Properties.DisplayFormat = '#'
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
      TabOrder = 0
      Width = 65
    end
    object edtSerie3: TcxImageComboBox
      Left = 160
      Top = 24
      TabStop = False
      Properties.Items = <>
      TabOrder = 1
      Width = 57
    end
  end
  object gbEstaciones: TcxGroupBox
    Tag = 100
    Left = 24
    Top = 480
    Caption = '  Estaciones  '
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 10
    Height = 57
    Width = 577
    object Label5: TLabel
      Left = 30
      Top = 27
      Width = 71
      Height = 13
      Caption = 'Estaci'#243'n Inicial'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label6: TLabel
      Left = 310
      Top = 27
      Width = 66
      Height = 13
      Caption = 'Estaci'#243'n Final'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object cxEstacionIni: TcxLookupComboBox
      Left = 114
      Top = 24
      Properties.KeyFieldNames = 'EstacionID'
      Properties.ListColumns = <
        item
          FieldName = 'EstacionID'
        end
        item
          FieldName = 'Nombre'
        end>
      Properties.ListSource = dsEstaciones
      TabOrder = 0
      Width = 172
    end
    object cxEstacionFin: TcxLookupComboBox
      Left = 386
      Top = 24
      Properties.KeyFieldNames = 'EstacionID'
      Properties.ListColumns = <
        item
          FieldName = 'EstacionID'
        end
        item
          FieldName = 'Nombre'
        end>
      Properties.ListSource = dsEstaciones
      TabOrder = 1
      Width = 172
    end
  end
  object gbTipoMov: TcxGroupBox
    Tag = 100
    Left = 24
    Top = 765
    Caption = '  Tipos de Movimiento  '
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 11
    Height = 65
    Width = 577
    object Label24: TLabel
      Left = 19
      Top = 32
      Width = 26
      Height = 13
      Caption = 'Tipos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object edtTipoMov: TcxTextEdit
      Left = 64
      Top = 28
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      Style.LookAndFeel.NativeStyle = False
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 0
      Width = 433
    end
  end
  object gbTarjetas: TcxGroupBox
    Tag = 100
    Left = 26
    Top = 312
    Caption = '  Tarjetas  '
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 12
    Height = 89
    Width = 577
    object Label14: TLabel
      Left = 27
      Top = 28
      Width = 72
      Height = 13
      Caption = 'Veh'#237'culo inicial'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label15: TLabel
      Left = 27
      Top = 60
      Width = 68
      Height = 13
      Caption = 'Veh'#237'culo Final'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object edtTarjetaIni: TcxCurrencyEdit
      Left = 128
      Top = 24
      EditValue = 0
      ParentFont = False
      Properties.DecimalPlaces = 0
      Properties.DisplayFormat = '0000'
      Properties.Nullable = False
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
      TabOrder = 0
      Width = 57
    end
    object edtTarjetaFin: TcxCurrencyEdit
      Left = 128
      Top = 56
      EditValue = '99999999'
      ParentFont = False
      Properties.DecimalPlaces = 0
      Properties.DisplayFormat = '0000'
      Properties.Nullable = False
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
      Width = 57
    end
    object edtVehiculoIni: TcxTextEdit
      Left = 192
      Top = 24
      TabStop = False
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 2
      Width = 225
    end
    object edtVehiculoFin: TcxTextEdit
      Left = 192
      Top = 56
      TabStop = False
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      Style.IsFontAssigned = True
      TabOrder = 3
      Width = 225
    end
  end
  object gbRangoDeFacturas: TcxGroupBox
    Tag = 100
    Left = 608
    Top = 171
    Caption = '  Rango de Facturas  '
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 13
    Visible = False
    Height = 65
    Width = 577
    object Label41: TLabel
      Left = 171
      Top = 27
      Width = 66
      Height = 13
      Caption = 'Factura Inicial'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label42: TLabel
      Left = 339
      Top = 27
      Width = 61
      Height = 13
      Caption = 'Factura Final'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label9: TLabel
      Left = 67
      Top = 27
      Width = 21
      Height = 13
      Caption = 'Seie'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object edtRangoFacturaIni: TcxCurrencyEdit
      Left = 256
      Top = 24
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
      Style.LookAndFeel.Kind = lfOffice11
      Style.LookAndFeel.NativeStyle = False
      Style.TextColor = clNavy
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.Kind = lfOffice11
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfOffice11
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfOffice11
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 0
      Width = 65
    end
    object edtRangoFacturaFin: TcxCurrencyEdit
      Left = 424
      Top = 24
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
      Style.LookAndFeel.Kind = lfOffice11
      Style.LookAndFeel.NativeStyle = False
      Style.TextColor = clNavy
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.Kind = lfOffice11
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfOffice11
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfOffice11
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 1
      Width = 65
    end
    object edtSerie: TcxImageComboBox
      Left = 100
      Top = 24
      Properties.Items = <>
      TabOrder = 2
      Width = 57
    end
  end
  object s: TcxButton
    Left = 216
    Top = 464
    Width = 82
    Height = 25
    Caption = 'Aceptar'
    TabOrder = 14
    OnClick = sClick
    Colors.Default = clWhite
    Colors.Normal = clWhite
    Colors.Hot = clWhite
    Colors.Pressed = clWhite
    Colors.Disabled = clWhite
    Glyph.Data = {
      36050000424D3605000000000000360400002800000010000000100000000100
      0800000000000001000000000000000000000001000000000000FF00FF00004B
      0000098611000A8615000D931A000C9518000C9C19000F991C000E9D1D001392
      240011A0210011A422001CA134001CB1350024BC430029B548002EC6520035CA
      5E0039D465000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000001
      0100000000000000000000000000010808010000000000000000000000010D0B
      080B0100000000000000000001100E0901040801000000000000000111120C01
      000103080100000000000000010F010000000001040100000000000000010000
      0000000001030100000000000000000000000000000001010000000000000000
      0000000000000001010000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000}
    LookAndFeel.NativeStyle = False
  end
  object btnCancelar: TcxButton
    Left = 304
    Top = 464
    Width = 82
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 15
    OnClick = btnCancelarClick
    Colors.Default = clWhite
    Colors.Normal = clWhite
    Colors.Hot = clWhite
    Colors.Pressed = clWhite
    Colors.Disabled = clWhite
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FF000288010893010B99010C99010893000389FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000186010D9D021CAF021FB402
      1FB5021FB5021FB2021CB0010F9F000287FF00FFFF00FFFF00FFFF00FFFF00FF
      00038A0118B2021FB7021EB1021DB1021DB1021DB1021DB1021EB2021FB40219
      AC00048EFF00FFFF00FFFF00FF0001830118BB0220CC011CBF0015B4011AB002
      1DB1021DB1011CB00015AD011BB0021FB4021AAC000287FF00FFFF00FF010CA7
      0121E0011CD30726CC4966D70B28BC0018B00019AF0622B44A66CE0D2BB7011B
      B0021FB5010F9FFF00FF000187011CDC0120ED0017DC3655E2FFFFFFA4B4ED05
      20BB0119B28B9EE1FFFFFF4E6ACF0014AC021EB2021CB000038900069A0120F8
      011FF6001DE9031FE1738BEEFFFFFFA0B1ED93A5E7FFFFFF91A4E20823B4011B
      B0021DB1021FB4010895020CAA0A2EFE0323FB011FF6001CEB0018E1788FF0FF
      FFFFFFFFFF96A7EA021BB50019AF021DB1021DB10220B5010C99040EAC294DFE
      0D30FB011FFA001CF7011CEE8EA1F4FFFFFFFFFFFFA6B6EE0520C20018B6021D
      B1021DB10220B5010B980208A04162FB2F51FC001EFA0725FA8AA0FEFFFFFF8E
      A3F67991F2FFFFFFA3B4EE0C29C6011BB8021DB4021FB2000793000189314FEF
      7690FF0F2DFA3354FBFFFFFF91A5FE021EF30017E7738BF3FFFFFF4765E00016
      C2021FBD021CB2000288FF00FF0C1BBC819AFF728BFE1134FA3456FB0526FA00
      1CFA001CF40220ED3353ED0625DA011DD00220CB010DA1FF00FFFF00FF000189
      2943E6A5B7FF849AFC2341FB0323FA011FFA011FFA001EF7011BEE021FE50121
      E20118BF000184FF00FFFF00FFFF00FF01038F2A45E693A9FFABBBFF758FFE49
      69FC3658FB3153FC2346FC092CF70118CB00038BFF00FFFF00FFFF00FFFF00FF
      FF00FF0001890F1DBF3E5BF36B87FE728CFF5E7BFE395BFB1231EB010FB50001
      84FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000189030AA306
      11B2050FB10107A0000188FF00FFFF00FFFF00FFFF00FFFF00FF}
    LookAndFeel.NativeStyle = False
  end
  object rgEstatusTarjetas: TcxRadioGroup
    Tag = 100
    Left = 608
    Top = 104
    Caption = ' Estatus Tarjetas '
    Properties.Columns = 4
    Properties.Items = <
      item
        Caption = 'Todas'
        Value = '0'
      end
      item
        Caption = 'Activas'
        Value = '1'
      end
      item
        Caption = 'Inactivas'
        Value = '2'
      end
      item
        Caption = 'Canceladas'
        Value = '3'
      end>
    ItemIndex = 0
    Style.LookAndFeel.NativeStyle = False
    Style.TextColor = clNavy
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 16
    Height = 65
    Width = 577
  end
  object rgEstatusClientes: TcxRadioGroup
    Tag = 100
    Left = 608
    Top = 32
    Caption = ' Estatus Clientes '
    ParentFont = False
    Properties.Columns = 4
    Properties.Items = <
      item
        Caption = 'Todos'
        Value = '0'
      end
      item
        Caption = 'Activos'
        Value = '1'
      end
      item
        Caption = 'Inactivos'
        Value = '2'
      end
      item
        Caption = 'Cancelados'
        Value = '3'
      end>
    ItemIndex = 0
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = []
    Style.LookAndFeel.NativeStyle = False
    Style.TextColor = clNavy
    Style.TextStyle = []
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 17
    Height = 65
    Width = 577
  end
  object pnlAntiguedad: TcxGroupBox
    Tag = 100
    Left = 380
    Top = 1088
    PanelStyle.Active = True
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 18
    Height = 329
    Width = 585
    object GroupBox1: TcxGroupBox
      Left = 4
      Top = 88
      Caption = '  Rango  '
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 0
      Height = 89
      Width = 577
      object lblRangoInicial: TLabel
        Left = 23
        Top = 28
        Width = 62
        Height = 13
        Caption = 'Cliente Inicial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object lblRangoFinal: TLabel
        Left = 23
        Top = 60
        Width = 57
        Height = 13
        Caption = 'Cliente Final'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object edtCodRangoInicial: TcxCurrencyEdit
        Tag = 4
        Left = 104
        Top = 24
        EditValue = '0'
        ParentFont = False
        Properties.DecimalPlaces = 0
        Properties.DisplayFormat = '0000'
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
        TabOrder = 0
        OnExit = edtClienteIniExit
        Width = 57
      end
      object edtDesRangoInicial: TcxTextEdit
        Tag = 4
        Left = 168
        Top = 24
        TabStop = False
        ParentFont = False
        Properties.CharCase = ecUpperCase
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = []
        Style.LookAndFeel.NativeStyle = False
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 1
        Width = 321
      end
      object btnBuscaRangoIni: TcxButton
        Tag = 4
        Left = 500
        Top = 22
        Width = 66
        Height = 25
        Caption = 'Buscar'
        TabOrder = 2
        OnClick = edtBuscaClienteIniClick
        Colors.Default = clWhite
        Colors.Normal = clWhite
        Colors.Hot = clWhite
        Colors.Pressed = clWhite
        Colors.Disabled = clWhite
        Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          08000000000000010000120B0000120B0000000100000000000000000000FFFF
          FF00FF00FF00623C230062442D005339240072503300CB925E00DAA97600836E
          5800695A4600FFCF8900C2AC8600D4D0C9000A0A0900EDFFFF00F8FFFF0064A5
          AD003692AD0051D4FF00EEFBFF000089BC0039CAFF005CD3FF00091114000493
          C9000C96CF000FA1DC001CBFFF001EC1FF0021BCFB0021BAFA002BC2FE0031C2
          FF002882A50057D0FF005DBAE0008CDDFF00C1EDFF00D0F2FF000075AA00027F
          B600129DDD0017A1E0001CB1F2001BADEB001AA5E0001FB7F8001FB4F4001EAF
          ED003FC5FE0045ABD7004AADD7004093B8007ACEF40072BBDD008AC5DE009DCC
          E200D0EBF700006FA5000173AA000774AC00087AB5000B84C0001498D700148A
          C5001697D50018445B0044ABDE0041A0D00099D3EF00AAD0E300BFE5F7000474
          AF00056BA5000B5B88000C4B6D001680B8002182B60000578A00035A91000464
          9E00046099000454860000518800002A470000243D0002558E0002416A000351
          8800033E640006609A000E6096000D24330000447600013B650000386C00161D
          2300000000000000000000000000000000000000000000000000000000000000
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
          0000000000000000000000000000000000000000000000000000020202020202
          0202020202020202020202020202020202020202020202020202020202020202
          02505853020202020202020202020202572205184B0202020202020202020257
          1C120B045D0260600202020202572D4232240807615C60605A02020257201345
          460F0D094344340A0E5F524D1725263A3539374E1A212E0C0356595748101427
          3329283B192F1D11065557475738362316313F3C151B1E2A4C5E025757574140
          2C1F302B3D4F5B02020202020202024A513E4954020202020202020202020202
          0202020202020202020202020202020202020202020202020202020202020202
          0202020202020202020202020202020202020202020202020202}
        LookAndFeel.NativeStyle = False
      end
      object edtCodRangoFinal: TcxCurrencyEdit
        Tag = 5
        Left = 104
        Top = 56
        EditValue = '9999'
        ParentFont = False
        Properties.DecimalPlaces = 0
        Properties.DisplayFormat = '0000'
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
        TabOrder = 3
        OnExit = edtClienteIniExit
        Width = 57
      end
      object edtDesRangoFinal: TcxTextEdit
        Tag = 5
        Left = 168
        Top = 56
        TabStop = False
        ParentFont = False
        Properties.CharCase = ecUpperCase
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = []
        Style.LookAndFeel.NativeStyle = False
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 4
        Width = 321
      end
      object btnBuscaRangoFin: TcxButton
        Tag = 5
        Left = 500
        Top = 54
        Width = 66
        Height = 25
        Caption = 'Buscar'
        TabOrder = 5
        OnClick = edtBuscaClienteIniClick
        Colors.Default = clWhite
        Colors.Normal = clWhite
        Colors.Hot = clWhite
        Colors.Pressed = clWhite
        Colors.Disabled = clWhite
        Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          08000000000000010000120B0000120B0000000100000000000000000000FFFF
          FF00FF00FF00623C230062442D005339240072503300CB925E00DAA97600836E
          5800695A4600FFCF8900C2AC8600D4D0C9000A0A0900EDFFFF00F8FFFF0064A5
          AD003692AD0051D4FF00EEFBFF000089BC0039CAFF005CD3FF00091114000493
          C9000C96CF000FA1DC001CBFFF001EC1FF0021BCFB0021BAFA002BC2FE0031C2
          FF002882A50057D0FF005DBAE0008CDDFF00C1EDFF00D0F2FF000075AA00027F
          B600129DDD0017A1E0001CB1F2001BADEB001AA5E0001FB7F8001FB4F4001EAF
          ED003FC5FE0045ABD7004AADD7004093B8007ACEF40072BBDD008AC5DE009DCC
          E200D0EBF700006FA5000173AA000774AC00087AB5000B84C0001498D700148A
          C5001697D50018445B0044ABDE0041A0D00099D3EF00AAD0E300BFE5F7000474
          AF00056BA5000B5B88000C4B6D001680B8002182B60000578A00035A91000464
          9E00046099000454860000518800002A470000243D0002558E0002416A000351
          8800033E640006609A000E6096000D24330000447600013B650000386C00161D
          2300000000000000000000000000000000000000000000000000000000000000
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
          0000000000000000000000000000000000000000000000000000020202020202
          0202020202020202020202020202020202020202020202020202020202020202
          02505853020202020202020202020202572205184B0202020202020202020257
          1C120B045D0260600202020202572D4232240807615C60605A02020257201345
          460F0D094344340A0E5F524D1725263A3539374E1A212E0C0356595748101427
          3329283B192F1D11065557475738362316313F3C151B1E2A4C5E025757574140
          2C1F302B3D4F5B02020202020202024A513E4954020202020202020202020202
          0202020202020202020202020202020202020202020202020202020202020202
          0202020202020202020202020202020202020202020202020202}
        LookAndFeel.NativeStyle = False
      end
    end
    object GroupBox2: TcxGroupBox
      Left = 4
      Top = 192
      Caption = '  Fecha de Corte  '
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 1
      Height = 49
      Width = 121
      object dtpFechaCorte: TcxDateEdit
        Left = 17
        Top = 18
        ParentFont = False
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
        Properties.InputKind = ikMask
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = []
        Style.TextColor = clNavy
        Style.IsFontAssigned = True
        TabOrder = 0
        Width = 88
      end
    end
    object gbGrupoAntiguedad: TcxGroupBox
      Tag = 888
      Left = 388
      Top = 256
      Caption = '  Grupo  '
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 2
      Visible = False
      Height = 49
      Width = 193
      object dbcGrupoAntiguedad: TcxLookupComboBox
        Left = 8
        Top = 18
        ParentFont = False
        Properties.CharCase = ecUpperCase
        Properties.KeyFieldNames = 'Grupo'
        Properties.ListColumns = <
          item
            FieldName = 'Grupo'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = dsGrupo
        EditValue = ''
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = []
        Style.IsFontAssigned = True
        TabOrder = 0
        Width = 177
      end
    end
    object GroupBox3: TcxGroupBox
      Left = 132
      Top = 191
      Caption = '  D'#237'as de Vencimiento  '
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 3
      Height = 49
      Width = 449
      object Label16: TLabel
        Left = 88
        Top = 24
        Width = 37
        Height = 13
        Caption = 'Venc. a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label17: TLabel
        Left = 178
        Top = 24
        Width = 37
        Height = 13
        Caption = 'Venc. a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label18: TLabel
        Left = 272
        Top = 24
        Width = 37
        Height = 13
        Caption = 'Venc. a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label19: TLabel
        Left = 359
        Top = 24
        Width = 37
        Height = 13
        Caption = 'Venc. a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object Label43: TLabel
        Left = 11
        Top = 24
        Width = 25
        Height = 13
        Caption = 'Inicio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
      end
      object edtVenc0: TcxCurrencyEdit
        Left = 48
        Top = 20
        EditValue = 1
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
        TabOrder = 0
        Width = 33
      end
      object edtVenc1: TcxCurrencyEdit
        Left = 137
        Top = 20
        EditValue = 15
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
        Width = 33
      end
      object edtVenc2: TcxCurrencyEdit
        Left = 228
        Top = 20
        EditValue = 30
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
        Width = 33
      end
      object edtVenc3: TcxCurrencyEdit
        Left = 322
        Top = 20
        EditValue = 45
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
        TabOrder = 3
        Width = 33
      end
      object edtVenc4: TcxCurrencyEdit
        Left = 408
        Top = 20
        EditValue = 60
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
        TabOrder = 4
        Width = 33
      end
    end
    object rgSeleccion: TcxRadioGroup
      Left = 4
      Top = 24
      Caption = ' Selecci'#243'n '
      Properties.Columns = 3
      Properties.Items = <
        item
          Caption = 'N'#250'mero de Cliente'
          Value = '0'
        end
        item
          Caption = 'D'#237'a a Facturar'
          Value = '1'
        end
        item
          Caption = 'Agente'
          Value = '2'
        end>
      ItemIndex = 0
      Style.LookAndFeel.NativeStyle = False
      Style.TextColor = clNavy
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 4
      Height = 49
      Width = 377
    end
    object rgEstatus: TcxRadioGroup
      Left = 388
      Top = 24
      Caption = ' Estatus Facturas '
      Properties.Columns = 3
      Properties.Items = <
        item
          Caption = 'Todas'
          Value = '0'
        end
        item
          Caption = 'Solo Vencidas'
          Value = '1'
        end>
      ItemIndex = 0
      Style.LookAndFeel.NativeStyle = False
      Style.TextColor = clNavy
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 5
      Height = 49
      Width = 193
    end
    object rgOrden: TcxRadioGroup
      Left = 4
      Top = 256
      Caption = ' Ordenado Por '
      Properties.Columns = 3
      Properties.Items = <
        item
          Caption = 'N'#250'mero de Cliente'
          Value = '0'
        end
        item
          Caption = 'Nombre del Cliente'
          Value = '1'
        end
        item
          Caption = 'Saldo'
          Value = '2'
        end>
      ItemIndex = 0
      Style.LookAndFeel.NativeStyle = False
      Style.TextColor = clNavy
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 6
      Height = 49
      Width = 377
    end
  end
  object gbTipoFecha: TcxRadioGroup
    Tag = 100
    Left = 24
    Top = 32
    Caption = ' Tipo de Fecha '
    Properties.Columns = 3
    Properties.DefaultValue = '0'
    Properties.Items = <
      item
        Caption = 'Fecha de Carga'
        Value = '0'
      end
      item
        Caption = 'Fecha Contable'
        Value = '1'
      end>
    ItemIndex = 0
    Style.LookAndFeel.NativeStyle = False
    Style.TextColor = clNavy
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 19
    Height = 57
    Width = 577
  end
  object gbPeriodos: TcxGroupBox
    Left = 607
    Top = 231
    Caption = '  Rango de Periodos '
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 20
    Visible = False
    Height = 63
    Width = 579
    object Label11: TLabel
      Left = 8
      Top = 29
      Width = 40
      Height = 13
      Caption = 'Ejercicio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label13: TLabel
      Left = 125
      Top = 29
      Width = 66
      Height = 13
      Caption = 'Periodo Inicial'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label20: TLabel
      Left = 358
      Top = 29
      Width = 61
      Height = 13
      Caption = 'Periodo Final'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object edtEjercicio: TcxSpinEdit
      Left = 54
      Top = 26
      Properties.MaxValue = 2006.000000000000000000
      Properties.MinValue = 2006.000000000000000000
      TabOrder = 0
      Value = 2006
      Width = 57
    end
    object cbPeriodoIni: TcxImageComboBox
      Left = 197
      Top = 26
      Properties.Items = <
        item
          Description = 'ENERO'
          ImageIndex = 0
          Value = 1
        end
        item
          Description = 'FEBRERO'
          Value = 2
        end
        item
          Description = 'MARZO'
          Value = 3
        end
        item
          Description = 'ABRIL'
          Value = 4
        end
        item
          Description = 'MAYO'
          Value = 5
        end
        item
          Description = 'JUNIO'
          Value = 6
        end
        item
          Description = 'JULIO'
          Value = 7
        end
        item
          Description = 'AGOSTO'
          Value = 8
        end
        item
          Description = 'SEPTIEMBRE'
          Value = 9
        end
        item
          Description = 'OCTUBRE'
          Value = 10
        end
        item
          Description = 'NOVIEMBRE'
          Value = 11
        end
        item
          Description = 'DICIEMBRE'
          Value = 12
        end>
      TabOrder = 1
      Width = 145
    end
    object cbPeriodoFin: TcxImageComboBox
      Left = 425
      Top = 26
      Properties.Items = <
        item
          Description = 'ENERO'
          ImageIndex = 0
          Value = 1
        end
        item
          Description = 'FEBRERO'
          Value = 2
        end
        item
          Description = 'MARZO'
          Value = 3
        end
        item
          Description = 'ABRIL'
          Value = 4
        end
        item
          Description = 'MAYO'
          Value = 5
        end
        item
          Description = 'JUNIO'
          Value = 6
        end
        item
          Description = 'JULIO'
          Value = 7
        end
        item
          Description = 'AGOSTO'
          Value = 8
        end
        item
          Description = 'SEPTIEMBRE'
          Value = 9
        end
        item
          Description = 'OCTUBRE'
          Value = 10
        end
        item
          Description = 'NOVIEMBRE'
          Value = 11
        end
        item
          Description = 'DICIEMBRE'
          Value = 12
        end>
      TabOrder = 2
      Width = 145
    end
  end
  object dxRibbon1: TdxRibbon
    Left = 0
    Top = 0
    Width = 1472
    Height = 24
    BarManager = frmPrincipal.dxBarManager1
    ColorSchemeName = 'Blue'
    ShowTabHeaders = False
    SupportNonClientDrawing = True
    Contexts = <>
    TabOrder = 21
    TabStop = False
    object dxRibbon1Tab1: TdxRibbonTab
      Caption = 'dxRibbon1Tab1'
      Groups = <>
      Visible = False
      Index = 0
    end
  end
  object gbSecuencias: TcxGroupBox
    Tag = 100
    Left = 27
    Top = 856
    Caption = '  Secuencias  '
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 22
    Height = 65
    Width = 577
    object Label21: TLabel
      Left = 69
      Top = 28
      Width = 80
      Height = 13
      Caption = 'Secuencia inicial'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label22: TLabel
      Left = 314
      Top = 28
      Width = 76
      Height = 13
      Caption = 'Secuencia Final'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object edtSecueciaIni: TcxCurrencyEdit
      Left = 170
      Top = 25
      EditValue = 0
      ParentFont = False
      Properties.AssignedValues.DisplayFormat = True
      Properties.DecimalPlaces = 0
      Properties.Nullable = False
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
      TabOrder = 0
      Width = 101
    end
    object edtSecuenciaFin: TcxCurrencyEdit
      Left = 415
      Top = 25
      EditValue = 0.000000000000000000
      ParentFont = False
      Properties.AssignedValues.DisplayFormat = True
      Properties.DecimalPlaces = 0
      Properties.Nullable = False
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
      Width = 100
    end
  end
  object gbRecibo: TcxGroupBox
    Tag = 100
    Left = 607
    Top = 824
    Caption = 'Numero de Recibo'
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 23
    Height = 65
    Width = 585
    object Label23: TLabel
      Left = 19
      Top = 32
      Width = 34
      Height = 13
      Caption = 'Recibo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object cxReciboID: TcxTextEdit
      Left = 64
      Top = 28
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      Style.LookAndFeel.NativeStyle = False
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 0
      Width = 129
    end
  end
  object cdsDiaFacturar: TDACDSDataTable
    RemoteUpdatesOptions = []
    Fields = <
      item
        Name = 'GrupoFacturarID'
        DataType = datInteger
        Required = True
        InPrimaryKey = True
      end
      item
        Name = 'Nombre'
        DataType = datString
        Size = 50
        Required = True
      end>
    Params = <>
    MasterMappingMode = mmDataRequest
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = DMFlotillas.RemoteDataAdapter
    LogicalName = 'dbo GrupoFacturar'
    IndexDefs = <>
    Left = 328
    Top = 232
  end
  object cdsGrupo: TDACDSDataTable
    RemoteUpdatesOptions = []
    Fields = <
      item
        Name = 'Grupo'
        DataType = datString
        Size = 50
      end>
    Params = <>
    MasterMappingMode = mmDataRequest
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = DMFlotillas.RemoteDataAdapter
    LogicalName = 'Grupos'
    IndexDefs = <>
    Left = 296
    Top = 232
  end
  object dsGrupo: TDADataSource
    DataSet = cdsGrupo.Dataset
    DataTable = cdsGrupo
    Left = 296
    Top = 264
  end
  object cdsTipoTarjeta: TDACDSDataTable
    RemoteUpdatesOptions = []
    Fields = <
      item
        Name = 'FormaCompraID'
        DataType = datInteger
      end
      item
        Name = 'Nombre'
        DataType = datString
        Size = 50
      end>
    Params = <>
    MasterMappingMode = mmDataRequest
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = DMFlotillas.RemoteDataAdapter
    LogicalName = 'dbo FormaCompra'
    IndexDefs = <>
    Left = 360
    Top = 232
  end
  object cdsSerie: TDACDSDataTable
    RemoteUpdatesOptions = []
    Fields = <
      item
        Name = 'Serie'
        DataType = datString
        Size = 5
      end>
    Params = <>
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = DMFlotillas.RemoteDataAdapter
    LogicalName = 'dbo Serie'
    IndexDefs = <>
    Left = 552
    Top = 160
  end
  object dsSerie: TDADataSource
    DataSet = cdsSerie.Dataset
    DataTable = cdsSerie
    Left = 552
    Top = 192
  end
  object cdsEstaciones: TDACDSDataTable
    RemoteUpdatesOptions = []
    Fields = <
      item
        Name = 'EstacionID'
        DataType = datInteger
        Required = True
        InPrimaryKey = True
      end
      item
        Name = 'Nombre'
        DataType = datString
        Size = 30
        Required = True
      end
      item
        Name = 'RazonSocial'
        DataType = datString
        Size = 70
      end
      item
        Name = 'RFC'
        DataType = datString
        Size = 20
      end
      item
        Name = 'ClavePemex'
        DataType = datString
        Size = 15
      end
      item
        Name = 'Estatus'
        DataType = datString
        Size = 1
        Required = True
      end
      item
        Name = 'CuentaContable'
        DataType = datString
        Size = 50
      end
      item
        Name = 'CuentaIVANoCobrado'
        DataType = datString
        Size = 50
      end
      item
        Name = 'CuentaIVACobrado'
        DataType = datString
        Size = 50
      end
      item
        Name = 'CuentaVentas'
        DataType = datString
        Size = 50
      end
      item
        Name = 'IVA'
        DataType = datFloat
      end
      item
        Name = 'GasolineroID'
        DataType = datInteger
        Required = True
      end>
    Params = <>
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = DMFlotillas.RemoteDataAdapter
    LogicalName = 'dbo Estacion'
    IndexDefs = <>
    Left = 520
    Top = 496
  end
  object dsEstaciones: TDADataSource
    DataSet = cdsEstaciones.Dataset
    DataTable = cdsEstaciones
    Left = 552
    Top = 496
  end
end
