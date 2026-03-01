unit UContabilizarCostosYGastos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UContabilizarformBase, Menus, Grids, DBGrids, RXDBCtrl,
  Db, ComCtrls, StdCtrls, Buttons, RXCtrls, ExtCtrls, WinSkinData, RxMemDS,
  IBCustomDataSet, IBQuery;

type
  TfrmContabilizarCostosYGastos = class(TfrmContabilizaDatos)
    Memo1: TMemo;
    DBGridTest: TDBGrid;
    dsqryDatosCampoClave: TDataSource;
    SkinData1: TSkinData;
    qryviewDatosParaCnt: TIBQuery;
    dsqryviewDatosParaCnt: TDataSource;
    qryviewDatosParaCntSERIE: TFloatField;
    qryviewDatosParaCntNUMERO: TIntegerField;
    qryviewDatosParaCntCOD_SERV_PROD: TIntegerField;
    qryviewDatosParaCntDEPARTAMENTO: TIntegerField;
    qryviewDatosParaCntOBSERVACION: TIBStringField;
    qryviewDatosParaCntCANTIDAD: TFloatField;
    qryviewDatosParaCntPRECIO: TFloatField;
    qryviewDatosParaCntVALOR: TFloatField;
    qryviewDatosParaCntNUMERO_DOCUMENTO: TIntegerField;
    qryviewDatosParaCntNUMERO_FACTURA: TIntegerField;
    qryviewDatosParaCntCOD_CTA_CONCEPTO: TIntegerField;
    qryviewDatosParaCntCODIGO_USUARIO: TIntegerField;
    qryviewDatosParaCntSTATUS: TIBStringField;
    qryviewDatosParaCntCIA_KEY: TIntegerField;
    qryviewDatosParaCntFECHA: TDateTimeField;
    qryviewDatosParaCntCOD_PROVEEDOR: TIntegerField;
    qryviewDatosParaCntNOMBRE_PROVEEDOR: TIBStringField;
    qryviewDatosParaCntDESC_FORMAPAGO: TIBStringField;
    qryviewDatosParaCntDESC_CENTRO_COSTO: TIBStringField;
    qryviewDatosParaCntCODDGII: TIntegerField;
    qryviewDatosParaCntDESC_PRODUCTO: TIBStringField;
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
  end;

var
  frmContabilizarCostosYGastos: TfrmContabilizarCostosYGastos;

implementation

uses UDatModCxc, UGlobal, UDatModControl, UDatModDistCNT,
  UDistCntGestorProd;

{$R *.dfm}

procedure TfrmContabilizarCostosYGastos.FormCreate(Sender: TObject);
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
  MessageDlg('Código sistema no encontrado en tabla control, verifique', mtInformation, [mbOK], 0);
  dtpkfecha.Date:= ExtraerFecha(dmControl.qryControlFECHA_ACT.Value) + 1;
  dmControl.qryControl.Close;
end;

procedure TfrmContabilizarCostosYGastos.btnDatosClick(Sender: TObject);
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

  //qryviewDatosParaCnt.Params[0].Value:= nombretablaacnt;
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

procedure TfrmContabilizarCostosYGastos.PrepararDatos;
var
  campos : String;
  strcampokey : string;
  x, y : Integer;
  strFecha : String;
  d,m,yy : word;
begin

end;

procedure TfrmContabilizarCostosYGastos.ProcDatos;
var
  xmonto  : Extended;
  fCampos : TField;
  NombreCampo : string;
begin
  GlbDescTipoCNT := 'Transaccción Costos y Gastos';
end;

procedure TfrmContabilizarCostosYGastos.HacerTotales;
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
  dmcxc.rxtrancnt.SortOnFields('rxdebito;rxCuenta1', true, true);
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

  //t dmcxc.rxtrancnt.SortOnFields('rxCuenta1',true,false);
end;

procedure TfrmContabilizarCostosYGastos.btnProcesarClick(Sender: TObject);
var
  tempo : extended;
begin
  //inherited;
  frmPrepararDatosCnt:=TfrmPrepararDatosCnt.Create(nil);

  GlbDescTipoCNT := 'Transaccción Costos y Gastos';
  dmDistCnt.rxDatosTransCnt.Close;
  dmDistCnt.rxDatosTransCnt.Open;
  //dmCxc.rxTranCnt.Close;
  //dmCxc.rxTranCnt.Open;
  dmCxc.rxTranCnt.Close;
  dmCxc.rxTranCnt.Open;
  
  tempo := dmcxc.rxTranCntrxDebito.Value;
  frmPrepararDatosCnt.Show;
  frmPrepararDatosCnt.DateEdit1.Date:=dtpkfecha.Date;
  {
  1	1	Venta al Contado  1	1	Venta al Contado 1	1	Venta al Contado
  1	1	Venta al Contado  2	1	Promocion 3	1	Devolucion
  4	1	Venta a Credito   4	1	Venta a Credito
  }
  frmPrepararDatosCnt.FTipoTRN      := 1; //Venta al Contado
  frmPrepararDatosCnt.esVentaCash:= True;
  frmPrepararDatosCnt.ProcDatos(dmCxc.rxTranCnt);
  frmPrepararDatosCnt.Close;
  frmPrepararDatosCnt.Free;
  frmPrepararDatosCnt:=Nil;
  HacerTotales;
  //t ProcDatos; 
end;

procedure TfrmContabilizarCostosYGastos.btnContabilizarClick(Sender: TObject);
begin
  inherited;
  //
  btnContabilizar.Enabled:=False;
end;

function TfrmContabilizarCostosYGastos.procPreparaCampootro(xnum : Integer):Boolean;
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

procedure TfrmContabilizarCostosYGastos.dtpkfechaExit(Sender: TObject);
begin
  inherited;
  //
end;

end.
