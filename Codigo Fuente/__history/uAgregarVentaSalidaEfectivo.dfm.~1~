object Fo_AgregarVentaEfectivo: TFo_AgregarVentaEfectivo
  Left = 303
  Top = 281
  BorderStyle = bsDialog
  Caption = 'Agregar Efectivo'
  ClientHeight = 221
  ClientWidth = 354
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
    Width = 354
    Height = 156
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
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
    object Label10: TLabel
      Left = 9
      Top = 71
      Width = 51
      Height = 13
      Caption = 'Cantidad'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 153
      Top = 48
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
    object edtCantidad: TcxCurrencyEdit
      Left = 66
      Top = 68
      Hint = ''
      EditValue = 0
      Properties.DecimalPlaces = 0
      Properties.DisplayFormat = '0'
      Properties.Nullable = False
      Properties.ReadOnly = False
      Properties.OnEditValueChanged = edtCantidadPropertiesEditValueChanged
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
    object edtImporte: TcxCurrencyEdit
      Left = 153
      Top = 67
      Hint = ''
      EditValue = 0c
      Enabled = False
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
      TabOrder = 1
      Width = 180
    end
    object cbDescripcionTipoComprobacion: TcxLookupComboBox
      Left = 82
      Top = 21
      Hint = ''
      Properties.KeyFieldNames = 'IDTIPOCOMPROBACION'
      Properties.ListColumns = <
        item
          FieldName = 'DESCRIPCION'
        end>
      Properties.ListSource = dsTipoValor
      TabOrder = 2
      Width = 251
    end
  end
  object Pa_ayuda: TPanel
    Left = 0
    Top = 180
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
  object dsTipoValor: TDADataSource
    DataSet = cdsTipoComprobacion.Dataset
    DataTable = cdsTipoComprobacion
    Left = 302
    Top = 129
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
    Left = 246
    Top = 129
  end
end
