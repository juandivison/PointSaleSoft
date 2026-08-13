object frmRegTransOpeDiariaECF: TfrmRegTransOpeDiariaECF
  Left = 284
  Top = 129
  Width = 1120
  Height = 760
  Caption = 'Registro guiado de e-CF de gastos'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 14
  object pnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 1112
    Height = 72
    Align = alTop
    BevelOuter = bvNone
    Color = 15790320
    TabOrder = 0
    object lblTitulo: TLabel
      Left = 20
      Top = 12
      Width = 356
      Height = 25
      Caption = 'Registro guiado de e-CF de gastos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblSubtitulo: TLabel
      Left = 22
      Top = 42
      Width = 431
      Height = 14
      Caption = 
        'E41 Compras a no registrados  |  E43 Gastos menores  |  Complete' +
        ' los campos'
    end
    object lblEstadoDocumento: TLabel
      Left = 940
      Top = 20
      Width = 142
      Height = 31
      Alignment = taCenter
      AutoSize = False
      Caption = 'BORRADOR'
      Color = clBtnFace
      ParentColor = False
      Transparent = False
      Layout = tlCenter
    end
  end
  object pnlToolbar: TPanel
    Left = 0
    Top = 72
    Width = 1112
    Height = 54
    Align = alTop
    TabOrder = 1
    object lblOperacion: TLabel
      Left = 864
      Top = 18
      Width = 68
      Height = 14
      Caption = 'Operacion #'
    end
    object dbtxtOperacion: TDBText
      Left = 936
      Top = 16
      Width = 64
      Height = 20
      DataField = 'NUMERO'
      DataSource = dtmTransOpeDiaria.dstblRegTransOpeDiariaMast
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnNuevoE41: TBitBtn
      Left = 8
      Top = 8
      Width = 116
      Height = 36
      Caption = 'Nuevo E41'
      TabOrder = 0
      OnClick = btnNuevoE41Click
    end
    object btnNuevoE43: TBitBtn
      Left = 128
      Top = 8
      Width = 116
      Height = 36
      Caption = 'Nuevo E43'
      TabOrder = 1
      OnClick = btnNuevoE43Click
    end
    object btnAnterior: TBitBtn
      Left = 258
      Top = 8
      Width = 84
      Height = 36
      Caption = '< Anterior'
      TabOrder = 2
      OnClick = btnAnteriorClick
    end
    object btnSiguiente: TBitBtn
      Left = 346
      Top = 8
      Width = 84
      Height = 36
      Caption = 'Siguiente >'
      TabOrder = 3
      OnClick = btnSiguienteClick
    end
    object btnConsultar: TBitBtn
      Left = 438
      Top = 8
      Width = 90
      Height = 36
      Caption = 'Consultar'
      TabOrder = 4
      OnClick = btnConsultarClick
    end
    object btnEditarCabecera: TBitBtn
      Left = 534
      Top = 8
      Width = 116
      Height = 36
      Caption = 'Modificar datos'
      TabOrder = 5
      OnClick = btnEditarCabeceraClick
    end
    object btnGuardar: TBitBtn
      Left = 654
      Top = 8
      Width = 96
      Height = 36
      Caption = 'Guardar'
      TabOrder = 6
      OnClick = btnGuardarClick
    end
    object btnCancelar: TBitBtn
      Left = 754
      Top = 8
      Width = 96
      Height = 36
      Caption = 'Cancelar'
      TabOrder = 7
      OnClick = btnCancelarClick
    end
    object btnCerrar: TBitBtn
      Left = 1008
      Top = 8
      Width = 92
      Height = 36
      Caption = 'Cerrar'
      TabOrder = 8
      OnClick = btnCerrarClick
    end
  end
  object pcPrincipal: TPageControl
    Left = 0
    Top = 126
    Width = 1112
    Height = 603
    ActivePage = tsRevision
    Align = alClient
    TabOrder = 2
    OnChange = pcPrincipalChange
    object tsDatos: TTabSheet
      Caption = '1. Datos del gasto'
      object pnlAyudaTipo: TPanel
        Left = 0
        Top = 0
        Width = 1104
        Height = 82
        Align = alTop
        BevelOuter = bvNone
        Color = 16776176
        TabOrder = 0
        object lblTipoSeleccionado: TLabel
          Left = 18
          Top = 12
          Width = 283
          Height = 19
          Caption = 'Seleccione Nuevo E41 o Nuevo E43'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblAyudaTipo: TLabel
          Left = 18
          Top = 39
          Width = 1040
          Height = 32
          AutoSize = False
          Caption = 
            'El formulario mostrara solamente los campos aplicables al tipo s' +
            'eleccionado.'
          WordWrap = True
        end
      end
      object grpDatosGenerales: TGroupBox
        Left = 16
        Top = 94
        Width = 1068
        Height = 374
        Caption = 'Datos generales'
        TabOrder = 1
        object lblFecha: TLabel
          Left = 18
          Top = 28
          Width = 43
          Height = 14
          Caption = 'Fecha *'
        end
        object lblProveedor: TLabel
          Left = 166
          Top = 28
          Width = 141
          Height = 14
          Caption = 'Proveedor / beneficiario *'
        end
        object lblCondicion: TLabel
          Left = 690
          Top = 28
          Width = 63
          Height = 14
          Caption = 'Condicion *'
        end
        object lblFormaPago: TLabel
          Left = 18
          Top = 104
          Width = 93
          Height = 14
          Caption = 'Forma de pago *'
        end
        object lblFechaVence: TLabel
          Left = 342
          Top = 104
          Width = 113
          Height = 14
          Caption = 'Fecha limite de pago'
        end
        object lblTipoCompra: TLabel
          Left = 518
          Top = 104
          Width = 122
          Height = 14
          Caption = 'Tipo de compra 606 *'
        end
        object lblObservacion: TLabel
          Left = 18
          Top = 184
          Width = 116
          Height = 14
          Caption = 'Descripcion general *'
        end
        object lblDocumentoProveedor: TLabel
          Left = 166
          Top = 74
          Width = 159
          Height = 14
          Caption = 'Documento: no seleccionado'
        end
        object lblTerritorioProveedor: TLabel
          Left = 518
          Top = 74
          Width = 156
          Height = 14
          Caption = 'Ubicacion e-CF: no requerida'
        end
        object lblAyudaPaso1: TLabel
          Left = 18
          Top = 246
          Width = 646
          Height = 52
          AutoSize = False
          Caption = 
            'Los campos con * son obligatorios. En E43 el proveedor se usa so' +
            'lo para control interno. En E41 revise que el proveedor tenga no' +
            'mbre, tipo de documento y numero de identificacion.'
          WordWrap = True
        end
        object btnCompletarTerritorio: TBitBtn
          Left = 903
          Top = 69
          Width = 125
          Height = 25
          Caption = 'Completar ubicaci'#243'n'
          TabOrder = 10
          Visible = False
          OnClick = btnCompletarTerritorioClick
        end
        object deFecha: TDateTimePicker
          Left = 18
          Top = 46
          Width = 126
          Height = 22
          Date = 46000.000000000000000000
          Time = 46000.000000000000000000
          TabOrder = 0
          OnChange = deFechaChange
        end
        object cmbProveedor: TRxDBLookupCombo
          Left = 166
          Top = 46
          Width = 397
          Height = 22
          DropDownCount = 10
          DropDownWidth = 500
          DataField = 'COD_PROVEEDOR'
          DataSource = dtmTransOpeDiaria.dstblRegTransOpeDiariaMast
          LookupField = 'CODIGO_CTE'
          LookupDisplay = 'DESCRIPCION'
          LookupSource = dtmTransOpeDiaria.dsqryProveedor
          TabOrder = 1
          OnChange = cmbProveedorChange
        end
        object btnBuscarProveedor: TBitBtn
          Left = 612
          Top = 44
          Width = 58
          Height = 27
          Caption = 'Buscar'
          TabOrder = 2
          OnClick = btnBuscarProveedorClick
        end
        object cmbCondicion: TRxDBLookupCombo
          Left = 690
          Top = 46
          Width = 180
          Height = 22
          DropDownCount = 8
          DataField = 'FPAGO'
          DataSource = dtmTransOpeDiaria.dstblRegTransOpeDiariaMast
          LookupField = 'CODIGO'
          LookupDisplay = 'DESCRIPCION'
          LookupSource = dtmTransOpeDiaria.dstblCondicion
          TabOrder = 3
          OnChange = cmbCondicionChange
        end
        object cmbFormaPago: TRxDBLookupCombo
          Left = 18
          Top = 122
          Width = 300
          Height = 22
          DropDownCount = 10
          DataField = 'IDCODIGO_TPAGODGII'
          DataSource = dtmTransOpeDiaria.dstblRegTransOpeDiariaMast
          LookupField = 'CODIGO'
          LookupDisplay = 'DESCRIPCION'
          LookupSource = dsTipoPagoCxp
          TabOrder = 4
        end
        object deFechaVence: TDateTimePicker
          Left = 342
          Top = 122
          Width = 150
          Height = 22
          Date = 46000.000000000000000000
          Time = 46000.000000000000000000
          ShowCheckbox = True
          TabOrder = 5
          OnChange = deFechaVenceChange
        end
        object cmbTipoCompra: TRxDBLookupCombo
          Left = 518
          Top = 122
          Width = 514
          Height = 22
          DropDownCount = 10
          DropDownWidth = 550
          DataField = 'IDTIPO_COMPRA'
          DataSource = dtmTransOpeDiaria.dstblRegTransOpeDiariaMast
          LookupField = 'TIPO'
          LookupDisplay = 'DESCRIPCION'
          LookupSource = dtmTransOpeDiaria.dstblTipoCompra
          TabOrder = 6
        end
        object edtObservacion: TDBEdit
          Left = 18
          Top = 202
          Width = 646
          Height = 22
          DataField = 'OBSERVACION'
          DataSource = dtmTransOpeDiaria.dstblRegTransOpeDiariaMast
          TabOrder = 7
        end
        object rgItbisIncluido: TDBRadioGroup
          Left = 690
          Top = 174
          Width = 342
          Height = 96
          Caption = 'En los precios del E41, el ITBIS...'
          DataField = 'IND_MONTO_GRAVADO'
          DataSource = dtmTransOpeDiaria.dstblRegTransOpeDiariaMast
          Items.Strings = (
            'No esta incluido; se suma al precio'
            'Ya esta incluido dentro del precio')
          TabOrder = 8
          Values.Strings = (
            '0'
            '1')
          OnClick = rgItbisIncluidoClick
        end
        object btnIrDetalle: TBitBtn
          Left = 812
          Top = 308
          Width = 220
          Height = 42
          Caption = 'Guardar y continuar al detalle >'
          TabOrder = 9
          OnClick = btnIrDetalleClick
        end
        object BitBtn1: TBitBtn
          Left = 575
          Top = 45
          Width = 25
          Height = 25
          Caption = '+'
          TabOrder = 11
          OnClick = BitBtn1Click
        end
      end
    end
    object tsDetalle: TTabSheet
      Caption = '2. Conceptos y montos'
      ImageIndex = 1
      object grpLinea: TGroupBox
        Left = 8
        Top = 8
        Width = 1088
        Height = 244
        Caption = 'Linea seleccionada'
        TabOrder = 0
        object lblProducto: TLabel
          Left = 14
          Top = 24
          Width = 115
          Height = 14
          Caption = 'Producto o servicio *'
        end
        object lblDescripcion: TLabel
          Left = 382
          Top = 24
          Width = 72
          Height = 14
          Caption = 'Descripcion *'
        end
        object lblCantidad: TLabel
          Left = 14
          Top = 86
          Width = 58
          Height = 14
          Caption = 'Cantidad *'
        end
        object lblPrecio: TLabel
          Left = 110
          Top = 86
          Width = 88
          Height = 14
          Caption = 'Precio unitario *'
        end
        object lblValor: TLabel
          Left = 232
          Top = 86
          Width = 55
          Height = 14
          Caption = 'Valor linea'
        end
        object lblTasaItbis: TLabel
          Left = 354
          Top = 86
          Width = 107
          Height = 14
          Caption = 'Tratamiento fiscal *'
        end
        object lblMontoItbis: TLabel
          Left = 570
          Top = 86
          Width = 58
          Height = 14
          Caption = 'ITBIS e-CF'
        end
        object lblItbisRetenido: TLabel
          Left = 690
          Top = 86
          Width = 91
          Height = 14
          Caption = 'ITBIS ret. 100%'
        end
        object lblTasaIsr: TLabel
          Left = 806
          Top = 86
          Width = 58
          Height = 14
          Caption = 'Tasa ISR *'
        end
        object lblIsrRetenido: TLabel
          Left = 992
          Top = 86
          Width = 71
          Height = 14
          Caption = 'ISR calculado'
        end
        object lblDepartamento: TLabel
          Left = 14
          Top = 148
          Width = 79
          Height = 14
          Caption = 'Departamento'
        end
        object lblCentroCosto: TLabel
          Left = 236
          Top = 148
          Width = 89
          Height = 14
          Caption = 'Centro de costo'
        end
        object lblAyudaRetenciones: TLabel
          Left = 690
          Top = 150
          Width = 372
          Height = 34
          AutoSize = False
          Caption = 
            'El tratamiento fiscal se ajusta automaticamente segun el tipo E4' +
            '1 o E43.'
          WordWrap = True
        end
        object lblTasaIsrManual: TLabel
          Left = 806
          Top = 130
          Width = 97
          Height = 14
          Caption = 'Porcentaje ISR %'
          Visible = False
        end
        object cmbProducto: TRxDBLookupCombo
          Left = 14
          Top = 42
          Width = 320
          Height = 22
          DropDownCount = 10
          DropDownWidth = 420
          DataField = 'COD_SERV_PROD'
          DataSource = dtmTransOpeDiaria.dstblRegTransOpeDiariaDet
          LookupField = 'CODIGO'
          LookupDisplay = 'DESCRIPCION'
          LookupSource = dtmTransOpeDiaria.dstblProductosServicios
          TabOrder = 0
          OnChange = cmbProductoChange
        end
        object btnNuevoProducto: TBitBtn
          Left = 340
          Top = 40
          Width = 34
          Height = 27
          Caption = '+'
          TabOrder = 1
          OnClick = btnNuevoProductoClick
        end
        object edtDescripcion: TDBEdit
          Left = 382
          Top = 42
          Width = 470
          Height = 22
          DataField = 'OBSERVACION'
          DataSource = dtmTransOpeDiaria.dstblRegTransOpeDiariaDet
          TabOrder = 2
        end
        object rgBienServicio: TDBRadioGroup
          Left = 866
          Top = 20
          Width = 202
          Height = 58
          Caption = 'Clasificacion *'
          Columns = 2
          DataField = 'IND_BIEN_SERVICIO'
          DataSource = dtmTransOpeDiaria.dstblRegTransOpeDiariaDet
          Items.Strings = (
            'Bien'
            'Servicio')
          TabOrder = 3
          Values.Strings = (
            '1'
            '2')
          OnClick = rgBienServicioClick
        end
        object edtCantidad: TDBEdit
          Left = 14
          Top = 104
          Width = 82
          Height = 22
          DataField = 'CANTIDAD'
          DataSource = dtmTransOpeDiaria.dstblRegTransOpeDiariaDet
          TabOrder = 4
          OnExit = edtCantidadExit
        end
        object edtPrecio: TDBEdit
          Left = 110
          Top = 104
          Width = 108
          Height = 22
          DataField = 'PRECIO'
          DataSource = dtmTransOpeDiaria.dstblRegTransOpeDiariaDet
          TabOrder = 5
          OnExit = edtPrecioExit
        end
        object edtValor: TDBEdit
          Left = 232
          Top = 104
          Width = 108
          Height = 22
          DataField = 'VALOR'
          DataSource = dtmTransOpeDiaria.dstblRegTransOpeDiariaDet
          ReadOnly = True
          TabOrder = 6
        end
        object cmbTasaItbis: TRxDBLookupCombo
          Left = 354
          Top = 104
          Width = 202
          Height = 22
          DropDownCount = 8
          DataField = 'IDTASAITBIS'
          DataSource = dtmTransOpeDiaria.dstblRegTransOpeDiariaDet
          LookupField = 'IDTASAITBIS'
          LookupDisplay = 'DESCRIPCION'
          LookupSource = dsTasaItbis
          TabOrder = 7
          OnChange = cmbTasaItbisChange
        end
        object edtMontoItbis: TDBEdit
          Left = 570
          Top = 104
          Width = 106
          Height = 22
          DataField = 'MONTO_ITBIS'
          DataSource = dtmTransOpeDiaria.dstblRegTransOpeDiariaDet
          ReadOnly = True
          TabOrder = 8
        end
        object edtItbisRetenido: TDBEdit
          Left = 690
          Top = 104
          Width = 102
          Height = 22
          DataField = 'MONTO_ITBIS_RETENIDO'
          DataSource = dtmTransOpeDiaria.dstblRegTransOpeDiariaDet
          ReadOnly = True
          TabOrder = 9
        end
        object cmbTasaIsr: TComboBox
          Left = 806
          Top = 104
          Width = 118
          Height = 22
          Style = csDropDownList
          ItemHeight = 14
          ItemIndex = 0
          TabOrder = 10
          Text = 'Seleccione'
          OnChange = cmbTasaIsrChange
          Items.Strings = (
            'Seleccione'
            '2% ISR'
            '3% ISR'
            '10% ISR'
            '15% ISR'
            'Otro porcentaje...')
        end
        object edtTasaIsrManual: TEdit
          Left = 912
          Top = 126
          Width = 68
          Height = 22
          TabOrder = 11
          Visible = False
          OnChange = edtTasaIsrManualChange
        end
        object edtIsrRetenido: TDBEdit
          Left = 992
          Top = 104
          Width = 92
          Height = 22
          DataField = 'MONTO_ISR_RETENIDO'
          DataSource = dtmTransOpeDiaria.dstblRegTransOpeDiariaDet
          ReadOnly = True
          TabOrder = 12
        end
        object cmbDepartamento: TRxDBLookupCombo
          Left = 14
          Top = 166
          Width = 208
          Height = 22
          DropDownCount = 8
          DataField = 'DEPARTAMENTO'
          DataSource = dtmTransOpeDiaria.dstblRegTransOpeDiariaDet
          LookupField = 'CODIGO'
          LookupDisplay = 'NOMBRE'
          LookupSource = dtmTransOpeDiaria.dsqryDeptos
          TabOrder = 13
        end
        object cmbCentroCosto: TRxDBLookupCombo
          Left = 236
          Top = 166
          Width = 310
          Height = 22
          DropDownCount = 8
          DataField = 'COD_CTA_CONCEPTO'
          DataSource = dtmTransOpeDiaria.dstblRegTransOpeDiariaDet
          LookupField = 'CODIGO'
          LookupDisplay = 'NOMBRE'
          LookupSource = dtmTransOpeDiaria.dsqryCentroCostos
          TabOrder = 14
        end
        object btnAgregarLinea: TBitBtn
          Left = 14
          Top = 202
          Width = 112
          Height = 30
          Caption = 'Agregar linea'
          TabOrder = 15
          OnClick = btnAgregarLineaClick
        end
        object btnEditarLinea: TBitBtn
          Left = 130
          Top = 202
          Width = 112
          Height = 30
          Caption = 'Modificar linea'
          TabOrder = 16
          OnClick = btnEditarLineaClick
        end
        object btnGuardarLinea: TBitBtn
          Left = 246
          Top = 202
          Width = 112
          Height = 30
          Caption = 'Guardar linea'
          TabOrder = 17
          OnClick = btnGuardarLineaClick
        end
        object btnCancelarLinea: TBitBtn
          Left = 362
          Top = 202
          Width = 112
          Height = 30
          Caption = 'Cancelar linea'
          TabOrder = 18
          OnClick = btnCancelarLineaClick
        end
        object btnEliminarLinea: TBitBtn
          Left = 478
          Top = 202
          Width = 112
          Height = 30
          Caption = 'Eliminar linea'
          TabOrder = 19
          OnClick = btnEliminarLineaClick
        end
      end
      object grdDetalle: TDBGrid
        Left = 8
        Top = 260
        Width = 1088
        Height = 220
        DataSource = dtmTransOpeDiaria.dstblRegTransOpeDiariaDet
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = btnEditarLineaClick
        Columns = <
          item
            Expanded = False
            FieldName = 'OBSERVACION'
            Title.Caption = 'Concepto'
            Width = 260
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CANTIDAD'
            Title.Caption = 'Cantidad'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRECIO'
            Title.Caption = 'Precio'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR'
            Title.Caption = 'Valor linea'
            Width = 95
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MONTO_ITBIS'
            Title.Caption = 'ITBIS'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IND_BIEN_SERVICIO'
            Title.Caption = 'Bien/Servicio'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MONTO_ITBIS_RETENIDO'
            Title.Caption = 'ITBIS retenido auto.'
            Width = 95
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MONTO_ISR_RETENIDO'
            Title.Caption = 'ISR retenido'
            Width = 95
            Visible = True
          end>
      end
      object pnlResumenDetalle: TPanel
        Left = 0
        Top = 486
        Width = 1104
        Height = 88
        Align = alBottom
        TabOrder = 2
        object lblResumenLineas: TLabel
          Left = 16
          Top = 16
          Width = 115
          Height = 14
          Caption = 'Valor lineas: RD$0.00'
        end
        object lblResumenItbis: TLabel
          Left = 224
          Top = 16
          Width = 85
          Height = 14
          Caption = 'ITBIS: RD$0.00'
        end
        object lblResumenRetenciones: TLabel
          Left = 384
          Top = 16
          Width = 122
          Height = 14
          Caption = 'Retenciones: RD$0.00'
        end
        object lblResumenNeto: TLabel
          Left = 600
          Top = 16
          Width = 151
          Height = 14
          Caption = 'Neto esperado: RD$0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btnIrRevision: TBitBtn
          Left = 850
          Top = 28
          Width = 230
          Height = 42
          Caption = 'Revisar y preparar envio >'
          TabOrder = 0
          OnClick = btnIrRevisionClick
        end
      end
    end
    object tsRevision: TTabSheet
      Caption = '3. Revisar, reservar y enviar'
      ImageIndex = 2
      object grpResumenFiscal: TGroupBox
        Left = 8
        Top = 8
        Width = 426
        Height = 260
        Caption = 'Resumen fiscal y monto pagado'
        TabOrder = 0
        object lblBaseFiscalTitulo: TLabel
          Left = 18
          Top = 30
          Width = 117
          Height = 14
          Caption = 'Base / monto exento'
        end
        object lblItbisTitulo: TLabel
          Left = 18
          Top = 58
          Width = 62
          Height = 14
          Caption = 'Total ITBIS'
        end
        object lblTotalFiscalTitulo: TLabel
          Left = 18
          Top = 86
          Width = 57
          Height = 14
          Caption = 'Total fiscal'
        end
        object lblRetItbisTitulo: TLabel
          Left = 18
          Top = 114
          Width = 80
          Height = 14
          Caption = 'ITBIS retenido'
        end
        object lblRetIsrTitulo: TLabel
          Left = 18
          Top = 142
          Width = 68
          Height = 14
          Caption = 'ISR retenido'
        end
        object lblNetoTitulo: TLabel
          Left = 18
          Top = 170
          Width = 89
          Height = 14
          Caption = 'Neto calculado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblBaseFiscal: TLabel
          Left = 234
          Top = 30
          Width = 51
          Height = 14
          Alignment = taRightJustify
          Caption = 'RD$ 0.00'
        end
        object lblTotalItbis: TLabel
          Left = 234
          Top = 58
          Width = 51
          Height = 14
          Alignment = taRightJustify
          Caption = 'RD$ 0.00'
        end
        object lblTotalFiscal: TLabel
          Left = 234
          Top = 86
          Width = 51
          Height = 14
          Alignment = taRightJustify
          Caption = 'RD$ 0.00'
        end
        object lblTotalRetItbis: TLabel
          Left = 234
          Top = 114
          Width = 51
          Height = 14
          Alignment = taRightJustify
          Caption = 'RD$ 0.00'
        end
        object lblTotalRetIsr: TLabel
          Left = 234
          Top = 142
          Width = 51
          Height = 14
          Alignment = taRightJustify
          Caption = 'RD$ 0.00'
        end
        object lblNetoCalculado: TLabel
          Left = 227
          Top = 170
          Width = 58
          Height = 14
          Alignment = taRightJustify
          Caption = 'RD$ 0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblMontoPagadoTitulo: TLabel
          Left = 18
          Top = 204
          Width = 162
          Height = 14
          Caption = 'Monto pagado al proveedor *'
        end
        object lblDiferencia: TLabel
          Left = 184
          Top = 232
          Width = 112
          Height = 14
          Caption = 'Diferencia: RD$ 0.00'
        end
        object edtMontoPagado: TEdit
          Left = 184
          Top = 200
          Width = 118
          Height = 22
          TabOrder = 0
          Text = '0.00'
        end
        object btnUsarNeto: TBitBtn
          Left = 308
          Top = 198
          Width = 102
          Height = 27
          Caption = 'Usar calculado'
          TabOrder = 1
          OnClick = btnUsarNetoClick
        end
      end
      object grpSecuencia: TGroupBox
        Left = 444
        Top = 8
        Width = 652
        Height = 260
        Caption = 'Secuencia electronica'
        TabOrder = 1
        object lblSerieTitulo: TLabel
          Left = 16
          Top = 28
          Width = 224
          Height = 14
          Caption = 'Secuencia activa que usara PointSaleSoft'
        end
        object lblProximaSecuencia: TLabel
          Left = 16
          Top = 88
          Width = 178
          Height = 14
          Caption = 'Proxima secuencia: no disponible'
        end
        object lblVencimientoSecuencia: TLabel
          Left = 16
          Top = 114
          Width = 147
          Height = 14
          Caption = 'Vencimiento: no disponible'
        end
        object lblEcfActualTitulo: TLabel
          Left = 16
          Top = 154
          Width = 89
          Height = 14
          Caption = 'e-NCF reservado'
        end
        object lblGastosTXTActivo: TLabel
          Left = 16
          Top = 232
          Width = 101
          Height = 14
          Hint = 'Se crear'#225' un Archivo Gastos.Txt para enviar al Tool eCF.'
          Caption = 'Gastos TXT Activo'
          Color = 12382694
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
        object cmbSerieEcf: TComboBox
          Left = 16
          Top = 48
          Width = 500
          Height = 22
          Style = csDropDownList
          ItemHeight = 14
          TabOrder = 0
          OnChange = cmbSerieEcfChange
        end
        object btnRecargarSeries: TBitBtn
          Left = 524
          Top = 46
          Width = 108
          Height = 27
          Caption = 'Recargar'
          TabOrder = 1
          OnClick = btnRecargarSeriesClick
        end
        object edtEcfActual: TDBEdit
          Left = 16
          Top = 174
          Width = 260
          Height = 22
          DataField = 'ECF'
          DataSource = dtmTransOpeDiaria.dstblRegTransOpeDiariaMast
          ReadOnly = True
          TabOrder = 2
        end
      end
      object grpValidacion: TGroupBox
        Left = 8
        Top = 276
        Width = 650
        Height = 290
        Caption = 'Validacion antes de enviar'
        TabOrder = 2
        object lstValidacion: TListBox
          Left = 12
          Top = 24
          Width = 626
          Height = 188
          ItemHeight = 14
          TabOrder = 0
        end
        object btnValidar: TBitBtn
          Left = 12
          Top = 226
          Width = 134
          Height = 42
          Caption = 'Validar datos'
          TabOrder = 1
          OnClick = btnValidarClick
        end
        object btnReservarEcf: TBitBtn
          Left = 154
          Top = 226
          Width = 150
          Height = 42
          Caption = '1. Reservar e-NCF'
          TabOrder = 2
          OnClick = btnReservarEcfClick
        end
        object btnEnviarEcf: TBitBtn
          Left = 312
          Top = 226
          Width = 168
          Height = 42
          Caption = '2. Enviar a DGII'
          TabOrder = 3
          OnClick = btnEnviarEcfClick
        end
        object btnVolverDetalle: TBitBtn
          Left = 488
          Top = 226
          Width = 150
          Height = 42
          Caption = '< Volver al detalle'
          TabOrder = 4
          OnClick = btnVolverDetalleClick
        end
      end
      object grpEstadoEnvio: TGroupBox
        Left = 666
        Top = 276
        Width = 430
        Height = 290
        Caption = 'Estado de ASLAN / DGII'
        TabOrder = 3
        object lblEstadoDgiiTitulo: TLabel
          Left = 16
          Top = 28
          Width = 37
          Height = 14
          Caption = 'Estado'
        end
        object lblEstadoDgii: TLabel
          Left = 94
          Top = 28
          Width = 60
          Height = 14
          Caption = 'Sin enviar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblTrackIdTitulo: TLabel
          Left = 16
          Top = 56
          Width = 41
          Height = 14
          Caption = 'TrackId'
        end
        object lblTrackId: TLabel
          Left = 94
          Top = 56
          Width = 4
          Height = 14
          Caption = '-'
        end
        object memoMensajeDgii: TMemo
          Left = 16
          Top = 84
          Width = 398
          Height = 132
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 0
        end
        object btnImprimirEcf: TBitBtn
          Left = 16
          Top = 228
          Width = 398
          Height = 40
          Caption = 'Imprimir / PDF / Email'
          Enabled = False
          TabOrder = 1
          OnClick = btnImprimirEcfClick
        end
      end
    end
    object tsConsulta: TTabSheet
      Caption = '4. Consultar transacciones'
      ImageIndex = 3
      object pnlConsultaFiltros: TPanel
        Left = 0
        Top = 0
        Width = 1104
        Height = 104
        Align = alTop
        BevelOuter = bvNone
        Color = 16776176
        TabOrder = 0
        object lblConsultaDesde: TLabel
          Left = 18
          Top = 18
          Width = 34
          Height = 14
          Caption = 'Desde'
        end
        object lblConsultaHasta: TLabel
          Left = 190
          Top = 18
          Width = 30
          Height = 14
          Caption = 'Hasta'
        end
        object lblConsultaAyuda: TLabel
          Left = 18
          Top = 72
          Width = 475
          Height = 14
          Caption = 
            'Consulte E41/E43 por rango de fecha y abra la transaccion selecc' +
            'ionada con doble clic.'
        end
        object lblConsultaTotal: TLabel
          Left = 730
          Top = 72
          Width = 350
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Seleccione el rango y presione Consultar.'
        end
        object dtpConsultaDesde: TDateTimePicker
          Left = 18
          Top = 36
          Width = 150
          Height = 22
          Date = 46000.000000000000000000
          Time = 46000.000000000000000000
          TabOrder = 0
        end
        object dtpConsultaHasta: TDateTimePicker
          Left = 190
          Top = 36
          Width = 150
          Height = 22
          Date = 46000.000000000000000000
          Time = 46000.000000000000000000
          TabOrder = 1
        end
        object btnConsultarTransacciones: TBitBtn
          Left = 362
          Top = 30
          Width = 136
          Height = 34
          Caption = 'Consultar'
          TabOrder = 2
          OnClick = btnConsultarTransaccionesClick
        end
        object btnAbrirTransaccion: TBitBtn
          Left = 510
          Top = 30
          Width = 172
          Height = 34
          Caption = 'Abrir seleccionada'
          TabOrder = 3
          OnClick = btnAbrirTransaccionClick
        end
      end
      object grdConsulta: TDBGrid
        Left = 0
        Top = 104
        Width = 1104
        Height = 470
        Align = alClient
        DataSource = dsConsultaTransacciones
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = grdConsultaDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'NUMERO'
            Title.Caption = 'Operacion'
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FECHA'
            Title.Caption = 'Fecha'
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO_CF'
            Title.Caption = 'e-CF'
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PROVEEDOR'
            Title.Caption = 'Proveedor / beneficiario'
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MONTO'
            Title.Caption = 'Monto pagado'
            Width = 105
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ECF'
            Title.Caption = 'e-NCF'
            Width = 140
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ESTADO_ECF'
            Title.Caption = 'Estado e-CF'
            Width = 110
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'STATUS'
            Title.Caption = 'Estado op.'
            Width = 70
            Visible = True
          end>
      end
    end
  end
  object qryTasaItbis: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select IDTASAITBIS, DESCRIPCION, PORCIENTO, IDITBISECF, STATUS'
      'from TASA_ITBIS'
      'order by IDTASAITBIS')
    Left = 32
    Top = 680
  end
  object dsTasaItbis: TDataSource
    DataSet = qryTasaItbis
    Left = 72
    Top = 680
  end
  object tblTipoPagoCxp: TIBTable
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'TIPO_CXP_DGII'
    Left = 112
    Top = 680
  end
  object dsTipoPagoCxp: TDataSource
    DataSet = tblTipoPagoCxp
    Left = 152
    Top = 680
  end
  object qrySerieEcf: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select SERIE, DIV_NEGOCIO, PECF, AICF, TIPO_CF, NCF, FECHA_VENCE'
      'from DGII_SERIE_NFC'
      'where TIPO_CF = :TIPO_CF'
      '  and ACTIVO = 1'
      'order by FECHA_VENCE, NCF')
    Left = 192
    Top = 680
    ParamData = <
      item
        DataType = ftString
        Name = 'TIPO_CF'
        ParamType = ptInput
      end>
  end
  object qryEstadoEnvio: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select first 1 ESTADO, TRACK_ID, MENSAJE'
      'from ECF_GASTO_ENVIO'
      'where CIA_KEY = :CIA_KEY'
      '  and TRN = :TRN'
      'order by COALESCE(FECHA_UPDATE, FECHA_CREACION) desc')
    Left = 232
    Top = 680
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CIA_KEY'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TRN'
        ParamType = ptInput
      end>
  end
  object qryConsultaTransacciones: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select m.NUMERO, m.FECHA, m.TIPO_CF, m.ECF, m.COD_PROVEEDOR,'
      '       p.DESCRIPCION as PROVEEDOR, m.MONTO, m.STATUS,'
      '       r.ESTADO as ESTADO_ECF'
      'from TRANS_OPERACION_MASTER m'
      'left join PROVEEDORES p on p.CODIGO_CTE = m.COD_PROVEEDOR'
      'left join ECF_RESERVA r on r.NCF = m.ECF and r.ID < 0'
      'where m.CIA_KEY = :CIA_KEY'
      '  and m.FECHA >= :FECHA_DESDE'
      '  and m.FECHA < :FECHA_HASTA'
      '  and m.TIPO_CF in ('#39'41'#39', '#39'43'#39')'
      'order by m.FECHA desc, m.NUMERO desc')
    Left = 280
    Top = 680
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CIA_KEY'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA_DESDE'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'FECHA_HASTA'
        ParamType = ptInput
      end>
  end
  object dsConsultaTransacciones: TDataSource
    DataSet = qryConsultaTransacciones
    Left = 328
    Top = 680
  end
end
