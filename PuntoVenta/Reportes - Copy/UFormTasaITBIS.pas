unit UFormTasaITBIS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, rxToolEdit, RXDBCtrl, StdCtrls, Mask, DBCtrls, DB, Buttons, Grids,
  DBGrids, RXCtrls, WinSkinData;

type
  TfrmTasaITBIS = class(TForm)
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton1: TSpeedButton;
    DBStatusLabel1: TDBStatusLabel;
    RxDBGrid1: TRxDBGrid;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    dstblTasaITBIS: TDataSource;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DBDateEdit1: TDBDateEdit;
    DBDateEdit5: TDBDateEdit;
    Label3: TLabel;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    SkinData1: TSkinData;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit4: TDBEdit;
    BitBtn2: TBitBtn;
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTasaITBIS: TfrmTasaITBIS;

implementation

uses UDatModInventario, Uglobal, UFormInfoTasaITBIS;

{$R *.dfm}

procedure TfrmTasaITBIS.BitBtn10Click(Sender: TObject);
begin
  dmInventario.tblTasaITBIS.prior;
end;

procedure TfrmTasaITBIS.BitBtn11Click(Sender: TObject);
begin
  dmInventario.tblTasaITBIS.next;
end;

procedure TfrmTasaITBIS.BitBtn12Click(Sender: TObject);
begin
  dmInventario.tblTasaITBIS.Last;
end;

procedure TfrmTasaITBIS.BitBtn9Click(Sender: TObject);
begin
  dmInventario.tblTasaITBIS.first;
end;

procedure TfrmTasaITBIS.SpeedButton1Click(Sender: TObject);
begin
  if dmInventario.tblTasaITBIS.State in [dsinsert, dsEdit] then
  begin
    if dmInventario.tblTasaITBIS.State In [dsinsert] then
    dmInventario.tblTasaITBISIDTASAITBIS.Value:= FsqlMaxNumero('tasa_itbis','IDtasaitbis')
    else
      if dmInventario.tblTasaITBIS.State in [dsEdit] then
      begin
        dmInventario.tblTasaITBISUSER_MOD.Value:=VarUsuarioGlb;
        dmInventario.tblTasaITBISMOD_POR.Value:= strUserName;
        dmInventario.tblTasaITBISFECHA_UPDATE.Value:=now;
      end;

    GlbSalvarQuery(dmInventario.tblTasaITBIS);
  end;
end;

procedure TfrmTasaITBIS.SpeedButton2Click(Sender: TObject);
begin
  if dmInventario.tblTasaITBIS.State = dsBrowse then
  begin
    dmInventario.tblTasaITBIS.Insert;
    dmInventario.tblTasaITBISFECHAINI.Value:= ExtraerFecha(Now);
    dmInventario.tblTasaITBISFECHAFIN.Value:= ExtraerFecha(Now+365);
    dmInventario.tblTasaITBISSTATUS.Value  := 'A';
    dmInventario.tblTasaITBISUSER_IN.Value:=VarUsuarioGlb;
    dmInventario.tblTasaITBISIN_POR.Value:=strUserName;
    dmInventario.tblTasaITBISFECHA_IN.Value:=Now;
    DBEdit2.SetFocus;
  end;
end;

procedure TfrmTasaITBIS.SpeedButton3Click(Sender: TObject);
begin
  if dmInventario.tblTasaITBIS.State In [dsInsert, dsEdit] then
  begin
    dmInventario.tblTasaITBIS.Cancel;
  end else
  if MessageDlg('Desea elimianr record?', mtInformation,[mbyes,mbno],0) = mryes then
  begin
    dmInventario.tblTasaITBIS.Delete;
    GlbSalvarQuery(dmInventario.tblTasaITBIS);
  end;
end;

procedure TfrmTasaITBIS.BitBtn1Click(Sender: TObject);
begin
  dmInventario.tblTasaITBIS.Close;
  dmInventario.tblTasaITBIS.Open;
end;

procedure TfrmTasaITBIS.FormCreate(Sender: TObject);
begin
  dmInventario.tblTasaITBIS.Close;
  dmInventario.tblTasaITBIS.Open;
end;

procedure TfrmTasaITBIS.BitBtn2Click(Sender: TObject);
begin
  frmInfoTasaItbis:=TfrmInfoTasaItbis.Create(nil);
  try
    frmInfoTasaItbis.showmodal;
  finally
  frmInfoTasaItbis.free;
  frmInfoTasaItbis:=nil;
  end;
end;

end.
