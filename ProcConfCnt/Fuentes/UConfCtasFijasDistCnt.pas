unit UConfCtasFijasDistCnt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RXCtrls, RXDBCtrl, RxLookup, DB, IBCustomDataSet,
  IBQuery, RxDBComb, ExtCtrls, DBCtrls, Mask, Buttons, WinSkinData, Grids,
  DBGrids, RxMemDS;

type
  TfrmConfCtasFicasDisCnt = class(TForm)
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
    DBEdit6: TDBEdit;
    Label3: TLabel;
    qryCamposCAMPO: TIBStringField;
    qryCamposRDBRELATION_NAME: TIBStringField;
    qrytablasTABLAS: TIBStringField;
    DBText1: TDBText;
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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfCtasFicasDisCnt: TfrmConfCtasFicasDisCnt;

implementation

uses UDatModDistCNT,UViewCtaCatalogo,  UGlobal;

{$R *.dfm}

procedure TfrmConfCtasFicasDisCnt.FormCreate(Sender: TObject);
begin
  dmDistCnt.tblGrpTipoPago.Close;
  dmDistCnt.tblGrpTipoPago.Open;
  qrytablas.Close;
  qrytablas.Open;
  qrytablas.First;
  if not dmDistCnt.tblDisCtaFijaMasterNOMBRE_TABLA.isNull then
  dmDistcnt.lNombretabla :=dmDistCnt.tblDisCtaFijaMasterNOMBRE_TABLA.Value; 
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
  RxDBLookupCombo3Exit(Self);
  //RxDBLookupCombo3Change(Self);
end;

procedure TfrmConfCtasFicasDisCnt.BitBtn2Click(Sender: TObject);
begin
  if dmDistCnt.tblDisCtaFijaMasterSERIE.IsNull then
  begin
    MessageDlg('Primero debe registrar record master', mtError,[mbOk], 0);
    exit;
  end;
  if dmDistCnt.tblDistCntCtaFija.State = dsBrowse then
  begin
    dmDistCnt.tblDistCntCtaFija.Insert;
    dmDistCnt.tblDistCntCtaFijaMODULO.Value := dmDistCnt.tblDisCtaFijaMasterMODULO.Value;
    dmDistCnt.tblDistCntCtaFijaNOMBRE_TABLA_CNT.Value:='TRNCNT_DETALLE';
    dmDistCnt.tblDistCntCtaFijaNOMBRE_TABLA.Value := dmDistCnt.tblDisCtaFijaMasterNOMBRE_TABLA.Value;
    dmDistCnt.tblDistCntCtaFijaIDTIPO_PAGO.Value  := dmDistCnt.tblDisCtaFijaMasterIDTIPO_PAGO.Value; 
    dmDistCnt.tblDistCntCtaFijaSTATUS.Value       := 'A';
    dmDistCnt.tblDistCntCtaFijaFECHA_INSER.Value  := Now;
    dmDistCnt.tblDistCntCtaFijaINSERT_POR.Value   := StrUserName;
  end;
end;

procedure TfrmConfCtasFicasDisCnt.BitBtn8Click(Sender: TObject);
begin
  frmViewCtaCatalogo:=TfrmViewCtaCatalogo.Create(Nil);
  try
    if frmViewCtaCatalogo.Showmodal = mrOk then
    begin
      if dmDistCnt.tblDistCntCtaFija.state In [dsEdit, dsInsert] then
      begin
        if not frmViewCtaCatalogo.qryViewCtaCtalogoCUENTA1.IsNull then
        begin
          dmDistCnt.tblDistCntCtaFijaCTA1.Value:= frmViewCtaCatalogo.qryViewCtaCtalogoCUENTA1.Value;
          dmDistCnt.tblDistCntCtaFijaCTA2.Value:= frmViewCtaCatalogo.qryViewCtaCtalogoCUENTA2.Value;
          dmDistCnt.tblDistCntCtaFijaCTA3.Value:= frmViewCtaCatalogo.qryViewCtaCtalogoCUENTA3.Value;
          dmDistCnt.tblDistCntCtaFijaORIGEN.Value := frmViewCtaCatalogo.qryViewCtaCtalogoSIGNO_CTA.Value; 
        end;
      end;
    end;
  finally
  frmViewCtaCatalogo.Free;
  frmViewCtaCatalogo:=Nil;
  end;
