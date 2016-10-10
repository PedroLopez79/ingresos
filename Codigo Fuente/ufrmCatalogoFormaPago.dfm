inherited ufrmCatalogoFormadePago: TufrmCatalogoFormadePago
  Caption = 'ufrmCatalogoFormadePago'
  ExplicitWidth = 625
  ExplicitHeight = 449
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcCatalogo: TcxPageControl
    Top = 32
    Height = 417
    ActivePage = cxTabSheet2
    ExplicitTop = 32
    ExplicitHeight = 417
    ClientRectBottom = 387
    inherited cxTabSheet1: TcxTabSheet
      ExplicitLeft = 3
      ExplicitTop = 3
      ExplicitWidth = 616
      ExplicitHeight = 416
      inherited dbgCatalogo: TcxGrid
        Height = 384
        ExplicitHeight = 384
        inherited dbgCatalogoDBTableView1: TcxGridDBTableView
          object dbgCatalogoDBTableView1FormaPagoID: TcxGridDBColumn
            Caption = 'Forma de Pago'
            DataBinding.FieldName = 'FormaPagoID'
            Width = 83
          end
          object dbgCatalogoDBTableView1Descripcion: TcxGridDBColumn
            DataBinding.FieldName = 'Descripcion'
            Width = 219
          end
        end
      end
    end
    inherited cxTabSheet2: TcxTabSheet
      ExplicitLeft = 3
      ExplicitTop = 3
      ExplicitWidth = 616
      ExplicitHeight = 384
      object TxtDescripcion: TcxDBTextEdit
        Left = 18
        Top = 94
        DataBinding.DataField = 'Descripcion'
        DataBinding.DataSource = dsCatalogo
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 0
        Width = 215
      end
      object LblNombre: TcxLabel
        Left = 18
        Top = 71
        Caption = 'Descripci'#243'n'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object TxtNoFormaPago: TcxDBTextEdit
        Left = 18
        Top = 40
        TabStop = False
        DataBinding.DataField = 'FormaPagoID'
        DataBinding.DataSource = dsCatalogo
        Enabled = False
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 2
        Width = 97
      end
      object LblNoProducto: TcxLabel
        Left = 18
        Top = 23
        Caption = 'Forma de Pago ID'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
    end
  end
  object Panel1: TPanel [1]
    Left = 0
    Top = 0
    Width = 625
    Height = 30
    Align = alTop
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Caption = ' Catalogo de Forma de Pago'
    Color = clBtnShadow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
    ExplicitLeft = 8
    ExplicitTop = 8
    ExplicitWidth = 368
  end
  object Panel2: TPanel [2]
    Left = 0
    Top = 30
    Width = 625
    Height = 2
    Align = alTop
    BevelOuter = bvNone
    Caption = ' Asignar Pagos a un Grupo'
    Color = clNone
    ParentBackground = False
    TabOrder = 2
    ExplicitWidth = 323
  end
  inherited cdsCatalogo: TDAMemDataTable
    Fields = <
      item
        Name = 'FormaPagoID'
        DataType = datInteger
        Required = True
      end
      item
        Name = 'Descripcion'
        DataType = datString
        Size = 50
        Required = True
      end>
    RemoteDataAdapter = DM.RemoteDataAdapter
    BeforePost = cdsCatalogoBeforePost
    OnNewRecord = cdsCatalogoNewRecord
    LogicalName = 'dbo FormaPago'
  end
  inherited dsCatalogo: TDADataSource
    DataSet = cdsCatalogo.Dataset
  end
end
