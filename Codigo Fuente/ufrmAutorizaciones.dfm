inherited frmAutorizaciones: TfrmAutorizaciones
  Caption = 'frmAutorizaciones'
  ExplicitWidth = 625
  ExplicitHeight = 449
  PixelsPerInch = 96
  TextHeight = 13
  object dbgCatalogo: TcxGrid
    Left = 0
    Top = 0
    Width = 625
    Height = 449
    Align = alClient
    TabOrder = 0
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    object dbgCatalogoDBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsGasolinero
      DataController.DetailKeyFieldNames = 'AutorizacionID'
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
      object dbgCatalogoDBTableView1AutorizacionID: TcxGridDBColumn
        DataBinding.FieldName = 'AutorizacionID'
        Width = 89
      end
      object dbgCatalogoDBTableView1ClienteID: TcxGridDBColumn
        DataBinding.FieldName = 'ClienteID'
      end
      object dbgCatalogoDBTableView1Tipo: TcxGridDBColumn
        DataBinding.FieldName = 'Tipo'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Images = dmImages.Imagenes
        Properties.Items = <
          item
            Description = 'Tarjeta'
            ImageIndex = 83
            Value = 1
          end
          item
            Description = 'Cupon'
            ImageIndex = 23
            Value = 2
          end>
      end
      object dbgCatalogoDBTableView1Fecha: TcxGridDBColumn
        DataBinding.FieldName = 'Fecha'
        Width = 145
      end
      object dbgCatalogoDBTableView1Importe: TcxGridDBColumn
        DataBinding.FieldName = 'Importe'
      end
      object dbgCatalogoDBTableView1Cantidad: TcxGridDBColumn
        DataBinding.FieldName = 'Cantidad'
        Width = 84
      end
      object dbgCatalogoDBTableView1ImporteCantidad: TcxGridDBColumn
        DataBinding.FieldName = 'ImporteCantidad'
        PropertiesClassName = 'TcxImageComboBoxProperties'
        Properties.Images = dmImages.Imagenes
        Properties.Items = <
          item
            Description = 'Importe'
            ImageIndex = 41
            Value = 'I'
          end
          item
            Description = 'Volumen'
            ImageIndex = 71
            Value = 'V'
          end>
        Width = 90
      end
      object dbgCatalogoDBTableView1PosicionCarga: TcxGridDBColumn
        DataBinding.FieldName = 'PosicionCarga'
      end
      object dbgCatalogoDBTableView1EstacionID: TcxGridDBColumn
        DataBinding.FieldName = 'EstacionID'
      end
      object dbgCatalogoDBTableView1VehiculoID: TcxGridDBColumn
        DataBinding.FieldName = 'VehiculoID'
      end
    end
    object dbgCatalogoLevel1: TcxGridLevel
      GridView = dbgCatalogoDBTableView1
    end
  end
  object cdsAutorizacion: TDAMemDataTable
    RemoteUpdatesOptions = []
    Fields = <
      item
        Name = 'AutorizacionID'
        DataType = datInteger
      end
      item
        Name = 'ClienteID'
        DataType = datInteger
      end
      item
        Name = 'Tipo'
        DataType = datInteger
      end
      item
        Name = 'Fecha'
        DataType = datDateTime
      end
      item
        Name = 'Importe'
        DataType = datFloat
        DisplayFormat = '#,#0.00'
        Alignment = taRightJustify
      end
      item
        Name = 'Cantidad'
        DataType = datFloat
        DisplayFormat = '#,#0.00'
        Alignment = taRightJustify
      end
      item
        Name = 'ImporteCantidad'
        DataType = datString
        Size = 1
        DisplayLabel = 'Autorizacion'
      end
      item
        Name = 'PosicionCarga'
        DataType = datInteger
        DisplayLabel = 'BombaID'
        Alignment = taRightJustify
      end
      item
        Name = 'EstacionID'
        DataType = datInteger
        Alignment = taRightJustify
      end
      item
        Name = 'VehiculoID'
        DataType = datInteger
        Alignment = taRightJustify
      end>
    Params = <>
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = DMFlotillas.RemoteDataAdapter
    LogicalName = 'cdsAutorizacion'
    IndexDefs = <>
    Left = 496
    Top = 336
  end
  object dsGasolinero: TDADataSource
    DataSet = cdsAutorizacion.Dataset
    DataTable = cdsAutorizacion
    Left = 496
    Top = 368
  end
end
