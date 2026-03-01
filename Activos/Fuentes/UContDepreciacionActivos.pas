unit UContDepreciacionActivos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  USelFechaCnt, Menus, Grids, DBGrids, RXDBCtrl, ComCtrls, StdCtrls,
  db,Buttons, DBCtrls, RXCtrls, ExtCtrls, RxMemDS, IBCustomDataSet,
  Variants, DBTables, IBQuery, WinSkinData;

type
  TfrmContDepreciacion = class(TForm)
    Panel1: TPanel;
    DBStatusLabel1: TDBStatusLabel;
    RxSpeedButton1: TRxSpeedButton;
    DBNavigator1: TDBNavigator;
    BitBtn2: TBitBtn;
    Panel2: TPanel;
    btnSalvar: TBitBtn;
    btnCerarAbrirres: TBitBtn;
    btnProcesar: TBitBtn;
    btnCancelar: TBitBtn;
    btnDatos: TBitBtn;
    btnContabilizar: TBitBtn;
    PageControl1: TPageControl;
    tabFacturas: TTabSheet;
    RxDBGrid1: TRxDBGrid;
    tabTransacciones: TTabSheet;
    RxDBGrid2: TRxDBGrid;
    PopupMenu1: TPopupMenu;
    EntradaCnt1: TMenuItem;
    MvtosCtas1: TMenuItem;
    dtpkfecha: TDateTimePicker;
    Panel3: TPanel;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    rxTotalDep: TRxMemoryData;
    rxTotalDepValor: TFloatField;
    ProgressBar1: TProgressBar;
    qryCtasCat: TIBQuery;
    qryCtasCatCUENTA1: TStringField;
    qryCtasCatCUENTA2: TStringField;
    qryCtasCatCUENTA3: TStringField;
    qryCtasCatNOMBRE_CTA: TStringField;
    qryCtasCatSIGNO_CTA: TSmallintField;
    dtqryCtasCat: TDataSource;
    SkinData1: TSkinData;
    procedure btnContabilizarClick(Sender: TObject);
    procedure btnDatosClick(Sender: TObject);
    procedure btnProcesarClick(Sender: TObject);
    procedure EntradaCnt1Click(Sender: TObject);
    procedure MvtosCtas1Click(Sender: TObject);
    procedure RxDBGrid2GetCellProps(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor);
    procedure dtpkfechaExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure SumarValoresDep;
    procedure BuscarAsignarCuenta;
    procedure ProcesaValor(codigo:Integer);
    procedure ProcesaValorEdit(codigo:Integer);
    procedure ProcesaValorInsert(codigo:Integer);

    procedure MoverDatosRxInsert;
    procedure MoverDatosRxEdit;
    procedure PrepararControl(Lfecha: TDatetime);
    procedure PrepararControlM(Sistema:Integer;SubSistema:Integer;Lfecha:TDatetime);
    function VerificarValores:Boolean;
    procedure HacerTotales;
  public
    { Public declarations }
  end;

var
  frmContDepreciacion: TfrmContDepreciacion;
  ValorServicio, debito,credito : Real;
  Agrupar : Boolean = True;
  x,Abortar,Error: boolean;

  StrCta1,StrCta2,StrCta3 : String;
implementation
uses UDatModuloActivos, UGlobalActivos, URepEntradaDepCnt,
  URepEntradaRDepCnt, UDatModConectar;
{$R *.DFM}

procedure TfrmContDepreciacion.btnContabilizarClick(Sender: TObject);
var
  strdebito,strcredito:string;
