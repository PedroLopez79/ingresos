object ServerDataModule: TServerDataModule
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 261
  Width = 294
  object Server: TROIndyHTTPServer
    Dispatchers = <
      item
        Name = 'Message'
        Message = Message
        Enabled = True
        PathInfo = 'Bin'
      end
      item
        Name = 'ROSOAP'
        Message = ROSOAP
        Enabled = True
        PathInfo = 'SOAP'
      end
      item
        Name = 'ROJSON'
        Message = ROJSON
        Enabled = True
        PathInfo = 'JSON'
      end>
    SendClientAccessPolicyXml = captAllowAll
    IndyServer.Bindings = <>
    IndyServer.DefaultPort = 8001
    IndyServer.ListenQueue = 45
    Port = 8001
    Left = 32
    Top = 8
  end
  object Message: TROBinMessage
    Envelopes = <>
    Left = 32
    Top = 56
  end
  object ConnectionManager: TDAConnectionManager
    Connections = <
      item
        Name = 'INGRESOS'
        ConnectionString = 
          'SDAC?Server=IANSERVICES.DDNS.NET\IAN;Database=GAUSS;UserID=sa;Pa' +
          'ssword=IAN32;'
        ConnectionType = 'MSSQL'
        Default = True
      end>
    DriverManager = DriverManager
    PoolingEnabled = True
    Left = 136
    Top = 56
  end
  object DriverManager: TDADriverManager
    DriverDirectory = '%SYSTEM%\'
    TraceActive = False
    TraceFlags = []
    Left = 136
    Top = 8
  end
  object DataDictionary: TDADataDictionary
    Fields = <>
    Left = 32
    Top = 152
  end
  object SessionManager: TROInMemorySessionManager
    Left = 136
    Top = 104
  end
  object ROSOAP: TROSOAPMessage
    Envelopes = <>
    SerializationOptions = [xsoSendUntyped, xsoStrictStructureFieldOrder, xsoDocument, xsoSplitServiceWsdls]
    Left = 32
    Top = 104
  end
  object ROJSON: TROJSONMessage
    Envelopes = <>
    ExtendedExceptionClass = 'ROJSONException'
    Left = 136
    Top = 160
  end
end
