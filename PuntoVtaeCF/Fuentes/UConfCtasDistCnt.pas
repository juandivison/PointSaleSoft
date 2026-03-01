unit UConfCtasDistCnt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RXCtrls, RXDBCtrl, RxLookup, DB, IBCustomDataSet,
  IBQuery, RxDBComb, ExtCtrls, DBCtrls, Mask, Buttons, WinSkinData, Grids,
  DBGrids;

type
  TfrmConfCtasDisCnt = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    DBStatusLabel2: TDBStatusLabel;
    ListBoxCampos: TListBox;
    qryCampos: TIBQuery;
    Label20: TLabel;
    RxDBLookupCombo2: TRxDBLookupCombo;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label21: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    BitBtn8: TBitBtn;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label28: TLabel;
    DBEdit4: TDBEdit;
    DBEdit7: TDBEdit;
    RxDBComboBox1: TRxDBComboBox;
    qrytablas: TIBQuery;
    SkinData1: TSkinData;
    RxDBGrid1: TRxDBGrid;
    RxDBLookupCombo3: TRxDBLookupCombo;
    dsqrytablas: TDataSource;
    BitBtn1: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    Shape1: TShape;
    DBStatusLabel3: TDBStatusLabel;
    DBStatusLabel4: TDBStatusLabel;
    dsqryCampos: TDataSource;
    DBEdit5: TDBEdit;
    RxDBComboBox2: TRxDBComboBox;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    BitBtn15: TBitBtn;
    BitBtn16: TBitBtn;
    BitBtn17: TBitBtn;
    BitBtn18: TBitBtn;
    DBEdit6: TDBEdit;
    Label3: TLabel;
    qrytablasTABLAS: TIBStringField;
    qryCamposCAMPO: TIBStringField;
    qryCamposRDBRELATION_NAME: TIBStringField;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure RxDBLookupCombo3Change(Sender: TObject);
    procedure RxDBLookupCombo3Exit(Sender: TObject);
    procedure DBRadioGroup1Change(Sender: TObject);
    procedure qryCamposAfterOpen(DataSet: TDataSet);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfCtasDisCnt: TfrmConfCtasDisCnt;

implementation

uses UDatModDistCNT,UViewCtaCatalogo,  UGlobal, UConfCtasFijasDistCnt,
  UConfCamposFijosCnt;

{$R *.dfm}

procedure TfrmConfCtasDisCnt.FormCreate(Sender: TObject);
begin
  dmDistCnt.tblGrpTipoPago.Close;
  dmDistCnt.tblGrpTipoPago.Open;
  qrytablas.Close;
  qrytablas.Open;
  dmDistCnt.tblDistCtaMaster.Close;
  dmDistCnt.tblDistCtaMaster.Open;
  dmDistCnt.tblDistCtaMaster.First;
  qrytablas.First;
  if not dmDistCnt.tblDistribucionCntNOMBRE_TABLA.isNull then
  dmDistcnt.lNombretabla :=dmDistCnt.tblDistribucionCntNOMBRE_TABLA.Value;
  //tblDistCntDet.close;
  //tblDistCntDet.open;
  //dmDistCnt.tblDistCntMaster.Close;
  //dmDistCnt.tblDistCntMaster.Open;
  //dmDistCnt.tblDistCntMaster.Next;
  //dmDistCnt.tblDistCntMaster.Prior;
  dmDistCnt.tblGrupoCnt.Close;
  dmDistCnt.tblGrupoCnt.Open;
  dmDistCnt.tblModuloCnt.Close;
  dmDistCnt.tblModuloCnt.Open;
  dmDistCnt.tblDistribucionCnt.Close;
  dmDistCnt.tblDistribucionCnt.Open;
  RxDBLookupCombo3Change(Self);
end;

