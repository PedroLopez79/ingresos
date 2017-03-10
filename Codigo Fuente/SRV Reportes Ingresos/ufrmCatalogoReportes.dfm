inherited frmCatalogoReportes: TfrmCatalogoReportes
  Caption = ''
  ClientHeight = 465
  ClientWidth = 701
  OnClose = nil
  ExplicitWidth = 701
  ExplicitHeight = 465
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcCatalogo: TcxPageControl
    Width = 701
    Height = 465
    Properties.ActivePage = cxTabSheet2
    OnPageChanging = pgcCatalogoPageChanging
    ExplicitWidth = 701
    ExplicitHeight = 465
    ClientRectBottom = 435
    ClientRectRight = 695
    inherited cxTabSheet1: TcxTabSheet
      ExplicitLeft = 3
      ExplicitTop = 3
      ExplicitWidth = 692
      ExplicitHeight = 432
      inherited dbgCatalogo: TcxGrid
        Width = 692
        Height = 432
        ExplicitWidth = 692
        ExplicitHeight = 432
        inherited dbgCatalogoDBTableView1: TcxGridDBTableView
          object dbgCatalogoDBTableView1Column1: TcxGridDBColumn
            DataBinding.FieldName = 'ReporteID'
          end
          object dbgCatalogoDBTableView1Column2: TcxGridDBColumn
            DataBinding.FieldName = 'Nombre'
          end
          object dbgCatalogoDBTableView1Column3: TcxGridDBColumn
            DataBinding.FieldName = 'CampoJoin'
          end
        end
      end
    end
    inherited cxTabSheet2: TcxTabSheet
      Caption = 'Reporte'
      ImageIndex = 48
      ExplicitLeft = 3
      ExplicitTop = 3
      ExplicitWidth = 692
      ExplicitHeight = 432
      object cxGroupBox1: TcxGroupBox
        Left = 16
        Top = 16
        Hint = ''
        Caption = '  Datos del reporte  '
        TabOrder = 0
        Height = 348
        Width = 321
        object Label1: TLabel
          Left = 16
          Top = 29
          Width = 11
          Height = 13
          Caption = 'ID'
          Transparent = True
        end
        object Label2: TLabel
          Left = 16
          Top = 77
          Width = 37
          Height = 13
          Caption = 'Nombre'
          Transparent = True
        end
        object Label3: TLabel
          Left = 16
          Top = 123
          Width = 21
          Height = 13
          Caption = 'Tipo'
          Transparent = True
        end
        object Label4: TLabel
          Left = 16
          Top = 216
          Width = 53
          Height = 13
          Caption = 'Par'#225'metros'
          Transparent = True
        end
        object Label5: TLabel
          Left = 16
          Top = 166
          Width = 55
          Height = 13
          Caption = 'Campo Join'
          Transparent = True
        end
        object cxDBTextEdit1: TcxDBTextEdit
          Left = 16
          Top = 48
          Hint = ''
          DataBinding.DataField = 'ReporteID'
          DataBinding.DataSource = dsCatalogo
          Properties.CharCase = ecUpperCase
          Properties.ReadOnly = True
          Style.BorderStyle = ebsOffice11
          Style.LookAndFeel.Kind = lfOffice11
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.Kind = lfOffice11
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.Kind = lfOffice11
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.Kind = lfOffice11
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 0
          Width = 89
        end
        object cxDBTextEdit2: TcxDBTextEdit
          Left = 16
          Top = 96
          Hint = ''
          DataBinding.DataField = 'Nombre'
          DataBinding.DataSource = dsCatalogo
          Properties.CharCase = ecUpperCase
          Style.BorderStyle = ebsOffice11
          Style.LookAndFeel.Kind = lfOffice11
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.Kind = lfOffice11
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.Kind = lfOffice11
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.Kind = lfOffice11
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 1
          Width = 289
        end
        object clbParametros: TcxCheckListBox
          Left = 16
          Top = 235
          Width = 289
          Height = 105
          Hint = ''
          Items = <
            item
              Tag = 66
              Text = 'Rango de Fechas'
            end
            item
              Tag = 67
              Text = 'Rango de Hora'
            end
            item
              Tag = 68
              Text = 'Alumno'
            end
            item
              Tag = 69
              Text = 'Alumnos'
            end
            item
              Tag = 70
              Text = 'Turno'
            end
            item
              Tag = 71
              Text = 'Maestros'
            end
            item
              Tag = 72
              Text = 'Ciclo'
            end
            item
              Tag = 73
              Text = 'Grupo'
            end
            item
              Tag = 74
              Text = 'Nivel'
            end
            item
              Tag = 75
              Text = 'TipoPago'
            end
            item
              Tag = 76
              Text = 'TipoCalificacion'
            end
            item
              Tag = 77
              Text = 'Familia'
            end
            item
              Tag = 78
              Text = 'Status'
            end
            item
              Tag = 79
              Text = 'Serie'
            end>
          Style.LookAndFeel.Kind = lfOffice11
          StyleDisabled.LookAndFeel.Kind = lfOffice11
          StyleFocused.LookAndFeel.Kind = lfOffice11
          StyleHot.LookAndFeel.Kind = lfOffice11
          TabOrder = 2
          OnClick = clbParametrosClick
        end
        object cxImageComboBox1: TcxDBImageComboBox
          Left = 16
          Top = 140
          Hint = ''
          DataBinding.DataField = 'Tipo'
          DataBinding.DataSource = dsCatalogo
          Properties.Items = <
            item
              Description = 'INVENTARIOS'
              ImageIndex = 0
              Value = 1
            end
            item
              Description = 'INGRESOS'
              Value = 2
            end
            item
              Description = 'GENERALES'
              Value = 3
            end
            item
              Description = 'ESPECIFICOS'
              Value = 4
            end
            item
              Description = 'EXPORTAR'
              Value = 5
            end
            item
              Description = 'SISTEMA'
              Value = 6
            end>
          Properties.MultiLineText = True
          Style.LookAndFeel.Kind = lfOffice11
          StyleDisabled.LookAndFeel.Kind = lfOffice11
          StyleFocused.LookAndFeel.Kind = lfOffice11
          StyleHot.LookAndFeel.Kind = lfOffice11
          TabOrder = 3
          Width = 289
        end
        object cxDBTextEdit3: TcxDBTextEdit
          Left = 16
          Top = 183
          Hint = ''
          DataBinding.DataField = 'CampoJoin'
          DataBinding.DataSource = dsCatalogo
          Properties.CharCase = ecUpperCase
          Style.BorderStyle = ebsOffice11
          Style.LookAndFeel.Kind = lfOffice11
          Style.LookAndFeel.NativeStyle = True
          StyleDisabled.LookAndFeel.Kind = lfOffice11
          StyleDisabled.LookAndFeel.NativeStyle = True
          StyleFocused.LookAndFeel.Kind = lfOffice11
          StyleFocused.LookAndFeel.NativeStyle = True
          StyleHot.LookAndFeel.Kind = lfOffice11
          StyleHot.LookAndFeel.NativeStyle = True
          TabOrder = 4
          Width = 139
        end
      end
      object btnDuplicar: TcxButton
        Left = 16
        Top = 370
        Width = 75
        Height = 25
        Caption = 'Duplicar'
        Colors.Default = clWhite
        Colors.Normal = clWhite
        Colors.Hot = clWhite
        Colors.Pressed = clWhite
        Colors.Disabled = clWhite
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.NativeStyle = False
        OptionsImage.Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FF8E5D598E5D598E5D598E5D598E5D598E5D598E5D598E5D
          598E5D59734241FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF92625AFEDDBCFF
          D9B4FFD5ACFFD1A5FFCE9DFECA97FFC790FFC48B734241FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FF98665DFFE3C7DD903DDD903DDD903DDD903DDD903DDD90
          3DFFC792734241FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA06C5FFEE9D3FF
          E5CAFFE1C1FFDCBAFED8B1FED3A9FFD0A1FFCC9A734241FF00FF8E5D598E5D59
          8E5D598E5D598E5D59A77463FEEEDDDD903DDD903DDD903DDD903DDD903DDD90
          3DFED1A4734241FF00FF92625AFEDDBCFFD9B4FFD5ACFFD1A5B17D67FEF3E6FE
          EFDEFEEAD8FFE7CFFEE2C7FEDEBDFFD9B6FED5AD734241FF00FF98665DFFE3C7
          DD903DDD903DDD903DBB8369FFF7EFDD903DDD903DDD903DDD903DDD903DDD90
          3DFEDAB8734241FF00FFA06C5FFEE9D3FFE5CAFFE1C1FFDCBAC48B6CFEFAF7FE
          F7F0FEF4EAFEF2E3FEEDDCFEE9D4FEE5CBFEE1C2734241FF00FFA77463FEEEDD
          DD903DDD903DDD903DCC9370FEFEFCFEFBF8FEF8F3FEF6EDFEF2E6E5D5D0C6B1
          AFA79395734241FF00FFB17D67FEF3E6FEEFDEFEEAD8FFE7CFD59C74FEFEFEFE
          FEFEFEFBFAFEFAF4FEF6EEA0675BA0675BA0675B9D6559FF00FFBB8369FFF7EF
          DD903DDD903DDD903DDCA175FEFEFEFEFEFEFEFEFEFEFCFBFEFAF6A0675BE5A1
          54DC832AFF00FFFF00FFC48B6CFEFAF7FEF7F0FEF4EAFEF2E3E1A577D1926DD1
          926DD1926DD1926DD1926DA0675BEB9E43FF00FFFF00FFFF00FFCC9370FEFEFC
          FEFBF8FEF8F3FEF6EDFEF2E6E5D5D0C6B1AFA79395734241FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFD59C74FEFEFEFEFEFEFEFBFAFEFAF4FEF6EEA0675BA0
          675BA0675B9D6559FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDCA175FEFEFE
          FEFEFEFEFEFEFEFCFBFEFAF6A0675BE5A154DC832AFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFE1A577D1926DD1926DD1926DD1926DD1926DA0675BEB
          9E43FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        TabOrder = 1
        OnClick = btnDuplicarClick
      end
      object btnExportar: TcxButton
        Left = 96
        Top = 370
        Width = 75
        Height = 25
        Caption = 'Exportar'
        Colors.Default = clWhite
        Colors.Normal = clWhite
        Colors.Hot = clWhite
        Colors.Pressed = clWhite
        Colors.Disabled = clWhite
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.NativeStyle = False
        OptionsImage.Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          08000000000000010000120B0000120B0000000100000000000000000000FFFF
          FF00FF00FF00A4676900A6696B00A6696A007B16000079140000A7756B007D18
          00007F1A0000AC6C5A00A46A5A00FBF4F200821F0000811E0000811F00008929
          07008A2A080099411E00BC826800C9937900E7D0C400FEFCFB00AB5B3000BB76
          5000BF7D5900D1926D00C67F4E00DA9D7500D1864900E7AB7900D8A57B00D8A3
          7300E6BD9900F6E9DD00D1965A00D59D6600FEFBF800DCA16200E9C49D00D4BC
          A000F7EEE300EAB66C00EBBB7600EDC18000EFC68A00F0CC9600F0CB9700F3D3
          A400F6DDBA00F8E7CE00F8E7CF00FAEEDC00EEC48400F3D7AB00F6E1C000FBF2
          E200FCF7EE00FEFAF300FCDD9F00FAEDD400FBF4E700FFEAB5002D6718002A70
          270001550300005D0300017707000266060002600500036E0700036C07000363
          070004780A0003600700015A0600058C0D0005840C0005700B00099613000875
          11000C881600067F140015A52800149A26001A922F0022B63E001C96310027BB
          45002CC5580030BD570041E07500FCFFFF000F30F8000F30F7007486E700001E
          FF000F2EF3000F2FF300727FD700707BCE006E75BF0000000000000000000000
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
          020202040404040404040202020202020202020431302E2D2C04020202020202
          0202020832656266360402020202020202020214335F61632F04020202020202
          0202021B39605E6437040202020202020202021D3B3E35343804020202020202
          0202021F01263A05050B0303030303030303021F010117051C02032820212524
          2B03021F1B1B410502020319090E100F27030202024C5A5802020823120A0618
          3C030202435B5C5751021401150711223F0302405356595552491B010D131A3D
          290302020242544F02021D0101162A03030C0202024B504802021F0101015D03
          1E020202474A4D4602021F1B1B1B1B0302024545444E45020202}
        TabOrder = 2
        OnClick = btnExportarClick
      end
      object btnImportar: TcxButton
        Left = 176
        Top = 370
        Width = 75
        Height = 25
        Caption = 'Importar'
        Colors.Default = clWhite
        Colors.Normal = clWhite
        Colors.Hot = clWhite
        Colors.Pressed = clWhite
        Colors.Disabled = clWhite
        LookAndFeel.Kind = lfOffice11
        LookAndFeel.NativeStyle = False
        OptionsImage.Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          08000000000000010000120B0000120B0000000100000000000000000000FFFF
          FF00FF00FF00A4676900A6696B00A6696A007B16000079140000A7756B007D18
          00007F1A0000AC6C5A00A46A5A00FBF4F200821F0000811E0000811F00008929
          07008A2A080099411E00BC826800C9937900E7D0C400FEFCFB00AB5B3000BB76
          5000BF7D5900D1926D00C67F4E00DA9D7500D1864900E7AB7900D8A57B00D8A3
          7300E6BD9900F6E9DD00D1965A00D59D6600FEFBF800DCA16200E9C49D00D4BC
          A000F7EEE300EAB66C00EBBB7600EDC18000EFC68A00F0CC9600F0CB9700F3D3
          A400F6DDBA00F8E7CE00F8E7CF00FAEEDC00EEC48400F3D7AB00F6E1C000FBF2
          E200FCF7EE00FEFAF300FCDD9F00FAEDD400FBF4E700FFEAB5002D6718002A70
          2700005901000155030003650600005D03000177070001640500015804000266
          060002600500036C07000363070004780A0003600700015A0600058C0D000584
          0C0005700B0009961300087511000C881600067F140015A52800149A26001A92
          2F0022B63E001C96310027BB45002CC5580030BD570041E07500FCFFFF000F30
          F8000F30F7007486E700001EFF000F2EF3000F2FF300727FD700707BCE006E75
          BF00000000000000000000000000000000000000000000000000000000000000
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
          020202040404040404040202020202020202020431302E2D2C04020202020202
          0202020832686569360402020202020202020214336264662F04020202020202
          0202021B3963616737040202020202020202021D3B3E35343804020202020202
          0202021F01263A05050B0303030303030303021F010117051C02032820212524
          2B03021F1B1B1B0502420319090E100F270302024002020202470823120A0618
          3C0302455602020246441401150711223F034F5E59434E4D51481B010D131A3D
          29415D5F5C57535049021D0101162A03030C5B5A58524B4A02021F0101016003
          1E0202545502020202021F1B1B1B1B03020202024C0202020202}
        TabOrder = 3
        OnClick = btnImportarClick
      end
      object cxGrid1: TcxGrid
        Left = 343
        Top = 16
        Width = 338
        Height = 348
        Hint = ''
        TabOrder = 4
        object cxGrid1DBTableView1: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          OnEditing = cxGrid1DBTableView1Editing
          OnEditChanged = cxGrid1DBTableView1EditChanged
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
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          object cxGrid1DBTableView1RecId: TcxGridDBColumn
            DataBinding.FieldName = 'RecId'
            Visible = False
          end
          object cxGrid1DBTableView1Usuario: TcxGridDBColumn
            DataBinding.FieldName = 'Usuario'
            Width = 63
          end
          object cxGrid1DBTableView1UsuarioID: TcxGridDBColumn
            DataBinding.FieldName = 'UsuarioID'
            Width = 74
          end
          object cxGrid1DBTableView1Nombre: TcxGridDBColumn
            DataBinding.FieldName = 'Nombre'
            Width = 147
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = cxGrid1DBTableView1
        end
      end
    end
    object cxTabSheet3: TcxTabSheet
      Caption = 'SQL Maestro'
      ImageIndex = 34
      object DBAdvMemo1: TDBAdvMemo
        Left = 0
        Top = 0
        Width = 692
        Height = 432
        Cursor = crIBeam
        ActiveLineSettings.ShowActiveLine = False
        ActiveLineSettings.ShowActiveLineIndicator = False
        Align = alClient
        AutoCompletion.Font.Charset = DEFAULT_CHARSET
        AutoCompletion.Font.Color = clWindowText
        AutoCompletion.Font.Height = -11
        AutoCompletion.Font.Name = 'Tahoma'
        AutoCompletion.Font.Style = []
        AutoCompletion.StartToken = '(.'
        AutoCorrect.Active = True
        AutoHintParameterPosition = hpBelowCode
        BookmarkGlyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          0800000000000001000000000000000000000001000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
          A6000020400000206000002080000020A0000020C0000020E000004000000040
          20000040400000406000004080000040A0000040C0000040E000006000000060
          20000060400000606000006080000060A0000060C0000060E000008000000080
          20000080400000806000008080000080A0000080C0000080E00000A0000000A0
          200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
          200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
          200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
          20004000400040006000400080004000A0004000C0004000E000402000004020
          20004020400040206000402080004020A0004020C0004020E000404000004040
          20004040400040406000404080004040A0004040C0004040E000406000004060
          20004060400040606000406080004060A0004060C0004060E000408000004080
          20004080400040806000408080004080A0004080C0004080E00040A0000040A0
          200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
          200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
          200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
          20008000400080006000800080008000A0008000C0008000E000802000008020
          20008020400080206000802080008020A0008020C0008020E000804000008040
          20008040400080406000804080008040A0008040C0008040E000806000008060
          20008060400080606000806080008060A0008060C0008060E000808000008080
          20008080400080806000808080008080A0008080C0008080E00080A0000080A0
          200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
          200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
          200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
          2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
          2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
          2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
          2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
          2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
          2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
          2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFD25252525
          2525252525252525FDFDFD2E25FFFFFFFFFFFFFFFFFFFF25FDFDFD2525252525
          2525252525252525FDFD9A9AB7B7B7B7B7B7B7B7B7B72525FDFDFD25B7B7B7B7
          B7B7B7B7B7B72525FDFD9A9AB7B7B7B7B7B7B7B7B7B72525FDFDFD25BFB7BFBF
          B7B7B7B7B7B72525FDFD9A9ABFBFBFB7BFBFB7B7B7B72525FDFDFD25BFBFBFBF
          BFB7BFBFB7B72525FDFD9A9ABFBFBFB7BFBFBFB7BFB72525FDFDFD25BFBFBFBF
          BFBFBFBFBFB72525FDFD9A9ABFBFBFBFBFB7BFBFB7B72525FDFDFD25BFBFBFBF
          BFBFBFBFBFB72525FDFD9A9ABFBFBFBFBFBFBFBFBFB725FDFDFDFD2525252525
          25252525252525FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD}
        BorderStyle = bsSingle
        ClipboardFormats = [cfText]
        CodeFolding.Enabled = False
        CodeFolding.LineColor = clGray
        Ctl3D = False
        DelErase = True
        EnhancedHomeKey = False
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
        OleDropTarget = []
        PrintOptions.MarginLeft = 0
        PrintOptions.MarginRight = 0
        PrintOptions.MarginTop = 0
        PrintOptions.MarginBottom = 0
        PrintOptions.PageNr = False
        PrintOptions.PrintLineNumbers = False
        ReadOnly = False
        RightMarginColor = 14869218
        ScrollHint = False
        SelColor = clWhite
        SelBkColor = clNavy
        ShowRightMargin = True
        SmartTabs = False
        SyntaxStyles = AdvSQLMemoStyler1
        TabOrder = 0
        TabStop = True
        TrimTrailingSpaces = False
        UILanguage.ScrollHint = 'Row'
        UILanguage.Undo = 'Undo'
        UILanguage.Redo = 'Redo'
        UILanguage.Copy = 'Copy'
        UILanguage.Cut = 'Cut'
        UILanguage.Paste = 'Paste'
        UILanguage.Delete = 'Delete'
        UILanguage.SelectAll = 'Select All'
        UrlStyle.TextColor = clBlue
        UrlStyle.BkColor = clWhite
        UrlStyle.Style = [fsUnderline]
        UseStyler = True
        Version = '3.1.6.3'
        WordWrap = wwNone
        OnEnter = DBAdvMemo1Enter
        OnExit = DBAdvMemo1Exit
        DataField = 'SQL1'
        DataSource = dsCatalogo
      end
    end
    object cxTabSheet4: TcxTabSheet
      Caption = 'SQL Detalle'
      ImageIndex = 34
      object DBAdvMemo2: TDBAdvMemo
        Left = 0
        Top = 0
        Width = 692
        Height = 432
        Cursor = crIBeam
        ActiveLineSettings.ShowActiveLine = False
        ActiveLineSettings.ShowActiveLineIndicator = False
        Align = alClient
        AutoCompletion.Font.Charset = DEFAULT_CHARSET
        AutoCompletion.Font.Color = clWindowText
        AutoCompletion.Font.Height = -11
        AutoCompletion.Font.Name = 'Tahoma'
        AutoCompletion.Font.Style = []
        AutoCompletion.StartToken = '(.'
        AutoCorrect.Active = True
        AutoHintParameterPosition = hpBelowCode
        BookmarkGlyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          0800000000000001000000000000000000000001000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
          A6000020400000206000002080000020A0000020C0000020E000004000000040
          20000040400000406000004080000040A0000040C0000040E000006000000060
          20000060400000606000006080000060A0000060C0000060E000008000000080
          20000080400000806000008080000080A0000080C0000080E00000A0000000A0
          200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
          200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
          200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
          20004000400040006000400080004000A0004000C0004000E000402000004020
          20004020400040206000402080004020A0004020C0004020E000404000004040
          20004040400040406000404080004040A0004040C0004040E000406000004060
          20004060400040606000406080004060A0004060C0004060E000408000004080
          20004080400040806000408080004080A0004080C0004080E00040A0000040A0
          200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
          200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
          200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
          20008000400080006000800080008000A0008000C0008000E000802000008020
          20008020400080206000802080008020A0008020C0008020E000804000008040
          20008040400080406000804080008040A0008040C0008040E000806000008060
          20008060400080606000806080008060A0008060C0008060E000808000008080
          20008080400080806000808080008080A0008080C0008080E00080A0000080A0
          200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
          200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
          200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
          2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
          2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
          2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
          2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
          2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
          2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
          2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFD25252525
          2525252525252525FDFDFD2E25FFFFFFFFFFFFFFFFFFFF25FDFDFD2525252525
          2525252525252525FDFD9A9AB7B7B7B7B7B7B7B7B7B72525FDFDFD25B7B7B7B7
          B7B7B7B7B7B72525FDFD9A9AB7B7B7B7B7B7B7B7B7B72525FDFDFD25BFB7BFBF
          B7B7B7B7B7B72525FDFD9A9ABFBFBFB7BFBFB7B7B7B72525FDFDFD25BFBFBFBF
          BFB7BFBFB7B72525FDFD9A9ABFBFBFB7BFBFBFB7BFB72525FDFDFD25BFBFBFBF
          BFBFBFBFBFB72525FDFD9A9ABFBFBFBFBFB7BFBFB7B72525FDFDFD25BFBFBFBF
          BFBFBFBFBFB72525FDFD9A9ABFBFBFBFBFBFBFBFBFB725FDFDFDFD2525252525
          25252525252525FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD}
        BorderStyle = bsSingle
        ClipboardFormats = [cfText]
        CodeFolding.Enabled = False
        CodeFolding.LineColor = clGray
        Ctl3D = False
        DelErase = True
        EnhancedHomeKey = False
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
        OleDropTarget = []
        PrintOptions.MarginLeft = 0
        PrintOptions.MarginRight = 0
        PrintOptions.MarginTop = 0
        PrintOptions.MarginBottom = 0
        PrintOptions.PageNr = False
        PrintOptions.PrintLineNumbers = False
        ReadOnly = False
        RightMarginColor = 14869218
        ScrollHint = False
        SelColor = clWhite
        SelBkColor = clNavy
        ShowRightMargin = True
        SmartTabs = False
        SyntaxStyles = AdvSQLMemoStyler1
        TabOrder = 0
        TabStop = True
        TrimTrailingSpaces = False
        UILanguage.ScrollHint = 'Row'
        UILanguage.Undo = 'Undo'
        UILanguage.Redo = 'Redo'
        UILanguage.Copy = 'Copy'
        UILanguage.Cut = 'Cut'
        UILanguage.Paste = 'Paste'
        UILanguage.Delete = 'Delete'
        UILanguage.SelectAll = 'Select All'
        UrlStyle.TextColor = clBlue
        UrlStyle.BkColor = clWhite
        UrlStyle.Style = [fsUnderline]
        UseStyler = True
        Version = '3.1.6.3'
        WordWrap = wwNone
        OnEnter = DBAdvMemo1Enter
        OnExit = DBAdvMemo1Exit
        DataField = 'SQL2'
        DataSource = dsCatalogo
      end
    end
    object cxTabSheet5: TcxTabSheet
      Caption = 'Calidad Alta'
      ImageIndex = 46
    end
    object cxTabSheet6: TcxTabSheet
      Caption = 'Calidad Media'
      ImageIndex = 17
    end
    object cxTabSheet7: TcxTabSheet
      Caption = 'Calidad Baja'
      ImageIndex = 38
    end
  end
  inherited cdsCatalogo: TDAMemDataTable
    Fields = <
      item
        Name = 'ReporteID'
        DataType = datInteger
        Required = True
        InPrimaryKey = True
      end
      item
        Name = 'Nombre'
        DataType = datString
        Size = 50
        Required = True
      end
      item
        Name = 'Tipo'
        DataType = datInteger
        Required = True
      end
      item
        Name = 'Parametros'
        DataType = datString
        Size = 10
        Required = True
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
      end
      item
        Name = 'Usuarios'
        DataType = datString
        Size = 80
      end>
    LogicalName = 'dbo Reporte'
    RemoteDataAdapter = DM.RemoteDataAdapter
    AfterScroll = cdsCatalogoAfterScroll
    BeforePost = cdsCatalogoBeforePost
    OnNewRecord = cdsCatalogoNewRecord
    Left = 456
    Top = 304
  end
  inherited dsCatalogo: TDADataSource
    DataSet = cdsCatalogo.Dataset
    Left = 456
    Top = 352
  end
  inherited tblCatalogo: TdxMemData
    Top = 304
  end
  object AdvSQLMemoStyler1: TAdvSQLMemoStyler
    AutoCompletion.Strings = (
      'SELECT'
      'WHERE')
    HintParameter.TextColor = clBlack
    HintParameter.BkColor = clInfoBk
    HintParameter.HintCharStart = '('
    HintParameter.HintCharEnd = ')'
    HintParameter.HintCharDelimiter = ';'
    HintParameter.HintClassDelimiter = '.'
    HintParameter.HintCharWriteDelimiter = ','
    LineComment = #39
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
          'and'
          'begin'
          'begin'
          'break'
          'by'
          'close'
          'continue'
          'create'
          'deallocate'
          'declare'
          'delete'
          'delete'
          'do'
          'else'
          'end'
          'end'
          'exec'
          'fetch'
          'for'
          'from'
          'group'
          'having'
          'if'
          'inner'
          'insert'
          'join'
          'left'
          'like'
          'not'
          'on'
          'open'
          'or'
          'order'
          'outer'
          'proc'
          'procedure'
          'repeat'
          'return'
          'right'
          'rollback'
          'select'
          'set'
          'to'
          'trans'
          'transaction'
          'until'
          'update'
          'values'
          'where'
          'while'
          'while')
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        BGColor = clWhite
        StyleType = stKeyword
        BracketStart = #0
        BracketEnd = #0
        Info = 'SQL Standard Default'
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
        Font.Color = clTeal
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
    Description = 'SQL'
    Filter = 'SQL Files (*.sql)|*.sql'
    DefaultExtension = '.sql'
    StylerName = 'SQL'
    Extensions = 'sql'
    Left = 296
    Top = 272
  end
  object rdReportes: TppDesigner
    Caption = 'Editor de Reportes'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.DatabaseType = dtParadox
    DataSettings.GuidCollationType = gcString
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = DM.repReportes
    IniStorageType = 'IniFile'
    IniStorageName = '($LocalAppData)\RBuilder\RBuilder.ini'
    WindowHeight = 600
    WindowLeft = 0
    WindowTop = 0
    WindowWidth = 800
    WindowState = wsMaximized
    Left = 178
    Top = 268
  end
  object odImportar: TOpenDialog
    DefaultExt = '.rcg'
    Filter = 'Reportes CistemGas (*.rcg)|*.rcg'
    Left = 463
    Top = 226
  end
  object sdExportar: TSaveDialog
    DefaultExt = '.rct'
    Filter = 'Reportes CistemGas (*.rcg)|*.rcg'
    Left = 495
    Top = 226
  end
  object tblExportar: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 527
    Top = 226
    object tblExportarNombre: TStringField
      FieldName = 'Nombre'
      Size = 25
    end
    object tblExportarTipo: TIntegerField
      FieldName = 'Tipo'
    end
    object tblExportarParametros: TStringField
      FieldName = 'Parametros'
      Size = 10
    end
    object tblExportarTemplate: TMemoField
      FieldName = 'Template'
      BlobType = ftMemo
    end
    object tblExportarMedia: TBlobField
      FieldName = 'Media'
    end
    object tblExportarBaja: TMemoField
      FieldName = 'Baja'
      BlobType = ftMemo
    end
    object tblExportarSQL1: TMemoField
      FieldName = 'SQL1'
      BlobType = ftMemo
    end
    object tblExportarSQL2: TMemoField
      FieldName = 'SQL2'
      BlobType = ftMemo
    end
    object tblExportarCampoJoin: TStringField
      FieldName = 'CampoJoin'
      Size = 30
    end
  end
  object tblUsuarios: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 328
    Top = 376
    object tblUsuariosUsuario: TBooleanField
      FieldName = 'Usuario'
    end
    object tblUsuariosUsuarioID: TIntegerField
      FieldName = 'UsuarioID'
    end
    object tblUsuariosNombre: TStringField
      FieldName = 'Nombre'
    end
  end
  object DataSource1: TDataSource
    DataSet = tblUsuarios
    Left = 360
    Top = 376
  end
  object cdsUsuarios: TDACDSDataTable
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
    LogicalName = 'dbo Usuario'
    Params = <>
    RemoteDataAdapter = DM.RemoteDataAdapter
    RemoteUpdatesOptions = []
    StreamingOptions = [soDisableEventsWhileStreaming]
    IndexDefs = <>
    Left = 393
    Top = 375
  end
end
