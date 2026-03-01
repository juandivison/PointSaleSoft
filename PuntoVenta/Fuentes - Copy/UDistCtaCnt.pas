unit UDistCtaCnt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IBDatabaseInfo, IBExtract, DB, IBCustomDataSet,
  IBTable, IBQuery, RXCtrls, Buttons, Grids, DBGrids, RXDBCtrl, RxDBComb,
  Mask, DBCtrls, ExtCtrls, WinSkinData, IBSQL, RxLookup;

type
  TfrmDistCtaCnt = class(TForm)
    qrytablas: TIBQuery;
    qryCampos: TIBQuery;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    qrytablasTABLAS: TIBStringField;
    qryCamposCAMPO: TIBStringField;
    qryCamposRDBRELATION_NAME: TIBStringField;
    BitBtn1: TBitBtn;
    RxDBGrid1: TRxDBGrid;
    Label3: TLabel;
    ListBoxCampos: TListBox;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    Label5: TLabel;
    DBEdit2: TDBEdit;
    Label6: TLabel;
    DBEdit3: TDBEdit;
    Label7: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    Label8: TLabel;
    DBEdit4: TDBEdit;
    Label9: TLabel;
    DBEdit5: TDBEdit;
    Label10: TLabel;
    DBEdit6: TDBEdit;
    Label11: TLabel;
    DBEdit7: TDBEdit;
    DBStatusLabel1: TDBStatusLabel;
    SkinData1: TSkinData;
    qryBuscarCta: TIBSQL;
    Label12: TLabel;
    BitBtn8: TBitBtn;
    tblDistCntComp: TIBDataSet;
    tblDistCntCompSERIE: TIntegerField;
    tblDistCntCompNUMERO: TIntegerField;
    tblDistCntCompCTA1: TIBStringField;
    tblDistCntCompCTA2: TIBStringField;
    tblDistCntCompCTA3: TIBStringField;
    tblDistCntCompNOMBRE_CAMPO: TIBStringField;
    tblDistCntCompNOMBRE_TABLA: TIBStringField;
    tblDistCntCompSTATUS: TIBStringField;
    tblDistCntCompINSERT_POR: TIBStringField;
    tblDistCntCompFECHA_INSER: TDateTimeField;
    tblDistCntCompUPDATE_POR: TIBStringField;
    Label13: TLabel;
    DBEdit8: TDBEdit;
    DataSource1: TDataSource;
    Label14: TLabel;
    DBEdit9: TDBEdit;
    Label15: TLabel;
    DBEdit10: TDBEdit;
    Label16: TLabel;
    DBEdit11: TDBEdit;
    Label17: TLabel;
    DBEdit12: TDBEdit;
    Label18: TLabel;
    DBEdit13: TDBEdit;
    RxDBGrid2: TRxDBGrid;
    BitBtn9: TBitBtn;
    BitBtn12: TBitBtn;
    BitBtn13: TBitBtn;
    BitBtn10: TBitBtn;
    tblDistCntCompSIGNO: TIBStringField;
    Label19: TLabel;
    RxDBComboBox2: TRxDBComboBox;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label28: TLabel;
    RxDBComboBox1: TRxDBComboBox;
    RxDBLookupCombo2: TRxDBLookupCombo;
    Label20: TLabel;
    BitBtn11: TBitBtn;
    DBStatusLabel2: TDBStatusLabel;
    Label21: TLabel;
    DBEdit14: TDBEdit;
    Label22: TLabel;
    DBEdit15: TDBEdit;
    tblDistCntDet: TIBDataSet;
    dstblDistCntDet: TDataSource;
    tblDistCntDetSERIE: TIntegerField;
    tblDistCntDetNOMBRE_CAMPO: TIBStringField;
    tblDistCntDetNOMBRE_CAMPODET: TIBStringField;
    Label23: TLabel;
    DBEdit16: TDBEdit;
    Label24: TLabel;
    DBEdit17: TDBEdit;
    RxDBGrid3: TRxDBGrid;
    BitBtn14: TBitBtn;
    BitBtn15: TBitBtn;
    BitBtn18: TBitBtn;
    BitBtn19: TBitBtn;
    BitBtn16: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure tblDistribucionCntAfterScroll(DataSet: TDataSet);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDistCtaCnt: TfrmDistCtaCnt;

implementation

uses UGlobal, UViewCtaCatalogo, UDatModConectar, UDatModDistCNT;

{$R *.dfm}

