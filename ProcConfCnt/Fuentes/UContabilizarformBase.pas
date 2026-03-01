unit UContabilizarformBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  db, Dialogs, ComCtrls, RXCtrls, RXDBCtrl, StdCtrls, Buttons, ExtCtrls, Grids,
  DBGrids, Menus, RxMemDS, WinSkinData;

type
  TfrmContabilizaDatos = class(TForm)
    Panel1: TPanel;
    BitBtn2: TBitBtn;
    RxSpeedButton1: TRxSpeedButton;
    DBStatusLabel1: TDBStatusLabel;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    Panel2: TPanel;
    btnProcesar: TBitBtn;
    btnDatos: TBitBtn;
    btnContabilizar: TBitBtn;
    dtpkfecha: TDateTimePicker;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    tabTransacciones: TTabSheet;
    RxDBGrid1: TRxDBGrid;
    PopupMenu1: TPopupMenu;
    EntradaCnt1: TMenuItem;
    MvtosCtas1: TMenuItem;
    RxDBGrid2: TRxDBGrid;
    rxTotalesT: TRxMemoryData;
    rxTotalesTValorDet: TFloatField;
    rxTotalesTDiferencia: TFloatField;
    DataSource1: TDataSource;
    Panel3: TPanel;
    ProgressBar1: TProgressBar;
    DBGrid1: TDBGrid;
    rxSerie: TRxMemoryData;
    rxSerieSerie: TIntegerField;
    SkinData1: TSkinData;
    procedure btnContabilizarClick(Sender: TObject);
    procedure btnProcesarClick(Sender: TObject);
    procedure RxDBGrid2GetCellProps(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor);
    procedure FormCreate(Sender: TObject);
    procedure EntradaCnt1Click(Sender: TObject);
    procedure MvtosCtas1Click(Sender: TObject);
    procedure dtpkfechaExit(Sender: TObject);
  private
    { Private declarations }
    procedure PrepararControl(Lfecha: TDatetime);
    procedure PrepararControlM(Sistema:Integer;SubSistema:Integer;Lfecha:TDatetime);
    procedure PrepararSerie;

  public
    { Public declarations }
    cntTabla : String;
    ProcActStatusContrato : Boolean;
    procedure ProcActOperaciones;    
  end;

var
  frmContabilizaDatos: TfrmContabilizaDatos;
  Agrupar : Boolean = True;
  ValorServicio, debito,credito : Real;
  Abortar: Boolean;

implementation
uses uGlobal, UDatModCxc, UDatModTransCnt,
  UDatModControl, URepListadoACnt, URepMvCtaCntDet;

{$R *.dfm}

procedure TfrmContabilizaDatos.btnContabilizarClick(Sender: TObject);
var
  strdebito,strcredito:string;
  numerotrn : Integer;
