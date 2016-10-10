inherited frmHorarios: TfrmHorarios
  Caption = 'frmHorarios'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcCatalogo: TcxPageControl
    ActivePage = cxTabSheet2
    OnChange = pgcCatalogoChange
    inherited cxTabSheet1: TcxTabSheet
      inherited dbgCatalogo: TcxGrid
        inherited dbgCatalogoDBTableView1: TcxGridDBTableView
          object dbgCatalogoDBTableView1RecID: TcxGridDBColumn
            DataBinding.FieldName = 'RecID'
            Visible = False
          end
          object dbgCatalogoDBTableView1IDHORARIO: TcxGridDBColumn
            Caption = 'ID'
            DataBinding.FieldName = 'IDHORARIO'
            Width = 68
          end
          object dbgCatalogoDBTableView1DESCRIPCION: TcxGridDBColumn
            DataBinding.FieldName = 'DESCRIPCION'
            Width = 333
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
        Caption = ' Informacion de Horarios'
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
        Caption = 'Horario'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object TxtNoProducto: TcxDBTextEdit
        Left = 82
        Top = 47
        TabStop = False
        DataBinding.DataField = 'IDHORARIO'
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
        Width = 71
      end
      object TxtNombre: TcxDBTextEdit
        Left = 82
        Top = 79
        DataBinding.DataField = 'DESCRIPCION'
        DataBinding.DataSource = dsCatalogo
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 4
        Width = 412
      end
      object LblNombre: TcxLabel
        Left = 16
        Top = 80
        Caption = 'Descripcion'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object cxLabel3: TcxLabel
        Left = 16
        Top = 114
        Caption = 'Hora Inicio'
        Style.BorderStyle = ebsNone
        Style.TransparentBorder = False
        Transparent = True
      end
      object LblPrecio: TcxLabel
        Left = 16
        Top = 146
        Caption = 'Hora Final'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object dtpHoraInicio: TDateTimePicker
        Left = 82
        Top = 109
        Width = 88
        Height = 21
        Date = 38746.466200625000000000
        Time = 38746.466200625000000000
        Kind = dtkTime
        TabOrder = 8
        OnChange = dtpHoraInicioChange
      end
      object dtpHoraFin: TDateTimePicker
        Left = 82
        Top = 143
        Width = 88
        Height = 21
        Date = 38746.466200625000000000
        Time = 38746.466200625000000000
        Kind = dtkTime
        TabOrder = 9
        OnChange = dtpHoraFinChange
      end
    end
  end
  inherited cdsCatalogo: TDAMemDataTable
    Fields = <
      item
        Name = 'IDHORARIO'
        DataType = datInteger
        Required = True
        InPrimaryKey = True
      end
      item
        Name = 'HORAINICIO'
        DataType = datDateTime
      end
      item
        Name = 'HORAFINAL'
        DataType = datDateTime
      end
      item
        Name = 'DESCRIPCION'
        DataType = datString
        Size = 50
      end>
    RemoteDataAdapter = DM.RemoteDataAdapter
    OnNewRecord = cdsCatalogoNewRecord
    LogicalName = 'dbo HORARIO'
  end
  inherited dsCatalogo: TDADataSource
    DataSet = cdsCatalogo.Dataset
  end
end