procedure TfrmDistCtaCnt.FormCreate(Sender: TObject);
begin
  dmDistCnt.tblGrpTipoPago.Close;
  dmDistCnt.tblGrpTipoPago.Open;  
  qrytablas.Close;
  qrytablas.Open;
  qrytablas.First;
  ComboBox1.Clear;
  While Not qrytablas.Eof do
  begin
    ComboBox1.Items.Add(qrytablasTABLAS.Value);
    qrytablas.Next;
  end;
  ComboBox1.ItemIndex:=0;
  dmDistcnt.lNombretabla := trim(ComboBox1.Text);  
  tblDistCntDet.close;
  tblDistCntDet.open;
  dmDistCnt.tblDistCntMaster.Close;
  dmDistCnt.tblDistCntMaster.Open;
  dmDistCnt.tblDistCntMaster.Next;
  dmDistCnt.tblDistCntMaster.Prior;
  dmDistCnt.tblGrupoCnt.Close;
  dmDistCnt.tblGrupoCnt.Open;
  dmDistCnt.tblModuloCnt.Close;
  dmDistCnt.tblModuloCnt.Open;
  dmDistCnt.tblDistribucionCnt.Close;
  dmDistCnt.tblDistribucionCnt.Open;
end;

procedure TfrmDistCtaCnt.ComboBox1Change(Sender: TObject);
begin
  dmDistcnt.lNombretabla := ComboBox1.Text;
  qryCampos.Close;
  qryCampos.Params[0].Value := Trim(ComboBox1.Text);
  qryCampos.Open;
  qryCampos.First;
  ListBoxCampos.Clear;
  While Not qryCampos.Eof do
  begin
    ListBoxCampos.Items.Add(Trim(qryCamposCAMPO.Value));
    qryCampos.Next;
  end;
  BitBtn18Click(Self);
end;

procedure TfrmDistCtaCnt.BitBtn1Click(Sender: TObject);
var
  x : Integer;
begin
  if ListBoxCampos.Items.Count > 0 then
  begin
    for x:=1 to ListBoxCampos.Items.Count-1 do
    begin
      Label3.Caption := ListBoxCampos.Items.Strings[x];
      if ListBoxCampos.Selected[x] then
      begin
        Label3.Caption := Label3.Caption;
        if dmDistCnt.tblDistribucionCnt.State in [dsEdit, dsInsert] then
        begin
          dmDistCnt.tblDistribucionCntNOMBRE_CAMPO.Value:=ListBoxCampos.Items.Strings[x];
          dmDistCnt.tblDistribucionCntNOMBRE_TABLA.Value:= ComboBox1.Text;
        end;
        if tblDistCntComp.State in [dsEdit, dsInsert] then
        begin
          tblDistCntCompNOMBRE_CAMPO.Value:=ListBoxCampos.Items.Strings[x];
          tblDistCntCompNOMBRE_TABLA.Value:= ComboBox1.Text;
        end;
        //ListBoxCampos.Items.Delete(x);
      end;
    end;
  end else MessageDlg('Favor seleccionar campo',mtInformation, [mbOK], 0);
end;

procedure TfrmDistCtaCnt.BitBtn2Click(Sender: TObject);
begin
  if dmDistCnt.tblDistribucionCnt.State = dsBrowse then
  begin
    dmDistCnt.tblDistribucionCnt.Insert;
    dmDistCnt.tblDistribucionCntSTATUS.Value := 'A';
    RxDBLookupCombo1.SetFocus;
  end;
end;

procedure TfrmDistCtaCnt.BitBtn3Click(Sender: TObject);
begin
  if dmDistCnt.tblDistribucionCnt.State = dsBrowse then
  dmDistCnt.tblDistribucionCnt.Edit;
end;

procedure TfrmDistCtaCnt.BitBtn4Click(Sender: TObject);
begin
  if dmDistCnt.tblDistribucionCnt.State In [dsEdit, dsInsert] then
  dmDistCnt.tblDistribucionCnt.Cancel else
  begin
    if MessageDlg('Borrar record?', mtInformation, [mbYes, mbNo], 0)= mrYes then
    begin
      dmDistCnt.tblDistribucionCnt.Delete;
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
end;

