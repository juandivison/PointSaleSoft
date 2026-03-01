unit UConfDescuentoFactura;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, RXDBCtrl, Mask, DBCtrls,
  db, RXCtrls;

type
  TfrmConfigurarDescFact = class(TForm)
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
    DBEdit4: TDBEdit;
    Label4: TLabel;
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
  frmConfigurarDescFact: TfrmConfigurarDescFact;

implementation

uses UDatModFactura, UGlobal;

{$R *.dfm}

procedure TfrmConfigurarDescFact.BitBtn10Click(Sender: TObject);
begin
  dmFactura.tblConfDescuentoFactura.prior;
end;

procedure TfrmConfigurarDescFact.BitBtn11Click(Sender: TObject);
begin
  dmFactura.tblConfDescuentoFactura.next;
end;

procedure TfrmConfigurarDescFact.BitBtn12Click(Sender: TObject);
begin
  dmFactura.tblConfDescuentoFactura.Last;
end;

procedure TfrmConfigurarDescFact.BitBtn9Click(Sender: TObject);
begin
  dmFactura.tblConfDescuentoFactura.first;
end;

procedure TfrmConfigurarDescFact.SpeedButton1Click(Sender: TObject);
begin
  if dmFactura.tblConfDescuentoFactura.State in [dsinsert, dsEdit] then
  begin
    if dmFactura.tblConfDescuentoFactura.State in [dsinsert] then
    dmFactura.tblConfDescuentoFacturaTIPO.Value:= FsqlMaxNumero('CONF_DESC_FACTURAS','tipo');
    if (dmFactura.tblConfDescuentoFacturaTIPO.IsNull) OR
    (dmFactura.tblConfDescuentoFacturaTIPO.Value = 0) then
    dmFactura.tblConfDescuentoFacturaTIPO.Value:=1;
    dmFactura.tblConfDescuentoFactura.Post;
    dmFactura.tblConfDescuentoFactura.ApplyUpdates;
    if not dmFactura.tblConfDescuentoFactura.Transaction.InTransaction then
    dmFactura.tblConfDescuentoFactura.Transaction.StartTransaction;
    try
      dmFactura.tblConfDescuentoFactura.Transaction.CommitRetaining;
    except
    dmFactura.tblConfDescuentoFactura.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmConfigurarDescFact.SpeedButton2Click(Sender: TObject);
begin
  if dmFactura.tblConfDescuentoFactura.State = dsBrowse then
  begin
    dmFactura.tblConfDescuentoFactura.Append;
    dmFactura.tblConfDescuentoFacturaSTATUS.Value := 'A';
    dmFactura.tblConfDescuentoFacturaFECHAINI.Value := ExtraerFecha(GlbFechaTrnDiaria);
    dmFactura.tblConfDescuentoFacturaFECHAFIN.Value := ExtraerFecha(GlbFechaTrnDiaria) + 1825;
    DBEdit2.SetFocus;
  end;
end;

procedure TfrmConfigurarDescFact.SpeedButton3Click(Sender: TObject);
begin
  if dmFactura.tblConfDescuentoFactura.State in [dsinsert, dsEdit] then
  begin
    dmFactura.tblConfDescuentoFactura.Cancel;
  end else
  begin
    if MessageDlg('Eliminar records?', mtInformation,[mbYes, mbNo],0) = mrYes then
    begin
      dmFactura.tblConfDescuentoFactura.Delete;
      dmFactura.tblConfDescuentoFactura.ApplyUpdates;
      if not dmFactura.tblConfDescuentoFactura.Transaction.InTransaction then
      dmFactura.tblConfDescuentoFactura.Transaction.StartTransaction;
      try
        dmFactura.tblConfDescuentoFactura.Transaction.CommitRetaining;
      except
      dmFactura.tblConfDescuentoFactura.Transaction.RollbackRetaining;
      end;
    end;
  end;
end;

procedure TfrmConfigurarDescFact.FormCreate(Sender: TObject);
begin
  dmFactura.tblConfDescuentoFactura.Close;
  dmFactura.tblConfDescuentoFactura.Open;
end;

end.
