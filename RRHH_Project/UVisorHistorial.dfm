object frmVisorHistorial: TfrmVisorHistorial
  Left = 192
  Top = 125
  Width = 550
  Height = 400
  Caption = 'Visor de Historial'
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
    Left = 16
    Top = 16
    Width = 110
    Height = 13
    Caption = 'Seleccione Empleado:'
  end
  object dbcbEmpleado: TDBLookupComboBox
    Left = 144
    Top = 12
    Width = 250
    Height = 21
    KeyField = 'CODIGO'
    ListField = 'NOMBRE'
    ListSource = dsEmpleados
    TabOrder = 0
    OnClick = dbcbEmpleadoClick
  end
  object DBGridHistorial: TDBGrid
    Left = 16
    Top = 56
    Width = 500
    Height = 280
    DataSource = dsHistorial
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object qEmpleados: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = DataModule1.IBTransaction1
    SQL.Strings = (
      'SELECT CODIGO, NOMBRE || '' '' || APELLIDO AS NOMBRE FROM EMPLEADO')
    Left = 416
    Top = 8
  end
  object dsEmpleados: TDataSource
    DataSet = qEmpleados
    Left = 456
    Top = 8
  end
  object qHistorial: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = DataModule1.IBTransaction1
    SQL.Strings = (
      'SELECT A.FECHA_ACCION, T.DESCRIPCION, A.DATO_ANTERIOR, A.DATO_NUEVO ' +
      'FROM RRHH_ACCIONES_PERSONAL A ' +
      'JOIN RRHH_TIPOS_ACCION T ON A.TIPO_ACCION = T.CODIGO ' +
      'WHERE A.COD_EMPLEADO = :EMP ' +
      'ORDER BY A.FECHA_ACCION DESC')
    Left = 416
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EMP'
        ParamType = ptUnknown
      end>
  end
  object dsHistorial: TDataSource
    DataSet = qHistorial
    Left = 456
    Top = 56
  end
end
