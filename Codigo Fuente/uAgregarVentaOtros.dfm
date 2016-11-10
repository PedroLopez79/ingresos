object Fo_AgregarVentaOtros: TFo_AgregarVentaOtros
  Left = 303
  Top = 281
  BorderStyle = bsDialog
  Caption = 'Agregar Venta Otros'
  ClientHeight = 214
  ClientWidth = 534
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 24
    Width = 534
    Height = 149
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    ExplicitHeight = 124
    object Label11: TLabel
      Left = 8
      Top = 109
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
    object Label3: TLabel
      Left = 8
      Top = 68
      Width = 63
      Height = 13
      Caption = 'Referencia'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 8
      Top = 24
      Width = 107
      Height = 13
      Caption = 'Descripcion Salida'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 339
      Top = 24
      Width = 45
      Height = 13
      Caption = '#Ticket'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtImporte: TcxCurrencyEdit
      Left = 121
      Top = 106
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
      Width = 81
    end
    object cbSalida: TcxLookupComboBox
      Left = 121
      Top = 21
      Hint = ''
      Properties.KeyFieldNames = 'IDSALIDA'
      Properties.ListColumns = <
        item
          FieldName = 'NOMBRE'
        end>
      Properties.ListSource = dsSalida
      TabOrder = 1
      Width = 212
    end
    object edtReferenciaCliente: TcxTextEdit
      Left = 121
      Top = 65
      Hint = ''
      TabOrder = 2
      Width = 180
    end
    object edtNumTicket: TcxCurrencyEdit
      Left = 390
      Top = 21
      Hint = ''
      EditValue = 0
      Properties.DecimalPlaces = 0
      Properties.DisplayFormat = '#'
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
      TabOrder = 3
      Width = 128
    end
  end
  object Pa_ayuda: TPanel
    Left = 0
    Top = 173
    Width = 534
    Height = 41
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    ExplicitTop = 148
    object Button2: TButton
      Left = 363
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Aceptar'
      TabOrder = 0
      OnClick = Button2Click
    end
    object Button1: TButton
      Left = 444
      Top = 6
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
    Width = 534
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
    Left = 406
    Top = 97
  end
  object dsSalida: TDADataSource
    DataSet = cdsSalida.Dataset
    DataTable = cdsSalida
    Left = 470
    Top = 97
  end
end
