//clave de info@cooprac.org
//coopracY@org
unit UContabilizarVentas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UContabilizarformBase, Menus, Grids, DBGrids, RXDBCtrl,
  Db, ComCtrls, StdCtrls, Buttons, RXCtrls, ExtCtrls, WinSkinData, RxMemDS,
  IBCustomDataSet, IBQuery;

type
  TfrmContabilizarVentas = class(TfrmContabilizaDatos)
    Memo1: TMemo;
    DBGridTest: TDBGrid;
    dsqryDatosCampoClave: TDataSource;
    qryviewDatosParaCnt: TIBQuery;
    qryviewDatosParaCntNUMERO: TIntegerField;
    qryviewDatosParaCntSERIE: TIntegerField;
    qryviewDatosParaCntFECHA: TDateTimeField;
    qryviewDatosParaCntOBSERVACION: TIBStringField;
    qryviewDatosParaCntFORMA_PAGO: TSmallintField;
    qryviewDatosParaCntNUMERO_FACTURA: TIntegerField;
    qryviewDatosParaCntNUMERO_DOC_PAGO: TIBStringField;
    qryviewDatosParaCntMONTO_BRUTO: TFloatField;
    qryviewDatosParaCntMONTO_DESCUENTO: TFloatField;
    qryviewDatosParaCntPORC_DESCUENTO_MASTER: TIntegerField;
    qryviewDatosParaCntDESCRIPCION: TIBStringField;
    qryviewDatosParaCntCANTIDAD: TFloatField;
    qryviewDatosParaCntCODIGO_PROD: TIBStringField;
    qryviewDatosParaCntPRECIO: TFloatField;
    qryviewDatosParaCntPORC_DESC_DET: TFloatField;
    qryviewDatosParaCntITBI_DET: TFloatField;
    qryviewDatosParaCntVALOR_SERVICIO_DET: TFloatField;
    qryviewDatosParaCntVALOR_TOTAL_DET: TFloatField;
    qryviewDatosParaCntMONTO_DIETA: TFloatField;
    qryviewDatosParaCntMONTO_AJUSTE: TFloatField;
    qryviewDatosParaCntPRECIO_COMPRA: TFloatField;
    qryviewDatosParaCntCOSTO_PRODUCTO: TFloatField;
    dsqryviewDatosParaCnt: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure btnDatosClick(Sender: TObject);
    procedure btnProcesarClick(Sender: TObject);
    procedure btnContabilizarClick(Sender: TObject);
    procedure dtpkfechaExit(Sender: TObject);
  private
    procedure PrepararDatos;
    procedure ProcDatos;
    procedure HacerTotales;
    function procPreparaCampootro(xnum : Integer):Boolean;

  public
     nombretablaacnt : String;
     esVentaCredito : Boolean;
  end;

var
  frmContabilizarVentas: TfrmContabilizarVentas;

implementation

uses UDatModCxc, UGlobal, UDatModControl, UDatModDistCNT,
  UDistCntGestorProd;

{$R *.dfm}

procedure TfrmContabilizarVentas.FormCreate(Sender: TObject);
var 
 lfecha: TDatetime;
 lstatus: String;
begin
  //inherited;
  dmcxc.tCtaTipoCntd.Close;
  dmcxc.tCtaTipoCntd.filtered:=false;
  dmcxc.tCtaTipoCntd.Open;
  dmControl.qryControl.Close;

  dmControl.qrycontrol.Open;
  if Not dmControl.qrycontrol.Locate('SISTEMA;SUB_SISTEMA;COD_CIA', VarArrayOf([SISTEMA_CNT, SUBSISTEMA_CNT, GLBCODIGO_CIA]),[]) then
  MessageDlg('Codigo sistema no encontrado en tabla control, verifique', mtInformation, [mbOK], 0);
  dtpkfecha.Date:= ExtraerFecha(dmControl.qryControlFECHA_ACT.Value) + 1;
  dmControl.qryControl.Close;
end;

procedure TfrmContabilizarVentas.btnDatosClick(Sender: TObject);
var
  lfecha :TDatetime;
  lstatus:String;
  nError:Boolean;
