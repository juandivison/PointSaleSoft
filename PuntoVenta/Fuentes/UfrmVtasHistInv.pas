unit UfrmVtasHistInv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, RxDBCtrl, DB;

type
  TfrmVtasHistInv = class(TForm)
    DataSource1: TDataSource;
    RxDBGrid1: TRxDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVtasHistInv: TfrmVtasHistInv;

implementation

uses UFormfrmHistVentasInv;

{$R *.dfm}

end.
