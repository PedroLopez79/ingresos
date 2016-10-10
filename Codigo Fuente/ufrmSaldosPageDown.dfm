object DatosFacturaCliente: TDatosFacturaCliente
  Left = 0
  Top = 0
  Caption = 'Facturas Cliente'
  ClientHeight = 392
  ClientWidth = 569
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid2: TcxGrid
    Left = 0
    Top = 0
    Width = 569
    Height = 392
    Align = alClient
    TabOrder = 0
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    ExplicitLeft = -102
    ExplicitTop = -176
    ExplicitWidth = 673
    ExplicitHeight = 520
    object cxGridDBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = dsSaldo
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '$#,#0.00'
          Kind = skSum
          Column = cxGrid1DBTableView1Cargo
        end
        item
          Format = '$#,#0.00'
          Kind = skSum
          Column = cxGrid1DBTableView1Abono
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.IncSearch = True
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnSorting = False
      OptionsData.Editing = False
      OptionsSelection.MultiSelect = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      object cxGrid1DBTableView1CargoAbonoID: TcxGridDBColumn
        Caption = 'Mvto.'
        DataBinding.FieldName = 'DOCUMENTOID'
        Width = 66
      end
      object cxGrid1DBTableView1FechaMovimiento: TcxGridDBColumn
        Caption = 'Fecha'
        DataBinding.FieldName = 'FECHA'
        Width = 70
      end
      object cxGrid1DBTableView1Referencia: TcxGridDBColumn
        DataBinding.FieldName = 'Referencia'
        Width = 175
      end
      object cxGrid1DBTableView1Cargo: TcxGridDBColumn
        Caption = 'Cargos'
        DataBinding.FieldName = 'Cargo'
        Width = 85
      end
      object cxGrid1DBTableView1Abono: TcxGridDBColumn
        Caption = 'Abonos'
        DataBinding.FieldName = 'Abono'
        Width = 85
      end
      object cxGrid1DBTableView1Column1: TcxGridDBColumn
        Caption = 'Saldo'
        DataBinding.FieldName = 'SALDOPARCIAL'
        Width = 85
      end
    end
    object cxGridLevel1: TcxGridLevel
      GridView = cxGridDBTableView1
    end
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
    Left = 275
    Top = 87
  end
  object dsSaldo: TDADataSource
    DataSet = cdsSaldo.Dataset
    DataTable = cdsSaldo
    Left = 275
    Top = 120
  end
end
