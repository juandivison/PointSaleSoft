unit UCreditosFrmCoop;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  db, Grids, DBGrids, RXDBCtrl, StdCtrls, Mask, DBCtrls, Buttons,
  WinSkinData;

type
  TfrmCreditosCoop = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    RxDBGrid1: TRxDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    SkinData1: TSkinData;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCreditosCoop: TfrmCreditosCoop;

implementation

uses UDatmodDatosGenerales, uglobal;

{$R *.DFM}

procedure TfrmCreditosCoop.FormCreate(Sender: TObject);
begin
  dmDatos.qryFirmCredCoop.Close;
  dmDatos.qryFirmCredCoop.Filtered:=False;
  dmDatos.qryFirmCredCoop.Open;
end;

procedure TfrmCreditosCoop.BitBtn1Click(Sender: TObject);
begin
  if dmDatos.qryFirmCredCoop.State = dsBrowse then
  begin
    dmDatos.qryFirmCredCoop.Insert;
    dmDatos.qryFirmCredCoopCodigo.Value  :=FsqlMaxNumero('coop_apr_creditos','codigo');
    dmDatos.qryFirmCredCoopStatus.Value  :='A';
    dmDatos.qryFirmCredCoopFECHA_IN.Value:=Now;
    dmDatos.qryFirmCredCoopIN_POR.Value  :=StruserName;
    DBEdit2.SetFocus;
    //dmDatos.qryFirmCredCoopFECHA_MOD CAMPO_FECHA_HORA,
    //dmDatos.qryFirmCredCoopMOD_POR.Value:=
  end;
end;

procedure TfrmCreditosCoop.BitBtn2Click(Sender: TObject);
begin
  if dmDatos.qryFirmCredCoop.State = dsBrowse then
  begin
    dmDatos.qryFirmCredCoop.Edit;
    dmDatos.qryFirmCredCoopFECHA_MOD.Value:=now;
    dmDatos.qryFirmCredCoopMOD_POR.Value:=StrUserName;
    DBEdit2.SetFocus;
  end;
end;

procedure TfrmCreditosCoop.BitBtn3Click(Sender: TObject);
begin
  if dmDatos.qryFirmCredCoop.State in [dsEdit,dsInsert] then
  begin
    dmDatos.qryFirmCredCoop.Post;
    dmDatos.qryFirmCredCoop.ApplyUpdates;
    if Not dmDatos.qryFirmCredCoop.Transaction.InTransaction then
    dmDatos.qryFirmCredCoop.Transaction.StartTransaction;
    try
      dmDatos.qryFirmCredCoop.Transaction.CommitRetaining;           
    except
    dmDatos.qryFirmCredCoop.Transaction.RollbackRetaining;
    end;      
  end;
end;

procedure TfrmCreditosCoop.BitBtn5Click(Sender: TObject);
begin
  if dmDatos.qryFirmCredCoop.State in [dsInactive,dsBrowse] then
  begin
    dmDatos.qryFirmCredCoop.close;
    dmDatos.qryFirmCredCoop.open;
  end;
end;

procedure TfrmCreditosCoop.BitBtn4Click(Sender: TObject);
begin
  if dmDatos.qryFirmCredCoop.State in [dsEdit,dsInsert] then
  begin
    dmDatos.qryFirmCredCoop.Cancel;
  end else
  begin
    if dmDatos.qryFirmCredCoop.State = dsBrowse then
    begin
      dmDatos.qryFirmCredCoop.Edit;
      if dmDatos.qryFirmCredCoopStatus.Value = 'C' then
      dmDatos.qryFirmCredCoopStatus.Value:='A' else
      dmDatos.qryFirmCredCoopStatus.Value:='C';
      BitBtn3Click(Self);  
    end;
  end;
end;

end.
