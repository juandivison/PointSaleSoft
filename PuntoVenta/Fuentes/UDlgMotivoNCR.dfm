object frmMotivoNCR: TfrmMotivoNCR
  Left = 675
  Top = 225
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Motivo de Nota (NC/ND)'
  ClientHeight = 238
  ClientWidth = 420
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
  object lblTitulo: TLabel
    Left = 16
    Top = 12
    Width = 244
    Height = 13
    Caption = 'Seleccione el motivo de la Nota de cr'#233'dito o d'#233'bito:'
  end
  object rgMotivo: TRadioGroup
    Left = 16
    Top = 32
    Width = 388
    Height = 152
    Caption = ' Motivo '
    ItemIndex = 0
    Items.Strings = (
      '1 - Anula el NCF modificado'
      '2 - Corrige texto del comprobante fiscal modificado'
      '3 - Corrige montos (precios/cantidades) del NCF modificado'
      '4 - Reemplazo de NCF emitido en contingencia'
      '5 - Referencia Factura Consumo Electr'#243'nica')
    TabOrder = 0
  end
  object btnOK: TButton
    Left = 228
    Top = 200
    Width = 84
    Height = 25
    Caption = 'Aceptar'
    ModalResult = 1
    TabOrder = 1
    OnClick = btnOKClick
  end
  object btnCancel: TButton
    Left = 320
    Top = 200
    Width = 84
    Height = 25
    Caption = 'Cancelar'
    ModalResult = 2
    TabOrder = 2
    OnClick = btnCancelClick
  end
end
