unit UformOficina;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, Mask, DBCtrls, RXCtrls,
  DB, RXDBCtrl, ExtDlgs;

type
  TfrmOficina = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    DBStatusLabel4: TDBStatusLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    OpenPictureDialog1: TOpenPictureDialog;
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
  frmOficina: TfrmOficina;

implementation

uses UDatModUsuarios, UGlobal;

{$R *.dfm}

procedure TfrmOficina.BitBtn1Click(Sender: TObject);
var
  n : integer;
begin
  if dmUsuarios.tblOficina.State = dsBrowse then
  begin
    dmUsuarios.tblOficina.Insert;
    n:=FsqlMaxNumero('oficina','codigo');
    if n = 0 then
    dmUsuarios.tblOficinaCODIGO.Value := 1
    else dmUsuarios.tblOficinaCODIGO.Value := n;
    DBEdit2.SetFocus;
  end;
end;

procedure TfrmOficina.BitBtn2Click(Sender: TObject);
begin
  if dmUsuarios.tblOficina.State = dsBrowse then
  dmUsuarios.tblOficina.Edit;
end;

procedure TfrmOficina.BitBtn3Click(Sender: TObject);
begin
  if dmUsuarios.tblOficina.State in [dsEdit, dsInsert] then
  dmUsuarios.tblOficina.Cancel;
end;

procedure TfrmOficina.BitBtn4Click(Sender: TObject);
begin
  if dmUsuarios.tblOficina.State In [dsEdit,dsInsert] then
  begin
    dmUsuarios.tblOficina.Post;
    dmUsuarios.tblOficina.ApplyUpdates;
    if Not dmUsuarios.tblOficina.Transaction.InTransaction then
    dmUsuarios.tblOficina.Transaction.StartTransaction;
    try
      dmUsuarios.tblOficina.Transaction.CommitRetaining;
    except
    dmUsuarios.tblOficina.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmOficina.BitBtn5Click(Sender: TObject);
begin
  dmUsuarios.tblOficina.Close;
  dmUsuarios.tblOficina.Open;
end;

procedure TfrmOficina.FormCreate(Sender: TObject);
begin
  dmUsuarios.tblOficina.Close;
  dmUsuarios.tblOficina.Open;
end;

end.
