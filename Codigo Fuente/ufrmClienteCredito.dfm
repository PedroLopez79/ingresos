inherited frmClienteCredito: TfrmClienteCredito
  Caption = 'frmClienteCredito'
  ClientHeight = 533
  ClientWidth = 871
  OnShow = FormShow
  ExplicitTop = -36
  ExplicitWidth = 871
  ExplicitHeight = 533
  PixelsPerInch = 96
  TextHeight = 13
  object pgcCatalogo: TcxPageControl
    Left = 0
    Top = 32
    Width = 871
    Height = 501
    Hint = ''
    Align = alClient
    TabOrder = 0
    Properties.ActivePage = cxTabSheet1
    Properties.CustomButtons.Buttons = <>
    Properties.Images = dmImages.Imagenes
    Properties.TabHeight = 50
    Properties.TabPosition = tpBottom
    Properties.TabSlants.Kind = skCutCorner
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'Office2007Black'
    TabSlants.Kind = skCutCorner
    ClientRectBottom = 440
    ClientRectLeft = 3
    ClientRectRight = 865
    ClientRectTop = 3
    object cxTabSheet1: TcxTabSheet
      Caption = 'Busqueda'
      ImageIndex = 0
      object dbgCatalogo: TcxGrid
        Left = 0
        Top = 0
        Width = 862
        Height = 437
        Hint = ''
        Align = alClient
        TabOrder = 0
        LookAndFeel.Kind = lfFlat
        LookAndFeel.NativeStyle = False
        object dbgCatalogoDBTableView1: TcxGridDBTableView
          OnDblClick = dbgCatalogoDBTableView1DblClick
          OnKeyPress = dbgCatalogoDBTableView1KeyPress
          Navigator.Buttons.CustomButtons = <>
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
          object dbgCatalogoDBTableView1ClienteID: TcxGridDBColumn
            Caption = 'ID'
            DataBinding.FieldName = 'ClienteID'
          end
          object dbgCatalogoDBTableView1Nombre: TcxGridDBColumn
            DataBinding.FieldName = 'Nombre'
            Width = 388
          end
          object dbgCatalogoDBTableView1RazonSocial: TcxGridDBColumn
            DataBinding.FieldName = 'RazonSocial'
          end
          object dbgCatalogoDBTableView1Domicilio: TcxGridDBColumn
            DataBinding.FieldName = 'Domicilio'
          end
          object dbgCatalogoDBTableView1Grupo: TcxGridDBColumn
            DataBinding.FieldName = 'Grupo'
          end
          object dbgCatalogoDBTableView1Colonia: TcxGridDBColumn
            DataBinding.FieldName = 'Colonia'
          end
          object dbgCatalogoDBTableView1CodigoPostal: TcxGridDBColumn
            DataBinding.FieldName = 'CodigoPostal'
          end
          object dbgCatalogoDBTableView1Ciudad: TcxGridDBColumn
            DataBinding.FieldName = 'Ciudad'
          end
          object dbgCatalogoDBTableView1Telefono: TcxGridDBColumn
            DataBinding.FieldName = 'Telefono'
          end
          object dbgCatalogoDBTableView1RFC: TcxGridDBColumn
            DataBinding.FieldName = 'RFC'
          end
          object dbgCatalogoDBTableView1CuentaContable: TcxGridDBColumn
            DataBinding.FieldName = 'CuentaContable'
          end
          object dbgCatalogoDBTableView1PlazoPago: TcxGridDBColumn
            DataBinding.FieldName = 'PlazoPago'
          end
          object dbgCatalogoDBTableView1Estatus: TcxGridDBColumn
            DataBinding.FieldName = 'Estatus'
          end
          object dbgCatalogoDBTableView1FechaIngreso: TcxGridDBColumn
            DataBinding.FieldName = 'FechaIngreso'
          end
          object dbgCatalogoDBTableView1NIP: TcxGridDBColumn
            DataBinding.FieldName = 'NIP'
          end
          object dbgCatalogoDBTableView1FechaBaja: TcxGridDBColumn
            DataBinding.FieldName = 'FechaBaja'
          end
          object dbgCatalogoDBTableView1LimiteCredito: TcxGridDBColumn
            DataBinding.FieldName = 'LimiteCredito'
          end
          object dbgCatalogoDBTableView1Deposito: TcxGridDBColumn
            DataBinding.FieldName = 'Deposito'
          end
          object dbgCatalogoDBTableView1CambioCredito: TcxGridDBColumn
            DataBinding.FieldName = 'CambioCredito'
          end
          object dbgCatalogoDBTableView1CambioCreditoAnterior: TcxGridDBColumn
            DataBinding.FieldName = 'CambioCreditoAnterior'
          end
          object dbgCatalogoDBTableView1UltimoPago: TcxGridDBColumn
            DataBinding.FieldName = 'UltimoPago'
          end
          object dbgCatalogoDBTableView1DiaCorteSemana: TcxGridDBColumn
            DataBinding.FieldName = 'DiaCorteSemana'
          end
          object dbgCatalogoDBTableView1ClienteNuevo: TcxGridDBColumn
            DataBinding.FieldName = 'ClienteNuevo'
          end
          object dbgCatalogoDBTableView1Tasa: TcxGridDBColumn
            DataBinding.FieldName = 'Tasa'
          end
          object dbgCatalogoDBTableView1TarjetaID: TcxGridDBColumn
            DataBinding.FieldName = 'TarjetaID'
          end
          object dbgCatalogoDBTableView1FormaPagoID: TcxGridDBColumn
            DataBinding.FieldName = 'FormaPagoID'
          end
          object dbgCatalogoDBTableView1GrupoFacturarID: TcxGridDBColumn
            DataBinding.FieldName = 'GrupoFacturarID'
          end
          object dbgCatalogoDBTableView1VendedorID: TcxGridDBColumn
            DataBinding.FieldName = 'VendedorID'
          end
          object dbgCatalogoDBTableView1GasolineroID: TcxGridDBColumn
            DataBinding.FieldName = 'GasolineroID'
          end
          object dbgCatalogoDBTableView1FormaCompraID: TcxGridDBColumn
            DataBinding.FieldName = 'FormaCompraID'
          end
          object dbgCatalogoDBTableView1ClasificacionID: TcxGridDBColumn
            DataBinding.FieldName = 'ClasificacionID'
          end
          object dbgCatalogoDBTableView1FacturaConsumoCupon: TcxGridDBColumn
            DataBinding.FieldName = 'FacturaConsumoCupon'
          end
          object dbgCatalogoDBTableView1NoExterior: TcxGridDBColumn
            DataBinding.FieldName = 'NoExterior'
          end
          object dbgCatalogoDBTableView1Localidad: TcxGridDBColumn
            DataBinding.FieldName = 'Localidad'
          end
          object dbgCatalogoDBTableView1Municipio: TcxGridDBColumn
            DataBinding.FieldName = 'Municipio'
          end
          object dbgCatalogoDBTableView1Estado: TcxGridDBColumn
            DataBinding.FieldName = 'Estado'
          end
          object dbgCatalogoDBTableView1Pais: TcxGridDBColumn
            DataBinding.FieldName = 'Pais'
          end
          object dbgCatalogoDBTableView1email: TcxGridDBColumn
            DataBinding.FieldName = 'email'
          end
          object dbgCatalogoDBTableView1FechaAniversario: TcxGridDBColumn
            DataBinding.FieldName = 'FechaAniversario'
          end
        end
        object dbgCatalogoLevel1: TcxGridLevel
          GridView = dbgCatalogoDBTableView1
        end
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = 'Datos'
      ImageIndex = 15
      object cxGroupBox2: TcxGroupBox
        Left = 0
        Top = 1
        Hint = ''
        Caption = ' Cat'#225'logo de Clientes '
        TabOrder = 0
        Height = 430
        Width = 793
        object Label13: TLabel
          Left = 10
          Top = 22
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
        object Label14: TLabel
          Left = 10
          Top = 54
          Width = 63
          Height = 13
          Caption = 'Raz'#243'n Social'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label15: TLabel
          Left = 10
          Top = 87
          Width = 86
          Height = 13
          Caption = 'Nombre Comercial'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label16: TLabel
          Left = 10
          Top = 118
          Width = 29
          Height = 13
          Caption = 'Grupo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label21: TLabel
          Left = 10
          Top = 151
          Width = 71
          Height = 13
          Caption = 'Calle / N'#250'mero'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label22: TLabel
          Left = 10
          Top = 182
          Width = 35
          Height = 13
          Caption = 'Colonia'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label23: TLabel
          Left = 10
          Top = 214
          Width = 90
          Height = 13
          Caption = 'Ciudad Delegaci'#243'n'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label24: TLabel
          Left = 10
          Top = 246
          Width = 65
          Height = 13
          Caption = 'C'#243'digo Postal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label35: TLabel
          Left = 404
          Top = 182
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
        object Label36: TLabel
          Left = 403
          Top = 118
          Width = 83
          Height = 13
          Caption = 'Forma de Compra'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label37: TLabel
          Left = 404
          Top = 372
          Width = 80
          Height = 13
          Caption = 'Agente de Venta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          Visible = False
        end
        object Label38: TLabel
          Left = 404
          Top = 399
          Width = 80
          Height = 13
          Caption = 'Grupo a Facturar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          Visible = False
        end
        object Label39: TLabel
          Left = 403
          Top = 87
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
        object Label40: TLabel
          Left = 403
          Top = 54
          Width = 21
          Height = 13
          Caption = 'RFC'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label41: TLabel
          Left = 403
          Top = 22
          Width = 42
          Height = 13
          Caption = 'Tel'#233'fono'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label54: TLabel
          Left = 403
          Top = 150
          Width = 59
          Height = 13
          Caption = 'Clasificaci'#243'n'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label56: TLabel
          Left = 9
          Top = 278
          Width = 49
          Height = 13
          Caption = 'NoExterior'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label57: TLabel
          Left = 10
          Top = 307
          Width = 46
          Height = 13
          Caption = 'Localidad'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label72: TLabel
          Left = 10
          Top = 336
          Width = 45
          Height = 13
          Caption = 'Municipio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label75: TLabel
          Left = 10
          Top = 364
          Width = 33
          Height = 13
          Caption = 'Estado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label73: TLabel
          Left = 10
          Top = 394
          Width = 20
          Height = 13
          Caption = 'Pais'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label74: TLabel
          Left = 403
          Top = 246
          Width = 24
          Height = 13
          Caption = 'email'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label76: TLabel
          Left = 404
          Top = 215
          Width = 85
          Height = 13
          Caption = 'Fecha Aniversario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label77: TLabel
          Left = 210
          Top = 247
          Width = 58
          Height = 13
          Caption = '-  No Interior'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object TXTCLIENTE: TcxDBTextEdit
          Left = 124
          Top = 19
          Hint = ''
          DataBinding.DataField = 'ClienteID'
          DataBinding.DataSource = dsCatalogo
          Enabled = False
          TabOrder = 0
          Width = 60
        end
        object TXTRAZON: TcxDBTextEdit
          Left = 124
          Top = 51
          Hint = ''
          DataBinding.DataField = 'RazonSocial'
          DataBinding.DataSource = dsCatalogo
          Properties.CharCase = ecUpperCase
          TabOrder = 1
          Width = 232
        end
        object TXTNOMBRE: TcxDBTextEdit
          Left = 124
          Top = 84
          Hint = ''
          DataBinding.DataField = 'Nombre'
          DataBinding.DataSource = dsCatalogo
          Properties.CharCase = ecUpperCase
          TabOrder = 2
          Width = 232
        end
        object TXTGRUPO: TcxDBTextEdit
          Left = 124
          Top = 114
          Hint = ''
          DataBinding.DataField = 'Grupo'
          DataBinding.DataSource = dsCatalogo
          Properties.CharCase = ecUpperCase
          TabOrder = 3
          Width = 232
        end
        object TXTDOMICILIO: TcxDBTextEdit
          Left = 124
          Top = 148
          Hint = ''
          DataBinding.DataField = 'Domicilio'
          DataBinding.DataSource = dsCatalogo
          Properties.CharCase = ecUpperCase
          TabOrder = 4
          Width = 232
        end
        object TXTCOLONIA: TcxDBTextEdit
          Left = 124
          Top = 179
          Hint = ''
          DataBinding.DataField = 'Colonia'
          DataBinding.DataSource = dsCatalogo
          Properties.CharCase = ecUpperCase
          TabOrder = 5
          Width = 232
        end
        object TXTCIUDAD: TcxDBTextEdit
          Left = 124
          Top = 211
          Hint = ''
          DataBinding.DataField = 'Ciudad'
          DataBinding.DataSource = dsCatalogo
          Properties.CharCase = ecUpperCase
          TabOrder = 6
          Width = 232
        end
        object TXTCP: TcxDBTextEdit
          Left = 124
          Top = 243
          Hint = ''
          DataBinding.DataField = 'CodigoPostal'
          DataBinding.DataSource = dsCatalogo
          Properties.CharCase = ecUpperCase
          TabOrder = 7
          Width = 75
        end
        object TXTCUENTACONTABLE: TcxDBTextEdit
          Left = 512
          Top = 84
          Hint = ''
          DataBinding.DataField = 'CuentaContable'
          DataBinding.DataSource = dsCatalogo
          Properties.CharCase = ecUpperCase
          TabOrder = 15
          Width = 193
        end
        object TXTRFC: TcxDBTextEdit
          Left = 512
          Top = 51
          Hint = ''
          DataBinding.DataField = 'RFC'
          DataBinding.DataSource = dsCatalogo
          Properties.CharCase = ecUpperCase
          TabOrder = 14
          OnExit = TXTRFCExit
          Width = 193
        end
        object TXTTELEFONO: TcxDBTextEdit
          Left = 512
          Top = 19
          Hint = ''
          DataBinding.DataField = 'Telefono'
          DataBinding.DataSource = dsCatalogo
          Properties.CharCase = ecUpperCase
          TabOrder = 13
          Width = 193
        end
        object LOOKUPCMFORMACOMPRA: TcxDBLookupComboBox
          Left = 512
          Top = 115
          Hint = ''
          DataBinding.DataField = 'FormaCompraID'
          DataBinding.DataSource = dsCatalogo
          Properties.KeyFieldNames = 'FormaCompraID'
          Properties.ListColumns = <
            item
              FieldName = 'Nombre'
            end>
          Properties.ListSource = dsFormaCompra
          Properties.MaxLength = 0
          TabOrder = 18
          Width = 238
        end
        object LOOKUPCMDIAFACTURAR: TcxDBLookupComboBox
          Left = 512
          Top = 396
          Hint = ''
          DataBinding.DataField = 'GrupoFacturarID'
          DataBinding.DataSource = dsCatalogo
          Properties.KeyFieldNames = 'GrupoFacturarID'
          Properties.ListColumns = <
            item
              FieldName = 'Nombre'
            end>
          Properties.MaxLength = 0
          TabOrder = 16
          Visible = False
          Width = 238
        end
        object LOOKUPCMAGENTEVENTA: TcxDBLookupComboBox
          Left = 512
          Top = 369
          Hint = ''
          DataBinding.DataField = 'VendedorID'
          DataBinding.DataSource = dsCatalogo
          Properties.KeyFieldNames = 'VendedorID'
          Properties.ListColumns = <
            item
              FieldName = 'Nombre'
            end>
          Properties.MaxLength = 0
          TabOrder = 17
          Visible = False
          Width = 238
        end
        object cxDBImageComboBox1: TcxDBImageComboBox
          Left = 512
          Top = 179
          Hint = ''
          DataBinding.DataField = 'Estatus'
          DataBinding.DataSource = dsCatalogo
          Properties.Items = <
            item
              Description = 'ACTIVO'
              ImageIndex = 0
              Value = 'A'
            end
            item
              Description = 'INACTIVO'
              Value = 'I'
            end
            item
              Description = 'CANCELADO'
              Value = 'C'
            end>
          TabOrder = 20
          Width = 238
        end
        object cxDBLookupComboBox1: TcxDBLookupComboBox
          Left = 512
          Top = 147
          Hint = ''
          DataBinding.DataField = 'ClasificacionID'
          DataBinding.DataSource = dsCatalogo
          Properties.KeyFieldNames = 'ClasificacionID'
          Properties.ListColumns = <
            item
              FieldName = 'Nombre'
            end>
          Properties.MaxLength = 0
          TabOrder = 19
          Width = 238
        end
        object cxDBTextEdit11: TcxDBTextEdit
          Left = 124
          Top = 275
          Hint = ''
          DataBinding.DataField = 'NoExterior'
          DataBinding.DataSource = dsCatalogo
          Properties.CharCase = ecUpperCase
          TabOrder = 8
          Width = 75
        end
        object cxDBTextEdit12: TcxDBTextEdit
          Left = 124
          Top = 304
          Hint = ''
          DataBinding.DataField = 'Localidad'
          DataBinding.DataSource = dsCatalogo
          Properties.CharCase = ecUpperCase
          TabOrder = 9
          Width = 232
        end
        object cxDBTextEdit13: TcxDBTextEdit
          Left = 124
          Top = 333
          Hint = ''
          DataBinding.DataField = 'Municipio'
          DataBinding.DataSource = dsCatalogo
          Properties.CharCase = ecUpperCase
          TabOrder = 10
          Width = 232
        end
        object cxDBTextEdit16: TcxDBTextEdit
          Left = 124
          Top = 361
          Hint = ''
          DataBinding.DataField = 'Estado'
          DataBinding.DataSource = dsCatalogo
          Properties.CharCase = ecUpperCase
          TabOrder = 11
          Width = 232
        end
        object cxDBTextEdit14: TcxDBTextEdit
          Left = 124
          Top = 391
          Hint = ''
          DataBinding.DataField = 'Pais'
          DataBinding.DataSource = dsCatalogo
          Properties.CharCase = ecUpperCase
          TabOrder = 12
          Width = 232
        end
        object cxDBTextEdit15: TcxDBTextEdit
          Left = 512
          Top = 243
          Hint = ''
          DataBinding.DataField = 'email'
          DataBinding.DataSource = dsCatalogo
          Properties.CharCase = ecUpperCase
          TabOrder = 22
          Width = 238
        end
        object cxDBDateEdit1: TcxDBDateEdit
          Left = 512
          Top = 211
          Hint = ''
          DataBinding.DataField = 'FechaAniversario'
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
          TabOrder = 21
          Width = 238
        end
        object cxButton2: TcxButton
          Left = 711
          Top = 47
          Width = 35
          Height = 27
          OptionsImage.Glyph.Data = {
            FA090000424DFA09000000000000360000002800000019000000190000000100
            200000000000C409000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000010000000100000001000000010000
            0001000000020000000200000002000000020000000200000002000000010000
            0001000000010000000100000001000000010000000100000001000000010000
            0001000000000000000000000000000000010000000100000002000000040000
            00060000000700000007000000090000000A0000000A00000009000000070000
            0006000000050000000500000006000000070000000800000008000000070000
            0004000000030000000000000000000000000000000100000004000000060000
            00090000000D0000001000000012000000150000001600000014000000130000
            00110000000D0000000C0000000D0000000F0000001000000012000000100000
            000D000000090000000500000000000000000000000000000001000000060000
            000A00000011000000190000001F000000220000002500000027000000250000
            0022000000200000001C00000019000000190000001C0000001C0000001D0000
            001A000000150000000D00000007000000000000000000000000000000030000
            000A000000110000001C0000002800000031000000360000003C0000003D0000
            003A00000037000000340000002E0000002B0000002B0000002C0000002C0000
            002A000000250000001C000000120000000A0000000000000000000000000000
            00040000000D000000180000002600000039000000450000004B000000520000
            00540000004F0000004B00000049000000410000003D0000003E000000400000
            003D000000380000003000000025000000160000000C00000000000000000000
            000000000004000000100000001D0000003000000047000000560000005E0000
            006700000067000000600000005C0000005B00000054000000500000004F0000
            004F00000049000000410000003500000028000000180000000D000000000000
            00000000000000000005000000100000001F000000340000004F0000005F0000
            00670000007000000070000000690000006600000066000000600000005C0000
            005B000000580000004F000000450000003700000029000000180000000D0000
            00000000000000000000000000050101016A0202028F00000034000000590101
            01AF010101AA010101A6010101B7000000680000006600000066000000610000
            0071010101A3010101A100000070000000450000003700000029000000180000
            000D00000000000000000000000000000004020202C3030303FF0000002F0101
            01AE030303FF010101A5030303D9030303FF0000005E0000005B0000005B0202
            02C1030303FF030303FF030303FF020202D20000004000000035000000280000
            00180000000D00000000000000000000000000000004020202C3030303FF0101
            014F030303FF030303DD0000004C020202D4030303FF0000004C0000004A0000
            0061030303FF030303DD000000660000004E00000062000000360000002D0000
            0022000000160000000C00000000000000000000000000000002020202C20303
            03FF030303FF030303FF0101016200000033020202CE030303FF030303FF0303
            03FF0101018C030303FF0101017D0000002E0000002E0000002B000000270000
            00220000001A000000110000000A000000000000000000000000000000010202
            02C1030303FF01010169030303E3030303F20000001F020202C8030303FF0202
            028F0202028F02020281030303FF0202029C0000001C0000001C0000001C0000
            001A00000017000000130000000C000000070000000000000000000000000000
            0001020202C0030303FF01010164030303F1030303FF0000003D020202C40303
            03FF0101014C0101014C0000002D030303FF030303F102020296010101690101
            01780000000F0000000D0000000B000000070000000400000000000000000000
            000000000000020202C0030303FF030303FF030303FF020202B2000000050202
            02C1030303FF030303FF030303FF0000000501010144020202B2030303FF0303
            03FF020202C10000000600000005000000040000000300000002000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0020010101300000000000000001000000010000000000000000000000000000
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
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000000000000000000000000000}
          TabOrder = 23
          OnClick = cxButton2Click
        end
        object cxDBTextEdit22: TcxDBTextEdit
          Left = 281
          Top = 243
          Hint = ''
          DataBinding.DataField = 'NoInterior'
          DataBinding.DataSource = dsCatalogo
          Properties.CharCase = ecUpperCase
          TabOrder = 24
          Width = 75
        end
      end
    end
    object cxTabSheet3: TcxTabSheet
      Caption = 'Credito'
      ImageIndex = 41
      object cxGroupBox3: TcxGroupBox
        Left = 11
        Top = 11
        Hint = ''
        Caption = ' Datos Generales '
        TabOrder = 0
        Height = 327
        Width = 649
        object Label34: TLabel
          Left = 16
          Top = 54
          Width = 68
          Height = 13
          Caption = 'Fecha Ingreso'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label42: TLabel
          Left = 16
          Top = 87
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
        object Label45: TLabel
          Left = 16
          Top = 120
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
        object Label46: TLabel
          Left = 321
          Top = 281
          Width = 72
          Height = 13
          Caption = 'Forma de Pago'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          Visible = False
        end
        object Label47: TLabel
          Left = 16
          Top = 187
          Width = 42
          Height = 13
          Caption = 'Dep'#243'sito'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label48: TLabel
          Left = 16
          Top = 220
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
        object Label49: TLabel
          Left = 16
          Top = 253
          Width = 67
          Height = 13
          Caption = #218'ltimo Cambio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label50: TLabel
          Left = 16
          Top = 286
          Width = 74
          Height = 13
          Caption = 'Cambio Anterior'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label51: TLabel
          Left = 321
          Top = 54
          Width = 69
          Height = 13
          Caption = 'Plazo de Pago'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label52: TLabel
          Left = 321
          Top = 87
          Width = 57
          Height = 13
          Caption = #218'ltimo Pago'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label53: TLabel
          Left = 321
          Top = 120
          Width = 67
          Height = 13
          Caption = 'Cliente Nuevo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label55: TLabel
          Left = 321
          Top = 152
          Width = 44
          Height = 13
          Caption = 'Tasa IVA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object cxDBTextEdit19: TcxDBTextEdit
          Left = 122
          Top = 117
          Hint = ''
          DataBinding.DataField = 'NIP'
          DataBinding.DataSource = dsCatalogo
          Properties.CharCase = ecUpperCase
          Properties.PasswordChar = '*'
          Properties.ReadOnly = False
          TabOrder = 2
          Width = 145
        end
        object cxDBTextEdit21: TcxDBTextEdit
          Left = 122
          Top = 184
          Hint = ''
          DataBinding.DataField = 'Deposito'
          DataBinding.DataSource = dsCatalogo
          Properties.CharCase = ecUpperCase
          TabOrder = 4
          Width = 145
        end
        object dbeLimiteCredito: TcxDBTextEdit
          Left = 122
          Top = 217
          Hint = ''
          DataBinding.DataField = 'LimiteCredito'
          DataBinding.DataSource = dsCatalogo
          Properties.CharCase = ecUpperCase
          TabOrder = 5
          Width = 145
        end
        object cxDBTextEdit29: TcxDBTextEdit
          Left = 447
          Top = 51
          Hint = ''
          DataBinding.DataField = 'PlazoPago'
          DataBinding.DataSource = dsCatalogo
          Properties.CharCase = ecUpperCase
          TabOrder = 8
          Width = 116
        end
        object DateUltimoPago: TcxDBDateEdit
          Left = 447
          Top = 84
          Hint = ''
          DataBinding.DataField = 'UltimoPago'
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
          TabOrder = 9
          Width = 116
        end
        object DateFechaIngreso: TcxDBDateEdit
          Left = 122
          Top = 51
          Hint = ''
          DataBinding.DataField = 'FechaIngreso'
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
          Width = 116
        end
        object DateFechaBaja: TcxDBDateEdit
          Left = 122
          Top = 84
          Hint = ''
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
          TabOrder = 1
          Width = 116
        end
        object DateUltimoCambio: TcxDBDateEdit
          Left = 122
          Top = 250
          Hint = ''
          DataBinding.DataField = 'CambioCredito'
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
          TabOrder = 6
          Width = 116
        end
        object DateCambioanterior: TcxDBDateEdit
          Left = 122
          Top = 277
          Hint = ''
          DataBinding.DataField = 'CambioCreditoAnterior'
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
          TabOrder = 7
          Width = 116
        end
        object LOOKUPCMFORMAPAGO: TcxDBLookupComboBox
          Left = 448
          Top = 278
          Hint = ''
          DataBinding.DataField = 'FormaPagoID'
          DataBinding.DataSource = dsCatalogo
          Properties.KeyFieldNames = 'FormaPagoID'
          Properties.ListColumns = <
            item
              FieldName = 'Nombre'
            end>
          Properties.MaxLength = 0
          TabOrder = 3
          Visible = False
          Width = 145
        end
        object cxDBImageComboBox2: TcxDBImageComboBox
          Left = 447
          Top = 117
          Hint = ''
          DataBinding.DataField = 'ClienteNuevo'
          DataBinding.DataSource = dsCatalogo
          Properties.Items = <
            item
              Description = 'SI'
              ImageIndex = 0
              Value = True
            end
            item
              Description = 'NO'
              Value = False
            end>
          TabOrder = 10
          Width = 116
        end
        object cxDBImageComboBox3: TcxDBImageComboBox
          Left = 448
          Top = 152
          Hint = ''
          DataBinding.DataField = 'Tasa'
          DataBinding.DataSource = dsCatalogo
          Properties.Items = <
            item
              Description = '10%'
              ImageIndex = 0
              Value = 10.000000000000000000
            end
            item
              Description = '15%'
              Value = 15.000000000000000000
            end>
          TabOrder = 11
          Width = 113
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 871
    Height = 30
    Align = alTop
    Alignment = taLeftJustify
    BevelOuter = bvNone
    Caption = ' Informacion Clientes Credito'
    Color = clBtnShadow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
  end
  object Panel2: TPanel
    Left = 0
    Top = 30
    Width = 871
    Height = 2
    Align = alTop
    BevelOuter = bvNone
    Color = clNone
    ParentBackground = False
    TabOrder = 2
  end
  object cdsCatalogo: TDAMemDataTable
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
    LogicalName = 'dbo Cliente'
    Params = <>
    RemoteDataAdapter = DMFlotillas.RemoteDataAdapter
    RemoteUpdatesOptions = []
    StreamingOptions = [soDisableEventsWhileStreaming]
    AfterDelete = cdsCatalogoAfterDelete
    AfterPost = cdsCatalogoAfterPost
    OnNewRecord = cdsCatalogoNewRecord
    IndexDefs = <>
    Left = 520
    Top = 352
  end
  object dsCatalogo: TDADataSource
    DataSet = cdsCatalogo.Dataset
    OnStateChange = dsCatalogoStateChange
    DataTable = cdsCatalogo
    Left = 552
    Top = 352
  end
  object cdsFormaCompra: TDAMemDataTable
    Fields = <
      item
        Name = 'FormaCompraID'
        DataType = datInteger
      end
      item
        Name = 'Nombre'
        DataType = datString
        Size = 50
      end>
    LogicalName = 'dbo FormaCompra'
    Params = <>
    RemoteDataAdapter = DMFlotillas.RemoteDataAdapter
    RemoteUpdatesOptions = []
    StreamingOptions = [soDisableEventsWhileStreaming]
    IndexDefs = <>
    Left = 622
    Top = 351
  end
  object dsFormaCompra: TDADataSource
    DataSet = cdsFormaCompra.Dataset
    DataTable = cdsFormaCompra
    Left = 654
    Top = 352
  end
end
