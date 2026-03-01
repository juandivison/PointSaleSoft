unit UDatosTempEscalaIsr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, RXDBCtrl, StdCtrls, Buttons, RXCtrls;

type
  TfrmDatosTempEscalaIsr = class(TForm)
    RxDBGrid1: TRxDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBStatusLabel1: TDBStatusLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDatosTempEscalaIsr: TfrmDatosTempEscalaIsr;

implementation

uses UEscalaISR;

{$R *.DFM}

end.
