inherited frmStatus: TfrmStatus
  Caption = 'frmStatus'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcCatalogo: TcxPageControl
    ActivePage = cxTabSheet2
    inherited cxTabSheet1: TcxTabSheet
      inherited dbgCatalogo: TcxGrid
        inherited dbgCatalogoDBTableView1: TcxGridDBTableView
          object dbgCatalogoDBTableView1RecID: TcxGridDBColumn
            DataBinding.FieldName = 'RecID'
            Visible = False
          end
          object dbgCatalogoDBTableView1IDSTATUS: TcxGridDBColumn
            Caption = 'ID'
            DataBinding.FieldName = 'IDSTATUS'
            Width = 32
          end
          object dbgCatalogoDBTableView1CODIGO: TcxGridDBColumn
            DataBinding.FieldName = 'CODIGO'
          end
          object dbgCatalogoDBTableView1NOMBRE: TcxGridDBColumn
            DataBinding.FieldName = 'NOMBRE'
          end
        end
      end
    end
    inherited cxTabSheet2: TcxTabSheet
      ExplicitLeft = 3
      ExplicitTop = 3
      ExplicitWidth = 616
      ExplicitHeight = 416
      object LblNoProducto: TcxLabel
        Left = 16
        Top = 48
        Caption = 'Status'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object TxtNoProducto: TcxDBTextEdit
        Left = 63
        Top = 47
        TabStop = False
        DataBinding.DataField = 'IDSTATUS'
        DataBinding.DataSource = dsCatalogo
        Enabled = False
        Properties.CharCase = ecUpperCase
        Properties.ReadOnly = False
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 1
        Width = 97
      end
      object TxtNombre: TcxDBTextEdit
        Left = 63
        Top = 87
        DataBinding.DataField = 'NOMBRE'
        DataBinding.DataSource = dsCatalogo
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 2
        Width = 186
      end
      object LblNombre: TcxLabel
        Left = 16
        Top = 88
        Caption = 'Nombre'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object cxLabel1: TcxLabel
        Left = 16
        Top = 135
        Caption = 'Codigo'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object cxDBTextEdit1: TcxDBTextEdit
        Left = 63
        Top = 134
        DataBinding.DataField = 'CODIGO'
        DataBinding.DataSource = dsCatalogo
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 5
        Width = 104
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 616
        Height = 30
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Caption = ' Informacion de Status'
        Color = clBtnShadow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 6
      end
      object Panel2: TPanel
        Left = 0
        Top = 30
        Width = 616
        Height = 2
        Align = alTop
        BevelOuter = bvNone
        Color = clNone
        ParentBackground = False
        TabOrder = 7
      end
    end
  end
  inherited cdsCatalogo: TDAMemDataTable
    Fields = <
      item
        Name = 'IDSTATUS'
        DataType = datInteger
        Required = True
        InPrimaryKey = True
      end
      item
        Name = 'CODIGO'
        DataType = datString
        Size = 10
        Required = True
      end
      item
        Name = 'NOMBRE'
        DataType = datString
        Size = 50
        Required = True
      end>
    RemoteDataAdapter = DM.RemoteDataAdapter
    LogicalName = 'dbo STATUS'
  end
  inherited dsCatalogo: TDADataSource
    DataSet = cdsCatalogo.Dataset
  end
end