begin
  btnContabilizar.enabled:=false;
  if (Not dmcxc.rxTranCnt.Active) Or (dmcxc.rxTranCnt.Recordcount = 0) then
  begin
    if (dmcxc.rxTranCnt.Recordcount = 0) then
    begin
      if Messagedlg('No se encontraron transacciones para este dia, continuar?',mtInformation,[mbyes,mbno],0) = mryes then
      PrepararControlM(SISTEMA_CNT, SUBSISTEMA_CNT, ExtraerFecha(dtpkfecha.Date));
    end;
    Exit;
  end;
  dmcxc.rxTranCnt.First;
  strdebito := Format('%8.2f',[debito]);
  strcredito:= Format('%8.2f',[credito]);
  if (strdebito <> strcredito) and (Abs(debito-Credito) > 0.005 ) then
  begin
    MessageDlg('Transaccion no cuadra, verifique',mtError,[mbOk],0);
    //RegistrarLogError('frmFactContabiliza','UFactCotabiliza','Trn. no cuatra');
    exit;
  end;

  { SISTEMA = 1; SUB_SISTEMA = 0; Transacciones Contables }
  //SISTEMA_CNT     := 1;
  //SUBSISTEMA_CNT  := 0;
  PrepararControlM(SISTEMA_CNT,SUBSISTEMA_CNT,ExtraerFecha(dtpkfecha.Date));
  if Abortar then exit;
  Abortar:=false;
  //SISTEMA_CNT     := -1;
  //SUBSISTEMA_CNT  := -1;
  if TIPO_DOCUMENTO_CNT = 0 then
  TIPO_DOCUMENTO_CNT := 1;
  if Not Abortar then
  begin
    dmTransCnt.tblTransCntMaster.Close;
    dmTransCnt.tblTransCntMaster.Params[0].Value := ExtraerFecha(dtpkfecha.DateTime);
    dmTransCnt.tblTransCntMaster.Params[1].Value := ExtraerFecha(dtpkfecha.DateTime);
    dmTransCnt.tblTransCntMaster.Open;
    dmTransCnt.tblTransCntMaster.Insert;
    dmTransCnt.tblTransCntMasterTIPO_DOC.Value   := TIPO_DOCUMENTO_CNT;
    //dm.stpSerieMaster.ExecProc;
    //dmTransCnt.tblTransCntMasternumero.Value:=dm.stpSerieMaster.params[0].Value;
    //t if dmTransCnt.tblTransCntMasternumero.Value <= 0 then
    //t begin
      //t MessageDlg('Numero de Transaccion no puede ser cero ( 0 ), verifique',mterror,[mbok],0);
      //RegistrarLogError('frmFactContabiliza','UFactCotabiliza','# trn no puede ser cero');
      //t exit;
    //t end;
    //FBuscarUltNum('SECTRNCNTMASTER');
    dmTransCnt.tblTransCntMasterSTATUS.Value     := 'A';
    dmTransCnt.tblTransCntMasterFECHA.Value      := dmcxc.rxTranCntrxFecha.Value;
    dmTransCnt.tblTransCntMasterDESCRIPCION.Value:= GlbDescTipoCNT;//dmcxc.rxTranCntrxDescripcion.value;
    dmTransCnt.tblTransCntMasterMONTO.Value      := Debito;
    dmTransCnt.tblTransCntMasterFECHA_IN.Value   := Now;
    dmTransCnt.tblTransCntMasterIN_POR.Value     := StrUserName;
    //t NumeroTrn := dmTransCnt.tblTransCntMasternumero.Value;
    dmTransCnt.tblTransCntMaster.Post;
    Progressbar1.Max := dmcxc.rxTranCnt.RecordCount;
    Progressbar1.Position := 0;
    dmcxc.rxTranCnt.DisableControls;
    dmcxc.rxTranCnt.First;
  //t if numerotrn = 0 then
  //t begin
  //t  Messagedlg('Error en numero de transaccion', mtError,[mbOk],0);
    //RegistrarLogError('frmFactContabiliza','UFactCotabiliza','error en numero trn');
  //t  exit;
  //tend;
  While Not dmcxc.rxTranCnt.Eof do
  begin
    if not dmcxc.rxtrancntrxcuenta2.IsNull then
    begin
      if (dmcxc.rxTranCntrxDebito.Value > 0) or (dmcxc.rxTranCntrxCREDITO.Value > 0) then
      begin
        dmTransCnt.tblTransCntDet.Insert;
        //dmTransCnt.stpSeriedetalle.ExecProc;
        //dmTransCnt.tblTransCntDetSERIE.Value  := dm.stpseriedetalle.params[0].Value;
        dmTransCnt.tblTransCntDetSTATUS.Value := 'A';
        dmTransCnt.tblTransCntDetNUMERO.Value := dmTransCnt.tblTransCntMasternumero.Value;
        dmTransCnt.tblTransCntDetDESCRIPCION_TRN.Value := dmcxc.rxTranCntrxDescripcion.Value;
        dmTransCnt.tblTransCntDetCUENTA1.Value := dmcxc.rxTranCntrxCuenta1.Value;
        dmTransCnt.tblTransCntDetCUENTA2.Value := dmcxc.rxTranCntrxCuenta2.Value;
        dmTransCnt.tblTransCntDetCUENTA3.Value := dmcxc.rxTranCntrxCuenta3.Value;
        dmTransCnt.tblTransCntDetDEBITO_TRN.Value  := dmcxc.rxTranCntrxDebito.Value;
        dmTransCnt.tblTransCntDetCREDITO_TRN.Value := dmcxc.rxTranCntrxCREDITO.Value;
        dmTransCnt.tblTransCntDetCODIGO_DEPTO.Value:= 2;//temporal -> Ventas
        dmTransCnt.tblTransCntDetnum_doc.Value:= dmcxc.rxTranCntrxNumFact.Value;//StrToInt('1'+FormatDateTime('mmdd',dtpkfecha.date));//dmcxc.rxtrancntrxnumfact.value; //codigo 1 mas mes y dia
        dmTransCnt.tblTransCntDetCOD_CTA_CONCEPTO.Value := 0;//No Aplica
        dmTransCnt.tblTransCntDetCODIGO_CENTRO_COSTO.Value:= dmcxc.rxTranCntCentroCosto.Value;
        dmTransCnt.tblTransCntDetIN_POR.Value   := StrUserName;
        dmTransCnt.tblTransCntDetFECHA_IN.Value := Now;
        dmTransCnt.tblTransCntDet.Post;
      end;
    end;//Not null
    progressbar1.StepIt;
    dmcxc.rxTranCnt.next;
  end;//while
  end;
  dmcxc.rxTranCnt.EnableControls;

  if Not dmTransCnt.tblTransCntMaster.Transaction.InTransaction then
  dmTransCnt.tblTransCntMaster.Transaction.StartTransaction;
  try
    dmTransCnt.tblTransCntMaster.Transaction.CommitRetaining;
  except
  dmTransCnt.tblTransCntMaster.Transaction.RollbackRetaining;
  end;

  if Not dmTransCnt.tblTransCntDet.Transaction.InTransaction then
  dmTransCnt.tblTransCntDet.Transaction.StartTransaction;
  try
    dmTransCnt.tblTransCntDet.Transaction.CommitRetaining;
  except
  dmTransCnt.tblTransCntDet.Transaction.RollbackRetaining;
  end;

  ProcActOperaciones;

  dmcxc.rxTranCnt.Close;
  dmcxc.rxTranCnt.EmptyTable;
  //dmcxc.qryFactCont.Close;
  progressbar1.Position:=0;
 // if ProcActStatusContrato then
 // dmTransCnt.ibsqlUpdateStatusContrato.ExecQuery;
 // if Not dmTransCnt.ibsqlUpdateStatusContrato.Transaction.InTransaction then
 // dmTransCnt.ibsqlUpdateStatusContrato.Transaction.StartTransaction;
 // try
 //   dmTransCnt.ibsqlUpdateStatusContrato.Transaction.CommitRetaining;
 // except
 // dmTransCnt.ibsqlUpdateStatusContrato.Transaction.RollbackRetaining;
 // end;
