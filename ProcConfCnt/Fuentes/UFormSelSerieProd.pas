unit UFormSelSerieProd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, RXDBCtrl, DB;

type
  TfrmSelSerie = class(TForm)
    DataSource1: TDataSource;
    RxDBGrid1: TRxDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelSerie: TfrmSelSerie;

implementation

uses UProcVentaRapida;

{$R *.dfm}

end.