begin
  btnContabilizar.enabled:=false;
  if (not dm.rxTranCnt.Active) or (dm.rxTranCnt.recordcount = 0) then
  exit;
  dm.rxTranCnt.First;
  strdebito := Format('%8.2f',[debito]);
  strcredito:= Format('%8.2f',[credito]);
  if strdebito <> strcredito then
  begin
    MessageDlg('Transaccion no cuadra, verifique',mtError,[mbOk],0);
    exit;
  end;             //Depreciacion Contabilizar
  PrepararControlM(16,2,ExtraerFecha(dtpkfecha.date));
  if not Abortar then
  begin
  dm.qryMastertrncnt.Close;
  dm.qryMastertrncnt.Filtered:=False;
  dm.qryMastertrncnt.Params[0].Value := dtpkfecha.Date;
  dm.qryMastertrncnt.Params[1].Value := dtpkfecha.Date;
  dm.qryMastertrncnt.open;
  dm.qryMastertrncnt.Insert;
  dm.qryMastertrncntTIPO_DOC.Value:=8;//Depreciacion
  //dm.qryMastertrncntnumero.Value:= dm.//FBuscarUltNum('SECTRNCNTMASTER');
  dm.qryMastertrncntSTATUS.Value:='A';
  dm.qryMastertrncntFECHA.Value:=dm.rxTranCntrxFecha.Value;
  dm.qryMastertrncntDESCRIPCION.Value:=dm.rxTranCntrxDescripcion.value;
  dm.qryMastertrncntMONTO.Value:=debito;
  dm.qryMastertrncntFECHA_IN.Value:=now;
  dm.qryMastertrncntIN_POR.Value:=strUserName;
  //dm.qryMastertrncntnumero.Value:=FsqlMaxNumero('TRNCNT_MASTER','NUMERO');
  dm.qryMastertrncnt.Post;
  dm.qryMastertrncnt.ApplyUpdates;
  ProgressBar1.Max := dm.rxTranCnt.RecordCount;
  while not dm.rxTranCnt.Eof do
  begin
    ProgressBar1.StepIt;
    if not dm.rxtrancntrxcuenta2.IsNull then
    begin
    dm.qryDetTrnCnt.Insert;
    //dm.qryDetTrnCntSERIE.Value:=FBuscarUltNum('SECUENCIATRNCNT');
    dm.qryDetTrnCntSTATUS.Value:='A';
    dm.qryDetTrnCntNUMERO.Value:=dm.qryMastertrncntnumero.Value;
    dm.qryDetTrnCntDESCRIPCION_TRN.Value:=dm.rxTranCntrxDescripcion.Value;
    dm.qryDetTrnCntCUENTA1.Value:=dm.rxTranCntrxCuenta1.Value;
    dm.qryDetTrnCntCUENTA2.Value:=dm.rxTranCntrxCuenta2.Value;
    dm.qryDetTrnCntCUENTA3.Value:=dm.rxTranCntrxCuenta3.Value;
    dm.qryDetTrnCntDEBITO_TRN.Value:=dm.rxTranCntrxDebito.Value;
    dm.qryDetTrnCntCREDITO_TRN.Value:=dm.rxTranCntrxCREDITO.Value;
    dm.qryDetTrnCntCODIGO_DEPTO.Value:='230';//Finanzas
    dm.qryDetTrnCntCOD_CTA_CONCEPTO.Value := dm.rxTranCntcod_concepto_cta.Value; 
    dm.qrydettrncntNum_doc.Value          := dm.rxtrancntrxnumfact.Value;
    dm.qryDetTrnCnt.Post;
    end;//not null
    dm.rxTranCnt.Next;
  end;//while
  ProgressBar1.Position:=0;
  try
    if dm.qryDetTrnCnt.UpdatesPending then
    dm.qryDetTrnCnt.ApplyUpdates;
    if dm.qryMastertrncnt.UpdatesPending then
    dm.qryMastertrncnt.ApplyUpdates;
    if not dm.qryMastertrncnt.Transaction.InTransaction then
    dm.qryMastertrncnt.Transaction.StartTransaction;
    dm.qryMastertrncnt.Transaction.CommitRetaining;
  except
  dm.qryMastertrncnt.Transaction.RollbackRetaining;
  end;
  end;
  dm.rxTranCnt.close;
  dm.rxtrancnt.EmptyTable;
  PageControl1.ActivePage := tabFacturas;
end;