end;

procedure TfrmConfCtasFicasDisCnt.BitBtn5Click(Sender: TObject);
begin
  if dmDistCnt.tblDisCtaFijaMaster.State In [dsEdit, dsInsert] then
  begin
    MessageDlg('Favor guarde datos master primero',mtError,[mbok],0);
    Exit;
  end;
  if dmDistCnt.tblDistCntCtaFija.State in [dsEdit, dsInsert] then
  begin
    if dmDistCnt.tblDistCntCtaFija.State In [dsInsert] then
    dmDistCnt.tblDistCntCtaFijaSERIE.Value:= FsqlMaxNumero('DISTRIBUCION_CNT_FIJA','SERIE');
    dmDistCnt.tblDistCntCtaFija.Post;
    dmDistCnt.tblDistCntCtaFija.ApplyUpdates;
    if not dmDistCnt.tblDistCntCtaFija.Transaction.InTransaction then
    dmDistCnt.tblDistCntCtaFija.Transaction.StartTransaction;
    try
      dmDistCnt.tblDistCntCtaFija.Transaction.CommitRetaining;
    except
    dmDistCnt.tblDistCntCtaFija.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmConfCtasFicasDisCnt.BitBtn1Click(Sender: TObject);
begin
  if dmDistCnt.tblDisCtaFijaMaster.State = dsBrowse then
  begin
    dmDistCnt.tblDisCtaFijaMaster.Insert;
    dmDistCnt.tblDisCtaFijaMasterSTATUS.Value:='A';
  end;
end;

procedure TfrmConfCtasFicasDisCnt.BitBtn9Click(Sender: TObject);
begin
  if dmDistCnt.tblDisCtaFijaMaster.State = dsBrowse then
  dmDistCnt.tblDisCtaFijaMaster.Edit;
end;

procedure TfrmConfCtasFicasDisCnt.BitBtn10Click(Sender: TObject);
begin
  if dmDistCnt.tblDisCtaFijaMaster.State in [dsInsert, dsEdit] then
  dmDistCnt.tblDisCtaFijaMaster.Cancel;
end;

procedure TfrmConfCtasFicasDisCnt.BitBtn11Click(Sender: TObject);
begin
  if dmDistCnt.tblDisCtaFijaMaster.State in [dsEdit, dsInsert] then
  begin
    if dmDistCnt.tblDisCtaFijaMasterNOMBRE_TABLA.IsNull or
    dmDistCnt.tblDisCtaFijaMasterMODULO.IsNull then
    //or dmDistCnt.tblDisCtaFijaMasterIDTIPO_PAGO.IsNull then
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

    dmDistCnt.tblDisCtaFijaMasterSERIE.Value := FsqlMaxNumero('DISTRIBUCION_CNT_FIJA', 'SERIE');
    dmDistCnt.tblDisCtaFijaMaster.Post;
    dmDistCnt.tblDisCtaFijaMaster.ApplyUpdates;
    if not dmDistCnt.tblDisCtaFijaMaster.Transaction.InTransaction then
    dmDistCnt.tblDisCtaFijaMaster.Transaction.StartTransaction;
    try
      dmDistCnt.tblDisCtaFijaMaster.Transaction.CommitRetaining;
    except
    dmDistCnt.tblDisCtaFijaMaster.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmConfCtasFicasDisCnt.BitBtn12Click(Sender: TObject);
begin
  dmDistCnt.tblDisCtaFijaMaster.Close;
  dmDistCnt.tblDisCtaFijaMaster.Open;
end;

