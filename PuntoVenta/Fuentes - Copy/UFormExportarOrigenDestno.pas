unit UFormExportarOrigenDestno;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, RXDBCtrl, Mask, DBCtrls,
  RXCtrls, ComCtrls;

type
  TfrmExportarOrigenDestino = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
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
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    DBStatusLabel2: TDBStatusLabel;
    DBEdit1: TDBEdit;
    RxDBGrid2: TRxDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExportarOrigenDestino: TfrmExportarOrigenDestino;

implementation

{$R *.dfm}

procedure TfrmExportarOrigenDestino.BitBtn10Click(Sender: TObject);
begin
  dmDatos.tblExportarOrigen.prior;
end;

procedure TfrmExportarOrigenDestino.BitBtn11Click(Sender: TObject);
begin
  dmDatos.tblExportarOrigen.next;
end;

procedure TfrmExportarOrigenDestino.BitBtn12Click(Sender: TObject);
begin
  dmDatos.tblExportarOrigen.Last;
end;

procedure TfrmExportarOrigenDestino.BitBtn9Click(Sender: TObject);
begin
  dmDatos.tblExportarOrigen.first;
end;

procedure TfrmExportarOrigenDestino.SpeedButton1Click(Sender: TObject);
begin
  if dmDatos.tblExportarOrigen.State in [dsinsert, dsEdit] then
  begin
    dmDatos.tblExportarOrigenid.Value:= FsqlMaxNumero('SEC_PROCESOS','ID');
    dmDatos.tblExportarOrigen.Post;
    dmDatos.tblExportarOrigen.ApplyUpdates;
    if not dmDatos.tblExportarOrigen.Transaction.InTransaction then
    dmDatos.tblExportarOrigen.Transaction.StartTransaction;
    try
      dmDatos.tblExportarOrigen.Transaction.CommitRetaining;
    except
    dmDatos.tblExportarOrigen.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmExportarOrigenDestino.SpeedButton2Click(Sender: TObject);
begin
  if dmDatos.tblExportarOrigen.State = dsBrowse then
  begin
    dmDatos.tblExportarOrigen.Insert;
    DBEdit2.SetFocus;
  end;
end;

procedure TfrmExportarOrigenDestino.SpeedButton3Click(Sender: TObject);
begin
  if dmDatos.tblExportarOrigen.State in [dsinsert, dsEdit] then
  begin
    dmDatos.tblExportarOrigen.Cancel;
  end;
end;

procedure TfrmExportarOrigenDestino.BitBtn1Click(Sender: TObject);
begin
  dmDatos.tblExportarDestino.first;
end;

procedure TfrmExportarOrigenDestino.BitBtn2Click(Sender: TObject);
begin
  dmDatos.tblExportarDestino.prior;
end;

procedure TfrmExportarOrigenDestino.BitBtn3Click(Sender: TObject);
begin
  dmDatos.tblExportarDestino.next;
end;

procedure TfrmExportarOrigenDestino.BitBtn4Click(Sender: TObject);
begin
  dmDatos.tblExportarDestino.Last;
end;

procedure TfrmExportarOrigenDestino.SpeedButton4Click(Sender: TObject);
begin
  if dmDatos.tblExportarDestino.State = dsBrowse then
  begin
    dmDatos.tblExportarDestino.Insert;
    DBEdit1.SetFocus;
  end;
end;

procedure TfrmExportarOrigenDestino.SpeedButton5Click(Sender: TObject);
begin
  if dmDatos.tblExportarDestino.State in [dsinsert, dsEdit] then
  begin
    dmDatos.tblExportarDestino.Cancel;
  end;
end;
procedure TfrmExportarOrigenDestino.SpeedButton6Click(Sender: TObject);
begin
  if dmDatos.tblExportarDestino.State in [dsinsert, dsEdit] then
  begin
    dmDatos.tblExportarDestinoid.Value:= FsqlMaxNumero('SEC_PROCESOS','ID');
    dmDatos.tblExportarDestino.Post;
    dmDatos.tblExportarDestino.ApplyUpdates;
    if not dmDatos.tblExportarDestino.Transaction.InTransaction then
    dmDatos.tblExportarDestino.Transaction.StartTransaction;
    try
      dmDatos.tblExportarDestino.Transaction.CommitRetaining;
    except
    dmDatos.tblExportarDestino.Transaction.RollbackRetaining;
    end;
  end;
end;


end.