procedure TfrmContDepreciacion.btnDatosClick(Sender: TObject);
begin
  PageControl1.ActivePage := tabFacturas;
  dm.tActivoCuenta.Close;
  dm.tActivoCuenta.Filtered:=false;
  dm.tActivoCuenta.Open;
  dm.tActivoCuentaGrupo.Close;
  dm.tActivoCuentaGrupo.Filtered := False;
  dm.tActivoCuentaGrupo.Open;
  dm.rxTranCnt.Close;
  dm.rxTranCnt.EmptyTable;
  dm.rxTranCnt.Open;
  dm.tTipoActivos.Close;
  dm.tTipoActivos.Filtered:=false;
  dm.tTipoActivos.Open;
  qryCtasCat.Close;
  qryCtasCat.Open;
  dm.qryDepreciacion.Close;
  dm.qryDepreciacion.Filtered:=False;
  dm.qryDepreciacion.Params[0].Value := ExtraerFecha(dtpkfecha.Datetime);
  dm.qryDepreciacion.Params[1].Value := ExtraerFecha(dtpkfecha.Datetime);
  dm.qryDepreciacion.Open;
  SumarValoresDep;
  glbfechainicial:=ExtraerFecha(dtpkfecha.Datetime);
  glbfechafinal  :=ExtraerFecha(dtpkfecha.Datetime);
end;

procedure TfrmContDepreciacion.btnProcesarClick(Sender: TObject);
begin
  dm.qryDepreciacion.First;
  ProgressBar1.Max := dm.qrydepreciacion.RecordCount;
  While not dm.qryDepreciacion.Eof do
  begin
    ProgressBar1.StepIt;
    BuscarAsignarCuenta;
    if Error then
    begin
      {dm.rxTranCnt.Close;
      dm.rxTranCnt.EmptyTable;
      dm.rxTranCnt.Open;}
      btnContabilizar.Enabled := False;
      Break;
    end;
    dm.qryDepreciacion.Next;
  end;
  ProgressBar1.Position:=0;  
  if not Esreporte then
  Begin
    HacerTotales;
    dm.rxTranCnt.Last;
    dm.rxtrancnt.Edit;
    if dm.rxtrancntrxcuenta1.Value = '999' then
    dm.rxtrancntrxcuenta1.Value:='';
    dm.rxtrancnt.Post;
    if not Error then
    btnContabilizar.Enabled:=true;
  end;
  dm.rxTranCnt.SortOnFields('rxCuenta1;rxCuenta2;rxcuenta3',true,false);
  dm.dtRxTranCnt.AutoEdit :=False;
  PageControl1.ActivePage := tabTransacciones;
end;

procedure TfrmContDepreciacion.BuscarAsignarCuenta;
begin
  ProcesaValor(0);//Debitos;
  ProcesaValor(1);//Creditos;
end;

procedure TfrmContDepreciacion.EntradaCnt1Click(Sender: TObject);
begin
  dm.rxTranCnt.Last;
  Agrupar:=True;
  if dm.rxTranCntrxCuenta2.IsNull then
  dm.rxTranCnt.delete;
  if dm.rxTranCnt.RecordCount > 0 then
  dm.rxTranCnt.SortOnFields('rxDebito',true,true);
  qckRepDepAcnt:=TqckRepDepAcnt.Create(nil);
  try
    qckRepDepAcnt.Prepare;
    glbTPag := qckRepDepAcnt.PageNumber;
  finally
  qckRepDepAcnt.QRPrinter.Free;
  qckRepDepAcnt:=nil;
  end;
  qckRepDepAcnt:=TqckRepDepAcnt.Create(nil);
  try
    if Messagedlg('Imprimir?',mtInformation,[mbyes,mbno],0)=mryes then
    begin
      qckRepDepAcnt.PrinterSetup;
      qckRepDepAcnt.Print;
    end else qckRepDepAcnt.Preview;
  finally
  qckRepDepAcnt.free;
  qckRepDepAcnt:=nil;
  end;
end;

