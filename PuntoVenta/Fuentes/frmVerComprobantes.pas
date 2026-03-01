unit frmVerComprobantes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, RXDBCtrl, StdCtrls, Buttons, WinSkinData;

type
  TfrmVerTipoComprobantes = class(TForm)
    RxDBGrid1: TRxDBGrid;
    BitBtn1: TBitBtn;
    SkinData1: TSkinData;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVerTipoComprobantes: TfrmVerTipoComprobantes;

implementation
  uses UdatmodFactura;
{$R *.dfm}

end.
