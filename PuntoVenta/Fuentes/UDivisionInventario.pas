unit UDivisionInventario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, WinSkinData, Grids, DBGrids, RXDBCtrl,
  StdCtrls, Buttons, RXCtrls, Mask, DBCtrls, RxDBComb;

type
  TfrmDivisionInv = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    dstblDivInventario: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DBStatusLabel1: TDBStatusLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    RxDBGrid1: TRxDBGrid;
    SkinData1: TSkinData;
    tblDivInventario: TIBDataSet;
    tblDivInventarioINVENTARIO_ID: TIntegerField;
    tblDivInventarioDESCRIPCION: TIBStringField;
    tblDivInventarioSTATUS: TIBStringField;
    RxDBComboBox1: TRxDBComboBox;
    Label3: TLabel;
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  frmDivisionInv: TfrmDivisionInv;

implementation

uses UDatModConectar, UGlobal;

{$R *.dfm}

procedure TfrmDivisionInv.BitBtn10Click(Sender: TObject);
begin
  tblDivInventario.prior;
end;

procedure TfrmDivisionInv.BitBtn11Click(Sender: TObject);
begin
  tblDivInventario.next;
end;

procedure TfrmDivisionInv.BitBtn12Click(Sender: TObject);
begin
  tblDivInventario.last;
end;

procedure TfrmDivisionInv.BitBtn1Click(Sender: TObject);
begin
  if tblDivInventario.State in [dsBrowse] then
  begin
    tblDivInventario.Insert;
    dbedit2.SetFocus;
  end;
end;

procedure TfrmDivisionInv.BitBtn2Click(Sender: TObject);
begin
  if tblDivInventario.State in [dsBrowse] then
  tblDivInventario.Edit;
end;

procedure TfrmDivisionInv.BitBtn3Click(Sender: TObject);
begin
  if tblDivInventario.State in [dsInsert, dsEdit] then
  tblDivInventario.Cancel
  else
  begin
    if MessageDlg('Eliminar record?',mtInformation, [mbyes,mbno], 0)=mryes then
    begin
      tblDivInventario.Delete;
      tblDivInventario.Post;
      tblDivInventario.ApplyUpdates;
      try
        tblDivInventario.Transaction.CommitRetaining;
      except
        tblDivInventario.Transaction.RollbackRetaining;
      end;
    end;
  end;

end;

procedure TfrmDivisionInv.BitBtn4Click(Sender: TObject);
begin
  if tblDivInventario.State In [dsInsert, dsEdit] then
  begin
    if tblDivInventario.State = dsInsert then
    begin
      tblDivInventarioINVENTARIO_ID.Value:= FsqlMaxNumero('DIVISION_INVENTARIO','INVENTARIO_ID');
      if tblDivInventarioINVENTARIO_ID.IsNull or
      (tblDivInventarioINVENTARIO_ID.Value = 0) then
      tblDivInventarioINVENTARIO_ID.Value:=1;
    end;
    tblDivInventario.Post;
    tblDivInventario.ApplyUpdates;
    if not tblDivInventario.Transaction.InTransaction then
    tblDivInventario.Transaction.StartTransaction;
    try
      tblDivInventario.Transaction.CommitRetaining;
    except
    tblDivInventario.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmDivisionInv.BitBtn5Click(Sender: TObject);
begin
  if tblDivInventario.State in [dsBrowse, dsInactive] then
  begin
    tblDivInventario.Close;
    tblDivInventario.Open;
  end;
end;

procedure TfrmDivisionInv.BitBtn9Click(Sender: TObject);
begin
  tblDivInventario.First;
end;

procedure TfrmDivisionInv.FormCreate(Sender: TObject);
begin
  tblDivInventario.close;
  tblDivInventario.Open;
end;

end.
