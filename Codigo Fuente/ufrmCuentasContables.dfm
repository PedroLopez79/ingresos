inherited frmCuentasContables: TfrmCuentasContables
  Caption = 'frmCuentasContables'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcCatalogo: TcxPageControl
    ActivePage = cxTabSheet2
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
          object dbgCatalogoDBTableView1IDCUENTACONTABLE: TcxGridDBColumn
            Caption = 'ID'
            DataBinding.FieldName = 'IDCUENTACONTABLE'
          end
          object dbgCatalogoDBTableView1DESCRIPCION: TcxGridDBColumn
            DataBinding.FieldName = 'DESCRIPCION'
          end
          object dbgCatalogoDBTableView1NUMERODECUENTA: TcxGridDBColumn
            DataBinding.FieldName = 'NUMERODECUENTA'
            Width = 162
          end
          object dbgCatalogoDBTableView1NATURALEZACUENTA: TcxGridDBColumn
            DataBinding.FieldName = 'NATURALEZACUENTA'
            Width = 121
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
        Caption = ' Informacion de Cuentas Contables'
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
        Caption = 'ID'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object TxtNoProducto: TcxDBTextEdit
        Left = 115
        Top = 47
        TabStop = False
        DataBinding.DataField = 'IDCUENTACONTABLE'
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
        Caption = 'Descripcion'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object TxtNombre: TcxDBTextEdit
        Left = 115
        Top = 87
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
      object cxLabel1: TcxLabel
        Left = 16
        Top = 131
        Caption = 'Numero de Cuenta'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object cxDBTextEdit1: TcxDBTextEdit
        Left = 115
        Top = 130
        DataBinding.DataField = 'NUMERODECUENTA'
        DataBinding.DataSource = dsCatalogo
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 7
        Width = 166
      end
      object cxDBRadioGroup1: TcxDBRadioGroup
        Left = 16
        Top = 173
        Caption = 'Naturaleza de la Cuenta'
        DataBinding.DataField = 'NATURALEZACUENTA'
        DataBinding.DataSource = dsCatalogo
        Properties.Columns = 2
        Properties.Items = <
          item
            Caption = 'Ingreso'
            Value = 'I'
          end
          item
            Caption = 'Egreso'
            Value = 'E'
          end>
        TabOrder = 8
        Height = 40
        Width = 193
      end
    end
  end
  inherited cdsCatalogo: TDAMemDataTable
    Fields = <
      item
        Name = 'IDCUENTACONTABLE'
        DataType = datInteger
        Required = True
        InPrimaryKey = True
      end
      item
        Name = 'NUMERODECUENTA'
        DataType = datString
        Size = 25
      end
      item
        Name = 'NATURALEZACUENTA'
        DataType = datString
        Size = 1
      end
      item
        Name = 'DESCRIPCION'
        DataType = datString
        Size = 25
      end>
    RemoteDataAdapter = DM.RemoteDataAdapter
    OnNewRecord = cdsCatalogoNewRecord
    LogicalName = 'dbo CUENTASCONTABLES'
  end
  inherited dsCatalogo: TDADataSource
    DataSet = cdsCatalogo.Dataset
  end
end
