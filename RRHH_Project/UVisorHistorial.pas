unit UVisorHistorial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, Grids, DBGrids, StdCtrls, DBCtrls;

type
  TfrmVisorHistorial = class(TForm)
    Label1: TLabel;
    dbcbEmpleado: TDBLookupComboBox;
    DBGridHistorial: TDBGrid;
    qEmpleados: TIBQuery;
    dsEmpleados: TDataSource;
    qHistorial: TIBQuery;
    dsHistorial: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure dbcbEmpleadoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVisorHistorial: TfrmVisorHistorial;

implementation

uses UDataModule;

{$R *.dfm}

procedure TfrmVisorHistorial.FormCreate(Sender: TObject);
begin
  qEmpleados.Open;
end;

procedure TfrmVisorHistorial.dbcbEmpleadoClick(Sender: TObject);
begin
  if dbcbEmpleado.KeyValue <> null then
  begin
    qHistorial.Close;
    qHistorial.ParamByName('EMP').AsInteger := dbcbEmpleado.KeyValue;
    qHistorial.Open;
  end;
end;

end.
