unit UFormCaja;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, RXDBCtrl, ToolEdit, DB, StdCtrls, Mask, DBCtrls,
  Buttons, ExtCtrls, WinSkinData, RXCtrls;

type
  TfrmCaja = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    Label2: TLabel;
    DBDateEdit1: TDBDateEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    Label8: TLabel;
    DBEdit7: TDBEdit;
    RxDBGrid1: TRxDBGrid;
    Panel1: TPanel;
    btnInsertar: TBitBtn;
    btnModificar: TBitBtn;
    btnSalvar: TBitBtn;
    btnCancelar: TBitBtn;
    btnCerarAbrirres: TBitBtn;
    BitBtn2: TBitBtn;
    SkinData1: TSkinData;
    DBStatusLabel1: TDBStatusLabel;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure btnCerarAbrirresClick(Sender: TObject);
    procedure btnInsertarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCaja: TfrmCaja;

implementation
uses UDatModCuadrexRuta, UGlobal;
 
{$R *.dfm}

procedure TfrmCaja.FormCreate(Sender: TObject);
begin
  dmCuadrexRuta.trnCaja.Close;
  dmCuadrexRuta.trnCaja.Open;
end;

procedure TfrmCaja.btnCerarAbrirresClick(Sender: TObject);
begin
  if dmCuadrexRuta.trnCaja.state in [dsInactive, dsBrowse] then
  begin
    dmCuadrexRuta.trnCaja.Close;
    dmCuadrexRuta.trnCaja.Open;
  end;
end;

procedure TfrmCaja.btnInsertarClick(Sender: TObject);
begin
  if dmCuadrexRuta.trnCaja.State In [dsBrowse] then
  begin
    dmCuadrexRuta.trnCaja.Insert;
    dmCuadrexRuta.trnCajaSTATUS.Value:='A';
    dmCuadrexRuta.trnCajaFECHA.Value :=ExtraerFecha(date);
    dmCuadrexRuta.trnCajaCOD_USUARIO.Value:= VarUsuarioGlb;
  end;
end;

procedure TfrmCaja.btnSalvarClick(Sender: TObject);
begin
  if dmCuadrexRuta.trnCaja.State In [dsInsert, dsEdit] then
  begin
    dmCuadrexRuta.trnCaja.Post;
    dmCuadrexRuta.trnCaja.ApplyUpdates;
    if Not dmCuadrexRuta.trnCaja.Transaction.InTransaction then
    dmCuadrexRuta.trnCaja.Transaction.StartTransaction;
    try
      dmCuadrexRuta.trnCaja.Transaction.CommitRetaining;
    except
    dmCuadrexRuta.trnCaja.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmCaja.btnCancelarClick(Sender: TObject);
begin
  if dmCuadrexRuta.trnCaja.State In [dsInsert, dsEdit] then
  begin
    dmCuadrexRuta.trnCaja.Cancel;
  end else
  if (dmCuadrexRuta.trnCajastatus.Value = 'A') then
  begin
    dmCuadrexRuta.trnCaja.Edit;
    dmCuadrexRuta.trnCajastatus.Value := 'C';
    dmCuadrexRuta.trnCaja.Post;
    dmCuadrexRuta.trnCaja.ApplyUpdates;
    if Not dmCuadrexRuta.trnCaja.Transaction.InTransaction then
    dmCuadrexRuta.trnCaja.Transaction.StartTransaction;
    try
      dmCuadrexRuta.trnCaja.Transaction.CommitRetaining;
    except
    dmCuadrexRuta.trnCaja.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmCaja.btnModificarClick(Sender: TObject);
begin
  if dmCuadrexRuta.trnCaja.State In [dsBrowse] then
  begin
    dmCuadrexRuta.trnCaja.Edit;
    dmCuadrexRuta.trnCajaCOD_USUARIO.Value:= VarUsuarioGlb;
  end;
end;

procedure TfrmCaja.BitBtn9Click(Sender: TObject);
begin
  dmCuadrexRuta.trnCaja.first;
end;

procedure TfrmCaja.BitBtn10Click(Sender: TObject);
begin
dmCuadrexRuta.trnCaja.Prior;
end;

procedure TfrmCaja.BitBtn11Click(Sender: TObject);
begin
  dmCuadrexRuta.trnCaja.Next;
end;

procedure TfrmCaja.BitBtn12Click(Sender: TObject);
begin
  dmCuadrexRuta.trnCaja.Last;
end;

end.
