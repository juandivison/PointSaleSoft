unit UFormUnidades;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, db, StdCtrls, Buttons, Grids, DBGrids, Mask, DBCtrls;

type
  TfrmUnidades = class(TForm)
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
    DBEdit3: TDBEdit;
    Label3: TLabel;
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
  frmUnidades: TfrmUnidades;

implementation

uses UDatModInventario, uglobal;

{$R *.dfm}

procedure TfrmUnidades.BitBtn1Click(Sender: TObject);
begin
 if dmInventario.tblUnidades.State = dsBrowse then
  begin
    dmInventario.tblUnidades.Insert;
  end;
end;

procedure TfrmUnidades.BitBtn2Click(Sender: TObject);
begin
  if dmInventario.tblUnidades.State = dsBrowse then
  dmInventario.tblUnidades.Edit;
end;

procedure TfrmUnidades.BitBtn3Click(Sender: TObject);
begin
  if dmInventario.tblUnidades.State in [dsEdit, dsInsert] then
  dmInventario.tblUnidades.cancel;
end;

procedure TfrmUnidades.BitBtn4Click(Sender: TObject);
begin
  if dmInventario.tblUnidades.State in [dsEdit, dsInsert] then
  begin
    if dmInventario.tblUnidadesCANTIDAD.IsNull then
    begin
      MessageDlg('Favor indicar cantidad para tipo unidad.',mtError,[mbok],0);
      if frmUnidades.Showing then
      DBEdit1.SetFocus;
      exit;
    end;
    if dmInventario.tblUnidades.State = dsInsert then
    begin
      dmInventario.tblUnidadesIDUNIDAD.Value := FsqlMaxNumero('unidades','idUnidad');
      if (dmInventario.tblUnidadesIDUNIDAD.IsNull) Or (dmInventario.tblUnidadesIDUNIDAD.Value = 0) then
      dmInventario.tblUnidadesIDUNIDAD.Value:=1;
    end;
    dmInventario.tblUnidades.Post;
    dmInventario.tblUnidades.ApplyUpdates;
    if not dmInventario.tblUnidades.Transaction.InTransaction then
    dmInventario.tblUnidades.Transaction.StartTransaction;
    try
      dmInventario.tblUnidades.Transaction.CommitRetaining;
    except
    dmInventario.tblUnidades.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmUnidades.BitBtn5Click(Sender: TObject);
begin
  if dmInventario.tblUnidades.State in [dsInactive, dsBrowse] then
  begin
    dmInventario.tblUnidades.Close;
    dmInventario.tblUnidades.Open;
  end;
end;

procedure TfrmUnidades.FormCreate(Sender: TObject);
begin
  dmInventario.tblUnidades.Close;
  dmInventario.tblUnidades.Open;
end;

end.
