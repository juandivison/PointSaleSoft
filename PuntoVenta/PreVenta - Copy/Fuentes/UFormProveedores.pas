unit UFormProveedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Mask, DBCtrls, Grids, DBGrids, RXDBCtrl, Buttons,
  RXCtrls, ExtCtrls, WinSkinData;

type
  TfrmProveedores = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    dsProveedores: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    Panel1: TPanel;
    btnInsertar: TBitBtn;
    btnModificar: TBitBtn;
    btnSalvar: TBitBtn;
    btnCancelar: TBitBtn;
    btnCerarAbrirres: TBitBtn;
    BitBtn2: TBitBtn;
    RxDBGrid1: TRxDBGrid;
    DBStatusLabel1: TDBStatusLabel;
    SkinData1: TSkinData;
    DBEdit14: TDBEdit;
    Label14: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnInsertarClick(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnCerarAbrirresClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProveedores: TfrmProveedores;

implementation

uses UDatModRegOpeDiaria;

{$R *.dfm}

procedure TfrmProveedores.FormCreate(Sender: TObject);
begin
  dtmTransOpeDiaria.tblProveedores.Close;
  dtmTransOpeDiaria.tblProveedores.Open;
end;

procedure TfrmProveedores.btnInsertarClick(Sender: TObject);
begin
  if dtmTransOpeDiaria.tblProveedores.state = dsBrowse then
  dtmTransOpeDiaria.tblProveedores.Insert;
end;

procedure TfrmProveedores.btnModificarClick(Sender: TObject);
begin
  if dtmTransOpeDiaria.tblProveedores.State In [dsBrowse] then
  dtmTransOpeDiaria.tblProveedores.Edit;
end;

procedure TfrmProveedores.btnSalvarClick(Sender: TObject);
begin
  if dtmTransOpeDiaria.tblProveedores.State In [dsInsert, dsEdit] then
  begin
    dtmTransOpeDiaria.tblProveedores.Post;
    dtmTransOpeDiaria.tblProveedores.ApplyUpdates;
    if Not dtmTransOpeDiaria.tblProveedores.Transaction.InTransaction then
    dtmTransOpeDiaria.tblProveedores.Transaction.StartTransaction;
    try
      dtmTransOpeDiaria.tblProveedores.Transaction.CommitRetaining;
    except
    dtmTransOpeDiaria.tblProveedores.Transaction.Rollback;
    end;
  end;
end;

procedure TfrmProveedores.btnCancelarClick(Sender: TObject);
begin
  if dtmTransOpeDiaria.tblProveedores.State In [dsInsert, dsEdit] then
  dtmTransOpeDiaria.tblProveedores.Cancel;
end;

procedure TfrmProveedores.btnCerarAbrirresClick(Sender: TObject);
begin
  if dtmTransOpeDiaria.tblProveedores.State = dsBrowse then
  begin
    dtmTransOpeDiaria.tblProveedores.Close;
    dtmTransOpeDiaria.tblProveedores.Open;
  end;
end;

end.
