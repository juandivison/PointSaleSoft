object frmAuditoriaInv: TfrmAuditoriaInv
  Left = 201
  Top = 117
  Width = 1296
  Height = 675
  Caption = 'Auditoria Inventario'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 16
    Top = 8
    Width = 1209
    Height = 617
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Hint = 'Cantidad de Productos Registrados por dia'
      Caption = 'ProdRegPorDia'
      ParentShowHint = False
      ShowHint = True
      object RxDBGrid1: TRxDBGrid
        Left = 8
        Top = 96
        Width = 497
        Height = 417
        DataSource = DataSource1
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        RowColor2 = 16776176
      end
      object BitBtn1: TBitBtn
        Left = 16
        Top = 16
        Width = 75
        Height = 25
        Caption = 'Datos'
        TabOrder = 1
        OnClick = BitBtn1Click
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Prod Sin Ventas'
      ImageIndex = 1
    end
  end
  object qryCantProdReg: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select count(F_STRIPTIME(r.FECHA)) Cant,'
      'F_STRIPTIME(r.fecha) fecha'
      'From INVENTARIO_PRODUCTO r'
      'where r.FECHA_ULTIMA_TRN is null'
      'group by F_STRIPTIME(r.fecha) '
      'order by F_STRIPTIME(r.fecha) desc')
    Left = 176
    Top = 72
    object qryCantProdRegCANT: TIntegerField
      DisplayWidth = 8
      FieldName = 'CANT'
      Required = True
    end
    object qryCantProdRegFECHA: TDateTimeField
      DisplayWidth = 22
      FieldName = 'FECHA'
    end
  end
  object DataSource1: TDataSource
    DataSet = qryCantProdReg
    Left = 632
    Top = 320
  end
  object IBQuery1: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    Left = 444
    Top = 96
  end
end
