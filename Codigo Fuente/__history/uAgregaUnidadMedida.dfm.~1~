object frmAgregaLinea: TfrmAgregaLinea
  Left = 303
  Top = 281
  Caption = 'Agrega Linea'
  ClientHeight = 82
  ClientWidth = 359
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 359
    Height = 51
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 18
      Width = 56
      Height = 13
      Caption = 'Descripcion'
    end
    object edtLinea: TEdit
      Left = 70
      Top = 15
      Width = 265
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
    end
  end
  object Pa_ayuda: TPanel
    Left = 0
    Top = 51
    Width = 359
    Height = 31
    Align = alBottom
    TabOrder = 1
    object Button2: TButton
      Left = 278
      Top = 2
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 0
      OnClick = Button2Click
    end
    object Button1: TButton
      Left = 197
      Top = 2
      Width = 75
      Height = 25
      Caption = 'Aceptar'
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object cdsLinea: TDAMemDataTable
    RemoteUpdatesOptions = []
    Fields = <
      item
        Name = 'RFC'
        DataType = datString
        Size = 16
      end>
    Params = <
      item
        Name = 'NOMBRES'
        Value = 'PEDRO LUIS'
        ParamType = daptInput
      end
      item
        Name = 'APATERNO'
        Value = 'LOPEZ'
        ParamType = daptInput
      end
      item
        Name = 'AMATERNO'
        Value = 'ALVARADO'
        ParamType = daptInput
      end
      item
        Name = 'FECHANAC'
        Value = '06/29/1979'
        ParamType = daptInput
      end>
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = DM.RemoteDataAdapter
    AfterPost = cdsLineaAfterPost
    OnNewRecord = cdsLineaNewRecord
    LogicalName = 'dbo LINEA'
    IndexDefs = <>
    Left = 320
    Top = 8
  end
end
