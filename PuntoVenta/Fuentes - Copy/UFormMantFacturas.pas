unit UFormMantFacturas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, RXDBCtrl, Mask, DBCtrls,
  RXCtrls;

type
  TForm1 = class(TForm)
    Label2: TLabel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton1: TSpeedButton;
    DBStatusLabel1: TDBStatusLabel;
    DBEdit2: TDBEdit;
    RxDBGrid1: TRxDBGrid;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
  uses UDatModFactura;
{$R *.dfm}

procedure TForm1.BitBtn10Click(Sender: TObject);
begin
  dmUsuarios.tblSecProcesos.prior;
end;

procedure TForm1.BitBtn11Click(Sender: TObject);
begin
  dmUsuarios.tblSecProcesos.next;
end;

procedure TForm1.BitBtn12Click(Sender: TObject);
begin
  dmUsuarios.tblSecProcesos.Last;
end;

procedure TForm1.BitBtn9Click(Sender: TObject);
begin
  dmUsuarios.tblSecProcesos.first;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  if dmUsuarios.tblSecProcesos.State in [dsinsert, dsEdit] then
  begin
    dmUsuarios.tblSecProcesosid.Value:= FsqlMaxNumero('SEC_PROCESOS','ID');
    dmUsuarios.tblSecProcesos.Post;
    dmUsuarios.tblSecProcesos.ApplyUpdates;
    if not dmUsuarios.tblSecProcesos.Transaction.InTransaction then
    dmUsuarios.tblSecProcesos.Transaction.StartTransaction;
    try
      dmUsuarios.tblSecProcesos.Transaction.CommitRetaining;
    except
    dmUsuarios.tblSecProcesos.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
  if dmUsuarios.tblSecProcesos.State = dsBrowse then
  begin
    dmUsuarios.tblSecProcesos.Insert;
    DBEdit2.SetFocus;
  end;
end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
  if dmUsuarios.tblSecProcesos.State in [dsinsert, dsEdit] then
  begin
    dmUsuarios.tblSecProcesos.Cancel;
  end;
end;

end.
