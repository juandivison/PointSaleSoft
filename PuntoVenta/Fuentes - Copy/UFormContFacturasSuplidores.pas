unit UFormContFacturasSuplidores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, ComCtrls, StdCtrls, Buttons,
  ExtCtrls, RXDBCtrl, Grids, DBGrids, WinSkinData, Menus, RXCtrls;

type
  TfrmContFacturasSuplidores = class(TForm)
    qryDatosFacturas: TIBQuery;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    btnContabilizar: TBitBtn;
    BitBtn2: TBitBtn;
    dtpkFecha: TDateTimePicker;
    ProgressBar1: TProgressBar;
    PageControl1: TPageControl;
    tabDatos: TTabSheet;
    ProgressBar2: TProgressBar;
    tabTranprev: TTabSheet;
    RxDBGrid1: TRxDBGrid;
    tabTrancnt: TTabSheet;
    DBGrid3: TDBGrid;
    SkinData1: TSkinData;
    dsqryDetTrnCnt: TDataSource;
    dsqryDatosFacturas: TDataSource;
    RxDBGrid2: TRxDBGrid;
    qryDatosFacturasSERIE: TIntegerField;
    qryDatosFacturasNUMERO: TIntegerField;
    qryDatosFacturasCIA_KEY: TIntegerField;
    qryDatosFacturasMONEDA: TIBStringField;
    qryDatosFacturasTIPO: TSmallintField;
    qryDatosFacturasCODIGO_PROV: TSmallintField;
    qryDatosFacturasFECHA: TDateTimeField;
    qryDatosFacturasFECHA_VENCE: TDateTimeField;
    qryDatosFacturasCOD_CENTRO_COSTO: TSmallintField;
    qryDatosFacturasPORC_DESCUENTO: TFloatField;
    qryDatosFacturasTIPO_CF: TIBStringField;
    qryDatosFacturasNUMERO_NCF: TIBStringField;
    qryDatosFacturasDESCRIPCION: TIBStringField;
    qryDatosFacturasMONTO_FACT: TFloatField;
    qryDatosFacturasRCXP: TIBStringField;
    qryDatosFacturasRCNT: TIBStringField;
    qryDatosFacturasSTATUS: TIBStringField;
    qryDatosFacturasNOMBREPROVEEDOR: TIBStringField;
    qryDatosFacturasCUENTAXPAGAR: TIBStringField;
    qryDatosFacturasDESCTIPOPROVEEDOR: TIBStringField;
    qryDatosFacturasCUENTACNT: TIBStringField;
    qryDatosFacturasDEBITO: TFloatField;
    qryDatosFacturasCREDITO: TFloatField;
    qryDatosFacturasCUENTA_GASTO: TIBStringField;
    qryDatosFacturasDESCCENTROCOSTO: TIBStringField;
    RxSpeedButton1: TRxSpeedButton;
    PopupMenu1: TPopupMenu;
    EntradaCnt1: TMenuItem;
    MvtosCtas1: TMenuItem;
    qryDatosFacturasMONTO_ITBIS: TFloatField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnContabilizarClick(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
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
  frmContFacturasSuplidores: TfrmContFacturasSuplidores;
  ValorServicio, debito,credito : Real;
  Agrupar : Boolean = True;
  Abortar : Boolean = False;
  cta1, cta2, cta3 : String;

implementation

uses UDatModConectar,Uglobal, UDatModControl, UDatModCxc, UDatModCheques,
  UDatamodulocnt, URepListadoACnt, URepMvCtaCntDet;

{$R *.dfm}

{ TfrmContCheques }

procedure TfrmContFacturasSuplidores.ActControlDet;
begin
  if not dmControl.qryControldet.Locate('fecha_Act', ExtraerFecha(dtpkfecha.Date), []) then
  begin
    dmControl.qryControldet.Insert;
    dmControl.qryControlDetFECHA_IN.Value := Now;
    dmControl.qryControlDetIN_POR.Value := strUserName;
    dmControl.qryControlDetCOD_CIA.Value:= 1;//temp
    dmControl.qryControlDetSISTEMA.Value:= dmControl.qryControlSISTEMA.Value;
    dmControl.qryControlDetSUB_SISTEMA.Value:= dmControl.qryControlSUB_SISTEMA.Value;
    dmControl.qryControldetFECHA_ACT.Value  := ExtraerFecha(dtpkfecha.date);
    dmControl.qryControldetSTATUS.value     := 'A';
    GlbSalvarQuery(dmControl.qryControlDet);
  end;
end;

procedure TfrmContFacturasSuplidores.ActControlSinDatos;
begin
  dmControl.qryControl.edit;
  dmControl.qrycontrolfecha_Act.Value:= ExtraerFecha(dtpkfecha.Date);
  dmControl.qryControl.post;
  dmControl.qryControl.ApplyUpdates;
  ActControlDet;
  GlbSalvarQuery(dmControl.qryControl);
end;

procedure TfrmContFacturasSuplidores.HacerTotales;
begin
  dmcxc.rxTranCnt.First;
  debito:=0;
  credito:=0;
  While Not dmcxc.rxTranCnt.Eof Do
  begin
    Debito :=debito+dmcxc.rxtrancntrxdebito.value;
    Credito:=credito+dmcxc.rxtrancntrxCredito.Value;
    dmcxc.rxTranCnt.Next;
  end;
  dmcxc.rxtrancnt.SortOnFields('rxdebito;rxCuenta1', true, true);
  dmcxc.rxTranCnt.Last;
  if (debito > 0) Or (credito > 0 ) then
  begin
    dmcxc.rxtrancnt.Append;
    dmcxc.rxTranCntrxCuenta1.Value    := '9999999';
    dmcxc.rxTranCntrxDescripcion.Value:= 'Totales --->';
    dmcxc.rxtrancntrxdebito.value     := Debito;
    dmcxc.rxtrancntrxCredito.Value    := Credito;
    dmcxc.rxtrancnt.Post;
  end;
  //dmcxc.rxtrancnt.SortOnFields('rxDebito;rxcuenta1', True, True);

  //dmcxc.rxtrancnt.SortOnFields('rxcuenta1', True, False);
end;

procedure TfrmContFacturasSuplidores.OrganizaDatos;
begin
  dmcxc.rxTranCnt.close;
  dmcxc.rxTranCnt.EmptyTable;
  dmcxc.rxTranCnt.Open;
  qryDatosFacturas.First;
  qryDatosFacturas.DisableControls;
  While Not qryDatosFacturas.Eof do
  begin
    progressbar1.StepIt;
    Caption:= 'Procesando facturas suplidores...';
    dmcxc.rxTranCnt.Insert;
    cta1:='';
    cta2:='';
    cta3:='';
    GlbAsignaCuenta(qryDatosFacturasCUENTACNT.Value, cta1, cta2, cta3);
    dmcxc.rxTranCntCUENTA123.Value := qryDatosFacturasCUENTACNT.Value;
    if (cta3 = '') then btnContabilizar.Enabled:=False;
    dmcxc.rxtrancntrxcuenta1.Value := cta1;
    dmcxc.rxtrancntrxcuenta2.Value := cta2;
    dmcxc.rxtrancntrxcuenta3.Value := cta3;
    dmcxc.rxTranCntrxFecha.Value   := ExtraerFecha(qryDatosFacturasfecha.Value);
    dmcxc.rxTranCntrxDebito.Value  := qryDatosFacturasdebito.Value;
    dmcxc.rxTranCntrxCredito.Value := qryDatosFacturasCredito.Value;
    {if (qryDatosFacturasSTATUS.Value = 'N') Or (qryDatosFacturasSTATUS.Value = 'C') then
    begin
      dmcxc.rxTranCntrxDescripcion.Value:= 'Cheque Nulo';
      if dmcks.qryBancos.Locate('CODIGO', qryDatosFacturascod_banco.Value,[]) then
      begin
        dmcxc.rxtrancntrxcuenta1.Value := dmcks.qryBancosDetCUENTA1.Value;
        dmcxc.rxtrancntrxcuenta2.Value := dmcks.qryBancosDetCUENTA2.Value;
        dmcxc.rxtrancntrxcuenta3.Value := dmcks.qryBancosDetCUENTA3.Value;
      end else
      begin
        MessageDlg('Cheque nulo, Codigo banco no encontrado, verifique',mterror,[mbok],0);
        Break;
      end;
    end else}
    {if (qryDatosFacturasNOMBRE_CLIENTE.Value = 'RetencionDGII') then
    dmcxc.rxTranCntrxDescripcion.Value:= '2% Retención DGII'
    else
    if (qryDatosFacturasNOMBRE_CLIENTE.Value = 'PorcientoComision') then
    dmcxc.rxTranCntrxDescripcion.Value:= '10% Comisión'
    else }
    dmcxc.rxTranCntrxDescripcion.Value:= qryDatosFacturasDESCRIPCION.Value;//qryDatosFacturasNOMBREPROVEEDOR.Value;//Beneficiario.Value;
    dmcxc.rxTranCntrxNumfact.Value    := qryDatosFacturasNUMERO.Value;
    dmcxc.rxTranCntCod_concepto_cta.Value := qryDatosFacturasCOD_CENTRO_COSTO.Value;
    //dmcxc.rxTranCntrxCodDepto.Value := qryDatosFacturasCOD_.AsString;
    //dmcxc.rxTranCntCentroCosto.Value:= qryDatosFacturasCOD_COSTO.Value;
    if Not qryDatosFacturasCUENTACNT.IsNull then
    dmcxc.rxTranCntNombreCuenta.Value:= GetNombreCuenta(qryDatosFacturasCUENTACNT.Value);
    dmcxc.rxTranCntDESCSERV.Value    := qryDatosFacturasDESCCENTROCOSTO.Value;
    //dmcxc.rxTranCntrxDescripcion.Value := qryDatosFacturasNOMBREPROVEEDOR.Value;
    dmcxc.rxTranCntrxCodDepto.Value:='2';
    dmcxc.rxTranCnt.Post;
{   end;//locate}
    qryDatosFacturas.Next;
  end;//while not eof qryDatosFacturas
  qryDatosFacturas.EnableControls;
  Caption:= 'Contabilizar Facturas Suplidores';
  HacerTotales;
  btncontabilizar.Enabled:=True;
end;

procedure TfrmContFacturasSuplidores.VerificaControl;
var
  tfecha : TDatetime;
begin
  dmControl.qryControl.Close;
  dmControl.qryControl.Filtered:= False;  //cheques
  dmControl.qryControl.Open;
  dmControl.qryControl.Locate('Sistema;sub_sistema;cod_cia', VarArrayof([18,3,1]),[]);

  tFecha:=dmControl.qrycontrolfecha_act.Value + 1;
  if dmControl.qrycontrolstatus.value = 'F' then
  Begin
    Beep;
    MessageDlg('Mes Cerrado,verifique', mtError, [mbok],0);
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
end;

procedure TfrmContFacturasSuplidores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmControl.qrycontrol.close;
end;

procedure TfrmContFacturasSuplidores.FormCreate(Sender: TObject);
var
  x:boolean;
 lfecha:tdatetime;
 lstatus:string;
begin
  x:=GlbVerificaControl(18,3,GlbCodigoCia,Extraerfecha(date),lfecha,lstatus);
  dtpkfecha.date:=lfecha;
  dtpkfecha.date:= dtpkfecha.date + 1;
  dmCxc.RxTranCnt.Close;
  dmCnt.qryDetTrnCnt.Close;  
end;

procedure TfrmContFacturasSuplidores.BitBtn1Click(Sender: TObject);
var 
  lfecha : TDatetime;
  lstatus: String;
begin
  pagecontrol1.ActivePage:=tabDatos;
  dmcks.qrybancos.Close;
  dmcks.qrybancos.Filtered:=False;
  dmcks.qrybancos.Open;
  qryDatosFacturas.Close;
  qryDatosFacturas.Params[0].Value  := ExtraerFecha(dtpkFecha.Date);
  qryDatosFacturas.Open;
  progressbar1.Position := 0;
  progressbar1.Max := qryDatosFacturas.RecordCount;
  if not GlbVerificaControl(18, 3, GlbCodigoCia, Extraerfecha(dtpkfecha.Date), lfecha, lstatus) then
  begin                             
    MessageDlg('Dia cerrado o fecha equivocada, verifique', mtError, [mbOk], 0);
  end else
  OrganizaDatos;
  pagecontrol1.ActivePage:=tabTranprev;
  progressbar1.Position:=0; 
end;

procedure TfrmContFacturasSuplidores.btnContabilizarClick(Sender: TObject);
var
  strdbito, strcredito:String;
  _done : Boolean;
  _invalido : Boolean;
begin
  _done:=False;
  VerificaControl;
  if qryDatosFacturas.RecordCount = 0 then
  begin
    ActControlSinDatos;
    dtpkFecha.date := dtpkFecha.Date + 1;
  end;
  btnContabilizar.Enabled := False;
  if (not dmcxc.rxTranCnt.Active) OR (dmcxc.rxTranCnt.RecordCount = 0) then
  exit;
  dmcxc.rxTranCnt.First;
  strdbito:= Format('%8.f2', [Debito]);
  strcredito:= Format('%8.f2', [Credito]);
  if strDbito <> strCredito then
  begin
    MessageDlg('Transacción no cuadra, verifique',mtError,[mbOk],0);
    Exit;
  end;
  dmCnt.qryMastertrncnt.close;
  dmCnt.qryMastertrncnt.Params[0].Value := ExtraerFecha(dtpkfecha.Date);
  dmCnt.qryMastertrncnt.Params[1].Value := ExtraerFecha(dtpkfecha.Date);
  dmCnt.qryMastertrncnt.Open;
  dmCnt.qryMastertrncnt.Insert;
  dmCnt.qryMastertrncntCIA_KEY.Value := GlbCodigoCia;
  dmCnt.qryMastertrncntTIPO_DOC.Value:= 7;//Entrada
  dmCnt.qryMastertrncntSTATUS.Value := 'A';
  dmCnt.qryMastertrncntFECHA.Value  := dmcxc.rxTranCntrxFecha.Value;
  dmCnt.qryMastertrncntMONTO.Value  := debito;
  dmCnt.qryMastertrncntDESCRIPCION.Value:= 'Facturas Suplidores '+ FormatDatetime('mmm-dd-yyyy',dmcxc.rxTranCntrxFecha.value);
  dmCnt.qryMastertrncntFECHA_IN.Value:= Now;
  dmCnt.qryMastertrncntIN_POR.Value  := StrUserName;
  dmCnt.qryMastertrncnt.Post;
  dmCnt.qryMastertrncnt.ApplyUpdates;
  progressbar1.position:= 0;
  progressbar1.Max     := dmcxc.rxTranCnt.Recordcount;

  _invalido := false;
  dmcxc.rxTranCnt.First;
  while not dmcxc.rxTranCnt.Eof do
  begin
    if (
         (Length(dmcxc.rxTranCntrxCuenta1.Value) = 0)  OR
         (Length(dmcxc.rxTranCntrxCuenta2.Value) = 0) OR
         (Length(dmcxc.rxTranCntrxCuenta3.Value) = 0)
        ) then
    begin
      _invalido := True;
      MessageDlg('Hay detalles sin cuentas, verifique.', mtError,[mbOk],0);
      Break;
    end;
    dmcxc.rxTranCnt.Next;
  end;
  if _invalido then
  begin

  end;
  dmcxc.rxTranCnt.First;
  While Not dmcxc.rxTranCnt.Eof Do
  begin
    progressbar1.StepIt;
    if Not dmcxc.rxtrancntrxcuenta2.IsNull then
    begin
      dmCnt.qryDetTrnCnt.Insert;
      dmCnt.qryDetTrnCntSTATUS.Value:='A';
      dmCnt.qryDetTrnCntNUMERO.Value:=dmCnt.qryMastertrncntnumero.Value;
      dmCnt.qryDetTrnCntDESCRIPCION_TRN.Value:= dmcxc.rxTranCntrxDescripcion.Value;
      dmCnt.qryDetTrnCntCUENTA1.Value:=dmcxc.rxTranCntrxCuenta1.Value;
      dmCnt.qryDetTrnCntCUENTA2.Value:=dmcxc.rxTranCntrxCuenta2.Value;
      dmCnt.qryDetTrnCntCUENTA3.Value:=dmcxc.rxTranCntrxCuenta3.Value;
      dmCnt.qryDetTrnCntDEBITO_TRN.Value  :=dmcxc.rxTranCntrxDebito.Value;
      dmCnt.qryDetTrnCntCREDITO_TRN.Value :=dmcxc.rxTranCntrxCREDITO.Value;
      dmCnt.qryDetTrnCntCODIGO_DEPTO.Value:=0;//temporal -> Ventas
      dmCnt.qrydettrncntnum_doc.Value     :=dmcxc.rxtrancntrxnumfact.value;
      dmCnt.qryDetTrnCntCODIGO_DEPTO.Value:= dmcxc.rxTranCntrxCodDepto.AsInteger;
      dmCnt.qryDetTrnCntCODIGO_CENTRO_COSTO.Value:= dmcxc.rxTranCntCentroCosto.Value;
      dmCnt.qryDetTrnCntCOD_CTA_CONCEPTO.Value   := dmcxc.rxTranCntcod_concepto_cta.Value;

      GlbSalvarQuery(dmCnt.qryDetTrnCnt);
    end;//not null
    dmcxc.rxTranCnt.Next;
  end;//while
  try
    if dmCnt.qryDetTrnCnt.UpdatesPending then
    dmCnt.qryDetTrnCnt.ApplyUpdates;
    if dmCnt.qryMastertrncnt.UpdatesPending then
    dmCnt.qryMastertrncnt.ApplyUpdates;
    dmControl.qrycontrol.Edit;
    dmControl.qrycontrolfecha_Act.Value:= ExtraerFecha(dtpkfecha.Date);
    dmControl.qrycontrol.Post;
    dmControl.qrycontrol.ApplyUpdates;
    ActControlDet;
    GlbSalvarQuery(dmControl.qrycontrol);
    dtpkFecha.date:=dtpkFecha.Date+1;
    _done:=True;
  except
  End;
  if (_done) then
  begin
    MessageDlg('Proceso terminado',mtInformation,[mbok],0);
    //dmCnt.rxTotalCXPChofer.Close;
    dmCxc.RxTranCnt.Close;
    //dmCnt.qryDetTrnCnt.Close;
  end;
  Pagecontrol1.ActivePage:=tabDatos;
  Progressbar1.Position  := 0;
end;

procedure TfrmContFacturasSuplidores.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if dmcxc.rxTranCntrxcuenta2.IsNull then
  Begin
    Background:= $00400080;
    Afont.Color:= clLime;
  end
end;

procedure TfrmContFacturasSuplidores.EntradaCnt1Click(Sender: TObject);
begin
  qckListadoAcnt:=TqckListadoAcnt.Create(Nil);
  try
    qckListadoAcnt.Preview;
  finally
  qckListadoAcnt.Free;
  qckListadoAcnt:=Nil;
  end;
end;

procedure TfrmContFacturasSuplidores.MvtosCtas1Click(Sender: TObject);
begin
  qckListMvCtacntDet:=TqckListMvCtacntDet.Create(Nil);
  try
    qckListMvCtacntDet.Preview;
  finally
  qckListMvCtacntDet.Free;
  qckListMvCtacntDet:=Nil;
  end;
end;

end.
