object frmAgregaUnidadMedida: TfrmAgregaUnidadMedida
  Left = 303
  Top = 281
  Caption = 'Agrega Unidad de Medida'
  ClientHeight = 82
  ClientWidth = 359
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
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
    object TxtNombre: TcxDBTextEdit
      Left = 69
      Top = 15
      DataBinding.DataField = 'DESCRIPCION'
      DataBinding.DataSource = dsUnidadMedida
      Properties.CharCase = ecUpperCase
      Style.BorderStyle = ebsUltraFlat
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 0
      Width = 284
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
      OnClick = Button1Click
    end
  end
  object cdsUnidadMedida: TDAMemDataTable
    RemoteUpdatesOptions = []
    Fields = <
      item
        Name = 'IDUNIDADMEDIDA'
        DataType = datInteger
      end
      item
        Name = 'DESCRIPCION'
        DataType = datString
        Size = 50
      end>
    Params = <>
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = DM.RemoteDataAdapter
    AfterPost = cdsUnidadMedidaAfterPost
    OnNewRecord = cdsUnidadMedidaNewRecord
    LogicalName = 'dbo UNIDADESMEDIDA'
    IndexDefs = <>
    Left = 320
    Top = 8
  end
  object dsUnidadMedida: TDADataSource
    DataSet = cdsUnidadMedida.Dataset
    DataTable = cdsUnidadMedida
    Left = 288
    Top = 8
  end
end
