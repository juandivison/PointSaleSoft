unit UCategoriaInventario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,db, StdCtrls, Buttons, Grids, DBGrids, Mask, DBCtrls, RXCtrls,
  RXDBCtrl;

type
  TfrmCategoriaInv = class(TForm)
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
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCategoriaInv: TfrmCategoriaInv;

implementation

uses UDatModInventario, uglobal;

{$R *.dfm}

procedure TfrmCategoriaInv.BitBtn1Click(Sender: TObject);
var
  n : integer;
begin
  if dmInventario.tblInvCategoria.State = dsBrowse then
  begin
    dmInventario.tblInvCategoria.Insert;
    n:=FsqlMaxNumero('INVENTARIO_CATEGORIA','CODCATEGORIA');
    if n = 0 then
    dmInventario.tblInvCategoriaCODCATEGORIA.Value := 1
    else dmInventario.tblInvCategoriacodcategoria.Value := n;
    DBEdit2.SetFocus;
  end;

end;

procedure TfrmCategoriaInv.BitBtn2Click(Sender: TObject);
begin
  if dmInventario.tblInvCategoria.State = dsBrowse then
  dmInventario.tblInvCategoria.Edit;
end;

procedure TfrmCategoriaInv.BitBtn3Click(Sender: TObject);
begin
  if dmInventario.tblInvCategoria.State in [dsEdit, dsInsert] then
  dmInventario.tblInvCategoria.Cancel;
end;

procedure TfrmCategoriaInv.BitBtn4Click(Sender: TObject);
begin
  if dmInventario.tblInvCategoria.State in [dsEdit,dsInsert] then
  begin
    dmInventario.tblInvCategoria.Post;
    dmInventario.tblInvCategoria.ApplyUpdates;
    if not dmInventario.tblInvCategoria.Transaction.InTransaction then
    dmInventario.tblInvCategoria.Transaction.StartTransaction;
    try
      dmInventario.tblInvCategoria.Transaction.CommitRetaining;
    except
    dmInventario.tblInvCategoria.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmCategoriaInv.BitBtn5Click(Sender: TObject);
begin
  dmInventario.tblInvCategoria.Close;
  dmInventario.tblInvCategoria.Open;
end;

end.
