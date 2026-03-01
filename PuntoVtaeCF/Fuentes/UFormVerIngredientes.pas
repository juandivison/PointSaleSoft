unit UFormVerIngredientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, RXDBCtrl, DB, WinSkinData;

type
  TfrmVerIngredientes = class(TForm)
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
  frmVerIngredientes: TfrmVerIngredientes;

implementation

uses UDatosVentas;

{$R *.dfm}

end.
