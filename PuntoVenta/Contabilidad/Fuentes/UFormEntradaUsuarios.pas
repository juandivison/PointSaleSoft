unit UFormEntradaUsuarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  db, Dialogs, Grids, DBGrids, RXDBCtrl, RXCtrls, StdCtrls, Buttons, ExtCtrls;

type
  TfrmActuUsuarios = class(TForm)
    RxDBGrid1: TRxDBGrid;
    Panel1: TPanel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    DBStatusLabel1: TDBStatusLabel;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmActuUsuarios: TfrmActuUsuarios;

implementation
uses UDatModUsuarios;

{$R *.dfm}

procedure TfrmActuUsuarios.FormCreate(Sender: TObject);
begin
  dmUsuarios.tblEmpleados.close;
  dmUsuarios.tblEmpleados.Open;
end;

procedure TfrmActuUsuarios.BitBtn5Click(Sender: TObject);
begin
  if dmUsuarios.tblEmpleados.state in [dsEdit, dsInsert] then
  begin
    if not dmUsuarios.tblEmpleados.Transaction.InTransaction then
    dmUsuarios.tblEmpleados.Transaction.StartTransaction;
    try
      dmUsuarios.tblEmpleados.Transaction.CommitRetaining;
    except
    dmUsuarios.tblEmpleados.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmActuUsuarios.BitBtn2Click(Sender: TObject);
begin
  if dmUsuarios.tblEmpleados.State = dsbrowse then
  begin
    dmUsuarios.tblEmpleados.Insert;
    dmUsuarios.tblEmpleadosSTATUS.Value:='A';
  end;
end;

procedure TfrmActuUsuarios.BitBtn7Click(Sender: TObject);
begin
  if dmUsuarios.tblEmpleados.State in [dsInactive, dsBrowse] then
  begin
    dmUsuarios.tblEmpleados.Close;
    dmUsuarios.tblEmpleados.Open;
  end;
end;

end.
