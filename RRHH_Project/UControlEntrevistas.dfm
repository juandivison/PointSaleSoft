object frmControlEntrevistas: TfrmControlEntrevistas
  Left = 192
  Top = 125
  Width = 600
  Height = 450
  Caption = 'Control de Entrevistas'
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
    Width = 111
    Height = 13
    Caption = 'Entrevistas Pendientes:'
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 32
    Width = 250
    Height = 350
    DataSource = dsEntrevistas
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object PanelDetalle: TPanel
    Left = 280
    Top = 32
    Width = 280
    Height = 350
    TabOrder = 1
    object btnVerCV: TButton
      Left = 16
      Top = 16
      Width = 150
      Height = 35
      Caption = 'Abrir Curr'#237'culum'
      TabOrder = 0
      OnClick = btnVerCVClick
    end
    object DBMemo1: TDBMemo
      Left = 16
      Top = 72
      Width = 250
      Height = 220
      DataField = 'OBSERVACIONES_ENTREVISTADOR'
      DataSource = dsEntrevistas
      TabOrder = 1
    end
    object btnGuardar: TButton
      Left = 16
      Top = 304
      Width = 100
      Height = 25
      Caption = 'Guardar'
      TabOrder = 2
      OnClick = btnGuardarClick
    end
  end
  object qEntrevistas: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = DataModule1.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT E.*, C.NOMBRE, C.RUTA_CV FROM RRHH_ENTREVISTAS E JOIN RRH' +
        'H_CANDIDATOS C ON E.COD_CANDIDATO = C.CODIGO')
    UpdateObject = IBUpdateSQL1
    Left = 104
    Top = 160
  end
  object dsEntrevistas: TDataSource
    DataSet = qEntrevistas
    Left = 152
    Top = 160
  end
  object IBUpdateSQL1: TIBUpdateSQL
    RefreshSQL.Strings = (
      
        'SELECT E.*, C.NOMBRE, C.RUTA_CV FROM RRHH_ENTREVISTAS E JOIN RRH' +
        'H_CANDIDATOS C ON E.COD_CANDIDATO = C.CODIGO WHERE E.CODIGO = :C' +
        'ODIGO')
    ModifySQL.Strings = (
      
        'UPDATE RRHH_ENTREVISTAS SET OBSERVACIONES_ENTREVISTADOR = :OBSER' +
        'VACIONES_ENTREVISTADOR WHERE CODIGO = :CODIGO')
    Left = 104
    Top = 208
  end
end
