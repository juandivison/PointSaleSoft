unit UFormContabilizaCheques;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, RxDBCtrl, ComCtrls, Grids,
  DBGrids, StdCtrls, Buttons, ExtCtrls, RxCtrls, Menus;

type
  TfrmContabilizaCheques = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    btnContabilizar: TBitBtn;
    BitBtn2: TBitBtn;
    dtpkFecha: TDateTimePicker;
    PageControl1: TPageControl;
    tabDatos: TTabSheet;
    DBGrid2: TDBGrid;
    ProgressBar1: TProgressBar;
    tabTranprev: TTabSheet;
    RxDBGrid1: TRxDBGrid;
    tabTrancnt: TTabSheet;
    DBGrid3: TDBGrid;
    qrycks: TIBQuery;
    dtqrycks: TDataSource;
    qrycksNUM_TRANS: TFloatField;
    qrycksCODIGO_CIA: TIntegerField;
    qrycksNUMERO_CKS: TIntegerField;
    qrycksFECHA_PAGO: TDateTimeField;
    qrycksBENEFICIARIO: TIBStringField;
    qrycksMONTO: TFloatField;
    qrycksCUENTA1: TIBStringField;
    qrycksCUENTA2: TIBStringField;
    qrycksCUENTA3: TIBStringField;
    qrycksCREDITO: TFloatField;
    qrycksDEBITO: TFloatField;
    qrycksSTATUS: TIBStringField;
    qrycksFECHA_EMISION: TDateTimeField;
    qrycksCOD_BANCO: TIntegerField;
    PopupMenu1: TPopupMenu;
    EntradaCnt1: TMenuItem;
    MvtosCtas1: TMenuItem;
    RxSpeedButton1: TRxSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnContabilizarClick(Sender: TObject);
    procedure EntradaCnt1Click(Sender: TObject);
    procedure MvtosCtas1Click(Sender: TObject);
  private
    { Private declarations }
    Procedure OrganizaDatos;
    Procedure HacerTotales;
    Procedure VerificaControl;
    procedure ActControlDet;
    procedure ActControlSinDatos;
  public
    { Public declarations }
  end;

var
  frmContabilizaCheques: TfrmContabilizaCheques;

  ValorServicio, debito,credito : Real;
  Agrupar : Boolean = True;
  Abortar : Boolean = False;
  
implementation
uses  UDatModcxc, Uglobal, UDatModConectar, UDatModControl, UDatModCheques,
  UDatamodulocnt, URepListadoACnt, URepMvCtaCntDet;
{$R *.dfm}

procedure TfrmContabilizaCheques.FormCreate(Sender: TObject);
var
  x:boolean;
 lfecha:tdatetime;
 lstatus:string;
begin
  GlbDescTipoCNT:='Transacciones CHEQUES a CNT';
  x:=GlbVerificaControl(6,1,GlbCodigoCia,Extraerfecha(date),lfecha,lstatus);
  dtpkfecha.date:=lfecha;
  dtpkfecha.date:= dtpkfecha.date + 1;
end;

procedure TfrmContabilizaCheques.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   dmControl.qryControl.Close;
   GlbDescTipoCNT :='';
end;

procedure TfrmContabilizaCheques.ActControlDet;
begin
  if not dmControl.qryControldet.Locate('fecha_Act',ExtraerFEcha(dtpkfecha.date),[]) then
  begin
    //dmcxc.stpActSerieCtrl.close;
    dmControl.qryControldet.Insert;
    dmControl.qryControlDetFECHA_IN.Value := now;
    dmControl.qryControlDetIN_POR.Value   := strUserName;
    //dmcxc.stpActSerieCtrl.ExecProc;
    dmControl.qryControlDetSERIE.Value:=FsqlMaxNumero('control_det','serie');//dmcxc.stpActSerieCtrl.Params[0].value;
    if dmControl.qryControlDetSERIE.Value = 0 then
    dmControl.qryControlDetSERIE.Value   := 1;
    dmControl.qryControlDetCOD_CIA.Value := 2;//tropical tours
    dmControl.qryControlDetSISTEMA.Value:=dmControl.qryControlSISTEMA.Value;
    dmControl.qryControlDetSUB_SISTEMA.Value:=dmControl.qryControlSUB_SISTEMA.Value;
    dmControl.qryControldetFECHA_ACT.Value  :=ExtraerFecha(dtpkfecha.date);
    dmControl.qryControldetSTATUS.value     := 'A';
    GlbSalvarQuery(dmControl.qryControldet);
  end;
end;

