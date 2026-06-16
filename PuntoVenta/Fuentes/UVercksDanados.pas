unit UVercksDanados;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, IBCustomDataSet, ExtCtrls, DBCtrls, Grids, DBGrids, GetAnyDate,
  IBQuery;

type
  TfrmCksDaniados = class(TForm)
    dtqrycksDaniados: TDataSource;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    FechaCks: TGetAnyDate;
    qrycksDaniados: TIBQuery;
    qrycksDaniadosNUM_TRANS: TFloatField;
    qrycksDaniadosCODIGO_EMPLEADO: TIntegerField;
    qrycksDaniadosNUMERO_CKS: TIntegerField;
    qrycksDaniadosFECHA_PAGO: TDateTimeField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCksDaniados: TfrmCksDaniados;

implementation

uses UDatModConectar;

{$R *.DFM}

procedure TfrmCksDaniados.FormCreate(Sender: TObject);
begin
  if fechacks.execute then
  begin
    qrycksDaniados.close;
    qrycksDaniados.params[0].Value := fechacks.fecha;
    qrycksDaniados.params[1].Value := fechacks.FechaFinal;
    qrycksDaniados.open;    
  end;
end;

procedure TfrmCksDaniados.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qrycksDaniados.close;
end;

end.
