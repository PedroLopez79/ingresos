object DMFlotillas: TDMFlotillas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 401
  Width = 415
  object Channel: TROWinInetHTTPChannel
    UserAgent = 'RemObjects SDK'
    DispatchOptions = []
    ServerLocators = <>
    TargetURL = 'http://localhost:9002/BIN'
    TrustInvalidCA = False
    Left = 32
    Top = 16
  end
  object Message: TROBinMessage
    Envelopes = <>
    Left = 32
    Top = 64
  end
  object RemoteService: TRORemoteService
    ServiceName = 'ServiceFlotillas'
    Channel = Channel
    Message = Message
    Left = 32
    Top = 112
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
        Size = 10
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
        Size = 30
      end
      item
        Name = 'IdentificadorID'
        DataType = datInteger
      end>
    LogicalName = 'Datos'
    MasterMappingMode = mmDataRequest
    Params = <
      item
        Name = 'Nombre'
        Value = 's'
        ParamType = daptInput
      end>
    RemoteDataAdapter = rdaDatos
    RemoteUpdatesOptions = []
    StreamingOptions = [soDisableEventsWhileStreaming]
    IndexDefs = <>
    Left = 120
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
        TypeName = 'TParametrosF'
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
    Left = 120
    Top = 16
  end
  object DataStreamer: TDABin2DataStreamer
    Left = 32
    Top = 168
  end
  object cdsEstacion: TDAMemDataTable
    Fields = <
      item
        Name = 'EstacionID'
        DataType = datInteger
        Required = True
        InPrimaryKey = True
      end
      item
        Name = 'Nombre'
        DataType = datString
        Size = 30
        Required = True
      end
      item
        Name = 'RazonSocial'
        DataType = datString
        Size = 70
      end
      item
        Name = 'RFC'
        DataType = datString
        Size = 20
      end
      item
        Name = 'ClavePemex'
        DataType = datString
        Size = 15
      end
      item
        Name = 'Estatus'
        DataType = datString
        Size = 1
        Required = True
      end
      item
        Name = 'CuentaContable'
        DataType = datString
        Size = 50
      end
      item
        Name = 'CuentaIVANoCobrado'
        DataType = datString
        Size = 50
      end
      item
        Name = 'CuentaIVACobrado'
        DataType = datString
        Size = 50
      end
      item
        Name = 'CuentaVentas'
        DataType = datString
        Size = 50
      end
      item
        Name = 'IVA'
        DataType = datFloat
      end
      item
        Name = 'GasolineroID'
        DataType = datInteger
        Required = True
      end>
    LogicalName = 'dbo Estacion'
    Params = <>
    RemoteDataAdapter = RemoteDataAdapter
    RemoteUpdatesOptions = []
    StreamingOptions = [soDisableEventsWhileStreaming]
    IndexDefs = <>
    Left = 208
    Top = 16
  end
  object RemoteDataAdapter: TDARemoteDataAdapter
    GetSchemaCall.RemoteService = RemoteService
    GetDataCall.RemoteService = RemoteService
    GetDataCall.MethodName = 'GetData'
    GetDataCall.Params = <
      item
        Name = 'Result'
        DataType = rtBinary
        Flag = fResult
        Value = Null
      end
      item
        Name = 'aTableNameArray'
        DataType = rtUserDefined
        Flag = fIn
        TypeName = 'StringArray'
        Value = Null
      end
      item
        Name = 'aTableRequestInfoArray'
        DataType = rtUserDefined
        Flag = fIn
        TypeName = 'TableRequestInfoArray'
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
    Left = 120
    Top = 112
  end
  object dsEstacion: TDADataSource
    DataSet = cdsEstacion.Dataset
    DataTable = cdsEstacion
    Left = 208
    Top = 64
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
    Left = 272
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
    Left = 344
    Top = 168
  end
  object dsMaestro: TDADataSource
    DataSet = cdsMaestro.Dataset
    DataTable = cdsMaestro
    Left = 272
    Top = 216
  end
  object dsDetalle: TDADataSource
    DataSet = cdsDetalle.Dataset
    DataTable = cdsDetalle
    Left = 344
    Top = 216
  end
  object dbpMaestro: TppDBPipeline
    DataSource = dsMaestro
    SkipWhenNoRecords = False
    UserName = 'dbpMaestro'
    Left = 272
    Top = 72
  end
  object dbpDetalle: TppDBPipeline
    DataSource = dsDetalle
    SkipWhenNoRecords = False
    UserName = 'dbpDetalle'
    Left = 344
    Top = 72
    MasterDataPipelineName = 'dbpMaestro'
  end
  object repReportes: TppReport
    AutoStop = False
    DataPipeline = dbpMaestro
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
    Left = 272
    Top = 16
    Version = '15.02'
    mmColumnWidth = 0
    DataPipelineName = 'dbpMaestro'
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
    object ppParameterList1: TppParameterList
    end
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
    Left = 272
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
    Left = 344
    Top = 120
  end
  object cdsConfiguracion: TDAMemDataTable
    Fields = <
      item
        Name = 'IDCONFIGURACION'
        DataType = datInteger
      end
      item
        Name = 'TIPOCAMBIO'
        DataType = datFloat
      end
      item
        Name = 'EMPRESA'
        DataType = datString
        Size = 50
      end
      item
        Name = 'LOGO'
        DataType = datMemo
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
        Name = 'NOMBRECOMERCIAL'
        DataType = datString
        Size = 70
      end
      item
        Name = 'FAX'
        DataType = datString
        Size = 20
      end
      item
        Name = 'CUENTABANCO1'
        DataType = datString
        Size = 25
      end
      item
        Name = 'RFC'
        DataType = datString
        Size = 50
      end
      item
        Name = 'NoExterior'
        DataType = datString
        Size = 20
      end
      item
        Name = 'NoInterior'
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
        Name = 'CC'
        DataType = datString
        Size = 20
      end
      item
        Name = 'CLAVEPEMEX'
        DataType = datString
        Size = 50
      end
      item
        Name = 'CIUDAD'
        DataType = datString
        Size = 30
      end
      item
        Name = 'BOMBAS'
        DataType = datInteger
      end
      item
        Name = 'HOSTVOLUMETRICO'
        DataType = datString
        Size = 30
      end
      item
        Name = 'PUERTOVOLUMETRICO'
        DataType = datString
        Size = 50
      end
      item
        Name = 'HOSTFLOTILLAS'
        DataType = datString
        Size = 30
      end
      item
        Name = 'PUERTOFLOTILLAS'
        DataType = datString
        Size = 10
      end
      item
        Name = 'NUMEROESTACION'
        DataType = datInteger
      end
      item
        Name = 'EMAIL'
        DataType = datString
        Size = 50
      end
      item
        Name = 'SERIEFACTURACREDITO'
        DataType = datString
        Size = 20
      end
      item
        Name = 'SERIEFACTURADEBITO'
        DataType = datString
        Size = 20
      end
      item
        Name = 'REPORTEFACTURACREDITODEBITO'
        DataType = datString
        Size = 150
      end
      item
        Name = 'LICENCIA'
        DataType = datString
        Size = 150
      end
      item
        Name = 'VERSION'
        DataType = datString
        Size = 50
      end
      item
        Name = 'TIPOINGRESO'
        DataType = datString
        Size = 50
      end>
    LogicalName = 'dbo CONFIGURACION'
    Params = <>
    RemoteDataAdapter = DM.RemoteDataAdapter
    RemoteUpdatesOptions = []
    StreamingOptions = [soDisableEventsWhileStreaming]
    IndexDefs = <>
    Left = 32
    Top = 344
  end
end