procedure TfrmDistCtaCnt.BitBtn5Click(Sender: TObject);
begin
  if (dmDistCnt.tblDistCntMaster.State In [dsInsert, dsEdit] ) then
  begin
    dmDistCnt.tblDistCntMaster.Post;
    dmDistCnt.tblDistCntMaster.ApplyUpdates;
    if not dmDistCnt.tblDistCntMaster.Transaction.InTransaction then
    dmDistCnt.tblDistCntMaster.Transaction.StartTransaction;
    try
      dmDistCnt.tblDistCntMaster.Transaction.CommitRetaining;
    except
    dmDistCnt.tblDistCntMaster.Transaction.RollbackRetaining;
    end;
  end;

  if dmDistCnt.tblDistribucionCnt.State In [dsEdit, dsInsert] then
  begin
    if dmDistCnt.tblDistribucionCnt.State = dsInsert then
    begin
      dmDistCnt.tblDistribucionCntSERIE.Value := FsqlMaxNumero('DISTRIBUCION_CNT','serie');
      if (dmDistCnt.tblDistribucionCntSERIE.Value = 0) then dmDistCnt.tblDistribucionCntSERIE.Value := 1;
    end;
    dmDistCnt.tblDistribucionCntIDTIPO_PAGO.Value:= dmDistCnt.tblDistCntMasterID.Value;
    
    if dmDistCnt.tblDistribucionCntORIGEN.IsNull or dmDistCnt.tblDistribucionCntCTA1.IsNull or
    dmDistCnt.tblDistribucionCntCTA2.IsNull or dmDistCnt.tblDistribucionCntCTA3.IsNull or
    dmDistCnt.tblDistribucionCntNOMBRE_CAMPO.IsNull or
    dmDistCnt.tblDistribucionCntNOMBRE_TABLA.IsNull then
    begin
      MessageDlg('Favor completar todos los campos',mtInformation, [mbOK], 0);
      RxDBLookupCombo1.SetFocus;
    end;
    dmDistCnt.tblDistribucionCnt.Post;
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

procedure TfrmDistCtaCnt.BitBtn6Click(Sender: TObject);
begin
  if dmDistCnt.tblDistribucionCnt.State in [dsInactive, dsBrowse] then
  begin
    dmDistCnt.tblDistribucionCnt.Close;
    dmDistCnt.tblDistribucionCnt.Open;
  end;
end;

procedure TfrmDistCtaCnt.DBEdit3Exit(Sender: TObject);
begin
  qryBuscarCta.Close;
  qryBuscarCta.Params[0].Value:= dmDistCnt.tblDistribucionCntCTA1.Value;
  qryBuscarCta.Params[1].Value:= dmDistCnt.tblDistribucionCntCTA2.Value;
  qryBuscarCta.Params[2].Value:= dmDistCnt.tblDistribucionCntCTA3.Value;
  qryBuscarCta.ExecQuery;
  if (qryBuscarCta.RecordCount = 0) then
  begin
    ShowMessage('Cuenta no existe en catalogo, verifique');
    DBEdit1.SetFocus;
    DBEdit1.SelectAll;
  end else
  begin
    Label12.Caption:= qryBuscarCta.FieldByName('NOMBRE_CTA').AsString;
  end;
  if dmDistCnt.tblDistribucionCnt.State In [dsEdit, dsInsert] then
  dmDistCnt.tblDistribucionCntORIGEN.Value:= qryBuscarCta.FieldByName('SIGNO_CTA').AsInteger;
end;

procedure TfrmDistCtaCnt.BitBtn8Click(Sender: TObject);
begin
  frmViewCtaCatalogo:=TfrmViewCtaCatalogo.Create(Nil);
  try
    if frmViewCtaCatalogo.Showmodal = mrOk then
    begin
      if dmDistCnt.tblDistribucionCnt.state In [dsEdit, dsInsert] then
      begin
        if not frmViewCtaCatalogo.qryViewCtaCtalogoCUENTA1.IsNull then
        begin
          dmDistCnt.tblDistribucionCntCTA1.Value:= frmViewCtaCatalogo.qryViewCtaCtalogoCUENTA1.Value;
          dmDistCnt.tblDistribucionCntCTA2.Value:= frmViewCtaCatalogo.qryViewCtaCtalogoCUENTA2.Value;
          dmDistCnt.tblDistribucionCntCTA3.Value:= frmViewCtaCatalogo.qryViewCtaCtalogoCUENTA3.Value;
        end;
      end;
    end;
  finally
  frmViewCtaCatalogo.Free;
  frmViewCtaCatalogo:=Nil;
  end;
end;

procedure TfrmDistCtaCnt.BitBtn12Click(Sender: TObject);
begin
  if tblDistCntComp.State in [dsEdit, dsInsert] then
  begin
    if tblDistCntComp.State = dsInsert then
    begin
      {tpCodigoCliente.ExecProc;
      if not stpCodigoCliente.Params[0].IsNull then
      dmCliente.IBDataSetClienteCODIGO.Value:= stpCodigoCliente.Params[0].Value
      else dmCliente.IBDataSetClienteCODIGO.Value:= 1;
      if (dmCliente.IBDataSetClienteCODIGO.IsNull) or (dmCliente.IBDataSetClienteCODIGO.Value = 0) then
      dmCliente.IBDataSetClienteCODIGO.Value:=1;}
    end;
    tblDistCntComp.Post;
    tblDistCntComp.ApplyUpdates;
    if not tblDistCntComp.Transaction.InTransaction then
    tblDistCntComp.Transaction.StartTransaction;
    try
      tblDistCntComp.Transaction.CommitRetaining;
    except
    tblDistCntComp.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmDistCtaCnt.BitBtn13Click(Sender: TObject);
