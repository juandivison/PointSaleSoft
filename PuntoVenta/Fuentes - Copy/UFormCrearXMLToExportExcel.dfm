object frmExportarRepXML: TfrmExportarRepXML
  Left = 213
  Top = 124
  Width = 928
  Height = 480
  Caption = 'Exportar Reporte a XML'
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
  object BitBtn1: TBitBtn
    Left = 776
    Top = 384
    Width = 75
    Height = 25
    Caption = 'Validar'
    TabOrder = 0
  end
  object BitBtn2: TBitBtn
    Left = 688
    Top = 384
    Width = 75
    Height = 25
    Caption = 'Crear XML'
    TabOrder = 1
    OnClick = BitBtn2Click
  end
  object Memo1: TMemo
    Left = 16
    Top = 48
    Width = 833
    Height = 313
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssBoth
    TabOrder = 2
  end
  object Button1: TButton
    Left = 592
    Top = 384
    Width = 75
    Height = 25
    Caption = 'Exporta'
    TabOrder = 3
    OnClick = Button1Click
  end
  object XMLDocument1: TXMLDocument
    FileName = 
      'C:\Proyectos\PointSaleSoftResp\PuntoVenta\ExcelTemplate\Ingesevi' +
      'sData.xml'
    Left = 360
    Top = 104
    DOMVendorDesc = 'MSXML'
  end
end
