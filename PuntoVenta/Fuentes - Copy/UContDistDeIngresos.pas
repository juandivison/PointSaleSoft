unit UContDistDeIngresos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UContabilizarformBase, Menus, Grids, DBGrids, RXDBCtrl,
  db, ComCtrls, StdCtrls, Buttons, RXCtrls, ExtCtrls;

type
  TfrmContDistIngresos = class(TfrmContabilizaDatos)
    Memo1: TMemo;
    procedure btnDatosClick(Sender: TObject);
    procedure btnProcesarClick(Sender: TObject);
    procedure btnContabilizarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure PrepararDatos;
    procedure ProcDatos;
    procedure HacerTotales;    
    { Private declarations }
  public
    { Public declarations }
    nombretablaacnt : String;    
  end;

var
  frmContDistIngresos: TfrmContDistIngresos;

implementation

uses UGlobal, UVerificafactcntdet, UDatModCxc, UDatModDistCNT, UDatModTransCnt,
  UDatModControl;

{$R *.dfm}

procedure TfrmContDistIngresos.btnDatosClick(Sender: TObject);
var
  lfecha :TDatetime;
  lstatus:String;
  nError:Boolean;
begin
  //inherited;
  Actualizar:=False;
  frmVerNumTrnCntDet:=TfrmVerNumTrnCntDet.Create(Nil);
  try
    if frmVerNumTrnCntDet.ModalResult = mrOk then
    begin
      frmVerNumTrnCntDet.ShowModal;
      nError:=True;
    end else nError := False;
  finally
  frmVerNumTrnCntDet.Free;
  frmVerNumTrnCntDet:=Nil;
  end;
  if nError then
  begin
    MessageDlg('Existe una o mas transacciones con número nulo o igual cero'+
               'Verifique',mtError,[mbok],0);
    Exit;
  end;
  pagecontrol1.ActivePage := TabSheet1;
  btnProcesar.Enabled := True;
  dmcxc.rxTranCnt.Close;
  dmcxc.rxTranCnt.EmptyTable;
  dmcxc.rxTranCnt.Open;

  dmDistCnt.qryDistCnt.Close;
  dmDistCnt.qryDistCnt.Params[0].Value:=nombretablaacnt;//cntTabla;//'CONTRATO_CIERRE';
  dmDistCnt.qryDistCnt.Open;

  Glbfechainicial  :=dtpkfecha.Date;
  Glbfechafinal    :=dtpkfecha.Date;
  btnprocesar.Enabled := True;
  if EsReporte then Exit;

  PrepararDatos;
  btnProcesarClick(Self);

  //t dmTransCnt.ibsqlUpdateStatusContrato.SQL.Text:=
  //t 'Update '+ nombretablaacnt + ' Set status_cnt ='+chr(39)+'R'+chr(39) +
  //t ' Where numero = '+EditN3.Text;
  //t if Not dmTransCnt.ibsqlUpdateStatusContrato.Prepared then
  //t dmTransCnt.ibsqlUpdateStatusContrato.Prepare;

end;

procedure TfrmContDistIngresos.PrepararDatos;
var
  campos : String;
  x, y : Integer;
  strFecha : String;
  d,m,yy : word;
begin
  dmDistCnt.qryDistCnt.Close;
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
    Campos:=Campos + dmDistCnt.qryDistCntNOMBRE_CAMPO.Value+',';
    dmDistCnt.qryDistCnt.Next;
  end;
  Campos := RemoverCaracter(Campos,'');
  DecodeDate(dtpkfecha.Date,yy,m,d);
  strFecha := IntToStr(m)+'-'+IntToStr(d)+'-'+IntToStr(yy);
  Memo1.Lines.Add('Select Fecha, '+ Campos);
  Memo1.Lines.Add('From '  + Trim(dmDistCnt.qryDistCntNOMBRE_TABLA.Value));
  Memo1.Lines.Add(' Where Status_cnt is null AND FECHA = ' + chr(39) + strFecha + chr(39));
  dmDistCnt.qryDatosAContabilizar.Close;
  dmDistCnt.qryDatosAContabilizar.SQL.Text := Memo1.Text;
  dmDistCnt.qryDatosAContabilizar.Open;
end;


