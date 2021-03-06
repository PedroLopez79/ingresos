inherited frmConceptosMovimientosBancarios: TfrmConceptosMovimientosBancarios
  Caption = 'frmConceptosMovimientosBancarios'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcCatalogo: TcxPageControl
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
          object dbgCatalogoDBTableView1IDCONCEPTOMOVIMIENTOBANCARIO: TcxGridDBColumn
            Caption = 'ID'
            DataBinding.FieldName = 'IDCONCEPTOMOVIMIENTOBANCARIO'
          end
          object dbgCatalogoDBTableView1DESCRIPCION: TcxGridDBColumn
            DataBinding.FieldName = 'DESCRIPCION'
            Width = 104
          end
          object dbgCatalogoDBTableView1NATURALEZA: TcxGridDBColumn
            DataBinding.FieldName = 'NATURALEZA'
            Width = 90
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
        Caption = 'ID'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object TxtNoProducto: TcxDBTextEdit
        Left = 82
        Top = 47
        TabStop = False
        DataBinding.DataField = 'IDCONCEPTOMOVIMIENTOBANCARIO'
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
        Left = 82
        Top = 87
        DataBinding.DataField = 'DESCRIPCION'
        DataBinding.DataSource = dsCatalogo
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 3
        Width = 337
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
        TabOrder = 4
      end
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
        TabOrder = 5
      end
      object cxDBRadioGroup1: TcxDBRadioGroup
        Left = 16
        Top = 145
        Caption = 'Naturaleza de la Cuenta'
        DataBinding.DataField = 'NATURALEZA'
        DataBinding.DataSource = dsCatalogo
        Properties.Columns = 2
        Properties.Items = <
          item
            Caption = 'Cargo'
            Value = 'C'
          end
          item
            Caption = 'Abono'
            Value = 'A'
          end>
        TabOrder = 6
        Height = 40
        Width = 193
      end
    end
  end
  inherited cdsCatalogo: TDAMemDataTable
    Fields = <
      item
        Name = 'IDCONCEPTOMOVIMIENTOBANCARIO'
        DataType = datInteger
      end
      item
        Name = 'DESCRIPCION'
        DataType = datString
        Size = 50
      end
      item
        Name = 'NATURALEZA'
        DataType = datString
        Size = 1
      end>
    RemoteDataAdapter = DM.RemoteDataAdapter
    OnNewRecord = cdsCatalogoNewRecord
    LogicalName = 'dbo CONCEPTOMOVIMIENTOBANCARIO'
  end
  inherited dsCatalogo: TDADataSource
    DataSet = cdsCatalogo.Dataset
  end
end