procedure TfrmContDepreciacion.HacerTotales;
begin
  dm.rxTranCnt.First;
  debito:=0;
  credito:=0;
  while not dm.rxTranCnt.eof do
  begin
    Debito :=debito+dm.rxtrancntrxdebito.value;
    Credito:=credito+dm.rxtrancntrxCredito.Value;
    dm.rxTranCnt.Next;
  end;
  if (debito > 0) or (credito > 0 ) then
  begin
    dm.rxtrancnt.Insert;
    dm.rxTranCntrxCuenta1.Value:='999';
    dm.rxTranCntrxNumFact.Value:=999999;
    dm.rxTranCntrxDescripcion.Value:='Totales --->';
    dm.rxtrancntrxdebito.value :=Debito;
    dm.rxtrancntrxCredito.Value:=Credito;
    dm.rxtrancnt.Post;
  end;
end;

procedure TfrmContDepreciacion.MoverDatosRxEdit;
begin
  dm.rxTranCnt.Edit;
end;

procedure TfrmContDepreciacion.MoverDatosRxInsert;
begin
  dm.rxTranCnt.Insert;
  dm.rxtrancntrxcuenta1.Value:=StrCta1;
  dm.rxtrancntrxcuenta2.Value:=StrCta2;
  dm.rxtrancntrxcuenta3.Value:=StrCta3;
  dm.rxTranCntrxTipo.Value   := dm.qryDepreciacionTIPO.Value;
  dm.rxTranCntrxCodigo.Value := dm.qryDepreciacionCODIGO.Value;
  dm.rxTranCntrxTipoDesc.Value   := dm.qryDepreciacionTIPO_DESC.Value;
  dm.rxTranCntrxCodigoActivo.Value :=dm.qryDepreciacionCODIGO.AsString;
  dm.rxTranCntrxDescActivo.Value   :=dm.qryDepreciacionDESCRIPCION_ACTIVO.Value;
  dm.rxTranCntrxFecha.Value:=  dm.qryDepreciacionFECHA.Value;
  dm.rxTranCntcod_concepto_cta.Value := dm.tTipoActivosCODIGO_CONCEPTO.Value;
  if qryCtasCat.Locate('cuenta1;cuenta2;cuenta3',
     VarArrayOf([strcta1,strcta2,strcta3]),[]) then
  dm.rxTranCntNombreCuenta.Value := qryCtasCatNOMBRE_CTA.Value
  else dm.rxTranCntNombreCuenta.Value := '*** Error en numero cta***';
  if Agrupar then
  dm.rxTranCntrxNumFact.Value:=StrToInt('8'+FormatDateTime('mmdd',dtpkfecha.date));
  dm.rxTranCntrxDescripcion.Value:='Depreciación '+FormatDateTime('mmm-dd-yyyy',dm.qryDepreciacionFECHA.Value);
end;

procedure TfrmContDepreciacion.MvtosCtas1Click(Sender: TObject);
begin
  EsReporte:=True;
  Agrupar:=False;
  if frmContDepreciacion.Visible then
  begin
    dm.rxTranCnt.close;
    dm.rxTranCnt.EmptyTable;
    dm.rxTranCnt.open;
  end;
  btnProcesarClick(self);
  dm.rxTranCnt.SortOnFields('rxTipo;rxCodigo',True,False);
  dm.rxTranCnt.Last;
  if dm.rxTranCntrxCuenta2.IsNull then
  dm.rxTranCnt.Delete;
  qckRepDepAcntDet:=TqckRepDepAcntDet.Create(nil);
  try
    qckRepDepAcntDet.Prepare;
    glbTPag := qckRepDepAcntDet.PageNumber;
  finally
  qckRepDepAcntDet.QRPrinter.Free;
  qckRepDepAcntDet:=nil;
  end;
  qckRepDepAcntDet:=TqckRepDepAcntDet.Create(nil);
  try
    if Messagedlg('Imprimir?',mtInformation,[mbyes,mbno],0)=mryes then
    begin
      qckRepDepAcnt.PrinterSetup;
      qckRepDepAcnt.Print;
    end else qckRepDepAcntDet.Preview;
  finally
  qckRepDepAcntDet.Free;
  qckRepDepAcntDet:=nil;
  end;
  EsReporte:=False;
  Agrupar  :=true;
  btnDatosClick(Self);
  btnProcesarClick(Self);
