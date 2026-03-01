unit UCargosEmp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  db, Dialogs, StdCtrls, Buttons, Grids, DBGrids, Mask, DBCtrls, RXCtrls,
  RXDBCtrl, WinSkinData;

type
  TfrmCargo = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    DBStatusLabel1: TDBStatusLabel;
    SkinData1: TSkinData;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCargo: TfrmCargo;

implementation

uses UDatModRegOpeDiaria, UGlobal;

{$R *.dfm}

procedure TfrmCargo.BitBtn1Click(Sender: TObject);
begin
  if dtmTransOpeDiaria.tblCargoEmp.State in [dsBrowse] then
  begin
    dtmTransOpeDiaria.tblCargoEmp.Insert;
    dtmTransOpeDiaria.tblCargoEmpFECHA_IN.Value:= Now;
    dtmTransOpeDiaria.tblCargoEmpIN_POR.Value:= StruserName;
    dbedit2.SetFocus;
  end;
end;

procedure TfrmCargo.BitBtn2Click(Sender: TObject);
begin
  if dtmTransOpeDiaria.tblCargoEmp.State in [dsBrowse] then
  dtmTransOpeDiaria.tblCargoEmp.Edit;
end;

procedure TfrmCargo.BitBtn3Click(Sender: TObject);
begin
  if dtmTransOpeDiaria.tblCargoEmp.State in [dsInsert, dsEdit] then
  dtmTransOpeDiaria.tblCargoEmp.Cancel;
end;

procedure TfrmCargo.BitBtn4Click(Sender: TObject);
begin
  if dtmTransOpeDiaria.tblCargoEmp.State in [dsInsert, dsEdit] then
  begin
    dtmTransOpeDiaria.tblCargoEmpCODIGO.Value:=FsqlMaxNumero('CARGO_EMPLEADOS','CODIGO');
    dtmTransOpeDiaria.tblCargoEmpSTATUS.Value:='A'; 
    dtmTransOpeDiaria.tblCargoEmp.Post;
    dtmTransOpeDiaria.tblCargoEmp.ApplyUpdates;
    try
      dtmTransOpeDiaria.tblCargoEmp.Transaction.CommitRetaining;
    except
        dtmTransOpeDiaria.tblCargoEmp.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmCargo.BitBtn5Click(Sender: TObject);
begin
  if dtmTransOpeDiaria.tblCargoEmp.State in [dsBrowse, dsInactive] then
  begin
    dtmTransOpeDiaria.tblCargoEmp.Close;
    dtmTransOpeDiaria.tblCargoEmp.Open;
  end;
end;

procedure TfrmCargo.FormCreate(Sender: TObject);
begin
  dtmTransOpeDiaria.tblCargoEmp.Close;
  dtmTransOpeDiaria.tblCargoEmp.Open;
end;

end.
