unit UFormCentroDeCostos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RXCtrls, RXDBCtrl, StdCtrls, Buttons, Grids, DBGrids, Mask,
  db, DBCtrls, WinSkinData;

type
  TfrmCentroDeCostos = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    DBStatusLabel2: TDBStatusLabel;
    DBGrid1: TDBGrid;
    DBEdit3: TDBEdit;
    BitBtn8: TBitBtn;
    DBEdit6: TDBEdit;
    BitBtn7: TBitBtn;
    Label9: TLabel;
    Label10: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    Label3: TLabel;
    DBText3: TDBText;
    DBEdit4: TDBEdit;
    BitBtn9: TBitBtn;
    SkinData1: TSkinData;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCentroDeCostos: TfrmCentroDeCostos;

implementation

uses UDatModRegOpeDiaria, uglobal, UViewCtaCatalogo, UDatModDistCNT;

{$R *.dfm}

procedure TfrmCentroDeCostos.BitBtn1Click(Sender: TObject);
begin
  if dtmTransOpeDiaria.tblCentroDeCostos.State in [dsBrowse] then
  begin
    dtmTransOpeDiaria.tblCentroDeCostos.Insert;
    dtmTransOpeDiaria.tblCentroDeCostosCODIGO.Value:= FsqlMaxNumero('centro_costo','codigo');
    if dtmTransOpeDiaria.tblCentroDeCostosCODIGO.isnull then
    dtmTransOpeDiaria.tblCentroDeCostosCODIGO.Value:= 1; 
    dbedit2.SetFocus;
  end;
end;

procedure TfrmCentroDeCostos.BitBtn2Click(Sender: TObject);
begin
  if dtmTransOpeDiaria.tblCentroDeCostos.State in [dsBrowse] then
  dtmTransOpeDiaria.tblCentroDeCostos.Edit;
end;

procedure TfrmCentroDeCostos.BitBtn3Click(Sender: TObject);
begin
  if dtmTransOpeDiaria.tblCentroDeCostos.State in [dsInsert, dsEdit] then
  dtmTransOpeDiaria.tblCentroDeCostos.Cancel;
end;

procedure TfrmCentroDeCostos.BitBtn4Click(Sender: TObject);
begin
  if dtmTransOpeDiaria.tblCentroDeCostos.State in [dsInsert, dsEdit] then
  begin
    dtmTransOpeDiaria.tblCentroDeCostos.Post;
    dtmTransOpeDiaria.tblCentroDeCostos.ApplyUpdates;
    try
      dtmTransOpeDiaria.tblCentroDeCostos.Transaction.CommitRetaining;
    except
        dtmTransOpeDiaria.tblCentroDeCostos.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmCentroDeCostos.BitBtn5Click(Sender: TObject);
begin
  if dtmTransOpeDiaria.tblCentroDeCostos.State in [dsBrowse, dsInactive] then
  begin
    dtmTransOpeDiaria.tblCentroDeCostos.Close;
    dtmTransOpeDiaria.tblCentroDeCostos.Open;
  end;
end;

procedure TfrmCentroDeCostos.FormCreate(Sender: TObject);
begin
  dtmTransOpeDiaria.tblCentroDeCostos.Close;
  dtmTransOpeDiaria.tblCentroDeCostos.Open;
end;

procedure TfrmCentroDeCostos.BitBtn8Click(Sender: TObject);
begin
  frmViewCtaCatalogo:=TfrmViewCtaCatalogo.Create(Nil);
  try
    if frmViewCtaCatalogo.Showmodal = mrOk then
    begin
      if dtmTransOpeDiaria.tblCentroDeCostos.state In [dsEdit, dsInsert] then
      begin
        if Not frmViewCtaCatalogo.qryViewCtaCtalogoCUENTA1.IsNull then
        begin
          dtmTransOpeDiaria.tblCentroDeCostosCUENTAXPAGAR.Value := frmViewCtaCatalogo.qryViewCtaCtalogoCUENTA1.Value 
          + frmViewCtaCatalogo.qryViewCtaCtalogoCUENTA2.Value
          + frmViewCtaCatalogo.qryViewCtaCtalogoCUENTA3.Value;
          //dmDistCnt.tblDistribucionCntORIGEN.Value:= frmViewCtaCatalogo.qryViewCtaCtalogoSIGNO_CTA.Value;
          //RxLabel1.Caption := frmViewCtaCatalogo.qryViewCtaCtalogoNOMBRE_CTA.Value;
        end;
      end;
    end;
  finally
  frmViewCtaCatalogo.Free;
  frmViewCtaCatalogo:=Nil;
  end;
end;

procedure TfrmCentroDeCostos.BitBtn7Click(Sender: TObject);
begin
  frmViewCtaCatalogo:=TfrmViewCtaCatalogo.Create(Nil);
  try
    if frmViewCtaCatalogo.Showmodal = mrOk then
    begin
      if dtmTransOpeDiaria.tblCentroDeCostos.state In [dsEdit, dsInsert] then
      begin
        if Not frmViewCtaCatalogo.qryViewCtaCtalogoCUENTA1.IsNull then
        begin
          dtmTransOpeDiaria.tblCentroDeCostosCUENTA_GASTO.Value := frmViewCtaCatalogo.qryViewCtaCtalogoCUENTA1.Value 
          + frmViewCtaCatalogo.qryViewCtaCtalogoCUENTA2.Value
          + frmViewCtaCatalogo.qryViewCtaCtalogoCUENTA3.Value;
          //dmDistCnt.tblDistribucionCntORIGEN.Value:= frmViewCtaCatalogo.qryViewCtaCtalogoSIGNO_CTA.Value;
          //RxLabel1.Caption := frmViewCtaCatalogo.qryViewCtaCtalogoNOMBRE_CTA.Value;
        end;
      end;
    end;
  finally
  frmViewCtaCatalogo.Free;
  frmViewCtaCatalogo:=Nil;
  end;
end;

procedure TfrmCentroDeCostos.BitBtn9Click(Sender: TObject);
begin
  frmViewCtaCatalogo:=TfrmViewCtaCatalogo.Create(Nil);
  try
    if frmViewCtaCatalogo.Showmodal = mrOk then
    begin
      if dtmTransOpeDiaria.tblCentroDeCostos.state In [dsEdit, dsInsert] then
      begin
        if Not frmViewCtaCatalogo.qryViewCtaCtalogoCUENTA1.IsNull then
        begin
          dtmTransOpeDiaria.tblCentroDeCostosCUENTAITBCXP.Value :=
            frmViewCtaCatalogo.qryViewCtaCtalogoCUENTA1.Value
          + frmViewCtaCatalogo.qryViewCtaCtalogoCUENTA2.Value
          + frmViewCtaCatalogo.qryViewCtaCtalogoCUENTA3.Value;
        end;
      end;
    end;
  finally
  frmViewCtaCatalogo.Free;
  frmViewCtaCatalogo:=Nil;
  end;
end;

end.