procedure TfrmContabilizaCheques.ActControlSinDatos;
begin
  dmControl.qryControl.Edit;
  dmControl.qryControlfecha_Act.Value:= ExtraerFecha(dtpkfecha.Date);
  GlbSalvarQuery(dmControl.qryControl);
end;

procedure TfrmContabilizaCheques.HacerTotales;
begin
  dmcxc.rxTranCnt.First;
  debito:=0;
  credito:=0;
  while not dmcxc.rxTranCnt.eof do
  begin
    Debito :=debito+dmcxc.rxtrancntrxdebito.value;
    Credito:=credito+dmcxc.rxtrancntrxCredito.Value;
    dmcxc.rxTranCnt.Next;
  end;
  dmcxc.rxTranCnt.last;
  if (debito > 0) or (credito > 0 ) then
  begin
    dmcxc.rxtrancnt.Insert;
    dmcxc.rxTranCntrxCuenta1.Value:='999';
    dmcxc.rxTranCntrxDescripcion.Value:='Totales --->';
    dmcxc.rxtrancntrxdebito.value :=Debito;
    dmcxc.rxtrancntrxCredito.Value:=Credito;
    dmcxc.rxtrancnt.Post;
  end;
  dmcxc.rxtrancnt.SortOnFields('rxcuenta1',true,false);
end;

