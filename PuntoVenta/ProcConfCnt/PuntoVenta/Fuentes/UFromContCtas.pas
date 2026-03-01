unit UFromContCtas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IBDatabaseInfo, IBExtract, DB, IBCustomDataSet,
  IBTable, IBQuery, RXCtrls, Buttons, Grids, DBGrids, RXDBCtrl, RxDBComb,
  Mask, DBCtrls, ExtCtrls, WinSkinData, IBSQL, RxLookup;

type
  TfrmDistCtaCntNuevo = class(TForm)
    qrytablas: TIBQuery;
    qryCampos: TIBQuery;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    qrytablasTABLAS: TIBStringField;
    qryCamposCAMPO: TIBStringField;
    qryCamposRDBRELATION_NAME: TIBStringField;
    BitBtn1: TBitBtn;
    tblDistribucionCnt: TIBTable;
    tblDistribucionCntSERIE: TIntegerField;
    tblDistribucionCntMODULO: TIntegerField;
    tblDistribucionCntORIGEN: TIntegerField;
    tblDistribucionCntCTA1: TIBStringField;
    tblDistribucionCntCTA2: TIBStringField;
    tblDistribucionCntCTA3: TIBStringField;
    tblDistribucionCntDESCRIPCION: TIBStringField;
    tblDistribucionCntNOMBRE_CAMPO: TIBStringField;
    tblDistribucionCntNOMBRE_TABLA: TIBStringField;
    tblDistribucionCntSTATUS: TIBStringField;
    RxDBGrid1: TRxDBGrid;
    dstblDistribucionCnt: TDataSource;
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
    ListBoxCamposII: TListBox;
    ComboBox2: TComboBox;
    Label20: TLabel;
    Label21: TLabel;
    tblDistCntCampKey: TIBDataSet;
    tblDistCntCampKeySERIE: TIntegerField;
    tblDistCntCampKeyNUMERO: TIntegerField;
    tblDistCntCampKeyNOMBRE_CAMPO: TIBStringField;
    tblDistCntCampKeyNOMBRE_TABLA: TIBStringField;
    tblDistCntCampKeySTATUS: TIBStringField;
    tblDistCntCampKeyINSERT_POR: TIBStringField;
    tblDistCntCampKeyFECHA_INSER: TDateTimeField;
    tblDistCntCampKeyUPDATE_POR: TIBStringField;
    Label22: TLabel;
    DBEdit14: TDBEdit;
    dstblDistCntCampKey: TDataSource;
    Label23: TLabel;
    DBEdit15: TDBEdit;
    Label24: TLabel;
    RxDBGrid3: TRxDBGrid;
    Label25: TLabel;
    BitBtn11: TBitBtn;
    BitBtn14: TBitBtn;
    BitBtn15: TBitBtn;
    BitBtn16: TBitBtn;
    chBoxCampo_2: TCheckBox;
    DBStatusLabel2: TDBStatusLabel;
    Label26: TLabel;
    tblDistCntCampKeyCAMPO_CLAVE: TIBStringField;
    BitBtn17: TBitBtn;
    BitBtn18: TBitBtn;
    DBEdit16: TDBEdit;
    Label27: TLabel;
    tblDistribucionCntCNT: TSmallintField;
    Label28: TLabel;
    RxDBComboBox1: TRxDBComboBox;
    DBStatusLabel3: TDBStatusLabel;
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
    procedure ComboBox2Change(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure DBEdit10Exit(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDistCtaCntNuevo: TfrmDistCtaCntNuevo;

implementation

uses UGlobal, UViewCtaCatalogo, UDatModConectar, UDatModDistCNT;

{$R *.dfm}

procedure TfrmDistCtaCntNuevo.FormCreate(Sender: TObject);
begin
  dmDistCnt.tblModuloCnt.Close;
  dmDistCnt.tblModuloCnt.Open;
  tblDistribucionCnt.Close;
  tblDistribucionCnt.Open;
  qrytablas.Close;
  qrytablas.Open;
  qrytablas.First;
  ComboBox1.Clear;
  ComboBox2.Clear;
  While Not qrytablas.Eof do
  begin
    ComboBox1.Items.Add(qrytablasTABLAS.Value);
    ComboBox2.Items.Add(qrytablasTABLAS.Value);    
    qrytablas.Next;
  end;
  ComboBox1.ItemIndex:=0;
end;

procedure TfrmDistCtaCntNuevo.ComboBox1Change(Sender: TObject);
begin
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
end;

procedure TfrmDistCtaCntNuevo.BitBtn1Click(Sender: TObject);
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
        if tblDistribucionCnt.State in [dsEdit, dsInsert] then
        begin
          tblDistribucionCntNOMBRE_CAMPO.Value:=ListBoxCampos.Items.Strings[x];
          tblDistribucionCntNOMBRE_TABLA.Value:= Trim(ComboBox1.Text);
        end;
        if tblDistCntComp.State in [dsEdit, dsInsert] then
        begin
          tblDistCntCompNOMBRE_CAMPO.Value:=ListBoxCampos.Items.Strings[x];
          tblDistCntCompNOMBRE_TABLA.Value:= Trim(ComboBox1.Text);
        end;
        //ListBoxCampos.Items.Delete(x);
      end;
    end;
  end else MessageDlg('Favor seleccionar campo',mtInformation, [mbOK], 0);
end;

procedure TfrmDistCtaCntNuevo.BitBtn2Click(Sender: TObject);
begin
  if tblDistribucionCnt.State = dsBrowse then
  begin
    tblDistribucionCnt.Insert;
    tblDistribucionCntSTATUS.Value := 'A';
    RxDBLookupCombo1.SetFocus;
  end;
end;

procedure TfrmDistCtaCntNuevo.BitBtn3Click(Sender: TObject);
begin
  if tblDistribucionCnt.State = dsBrowse then
  tblDistribucionCnt.Edit;
end;

procedure TfrmDistCtaCntNuevo.BitBtn4Click(Sender: TObject);
begin
  if tblDistribucionCnt.State In [dsEdit, dsInsert] then
  tblDistribucionCnt.Cancel else
  begin
    if MessageDlg('Borrar record?', mtInformation, [mbYes, mbNo], 0)= mrYes then
    begin
      tblDistribucionCnt.Delete;
      tblDistribucionCnt.ApplyUpdates;
      if Not tblDistribucionCnt.Transaction.InTransaction then
      tblDistribucionCnt.Transaction.StartTransaction;
      try
        tblDistribucionCnt.Transaction.CommitRetaining;
      except
      tblDistribucionCnt.Transaction.RollbackRetaining;
      end;
    end;
  end;
end;

procedure TfrmDistCtaCntNuevo.BitBtn5Click(Sender: TObject);
begin
  if tblDistribucionCnt.State in [dsEdit, dsInsert] then
  begin
    if tblDistribucionCnt.State = dsInsert then
    begin
      tblDistribucionCntSERIE.Value := FsqlMaxNumero('DISTRIBUCION_CNT','serie');
      if (tblDistribucionCntSERIE.Value = 0) then tblDistribucionCntSERIE.Value := 1; 
    end;
    if tblDistribucionCntORIGEN.IsNull or tblDistribucionCntCTA1.IsNull or
    tblDistribucionCntCTA2.IsNull or tblDistribucionCntCTA3.IsNull or
    tblDistribucionCntNOMBRE_CAMPO.IsNull or
    tblDistribucionCntNOMBRE_TABLA.IsNull then
    begin
      MessageDlg('Favor completar todos los campos',mtInformation, [mbOK], 0);
      RxDBLookupCombo1.SetFocus;
    end;
    tblDistribucionCnt.Post;
    tblDistribucionCnt.ApplyUpdates;
    if not tblDistribucionCnt.Transaction.InTransaction then
    tblDistribucionCnt.Transaction.StartTransaction;
    try
      tblDistribucionCnt.Transaction.CommitRetaining;
    except
    tblDistribucionCnt.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmDistCtaCntNuevo.BitBtn6Click(Sender: TObject);
begin
  if tblDistribucionCnt.State in [dsInactive, dsBrowse] then
  begin
    tblDistribucionCnt.Close;
    tblDistribucionCnt.Open;
  end;
end;

procedure TfrmDistCtaCntNuevo.DBEdit3Exit(Sender: TObject);
begin
  qryBuscarCta.Close;
  qryBuscarCta.Params[0].Value:= tblDistribucionCntCTA1.Value;
  qryBuscarCta.Params[1].Value:= tblDistribucionCntCTA2.Value;
  qryBuscarCta.Params[2].Value:= tblDistribucionCntCTA3.Value;
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
  if tblDistribucionCnt.State In [dsEdit, dsInsert] then
  tblDistribucionCntORIGEN.Value:= qryBuscarCta.FieldByName('SIGNO_CTA').AsInteger;
end;

procedure TfrmDistCtaCntNuevo.BitBtn8Click(Sender: TObject);
begin
  frmViewCtaCatalogo:=TfrmViewCtaCatalogo.Create(Nil);
  try
    if frmViewCtaCatalogo.Showmodal = mrOk then
    begin
      if tblDistribucionCnt.state In [dsEdit, dsInsert] then
      begin
        if not frmViewCtaCatalogo.qryViewCtaCtalogoCUENTA1.IsNull then
        begin
          tblDistribucionCntCTA1.Value:= frmViewCtaCatalogo.qryViewCtaCtalogoCUENTA1.Value;
          tblDistribucionCntCTA2.Value:= frmViewCtaCatalogo.qryViewCtaCtalogoCUENTA2.Value;
          tblDistribucionCntCTA3.Value:= frmViewCtaCatalogo.qryViewCtaCtalogoCUENTA3.Value;
        end;
      end;
    end;
  finally
  frmViewCtaCatalogo.Free;
  frmViewCtaCatalogo:=Nil;
  end;
end;

procedure TfrmDistCtaCntNuevo.BitBtn12Click(Sender: TObject);
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

procedure TfrmDistCtaCntNuevo.BitBtn13Click(Sender: TObject);
begin
  if tblDistCntComp.State in [dsInactive, dsBrowse] then
  begin
    tblDistCntComp.Close;
    tblDistCntComp.Open;
  end;
end;
procedure TfrmDistCtaCntNuevo.BitBtn9Click(Sender: TObject);
begin
  if tblDistCntComp.State = dsBrowse then
  begin
    tblDistCntComp.Insert;
    tblDistCntCompNUMERO.Value := tblDistribucionCntSERIE.Value;
    tblDistCntCompSERIE.Value  := FsqlMaxNumero('DISTRIB_CNT_COMPUESTA','SERIE');
    if tblDistCntCompSerie.IsNull Or (tblDistCntCompSerie.Value = 0) then
    tblDistCntCompSerie.Value  := 1;
    tblDistCntCompSTATUS.Value := 'A';
    tblDistCntCompFECHA_INSER.Value := Now;
    tblDistCntCompINSERT_POR.Value  := StrUserName;
    DBEdit12.SetFocus;
  end;
end;


procedure TfrmDistCtaCntNuevo.tblDistribucionCntAfterScroll(DataSet: TDataSet);
begin
  if tblDistCntComp.State in [dsBrowse, dsInactive] then
  begin
    tblDistCntComp.Close;
    tblDistCntComp.Params[0].Value:= tblDistribucionCntSERIE.Value;
    tblDistCntComp.Open;
  end;
end;

procedure TfrmDistCtaCntNuevo.BitBtn10Click(Sender: TObject);
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

procedure TfrmDistCtaCntNuevo.ComboBox2Change(Sender: TObject);
begin
  qryCampos.Close;
  qryCampos.Params[0].Value := Trim(ComboBox2.Text);
  qryCampos.Open;
  qryCampos.First;
  ListBoxCamposII.Clear;
  While Not qryCampos.Eof do
  begin
    ListBoxCamposII.Items.Add(Trim(qryCamposCAMPO.Value));
    qryCampos.Next;
  end;
  BitBtn15Click(self);
end;

procedure TfrmDistCtaCntNuevo.BitBtn15Click(Sender: TObject);
begin
  tblDistCntCampKey.Close;
  tblDistCntCampKey.Params[0].Value := Trim(ComboBox2.Text);    
  tblDistCntCampKey.Open;
end;

procedure TfrmDistCtaCntNuevo.BitBtn11Click(Sender: TObject);
begin
  if tblDistCntCampKey.state = dsbrowse then
  begin
    tblDistCntCampKey.Insert;
    tblDistCntCampKeyNUMERO.Value := tblDistribucionCntSERIE.Value;
    tblDistCntCampKeyINSERT_POR.Value := strUserName;
    tblDistCntCampKeyFECHA_INSER.Value:= Now;
    tblDistCntCampKeySTATUS.Value := 'A';
  end;
end;

procedure TfrmDistCtaCntNuevo.BitBtn16Click(Sender: TObject);
begin
  if tblDistCntCampKey.State in [dsEdit, dsInsert] then
  begin
    tblDistCntCampKey.Cancel;
  end else if tblDistCntCampKey.State in [dsBrowse] then
  begin
    if tblDistCntCampKey.RecordCount > 0 then
    begin
      if MessageDlg('Eliminar record?', mtInformation, [mbyes, mbno], 0) = mrYes then
      begin
        tblDistCntCampKey.Delete;
        tblDistCntCampKey.ApplyUpdates;
        if Not tblDistCntCampKey.Transaction.InTransaction then
        tblDistCntCampKey.Transaction.StartTransaction;
        try
          tblDistCntCampKey.Transaction.CommitRetaining;
        except
        tblDistCntCampKey.Transaction.RollbackRetaining;
        end;
      end;
    end;
  end;
end;

procedure TfrmDistCtaCntNuevo.BitBtn14Click(Sender: TObject);
begin
  if tblDistCntCampKey.State in [dsInsert, dsEdit] then
  begin
    tblDistCntCampKeySERIE.Value:=FsqlMaxNumero('DISTRIB_CNT_CCLAVE','SERIE');
    tblDistCntCampKey.Post;
    tblDistCntCampKey.ApplyUpdates;
    if not tblDistCntCampKey.Transaction.InTransaction then
    tblDistCntCampKey.Transaction.StartTransaction;
    try
      tblDistCntCampKey.Transaction.CommitRetaining;
    except
    tblDistCntCampKey.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmDistCtaCntNuevo.DBEdit10Exit(Sender: TObject);
begin
  qryBuscarCta.Close;
  qryBuscarCta.Params[0].Value:= tblDistCntCompCTA1.Value;
  qryBuscarCta.Params[1].Value:= tblDistCntCompCTA2.Value;
  qryBuscarCta.Params[2].Value:= tblDistCntCompCTA3.Value;
  qryBuscarCta.ExecQuery;
  if (qryBuscarCta.RecordCount = 0) then
  begin
    ShowMessage('Cuenta no existe en catalogo, verifique');
    Label26.Visible:=False;
    DBEdit8.SetFocus;
    DBEdit8.SelectAll;
  end else
  begin
    Label26.Visible:=True;
    Label26.Caption:= qryBuscarCta.FieldByName('NOMBRE_CTA').AsString;
  end;
end;

procedure TfrmDistCtaCntNuevo.BitBtn17Click(Sender: TObject);
var
  x: integer;
begin
  if chBoxCampo_2.Checked then
  begin
    if ListBoxCamposII.Items.Count > 0 then
    begin
      for x:=1 to ListBoxCamposII.Items.Count-1 do
      begin
        Label3.Caption := ListBoxCamposII.Items.Strings[x];
        if ListBoxCamposII.Selected[x] then
        begin
          Label3.Caption := Label3.Caption;
          if tblDistCntCampKey.State in [dsEdit, dsInsert] then
          begin
            tblDistCntCampKeyCAMPO_CLAVE.Value:=ListBoxCamposII.Items.Strings[x];
            tblDistCntCampKeyNOMBRE_TABLA.Value:= trim(ComboBox2.Text);
            //tblDistribucionCntNOMBRE_CAMPO.Value:=ListBoxCamposII.Items.Strings[x];
            //tblDistribucionCntNOMBRE_TABLA.Value:= ComboBox2.Text;
          end;
          if tblDistCntCampKey.State in [dsEdit, dsInsert] then
          begin
            tblDistCntCampKeyCAMPO_CLAVE.Value:=ListBoxCamposII.Items.Strings[x];
            tblDistCntCampKeyNOMBRE_TABLA.Value:= trim(ComboBox2.Text);
            //tblDistCntCompNOMBRE_CAMPO.Value:=ListBoxCamposII.Items.Strings[x];
            //tblDistCntCompNOMBRE_TABLA.Value:= ComboBox2.Text;
          end;
          //ListBoxCampos.Items.Delete(x);
        end;
      end;
    end else MessageDlg('Favor seleccionar campo', mtInformation, [mbOK], 0);
   
  end;
end;

procedure TfrmDistCtaCntNuevo.BitBtn18Click(Sender: TObject);
var
  x: integer;
begin
  if chBoxCampo_2.Checked then
  begin
    if ListBoxCamposII.Items.Count > 0 then
    begin
      for x:=1 to ListBoxCamposII.Items.Count-1 do
      begin
        Label3.Caption := ListBoxCamposII.Items.Strings[x];
        if ListBoxCamposII.Selected[x] then
        begin
          Label3.Caption := Label3.Caption;
          if tblDistCntCampKey.State in [dsEdit, dsInsert] then
          begin
            tblDistCntCampKeyNOMBRE_CAMPO.Value:=ListBoxCamposII.Items.Strings[x];
            tblDistCntCampKeyNOMBRE_TABLA.Value:= trim(ComboBox2.Text);
            //tblDistribucionCntNOMBRE_CAMPO.Value:=ListBoxCamposII.Items.Strings[x];
            //tblDistribucionCntNOMBRE_TABLA.Value:= ComboBox2.Text;
          end;
          if tblDistCntCampKey.State in [dsEdit, dsInsert] then
          begin
            tblDistCntCampKeyNOMBRE_CAMPO.Value:=ListBoxCamposII.Items.Strings[x];
            tblDistCntCampKeyNOMBRE_TABLA.Value:= trim(ComboBox2.Text);
            //tblDistCntCompNOMBRE_CAMPO.Value:=ListBoxCamposII.Items.Strings[x];
            //tblDistCntCompNOMBRE_TABLA.Value:= ComboBox2.Text;
          end;
          //ListBoxCampos.Items.Delete(x);
        end;
      end;
    end else MessageDlg('Favor seleccionar campo', mtInformation, [mbOK], 0);
  end;
end;

end.

