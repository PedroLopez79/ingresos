inherited frmBuscarProveedor: TfrmBuscarProveedor
  Caption = 'Buscar Proveedor'
  ExplicitWidth = 320
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 13
  inherited dbgAgrupacion: TcxGrid
    Left = 120
    Top = 40
    Align = alCustom
    ExplicitLeft = 120
    ExplicitTop = 40
    inherited cxGridDBTableView1: TcxGridDBTableView
      object cxGridDBTableView1ProveedorId: TcxGridDBColumn
        DataBinding.FieldName = 'ProveedorId'
        Width = 72
      end
      object cxGridDBTableView1Nombre: TcxGridDBColumn
        DataBinding.FieldName = 'Nombre'
        Width = 343
      end
      object cxGridDBTableView1RFC: TcxGridDBColumn
        DataBinding.FieldName = 'RFC'
        Width = 169
      end
    end
  end
  object cxPageControl1: TcxPageControl [1]
    Left = 0
    Top = 24
    Width = 619
    Height = 393
    ActivePage = cxTabSheet1
    Align = alClient
    Images = dmImages.Imagenes
    TabOrder = 2
    TabPosition = tpBottom
    ExplicitTop = 0
    ExplicitHeight = 417
    ClientRectBottom = 368
    ClientRectRight = 619
    ClientRectTop = 0
    object cxTabSheet1: TcxTabSheet
      Caption = 'Buscar Proveedor'
      ImageIndex = 0
      object cxGrid1: TcxGrid
        Left = 0
        Top = 0
        Width = 619
        Height = 368
        Align = alClient
        TabOrder = 0
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = True
        object cxGridDBTableView2: TcxGridDBTableView
          OnDblClick = cxGridDBTableView1DblClick
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsBuscar
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          FilterRow.InfoText = 'Haga click aqu'#237' para filtrar los datos'
          FilterRow.Visible = True
          FilterRow.ApplyChanges = fracImmediately
          OptionsBehavior.IncSearch = True
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.MultiSelect = True
          OptionsView.Indicator = True
          object cxGridDBColumn1: TcxGridDBColumn
            DataBinding.FieldName = 'ProveedorId'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.CharCase = ecUpperCase
            Width = 72
          end
          object cxGridDBColumn2: TcxGridDBColumn
            DataBinding.FieldName = 'Nombre'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.CharCase = ecUpperCase
            Width = 343
          end
          object cxGridDBColumn3: TcxGridDBColumn
            DataBinding.FieldName = 'RFC'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.CharCase = ecUpperCase
            Width = 169
          end
        end
        object cxGridLevel2: TcxGridLevel
          GridView = cxGridDBTableView2
        end
      end
    end
  end
  inherited cdsBuscar: TDACDSDataTable
    Fields = <
      item
        Name = 'ProveedorId'
        DataType = datInteger
        Required = True
        InPrimaryKey = True
      end
      item
        Name = 'Nombre'
        DataType = datString
        Size = 50
      end
      item
        Name = 'Calle'
        DataType = datString
        Size = 40
        Required = True
      end
      item
        Name = 'Colonia'
        DataType = datString
        Size = 30
        Required = True
      end
      item
        Name = 'Ciudad'
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
        Name = 'Telefono'
        DataType = datString
        Size = 20
      end
      item
        Name = 'Fax'
        DataType = datString
        Size = 20
      end
      item
        Name = 'CodPostal'
        DataType = datString
        Size = 5
      end
      item
        Name = 'Email'
        DataType = datString
        Size = 30
      end
      item
        Name = 'Referencia'
        DataType = datString
        Size = 50
      end
      item
        Name = 'DiasPlazo'
        DataType = datInteger
        Required = True
      end
      item
        Name = 'CuentaContable'
        DataType = datString
        Size = 20
      end>
    LogicalName = 'dbo Proveedor'
  end
  inherited dsBuscar: TDADataSource
    DataSet = cdsBuscar.Dataset
  end
end