begin
  //inherited;

  Actualizar:=False;
  //if nError then
  //begin
  //  MessageDlg('Existe una o mas transacciones con número nulo o igual cero'+
  //             'Verifique',mtError,[mbok],0);
  //  Exit;
  //end;
  pagecontrol1.ActivePage := TabSheet1;
  btnProcesar.Enabled := True;
  dmcxc.rxTranCnt.Close;
  dmcxc.rxTranCnt.EmptyTable;
  dmcxc.rxTranCnt.Open;

  //dmDistCnt.qryDistCnt.Close;
  //dmDistCnt.qryDistCnt.Params[0].Value:=nombretablaacnt;//cntTabla;//'CONTRATO_CIERRE';
  //dmDistCnt.qryDistCnt.Open;

  Glbfechainicial  :=dtpkfecha.Date;
  Glbfechafinal    :=dtpkfecha.Date;
  btnprocesar.Enabled := True;
  if EsReporte then Exit;
  qryviewDatosParaCnt.Close;
  qryviewDatosParaCnt.Params[0].Value:= ExtraerFecha(dtpkfecha.Date);
  qryviewDatosParaCnt.Open;
  PrepararDatos;
  btnProcesarClick(Self);
  PageControl1.TabIndex:=1;
  //t dmTransCnt.ibsqlUpdateStatusContrato.SQL.Text:=
  //t 'Update '+ nombretablaacnt + ' Set status_cnt ='+chr(39)+'R'+chr(39) +
  //t ' Where numero = '+EditN3.Text;
  //t if Not dmTransCnt.ibsqlUpdateStatusContrato.Prepared then
  //t dmTransCnt.ibsqlUpdateStatusContrato.Prepare;

end;

procedure TfrmContabilizarVentas.PrepararDatos;
var
  campos : String;
  strcampokey : string;
  x, y : Integer;
  strFecha : String;
  d,m,yy : word;
begin
 {dmDistCnt.qryDistCnt.Close;
  dmDistCnt.qryDistCnt.Params[0].Value:=nombretablaacnt;//cntTabla;//'CONTRATO_CIERRE';
  dmDistCnt.qryDistCnt.Open;
  dmDistCnt.qryDistCnt.First;
  Memo1.Lines.Clear;
  Campos:='';
  y:=0;
  While Not dmDistCnt.qryDistCnt.Eof Do
  begin
    Inc(y);
    if (dmDistCnt.qryDistCntNOMBRE_CAMPO.Value <> '') then
    Campos:=Campos + dmDistCnt.qryDistCntNOMBRE_CAMPO.Value + ',';
    dmDistCnt.qryDistCnt.Next;
  end;
  if Length(Campos) > 0 then
  begin
    Campos := RemoverCaracter(Campos,'');
    DecodeDate(dtpkfecha.Date,yy,m,d);
    strFecha := IntToStr(m)+'-'+IntToStr(d)+'-'+IntToStr(yy);
    Memo1.Lines.Add('Select '+ Campos);
    Memo1.Lines.Add(' From '  + Trim(dmDistCnt.qryDistCntNOMBRE_TABLA.Value));
    //Memo1.Lines.Add(' Where Status_cnt is null ');
    Memo1.Lines.Add(' Where  FECHA = ' + chr(39) + strFecha + chr(39));
    dmDistCnt.qryDatosAContabilizar.Close;
    dmDistCnt.qryDatosAContabilizar.SQL.Text := Memo1.Text;
    dmDistCnt.qryDatosAContabilizar.Open;
  end;}
end;

procedure TfrmContabilizarVentas.ProcDatos;
var
  xmonto  : Extended;
  fCampos : TField;
  NombreCampo : string;
