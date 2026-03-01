unit UGrupoCnt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, RxLookup, StdCtrls, Mask, DBCtrls, Buttons, Grids, DBGrids,
  RXDBCtrl, RXCtrls, WinSkinData;

type
  TfrmGrupocnt = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label2: TLabel;
    RxDBGrid1: TRxDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    DBStatusLabel1: TDBStatusLabel;
    SkinData1: TSkinData;
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
  frmGrupocnt: TfrmGrupocnt;

implementation

uses UDatModDistCNT, UGlobal;

{$R *.dfm}

procedure TfrmGrupocnt.BitBtn1Click(Sender: TObject);
begin
  if dmDistCnt.tblGrupoCnt.State = dsBrowse then
  begin
    dmDistCnt.tblGrupoCnt.Insert;
    RxDBLookupCombo1.SetFocus;
  end;
end;

procedure TfrmGrupocnt.BitBtn2Click(Sender: TObject);
begin
  if dmDistCnt.tblGrupoCnt.State = dsBrowse then
  dmDistCnt.tblGrupoCnt.Edit;
end;

procedure TfrmGrupocnt.BitBtn3Click(Sender: TObject);
begin
  if dmDistCnt.tblGrupoCnt.State in [dsEdit, dsInsert] then
  dmDistCnt.tblGrupoCnt.cancel;
end;

procedure TfrmGrupocnt.BitBtn4Click(Sender: TObject);
begin
  if dmDistCnt.tblGrupoCnt.State In [dsEdit, dsInsert] then
  begin
    if dmDistCnt.tblGrupoCnt.State = dsInsert then
    dmDistCnt.tblGrupoCntID_FPAGO.Value := FsqlMaxNumero('GRUPO_CNT','ID_FPAGO');
    if (dmDistCnt.tblGrupoCntID_FPAGO.IsNull) Or
       (dmDistCnt.tblGrupoCntID_FPAGO.Value = 0) then
    dmDistCnt.tblGrupoCntID_FPAGO.Value:= 1;
    
    dmDistCnt.tblGrupoCnt.Post;
    dmDistCnt.tblGrupoCnt.ApplyUpdates;
    if not dmDistCnt.tblGrupoCnt.Transaction.InTransaction then
    dmDistCnt.tblGrupoCnt.Transaction.StartTransaction;
    try
      dmDistCnt.tblGrupoCnt.Transaction.CommitRetaining;
    except
    dmDistCnt.tblGrupoCnt.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmGrupocnt.BitBtn5Click(Sender: TObject);
begin
  if dmDistCnt.tblGrupoCnt.State in [dsInactive, dsBrowse] then
  begin
    dmDistCnt.tblGrupoCnt.Close;
    dmDistCnt.tblGrupoCnt.Open;
  end;
end;

procedure TfrmGrupocnt.FormCreate(Sender: TObject);
begin
  dmDistCnt.tblFormaPago.Close;
  dmDistCnt.tblModuloCnt.Close;
  dmDistCnt.tblFormaPago.Open;
  dmDistCnt.tblModuloCnt.Open;
  dmDistCnt.tblGrupoCnt.Close;
  dmDistCnt.tblGrupoCnt.Open;
end;

end.
