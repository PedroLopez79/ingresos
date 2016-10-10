object dmAppActions: TdmAppActions
  OldCreateOrder = False
  Height = 340
  Width = 372
  object ActionManager: TActionManager
    Images = dmImages.ToolBarImages
    OnExecute = ActionManagerExecute
    Left = 56
    Top = 64
    StyleName = 'XP Style'
    object actNuevo: TAction
      Category = 'Catalogo'
      Caption = 'Nuevo'
      Hint = 'Nuevo Registro'
      ImageIndex = 25
      ShortCut = 16462
      Visible = False
    end
    object actGuardar: TAction
      Category = 'Catalogo'
      Caption = 'Guardar'
      Hint = 'Guardar los cambios'
      ImageIndex = 23
      ShortCut = 16455
      Visible = False
    end
    object actCancelar: TAction
      Category = 'Catalogo'
      Caption = 'Cancelar'
      Hint = 'Cancelar los cambios'
      ImageIndex = 27
      ShortCut = 16449
      Visible = False
    end
    object actActualizar: TAction
      Category = 'Catalogo'
      Caption = 'Actualizar'
      Hint = 'Actualizar la informaci'#243'n'
      ImageIndex = 12
      ShortCut = 116
      Visible = False
    end
    object actEliminar: TAction
      Category = 'Catalogo'
      Caption = 'Eliminar'
      Hint = 'Eliminar el registro actual'
      ImageIndex = 24
      ShortCut = 8238
      Visible = False
    end
    object actPrimer: TAction
      Category = 'Catalogo'
      Caption = 'Primer'
      Hint = 'Primer registro'
      ImageIndex = 7
      Visible = False
    end
    object actAnterior: TAction
      Category = 'Catalogo'
      Caption = 'Anterior'
      Hint = 'Registro anterior'
      ImageIndex = 8
      Visible = False
    end
    object actSiguiente: TAction
      Category = 'Catalogo'
      Caption = 'Siguiente'
      Hint = 'Siguiente registro'
      ImageIndex = 9
      Visible = False
    end
    object actUltimo: TAction
      Category = 'Catalogo'
      Caption = 'Ultimo'
      Hint = 'Ultimo registro'
      ImageIndex = 10
      Visible = False
    end
    object actImprimir: TAction
      Category = 'Catalogo'
      Caption = 'Imprimir'
      ImageIndex = 15
      ShortCut = 16464
      Visible = False
    end
    object actBuscar: TAction
      Category = 'Catalogo'
      Caption = 'Buscar'
      ImageIndex = 11
      ShortCut = 16450
      Visible = False
    end
    object actProcesar: TAction
      Category = 'Catalogo'
      Caption = 'Procesar'
      ImageIndex = 35
    end
    object actCalculadora: TAction
      Category = 'CistemGas'
      Caption = 'Calculadora'
      ImageIndex = 36
    end
    object actPropiedadesBomba: TAction
      Category = 'Catalogo'
      Caption = 'Propiedades de la bomba'
      ImageIndex = 39
    end
    object actCortar: TAction
      Category = 'Catalogo'
      Caption = 'Cortar'
      ImageIndex = 41
    end
    object actParcial: TAction
      Category = 'Catalogo'
      Caption = 'Parcial'
      ImageIndex = 10
    end
    object actProcesarVentas: TAction
      Category = 'Catalogo'
      Caption = 'Procesar Ventas'
      ImageIndex = 10
    end
    object actCerrarLiquidacion: TAction
      Category = 'Catalogo'
      Caption = 'Cerrar Liquidaci'#243'n'
      ImageIndex = 17
    end
    object actRelacionar: TAction
      Category = 'CistemGas'
      Caption = 'Relacionar'
      ImageIndex = 3
    end
    object actFacturar: TAction
      Category = 'Catalogo'
      Caption = 'Facturar'
      ImageIndex = 9
    end
    object actImportar: TAction
      Category = 'CistemGas'
      Caption = 'Importar'
      ImageIndex = 29
    end
    object actExportar: TAction
      Category = 'CistemGas'
      Caption = 'Exportar'
      ImageIndex = 33
    end
    object actDiferenciaInventario: TAction
      Category = 'Catalogo'
      Caption = 'Diferencia de Inventario'
      ImageIndex = 8
    end
    object actResumenVentas: TAction
      Category = 'Catalogo'
      Caption = 'Resumen de Ventas'
      ImageIndex = 10
    end
  end
end
