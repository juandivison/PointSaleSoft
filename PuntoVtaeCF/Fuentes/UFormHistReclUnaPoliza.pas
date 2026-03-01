unit UFormHistReclUnaPoliza;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WinSkinData, StdCtrls, Buttons, Grids, DBGrids, RxDBCtrl, DB;

type
  TfrmHistReclPoliza = class(TForm)
    DataSource1: TDataSource;
    RxDBGrid1: TRxDBGrid;
    BitBtn1: TBitBtn;
    SkinData1: TSkinData;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHistReclPoliza: TfrmHistReclPoliza;

implementation

uses UFormReclamaciones;

{$R *.dfm}

end.
