inherited frmSaldosClientes: TfrmSaldosClientes
  Caption = 'Saldos Clientes'
  ClientHeight = 459
  ClientWidth = 968
  OnKeyDown = FormKeyDown
  ExplicitLeft = -141
  ExplicitWidth = 968
  ExplicitHeight = 459
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel
    Left = 16
    Top = 97
    Width = 80
    Height = 13
    Caption = 'L'#237'mite de Cr'#233'dito'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label4: TLabel
    Left = 16
    Top = 65
    Width = 57
    Height = 13
    Caption = 'Saldo Inicial'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label11: TLabel
    Left = 16
    Top = 193
    Width = 85
    Height = 13
    Caption = 'Cr'#233'dito Disponible'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label10: TLabel
    Left = 16
    Top = 160
    Width = 27
    Height = 13
    Caption = 'Saldo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label9: TLabel
    Left = 16
    Top = 129
    Width = 93
    Height = 13
    Caption = 'Cosumos x Facturar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Panel2: TPanel
    Left = 0
    Top = 32
    Width = 968
    Height = 2
    Align = alTop
    BevelOuter = bvNone
    Color = clNone
    ParentBackground = False
    TabOrder = 0
    ExplicitLeft = -74
    ExplicitWidth = 827
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 968
    Height = 32
    Align = alTop
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Caption = ' Cliente ID  |----->'
    Color = clBtnShadow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
    object Label65: TLabel
      Left = 102
      Top = 8
      Width = 49
      Height = 16
      Caption = 'Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label6: TLabel
      Left = 295
      Top = 10
      Width = 40
      Height = 13
      Caption = 'Ejercicio'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label7: TLabel
      Left = 405
      Top = 9
      Width = 66
      Height = 13
      Caption = 'Periodo Inicial'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label8: TLabel
      Left = 616
      Top = 8
      Width = 61
      Height = 13
      Caption = 'Periodo Final'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object edtCliente: TcxCurrencyEdit
      Left = 157
      Top = 5
      ParentFont = False
      Properties.DecimalPlaces = 0
      Properties.DisplayFormat = '0000'
      Properties.ReadOnly = False
      Style.BorderStyle = ebsOffice11
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clBlack
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.Kind = lfOffice11
      Style.LookAndFeel.NativeStyle = True
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.Kind = lfOffice11
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.Kind = lfOffice11
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.Kind = lfOffice11
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 0
      OnExit = edtClienteExit
      Width = 104
    end
    object btnBuscaCliente: TcxButton
      Left = 264
      Top = 6
      Width = 25
      Height = 21
      TabOrder = 1
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
    object edtEjercicio: TcxSpinEdit
      Left = 342
      Top = 5
      Properties.MaxValue = 2006.000000000000000000
      Properties.MinValue = 2006.000000000000000000
      TabOrder = 2
      Value = 2006
      Width = 57
    end
    object cbPeriodoIni: TcxImageComboBox
      Left = 477
      Top = 5
      Properties.ButtonGlyph.Data = {
        46020000424D460200000000000036000000280000000E0000000C0000000100
        1800000000001002000000000000000000000000000000000000FF00FFFF00FF
        8080808080808080808080808080808080808080808080808080808080808080
        80FF00FF0000FF00FF0000000000008000000000008000008000000000008000
        00000000000000800000808080FF00FF0000FF00FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF800000808080FF00FF0000FF00
        FFFFFFFF000000000000000000FFFFFF000000000000000000C0C0C0FFFFFF80
        0000808080FF00FF0000FF00FFFFFFFFFFFFFF000000FFFFFFFFFFFFC0C0C0FF
        FFFFC0C0C0000000FFFFFF800000808080FF00FF0000FF00FFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF800000808080FF00FF
        0000FF00FFFFFFFFFFFFFF000000FFFFFFFFFFFF000000000000000000C0C0C0
        FFFFFF800000808080FF00FF0000FF00FFFFFFFF000000000000FFFFFFFFFFFF
        000000FFFFFFFFFFFFFFFFFFFFFFFF800000808080FF00FF0000FF00FFFFFFFF
        FFFFFF000000FFFFFFFFFFFF000000000000000000000000FFFFFF8000008080
        80FF00FF0000FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF800000808080FF00FF0000FF00FFFFFFFFC0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0FFFFFF800000808080FF00FF0000FF00
        FF000000000000000000000000000000000000000000000000000000000000FF
        00FFFF00FFFF00FF0000}
      Properties.Items = <
        item
          Description = 'ENERO'
          ImageIndex = 0
          Value = 1
        end
        item
          Description = 'FEBRERO'
          Value = 2
        end
        item
          Description = 'MARZO'
          Value = 3
        end
        item
          Description = 'ABRIL'
          Value = 4
        end
        item
          Description = 'MAYO'
          Value = 5
        end
        item
          Description = 'JUNIO'
          Value = 6
        end
        item
          Description = 'JULIO'
          Value = 7
        end
        item
          Description = 'AGOSTO'
          Value = 8
        end
        item
          Description = 'SEPTIEMBRE'
          Value = 9
        end
        item
          Description = 'OCTUBRE'
          Value = 10
        end
        item
          Description = 'NOVIEMBRE'
          Value = 11
        end
        item
          Description = 'DICIEMBRE'
          Value = 12
        end>
      TabOrder = 3
      Width = 133
    end
    object cbPeriodoFin: TcxImageComboBox
      Left = 683
      Top = 5
      Properties.ButtonGlyph.Data = {
        46020000424D460200000000000036000000280000000E0000000C0000000100
        1800000000001002000000000000000000000000000000000000FF00FFFF00FF
        8080808080808080808080808080808080808080808080808080808080808080
        80FF00FF0000FF00FF0000000000008000000000008000008000000000008000
        00000000000000800000808080FF00FF0000FF00FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF800000808080FF00FF0000FF00
        FFFFFFFF000000000000000000FFFFFF000000000000000000C0C0C0FFFFFF80
        0000808080FF00FF0000FF00FFFFFFFFFFFFFF000000FFFFFFFFFFFFC0C0C0FF
        FFFFC0C0C0000000FFFFFF800000808080FF00FF0000FF00FFFFFFFFFFFFFF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF800000808080FF00FF
        0000FF00FFFFFFFFFFFFFF000000FFFFFFFFFFFF000000000000000000C0C0C0
        FFFFFF800000808080FF00FF0000FF00FFFFFFFF000000000000FFFFFFFFFFFF
        000000FFFFFFFFFFFFFFFFFFFFFFFF800000808080FF00FF0000FF00FFFFFFFF
        FFFFFF000000FFFFFFFFFFFF000000000000000000000000FFFFFF8000008080
        80FF00FF0000FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF800000808080FF00FF0000FF00FFFFFFFFC0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0FFFFFF800000808080FF00FF0000FF00
        FF000000000000000000000000000000000000000000000000000000000000FF
        00FFFF00FFFF00FF0000}
      Properties.Items = <
        item
          Description = 'ENERO'
          ImageIndex = 0
          Value = 1
        end
        item
          Description = 'FEBRERO'
          Value = 2
        end
        item
          Description = 'MARZO'
          Value = 3
        end
        item
          Description = 'ABRIL'
          Value = 4
        end
        item
          Description = 'MAYO'
          Value = 5
        end
        item
          Description = 'JUNIO'
          Value = 6
        end
        item
          Description = 'JULIO'
          Value = 7
        end
        item
          Description = 'AGOSTO'
          Value = 8
        end
        item
          Description = 'SEPTIEMBRE'
          Value = 9
        end
        item
          Description = 'OCTUBRE'
          Value = 10
        end
        item
          Description = 'NOVIEMBRE'
          Value = 11
        end
        item
          Description = 'DICIEMBRE'
          Value = 12
        end>
      TabOrder = 4
      Width = 133
    end
    object Button1: TButton
      Left = 822
      Top = 4
      Width = 75
      Height = 25
      Caption = 'Consultar'
      TabOrder = 5
      OnClick = Button1Click
    end
  end
  object Panel3: TPanel
    Left = 264
    Top = 61
    Width = 416
    Height = 149
    TabOrder = 2
    object Label1: TLabel
      Left = 32
      Top = 24
      Width = 5
      Height = 13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 32
      Top = 72
      Width = 5
      Height = 13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 32
      Top = 119
      Width = 5
      Height = 13
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object cxDBTextEdit3: TcxDBTextEdit
    Left = 140
    Top = 61
    DataBinding.DataField = 'SALDOINICIAL'
    DataBinding.DataSource = dsSaldo
    Properties.CharCase = ecUpperCase
    Properties.ReadOnly = True
    Style.TextColor = clNavy
    TabOrder = 3
    Width = 97
  end
  object cxDBTextEdit2: TcxDBTextEdit
    Left = 140
    Top = 93
    DataBinding.DataField = 'LIMITECREDITO'
    DataBinding.DataSource = dsSaldo
    Properties.CharCase = ecUpperCase
    Properties.ReadOnly = True
    Style.TextColor = clNavy
    TabOrder = 4
    Width = 97
  end
  object cxDBTextEdit4: TcxDBTextEdit
    Left = 140
    Top = 125
    DataBinding.DataField = 'CONSUMOS'
    DataBinding.DataSource = dsSaldo
    Properties.CharCase = ecUpperCase
    Properties.ReadOnly = True
    Style.TextColor = clNavy
    TabOrder = 5
    Width = 97
  end
  object cxDBTextEdit5: TcxDBTextEdit
    Left = 140
    Top = 157
    DataBinding.DataField = 'SALDO'
    DataBinding.DataSource = dsSaldo
    Properties.CharCase = ecUpperCase
    Properties.ReadOnly = True
    Style.TextColor = clNavy
    TabOrder = 6
    Width = 97
  end
  object cxDBTextEdit7: TcxDBTextEdit
    Left = 140
    Top = 189
    DataBinding.DataField = 'DISPONIBLE'
    DataBinding.DataSource = dsSaldo
    Properties.CharCase = ecUpperCase
    Properties.ReadOnly = True
    Style.TextColor = clNavy
    TabOrder = 7
    Width = 97
  end
  object dsCatalogo: TDADataSource
    DataSet = cdsCatalogo.Dataset
    DataTable = cdsCatalogo
    Left = 688
    Top = 96
  end
  object cdsCatalogo: TDAMemDataTable
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
        Name = 'RazonSocial'
        DataType = datString
        Size = 70
      end
      item
        Name = 'Domicilio'
        DataType = datString
        Size = 90
      end
      item
        Name = 'Grupo'
        DataType = datString
        Size = 50
      end
      item
        Name = 'Colonia'
        DataType = datString
        Size = 40
      end
      item
        Name = 'CodigoPostal'
        DataType = datString
        Size = 10
      end
      item
        Name = 'Ciudad'
        DataType = datString
        Size = 30
      end
      item
        Name = 'Telefono'
        DataType = datString
        Size = 20
      end
      item
        Name = 'RFC'
        DataType = datString
        Size = 20
      end
      item
        Name = 'CuentaContable'
        DataType = datString
        Size = 20
      end
      item
        Name = 'PlazoPago'
        DataType = datInteger
      end
      item
        Name = 'Estatus'
        DataType = datString
        Size = 1
      end
      item
        Name = 'FechaIngreso'
        DataType = datDateTime
      end
      item
        Name = 'NIP'
        DataType = datString
        Size = 8
      end
      item
        Name = 'FechaBaja'
        DataType = datDateTime
      end
      item
        Name = 'LimiteCredito'
        DataType = datFloat
      end
      item
        Name = 'Deposito'
        DataType = datFloat
      end
      item
        Name = 'CambioCredito'
        DataType = datDateTime
      end
      item
        Name = 'CambioCreditoAnterior'
        DataType = datDateTime
      end
      item
        Name = 'UltimoPago'
        DataType = datDateTime
      end
      item
        Name = 'DiaCorteSemana'
        DataType = datInteger
      end
      item
        Name = 'ClienteNuevo'
        DataType = datBoolean
      end
      item
        Name = 'Tasa'
        DataType = datFloat
      end
      item
        Name = 'TarjetaID'
        DataType = datInteger
      end
      item
        Name = 'FormaPagoID'
        DataType = datInteger
      end
      item
        Name = 'GrupoFacturarID'
        DataType = datInteger
      end
      item
        Name = 'VendedorID'
        DataType = datInteger
      end
      item
        Name = 'GasolineroID'
        DataType = datInteger
      end
      item
        Name = 'FormaCompraID'
        DataType = datInteger
      end
      item
        Name = 'ClasificacionID'
        DataType = datInteger
      end
      item
        Name = 'FacturaConsumoCupon'
        DataType = datBoolean
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
        Name = 'email'
        DataType = datString
        Size = 100
      end
      item
        Name = 'FechaAniversario'
        DataType = datDateTime
      end>
    Params = <>
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = DMFlotillas.RemoteDataAdapter
    LogicalName = 'dbo Cliente'
    IndexDefs = <>
    Left = 688
    Top = 64
  end
  object cdsSaldo: TDAMemDataTable
    RemoteUpdatesOptions = []
    Fields = <
      item
        Name = 'CLIENTE'
        DataType = datInteger
      end
      item
        Name = 'NOMBRE'
        DataType = datString
        Size = 100
      end
      item
        Name = 'RFC'
        DataType = datString
        Size = 25
      end
      item
        Name = 'CALLE'
        DataType = datString
        Size = 100
      end
      item
        Name = 'FECHA'
        DataType = datDateTime
      end
      item
        Name = 'REFERENCIA'
        DataType = datString
        Size = 80
      end
      item
        Name = 'DOCUMENTOID'
        DataType = datInteger
        Alignment = taCenter
      end
      item
        Name = 'CARGO'
        DataType = datCurrency
        DisplayFormat = '#,#0.00'
        Alignment = taRightJustify
      end
      item
        Name = 'ABONO'
        DataType = datCurrency
        DisplayFormat = '#,#0.00'
        Alignment = taRightJustify
      end
      item
        Name = 'LIMITECREDITO'
        DataType = datCurrency
        DisplayFormat = '#,#0.00'
        Alignment = taRightJustify
      end
      item
        Name = 'SALDOINICIAL'
        DataType = datCurrency
        DisplayFormat = '#,#0.00'
        Alignment = taRightJustify
      end
      item
        Name = 'CONSUMOS'
        DataType = datCurrency
        DisplayFormat = '#,#0.00'
        Alignment = taRightJustify
      end
      item
        Name = 'TOTALCARGOS'
        DataType = datCurrency
        DisplayFormat = '#,#0.00'
        Alignment = taRightJustify
      end
      item
        Name = 'TOTALABONOS'
        DataType = datCurrency
        DisplayFormat = '#,#0.00'
        Alignment = taRightJustify
      end
      item
        Name = 'SUBTOTAL'
        DataType = datCurrency
        DisplayFormat = '#,#0.00'
        Alignment = taRightJustify
      end
      item
        Name = 'SALDO'
        DataType = datCurrency
        DisplayFormat = '#,#0.00'
        Alignment = taRightJustify
      end
      item
        Name = 'DISPONIBLE'
        DataType = datCurrency
        DisplayFormat = '#,#0.00'
        Alignment = taRightJustify
      end
      item
        Name = 'SALDOPARCIAL'
        DataType = datCurrency
        DisplayFormat = '#,#0.00'
        Alignment = taRightJustify
      end>
    Params = <
      item
        Name = 'Ejercicio'
        Value = '2006'
        ParamType = daptInput
      end
      item
        Name = 'Ini'
        Value = '1'
        ParamType = daptInput
      end
      item
        Name = 'Fin'
        Value = '12'
        ParamType = daptInput
      end
      item
        Name = 'ClienteIni'
        Value = '1'
        ParamType = daptInput
      end
      item
        Name = 'ClienteFin'
        Value = '9999'
        ParamType = daptInput
      end
      item
        Name = 'Grupo'
        DataType = datString
        Value = ''
        ParamType = daptInput
      end
      item
        Name = 'FormaCompraID'
        Value = '1'
        ParamType = daptInput
      end
      item
        Name = 'GrupoFacturarID'
        Value = '1'
        ParamType = daptInput
      end>
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = DMFlotillas.RemoteDataAdapter
    LogicalName = 'spSaldos'
    IndexDefs = <>
    Left = 691
    Top = 135
  end
  object dsSaldo: TDADataSource
    DataSet = cdsSaldo.Dataset
    DataTable = cdsSaldo
    Left = 691
    Top = 168
  end
end
