unit UFechaFinEscalaIsr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, RXToolEdit, RXDBCtrl, Buttons, ComCtrls;

type
  TfrmFechaEscalaFinIsr = class(TForm)
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DateTimePicker1: TDateTimePicker;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFechaEscalaFinIsr: TfrmFechaEscalaFinIsr;

implementation

{$R *.DFM}

end.
