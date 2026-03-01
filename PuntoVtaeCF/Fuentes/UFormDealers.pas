unit UFormDealers;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WinSkinData, StdCtrls, Buttons, Grids, DBGrids, RxDBCtrl, Mask,
  DB, DBCtrls, RxCtrls;

type
  TfrmDealers = class(TForm)
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
  frmDealers: TfrmDealers;

implementation

uses UGlobal, UDatmodDatosGenerales;

{$R *.dfm}

procedure TfrmDealers.BitBtn10Click(Sender: TObject);
begin
  dmdatos.tblDealer.prior;
end;

procedure TfrmDealers.BitBtn11Click(Sender: TObject);
begin
  dmdatos.tblDealer.next;
end;

procedure TfrmDealers.BitBtn12Click(Sender: TObject);
begin
  dmdatos.tblDealer.Last;
end;

procedure TfrmDealers.BitBtn9Click(Sender: TObject);
begin
  dmdatos.tblDealer.first;
end;

procedure TfrmDealers.SpeedButton1Click(Sender: TObject);
begin
  if dmdatos.tblDealer.State in [dsinsert, dsEdit] then
  begin
    if dmdatos.tblDealer.State in [dsinsert] then
    dmdatos.tblDealerCODIGO_DEALER.Value:= FsqlMaxNumero('DEALEAR','codigo_dealer');
    dmdatos.tblDealer.Post;
    dmdatos.tblDealer.ApplyUpdates;
    if not dmdatos.tblDealer.Transaction.InTransaction then
    dmdatos.tblDealer.Transaction.StartTransaction;
    try
      dmdatos.tblDealer.Transaction.CommitRetaining;
    except
    dmdatos.tblDealer.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmDealers.SpeedButton2Click(Sender: TObject);
begin
  if dmdatos.tblDealer.State = dsBrowse then
  begin
    dmdatos.tblDealer.Insert;
    DBEdit2.SetFocus;
  end;
end;

procedure TfrmDealers.SpeedButton3Click(Sender: TObject);
begin
  if dmdatos.tblDealer.State in [dsinsert, dsEdit] then
  begin
    dmdatos.tblDealer.Cancel;
  end;
end;

procedure TfrmDealers.FormCreate(Sender: TObject);
begin
  dmdatos.tblDealer.close;
  dmdatos.tblDealer.Open;
end;

end.
