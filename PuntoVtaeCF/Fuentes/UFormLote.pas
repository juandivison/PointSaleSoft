unit UFormLote;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, WinSkinData, StdCtrls, Buttons, Grids,
  DBGrids, RxDBCtrl, Mask, DBCtrls, RxCtrls, IBQuery, RxLookup, RxToolEdit;

type
  TfrmLotes = class(TForm)
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton1: TSpeedButton;
    DBStatusLabel1: TDBStatusLabel;
    RxDBGrid1: TRxDBGrid;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    SkinData1: TSkinData;
    tblLote: TIBDataSet;
    tblLoteCODIGO: TIntegerField;
    tblLoteLOTE_NUM: TIBStringField;
    tblLoteCODIGO_PROV: TIntegerField;
    tblLoteFECHA: TDateTimeField;
    tblLoteCANT_IN: TIntegerField;
    tblLoteCANT_OUT: TIntegerField;
    tblLoteFECHA_VENCIMIENTO: TDateTimeField;
    tblLoteSERIE_TRN_REGPED: TIntegerField;
    tblLoteCOD_PROV_ANT: TIntegerField;
    dstblLote: TDataSource;
    RxDBLookupCombo6: TRxDBLookupCombo;
    Label37: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label1: TLabel;
    qryInv: TIBQuery;
    dsqryInv: TDataSource;
    qryProv: TIBQuery;
    qryProvCODIGO_CTE: TIntegerField;
    qryProvDESCRIPCION: TIBStringField;
    dsqryProv: TDataSource;
    BitBtn1: TBitBtn;
    DBDateEdit1: TDBDateEdit;
    Label2: TLabel;
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    codProv:integer;
    codProd:integer;
    procedure AbrirDatos;
  end;

var
  frmLotes: TfrmLotes;

implementation
  uses UDatModConectar, UGlobal;

{$R *.dfm}

procedure TfrmLotes.BitBtn10Click(Sender: TObject);
begin
  tblLote.prior;
end;

procedure TfrmLotes.BitBtn11Click(Sender: TObject);
begin
  tblLote.next;
end;

procedure TfrmLotes.BitBtn12Click(Sender: TObject);
begin
  tblLote.Last;
end;

procedure TfrmLotes.BitBtn9Click(Sender: TObject);
begin
  tblLote.first;
end;

procedure TfrmLotes.SpeedButton1Click(Sender: TObject);
begin
  if tblLote.State in [dsinsert, dsEdit] then
  begin
    if tblLoteLOTE_NUM.IsNull then
    begin
      MessageDlg('Indique numero de lote.',mtInformation,[mbok],0);
      exit;
    end;
    GlbSalvarQuery(tblLote);
  end;
end;

procedure TfrmLotes.SpeedButton2Click(Sender: TObject);
begin
  if tblLote.State = dsBrowse then
  begin
    tblLote.Insert;
    tblLoteFECHA.Value:= ExtraerFecha(GlbFechaTrnDiaria);
  end;
end;

procedure TfrmLotes.SpeedButton3Click(Sender: TObject);
begin
  if tblLote.State in [dsinsert, dsEdit] then
  begin
    tblLote.Cancel;
  end;
end;

procedure TfrmLotes.BitBtn1Click(Sender: TObject);
begin
  if tblLote.State in [dsBrowse] then
  begin
    tblLote.Edit;
  end;
end;

procedure TfrmLotes.AbrirDatos;
begin
  qryProv.close;
  qryProv.open;
  tblLote.close;
  tblLote.params[0].Value:= codProv;
  tblLote.params[1].Value:= codProd;
  tblLote.Open;
  qryInv.close;
  qryInv.open;
end;

end.
