unit UMembreteCia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RXCtrls, RXDBCtrl, StdCtrls, Buttons, WinSkinData, DB, Mask,
  DBCtrls;

type
  TfrmMembrete = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    dstblMembrete: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    SkinData1: TSkinData;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    DBStatusLabel1: TDBStatusLabel;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMembrete: TfrmMembrete;

implementation

uses UCompania, UGlobal;

{$R *.dfm}

procedure TfrmMembrete.FormCreate(Sender: TObject);
begin
  if frmCompania.tblMembrete.RecordCount = 0 then
  BitBtn1.Enabled:=True else
  BitBtn1.Enabled:=False;
end;

procedure TfrmMembrete.BitBtn2Click(Sender: TObject);
begin
  frmCompania.tblMembrete.Edit;
end;

procedure TfrmMembrete.BitBtn3Click(Sender: TObject);
begin
  frmCompania.tblMembrete.Cancel;
end;

procedure TfrmMembrete.BitBtn4Click(Sender: TObject);
begin
  GlbSalvarQuery(frmCompania.tblMembrete);
end;

procedure TfrmMembrete.BitBtn5Click(Sender: TObject);
begin
  frmCompania.tblMembrete.Close;
  frmCompania.tblMembrete.Open;
end;

procedure TfrmMembrete.BitBtn1Click(Sender: TObject);
begin
  if frmCompania.tblMembrete.State = dsBrowse then
  begin
    frmCompania.tblMembrete.Append;
    frmCompania.tblMembreteLINE_NO.Value:=1;
    frmCompania.tblMembreteCODIGO_CIA.Value:=frmCompania.tblMembrete.Params[0].Value;
  end;
end;

end.
