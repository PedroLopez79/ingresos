object Fo_AgregarVentaSalidaEfectivo: TFo_AgregarVentaSalidaEfectivo
  Left = 303
  Top = 281
  BorderStyle = bsDialog
  Caption = 'Agregar Salida de Efectivo'
  ClientHeight = 186
  ClientWidth = 354
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 24
    Width = 354
    Height = 121
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    ExplicitHeight = 156
    object Label7: TLabel
      Left = 8
      Top = 24
      Width = 68
      Height = 13
      Caption = 'Descripcion'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 8
      Top = 71
      Width = 43
      Height = 13
      Caption = 'Importe'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtImporte: TcxCurrencyEdit
      Left = 82
      Top = 68
      Hint = ''
      EditValue = 0c
      Properties.DecimalPlaces = 0
      Properties.DisplayFormat = '$#0.00'
      Properties.Nullable = False
      Properties.ReadOnly = False
      Style.BorderStyle = ebsOffice11
      Style.LookAndFeel.Kind = lfOffice11
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.Kind = lfOffice11
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.Kind = lfOffice11
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.Kind = lfOffice11
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 0
      Width = 103
    end
    object edtDescripcionTipoComprobacion: TcxTextEdit
      Left = 82
      Top = 21
      Hint = ''
      TabOrder = 1
      Width = 251
    end
  end
  object Pa_ayuda: TPanel
    Left = 0
    Top = 145
    Width = 354
    Height = 41
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    ExplicitTop = 180
    object Button2: TButton
      Left = 182
      Top = 3
      Width = 75
      Height = 25
      Caption = 'Aceptar'
      TabOrder = 0
      OnClick = Button2Click
    end
    object Button1: TButton
      Left = 263
      Top = 3
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = Button1Click
    end
  end
  object dxRibbon1: TdxRibbon
    Left = 0
    Top = 0
    Width = 354
    Height = 24
    Hint = ''
    BarManager = frmPrincipal.dxBarManager1
    ColorSchemeName = 'Blue'
    ShowTabHeaders = False
    SupportNonClientDrawing = True
    Contexts = <>
    TabOrder = 2
    TabStop = False
    object dxRibbon1Tab1: TdxRibbonTab
      Caption = 'dxRibbon1Tab1'
      Groups = <>
      Visible = False
      Index = 0
    end
  end
end