object frmAyuda: TfrmAyuda
  Left = 177
  Top = 93
  Width = 1058
  Height = 517
  Caption = 'Nota sobre Ciere Z'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 8
    Top = 16
    Width = 1017
    Height = 441
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Lines.Strings = (
      
        'Es obligatorio realizar un cierre '#8220'Z'#8221' dentro de las 24 Hs. de em' +
        'itido el primer Ticket. En caso de excederse este periodo de tie' +
        'mpo '
      'el controlador fiscal emitir'#225' un mensaje de error.'
      
        'No conviene realizar cierres Z sin necesidad, ya que el impresor' +
        ' fiscal tiene un l'#237'mite en la memoria fiscal para almacenar regi' +
        'stros '
      
        'de cierres z. Para ello si va a hacer un cierre parcial, utilice' +
        ' el Cierre X.'
      ''
      
        'Cierre X se realiza un cierre parcial totales desde el ultimo ci' +
        'erre Z o Cierre X, a diferencia del cierre Z este cierre no grab' +
        'a en memoria fiscal, '
      
        'esto es muy importante debido a que la memoria fiscal tiene una ' +
        'capacidad limitada de cierre z por Cada memoria.'
      ''
      
        'Resulta muy '#250'til en caso de que en un punto de venta roten 2 o m' +
        #225's cajeros, al realizar un cierre X al terminar el turno de cada' +
        ' uno de los'
      
        ' cajeros nos permite obtener el total de la venta realizado por ' +
        'el mismo. Puede llegar a tener varios turnos en un periodo de 24' +
        'Hs.'
      ''
      
        'Realizamos un solo cierre Z al final del D'#237'a , obteniendo de est' +
        'a forma un total parcial de venta por cada turno(Cierre X) y un ' +
        'total de '
      
        'venta diario (Cierre Z) y ahorrando capacidad en la memoria fisc' +
        'al.'
      ''
      ''
      '')
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 0
  end
end
