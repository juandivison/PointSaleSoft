unit UFormDatosTareaxProceso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, RXDBCtrl, StdCtrls, Buttons, WinSkinData;

type
  TfrmSelTareaProceso = class(TForm)
    RxDBGrid1: TRxDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    SkinData1: TSkinData;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelTareaProceso: TfrmSelTareaProceso;

implementation

uses UDatModUsuarios;

{$R *.dfm}

end.
