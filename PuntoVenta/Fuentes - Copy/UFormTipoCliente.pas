unit UFormTipoCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WinSkinData, StdCtrls, Buttons, Grids, DBGrids, RxDBCtrl, Mask,
  DBCtrls, RxCtrls, DB;

type
  TfrmTipoCliente = class(TForm)
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
    SkinData1: TSkinData;
    dstblTipoCliente: TDataSource;
    SkinData2: TSkinData;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTipoCliente: TfrmTipoCliente;

implementation

uses UDatModClientes, uglobal;

{$R *.dfm}

procedure TfrmTipoCliente.BitBtn10Click(Sender: TObject);
begin
  dmClientes.tblTipoCliente.prior;
end;

procedure TfrmTipoCliente.BitBtn11Click(Sender: TObject);
begin
  dmClientes.tblTipoCliente.next;
end;

procedure TfrmTipoCliente.BitBtn12Click(Sender: TObject);
begin
  dmClientes.tblTipoCliente.Last;
end;

procedure TfrmTipoCliente.BitBtn9Click(Sender: TObject);
begin
  dmClientes.tblTipoCliente.first;
end;

procedure TfrmTipoCliente.SpeedButton1Click(Sender: TObject);
begin
  if dmClientes.tblTipoCliente.State in [dsinsert, dsEdit] then
  begin
  if dmClientes.tblTipoCliente.State in [dsinsert] then
    dmClientes.tblTipoClienteCodigo.Value:= FsqlMaxNumero('TIPO_CLIENTE','codigo');
    dmClientes.tblTipoCliente.Post;
    dmClientes.tblTipoCliente.ApplyUpdates;
    if not dmClientes.tblTipoCliente.Transaction.InTransaction then
    dmClientes.tblTipoCliente.Transaction.StartTransaction;
    try
      dmClientes.tblTipoCliente.Transaction.CommitRetaining;
    except
    dmClientes.tblTipoCliente.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmTipoCliente.SpeedButton2Click(Sender: TObject);
begin
  if dmClientes.tblTipoCliente.State = dsBrowse then
  begin
    dmClientes.tblTipoCliente.Insert;
    DBEdit2.SetFocus;
  end;
end;

procedure TfrmTipoCliente.SpeedButton3Click(Sender: TObject);
begin
  if dmClientes.tblTipoCliente.State in [dsinsert, dsEdit] then
  begin
    dmClientes.tblTipoCliente.Cancel;
  end;
end;

procedure TfrmTipoCliente.FormCreate(Sender: TObject);
begin
  dmClientes.tblTipoCliente.close;
  dmClientes.tblTipoCliente.Open;
end;

end.