end;

procedure TfrmContDepreciacion.PrepararControl(Lfecha: TDatetime);
begin
  if not dm.qryControldet.Locate('fecha_Act',ExtraerFEcha(Lfecha),[]) then
  begin
    dm.qryControldet.Insert;
    dm.qryControlDetFECHA_IN.Value := Now;
    dm.qryControlDetIN_POR.Value := StrUserName;
    dm.stpActSerieCtrl.Close;
    dm.stpActSerieCtrl.ExecProc;
    dm.qryControlDetSERIE.Value:=dm.stpActSerieCtrl.Params[0].value;
    if dm.qryControlDetSERIE.Value = 0 then
    dm.qryControlDetSERIE.Value:=1;
    dm.qryControlDetCOD_CIA.Value:=1;//tropical tours
    dm.qryControlDetSISTEMA.Value:=dm.qryControlSISTEMA.Value;
    dm.qryControlDetSUB_SISTEMA.Value:=dm.qryControlSUB_SISTEMA.Value;
    dm.qryControldetFECHA_ACT.Value:=ExtraerFecha(LFecha);
    dm.qryControldetSTATUS.value := 'A';
    dm.qrycontroldet.Post;
    dm.qrycontroldet.ApplyUpdates;
  end;
end;

procedure TfrmContDepreciacion.PrepararControlM(Sistema,
  SubSistema: Integer; Lfecha: TDatetime);
var
    anio, mes,dia : Word;
begin
  dm.qryControl.Close;          // Depreciacion
  GlBCntSistema := sistema;
  GlbCntSub_sistema:=subsistema;
  GlbCntCod_cia:=1;
  //dm.qrycontrol.Filter:='Sistema = '+IntToStr(sistema)+ //16
  //                        ' And Sub_sistema = '+IntToStr(subsistema)+ //2
  //                        ' And Cod_cia = 2 ';
    dm.qrycontrol.Open;
    dm.qrycontrol.Filtered:=true; //Contabilizar Depreciacion
    Lfecha  := dm.qrycontrolfecha_act.Value;
    DecodeDate(LFecha,Anio, Mes, Dia);
    if Mes = 12 then
    begin
      Inc(Anio);
      Mes:=1;
    end else Inc(Mes);
    LFecha:=Encodedate(Anio,Mes,DiasEnElMes(anio,mes));
    Abortar := True;
    if (ExtraerFecha(dtpkfecha.Date) = ExtraerFecha(Lfecha)) then
    begin
      if dm.qryControlSTATUS.Value = 'A' then //Atualiza fecha
      begin
        dm.qrycontrol.Edit;
        dm.qryControlFECHA_ACT.Value:=ExtraerFecha(dtpkfecha.Date);
        dm.qrycontrol.Post;
        dm.qrycontrol.ApplyUpdates;
        PrepararControl(ExtraerFecha(dtpkfecha.Date));
        Abortar:=false;
        dtpkfecha.date:=dtpkfecha.date + 1;

        dm.qryControl.Close;          // Depreciacion
        GlBCntSistema := 16;
        GlbCntSub_sistema:=1;
        GlbCntCod_cia:=1;
        //dm.qrycontrol.Filter:='Sistema = 16 '+ //16
        //                  ' And Sub_sistema = 1'+ //1 -> Act. Depreciacion
        //                  ' And Cod_cia = 2 ';
        dm.qryControl.open; 
        dm.qrycontrol.Filtered:=true; //Contabilizar Depreciacion
        dm.qrycontrol.Edit;
        dm.qryControlSTATUS.Value := 'A';
        dm.qrycontrol.Post;
        dm.qrycontrol.ApplyUpdates;
      end else
      begin
        MessageDlg('Mes fue cerrado, Verifique',mterror,[mbok],0);
        Abortar:=true;
      end;
    end;
end;

procedure TfrmContDepreciacion.ProcesaValor(codigo:Integer);

