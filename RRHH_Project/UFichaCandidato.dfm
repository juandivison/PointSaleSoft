object frmFichaCandidato: TfrmFichaCandidato
  Left = 309
  Top = 165
  Width = 589
  Height = 519
  Caption = 'Ficha de Candidato'
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
    Top = 216
    Width = 57
    Height = 13
    Caption = 'Notas Perfil:'
  end
  object Label2: TLabel
    Left = 328
    Top = 216
    Width = 24
    Height = 13
    Caption = 'Foto:'
  end
  object Image1: TImage
    Left = 328
    Top = 232
    Width = 150
    Height = 150
    Stretch = True
  end
  object Label3: TLabel
    Left = 24
    Top = 16
    Width = 56
    Height = 13
    Caption = 'Candidatos:'
  end
  object DBGrid1: TDBGrid
    Left = 24
    Top = 32
    Width = 500
    Height = 150
    DataSource = dsCandidatos
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DBMemo1: TDBMemo
    Left = 24
    Top = 232
    Width = 280
    Height = 150
    DataField = 'NOTAS_PERFIL'
    DataSource = dsCandidatos
    TabOrder = 1
  end
  object btnBuscarCV: TButton
    Left = 24
    Top = 400
    Width = 100
    Height = 25
    Caption = 'Adjuntar CV...'
    TabOrder = 2
    OnClick = btnBuscarCVClick
  end
  object btnGuardar: TButton
    Left = 144
    Top = 400
    Width = 100
    Height = 25
    Caption = 'Guardar'
    TabOrder = 3
    OnClick = btnGuardarClick
  end
  object DBEdit1: TDBEdit
    Left = 256
    Top = 402
    Width = 200
    Height = 21
    DataField = 'RUTA_CV'
    DataSource = dsCandidatos
    ReadOnly = True
    TabOrder = 4
  end
  object DBEdit2: TDBEdit
    Left = 256
    Top = 432
    Width = 200
    Height = 21
    DataField = 'RUTA_FOTO'
    DataSource = dsCandidatos
    TabOrder = 5
  end
  object qCandidatos: TIBQuery
    Database = DataModule1.IBDatabase1
    Transaction = DataModule1.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM RRHH_CANDIDATOS')
    UpdateObject = IBUpdateSQL1
    Left = 400
    Top = 56
  end
  object dsCandidatos: TDataSource
    DataSet = qCandidatos
    OnDataChange = dsCandidatosDataChange
    Left = 504
    Top = 48
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Archivos CV (*.pdf;*.doc;*.docx)|*.pdf;*.doc;*.docx|Todos|*.*'
    Left = 464
    Top = 96
  end
  object IBUpdateSQL1: TIBUpdateSQL
    RefreshSQL.Strings = (
      'SELECT * FROM RRHH_CANDIDATOS WHERE CODIGO = :CODIGO')
    ModifySQL.Strings = (
      
        'UPDATE RRHH_CANDIDATOS SET RUTA_CV = :RUTA_CV, RUTA_FOTO = :RUTA' +
        '_FOTO, NOTAS_PERFIL = :NOTAS_PERFIL WHERE CODIGO = :CODIGO')
    InsertSQL.Strings = (
      
        'INSERT INTO RRHH_CANDIDATOS (CODIGO, RUTA_CV, RUTA_FOTO, NOTAS_P' +
        'ERFIL) VALUES (:CODIGO, :RUTA_CV, :RUTA_FOTO, :NOTAS_PERFIL)')
    Left = 464
    Top = 144
  end
  object IBUpdateSQL2: TIBUpdateSQL
    Left = 472
    Top = 208
  end
end
