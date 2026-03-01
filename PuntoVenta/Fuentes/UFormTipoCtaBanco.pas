unit UFormTipoCtaBanco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  db, Dialogs, StdCtrls, Buttons, Grids, DBGrids, RXDBCtrl, Mask, DBCtrls,
  RXCtrls, WinSkinData;

type
  TfrmTipoCtaBanco = class(TForm)
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
  frmTipoCtaBanco: TfrmTipoCtaBanco;

implementation

uses UDatModTransCnt, UGlobal;

{$R *.dfm}

procedure TfrmTipoCtaBanco.BitBtn10Click(Sender: TObject);
begin
  dmTransCnt.tblTipoCuentabco.prior;
end;

procedure TfrmTipoCtaBanco.BitBtn11Click(Sender: TObject);
begin
  dmTransCnt.tblTipoCuentabco.next;
end;

procedure TfrmTipoCtaBanco.BitBtn12Click(Sender: TObject);
begin
  dmTransCnt.tblTipoCuentabco.Last;
end;

procedure TfrmTipoCtaBanco.BitBtn9Click(Sender: TObject);
begin
  dmTransCnt.tblTipoCuentabco.first;
end;

procedure TfrmTipoCtaBanco.SpeedButton1Click(Sender: TObject);
begin
  if dmTransCnt.tblTipoCuentabco.State in [dsinsert, dsEdit] then
  begin
    if dmTransCnt.tblTipoCuentabco.State in [dsinsert] then
    dmTransCnt.tblTipoCuentabcoCODIGO.Value:= FsqlMaxNumero('TIPO_CTA_BANCO','CODIGO');
    dmTransCnt.tblTipoCuentabco.Post;
    dmTransCnt.tblTipoCuentabco.ApplyUpdates;
    if not dmTransCnt.tblTipoCuentabco.Transaction.InTransaction then
    dmTransCnt.tblTipoCuentabco.Transaction.StartTransaction;
    try
      dmTransCnt.tblTipoCuentabco.Transaction.CommitRetaining;
    except
    dmTransCnt.tblTipoCuentabco.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmTipoCtaBanco.SpeedButton2Click(Sender: TObject);
begin
  if dmTransCnt.tblTipoCuentabco.State = dsBrowse then
  begin
    dmTransCnt.tblTipoCuentabco.Insert;
    DBEdit2.SetFocus;
  end;
end;

procedure TfrmTipoCtaBanco.SpeedButton3Click(Sender: TObject);
begin
  if dmTransCnt.tblTipoCuentabco.State in [dsinsert, dsEdit] then
  begin
    dmTransCnt.tblTipoCuentabco.Cancel;
  end;
end;

procedure TfrmTipoCtaBanco.FormCreate(Sender: TObject);
begin
  dmTransCnt.tblTipoCuentabco.Close;
  dmTransCnt.tblTipoCuentabco.Open;
end;

end.
