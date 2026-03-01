unit USeleccionaEmpleadoPrestamo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, StdCtrls, Buttons;

type
  TfrmSelEmpParaPrestamo = class(TForm)
    DBGrid1: TDBGrid;
    dsqryEmpleados: TDataSource;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelEmpParaPrestamo: TfrmSelEmpParaPrestamo;

implementation

uses UDatModPrestamo;

{$R *.dfm}

end.