begin
  Error:=False;
  if Codigo = 0 then //Debito
  begin
    if dm.tActivoCuenta.Locate('tipo;codigo',
    VarArrayOf([dm.qryDepreciacionTIPO.Value,
                dm.qryDepreciacionCODIGO.Value]),[]) then
    begin
      if dm.tActivoCuentaGrupo.Locate('codigogrupo;cta_origen',
      VarArrayOf([dm.tActivoCuentaCODGRUPOCTA.Value,1]),[]) then
      begin
        StrCta1 := dm.tActivoCuentaGrupocta1.Value;
        StrCta2 := dm.tActivoCuentaGrupocta2.Value;
        StrCta3 := dm.tActivoCuentaGrupocta3.Value;
      end else
      begin
        if Messagedlg('Activo '+dm.qryDepreciacionTIPO.AsString+
        '-'+dm.qryDepreciacionCodigo.Asstring+' no tiene cuenta, Continuar?',mterror,[mbyes,mbno],0) = mrNo then
        Error:=True else Error:=False;
      end;
    end else
    begin
      if Messagedlg('Activo '+dm.qryDepreciacionTIPO.AsString+
      '-'+dm.qryDepreciacionCodigo.Asstring+' no tiene cuenta, Continuar?',mterror,[mbyes,mbno],0) = mrNo then
      Error:=True else Error:=False;
    end;
  end else
  begin   //credito
    if error then exit;
    if dm.tActivoCuenta.Locate('tipo;codigo',
    VarArrayOf([dm.qryDepreciacionTIPO.Value,
                dm.qryDepreciacionCODIGO.Value]),[]) then
    begin
      if dm.tActivoCuentaGrupo.Locate('codigogrupo;cta_origen',
      VarArrayOf([dm.tActivoCuentaCODGRUPOCTA.Value,2]),[]) then
      begin
        StrCta1 := dm.tActivoCuentaGrupocta1.Value;
        StrCta2 := dm.tActivoCuentaGrupocta2.Value;
        StrCta3 := dm.tActivoCuentaGrupocta3.Value;
      end else
      begin
        if Messagedlg('Activo '+dm.qryDepreciacionTIPO.AsString+
        '-'+dm.qryDepreciacionCodigo.Asstring+' no tiene cuenta, Continuar?',mterror,[mbyes,mbno],0) = mrNo then
        Error:=True else Error:=False;
      end;
    end else
    begin
      if Messagedlg('Activo '+dm.qryDepreciacionTIPO.AsString+
      '-'+dm.qryDepreciacionCodigo.Asstring+' no tiene cuenta, Continuar?',mterror,[mbyes,mbno],0) = mrNo then
      Error:=True else Error:=False;
    end;
  end;
  if error then exit;
    if dm.tTipoActivos.Locate('Tipo',dm.qrydepreciaciontipo.Value,[]) then
    begin
      if Agrupar then
      Begin
        if dm.rxTranCnt.Locate('rxCuenta1;rxCuenta2;rxCuenta3',
        VarArrayOf([StrCta1,StrCta2,StrCta3]),[]) then
      begin
        ProcesaValorEdit(codigo);
      end else //rxtrancnt.locate
      begin
        ProcesaValorInsert(codigo);
      end;
    end else ProcesaValorInsert(codigo);
  end;//tTipoActivos.locate
end;

procedure TfrmContDepreciacion.ProcesaValorEdit(codigo: Integer);
begin
  case codigo of
   0: begin
        MoverDatosRxEdit;
        dm.rxTranCntrxDebito.Value :=dm.rxTranCntrxDebito.Value+dm.qryDepreciacionVALOR.Value;
        dm.rxTranCnt.Post;
      end;
   1: Begin
        MoverDatosRxEdit;
        dm.rxTranCntrxCredito.Value :=dm.rxTranCntrxCredito.Value+
        dm.qryDepreciacionVALOR.Value;
        dm.rxTranCnt.Post;
     end;
  end;//case
end;

