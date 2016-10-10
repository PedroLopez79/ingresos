object frmPantallaParametrosExporta: TfrmPantallaParametrosExporta
  Left = 156
  Top = -18
  BorderStyle = bsDialog
  Caption = 'frmPantallaParametrosExporta'
  ClientHeight = 815
  ClientWidth = 1196
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object gbHora: TcxGroupBox
    Tag = 100
    Left = 25
    Top = 123
    Hint = ''
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
      Hint = ''
      EditValue = 0d
      Style.LookAndFeel.Kind = lfOffice11
      Style.LookAndFeel.NativeStyle = False
      Style.TextColor = clNavy
      StyleDisabled.LookAndFeel.Kind = lfOffice11
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfOffice11
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfOffice11
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 0
      Width = 73
    end
    object edtHoraFin: TcxTimeEdit
      Left = 330
      Top = 24
      Hint = ''
      EditValue = 0.999988425925926d
      Style.LookAndFeel.Kind = lfOffice11
      Style.LookAndFeel.NativeStyle = False
      Style.TextColor = clNavy
      StyleDisabled.LookAndFeel.Kind = lfOffice11
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfOffice11
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfOffice11
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 1
      Width = 72
    end
  end
  object gbRangoFechas: TcxGroupBox
    Tag = 100
    Left = 25
    Top = 48
    Hint = ''
    Caption = '  Rango de fechas  '
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 1
    Height = 65
    Width = 577
    object Label1: TLabel
      Left = 43
      Top = 30
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
      Top = 30
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
      Left = 120
      Top = 26
      Hint = ''
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
      Width = 88
    end
    object dtpFinal: TcxDateEdit
      Left = 384
      Top = 26
      Hint = ''
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
      Width = 88
    end
  end
  object gbTurnos: TcxGroupBox
    Tag = 100
    Left = 25
    Top = 208
    Hint = ''
    Caption = '  Turnos  '
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 0
    Height = 65
    Width = 577
    object Label12: TLabel
      Left = 56
      Top = 27
      Width = 58
      Height = 13
      Caption = 'Turno Inicial'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label3: TLabel
      Left = 280
      Top = 27
      Width = 53
      Height = 13
      Caption = 'Turno Final'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object edtTurnoIni: TcxCurrencyEdit
      Left = 128
      Top = 24
      Hint = ''
      EditValue = '1'
      ParentFont = False
      Properties.DecimalPlaces = 0
      Properties.DisplayFormat = '#'
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
    object edtTurnoFin: TcxCurrencyEdit
      Left = 352
      Top = 24
      Hint = ''
      EditValue = '1'
      ParentFont = False
      Properties.DecimalPlaces = 0
      Properties.DisplayFormat = '#'
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
  end
  object btnAceptar: TcxButton
    Left = 208
    Top = 408
    Width = 82
    Height = 25
    Caption = 'Aceptar'
    Colors.Default = clWhite
    Colors.Normal = clWhite
    Colors.Hot = clWhite
    Colors.Pressed = clWhite
    Colors.Disabled = clWhite
    LookAndFeel.NativeStyle = False
    OptionsImage.Glyph.Data = {
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
    TabOrder = 3
    OnClick = btnAceptarClick
  end
  object btnCancelar: TcxButton
    Left = 296
    Top = 408
    Width = 82
    Height = 25
    Caption = 'Cancelar'
    Colors.Default = clWhite
    Colors.Normal = clWhite
    Colors.Hot = clWhite
    Colors.Pressed = clWhite
    Colors.Disabled = clWhite
    LookAndFeel.NativeStyle = False
    OptionsImage.Glyph.Data = {
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
    TabOrder = 4
    OnClick = btnCancelarClick
  end
  object dxRibbon1: TdxRibbon
    Left = 0
    Top = 0
    Width = 1196
    Height = 24
    Hint = ''
    BarManager = frmPrincipal.dxBarManager1
    ColorSchemeName = 'Blue'
    ShowTabHeaders = False
    SupportNonClientDrawing = True
    Contexts = <>
    TabOrder = 5
    TabStop = False
  end
  object gbEstaciones: TcxGroupBox
    Tag = 100
    Left = 25
    Top = 304
    Hint = ''
    Caption = '  Estaciones  '
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 6
    Height = 65
    Width = 577
    object Label4: TLabel
      Left = 32
      Top = 27
      Width = 71
      Height = 13
      Caption = 'Estacion Inicial'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label5: TLabel
      Left = 304
      Top = 27
      Width = 66
      Height = 13
      Caption = 'Estacion Final'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object cbEstacionIni: TcxLookupComboBox
      Left = 112
      Top = 24
      Hint = ''
      Properties.DropDownWidth = 300
      Properties.KeyFieldNames = 'NUMEROESTACION'
      Properties.ListColumns = <
        item
          FieldName = 'EMPRESA'
        end
        item
          FieldName = 'NUMEROESTACION'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsEstaciones
      TabOrder = 0
      OnExit = cbEstacionIniExit
      Width = 153
    end
    object cbEstacionFin: TcxLookupComboBox
      Left = 376
      Top = 24
      Hint = ''
      Properties.DropDownWidth = 300
      Properties.KeyFieldNames = 'NUMEROESTACION'
      Properties.ListColumns = <
        item
          FieldName = 'EMPRESA'
        end
        item
          FieldName = 'NUMEROESTACION'
        end>
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dsEstaciones
      TabOrder = 1
      Width = 153
    end
  end
  object gbPoliza: TcxGroupBox
    Tag = 100
    Left = 25
    Top = 456
    Hint = ''
    Caption = '  Poliza  '
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 7
    Height = 65
    Width = 577
    object Label6: TLabel
      Left = 43
      Top = 27
      Width = 83
      Height = 13
      Caption = 'N'#250'mero de P'#243'liza'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object edtPoliza: TcxCurrencyEdit
      Left = 136
      Top = 24
      Hint = ''
      EditValue = '1'
      ParentFont = False
      Properties.DecimalPlaces = 0
      Properties.DisplayFormat = '#'
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
  end
  object cdsEstaciones: TDAMemDataTable
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
    IndexDefs = <>
    Left = 544
    Top = 408
  end
  object dsEstaciones: TDADataSource
    DataSet = cdsEstaciones.Dataset
    DataTable = cdsEstaciones
    Left = 576
    Top = 408
  end
end
