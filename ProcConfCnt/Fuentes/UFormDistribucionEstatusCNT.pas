unit UFormDistribucionEstatusCNT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  DB, Dialogs, StdCtrls, Buttons, Grids, DBGrids, RXDBCtrl, Mask, DBCtrls,
  RXCtrls, WinSkinData;

type
  TfrmConfEstatusCnt = class(TForm)
    Label2: TLabel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton1: TSpeedButton;
    DBStatusLabel1: TDBStatusLabel;
    DBEdit2: TDBEdit;
    RxDBGrid1: TRxDBGrid;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    SkinData1: TSkinData;
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfEstatusCnt: TfrmConfEstatusCnt;

implementation
  uses UDatModDistCNT, UGlobal;
{$R *.dfm}

procedure TfrmConfEstatusCnt.BitBtn10Click(Sender: TObject);
begin
  dmDistCnt.tblDistribucionEstatusCnt.prior;
end;

procedure TfrmConfEstatusCnt.BitBtn11Click(Sender: TObject);
begin
  dmDistCnt.tblDistribucionEstatusCnt.next;
end;

procedure TfrmConfEstatusCnt.BitBtn12Click(Sender: TObject);
begin
  dmDistCnt.tblDistribucionEstatusCnt.Last;
end;

procedure TfrmConfEstatusCnt.BitBtn9Click(Sender: TObject);
begin
  dmDistCnt.tblDistribucionEstatusCnt.first;
end;

procedure TfrmConfEstatusCnt.SpeedButton1Click(Sender: TObject);
begin
  if dmDistCnt.tblDistribucionEstatusCnt.State in [dsinsert, dsEdit] then
  begin
    dmDistCnt.tblDistribucionEstatusCntserie.Value:= FsqlMaxNumero('DISTR_STATUS_CNT','SERIE');
    dmDistCnt.tblDistribucionEstatusCnt.Post;
    dmDistCnt.tblDistribucionEstatusCnt.ApplyUpdates;
    if not dmDistCnt.tblDistribucionEstatusCnt.Transaction.InTransaction then
    dmDistCnt.tblDistribucionEstatusCnt.Transaction.StartTransaction;
    try
      dmDistCnt.tblDistribucionEstatusCnt.Transaction.CommitRetaining;
    except
    dmDistCnt.tblDistribucionEstatusCnt.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmConfEstatusCnt.SpeedButton2Click(Sender: TObject);
begin
  if dmDistCnt.tblDistribucionEstatusCnt.State = dsBrowse then
  begin
    dmDistCnt.tblDistribucionEstatusCnt.Insert;
    DBEdit2.SetFocus;
  end;
end;

procedure TfrmConfEstatusCnt.SpeedButton3Click(Sender: TObject);
begin
  if dmDistCnt.tblDistribucionEstatusCnt.State in [dsinsert, dsEdit] then
  begin
    dmDistCnt.tblDistribucionEstatusCnt.Cancel;
  end;
end;

procedure TfrmConfEstatusCnt.FormCreate(Sender: TObject);
begin
  dmDistCnt.tblDistribucionEstatusCnt.Close;
  dmDistCnt.tblDistribucionEstatusCnt.Open;
end;

end.
