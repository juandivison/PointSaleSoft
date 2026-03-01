unit UContabilizarVentasTarjeta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UContabilizarformBase, Menus, Grids, DBGrids, RXDBCtrl,
  Db, ComCtrls, StdCtrls, Buttons, RXCtrls, ExtCtrls, WinSkinData, RxMemDS,
  IBCustomDataSet, IBQuery;

type
  TfrmContabilizarVentasTarjeta = class(TfrmContabilizaDatos)
    Memo1: TMemo;
    DBGridTest: TDBGrid;
    dsqryDatosCampoClave: TDataSource;
    SkinData1: TSkinData;
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
    qryviewDatosParaCntITBISTASA0: TFloatField;
    qryviewDatosParaCntITBISTASA8: TFloatField;
    qryviewDatosParaCntITBISTASA11: TFloatField;
    qryviewDatosParaCntITBISTASA13: TFloatField;
    qryviewDatosParaCntITBISTASA16: TFloatField;
    qryviewDatosParaCntITBISTASA18: TFloatField;
    qryviewDatosParaCntITBISTASAEXO0: TFloatField;
    qryviewDatosParaCntITBISTASAEXO8: TFloatField;
    qryviewDatosParaCntITBISTASAEXO11: TFloatField;
    qryviewDatosParaCntITBISTASAEXO13: TFloatField;
    qryviewDatosParaCntITBISTASAEXO16: TFloatField;
    qryviewDatosParaCntITBISTASAEXO18: TFloatField;
    qryviewDatosParaCntMONTO_VISANET: TFloatField;
    qryviewDatosParaCntMONTO_CARDNET: TFloatField;
    qryviewDatosParaCntPROVEEDOR_TARJETA: TIBStringField;
    qryviewDatosParaCntTIPO_PAGO: TSmallintField;
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
     esTarjeta : Boolean;
     nombretablaacnt : String;
  end;

var
  frmContabilizarVentasTarjeta: TfrmContabilizarVentasTarjeta;

implementation

uses UDatModCxc, UGlobal, UDatModControl, UDatModDistCNT,
  UDistCntGestorProd;

{$R *.dfm}

procedure TfrmContabilizarVentasTarjeta.FormCreate(Sender: TObject);
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

procedure TfrmContabilizarVentasTarjeta.btnDatosClick(Sender: TObject);
var
  lfecha :TDatetime;
  lstatus:String;
  nError:Boolean;
begin
  //inherited;

  Actualizar:=False;

  pagecontrol1.ActivePage := TabSheet1;
  btnProcesar.Enabled := True;
  dmcxc.rxTranCnt.Close;
  dmcxc.rxTranCnt.EmptyTable;
  dmcxc.rxTranCnt.Open;

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

end;

procedure TfrmContabilizarVentasTarjeta.PrepararDatos;
var
  campos : String;
  strcampokey : string;
  x, y : Integer;
  strFecha : String;
  d,m,yy : word;
begin
end;

procedure TfrmContabilizarVentasTarjeta.ProcDatos;
var
  xmonto  : Extended;
  fCampos : TField;
  NombreCampo : string;
begin
  GlbDescTipoCNT := 'Transacccion Ventas Con Tarjeta';
end;

procedure TfrmContabilizarVentasTarjeta.HacerTotales;
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

procedure TfrmContabilizarVentasTarjeta.btnProcesarClick(Sender: TObject);
var
  tempo : extended;
begin
  //inherited;
  frmPrepararDatosCnt:=TfrmPrepararDatosCnt.Create(Nil);

  GlbDescTipoCNT := 'Transacccion Ventas';
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
  frmPrepararDatosCnt.FTipoTRN   := 1; //Venta al Contado
  frmPrepararDatosCnt.nombreView := 'VIEW_VENTAS_ACNT_TC';
  frmPrepararDatosCnt.esTarjeta := True;
  frmPrepararDatosCnt.ProcDatos(dmCxc.rxTranCnt);
  frmPrepararDatosCnt.Close;
  frmPrepararDatosCnt.free;
  frmPrepararDatosCnt:=nil;
  HacerTotales;
  //t ProcDatos;

end;

procedure TfrmContabilizarVentasTarjeta.btnContabilizarClick(Sender: TObject);
begin
  inherited;
  //
  btnContabilizar.Enabled:=False;
end;

function TfrmContabilizarVentasTarjeta.procPreparaCampootro(xnum : Integer):Boolean;
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

procedure TfrmContabilizarVentasTarjeta.dtpkfechaExit(Sender: TObject);
begin
  inherited;
  //
end;

end.
