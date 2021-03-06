object DM: TDM
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  Height = 395
  Width = 596
  object Channel: TROWinInetHTTPChannel
    UserAgent = 'RemObjects SDK'
    DispatchOptions = []
    ServerLocators = <>
    TargetURL = 'http://127.0.0.1:8001/BIN'
    TrustInvalidCA = False
    Left = 40
    Top = 8
  end
  object Message: TROBinMessage
    Envelopes = <>
    Left = 40
    Top = 64
  end
  object RemoteService: TRORemoteService
    ServiceName = 'ServiceIngresos'
    Channel = Channel
    Message = Message
    Left = 40
    Top = 120
  end
  object DataStreamer: TDABin2DataStreamer
    Left = 40
    Top = 176
  end
  object RemoteDataAdapter: TDARemoteDataAdapter
    GetSchemaCall.RemoteService = RemoteService
    GetDataCall.RemoteService = RemoteService
    UpdateDataCall.RemoteService = RemoteService
    GetScriptsCall.RemoteService = RemoteService
    RemoteService = RemoteService
    DataStreamer = DataStreamer
    Left = 40
    Top = 232
  end
  object dxSkinController1: TdxSkinController
    NativeStyle = False
    SkinName = 'Office2007Blue'
    Left = 112
    Top = 8
  end
  object cdsMaestro: TDAMemDataTable
    Fields = <>
    LogicalName = 'Reporte'
    MasterMappingMode = mmDataRequest
    Params = <>
    RemoteDataAdapter = rdaMaestro
    RemoteUpdatesOptions = []
    StreamingOptions = [soDisableEventsWhileStreaming]
    IndexDefs = <>
    Left = 320
    Top = 168
  end
  object cdsDetalle: TDAMemDataTable
    Fields = <>
    LogicalName = 'Reporte'
    MasterMappingMode = mmDataRequest
    Params = <>
    RemoteDataAdapter = rdaDetalle
    RemoteUpdatesOptions = []
    StreamingOptions = [soDisableEventsWhileStreaming]
    IndexDefs = <>
    Left = 392
    Top = 168
  end
  object dsMaestro: TDADataSource
    DataSet = cdsMaestro.Dataset
    DataTable = cdsMaestro
    Left = 320
    Top = 216
  end
  object dsDetalle: TDADataSource
    DataSet = cdsDetalle.Dataset
    DataTable = cdsDetalle
    Left = 392
    Top = 216
  end
  object rdaMaestro: TDARemoteDataAdapter
    GetSchemaCall.RemoteService = RemoteService
    GetDataCall.RemoteService = RemoteService
    GetDataCall.MethodName = 'AbreDataSetReportes'
    GetDataCall.Params = <
      item
        Name = 'Result'
        DataType = rtBinary
        Flag = fResult
        Value = Null
      end
      item
        Name = 'SQL'
        DataType = rtString
        Flag = fIn
        Value = Null
      end
      item
        Name = 'Parametros'
        DataType = rtUserDefined
        Flag = fIn
        TypeName = 'TParametros'
        Value = Null
      end>
    GetDataCall.Default = False
    GetDataCall.OutgoingTableNamesParameter = 'aTableNameArray'
    GetDataCall.OutgoingTableRequestInfosParameter = 'aTableRequestInfoArray'
    GetDataCall.IncomingDataParameter = 'Result'
    UpdateDataCall.RemoteService = RemoteService
    GetScriptsCall.RemoteService = RemoteService
    RemoteService = RemoteService
    DataStreamer = DataStreamer
    Left = 320
    Top = 120
  end
  object rdaDetalle: TDARemoteDataAdapter
    GetSchemaCall.RemoteService = RemoteService
    GetDataCall.RemoteService = RemoteService
    GetDataCall.MethodName = 'AbreDataSetReportes'
    GetDataCall.Params = <
      item
        Name = 'Result'
        DataType = rtBinary
        Flag = fResult
        Value = Null
      end
      item
        Name = 'SQL'
        DataType = rtString
        Flag = fIn
      end
      item
        Name = 'Parametros'
        DataType = rtUserDefined
        Flag = fIn
        TypeName = 'TParametros'
        Value = Null
      end>
    GetDataCall.Default = False
    GetDataCall.OutgoingTableNamesParameter = 'aTableNameArray'
    GetDataCall.OutgoingTableRequestInfosParameter = 'aTableRequestInfoArray'
    GetDataCall.IncomingDataParameter = 'Result'
    UpdateDataCall.RemoteService = RemoteService
    GetScriptsCall.RemoteService = RemoteService
    RemoteService = RemoteService
    DataStreamer = DataStreamer
    Left = 392
    Top = 120
  end
  object repReportes: TppReport
    AutoStop = False
    DataPipeline = dbpDetalle
    NoDataBehaviors = [ndBlankReport]
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Legal'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 5
    Template.SaveTo = stDatabase
    Template.Format = ftASCII
    AllowPrintToArchive = True
    AllowPrintToFile = True
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    ModalCancelDialog = False
    OpenFile = False
    OutlineSettings.CreateNode = False
    OutlineSettings.CreatePageNodes = False
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    ThumbnailSettings.Enabled = True
    ThumbnailSettings.Visible = True
    ThumbnailSettings.DeadSpace = 30
    PDFSettings.EmbedFontOptions = [efUseSubset]
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.EncryptSettings.KeyLength = kl40Bit
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 25
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    ShowCancelDialog = False
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 320
    Top = 8
    Version = '15.02'
    mmColumnWidth = 0
    DataPipelineName = 'dbpDetalle'
    object ppHeaderBand1: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppDetailBand1: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppFooterBand1: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppDesignLayers1: TppDesignLayers
      object ppDesignLayer1: TppDesignLayer
        UserName = 'Foreground'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object dbpMaestro: TppDBPipeline
    DataSource = dsMaestro
    SkipWhenNoRecords = False
    UserName = 'dbpMaestro'
    Left = 320
    Top = 64
  end
  object dbpDetalle: TppDBPipeline
    DataSource = dsDetalle
    SkipWhenNoRecords = False
    UserName = 'dbpDetalle'
    Left = 392
    Top = 72
  end
  object cdsConfiguracion: TDAMemDataTable
    Fields = <
      item
        Name = 'TIPOCAMBIO'
        DataType = datFloat
      end
      item
        Name = 'FORMATOCONTROL'
        DataType = datMemo
      end
      item
        Name = 'ESCUELA'
        DataType = datString
        Size = 50
      end
      item
        Name = 'MNIMACAL'
        DataType = datFloat
      end
      item
        Name = 'MAXIMACAL'
        DataType = datFloat
      end
      item
        Name = 'LOGO'
        DataType = datMemo
      end
      item
        Name = 'CICLOACTUAL'
        DataType = datInteger
      end
      item
        Name = 'DIRECCION'
        DataType = datString
        Size = 70
      end
      item
        Name = 'TELEFONO'
        DataType = datString
        Size = 20
      end
      item
        Name = 'IMAGEN1'
        DataType = datMemo
      end
      item
        Name = 'IMAGEN2'
        DataType = datMemo
      end
      item
        Name = 'FAX'
        DataType = datString
        Size = 20
      end
      item
        Name = 'DIRECTOR'
        DataType = datString
        Size = 70
      end
      item
        Name = 'MINUTOSXHORA'
        DataType = datInteger
      end
      item
        Name = 'EMPRESAS'
        DataType = datString
        Size = 10
      end
      item
        Name = 'CALIFICACION1'
        DataType = datString
        Size = 30
      end
      item
        Name = 'CALIFICACION2'
        DataType = datString
        Size = 30
      end
      item
        Name = 'CUENTABANCO1'
        DataType = datString
        Size = 25
      end
      item
        Name = 'BOLETAS'
        DataType = datString
        Size = 150
      end
      item
        Name = 'FECHABOLETAOFICIAL'
        DataType = datDateTime
      end
      item
        Name = 'NoExterior'
        DataType = datString
        Size = 20
      end
      item
        Name = 'Localidad'
        DataType = datString
        Size = 50
      end
      item
        Name = 'Municipio'
        DataType = datString
        Size = 50
      end
      item
        Name = 'Estado'
        DataType = datString
        Size = 50
      end
      item
        Name = 'Pais'
        DataType = datString
        Size = 50
      end
      item
        Name = 'noAprobacion'
        DataType = datInteger
      end
      item
        Name = 'Colonia'
        DataType = datString
        Size = 50
      end
      item
        Name = 'CodigoPostal'
        DataType = datString
        Size = 50
      end
      item
        Name = 'NoCertificado'
        DataType = datString
        Size = 50
      end
      item
        Name = 'ArchivoClavePrivada'
        DataType = datString
        Size = 200
      end
      item
        Name = 'ArchivoCertificado'
        DataType = datString
        Size = 200
      end
      item
        Name = 'ClavePriv'
        DataType = datString
        Size = 200
      end
      item
        Name = 'Certificado'
        DataType = datString
        Size = 4000
      end
      item
        Name = 'PasswordFCTElect'
        DataType = datString
        Size = 200
      end
      item
        Name = 'EstacionID'
        DataType = datInteger
      end
      item
        Name = 'Sucursal'
        DataType = datBoolean
      end
      item
        Name = 'SucursalDE'
        DataType = datInteger
      end
      item
        Name = 'Telefono1'
        DataType = datString
        Size = 50
      end
      item
        Name = 'Telefono2'
        DataType = datString
        Size = 50
      end
      item
        Name = 'AnoAprobacion'
        DataType = datDateTime
      end
      item
        Name = 'FolioInicial'
        DataType = datInteger
      end
      item
        Name = 'FolioFinal'
        DataType = datInteger
      end
      item
        Name = 'ImpuestoPorcentaje'
        DataType = datFloat
      end
      item
        Name = 'RFC'
        DataType = datString
        Size = 50
      end
      item
        Name = 'CALIFICACION3'
        DataType = datString
        Size = 30
      end
      item
        Name = 'SITIOTIMBREFISCAL'
        DataType = datString
        Size = 200
      end
      item
        Name = 'USUARIOTIMBREFISCAL'
        DataType = datString
        Size = 150
      end
      item
        Name = 'PASSWORDTIMBREFISCAL'
        DataType = datString
        Size = 150
      end
      item
        Name = 'NUMEROESTACION'
        DataType = datInteger
      end
      item
        Name = 'SerieFacturaDebito'
        DataType = datString
        Size = 100
      end
      item
        Name = 'SerieFacturaCredito'
        DataType = datString
        Size = 100
      end
      item
        Name = 'ReporteFacturaCreditoDebito'
        DataType = datString
        Size = 100
      end
      item
        Name = 'NOMBRECOMERCIAL'
        DataType = datString
        Size = 100
      end
      item
        Name = 'TIPOINGRESO'
        DataType = datString
        Size = 50
      end>
    LogicalName = 'dbo CONFIGURACION'
    Params = <>
    RemoteDataAdapter = RemoteDataAdapter
    RemoteUpdatesOptions = []
    StreamingOptions = [soDisableEventsWhileStreaming]
    IndexDefs = <>
    Left = 320
    Top = 272
  end
  object StyleRepository: TcxStyleRepository
    Left = 320
    Top = 328
    PixelsPerInch = 96
    object TcxStyle
    end
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = clSkyBlue
    end
    object TcxStyle
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor]
      Color = clMoneyGreen
    end
  end
  object tblDatos: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 192
    Top = 8
  end
  object PSScript1: TPSScript
    CompilerOptions = [icBooleanShortCircuit]
    OnCompile = PSScript1Compile
    OnExecute = PSScript1Execute
    OnCompImport = PSScript1CompImport
    OnExecImport = PSScript1ExecImport
    Plugins = <>
    UsePreProcessor = False
    Left = 192
    Top = 120
  end
  object dsDatos: TDataSource
    DataSet = tblDatos
    Left = 192
    Top = 64
  end
  object sdExportar: TSaveDialog
    DefaultExt = '.txt'
    Filter = 'Archivo Texto (*.txt)|*.txt|Todos los Archivos (*.*)|*.*'
    Left = 189
    Top = 234
  end
  object cdsDatos: TDACDSDataTable
    Fields = <
      item
        Name = 'ReporteID'
        DataType = datInteger
      end
      item
        Name = 'Nombre'
        DataType = datString
        Size = 50
      end
      item
        Name = 'Tipo'
        DataType = datInteger
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
        Name = 'TemplateMedia'
        DataType = datMemo
      end
      item
        Name = 'TemplateBaja'
        DataType = datMemo
      end
      item
        Name = 'TemplateExportar'
        DataType = datMemo
      end
      item
        Name = 'SQL1'
        DataType = datMemo
      end
      item
        Name = 'SQL2'
        DataType = datMemo
      end
      item
        Name = 'CampoJoin'
        DataType = datString
        Size = 20
      end>
    LogicalName = 'Datos'
    MasterMappingMode = mmDataRequest
    Params = <
      item
        Name = 'Nombre'
        Value = 'a'
        ParamType = daptInput
      end>
    RemoteDataAdapter = rdaDatos
    RemoteUpdatesOptions = []
    StreamingOptions = [soDisableEventsWhileStreaming]
    IndexDefs = <>
    Left = 472
    Top = 64
  end
  object rdaDatos: TDARemoteDataAdapter
    GetSchemaCall.RemoteService = RemoteService
    GetDataCall.RemoteService = RemoteService
    GetDataCall.MethodName = 'AbreDataSetReportes'
    GetDataCall.Params = <
      item
        Name = 'Result'
        DataType = rtBinary
        Flag = fResult
        Value = Null
      end
      item
        Name = 'SQL'
        DataType = rtString
        Flag = fIn
      end
      item
        Name = 'Parametros'
        DataType = rtUserDefined
        Flag = fIn
        TypeName = 'TParametrosBI'
        Value = Null
      end>
    GetDataCall.Default = False
    GetDataCall.OutgoingTableNamesParameter = 'aTableNameArray'
    GetDataCall.OutgoingTableRequestInfosParameter = 'aTableRequestInfoArray'
    GetDataCall.IncomingDataParameter = 'Result'
    UpdateDataCall.RemoteService = RemoteService
    GetScriptsCall.RemoteService = RemoteService
    RemoteService = RemoteService
    DataStreamer = DataStreamer
    Left = 536
    Top = 64
  end
  object rdReportes: TppDesigner
    Caption = 'Editor de Reportes'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.DatabaseType = dtParadox
    DataSettings.GuidCollationType = gcString
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = repReportes2
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 600
    WindowLeft = 0
    WindowTop = 0
    WindowWidth = 800
    WindowState = wsMaximized
    Left = 472
    Top = 120
  end
  object repReportes2: TppReport
    AutoStop = False
    DataPipeline = dbpDatos
    NoDataBehaviors = [ndBlankReport]
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Legal'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 5
    Template.SaveTo = stDatabase
    Template.Format = ftASCII
    AllowPrintToArchive = True
    AllowPrintToFile = True
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    ModalCancelDialog = False
    OpenFile = False
    OutlineSettings.CreateNode = False
    OutlineSettings.CreatePageNodes = False
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    ThumbnailSettings.Enabled = True
    ThumbnailSettings.Visible = True
    ThumbnailSettings.DeadSpace = 30
    PDFSettings.EmbedFontOptions = [efUseSubset]
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.EncryptSettings.KeyLength = kl40Bit
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 25
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    ShowCancelDialog = False
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 536
    Top = 120
    Version = '15.02'
    mmColumnWidth = 0
    DataPipelineName = 'dbpDatos'
    object ppHeaderBand2: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppDetailBand2: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppFooterBand2: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppDesignLayers2: TppDesignLayers
      object ppDesignLayer2: TppDesignLayer
        UserName = 'Foreground1'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList2: TppParameterList
    end
  end
  object dbpDatos: TppDBPipeline
    DataSource = dsDatos
    UserName = 'dbpDatos'
    Left = 472
    Top = 16
  end
end
