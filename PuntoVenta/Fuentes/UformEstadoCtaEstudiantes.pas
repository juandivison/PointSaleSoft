unit UformEstadoCtaEstudiantes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, RXDBCtrl, DB;

type
  TfrmEstadoCtaMensEstu = class(TForm)
    RxDBGrid1: TRxDBGrid;
    RxDBGrid2: TRxDBGrid;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEstadoCtaMensEstu: TfrmEstadoCtaMensEstu;

implementation

uses UDatModEstudiante;

{$R *.dfm}

end.
