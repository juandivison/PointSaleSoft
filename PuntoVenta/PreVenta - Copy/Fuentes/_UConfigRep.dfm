object frmConfReporte: TfrmConfReporte
  Left = 244
  Top = 119
  Width = 608
  Height = 488
  Caption = 'Configurar Reporte'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 345
    Width = 101
    Height = 13
    Caption = 'Pie de pagina factura'
  end
  object rdgRecibo: TRadioGroup
    Left = 16
    Top = 5
    Width = 169
    Height = 65
    Caption = 'Recibo'
    Items.Strings = (
      'Impresora Punto Venta'
      'Impresora Matricial 8.5 x 5.5')
    TabOrder = 0
  end
  object rdgFactura: TRadioGroup
    Left = 192
    Top = 5
    Width = 177
    Height = 65
    Caption = 'Factura'
    Items.Strings = (
      'Impresora Punto Venta'
      'Impresora Matricial 8.5 x 5.5')
    TabOrder = 1
  end
  object rdgCotizacion: TRadioGroup
    Left = 384
    Top = 5
    Width = 201
    Height = 65
    Caption = 'Cotizacion'
    Items.Strings = (
      'Impresora Punto Venta'
      'Impresora Matricial 8.5 x 5.5')
    TabOrder = 2
  end
  object BitBtn1: TBitBtn
    Left = 175
    Top = 401
    Width = 106
    Height = 35
    Caption = '&Guardar'
    TabOrder = 3
    OnClick = BitBtn1Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
      7700333333337777777733333333008088003333333377F73377333333330088
      88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
      000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
      FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
      99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
      99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
      99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
      93337FFFF7737777733300000033333333337777773333333333}
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 304
    Top = 402
    Width = 105
    Height = 34
    Caption = '&Salir'
    TabOrder = 4
    Kind = bkClose
  end
  object rdgSolDatosCliente: TRadioGroup
    Left = 16
    Top = 108
    Width = 169
    Height = 42
    Caption = 'Solicitar Datos Cliente venta cash'
    Columns = 2
    ItemIndex = 1
    Items.Strings = (
      'Si'
      'No')
    TabOrder = 5
  end
  object rdgImpNCFConsFinal: TRadioGroup
    Left = 384
    Top = 108
    Width = 201
    Height = 40
    Caption = 'Imp NCF Cons final en Venta Cash'
    Columns = 2
    Items.Strings = (
      'Si'
      'No')
    TabOrder = 6
  end
  object edtPiedePaginaFactura: TEdit
    Left = 8
    Top = 361
    Width = 369
    Height = 21
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    Text = 
      'Un Conjunto de Soluciones En Un Mismo Lugar Con Seguridad y Conf' +
      'ianza'
  end
  object rdgSolicitaDatosVeh: TRadioGroup
    Left = 192
    Top = 108
    Width = 177
    Height = 41
    Caption = 'Solicita Datos Veh'#237'culo'
    Columns = 2
    Items.Strings = (
      'Si'
      'No')
    TabOrder = 8
  end
  object rdgFechaVenc: TRadioGroup
    Left = 16
    Top = 153
    Width = 169
    Height = 41
    Caption = 'Mostrar Fecha Venc en Labels'
    Columns = 2
    Items.Strings = (
      'Si'
      'No')
    TabOrder = 9
  end
  object rdgMostrarPrecCodigo: TRadioGroup
    Left = 192
    Top = 153
    Width = 177
    Height = 41
    Caption = 'Mostrar precio en codigo'
    Columns = 2
    Items.Strings = (
      'Si'
      'No')
    TabOrder = 10
  end
  object rdgModificaPrecio: TRadioGroup
    Left = 384
    Top = 153
    Width = 201
    Height = 41
    Caption = 'Modifica Precio en Venta'
    Columns = 2
    Items.Strings = (
      'Si'
      'No')
    TabOrder = 11
  end
  object rdImpFact8x11: TRadioGroup
    Left = 192
    Top = 72
    Width = 177
    Height = 35
    Caption = 'Imprime Fact en 8"x11"'
    Columns = 2
    Items.Strings = (
      'Si'
      'No')
    TabOrder = 12
  end
  object rdImpCotiza8x11: TRadioGroup
    Left = 384
    Top = 72
    Width = 201
    Height = 34
    Caption = 'Imprime Cotizacion  en 8"x11"'
    Columns = 2
    Items.Strings = (
      'Si'
      'No')
    TabOrder = 13
  end
  object rdgVentaConCodBarra: TRadioGroup
    Left = 16
    Top = 71
    Width = 169
    Height = 35
    Caption = 'Procesa Venta codigo barra'
    Columns = 2
    Items.Strings = (
      'Si'
      'No')
    TabOrder = 14
  end
  object chkBoxGlbImpCodProducto: TCheckBox
    Left = 8
    Top = 325
    Width = 169
    Height = 17
    Caption = 'Imprime CodProd en recibo'
    TabOrder = 15
  end
  object rdgIncluirITBISenPrecioLabel: TRadioGroup
    Left = 16
    Top = 197
    Width = 169
    Height = 41
    Caption = 'Incluir ITBIS en precio Label'
    Columns = 2
    Items.Strings = (
      'Si'
      'No')
    TabOrder = 16
  end
  object rdgPrecioMayRegOrden: TRadioGroup
    Left = 192
    Top = 196
    Width = 185
    Height = 41
    Caption = 'Conf. Precio Mayorista en Reg.Orden'
    Columns = 2
    Items.Strings = (
      'Si'
      'No')
    TabOrder = 17
  end
  object rdgPermiteVentaInv0: TRadioGroup
    Left = 384
    Top = 195
    Width = 201
    Height = 41
    Caption = 'Permite venta con Inventario cero'
    Columns = 2
    Items.Strings = (
      'Si'
      'No')
    TabOrder = 18
  end
  object chboxPermiteUnaInstancia: TCheckBox
    Left = 184
    Top = 325
    Width = 185
    Height = 17
    Caption = 'Permite Una sola instancia'
    TabOrder = 19
  end
  object rdgImprimirReciboSinPreguntar: TRadioGroup
    Left = 16
    Top = 279
    Width = 169
    Height = 41
    Caption = 'Imprimir recibo sin preguntar'
    Columns = 2
    Items.Strings = (
      'Si'
      'No')
    TabOrder = 20
  end
  object rdgVenderDesdeAlmacenP: TRadioGroup
    Left = 16
    Top = 237
    Width = 169
    Height = 41
    Caption = 'Vender desde Almacen Principal'
    Columns = 2
    Items.Strings = (
      'Si'
      'No')
    TabOrder = 21
  end
  object rdgSolicitaNumLote: TRadioGroup
    Left = 192
    Top = 238
    Width = 185
    Height = 40
    Caption = 'Solicita NumLote'
    Columns = 2
    Items.Strings = (
      'Si'
      'No')
    TabOrder = 22
  end
  object rdgFacturaLicoreria: TRadioGroup
    Left = 383
    Top = 238
    Width = 201
    Height = 41
    Caption = 'Fact Licoreria 5.5'
    Columns = 2
    Items.Strings = (
      'Si'
      'No')
    TabOrder = 23
  end
  object rdgAplicaTransparentaitbi: TRadioGroup
    Left = 192
    Top = 279
    Width = 185
    Height = 41
    Caption = 'Aplica 13.79 transparentar ITBIS'
    Columns = 2
    Items.Strings = (
      'Si'
      'No')
    TabOrder = 24
  end
  object rdgImprimeReciboFact: TRadioGroup
    Left = 383
    Top = 279
    Width = 201
    Height = 41
    Caption = 'Imprime Recibo/Factura'
    Columns = 2
    Items.Strings = (
      'Si'
      'No')
    TabOrder = 25
    Visible = False
  end
end
