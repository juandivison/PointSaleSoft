unit UFormAgencias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WinSkinData, StdCtrls, Buttons, Grids, DBGrids, RxDBCtrl, Mask,
  DB, DBCtrls, RxCtrls;

type
  TfrmAgencias = class(TForm)
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
  frmAgencias: TfrmAgencias;

implementation
   uses uglobal, UDatmodDatosGenerales;
{$R *.dfm}

procedure TfrmAgencias.BitBtn10Click(Sender: TObject);
begin
  dmdatos.tblAgencia.prior;
end;

procedure TfrmAgencias.BitBtn11Click(Sender: TObject);
begin
  dmdatos.tblAgencia.next;
end;

procedure TfrmAgencias.BitBtn12Click(Sender: TObject);
begin
  dmdatos.tblAgencia.Last;
end;

procedure TfrmAgencias.BitBtn9Click(Sender: TObject);
begin
  dmdatos.tblAgencia.first;
end;

procedure TfrmAgencias.SpeedButton1Click(Sender: TObject);
begin
  if dmdatos.tblAgencia.State in [dsinsert, dsEdit] then
  begin
    if dmdatos.tblAgencia.State in [dsinsert] then
    dmdatos.tblAgenciaCODIGO_AGENCIA.Value:= FsqlMaxNumero('Agencia','COdigo_Agencia');
    dmdatos.tblAgencia.Post;
    dmdatos.tblAgencia.ApplyUpdates;
    if not dmdatos.tblAgencia.Transaction.InTransaction then
    dmdatos.tblAgencia.Transaction.StartTransaction;
    try
      dmdatos.tblAgencia.Transaction.CommitRetaining;
    except
    dmdatos.tblAgencia.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmAgencias.SpeedButton2Click(Sender: TObject);
begin   
  if dmdatos.tblAgencia.State = dsBrowse then
  begin
    dmdatos.tblAgencia.Insert;
    DBEdit2.SetFocus;
  end;
end;

procedure TfrmAgencias.SpeedButton3Click(Sender: TObject);
begin
  if dmdatos.tblAgencia.State in [dsinsert, dsEdit] then
  begin
    dmdatos.tblAgencia.Cancel;
  end;
end;

procedure TfrmAgencias.FormCreate(Sender: TObject);
begin
  dmdatos.tblAgencia.Close;
  dmdatos.tblAgencia.Open;
end;

end.
