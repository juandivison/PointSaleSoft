unit UFormConsultaDatosVenta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, Grids, DBGrids, RXDBCtrl;

type
  TfrmConsultaDatosVenta = class(TForm)
    RxDBGrid1: TRxDBGrid;
    DataSource1: TDataSource;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaDatosVenta: TfrmConsultaDatosVenta;

implementation

uses UDatModFactura;

{$R *.dfm}

end.
