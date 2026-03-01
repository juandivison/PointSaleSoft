unit UFormTipoPlan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  DB, Dialogs, StdCtrls, Buttons, Grids, DBGrids, RXDBCtrl, Mask, DBCtrls,
  RXCtrls, WinSkinData;

type
  TfrmTipoPlan = class(TForm)
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
  frmTipoPlan: TfrmTipoPlan;

implementation

uses UDatmodDatosGenerales, UGlobal;

{$R *.dfm}

procedure TfrmTipoPlan.BitBtn10Click(Sender: TObject);
begin
  dmDatos.tblTipoPlan.prior;
end;

procedure TfrmTipoPlan.BitBtn11Click(Sender: TObject);
begin
  dmDatos.tblTipoPlan.next;
end;

procedure TfrmTipoPlan.BitBtn12Click(Sender: TObject);
begin
  dmDatos.tblTipoPlan.Last;
end;

procedure TfrmTipoPlan.BitBtn9Click(Sender: TObject);
begin
  dmDatos.tblTipoPlan.first;
end;

procedure TfrmTipoPlan.SpeedButton1Click(Sender: TObject);
begin
  if dmDatos.tblTipoPlan.State in [dsinsert, dsEdit] then
  begin
    if dmDatos.tblTipoPlan.State in [dsinsert] then 
    dmDatos.tblTipoPlanTIPO.Value:= FsqlMaxNumero('TIPO_PLAN','TIPO');
    dmDatos.tblTipoPlan.Post;
    dmDatos.tblTipoPlan.ApplyUpdates;
    if not dmDatos.tblTipoPlan.Transaction.InTransaction then
    dmDatos.tblTipoPlan.Transaction.StartTransaction;
    try
      dmDatos.tblTipoPlan.Transaction.CommitRetaining;
    except
    dmDatos.tblTipoPlan.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmTipoPlan.SpeedButton2Click(Sender: TObject);
begin
  if dmDatos.tblTipoPlan.State = dsBrowse then
  begin
    dmDatos.tblTipoPlan.Insert;
    DBEdit2.SetFocus;
  end;
end;

procedure TfrmTipoPlan.SpeedButton3Click(Sender: TObject);
begin
  if dmDatos.tblTipoPlan.State in [dsinsert, dsEdit] then
  begin
    dmDatos.tblTipoPlan.Cancel;
  end;
end;

procedure TfrmTipoPlan.FormCreate(Sender: TObject);
begin
  dmDatos.tblTipoPlan.Close;
  dmDatos.tblTipoPlan.Open;  
end;

end.
