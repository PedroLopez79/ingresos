inherited frmCatalogoUsuarios: TfrmCatalogoUsuarios
  Caption = 'frmCatalogoUsuarios'
  ExplicitWidth = 625
  ExplicitHeight = 449
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcCatalogo: TcxPageControl
    Properties.ActivePage = cxTabSheet3
    inherited cxTabSheet1: TcxTabSheet
      ExplicitLeft = 3
      ExplicitTop = 3
      ExplicitWidth = 616
      ExplicitHeight = 416
      inherited dbgCatalogo: TcxGrid
        inherited dbgCatalogoDBTableView1: TcxGridDBTableView
          OnFocusedRecordChanged = dbgCatalogoDBTableView1FocusedRecordChanged
          object dbgCatalogoDBTableView1RecID: TcxGridDBColumn
            DataBinding.FieldName = 'RecID'
            Visible = False
          end
          object dbgCatalogoDBTableView1IDEMPLEADO: TcxGridDBColumn
            DataBinding.FieldName = 'IDEMPLEADO'
            Width = 77
          end
          object dbgCatalogoDBTableView1CODIGO: TcxGridDBColumn
            DataBinding.FieldName = 'CODIGO'
          end
          object dbgCatalogoDBTableView1NOMBRE: TcxGridDBColumn
            DataBinding.FieldName = 'NOMBRE'
          end
          object dbgCatalogoDBTableView1USERNAME: TcxGridDBColumn
            DataBinding.FieldName = 'USERNAME'
          end
          object dbgCatalogoDBTableView1USERPASSWORD: TcxGridDBColumn
            DataBinding.FieldName = 'USERPASSWORD'
          end
        end
      end
    end
    inherited cxTabSheet2: TcxTabSheet
      ExplicitWidth = 616
      ExplicitHeight = 416
      object cxGroupBox1: TcxGroupBox
        Left = 16
        Top = 15
        Hint = ''
        Caption = ' Datos '
        TabOrder = 0
        Height = 250
        Width = 353
        object cxDBTextEdit1: TcxDBTextEdit
          Left = 16
          Top = 32
          Hint = ''
          DataBinding.DataField = 'IDEMPLEADO'
          DataBinding.DataSource = dsCatalogo
          Properties.CharCase = ecUpperCase
          Properties.ReadOnly = True
          TabOrder = 0
          Width = 57
        end
        object cxLabel1: TcxLabel
          Left = 16
          Top = 16
          Hint = ''
          Caption = 'ID'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
        object cxLabel2: TcxLabel
          Left = 15
          Top = 102
          Hint = ''
          Caption = 'Nombre'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
        object cxDBTextEdit2: TcxDBTextEdit
          Left = 15
          Top = 118
          Hint = ''
          DataBinding.DataField = 'NOMBRE'
          DataBinding.DataSource = dsCatalogo
          Properties.CharCase = ecUpperCase
          TabOrder = 3
          Width = 313
        end
        object cxLabel3: TcxLabel
          Left = 15
          Top = 145
          Hint = ''
          Caption = 'Usuario'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
        object cxDBTextEdit3: TcxDBTextEdit
          Left = 15
          Top = 161
          Hint = ''
          DataBinding.DataField = 'USERNAME'
          DataBinding.DataSource = dsCatalogo
          Properties.CharCase = ecUpperCase
          TabOrder = 5
          Width = 105
        end
        object cxLabel4: TcxLabel
          Left = 15
          Top = 188
          Hint = ''
          Caption = 'Clave'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
        object edtConfirmar: TcxTextEdit
          Left = 144
          Top = 204
          Hint = ''
          Properties.CharCase = ecUpperCase
          Properties.EchoMode = eemPassword
          TabOrder = 7
          Visible = False
          Width = 105
        end
        object lblConfirmar: TcxLabel
          Left = 144
          Top = 188
          Hint = ''
          Caption = 'Confirmar Clave'
          Style.BorderStyle = ebsNone
          Transparent = True
          Visible = False
        end
        object cxLabel5: TcxLabel
          Left = 157
          Top = 264
          Hint = ''
          Style.BorderStyle = ebsNone
          Transparent = True
          Visible = False
        end
        object cxDBTextEdit4: TcxDBTextEdit
          Left = 15
          Top = 204
          Hint = ''
          DataBinding.DataField = 'USERPASSWORD'
          DataBinding.DataSource = dsCatalogo
          Properties.CharCase = ecUpperCase
          Properties.EchoMode = eemPassword
          Properties.PasswordChar = '*'
          TabOrder = 10
          OnExit = cxDBTextEdit4Exit
          Width = 106
        end
        object cxLabel6: TcxLabel
          Left = 15
          Top = 59
          Hint = ''
          Caption = 'CODIGO'
          Style.BorderStyle = ebsNone
          Transparent = True
        end
        object cxDBTextEdit5: TcxDBTextEdit
          Left = 15
          Top = 77
          Hint = ''
          DataBinding.DataField = 'CODIGO'
          DataBinding.DataSource = dsCatalogo
          Properties.CharCase = ecUpperCase
          TabOrder = 12
          Width = 58
        end
      end
    end
    object cxTabSheet3: TcxTabSheet
      Caption = 'Permisos'
      ImageIndex = 15
      object tlAccesos: TcxTreeList
        Left = 0
        Top = 0
        Width = 289
        Height = 416
        Hint = ''
        Align = alLeft
        Bands = <
          item
          end>
        Images = dmImages.ToolBarImages
        LookAndFeel.NativeStyle = False
        Navigator.Buttons.CustomButtons = <>
        OptionsBehavior.IncSearch = True
        TabOrder = 0
        OnNodeChanged = tlAccesosNodeChanged
        object cxTreeList1cxTreeListColumn1: TcxTreeListColumn
          PropertiesClassName = 'TcxCheckBoxProperties'
          Properties.ImmediatePost = True
          Caption.Text = 'Permiso'
          DataBinding.ValueType = 'Boolean'
          Options.Sizing = False
          Options.Sorting = False
          Width = 100
          Position.ColIndex = 1
          Position.RowIndex = 0
          Position.BandIndex = 0
          Summary.FooterSummaryItems = <>
          Summary.GroupFooterSummaryItems = <>
        end
        object cxTreeList1cxTreeListColumn2: TcxTreeListColumn
          Caption.Text = 'Opci'#243'n'
          DataBinding.ValueType = 'String'
          Options.Sizing = False
          Options.Editing = False
          Options.Sorting = False
          Width = 164
          Position.ColIndex = 2
          Position.RowIndex = 0
          Position.BandIndex = 0
          Summary.FooterSummaryItems = <>
          Summary.GroupFooterSummaryItems = <>
        end
        object tlAccesoscxTreeListColumn1: TcxTreeListColumn
          Visible = False
          DataBinding.ValueType = 'Integer'
          Position.ColIndex = 0
          Position.RowIndex = 0
          Position.BandIndex = 0
          Summary.FooterSummaryItems = <>
          Summary.GroupFooterSummaryItems = <>
        end
      end
    end
  end
  inherited cdsCatalogo: TDAMemDataTable
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
    RemoteDataAdapter = DM.RemoteDataAdapter
    BeforePost = cdsCatalogoBeforePost
    OnNewRecord = cdsCatalogoNewRecord
  end
  inherited dsCatalogo: TDADataSource
    DataSet = cdsCatalogo.Dataset
  end
  object cdsOpcion: TDACDSDataTable
    Fields = <
      item
        Name = 'OpcionID'
        DataType = datInteger
        Required = True
        InPrimaryKey = True
      end
      item
        Name = 'Descripcion'
        DataType = datString
        Size = 50
        Required = True
      end
      item
        Name = 'ImageIndex'
        DataType = datInteger
        Required = True
      end
      item
        Name = 'PadreID'
        DataType = datInteger
        Required = True
      end
      item
        Name = 'Orden'
        DataType = datInteger
        Required = True
      end>
    LogicalName = 'dbo Opcion'
    Params = <>
    RemoteDataAdapter = DM.RemoteDataAdapter
    RemoteUpdatesOptions = []
    StreamingOptions = [soDisableEventsWhileStreaming]
    AfterDelete = cdsCatalogoAfterPost
    AfterPost = cdsCatalogoAfterPost
    IndexDefs = <>
    Left = 416
    Top = 400
  end
  object cdsAcceso: TDACDSDataTable
    Fields = <
      item
        Name = 'UsuarioID'
        DataType = datInteger
        Required = True
        InPrimaryKey = True
      end
      item
        Name = 'OpcionID'
        DataType = datInteger
        Required = True
        InPrimaryKey = True
      end>
    LogicalName = 'dbo Acceso'
    Params = <>
    RemoteDataAdapter = DM.RemoteDataAdapter
    RemoteUpdatesOptions = []
    StreamingOptions = [soDisableEventsWhileStreaming]
    AfterDelete = cdsCatalogoAfterPost
    AfterPost = cdsCatalogoAfterPost
    IndexDefs = <>
    Left = 368
    Top = 400
  end
end
