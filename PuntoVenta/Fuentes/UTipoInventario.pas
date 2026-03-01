unit UTipoInventario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  db, Dialogs, RXCtrls, RXDBCtrl, StdCtrls, Buttons, Grids, DBGrids, Mask,
  DBCtrls;

type
  TfrmTipoInventario = class(TForm)
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
    DBStatusLabel4: TDBStatusLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTipoInventario: TfrmTipoInventario;

implementation

uses UDatModInventario, uGlobal;

{$R *.dfm}

procedure TfrmTipoInventario.BitBtn1Click(Sender: TObject);
var
  n : integer;
begin
  if dmInventario.tblTipoInventario.State = dsBrowse then
  begin
    dmInventario.tblTipoInventario.Insert;
    dmInventario.tblTipoInventarioIDINDICADORBOSERV.Value:=1;//1-Producto 2-Servicio
    n:=FsqlMaxNumero('tipo_inventario','codigo');
    if n = 0 then
    dmInventario.tblTipoInventarioCODIGO.Value := 1
    else dmInventario.tblTipoInventarioCODIGO.Value := n;
    DBEdit2.SetFocus;
  end;

end;

procedure TfrmTipoInventario.FormCreate(Sender: TObject);
begin
  dmInventario.tblTipoInventario.Close;
  dmInventario.tblTipoInventario.Open;
end;

procedure TfrmTipoInventario.BitBtn5Click(Sender: TObject);
begin
  dmInventario.tblTipoInventario.Close;
  dmInventario.tblTipoInventario.Open;
end;

procedure TfrmTipoInventario.BitBtn2Click(Sender: TObject);
begin
  if dmInventario.tblTipoInventario.State = dsBrowse then
  dmInventario.tblTipoInventario.Edit;
end;

procedure TfrmTipoInventario.BitBtn3Click(Sender: TObject);
begin
  if dmInventario.tblTipoInventario.State in [dsEdit, dsInsert] then
  dmInventario.tblTipoInventario.Cancel;
end;

procedure TfrmTipoInventario.BitBtn4Click(Sender: TObject);
begin
  if dmInventario.tblTipoInventario.State in [dsEdit,dsInsert] then
  begin
    dmInventario.tblTipoInventario.Post;
    dmInventario.tblTipoInventario.ApplyUpdates;
    if not dmInventario.tblTipoInventario.Transaction.InTransaction then
    dmInventario.tblTipoInventario.Transaction.StartTransaction;
    try
      dmInventario.tblTipoInventario.Transaction.CommitRetaining;
    except
    dmInventario.tblTipoInventario.Transaction.RollbackRetaining;
    end;
  end;
end;

end.