begin
  GlbDescTipoCNT := 'Transacccion Ventas';
  {dmDistCnt.rxDatosTransCnt.Close;
  dmDistCnt.rxDatosTransCnt.Open;
  dmCxc.rxTranCnt.Close;
  dmCxc.rxTranCnt.Open;
  dmDistCnt.qryDatosAContabilizar.First;
  dmDistCnt.qryDistCnt.First;
  progressbar1.Max := dmDistCnt.qryDistCnt.RecordCount;

  While Not dmDistCnt.qryDistCnt.Eof Do
  begin
    //if dmDistCnt.qryDistCntCTA1.IsNull Or (dmDistCnt.qryDistCntCTA1.Value = '000') then
    //begin
    //  dmDistCnt.qryDistCnt.next;
    //  continue;
    //end;
    dmDistCnt.rxDatosTransCnt.Insert;
    dmDistCnt.rxDatosTransCntcta1.Value := dmDistCnt.qryDistCntCTA1.Value;
    dmDistCnt.rxDatosTransCntcta2.Value := dmDistCnt.qryDistCntCTA2.Value;
    dmDistCnt.rxDatosTransCntcta3.Value := dmDistCnt.qryDistCntCTA3.Value;

    dmCxc.rxTranCnt.Insert;
    dmCxc.rxTranCntrxFecha.Value   := ExtraerFecha(GlbFechaTrnDiaria);
    dmCxc.rxTranCntrxCuenta1.Value := dmDistCnt.qryDistCntCTA1.Value;
    dmCxc.rxTranCntrxCuenta2.Value := dmDistCnt.qryDistCntCTA2.Value;
    dmCxc.rxTranCntrxCuenta3.Value := dmDistCnt.qryDistCntCTA3.Value;
    //dmDistCnt.qryDistCntSerie.Value;
    dmCxc.rxTranCntrxDescripcion.Value := 'Venta';  


      if (dmDistCnt.qryDistCntNOMBRE_CAMPO.Value <> '') then
      if (dmDistCnt.qryDistCntORIGEN.Value = 1) then //Debito
      begin
        if (dmDistCnt.qryDistCntCNT.Value = 1) then
        begin
          NombreCampo:= trim(dmDistCnt.qryDistCntNOMBRE_CAMPO.Value);
          NombreCampo := StringReplace(NombreCampo,'_DB','',[rfIgnoreCase]);
          dmDistCnt.rxDatosTransCntDebito.Value:= dmDistCnt.qryDatosAContabilizar.FieldByName(NombreCampo).AsFloat;
          dmCxc.rxTranCntrxDebito.Value := dmDistCnt.qryDatosAContabilizar.FieldByName(NombreCampo).AsFloat;
          //dmCxc.rxTranCntSerieCampoClave.Value := dmDistCnt.qryDistCntSERIE.Value;
        end;
        //dmDistCnt.qryDatosAContabilizar.FieldByName(dmDistCnt.qryDistCntSERIE.).AsInteger;
      end else
      begin
        if (dmDistCnt.qryDistCntCNT.Value = 1) then
        begin
          NombreCampo:= trim(dmDistCnt.qryDistCntNOMBRE_CAMPO.Value);
          NombreCampo := StringReplace(NombreCampo, '_CR','', [rfIgnoreCase]);
          dmDistCnt.rxDatosTransCntCredito.Value := dmDistCnt.qryDatosAContabilizar.FieldByName(NombreCampo).AsFloat;
          dmCxc.rxTranCntrxCredito.Value := dmDistCnt.qryDatosAContabilizar.FieldByName(NombreCampo).AsFloat;
          dmCxc.rxTranCntSerieCampoClave.Value := dmDistCnt.qryDistCntSERIE.Value;
        end;
        //dmDistCnt.qryDatosAContabilizar.FieldByName(trim(dmDistCnt.qryDistCntSerie.Value)).Value;
      end;

    if (dmCxc.rxTranCntrxdebito.IsNull Or (dmCxc.rxTranCntrxDebito.Value = 0)) And
       (dmCxc.rxTranCntrxcredito.IsNull Or (dmCxc.rxTranCntrxcredito.Value = 0)) Then
    dmCxc.rxTranCnt.Cancel;
    if dmCxc.rxTranCnt.State In [dsEdit, dsInsert] then
    dmCxc.rxTranCnt.Post;
    if (dmDistCnt.qryDistCntNOMBRE_CAMPO.Value <> '') then
    dmDistCnt.rxDatosTransCnt.Post else
    dmDistCnt.rxDatosTransCnt.Cancel;
    //if (dmDistCnt.qryDistCntNOMBRE_CAMPO.Value = '') then
    //ProcDatosCompuesto(IntToStr(NumeroContratoACnt));
    dmDistCnt.qryDistCnt.Next;
  end;
  HacerTotales;}
end;

