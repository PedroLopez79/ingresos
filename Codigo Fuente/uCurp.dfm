object Fo_AyudaCurp: TFo_AyudaCurp
  Left = 303
  Top = 281
  Caption = 'Ayuda Curp'
  ClientHeight = 264
  ClientWidth = 341
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 341
    Height = 233
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 18
      Width = 50
      Height = 13
      Caption = 'Apellido P.'
    end
    object Label2: TLabel
      Left = 8
      Top = 42
      Width = 52
      Height = 13
      Caption = 'Apellido M.'
    end
    object Label3: TLabel
      Left = 8
      Top = 68
      Width = 48
      Height = 13
      Caption = 'Nombre(s)'
    end
    object Label4: TLabel
      Left = 8
      Top = 101
      Width = 56
      Height = 13
      Caption = 'Fecha Nac.'
    end
    object Label5: TLabel
      Left = 8
      Top = 126
      Width = 24
      Height = 13
      Caption = 'Sexo'
    end
    object Label6: TLabel
      Left = 8
      Top = 153
      Width = 36
      Height = 13
      Caption = 'Entidad'
    end
    object Bevel1: TBevel
      Left = 4
      Top = 173
      Width = 330
      Height = 10
      Shape = bsBottomLine
    end
    object Ed_ApellidoPat: TEdit
      Left = 64
      Top = 13
      Width = 265
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
    end
    object Ed_ApellidoMat: TEdit
      Left = 64
      Top = 37
      Width = 265
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
    end
    object Ed_Nombre: TEdit
      Left = 64
      Top = 62
      Width = 265
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 2
    end
    object FechaNac: TDateTimePicker
      Left = 65
      Top = 94
      Width = 143
      Height = 21
      Date = 38746.466200625000000000
      Time = 38746.466200625000000000
      TabOrder = 3
    end
    object Button1: TButton
      Left = 8
      Top = 192
      Width = 75
      Height = 25
      Caption = 'Calcular'
      TabOrder = 4
      OnClick = Button1Click
    end
    object Ed_Curp: TEdit
      Left = 88
      Top = 195
      Width = 241
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 5
    end
    object CB_Sexo: TComboBox
      Left = 64
      Top = 120
      Width = 145
      Height = 21
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 6
      Text = '0: Masculino'
      Items.Strings = (
        '0: Masculino'
        '1: Femenino')
    end
    object CB_Entidad: TComboBox
      Left = 64
      Top = 146
      Width = 265
      Height = 21
      ItemHeight = 13
      TabOrder = 7
      Items.Strings = (
        'AS: AGUASCALIENTES'
        'BC: BAJA CALIFORNIA'
        'BS: BAJA CALIFORNIA SUR'
        'CC: CAMPECHE'
        'CS: CHIAPAS'
        'CH: CHIHUAHUA'
        'CL: COAHUILA'
        'CM: COLIMA'
        'DF: DISTRITO FEDERAL'
        'DG: DURANGO'
        'GT: GUANAJUATO'
        'GR: GUERRERO'
        'HG: HIDALGO'
        'JL: JALISCO'
        'MC: MEXICO'
        'MN: MICHOACAN'
        'MS: MORELOS'
        'NT: NAYARIT'
        'NL: NUEVO LEON'
        'OC: OAXACA'
        'PL: PUEBLA'
        'QT: QUERETARO'
        'QR: QUINTANA ROO'
        'SP: SAN LUIS POTOSI'
        'SL: SINALOA'
        'SR: SONORA'
        'TC: TABASCO'
        'TS: TAMAULIPAS'
        'TL: TLAXCALA'
        'VZ: VERACRUZ'
        'YN: YUCATAN'
        'ZS: ZACATECAS'
        'NE: EXTRANJERO')
    end
  end
  object Pa_ayuda: TPanel
    Left = 0
    Top = 233
    Width = 341
    Height = 31
    Align = alBottom
    TabOrder = 1
    object Button2: TButton
      Left = 254
      Top = 3
      Width = 75
      Height = 25
      Caption = 'Aceptar'
      TabOrder = 0
      OnClick = Button2Click
    end
  end
end
