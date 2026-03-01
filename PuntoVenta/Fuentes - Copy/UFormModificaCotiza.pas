unit UFormModificaCotiza;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Mask, DBCtrls, Buttons, RXCtrls, RXDBCtrl,
  rxToolEdit;

type
  TfrmModificaCotiza = class(TForm)
    dstblCotizaMaster: TDataSource;
    SpeedButton1: TSpeedButton;
    DBStatusLabel1: TDBStatusLabel;
    DBDateEdit1: TDBDateEdit;
    Label3: TLabel;
    SpeedButton3: TSpeedButton;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmModificaCotiza: TfrmModificaCotiza;

implementation

uses UFormDatosCotiza, Uglobal;

{$R *.dfm}

procedure TfrmModificaCotiza.BitBtn10Click(Sender: TObject);
begin
  frmCotizaciones.tblCotizaMaster.prior;
end;

procedure TfrmModificaCotiza.BitBtn11Click(Sender: TObject);
begin
  frmCotizaciones.tblCotizaMaster.next;
end;

procedure TfrmModificaCotiza.BitBtn12Click(Sender: TObject);
begin
  frmCotizaciones.tblCotizaMaster.Last;
end;

procedure TfrmModificaCotiza.BitBtn9Click(Sender: TObject);
begin
  frmCotizaciones.tblCotizaMaster.first;
end;

procedure TfrmModificaCotiza.SpeedButton1Click(Sender: TObject);
begin
  if frmCotizaciones.tblCotizaMaster.State in [dsinsert, dsEdit] then
  begin
    //frmCotizaciones.tblCotizaMasterid.Value:= FsqlMaxNumero('SEC_PROCESOS','ID');
    frmCotizaciones.tblCotizaMasterFECHA_VENCE.Value:=
    frmCotizaciones.tblCotizaMasterFECHA.Value + 30;
    frmCotizaciones.tblCotizaMasterMOD_POR.Value := StrUserName;
    frmCotizaciones.tblCotizaMasterFECHA_MOD.Value:= Now;
    frmCotizaciones.tblCotizaMaster.Post;
    frmCotizaciones.tblCotizaMaster.ApplyUpdates;
    if not frmCotizaciones.tblCotizaMaster.Transaction.InTransaction then
    frmCotizaciones.tblCotizaMaster.Transaction.StartTransaction;
    try
      frmCotizaciones.tblCotizaMaster.Transaction.CommitRetaining;
    except
    frmCotizaciones.tblCotizaMaster.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmModificaCotiza.SpeedButton3Click(Sender: TObject);
begin
  close;
end;

end.
