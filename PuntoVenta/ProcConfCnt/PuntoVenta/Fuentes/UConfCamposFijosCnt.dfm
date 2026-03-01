object frmCamposFijosCnt: TfrmCamposFijosCnt
  Left = 471
  Top = 146
  Width = 398
  Height = 311
  Caption = 'Campos fijos CNT'
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
  object Label23: TLabel
    Left = 8
    Top = 8
    Width = 91
    Height = 13
    Caption = 'NOMBRE_CAMPO'
    FocusControl = DBEdit16
  end
  object Label24: TLabel
    Left = 208
    Top = 8
    Width = 113
    Height = 13
    Caption = 'NOMBRE_CAMPODET'
    FocusControl = DBEdit17
  end
  object DBStatusLabel1: TDBStatusLabel
    Left = 240
    Top = 64
    Width = 85
    Height = 13
    DatasetName = 'Trans'
    DataSource = dstblDistCntDet
  end
  object DBEdit16: TDBEdit
    Left = 8
    Top = 24
    Width = 185
    Height = 21
    DataField = 'NOMBRE_CAMPO'
    DataSource = dstblDistCntDet
    TabOrder = 0
  end
  object DBEdit17: TDBEdit
    Left = 200
    Top = 24
    Width = 161
    Height = 21
    DataField = 'NOMBRE_CAMPODET'
    DataSource = dstblDistCntDet
    TabOrder = 1
  end
  object RxDBGrid3: TRxDBGrid
    Left = 6
    Top = 85
    Width = 355
    Height = 156
    Hint = 'Usado para buscar valores no numerico'
    DataSource = dstblDistCntDet
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'SERIE'
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBRE_CAMPO'
        Width = 97
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBRE_CAMPODET'
        Visible = True
      end>
  end
  object BitBtn14: TBitBtn
    Left = 8
    Top = 48
    Width = 97
    Height = 25
    Caption = 'Nuevo C.Det'
    TabOrder = 3
    OnClick = BitBtn14Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000010000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      33333333FF33333333FF333993333333300033377F3333333777333993333333
      300033F77FFF3333377739999993333333333777777F3333333F399999933333
      33003777777333333377333993333333330033377F3333333377333993333333
      3333333773333333333F333333333333330033333333F33333773333333C3333
      330033333337FF3333773333333CC333333333FFFFF77FFF3FF33CCCCCCCCCC3
      993337777777777F77F33CCCCCCCCCC3993337777777777377333333333CC333
      333333333337733333FF3333333C333330003333333733333777333333333333
      3000333333333333377733333333333333333333333333333333}
    NumGlyphs = 2
  end
  object BitBtn15: TBitBtn
    Left = 111
    Top = 48
    Width = 79
    Height = 25
    Caption = 'Guardar'
    TabOrder = 4
    OnClick = BitBtn15Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000010000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
      7700333333337777777733333333008088003333333377F73377333333330088
      88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
      000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
      FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
      99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
      99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
      99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
      93337FFFF7737777733300000033333333337777773333333333}
    NumGlyphs = 2
  end
  object dstblDistCntDet: TDataSource
    DataSet = tblDistCntDet
    Left = 56
    Top = 176
  end
  object tblDistCntDet: TIBDataSet
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from DISTRIBUCION_CNT_DET'
      'where'
      '  SERIE = :OLD_SERIE')
    InsertSQL.Strings = (
      'insert into DISTRIBUCION_CNT_DET'
      '  (SERIE, NOMBRE_CAMPO, NOMBRE_CAMPODET)'
      'values'
      '  (:SERIE, :NOMBRE_CAMPO, :NOMBRE_CAMPODET)')
    RefreshSQL.Strings = (
      'Select '
      '  SERIE,'
      '  NOMBRE_CAMPO,'
      '  NOMBRE_CAMPODET'
      'from DISTRIBUCION_CNT_DET '
      'where'
      '  SERIE = :SERIE')
    SelectSQL.Strings = (
      'Select * from DISTRIBUCION_CNT_DET'
      '')
    ModifySQL.Strings = (
      'update DISTRIBUCION_CNT_DET'
      'set'
      '  SERIE = :SERIE,'
      '  NOMBRE_CAMPO = :NOMBRE_CAMPO,'
      '  NOMBRE_CAMPODET = :NOMBRE_CAMPODET'
      'where'
      '  SERIE = :OLD_SERIE')
    Left = 131
    Top = 129
    object tblDistCntDetSERIE: TIntegerField
      FieldName = 'SERIE'
      Origin = 'DISTRIBUCION_CNT_DET.SERIE'
      Required = True
    end
    object tblDistCntDetNOMBRE_CAMPO: TIBStringField
      FieldName = 'NOMBRE_CAMPO'
      Origin = 'DISTRIBUCION_CNT_DET.NOMBRE_CAMPO'
      Size = 40
    end
    object tblDistCntDetNOMBRE_CAMPODET: TIBStringField
      FieldName = 'NOMBRE_CAMPODET'
      Origin = 'DISTRIBUCION_CNT_DET.NOMBRE_CAMPODET'
      Size = 40
    end
  end
end
