unit UFormIngChequesDet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RxLookup, StdCtrls, Mask, DBCtrls, Buttons, Grids, DBGrids,
  db, RXDBCtrl, RXCtrls, WinSkinData;

type
  TfrmDatosIngCheque = class(TForm)
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
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Function CheckIfTransExiste:Boolean;
  end;

var
  frmDatosIngCheque: TfrmDatosIngCheque;

implementation

uses UDatModCxc, Uglobal, UDatModIngresos;

{$R *.dfm}

procedure TfrmDatosIngCheque.BitBtn10Click(Sender: TObject);
begin
  dmCxc.rxIngChequeDet.prior;
end;

procedure TfrmDatosIngCheque.BitBtn11Click(Sender: TObject);
begin
  dmCxc.rxIngChequeDet.next;
end;

procedure TfrmDatosIngCheque.BitBtn12Click(Sender: TObject);
begin
  dmCxc.rxIngChequeDet.Last;
end;

procedure TfrmDatosIngCheque.BitBtn9Click(Sender: TObject);
begin
  dmCxc.rxIngChequeDet.first;
end;

procedure TfrmDatosIngCheque.SpeedButton1Click(Sender: TObject);
begin
    if dmCxc.rxIngChequeDet.State in [dsinsert] then
    if CheckIfTransExiste then
    begin
      MessageDlg('Numero de transferencia ya existe, verifique.',mtError,[mbok],0);
      Exit;
    end;
  if dmCxc.rxIngChequeDet.State in [dsinsert, dsEdit] then
  begin

    if dmCxc.rxIngChequeDet.State in [dsInsert] then
    //dmCxc.rxIngChequeDetSerie.Value:= FsqlMaxNumero('COBROS_EN_CHEQUE','SERIE');
    dmCxc.rxIngChequeDet.Post;
    //dmCxc.rxIngChequeDet.ApplyUpdates;
    //if not dmCxc.rxIngChequeDet.Transaction.InTransaction then
    //dmCxc.rxIngChequeDet.Transaction.StartTransaction;
    //try
    //  dmCxc.rxIngChequeDet.Transaction.CommitRetaining;
    //except
    //dmCxc.rxIngChequeDet.Transaction.RollbackRetaining;
    //end;
  end;
end;

procedure TfrmDatosIngCheque.SpeedButton2Click(Sender: TObject);
begin
  if dmCxc.rxIngChequeDet.State = dsBrowse then
  begin
    dmCxc.rxIngChequeDet.Append;
    RxDBLookupCombo1.SetFocus;
  end;
end;

procedure TfrmDatosIngCheque.SpeedButton3Click(Sender: TObject);
begin
  if dmCxc.rxIngChequeDet.State in [dsinsert, dsEdit] then
  begin
    dmCxc.rxIngChequeDet.Cancel;
  end;
end;

procedure TfrmDatosIngCheque.FormCreate(Sender: TObject);
begin
  dmcxc.qryBancos.Close;
  dmcxc.qryBancos.Params[0].Value:= GlbCia_Key;  
  dmcxc.qryBancos.Open; 
end;

Function TfrmDatosIngCheque.CheckIfTransExiste : Boolean;
begin
  result:=false;
  dmIngresos.tblTransferencias.Close;
  dmIngresos.tblTransferencias.Params[0].Value:=dmCxc.rxIngChequeDetNumero_Cheque.Value;
  dmIngresos.tblTransferencias.Open;
  dmIngresos.tblTransferencias.First;
  if dmIngresos.tblTransferencias.RecordCount = 1 then
  begin
    result:=True;
  end;
end;

procedure TfrmDatosIngCheque.DBEdit1Exit(Sender: TObject);
begin
  if CheckIfTransExiste then
  begin
    MessageDlg('Número de transferencia ya existe, verifique.',mtError,[mbok],0);
    DBEdit1.SetFocus;
    DBEdit1.SelectAll;
  end;
end;

end.