procedure TfrmContDepreciacion.ProcesaValorInsert(codigo: Integer);
begin
  case codigo of
   0: begin
        MoverDatosRxInsert;
        dm.rxTranCntrxDebito.Value := dm.qryDepreciacionVALOR.Value;
        dm.rxTranCnt.Post;
      end;
   1: Begin
        MoverDatosRxInsert;
        dm.rxTranCntrxCredito.Value :=dm.qryDepreciacionVALOR.Value;
        dm.rxTranCnt.Post;
     end;
  end;//case
end;

procedure TfrmContDepreciacion.RxDBGrid2GetCellProps(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor);
begin
  if dm.rxTranCntrxcuenta2.IsNull then
  Begin
    Background:= $00400080;
    Afont.Color:= clLime;
  end;

end;

procedure TfrmContDepreciacion.SumarValoresDep;
begin
  rxTotalDep.close;
  rxTotalDep.EmptyTable;
  rxTotalDep.open;
  dm.qrydepreciacion.First;
  ProgressBar1.Max := dm.qrydepreciacion.RecordCount;
  dm.qrydepreciacion.DisableControls;
  while not dm.qrydepreciacion.eof do
  begin
    if rxTotalDep.RecordCount = 0 then
    begin
      rxTotalDep.Insert;
      rxTotalDepValor.Value := dm.qrydepreciacionValor.Value;
    end else
    begin
      rxTotalDep.Edit;
      rxTotalDepValor.Value := rxTotalDepValor.Value + dm.qrydepreciacionValor.Value;
    end;
    rxTotalDep.Post;
    ProgressBar1.StepIt;
    dm.qrydepreciacion.Next;
  end;
  ProgressBar1.position:=0;
  dm.qrydepreciacion.First;
  dm.qrydepreciacion.EnableControls;
end;

function TfrmContDepreciacion.VerificarValores: Boolean;
var
  valor:Real;
begin
{  dm.qrydepreciacion.DisableControls;
  dm.qrydepreciacion.first;
  Result:=true;
  while not dm.qrydepreciacion.eof do
  begin
    valor:=dm.qrydepreciacionVALOR.Value;
    if Format('%8.f2',[valor]) <> Format('%8.f2',[dm.qrydepreciacionVALOR.Value]) then
    begin
        Result:=false;
    end;
    dm.qrydepreciacion.Next;
  end;
  dm.qrydepreciacion.first;
  dm.qrydepreciacion.EnableControls;}
end;

procedure TfrmContDepreciacion.dtpkfechaExit(Sender: TObject);
var
  a,m,d:word;
begin
  DecodeDate(dtpkfecha.datetime,a,m,d);
  if d <> DiasEnElMes(a,m) then
  begin
    MessageDlg('El dia tiene que ser el último del mes',mtwarning,[mbok],0);
    dtpkfecha.datetime:=EncodeDAte(a,m,DiasEnElMes(a,m));
  end;
end;

procedure TfrmContDepreciacion.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dm.tActivoCuenta.Close;
  dm.tActivoCuenta.Filtered:=false;
  dm.tActivoCuentaGrupo.Close;
  dm.tActivoCuentaGrupo.Filtered := False;
end;

procedure TfrmContDepreciacion.FormCreate(Sender: TObject);
var
    anio, mes,dia : Word;
begin
  dm.qryNombreActivo.close;
  dm.qryNombreActivo.open;
  dm.qryControl.Close;          // Depreciacion
  GlBCntSistema := 16;
  GlbCntSub_sistema:=2;
  GlbCntCod_cia:=1;
  //dm.qrycontrol.Filter:='Sistema = 16'+ //16
  //                      ' And Sub_sistema = 2'+//2
  //                      ' And Cod_cia = 2 ';
  dm.qrycontrol.Open;
  dm.qrycontrol.Filtered:= True; //Contabilizar Depreciacion
  DecodeDate(ExtraerFecha(dm.qrycontrolfecha_act.Value),Anio, Mes, Dia);
  if Mes = 12 then
  begin
    Inc(Anio);
    Mes := 1;
  end else Inc(Mes);
  dtpkFecha.Datetime:=Encodedate(Anio,Mes,DiasEnElMes(anio,mes));
  dm.qryControldet.Close;
  dm.qryControldet.open;
end;

end.
