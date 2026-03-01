unit UFormCiudad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, Mask, DBCtrls, RXCtrls,
  DB, RXDBCtrl, ExtDlgs;

type
  TfrmCiudades = class(TForm)
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
  frmCiudades: TfrmCiudades;

implementation
uses UDatModUsuarios, UGlobal;
{$R *.dfm}

procedure TfrmCiudades.BitBtn1Click(Sender: TObject);
var
  n : integer;
begin
  if dmUsuarios.tblCiudad.State = dsBrowse then
  begin
    dmUsuarios.tblCiudad.Insert;
    n:=FsqlMaxNumero('Ciudad','codigo');
    if n = 0 then
    dmUsuarios.tblCiudadCODIGO.Value := 1
    else dmUsuarios.tblCiudadCODIGO.Value := n;
    DBEdit2.SetFocus;
  end;
end;

procedure TfrmCiudades.BitBtn2Click(Sender: TObject);
begin
  if dmUsuarios.tblCiudad.State = dsBrowse then
  dmUsuarios.tblCiudad.Edit;
end;

procedure TfrmCiudades.BitBtn3Click(Sender: TObject);
begin
  if dmUsuarios.tblCiudad.State in [dsEdit, dsInsert] then
  dmUsuarios.tblCiudad.Cancel;
end;

procedure TfrmCiudades.BitBtn4Click(Sender: TObject);
begin
  if dmUsuarios.tblCiudad.State in [dsEdit,dsInsert] then
  begin
    dmUsuarios.tblCiudad.Post;
    dmUsuarios.tblCiudad.ApplyUpdates;
    if not dmUsuarios.tblCiudad.Transaction.InTransaction then
    dmUsuarios.tblCiudad.Transaction.StartTransaction;
    try
      dmUsuarios.tblCiudad.Transaction.CommitRetaining;
    except
    dmUsuarios.tblCiudad.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmCiudades.BitBtn5Click(Sender: TObject);
begin
  dmUsuarios.tblCiudad.Close;
  dmUsuarios.tblCiudad.Open;
end;

procedure TfrmCiudades.FormCreate(Sender: TObject);
begin
  dmUsuarios.tblCiudad.close;
  dmUsuarios.tblCiudad.Open;
end;

end.
