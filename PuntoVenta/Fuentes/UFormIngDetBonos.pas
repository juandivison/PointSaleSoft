unit UFormIngDetBonos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RxLookup, StdCtrls, Mask, DBCtrls, Buttons, Grids, DBGrids,
  db, RXDBCtrl, RXCtrls, WinSkinData;

type
  TfrmDetallesIngEnBonos = class(TForm)
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton1: TSpeedButton;
    DBStatusLabel1: TDBStatusLabel;
    RxDBGrid1: TRxDBGrid;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    RxDBLookupCombo1: TRxDBLookupCombo;
    SkinData1: TSkinData;
    DBEdit2: TDBEdit;
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
  frmDetallesIngEnBonos: TfrmDetallesIngEnBonos;

implementation

uses UDatModCxc, Uglobal;

{$R *.dfm}

procedure TfrmDetallesIngEnBonos.BitBtn10Click(Sender: TObject);
begin
  dmCxc.rxIngresoEnBonos.prior;
end;

procedure TfrmDetallesIngEnBonos.BitBtn11Click(Sender: TObject);
begin
  dmCxc.rxIngresoEnBonos.next;
end;

procedure TfrmDetallesIngEnBonos.BitBtn12Click(Sender: TObject);
begin
  dmCxc.rxIngresoEnBonos.Last;
end;

procedure TfrmDetallesIngEnBonos.BitBtn9Click(Sender: TObject);
begin
  dmCxc.rxIngresoEnBonos.first;
end;

procedure TfrmDetallesIngEnBonos.SpeedButton1Click(Sender: TObject);
begin
  if dmCxc.rxIngresoEnBonos.State in [dsinsert, dsEdit] then
  begin
    if dmCxc.rxIngresoEnBonos.State in [dsInsert] then
    //dmCxc.rxIngresoEnBonosSerie.Value:= FsqlMaxNumero('COBROS_EN_CHEQUE','SERIE');
    dmCxc.rxIngresoEnBonos.Post;
    //dmCxc.rxIngresoEnBonos.ApplyUpdates;
    //if not dmCxc.rxIngresoEnBonos.Transaction.InTransaction then
    //dmCxc.rxIngresoEnBonos.Transaction.StartTransaction;
    //try
    //  dmCxc.rxIngresoEnBonos.Transaction.CommitRetaining;
    //except
    //dmCxc.rxIngresoEnBonos.Transaction.RollbackRetaining;
    //end;
  end;
end;

procedure TfrmDetallesIngEnBonos.SpeedButton2Click(Sender: TObject);
begin
  if dmCxc.rxIngresoEnBonos.State = dsBrowse then
  begin
    dmCxc.rxIngresoEnBonos.Append;
    RxDBLookupCombo1.SetFocus;
  end;
end;

procedure TfrmDetallesIngEnBonos.SpeedButton3Click(Sender: TObject);
begin
  if dmCxc.rxIngresoEnBonos.State in [dsinsert, dsEdit] then
  begin
    dmCxc.rxIngresoEnBonos.Cancel;
  end;
end;

procedure TfrmDetallesIngEnBonos.FormCreate(Sender: TObject);
begin
  dmcxc.qryBancos.Close;
  dmcxc.qryBancos.Params[0].Value:= GlbCia_Key;  
  dmcxc.qryBancos.Open;
  dmCxc.qryClientes.Close;
  dmCxc.qryClientes.Open;
end;

end.
