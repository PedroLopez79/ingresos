inherited frmExportar: TfrmExportar
  Caption = 'frmExportar'
  ExplicitWidth = 625
  ExplicitHeight = 449
  PixelsPerInch = 96
  TextHeight = 13
  object pgcExportar: TcxPageControl
    Left = 0
    Top = 0
    Width = 625
    Height = 449
    ActivePage = cxTabSheet1
    Align = alClient
    Images = dmImages.Imagenes
    TabOrder = 0
    TabPosition = tpBottom
    ClientRectBottom = 419
    ClientRectLeft = 3
    ClientRectRight = 619
    ClientRectTop = 3
    object cxTabSheet1: TcxTabSheet
      Caption = 'Listado'
      ImageIndex = 0
      object cxGrid1: TcxGrid
        Left = 0
        Top = 0
        Width = 616
        Height = 416
        Align = alClient
        TabOrder = 0
        object cxGrid1DBTableView1: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsLista
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          object cxGrid1DBTableView1ExportarID: TcxGridDBColumn
            DataBinding.FieldName = 'ExportarID'
          end
          object cxGrid1DBTableView1Nombre: TcxGridDBColumn
            DataBinding.FieldName = 'Nombre'
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = cxGrid1DBTableView1
        end
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = 'Datos'
      ImageIndex = 1
      object dbgDatos: TcxGrid
        Left = 0
        Top = 0
        Width = 616
        Height = 416
        Align = alClient
        TabOrder = 0
        object dbgDatosDBTableView1: TcxGridDBTableView
          NavigatorButtons.ConfirmDelete = False
          DataController.DataSource = dsDatos
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.IncSearch = True
          OptionsData.Deleting = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsSelection.MultiSelect = True
          OptionsView.Indicator = True
        end
        object dbgDatosLevel1: TcxGridLevel
          GridView = dbgDatosDBTableView1
        end
      end
    end
  end
  object cdsLista: TDAMemDataTable
    RemoteUpdatesOptions = []
    Fields = <
      item
        Name = 'ExportarID'
        DataType = datInteger
        Required = True
      end
      item
        Name = 'Nombre'
        DataType = datString
        Size = 50
      end
      item
        Name = 'Parametros'
        DataType = datString
        Size = 50
      end
      item
        Name = 'Template'
        DataType = datMemo
      end
      item
        Name = 'ScriptExporta'
        DataType = datMemo
      end
      item
        Name = 'ScriptDatos'
        DataType = datMemo
      end>
    Params = <>
    MasterMappingMode = mmDataRequest
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = DM.RemoteDataAdapter
    AfterScroll = cdsListaAfterScroll
    LogicalName = 'dbo Exportar'
    IndexDefs = <>
    Left = 296
    Top = 208
  end
  object dsLista: TDADataSource
    DataSet = cdsLista.Dataset
    DataTable = cdsLista
    Left = 344
    Top = 208
  end
  object dsDatos: TDataSource
    DataSet = DM.tblDatos
    Left = 312
    Top = 104
  end
end
