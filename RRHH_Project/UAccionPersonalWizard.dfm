object frmAccionPersonalWizard: TfrmAccionPersonalWizard
  Left = 200
  Top = 150
  Width = 500
  Height = 450
  Caption = 'Asistente de Acciones de Personal'
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
    Left = 24
    Top = 24
    Width = 50
    Height = 13
    Caption = 'Empleado:'
  end
  object Label2: TLabel
    Left = 24
    Top = 64
    Width = 75
    Height = 13
    Caption = 'Tipo de Acci'#243'n:'
  end
  object Label3: TLabel
    Left = 24
    Top = 104
    Width = 65
    Height = 13
    Caption = 'Dato Anterior:'
  end
  object Label4: TLabel
    Left = 24
    Top = 144
    Width = 61
    Height = 13
    Caption = 'Dato Nuevo:'
  end
  object Label5: TLabel
    Left = 24
    Top = 184
    Width = 61
    Height = 13
    Caption = 'Justificaci'#243'n:'
  end
  object Label6: TLabel
    Left = 24
    Top = 288
    Width = 98
    Height = 13
    Caption = 'Documento Soporte:'
  end
  object dbcbEmpleado: TDBLookupComboBox
    Left = 136
    Top = 20
    Width = 250
    Height = 21
    KeyField = 'CODIGO'
    ListField = 'NOMBRE'
    ListSource = dsEmpleados
    TabOrder = 0
    OnClick = dbcbEmpleadoClick
  end
  object dbcbTipoAccion: TDBLookupComboBox
    Left = 136
    Top = 60
    Width = 250
    Height = 21
    KeyField = 'CODIGO'
    ListField = 'DESCRIPCION'
    ListSource = dsTiposAccion
    TabOrder = 1
  end
  object edtDatoAnterior: TEdit
    Left = 136
    Top = 100
    Width = 250
    Height = 21
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 2
  end
  object edtDatoNuevo: TEdit
    Left = 136
    Top = 140
    Width = 250
    Height = 21
    TabOrder = 3
  end
  object memoJustificacion: TMemo
    Left = 136
    Top = 180
    Width = 250
    Height = 89
    TabOrder = 4
  end
  object edtRutaSoporte: TEdit
    Left = 136
    Top = 284
    Width = 200
    Height = 21
    TabOrder = 5
  end
  object btnBuscarSoporte: TButton
    Left = 344
    Top = 282
    Width = 43
    Height = 25
    Caption = '...'
    TabOrder = 6
    OnClick = btnBuscarSoporteClick
  end
  object btnProcesar: TButton
    Left = 136
    Top = 336
    Width = 100
    Height = 35
    Caption = 'Procesar'
    TabOrder = 7
    OnClick = btnProcesarClick
  end
  object qEmpleados: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = DataModule1.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT CODIGO, NOMBRE || '#39' '#39' || APELLIDO AS NOMBRE, SALARIO FROM' +
        ' EMPLEADO')
    Left = 416
    Top = 24
  end
  object dsEmpleados: TDataSource
    DataSet = qEmpleados
    Left = 456
    Top = 24
  end
  object qTiposAccion: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = DataModule1.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT CODIGO, DESCRIPCION FROM RRHH_TIPOS_ACCION')
    Left = 416
    Top = 72
  end
  object dsTiposAccion: TDataSource
    DataSet = qTiposAccion
    Left = 456
    Top = 72
  end
  object IBTransactionTrans: TIBTransaction
    Active = False
    DefaultDatabase = DataModule1.IBDatabase1
    AutoStopAction = saNone
    Left = 336
    Top = 344
  end
  object qTransaccion: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = IBTransactionTrans
    BufferChunks = 1000
    CachedUpdates = False
    Left = 432
    Top = 328
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Archivos PDF (*.pdf)|*.pdf|Todos los archivos (*.*)|*.*'
    Left = 416
    Top = 280
  end
end
