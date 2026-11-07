object frmEcfCanalConfig: TfrmEcfCanalConfig
  Left = 180
  Top = 90
  BorderStyle = bsDialog
  Caption = 'PointSaleSoft - Administracion de canal e-CF'
  ClientHeight = 565
  ClientWidth = 950
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object pgPrincipal: TPageControl
    Left = 0
    Top = 0
    Width = 950
    Height = 520
    ActivePage = tsConfiguracion
    Align = alClient
    TabOrder = 0
    object tsConfiguracion: TTabSheet
      Caption = 'Configuracion por RNC'
      object lblIntro: TLabel
        Left = 18
        Top = 20
        Width = 890
        Height = 40
        AutoSize = False
        Caption = 'Selector de transporte fiscal por RNC emisor. La configuracion ASLAN se conserva por defecto. No se almacenan secretos ni tokens en estas tablas.'
        WordWrap = True
      end
      object lblEmisor: TLabel
        Left = 18
        Top = 72
        Width = 78
        Height = 13
        Caption = 'RNC emisor:'
      end
      object lblCanal: TLabel
        Left = 18
        Top = 136
        Width = 61
        Height = 13
        Caption = 'Canal envio:'
      end
      object lblAmbiente: TLabel
        Left = 290
        Top = 136
        Width = 84
        Height = 13
        Caption = 'Ambiente API:'
      end
      object lblEstadoConfig: TLabel
        Left = 18
        Top = 200
        Width = 860
        Height = 19
        AutoSize = False
        Caption = 'Configuracion pendiente de carga.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblFechaConfig: TLabel
        Left = 18
        Top = 226
        Width = 870
        Height = 18
        AutoSize = False
        Caption = 'Ultima actualizacion:'
      end
      object lblMotivo: TLabel
        Left = 18
        Top = 271
        Width = 165
        Height = 13
        Caption = 'Motivo del cambio (auditoria):'
      end
      object lblAdvertencia: TLabel
        Left = 18
        Top = 347
        Width = 880
        Height = 40
        AutoSize = False
        Caption = 'Modo TEST exclusivamente durante esta fase.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object cboEmisor: TComboBox
        Left = 18
        Top = 92
        Width = 570
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        OnChange = cboEmisorChange
      end
      object cboCanal: TComboBox
        Left = 18
        Top = 156
        Width = 235
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
        OnChange = cboCanalChange
      end
      object cboAmbiente: TComboBox
        Left = 290
        Top = 156
        Width = 170
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 2
        OnChange = cboAmbienteChange
      end
      object edtMotivo: TEdit
        Left = 18
        Top = 291
        Width = 650
        Height = 21
        MaxLength = 250
        TabOrder = 3
      end
      object btnGuardar: TButton
        Left = 18
        Top = 402
        Width = 140
        Height = 32
        Caption = 'Guardar y auditar'
        Default = False
        TabOrder = 4
        OnClick = btnGuardarClick
      end
      object btnReleer: TButton
        Left = 171
        Top = 402
        Width = 140
        Height = 32
        Caption = 'Recargar datos'
        TabOrder = 5
        OnClick = btnReleerClick
      end
    end
    object tsIntentos: TTabSheet
      Caption = 'Intentos API (solo lectura)'
      ImageIndex = 1
      object lblFiltro: TLabel
        Left = 16
        Top = 19
        Width = 267
        Height = 13
        Caption = 'Estado local (RNC seleccionado en Configuracion):'
      end
      object lblResumenIntentos: TLabel
        Left = 16
        Top = 66
        Width = 882
        Height = 18
        AutoSize = False
        Caption = 'Sin consulta de intentos.'
      end
      object lblIdentidad: TLabel
        Left = 16
        Top = 454
        Width = 880
        Height = 20
        AutoSize = False
        Caption = 'Seleccionar fila para ver identificador.'
      end
      object cboFiltroEstado: TComboBox
        Left = 16
        Top = 38
        Width = 210
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
      end
      object btnBuscarIntentos: TButton
        Left = 246
        Top = 36
        Width = 135
        Height = 26
        Caption = 'Consultar'
        TabOrder = 1
        OnClick = btnBuscarIntentosClick
      end
      object grdIntentos: TStringGrid
        Left = 16
        Top = 88
        Width = 900
        Height = 350
        ColCount = 8
        DefaultRowHeight = 20
        FixedCols = 0
        RowCount = 2
        TabOrder = 2
        OnClick = grdIntentosClick
      end
    end
    object tsAuditoria: TTabSheet
      Caption = 'Auditoria de cambios'
      ImageIndex = 2
      object lblResumenAuditoria: TLabel
        Left = 16
        Top = 16
        Width = 830
        Height = 25
        AutoSize = False
        Caption = 'Cambios del RNC seleccionado en Configuracion.'
      end
      object btnConsultarAuditoria: TButton
        Left = 16
        Top = 46
        Width = 156
        Height = 27
        Caption = 'Actualizar auditoria'
        TabOrder = 0
        OnClick = btnConsultarAuditoriaClick
      end
      object grdAuditoria: TStringGrid
        Left = 16
        Top = 87
        Width = 900
        Height = 390
        ColCount = 8
        DefaultRowHeight = 20
        FixedCols = 0
        RowCount = 2
        TabOrder = 1
      end
    end
  end
  object pnlPie: TPanel
    Left = 0
    Top = 520
    Width = 950
    Height = 45
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object lblPie: TLabel
      Left = 16
      Top = 15
      Width = 790
      Height = 18
      AutoSize = False
      Caption = 'Sin envio fiscal. Configuracion TEST.'
    end
    object btnCerrar: TButton
      Left = 830
      Top = 9
      Width = 100
      Height = 27
      Caption = 'Cerrar'
      TabOrder = 0
      OnClick = btnCerrarClick
    end
  end
end
