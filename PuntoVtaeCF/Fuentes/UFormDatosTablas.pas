unit UFormDatosTablas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, Grids, DBGrids, RxDBCtrl,
  IBCustomDataSet, IBQuery, WinSkinData, IBSQL, Menus;

type
  TfrmDatosTabla = class(TForm)
    qryTablas: TIBQuery;
    qryTablasTABLENAME: TIBStringField;
    RxDBGrid1: TRxDBGrid;
    dsqryTablas: TDataSource;
    RxDBGrid2: TRxDBGrid;
    BitBtn1: TBitBtn;
    qryDatos: TIBQuery;
    Label1: TLabel;
    edtTabla: TEdit;
    dsqryDatos: TDataSource;
    SkinData1: TSkinData;
    BitBtn2: TBitBtn;
    ibsqlTabla: TIBSQL;
    BitBtn3: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure qryTablasAfterScroll(DataSet: TDataSet);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDatosTabla: TfrmDatosTabla;

implementation

uses UDatModConectar;

{$R *.dfm}

procedure TfrmDatosTabla.BitBtn1Click(Sender: TObject);
begin
  qryTablas.Close;
  qryTablas.Open;
end;

procedure TfrmDatosTabla.qryTablasAfterScroll(DataSet: TDataSet);
begin
  if RxDBGrid1.ScrollDisabled then exit;
  qryDatos.close;
  qryDatos.SQL.Text:='Select * from '+qryTablasTABLENAME.Value;
  qryDatos.Open;
end;

procedure TfrmDatosTabla.BitBtn2Click(Sender: TObject);
var
  spass : string;
begin
  if (Inputbox('Acceso restringido','Entre password','') = 'sup2005') then
  begin
    ibsqlTabla.SQL.Text:='Delete from '+qryTablasTABLENAME.Value;
    ibsqlTabla.ExecQuery;
    if not ibsqlTabla.Transaction.InTransaction then
    ibsqlTabla.Transaction.StartTransaction;
    try
      ibsqlTabla.Transaction.CommitRetaining;
    except
    ibsqlTabla.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmDatosTabla.BitBtn3Click(Sender: TObject);
begin
    RxDBGrid1.DisableScroll;
    qryTablas.DisableControls;
    qryTablas.Locate('tablename',edtTabla.Text,[loCaseInsensitive,loPartialKey]);
    qryTablas.EnableControls;
    RxDBGrid1.EnableScroll;
    qryTablas.Prior;
    qryTablas.Next;
end;

end.