begin
  if tblDistCntDet.State In [dsInactive, dsBrowse] then
  begin
    tblDistCntDet.Close;
    tblDistCntDet.Open;
  end;
  
  if tblDistCntComp.State In [dsInactive, dsBrowse] then
  begin
    tblDistCntComp.Close;
    tblDistCntComp.Open;
  end;
end;
procedure TfrmDistCtaCnt.BitBtn9Click(Sender: TObject);
begin
  if tblDistCntComp.State = dsBrowse then
  begin
    tblDistCntComp.Insert;
    tblDistCntCompNUMERO.Value := dmDistCnt.tblDistribucionCntSERIE.Value;
    tblDistCntCompSERIE.Value  := FsqlMaxNumero('DISTRIB_CNT_COMPUESTA','SERIE');
    if tblDistCntCompSerie.IsNull Or (tblDistCntCompSerie.Value = 0) then
    tblDistCntCompSerie.Value  := 1;
    tblDistCntCompSTATUS.Value := 'A';
    tblDistCntCompFECHA_INSER.Value := Now;
    tblDistCntCompINSERT_POR.Value  := StrUserName;
    DBEdit12.SetFocus;
  end;
end;


procedure TfrmDistCtaCnt.tblDistribucionCntAfterScroll(DataSet: TDataSet);
begin
  if tblDistCntComp.State in [dsBrowse, dsInactive] then
  begin
    tblDistCntComp.Close;
    tblDistCntComp.Params[0].Value:= dmDistCnt.tblDistribucionCntSERIE.Value;
    tblDistCntComp.Open;
  end;
end;

procedure TfrmDistCtaCnt.BitBtn10Click(Sender: TObject);
begin
  if tblDistCntComp.State in [dsEdit, dsInsert] then
  begin
    tblDistCntComp.Cancel;
  end else if tblDistCntComp.State in [dsBrowse] then
  begin
    if tblDistCntComp.RecordCount > 0 then
    begin
      if MessageDlg('Eliminar record?',mtInformation, [mbyes, mbno], 0) = mryes then
      begin
        tblDistCntComp.Delete;
        tblDistCntComp.ApplyUpdates;
        if Not tblDistCntComp.Transaction.InTransaction then
        tblDistCntComp.Transaction.StartTransaction;
        try
          tblDistCntComp.Transaction.CommitRetaining;
        except
        tblDistCntComp.Transaction.RollbackRetaining;
        end;
      end;
    end;
  end;
end;

procedure TfrmDistCtaCnt.BitBtn11Click(Sender: TObject);
begin
  if (dmDistCnt.tblDistCntMaster.State = dsBrowse) then
  begin
    dmDistCnt.tblDistCntMaster.Insert;
    dmDistCnt.tblDistCntMasterFECHA_IN.Value:= Now;
    dmDistCnt.tblDistCntMasterUSER_IN.Value := StrUserName;
  end;
end;

procedure TfrmDistCtaCnt.BitBtn14Click(Sender: TObject);
begin
  tblDistCntDet.Insert;
end;

procedure TfrmDistCtaCnt.BitBtn15Click(Sender: TObject);
begin
  if (tblDistCntDet.State In [dsInsert, dsEdit] ) then
  begin
    if (tblDistCntDet.State In [dsInsert] ) then
    tblDistCntDetSERIE.Value:=FsqlMaxNumero('DISTRIBUCION_CNT_DET','SERIE');
    if (tblDistCntDetSERIE.IsNull) or (tblDistCntDetSERIE.Value = 0) then
    tblDistCntDetSERIE.Value:=1;
    tblDistCntDet.Post;
    tblDistCntDet.ApplyUpdates;
    if not tblDistCntDet.Transaction.InTransaction then
    tblDistCntDet.Transaction.StartTransaction;
    try
      tblDistCntDet.Transaction.CommitRetaining;
    except
    tblDistCntDet.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmDistCtaCnt.BitBtn18Click(Sender: TObject);
begin
  dmDistCnt.tblDistCntMaster.Prior;
end;

procedure TfrmDistCtaCnt.BitBtn19Click(Sender: TObject);
begin
  dmDistCnt.tblDistCntMaster.Next;
end;

procedure TfrmDistCtaCnt.BitBtn16Click(Sender: TObject);
begin
  {frmConfCtasFicasDisCnt:=TfrmConfCtasFicasDisCnt.Create(Nil);
  try
    frmConfCtasFicasDisCnt.Showmodal;
  finally
  frmConfCtasFicasDisCnt.Free;
  frmConfCtasFicasDisCnt:=Nil;
  end;}
end;

end.

