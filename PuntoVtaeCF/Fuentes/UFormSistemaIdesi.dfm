object frmSistemaIdesi: TfrmSistemaIdesi
  Left = 210
  Top = 205
  Width = 927
  Height = 375
  Caption = 'Sistema'
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
  object RxDBGrid1: TRxDBGrid
    Left = 8
    Top = 16
    Width = 897
    Height = 257
    DataSource = dstblAdoSistema
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    RowColor2 = 16776176
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'idsistema'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'idcliente'
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nombrecliente'
        Width = 236
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cont_aviso'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Fecha_Suspencion'
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Fecha_activado'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'estado'
        Width = 104
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 360
    Top = 296
    Width = 75
    Height = 25
    Caption = 'Guardar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 456
    Top = 296
    Width = 75
    Height = 25
    Caption = 'Refrescar'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 272
    Top = 296
    Width = 75
    Height = 25
    Caption = 'Insertar'
    TabOrder = 3
    OnClick = Button3Click
  end
  object dstblAdoSistema: TDataSource
    DataSet = dmSistema.tblADOSistema
    Left = 304
    Top = 176
  end
end