procedure TfrmContabilizaCheques.OrganizaDatos;
begin
  dmcxc.rxTranCnt.close;
  dmcxc.rxTranCnt.EmptyTable;
  dmcxc.rxTranCnt.Open;
  qrycks.First;
  qrycks.DisableControls;
  While Not qrycks.Eof do
  begin
    progressbar1.StepIt;
    Caption:= 'Procesando cks...'+qrycksbeneficiario.Value;
    dmcxc.rxTranCnt.Insert;
    dmcxc.rxtrancntrxcuenta1.value := qryckscuenta1.Value;
    dmcxc.rxtrancntrxcuenta2.value := qryckscuenta2.Value;
    dmcxc.rxtrancntrxcuenta3.value := qryckscuenta3.Value;
    dmcxc.rxTranCntrxFecha.Value   := ExtraerFecha(qrycksfecha_emision.Value);
    dmcxc.rxTranCntrxDebito.Value  := qrycksdebito.Value;
    dmcxc.rxTranCntrxCredito.Value := qrycksCredito.Value;
    if (qryCksSTATUS.Value = 'N') or (qryCksSTATUS.Value = 'C') then
    begin
      dmcxc.rxTranCntrxDescripcion.Value:= 'Cheque Nulo';
      if dmcks.qryBancos.Locate('CODIGO',Qryckscod_banco.Value,[]) then
      begin
        dmcxc.rxtrancntrxcuenta1.Value := dmcks.qryBancosDetCUENTA1.Value;
        dmcxc.rxtrancntrxcuenta2.Value := dmcks.qryBancosDetCUENTA2.Value;
        dmcxc.rxtrancntrxcuenta3.Value := dmcks.qryBancosDetCUENTA3.Value;
      end else
      begin
        MessageDlg('Cheque nulo, Codigo banco no encontrado, verifique',mterror,[mbok],0);
        Break;
      end;
    end else
    dmcxc.rxTranCntrxDescripcion.Value:= qrycksbeneficiario.Value;
    dmcxc.rxTranCntrxNumfact.Value    := qrycksNUMERO_CKS.Value;
    dmcxc.rxTranCntCod_concepto_cta.Value := 0;
    dmcxc.rxTranCnt.Post;
{   end;//locate}
    qrycks.next;
  end;//while not eof qrycks
  qrycks.EnableControls;
  Caption:= 'Contabiliza Cheques';
  HacerTotales;
  btncontabilizar.Enabled:=true;
end;

procedure TfrmContabilizaCheques.VerificaControl;
var
  tfecha : TDatetime;
begin
  dmControl.qryControl.Close;
  dmControl.qryControl.Filtered:= False;  //cheques
  dmControl.qryControl.Filter  :='Sistema = 6 and sub_sistema = 1 and cod_cia = '+IntToStr(GlbCodigoCia);
  dmControl.qryControl.Filtered:= True;
  dmControl.qryControl.open;
  if dmControl.qryControl.Locate('SISTEMA;SUB_SISTEMA;COD_CIA',
                          VarArrayOf([6, 1, GlbCodigoCia]),[]) then

  begin
  tFecha:=dmControl.qryControlfecha_act.Value+1;
  if dmControl.qryControlstatus.value = 'F' then
  Begin
    Beep;
    MessageDlg('Mes Cerrado,verifique',mterror,[mbok],0);
    Abortar := True;
  end;
  if (ExtraerFecha(dtpkFecha.Date) = ExtraerFecha(tfecha)) then
  begin
   Abortar :=False;
  end else
  Begin
    Beep;
    MessageDlg('Fecha no es válida, verifique',mterror,[mbok],0);
    Abortar := true;
  end;
  end else
  begin
    MessageDlg('Datos control posteo no exite para cheques, verifique.',mterror,[mbok],0);
    Abortar := true;
  end;
end;

procedure TfrmContabilizaCheques.BitBtn1Click(Sender: TObject);
var
  lfecha:tdatetime;
  lstatus:string;
begin
  pagecontrol1.ActivePage:=tabDatos;
  dmcks.qrybancos.Close;
  dmcks.qrybancos.Filtered:=False;
  dmcks.qrybancos.Open;  
  qrycks.Close;
  qrycks.Params[0].Value := ExtraerFecha(dtpkFecha.Date);
  qrycks.Params[1].Value := ExtraerFecha(dtpkFecha.Date);
  qrycks.Open;
  progressbar1.Position:=0;

  glbfechainicial:= qrycks.Params[0].Value;
  glbFechaFinal  := qrycks.Params[0].Value;

  progressbar1.Max:=qrycks.RecordCount;
  if not GlbVerificaControl(6,1,GlbCodigoCia,Extraerfecha(dtpkfecha.date),lfecha,lstatus) then
  begin
    MessageDlg('Mes cerrado o fecha equivocada, verifique',mterror,[mbok],0);
  end else
  OrganizaDatos;
  pagecontrol1.ActivePage:=tabTranprev;
  progressbar1.Position:=0;
end;

procedure TfrmContabilizaCheques.btnContabilizarClick(Sender: TObject);
var
  strdbito, strcredito:String;
begin
  VerificaControl;
  if qrycks.RecordCount = 0 then
  begin
    ActControlSinDatos;
    dtpkFecha.date:=dtpkFecha.date+1;
  end;
  btnContabilizar.Enabled:=False;
  if (not dmcxc.rxTranCnt.Active) Or (dmcxc.rxTranCnt.RecordCount = 0) then
  exit;
  dmcxc.rxTranCnt.First;
  strdbito:= Format('%8.f2',[Debito]);
  strcredito:= Format('%8.f2',[Credito]);
  if strDbito <> strCredito then
  begin
    MessageDlg('Transacción no cuadra, verifique',mtError,[mbOk],0);
    exit;
  end;
  dmCnt.qryMastertrncnt.close;
  dmCnt.qryMastertrncnt.Params[0].Value := ExtraerFecha(dtpkfecha.date);
  dmCnt.qryMastertrncnt.Params[1].Value := ExtraerFecha(dtpkfecha.date);
  dmCnt.qryMastertrncnt.open;
  dmCnt.qryMastertrncnt.Insert;
  dmCnt.qryMastertrncntCIA_KEY.Value := GlbCodigoCia;
  dmCnt.qryMastertrncntTIPO_DOC.Value:=4;//cheque
  //dm.stpActSeriecntm.close;         //proc_act_sectrncntm
  //dm.stpActSeriecntm.ExecProc;
  //dmCnt.qryMastertrncntnumero.Value:=dm.stpActSeriecntm.params[0].value;
  //if dmCnt.qryMastertrncntnumero.Value = 0 then
  //dmCnt.qryMastertrncntnumero.Value:=1;
  dmCnt.qryMastertrncntSTATUS.Value:='A';
  dmCnt.qryMastertrncntFECHA.Value :=dmcxc.rxTranCntrxFecha.Value;
  dmCnt.qryMastertrncntMONTO.Value :=debito;
  dmCnt.qryMastertrncntDESCRIPCION.Value:='Cheques '+ FormatDatetime('mmm-dd-yyyy',dmcxc.rxTranCntrxFecha.value);
  dmCnt.qryMastertrncntFECHA_IN.Value:=now;
  dmCnt.qryMastertrncntIN_POR.Value:=strUserName;
  GlbSalvarQuery(dmCnt.qryMastertrncnt);
  progressbar1.position:=0;
  progressbar1.max:=dmcxc.rxTranCnt.recordcount;
  While Not dmcxc.rxTranCnt.Eof do
  begin
    progressbar1.StepIt;
    if not dmcxc.rxtrancntrxcuenta2.IsNull then
    begin
    dmCnt.qryDetTrnCnt.insert;
    //dm.stpActSeriecntdet.close;  //proc_act_sectrncntdet
    //dm.stpActSeriecntdet.ExecProc;
    //dmCnt.qryDetTrnCntSERIE.Value:=dm.stpActSeriecntdet.params[0].Value;
    //if dmCnt.qryDetTrnCntSERIE.Value = 0 then
    //dmCnt.qryDetTrnCntSERIE.Value:=1;
    dmCnt.qryDetTrnCntSTATUS.Value:='A';
    dmCnt.qryDetTrnCntNUMERO.Value:=dmCnt.qryMastertrncntnumero.Value;
    dmCnt.qryDetTrnCntDESCRIPCION_TRN.Value:= dmcxc.rxTranCntrxDescripcion.Value;
    dmCnt.qryDetTrnCntCUENTA1.Value:=dmcxc.rxTranCntrxCuenta1.Value;
    dmCnt.qryDetTrnCntCUENTA2.Value:=dmcxc.rxTranCntrxCuenta2.Value;
    dmCnt.qryDetTrnCntCUENTA3.Value:=dmcxc.rxTranCntrxCuenta3.Value;
    dmCnt.qryDetTrnCntDEBITO_TRN.Value:=dmcxc.rxTranCntrxDebito.Value;
    dmCnt.qryDetTrnCntCREDITO_TRN.Value:=dmcxc.rxTranCntrxCREDITO.Value;
    dmCnt.qryDetTrnCntCODIGO_DEPTO.Value:=0;//temporal -> Ventas
    dmCnt.qryDetTrnCntnum_doc.Value:=dmcxc.rxtrancntrxnumfact.value;
    dmCnt.qryDetTrnCntCOD_CTA_CONCEPTO.Value:= dmcxc.rxTranCntcod_concepto_cta.Value;
    GlbSalvarQuery(dmCnt.qryDetTrnCnt);
    end;//not null
    dmcxc.rxTranCnt.Next;
  end;//while
  try
    if dmCnt.qryDetTrnCnt.UpdatesPending then
    dmCnt.qryDetTrnCnt.ApplyUpdates;
    if dmCnt.qryMastertrncnt.UpdatesPending then
    dmCnt.qryMastertrncnt.ApplyUpdates;
    dmControl.qryControl.Edit;
    dmControl.qryControlfecha_Act.Value:= ExtraerFecha(dtpkfecha.Date);
    dmControl.qryControl.Post;
    GlbSalvarQuery(dmControl.qryControl);
    ActControlDet;
    dtpkFecha.date:=dtpkFecha.Date+1;
  except

  End;
  Pagecontrol1.ActivePage:=tabDatos;
  Progressbar1.Position:=0;
end;

procedure TfrmContabilizaCheques.EntradaCnt1Click(Sender: TObject);
begin
  dmCxc.rxTranCnt.First;
  dmCxc.rxTranCnt.SortOnFields('rxNumFact;rxDebito;rxCredito;',true,true);
  qckListadoAcnt:=TqckListadoAcnt.Create(Nil);
  try
    qckListadoAcnt.Preview;
  finally
  qckListadoAcnt.Free;
  qckListadoAcnt:=Nil;
  end;
  dmCxc.rxTranCnt.SortOnFields('rxDebito;rxCuenta1;rxNumFact;rxCredito;',true,true);  
  dmcxc.rxtrancnt.SortOnFields('rxCuenta1;rxdebito;', true, true);
  dmcxc.rxtrancnt.SortOnFields('rxdebito;rxCuenta1', true, true);
end;

procedure TfrmContabilizaCheques.MvtosCtas1Click(Sender: TObject);
begin
  dmCxc.rxTranCnt.First;
  dmCxc.rxTranCnt.SortOnFields('rxNumFact;rxDebito;rxCredito;',true,true);
  qckListMvCtacntDet:=TqckListMvCtacntDet.Create(Nil);
  try
    qckListMvCtacntDet.Prepare;
    glbTPag:=qckListMvCtacntDet.PageNumber;
    qckListMvCtacntDet.Preview;
  finally
  qckListMvCtacntDet.Free;
  qckListMvCtacntDet:=Nil;
  end;
  dmCxc.rxTranCnt.SortOnFields('rxDebito;rxCuenta1;rxNumFact;rxCredito;',true,true);
  dmcxc.rxtrancnt.SortOnFields('rxCuenta1;rxdebito;', true, true);
  dmcxc.rxtrancnt.SortOnFields('rxdebito;rxCuenta1', true, true);  
end;

end.
