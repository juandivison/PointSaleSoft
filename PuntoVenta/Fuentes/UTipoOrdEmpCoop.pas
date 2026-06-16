unit UTipoOrdEmpCoop;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  db, Grids, DBGrids, StdCtrls, Mask, DBCtrls, Buttons, RXCtrls, RXDBCtrl;

type
  TfrmTipoOrdEmpCoop = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn2: TBitBtn;
    DBStatusLabel1: TDBStatusLabel;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTipoOrdEmpCoop: TfrmTipoOrdEmpCoop;

implementation

uses UDatmodDatosGenerales;

{$R *.DFM}

procedure TfrmTipoOrdEmpCoop.FormCreate(Sender: TObject);
begin
  dmDatos.tTipoOrdenEmpCoop.close;
  dmDatos.tTipoOrdenEmpCoop.open;
end;

procedure TfrmTipoOrdEmpCoop.BitBtn5Click(Sender: TObject);
begin
  dmDatos.tTipoOrdenEmpCoop.close;
  dmDatos.tTipoOrdenEmpCoop.open;
end;

procedure TfrmTipoOrdEmpCoop.BitBtn1Click(Sender: TObject);
var
  n : integer;
begin
  if dmDatos.tTipoOrdenEmpCoop.State in [dsbrowse] then
  begin
    dmDatos.tTipoOrdenEmpCoop.last;
    if not dmDatos.tTipoOrdenEmpCoopcodigo.isNull then
    n:=dmDatos.tTipoOrdenEmpCoopcodigo.Value
    else n:=0;
    dmDatos.tTipoOrdenEmpCoop.Insert;
    dmDatos.tTipoOrdenEmpCoopcodigo.value:=n+1;
    DBEdit1.SetFocus;
  end;
end;

procedure TfrmTipoOrdEmpCoop.BitBtn3Click(Sender: TObject);
begin
  if dmDatos.tTipoOrdenEmpCoop.State in [dsInsert, dsEdit] then
  begin
    dmDatos.tTipoOrdenEmpCoop.Post;
    if Not dmDatos.tTipoOrdenEmpCoop.Transaction.InTransaction then
    dmDatos.tTipoOrdenEmpCoop.Transaction.StartTransaction;
    try
      dmDatos.tTipoOrdenEmpCoop.Transaction.CommitRetaining;
    except
    dmDatos.tTipoOrdenEmpCoop.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmTipoOrdEmpCoop.BitBtn4Click(Sender: TObject);
begin
  if dmDatos.tTipoOrdenEmpCoop.State in [dsInsert, dsEdit] then
  dmDatos.tTipoOrdenEmpCoop.Cancel;
end;

end.
