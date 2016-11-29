object Fo_TurnoxFecha: TFo_TurnoxFecha
  Left = 303
  Top = 281
  BorderStyle = bsNone
  Caption = 'Secuencias x Fecha'
  ClientHeight = 159
  ClientWidth = 237
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
    Top = 24
    Width = 237
    Height = 104
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    ExplicitTop = 21
    ExplicitWidth = 238
    ExplicitHeight = 125
    object Label6: TLabel
      Left = 8
      Top = 6
      Width = 67
      Height = 13
      Caption = 'Secuencias'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Bevel1: TBevel
      Left = 8
      Top = 53
      Width = 217
      Height = 10
      Shape = bsBottomLine
    end
    object Label4: TLabel
      Left = 174
      Top = 64
      Width = 19
      Height = 36
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -31
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Label5: TLabel
      Left = 8
      Top = 76
      Width = 127
      Height = 13
      Caption = '# DE LA SECUENCIA:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object CBB_Turnos: TComboBox
      Left = 8
      Top = 25
      Width = 217
      Height = 22
      Style = csOwnerDrawFixed
      TabOrder = 0
      OnChange = CBB_TurnosChange
    end
  end
  object Pa_ayuda: TPanel
    Left = 0
    Top = 128
    Width = 237
    Height = 31
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    ExplicitTop = 250
    ExplicitWidth = 238
    object Button2: TButton
      Left = 69
      Top = 2
      Width = 75
      Height = 25
      Caption = 'Aceptar'
      TabOrder = 0
      OnClick = Button2Click
    end
    object Button1: TButton
      Left = 150
      Top = 2
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
    Width = 237
    Height = 24
    Hint = ''
    BarManager = frmPrincipal.dxBarManager1
    ColorSchemeName = 'Blue'
    ShowTabHeaders = False
    SupportNonClientDrawing = True
    Contexts = <>
    TabOrder = 2
    TabStop = False
    ExplicitWidth = 238
    object dxRibbon1Tab1: TdxRibbonTab
      Caption = 'dxRibbon1Tab1'
      Groups = <>
      Visible = False
      Index = 0
    end
  end
  object rdaObtenTurno: TDARemoteDataAdapter
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
    Left = 200
    Top = 6
  end
  object cdsObtenTurno: TDACDSDataTable
    Fields = <>
    LogicalName = 'Reporte'
    Params = <
      item
        Name = 'TurnoID'
        Value = '1'
        ParamType = daptInput
      end>
    ReadOnly = True
    RemoteDataAdapter = rdaObtenTurno
    RemoteUpdatesOptions = []
    StreamingOptions = [soDisableEventsWhileStreaming]
    IndexDefs = <>
    Left = 128
    Top = 6
  end
end
