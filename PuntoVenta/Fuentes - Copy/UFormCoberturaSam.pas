unit UFormCoberturaSam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WinSkinData, StdCtrls, Buttons, Grids, DBGrids, RxDBCtrl, Mask,
  DB, DBCtrls, RxCtrls, RxToolEdit, RxLookup, ComCtrls, ExtCtrls;

type
  TfrmCobertura = class(TForm)
    SkinData1: TSkinData;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    DBDateEdit1: TDBDateEdit;
    DBDateEdit4: TDBDateEdit;
    Label3: TLabel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton1: TSpeedButton;
    DBStatusLabel1: TDBStatusLabel;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    RxDBGrid1: TRxDBGrid;
    RxDBGrid2: TRxDBGrid;
    DBStatusLabel2: TDBStatusLabel;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    Label5: TLabel;
    DBEdit2: TDBEdit;
    Label6: TLabel;
    DBEdit3: TDBEdit;
    Label7: TLabel;
    DBEdit4: TDBEdit;
    Shape1: TShape;
    SpeedButton4: TSpeedButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    Label8: TLabel;
    DBEdit5: TDBEdit;
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCobertura: TfrmCobertura;

implementation

uses UDatModCobertura, UGlobal, UFormTipoAfiliacion;

{$R *.dfm}

procedure TfrmCobertura.BitBtn10Click(Sender: TObject);
begin
  dmCobertura.tblCobertura.prior;
end;

procedure TfrmCobertura.BitBtn11Click(Sender: TObject);
begin
  dmCobertura.tblCobertura.next;
end;

procedure TfrmCobertura.BitBtn12Click(Sender: TObject);
begin
  dmCobertura.tblCobertura.Last;
end;

procedure TfrmCobertura.BitBtn9Click(Sender: TObject);
begin
  dmCobertura.tblCobertura.first;
end;

procedure TfrmCobertura.SpeedButton1Click(Sender: TObject);
begin
  if dmCobertura.tblCobertura.State in [dsinsert, dsEdit] then
  begin
  
    GlbSalvarQuery(dmCobertura.tblCobertura);
  end;
end;

procedure TfrmCobertura.SpeedButton2Click(Sender: TObject);
begin
  if dmCobertura.tblCobertura.State = dsBrowse then
  begin
    dmCobertura.tblCobertura.Insert;
    DBEdit2.SetFocus;
  end;
end;

procedure TfrmCobertura.SpeedButton3Click(Sender: TObject);
begin
  if dmCobertura.tblCobertura.State in [dsinsert, dsEdit] then
  begin
    dmCobertura.tblCobertura.Cancel;
  end;
end;

procedure TfrmCobertura.SpeedButton4Click(Sender: TObject);
begin
  frmTipoAfiliacion:=TfrmTipoAfiliacion.Create(Nil);
  try
    frmTipoAfiliacion.Showmodal;
  finally
  frmTipoAfiliacion.Free;
  frmTipoAfiliacion:=Nil;
  end;  
end;

procedure TfrmCobertura.BitBtn1Click(Sender: TObject);
begin
  if dmCobertura.tblCoberturaDet.State = dsBrowse then
  begin
    dmCobertura.tblCoberturaDet.Append;
  end;
end;

procedure TfrmCobertura.BitBtn4Click(Sender: TObject);
begin
  if dmCobertura.tblCobertura.State in [dsinsert, dsEdit] then
  begin
    GlbSalvarQuery(dmCobertura.tblCobertura);
  end;
  if dmCobertura.tblCoberturaDet.State in [dsInsert, dsEdit] then
  begin
    if dmCobertura.tblCoberturaDetIDCOBERTURA.IsNull or
    (dmCobertura.tblCoberturaDetIDCOBERTURA.Value = 0) then
    dmCobertura.tblCoberturaDetIDCOBERTURA.Value:=dmCobertura.tblCoberturaIDCOBERTURA.Value;
    GlbSalvarQuery(dmCobertura.tblCoberturaDet);
  end;
end;

procedure TfrmCobertura.BitBtn3Click(Sender: TObject);
begin
  if dmCobertura.tblCoberturaDet.State in [dsInsert, dsEdit] then
  begin
    dmCobertura.tblCoberturaDet.Cancel;
  end;
end;

procedure TfrmCobertura.BitBtn5Click(Sender: TObject);
begin
  if dmCobertura.tblCoberturaDet.State in [dsBrowse, dsInactive] then
  begin
    dmCobertura.tblCoberturaDet.Close;
    dmCobertura.tblCoberturaDet.Open;
  end;
end;

procedure TfrmCobertura.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if dmCobertura.tblCoberturaDet.State in [dsInsert, dsEdit] then
  begin
    MessageDlg('Hay una transaccion pendiente, verifique.',mtWarning,[mbok],0);
    CanClose:=False;
  end;
end;

procedure TfrmCobertura.BitBtn2Click(Sender: TObject);
begin
  if dmCobertura.tblCoberturaDet.State = dsBrowse then
  begin
    dmCobertura.tblCoberturaDet.Edit;
  end;
end;

procedure TfrmCobertura.FormCreate(Sender: TObject);
begin
  dmCobertura.tblTipoAfiliadoLookup.Close;
  dmCobertura.tblTipoAfiliadoLookup.Open;
  dmCobertura.tblCobertura.Close;
  dmCobertura.tblCobertura.Open;
end;

end.
