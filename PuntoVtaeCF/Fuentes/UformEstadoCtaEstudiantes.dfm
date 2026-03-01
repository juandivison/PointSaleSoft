object frmEstadoCtaMensEstu: TfrmEstadoCtaMensEstu
  Left = 390
  Top = 133
  Width = 850
  Height = 490
  Caption = 'Estado Mensualidad Estudiantes'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RxDBGrid1: TRxDBGrid
    Left = 8
    Top = 16
    Width = 745
    Height = 113
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO_CTE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBRE_CTE'
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DIRECCION_CONT'
        Width = 102
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRIMERNOMBRE'
        Width = 97
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SEGUNDONOMBRE'
        Width = 107
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRIMERAPELLIDO'
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SEGUNDOAPELLIDO'
        Width = 113
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TELEF_CONTACTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CIUDAD'
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CEDULA'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ID_ESTUDIANTE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SECCION'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPCION'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IDANOESCOLAR'
        Visible = True
      end>
  end
  object RxDBGrid2: TRxDBGrid
    Left = 8
    Top = 144
    Width = 745
    Height = 225
    DataSource = DataSource2
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'IDANOESCOLAR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IDESTUDIANTE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA_PAGO'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MONTO'
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STATUS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COD_USUARIO'
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
        FieldName = 'FECHA_UPDATE'
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = dmEstudiante.qryRepPagosAtrasoEstudianteMaster
    Left = 128
    Top = 160
  end
  object DataSource2: TDataSource
    DataSet = dmEstudiante.qryRepPagosAtrasoEstudiante
    Left = 272
    Top = 152
  end
end
