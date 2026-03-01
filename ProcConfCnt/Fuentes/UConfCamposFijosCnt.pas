unit UConfCamposFijosCnt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, StdCtrls, Buttons, Grids, DBGrids,
  RXDBCtrl, Mask, DBCtrls, RXCtrls, WinSkinData;

type
  TfrmCamposFijosCnt = class(TForm)
    dstblDistCntDet: TDataSource;
    Label23: TLabel;
    Label24: TLabel;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    RxDBGrid3: TRxDBGrid;
    BitBtn14: TBitBtn;
    BitBtn15: TBitBtn;
    tblDistCntDet: TIBDataSet;
    tblDistCntDetSERIE: TIntegerField;
    tblDistCntDetNOMBRE_CAMPO: TIBStringField;
    tblDistCntDetNOMBRE_CAMPODET: TIBStringField;
    DBStatusLabel1: TDBStatusLabel;
    SkinData1: TSkinData;
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCamposFijosCnt: TfrmCamposFijosCnt;

implementation
uses UGlobal, UDatModDistCNT;

{$R *.dfm}

procedure TfrmCamposFijosCnt.BitBtn14Click(Sender: TObject);
begin
  tblDistCntDet.Insert;
end;

procedure TfrmCamposFijosCnt.BitBtn15Click(Sender: TObject);
begin
  if (tblDistCntDet.State In [dsInsert, dsEdit] ) then
  begin
    if (tblDistCntDet.State In [dsInsert] ) then
    tblDistCntDetSERIE.Value:=FsqlMaxNumero('DISTRIBUCION_CNT_DET','SERIE');
    if (tblDistCntDetSERIE.IsNull) or (tblDistCntDetSERIE.Value = 0) then
    tblDistCntDetSERIE.Value:=1;
    tblDistCntDet.Post;
    tblDistCntDet.ApplyUpdates;
    if not tblDistCntDet.Transaction.InTransaction then
    tblDistCntDet.Transaction.StartTransaction;
    try
      tblDistCntDet.Transaction.CommitRetaining;
    except
    tblDistCntDet.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmCamposFijosCnt.FormCreate(Sender: TObject);
begin
  tblDistCntDet.Close;
  tblDistCntDet.Open;
  tblDistCntDet.First;
end;

end.
