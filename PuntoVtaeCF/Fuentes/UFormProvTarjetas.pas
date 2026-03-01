unit UFormProvTarjetas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, WinSkinData, Buttons, Grids, DBGrids,
  RxDBCtrl, RxCtrls, RxLookup, DB;

type
  TfrmProvTarjetas = class(TForm)
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
    Label1: TLabel;
    DBEdit1: TDBEdit;
    RxDBLookupCombo4: TRxDBLookupCombo;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label2: TLabel;
    Label3: TLabel;
    dsQryBancos: TDataSource;
    dsqryBancosDet: TDataSource;
    SkinData2: TSkinData;
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RxDBLookupCombo4Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProvTarjetas: TfrmProvTarjetas;

implementation

uses UDatModPagoTarjeta, UDatModBanco, Uglobal;

{$R *.dfm}

procedure TfrmProvTarjetas.BitBtn10Click(Sender: TObject);
begin
  dmPagosTarjeta.tblProvCobroTarjeta.prior;
end;

procedure TfrmProvTarjetas.BitBtn11Click(Sender: TObject);
begin
  dmPagosTarjeta.tblProvCobroTarjeta.next;
end;

procedure TfrmProvTarjetas.BitBtn12Click(Sender: TObject);
begin
  dmPagosTarjeta.tblProvCobroTarjeta.Last;
end;

procedure TfrmProvTarjetas.BitBtn9Click(Sender: TObject);
begin
  dmPagosTarjeta.tblProvCobroTarjeta.first;
end;

procedure TfrmProvTarjetas.SpeedButton1Click(Sender: TObject);
begin
  if dmPagosTarjeta.tblProvCobroTarjeta.State in [dsinsert, dsEdit] then
  begin
    if dmPagosTarjeta.tblProvCobroTarjeta.State in [dsinsert] then
    dmPagosTarjeta.tblProvCobroTarjetaCodigo.Value:= FsqlMaxNumero('PROVEEDOR_COBRO_TARJETA','codigo');
    dmPagosTarjeta.tblProvCobroTarjeta.Post;
    dmPagosTarjeta.tblProvCobroTarjeta.ApplyUpdates;
    if not dmPagosTarjeta.tblProvCobroTarjeta.Transaction.InTransaction then
    dmPagosTarjeta.tblProvCobroTarjeta.Transaction.StartTransaction;
    try
      dmPagosTarjeta.tblProvCobroTarjeta.Transaction.CommitRetaining;
    except
    dmPagosTarjeta.tblProvCobroTarjeta.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmProvTarjetas.SpeedButton2Click(Sender: TObject);
begin
  if dmPagosTarjeta.tblProvCobroTarjeta.State = dsBrowse then
  begin
    dmPagosTarjeta.tblProvCobroTarjeta.Insert;
    DBEdit1.SetFocus;
  end;
end;

procedure TfrmProvTarjetas.SpeedButton3Click(Sender: TObject);
begin
  if dmPagosTarjeta.tblProvCobroTarjeta.State in [dsinsert, dsEdit] then
  begin
    dmPagosTarjeta.tblProvCobroTarjeta.Cancel;
  end;
end;

procedure TfrmProvTarjetas.FormCreate(Sender: TObject);
begin
  dmBancos.qryBancos.close;
  dmBancos.qryBancos.Params[0].Value:= glbCia_Key;
  dmBancos.qryBancos.open;
  dmPagosTarjeta.tblProvCobroTarjeta.close;
  dmPagosTarjeta.tblProvCobroTarjeta.open;
end;

procedure TfrmProvTarjetas.RxDBLookupCombo4Exit(Sender: TObject);
begin
  dmBancos.qryBancosDet.Close;
  dmBancos.qryBancosDet.Params[0].Value:= dmPagosTarjeta.tblProvCobroTarjetaCODIGO_BANCO.Value;
  dmBancos.qryBancosDet.Open;
end;

end.
