unit UCompania;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBTable, StdCtrls, Mask, DBCtrls, dbnavE,
  Grids, DBGrids, jpeg, ExtCtrls, RxGIF, Buttons,RXDBCtrl,
  WinSkinData, RxToolEdit;

type
  TfrmCompania = class(TForm)
    tblCompania: TIBTable;
    tblCompaniaCODIGO: TSmallintField;
    tblCompaniaNOMBRE: TIBStringField;
    tblCompaniaCALLEYNUMERO: TIBStringField;
    tblCompaniaTELEFONO: TIBStringField;
    tblCompaniaFAX: TIBStringField;
    tblCompaniaEMAIL: TIBStringField;
    tblCompaniaWEBSITE: TIBStringField;
    tblCompaniaCIUDAD: TIBStringField;
    tblCompaniaPAIS: TIBStringField;
    tblCompaniaRNC_NUMERO: TIBStringField;
    tblCompaniaDIRECTORIO: TIBStringField;
    tblCompaniaFECHAI_ACT: TDateTimeField;
    tblCompaniaFECHAF_ACT: TDateTimeField;
    tblCompaniaCTA1_GYP_PERIODO: TIBStringField;
    tblCompaniaCTA2_GYP_PERIODO: TIBStringField;
    tblCompaniaCTA3_GYP_PERIODO: TIBStringField;
    tblCompaniaCTA1_SUPERAVIT_ACM: TIBStringField;
    tblCompaniaCTA2_SUPERAVIT_ACM: TIBStringField;
    tblCompaniaCTA3_SUPERAVIT_ACM: TIBStringField;
    tblCompaniaCTA1_RESUMEN_GYP: TIBStringField;
    tblCompaniaCTA2_RESUMEN_GYP: TIBStringField;
    tblCompaniaCTA3_RESUMEN_GYP: TIBStringField;
    tblCompaniaOBSERVACION: TIBStringField;
    tblCompaniaSTATUS: TIBStringField;
    tblCompaniaNUM_PATENTE: TIBStringField;
    tblCompaniaCTA1_ULT_RETENIDA: TIBStringField;
    tblCompaniaCTA2_ULT_RETENIDA: TIBStringField;
    tblCompaniaCTA3_ULT_RETENIDA: TIBStringField;
    tblCompaniaCTA1_GYP_MES: TIBStringField;
    tblCompaniaCTA2_GYP_MES: TIBStringField;
    tblCompaniaCTA3_GYP_MES: TIBStringField;
    tblCompaniaFECHA_IN: TDateTimeField;
    tblCompaniaIN_POR: TIBStringField;
    tblCompaniaFECHA_MOD: TDateTimeField;
    tblCompaniaMOD_POR: TIBStringField;
    DataSource1: TDataSource;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    DBGrid1: TDBGrid;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Image1: TImage;
    DBEdit9: TDBEdit;
    Label9: TLabel;
    Panel3: TPanel;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    Label11: TLabel;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    Label12: TLabel;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    Label13: TLabel;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    Label14: TLabel;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    DBEdit24: TDBEdit;
    Label15: TLabel;
    DBEdit25: TDBEdit;
    Label16: TLabel;
    DBEdit26: TDBEdit;
    DBDateEdit1: TDBDateEdit;
    DBDateEdit2: TDBDateEdit;
    SkinData1: TSkinData;
    BitBtn8: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCompania: TfrmCompania;

implementation

uses UDatModConectar, uglobal, UViewCtaCatalogo;

{$R *.dfm}

procedure TfrmCompania.FormCreate(Sender: TObject);
var
  xGrafico : String;
begin
  xGrafico:=FileToUse('Grafico','Logo.jpg');
  if (xGrafico <> '') then
  Image1.Picture.LoadFromFile(xGrafico);
  tblcompania.Close;
  tblcompania.Open;
end;

procedure TfrmCompania.BitBtn1Click(Sender: TObject);
begin
  if tblCompania.State = dsBrowse then
  begin
    tblCompania.Insert;
{    tblCompaniaCODIGO.Value := FsqlMaxNumero('Servicio','Codigo');
    if tblCompaniaCODIGO.IsNull Or (tblCompaniaCODIGO.Value = 0) then
    tblCompaniaCODIGO.Value := 0;}    
    tblCompaniaSTATUS.Value := 'A';
    DBEdit2.SetFocus;
  end;
end;

procedure TfrmCompania.BitBtn2Click(Sender: TObject);
begin
  if tblCompania.State = dsBrowse then
  tblCompania.Edit;
end;

procedure TfrmCompania.BitBtn3Click(Sender: TObject);
begin
  if tblCompania.State in [dsEdit, dsInsert] then
  tblCompania.cancel;
end;

procedure TfrmCompania.BitBtn4Click(Sender: TObject);
begin
  if tblCompania.State in [dsEdit, dsInsert] then
  begin
    if tblCompania.State = dsInsert then
    begin
      tblCompaniaCODIGO.Value:=FsqlMaxNumero('Compania','codigo');
      if (tblCompaniaCODIGO.IsNull or (tblCompaniaCODIGO.Value = 0)) then
      tblCompaniaCODIGO.Value:=1;
    end;
    tblCompania.Post;
    tblCompania.ApplyUpdates;
    if not tblCompania.Transaction.InTransaction then
    tblCompania.Transaction.StartTransaction;
    try
      tblCompania.Transaction.CommitRetaining;
    except
    tblCompania.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmCompania.BitBtn5Click(Sender: TObject);
begin
  if tblCompania.State in [dsInactive, dsBrowse] then
  begin
    tblCompania.Close;
    tblCompania.Open;
  end;
end;

procedure TfrmCompania.BitBtn8Click(Sender: TObject);
begin
  frmViewCtaCatalogo:=TfrmViewCtaCatalogo.Create(Nil);
  try
    if frmViewCtaCatalogo.Showmodal = mrOk then
    begin
      //if dmTransCnt.tblTransCntDet.state In [dsEdit, dsInsert] then
      //begin
        if not frmViewCtaCatalogo.qryViewCtaCtalogoCUENTA1.IsNull then
        begin
          //dmTransCnt.tblTransCntDetCUENTA1.Value:= frmViewCtaCatalogo.qryViewCtaCtalogoCUENTA1.Value;
          //dmTransCnt.tblTransCntDetCUENTA2.Value:= frmViewCtaCatalogo.qryViewCtaCtalogoCUENTA2.Value;
          //dmTransCnt.tblTransCntDetCUENTA3.Value:= frmViewCtaCatalogo.qryViewCtaCtalogoCUENTA3.Value;
        end;
      //end;
    end;
  finally
  frmViewCtaCatalogo.Free;
  frmViewCtaCatalogo:=Nil;
  end;
end;

end.
