object frmConfReporte: TfrmConfReporte
  Left = 434
  Top = 139
  Width = 947
  Height = 744
  Caption = 'Configurar Reporte'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 17
    Top = 594
    Width = 101
    Height = 13
    Caption = 'Pie de pagina factura'
  end
  object Label2: TLabel
    Left = 384
    Top = 331
    Width = 48
    Height = 13
    Caption = 'IDInvProd'
  end
  object Label3: TLabel
    Left = 440
    Top = 352
    Width = 32
    Height = 13
    Caption = 'Label3'
    Visible = False
  end
  object Label4: TLabel
    Left = 490
    Top = 436
    Width = 91
    Height = 13
    Caption = 'Cobro Mensualidad'
  end
  object Label5: TLabel
    Left = 441
    Top = 538
    Width = 31
    Height = 13
    Caption = 'Ancho'
    Visible = False
  end
  object Label6: TLabel
    Left = 565
    Top = 530
    Width = 18
    Height = 13
    Caption = 'Alto'
    Visible = False
  end
  object Label7: TLabel
    Left = 16
    Top = 480
    Width = 300
    Height = 16
    Caption = 'Indicar ruta herramienta para impresion ticket fiscal'
    Color = clSilver
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Visible = False
  end
  object Label8: TLabel
    Left = 592
    Top = 160
    Width = 138
    Height = 13
    Caption = 'Ejecutable para enviar emails'
  end
  object Label9: TLabel
    Left = 463
    Top = 485
    Width = 49
    Height = 13
    Caption = 'FConduce'
  end
  object Label10: TLabel
    Left = 386
    Top = 61
    Width = 53
    Height = 13
    Caption = 'Formato5.5'
  end
  object Label11: TLabel
    Left = 680
    Top = 535
    Width = 36
    Height = 13
    Hint = 'Clientes con cantidad de dias sin venta'
    Caption = 'DSVTA'
    ParentShowHint = False
    ShowHint = True
  end
  object Label12: TLabel
    Left = 800
    Top = 125
    Width = 76
    Height = 13
    Caption = 'Porciento Venta'
  end
  object Label13: TLabel
    Left = 16
    Top = 440
    Width = 143
    Height = 16
    Caption = 'Indicar ruta WisPro Tool'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label14: TLabel
    Left = 680
    Top = 558
    Width = 32
    Height = 13
    Hint = 'Indique cantidad de copias para ticket'
    Caption = 'Copias'
    ParentShowHint = False
    ShowHint = True
  end
  object Label15: TLabel
    Left = 425
    Top = 578
    Width = 52
    Height = 13
    Caption = 'Ruta Label'
  end
  object Label16: TLabel
    Left = 428
    Top = 604
    Width = 44
    Height = 13
    Caption = 'Cia Label'
  end
  object Label17: TLabel
    Left = 606
    Top = 605
    Width = 72
    Height = 13
    Caption = 'Monto Max Vta'
  end
  object Label18: TLabel
    Left = 16
    Top = 521
    Width = 69
    Height = 13
    Caption = 'Ruta eCF Tool'
  end
  object Label19: TLabel
    Left = 18
    Top = 559
    Width = 64
    Height = 13
    Caption = 'Ruta QR eCF'
  end
  object Label20: TLabel
    Left = 481
    Top = 680
    Width = 58
    Height = 13
    Caption = 'PC CajaECF'
  end
  object Label21: TLabel
    Left = 17
    Top = 482
    Width = 70
    Height = 13
    Caption = 'Ruta Idesi2Ecf'
  end
  object rdgRecibo: TRadioGroup
    Left = 16
    Top = 5
    Width = 169
    Height = 49
    Caption = 'Recibo'
    Items.Strings = (
      'Impresora Punto Venta'
      'Impresora Matricial 8.5 x 5.5')
    TabOrder = 0
  end
  object rdgFactura: TRadioGroup
    Left = 192
    Top = 5
    Width = 185
    Height = 49
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
    Height = 49
    Caption = 'Cotizacion'
    Items.Strings = (
      'Impresora Punto Venta'
      'Impresora Matricial 8.5 x 5.5')
    TabOrder = 2
  end
  object BitBtn1: TBitBtn
    Left = 167
    Top = 641
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
    Left = 296
    Top = 642
    Width = 105
    Height = 34
    Caption = '&Salir'
    TabOrder = 4
    Kind = bkClose
  end
  object rdgSolDatosCliente: TRadioGroup
    Left = 16
    Top = 116
    Width = 169
    Height = 32
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
    Top = 114
    Width = 201
    Height = 32
    Caption = 'Imp NCF Cons final en Venta Cash'
    Columns = 2
    Items.Strings = (
      'Si'
      'No')
    TabOrder = 6
  end
  object edtPiedePaginaFactura: TEdit
    Left = 17
    Top = 610
    Width = 365
    Height = 21
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    Text = 'Gracias por su compra!'
  end
  object rdgSolicitaDatosVeh: TRadioGroup
    Left = 192
    Top = 115
    Width = 185
    Height = 32
    Caption = 'Solicita Datos Veh'#237'culo'
    Columns = 2
    Items.Strings = (
      'Si'
      'No')
    TabOrder = 8
  end
  object rdgFechaVenc: TRadioGroup
    Left = 16
    Top = 148
    Width = 169
    Height = 32
    Caption = 'Mostrar Fecha Venc en Labels'
    Columns = 2
    Items.Strings = (
      'Si'
      'No')
    TabOrder = 9
  end
  object rdgMostrarPrecCodigo: TRadioGroup
    Left = 192
    Top = 148
    Width = 185
    Height = 32
    Caption = 'Mostrar precio en codigo'
    Columns = 2
    Items.Strings = (
      'Si'
      'No')
    TabOrder = 10
  end
  object rdgModificaPrecio: TRadioGroup
    Left = 384
    Top = 147
    Width = 201
    Height = 32
    Caption = 'Modifica Precio en Venta'
    Columns = 2
    Items.Strings = (
      'Si'
      'No')
    TabOrder = 11
  end
  object rdImpFact8x11: TRadioGroup
    Left = 192
    Top = 83
    Width = 185
    Height = 32
    Caption = 'Imprime Fact en 8"x11"'
    Columns = 2
    Items.Strings = (
      'Si'
      'No')
    TabOrder = 12
  end
  object rdImpCotiza8x11: TRadioGroup
    Left = 384
    Top = 83
    Width = 201
    Height = 32
    Caption = 'Imprime Cotizacion  en 8"x11"'
    Columns = 2
    Items.Strings = (
      'Si'
      'No')
    TabOrder = 13
  end
  object rdgVentaConCodBarra: TRadioGroup
    Left = 16
    Top = 83
    Width = 169
    Height = 32
    Caption = 'Procesa Venta codigo barra'
    Columns = 2
    Items.Strings = (
      'Si'
      'No')
    TabOrder = 14
  end
  object chkBoxGlbImpCodProducto: TCheckBox
    Left = 17
    Top = 377
    Width = 150
    Height = 17
    Caption = 'Imprime CodProd en recibo'
    TabOrder = 15
  end
  object rdgIncluirITBISenPrecioLabel: TRadioGroup
    Left = 16
    Top = 181
    Width = 169
    Height = 32
    Caption = 'Incluir ITBIS en precio Label'
    Columns = 2
    Items.Strings = (
      'Si'
      'No')
    TabOrder = 16
  end
  object rdgPrecioMayRegOrden: TRadioGroup
    Left = 192
    Top = 182
    Width = 185
    Height = 33
    Caption = 'Conf. Precio Mayorista en Reg.Orden'
    Columns = 2
    Items.Strings = (
      'Si'
      'No')
    TabOrder = 17
  end
  object rdgPermiteVentaInv0: TRadioGroup
    Left = 384
    Top = 180
    Width = 201
    Height = 34
    Caption = 'Permite venta con Inventario cero'
    Columns = 2
    Items.Strings = (
      'Si'
      'No')
    TabOrder = 18
  end
  object chboxPermiteUnaInstancia: TCheckBox
    Left = 192
    Top = 404
    Width = 148
    Height = 17
    Caption = 'Permite Una sola instancia'
    TabOrder = 19
  end
  object rdgImprimirReciboSinPreguntar: TRadioGroup
    Left = 16
    Top = 253
    Width = 169
    Height = 36
    Caption = 'Imprimir recibo sin preguntar'
    Columns = 2
    Items.Strings = (
      'Si'
      'No')
    TabOrder = 20
  end
  object rdgVenderDesdeAlmacenP: TRadioGroup
    Left = 16
    Top = 215
    Width = 169
    Height = 35
    Caption = 'Vender desde Almacen Principal'
    Columns = 2
    Items.Strings = (
      'Si'
      'No')
    TabOrder = 21
  end
  object rdgSolicitaNumLote: TRadioGroup
    Left = 192
    Top = 216
    Width = 185
    Height = 35
    Caption = 'Solicita NumLote'
    Columns = 2
    Items.Strings = (
      'Si'
      'No')
    TabOrder = 22
  end
  object rdgFacturaLicoreria: TRadioGroup
    Left = 384
    Top = 215
    Width = 201
    Height = 34
    Caption = 'Fact Licoreria 5.5'
    Columns = 2
    Items.Strings = (
      'Si'
      'No')
    TabOrder = 23
  end
  object rdgAplicaTransparentaitbi: TRadioGroup
    Left = 192
    Top = 250
    Width = 185
    Height = 38
    Caption = 'Aplica i/1.iTransparentar ITBIS'
    Columns = 2
    Items.Strings = (
      'Si'
      'No')
    TabOrder = 24
  end
  object rdgImprimeReciboFact: TRadioGroup
    Left = 384
    Top = 248
    Width = 201
    Height = 41
    Caption = 'Imprime Recibo/Factura'
    Columns = 2
    Items.Strings = (
      'Si'
      'No')
    TabOrder = 25
  end
  object rdgGlbFirmaCajero: TRadioGroup
    Left = 384
    Top = 291
    Width = 201
    Height = 32
    Caption = 'Pie de Pag/Factura'
    Columns = 2
    Items.Strings = (
      'Si'
      'No')
    TabOrder = 26
  end
  object edtIdAlmacen: TEdit
    Left = 440
    Top = 328
    Width = 41
    Height = 21
    Hint = 'Id inventario produccion -Usado para  procesos Panaderia'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 27
  end
  object BitBtn3: TBitBtn
    Left = 487
    Top = 326
    Width = 97
    Height = 23
    Hint = 'Id inventario produccion -Usado para  procesos Panaderia'
    Caption = '&Asigar ID Almacen'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 28
    OnClick = BitBtn3Click
  end
  object rdgImpTipoUnidadRecibo: TRadioGroup
    Left = 16
    Top = 333
    Width = 169
    Height = 35
    Caption = 'Imprime Tipo Unidad en Recibo'
    Columns = 2
    Items.Strings = (
      'Si'
      'No')
    TabOrder = 29
  end
  object chkActivaMenuPan: TCheckBox
    Left = 192
    Top = 387
    Width = 145
    Height = 17
    Caption = 'Activa Menu Panificadora'
    TabOrder = 30
  end
  object chkActivaCafeteria: TCheckBox
    Left = 192
    Top = 371
    Width = 67
    Height = 16
    Caption = 'Cafeteria'
    TabOrder = 31
  end
  object chkColegio: TCheckBox
    Left = 266
    Top = 371
    Width = 58
    Height = 15
    Caption = 'Colegio'
    TabOrder = 32
  end
  object dtpkCobroMensualidad: TDateTimePicker
    Left = 479
    Top = 454
    Width = 105
    Height = 21
    Date = 41187.948578912040000000
    Time = 41187.948578912040000000
    TabOrder = 33
  end
  object rdgMuestraInteresFactfina: TRadioGroup
    Left = 16
    Top = 292
    Width = 169
    Height = 31
    Caption = 'Muestra Interes en Fact Financ'
    Columns = 2
    Items.Strings = (
      'Si'
      'No')
    TabOrder = 34
  end
  object rdgUsaEscalaPrecio: TRadioGroup
    Left = 192
    Top = 293
    Width = 185
    Height = 31
    Caption = 'Usar escala precio 1-4 en ventas'
    Color = 13171120
    Columns = 2
    Items.Strings = (
      'Si'
      'No')
    ParentColor = False
    TabOrder = 35
  end
  object chboxLavanderia: TCheckBox
    Left = 376
    Top = 367
    Width = 74
    Height = 17
    Caption = 'Lavanderia'
    TabOrder = 36
  end
  object CheckBox1: TCheckBox
    Left = 192
    Top = 420
    Width = 153
    Height = 17
    Caption = 'Escale Screen Resolusion'
    TabOrder = 37
  end
  object edtAncho: TEdit
    Left = 479
    Top = 530
    Width = 73
    Height = 21
    TabOrder = 38
    Visible = False
  end
  object edtAlto: TEdit
    Left = 599
    Top = 530
    Width = 73
    Height = 21
    TabOrder = 39
    Visible = False
  end
  object chboxServicioComisionable: TCheckBox
    Left = 455
    Top = 368
    Width = 131
    Height = 17
    Hint = 'Permite registrar servicios a comision en  ventas.'
    Caption = 'Servicios Comisionable'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 40
  end
  object rdgActivaIFiscal: TRadioGroup
    Left = 384
    Top = 396
    Width = 122
    Height = 33
    Caption = 'Activa Impresora Fiscal'
    Color = 16441811
    Columns = 2
    Items.Strings = (
      'Si'
      'No')
    ParentColor = False
    TabOrder = 41
  end
  object rdgConduce: TRadioGroup
    Left = 758
    Top = 72
    Width = 164
    Height = 44
    Caption = 'Conduce a'
    Columns = 2
    Items.Strings = (
      'Factura'
      'Cotizacion')
    TabOrder = 42
  end
  object chkImpBoucher: TCheckBox
    Left = 592
    Top = 132
    Width = 193
    Height = 17
    Caption = 'Imprime Baucher en Titulo Conduce'
    TabOrder = 43
  end
  object edtIFistaltool: TEdit
    Left = 16
    Top = 498
    Width = 369
    Height = 21
    TabOrder = 44
  end
  object edtEmailTool: TEdit
    Left = 592
    Top = 178
    Width = 185
    Height = 21
    TabOrder = 45
    Text = 'IdesiToolComm.exe'
  end
  object RadioGroup1: TRadioGroup
    Left = 592
    Top = 204
    Width = 193
    Height = 34
    Hint = 
      'Monto es igual a Multiplicar precio por Cant tipo unidad'#13#10'Ejmp 1' +
      ' Docena = 12,   Cant = 3 * 12 = 36'
    Caption = 'Mult Cat x CantTipoUnidad'
    Color = 13171120
    Columns = 2
    Items.Strings = (
      'Si'
      'No')
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 46
    OnClick = RadioGroup1Click
  end
  object RadioGroup2: TRadioGroup
    Left = 592
    Top = 240
    Width = 193
    Height = 34
    Hint = 
      'Monto es igual a Multiplicar precio por Cant tipo unidad'#13#10'Ejmp 1' +
      ' Docena = 12,   Cant = 3 * 12 = 36'
    Caption = 'Usa precio por Cant Estandard'
    Columns = 2
    Items.Strings = (
      'Si'
      'No')
    ParentShowHint = False
    ShowHint = True
    TabOrder = 47
    OnClick = RadioGroup2Click
  end
  object chkGuardaPDF: TCheckBox
    Left = 592
    Top = 435
    Width = 129
    Height = 17
    Hint = 'Guarda recibos y facturas en formato PDF en el Folder Informes'
    Caption = 'Guardar Docs PDF'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 48
    OnClick = chkGuardaPDFClick
  end
  object rdgPUnidadLevel: TRadioGroup
    Left = 592
    Top = 279
    Width = 193
    Height = 34
    Hint = 'Aplica ITBIS a precio de Venta en Precio x Cant Unidad'
    Caption = 'Suma ITBIS a Precio X Unidad'
    Columns = 2
    Items.Strings = (
      'Si'
      'No')
    ParentShowHint = False
    ShowHint = True
    TabOrder = 49
    OnClick = rdgPUnidadLevelClick
  end
  object rdgPrecioMayoristaXUnidad: TRadioGroup
    Left = 592
    Top = 320
    Width = 193
    Height = 31
    Hint = 'Precio Mayorista X Unidad'
    Caption = 'Precio Mayorista X Unidad'
    Columns = 2
    Items.Strings = (
      'Si'
      'No')
    ParentShowHint = False
    ShowHint = True
    TabOrder = 50
    OnClick = rdgPrecioMayoristaXUnidadClick
  end
  object rcgActivaSecNCF_B: TRadioGroup
    Left = 592
    Top = 354
    Width = 193
    Height = 30
    Hint = 'Activar uso de Secuencia NCF B'
    Caption = 'Activa Secuencia NCF B'
    Columns = 2
    Items.Strings = (
      'Si'
      'No')
    ParentShowHint = False
    ShowHint = True
    TabOrder = 51
    OnClick = rdgPrecioMayoristaXUnidadClick
  end
  object rdgImpReciboPdf: TRadioGroup
    Left = 592
    Top = 397
    Width = 195
    Height = 33
    Caption = 'Imp Recibo en PDF'
    Columns = 2
    Items.Strings = (
      'Si'
      'No')
    TabOrder = 52
    OnClick = rdgImpReciboPdfClick
  end
  object rdgAvisoProdVencido: TRadioGroup
    Left = 16
    Top = 400
    Width = 168
    Height = 33
    Caption = 'Aviso Prod Vencido en Vta'
    Columns = 2
    Items.Strings = (
      'Si'
      'No')
    TabOrder = 53
  end
  object rdgInfoProvCosto: TRadioGroup
    Left = 592
    Top = 453
    Width = 185
    Height = 30
    Caption = 'Info Costo/Prov en venta'
    Columns = 2
    Items.Strings = (
      'Si'
      'No')
    TabOrder = 54
  end
  object rdgMuestraCodCteFct: TRadioGroup
    Left = 192
    Top = 333
    Width = 185
    Height = 35
    Caption = 'Mostrar C'#243'digo Cliente en Factura'
    Columns = 2
    Items.Strings = (
      'Si'
      'No')
    TabOrder = 55
  end
  object rdgAplicaOferta: TRadioGroup
    Left = 592
    Top = 486
    Width = 185
    Height = 36
    Caption = 'Aplica Ofertas en Venta?'
    Columns = 2
    Items.Strings = (
      'Si'
      'No')
    TabOrder = 56
  end
  object edtFConduce: TEdit
    Left = 516
    Top = 481
    Width = 66
    Height = 21
    Hint = 
      '555 - Formato Fact Esp Cxc Restaurant o Inmobiliaria'#13#10'444 - Form' +
      'ato Conduce Matisa, Factura Embotelladora Agua'#13#10'333 - Formato co' +
      'nduce Elias Comunicaciones'#13#10'Blanco - Formato Conduce Repuesto'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 57
  end
  object rdgFomatoOrdDespAlmc: TRadioGroup
    Left = 592
    Top = 83
    Width = 164
    Height = 30
    Caption = 'Imprime Orden Almacen en POS'
    Columns = 2
    Items.Strings = (
      'Si'
      'No')
    ParentShowHint = False
    ShowHint = True
    TabOrder = 58
  end
  object frgFormatoCuadre: TRadioGroup
    Left = 16
    Top = 53
    Width = 166
    Height = 30
    Caption = 'Formato Cuadre'
    Columns = 2
    Items.Strings = (
      'Punto Venta'
      'F.8.5 x11')
    TabOrder = 59
  end
  object chkCalcComisionXCanVta: TCheckBox
    Left = 480
    Top = 555
    Width = 153
    Height = 17
    Caption = 'Calc Comision X Cant Venta'
    TabOrder = 60
  end
  object chkImpTicketVenta: TCheckBox
    Left = 15
    Top = 635
    Width = 97
    Height = 17
    Caption = 'Imp Ticket Vta'
    TabOrder = 61
  end
  object rdgCalItbis: TRadioGroup
    Left = 510
    Top = 396
    Width = 78
    Height = 33
    Hint = 'Activa o desactiva calculo de itbis'
    Caption = 'Calc ITBIS'
    Columns = 2
    Items.Strings = (
      'Si'
      'No')
    TabOrder = 62
  end
  object edtFormatoCoti: TEdit
    Left = 446
    Top = 59
    Width = 139
    Height = 21
    Hint = 'COTI5.5EST, COTI5.5RESP'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 63
    Text = 'COTI5.5EST'
  end
  object rdgConduceCte: TRadioGroup
    Left = 386
    Top = 442
    Width = 89
    Height = 33
    Caption = '#Conduce Cte'
    Columns = 2
    Items.Strings = (
      'Si'
      'No')
    TabOrder = 64
  end
  object edtDiasSinVtas: TEdit
    Left = 720
    Top = 528
    Width = 57
    Height = 21
    TabOrder = 65
    Text = '7'
  end
  object cboxFarmacia: TCheckBox
    Left = 15
    Top = 653
    Width = 74
    Height = 17
    Caption = 'Farmacia'
    TabOrder = 67
    OnClick = cboxFarmaciaClick
    OnExit = cboxFarmaciaExit
  end
  object edtPorcVenta: TEdit
    Left = 800
    Top = 141
    Width = 65
    Height = 21
    TabOrder = 68
    Text = '30'
  end
  object rdgActivaInmobiliaria: TRadioGroup
    Left = 800
    Top = 173
    Width = 113
    Height = 34
    Caption = 'Activa Inmobiliaria'
    Columns = 2
    Items.Strings = (
      'Si'
      'No')
    ParentShowHint = False
    ShowHint = True
    TabOrder = 69
    OnClick = RadioGroup1Click
  end
  object rdgFactSeguro: TRadioGroup
    Left = 800
    Top = 221
    Width = 110
    Height = 40
    Caption = 'Factura Seguros'
    Columns = 2
    Items.Strings = (
      'Si'
      'No')
    TabOrder = 70
    OnClick = rdgFactSeguroClick
  end
  object chkboxUsaFctMexico: TCheckBox
    Left = 800
    Top = 269
    Width = 104
    Height = 17
    Caption = 'Usa Fact Mexico'
    TabOrder = 71
  end
  object edtRutaWisPro: TEdit
    Left = 16
    Top = 457
    Width = 368
    Height = 21
    TabOrder = 72
  end
  object rdgShowLIneaReciboVenta: TRadioGroup
    Left = 800
    Top = 293
    Width = 110
    Height = 40
    Caption = 'Linea en Recibo Det'
    Columns = 2
    Items.Strings = (
      'Si'
      'No')
    TabOrder = 73
    OnClick = rdgFactSeguroClick
  end
  object rdgECom: TRadioGroup
    Left = 800
    Top = 341
    Width = 110
    Height = 40
    Caption = 'ECOM?'
    Columns = 2
    Items.Strings = (
      'Si'
      'No')
    TabOrder = 74
    OnClick = rdgEComClick
  end
  object rdgReciboCxc: TRadioGroup
    Left = 592
    Top = 5
    Width = 201
    Height = 49
    Caption = 'Recibo Cxc'
    Items.Strings = (
      'Impresora Punto Venta'
      'Impresora Matricial 8.5 x 5.5')
    TabOrder = 75
  end
  object rdgMutur: TRadioGroup
    Left = 800
    Top = 389
    Width = 109
    Height = 40
    Caption = 'Mutur?'
    Columns = 2
    Items.Strings = (
      'Si'
      'No')
    TabOrder = 76
    OnClick = rdgMuturClick
  end
  object rdgGlbImpFormatoPDF: TRadioGroup
    Left = 800
    Top = 472
    Width = 113
    Height = 41
    Hint = 
      'Imprir en formato PDF cuando la factura es muy grande en punto d' +
      'e venta'
    Caption = 'Imp Rec/Fac PDF'
    Columns = 2
    Items.Strings = (
      'Si'
      'No')
    ParentShowHint = False
    ShowHint = True
    TabOrder = 77
    OnClick = rdgGlbImpFormatoPDFClick
  end
  object rdgSurtidoraColmado: TRadioGroup
    Left = 800
    Top = 520
    Width = 113
    Height = 35
    Caption = 'Retail/Standard'
    Columns = 2
    Items.Strings = (
      'Si'
      'No')
    TabOrder = 78
    OnClick = rdgSurtidoraColmadoClick
  end
  object chkActivaProduccion: TCheckBox
    Left = 192
    Top = 437
    Width = 113
    Height = 17
    Caption = 'Activa Producci'#243'n'
    TabOrder = 79
  end
  object rdgTicketPtoVta1pag: TRadioGroup
    Left = 800
    Top = 558
    Width = 113
    Height = 34
    Caption = 'Ticket Pto Vta 1 Pag'
    Columns = 2
    Items.Strings = (
      'Si'
      'No')
    TabOrder = 80
    OnClick = rdgTicketPtoVta1pagClick
  end
  object edtCopiasTicket: TEdit
    Left = 720
    Top = 552
    Width = 56
    Height = 21
    TabOrder = 66
  end
  object edtRutaFormatoLabel: TEdit
    Left = 480
    Top = 576
    Width = 297
    Height = 21
    TabOrder = 81
  end
  object edtCiaLabel: TEdit
    Left = 480
    Top = 600
    Width = 121
    Height = 21
    TabOrder = 82
    Text = 'EL TEJEDOR'
  end
  object rdgImpEncuesta: TRadioGroup
    Left = 800
    Top = 595
    Width = 113
    Height = 34
    Hint = 'Imprime codigo QR para encuesta en Ticket Venta'
    Caption = 'Imprime Encuesta?'
    Columns = 2
    Items.Strings = (
      'Si'
      'No')
    ParentShowHint = False
    ShowHint = True
    TabOrder = 84
    OnClick = rdgImpEncuestaClick
  end
  object edtMontoMaxVta: TEdit
    Left = 684
    Top = 600
    Width = 93
    Height = 21
    Hint = 'Indique monto maximo venta permitido'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 83
    Text = '250000'
  end
  object chkLabelZPL: TCheckBox
    Left = 480
    Top = 504
    Width = 74
    Height = 17
    Caption = 'Label ZPL'
    Checked = True
    State = cbChecked
    TabOrder = 85
  end
  object rdgDealer: TRadioGroup
    Left = 800
    Top = 430
    Width = 109
    Height = 40
    Caption = 'Delear?'
    Columns = 2
    Items.Strings = (
      'Si'
      'No')
    TabOrder = 86
    OnClick = rdgDealerClick
  end
  object chkboxeCF: TCheckBox
    Left = 389
    Top = 504
    Width = 74
    Height = 17
    Caption = 'Activa eCF'
    Color = 16441811
    ParentColor = False
    TabOrder = 87
  end
  object edtEcfRuta: TEdit
    Left = 16
    Top = 536
    Width = 369
    Height = 21
    TabOrder = 88
    Text = 'C:\Proyectos\PuntoVenta\ecfIdesiTool\IdesiToolECF.exe'
    OnExit = edtEcfRutaExit
  end
  object edtrutaqrecf: TEdit
    Left = 17
    Top = 572
    Width = 369
    Height = 21
    TabOrder = 89
    Text = 'C:\Proyectos\PointSaleSoftResp\QR_ECF\QR_[numerotrn].jpg'
  end
  object chkboxGlbValidarECF: TCheckBox
    Left = 389
    Top = 524
    Width = 81
    Height = 17
    Hint = 'Valida eCF con API DGII Generando QR'
    Caption = 'Validar eCF?'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 90
  end
  object RadioGroup3: TRadioGroup
    Left = 480
    Top = 629
    Width = 425
    Height = 47
    Caption = 'Modo eCF Consumo a Cr'#233'dito'
    Items.Strings = (
      'Convertir la misma venta, E32 ? E31 (sin duplicar venta).'#10
      
        'Nueva venta E31 copiando '#237'tems, m'#225's una Nota de Cr'#233'dito E34 que ' +
        'anula la E32.')
    TabOrder = 91
    OnClick = RadioGroup3Click
  end
  object chkGlbImprimeCustom: TCheckBox
    Left = 317
    Top = 437
    Width = 64
    Height = 17
    Hint = 'Imprime formato Ticket POS Custom'
    Caption = 'PosCSize'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 92
  end
  object edtcajaecf: TEdit
    Left = 543
    Top = 676
    Width = 121
    Height = 21
    TabOrder = 93
  end
  object chkActivaFinger: TCheckBox
    Left = 370
    Top = 479
    Width = 83
    Height = 17
    Hint = 'Utiliza lector de huellas para clave maestra'
    Caption = 'Activa Finger'
    Color = 9240575
    ParentColor = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 94
  end
  object edtrutaExeItesi2ToolEcf: TEdit
    Left = 16
    Top = 497
    Width = 369
    Height = 21
    TabOrder = 95
    Text = 'C:\Proyectos\IdesiToolECF\Release\IdesiToolECF.exe'
  end
  object chkFacturatxt: TCheckBox
    Left = 389
    Top = 560
    Width = 74
    Height = 17
    Caption = 'Factura.txt'
    Color = 10275957
    ParentColor = False
    TabOrder = 96
    OnClick = chkFacturatxtClick
  end
  object CheckBox2: TCheckBox
    Left = 799
    Top = 36
    Width = 130
    Height = 17
    Caption = 'Activa Solo Payroll'
    TabOrder = 97
  end
  object CheckBox3: TCheckBox
    Left = 799
    Top = 17
    Width = 97
    Height = 17
    Hint = 'Insertar cliente en DB Loan'
    Caption = 'Insert Cte Loan'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 98
  end
end
