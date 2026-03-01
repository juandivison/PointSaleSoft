unit UFormEditaReciboIngresos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, rxToolEdit, RXDBCtrl;

type
  TfrmEditaReciboIngresos = class(TForm)
    Label1: TLabel;
    DBDateEdit1: TDBDateEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEditaReciboIngresos: TfrmEditaReciboIngresos;

implementation

uses UDatModIngresos;

{$R *.dfm}

end.