procedure TfrmConfCtasFicasDisCnt.BitBtn4Click(Sender: TObject);
begin
  if dmDistCnt.tblDistCntCtaFija.State in [dsEdit, dsInsert] then
  dmDistCnt.tblDistCntCtaFija.Cancel
  else
  if MessageDlg('Eliminar record?', mtInformation, [mbYes, mbNo], 0) = mrYes then
  begin
    dmDistCnt.tblDistCntCtaFija.Delete;
    dmDistCnt.tblDistCntCtaFija.ApplyUpdates;
    if Not dmDistCnt.tblDistCntCtaFija.Transaction.InTransaction then
    dmDistCnt.tblDistCntCtaFija.Transaction.StartTransaction;
    try
      dmDistCnt.tblDistCntCtaFija.Transaction.CommitRetaining;
    except
    dmDistCnt.tblDistCntCtaFija.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmConfCtasFicasDisCnt.BitBtn3Click(Sender: TObject);
begin
  if dmDistCnt.tblDistCntCtaFija.State in [dsBrowse] then
  dmDistCnt.tblDistCntCtaFija.Edit;
end;

procedure TfrmConfCtasFicasDisCnt.BitBtn6Click(Sender: TObject);
begin
  if dmDistCnt.tblDistCntCtaFija.State In [dsBrowse, dsInactive] then
  begin
    dmDistCnt.tblDistCntCtaFija.Close;
    dmDistCnt.tblDistCntCtaFija.Open;
  end;
end;

procedure TfrmConfCtasFicasDisCnt.RxDBLookupCombo3Change(Sender: TObject);
begin
  if dmDistCnt.tblDisCtaFijaMasterNOMBRE_TABLA.isNull then exit;
  dmDistcnt.lNombretabla := '';
  qryCampos.Close;
  qryCampos.Params[0].Value := Trim(dmDistCnt.tblDisCtaFijaMasterNOMBRE_TABLA.Value);
  qryCampos.Open;
  qryCampos.First;
  ListBoxCampos.Clear;
  While Not qryCampos.Eof do
  begin
    ListBoxCampos.Items.Add(Trim(qryCamposCAMPO.Value));
    qryCampos.Next;
  end;
end;

procedure TfrmConfCtasFicasDisCnt.RxDBLookupCombo3Exit(Sender: TObject);
begin
  RxDBLookupCombo3Change(Self);
end;

procedure TfrmConfCtasFicasDisCnt.DBRadioGroup1Change(Sender: TObject);
begin
  if dmDistCnt.tblDistCntCtaFija.State in [dsBrowse, dsInactive] then Exit;
  if (DBRadioGroup1.ItemIndex = 0) then
  dmDistCnt.tblDistCntCtaFijaNOMBRE_CAMPO_CNTDET.Value:='rxCredito'
  else
  dmDistCnt.tblDistCntCtaFijaNOMBRE_CAMPO_CNTDET.Value:='rxDebito';
end;

procedure TfrmConfCtasFicasDisCnt.qryCamposAfterOpen(DataSet: TDataSet);
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

procedure TfrmConfCtasFicasDisCnt.BitBtn13Click(Sender: TObject);
begin
  if dmDistCnt.tblDisCtaFijaMaster.State = dsBrowse then
  dmDistCnt.tblDisCtaFijaMaster.First;
end;

procedure TfrmConfCtasFicasDisCnt.BitBtn14Click(Sender: TObject);
begin
  if dmDistCnt.tblDisCtaFijaMaster.State = dsBrowse then
  dmDistCnt.tblDisCtaFijaMaster.Prior;
end;

procedure TfrmConfCtasFicasDisCnt.BitBtn15Click(Sender: TObject);
begin
  if dmDistCnt.tblDisCtaFijaMaster.State = dsBrowse then
  dmDistCnt.tblDisCtaFijaMaster.Next;
end;

procedure TfrmConfCtasFicasDisCnt.BitBtn16Click(Sender: TObject);
begin
  if dmDistCnt.tblDisCtaFijaMaster.State = dsBrowse then
  dmDistCnt.tblDisCtaFijaMaster.Last;
end;

procedure TfrmConfCtasFicasDisCnt.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmDistCnt.tblDistCntCtaFija.Close;
end;

procedure TfrmConfCtasFicasDisCnt.FormShow(Sender: TObject);
begin
  RxDBLookupCombo3Exit(Self);
end;

end.
