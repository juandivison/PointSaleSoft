object frmEmpleadoPensionAlimenticia: TfrmEmpleadoPensionAlimenticia
  Left = 230
  Top = 120
  Width = 955
  Height = 671
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Pensiones Alimenticias del Empleado'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 947
    Height = 58
    Align = alTop
    BevelOuter = bvNone
    Color = clNavy
    TabOrder = 0
    object lblTitulo: TLabel
      Left = 16
      Top = 10
      Width = 262
      Height = 16
      Caption = 'Pensiones alimenticias por empleado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblSubTitulo: TLabel
      Left = 16
      Top = 33
      Width = 411
      Height = 13
      Caption = 
        'Registre, consulte, inactive o reactive pensiones alimenticias r' +
        'ecurrentes del empleado.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 588
    Width = 947
    Height = 52
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object btnGuardar: TButton
      Left = 462
      Top = 13
      Width = 85
      Height = 25
      Caption = 'Guardar'
      TabOrder = 0
      OnClick = btnGuardarClick
    end
    object btnNuevo: TButton
      Left = 552
      Top = 13
      Width = 85
      Height = 25
      Caption = 'Nuevo'
      TabOrder = 1
      OnClick = btnNuevoClick
    end
    object btnInactivar: TButton
      Left = 642
      Top = 13
      Width = 85
      Height = 25
      Caption = 'Inactivar'
      TabOrder = 2
      OnClick = btnInactivarClick
    end
    object btnReactivar: TButton
      Left = 732
      Top = 13
      Width = 85
      Height = 25
      Caption = 'Reactivar'
      TabOrder = 3
      OnClick = btnReactivarClick
    end
    object btnCerrar: TButton
      Left = 822
      Top = 13
      Width = 85
      Height = 25
      Caption = 'Cerrar'
      TabOrder = 4
      OnClick = btnCerrarClick
    end
  end
  object pnlDatos: TPanel
    Left = 0
    Top = 58
    Width = 947
    Height = 250
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object lblCiaKey: TLabel
      Left = 20
      Top = 16
      Width = 50
      Height = 13
      Caption = 'Compania:'
    end
    object lblCodigoEmp: TLabel
      Left = 355
      Top = 16
      Width = 85
      Height = 13
      Caption = 'Codigo empleado:'
    end
    object lblSalarioEmpleado: TLabel
      Left = 20
      Top = 52
      Width = 84
      Height = 13
      Caption = 'Salario empleado:'
    end
    object lblBeneficiario: TLabel
      Left = 20
      Top = 88
      Width = 114
      Height = 13
      Caption = 'Nombre del beneficiario:'
    end
    object lblDocumento: TLabel
      Left = 570
      Top = 88
      Width = 93
      Height = 13
      Caption = 'Cedula beneficiario:'
    end
    object lblConcepto: TLabel
      Left = 20
      Top = 124
      Width = 49
      Height = 13
      Caption = 'Concepto:'
    end
    object lblMonto: TLabel
      Left = 20
      Top = 160
      Width = 33
      Height = 13
      Caption = 'Monto:'
    end
    object lblQuincena: TLabel
      Left = 260
      Top = 160
      Width = 102
      Height = 13
      Caption = 'Quincena descuento:'
    end
    object lblFechaInicio: TLabel
      Left = 570
      Top = 160
      Width = 60
      Height = 13
      Caption = 'Fecha inicio:'
    end
    object lblFechaFin: TLabel
      Left = 735
      Top = 160
      Width = 47
      Height = 13
      Caption = 'Fecha fin:'
    end
    object lblTextoLibre: TLabel
      Left = 20
      Top = 196
      Width = 63
      Height = 13
      Caption = 'Observacion:'
    end
    object lblEstado: TLabel
      Left = 735
      Top = 196
      Width = 36
      Height = 13
      Caption = 'Estado:'
    end
    object lkpCompania: TRxDBLookupCombo
      Left = 145
      Top = 12
      Width = 195
      Height = 21
      DropDownCount = 8
      LookupField = 'CODIGO'
      LookupDisplay = 'NOMBRE_CIA'
      LookupSource = dsCompaniaLookup
      TabOrder = 0
      OnChange = lkpCompaniaChange
    end
    object lkpEmpleado: TRxDBLookupCombo
      Left = 445
      Top = 12
      Width = 355
      Height = 21
      DropDownCount = 8
      LookupField = 'CODIGO'
      LookupDisplay = 'NOMBRE_COMPLETO'
      LookupSource = dsEmpleadoLookup
      TabOrder = 1
      OnChange = lkpEmpleadoChange
    end
    object btnBuscarEmpleado: TButton
      Left = 810
      Top = 10
      Width = 95
      Height = 25
      Caption = 'Buscar...'
      TabOrder = 2
      OnClick = btnBuscarEmpleadoClick
    end
    object edtSalarioEmpleado: TEdit
      Left = 145
      Top = 48
      Width = 120
      Height = 21
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 3
      Text = '0.00'
    end
    object edtBeneficiario: TEdit
      Left = 145
      Top = 84
      Width = 405
      Height = 21
      TabOrder = 4
    end
    object edtDocumento: TEdit
      Left = 675
      Top = 84
      Width = 230
      Height = 21
      TabOrder = 5
    end
    object edtConcepto: TEdit
      Left = 145
      Top = 120
      Width = 760
      Height = 21
      TabOrder = 6
      Text = 'Pension alimenticia'
    end
    object edtMonto: TEdit
      Left = 145
      Top = 156
      Width = 100
      Height = 21
      TabOrder = 7
      Text = '0.00'
    end
    object cbQuincena: TComboBox
      Left = 370
      Top = 156
      Width = 180
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 8
      Items.Strings = (
        '1 - Primera quincena'
        '2 - Segunda quincena'
        '3 - Ambas quincenas')
    end
    object dtpFechaInicio: TDateTimePicker
      Left = 635
      Top = 156
      Width = 90
      Height = 21
      Date = 45000.000000000000000000
      Time = 45000.000000000000000000
      ShowCheckbox = True
      TabOrder = 9
    end
    object dtpFechaFin: TDateTimePicker
      Left = 810
      Top = 156
      Width = 95
      Height = 21
      Date = 45000.000000000000000000
      Time = 45000.000000000000000000
      ShowCheckbox = True
      TabOrder = 10
    end
    object edtTextoLibre: TEdit
      Left = 145
      Top = 192
      Width = 570
      Height = 21
      TabOrder = 11
    end
    object cbVigente: TCheckBox
      Left = 810
      Top = 194
      Width = 95
      Height = 17
      Caption = 'Vigente'
      Checked = True
      State = cbChecked
      TabOrder = 12
    end
  end
  object pnlGrid: TPanel
    Left = 0
    Top = 308
    Width = 947
    Height = 280
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 3
    DesignSize = (
      947
      280)
    object lblGrid: TLabel
      Left = 12
      Top = 8
      Width = 323
      Height = 13
      Caption = 'Pensiones registradas. Doble clic para cargar el registro.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object grdPensiones: TRxDBGrid
      Left = 12
      Top = 28
      Width = 906
      Height = 240
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dsPension
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = grdPensionesDblClick
      RowColor2 = 16776176
      Columns = <
        item
          Expanded = False
          FieldName = 'ID_PENSION'
          Title.Caption = 'ID'
          Width = 45
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CODIGO_CIA'
          Title.Caption = 'Cia'
          Width = 45
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COMPANIA'
          Title.Caption = 'Compania'
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CODIGO_EMP'
          Title.Caption = 'Empleado'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EMPLEADO'
          Title.Caption = 'Nombre empleado'
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'BENEFICIARIO'
          Title.Caption = 'Beneficiario'
          Width = 140
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CEDULA_BENEFICIARIO'
          Title.Caption = 'Cedula beneficiario'
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MONTO'
          Title.Caption = 'Monto'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QUINCENA_DESCUENTO'
          Title.Caption = 'Quincena'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ACTIVA'
          Title.Caption = 'Vigente'
          Width = 50
          Visible = True
        end>
    end
  end
  object dsEmpleadoLookup: TDataSource
    DataSet = qryEmpleadoLookup
    Left = 72
    Top = 380
  end
  object dsCompaniaLookup: TDataSource
    DataSet = qryCompaniaLookup
    Left = 168
    Top = 380
  end
  object dsPension: TDataSource
    DataSet = qryPension
    Left = 264
    Top = 380
  end
  object qryEmpleadoLookup: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 72
    Top = 428
  end
  object qryCompaniaLookup: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 168
    Top = 428
  end
  object qryPension: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 264
    Top = 428
  end
  object qryExec: TIBQuery
    Database = dmConectar.IBDatabase1
    Transaction = dmConectar.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    Left = 360
    Top = 428
  end
end
