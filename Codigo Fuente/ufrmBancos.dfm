inherited frmBancos: TfrmBancos
  Caption = 'frmBancos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcCatalogo: TcxPageControl
    ActivePage = cxTabSheet2
    TabStop = False
    inherited cxTabSheet1: TcxTabSheet
      inherited dbgCatalogo: TcxGrid
        inherited dbgCatalogoDBTableView1: TcxGridDBTableView
          object dbgCatalogoDBTableView1RecID: TcxGridDBColumn
            DataBinding.FieldName = 'RecID'
            Visible = False
          end
          object dbgCatalogoDBTableView1CODIGO: TcxGridDBColumn
            DataBinding.FieldName = 'CODIGO'
          end
          object dbgCatalogoDBTableView1NOMBRE: TcxGridDBColumn
            DataBinding.FieldName = 'NOMBRE'
          end
          object dbgCatalogoDBTableView1CUENTA: TcxGridDBColumn
            DataBinding.FieldName = 'CUENTA'
          end
          object dbgCatalogoDBTableView1FORMATO: TcxGridDBColumn
            DataBinding.FieldName = 'FORMATO'
          end
          object dbgCatalogoDBTableView1IDEMPLEADO: TcxGridDBColumn
            DataBinding.FieldName = 'IDEMPLEADO'
          end
        end
      end
    end
    inherited cxTabSheet2: TcxTabSheet
      ExplicitLeft = 3
      ExplicitTop = 3
      ExplicitWidth = 616
      ExplicitHeight = 416
      object cxLabel1: TcxLabel
        Left = 14
        Top = 41
        Caption = 'Codigo'
      end
      object cxDBTextEdit1: TcxDBTextEdit
        Left = 14
        Top = 56
        DataBinding.DataField = 'CODIGO'
        DataBinding.DataSource = dsCatalogo
        TabOrder = 1
        Width = 121
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 616
        Height = 30
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Caption = ' Informacion de la cuenta de Banco'
        Color = clBtnShadow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 2
      end
      object cxLabel3: TcxLabel
        Left = 14
        Top = 81
        Caption = 'Nombre'
      end
      object cxDBTextEdit3: TcxDBTextEdit
        Left = 14
        Top = 96
        DataBinding.DataField = 'NOMBRE'
        DataBinding.DataSource = dsCatalogo
        TabOrder = 4
        Width = 347
      end
      object cxLabel2: TcxLabel
        Left = 14
        Top = 123
        Caption = 'Nombre del Usuario'
      end
      object cxLabel4: TcxLabel
        Left = 14
        Top = 169
        Caption = 'Numero de Cuenta'
      end
      object cxDBTextEdit2: TcxDBTextEdit
        Left = 14
        Top = 184
        DataBinding.DataField = 'CUENTA'
        DataBinding.DataSource = dsCatalogo
        TabOrder = 7
        Width = 347
      end
      object cxDBLookupComboBox1: TcxDBLookupComboBox
        Left = 14
        Top = 138
        DataBinding.DataField = 'IDEMPLEADO'
        DataBinding.DataSource = dsCatalogo
        Properties.KeyFieldNames = 'IDEMPLEADO'
        Properties.ListColumns = <
          item
            FieldName = 'NOMBRE'
          end
          item
            FieldName = 'IDEMPLEADO'
          end>
        Properties.ListSource = dsEmpleado
        TabOrder = 8
        Width = 347
      end
      object btnCodigo: TcxButton
        Left = 154
        Top = 54
        Width = 75
        Height = 25
        Caption = 'Codigo'
        TabOrder = 10
        TabStop = False
        OnClick = btnCodigoClick
        Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          08000000000000010000120B0000120B0000000100000000000000000000FFFF
          FF00FF00FF00CCA3A3009F8F8F0096898900978B8B00968A8A008C8787008F8C
          8C00817E7E007F7E7E00E3E2E200DDDCDC00D8D7D700D7A5A300D1A1A000D8A4
          A100D3A3A000E2DAD900E2D9D700DDDAD900E6DDD900B6B7B7009E9F9F009D9E
          9E00999A9A0074EAFF0040DDFF0063E5FF0079EAFF0084EBFF0097E6F70038D9
          FF004AD8FC0041A5BD005EE1FF0056C6E10062DCFA007DE7FF0078B7C600A1EA
          FB009CD8E6000DCCFF000FCBFF000FC5FA0015CFFF0017B7E50023D0FF002FCB
          F6002DAACC003FD1F80044C7ED00369EBA0067D5F4006BD0EA0000C5FF0001C1
          FE0002C4FF0003C2FE0003BAF20009C6FE000EB7EB0023B8E60028BCE90037AF
          D40041B0D30052CBF3004DBBDE004CB4D40077C0D80005A0D8000999CE001399
          CA00138FBD001895C1001E9DC90021A5D1002B96BD002F9CC50039ACD70035A1
          C90040C1F00045A7CB005AB6D50070BCD7000487BC00078ABC000982B2000F82
          B000108ABA00188CBA001C9DCE001880AB001D8FBA001F90BB002EB5EA002692
          BC00288EB60035B2E3002F8FB400066A99000A6D9A000B72A0000D75A5000D72
          A1001190CB000F79AA001598D5001597D3001073A0001698D400117AA7001CA0
          DA00188EC00020AAE50028A9E0002683AB00015E8E000576AC00056695000668
          97000878AF00086FA0000973A500108BC6000F86BF00AAAAAA009E9E9E008989
          8900000000000000000000000000000000000000000000000000000000000000
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
          025A4B790202020202020202025B4A6558494C67664E610202020202025E4D48
          573E315F424562020202026E5D5137413F2C3034542A4669020202534F50271B
          1C2E2B21241D405C7202027A6A63361E2523352F3A393B3C470202686F744328
          0B0B0B0B32383D2D5602026B6C71520B131806110B331F297502027C7E6D600B
          141906100B26205564020202787D730B141906120B22447602020202027B770B
          1619060F0B597002020202020202020B151A07030B020202020202020202020B
          80810A050B020202020202020202020B0E1709040B020202020202020202020B
          0D0C7F080B02020202020202020202020B0B0B0B020202020202}
        LookAndFeel.Kind = lfOffice11
      end
      object twCodigo: TTBXToolWindow
        Left = 130
        Top = 155
        Width = 396
        Height = 204
        Caption = 'twCodigo'
        ClientAreaHeight = 204
        ClientAreaWidth = 396
        Resizable = False
        TabOrder = 9
        Visible = False
        object admCodigo: TAdvMemo
          Left = 0
          Top = 0
          Width = 396
          Height = 157
          Cursor = crIBeam
          ActiveLineSettings.ShowActiveLine = False
          ActiveLineSettings.ShowActiveLineIndicator = False
          Align = alTop
          AutoCompletion.Font.Charset = DEFAULT_CHARSET
          AutoCompletion.Font.Color = clWindowText
          AutoCompletion.Font.Height = -11
          AutoCompletion.Font.Name = 'Tahoma'
          AutoCompletion.Font.Style = []
          AutoCorrect.Active = True
          AutoHintParameterPosition = hpBelowCode
          BorderStyle = bsSingle
          CodeFolding.Enabled = False
          CodeFolding.LineColor = clGray
          Ctl3D = False
          DelErase = True
          EnhancedHomeKey = False
          Gutter.DigitCount = 4
          Gutter.Font.Charset = DEFAULT_CHARSET
          Gutter.Font.Color = clWindowText
          Gutter.Font.Height = -13
          Gutter.Font.Name = 'Courier New'
          Gutter.Font.Style = []
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'COURIER NEW'
          Font.Style = []
          HiddenCaret = False
          Lines.Strings = (
            '')
          MarkerList.UseDefaultMarkerImageIndex = False
          MarkerList.DefaultMarkerImageIndex = -1
          MarkerList.ImageTransparentColor = 33554432
          PrintOptions.MarginLeft = 0
          PrintOptions.MarginRight = 0
          PrintOptions.MarginTop = 0
          PrintOptions.MarginBottom = 0
          PrintOptions.PageNr = False
          PrintOptions.PrintLineNumbers = False
          RightMarginColor = 14869218
          ScrollHint = False
          SelColor = clWhite
          SelBkColor = clNavy
          ShowRightMargin = True
          SmartTabs = False
          SyntaxStyles = AdvPascalMemoStyler1
          TabOrder = 0
          TabSize = 4
          TabStop = True
          TrimTrailingSpaces = False
          UndoLimit = 100
          UrlStyle.TextColor = clBlue
          UrlStyle.BkColor = clWhite
          UrlStyle.Style = [fsUnderline]
          UseStyler = True
          Version = '2.1.8.3'
          WordWrap = wwNone
        end
        object Button1: TButton
          Left = 159
          Top = 163
          Width = 75
          Height = 25
          Caption = 'Aceptar'
          TabOrder = 1
          TabStop = False
          OnClick = Button1Click
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 30
        Width = 616
        Height = 2
        Align = alTop
        BevelOuter = bvNone
        Color = clNone
        ParentBackground = False
        TabOrder = 11
      end
    end
  end
  inherited cdsCatalogo: TDAMemDataTable
    Fields = <
      item
        Name = 'IDBANCO'
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
        Size = 50
      end
      item
        Name = 'CUENTA'
        DataType = datString
        Size = 25
      end
      item
        Name = 'FORMATO'
        DataType = datMemo
      end
      item
        Name = 'IDEMPLEADO'
        DataType = datInteger
      end>
    RemoteDataAdapter = DM.RemoteDataAdapter
    OnNewRecord = cdsCatalogoNewRecord
    LogicalName = 'dbo BANCO'
  end
  inherited dsCatalogo: TDADataSource
    DataSet = cdsCatalogo.Dataset
  end
  inherited tblCatalogo: TdxMemData
    Left = 536
  end
  object AdvPascalMemoStyler1: TAdvPascalMemoStyler
    BlockStart = 'begin,try,case,class,record'
    BlockEnd = 'end'
    LineComment = '//'
    MultiCommentLeft = '{'
    MultiCommentRight = '}'
    CommentStyle.TextColor = clNavy
    CommentStyle.BkColor = clWhite
    CommentStyle.Style = [fsItalic]
    NumberStyle.TextColor = clFuchsia
    NumberStyle.BkColor = clWhite
    NumberStyle.Style = [fsBold]
    AllStyles = <
      item
        KeyWords.Strings = (
          'begin'
          'break'
          'case'
          'cdecl'
          'class'
          'class'
          'const'
          'constructor'
          'continue'
          'default'
          'destructor'
          'do'
          'else'
          'end'
          'except'
          'finalise'
          'finally'
          'for'
          'function'
          'if'
          'implementation'
          'inherited'
          'initialise'
          'interface'
          'nil'
          'not'
          'override'
          'pascal'
          'private'
          'procedure'
          'program'
          'program'
          'property'
          'protected'
          'public'
          'published'
          'raise'
          'repeat'
          'stdcall'
          'stored'
          'string'
          'then'
          'to'
          'try'
          'type'
          'unit'
          'until'
          'uses'
          'var'
          'virtual'
          'while'
          'with')
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        BGColor = clWhite
        StyleType = stKeyword
        BracketStart = #0
        BracketEnd = #0
        Info = 'Pascal Standard Default'
      end
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        BGColor = clWhite
        StyleType = stBracket
        BracketStart = #39
        BracketEnd = #39
        Info = 'Simple Quote'
      end
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        BGColor = clWhite
        StyleType = stBracket
        BracketStart = '"'
        BracketEnd = '"'
        Info = 'Double Quote'
      end
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        BGColor = clWhite
        StyleType = stSymbol
        BracketStart = #0
        BracketEnd = #0
        Symbols = ' ,;:.(){}[]=-*/^%<>#'#13#10
        Info = 'Symbols Delimiters'
      end>
    AutoCompletion.Strings = (
      'ShowMessage'
      'MessageDlg')
    HintParameter.TextColor = clBlack
    HintParameter.BkColor = clInfoBk
    HintParameter.HintCharStart = '('
    HintParameter.HintCharEnd = ')'
    HintParameter.HintCharDelimiter = ';'
    HintParameter.HintCharWriteDelimiter = ','
    HintParameter.Parameters.Strings = (
      'ShowMessage(const Msg: string);'
      
        'MessageDlg(const Msg: string; DlgType: TMsgDlgType; Buttons: TMs' +
        'gDlgButtons; HelpCtx: Longint): Integer);')
    HexIdentifier = '$'
    Description = 'Pascal'
    Filter = 'Pascal Files (*.pas,*.dpr,*.dpk,*.inc)|*.pas;*.dpr;*.dpk;*.inc'
    DefaultExtension = '.pas'
    StylerName = 'Pascal'
    Extensions = 'pas;dpr;dpk;inc'
    RegionDefinitions = <
      item
        Identifier = 'procedure'
        RegionStart = 'begin'
        RegionEnd = 'end'
        RegionType = rtClosed
        ShowComments = False
      end
      item
        Identifier = 'interface'
        RegionStart = 'interface'
        RegionType = rtOpen
        ShowComments = False
      end
      item
        Identifier = 'unit'
        RegionStart = 'unit'
        RegionType = rtFile
        ShowComments = False
      end
      item
        Identifier = 'implementation'
        RegionStart = 'implementation'
        RegionType = rtOpen
        ShowComments = False
      end
      item
        Identifier = 'case'
        RegionStart = 'case'
        RegionEnd = 'end'
        RegionType = rtIgnore
        ShowComments = False
      end
      item
        Identifier = 'try'
        RegionStart = 'try'
        RegionEnd = 'end'
        RegionType = rtIgnore
        ShowComments = False
      end
      item
        Identifier = 'function'
        RegionStart = 'begin'
        RegionEnd = 'end'
        RegionType = rtClosed
        ShowComments = False
      end
      item
        Identifier = '{$region'
        RegionStart = '{$region'
        RegionEnd = '{$endregion'
        RegionType = rtClosed
        ShowComments = False
      end>
    Left = 536
    Top = 224
  end
  object cdsEmpleado: TDAMemDataTable
    RemoteUpdatesOptions = []
    Fields = <
      item
        Name = 'IDEMPLEADO'
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
        Size = 70
      end
      item
        Name = 'USERNAME'
        DataType = datString
        Size = 10
        Required = True
      end
      item
        Name = 'USERPASSWORD'
        DataType = datString
        Size = 10
        Required = True
      end>
    Params = <>
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = DM.RemoteDataAdapter
    LogicalName = 'dbo USUARIO'
    IndexDefs = <>
    Left = 496
    Top = 264
  end
  object dsEmpleado: TDADataSource
    DataSet = cdsEmpleado.Dataset
    OnStateChange = dsCatalogoStateChange
    DataTable = cdsEmpleado
    Left = 536
    Top = 264
  end
end
