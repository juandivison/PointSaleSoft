unit UInventarioSubCategoria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,db,  Buttons, Grids, DBGrids, Mask, DBCtrls, RXCtrls,
  RXDBCtrl;

type
  TfrmSubCategoriaInv = class(TForm)
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
  frmSubCategoriaInv: TfrmSubCategoriaInv;

implementation

uses UDatModInventario, uglobal;

{$R *.dfm}

procedure TfrmSubCategoriaInv.BitBtn1Click(Sender: TObject);
var
  n : integer;
begin
  if dmInventario.tblInvSubCategoria.State = dsBrowse then
  begin
    dmInventario.tblInvSubCategoria.Insert;
    n:=FsqlMaxNumero('INVENTARIO_SUBCATEGORIA','CODSUBCATEGORIA');
    if n = 0 then
    dmInventario.tblInvSubCategoriaCODSUBCATEGORIA.Value := 1
    else dmInventario.tblInvSubCategoriaCODSUBCATEGORIA.Value := n;
    DBEdit2.SetFocus;
  end;

end;

procedure TfrmSubCategoriaInv.BitBtn2Click(Sender: TObject);
begin
  if dmInventario.tblInvSubCategoria.State = dsBrowse then
  dmInventario.tblInvSubCategoria.Edit;
end;

procedure TfrmSubCategoriaInv.BitBtn3Click(Sender: TObject);
begin
  if dmInventario.tblInvSubCategoria.State in [dsEdit, dsInsert] then
  dmInventario.tblInvSubCategoria.Cancel;
end;

procedure TfrmSubCategoriaInv.BitBtn4Click(Sender: TObject);
begin
  if dmInventario.tblInvSubCategoria.State in [dsEdit,dsInsert] then
  begin
    dmInventario.tblInvSubCategoria.Post;
    dmInventario.tblInvSubCategoria.ApplyUpdates;
    if not dmInventario.tblInvSubCategoria.Transaction.InTransaction then
    dmInventario.tblInvSubCategoria.Transaction.StartTransaction;
    try
      dmInventario.tblInvSubCategoria.Transaction.CommitRetaining;
    except
    dmInventario.tblInvSubCategoria.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmSubCategoriaInv.BitBtn5Click(Sender: TObject);
begin
  dmInventario.tblInvSubCategoria.Close;
  dmInventario.tblInvSubCategoria.Open;
end;

end.
