object frmPrincipal: TfrmPrincipal
  Left = 372
  Top = 277
  Caption = 'CistemExporta 1.0'
  ClientHeight = 447
  ClientWidth = 685
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Ribbon: TdxRibbon
    Left = 0
    Top = 0
    Width = 685
    Height = 159
    BarManager = dxBarManager1
    ColorSchemeName = 'Blue'
    QuickAccessToolbar.Toolbar = tbRapida
    SupportNonClientDrawing = True
    Contexts = <>
    TabOrder = 0
    TabStop = False
    object rbtAcciones: TdxRibbonTab
      Active = True
      Caption = 'Acciones'
      Groups = <
        item
          ToolbarName = 'tbAcciones'
        end>
      Index = 0
    end
    object rbtExportar: TdxRibbonTab
      Caption = 'Exportar'
      Groups = <
        item
          ToolbarName = 'tbExportar'
        end>
      Index = 1
    end
    object dxRibbon1Tab2: TdxRibbonTab
      Caption = 'Catalogos'
      Groups = <
        item
          ToolbarName = 'tbCatalogos'
        end>
      Index = 2
    end
  end
  object pnlPrincipal: TcxGroupBox
    Left = 0
    Top = 159
    Align = alClient
    PanelStyle.Active = True
    TabOrder = 5
    Height = 265
    Width = 685
  end
  object StatusBar: TdxRibbonStatusBar
    Left = 0
    Top = 424
    Width = 685
    Height = 23
    Images = dmImages.Imagenes
    Panels = <
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
        PanelStyle.ImageIndex = 35
        Width = 86
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
        PanelStyle.ImageIndex = 36
        Width = 166
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
        PanelStyle.ImageIndex = 15
        Width = 216
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.Alignment = taCenter
        PanelStyle.ImageIndex = 41
        Width = 80
      end
      item
        PanelStyleClassName = 'TdxStatusBarKeyboardStatePanelStyle'
        PanelStyle.KeyboardStates = [dxksCapsLock, dxksNumLock, dxksInsert]
        PanelStyle.CapsLockKeyAppearance.ActiveFontColor = clDefault
        PanelStyle.CapsLockKeyAppearance.ActiveCaption = 'MAY'
        PanelStyle.CapsLockKeyAppearance.InactiveCaption = 'MAY'
        PanelStyle.NumLockKeyAppearance.ActiveFontColor = clDefault
        PanelStyle.NumLockKeyAppearance.ActiveCaption = 'NUM'
        PanelStyle.NumLockKeyAppearance.InactiveCaption = 'NUM'
        PanelStyle.ScrollLockKeyAppearance.ActiveFontColor = clDefault
        PanelStyle.ScrollLockKeyAppearance.ActiveCaption = 'SCRL'
        PanelStyle.ScrollLockKeyAppearance.InactiveCaption = 'SCRL'
        PanelStyle.InsertKeyAppearance.ActiveFontColor = clDefault
        PanelStyle.InsertKeyAppearance.ActiveCaption = 'INS'
        PanelStyle.InsertKeyAppearance.InactiveCaption = 'INS'
      end
      item
        PanelStyleClassName = 'TdxStatusBarTextPanelStyle'
        PanelStyle.ImageIndex = 40
      end>
    Ribbon = Ribbon
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clDefault
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ExplicitLeft = -105
    ExplicitWidth = 790
  end
  object dxBarManager1: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      'PopupMenuPrincipal'
      'Catalogos'
      'Exportar'
      'Acciones')
    Categories.ItemsVisibles = (
      2
      2
      2
      2)
    Categories.Visibles = (
      True
      True
      True
      True)
    ImageOptions.Images = dmImages.MenuImages
    ImageOptions.LargeImages = dmImages.ToolBarImages
    ImageOptions.UseLargeImagesForLargeIcons = True
    LookAndFeel.NativeStyle = False
    MenuAnimations = maFade
    PopupMenuLinks = <>
    Style = bmsXP
    UseSystemFont = True
    OnClickItem = dxBarManager1ClickItem
    Left = 136
    Top = 272
    DockControlHeights = (
      0
      0
      0
      0)
    object tbCatalogos: TdxBar
      Caption = 'Cat'#225'logos'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 811
      FloatTop = 8
      FloatClientWidth = 129
      FloatClientHeight = 184
      ItemLinks = <
        item
          Visible = True
          ItemName = 'btnUsuarios'
        end
        item
          Visible = True
          ItemName = 'btnEstaciones'
        end
        item
          Visible = True
          ItemName = 'btnReprotes'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object tbExportar: TdxBar
      Caption = 'Exportar'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 811
      FloatTop = 8
      FloatClientWidth = 74
      FloatClientHeight = 230
      ItemLinks = <
        item
          Visible = True
          ItemName = 'btnExportar'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object tbRapida: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'Rapida'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 811
      FloatTop = 8
      FloatClientWidth = 51
      FloatClientHeight = 82
      ItemLinks = <
        item
          Visible = True
          ItemName = 'btnLogin'
        end
        item
          Visible = True
          ItemName = 'btnLogout'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'btnSalir'
        end>
      OneOnRow = True
      Row = 0
      ShowMark = False
      SizeGrip = False
      UseOwnFont = False
      UseRecentItems = False
      Visible = True
      WholeRow = False
    end
    object tbAcciones: TdxBar
      Caption = 'Acciones'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 811
      FloatTop = 8
      FloatClientWidth = 62
      FloatClientHeight = 433
      ItemLinks = <
        item
          Visible = True
          ItemName = 'btnNuevo'
        end
        item
          Visible = True
          ItemName = 'btnGuardar'
        end
        item
          Visible = True
          ItemName = 'btnCancelar'
        end
        item
          Visible = True
          ItemName = 'btnEliminar'
        end
        item
          Visible = True
          ItemName = 'btnProcesar'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'btnImprimir'
        end
        item
          Visible = True
          ItemName = 'btnFacturar'
        end
        item
          BeginGroup = True
          Visible = True
          ItemName = 'btnPrimer'
        end
        item
          Visible = True
          ItemName = 'btnAnteriior'
        end
        item
          Visible = True
          ItemName = 'btnActualizar'
        end
        item
          Visible = True
          ItemName = 'btnUltimo'
        end
        item
          Visible = True
          ItemName = 'btnSiguiente'
        end
        item
          Visible = True
          ItemName = 'btnBuscar'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object btnSalir: TdxBarButton
      Caption = '&Salir'
      Category = 0
      Hint = 'Salir'
      Visible = ivAlways
      ImageIndex = 0
      OnClick = btnSalirClick
    end
    object btnLogin: TdxBarButton
      Caption = '&Conectarse'
      Category = 0
      Hint = 'Conectarse'
      Visible = ivAlways
      ImageIndex = 2
      OnClick = btnLoginClick
    end
    object btnLogout: TdxBarButton
      Caption = '&Desconectarse'
      Category = 0
      Enabled = False
      Hint = 'Desconectarse'
      Visible = ivAlways
      ImageIndex = 1
      OnClick = btnLogoutClick
    end
    object btnUsuarios: TdxBarLargeButton
      Tag = 2
      Caption = 'Usuarios'
      Category = 1
      Enabled = False
      Hint = 'Usuarios'
      Visible = ivAlways
      LargeImageIndex = 12
    end
    object btnEstaciones: TdxBarLargeButton
      Tag = 3
      Caption = 'Estaciones'
      Category = 1
      Enabled = False
      Hint = 'Estaciones'
      Visible = ivAlways
      LargeImageIndex = 16
    end
    object btnReprotes: TdxBarLargeButton
      Tag = 4
      Caption = 'Reportes'
      Category = 1
      Enabled = False
      Hint = 'Reportes'
      Visible = ivAlways
      LargeImageIndex = 15
    end
    object btnExportar: TdxBarLargeButton
      Tag = 1
      Caption = 'Exportar'
      Category = 2
      Enabled = False
      Hint = 'Exportar'
      Visible = ivAlways
      LargeImageIndex = 33
    end
    object btnNuevo: TdxBarLargeButton
      Action = dmAppActions.actNuevo
      Category = 3
    end
    object btnGuardar: TdxBarLargeButton
      Action = dmAppActions.actGuardar
      Category = 3
    end
    object btnCancelar: TdxBarLargeButton
      Action = dmAppActions.actCancelar
      Category = 3
    end
    object btnImprimir: TdxBarLargeButton
      Action = dmAppActions.actImprimir
      Category = 3
    end
    object btnCortar: TdxBarButton
      Category = 3
      Visible = ivAlways
    end
    object btnCopiar: TdxBarButton
      Category = 3
      Visible = ivAlways
    end
    object btnPegar: TdxBarButton
      Category = 3
      Visible = ivAlways
    end
    object btnEliminar: TdxBarLargeButton
      Action = dmAppActions.actEliminar
      Category = 3
    end
    object btnPrimer: TdxBarButton
      Action = dmAppActions.actPrimer
      Category = 3
    end
    object btnAnteriior: TdxBarButton
      Action = dmAppActions.actAnterior
      Category = 3
    end
    object btnSiguiente: TdxBarButton
      Action = dmAppActions.actSiguiente
      Category = 3
    end
    object btnUltimo: TdxBarButton
      Action = dmAppActions.actUltimo
      Category = 3
    end
    object btnActualizar: TdxBarButton
      Action = dmAppActions.actActualizar
      Category = 3
    end
    object btnBuscar: TdxBarButton
      Action = dmAppActions.actBuscar
      Category = 3
    end
    object btnProcesar: TdxBarLargeButton
      Action = dmAppActions.actProcesar
      Category = 3
    end
    object btnFacturar: TdxBarLargeButton
      Action = dmAppActions.actExportar
      Category = 3
    end
  end
  object tmrPrincipal: TTimer
    OnTimer = tmrPrincipalTimer
    Left = 240
    Top = 208
  end
end
