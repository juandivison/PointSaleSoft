object frmMain: TfrmMain
  Left = 195
  Top = 120
  Width = 1073
  Height = 516
  Caption = 'Cargar RNC DGII'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 664
    Top = 16
    Width = 63
    Height = 13
    Caption = 'Record Proc:'
  end
  object Label2: TLabel
    Left = 840
    Top = 16
    Width = 45
    Height = 13
    Caption = 'Rec Error'
  end
  object Label3: TLabel
    Left = 24
    Top = 392
    Width = 32
    Height = 13
    Caption = 'Label3'
  end
  object Label4: TLabel
    Left = 24
    Top = 410
    Width = 32
    Height = 13
    Caption = 'Label3'
  end
  object DBStatusLabel1: TDBStatusLabel
    Left = 928
    Top = 392
    Width = 85
    Height = 13
    DatasetName = 'Trans'
    DataSource = dsqryDatosRNCDGII
  end
  object Label5: TLabel
    Left = 928
    Top = 408
    Width = 3
    Height = 13
  end
  object Label6: TLabel
    Left = 136
    Top = 464
    Width = 23
    Height = 13
    Caption = 'RNC'
  end
  object BitBtn1: TBitBtn
    Left = 24
    Top = 8
    Width = 97
    Height = 25
    Caption = '&Cargar Datos'
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object RxDBGrid1: TRxDBGrid
    Left = 23
    Top = 40
    Width = 818
    Height = 337
    DataSource = dsqryDatosRNCDGII
    FixedColor = 4259584
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnKeyDown = RxDBGrid1KeyDown
    RowColor2 = 16776176
    Columns = <
      item
        Expanded = False
        FieldName = 'RNC'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RAZONSOCIAL'
        Width = 136
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMBRE_CIA'
        Width = 168
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ACTIVIDAD'
        Width = 109
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DIR_CALLE'
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DIR_NUMERO'
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SECTOR'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TELEFONO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FECHA_INI_OPE'
        Width = 85
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STATUS'
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CONDICION'
        Width = 52
        Visible = True
      end>
  end
  object ProgressBar1: TProgressBar
    Left = 133
    Top = 12
    Width = 516
    Height = 17
    Step = 1
    TabOrder = 2
  end
  object edtRecordProc: TEditN
    Left = 736
    Top = 11
    Width = 65
    Height = 21
    Color = clSilver
    TabOrder = 3
    ColorOnFocus = clWhite
    ColorOnNotFocus = clSilver
    FontColorOnFocus = clRed
    FontColorOnNotFocus = clBlack
    FontColorOnOverWrite = clBlue
    EditType = etInteger
    EditKeyByTab = #9
    EditAlign = etAlignNone
    EditLengthAlign = 0
    EditPrecision = 0
    ValueInteger = 0
    ValueDate = 43086.000000000000000000
    ValueTime = 0.747454525462963000
    TimeSeconds = False
    FirstCharUpper = False
    FirstCharUpList = ' ('
    WidthOnFocus = 0
    TextHint = True
  end
  object edtnRecErr: TEditN
    Left = 895
    Top = 11
    Width = 73
    Height = 21
    Color = clSilver
    TabOrder = 4
    ColorOnFocus = clWhite
    ColorOnNotFocus = clSilver
    FontColorOnFocus = clRed
    FontColorOnNotFocus = clBlack
    FontColorOnOverWrite = clBlue
    EditType = etInteger
    EditKeyByTab = #9
    EditAlign = etAlignNone
    EditLengthAlign = 0
    EditPrecision = 0
    ValueInteger = 0
    ValueDate = 43086.000000000000000000
    ValueTime = 0.747454525462963000
    TimeSeconds = False
    FirstCharUpper = False
    FirstCharUpList = ' ('
    WidthOnFocus = 0
    TextHint = True
  end
  object btnCerarAbrirres: TBitBtn
    Left = 544
    Top = 400
    Width = 125
    Height = 39
    Caption = '&Refrescar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = btnCerarAbrirresClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000010000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333444444
      33333333333F8888883F33330000324334222222443333388F3833333388F333
      000032244222222222433338F8833FFFFF338F3300003222222AAAAA22243338
      F333F88888F338F30000322222A33333A2224338F33F8333338F338F00003222
      223333333A224338F33833333338F38F00003222222333333A444338FFFF8F33
      3338888300003AAAAAAA33333333333888888833333333330000333333333333
      333333333333333333FFFFFF000033333333333344444433FFFF333333888888
      00003A444333333A22222438888F333338F3333800003A2243333333A2222438
      F38F333333833338000033A224333334422224338338FFFFF8833338000033A2
      22444442222224338F3388888333FF380000333A2222222222AA243338FF3333
      33FF88F800003333AA222222AA33A3333388FFFFFF8833830000333333AAAAAA
      3333333333338888883333330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 688
    Top = 400
    Width = 113
    Height = 41
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    Kind = bkClose
  end
  object RxClock1: TRxClock
    Left = 24
    Top = 424
    Width = 65
    Height = 25
  end
  object BitBtn3: TBitBtn
    Left = 184
    Top = 400
    Width = 145
    Height = 41
    Caption = '&Eliminar Todo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    OnClick = BitBtn3Click
  end
  object BitBtn4: TBitBtn
    Left = 344
    Top = 400
    Width = 169
    Height = 41
    Caption = 'Elimina Record(s)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    OnClick = BitBtn4Click
  end
  object RxDBGrid2: TRxDBGrid
    Left = 848
    Top = 40
    Width = 196
    Height = 337
    DataSource = dsrxData
    TabOrder = 10
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    RowColor2 = 16776176
    Columns = <
      item
        Expanded = False
        FieldName = 'Insertado'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Actualizado'
        Visible = True
      end>
  end
  object Edit1: TEdit
    Left = 184
    Top = 456
    Width = 145
    Height = 21
    TabOrder = 11
  end
  object Button1: TButton
    Left = 344
    Top = 456
    Width = 75
    Height = 25
    Caption = 'Buscar'
    TabOrder = 12
    OnClick = Button1Click
  end
  object IBDatabase1: TIBDatabase
    DatabaseName = 'C:\Proyectos\Datos\RNC_DGII\DGII_RNC.FDB'
    Params.Strings = (
      'user_name=sysdba'
      'password=sup2005')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    AllowStreamedConnected = False
    AfterConnect = IBDatabase1AfterConnect
    BeforeConnect = IBDatabase1BeforeConnect
    Left = 90
    Top = 61
  end
  object IBTransaction1: TIBTransaction
    Active = False
    DefaultDatabase = IBDatabase1
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    AutoStopAction = saNone
    Left = 85
    Top = 114
  end
  object IBDatabaseInfo1: TIBDatabaseInfo
    Database = IBDatabase1
    Left = 87
    Top = 164
  end
  object IBEvents1: TIBEvents
    AutoRegister = True
    Database = IBDatabase1
    Registered = False
    OnError = IBEvents1Error
    Left = 88
    Top = 222
  end
  object ibsqlInsertDatos: TIBSQL
    Database = IBDatabase1
    GoToFirstRecordOnExecute = False
    ParamCheck = True
    SQL.Strings = (
      
        'INSERT INTO RNCCEDULA (RNC, RAZONSOCIAL, NOMBRE_CIA, ACTIVIDAD, ' +
        'DIR_CALLE, DIR_NUMERO, SECTOR, TELEFONO, FECHA_INI_OPE, STATUS, ' +
        'CONDICION)'
      ' VALUES ('
      ':RNC, '
      ':RAZONSOCIAL, '
      ':NOMBRE_CIA, '
      ':ACTIVIDAD, '
      ':DIR_CALLE, '
      ':DIR_NUMERO, '
      ':SECTOR, '
      ':TELEFONO, '
      ':FECHA_INI_OPE, '
      ':STATUS, '
      ':CONDICION'
      ')')
    Transaction = IBTransaction1
    Left = 264
    Top = 104
  end
  object qryDatosRNCDGII: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'Select * from RNCCEDULA ')
    Left = 408
    Top = 104
    object qryDatosRNCDGIIRNC: TIBStringField
      FieldName = 'RNC'
      Origin = 'RNCCEDULA.RNC'
      Required = True
      Size = 11
    end
    object qryDatosRNCDGIIRAZONSOCIAL: TIBStringField
      FieldName = 'RAZONSOCIAL'
      Origin = 'RNCCEDULA.RAZONSOCIAL'
      Required = True
      Size = 80
    end
    object qryDatosRNCDGIINOMBRE_CIA: TIBStringField
      FieldName = 'NOMBRE_CIA'
      Origin = 'RNCCEDULA.NOMBRE_CIA'
      Size = 80
    end
    object qryDatosRNCDGIIACTIVIDAD: TIBStringField
      FieldName = 'ACTIVIDAD'
      Origin = 'RNCCEDULA.ACTIVIDAD'
      Size = 80
    end
    object qryDatosRNCDGIIDIR_CALLE: TIBStringField
      FieldName = 'DIR_CALLE'
      Origin = 'RNCCEDULA.DIR_CALLE'
      Size = 80
    end
    object qryDatosRNCDGIIDIR_NUMERO: TIBStringField
      FieldName = 'DIR_NUMERO'
      Origin = 'RNCCEDULA.DIR_NUMERO'
      Size = 80
    end
    object qryDatosRNCDGIISECTOR: TIBStringField
      FieldName = 'SECTOR'
      Origin = 'RNCCEDULA.SECTOR'
      Size = 80
    end
    object qryDatosRNCDGIITELEFONO: TIBStringField
      FieldName = 'TELEFONO'
      Origin = 'RNCCEDULA.TELEFONO'
      Size = 80
    end
    object qryDatosRNCDGIIFECHA_INI_OPE: TIBStringField
      FieldName = 'FECHA_INI_OPE'
      Origin = 'RNCCEDULA.FECHA_INI_OPE'
      Size = 80
    end
    object qryDatosRNCDGIISTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'RNCCEDULA.STATUS'
      Required = True
      Size = 80
    end
    object qryDatosRNCDGIICONDICION: TIBStringField
      FieldName = 'CONDICION'
      Origin = 'RNCCEDULA.CONDICION'
      Required = True
      Size = 80
    end
  end
  object dsqryDatosRNCDGII: TDataSource
    DataSet = qryDatosRNCDGII
    Left = 408
    Top = 168
  end
  object ibsqlDeleteAll: TIBSQL
    Database = IBDatabase1
    GoToFirstRecordOnExecute = False
    ParamCheck = True
    SQL.Strings = (
      'Delete from RNCCEDULA ')
    Transaction = IBTransaction1
    Left = 264
    Top = 168
  end
  object qryConsulta: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT r.RNC'
      'FROM RNCCEDULA r'
      'Where RNC =:rnccedula')
    Left = 608
    Top = 216
    ParamData = <
      item
        DataType = ftString
        Name = 'rnccedula'
        ParamType = ptInput
      end>
  end
  object ibsqlUpdate: TIBSQL
    Database = IBDatabase1
    ParamCheck = True
    SQL.Strings = (
      'update'
      '  RNCCEDULA'
      'set '
      '  RAZONSOCIAL=:v1,'
      '  NOMBRE_CIA=:v2,'
      '  ACTIVIDAD=:v3,'
      '  DIR_CALLE=:v4,'
      '  DIR_NUMERO=:v5,'
      '  SECTOR=:v6,'
      '  TELEFONO=:v7,'
      '  FECHA_INI_OPE =:v8,'
      '  STATUS        =:v9,'
      '  CONDICION     =:v10'
      'where'
      '  RNC =:rnc;')
    Transaction = IBTransaction1
    Left = 264
    Top = 240
  end
  object rxData: TRxMemoryData
    FieldDefs = <
      item
        Name = 'Insertado'
        DataType = ftInteger
      end
      item
        Name = 'Actualizado'
        DataType = ftInteger
      end>
    Left = 904
    Top = 72
    object rxDataInsertado: TIntegerField
      FieldName = 'Insertado'
    end
    object rxDataActualizado: TIntegerField
      FieldName = 'Actualizado'
    end
  end
  object dsrxData: TDataSource
    DataSet = rxData
    Left = 912
    Top = 152
  end
end
