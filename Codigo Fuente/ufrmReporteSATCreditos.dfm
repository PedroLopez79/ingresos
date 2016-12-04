inherited frmReporteSatCreditos: TfrmReporteSatCreditos
  Caption = 'frmReporteSatCreditos'
  ClientWidth = 762
  OnShow = FormShow
  ExplicitWidth = 762
  ExplicitHeight = 449
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox4: TcxGroupBox
    Left = 0
    Top = 0
    Hint = ''
    Align = alTop
    Caption = '  Parametros para facturar  '
    Style.BorderStyle = ebsThick
    Style.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 0
    Height = 65
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
    object btnPreeliminar: TcxButton
      Left = 499
      Top = 26
      Width = 95
      Height = 25
      Caption = 'Preeliminar'
      LookAndFeel.Kind = lfOffice11
      OptionsImage.Glyph.Data = {
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
      TabOrder = 0
      OnClick = btnPreeliminarClick
    end
    object cxDateEdit2: TcxDateEdit
      Left = 253
      Top = 27
      Hint = ''
      TabOrder = 1
      Width = 121
    end
    object dtpHora: TcxTimeEdit
      Left = 383
      Top = 27
      Hint = ''
      EditValue = 0d
      Style.BorderStyle = ebsOffice11
      Style.LookAndFeel.Kind = lfOffice11
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.Kind = lfOffice11
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfOffice11
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfOffice11
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 2
      Width = 73
    end
    object cxDateEdit1: TcxDateEdit
      Left = 86
      Top = 27
      Hint = ''
      TabOrder = 3
      Width = 121
    end
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 65
    Width = 762
    Height = 367
    Hint = ''
    Align = alClient
    TabOrder = 1
    object cxGrid1DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
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
      object cxGrid1DBTableView1Vigencia: TcxGridDBColumn
        Caption = 'Vigente'
        DataBinding.FieldName = 'Vigencia'
        Width = 103
      end
      object cxGrid1DBTableView1RFC: TcxGridDBColumn
        DataBinding.FieldName = 'RFC'
        Width = 219
      end
      object cxGrid1DBTableView1Serie: TcxGridDBColumn
        DataBinding.FieldName = 'Serie'
        Width = 121
      end
      object cxGrid1DBTableView1Folio: TcxGridDBColumn
        DataBinding.FieldName = 'Folio'
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
      FieldName = 'Vigencia'
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
  object spActualizaFacturaElectronica: TDACDSDataTable
    Fields = <
      item
        Name = 'COLUMN1'
        DataType = datInteger
      end>
    LogicalName = 'spActualizaFacturaElectronica'
    Params = <
      item
        Name = 'VIGENCIA'
        Value = '1'
      end
      item
        Name = 'FACTURAID'
        Value = '1'
      end>
    RemoteDataAdapter = DMFlotillas.RemoteDataAdapter
    RemoteUpdatesOptions = []
    StreamingOptions = [soDisableEventsWhileStreaming]
    IndexDefs = <>
    Left = 688
    Top = 247
  end
  object cdsConfiguracion: TDACDSDataTable
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
    Left = 688
    Top = 279
  end
  object DataSource2: TDataSource
    DataSet = tblFacturas
    Left = 720
    Top = 280
  end
  object SaveDialog1: TSaveDialog
    Filter = 'Texto|*.txt'
    Left = 16
    Top = 160
  end
  object OpenDialog: TOpenDialog
    Left = 656
    Top = 248
  end
end