end;

procedure TfrmContabilizaDatos.btnProcesarClick(Sender: TObject);
begin
  //
end;

procedure TfrmContabilizaDatos.PrepararControl(Lfecha: TDatetime);
begin
  if not dmControl.qryControldet.Locate('fecha_Act',ExtraerFEcha(Lfecha),[]) then
  begin
    dmControl.qryControldet.Insert;
    dmControl.qryControlDetSERIE.Value:= FsqlMaxNumero('control_det','serie');
    dmControl.qryControlDetFECHA_IN.Value := now;
    dmControl.qryControlDetIN_POR.Value := strUserName;
    //dmcxc.stpActSerieCtrl.close;
    //dmcxc.stpActSerieCtrl.ExecProc;
    //dmControl.qryControlDetSERIE.Value:=dmcxc.stpActSerieCtrl.Params[0].value;
    //if dmControl.qryControlDetSERIE.Value = 0 then
    //dmControl.qryControlDetSERIE.Value:=1;
    dmControl.qryControlDetCOD_CIA.Value:=1;
    dmControl.qryControlDetSISTEMA.Value:=dmControl.qryControlSISTEMA.Value;
    dmControl.qryControlDetSUB_SISTEMA.Value:=dmControl.qryControlSUB_SISTEMA.Value;
    dmControl.qryControldetFECHA_ACT.Value:=ExtraerFecha(LFecha);
    dmControl.qryControldetSTATUS.value := 'A';
    dmControl.qryControldet.post;
    dmControl.qryControldet.ApplyUpdates;
    if not dmControl.qryControldet.Transaction.InTransaction then
    dmControl.qryControldet.Transaction.StartTransaction;
    try
      dmControl.qryControldet.Transaction.CommitRetaining;
    except
    dmControl.qryControldet.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmContabilizaDatos.PrepararControlM(Sistema,
  SubSistema: Integer; Lfecha: TDatetime);
  var
    fCerrada : TDatetime;