procedure TfrmContabilizarVentas.HacerTotales;
begin
  if dmcxc.rxTranCnt.state = dsBrowse then
  dmcxc.rxTranCnt.First;
  rxTotalesT.Close;
  rxTotalesT.Open;
  debito:=0;
  credito:=0;
  dmcxc.rxTranCnt.First;
  while not dmcxc.rxTranCnt.eof do
  begin
    Debito :=debito+dmcxc.rxtrancntrxdebito.Value;
    Credito:=credito+dmcxc.rxtrancntrxCredito.Value;
    dmcxc.rxTranCnt.Next;
  end;
  if (debito > 0) or (credito > 0 ) then
  begin
    dmcxc.rxtrancnt.Append;
    dmcxc.rxTranCntrxCuenta1.Value    := '9999999';
    dmcxc.rxTranCntrxNumFact.Value    := 999999;
    dmcxc.rxTranCntrxDescripcion.Value:= 'Totales --->';
    dmcxc.rxtrancntrxdebito.value :=Debito;
    dmcxc.rxtrancntrxCredito.Value:=Credito;
    dmcxc.rxtrancnt.Post;
  end;
  rxTotalesT.Edit;
  rxTotalesTDiferencia.value := Abs(debito - credito);
  rxTotalesT.Post;
  btnContabilizar.Enabled:=True;
  if (rxTotalesTDiferencia.value > 0.004) then
  begin
    dbgrid1.Color:=clRed;
    btnContabilizar.Enabled:=false;
  end else dbgrid1.Color:=$0080FFFF;
  dmcxc.rxtrancnt.SortOnFields('rxCuenta1',true,false);
end;

procedure TfrmContabilizarVentas.btnProcesarClick(Sender: TObject);
var
  tempo : extended;
begin
  //inherited;
  frmPrepararDatosCnt:=TfrmPrepararDatosCnt.Create(nil);

  GlbDescTipoCNT := 'Transaccción Ventas';
  dmDistCnt.rxDatosTransCnt.Close;
  dmDistCnt.rxDatosTransCnt.Open;
  //dmCxc.rxTranCnt.Close;
  //dmCxc.rxTranCnt.Open;
  dmCxc.rxTranCnt.Close;
  dmCxc.rxTranCnt.Open;
  GlbDescTipoCNT := 'Transaccción Ventas';
  tempo := dmcxc.rxTranCntrxDebito.Value;
  frmPrepararDatosCnt.Show;
  frmPrepararDatosCnt.DateEdit1.Date:=dtpkfecha.Date;
  {
  1	1	Venta al Contado  1	1	Venta al Contado 1	1	Venta al Contado
  1	1	Venta al Contado  2	1	Promocion 3	1	Devolucion
  4	1	Venta a Credito   4	1	Venta a Credito
  }
  if not esVentaCredito then
  frmPrepararDatosCnt.FTipoTRN      := 1 //Venta al Contado
  else
  frmPrepararDatosCnt.FTipoTRN      := 4;
  if not esVentaCredito then
  frmPrepararDatosCnt.esVentaCash:= True
  else
  frmPrepararDatosCnt.esVentaCash:= False;
  frmPrepararDatosCnt.ProcDatos(dmCxc.rxTranCnt);

  frmPrepararDatosCnt.Close;
  frmPrepararDatosCnt.Free;
  frmPrepararDatosCnt:=Nil;
  HacerTotales;
  //t ProcDatos;
end;

procedure TfrmContabilizarVentas.btnContabilizarClick(Sender: TObject);
begin
  inherited;
  //
  btnContabilizar.Enabled:=False;
end;

function TfrmContabilizarVentas.procPreparaCampootro(xnum : Integer):Boolean;
var
  campos : string;
begin
  Memo1.Clear;
  dmDistCnt.qryCampoClave.Close;
  dmDistCnt.qryCampoClave.params[0].Value:= xnum;
  dmDistCnt.qryCampoClave.Open;
  dmDistCnt.qryCampoClave.First;
  While Not dmDistCnt.qryCampoClave.Eof Do
  begin
    if (dmDistCnt.qryCampoClaveNOMBRE_CAMPO.Value <> '') then
    Campos:=Campos + dmDistCnt.qryCampoClaveNOMBRE_CAMPO.Value + ',';
    dmDistCnt.qryCampoClave.Next;
  end;
  if Length(Campos) > 0 then
  begin
  Campos := RemoverCaracter(Campos,'');
  Memo1.Lines.Add('Select '+ Campos);
  Memo1.Lines.Add(' From ' + Trim(dmDistCnt.qryCampoClaveNOMBRE_TABLA.Value));
  Memo1.Lines.Add(' Where '+ Trim(dmDistCnt.qryCampoClaveCAMPO_CLAVE.Value));
  Memo1.Lines.Add(' =:codigo');
  dmDistCnt.qryDatosCampoClave.Sql.Text := Memo1.Text;
  result := true;
  end else
  result := false;
end;

procedure TfrmContabilizarVentas.dtpkfechaExit(Sender: TObject);
begin
  inherited;
  //
end;

end.
