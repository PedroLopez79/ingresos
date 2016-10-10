inherited frmVehiculo: TfrmVehiculo
  Caption = 'frmVehiculo'
  ClientHeight = 507
  ClientWidth = 827
  ExplicitWidth = 827
  ExplicitHeight = 507
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 827
    Height = 32
    Align = alTop
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Caption = ' Informacion de Vehiculos  |----->'
    Color = clBtnShadow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    object Label65: TLabel
      Left = 188
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
    object edtCliente: TcxCurrencyEdit
      Left = 243
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
      Left = 350
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
  end
  object Panel2: TPanel
    Left = 0
    Top = 32
    Width = 827
    Height = 2
    Align = alTop
    BevelOuter = bvNone
    Color = clNone
    ParentBackground = False
    TabOrder = 1
  end
  object pgcCatalogo: TcxPageControl
    Left = 0
    Top = 34
    Width = 827
    Height = 473
    ActivePage = cxTabSheet1
    Align = alClient
    Images = dmImages.Imagenes
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    TabOrder = 2
    TabPosition = tpBottom
    TabSlants.Kind = skCutCorner
    ClientRectBottom = 443
    ClientRectLeft = 3
    ClientRectRight = 821
    ClientRectTop = 3
    object cxTabSheet1: TcxTabSheet
      Caption = 'Busqueda'
      ImageIndex = 0
      object dbgCatalogo: TcxGrid
        Left = 0
        Top = 0
        Width = 818
        Height = 440
        Align = alClient
        TabOrder = 0
        LookAndFeel.Kind = lfFlat
        LookAndFeel.NativeStyle = False
        object dbgCatalogoDBTableView1: TcxGridDBTableView
          OnDblClick = dbgCatalogoDBTableView1DblClick
          OnKeyPress = dbgCatalogoDBTableView1KeyPress
          NavigatorButtons.ConfirmDelete = False
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
          object dbgCatalogoDBTableView1RecID: TcxGridDBColumn
            DataBinding.FieldName = 'RecID'
            Visible = False
          end
          object dbgCatalogoDBTableView1VehiculoID: TcxGridDBColumn
            DataBinding.FieldName = 'VehiculoID'
          end
          object dbgCatalogoDBTableView1DigitoSeguridad: TcxGridDBColumn
            DataBinding.FieldName = 'DigitoSeguridad'
          end
          object dbgCatalogoDBTableView1Nombre: TcxGridDBColumn
            DataBinding.FieldName = 'Nombre'
          end
          object dbgCatalogoDBTableView1Identificacion: TcxGridDBColumn
            DataBinding.FieldName = 'Identificacion'
          end
          object dbgCatalogoDBTableView1Departamento: TcxGridDBColumn
            DataBinding.FieldName = 'Departamento'
          end
          object dbgCatalogoDBTableView1CuentaContable: TcxGridDBColumn
            DataBinding.FieldName = 'CuentaContable'
          end
          object dbgCatalogoDBTableView1CentroCostos: TcxGridDBColumn
            DataBinding.FieldName = 'CentroCostos'
          end
          object dbgCatalogoDBTableView1NumeroEconomico: TcxGridDBColumn
            DataBinding.FieldName = 'NumeroEconomico'
          end
          object dbgCatalogoDBTableView1NIP: TcxGridDBColumn
            DataBinding.FieldName = 'NIP'
          end
          object dbgCatalogoDBTableView1Estatus: TcxGridDBColumn
            DataBinding.FieldName = 'Estatus'
          end
          object dbgCatalogoDBTableView1CargasMaximas: TcxGridDBColumn
            DataBinding.FieldName = 'CargasMaximas'
          end
          object dbgCatalogoDBTableView1Odometro: TcxGridDBColumn
            DataBinding.FieldName = 'Odometro'
          end
          object dbgCatalogoDBTableView1Firma: TcxGridDBColumn
            DataBinding.FieldName = 'Firma'
          end
          object dbgCatalogoDBTableView1Placas: TcxGridDBColumn
            DataBinding.FieldName = 'Placas'
          end
          object dbgCatalogoDBTableView1FechaAlta: TcxGridDBColumn
            DataBinding.FieldName = 'FechaAlta'
          end
          object dbgCatalogoDBTableView1FechaExpira: TcxGridDBColumn
            DataBinding.FieldName = 'FechaExpira'
          end
          object dbgCatalogoDBTableView1FechaBaja: TcxGridDBColumn
            DataBinding.FieldName = 'FechaBaja'
          end
          object dbgCatalogoDBTableView1FechaCancelacion: TcxGridDBColumn
            DataBinding.FieldName = 'FechaCancelacion'
          end
          object dbgCatalogoDBTableView1FechaBloqueada: TcxGridDBColumn
            DataBinding.FieldName = 'FechaBloqueada'
          end
          object dbgCatalogoDBTableView1FechaInactiva: TcxGridDBColumn
            DataBinding.FieldName = 'FechaInactiva'
          end
          object dbgCatalogoDBTableView1Mensaje: TcxGridDBColumn
            DataBinding.FieldName = 'Mensaje'
          end
          object dbgCatalogoDBTableView1LimiteLTTurno: TcxGridDBColumn
            DataBinding.FieldName = 'LimiteLTTurno'
          end
          object dbgCatalogoDBTableView1LimiteLTDia: TcxGridDBColumn
            DataBinding.FieldName = 'LimiteLTDia'
          end
          object dbgCatalogoDBTableView1LimiteLTSemana: TcxGridDBColumn
            DataBinding.FieldName = 'LimiteLTSemana'
          end
          object dbgCatalogoDBTableView1LimiteLTMes: TcxGridDBColumn
            DataBinding.FieldName = 'LimiteLTMes'
          end
          object dbgCatalogoDBTableView1LimiteMNTurno: TcxGridDBColumn
            DataBinding.FieldName = 'LimiteMNTurno'
          end
          object dbgCatalogoDBTableView1LimiteMNDia: TcxGridDBColumn
            DataBinding.FieldName = 'LimiteMNDia'
          end
          object dbgCatalogoDBTableView1LimiteMNSemana: TcxGridDBColumn
            DataBinding.FieldName = 'LimiteMNSemana'
          end
          object dbgCatalogoDBTableView1LimiteMNMes: TcxGridDBColumn
            DataBinding.FieldName = 'LimiteMNMes'
          end
          object dbgCatalogoDBTableView1ActualLTTurno: TcxGridDBColumn
            DataBinding.FieldName = 'ActualLTTurno'
          end
          object dbgCatalogoDBTableView1ActualLTDia: TcxGridDBColumn
            DataBinding.FieldName = 'ActualLTDia'
          end
          object dbgCatalogoDBTableView1ActualLTSemana: TcxGridDBColumn
            DataBinding.FieldName = 'ActualLTSemana'
          end
          object dbgCatalogoDBTableView1ActualLTMes: TcxGridDBColumn
            DataBinding.FieldName = 'ActualLTMes'
          end
          object dbgCatalogoDBTableView1ActualMNTurno: TcxGridDBColumn
            DataBinding.FieldName = 'ActualMNTurno'
          end
          object dbgCatalogoDBTableView1ActualMNDia: TcxGridDBColumn
            DataBinding.FieldName = 'ActualMNDia'
          end
          object dbgCatalogoDBTableView1ActualMNSemana: TcxGridDBColumn
            DataBinding.FieldName = 'ActualMNSemana'
          end
          object dbgCatalogoDBTableView1ActualMNMes: TcxGridDBColumn
            DataBinding.FieldName = 'ActualMNMes'
          end
          object dbgCatalogoDBTableView1ActualCargas: TcxGridDBColumn
            DataBinding.FieldName = 'ActualCargas'
          end
          object dbgCatalogoDBTableView1Clasificacion: TcxGridDBColumn
            DataBinding.FieldName = 'Clasificacion'
          end
          object dbgCatalogoDBTableView1Generada: TcxGridDBColumn
            DataBinding.FieldName = 'Generada'
          end
          object dbgCatalogoDBTableView1Lunes: TcxGridDBColumn
            DataBinding.FieldName = 'Lunes'
          end
          object dbgCatalogoDBTableView1Martes: TcxGridDBColumn
            DataBinding.FieldName = 'Martes'
          end
          object dbgCatalogoDBTableView1Miercoles: TcxGridDBColumn
            DataBinding.FieldName = 'Miercoles'
          end
          object dbgCatalogoDBTableView1Jueves: TcxGridDBColumn
            DataBinding.FieldName = 'Jueves'
          end
          object dbgCatalogoDBTableView1Viernes: TcxGridDBColumn
            DataBinding.FieldName = 'Viernes'
          end
          object dbgCatalogoDBTableView1Sabado: TcxGridDBColumn
            DataBinding.FieldName = 'Sabado'
          end
          object dbgCatalogoDBTableView1Domingo: TcxGridDBColumn
            DataBinding.FieldName = 'Domingo'
          end
          object dbgCatalogoDBTableView1ClienteID: TcxGridDBColumn
            DataBinding.FieldName = 'ClienteID'
          end
          object dbgCatalogoDBTableView1GasolineroID: TcxGridDBColumn
            DataBinding.FieldName = 'GasolineroID'
          end
        end
        object dbgCatalogoLevel1: TcxGridLevel
          GridView = dbgCatalogoDBTableView1
        end
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = 'Datos'
      ImageIndex = 1
      object cxGroupBox3: TcxGroupBox
        Left = 377
        Top = 6
        Caption = ' Seguridad '
        TabOrder = 1
        Height = 338
        Width = 405
        object Label8: TLabel
          Left = 16
          Top = 40
          Width = 18
          Height = 13
          Caption = 'NIP'
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
          Top = 77
          Width = 35
          Height = 13
          Caption = 'Estatus'
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
          Top = 151
          Width = 111
          Height = 13
          Caption = 'Mensaje Pr'#243'xima Carga'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label12: TLabel
          Left = 16
          Top = 188
          Width = 119
          Height = 13
          Caption = 'Maximo Cargas en el D'#237'a'
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
          Top = 114
          Width = 112
          Height = 13
          Caption = 'Producto(s) Autorizados'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object cxDBTextEdit10: TcxDBTextEdit
          Left = 165
          Top = 185
          DataBinding.DataField = 'CargasMaximas'
          DataBinding.DataSource = dsCatalogo
          Properties.CharCase = ecUpperCase
          TabOrder = 4
          Width = 76
        end
        object cxDBTextEdit11: TcxDBTextEdit
          Left = 165
          Top = 148
          DataBinding.DataField = 'Mensaje'
          DataBinding.DataSource = dsCatalogo
          Properties.CharCase = ecUpperCase
          TabOrder = 3
          Width = 213
        end
        object cxDBTextEdit14: TcxDBTextEdit
          Left = 165
          Top = 37
          DataBinding.DataField = 'NIP'
          DataBinding.DataSource = dsCatalogo
          Properties.CharCase = ecUpperCase
          Properties.ReadOnly = False
          TabOrder = 0
          Width = 86
        end
        object cxDBImageComboBox1: TcxDBImageComboBox
          Left = 165
          Top = 74
          DataBinding.DataField = 'Estatus'
          DataBinding.DataSource = dsCatalogo
          Properties.Items = <
            item
              Description = 'ACTIVA'
              ImageIndex = 0
              Value = 'A'
            end
            item
              Description = 'INACTIVA'
              Value = 'I'
            end
            item
              Description = 'CANCELADA'
              Value = 'C'
            end
            item
              Description = 'BLOQUEADA'
              Value = 'B'
            end>
          TabOrder = 1
          Width = 213
        end
        object cxDBImageComboBox2: TcxDBImageComboBox
          Left = 165
          Top = 111
          DataBinding.DataField = 'Productoautorizado'
          DataBinding.DataSource = dsCatalogo
          Properties.Items = <
            item
              Description = 'MAGNA'
              ImageIndex = 0
              Value = '1'
            end
            item
              Description = 'PREMIUM'
              Value = '2'
            end
            item
              Description = 'MAGNA Y PREMIUM'
              Value = '12'
            end
            item
              Description = 'DIESEL'
              Value = '3'
            end
            item
              Description = 'TODOS'
              Value = '123'
            end
            item
              Description = 'TODOS Y ADITIVOS'
              Value = '1235'
            end>
          TabOrder = 2
          Width = 213
        end
        object cxGroupBox9: TcxGroupBox
          Left = 16
          Top = 222
          Caption = ' Solicitar '
          TabOrder = 5
          Height = 99
          Width = 372
          object ChkOdometro: TcxDBCheckBox
            Left = 51
            Top = 43
            Caption = 'Odometro'
            DataBinding.DataField = 'Odometro'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 0
            Transparent = True
            Width = 121
          end
          object ChkFirma: TcxDBCheckBox
            Left = 158
            Top = 43
            Caption = 'Firma'
            DataBinding.DataField = 'Firma'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 1
            Transparent = True
            Width = 78
          end
          object ChkPlacas: TcxDBCheckBox
            Left = 255
            Top = 43
            Caption = 'Placas'
            DataBinding.DataField = 'Placas'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -11
            Style.Font.Name = 'MS Sans Serif'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 2
            Transparent = True
            Width = 78
          end
        end
      end
      object cxGroupBox2: TcxGroupBox
        Left = 12
        Top = 6
        Caption = ' Datos de la Tarjeta '
        TabOrder = 0
        Height = 338
        Width = 359
        object Label1: TLabel
          Left = 16
          Top = 40
          Width = 33
          Height = 13
          Caption = 'Tarjeta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label2: TLabel
          Left = 16
          Top = 77
          Width = 63
          Height = 13
          Caption = 'Identificaci'#243'n'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label3: TLabel
          Left = 16
          Top = 114
          Width = 67
          Height = 13
          Caption = 'Departamento'
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
          Top = 151
          Width = 84
          Height = 13
          Caption = 'Nombre / Usuario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label5: TLabel
          Left = 16
          Top = 188
          Width = 81
          Height = 13
          Caption = 'Centro de Costos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label6: TLabel
          Left = 16
          Top = 225
          Width = 73
          Height = 13
          Caption = 'No. Econ'#243'mico'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label7: TLabel
          Left = 16
          Top = 262
          Width = 79
          Height = 13
          Caption = 'Cuenta Contable'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object cxDBTextEdit1: TcxDBTextEdit
          Left = 123
          Top = 37
          DataBinding.DataField = 'VehiculoID'
          DataBinding.DataSource = dsCatalogo
          Enabled = False
          Properties.ReadOnly = True
          TabOrder = 0
          Width = 86
        end
        object cxDBTextEdit2: TcxDBTextEdit
          Left = 123
          Top = 74
          DataBinding.DataField = 'Identificacion'
          DataBinding.DataSource = dsCatalogo
          Properties.CharCase = ecUpperCase
          TabOrder = 1
          Width = 213
        end
        object cxDBTextEdit3: TcxDBTextEdit
          Left = 123
          Top = 111
          DataBinding.DataField = 'Departamento'
          DataBinding.DataSource = dsCatalogo
          Properties.CharCase = ecUpperCase
          TabOrder = 2
          Width = 213
        end
        object cxDBTextEdit4: TcxDBTextEdit
          Left = 123
          Top = 148
          DataBinding.DataField = 'Nombre'
          DataBinding.DataSource = dsCatalogo
          Properties.CharCase = ecUpperCase
          TabOrder = 3
          Width = 213
        end
        object cxDBTextEdit5: TcxDBTextEdit
          Left = 123
          Top = 185
          DataBinding.DataField = 'CentroCostos'
          DataBinding.DataSource = dsCatalogo
          Properties.CharCase = ecUpperCase
          TabOrder = 4
          Width = 213
        end
        object cxDBTextEdit6: TcxDBTextEdit
          Left = 123
          Top = 222
          DataBinding.DataField = 'NumeroEconomico'
          DataBinding.DataSource = dsCatalogo
          Properties.CharCase = ecUpperCase
          TabOrder = 5
          Width = 213
        end
        object cxDBTextEdit7: TcxDBTextEdit
          Left = 123
          Top = 259
          DataBinding.DataField = 'CuentaContable'
          DataBinding.DataSource = dsCatalogo
          Properties.CharCase = ecUpperCase
          TabOrder = 6
          Width = 134
        end
      end
    end
    object cxTabSheet3: TcxTabSheet
      Caption = 'Fechas'
      ImageIndex = 34
      object cxGroupBox4: TcxGroupBox
        Left = 16
        Top = 3
        Caption = ' Fechas '
        TabOrder = 0
        Height = 366
        Width = 345
        object Label14: TLabel
          Left = 24
          Top = 56
          Width = 51
          Height = 13
          Caption = 'Fecha Alta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label15: TLabel
          Left = 24
          Top = 100
          Width = 82
          Height = 13
          Caption = 'Fecha Expiraci'#243'n'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label16: TLabel
          Left = 24
          Top = 142
          Width = 54
          Height = 13
          Caption = 'Fecha Baja'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label17: TLabel
          Left = 24
          Top = 184
          Width = 107
          Height = 13
          Caption = 'Fecha de Cancelaci'#243'n'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label18: TLabel
          Left = 24
          Top = 226
          Width = 72
          Height = 13
          Caption = 'Fecha Bloqueo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label19: TLabel
          Left = 24
          Top = 271
          Width = 91
          Height = 13
          Caption = 'Fecha Inactivaci'#243'n'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object cxDBDateEdit1: TcxDBDateEdit
          Left = 163
          Top = 56
          DataBinding.DataField = 'FechaAlta'
          DataBinding.DataSource = dsCatalogo
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
          TabOrder = 0
          Width = 153
        end
        object cxDBDateEdit2: TcxDBDateEdit
          Left = 163
          Top = 97
          DataBinding.DataField = 'FechaExpira'
          DataBinding.DataSource = dsCatalogo
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
          TabOrder = 1
          Width = 153
        end
        object cxDBDateEdit3: TcxDBDateEdit
          Left = 163
          Top = 139
          DataBinding.DataField = 'FechaBaja'
          DataBinding.DataSource = dsCatalogo
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
          TabOrder = 2
          Width = 153
        end
        object cxDBDateEdit4: TcxDBDateEdit
          Left = 163
          Top = 181
          DataBinding.DataField = 'FechaCancelacion'
          DataBinding.DataSource = dsCatalogo
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
          TabOrder = 3
          Width = 153
        end
        object cxDBDateEdit5: TcxDBDateEdit
          Left = 163
          Top = 223
          DataBinding.DataField = 'FechaBloqueada'
          DataBinding.DataSource = dsCatalogo
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
          TabOrder = 4
          Width = 153
        end
        object cxDBDateEdit6: TcxDBDateEdit
          Left = 163
          Top = 268
          DataBinding.DataField = 'FechaInactiva'
          DataBinding.DataSource = dsCatalogo
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
          TabOrder = 5
          Width = 153
        end
      end
    end
    object cxTabSheet4: TcxTabSheet
      Caption = 'Par'#225'metros'
      ImageIndex = 33
      object cxGroupBox7: TcxGroupBox
        Left = 408
        Top = 24
        Caption = ' Historial de Consumo '
        TabOrder = 0
        Height = 277
        Width = 369
        object Label26: TLabel
          Left = 20
          Top = 90
          Width = 53
          Height = 13
          Caption = 'Acumulado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label27: TLabel
          Left = 20
          Top = 128
          Width = 27
          Height = 13
          Caption = 'Diario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label28: TLabel
          Left = 20
          Top = 166
          Width = 41
          Height = 13
          Caption = 'Semanal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label29: TLabel
          Left = 20
          Top = 204
          Width = 40
          Height = 13
          Caption = 'Mensual'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label30: TLabel
          Left = 106
          Top = 51
          Width = 53
          Height = 13
          Caption = 'VOLUMEN'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label31: TLabel
          Left = 244
          Top = 51
          Width = 49
          Height = 13
          Caption = 'IMPORTE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label32: TLabel
          Left = 20
          Top = 244
          Width = 80
          Height = 13
          Caption = 'Cargas en el D'#237'a'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object TxtMenLitrosH: TcxDBTextEdit
          Left = 84
          Top = 201
          DataBinding.DataField = 'ActualLTMes'
          DataBinding.DataSource = dsCatalogo
          Properties.ReadOnly = False
          TabOrder = 3
          Width = 105
        end
        object TxtSemLitrosH: TcxDBTextEdit
          Left = 84
          Top = 163
          DataBinding.DataField = 'ActualLTSemana'
          DataBinding.DataSource = dsCatalogo
          Properties.ReadOnly = False
          TabOrder = 2
          Width = 105
        end
        object TxtDiarioLitrosH: TcxDBTextEdit
          Left = 84
          Top = 125
          DataBinding.DataField = 'ActualLTDia'
          DataBinding.DataSource = dsCatalogo
          Properties.ReadOnly = False
          TabOrder = 1
          Width = 105
        end
        object TxtTurnoLitrosH: TcxDBTextEdit
          Left = 84
          Top = 87
          DataBinding.DataField = 'ActualLTTurno'
          DataBinding.DataSource = dsCatalogo
          Properties.ReadOnly = False
          TabOrder = 0
          Width = 105
        end
        object TxtTurnoMNH: TcxDBTextEdit
          Left = 220
          Top = 87
          DataBinding.DataField = 'ActualMNTurno'
          DataBinding.DataSource = dsCatalogo
          Properties.ReadOnly = False
          TabOrder = 4
          Width = 105
        end
        object TxtDiarioMNH: TcxDBTextEdit
          Left = 220
          Top = 125
          DataBinding.DataField = 'ActualMNDia'
          DataBinding.DataSource = dsCatalogo
          Properties.ReadOnly = False
          TabOrder = 5
          Width = 105
        end
        object TxtSemMNH: TcxDBTextEdit
          Left = 220
          Top = 163
          DataBinding.DataField = 'ActualMNSemana'
          DataBinding.DataSource = dsCatalogo
          Properties.ReadOnly = False
          TabOrder = 6
          Width = 105
        end
        object TxtMenMNH: TcxDBTextEdit
          Left = 220
          Top = 201
          DataBinding.DataField = 'ActualMNMes'
          DataBinding.DataSource = dsCatalogo
          Properties.ReadOnly = False
          TabOrder = 7
          Width = 105
        end
        object TxtCargasDia: TcxDBTextEdit
          Left = 154
          Top = 241
          DataBinding.DataField = 'ActualCargas'
          DataBinding.DataSource = dsCatalogo
          Properties.ReadOnly = False
          TabOrder = 8
          Width = 105
        end
      end
      object cxGroupBox6: TcxGroupBox
        Left = 16
        Top = 24
        Caption = ' L'#237'mites de Consumo '
        TabOrder = 1
        Height = 277
        Width = 369
        object Label20: TLabel
          Left = 20
          Top = 90
          Width = 53
          Height = 13
          Caption = 'Acumulado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label21: TLabel
          Left = 20
          Top = 128
          Width = 27
          Height = 13
          Caption = 'Diario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label22: TLabel
          Left = 20
          Top = 166
          Width = 41
          Height = 13
          Caption = 'Semanal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label23: TLabel
          Left = 20
          Top = 204
          Width = 40
          Height = 13
          Caption = 'Mensual'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label24: TLabel
          Left = 106
          Top = 51
          Width = 53
          Height = 13
          Caption = 'VOLUMEN'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label25: TLabel
          Left = 244
          Top = 51
          Width = 49
          Height = 13
          Caption = 'IMPORTE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object TxtTurnoLitrosL: TcxDBTextEdit
          Left = 84
          Top = 87
          DataBinding.DataField = 'LimiteLTTurno'
          DataBinding.DataSource = dsCatalogo
          TabOrder = 0
          Width = 105
        end
        object txtDiarioLitrosL: TcxDBTextEdit
          Left = 84
          Top = 125
          DataBinding.DataField = 'LimiteLTDia'
          DataBinding.DataSource = dsCatalogo
          TabOrder = 1
          Width = 105
        end
        object TxtSemLitrosL: TcxDBTextEdit
          Left = 84
          Top = 163
          DataBinding.DataField = 'LimiteLTSemana'
          DataBinding.DataSource = dsCatalogo
          TabOrder = 2
          Width = 105
        end
        object TxtMenLitrosL: TcxDBTextEdit
          Left = 84
          Top = 201
          DataBinding.DataField = 'LimiteLTMes'
          DataBinding.DataSource = dsCatalogo
          TabOrder = 3
          Width = 105
        end
        object TxtMenMNL: TcxDBTextEdit
          Left = 220
          Top = 201
          DataBinding.DataField = 'LimiteMNMes'
          DataBinding.DataSource = dsCatalogo
          TabOrder = 7
          Width = 105
        end
        object TxtSemMNL: TcxDBTextEdit
          Left = 220
          Top = 163
          DataBinding.DataField = 'LimiteMNSemana'
          DataBinding.DataSource = dsCatalogo
          TabOrder = 6
          Width = 105
        end
        object TxtDiarioMNL: TcxDBTextEdit
          Left = 220
          Top = 125
          DataBinding.DataField = 'LimiteMNDia'
          DataBinding.DataSource = dsCatalogo
          TabOrder = 5
          Width = 105
        end
        object TxtTurnoMNL: TcxDBTextEdit
          Left = 220
          Top = 87
          DataBinding.DataField = 'LimiteMNTurno'
          DataBinding.DataSource = dsCatalogo
          TabOrder = 4
          Width = 105
        end
        object ChkTTurnoLL: TcxCheckBox
          Left = 195
          Top = 89
          TabOrder = 8
          Transparent = True
          OnClick = ChkTTurnoLLClick
          Width = 17
        end
        object ChkDiaLL: TcxCheckBox
          Left = 195
          Top = 127
          TabOrder = 9
          Transparent = True
          OnClick = ChkDiaLLClick
          Width = 17
        end
        object ChkSemanaLL: TcxCheckBox
          Left = 195
          Top = 165
          TabOrder = 10
          Transparent = True
          OnClick = ChkSemanaLLClick
          Width = 17
        end
        object ChkMesLL: TcxCheckBox
          Left = 195
          Top = 203
          TabOrder = 11
          Transparent = True
          OnClick = ChkMesLLClick
          Width = 17
        end
        object ChkTurnoMN: TcxCheckBox
          Left = 331
          Top = 89
          TabOrder = 12
          Transparent = True
          OnClick = ChkTurnoMNClick
          Width = 17
        end
        object ChkDiaMN: TcxCheckBox
          Left = 331
          Top = 127
          TabOrder = 13
          Transparent = True
          OnClick = ChkDiaMNClick
          Width = 17
        end
        object ChkSemanaMN: TcxCheckBox
          Left = 331
          Top = 165
          TabOrder = 14
          Transparent = True
          OnClick = ChkSemanaMNClick
          Width = 17
        end
        object ChkMesMN: TcxCheckBox
          Left = 331
          Top = 203
          TabOrder = 15
          Transparent = True
          OnClick = ChkMesMNClick
          Width = 17
        end
      end
      object cxGroupBox1: TcxGroupBox
        Left = 16
        Top = 307
        Caption = 'Monto Temporal Asignado'
        TabOrder = 2
        Height = 81
        Width = 761
        object Label13: TLabel
          Left = 20
          Top = 36
          Width = 39
          Height = 13
          Caption = 'Del Mes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label64: TLabel
          Left = 224
          Top = 36
          Width = 31
          Height = 13
          Caption = 'al Mes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label66: TLabel
          Left = 430
          Top = 36
          Width = 87
          Height = 13
          Caption = 'Importe autorizado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object cxDBDateEdit7: TcxDBDateEdit
          Left = 65
          Top = 33
          DataBinding.DataField = 'MES1'
          DataBinding.DataSource = dsCatalogo
          TabOrder = 0
          Width = 144
        end
        object cxDBDateEdit8: TcxDBDateEdit
          Left = 265
          Top = 33
          DataBinding.DataField = 'MES2'
          DataBinding.DataSource = dsCatalogo
          TabOrder = 1
          Width = 144
        end
        object cxDBTextEdit8: TcxDBTextEdit
          Left = 523
          Top = 33
          DataBinding.DataField = 'MONTO'
          DataBinding.DataSource = dsCatalogo
          Properties.ReadOnly = False
          TabOrder = 2
          Width = 105
        end
      end
    end
    object cxTabSheet5: TcxTabSheet
      Caption = 'Horarios'
      ImageIndex = 35
      object cxGroupBox8: TcxGroupBox
        Left = 0
        Top = 0
        Caption = ' Control de Consumos '
        TabOrder = 0
        Height = 337
        Width = 737
        object Label33: TLabel
          Tag = 100
          Left = 59
          Top = 76
          Width = 29
          Height = 13
          Caption = 'Lunes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          OnClick = Label33Click
        end
        object Label34: TLabel
          Tag = 200
          Left = 59
          Top = 101
          Width = 32
          Height = 13
          Caption = 'Martes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          OnClick = Label33Click
        end
        object Label35: TLabel
          Tag = 300
          Left = 59
          Top = 126
          Width = 45
          Height = 13
          Caption = 'Miercoles'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          OnClick = Label33Click
        end
        object Label36: TLabel
          Tag = 400
          Left = 59
          Top = 151
          Width = 34
          Height = 13
          Caption = 'Jueves'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          OnClick = Label33Click
        end
        object Label37: TLabel
          Tag = 500
          Left = 59
          Top = 176
          Width = 35
          Height = 13
          Caption = 'Viernes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          OnClick = Label33Click
        end
        object Label38: TLabel
          Tag = 600
          Left = 59
          Top = 201
          Width = 37
          Height = 13
          Caption = 'Sabado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          OnClick = Label33Click
        end
        object Label39: TLabel
          Tag = 700
          Left = 59
          Top = 224
          Width = 42
          Height = 13
          Caption = 'Domingo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          OnClick = Label33Click
        end
        object Label40: TLabel
          Tag = 100
          Left = 118
          Top = 51
          Width = 12
          Height = 13
          Caption = '00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          OnClick = Label40Click
        end
        object Label41: TLabel
          Tag = 101
          Left = 142
          Top = 51
          Width = 12
          Height = 13
          Caption = '01'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          OnClick = Label40Click
        end
        object Label42: TLabel
          Tag = 102
          Left = 166
          Top = 51
          Width = 12
          Height = 13
          Caption = '02'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          OnClick = Label40Click
        end
        object Label43: TLabel
          Tag = 105
          Left = 234
          Top = 51
          Width = 12
          Height = 13
          Caption = '05'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          OnClick = Label40Click
        end
        object Label44: TLabel
          Tag = 104
          Left = 213
          Top = 51
          Width = 12
          Height = 13
          Caption = '04'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          OnClick = Label40Click
        end
        object Label45: TLabel
          Tag = 103
          Left = 190
          Top = 51
          Width = 12
          Height = 13
          Caption = '03'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          OnClick = Label40Click
        end
        object Label46: TLabel
          Tag = 106
          Left = 260
          Top = 51
          Width = 12
          Height = 13
          Caption = '06'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          OnClick = Label40Click
        end
        object Label47: TLabel
          Tag = 107
          Left = 285
          Top = 51
          Width = 12
          Height = 13
          Caption = '07'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          OnClick = Label40Click
        end
        object Label48: TLabel
          Tag = 108
          Left = 307
          Top = 51
          Width = 12
          Height = 13
          Caption = '08'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          OnClick = Label40Click
        end
        object Label49: TLabel
          Tag = 109
          Left = 331
          Top = 51
          Width = 12
          Height = 13
          Caption = '09'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          OnClick = Label40Click
        end
        object Label50: TLabel
          Tag = 110
          Left = 355
          Top = 51
          Width = 12
          Height = 13
          Caption = '10'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          OnClick = Label40Click
        end
        object Label51: TLabel
          Tag = 111
          Left = 379
          Top = 51
          Width = 12
          Height = 13
          Caption = '11'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          OnClick = Label40Click
        end
        object Label52: TLabel
          Tag = 112
          Left = 403
          Top = 51
          Width = 12
          Height = 13
          Caption = '12'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          OnClick = Label40Click
        end
        object Label53: TLabel
          Tag = 113
          Left = 427
          Top = 51
          Width = 12
          Height = 13
          Caption = '13'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          OnClick = Label40Click
        end
        object Label54: TLabel
          Tag = 114
          Left = 451
          Top = 51
          Width = 12
          Height = 13
          Caption = '14'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          OnClick = Label40Click
        end
        object Label55: TLabel
          Tag = 115
          Left = 475
          Top = 51
          Width = 12
          Height = 13
          Caption = '15'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          OnClick = Label40Click
        end
        object Label56: TLabel
          Tag = 116
          Left = 498
          Top = 51
          Width = 12
          Height = 13
          Caption = '16'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          OnClick = Label40Click
        end
        object Label57: TLabel
          Tag = 117
          Left = 521
          Top = 51
          Width = 12
          Height = 13
          Caption = '17'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          OnClick = Label40Click
        end
        object Label58: TLabel
          Tag = 118
          Left = 545
          Top = 51
          Width = 12
          Height = 13
          Caption = '18'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          OnClick = Label40Click
        end
        object Label59: TLabel
          Tag = 119
          Left = 570
          Top = 51
          Width = 12
          Height = 13
          Caption = '19'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          OnClick = Label40Click
        end
        object Label60: TLabel
          Tag = 120
          Left = 592
          Top = 51
          Width = 12
          Height = 13
          Caption = '20'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          OnClick = Label40Click
        end
        object Label61: TLabel
          Tag = 121
          Left = 616
          Top = 51
          Width = 12
          Height = 13
          Caption = '21'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          OnClick = Label40Click
        end
        object Label62: TLabel
          Tag = 122
          Left = 640
          Top = 51
          Width = 12
          Height = 13
          Caption = '22'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          OnClick = Label40Click
        end
        object Label63: TLabel
          Tag = 123
          Left = 664
          Top = 51
          Width = 12
          Height = 13
          Caption = '23'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          OnClick = Label40Click
        end
        object Chk0Lu: TcxCheckBox
          Tag = 100
          Left = 115
          Top = 72
          TabOrder = 2
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk1Lu: TcxCheckBox
          Tag = 101
          Left = 139
          Top = 72
          TabOrder = 3
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk2Lu: TcxCheckBox
          Tag = 102
          Left = 163
          Top = 72
          TabOrder = 4
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk3Lu: TcxCheckBox
          Tag = 103
          Left = 187
          Top = 72
          TabOrder = 5
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk4Lu: TcxCheckBox
          Tag = 104
          Left = 209
          Top = 72
          TabOrder = 6
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk5Lu: TcxCheckBox
          Tag = 105
          Left = 233
          Top = 72
          TabOrder = 7
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk6Lu: TcxCheckBox
          Tag = 106
          Left = 257
          Top = 72
          TabOrder = 8
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk7Lu: TcxCheckBox
          Tag = 107
          Left = 281
          Top = 72
          TabOrder = 9
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk8Lu: TcxCheckBox
          Tag = 108
          Left = 304
          Top = 72
          TabOrder = 10
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk9Lu: TcxCheckBox
          Tag = 109
          Left = 328
          Top = 72
          TabOrder = 11
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk10Lu: TcxCheckBox
          Tag = 110
          Left = 352
          Top = 72
          TabOrder = 12
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk11Lu: TcxCheckBox
          Tag = 111
          Left = 376
          Top = 72
          TabOrder = 13
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk12Lu: TcxCheckBox
          Tag = 112
          Left = 400
          Top = 72
          TabOrder = 14
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk13Lu: TcxCheckBox
          Tag = 113
          Left = 424
          Top = 72
          TabOrder = 15
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk14Lu: TcxCheckBox
          Tag = 114
          Left = 448
          Top = 72
          TabOrder = 16
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk15Lu: TcxCheckBox
          Tag = 115
          Left = 472
          Top = 72
          TabOrder = 17
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk16Lu: TcxCheckBox
          Tag = 116
          Left = 495
          Top = 72
          TabOrder = 18
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk17Lu: TcxCheckBox
          Tag = 117
          Left = 519
          Top = 72
          TabOrder = 19
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk18Lu: TcxCheckBox
          Tag = 118
          Left = 543
          Top = 72
          TabOrder = 20
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk19Lu: TcxCheckBox
          Tag = 119
          Left = 567
          Top = 72
          TabOrder = 21
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk20Lu: TcxCheckBox
          Tag = 120
          Left = 590
          Top = 72
          TabOrder = 22
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk21Lu: TcxCheckBox
          Tag = 121
          Left = 614
          Top = 72
          TabOrder = 23
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk22Lu: TcxCheckBox
          Tag = 122
          Left = 638
          Top = 72
          TabOrder = 24
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk0Ma: TcxCheckBox
          Tag = 200
          Left = 115
          Top = 97
          TabOrder = 25
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk1Ma: TcxCheckBox
          Tag = 201
          Left = 139
          Top = 97
          TabOrder = 26
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk2Ma: TcxCheckBox
          Tag = 202
          Left = 163
          Top = 97
          TabOrder = 27
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk3Ma: TcxCheckBox
          Tag = 203
          Left = 187
          Top = 97
          TabOrder = 28
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk4Ma: TcxCheckBox
          Tag = 204
          Left = 209
          Top = 97
          TabOrder = 29
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk5Ma: TcxCheckBox
          Tag = 205
          Left = 233
          Top = 97
          TabOrder = 30
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk6Ma: TcxCheckBox
          Tag = 206
          Left = 257
          Top = 97
          TabOrder = 31
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk7Ma: TcxCheckBox
          Tag = 207
          Left = 281
          Top = 97
          TabOrder = 32
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk8Ma: TcxCheckBox
          Tag = 208
          Left = 304
          Top = 97
          TabOrder = 33
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk9Ma: TcxCheckBox
          Tag = 209
          Left = 328
          Top = 97
          TabOrder = 34
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk10Ma: TcxCheckBox
          Tag = 210
          Left = 352
          Top = 97
          TabOrder = 35
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk11Ma: TcxCheckBox
          Tag = 211
          Left = 376
          Top = 97
          TabOrder = 36
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk12Ma: TcxCheckBox
          Tag = 212
          Left = 400
          Top = 97
          TabOrder = 37
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk13Ma: TcxCheckBox
          Tag = 213
          Left = 424
          Top = 97
          TabOrder = 38
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk14Ma: TcxCheckBox
          Tag = 214
          Left = 448
          Top = 97
          TabOrder = 39
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk15Ma: TcxCheckBox
          Tag = 215
          Left = 472
          Top = 97
          TabOrder = 40
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk16Ma: TcxCheckBox
          Tag = 216
          Left = 495
          Top = 97
          TabOrder = 41
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk17Ma: TcxCheckBox
          Tag = 217
          Left = 519
          Top = 97
          TabOrder = 42
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk18Ma: TcxCheckBox
          Tag = 218
          Left = 543
          Top = 97
          TabOrder = 43
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk19Ma: TcxCheckBox
          Tag = 219
          Left = 567
          Top = 97
          TabOrder = 44
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk20Ma: TcxCheckBox
          Tag = 220
          Left = 590
          Top = 97
          TabOrder = 45
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk21Ma: TcxCheckBox
          Tag = 221
          Left = 614
          Top = 97
          TabOrder = 46
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk22Ma: TcxCheckBox
          Tag = 222
          Left = 638
          Top = 97
          TabOrder = 47
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk0Me: TcxCheckBox
          Tag = 300
          Left = 115
          Top = 122
          TabOrder = 48
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk1Me: TcxCheckBox
          Tag = 301
          Left = 139
          Top = 122
          TabOrder = 49
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk2Me: TcxCheckBox
          Tag = 302
          Left = 163
          Top = 122
          TabOrder = 50
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk3Me: TcxCheckBox
          Tag = 303
          Left = 187
          Top = 122
          TabOrder = 51
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk4Me: TcxCheckBox
          Tag = 304
          Left = 209
          Top = 122
          TabOrder = 52
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk5Me: TcxCheckBox
          Tag = 305
          Left = 233
          Top = 122
          TabOrder = 53
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk6Me: TcxCheckBox
          Tag = 306
          Left = 257
          Top = 122
          TabOrder = 54
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk7Me: TcxCheckBox
          Tag = 307
          Left = 281
          Top = 122
          TabOrder = 55
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk8Me: TcxCheckBox
          Tag = 308
          Left = 304
          Top = 122
          TabOrder = 56
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk9Me: TcxCheckBox
          Tag = 309
          Left = 328
          Top = 122
          TabOrder = 57
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk10Me: TcxCheckBox
          Tag = 310
          Left = 352
          Top = 122
          TabOrder = 58
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk11Me: TcxCheckBox
          Tag = 311
          Left = 376
          Top = 122
          TabOrder = 59
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk12Me: TcxCheckBox
          Tag = 312
          Left = 400
          Top = 122
          TabOrder = 60
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk13Me: TcxCheckBox
          Tag = 313
          Left = 424
          Top = 122
          TabOrder = 61
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk14Me: TcxCheckBox
          Tag = 314
          Left = 448
          Top = 122
          TabOrder = 62
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk15Me: TcxCheckBox
          Tag = 315
          Left = 472
          Top = 122
          TabOrder = 63
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk16Me: TcxCheckBox
          Tag = 316
          Left = 495
          Top = 122
          TabOrder = 64
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk17Me: TcxCheckBox
          Tag = 317
          Left = 519
          Top = 122
          TabOrder = 65
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk18Me: TcxCheckBox
          Tag = 318
          Left = 543
          Top = 122
          TabOrder = 66
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk19Me: TcxCheckBox
          Tag = 319
          Left = 567
          Top = 122
          TabOrder = 67
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk20Me: TcxCheckBox
          Tag = 320
          Left = 590
          Top = 122
          TabOrder = 68
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk21Me: TcxCheckBox
          Tag = 321
          Left = 614
          Top = 122
          TabOrder = 69
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk22Me: TcxCheckBox
          Tag = 322
          Left = 638
          Top = 122
          TabOrder = 70
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk0Vi: TcxCheckBox
          Tag = 500
          Left = 115
          Top = 172
          TabOrder = 71
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk1Vi: TcxCheckBox
          Tag = 501
          Left = 139
          Top = 172
          TabOrder = 72
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk2Vi: TcxCheckBox
          Tag = 502
          Left = 163
          Top = 172
          TabOrder = 73
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk3Vi: TcxCheckBox
          Tag = 503
          Left = 187
          Top = 172
          TabOrder = 74
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk4Vi: TcxCheckBox
          Tag = 504
          Left = 209
          Top = 172
          TabOrder = 75
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk5Vi: TcxCheckBox
          Tag = 505
          Left = 233
          Top = 172
          TabOrder = 76
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk6Vi: TcxCheckBox
          Tag = 506
          Left = 257
          Top = 172
          TabOrder = 77
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk7Vi: TcxCheckBox
          Tag = 507
          Left = 281
          Top = 172
          TabOrder = 78
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk8Vi: TcxCheckBox
          Tag = 508
          Left = 304
          Top = 172
          TabOrder = 79
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk9Vi: TcxCheckBox
          Tag = 509
          Left = 328
          Top = 172
          TabOrder = 80
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk10Vi: TcxCheckBox
          Tag = 510
          Left = 352
          Top = 172
          TabOrder = 81
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk11Vi: TcxCheckBox
          Tag = 511
          Left = 376
          Top = 172
          TabOrder = 82
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk12Vi: TcxCheckBox
          Tag = 512
          Left = 400
          Top = 172
          TabOrder = 83
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk13Vi: TcxCheckBox
          Tag = 513
          Left = 424
          Top = 172
          TabOrder = 84
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk14Vi: TcxCheckBox
          Tag = 514
          Left = 448
          Top = 172
          TabOrder = 85
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk15Vi: TcxCheckBox
          Tag = 515
          Left = 472
          Top = 172
          TabOrder = 86
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk16Vi: TcxCheckBox
          Tag = 516
          Left = 495
          Top = 172
          TabOrder = 87
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk17Vi: TcxCheckBox
          Tag = 517
          Left = 519
          Top = 172
          TabOrder = 88
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk18Vi: TcxCheckBox
          Tag = 518
          Left = 543
          Top = 172
          TabOrder = 89
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk19Vi: TcxCheckBox
          Tag = 519
          Left = 567
          Top = 172
          TabOrder = 90
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk20Vi: TcxCheckBox
          Tag = 520
          Left = 590
          Top = 172
          TabOrder = 91
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk21Vi: TcxCheckBox
          Tag = 521
          Left = 614
          Top = 172
          TabOrder = 92
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk22Vi: TcxCheckBox
          Tag = 522
          Left = 638
          Top = 172
          TabOrder = 93
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk0Sa: TcxCheckBox
          Tag = 600
          Left = 115
          Top = 197
          TabOrder = 94
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk1Sa: TcxCheckBox
          Tag = 601
          Left = 139
          Top = 197
          TabOrder = 95
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk2Sa: TcxCheckBox
          Tag = 602
          Left = 163
          Top = 197
          TabOrder = 96
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk3Sa: TcxCheckBox
          Tag = 603
          Left = 187
          Top = 197
          TabOrder = 97
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk4Sa: TcxCheckBox
          Tag = 604
          Left = 209
          Top = 197
          TabOrder = 98
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk5Sa: TcxCheckBox
          Tag = 605
          Left = 233
          Top = 197
          TabOrder = 99
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk6Sa: TcxCheckBox
          Tag = 606
          Left = 257
          Top = 197
          TabOrder = 100
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk7Sa: TcxCheckBox
          Tag = 607
          Left = 281
          Top = 197
          TabOrder = 101
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk8Sa: TcxCheckBox
          Tag = 608
          Left = 304
          Top = 197
          TabOrder = 102
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk9Sa: TcxCheckBox
          Tag = 609
          Left = 328
          Top = 197
          TabOrder = 103
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk10Sa: TcxCheckBox
          Tag = 610
          Left = 352
          Top = 197
          TabOrder = 104
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk11Sa: TcxCheckBox
          Tag = 611
          Left = 376
          Top = 197
          TabOrder = 105
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk12Sa: TcxCheckBox
          Tag = 612
          Left = 400
          Top = 197
          TabOrder = 106
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk13Sa: TcxCheckBox
          Tag = 613
          Left = 424
          Top = 197
          TabOrder = 107
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk14Sa: TcxCheckBox
          Tag = 614
          Left = 448
          Top = 197
          TabOrder = 108
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk15Sa: TcxCheckBox
          Tag = 615
          Left = 472
          Top = 197
          TabOrder = 109
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk16Sa: TcxCheckBox
          Tag = 616
          Left = 495
          Top = 197
          TabOrder = 110
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk17Sa: TcxCheckBox
          Tag = 617
          Left = 519
          Top = 197
          TabOrder = 111
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk18Sa: TcxCheckBox
          Tag = 618
          Left = 543
          Top = 197
          TabOrder = 112
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk19Sa: TcxCheckBox
          Tag = 619
          Left = 567
          Top = 197
          TabOrder = 113
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk20Sa: TcxCheckBox
          Tag = 620
          Left = 590
          Top = 197
          TabOrder = 114
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk21Sa: TcxCheckBox
          Tag = 621
          Left = 614
          Top = 197
          TabOrder = 115
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk22Sa: TcxCheckBox
          Tag = 622
          Left = 638
          Top = 197
          TabOrder = 116
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk0Do: TcxCheckBox
          Tag = 700
          Left = 115
          Top = 222
          TabOrder = 117
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk1Do: TcxCheckBox
          Tag = 701
          Left = 139
          Top = 222
          TabOrder = 118
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk2Do: TcxCheckBox
          Tag = 702
          Left = 163
          Top = 222
          TabOrder = 119
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk3Do: TcxCheckBox
          Tag = 703
          Left = 187
          Top = 222
          TabOrder = 120
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk4Do: TcxCheckBox
          Tag = 704
          Left = 209
          Top = 222
          TabOrder = 121
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk5Do: TcxCheckBox
          Tag = 705
          Left = 233
          Top = 222
          TabOrder = 122
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk6Do: TcxCheckBox
          Tag = 706
          Left = 257
          Top = 222
          TabOrder = 123
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk7Do: TcxCheckBox
          Tag = 707
          Left = 281
          Top = 222
          TabOrder = 124
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk8Do: TcxCheckBox
          Tag = 708
          Left = 304
          Top = 222
          TabOrder = 125
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk9Do: TcxCheckBox
          Tag = 709
          Left = 328
          Top = 222
          TabOrder = 126
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk10Do: TcxCheckBox
          Tag = 710
          Left = 352
          Top = 222
          TabOrder = 127
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk11Do: TcxCheckBox
          Tag = 711
          Left = 376
          Top = 222
          TabOrder = 128
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk12Do: TcxCheckBox
          Tag = 712
          Left = 400
          Top = 222
          TabOrder = 129
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk13Do: TcxCheckBox
          Tag = 713
          Left = 424
          Top = 222
          TabOrder = 130
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk14Do: TcxCheckBox
          Tag = 714
          Left = 448
          Top = 222
          TabOrder = 131
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk15Do: TcxCheckBox
          Tag = 715
          Left = 472
          Top = 222
          TabOrder = 132
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk16Do: TcxCheckBox
          Tag = 716
          Left = 495
          Top = 222
          TabOrder = 133
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk17Do: TcxCheckBox
          Tag = 717
          Left = 519
          Top = 222
          TabOrder = 134
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk18Do: TcxCheckBox
          Tag = 718
          Left = 543
          Top = 222
          TabOrder = 135
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk19Do: TcxCheckBox
          Tag = 719
          Left = 567
          Top = 222
          TabOrder = 136
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk20Do: TcxCheckBox
          Tag = 720
          Left = 590
          Top = 222
          TabOrder = 137
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk21Do: TcxCheckBox
          Tag = 721
          Left = 614
          Top = 222
          TabOrder = 138
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk22Do: TcxCheckBox
          Tag = 722
          Left = 638
          Top = 222
          TabOrder = 139
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk0Ju: TcxCheckBox
          Tag = 400
          Left = 115
          Top = 147
          TabOrder = 140
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk1Ju: TcxCheckBox
          Tag = 401
          Left = 139
          Top = 147
          TabOrder = 141
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk2Ju: TcxCheckBox
          Tag = 402
          Left = 163
          Top = 147
          TabOrder = 142
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk3Ju: TcxCheckBox
          Tag = 403
          Left = 187
          Top = 147
          TabOrder = 143
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk4Ju: TcxCheckBox
          Tag = 404
          Left = 209
          Top = 147
          TabOrder = 144
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk5Ju: TcxCheckBox
          Tag = 405
          Left = 233
          Top = 147
          TabOrder = 145
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk6Ju: TcxCheckBox
          Tag = 406
          Left = 257
          Top = 147
          TabOrder = 146
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk7Ju: TcxCheckBox
          Tag = 407
          Left = 281
          Top = 147
          TabOrder = 147
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk8Ju: TcxCheckBox
          Tag = 408
          Left = 304
          Top = 147
          TabOrder = 148
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk9Ju: TcxCheckBox
          Tag = 409
          Left = 328
          Top = 147
          TabOrder = 149
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk10Ju: TcxCheckBox
          Tag = 410
          Left = 352
          Top = 147
          TabOrder = 150
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk11Ju: TcxCheckBox
          Tag = 411
          Left = 376
          Top = 147
          TabOrder = 151
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk12Ju: TcxCheckBox
          Tag = 412
          Left = 400
          Top = 147
          TabOrder = 152
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk13Ju: TcxCheckBox
          Tag = 413
          Left = 424
          Top = 147
          TabOrder = 153
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk14Ju: TcxCheckBox
          Tag = 414
          Left = 448
          Top = 147
          TabOrder = 154
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk15Ju: TcxCheckBox
          Tag = 415
          Left = 472
          Top = 147
          TabOrder = 155
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk16Ju: TcxCheckBox
          Tag = 416
          Left = 495
          Top = 147
          TabOrder = 156
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk17Ju: TcxCheckBox
          Tag = 417
          Left = 519
          Top = 147
          TabOrder = 157
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk18Ju: TcxCheckBox
          Tag = 418
          Left = 543
          Top = 147
          TabOrder = 158
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk19Ju: TcxCheckBox
          Tag = 419
          Left = 567
          Top = 147
          TabOrder = 159
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk20Ju: TcxCheckBox
          Tag = 420
          Left = 590
          Top = 147
          TabOrder = 160
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk21Ju: TcxCheckBox
          Tag = 421
          Left = 614
          Top = 147
          TabOrder = 161
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk22Ju: TcxCheckBox
          Tag = 422
          Left = 638
          Top = 147
          TabOrder = 162
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk23Do: TcxCheckBox
          Tag = 723
          Left = 662
          Top = 222
          TabOrder = 163
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk23Sa: TcxCheckBox
          Tag = 623
          Left = 662
          Top = 197
          TabOrder = 164
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk23Vi: TcxCheckBox
          Tag = 523
          Left = 662
          Top = 172
          TabOrder = 165
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk23Ju: TcxCheckBox
          Tag = 423
          Left = 662
          Top = 147
          TabOrder = 166
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk23Me: TcxCheckBox
          Tag = 323
          Left = 662
          Top = 122
          TabOrder = 167
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk23Ma: TcxCheckBox
          Tag = 223
          Left = 662
          Top = 97
          TabOrder = 168
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object Chk23Lu: TcxCheckBox
          Tag = 123
          Left = 662
          Top = 72
          TabOrder = 169
          Transparent = True
          OnClick = Chk0LuClick
          Width = 25
        end
        object cxButton1: TcxButton
          Left = 240
          Top = 276
          Width = 103
          Height = 25
          Caption = 'Asignar Todos'
          TabOrder = 0
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00A467
            69008E5D59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D59008E5D
            59008E5D59008E5D59008E5D590080504B00FF00FF00FF00FF00FF00FF00A467
            6900FCEACE00F3DABC00F2D5B100F0D0A700EECB9E00EDC79300EDC28B00E9BD
            8100E9BD7F00E9BD7F00EFC4810080504B00FF00FF00FF00FF00FF00FF00A067
            5B00FEEFDA00811E0000811E0000811E0000811E0000811E0000811E0000811E
            0000811E0000E9BD7F00EFC4810080504B00FF00FF00FF00FF00FF00FF00A067
            5B00FFF4E500811E0000FEFEFE00FEFEFE00FEFEFE00758EFC00A5B6FC00FEFE
            FE00811E0000EABF8100EFC4800080504B00FF00FF00FF00FF00FF00FF00A775
            6B00FFFBF000811E0000FEFEFE00F8FAFE006480FB00011FFA003F5FFB00FEFE
            FE00811E0000EBC28A00EFC5830080504B00FF00FF00FF00FF00FF00FF00A775
            6B00FFFFFC00811E0000CAD4FE002B4DFB00011FFA00284BFB000120FA00CED7
            FE00811E0000EBC79300F2C98C0080504B00FF00FF00FF00FF00FF00FF00BC82
            6800FFFFFF00811E00003859FB00092AFA00AABAFC00EAEEFE000C2EFA003557
            FB007F1E0100EECC9E00F3CE970080504B00FF00FF00FF00FF00FF00FF00BC82
            6800FFFFFF00811E0000DCE3FE00CED7FE00FEFEFE00FEFEFE008097FC00011F
            FA00491F3F00F0D0A600F6D3A00080504B00FF00FF00FF00FF00FF00FF00D192
            6D00FFFFFF00811E0000FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFEFE003C5C
            FB00011FFA00F4D8B100EBCFA40080504B00FF00FF00FF00FF00FF00FF00D192
            6D00FFFFFF00811E0000811E0000811E0000811E0000811E0000811E0000761E
            0700111FB800011FFA00B6AA930080504B00FF00FF00FF00FF00FF00FF00DA9D
            7500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFC00FCF6EF00FCF3E600EDD8
            C900A0675B00011FFA00011FFA00011FFA00FF00FF00FF00FF00FF00FF00DA9D
            7500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFEFB00FFFEF700DAC1
            BA00A0675B00E19E5500E68F3100011FFA00FF00FF00FF00FF00FF00FF00E7AB
            7900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DCC7
            C500A0675B00F8B55C00BF7A5C00FF00FF00FF00FF00FF00FF00FF00FF00E7AB
            7900FBF4F000FBF4EF00FAF3EF00FAF3EF00F8F2EF00F7F2EF00F7F2EF00D8C2
            C000A0675B00C1836C00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00E7AB
            7900CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E6800CF8E
            6800A0675B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          LookAndFeel.NativeStyle = False
        end
        object cxButton2: TcxButton
          Left = 397
          Top = 276
          Width = 103
          Height = 25
          Caption = 'Negar Todos'
          TabOrder = 1
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFA467698E5D598E5D598E5D598E5D598E5D598E
            5D598E5D598E5D598E5D598E5D598E5D5980504BFF00FFFF00FFFF00FFA46769
            FCEACEF3DABCF2D5B1F0D0A7EECB9EEDC793EDC28BE9BD81E9BD7FE9BD7FEFC4
            8180504BFF00FFFF00FFFF00FFA0675BFEEFDA811E00811E00811E00811E0081
            1E00811E00811E00811E00E9BD7FEFC48180504BFF00FFFF00FFFF00FFA0675B
            FFF4E5811E00FEFEFECCCCCCFEFEFECCCCCCFFFFFFCCCCCC811E00EABF81EFC4
            8080504BFF00FFFF00FFFF00FFA7756BFFFBF0811E00CCCCCCF8FAFECCCCCCFF
            FFFFCCCCCCFEFEFE811E00EBC28AEFC58380504BFF00FFFF00FFFF00FFA7756B
            FFFFFC811E00FFFFFFCCCCCCFFFFFFCCCCCCFFFFFFCCCCCC811E00EBC793F2C9
            8C80504BFF00FFFF00FFFF00FFBC8268FFFFFF811E00CCCCCCFFFFFFCCCCCCFF
            FFFFCCCCCCFFFFFF7F1E01EECC9EF3CE9780504BFF00FFFF00FFFF00FFBC8268
            FFFFFF811E00FFFFFFCCCCCCFEFEFECCCCCCFFFFFFCCCCCC811E00F0D0A6F6D3
            A080504BFF00FFFF00FFFF00FFD1926DFFFFFF811E00CCCCCCFEFEFECCCCCCFE
            FEFECCCCCCFFFFFF811E00F4D8B1EBCFA480504BFF00FFFF00FFFF00FFD1926D
            FFFFFF811E00811E00811E00811E00811E00811E00811E00811E00B6AA93B6AA
            9380504BFF00FFFF00FFFF00FFDA9D75FFFFFFFFFFFFFFFFFFFFFFFFFFFEFCFC
            F6EFFCF3E6EDD8C9A0675B80504B80504B80504BFF00FFFF00FFFF00FFDA9D75
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFFFEF7DAC1BAA0675BE19E55E68F
            31BF7A5CFF00FFFF00FFFF00FFE7AB79FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFDCC7C5A0675BF8B55CBF7A5CFF00FFFF00FFFF00FFFF00FFE7AB79
            FBF4F0FBF4EFFAF3EFFAF3EFF8F2EFF7F2EFF7F2EFD8C2C0A0675BC1836CFF00
            FFFF00FFFF00FFFF00FFFF00FFE7AB79CF8E68CF8E68CF8E68CF8E68CF8E68CF
            8E68CF8E68CF8E68A0675BFF00FFFF00FFFF00FFFF00FFFF00FF}
          LookAndFeel.NativeStyle = False
        end
      end
    end
  end
  object cdsProductos: TDACDSDataTable
    RemoteUpdatesOptions = []
    Fields = <
      item
        Name = 'ProductoID'
        DataType = datInteger
        Required = True
        InPrimaryKey = True
      end
      item
        Name = 'Descripcion'
        DataType = datString
        Size = 80
        Required = True
      end
      item
        Name = 'Precio'
        DataType = datFloat
        Required = True
      end
      item
        Name = 'PorcentajeImpuesto'
        DataType = datFloat
        Required = True
      end
      item
        Name = 'IEPS'
        DataType = datFloat
      end>
    Params = <>
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = DMFlotillas.RemoteDataAdapter
    LogicalName = 'dbo Producto'
    IndexDefs = <>
    Left = 752
    Top = 120
  end
  object dsProductos: TDADataSource
    DataSet = cdsProductos.Dataset
    DataTable = cdsProductos
    Left = 784
    Top = 120
  end
  object cdsVehiculoProducto: TDACDSDataTable
    RemoteUpdatesOptions = []
    Fields = <
      item
        Name = 'ProductoID'
        DataType = datInteger
        InPrimaryKey = True
      end
      item
        Name = 'VehiculoID'
        DataType = datInteger
        InPrimaryKey = True
      end>
    Params = <>
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = DMFlotillas.RemoteDataAdapter
    LogicalName = 'dbo VehiculoProducto'
    IndexDefs = <>
    Left = 752
    Top = 152
  end
  object dsVehiculoProducto: TDADataSource
    DataSet = cdsVehiculoProducto.Dataset
    DataTable = cdsVehiculoProducto
    Left = 784
    Top = 152
  end
  object cdsTipoReferencia: TDACDSDataTable
    RemoteUpdatesOptions = []
    Fields = <
      item
        Name = 'TipoReferenciaID'
        DataType = datInteger
      end
      item
        Name = 'Nombre'
        DataType = datString
        Size = 50
      end>
    Params = <>
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = DMFlotillas.RemoteDataAdapter
    LogicalName = 'dbo TipoReferencia'
    IndexDefs = <>
    Left = 752
    Top = 184
  end
  object dsTipoReferencia: TDADataSource
    DataSet = cdsTipoReferencia.Dataset
    DataTable = cdsTipoReferencia
    Left = 784
    Top = 184
  end
  object cdsReferencia: TDACDSDataTable
    RemoteUpdatesOptions = []
    Fields = <
      item
        Name = 'VehiculoID'
        DataType = datInteger
        InPrimaryKey = True
      end
      item
        Name = 'TipoReferenciaID'
        DataType = datInteger
        InPrimaryKey = True
      end
      item
        Name = 'Referencia'
        DataType = datString
        Size = 50
      end>
    Params = <
      item
        Name = 'VehiculoID'
        Value = ''
      end>
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = DMFlotillas.RemoteDataAdapter
    LogicalName = 'dbo Referencia'
    IndexDefs = <>
    Left = 752
    Top = 216
  end
  object dsReferencia: TDADataSource
    DataSet = cdsReferencia.Dataset
    DataTable = cdsReferencia
    Left = 784
    Top = 216
  end
  object cdsCatalogo: TDAMemDataTable
    RemoteUpdatesOptions = []
    Fields = <
      item
        Name = 'VehiculoID'
        DataType = datInteger
      end
      item
        Name = 'DigitoSeguridad'
        DataType = datInteger
      end
      item
        Name = 'Nombre'
        DataType = datString
        Size = 30
      end
      item
        Name = 'Identificacion'
        DataType = datString
        Size = 30
      end
      item
        Name = 'Departamento'
        DataType = datString
        Size = 20
      end
      item
        Name = 'CuentaContable'
        DataType = datString
        Size = 20
      end
      item
        Name = 'CentroCostos'
        DataType = datString
        Size = 15
      end
      item
        Name = 'NumeroEconomico'
        DataType = datString
        Size = 15
      end
      item
        Name = 'NIP'
        DataType = datString
        Size = 8
      end
      item
        Name = 'Estatus'
        DataType = datString
        Size = 1
      end
      item
        Name = 'CargasMaximas'
        DataType = datInteger
      end
      item
        Name = 'Odometro'
        DataType = datBoolean
      end
      item
        Name = 'Firma'
        DataType = datBoolean
      end
      item
        Name = 'Placas'
        DataType = datBoolean
      end
      item
        Name = 'FechaAlta'
        DataType = datDateTime
      end
      item
        Name = 'FechaExpira'
        DataType = datDateTime
      end
      item
        Name = 'FechaBaja'
        DataType = datDateTime
      end
      item
        Name = 'FechaCancelacion'
        DataType = datDateTime
      end
      item
        Name = 'FechaBloqueada'
        DataType = datDateTime
      end
      item
        Name = 'FechaInactiva'
        DataType = datDateTime
      end
      item
        Name = 'Mensaje'
        DataType = datString
        Size = 50
      end
      item
        Name = 'LimiteLTTurno'
        DataType = datFloat
      end
      item
        Name = 'LimiteLTDia'
        DataType = datFloat
      end
      item
        Name = 'LimiteLTSemana'
        DataType = datFloat
      end
      item
        Name = 'LimiteLTMes'
        DataType = datFloat
      end
      item
        Name = 'LimiteMNTurno'
        DataType = datFloat
      end
      item
        Name = 'LimiteMNDia'
        DataType = datFloat
      end
      item
        Name = 'LimiteMNSemana'
        DataType = datFloat
      end
      item
        Name = 'LimiteMNMes'
        DataType = datFloat
      end
      item
        Name = 'ActualLTTurno'
        DataType = datFloat
      end
      item
        Name = 'ActualLTDia'
        DataType = datFloat
      end
      item
        Name = 'ActualLTSemana'
        DataType = datFloat
      end
      item
        Name = 'ActualLTMes'
        DataType = datFloat
      end
      item
        Name = 'ActualMNTurno'
        DataType = datFloat
      end
      item
        Name = 'ActualMNDia'
        DataType = datFloat
      end
      item
        Name = 'ActualMNSemana'
        DataType = datFloat
      end
      item
        Name = 'ActualMNMes'
        DataType = datFloat
      end
      item
        Name = 'ActualCargas'
        DataType = datInteger
      end
      item
        Name = 'Clasificacion'
        DataType = datInteger
      end
      item
        Name = 'Generada'
        DataType = datBoolean
      end
      item
        Name = 'Lunes'
        DataType = datString
        Size = 24
      end
      item
        Name = 'Martes'
        DataType = datString
        Size = 24
      end
      item
        Name = 'Miercoles'
        DataType = datString
        Size = 24
      end
      item
        Name = 'Jueves'
        DataType = datString
        Size = 24
      end
      item
        Name = 'Viernes'
        DataType = datString
        Size = 24
      end
      item
        Name = 'Sabado'
        DataType = datString
        Size = 24
      end
      item
        Name = 'Domingo'
        DataType = datString
        Size = 24
      end
      item
        Name = 'Productoautorizado'
        DataType = datWideString
        Size = 10
      end
      item
        Name = 'ClienteID'
        DataType = datInteger
      end
      item
        Name = 'GasolineroID'
        DataType = datInteger
      end
      item
        Name = 'MES1'
        DataType = datDateTime
      end
      item
        Name = 'MES2'
        DataType = datDateTime
      end
      item
        Name = 'MONTO'
        DataType = datFloat
      end>
    Params = <
      item
        Name = 'ClienteID'
        Value = '1037'
      end>
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = DMFlotillas.RemoteDataAdapter
    BeforePost = cdsCatalogoBeforePost
    AfterPost = cdsCatalogoAfterPost
    AfterScroll = cdsCatalogoAfterScroll
    OnNewRecord = cdsCatalogoNewRecord
    LogicalName = 'dbo Vehiculo'
    IndexDefs = <>
    Left = 752
    Top = 248
  end
  object dsCatalogo: TDADataSource
    DataSet = cdsCatalogo.Dataset
    OnStateChange = dsCatalogoStateChange
    DataTable = cdsCatalogo
    Left = 784
    Top = 248
  end
end
