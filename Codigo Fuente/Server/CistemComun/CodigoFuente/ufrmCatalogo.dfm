inherited frmCatalogo: TfrmCatalogo
  Caption = 'frmCatalogo'
  ExplicitTop = -9
  PixelsPerInch = 96
  TextHeight = 13
  object pgcCatalogo: TcxPageControl
    Left = 0
    Top = 0
    Width = 625
    Height = 449
    ActivePage = cxTabSheet1
    Align = alClient
    Images = dmImages.Imagenes
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    TabOrder = 0
    TabPosition = tpBottom
    TabSlants.Kind = skCutCorner
    ClientRectBottom = 419
    ClientRectLeft = 3
    ClientRectRight = 619
    ClientRectTop = 3
    object cxTabSheet1: TcxTabSheet
      Caption = 'Busqueda'
      ImageIndex = 0
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 625
      ExplicitHeight = 424
      object dbgCatalogo: TcxGrid
        Left = 0
        Top = 0
        Width = 616
        Height = 416
        Align = alClient
        TabOrder = 0
        OnEnter = dbgCatalogoEnter
        OnExit = dbgCatalogoExit
        LookAndFeel.Kind = lfFlat
        LookAndFeel.NativeStyle = False
        ExplicitWidth = 625
        ExplicitHeight = 424
        object dbgCatalogoDBTableView1: TcxGridDBTableView
          OnDblClick = dbgCatalogoDBTableView1DblClick
          OnKeyPress = dbgCatalogoDBTableView1KeyPress
          NavigatorButtons.ConfirmDelete = False
          OnEditKeyPress = dbgCatalogoDBTableView1EditKeyPress
          DataController.DataSource = dsCatalogo
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
        end
        object dbgCatalogoLevel1: TcxGridLevel
          GridView = dbgCatalogoDBTableView1
        end
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = 'Datos'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 625
      ExplicitHeight = 424
    end
  end
  object cdsCatalogo: TDAMemDataTable
    RemoteUpdatesOptions = []
    Fields = <>
    Params = <>
    StreamingOptions = [soDisableEventsWhileStreaming]
    AfterPost = cdsCatalogoAfterPost
    AfterDelete = cdsCatalogoAfterPost
    IndexDefs = <>
    Left = 496
    Top = 312
  end
  object dsCatalogo: TDADataSource
    DataSet = cdsCatalogo.Dataset
    OnStateChange = dsCatalogoStateChange
    DataTable = cdsCatalogo
    Left = 496
    Top = 360
  end
  object tblCatalogo: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 560
    Top = 312
  end
end
