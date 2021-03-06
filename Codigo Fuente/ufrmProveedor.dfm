inherited frmProveedor: TfrmProveedor
  Caption = 'frmProveedor'
  ClientWidth = 662
  ExplicitWidth = 662
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcCatalogo: TcxPageControl
    Width = 662
    Properties.ActivePage = cxTabSheet2
    ExplicitWidth = 662
    ClientRectRight = 656
    inherited cxTabSheet1: TcxTabSheet
      inherited dbgCatalogo: TcxGrid
        Width = 653
        ExplicitWidth = 653
        inherited dbgCatalogoDBTableView1: TcxGridDBTableView
          object dbgCatalogoDBTableView1RecID: TcxGridDBColumn
            DataBinding.FieldName = 'RecID'
            Visible = False
          end
          object dbgCatalogoDBTableView1IDPROVEEDOR: TcxGridDBColumn
            Caption = 'ID'
            DataBinding.FieldName = 'IDPROVEEDOR'
          end
          object dbgCatalogoDBTableView1NOMBRE: TcxGridDBColumn
            DataBinding.FieldName = 'NOMBRE'
          end
          object dbgCatalogoDBTableView1RFC: TcxGridDBColumn
            DataBinding.FieldName = 'RFC'
          end
          object dbgCatalogoDBTableView1CODIGOPOSTAL: TcxGridDBColumn
            DataBinding.FieldName = 'CODIGOPOSTAL'
            Width = 104
          end
          object dbgCatalogoDBTableView1EMAIL: TcxGridDBColumn
            DataBinding.FieldName = 'EMAIL'
          end
          object dbgCatalogoDBTableView1CALLE: TcxGridDBColumn
            DataBinding.FieldName = 'CALLE'
          end
          object dbgCatalogoDBTableView1COLONIA: TcxGridDBColumn
            DataBinding.FieldName = 'COLONIA'
          end
          object dbgCatalogoDBTableView1CIUDAD: TcxGridDBColumn
            DataBinding.FieldName = 'CIUDAD'
          end
          object dbgCatalogoDBTableView1TELEFONO: TcxGridDBColumn
            DataBinding.FieldName = 'TELEFONO'
          end
          object dbgCatalogoDBTableView1CC: TcxGridDBColumn
            DataBinding.FieldName = 'CC'
          end
        end
      end
    end
    inherited cxTabSheet2: TcxTabSheet
      ExplicitLeft = 3
      ExplicitTop = 3
      ExplicitWidth = 653
      ExplicitHeight = 416
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 653
        Height = 30
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Caption = ' Informacion del Proveedor'
        Color = clBtnShadow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 12
      end
      object Panel2: TPanel
        Left = 0
        Top = 30
        Width = 653
        Height = 2
        Align = alTop
        BevelOuter = bvNone
        Color = clNone
        ParentBackground = False
        TabOrder = 13
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
        Left = 63
        Top = 47
        Hint = ''
        TabStop = False
        DataBinding.DataField = 'IDPROVEEDOR'
        DataBinding.DataSource = dsCatalogo
        Enabled = False
        Properties.CharCase = ecUpperCase
        Properties.ReadOnly = False
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 0
        Width = 41
      end
      object LblNombre: TcxLabel
        Left = 16
        Top = 76
        Hint = ''
        Caption = 'Nombre'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object TxtNombre: TcxDBTextEdit
        Left = 63
        Top = 74
        Hint = ''
        DataBinding.DataField = 'NOMBRE'
        DataBinding.DataSource = dsCatalogo
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 1
        Width = 326
      end
      object cxLabel1: TcxLabel
        Left = 16
        Top = 101
        Hint = ''
        Caption = 'Calle'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object cxDBTextEdit1: TcxDBTextEdit
        Left = 63
        Top = 100
        Hint = ''
        DataBinding.DataField = 'CALLE'
        DataBinding.DataSource = dsCatalogo
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 2
        Width = 171
      end
      object cxDBTextEdit2: TcxDBTextEdit
        Left = 63
        Top = 126
        Hint = ''
        DataBinding.DataField = 'COLONIA'
        DataBinding.DataSource = dsCatalogo
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 3
        Width = 171
      end
      object cxLabel2: TcxLabel
        Left = 16
        Top = 127
        Hint = ''
        Caption = 'Colonia'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object cxLabel3: TcxLabel
        Left = 16
        Top = 154
        Hint = ''
        Caption = 'Ciudad'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object cxDBTextEdit3: TcxDBTextEdit
        Left = 63
        Top = 153
        Hint = ''
        DataBinding.DataField = 'CIUDAD'
        DataBinding.DataSource = dsCatalogo
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 4
        Width = 171
      end
      object cxDBTextEdit4: TcxDBTextEdit
        Left = 63
        Top = 235
        Hint = ''
        DataBinding.DataField = 'TELEFONO'
        DataBinding.DataSource = dsCatalogo
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 7
        Width = 171
      end
      object cxLabel4: TcxLabel
        Left = 16
        Top = 236
        Hint = ''
        Caption = 'Telefono'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object cxDBTextEdit5: TcxDBTextEdit
        Left = 63
        Top = 181
        Hint = ''
        DataBinding.DataField = 'RFC'
        DataBinding.DataSource = dsCatalogo
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 5
        Width = 171
      end
      object cxLabel5: TcxLabel
        Left = 15
        Top = 182
        Hint = ''
        Caption = 'RFC'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object cxDBTextEdit6: TcxDBTextEdit
        Left = 63
        Top = 287
        Hint = ''
        DataBinding.DataField = 'CODIGOPOSTAL'
        DataBinding.DataSource = dsCatalogo
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 8
        Width = 103
      end
      object cxLabel6: TcxLabel
        Left = 15
        Top = 288
        Hint = ''
        Caption = 'C.P.'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object cxDBTextEdit7: TcxDBTextEdit
        Left = 63
        Top = 208
        Hint = ''
        DataBinding.DataField = 'EMAIL'
        DataBinding.DataSource = dsCatalogo
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 6
        Width = 171
      end
      object cxLabel7: TcxLabel
        Left = 16
        Top = 209
        Hint = ''
        Caption = 'Email'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object cxLabel8: TcxLabel
        Left = 391
        Top = 77
        Hint = ''
        Caption = 'Cuenta Contable (Compra)'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object cxDBTextEdit8: TcxDBTextEdit
        Left = 518
        Top = 75
        Hint = ''
        DataBinding.DataField = 'CCCompra'
        DataBinding.DataSource = dsCatalogo
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 9
        Width = 118
      end
      object cxLabel11: TcxLabel
        Left = 391
        Top = 127
        Hint = ''
        Caption = 'Plazo Pago'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object cxDBTextEdit11: TcxDBTextEdit
        Left = 518
        Top = 126
        Hint = ''
        DataBinding.DataField = 'PlazoPago'
        DataBinding.DataSource = dsCatalogo
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 11
        Width = 118
      end
      object cxLabel10: TcxLabel
        Left = 391
        Top = 101
        Hint = ''
        Caption = 'Cuenta Contable (Pago)'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object cxDBTextEdit10: TcxDBTextEdit
        Left = 518
        Top = 100
        Hint = ''
        DataBinding.DataField = 'CCPago'
        DataBinding.DataSource = dsCatalogo
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 10
        Width = 118
      end
    end
  end
  inherited cdsCatalogo: TDAMemDataTable
    Fields = <
      item
        Name = 'IDPROVEEDOR'
        DataType = datInteger
        Required = True
        InPrimaryKey = True
      end
      item
        Name = 'NOMBRE'
        DataType = datString
        Size = 50
      end
      item
        Name = 'CALLE'
        DataType = datString
        Size = 40
        Required = True
      end
      item
        Name = 'COLONIA'
        DataType = datString
        Size = 30
        Required = True
      end
      item
        Name = 'CIUDAD'
        DataType = datString
        Size = 30
        Required = True
      end
      item
        Name = 'RFC'
        DataType = datString
        Size = 15
        Required = True
      end
      item
        Name = 'TELEFONO'
        DataType = datString
        Size = 20
      end
      item
        Name = 'CODIGOPOSTAL'
        DataType = datString
        Size = 5
      end
      item
        Name = 'EMAIL'
        DataType = datString
        Size = 30
      end
      item
        Name = 'CCCompra'
        DataType = datString
        Size = 25
      end
      item
        Name = 'CCPago'
        DataType = datString
        Size = 25
      end
      item
        Name = 'PlazoPago'
        DataType = datInteger
      end>
    LogicalName = 'dbo PROVEEDOR'
    RemoteDataAdapter = DM.RemoteDataAdapter
    OnNewRecord = cdsCatalogoNewRecord
  end
  inherited dsCatalogo: TDADataSource
    DataSet = cdsCatalogo.Dataset
  end
end
