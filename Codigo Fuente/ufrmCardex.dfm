inherited frmCardex: TfrmCardex
  Caption = 'Cardex'
  ClientWidth = 745
  ExplicitWidth = 745
  ExplicitHeight = 449
  PixelsPerInch = 96
  TextHeight = 13
  object grbEncabezado: TcxGroupBox
    Left = 0
    Top = 0
    Hint = ''
    TabStop = True
    Align = alTop
    Style.BorderStyle = ebsUltraFlat
    Style.LookAndFeel.NativeStyle = True
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 0
    Height = 82
    Width = 745
    object Label1: TLabel
      Left = 404
      Top = 19
      Width = 74
      Height = 13
      Caption = 'Fecha Inicial'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label2: TLabel
      Left = 576
      Top = 19
      Width = 67
      Height = 13
      Caption = 'Fecha Final'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object dbCbxAlmacen: TcxDBLookupComboBox
      Tag = 4
      Left = 75
      Top = 44
      Hint = ''
      DataBinding.DataField = 'IDALMACEN'
      Properties.GridMode = True
      Properties.HideSelection = False
      Properties.KeyFieldNames = 'IDALMACEN'
      Properties.ListColumns = <
        item
          FieldName = 'NOMBRE'
        end>
      Style.BorderStyle = ebsUltraFlat
      TabOrder = 0
      Width = 159
    end
    object cxLabel2: TcxLabel
      Left = 16
      Top = 45
      Hint = ''
      Caption = 'Almacen'
      ParentFont = False
      Style.BorderStyle = ebsNone
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      Transparent = True
    end
    object cxLabel1: TcxLabel
      Left = 15
      Top = 17
      Hint = ''
      Caption = 'Estacion'
      ParentFont = False
      Style.BorderStyle = ebsNone
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      Transparent = True
    end
    object cxEstacionDestino: TcxDBLookupComboBox
      Left = 75
      Top = 16
      Hint = ''
      DataBinding.DataField = 'IDESTACIOND'
      Properties.GridMode = True
      Properties.HideSelection = False
      Properties.KeyFieldNames = 'NUMEROESTACION'
      Properties.ListColumns = <
        item
          FieldName = 'NOMBRE'
        end>
      TabOrder = 3
      Width = 159
    end
    object dtpInicial: TcxDateEdit
      Left = 482
      Top = 16
      Hint = ''
      ParentFont = False
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
      Properties.InputKind = ikMask
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      Style.TextColor = clNavy
      Style.IsFontAssigned = True
      TabOrder = 4
      Width = 88
    end
    object dtpFinal: TcxDateEdit
      Left = 649
      Top = 16
      Hint = ''
      ParentFont = False
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
      Properties.InputKind = ikMask
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      Style.TextColor = clNavy
      Style.IsFontAssigned = True
      TabOrder = 5
      Width = 88
    end
    object cxButton1: TcxButton
      Left = 576
      Top = 42
      Width = 161
      Height = 25
      Caption = 'Procesar'
      TabOrder = 6
    end
    object cxLabel3: TcxLabel
      Left = 351
      Top = 45
      Hint = ''
      Caption = 'Producto'
      ParentFont = False
      Style.BorderStyle = ebsNone
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      Style.IsFontAssigned = True
      Transparent = True
    end
    object cxDBLookupComboBox1: TcxDBLookupComboBox
      Left = 411
      Top = 44
      Hint = ''
      DataBinding.DataField = 'IDESTACIOND'
      Properties.GridMode = True
      Properties.HideSelection = False
      Properties.KeyFieldNames = 'NUMEROESTACION'
      Properties.ListColumns = <
        item
          FieldName = 'NOMBRE'
        end>
      TabOrder = 8
      Width = 159
    end
  end
  object cxGroupBox6: TcxGroupBox
    Left = 0
    Top = 82
    Hint = ''
    Align = alClient
    Style.BorderStyle = ebsUltraFlat
    TabOrder = 1
    ExplicitTop = 88
    ExplicitHeight = 361
    Height = 367
    Width = 745
    object cxGrid1: TcxGrid
      Left = 2
      Top = 5
      Width = 741
      Height = 360
      Hint = ''
      Align = alClient
      TabOrder = 0
      LookAndFeel.Kind = lfStandard
      LookAndFeel.NativeStyle = False
      ExplicitHeight = 354
      object cxGridDBTableView3: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Format = '#,#0.00'
            Kind = skSum
            Column = cxGridDBTableView3Cantidad
          end
          item
            Format = '$#,#0.00'
            Kind = skSum
            Column = cxGridDBTableView3Importe
          end>
        DataController.Summary.SummaryGroups = <>
        NewItemRow.Visible = True
        OptionsBehavior.FocusCellOnTab = True
        OptionsBehavior.FocusFirstCellOnNewRecord = True
        OptionsBehavior.GoToNextCellOnEnter = True
        OptionsBehavior.FocusCellOnCycle = True
        OptionsView.Footer = True
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        object cxGridDBTableView3ProductoID: TcxGridDBColumn
          Caption = 'Producto'
          DataBinding.FieldName = 'IDPRODUCTO'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.ValidateOnEnter = True
          Width = 66
        end
        object cxDescripcion: TcxGridDBColumn
          Caption = 'Descripcion'
          DataBinding.FieldName = 'IDPRODUCTO'
          PropertiesClassName = 'TcxLookupComboBoxProperties'
          Properties.KeyFieldNames = 'IDPRODUCTO'
          Properties.ListColumns = <
            item
              FieldName = 'Nombre'
            end>
          Options.Editing = False
          Options.Focusing = False
          Width = 256
        end
        object cxGridDBTableView3Cantidad: TcxGridDBColumn
          DataBinding.FieldName = 'CANTIDAD'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.ValidateOnEnter = True
          Width = 87
        end
        object cxGridDBTableView3Costo: TcxGridDBColumn
          DataBinding.FieldName = 'PRECIO'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.ValidateOnEnter = True
          Width = 83
        end
        object cxGridDBTableView3Importe: TcxGridDBColumn
          DataBinding.FieldName = 'IMPORTE'
          PropertiesClassName = 'TcxTextEditProperties'
          Properties.ValidateOnEnter = True
          Options.Editing = False
          Options.Focusing = False
          Width = 126
        end
      end
      object cxGridLevel3: TcxGridLevel
        GridView = cxGridDBTableView3
      end
    end
  end
end
