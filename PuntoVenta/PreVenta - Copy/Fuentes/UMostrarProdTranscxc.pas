unit UMostrarProdTranscxc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, RXDBCtrl, StdCtrls, Buttons;

type
  TfrmProdTranscxc = class(TForm)
    RxDBGrid1: TRxDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProdTranscxc: TfrmProdTranscxc;

implementation

uses UTransNcNbDev;

{$R *.dfm}

end.