begin
  dmControl.qryControl.Close; // facturas
  //dmControl.qryControl.Filter:='Sistema = '+IntToStr(sistema)+' And sub_sistema = '+IntToStr(subsistema)+' And cod_cia = 2 ';
  dmControl.qryControl.Filtered := False;
  dmControl.qryControl.Open;
  if (Not dmControl.qryControl.Locate('sistema;sub_sistema;cod_cia', VarArrayOf([Sistema, SubSistema,1]),[])) then
  begin
    MessageDlg('Favor verificar control posteo', mtError, [mbOK], 0);
    Exit;
  end;
  //dmControl.qryControl.Filtered:=true; //Transacciones

  Abortar:=true;
  if not VerificaCierreDia(Sistema,SubSistema,1,ExtraerFecha(dtpkfecha.Date), fCerrada) then
  begin
    Messagedlg('Fecha incorrecta, favor verificar',mtError,[mbok],0);
    btnProcesar.Enabled:=False;
    Abortar:=True;
  end else
  begin
    Abortar:=False;
    btnDatos.Enabled:=True;
    btnProcesar.Enabled:=True;
  end;
  if (ExtraerFecha(dtpkfecha.date) = ExtraerFecha(Lfecha)) then
  begin
    if dmControl.qryControlSTATUS.Value = 'A' then //Atualiza Fecha
    begin
      dtpkfecha.Date:=dtpkfecha.date + 1;
      dmControl.qryControl.Edit;
      dmControl.qryControlFECHA_ACT.Value:=ExtraerFecha(dtpkfecha.Date);
      dmControl.qryControl.Post;
      dmControl.qryControl.ApplyUpdates;
       if not dmControl.qryControl.Transaction.InTransaction then
      dmControl.qryControl.Transaction.StartTransaction;
      try
        dmControl.qryControl.Transaction.CommitRetaining;
      except
      dmControl.qryControl.Transaction.RollbackRetaining;
      end;
      PrepararControl(ExtraerFecha(dtpkfecha.Date));
      Abortar:=False;
    end else
    begin
      MessageDlg('Mes fue cerrado, verifique',mterror,[mbok],0);
      //RegistrarLogError('frmFactContabiliza','UFactCotabiliza','mes cerrado');
      Abortar := True;
    end;
    //Lfecha:=dmControl.qryControlfecha_act.Value + 1;
  end;
  //This a temporal senetence
  Abortar := False;
end;

procedure TfrmContabilizaDatos.RxDBGrid2GetCellProps(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor);
begin
  if dmcxc.rxTranCntrxcuenta2.IsNull then
  Begin
    Background:= $00400080;
    Afont.Color:= clLime;
  end;
end;

procedure TfrmContabilizaDatos.FormCreate(Sender: TObject);
var
 lfecha:tdatetime;
 lstatus:string;
begin
  //inherited;
  dmcxc.tCtaTipoCntd.Close;
  dmcxc.tCtaTipoCntd.filtered:=false;
  dmcxc.tCtaTipoCntd.Open;
  dmControl.qryControl.Close;
  SISTEMA_CNT     := 18;
  SUBSISTEMA_CNT  := 1;
  GLBCODIGO_CIA   := 1;

  dmControl.qrycontrol.Open;
  if Not dmControl.qrycontrol.Locate('SISTEMA;SUB_SISTEMA;COD_CIA',VarArrayOf([SISTEMA_CNT, SUBSISTEMA_CNT, GLBCODIGO_CIA]),[]) then
  MessageDlg('Codigo sistema no encontrado en tabla control, verifique',mtInformation, [mbOK], 0);
  dtpkfecha.Date:= ExtraerFecha(dmControl.qryControlFECHA_ACT.Value);
  dmControl.qryControl.close;
end;