procedure TfrmConfCtasDisCnt.BitBtn2Click(Sender: TObject);
begin
  if dmDistCnt.tblDistCtaMasterID.IsNull then
  begin
    MessageDlg('Primero debe registrar record master', mtError,[mbOk], 0);
    exit;
  end;
  if dmDistCnt.tblDistribucionCnt.State = dsBrowse then
  begin
    dmDistCnt.tblDistribucionCnt.Insert;
    dmDistCnt.tblDistribucionCntMODULO.Value := dmDistCnt.tblDistCtaMasterMODULO.Value;
    //dmDistCnt.tblDistribucionCntNOMBRE_CAMPO_CNTDET.Value := 'TRNCNT_DETALLE';
    dmDistCnt.tblDistribucionCntNOMBRE_TABLA_CNT.Value:='TRNCNT_DETALLE';
    dmDistCnt.tblDistribucionCntNOMBRE_TABLA.Value := dmDistCnt.tblDistCtaMasterNOMBRE_TABLA.Value;
    dmDistCnt.tblDistribucionCntIDTIPO_PAGO.Value  := dmDistCnt.tblDistCtaMasterIDTIPO_PAGO.Value;
    dmDistCnt.tblDistribucionCntSTATUS.Value       := 'A';
    dmDistCnt.tblDistribucionCntFECHA_INSER.Value  := Now;
    dmDistCnt.tblDistribucionCntINSERT_POR.Value   := StrUserName;
  end;
end;

procedure TfrmConfCtasDisCnt.BitBtn8Click(Sender: TObject);
begin
  frmViewCtaCatalogo:=TfrmViewCtaCatalogo.Create(Nil);
  try
    if frmViewCtaCatalogo.Showmodal = mrOk then
    begin
      if dmDistCnt.tblDistribucionCnt.state In [dsEdit, dsInsert] then
      begin
        if not frmViewCtaCatalogo.qryViewCtaCtalogoCUENTA1.IsNull then
        begin
          dmDistCnt.tblDistribucionCntCTA1.Value  := frmViewCtaCatalogo.qryViewCtaCtalogoCUENTA1.Value;
          dmDistCnt.tblDistribucionCntCTA2.Value  := frmViewCtaCatalogo.qryViewCtaCtalogoCUENTA2.Value;
          dmDistCnt.tblDistribucionCntCTA3.Value  := frmViewCtaCatalogo.qryViewCtaCtalogoCUENTA3.Value;
          dmDistCnt.tblDistribucionCntORIGEN.Value:= frmViewCtaCatalogo.qryViewCtaCtalogoSIGNO_CTA.Value; 
        end;
      end;
    end;
  finally
  frmViewCtaCatalogo.Free;
  frmViewCtaCatalogo:=Nil;
  end;
end;

procedure TfrmConfCtasDisCnt.BitBtn5Click(Sender: TObject);
begin
  if dmDistCnt.tblDistCtaMaster.State In [dsEdit, dsInsert] then
  begin
    MessageDlg('Favor guarde datos master primero',mtError,[mbok],0);
    Exit;
  end;
  if dmDistCnt.tblDistribucionCnt.State In [dsEdit, dsInsert] then
  begin
    dmDistCnt.tblDistribucionCntSERIE.Value:= FsqlMaxNumero('DISTRIBUCION_CNT','SERIE');
    dmDistCnt.tblDistribucionCnt.Post;
    dmDistCnt.tblDistribucionCnt.ApplyUpdates;
    if Not dmDistCnt.tblDistribucionCnt.Transaction.InTransaction then
    dmDistCnt.tblDistribucionCnt.Transaction.StartTransaction;
    try
      dmDistCnt.tblDistribucionCnt.Transaction.CommitRetaining;
    except
    dmDistCnt.tblDistribucionCnt.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmConfCtasDisCnt.BitBtn1Click(Sender: TObject);
begin
  if dmDistCnt.tblDistCtaMaster.State = dsBrowse then
  begin
    dmDistCnt.tblDistCtaMaster.Insert;
    dmDistCnt.tblDistCtaMasterFECHA_IN.Value:=NOW;
    dmDistCnt.tblDistCtaMasterUSER_IN.Value:= strusername;
    //dmDistCnt.tblDistCtaMasterSTATUS.Value:='A';
  end;
