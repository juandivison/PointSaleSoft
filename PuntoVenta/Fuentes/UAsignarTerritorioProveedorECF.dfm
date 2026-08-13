object frmAsignarTerritorioProveedorECF: TfrmAsignarTerritorioProveedorECF
  Left = 330
  Top = 210
  Width = 620
  Height = 360
  Caption = 'Ubicacion e-CF del proveedor'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 14
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 612
    Height = 72
    Align = alTop
    BevelOuter = bvNone
    Color = 15790320
    TabOrder = 0
    object lblTitulo: TLabel
      Left = 18
      Top = 12
      Width = 312
      Height = 19
      Caption = 'Complete la ubicacion fiscal del proveedor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblAyuda: TLabel
      Left = 18
      Top = 38
      Width = 570
      Height = 28
      AutoSize = False
      Caption = 'Estos codigos son requeridos para emitir un E41 con RNC o cedula. Seleccione primero la provincia y luego el municipio.'
      WordWrap = True
    end
  end
  object grpProveedor: TGroupBox
    Left = 16
    Top = 84
    Width = 580
    Height = 188
    Caption = 'Proveedor'
    TabOrder = 1
    object lblProveedorTitulo: TLabel
      Left = 16
      Top = 24
      Width = 58
      Height = 14
      Caption = 'Proveedor:'
    end
    object lblProveedor: TLabel
      Left = 88
      Top = 24
      Width = 470
      Height = 18
      AutoSize = False
      Caption = '-'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblDocumentoTitulo: TLabel
      Left = 16
      Top = 48
      Width = 65
      Height = 14
      Caption = 'Documento:'
    end
    object lblDocumento: TLabel
      Left = 88
      Top = 48
      Width = 470
      Height = 18
      AutoSize = False
      Caption = '-'
    end
    object lblProvincia: TLabel
      Left = 16
      Top = 82
      Width = 58
      Height = 14
      Caption = 'Provincia *'
    end
    object cmbProvincia: TComboBox
      Left = 16
      Top = 100
      Width = 264
      Height = 22
      Style = csDropDownList
      ItemHeight = 14
      TabOrder = 0
      OnChange = cmbProvinciaChange
    end
    object lblCodigoProvincia: TLabel
      Left = 16
      Top = 126
      Width = 160
      Height = 14
      Caption = 'Codigo DGII: no seleccionado'
    end
    object lblMunicipio: TLabel
      Left = 300
      Top = 82
      Width = 60
      Height = 14
      Caption = 'Municipio *'
    end
    object cmbMunicipio: TComboBox
      Left = 300
      Top = 100
      Width = 264
      Height = 22
      Style = csDropDownList
      ItemHeight = 14
      TabOrder = 1
      OnChange = cmbMunicipioChange
    end
    object lblCodigoMunicipio: TLabel
      Left = 300
      Top = 126
      Width = 160
      Height = 14
      Caption = 'Codigo DGII: no seleccionado'
    end
  end
  object btnGuardar: TBitBtn
    Left = 356
    Top = 286
    Width = 112
    Height = 34
    Caption = 'Guardar'
    Default = True
    TabOrder = 2
    OnClick = btnGuardarClick
  end
  object btnCancelar: TBitBtn
    Left = 480
    Top = 286
    Width = 112
    Height = 34
    Caption = 'Cancelar'
    Cancel = True
    TabOrder = 3
    OnClick = btnCancelarClick
  end
end