procedure TfrmContabilizaDatos.EntradaCnt1Click(Sender: TObject);
begin
  qckListadoAcnt:=TqckListadoAcnt.Create(Nil);
  try
    qckListadoAcnt.Preview;
  finally
  qckListadoAcnt.Free;
  qckListadoAcnt:=Nil;
  end;
end;

procedure TfrmContabilizaDatos.MvtosCtas1Click(Sender: TObject);
begin
  qckListMvCtacntDet:=TqckListMvCtacntDet.Create(Nil);
  try
    qckListMvCtacntDet.Preview;
  finally
  qckListMvCtacntDet.Free;
  qckListMvCtacntDet:=Nil;
  end;
end;

procedure TfrmContabilizaDatos.ProcActOperaciones;
var
  sqlText : String;
  serie : string;
begin
  //DISTR_STATUS_CNT
  //1 SERIE STATUS_CNT VENTAS_DET R
  dmcxc.qryDistStatusCnt.Close;
  dmcxc.qryDistStatusCnt.Params[0].Value:= GLBMODULO_CNT;
  dmcxc.qryDistStatusCnt.Open;
  dmcxc.rxTranCnt.First;
  PrepararSerie;
  rxSerie.First;  
  While Not rxSerie.Eof Do
  begin
    if not rxSerie.Fieldbyname(dmcxc.qryDistStatusCntNOMBRE_CAMPO_ORIGEN.Value).IsNull then
    Serie:= rxSerie.Fieldbyname(dmcxc.qryDistStatusCntNOMBRE_CAMPO_ORIGEN.Value).AsVariant;
    if (Serie = '') then
    begin
      rxSerie.Next;
      continue;
    end;
    sqlText := Format('Update %s set %s = %s Where %s=%s',
    [dmcxc.qryDistStatusCntNOMBRE_TABLA_DESTINO.Value,
     dmcxc.qryDistStatusCntNOMBRE_CAMPO_DESTINO.Value,
     chr(39) + dmcxc.qryDistStatusCntVALOR_DESTINO.Value + chr(39),
     dmcxc.qryDistStatusCntNOMBRE_CAMPO_ORIGEN.Value,
     Serie]);
     dmcxc.qryUpdateDistrCnt.SQL.Clear;
     dmcxc.qryUpdateDistrCnt.SQL.Text:= sqlText;
     dmcxc.qryUpdateDistrCnt.ExecQuery;
    rxSerie.Next;
  end;
  if not dmcxc.qryUpdateDistrCnt.Transaction.InTransaction then
  dmcxc.qryUpdateDistrCnt.Transaction.StartTransaction;
  try
    dmcxc.qryUpdateDistrCnt.Transaction.CommitRetaining;
  except
  dmcxc.qryUpdateDistrCnt.Transaction.RollbackRetaining;
  end;
end;

procedure TfrmContabilizaDatos.dtpkfechaExit(Sender: TObject);
var
  fCerrada : TDatetime;
begin
  if Not VerificaCierreDia(SISTEMA_CNT,SUBSISTEMA_CNT,1,ExtraerFecha(dtpkfecha.Date), fCerrada) then
  begin
    Messagedlg('Fecha incorrecta, favor verificar', mtError, [mbok], 0);
    btnProcesar.Enabled:= False;
    Abortar:= True;
  end else
  begin
    Abortar:= False;
    btnDatos.Enabled:= True;
    btnProcesar.Enabled:= True;
  end;
end;

procedure TfrmContabilizaDatos.PrepararSerie;
begin
  dmcxc.rxTranCnt.First;
  ProgressBar1.Max := dmcxc.rxTranCnt.RecordCount;
  rxSerie.Close;
  rxSerie.Open;
  While Not dmcxc.rxTranCnt.Eof Do
  begin
    if not dmcxc.rxTranCntSERIE.IsNull then
    begin
      if not rxSerie.Locate('serie',dmcxc.rxTranCntSERIE.Value,[]) then
      begin
        rxSerie.Insert;
        rxSerieSerie.Value:=dmcxc.rxTranCntSERIE.AsInteger;
        rxSerie.Post;
      end;
      ProgressBar1.StepIt;
    end;
    dmcxc.rxTranCnt.Next;
  end;
end;

end.
