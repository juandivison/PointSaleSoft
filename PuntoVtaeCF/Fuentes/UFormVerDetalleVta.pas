unit UFormVerDetalleVta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, RXDBCtrl;

type
  TfrmVerDet = class(TForm)
    RxDBGrid1: TRxDBGrid;
    BitBtn1: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVerDet: TfrmVerDet;

implementation

uses UProcVentaRapida;

{$R *.dfm}

end.
