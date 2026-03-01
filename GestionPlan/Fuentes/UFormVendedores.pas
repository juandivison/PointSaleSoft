unit UFormVendedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  db, Dialogs, Buttons, Grids, DBGrids, RXDBCtrl, StdCtrls, Mask, DBCtrls,
  RXCtrls;

type
  TfrmVendedores = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
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
    Label14: TLabel;
    DBEdit14: TDBEdit;
    Label15: TLabel;
    DBEdit15: TDBEdit;
    RxDBGrid1: TRxDBGrid;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton1: TSpeedButton;
    DBStatusLabel1: TDBStatusLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVendedores: TfrmVendedores;

implementation

uses UDatModUsuarios, uglobal;

{$R *.dfm}

procedure TfrmVendedores.SpeedButton1Click(Sender: TObject);
begin
  if dmUsuarios.tblVendedores.State in [dsInsert, dsEdit] then
  begin
    if dmUsuarios.tblVendedores.State in [dsInsert] then
    dmUsuarios.tblVendedoresCODIGO.Value:= FsqlMaxNumero('VENDEDORES','CODIGO');
    if dmUsuarios.tblVendedoresCODIGO.IsNull or (dmUsuarios.tblVendedoresCODIGO.Value = 0) then
    begin
      dmUsuarios.tblVendedoresCODIGO.Value:=1;
      Exit;
    end;
    dmUsuarios.tblVendedores.Post;
    dmUsuarios.tblVendedores.ApplyUpdates;
    if not dmUsuarios.tblVendedores.Transaction.InTransaction then
    dmUsuarios.tblVendedores.Transaction.StartTransaction;
    try
      dmUsuarios.tblVendedores.Transaction.CommitRetaining;
    except
    dmUsuarios.tblVendedores.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmVendedores.SpeedButton2Click(Sender: TObject);
begin
  if dmUsuarios.tblVendedores.State = dsBrowse then
  begin
    dmUsuarios.tblVendedores.Insert;
    dmUsuarios.tblVendedoresSTATUS.Value:='A';
    dmUsuarios.tblVendedoresFECHA_INSERTADO.Value:= Now;
    dmUsuarios.tblVendedoresINSERTADO_POR.Value:= StruserName;
    DBEdit2.SetFocus;
  end;
end;

procedure TfrmVendedores.SpeedButton3Click(Sender: TObject);
begin
  if dmUsuarios.tblVendedores.State in [dsinsert, dsEdit] then
  begin
    dmUsuarios.tblVendedores.Cancel;
  end;
end;

procedure TfrmVendedores.SpeedButton7Click(Sender: TObject);
begin
  dmUsuarios.tblVendedores.Close;
  dmUsuarios.tblVendedores.Open;
end;

procedure TfrmVendedores.SpeedButton8Click(Sender: TObject);
begin
  if MessageDlg('Eliminar record?',mtwarning,[mbok],0)=mrok then
  begin
    if dmUsuarios.tblVendedoresSTATUS.Value = 'A' then
    begin
      dmUsuarios.tblVendedores.Delete;
      SpeedButton1Click(Self);
    end;
  end;
end;

procedure TfrmVendedores.FormCreate(Sender: TObject);
begin
  dmUsuarios.tblVendedores.Close;
  dmUsuarios.tblVendedores.Open;
end;

end.