procedure TfrmContDistIngresos.ProcDatos;
begin
  dmDistCnt.rxDatosTransCnt.Close;
  dmDistCnt.rxDatosTransCnt.Open;
  dmCxc.rxTranCnt.Close;
  dmCxc.rxTranCnt.Open;
  dmDistCnt.qryDatosAContabilizar.First;
  dmDistCnt.qryDistCnt.First;
  progressbar1.Max := dmDistCnt.qryDistCnt.RecordCount;

  While Not dmDistCnt.qryDistCnt.Eof Do
  begin
    dmDistCnt.rxDatosTransCnt.Insert;
    dmDistCnt.rxDatosTransCntcta1.Value := dmDistCnt.qryDistCntCTA1.Value;
    dmDistCnt.rxDatosTransCntcta2.Value := dmDistCnt.qryDistCntCTA2.Value;
    dmDistCnt.rxDatosTransCntcta3.Value := dmDistCnt.qryDistCntCTA3.Value;

    dmCxc.rxTranCnt.Insert;
    dmCxc.rxTranCntrxFecha.Value   := dmDistCnt.qryDatosAContabilizar.FieldByName('fecha').AsDateTime;
    dmCxc.rxTranCntrxCuenta1.Value := dmDistCnt.qryDistCntCTA1.Value;
    dmCxc.rxTranCntrxCuenta2.Value := dmDistCnt.qryDistCntCTA2.Value;
    dmCxc.rxTranCntrxCuenta3.Value := dmDistCnt.qryDistCntCTA3.Value;

    if (dmDistCnt.qryDistCntNOMBRE_CAMPO.Value <> '') then
    if (dmDistCnt.qryDistCntORIGEN.Value = 1) then //Debito
    begin
      dmDistCnt.rxDatosTransCntDebito.Value:= dmDistCnt.qryDatosAContabilizar.FieldByName(trim(dmDistCnt.qryDistCntNOMBRE_CAMPO.Value)).AsFloat;
      dmCxc.rxTranCntrxDebito.Value := dmDistCnt.qryDatosAContabilizar.FieldByName(trim(dmDistCnt.qryDistCntNOMBRE_CAMPO.Value)).AsFloat;
    end else
    begin
      dmDistCnt.rxDatosTransCntCredito.Value := dmDistCnt.qryDatosAContabilizar.FieldByName(trim(dmDistCnt.qryDistCntNOMBRE_CAMPO.Value)).AsFloat;
      dmCxc.rxTranCntrxCredito.Value := dmDistCnt.qryDatosAContabilizar.FieldByName(trim(dmDistCnt.qryDistCntNOMBRE_CAMPO.Value)).AsFloat;
    end;
    if (dmCxc.rxTranCntrxdebito.IsNull Or (dmCxc.rxTranCntrxDebito.Value = 0)) and
       (dmCxc.rxTranCntrxcredito.IsNull Or (dmCxc.rxTranCntrxcredito.Value = 0)) then
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
end;

procedure TfrmContDistIngresos.btnProcesarClick(Sender: TObject);
begin
  inherited;
  ProcDatos;
 if Not esReporte then
  Begin
    HacerTotales;
    dmcxc.rxTranCnt.Last;
    dmcxc.rxtrancnt.Edit;
    if dmcxc.rxtrancntrxcuenta1.Value = '999' then
    dmcxc.rxtrancntrxcuenta1.Value :='';
    dmcxc.rxtrancnt.Post;
    btnContabilizar.Enabled := True;
  end;
  dmcxc.rxTranCnt.SortOnFields('rxCuenta1;rxCuenta2;rxcuenta3',True,False);
  dmcxc.dtRxTranCnt.AutoEdit := False;
  dmcxc.rxTranCnt.Last;
  btnProcesar.Enabled  := False;
  progressbar1.Position:= 0;
  pagecontrol1.ActivePage := tabTransacciones;
end;

procedure TfrmContDistIngresos.HacerTotales;
begin
  dmcxc.rxTranCnt.First;
  debito:=0;
  credito:=0;
  while not dmcxc.rxTranCnt.eof do
  begin
    Debito  := debito  + dmcxc.rxtrancntrxdebito.Value;
    Credito := credito + dmcxc.rxtrancntrxCredito.Value;
    dmcxc.rxTranCnt.Next;
  end;
  if (debito > 0) or (credito > 0 ) then
  begin
    dmcxc.rxtrancnt.Insert;
    dmcxc.rxTranCntrxCuenta1.Value:='999';
    dmcxc.rxTranCntrxNumFact.Value:=999999;
    dmcxc.rxTranCntrxDescripcion.Value:='Totales --->';
    dmcxc.rxtrancntrxdebito.value :=Debito;
    dmcxc.rxtrancntrxCredito.Value:=Credito;
    dmcxc.rxtrancnt.Post;
  end;
end;

procedure TfrmContDistIngresos.btnContabilizarClick(Sender: TObject);
begin
  ProcActStatusContrato := False;
  inherited;
end;

procedure TfrmContDistIngresos.FormCreate(Sender: TObject);
var
 lfecha:tdatetime;
 lstatus:string;
begin
  //inherited;
  dmcxc.tCtaTipoCntd.Close;
  dmcxc.tCtaTipoCntd.filtered:=false;
  dmcxc.tCtaTipoCntd.Open;
  dmControl.qryControl.Close;
  dmControl.qrycontrol.Filter:=' Sistema  = 2 '+
                        ' And Sub_sistema = 3 '+
                        ' And Cod_cia     = 1 ';
  dmControl.qrycontrol.Open;
  if Not dmControl.qrycontrol.Locate('SISTEMA;SUB_SISTEMA;COD_CIA',VarArrayOf([2,3,1]),[]) then
  MessageDlg('Codigo sistema no encontrado en tabla control, verifique',mtInformation, [mbOK], 0);
  //dmControl.qrycontrol.Filtered := True; //Transacciones facturas
  dtpkfecha.Date:= ExtraerFecha(dmControl.qryControlFECHA_ACT.Value);
  dmControl.qryControl.close;
  dmControl.qrycontrol.Filtered:=false;
  TIPO_DOCUMENTO_CNT :=6;//Entrada
end;

end.
