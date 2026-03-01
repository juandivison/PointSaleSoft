object Form1: TForm1
  Left = 192
  Top = 124
  Width = 928
  Height = 480
  Caption = 'Exportando Ventas Master'
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
  object DBStatusLabel1: TDBStatusLabel
    Left = 624
    Top = 360
    Width = 85
    Height = 13
    DatasetName = 'Origen'
    DataSource = DataSource1
    Style = lsRecordNo
    ShowOptions = doBoth
  end
  object Label1: TLabel
    Left = 592
    Top = 216
    Width = 32
    Height = 13
    Caption = 'Label1'
  end
  object Label2: TLabel
    Left = 592
    Top = 240
    Width = 32
    Height = 13
    Caption = 'Label2'
  end
  object Button1: TButton
    Left = 736
    Top = 352
    Width = 75
    Height = 25
    Caption = 'Exportar'
    TabOrder = 0
    OnClick = Button1Click
  end
  object ProgressBar1: TProgressBar
    Left = 104
    Top = 312
    Width = 713
    Height = 17
    Step = 1
    TabOrder = 1
  end
  object tblDestino: TIBDataSet
    Database = dmConectarDestino.IBDatabase1
    Transaction = dmConectarDestino.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from VENTAS_mast'
      'where'
      '  NUMERO = :OLD_NUMERO')
    InsertSQL.Strings = (
      'insert into VENTAS_mast'
      
        '  (NUMERO, FECHA, CIA_KEY, CODIGO_CTE, CODIGO_VENDEDOR, FORMA_PA' +
        'GO, OBSERVACION, '
      
        '   MONEDA, VALOR_TOTAL_DET, STATUS, FECHA_IN, IN_POR, FECHA_MOD,' +
        ' MOD_POR, '
      
        '   NUMERO_FACTURA, NUMERO_DOC_PAGO, SERIE_NCF_ASIGNADO, MONTO_BR' +
        'UTO, PORC_DESCUENTO, '
      
        '   MONTO_DESCUENTO, MONTO_INICIAL, NOMBRE_CLIENTE_GENERAL, MONTO' +
        '_PAGADO, '
      
        '   MONTO_CAMBIO, MONTO_TOTAL_ITBIS, MONTODESCGASTOSADMIN, MONTOD' +
        'ESCITBISGASTOSADMIN, '
      
        '   MONTODESCTRANSP, MONTODESCDIRTECNICA, MONTODESCITBISDIRTECNIC' +
        'A, MONTODESCIMPREVISTO, '
      
        '   MONTODESCITBISIMPREVISTO, DESC_MONTO_COMBUSTIBLE, DESC_MONTO_' +
        'PRESTAMO, '
      
        '   DESC_MONTO_SINDICATO, DESC_IMP_SOBRE_RENTA, DESC_OTROS, PORC_' +
        'DESC_SINDICATO, '
      
        '   PORC_DESC_IMP_SOBRE_RENTA, DESC_RUTA, OTROS_DESCUENTOS_2, OTR' +
        'OS_DESCUENTOS_3, '
      
        '   MONTO_DESC_CHOFER, TIPO_VENTA, COMENTARIO, COTIZACION_ORIGEN,' +
        ' REFERENCIACTE, '
      
        '   MONTO_RECARGO, TIPONCFIFISCAL, MONTO_EXONERADO_ITBIS, NIF_IMP' +
        'RESO)'
      'values'
      
        '  (:NUMERO, :FECHA, :CIA_KEY, :CODIGO_CTE, :CODIGO_VENDEDOR, :FO' +
        'RMA_PAGO, '
      
        '   :OBSERVACION, :MONEDA, :VALOR_TOTAL_DET, :STATUS, :FECHA_IN, ' +
        ':IN_POR, '
      
        '   :FECHA_MOD, :MOD_POR, :NUMERO_FACTURA, :NUMERO_DOC_PAGO, :SER' +
        'IE_NCF_ASIGNADO, '
      
        '   :MONTO_BRUTO, :PORC_DESCUENTO, :MONTO_DESCUENTO, :MONTO_INICI' +
        'AL, :NOMBRE_CLIENTE_GENERAL, '
      
        '   :MONTO_PAGADO, :MONTO_CAMBIO, :MONTO_TOTAL_ITBIS, :MONTODESCG' +
        'ASTOSADMIN, '
      
        '   :MONTODESCITBISGASTOSADMIN, :MONTODESCTRANSP, :MONTODESCDIRTE' +
        'CNICA, '
      
        '   :MONTODESCITBISDIRTECNICA, :MONTODESCIMPREVISTO, :MONTODESCIT' +
        'BISIMPREVISTO, '
      
        '   :DESC_MONTO_COMBUSTIBLE, :DESC_MONTO_PRESTAMO, :DESC_MONTO_SI' +
        'NDICATO, '
      
        '   :DESC_IMP_SOBRE_RENTA, :DESC_OTROS, :PORC_DESC_SINDICATO, :PO' +
        'RC_DESC_IMP_SOBRE_RENTA, '
      
        '   :DESC_RUTA, :OTROS_DESCUENTOS_2, :OTROS_DESCUENTOS_3, :MONTO_' +
        'DESC_CHOFER, '
      
        '   :TIPO_VENTA, :COMENTARIO, :COTIZACION_ORIGEN, :REFERENCIACTE,' +
        ' :MONTO_RECARGO, '
      '   :TIPONCFIFISCAL, :MONTO_EXONERADO_ITBIS, :NIF_IMPRESO)')
    RefreshSQL.Strings = (
      'Select '
      '  NUMERO,'
      '  FECHA,'
      '  CIA_KEY,'
      '  CODIGO_CTE,'
      '  CODIGO_VENDEDOR,'
      '  FORMA_PAGO,'
      '  OBSERVACION,'
      '  MONEDA,'
      '  VALOR_TOTAL_DET,'
      '  STATUS,'
      '  FECHA_IN,'
      '  IN_POR,'
      '  FECHA_MOD,'
      '  MOD_POR,'
      '  NUMERO_FACTURA,'
      '  NUMERO_DOC_PAGO,'
      '  SERIE_NCF_ASIGNADO,'
      '  MONTO_BRUTO,'
      '  PORC_DESCUENTO,'
      '  MONTO_DESCUENTO,'
      '  MONTO_INICIAL,'
      '  NOMBRE_CLIENTE_GENERAL,'
      '  MONTO_PAGADO,'
      '  MONTO_CAMBIO,'
      '  MONTO_TOTAL_ITBIS,'
      '  MONTODESCGASTOSADMIN,'
      '  MONTODESCITBISGASTOSADMIN,'
      '  MONTODESCTRANSP,'
      '  MONTODESCDIRTECNICA,'
      '  MONTODESCITBISDIRTECNICA,'
      '  MONTODESCIMPREVISTO,'
      '  MONTODESCITBISIMPREVISTO,'
      '  DESC_MONTO_COMBUSTIBLE,'
      '  DESC_MONTO_PRESTAMO,'
      '  DESC_MONTO_SINDICATO,'
      '  DESC_IMP_SOBRE_RENTA,'
      '  DESC_OTROS,'
      '  PORC_DESC_SINDICATO,'
      '  PORC_DESC_IMP_SOBRE_RENTA,'
      '  DESC_RUTA,'
      '  OTROS_DESCUENTOS_2,'
      '  OTROS_DESCUENTOS_3,'
      '  MONTO_DESC_CHOFER,'
      '  TIPO_VENTA,'
      '  COMENTARIO,'
      '  COTIZACION_ORIGEN,'
      '  REFERENCIACTE,'
      '  MONTO_RECARGO,'
      '  TIPONCFIFISCAL,'
      '  MONTO_EXONERADO_ITBIS,'
      '  NIF_IMPRESO'
      'from VENTAS_mast '
      'where'
      '  NUMERO = :NUMERO')
    SelectSQL.Strings = (
      'select * from VENTAS_mast')
    ModifySQL.Strings = (
      'update VENTAS_mast'
      'set'
      '  NUMERO = :NUMERO,'
      '  FECHA = :FECHA,'
      '  CIA_KEY = :CIA_KEY,'
      '  CODIGO_CTE = :CODIGO_CTE,'
      '  CODIGO_VENDEDOR = :CODIGO_VENDEDOR,'
      '  FORMA_PAGO = :FORMA_PAGO,'
      '  OBSERVACION = :OBSERVACION,'
      '  MONEDA = :MONEDA,'
      '  VALOR_TOTAL_DET = :VALOR_TOTAL_DET,'
      '  STATUS = :STATUS,'
      '  FECHA_IN = :FECHA_IN,'
      '  IN_POR = :IN_POR,'
      '  FECHA_MOD = :FECHA_MOD,'
      '  MOD_POR = :MOD_POR,'
      '  NUMERO_FACTURA = :NUMERO_FACTURA,'
      '  NUMERO_DOC_PAGO = :NUMERO_DOC_PAGO,'
      '  SERIE_NCF_ASIGNADO = :SERIE_NCF_ASIGNADO,'
      '  MONTO_BRUTO = :MONTO_BRUTO,'
      '  PORC_DESCUENTO = :PORC_DESCUENTO,'
      '  MONTO_DESCUENTO = :MONTO_DESCUENTO,'
      '  MONTO_INICIAL = :MONTO_INICIAL,'
      '  NOMBRE_CLIENTE_GENERAL = :NOMBRE_CLIENTE_GENERAL,'
      '  MONTO_PAGADO = :MONTO_PAGADO,'
      '  MONTO_CAMBIO = :MONTO_CAMBIO,'
      '  MONTO_TOTAL_ITBIS = :MONTO_TOTAL_ITBIS,'
      '  MONTODESCGASTOSADMIN = :MONTODESCGASTOSADMIN,'
      '  MONTODESCITBISGASTOSADMIN = :MONTODESCITBISGASTOSADMIN,'
      '  MONTODESCTRANSP = :MONTODESCTRANSP,'
      '  MONTODESCDIRTECNICA = :MONTODESCDIRTECNICA,'
      '  MONTODESCITBISDIRTECNICA = :MONTODESCITBISDIRTECNICA,'
      '  MONTODESCIMPREVISTO = :MONTODESCIMPREVISTO,'
      '  MONTODESCITBISIMPREVISTO = :MONTODESCITBISIMPREVISTO,'
      '  DESC_MONTO_COMBUSTIBLE = :DESC_MONTO_COMBUSTIBLE,'
      '  DESC_MONTO_PRESTAMO = :DESC_MONTO_PRESTAMO,'
      '  DESC_MONTO_SINDICATO = :DESC_MONTO_SINDICATO,'
      '  DESC_IMP_SOBRE_RENTA = :DESC_IMP_SOBRE_RENTA,'
      '  DESC_OTROS = :DESC_OTROS,'
      '  PORC_DESC_SINDICATO = :PORC_DESC_SINDICATO,'
      '  PORC_DESC_IMP_SOBRE_RENTA = :PORC_DESC_IMP_SOBRE_RENTA,'
      '  DESC_RUTA = :DESC_RUTA,'
      '  OTROS_DESCUENTOS_2 = :OTROS_DESCUENTOS_2,'
      '  OTROS_DESCUENTOS_3 = :OTROS_DESCUENTOS_3,'
      '  MONTO_DESC_CHOFER = :MONTO_DESC_CHOFER,'
      '  TIPO_VENTA = :TIPO_VENTA,'
      '  COMENTARIO = :COMENTARIO,'
      '  COTIZACION_ORIGEN = :COTIZACION_ORIGEN,'
      '  REFERENCIACTE = :REFERENCIACTE,'
      '  MONTO_RECARGO = :MONTO_RECARGO,'
      '  TIPONCFIFISCAL = :TIPONCFIFISCAL,'
      '  MONTO_EXONERADO_ITBIS = :MONTO_EXONERADO_ITBIS,'
      '  NIF_IMPRESO = :NIF_IMPRESO'
      'where'
      '  NUMERO = :OLD_NUMERO')
    Left = 432
    Top = 56
  end
  object tblOrigen: TIBQuery
    Database = dmConectarOrigen.IBDatabase1
    Transaction = dmConectarOrigen.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select * from VENTAS_mast'
      '')
    Left = 280
    Top = 48
  end
  object DataSource1: TDataSource
    DataSet = tblOrigen
    Left = 536
    Top = 352
  end
end