end;

procedure TfrmConfCtasDisCnt.BitBtn9Click(Sender: TObject);
begin
  if dmDistCnt.tblDistCtaMaster.State = dsBrowse then
  dmDistCnt.tblDistCtaMaster.Edit;
end;

procedure TfrmConfCtasDisCnt.BitBtn10Click(Sender: TObject);
begin
  if dmDistCnt.tblDistCtaMaster.State in [dsInsert, dsEdit] then
  dmDistCnt.tblDistCtaMaster.Cancel;
end;

procedure TfrmConfCtasDisCnt.BitBtn11Click(Sender: TObject);
begin          
  if dmDistCnt.tblDistCtaMaster.State in [dsEdit, dsInsert] then
  begin
    if dmDistCnt.tblDistCtaMasterNOMBRE_TABLA.IsNull or
    dmDistCnt.tblDistCtaMasterMODULO.IsNull or
    dmDistCnt.tblDistCtaMasterIDTIPO_PAGO.IsNull then
    begin
      MessageDlg('Favor completar datos requeridos.', mtError, [mbOk], 0);
      RxDBLookupCombo1.Color:=clyellow;
      RxDBLookupCombo2.Color:=clyellow;
      RxDBLookupCombo3.Color:=clyellow;                  
      Exit;      
    end;
    RxDBLookupCombo1.Color:=clWhite;
    RxDBLookupCombo2.Color:=clWhite;
    RxDBLookupCombo3.Color:=clWhite;
    if dmDistCnt.tblDistCtaMaster.State in [dsInsert] then
    dmDistCnt.tblDistCtaMasterID.Value := FsqlMaxNumero('DISTRIBUCION_CNT_MASTER ', 'ID');
    dmDistCnt.tblDistCtaMaster.SelectSQL.Text;
    dmDistCnt.tblDistCtaMaster.InsertSQL.Text;
    dmDistCnt.tblDistCtaMaster.ModifySQL.Text;    
    dmDistCnt.tblDistCtaMaster.Post;
    dmDistCnt.tblDistCtaMaster.ApplyUpdates;
    if not dmDistCnt.tblDistCtaMaster.Transaction.InTransaction then
    dmDistCnt.tblDistCtaMaster.Transaction.StartTransaction;
    try
      dmDistCnt.tblDistCtaMaster.Transaction.CommitRetaining;
    except
    dmDistCnt.tblDistCtaMaster.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmConfCtasDisCnt.BitBtn12Click(Sender: TObject);
begin
  dmDistCnt.tblDistCtaMaster.Close;
  dmDistCnt.tblDistCtaMaster.Open;
end;

procedure TfrmConfCtasDisCnt.BitBtn4Click(Sender: TObject);
begin
  if dmDistCnt.tblDistribucionCnt.State in [dsEdit, dsInsert] then
  dmDistCnt.tblDistribucionCnt.Cancel
  else
  if Messagedlg('Eliminar record?', mtInformation, [mbYes, mbNo], 0) = mryes then
  begin
    dmDistCnt.tblDistribucionCnt.Delete;
    dmDistCnt.tblDistribucionCnt.ApplyUpdates;
    if not dmDistCnt.tblDistribucionCnt.Transaction.InTransaction then
    dmDistCnt.tblDistribucionCnt.Transaction.StartTransaction;
    try
      dmDistCnt.tblDistribucionCnt.Transaction.CommitRetaining;
    except
    dmDistCnt.tblDistribucionCnt.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmConfCtasDisCnt.BitBtn3Click(Sender: TObject);
begin
  if dmDistCnt.tblDistribucionCnt.State in [dsBrowse] then
  dmDistCnt.tblDistribucionCnt.Edit;
end;

procedure TfrmConfCtasDisCnt.BitBtn6Click(Sender: TObject);
begin
  if dmDistCnt.tblDistribucionCnt.State In [dsBrowse, dsInactive] then
  begin
    dmDistCnt.tblDistribucionCnt.Close;
    dmDistCnt.tblDistribucionCnt.Open;
  end;
