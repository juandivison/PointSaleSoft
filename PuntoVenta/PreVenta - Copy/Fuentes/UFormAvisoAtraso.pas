unit UFormAvisoAtraso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, Grids, DBGrids, RXDBCtrl, StdCtrls,
  DBCtrls, Mask, WinSkinData, Buttons, RXCtrls;

type
  TfrmAvisoAtraso = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBMemo1: TDBMemo;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    RxDBGrid1: TRxDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    SkinData1: TSkinData;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    DBStatusLabel1: TDBStatusLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAvisoAtraso: TfrmAvisoAtraso;

implementation

uses UDatModPrestamo, Uglobal;

{$R *.dfm}

procedure TfrmAvisoAtraso.BitBtn1Click(Sender: TObject);
begin
  if dmPrestamo.tblAvisoAtarso.State = dsBrowse then
  begin
    dmPrestamo.tblAvisoAtarso.Insert;
    dmPrestamo.tblAvisoAtarsoCODIGO.Value := FsqlMaxNumero('AVISO_VENC_FINANC ','Codigo');
    if dmPrestamo.tblAvisoAtarsoCODIGO.IsNull Or (dmPrestamo.tblAvisoAtarsoCODIGO.Value = 0) then
    dmPrestamo.tblAvisoAtarsoCODIGO.Value := 1;
    dmPrestamo.tblAvisoAtarsoSTATUS.Value := 'A';
    DBEdit3.SetFocus;
  end;
end;

procedure TfrmAvisoAtraso.BitBtn2Click(Sender: TObject);
begin
  if dmPrestamo.tblAvisoAtarso.State = dsBrowse then
  dmPrestamo.tblAvisoAtarso.Edit;
end;

procedure TfrmAvisoAtraso.BitBtn3Click(Sender: TObject);
begin
  if dmPrestamo.tblAvisoAtarso.State in [dsEdit, dsInsert] then
  dmPrestamo.tblAvisoAtarso.cancel;
end;

procedure TfrmAvisoAtraso.BitBtn4Click(Sender: TObject);
begin
  if dmPrestamo.tblAvisoAtarso.State in [dsEdit, dsInsert] then
  begin
    dmPrestamo.tblAvisoAtarso.Post;
    dmPrestamo.tblAvisoAtarso.ApplyUpdates;
    if Not dmPrestamo.tblAvisoAtarso.Transaction.InTransaction then
    dmPrestamo.tblAvisoAtarso.Transaction.StartTransaction;
    try
      dmPrestamo.tblAvisoAtarso.Transaction.CommitRetaining;
    except
    dmPrestamo.tblAvisoAtarso.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmAvisoAtraso.BitBtn5Click(Sender: TObject);
begin
  if dmPrestamo.tblAvisoAtarso.State in [dsInactive, dsBrowse] then
  begin
    dmPrestamo.tblAvisoAtarso.Close;
    dmPrestamo.tblAvisoAtarso.Open;
  end;
end;

procedure TfrmAvisoAtraso.BitBtn9Click(Sender: TObject);
begin
  dmPrestamo.tblAvisoAtarso.first;
end;

procedure TfrmAvisoAtraso.BitBtn10Click(Sender: TObject);
begin
  dmPrestamo.tblAvisoAtarso.Prior;
end;

procedure TfrmAvisoAtraso.BitBtn11Click(Sender: TObject);
begin
  dmPrestamo.tblAvisoAtarso.Next;
end;

procedure TfrmAvisoAtraso.BitBtn12Click(Sender: TObject);
begin
  dmPrestamo.tblAvisoAtarso.Last;
end;

procedure TfrmAvisoAtraso.FormCreate(Sender: TObject);
begin
  BitBtn5Click(Self);
end;

end.
