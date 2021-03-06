inherited frmDenominacion: TfrmDenominacion
  Caption = 'frmDenominacion'
  ClientHeight = 441
  ClientWidth = 717
  ExplicitTop = -1
  ExplicitWidth = 717
  ExplicitHeight = 441
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcCatalogo: TcxPageControl
    Width = 717
    Height = 441
    OnPageChanging = pgcCatalogoPageChanging
    ExplicitWidth = 717
    ExplicitHeight = 441
    ClientRectBottom = 411
    ClientRectRight = 711
    inherited cxTabSheet1: TcxTabSheet
      ExplicitLeft = 3
      ExplicitTop = 3
      ExplicitWidth = 708
      ExplicitHeight = 408
      inherited dbgCatalogo: TcxGrid
        Width = 708
        Height = 408
        ExplicitWidth = 708
        ExplicitHeight = 408
        inherited dbgCatalogoDBTableView1: TcxGridDBTableView
          object dbgCatalogoDBTableView1RecID: TcxGridDBColumn
            DataBinding.FieldName = 'RecID'
            Visible = False
          end
          object dbgCatalogoDBTableView1IDMONEDA: TcxGridDBColumn
            Caption = 'ID'
            DataBinding.FieldName = 'IDMONEDA'
            Width = 57
          end
          object dbgCatalogoDBTableView1DESCRIPCION: TcxGridDBColumn
            DataBinding.FieldName = 'DESCRIPCION'
          end
        end
      end
    end
    inherited cxTabSheet2: TcxTabSheet
      ExplicitLeft = 3
      ExplicitTop = 3
      ExplicitWidth = 708
      ExplicitHeight = 408
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 708
        Height = 30
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Caption = ' Informacion de Tipo de Cambio'
        Color = clBtnShadow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        ExplicitWidth = 616
      end
      object Panel2: TPanel
        Left = 0
        Top = 30
        Width = 708
        Height = 2
        Align = alTop
        BevelOuter = bvNone
        Color = clNone
        ParentBackground = False
        TabOrder = 1
        ExplicitWidth = 616
      end
      object LblNoProducto: TcxLabel
        Left = 16
        Top = 48
        Caption = 'ID'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object TxtNoProducto: TcxDBTextEdit
        Left = 115
        Top = 47
        TabStop = False
        DataBinding.DataField = 'IDMONEDA'
        DataBinding.DataSource = dsCatalogo
        Enabled = False
        Properties.CharCase = ecUpperCase
        Properties.ReadOnly = False
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 3
        Width = 67
      end
      object LblNombre: TcxLabel
        Left = 16
        Top = 88
        Caption = 'Descripcion'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object TxtNombre: TcxDBTextEdit
        Left = 115
        Top = 87
        DataBinding.DataField = 'DESCRIPCION'
        DataBinding.DataSource = dsCatalogo
        Properties.CharCase = ecUpperCase
        Style.BorderStyle = ebsUltraFlat
        Style.LookAndFeel.NativeStyle = False
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 5
        Width = 337
      end
      object cxGroupBox1: TcxGroupBox
        Left = 16
        Top = 119
        Caption = 'Actualiza el Tipo de Cambio de la Moneda'
        TabOrder = 6
        Height = 286
        Width = 436
        object Label2: TLabel
          Left = 15
          Top = 31
          Width = 35
          Height = 13
          Caption = 'Importe'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object Label1: TLabel
          Left = 120
          Top = 31
          Width = 30
          Height = 13
          Caption = 'Fecha'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
        end
        object edtImporte: TcxCurrencyEdit
          Left = 56
          Top = 28
          EditValue = 0
          Properties.DisplayFormat = '#0.00'
          TabOrder = 0
          Width = 58
        end
        object dtpFecha: TcxDateEdit
          Left = 160
          Top = 28
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
          Width = 121
        end
        object cxButton2: TcxButton
          Left = 287
          Top = 25
          Width = 30
          Height = 27
          TabOrder = 2
          OnClick = cxButton2Click
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000122005C024A00CC024A00CC024A00CC024A00CC024A
            00CC024A00CC0122005C00000000000000000000000000000000000000000000
            0000000000000328005C055700CC22D911FF22D911FF22D911FF22D911FF22D9
            11FF22D911FF055700CC0328005C000000000000000000000000000000000000
            0000042E005C086400CC28D317FF22D111FF22D111FF22B611FF22B611FF22D1
            11FF22D111FF22D111FF086400CC042E005C0000000000000000000000000430
            005C0A6A00CC31CF20FF22C811FF22C811FF22BC11FFE8E8E8FFECECECFF22BC
            11FF22C811FF22C811FF22C811FF0A6A00CC0430005C00000000000000000A6E
            00CC3DCD2CFF22BE11FF22BE11FF22BE11FF22B511FFE4E4E4FFE8E8E8FF22B5
            11FF22BE11FF22BE11FF22BE11FF23BE12FF0A6E00CC00000000000000000B71
            00CC41C330FF23B412FF22A811FF22A811FF22A411FFE0E0E0FFE4E4E4FF22A4
            11FF22A811FF22A811FF22B411FF25B514FF0B7100CC00000000000000000C75
            00CC52C941FF33AF22FFD4D4D4FFD3D3D3FFD7D7D7FFDCDCDCFFE0E0E0FFE4E4
            E4FFE8E8E8FFECECECFF22A611FF28AF17FF0C7500CC00000000000000000D78
            00CC55CC44FF3CB32BFFF8F8F8FFE1E1E1FFD5D5D5FFD7D7D7FFDCDCDCFFE0E0
            E0FFE4E4E4FFE8E8E8FF22A011FF2CAA1BFF0D7800CC00000000000000000E7B
            00CC5AD149FF47BE36FF3EB52DFF3EB52DFF37AE26FFEBEBEBFFE2E2E2FF259D
            14FF239B12FF239B12FF279F16FF39B128FF0E7B00CC00000000000000000E7E
            00CC72E961FF4EC53DFF4EC53DFF4EC53DFF44BB33FFFFFFFFFFFFFFFFFF44BB
            33FF4EC53DFF4EC53DFF4EC53DFF62D951FF0E7E00CC0000000000000000073A
            005C0F8200CC75EC64FF57CE46FF57CE46FF4AC139FFFFFFFFFFFFFFFFFF4AC1
            39FF57CE46FF57CE46FF6BE25AFF0F8200CC073A005C00000000000000000000
            0000073C005C108400CC77EE66FF5FD64EFF5FD64EFF50C73FFF50C73FFF5FD6
            4EFF5FD64EFF72E961FF108400CC073C005C0000000000000000000000000000
            000000000000073D005C108600CC77EE66FF6EE55DFF6EE55DFF6DE45CFF6DE4
            5CFF76ED65FF108600CC073D005C000000000000000000000000000000000000
            00000000000000000000083D005C118800CC118800CC118800CC118800CC1188
            00CC118800CC083D005C00000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000}
        end
        object cxGrid1: TcxGrid
          Left = 3
          Top = 58
          Width = 430
          Height = 220
          Align = alBottom
          TabOrder = 3
          object cxGrid1DBTableView1: TcxGridDBTableView
            NavigatorButtons.ConfirmDelete = False
            DataController.DataSource = dsValorMoneda
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsView.GroupByBox = False
            object cxGrid1DBTableView1RecID: TcxGridDBColumn
              DataBinding.FieldName = 'RecID'
              Visible = False
            end
            object cxGrid1DBTableView1VALOR: TcxGridDBColumn
              Caption = 'Valor'
              DataBinding.FieldName = 'VALOR'
              Width = 160
            end
            object cxGrid1DBTableView1FECHA: TcxGridDBColumn
              Caption = 'Fecha en que entra en vigor el cambio'
              DataBinding.FieldName = 'FECHA'
              Width = 193
            end
          end
          object cxGrid1Level1: TcxGridLevel
            GridView = cxGrid1DBTableView1
          end
        end
      end
    end
  end
  inherited cdsCatalogo: TDAMemDataTable
    Fields = <
      item
        Name = 'IDMONEDA'
        DataType = datInteger
        Required = True
        InPrimaryKey = True
      end
      item
        Name = 'DESCRIPCION'
        DataType = datString
        Size = 100
      end>
    RemoteDataAdapter = DM.RemoteDataAdapter
    OnNewRecord = cdsCatalogoNewRecord
    LogicalName = 'dbo MONEDA'
  end
  inherited dsCatalogo: TDADataSource
    DataSet = cdsCatalogo.Dataset
  end
  object cdsValorMoneda: TDAMemDataTable
    RemoteUpdatesOptions = []
    Fields = <
      item
        Name = 'IDVALORMONEDA'
        DataType = datInteger
      end
      item
        Name = 'IDMONEDA'
        DataType = datInteger
      end
      item
        Name = 'VALOR'
        DataType = datFloat
      end
      item
        Name = 'NUMEROESTACION'
        DataType = datInteger
      end
      item
        Name = 'FECHA'
        DataType = datDateTime
      end>
    Params = <
      item
        Name = 'IDMONEDA'
        DataType = datInteger
        Value = '1'
      end>
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = DM.RemoteDataAdapter
    AfterPost = cdsCatalogoAfterPost
    AfterDelete = cdsCatalogoAfterPost
    LogicalName = 'dbo VALORMONEDA'
    IndexDefs = <>
    Left = 496
    Top = 216
  end
  object dsValorMoneda: TDADataSource
    DataSet = cdsValorMoneda.Dataset
    OnStateChange = dsCatalogoStateChange
    DataTable = cdsValorMoneda
    Left = 496
    Top = 264
  end
end
