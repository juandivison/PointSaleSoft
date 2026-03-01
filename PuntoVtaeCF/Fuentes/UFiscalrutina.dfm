object frmIFiscal: TfrmIFiscal
  Left = 217
  Top = 116
  Width = 1019
  Height = 577
  Caption = 'frmRutinaIFiscal'
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
  object Label5: TLabel
    Left = 523
    Top = 119
    Width = 19
    Height = 13
    Caption = 'Hex'
    Visible = False
  end
  object Label6: TLabel
    Left = 648
    Top = 120
    Width = 20
    Height = 13
    Caption = 'Dec'
    Visible = False
  end
  object Label12: TLabel
    Left = 16
    Top = 20
    Width = 24
    Height = 13
    Caption = 'COM'
  end
  object Label13: TLabel
    Left = 96
    Top = 20
    Width = 48
    Height = 13
    Caption = 'BaudRate'
  end
  object RxSpeedButton1: TRxSpeedButton
    Left = 616
    Top = 72
    Width = 161
    Height = 25
    DropDownMenu = PopupMenu1
    Caption = 'Comprobante Fiscal'
    Visible = False
  end
  object RxSpeedButton2: TRxSpeedButton
    Left = 616
    Top = 104
    Width = 161
    Height = 25
    DropDownMenu = PopupMenu2
    Caption = 'Comando Jornada fiscal'
    Visible = False
  end
  object Label1: TLabel
    Left = 328
    Top = 136
    Width = 32
    Height = 13
    Caption = 'Label1'
  end
  object BitBtn1: TBitBtn
    Left = 616
    Top = 160
    Width = 75
    Height = 25
    Caption = 'About'
    TabOrder = 0
    Visible = False
    OnClick = BitBtn1Click
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 520
    Width = 1003
    Height = 19
    Panels = <
      item
        Alignment = taRightJustify
        Width = 60
      end
      item
        Width = 60
      end
      item
        Alignment = taRightJustify
        Width = 60
      end
      item
        Width = 50
      end>
  end
  object BitBtn2: TBitBtn
    Left = 18
    Top = 42
    Width = 119
    Height = 25
    Caption = 'Avance Papel'
    TabOrder = 2
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 616
    Top = 136
    Width = 121
    Height = 25
    Caption = 'Enviar Texto'
    TabOrder = 3
    Visible = False
    OnClick = BitBtn3Click
  end
  object BitBtn4: TBitBtn
    Left = 16
    Top = 72
    Width = 121
    Height = 25
    Caption = 'Cortar papel'
    TabOrder = 4
    OnClick = BitBtn4Click
  end
  object BitBtn5: TBitBtn
    Left = 16
    Top = 104
    Width = 121
    Height = 25
    Caption = 'Estado'
    TabOrder = 5
    OnClick = BitBtn5Click
  end
  object Edit1: TEdit
    Left = 520
    Top = 136
    Width = 121
    Height = 21
    TabOrder = 6
    Text = 'Edit1'
    Visible = False
  end
  object Edit2: TEdit
    Left = 648
    Top = 136
    Width = 121
    Height = 21
    TabOrder = 7
    Text = 'Edit2'
    Visible = False
  end
  object Button1: TButton
    Left = 768
    Top = 136
    Width = 75
    Height = 25
    Caption = 'Convertir'
    TabOrder = 8
    Visible = False
    OnClick = Button1Click
  end
  object Panel1: TPanel
    Left = 144
    Top = 70
    Width = 849
    Height = 419
    TabOrder = 9
    object Label7: TLabel
      Left = 8
      Top = 8
      Width = 49
      Height = 13
      Caption = 'Comando:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 8
      Top = 32
      Width = 83
      Height = 13
      Caption = 'Estatus impresora'
    end
    object Label9: TLabel
      Left = 8
      Top = 56
      Width = 65
      Height = 13
      Caption = 'Estatus Fiscal'
    end
    object Label10: TLabel
      Left = 8
      Top = 80
      Width = 99
      Height = 13
      Caption = 'Respuesta Comando'
    end
    object Label11: TLabel
      Left = 8
      Top = 104
      Width = 84
      Height = 13
      Caption = 'Datos de Retorno'
    end
    object T1: TEdit
      Left = 130
      Top = 5
      Width = 703
      Height = 21
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 0
    end
    object T4: TEdit
      Left = 130
      Top = 29
      Width = 703
      Height = 21
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 1
    end
    object T5: TEdit
      Left = 130
      Top = 53
      Width = 703
      Height = 21
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 2
    end
    object T6: TEdit
      Left = 130
      Top = 77
      Width = 703
      Height = 21
      Color = clBtnFace
      ReadOnly = True
      TabOrder = 3
    end
    object T7: TListBox
      Left = 130
      Top = 101
      Width = 703
      Height = 292
      Color = clBtnFace
      ItemHeight = 13
      TabOrder = 4
    end
  end
  object cBoxPuertocomm: TComboBox
    Left = 45
    Top = 16
    Width = 44
    Height = 21
    ItemHeight = 13
    ItemIndex = 3
    TabOrder = 10
    Text = '4'
    Items.Strings = (
      '1'
      '2'
      '3'
      '4')
  end
  object cboxBaudRate: TComboBox
    Left = 147
    Top = 16
    Width = 68
    Height = 21
    ItemHeight = 13
    TabOrder = 11
    Text = '9600'
    Items.Strings = (
      '9600')
  end
  object BitBtn6: TBitBtn
    Left = 16
    Top = 136
    Width = 121
    Height = 25
    Caption = 'Cargar Datos Conf'
    TabOrder = 12
    OnClick = BitBtn6Click
  end
  object BitBtn7: TBitBtn
    Left = 16
    Top = 168
    Width = 121
    Height = 25
    Caption = 'Obtener Fecha'
    TabOrder = 13
    OnClick = BitBtn7Click
  end
  object BitBtn8: TBitBtn
    Left = 16
    Top = 200
    Width = 121
    Height = 25
    Caption = 'Cierre Z'
    TabOrder = 14
    Visible = False
    OnClick = BitBtn8Click
  end
  object BitBtn9: TBitBtn
    Left = 616
    Top = 192
    Width = 75
    Height = 25
    Caption = 'Cierre X'
    TabOrder = 15
    Visible = False
    OnClick = BitBtn9Click
  end
  object BitBtn10: TBitBtn
    Left = 616
    Top = 216
    Width = 161
    Height = 25
    Caption = 'Inicia Abrir jornada'
    TabOrder = 16
    Visible = False
    OnClick = BitBtn10Click
  end
  object BitBtn11: TBitBtn
    Left = 144
    Top = 40
    Width = 145
    Height = 25
    Caption = 'Informacion Jornada fiscal'
    TabOrder = 17
    OnClick = BitBtn11Click
  end
  object BitBtn12: TBitBtn
    Left = 16
    Top = 232
    Width = 122
    Height = 25
    Caption = 'Datos Fiscalizacion'
    TabOrder = 18
    OnClick = BitBtn12Click
  end
  object BitBtn13: TBitBtn
    Left = 704
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Cerrar'
    TabOrder = 19
    Visible = False
    OnClick = BitBtn13Click
  end
  object Button2: TButton
    Left = 616
    Top = 40
    Width = 75
    Height = 25
    Caption = 'ExitoAbrir'
    TabOrder = 20
    Visible = False
    OnClick = Button2Click
  end
  object PopupMenu1: TPopupMenu
    Left = 432
    Top = 48
    object Abrir1: TMenuItem
      Caption = 'Abrir'
      OnClick = Abrir1Click
    end
    object Item1: TMenuItem
      Caption = 'Item'
      OnClick = Item1Click
    end
    object SubTotal1: TMenuItem
      Caption = 'Sub-Total'
      OnClick = SubTotal1Click
    end
    object Descuentoe1: TMenuItem
      Caption = 'Descuentos/Recargos'
      OnClick = Descuentoe1Click
    end
    object RegistrodePago1: TMenuItem
      Caption = 'Pagos'
      OnClick = RegistrodePago1Click
    end
    object CerrarCuponFiscal1: TMenuItem
      Caption = 'Cerrar'
      OnClick = CerrarCuponFiscal1Click
    end
    object InformacionessobreCuponFiscal1: TMenuItem
      Caption = 'Cancelar'
      OnClick = InformacionessobreCuponFiscal1Click
    end
    object Cancelaritemparcialmente1: TMenuItem
      Caption = 'Cancelar item  parcialmente'
      OnClick = Cancelaritemparcialmente1Click
    end
    object Cancelar1: TMenuItem
      Caption = 'Cancelar'
      OnClick = Cancelar1Click
    end
    object EnviardatosConsumidor1: TMenuItem
      Caption = 'Enviar datos Consumidor'
      OnClick = EnviardatosConsumidor1Click
    end
    object Enviarlineaadicionalfechadecupon1: TMenuItem
      Caption = 'Enviar linea adicional fecha de cupon'
      OnClick = Enviarlineaadicionalfechadecupon1Click
    end
    object Enviaridentificaciondelaplicativo1: TMenuItem
      Caption = 'ID del Aplicativo'
      OnClick = Enviaridentificaciondelaplicativo1Click
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 368
    Top = 72
    object CierreZ1: TMenuItem
      Caption = 'Cierre Z'
      OnClick = BitBtn8Click
    end
    object InformeCierreCajero1: TMenuItem
      Caption = 'Informe Cierre Cajero'
      OnClick = BitBtn9Click
    end
    object IniciarInformeX1: TMenuItem
      Caption = 'Iniciar Informe X'
      OnClick = BitBtn10Click
    end
    object Informacion1: TMenuItem
      Caption = 'Informacion'
      OnClick = BitBtn11Click
    end
    object InformaciondeITBIS1: TMenuItem
      Caption = 'Informacion de ITBIS'
      OnClick = InformaciondeITBIS1Click
    end
    object InformaciondePagos1: TMenuItem
      Caption = 'Informacion de Pagos'
      OnClick = InformaciondePagos1Click
    end
    object Acumuladores1: TMenuItem
      Caption = 'Acumuladores'
      OnClick = Acumuladores1Click
    end
  end
end
