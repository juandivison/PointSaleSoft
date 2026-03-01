object frmDatosVtaTest: TfrmDatosVtaTest
  Left = 153
  Top = 80
  Width = 1181
  Height = 600
  Caption = 'Unit Testing Datos Venta'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object RxDBGrid1: TRxDBGrid
    Left = 16
    Top = 48
    Width = 1121
    Height = 89
    DataSource = frmProcVentaRapidaPOS.dstblPOSVentasMast
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NUMERO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CIA_KEY'
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODIGO_CTE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODIGO_VENDEDOR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FORMA_PAGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBSERVACION'
        Width = 134
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONEDA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_TOTAL_DET'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMERO_FACTURA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMERO_DOC_PAGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SERIE_NCF_ASIGNADO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTO_BRUTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PORC_DESCUENTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTO_DESCUENTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTO_INICIAL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBRE_CLIENTE_GENERAL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTO_PAGADO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTO_CAMBIO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTO_TOTAL_ITBIS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Diferencia'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOTALNETO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PORCDESADICIONAL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPONCF'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTOEXONERAITBIS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STATUS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA_IN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IN_POR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA_MOD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MOD_POR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOTACREDITO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEVOLUCION'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTODESCGASTOSADMIN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTODESCITBISGASTOSADMIN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTODESCTRANSP'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTODESCDIRTECNICA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTODESCITBISDIRTECNICA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTODESCIMPREVISTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTODESCITBISIMPREVISTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_MONTO_COMBUSTIBLE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_MONTO_PRESTAMO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_MONTO_SINDICATO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_IMP_SOBRE_RENTA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_OTROS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PORC_DESC_SINDICATO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PORC_DESC_IMP_SOBRE_RENTA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESC_RUTA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OTROS_DESCUENTOS_2'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OTROS_DESCUENTOS_3'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTO_DESC_CHOFER'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO_VENTA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COMENTARIO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COTIZACION_ORIGEN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REFERENCIACTE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTO_RECARGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPONCFIFISCAL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTO_EXONERADO_ITBIS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NIF_IMPRESO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IDRETENCION'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PORCPROPINALEGAL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PROPINA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PROPINALEGAL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTONCRAPLICADO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHACOTIZACION'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MontoSubTotalIndirectos'
        Visible = True
      end>
  end
  object RxDBGrid2: TRxDBGrid
    Left = 16
    Top = 152
    Width = 1121
    Height = 281
    DataSource = frmProcVentaRapidaPOS.DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'SERIE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMERO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CANT'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECIO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTOBRUTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPCION'
        Width = 196
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEVOLUCION'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTONETO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODUSUARIO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODARTICULO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMERORECIBO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODTEXTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NCF'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMEROTRN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PORC_DESC'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ITBI'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTODESCUENTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONBTOBRUTOCLD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTODESCITEMCLD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FMONTODESCNIVELITEMCLD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ITBIS_TOTAL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SERIEPROD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMEROFACTURA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'INVETARIAR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LOTENUM'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTOITBISENPRECIO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REFERENCIA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMERODOC'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPOUNIDAD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCUNIDADMEDIDA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ITBISEXENTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPOVENTA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPCIONESPECIAL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTODESGASTOADMIN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTODESCITBISGASTOSADMIN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTODESCTRANSP'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTODESCDIRTECNICA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTODESCITBISDIRTEC'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTODESCIMPREVISTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTODESCITBISIMPREVISTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SERIEORIGINAL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMEROTRNORIGINAL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMEROCOTIZA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONEDA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONEDABASE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RUTAIMAGEN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COSTOPRODUCTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GLBCODVENDEDOR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PORCDESCITEM'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTODESCITEM'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RECARGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTOTRANSPITBIS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTOITBISRECARGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTODESGLOBAL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IDTASAITBIS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTOITBRECITMCONDESC'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTODESCGLBDIST'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTO_TASA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CANTPAX'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA_IN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_USUARIO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STATUS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SERIE_COTIZA'
        Visible = True
      end>
  end
  object RxDBGrid3: TRxDBGrid
    Left = 16
    Top = 464
    Width = 1121
    Height = 73
    DataSource = frmProcVentaRapidaPOS.dstblPOSTotales
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NUMERO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUBTOTAL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ITBIS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTODESC'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOTALNETO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTORECIBIDO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEVOLUCION'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODCLIENTE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PORCDESADICIONAL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTODESCADICIONAL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NCF_NUMERO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTOINTERES'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DIFERENCIA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTODESCITEMS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RECARGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTODESCGLBITBIS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PROPINA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PROPINALEGAL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MontoSubTotalIndirectos'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SUBTOTALCLD'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DifereciaCldo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PORCIENTOINTERES'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QRLABELNCFDESC'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBRECLIENTE'
        Width = 158
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DIRECCION'
        Width = 108
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TELEFONO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RNC_NUMERO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHAVENCE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTODESCGASTOSADMIN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTODESCITBISGASTOSADMIN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTODESCTRANSP'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTODESCDIRTECNICA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTODESCITBISDIRTECNICA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTODESCIMPREVISTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTODESCITBISIMPREVISTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PORCGADMIN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PORCITBISGADMIN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PORCTRANS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PORCDIRTEC'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PORCITBISDIRTEC'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PORCIMPREVISTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PORCITBISIMPREVISTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TPORCGADMIN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TPORCITBISGADMIN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TPORCTRANS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TPORCDIRTEC'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TPORCITBISDIRTEC'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TPORCIMPREVISTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TPORCITBISIMPREVISTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COMENTARIO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHACOTIZACION'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONEDA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTOENTARJETA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTOENEFECTIVO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTOENCHEQUE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTOENBONOS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTONOTACREDITO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTONCRAPLICADO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REFERENCIACTE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMEROTRN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPONCF'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPONCFIFISCAL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTOEXONERAITBIS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTOITBISRECARGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTOITBRECITMCONDESC'
        Visible = True
      end>
  end
end
