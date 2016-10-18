object frmAgregarAlumno: TfrmAgregarAlumno
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Datos Alumno'
  ClientHeight = 384
  ClientWidth = 463
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxPageControl1: TcxPageControl
    Left = 0
    Top = 0
    Width = 463
    Height = 327
    Align = alTop
    TabOrder = 0
    TabStop = False
    Properties.ActivePage = cxTabSheet3
    Properties.Images = dmImages.Imagenes2
    ExplicitLeft = -312
    ExplicitTop = 32
    ExplicitWidth = 792
    ExplicitHeight = 338
    ClientRectBottom = 327
    ClientRectRight = 463
    ClientRectTop = 25
    object cxTabSheet3: TcxTabSheet
      Caption = 'Datos Generales'
      ImageIndex = 50
      ExplicitLeft = 3
      ExplicitTop = 27
      ExplicitWidth = 454
      ExplicitHeight = 294
      object cxDBTextEdit1: TcxDBTextEdit
        Left = 6
        Top = 24
        DataBinding.DataField = 'NUMCONTROL'
        DataBinding.DataSource = dsCatalogo
        Enabled = False
        TabOrder = 13
        Width = 121
      end
      object cxDBTextEdit2: TcxDBTextEdit
        Left = 6
        Top = 65
        DataBinding.DataField = 'APATERNO'
        DataBinding.DataSource = dsCatalogo
        TabOrder = 2
        Width = 134
      end
      object cxDBTextEdit3: TcxDBTextEdit
        Left = 146
        Top = 65
        DataBinding.DataField = 'AMATERNO'
        DataBinding.DataSource = dsCatalogo
        TabOrder = 3
        Width = 130
      end
      object cxDBTextEdit4: TcxDBTextEdit
        Left = 282
        Top = 65
        DataBinding.DataField = 'NOMBRE'
        DataBinding.DataSource = dsCatalogo
        TabOrder = 4
        Width = 163
      end
      object cxDBTextEdit5: TcxDBTextEdit
        Left = 6
        Top = 106
        DataBinding.DataField = 'CURP'
        DataBinding.DataSource = dsCatalogo
        TabOrder = 5
        Width = 291
      end
      object cxDBTextEdit6: TcxDBTextEdit
        Left = 6
        Top = 148
        DataBinding.DataField = 'CIUDADNACIMIENTO'
        DataBinding.DataSource = dsCatalogo
        TabOrder = 7
        Width = 291
      end
      object cxDBTextEdit7: TcxDBTextEdit
        Left = 6
        Top = 190
        DataBinding.DataField = 'DIRECCION'
        DataBinding.DataSource = dsCatalogo
        TabOrder = 9
        Width = 439
      end
      object cxDBTextEdit8: TcxDBTextEdit
        Left = 6
        Top = 232
        DataBinding.DataField = 'TELEFONOCASA'
        DataBinding.DataSource = dsCatalogo
        TabOrder = 10
        Width = 142
      end
      object cxDBTextEdit9: TcxDBTextEdit
        Left = 154
        Top = 232
        DataBinding.DataField = 'EMAIL'
        DataBinding.DataSource = dsCatalogo
        TabOrder = 11
        Width = 291
      end
      object cxDBDateEdit1: TcxDBDateEdit
        Left = 133
        Top = 24
        DataBinding.DataField = 'FECHANACIMIENTO'
        DataBinding.DataSource = dsCatalogo
        TabOrder = 0
        Width = 121
      end
      object cxDBDateEdit2: TcxDBDateEdit
        Left = 303
        Top = 148
        DataBinding.DataField = 'FECHAINICIO'
        DataBinding.DataSource = dsCatalogo
        TabOrder = 8
        Width = 142
      end
      object cxLabel1: TcxLabel
        Left = 6
        Top = 9
        Caption = 'No. Control'
      end
      object cxLabel2: TcxLabel
        Left = 133
        Top = 9
        Caption = 'Fecha Nacimiento'
      end
      object cxDBRadioGroup1: TcxDBRadioGroup
        Left = 260
        Top = 9
        Caption = 'Sexo'
        DataBinding.DataField = 'SEXO'
        DataBinding.DataSource = dsCatalogo
        Properties.Columns = 2
        Properties.Items = <
          item
            Caption = 'Masculino'
            Value = 'M'
          end
          item
            Caption = 'Femenino'
            Value = 'F'
          end>
        TabOrder = 1
        Height = 36
        Width = 185
      end
      object cxLabel3: TcxLabel
        Left = 6
        Top = 51
        Caption = 'Apellido Paterno'
      end
      object cxLabel4: TcxLabel
        Left = 146
        Top = 51
        Caption = 'Apellido Materno'
      end
      object cxLabel5: TcxLabel
        Left = 282
        Top = 51
        Caption = 'Nombre(s)'
      end
      object cxLabel6: TcxLabel
        Left = 6
        Top = 92
        Caption = 'CURP'
      end
      object cxLabel7: TcxLabel
        Left = 303
        Top = 92
        Caption = 'STATUS'
      end
      object cxLabel8: TcxLabel
        Left = 6
        Top = 133
        Caption = 'Lugar de Nacimiento'
      end
      object cxLabel9: TcxLabel
        Left = 303
        Top = 133
        Caption = 'Fecha de Ingreso'
      end
      object cxLabel10: TcxLabel
        Left = 6
        Top = 175
        Caption = 'Direccion'
      end
      object cxLabel11: TcxLabel
        Left = 6
        Top = 217
        Caption = 'Telefono Casa'
      end
      object cxLabel12: TcxLabel
        Left = 154
        Top = 217
        Caption = 'E-mail'
      end
      object cxDBLookupComboBox1: TcxDBLookupComboBox
        Left = 303
        Top = 106
        DataBinding.DataField = 'IDSTATUS'
        DataBinding.DataSource = dsCatalogo
        Properties.KeyFieldNames = 'IDSTATUS'
        Properties.ListColumns = <
          item
            FieldName = 'NOMBRE'
          end
          item
            FieldName = 'IDSTATUS'
          end>
        Properties.ListSource = dsStatus
        TabOrder = 6
        Width = 142
      end
      object cxDBCheckBox1: TcxDBCheckBox
        Left = 6
        Top = 264
        Caption = 'Generar Numero de Control'
        DataBinding.DataField = 'GENERARNUMCONTROL'
        DataBinding.DataSource = dsCatalogo
        TabOrder = 12
        Transparent = True
        Width = 155
      end
    end
    object cxTabSheet4: TcxTabSheet
      Caption = 'Datos de los Padres'
      ImageIndex = 51
      ExplicitLeft = 3
      ExplicitTop = 27
      ExplicitWidth = 454
      ExplicitHeight = 294
      object cxDBTextEdit10: TcxDBTextEdit
        Left = 6
        Top = 24
        DataBinding.DataField = 'PADRE'
        DataBinding.DataSource = dsCatalogo
        TabOrder = 4
        Width = 363
      end
      object cxLabel13: TcxLabel
        Left = 6
        Top = 9
        Caption = 'Nombre del Padre'
      end
      object cxLabel14: TcxLabel
        Left = 6
        Top = 51
        Caption = 'Telefono del Padre'
      end
      object cxDBTextEdit11: TcxDBTextEdit
        Left = 6
        Top = 66
        DataBinding.DataField = 'TELEFONOPADRE'
        DataBinding.DataSource = dsCatalogo
        TabOrder = 5
        Width = 170
      end
      object cxDBTextEdit12: TcxDBTextEdit
        Left = 182
        Top = 66
        DataBinding.DataField = 'EMAILPADRE'
        DataBinding.DataSource = dsCatalogo
        TabOrder = 7
        Width = 187
      end
      object cxLabel15: TcxLabel
        Left = 182
        Top = 51
        Caption = 'E-mail del Padre'
      end
      object cxDBTextEdit13: TcxDBTextEdit
        Left = 6
        Top = 108
        DataBinding.DataField = 'PUESTOPADRE'
        DataBinding.DataSource = dsCatalogo
        TabOrder = 8
        Width = 170
      end
      object cxLabel16: TcxLabel
        Left = 6
        Top = 93
        Caption = 'Puesto'
      end
      object cxDBTextEdit14: TcxDBTextEdit
        Left = 182
        Top = 108
        DataBinding.DataField = 'EMPRESAPADRE'
        DataBinding.DataSource = dsCatalogo
        TabOrder = 10
        Width = 187
      end
      object cxLabel17: TcxLabel
        Left = 182
        Top = 93
        Caption = 'Empresa'
      end
      object cxDBTextEdit15: TcxDBTextEdit
        Left = 6
        Top = 151
        DataBinding.DataField = 'MADRE'
        DataBinding.DataSource = dsCatalogo
        TabOrder = 11
        Width = 363
      end
      object cxLabel18: TcxLabel
        Left = 6
        Top = 135
        Caption = 'Nombre de la Madre'
      end
      object cxDBTextEdit16: TcxDBTextEdit
        Left = 6
        Top = 192
        DataBinding.DataField = 'TELEFONOMADRE'
        DataBinding.DataSource = dsCatalogo
        TabOrder = 13
        Width = 170
      end
      object cxLabel19: TcxLabel
        Left = 6
        Top = 177
        Caption = 'Telefono la Madre'
      end
      object cxDBTextEdit17: TcxDBTextEdit
        Left = 182
        Top = 192
        DataBinding.DataField = 'EMAILMADRE'
        DataBinding.DataSource = dsCatalogo
        TabOrder = 14
        Width = 187
      end
      object cxLabel20: TcxLabel
        Left = 182
        Top = 177
        Caption = 'E-mail de la Madre'
      end
      object cxDBTextEdit18: TcxDBTextEdit
        Left = 6
        Top = 234
        DataBinding.DataField = 'PUESTOMADRE'
        DataBinding.DataSource = dsCatalogo
        TabOrder = 15
        Width = 170
      end
      object cxLabel21: TcxLabel
        Left = 6
        Top = 219
        Caption = 'Puesto'
      end
      object cxDBTextEdit19: TcxDBTextEdit
        Left = 182
        Top = 234
        DataBinding.DataField = 'EMPRESAMADRE'
        DataBinding.DataSource = dsCatalogo
        TabOrder = 16
        Width = 187
      end
      object cxLabel22: TcxLabel
        Left = 182
        Top = 219
        Caption = 'Empresa'
      end
    end
    object cxTabSheet5: TcxTabSheet
      Caption = 'Datos de la Empresa'
      ImageIndex = 51
      ExplicitLeft = 3
      ExplicitTop = 27
      ExplicitWidth = 454
      ExplicitHeight = 294
      object cxLabel23: TcxLabel
        Left = 6
        Top = 9
        Caption = 'Nombre de la Empresa'
        ParentFont = False
      end
      object cxDBTextEdit20: TcxDBTextEdit
        Left = 6
        Top = 24
        DataBinding.DataField = 'EMPRESAPADRE'
        DataBinding.DataSource = dsCatalogo
        TabOrder = 1
        Width = 363
      end
      object cxLabel24: TcxLabel
        Left = 6
        Top = 49
        Caption = 'Telefono de la Empresa'
        ParentFont = False
      end
      object cxDBTextEdit21: TcxDBTextEdit
        Left = 6
        Top = 64
        DataBinding.DataField = 'TELEFONOPADRE'
        DataBinding.DataSource = dsCatalogo
        TabOrder = 3
        Width = 162
      end
      object cxLabel25: TcxLabel
        Left = 174
        Top = 49
        Caption = 'E-mail de la Empresa'
        ParentFont = False
      end
      object cxDBTextEdit22: TcxDBTextEdit
        Left = 174
        Top = 64
        DataBinding.DataField = 'EMAILPADRE'
        DataBinding.DataSource = dsCatalogo
        TabOrder = 5
        Width = 195
      end
      object cxLabel26: TcxLabel
        Left = 6
        Top = 89
        Caption = 'Nombre del Encargado'
        ParentFont = False
      end
      object cxDBTextEdit23: TcxDBTextEdit
        Left = 6
        Top = 104
        DataBinding.DataField = 'MADRE'
        DataBinding.DataSource = dsCatalogo
        TabOrder = 7
        Width = 363
      end
      object cxLabel27: TcxLabel
        Left = 6
        Top = 129
        Caption = 'Telefono'
        ParentFont = False
      end
      object cxDBTextEdit24: TcxDBTextEdit
        Left = 6
        Top = 144
        DataBinding.DataField = 'TELEFONOMADRE'
        DataBinding.DataSource = dsCatalogo
        TabOrder = 9
        Width = 162
      end
      object cxLabel28: TcxLabel
        Left = 174
        Top = 129
        Caption = 'E-mail'
        ParentFont = False
      end
      object cxDBTextEdit25: TcxDBTextEdit
        Left = 174
        Top = 144
        DataBinding.DataField = 'EMAILMADRE'
        DataBinding.DataSource = dsCatalogo
        TabOrder = 11
        Width = 195
      end
      object cxLabel29: TcxLabel
        Left = 6
        Top = 169
        Caption = 'Puesto'
        ParentFont = False
      end
      object cxDBTextEdit26: TcxDBTextEdit
        Left = 6
        Top = 184
        DataBinding.DataField = 'PUESTOMADRE'
        DataBinding.DataSource = dsCatalogo
        TabOrder = 13
        Width = 162
      end
    end
    object cxTabSheet7: TcxTabSheet
      Caption = 'Facturar'
      ImageIndex = 56
      ExplicitLeft = 3
      ExplicitTop = 27
      ExplicitWidth = 454
      ExplicitHeight = 294
      object cxDBTextEdit27: TcxDBTextEdit
        Left = 6
        Top = 24
        DataBinding.DataField = 'FACTURANOMBRE'
        DataBinding.DataSource = dsCatalogo
        TabOrder = 0
        Width = 366
      end
      object cxLabel30: TcxLabel
        Left = 6
        Top = 9
        Caption = 'Facturar a Nombre de (Razon Social)'
      end
      object cxDBTextEdit28: TcxDBTextEdit
        Left = 6
        Top = 64
        DataBinding.DataField = 'FACTURADOMICILIO'
        DataBinding.DataSource = dsCatalogo
        TabOrder = 1
        Width = 366
      end
      object cxLabel31: TcxLabel
        Left = 6
        Top = 49
        Caption = 'Domicilio'
      end
      object cxDBTextEdit29: TcxDBTextEdit
        Left = 6
        Top = 112
        DataBinding.DataField = 'FACTURATELEFONO'
        DataBinding.DataSource = dsCatalogo
        TabOrder = 2
        Width = 187
      end
      object cxLabel32: TcxLabel
        Left = 6
        Top = 97
        Caption = 'Factura Telefono'
      end
      object cxLabel33: TcxLabel
        Left = 206
        Top = 97
        Caption = 'R.F.C.'
      end
      object cxDBTextEdit30: TcxDBTextEdit
        Left = 206
        Top = 112
        DataBinding.DataField = 'RFC'
        DataBinding.DataSource = dsCatalogo
        TabOrder = 3
        Width = 166
      end
      object cxLabel34: TcxLabel
        Left = 206
        Top = 145
        Caption = 'Numero Exterior'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object cxDBTextEdit31: TcxDBTextEdit
        Left = 6
        Top = 160
        DataBinding.DataField = 'COLONIA'
        DataBinding.DataSource = dsCatalogo
        TabOrder = 4
        Width = 187
      end
      object cxLabel35: TcxLabel
        Left = 6
        Top = 145
        Caption = 'Colonia'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object cxDBTextEdit32: TcxDBTextEdit
        Left = 206
        Top = 160
        DataBinding.DataField = 'NOEXTERIOR'
        DataBinding.DataSource = dsCatalogo
        TabOrder = 5
        Width = 91
      end
      object cxLabel36: TcxLabel
        Left = 6
        Top = 193
        Caption = 'Localidad'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object cxDBTextEdit33: TcxDBTextEdit
        Left = 6
        Top = 208
        DataBinding.DataField = 'LOCALIDAD'
        DataBinding.DataSource = dsCatalogo
        TabOrder = 7
        Width = 187
      end
      object cxLabel37: TcxLabel
        Left = 206
        Top = 193
        Caption = 'Municipio'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object cxDBTextEdit34: TcxDBTextEdit
        Left = 206
        Top = 208
        DataBinding.DataField = 'MUNICIPIO'
        DataBinding.DataSource = dsCatalogo
        TabOrder = 8
        Width = 166
      end
      object cxLabel38: TcxLabel
        Left = 6
        Top = 241
        Caption = 'Estado'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object cxDBTextEdit35: TcxDBTextEdit
        Left = 6
        Top = 256
        DataBinding.DataField = 'ESTADO'
        DataBinding.DataSource = dsCatalogo
        TabOrder = 9
        Width = 187
      end
      object cxDBTextEdit36: TcxDBTextEdit
        Left = 206
        Top = 256
        DataBinding.DataField = 'PAIS'
        DataBinding.DataSource = dsCatalogo
        TabOrder = 10
        Width = 166
      end
      object cxLabel39: TcxLabel
        Left = 206
        Top = 241
        Caption = 'Pais'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object cxLabel40: TcxLabel
        Left = 303
        Top = 145
        Caption = 'Codigo Postal'
        Style.BorderStyle = ebsNone
        Transparent = True
      end
      object cxDBTextEdit37: TcxDBTextEdit
        Left = 303
        Top = 160
        DataBinding.DataField = 'CODIGOPOSTAL'
        DataBinding.DataSource = dsCatalogo
        TabOrder = 6
        Width = 69
      end
    end
  end
  object btnCancelar: TcxButton
    Left = 247
    Top = 343
    Width = 82
    Height = 25
    Caption = 'Cancelar'
    Colors.Default = clWhite
    Colors.Normal = clWhite
    Colors.Hot = clWhite
    Colors.Pressed = clWhite
    Colors.Disabled = clWhite
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FF000288010893010B99010C99010893000389FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000186010D9D021CAF021FB402
      1FB5021FB5021FB2021CB0010F9F000287FF00FFFF00FFFF00FFFF00FFFF00FF
      00038A0118B2021FB7021EB1021DB1021DB1021DB1021DB1021EB2021FB40219
      AC00048EFF00FFFF00FFFF00FF0001830118BB0220CC011CBF0015B4011AB002
      1DB1021DB1011CB00015AD011BB0021FB4021AAC000287FF00FFFF00FF010CA7
      0121E0011CD30726CC4966D70B28BC0018B00019AF0622B44A66CE0D2BB7011B
      B0021FB5010F9FFF00FF000187011CDC0120ED0017DC3655E2FFFFFFA4B4ED05
      20BB0119B28B9EE1FFFFFF4E6ACF0014AC021EB2021CB000038900069A0120F8
      011FF6001DE9031FE1738BEEFFFFFFA0B1ED93A5E7FFFFFF91A4E20823B4011B
      B0021DB1021FB4010895020CAA0A2EFE0323FB011FF6001CEB0018E1788FF0FF
      FFFFFFFFFF96A7EA021BB50019AF021DB1021DB10220B5010C99040EAC294DFE
      0D30FB011FFA001CF7011CEE8EA1F4FFFFFFFFFFFFA6B6EE0520C20018B6021D
      B1021DB10220B5010B980208A04162FB2F51FC001EFA0725FA8AA0FEFFFFFF8E
      A3F67991F2FFFFFFA3B4EE0C29C6011BB8021DB4021FB2000793000189314FEF
      7690FF0F2DFA3354FBFFFFFF91A5FE021EF30017E7738BF3FFFFFF4765E00016
      C2021FBD021CB2000288FF00FF0C1BBC819AFF728BFE1134FA3456FB0526FA00
      1CFA001CF40220ED3353ED0625DA011DD00220CB010DA1FF00FFFF00FF000189
      2943E6A5B7FF849AFC2341FB0323FA011FFA011FFA001EF7011BEE021FE50121
      E20118BF000184FF00FFFF00FFFF00FF01038F2A45E693A9FFABBBFF758FFE49
      69FC3658FB3153FC2346FC092CF70118CB00038BFF00FFFF00FFFF00FFFF00FF
      FF00FF0001890F1DBF3E5BF36B87FE728CFF5E7BFE395BFB1231EB010FB50001
      84FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000189030AA306
      11B2050FB10107A0000188FF00FFFF00FFFF00FFFF00FFFF00FF}
    LookAndFeel.NativeStyle = False
    TabOrder = 1
    TabStop = False
    OnClick = btnCancelarClick
  end
  object btnAceptar: TcxButton
    Left = 110
    Top = 343
    Width = 82
    Height = 25
    Caption = 'Aceptar'
    Colors.Default = clWhite
    Colors.Normal = clWhite
    Colors.Hot = clWhite
    Colors.Pressed = clWhite
    Colors.Disabled = clWhite
    Default = True
    Glyph.Data = {
      36050000424D3605000000000000360400002800000010000000100000000100
      0800000000000001000000000000000000000001000000000000FF00FF00004B
      0000098611000A8615000D931A000C9518000C9C19000F991C000E9D1D001392
      240011A0210011A422001CA134001CB1350024BC430029B548002EC6520035CA
      5E0039D465000000000000000000000000000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000001
      0100000000000000000000000000010808010000000000000000000000010D0B
      080B0100000000000000000001100E0901040801000000000000000111120C01
      000103080100000000000000010F010000000001040100000000000000010000
      0000000001030100000000000000000000000000000001010000000000000000
      0000000000000001010000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000}
    LookAndFeel.NativeStyle = False
    TabOrder = 2
    TabStop = False
    OnClick = btnAceptarClick
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
    LogicalName = 'dbo STATUS'
    IndexDefs = <>
    Left = 168
    Top = 344
  end
  object dsStatus: TDADataSource
    DataSet = cdsStatus.Dataset
    DataTable = cdsStatus
    Left = 200
    Top = 344
  end
  object cdsProspecto: TDAMemDataTable
    RemoteUpdatesOptions = []
    Fields = <
      item
        Name = 'IDPROSPECTO'
        DataType = datInteger
      end
      item
        Name = 'NOMBRE'
        DataType = datString
        Size = 70
      end
      item
        Name = 'FECHANACIMIENTO'
        DataType = datDateTime
      end
      item
        Name = 'SEXO'
        DataType = datString
        Size = 1
      end
      item
        Name = 'CIUDADNACIMIENTO'
        DataType = datString
        Size = 30
      end
      item
        Name = 'DIRECCION'
        DataType = datString
        Size = 75
      end
      item
        Name = 'PADRE'
        DataType = datString
        Size = 70
      end
      item
        Name = 'MADRE'
        DataType = datString
        Size = 70
      end
      item
        Name = 'TELEFONOCASA'
        DataType = datString
        Size = 20
      end
      item
        Name = 'EMAIL'
        DataType = datString
        Size = 40
      end
      item
        Name = 'EMAILPADRE'
        DataType = datString
        Size = 40
      end
      item
        Name = 'EMAILMADRE'
        DataType = datString
        Size = 40
      end
      item
        Name = 'APATERNO'
        DataType = datString
        Size = 20
      end
      item
        Name = 'AMATERNO'
        DataType = datString
        Size = 20
      end
      item
        Name = 'NOMBRES'
        DataType = datString
        Size = 25
      end
      item
        Name = 'ESCUELAPROCEDENCIA'
        DataType = datString
        Size = 200
      end>
    Params = <
      item
        Name = 'IDPROSPECTO'
        Value = '0'
      end>
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = DM.RemoteDataAdapter
    LogicalName = 'spProspecto'
    IndexDefs = <>
    Left = 352
    Top = 344
  end
  object dsCatalogo: TDADataSource
    DataSet = cdsCatalogo.Dataset
    DataTable = cdsCatalogo
    Left = 72
    Top = 344
  end
  object cdsCatalogo: TDAMemDataTable
    RemoteUpdatesOptions = []
    Fields = <
      item
        Name = 'IDALUMNO'
        DataType = datInteger
      end
      item
        Name = 'NUMCONTROL'
        DataType = datString
        Size = 12
      end
      item
        Name = 'NOMBRE'
        DataType = datString
        Size = 70
      end
      item
        Name = 'FECHANACIMIENTO'
        DataType = datDateTime
      end
      item
        Name = 'CURP'
        DataType = datString
        Size = 40
      end
      item
        Name = 'SEXO'
        DataType = datString
        Size = 1
      end
      item
        Name = 'CIUDADNACIMIENTO'
        DataType = datString
        Size = 30
      end
      item
        Name = 'DIRECCION'
        DataType = datString
        Size = 75
      end
      item
        Name = 'PADRE'
        DataType = datString
        Size = 70
      end
      item
        Name = 'MADRE'
        DataType = datString
        Size = 70
      end
      item
        Name = 'TELEFONOCASA'
        DataType = datString
        Size = 20
      end
      item
        Name = 'TELEFONOPADRE'
        DataType = datString
        Size = 20
      end
      item
        Name = 'TELEFONOMADRE'
        DataType = datString
        Size = 20
      end
      item
        Name = 'FECHAINICIO'
        DataType = datDateTime
      end
      item
        Name = 'EMAIL'
        DataType = datString
        Size = 40
      end
      item
        Name = 'EMAILPADRE'
        DataType = datString
        Size = 40
      end
      item
        Name = 'EMAILMADRE'
        DataType = datString
        Size = 40
      end
      item
        Name = 'OBSERVACIONES'
        DataType = datMemo
      end
      item
        Name = 'IDSTATUS'
        DataType = datInteger
      end
      item
        Name = 'FOTO'
        DataType = datMemo
      end
      item
        Name = 'FACTURADOMICILIO'
        DataType = datString
        Size = 70
      end
      item
        Name = 'FACTURANOMBRE'
        DataType = datString
        Size = 70
      end
      item
        Name = 'FACTURATELEFONO'
        DataType = datString
        Size = 20
      end
      item
        Name = 'RFC'
        DataType = datString
        Size = 20
      end
      item
        Name = 'EMPRESAPADRE'
        DataType = datString
        Size = 50
      end
      item
        Name = 'EMPRESAMADRE'
        DataType = datString
        Size = 50
      end
      item
        Name = 'PUESTOMADRE'
        DataType = datString
        Size = 25
      end
      item
        Name = 'PUESTOPADRE'
        DataType = datString
        Size = 25
      end
      item
        Name = 'APATERNO'
        DataType = datString
        Size = 20
      end
      item
        Name = 'AMATERNO'
        DataType = datString
        Size = 20
      end
      item
        Name = 'NOMBRES'
        DataType = datString
        Size = 25
      end
      item
        Name = 'NOEXTERIOR'
        DataType = datString
        Size = 20
      end
      item
        Name = 'COLONIA'
        DataType = datString
        Size = 40
      end
      item
        Name = 'LOCALIDAD'
        DataType = datString
        Size = 50
      end
      item
        Name = 'MUNICIPIO'
        DataType = datString
        Size = 50
      end
      item
        Name = 'ESTADO'
        DataType = datString
        Size = 50
      end
      item
        Name = 'PAIS'
        DataType = datString
        Size = 50
      end
      item
        Name = 'CODIGOPOSTAL'
        DataType = datString
        Size = 50
      end
      item
        Name = 'GENERARNUMCONTROL'
        DataType = datBoolean
      end>
    Params = <>
    StreamingOptions = [soDisableEventsWhileStreaming]
    RemoteDataAdapter = DM.RemoteDataAdapter
    AfterPost = cdsCatalogoAfterPost
    AfterDelete = cdsCatalogoAfterPost
    OnNewRecord = cdsCatalogoNewRecord
    LogicalName = 'dbo ALUMNO'
    IndexDefs = <>
    Left = 40
    Top = 344
  end
end
