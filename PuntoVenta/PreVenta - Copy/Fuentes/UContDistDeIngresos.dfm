inherited frmContDistIngresos: TfrmContDistIngresos
  Left = 284
  Top = 85
  Caption = 'Contabilizar Dist Ingresos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel2: TPanel
    inherited btnProcesar: TBitBtn
      Left = 163
    end
    inherited btnDatos: TBitBtn
      Left = 92
      OnClick = btnDatosClick
    end
    inherited btnContabilizar: TBitBtn
      Left = 244
    end
  end
  inherited PageControl1: TPageControl
    inherited TabSheet1: TTabSheet
      object Memo1: TMemo [0]
        Left = 96
        Top = 184
        Width = 185
        Height = 89
        Lines.Strings = (
          'Memo1')
        TabOrder = 1
      end
    end
  end
end
