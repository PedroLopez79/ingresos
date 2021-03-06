inherited frmClienteEfectivo: TfrmClienteEfectivo
  Caption = 'frmClienteEfectivo'
  ClientHeight = 385
  ClientWidth = 564
  ExplicitWidth = 564
  ExplicitHeight = 385
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcCatalogo: TcxPageControl
    Width = 564
    Height = 385
    ActivePage = cxTabSheet2
    ExplicitWidth = 564
    ExplicitHeight = 385
    ClientRectBottom = 355
    ClientRectRight = 558
    inherited cxTabSheet1: TcxTabSheet
      ExplicitLeft = 3
      ExplicitTop = 3
      ExplicitWidth = 555
      ExplicitHeight = 450
      inherited dbgCatalogo: TcxGrid
        Width = 555
        Height = 352
        ExplicitWidth = 555
        ExplicitHeight = 450
        inherited dbgCatalogoDBTableView1: TcxGridDBTableView
          object dbgCatalogoDBTableView1IDCLIENTE: TcxGridDBColumn
            Caption = 'ID'
            DataBinding.FieldName = 'IDCLIENTE'
            Width = 51
          end
          object dbgCatalogoDBTableView1CODIGO: TcxGridDBColumn
            DataBinding.FieldName = 'CODIGO'
          end
          object dbgCatalogoDBTableView1NOMBRE: TcxGridDBColumn
            DataBinding.FieldName = 'NOMBRE'
            Width = 263
          end
          object dbgCatalogoDBTableView1RFC: TcxGridDBColumn
            DataBinding.FieldName = 'RFC'
          end
          object dbgCatalogoDBTableView1CODIGOPOSTAL: TcxGridDBColumn
            DataBinding.FieldName = 'CODIGOPOSTAL'
            Width = 108
          end
          object dbgCatalogoDBTableView1CURP: TcxGridDBColumn
            DataBinding.FieldName = 'CURP'
          end
          object dbgCatalogoDBTableView1GRUPO: TcxGridDBColumn
            DataBinding.FieldName = 'GRUPO'
          end
          object dbgCatalogoDBTableView1CALLE: TcxGridDBColumn
            DataBinding.FieldName = 'CALLE'
          end
          object dbgCatalogoDBTableView1COLONIA: TcxGridDBColumn
            DataBinding.FieldName = 'COLONIA'
          end
          object dbgCatalogoDBTableView1CIUDAD: TcxGridDBColumn
            DataBinding.FieldName = 'CIUDAD'
          end
          object dbgCatalogoDBTableView1TELEFONO: TcxGridDBColumn
            DataBinding.FieldName = 'TELEFONO'
          end
        end
      end
    end
    inherited cxTabSheet2: TcxTabSheet
      Color = clGradientActiveCaption
      ParentColor = False
      ExplicitWidth = 555
      ExplicitHeight = 352
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 555
        Height = 30
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Caption = ' Informacion de Clientes de Efectivo'
        Color = clBtnShadow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
      end
      object Panel2: TPanel
        Left = 0
        Top = 30
        Width = 555
        Height = 2
        Align = alTop
        BevelOuter = bvNone
        Color = clNone
        ParentBackground = False
        TabOrder = 1
      end
      object TxtNoProducto: TcxDBTextEdit
        Left = 16
        Top = 64
        TabStop = False
        DataBinding.DataField = 'IDCLIENTE'
        DataBinding.DataSource = dsCatalogo
        Enabled = False
        Properties.CharCase = ecUpperCase
        Properties.ReadOnly = False
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 2
        Width = 97
      end
      object LblNoProducto: TcxLabel
        Left = 16
        Top = 48
        Caption = 'Empresa'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object TxtNombre: TcxDBTextEdit
        Left = 119
        Top = 64
        DataBinding.DataField = 'NOMBRE'
        DataBinding.DataSource = dsCatalogo
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 4
        Width = 412
      end
      object LblNombre: TcxLabel
        Left = 119
        Top = 48
        Caption = 'Nombre'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object cxDBTextEdit1: TcxDBTextEdit
        Left = 16
        Top = 103
        DataBinding.DataField = 'GRUPO'
        DataBinding.DataSource = dsCatalogo
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 6
        Width = 515
      end
      object cxLabel1: TcxLabel
        Left = 16
        Top = 86
        Caption = 'Agrupacion'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object cxLabel2: TcxLabel
        Left = 16
        Top = 130
        Caption = 'RFC'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object cxDBTextEdit2: TcxDBTextEdit
        Left = 16
        Top = 147
        DataBinding.DataField = 'RFC'
        DataBinding.DataSource = dsCatalogo
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 9
        Width = 166
      end
      object cxLabel9: TcxLabel
        Left = 16
        Top = 211
        Caption = 'Telefono'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object cxDBTextEdit9: TcxDBTextEdit
        Left = 16
        Top = 228
        DataBinding.DataField = 'TELEFONO'
        DataBinding.DataSource = dsCatalogo
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 11
        Width = 166
      end
      object cxDBTextEdit10: TcxDBTextEdit
        Left = 188
        Top = 147
        DataBinding.DataField = 'CURP'
        DataBinding.DataSource = dsCatalogo
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 12
        Width = 169
      end
      object cxLabel10: TcxLabel
        Left = 188
        Top = 130
        Caption = 'Curp'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object cxDBTextEdit3: TcxDBTextEdit
        Left = 16
        Top = 187
        DataBinding.DataField = 'CALLE'
        DataBinding.DataSource = dsCatalogo
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 14
        Width = 166
      end
      object cxLabel3: TcxLabel
        Left = 16
        Top = 170
        Caption = 'Calle'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object cxDBTextEdit4: TcxDBTextEdit
        Left = 188
        Top = 187
        DataBinding.DataField = 'COLONIA'
        DataBinding.DataSource = dsCatalogo
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 16
        Width = 169
      end
      object cxLabel4: TcxLabel
        Left = 188
        Top = 170
        Caption = 'Colonia'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object cxLabel8: TcxLabel
        Left = 363
        Top = 170
        Caption = 'Ciudad'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object cxDBTextEdit8: TcxDBTextEdit
        Left = 363
        Top = 187
        DataBinding.DataField = 'CIUDAD'
        DataBinding.DataSource = dsCatalogo
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 19
        Width = 168
      end
      object cxDBTextEdit7: TcxDBTextEdit
        Left = 188
        Top = 228
        DataBinding.DataField = 'CODIGOPOSTAL'
        DataBinding.DataSource = dsCatalogo
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 20
        Width = 169
      end
      object cxLabel7: TcxLabel
        Left = 188
        Top = 211
        Caption = 'Codigo Postal'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object cxLabel12: TcxLabel
        Left = 188
        Top = 251
        Caption = 'Cuenta Contable Anticipo'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object cxDBTextEdit11: TcxDBTextEdit
        Left = 188
        Top = 268
        DataBinding.DataField = 'CCC'
        DataBinding.DataSource = dsCatalogo
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 23
        Width = 166
      end
      object cxLabel13: TcxLabel
        Left = 363
        Top = 251
        Caption = 'Cuenta Contable Credito'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object cxDBTextEdit12: TcxDBTextEdit
        Left = 363
        Top = 268
        DataBinding.DataField = 'CCA'
        DataBinding.DataSource = dsCatalogo
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 25
        Width = 169
      end
      object cxDBLookupComboBox1: TcxDBLookupComboBox
        Left = 16
        Top = 312
        DataBinding.DataField = 'STATUS'
        DataBinding.DataSource = dsCatalogo
        Properties.KeyFieldNames = 'IDSTATUS'
        Properties.ListColumns = <
          item
            FieldName = 'NOMBRE'
          end
          item
            FieldName = 'CODIGO'
          end>
        Properties.ListSource = dsStatus
        TabOrder = 26
        Width = 234
      end
      object cxLabel11: TcxLabel
        Left = 16
        Top = 292
        Caption = 'Status'
        ParentFont = False
        Style.BorderStyle = ebsNone
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -11
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        Style.Shadow = False
        Style.IsFontAssigned = True
        Transparent = True
      end
    end
  end
  inherited cdsCatalogo: TDAMemDataTable
    Fields = <
      item
        Name = 'IDCLIENTE'
        DataType = datInteger
      end
      item
        Name = 'CODIGO'
        DataType = datString
        Size = 10
      end
      item
        Name = 'NOMBRE'
        DataType = datString
        Size = 80
      end
      item
        Name = 'GRUPO'
        DataType = datString
        Size = 30
      end
      item
        Name = 'CALLE'
        DataType = datString
        Size = 60
      end
      item
        Name = 'COLONIA'
        DataType = datString
        Size = 30
      end
      item
        Name = 'CIUDAD'
        DataType = datString
        Size = 30
      end
      item
        Name = 'TELEFONO'
        DataType = datString
        Size = 20
      end
      item
        Name = 'CODIGOPOSTAL'
        DataType = datString
        Size = 5
      end
      item
        Name = 'RFC'
        DataType = datString
        Size = 15
      end
      item
        Name = 'CURP'
        DataType = datString
        Size = 20
      end
      item
        Name = 'STATUS'
        DataType = datInteger
      end
      item
        Name = 'CCA'
        DataType = datString
        Size = 20
      end
      item
        Name = 'CCC'
        DataType = datString
        Size = 20
      end>
    RemoteDataAdapter = DM.RemoteDataAdapter
    BeforePost = cdsCatalogoBeforePost
    OnNewRecord = cdsCatalogoNewRecord
    LogicalName = 'dbo CLIENTE'
  end
  inherited dsCatalogo: TDADataSource
    DataSet = cdsCatalogo.Dataset
    Top = 344
  end
  inherited tblCatalogo: TdxMemData
    Left = 528
  end
  object cdsStatus: TDAMemDataTable
    RemoteUpdatesOptions = []
    Fields = <
      item
        Name = 'IDSTATUS'
        DataType = datInteger
        Required = True
        InPrimaryKey = True
      end
      item
        Name = 'CODIGO'
        DataType = datString
        Size = 10
        Required = True
      end
      item
        Name = 'NOMBRE'
        DataType = datString
        Size = 50
        Required = True
      end>
    Params = <>
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = DM.RemoteDataAdapter
    AfterPost = cdsCatalogoAfterPost
    AfterDelete = cdsCatalogoAfterPost
    LogicalName = 'dbo STATUS'
    IndexDefs = <>
    Left = 456
    Top = 312
  end
  object dsStatus: TDADataSource
    DataSet = cdsStatus.Dataset
    OnStateChange = dsCatalogoStateChange
    DataTable = cdsStatus
    Left = 456
    Top = 344
  end
end
