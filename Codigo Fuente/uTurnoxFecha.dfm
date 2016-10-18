object Fo_TurnoxFecha: TFo_TurnoxFecha
  Left = 303
  Top = 281
  Caption = 'Secuencias x Fecha'
  ClientHeight = 281
  ClientWidth = 238
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
    Width = 238
    Height = 226
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label6: TLabel
      Left = 8
      Top = 22
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
      Left = 4
      Top = 173
      Width = 330
      Height = 10
      Shape = bsBottomLine
    end
    object Label1: TLabel
      Left = 8
      Top = 68
      Width = 131
      Height = 13
      Caption = 'Fecha y Hora del turno'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 8
      Top = 100
      Width = 36
      Height = 13
      Caption = 'Entidad'
    end
    object Label3: TLabel
      Left = 8
      Top = 147
      Width = 36
      Height = 13
      Caption = 'Entidad'
    end
    object Label4: TLabel
      Left = 174
      Top = 179
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
      Top = 192
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
      Top = 41
      Width = 217
      Height = 22
      Style = csOwnerDrawFixed
      TabOrder = 0
      OnChange = CBB_TurnosChange
    end
  end
  object Pa_ayuda: TPanel
    Left = 0
    Top = 250
    Width = 238
    Height = 31
    Align = alBottom
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object Button2: TButton
      Left = 150
      Top = 2
      Width = 75
      Height = 25
      Caption = 'Aceptar'
      TabOrder = 0
      OnClick = Button2Click
    end
  end
  object dxRibbon1: TdxRibbon
    Left = 0
    Top = 0
    Width = 238
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
    Left = 184
    Top = 126
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
    Left = 184
    Top = 86
  end
end
