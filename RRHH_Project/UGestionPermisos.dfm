object frmGestionPermisos: TfrmGestionPermisos
  Left = 333
  Top = 237
  Width = 400
  Height = 250
  Caption = 'Gesti'#243'n de Licencias'
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
    Width = 81
    Height = 13
    Caption = 'Nro. de Licencia:'
  end
  object Label3: TLabel
    Left = 24
    Top = 104
    Width = 67
    Height = 13
    Caption = 'Fecha Vence:'
  end
  object dbcbEmpleado: TDBLookupComboBox
    Left = 120
    Top = 20
    Width = 200
    Height = 21
    KeyField = 'CODIGO'
    ListField = 'NOMBRE'
    ListSource = dsEmpleados
    TabOrder = 0
    OnClick = dbcbEmpleadoClick
  end
  object edtLicencia: TEdit
    Left = 120
    Top = 60
    Width = 200
    Height = 21
    TabOrder = 1
  end
  object dtpFechaVence: TDateTimePicker
    Left = 120
    Top = 100
    Width = 200
    Height = 21
    Date = 45000.500000000000000000
    Time = 45000.500000000000000000
    TabOrder = 2
  end
  object btnActualizar: TButton
    Left = 120
    Top = 144
    Width = 100
    Height = 35
    Caption = 'Actualizar'
    TabOrder = 3
    OnClick = btnActualizarClick
  end
  object qEmpleados: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = DataModule1.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT CODIGO, NOMBRE || '#39' '#39' || APELLIDO AS NOMBRE, LICENCIA, FE' +
        'CHA_VENCE_LICENCIA FROM EMPLEADO')
    Left = 336
    Top = 16
  end
  object dsEmpleados: TDataSource
    DataSet = qEmpleados
    Left = 336
    Top = 64
  end
  object qUpdate: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = DataModule1.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 336
    Top = 112
  end
end