end;

procedure TfrmConfCtasDisCnt.RxDBLookupCombo3Change(Sender: TObject);
begin
  if dmDistCnt.tblDistCtaMasterNOMBRE_TABLA.isNull then exit;
  dmDistcnt.lNombretabla := '';
  qryCampos.Close;
  qryCampos.Params[0].Value := Trim(dmDistCnt.tblDistCtaMasterNOMBRE_TABLA.Value);
  qryCampos.Open;
  qryCampos.First;
  ListBoxCampos.Clear;
  While Not qryCampos.Eof do
  begin
    ListBoxCampos.Items.Add(Trim(qryCamposCAMPO.Value));
    qryCampos.Next;
  end;
end;

procedure TfrmConfCtasDisCnt.RxDBLookupCombo3Exit(Sender: TObject);
begin
  RxDBLookupCombo3Change(Self);
end;

procedure TfrmConfCtasDisCnt.DBRadioGroup1Change(Sender: TObject);
begin
  if dmDistCnt.tblDistribucionCnt.State in [dsBrowse, dsInactive] then Exit;
  if (DBRadioGroup1.ItemIndex = 0) then
  dmDistCnt.tblDistribucionCntNOMBRE_CAMPO_CNTDET.Value:='rxCredito'
  else
  dmDistCnt.tblDistribucionCntNOMBRE_CAMPO_CNTDET.Value:='rxDebito';
end;

procedure TfrmConfCtasDisCnt.qryCamposAfterOpen(DataSet: TDataSet);
begin
  qryCampos.First;
  RxDBComboBox2.Values.Clear;
  RxDBComboBox2.Items.Clear;
  While Not qryCampos.Eof do
  begin
    RxDBComboBox2.Items.Append(Trim(qryCamposCAMPO.Value));
    RxDBComboBox2.Values.Append(Trim(qryCamposCAMPO.Value));
    qryCampos.Next;
  end;
end;

procedure TfrmConfCtasDisCnt.BitBtn13Click(Sender: TObject);
begin
  dmDistCnt.tblDistCtaMaster.First;
end;

procedure TfrmConfCtasDisCnt.BitBtn14Click(Sender: TObject);
begin
  dmDistCnt.tblDistCtaMaster.prior;
end;

procedure TfrmConfCtasDisCnt.BitBtn15Click(Sender: TObject);
begin
  dmDistCnt.tblDistCtaMaster.Next;
end;

procedure TfrmConfCtasDisCnt.BitBtn16Click(Sender: TObject);
begin
  dmDistCnt.tblDistCtaMaster.Last;
end;

procedure TfrmConfCtasDisCnt.BitBtn17Click(Sender: TObject);
begin
  frmConfCtasFicasDisCnt:=TfrmConfCtasFicasDisCnt.Create(Nil);
  try
   dmDistCnt.tblDisCtaFijaMaster.Close;
   dmDistCnt.tblDisCtaFijaMaster.Params[0].Value := dmDistCnt.tblDistCtaMasterIDTIPO_PAGO.Value;
   dmDistCnt.tblDisCtaFijaMaster.Params[1].Value := dmDistCnt.tblDistCtaMasterMODULO.Value;
   dmDistCnt.tblDisCtaFijaMaster.Params[2].Value := Trim(dmDistCnt.tblDistCtaMasterNOMBRE_TABLA.Value);
   dmDistCnt.tblDisCtaFijaMaster.Open;
   frmConfCtasFicasDisCnt.Showmodal;
  finally
  frmConfCtasFicasDisCnt.Free;
  frmConfCtasFicasDisCnt:=Nil;
  end;
end;

procedure TfrmConfCtasDisCnt.BitBtn18Click(Sender: TObject);
begin
  frmCamposFijosCnt:=TfrmCamposFijosCnt.Create(Nil);
  try
    frmCamposFijosCnt.Showmodal;
  finally
  frmCamposFijosCnt.Free;
  frmCamposFijosCnt:=Nil;
  end;
end;

end.
