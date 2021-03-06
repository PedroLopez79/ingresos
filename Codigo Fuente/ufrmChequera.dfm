inherited frmChequera: TfrmChequera
  Caption = 'frmChequera'
  ExplicitWidth = 625
  ExplicitHeight = 449
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcCatalogo: TcxPageControl
    Properties.ActivePage = cxTabSheet2
    inherited cxTabSheet1: TcxTabSheet
      ExplicitLeft = 3
      ExplicitTop = 3
      ExplicitWidth = 616
      ExplicitHeight = 416
      inherited dbgCatalogo: TcxGrid
        inherited dbgCatalogoDBTableView1: TcxGridDBTableView
          object dbgCatalogoDBTableView1RecID: TcxGridDBColumn
            DataBinding.FieldName = 'RecID'
            Visible = False
          end
          object dbgCatalogoDBTableView1IDCHEQUERA: TcxGridDBColumn
            Caption = 'ID'
            DataBinding.FieldName = 'IDCHEQUERA'
          end
          object dbgCatalogoDBTableView1DESCRIPCION: TcxGridDBColumn
            DataBinding.FieldName = 'DESCRIPCION'
          end
          object dbgCatalogoDBTableView1NUMEROCUENTA: TcxGridDBColumn
            DataBinding.FieldName = 'NUMEROCUENTA'
          end
          object dbgCatalogoDBTableView1BANCO: TcxGridDBColumn
            DataBinding.FieldName = 'BANCO'
          end
          object dbgCatalogoDBTableView1MONEDA: TcxGridDBColumn
            DataBinding.FieldName = 'MONEDA'
          end
          object dbgCatalogoDBTableView1SALDOINICIAL: TcxGridDBColumn
            DataBinding.FieldName = 'SALDOINICIAL'
          end
        end
      end
    end
    inherited cxTabSheet2: TcxTabSheet
      ExplicitLeft = 3
      ExplicitTop = 3
      ExplicitWidth = 616
      ExplicitHeight = 416
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 616
        Height = 30
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Caption = ' Informacion de Chequeras'
        Color = clBtnShadow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
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
        TabOrder = 1
      end
      object LblNoProducto: TcxLabel
        Left = 16
        Top = 48
        Hint = ''
        Caption = 'ID'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object TxtNoProducto: TcxDBTextEdit
        Left = 83
        Top = 47
        Hint = ''
        TabStop = False
        DataBinding.DataField = 'IDCHEQUERA'
        DataBinding.DataSource = dsCatalogo
        Enabled = False
        Properties.CharCase = ecUpperCase
        Properties.ReadOnly = False
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 3
        Width = 67
      end
      object LblNombre: TcxLabel
        Left = 16
        Top = 88
        Hint = ''
        Caption = 'Descripcion'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object TxtNombre: TcxDBTextEdit
        Left = 83
        Top = 87
        Hint = ''
        DataBinding.DataField = 'DESCRIPCION'
        DataBinding.DataSource = dsCatalogo
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 5
        Width = 337
      end
      object cxDBLookupComboBox1: TcxDBLookupComboBox
        Left = 83
        Top = 172
        Hint = ''
        DataBinding.DataSource = dsCatalogo
        Properties.KeyFieldNames = 'IDSTATUS'
        Properties.ListColumns = <
          item
            FieldName = 'NOMBRE'
          end
          item
            FieldName = 'IDSTATUS'
          end>
        TabOrder = 6
        Width = 142
      end
      object cxLabel7: TcxLabel
        Left = 16
        Top = 173
        Hint = ''
        Caption = 'Banco'
      end
      object cxDBTextEdit1: TcxDBTextEdit
        Left = 83
        Top = 216
        Hint = ''
        DataBinding.DataField = 'MONEDA'
        DataBinding.DataSource = dsCatalogo
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 8
        Width = 142
      end
      object cxLabel1: TcxLabel
        Left = 16
        Top = 217
        Hint = ''
        Caption = 'Moneda'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object cxDBTextEdit2: TcxDBTextEdit
        Left = 83
        Top = 259
        Hint = ''
        DataBinding.DataField = 'SALDOINICIAL'
        DataBinding.DataSource = dsCatalogo
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 10
        Width = 142
      end
      object cxLabel2: TcxLabel
        Left = 16
        Top = 260
        Hint = ''
        Caption = 'Saldo Inicial'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object cxDBTextEdit3: TcxDBTextEdit
        Left = 161
        Top = 130
        Hint = ''
        DataBinding.DataField = 'NUMEROCUENTA'
        DataBinding.DataSource = dsCatalogo
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 12
        Width = 136
      end
      object cxLabel3: TcxLabel
        Left = 16
        Top = 131
        Hint = ''
        Caption = 'Numero de Cuenta (Cheque)'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
    end
  end
  inherited cdsCatalogo: TDAMemDataTable
    Fields = <
      item
        Name = 'IDCHEQUERA'
        DataType = datInteger
        Required = True
        InPrimaryKey = True
      end
      item
        Name = 'NUMEROCUENTA'
        DataType = datString
        Size = 25
      end
      item
        Name = 'BANCO'
        DataType = datInteger
      end
      item
        Name = 'DESCRIPCION'
        DataType = datString
        Size = 50
      end
      item
        Name = 'MONEDA'
        DataType = datString
        Size = 20
      end
      item
        Name = 'SALDOINICIAL'
        DataType = datFloat
      end>
    LogicalName = 'dbo CHEQUERA'
    RemoteDataAdapter = DM.RemoteDataAdapter
    OnNewRecord = cdsCatalogoNewRecord
  end
  inherited dsCatalogo: TDADataSource
    DataSet = cdsCatalogo.Dataset
  end
end
