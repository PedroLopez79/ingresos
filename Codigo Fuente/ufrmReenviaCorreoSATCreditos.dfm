inherited frmReenviaCorreoSATCreditos: TfrmReenviaCorreoSATCreditos
  Caption = 'frmReenviaCorreoSATCreditos'
  ClientWidth = 762
  OnShow = FormShow
  ExplicitWidth = 762
  ExplicitHeight = 449
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox4: TcxGroupBox
    Left = 0
    Top = 0
    Align = alTop
    Caption = '  Parametros para facturar  '
    Style.BorderStyle = ebsThick
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 0
    Height = 110
    Width = 762
    object Label9: TLabel
      Left = 33
      Top = 30
      Width = 47
      Height = 13
      Caption = 'De Fecha'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label1: TLabel
      Left = 227
      Top = 30
      Width = 7
      Height = 13
      Caption = 'A'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label2: TLabel
      Left = 33
      Top = 57
      Width = 32
      Height = 13
      Caption = 'Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label7: TLabel
      Left = 161
      Top = 58
      Width = 37
      Height = 13
      Caption = 'Nombre'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object lblSerie: TLabel
      Left = 33
      Top = 84
      Width = 24
      Height = 13
      Caption = 'Serie'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object btnPreeliminar: TcxButton
      Left = 380
      Top = 25
      Width = 95
      Height = 25
      Caption = 'Preeliminar'
      TabOrder = 0
      OnClick = btnPreeliminarClick
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF004A66
        7C00BE959600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF006B9CC3001E89
        E8004B7AA300C8969300FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF004BB4FE0051B5
        FF002089E9004B7AA200C6959200FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0051B7
        FE0051B3FF001D87E6004E7AA000CA979200FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF0051B7FE004EB2FF001F89E6004E7BA200B9949700FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0052B8FE004BB1FF002787D9005F6A7600FF00FF00B0857F00C09F
        9400C09F9600BC988E00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0055BDFF00B5D6ED00BF9D9200BB9B8C00E7DAC200FFFF
        E300FFFFE500FDFADA00D8C3B300B58D8500FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00CEA79500FDEEBE00FFFFD800FFFF
        DA00FFFFDB00FFFFE600FFFFFB00EADDDC00AE837F00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00C1A09100FBDCA800FEF7D000FFFF
        DB00FFFFE300FFFFF800FFFFFD00FFFFFD00C6A99C00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00C1A09100FEE3AC00F1C49100FCF2CA00FFFF
        DD00FFFFE400FFFFF700FFFFF700FFFFE900EEE5CB00B9948C00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00C2A19100FFE6AE00EEB58100F7DCAE00FEFD
        D800FFFFDF00FFFFE300FFFFE400FFFFE000F3ECD200BB968E00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00BC978C00FBE7B700F4C79100F2C99400F8E5
        B900FEFCD800FFFFDD00FFFFDC00FFFFE000E2D2BA00B68E8600FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00D9C3A900FFFEE500F7DCB800F2C9
        9400F5D4A500FAE8BD00FDF4C900FDFBD600B6908900FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00B58D8500E8DEDD00FFFEF200F9D8
        A300F4C48C00F9D49F00FDEAB800D0B49F00B8908600FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00AD827F00C9AA9E00EFE0
        B700EFDFB200E7CEAC00B8908600B8908600FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00BA96
        8A00BB988C00B7918800FF00FF00FF00FF00FF00FF00FF00FF00}
      LookAndFeel.Kind = lfOffice11
    end
    object cxDateEdit1: TcxDateEdit
      Left = 86
      Top = 27
      TabOrder = 1
      Width = 121
    end
    object cxDateEdit2: TcxDateEdit
      Left = 253
      Top = 27
      TabOrder = 2
      Width = 121
    end
    object edtNombre: TcxTextEdit
      Left = 211
      Top = 54
      Enabled = False
      Properties.ReadOnly = True
      Style.TextColor = clNavy
      TabOrder = 4
      Width = 437
    end
    object btnBuscaCliente: TcxButton
      Left = 135
      Top = 54
      Width = 25
      Height = 21
      TabOrder = 5
      OnClick = btnBuscaClienteClick
      Colors.Default = clWhite
      Colors.Normal = clWhite
      Colors.Hot = clWhite
      Colors.Pressed = clWhite
      Colors.Disabled = clWhite
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000120B0000120B0000000100000000000000000000FFFF
        FF00FF00FF00623C230062442D005339240072503300CB925E00DAA97600836E
        5800695A4600FFCF8900C2AC8600D4D0C9000A0A0900EDFFFF00F8FFFF0064A5
        AD003692AD0051D4FF00EEFBFF000089BC0039CAFF005CD3FF00091114000493
        C9000C96CF000FA1DC001CBFFF001EC1FF0021BCFB0021BAFA002BC2FE0031C2
        FF002882A50057D0FF005DBAE0008CDDFF00C1EDFF00D0F2FF000075AA00027F
        B600129DDD0017A1E0001CB1F2001BADEB001AA5E0001FB7F8001FB4F4001EAF
        ED003FC5FE0045ABD7004AADD7004093B8007ACEF40072BBDD008AC5DE009DCC
        E200D0EBF700006FA5000173AA000774AC00087AB5000B84C0001498D700148A
        C5001697D50018445B0044ABDE0041A0D00099D3EF00AAD0E300BFE5F7000474
        AF00056BA5000B5B88000C4B6D001680B8002182B60000578A00035A91000464
        9E00046099000454860000518800002A470000243D0002558E0002416A000351
        8800033E640006609A000E6096000D24330000447600013B650000386C00161D
        2300000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000020202020202
        0202020202020202020202020202020202020202020202020202020202020202
        02505853020202020202020202020202572205184B0202020202020202020257
        1C120B045D0260600202020202572D4232240807615C60605A02020257201345
        460F0D094344340A0E5F524D1725263A3539374E1A212E0C0356595748101427
        3329283B192F1D11065557475738362316313F3C151B1E2A4C5E025757574140
        2C1F302B3D4F5B02020202020202024A513E4954020202020202020202020202
        0202020202020202020202020202020202020202020202020202020202020202
        0202020202020202020202020202020202020202020202020202}
      LookAndFeel.NativeStyle = False
    end
    object edtCliente: TcxCurrencyEdit
      Left = 86
      Top = 54
      Properties.DecimalPlaces = 0
      Properties.DisplayFormat = '#####'
      TabOrder = 3
      OnExit = edtClienteExit
      Width = 48
    end
    object edtSerie: TcxTextEdit
      Left = 86
      Top = 81
      TabOrder = 6
      Width = 48
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 110
    Width = 762
    Height = 322
    Align = alClient
    TabOrder = 1
    object cxGrid1DBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = DataSource1
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '#,#0.00'
          Kind = skSum
          FieldName = 'Cantidad'
        end
        item
          Format = '$0,0.00'
          Kind = skSum
          FieldName = 'Importe'
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsView.Footer = True
      object cxGrid1DBTableView1RecId: TcxGridDBColumn
        DataBinding.FieldName = 'RecId'
        Visible = False
      end
      object cxGrid1DBTableView1Reenviar: TcxGridDBColumn
        Caption = 'Reenviar'
        DataBinding.FieldName = 'Reenviar'
        Width = 100
      end
      object cxGrid1DBTableView1RFC: TcxGridDBColumn
        DataBinding.FieldName = 'RFC'
      end
      object cxGrid1DBTableView1Serie: TcxGridDBColumn
        DataBinding.FieldName = 'Serie'
        Width = 136
      end
      object cxGrid1DBTableView1Folio: TcxGridDBColumn
        DataBinding.FieldName = 'Folio'
        Width = 81
      end
      object cxGrid1DBTableView1Total: TcxGridDBColumn
        DataBinding.FieldName = 'Total'
      end
      object cxGrid1DBTableView1Impuesto: TcxGridDBColumn
        DataBinding.FieldName = 'Impuesto'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object prgBar: TProgressBar
    Left = 0
    Top = 432
    Width = 762
    Height = 17
    Align = alBottom
    TabOrder = 2
  end
  object tblFacturas: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 688
    Top = 152
    object tblFacturasVigencia: TBooleanField
      DisplayLabel = 'Cancelar/Vigencia'
      FieldName = 'Reenviar'
    end
    object tblFacturasRFC: TStringField
      FieldName = 'RFC'
    end
    object tblFacturasSerie: TStringField
      FieldName = 'Serie'
    end
    object tblFacturasFolio: TIntegerField
      FieldName = 'Folio'
    end
    object tblFacturasTotal: TFloatField
      FieldName = 'Total'
    end
    object tblFacturasImpuesto: TFloatField
      FieldName = 'Impuesto'
    end
    object tblFacturasFECHANOAPROBACION: TStringField
      FieldName = 'FECHANOAPROBACION'
    end
    object tblFacturasFECHAHORA: TStringField
      FieldName = 'FECHAHORA'
    end
    object tblFacturasFacturaID: TIntegerField
      FieldName = 'FacturaID'
    end
  end
  object DataSource1: TDataSource
    DataSet = tblFacturas
    Left = 720
    Top = 152
  end
  object dsFacturas: TDADataSource
    Left = 16
    Top = 232
  end
  object DADataSource1: TDADataSource
    DataSet = cdsEstacion.Dataset
    DataTable = cdsEstacion
    Left = 688
    Top = 312
  end
  object cdsEstacion: TDACDSDataTable
    RemoteUpdatesOptions = []
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
    Params = <>
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = DMFlotillas.RemoteDataAdapter
    LogicalName = 'dbo Estacion'
    IndexDefs = <>
    Left = 688
    Top = 280
  end
  object cdsGasolinero: TDACDSDataTable
    RemoteUpdatesOptions = []
    Fields = <
      item
        Name = 'GasolineroID'
        DataType = datInteger
        Required = True
        InPrimaryKey = True
      end
      item
        Name = 'Nombre'
        DataType = datString
        Size = 70
        Required = True
      end
      item
        Name = 'Domicilio'
        DataType = datString
        Size = 100
        Required = True
      end
      item
        Name = 'RFC'
        DataType = datString
        Size = 20
        Required = True
      end
      item
        Name = 'IVA'
        DataType = datFloat
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
      end>
    Params = <>
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = DMFlotillas.RemoteDataAdapter
    LogicalName = 'dbo Gasolinero'
    IndexDefs = <>
    Left = 688
    Top = 247
  end
  object rdaFacturas: TDARemoteDataAdapter
    GetSchemaCall.RemoteService = DMFlotillas.RemoteService
    GetDataCall.RemoteService = DMFlotillas.RemoteService
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
        TypeName = 'TParametrosF'
        Value = Null
      end>
    GetDataCall.Default = False
    GetDataCall.OutgoingTableNamesParameter = 'aTableNameArray'
    GetDataCall.OutgoingTableRequestInfosParameter = 'aTableRequestInfoArray'
    GetDataCall.IncomingDataParameter = 'Result'
    UpdateDataCall.RemoteService = DMFlotillas.RemoteService
    GetScriptsCall.RemoteService = DMFlotillas.RemoteService
    RemoteService = DMFlotillas.RemoteService
    DataStreamer = DM.DataStreamer
    Left = 16
    Top = 168
  end
  object cdsFacturas: TDAMemDataTable
    RemoteUpdatesOptions = []
    Fields = <>
    Params = <>
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = rdaFacturas
    LogicalName = 'Reporte'
    IndexDefs = <>
    Left = 16
    Top = 200
  end
  object dsCliente: TDADataSource
    DataSet = cdsCliente.Dataset
    DataTable = cdsCliente
    Left = 640
    Top = 296
  end
  object cdsCliente: TDACDSDataTable
    RemoteUpdatesOptions = []
    Fields = <
      item
        Name = 'ClienteID'
        DataType = datInteger
      end
      item
        Name = 'Nombre'
        DataType = datString
        Size = 70
      end
      item
        Name = 'Estatus'
        DataType = datString
        Size = 1
      end
      item
        Name = 'FormaPagoID'
        DataType = datInteger
      end
      item
        Name = 'CuentaContable'
        DataType = datString
        Size = 15
      end
      item
        Name = 'FormaCompraID'
        DataType = datInteger
      end>
    Params = <
      item
        Name = 'Cliente'
        Value = '1'
        ParamType = daptInput
      end>
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = DMFlotillas.RemoteDataAdapter
    LogicalName = 'BuscaCliente'
    IndexDefs = <>
    Left = 640
    Top = 248
  end
end
