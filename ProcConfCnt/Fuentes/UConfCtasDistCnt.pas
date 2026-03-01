unit UConfCtasDistCnt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RXCtrls, RXDBCtrl, RxLookup, DB, IBCustomDataSet,
  IBQuery, RxDBComb, ExtCtrls, DBCtrls, Mask, Buttons, WinSkinData, Grids,
  DBGrids, ComCtrls, EditNew;

type
  TfrmConfCtasDisCnt = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    DBStatusLabel2: TDBStatusLabel;
    Label20: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label21: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label28: TLabel;
    Shape1: TShape;
    DBStatusLabel3: TDBStatusLabel;
    DBStatusLabel4: TDBStatusLabel;
    Label3: TLabel;
    ListBoxCampos: TListBox;
    RxDBLookupCombo2: TRxDBLookupCombo;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    BitBtn8: TBitBtn;
    RxDBLookupCombo1: TRxDBLookupCombo;
    DBEdit4: TDBEdit;
    DBEdit7: TDBEdit;
    RxDBComboBox1: TRxDBComboBox;
    RxDBGrid1: TRxDBGrid;
    RxDBLookupCombo3: TRxDBLookupCombo;
    BitBtn1: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    DBEdit5: TDBEdit;
    RxDBComboBox2: TRxDBComboBox;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    BitBtn15: TBitBtn;
    BitBtn16: TBitBtn;
    BitBtn17: TBitBtn;
    BitBtn18: TBitBtn;
    DBEdit6: TDBEdit;
    qryCampos: TIBQuery;
    qryCamposCAMPO: TIBStringField;
    qryCamposRDBRELATION_NAME: TIBStringField;
    qrytablas: TIBQuery;
    qrytablasTABLAS: TIBStringField;
    SkinData1: TSkinData;
    dsqrytablas: TDataSource;
    dsqryCampos: TDataSource;
    RxDBGrid2: TRxDBGrid;
    RxLabel1: TRxLabel;
    DBText1: TDBText;
    BitBtn19: TBitBtn;
    BitBtn20: TBitBtn;
    TabSheet3: TTabSheet;
    RxDBGrid3: TRxDBGrid;
    BitBtn21: TBitBtn;
    dsqryViewCtaCtalogo: TDataSource;
    qryViewCtaCtalogo: TIBQuery;
    qryViewCtaCtalogoBALANCE_ACT: TFloatField;
    qryViewCtaCtalogoBALANCE_ANT: TFloatField;
    qryViewCtaCtalogoCLASIFICACION_CTA: TIntegerField;
    qryViewCtaCtalogoCREDITO_ACM: TFloatField;
    qryViewCtaCtalogoCREDITO_ACT: TFloatField;
    qryViewCtaCtalogoCTA_CONS1: TIBStringField;
    qryViewCtaCtalogoCTA_CONS2: TIBStringField;
    qryViewCtaCtalogoCTA_CONS3: TIBStringField;
    qryViewCtaCtalogoCTA_CTRL1: TIBStringField;
    qryViewCtaCtalogoCTA_CTRL2: TIBStringField;
    qryViewCtaCtalogoCTA_CTRL3: TIBStringField;
    qryViewCtaCtalogoCTACIE1: TIBStringField;
    qryViewCtaCtalogoCTACIE2: TIBStringField;
    qryViewCtaCtalogoCTACIE3: TIBStringField;
    qryViewCtaCtalogoCUENTA1: TIBStringField;
    qryViewCtaCtalogoCUENTA2: TIBStringField;
    qryViewCtaCtalogoCUENTA3: TIBStringField;
    qryViewCtaCtalogoDEBITO_ACM: TFloatField;
    qryViewCtaCtalogoDEBITO_ACT: TFloatField;
    qryViewCtaCtalogoFECHA_ACT: TDateTimeField;
    qryViewCtaCtalogoFECHA_APE: TDateTimeField;
    qryViewCtaCtalogoFECHA_ULT_TR: TDateTimeField;
    qryViewCtaCtalogoNIVEL_CTA: TSmallintField;
    qryViewCtaCtalogoSIGNO_CTA: TSmallintField;
    qryViewCtaCtalogoSTATUS: TIBStringField;
    qryViewCtaCtalogoTIPO: TIBStringField;
    qryViewCtaCtalogoTIPO_CTA: TIBStringField;
    qryViewCtaCtalogoNOMBRE_CTA: TIBStringField;
    RxDBGrid4: TRxDBGrid;
    RadioGroup2: TRadioGroup;
    RadioGroup1: TRadioGroup;
    Label10: TLabel;
    EditN1: TEditN;
    CheckBox1: TCheckBox;
    Button1: TButton;
    RxLabel2: TRxLabel;
    qryViewCtaCatalogoFilterLike: TIBQuery;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    IntegerField1: TIntegerField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    IBStringField1: TIBStringField;
    IBStringField2: TIBStringField;
    IBStringField3: TIBStringField;
    IBStringField4: TIBStringField;
    IBStringField5: TIBStringField;
    IBStringField6: TIBStringField;
    IBStringField7: TIBStringField;
    IBStringField8: TIBStringField;
    IBStringField9: TIBStringField;
    IBStringField10: TIBStringField;
    IBStringField11: TIBStringField;
    IBStringField12: TIBStringField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    DateTimeField1: TDateTimeField;
    DateTimeField2: TDateTimeField;
    DateTimeField3: TDateTimeField;
    SmallintField1: TSmallintField;
    IBStringField13: TIBStringField;
    SmallintField2: TSmallintField;
    IBStringField14: TIBStringField;
    IBStringField15: TIBStringField;
    IBStringField16: TIBStringField;
    IBQuery1: TIBQuery;
    BitBtn22: TBitBtn;
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
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
    procedure RxDBGrid1Enter(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
    procedure BitBtn20Click(Sender: TObject);
    procedure BitBtn21Click(Sender: TObject);
    procedure TabSheet1Enter(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure qryViewCtaCtalogoFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure RxDBGrid4CellClick(Column: TColumn);
    procedure BitBtn22Click(Sender: TObject);
  private
    procedure LlenarComboBox;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfCtasDisCnt: TfrmConfCtasDisCnt;

implementation

uses UDatModDistCNT,UViewCtaCatalogo,  UGlobal, UConfCtasFijasDistCnt,
  UConfCamposFijosCnt, UAyudaCuentasT, UCatalogo,
  UFormDistribucionEstatusCNT, UContabilizarVentas;

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
  qryViewCtaCtalogo.Close;
  //qryViewCtaCtalogo
  qryViewCtaCtalogo.Open;  
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
          RxLabel1.Caption := frmViewCtaCatalogo.qryViewCtaCtalogoNOMBRE_CTA.Value;
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
  Refresh;
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
  LlenarComboBox;  
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
  LlenarComboBox;
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

procedure TfrmConfCtasDisCnt.LlenarComboBox;
begin
  qryCampos.Close;
  qryCampos.Params[0].Value := Trim(dmDistCnt.tblDistCtaMasterNOMBRE_TABLA.Value);
  qryCampos.Open;
  qryCampos.First;
  RxDBComboBox2.Values.Clear;
  RxDBComboBox2.Items.Clear;
  While Not qryCampos.Eof Do
  begin
    RxDBComboBox2.Items.Append(Trim(qryCamposCAMPO.Value));
    RxDBComboBox2.Values.Append(Trim(qryCamposCAMPO.Value));
    qryCampos.Next;
  end;
end;

procedure TfrmConfCtasDisCnt.BitBtn13Click(Sender: TObject);
begin
  dmDistCnt.tblDistCtaMaster.First;
  LlenarComboBox;
end;

procedure TfrmConfCtasDisCnt.BitBtn14Click(Sender: TObject);
begin
  dmDistCnt.tblDistCtaMaster.Prior;
  LlenarComboBox;
end;

procedure TfrmConfCtasDisCnt.BitBtn15Click(Sender: TObject);
begin
  dmDistCnt.tblDistCtaMaster.Next;
  LlenarComboBox;
end;

procedure TfrmConfCtasDisCnt.BitBtn16Click(Sender: TObject);
begin
  dmDistCnt.tblDistCtaMaster.Last;
  LlenarComboBox;
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

procedure TfrmConfCtasDisCnt.RxDBGrid1Enter(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmConfCtasDisCnt.BitBtn19Click(Sender: TObject);
begin
  frmAyudaCuentasT:=TfrmAyudaCuentasT.Create(Nil);
  try
    frmAyudaCuentasT.ShowModal;
  finally
  frmAyudaCuentasT.Free;
  frmAyudaCuentasT:=Nil;
  end;
end;

procedure TfrmConfCtasDisCnt.BitBtn20Click(Sender: TObject);
begin
  frmCatalogo:=TfrmCatalogo.Create(Nil);
  try
    frmCatalogo.Showmodal;
  Finally
  frmCatalogo.Free;
  frmCatalogo:=Nil;
  end;
end;

procedure TfrmConfCtasDisCnt.BitBtn21Click(Sender: TObject);
begin
  frmConfEstatusCnt:=TfrmConfEstatusCnt.Create(nil);
  try
    frmConfEstatusCnt.Showmodal;
  finally
  frmConfEstatusCnt.free;
  frmConfEstatusCnt:=nil;
  end;
end;

procedure TfrmConfCtasDisCnt.TabSheet1Enter(Sender: TObject);
begin
  LlenarComboBox;
end;

procedure TfrmConfCtasDisCnt.Button1Click(Sender: TObject);
var
  c1, c2, c3 : String;
begin
  qryViewCtaCtalogo.Close;
   qryViewCtaCtalogo.sql.Text:= IBQuery1.sql.Text;
  if radiogroup1.ItemIndex = 0 then
  begin
    qryViewCtaCtalogo.Filtered:=false;
    qryViewCtaCtalogo.sql.Text:= qryViewCtaCatalogoFilterLike.SQL.Text;
    qryViewCtaCtalogo.Params[0].value:= 1;//cia_key
    qryViewCtaCtalogo.Params[1].Value := '%'+editn1.Text+'%';
    qryViewCtaCtalogo.Open;
  end else
  begin
   qryViewCtaCtalogo.Open;  
    GlbAsignaCuenta(EditN1.Text, c1, c2, c3);
    case RadioGroup1.ItemIndex of
    0:if Not qryViewCtaCtalogo.Locate('nombre_cta', EditN1.Text,[loCaseInsensitive,loPartialKey]) then
      MessageDlg('Nombre cuenta no encontrado, verifique',mtInformation, [mbOK], 0);
    1:if Not qryViewCtaCtalogo.Locate('cuenta1;cuenta2;cuenta3',VarArrayOf([c1, c2, c3]),[]) then
      MessageDlg('Cuenta no encontrada, verifique', mtInformation, [mbOK], 0);
    2:if Not qryViewCtaCtalogo.Locate('cuenta1',EditN1.Text,[loCaseInsensitive,loPartialKey]) then
      MessageDlg('Cuenta no encontrado, verifique', mtInformation, [mbOK], 0);
    3:if Not qryViewCtaCtalogo.Locate('cuenta2',EditN1.Text,[loCaseInsensitive,loPartialKey]) then
      MessageDlg('Cuenta no encontrado, verifique', mtInformation, [mbOK], 0);
    4:if Not qryViewCtaCtalogo.Locate('cuenta3',EditN1.Text,[loCaseInsensitive,loPartialKey]) then
      MessageDlg('Cuenta no encontrado, verifique', mtInformation, [mbOK], 0);
    end;
  end;
end;

procedure TfrmConfCtasDisCnt.RadioGroup2Click(Sender: TObject);
begin
  qryViewCtaCtalogo.Close;
  qryViewCtaCtalogo.Sql.Text:= IBQuery1.sql.Text;
  qryViewCtaCtalogo.Params[0].Value:=1;
  qryViewCtaCtalogo.Open;
  CheckBox1.Checked := True;
  CheckBox1.Visible := True;
  qryViewCtaCtalogo.Filtered:=False;  
  case RadioGroup2.ItemIndex of
  0 : Nivel:='1';
  1 : Nivel:='2';
  2 : Nivel:='3';
  3 : Nivel:='4';
  4 : Nivel:='5';
  5 : Nivel:='6';
  end;
  EditN1.Text := '';
  qryViewCtaCtalogo.Filtered:=True;
  CheckBox1.Checked:=True;
end;

procedure TfrmConfCtasDisCnt.RadioGroup1Click(Sender: TObject);
begin
  case RadioGroup1.ItemIndex of
  0: Label1.Caption:='Entre Nombre';
  1: Label1.Caption:='Entre Cuenta';
  2: Label1.Caption:='Entre Cuenta1';
  3: Label1.Caption:='Entre cuenta2';
  4: Label1.Caption:='Entre cuenta3';
  end;
end;

procedure TfrmConfCtasDisCnt.qryViewCtaCtalogoFilterRecord(
  DataSet: TDataSet; var Accept: Boolean);
begin
  Accept := Dataset.FieldByName('cuenta1').AsString[1] = nivel
end;

procedure TfrmConfCtasDisCnt.RxDBGrid4CellClick(Column: TColumn);
begin
  if dmDistCnt.tblDistribucionCnt.State In [dsEdit, dsInsert] then
  begin
    if not qryViewCtaCtalogoCUENTA1.IsNull then
    begin
      dmDistCnt.tblDistribucionCntCTA1.Value  := qryViewCtaCtalogoCUENTA1.Value;
      dmDistCnt.tblDistribucionCntCTA2.Value  := qryViewCtaCtalogoCUENTA2.Value;
      dmDistCnt.tblDistribucionCntCTA3.Value  := qryViewCtaCtalogoCUENTA3.Value;
      dmDistCnt.tblDistribucionCntORIGEN.Value:= qryViewCtaCtalogoSIGNO_CTA.Value;
      RxLabel1.Caption := qryViewCtaCtalogoNOMBRE_CTA.Value;
    end;
  end;
end;

procedure TfrmConfCtasDisCnt.BitBtn22Click(Sender: TObject);
var
  archivo : String;
begin
  TIPO_DOCUMENTO_CNT :=6;//Entrada
  SISTEMA_CNT        :=18;//Transaccion ventas
  SUBSISTEMA_CNT     :=1;
  GLBCODIGO_CIA      :=1;
  frmContabilizarVentas:=TfrmContabilizarVentas.Create(Nil);
  try
    GLBMODULO_CNT := 1;
    frmContabilizarVentas.esVentaCredito := False;
    frmContabilizarVentas.nombretablaacnt:= 'VIEW_VENTAS_ACNT';
    frmContabilizarVentas.Showmodal;
  finally
  frmContabilizarVentas.Free;
  frmContabilizarVentas:=Nil
  end;
end;

end.
