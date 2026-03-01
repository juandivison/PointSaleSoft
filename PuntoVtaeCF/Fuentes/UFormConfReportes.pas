unit UFormConfReportes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, RXDBCtrl, Mask, DBCtrls,
  Db, RXCtrls, ExtCtrls, WinSkinData, RxLookup;

type
  TfrmConfReportes = class(TForm)
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
    DBRadioGroup1: TDBRadioGroup;
    DBRadioGroup2: TDBRadioGroup;
    SkinData1: TSkinData;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    SpeedButton6: TSpeedButton;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    DBRadioGroup3: TDBRadioGroup;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBMemo1: TDBMemo;
    Label7: TLabel;
    Edit1: TEdit;
    RxDBLookupCombo3: TRxDBLookupCombo;
    BitBtn15: TBitBtn;
    DBMemo2: TDBMemo;
    Label8: TLabel;
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfReportes: TfrmConfReportes;

implementation

uses UDatModReportes, UGlobal, UConsultaInventario, UDatModInventario;

{$R *.dfm}

procedure TfrmConfReportes.BitBtn10Click(Sender: TObject);
begin
  dmReportes.tblConfReportes.prior;
end;

procedure TfrmConfReportes.BitBtn11Click(Sender: TObject);
begin
  dmReportes.tblConfReportes.next;
end;

procedure TfrmConfReportes.BitBtn12Click(Sender: TObject);
begin
  dmReportes.tblConfReportes.Last;
end;

procedure TfrmConfReportes.BitBtn9Click(Sender: TObject);
begin
  dmReportes.tblConfReportes.first;
end;

procedure TfrmConfReportes.SpeedButton1Click(Sender: TObject);
begin
  if dmReportes.tblConfReportes.State in [dsEdit] then
  begin
    dmReportes.tblConfReportesUPD_POR.Value := StrUserName;
    dmReportes.tblConfReportesFECHA_UPD.Value:= Now;
  end;
  if dmReportes.tblConfReportes.State in [dsInsert, dsEdit] then
  begin
    GlbSalvarQuery(dmReportes.tblConfReportes);
  end;
end;

procedure TfrmConfReportes.SpeedButton2Click(Sender: TObject);
begin
  if dmReportes.tblConfReportes.State = dsBrowse then
  begin
    dmReportes.tblConfReportes.Insert;
    dmReportes.tblConfReportesSTATUS.Value      := 'A';
    dmReportes.tblConfReportesFECHA_IN.Value    := Now;
    dmReportes.tblConfReportesIN_POR.Value      := StrUserName;
    dmReportes.tblConfReportesCOD_USUARIO.Value := VarUsuarioGlb;
    DBEdit2.SetFocus;
  end;
end;

procedure TfrmConfReportes.SpeedButton3Click(Sender: TObject);
begin
  if dmReportes.tblConfReportes.State in [dsinsert, dsEdit] then
  begin
    dmReportes.tblConfReportes.Cancel;
  end;
end;

procedure TfrmConfReportes.SpeedButton6Click(Sender: TObject);
begin
  if dmReportes.tblConfReportes.State In [dsBrowse, dsInactive] then
  begin
    dmReportes.tblConfReportes.Close;
    dmReportes.tblConfReportes.Open;
  end;
end;

procedure TfrmConfReportes.FormCreate(Sender: TObject);
begin
  dmInventario.qryInvLookup.Close; //tblInventarioProd
  dmInventario.qryInvLookup.Open;
  dmReportes.tblConfReportes.Close;
  dmReportes.tblConfReportes.Open;
end;

procedure TfrmConfReportes.BitBtn15Click(Sender: TObject);
begin
  frmConsultaInventario:=TfrmConsultaInventario.Create(Nil);
  try
    if frmConsultaInventario.Showmodal = mrOk then
    begin
      edit1.Text := frmConsultaInventario.ibquery1codigo.AsString;
      if dmReportes.tblConfReportes.State = dsBrowse then
      dmReportes.tblConfReportes.Edit;
      dmReportes.tblConfReportesCODIGO_PROD.Value:= frmConsultaInventario.ibquery1codigo.Value;
      Edit1.Text:=dmReportes.tblConfReportesCODIGO_PROD.AsString;
    end;
  finally
  frmConsultaInventario.Free;
  frmConsultaInventario:=Nil;
  end;
end;

procedure TfrmConfReportes.Edit1Change(Sender: TObject);
begin
  dmInventario.qryInvLookup.Locate('codigo',edit1.Text,[]);
end;

procedure TfrmConfReportes.Edit1Exit(Sender: TObject);
begin
  if (edit1.Text = '') then exit;
  if not dmInventario.qryInvLookup.Locate('codigo',edit1.Text,[]) then
  begin
    Raise Exception.Create('Codigo no existe');
    edit1.Text:='';
    edit1.SetFocus;
  end;
end;

end.
