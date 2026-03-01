unit UFormTipoDeposito;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  db, Dialogs, StdCtrls, Buttons, Grids, DBGrids, RXDBCtrl, Mask, DBCtrls,
  RXCtrls, WinSkinData;

type
  TfrmTipoDeposito = class(TForm)
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
  frmTipoDeposito: TfrmTipoDeposito;

implementation

uses UDatModTransCnt,uglobal;

{$R *.dfm}

procedure TfrmTipoDeposito.BitBtn10Click(Sender: TObject);
begin
  dmTransCnt.tblTipoDeposito.prior;
end;

procedure TfrmTipoDeposito.BitBtn11Click(Sender: TObject);
begin
  dmTransCnt.tblTipoDeposito.next;
end;

procedure TfrmTipoDeposito.BitBtn12Click(Sender: TObject);
begin
  dmTransCnt.tblTipoDeposito.Last;
end;

procedure TfrmTipoDeposito.BitBtn9Click(Sender: TObject);
begin
  dmTransCnt.tblTipoDeposito.first;
end;

procedure TfrmTipoDeposito.SpeedButton1Click(Sender: TObject);
begin
  if dmTransCnt.tblTipoDeposito.State in [dsinsert, dsEdit] then
  begin
    dmTransCnt.tblTipoDepositoID_DEPOSITO.Value:= FsqlMaxNumero('TIPO_DEPOSITO','ID_DEPOSITO');
    dmTransCnt.tblTipoDeposito.Post;
    dmTransCnt.tblTipoDeposito.ApplyUpdates;
    if not dmTransCnt.tblTipoDeposito.Transaction.InTransaction then
    dmTransCnt.tblTipoDeposito.Transaction.StartTransaction;
    try
      dmTransCnt.tblTipoDeposito.Transaction.CommitRetaining;
    except
    dmTransCnt.tblTipoDeposito.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmTipoDeposito.SpeedButton2Click(Sender: TObject);
begin
  if dmTransCnt.tblTipoDeposito.State = dsBrowse then
  begin
    dmTransCnt.tblTipoDeposito.Insert;
    DBEdit2.SetFocus;
  end;
end;

procedure TfrmTipoDeposito.SpeedButton3Click(Sender: TObject);
begin
  if dmTransCnt.tblTipoDeposito.State in [dsinsert, dsEdit] then
  begin
    dmTransCnt.tblTipoDeposito.Cancel;
  end;
end;

procedure TfrmTipoDeposito.FormCreate(Sender: TObject);
begin
  dmTransCnt.tblTipoDeposito.close;
  dmTransCnt.tblTipoDeposito.Open;
end;

end.
