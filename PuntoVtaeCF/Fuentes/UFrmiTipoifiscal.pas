unit UFrmiTipoifiscal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  db, Dialogs, Grids, DBGrids, RXDBCtrl, StdCtrls, RxLookup, Buttons,
  RXCtrls, WinSkinData;

type
  TfrmNCFTipoIfiscal = class(TForm)
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label2: TLabel;
    RxDBGrid1: TRxDBGrid;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton1: TSpeedButton;
    DBStatusLabel1: TDBStatusLabel;
    Label1: TLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    BitBtn1: TBitBtn;
    SkinData1: TSkinData;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNCFTipoIfiscal: TfrmNCFTipoIfiscal;

implementation

uses UDatmodDatosGenerales, UFormEstructuraNCFHelp;

{$R *.dfm}

procedure TfrmNCFTipoIfiscal.SpeedButton1Click(Sender: TObject);
begin
  if dmDatos.tblNcftipoIFiscal.State In [dsInsert, dsEdit] then
  begin
    dmDatos.tblNcftipoIFiscal.Post;
    dmDatos.tblNcftipoIFiscal.ApplyUpdates;
    if not dmDatos.tblNcftipoIFiscal.Transaction.InTransaction then
    dmDatos.tblNcftipoIFiscal.Transaction.StartTransaction;
    try
      dmDatos.tblNcftipoIFiscal.Transaction.CommitRetaining;
    except
    dmDatos.tblNcftipoIFiscal.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmNCFTipoIfiscal.SpeedButton2Click(Sender: TObject);
begin
  if dmDatos.tblNcftipoIFiscal.State = dsBrowse then
  begin
    dmDatos.tblNcftipoIFiscal.Insert;
    RxDBLookupCombo1.SetFocus;
  end;
end;

procedure TfrmNCFTipoIfiscal.SpeedButton3Click(Sender: TObject);
begin
  if dmDatos.tblNcftipoIFiscal.State In [dsInsert, dsEdit] then
  begin
    dmDatos.tblNcftipoIFiscal.Cancel;
  end;
end;

procedure TfrmNCFTipoIfiscal.SpeedButton7Click(Sender: TObject);
begin
  dmDatos.tblNcftipoIFiscal.Close;
  dmDatos.tblNcftipoIFiscal.Open;
end;

procedure TfrmNCFTipoIfiscal.SpeedButton8Click(Sender: TObject);
begin
  //if MessageDlg('Desea eliminar definitivamente este plan?', mtWarning,[mbyes,mbno],0)=mryes then
  //begin
  //end;
end;

procedure TfrmNCFTipoIfiscal.FormCreate(Sender: TObject);
begin
  dmDatos.tblTipoCF.Close;
  dmDatos.tblTipoCF.Open;
  dmDatos.tblTipoDocFiscal_L.Close;
  dmDatos.tblTipoDocFiscal_L.Open;
  dmDatos.tblNcftipoIFiscal.Close;
  dmDatos.tblNcftipoIFiscal.Open;
  dmDatos.tblTipoDocFiscal.Close;
  dmDatos.tblTipoDocFiscal.Open;
end;

procedure TfrmNCFTipoIfiscal.BitBtn1Click(Sender: TObject);
begin
  frmHelpNCF:=TfrmHelpNCF.Create(Nil);
  try
    frmHelpNCF.Showmodal;
  finally
  FreeAndNil(frmHelpNCF);
  end;
end;

end.
