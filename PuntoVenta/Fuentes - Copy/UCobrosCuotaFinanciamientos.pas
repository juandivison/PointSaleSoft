unit UCobrosCuotaFinanciamientos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, RXDBCtrl, DB, IBCustomDataSet, IBQuery,
  WinSkinData, StdCtrls, Mask, DBCtrls, RxMemDS, Buttons, IBStoredProc;

type
  TfrmCobroCuotasFinanciamientos = class(TForm)
    dsqryDatosCuota: TDataSource;
    qryDatosCuota: TIBQuery;
    qryDatosCuotaSERIE: TIntegerField;
    qryDatosCuotaNUMERO_TRN: TIntegerField;
    qryDatosCuotaFECHA: TDateTimeField;
    qryDatosCuotaCODIGO_CTE: TIntegerField;
    qryDatosCuotaTIPO_FREC_PAGO: TIntegerField;
    qryDatosCuotaPORCIENTO: TFloatField;
    qryDatosCuotaPORC_MORA: TFloatField;
    qryDatosCuotaCANT_CUOTAS: TIntegerField;
    qryDatosCuotaBALANCE_ACT: TFloatField;
    qryDatosCuotaFECHA_ULT_PAGO: TDateTimeField;
    qryDatosCuotaMONTO_APAGAR_PORMORA: TFloatField;
    qryDatosCuotaMONTO_INTERES: TFloatField;
    qryDatosCuotaMONTO_CUOTA: TFloatField;
    qryDatosCuotaMONTO_CUOTA_TOTAL: TFloatField;
    qryDatosCuotaDIASTRANS: TIntegerField;
    qryDatosCuotaCANTPERIODOSATRASO: TIntegerField;
    qryDatosCuotaCANTMESATRASO: TIntegerField;
    qryDatosCuotaNUM_FACTURA: TIntegerField;
    qryDatosCuotaCUOTASPEND: TIntegerField;
    qryDatosCuotaMONTOINICIAL: TFloatField;
    qryDatosCuotaMONTO_CAP_INICIAL: TFloatField;
    qryDatosCuotaMONTOCAPITAL_PARASALDO: TFloatField;
    RxDBGrid1: TRxDBGrid;
    SkinData1: TSkinData;
    DataSource2: TDataSource;
    rxTotales: TRxMemoryData;
    rxTotalesMontoInteresAPagar: TFloatField;
    rxTotalesCuota: TFloatField;
    rxTotalesMontoxMora: TFloatField;
    rxTotalesTotalAPagar: TFloatField;
    rxTotalesMontoCapital: TCurrencyField;
    rxTotalesMontoInteres: TFloatField;
    RxDBGrid2: TRxDBGrid;
    rxTotalesNotaCredito: TCurrencyField;
    rxTotalesNotaDebito: TCurrencyField;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    rxTotalesAbonoACuota: TCurrencyField;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    chkSaldar: TCheckBox;
    chkSoloAbono: TCheckBox;
    rxTotalesMontoParaSaldo: TCurrencyField;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    stpactfctingresos: TIBStoredProc;
    qryFactPend: TIBQuery;
    qryFactPendMONTO_US: TFloatField;
    qryFactPendFECHA: TDateTimeField;
    qryFactPendMONEDA: TIBStringField;
    qryFactPendTIPO: TIntegerField;
    qryFactPendNUMERO_FACT: TIntegerField;
    qryFactPendMONTO_PENDIENTE: TFloatField;
    qryFactPendSTATUS: TIBStringField;
    qryFactPendCODIGO_CTE: TIntegerField;
    qryFactPendNOMBRE_EMPRESA: TIBStringField;
    qryFactPendNOMBRE_PERSONAL: TIBStringField;
    qryFactPendDESCTIPO: TStringField;
    dsqryFactPend: TDataSource;
    tblCobroDeCuotasFinanc: TIBDataSet;
    tblCobroDeCuotasFinancSERIE: TIntegerField;
    tblCobroDeCuotasFinancNUMERO_TRN: TIntegerField;
    tblCobroDeCuotasFinancFECHA: TDateTimeField;
    tblCobroDeCuotasFinancCODIGO_CTE: TIntegerField;
    tblCobroDeCuotasFinancTIPO_FREC_PAGO: TIntegerField;
    tblCobroDeCuotasFinancPORCIENTO: TFloatField;
    tblCobroDeCuotasFinancPORC_MORA: TFloatField;
    tblCobroDeCuotasFinancCANT_CUOTAS: TIntegerField;
    tblCobroDeCuotasFinancMONTOINICIAL: TFloatField;
    tblCobroDeCuotasFinancDEBITO_ACUM: TFloatField;
    tblCobroDeCuotasFinancCREDITO_ACUM: TFloatField;
    tblCobroDeCuotasFinancMONTO_MORA_ACUM: TFloatField;
    tblCobroDeCuotasFinancMONTO_DESC_PRONTOPAGO: TFloatField;
    tblCobroDeCuotasFinancBALANCE_ACT: TFloatField;
    tblCobroDeCuotasFinancFECHA_ULT_PAGO: TDateTimeField;
    tblCobroDeCuotasFinancSTATUS: TIBStringField;
    tblCobroDeCuotasFinancID_USUARIO_IN: TIntegerField;
    tblCobroDeCuotasFinancFECHA_IN: TDateTimeField;
    tblCobroDeCuotasFinancNOMBREPC: TIBStringField;
    tblCobroDeCuotasFinancFECHA_UPDATE: TDateTimeField;
    tblCobroDeCuotasFinancID_USUARIO_UPDATE: TIntegerField;
    tblCobroDeCuotasFinancCUOTASPEND: TIntegerField;
    tblCobroDeCuotasFinancNUM_FACTURA: TIntegerField;
    tblCobroDeCuotasFinancMONTO_CAP_INICIAL: TFloatField;
    tblCobroDeCuotasFinancNOTA_DEBITO: TFloatField;
    tblCobroDeCuotasFinancNOTA_CREDITO: TFloatField;
    stpProcCobrarFinanc: TIBStoredProc;
    edtObservacion: TEdit;
    Label1: TLabel;
    procedure chkSoloAbonoClick(Sender: TObject);
    procedure chkSaldarClick(Sender: TObject);
    procedure DBEdit12Exit(Sender: TObject);
    procedure DBEdit8Exit(Sender: TObject);
    procedure DBEdit9Exit(Sender: TObject);
    procedure DBEdit12Enter(Sender: TObject);
    procedure DBEdit8Enter(Sender: TObject);
    procedure DBEdit9Enter(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure qryDatosCuotaAfterOpen(DataSet: TDataSet);
    procedure BitBtn2Click(Sender: TObject);
  private
    procedure ActualizaCalculos;
    procedure ImprimirRecibo(recibo_numero:integer);
    { Private declarations }
  public
    { Public declarations }
    Procedure SumarTotales;
    Procedure ActualizaTablaFinanciamiento;

  end;

var
  frmCobroCuotasFinanciamientos: TfrmCobroCuotasFinanciamientos;
  codigo_fpago : integer;

implementation

uses UDatModConectar, UDatModIngresos, uglobal, URegFpago, UDatModUsuarios,
  URepReciboIngreso;

{$R *.dfm}

{ TfrmCobroCuotasFinanciamientos }

procedure TfrmCobroCuotasFinanciamientos.SumarTotales;
begin
  rxTotales.Close;
  rxTotales.Open;
  rxTotales.Insert;
  rxTotalesMontoInteresAPagar.Value := 0;
  rxTotalesCuota.Value       := 0;
  rxTotalesMontoxMora.Value  := 0;
  rxTotalesTotalAPagar.Value := 0;
  rxTotalesCuota.Value       := 0;
  rxTotalesMontoCapital.Value:= 0;
  rxTotalesMontoInteres.Value:= 0;
  rxTotalesNotaCredito.Value:= 0;
  rxTotalesNotaDebito.Value:= 0;
  rxTotalesAbonoACuota.Value:= 0;
  rxTotalesMontoParaSaldo.Value:= 0;  
  rxTotales.Post;
  qryDatosCuota.First;
  While Not qryDatosCuota.Eof do
  begin
    rxTotales.Edit;
    rxTotalesMontoInteresAPagar.Value := rxTotalesMontoInteresAPagar.Value;
    
    rxTotalesCuota.Value       := rxTotalesCuota.Value +
                                  qryDatosCuotaMONTO_CUOTA.Value;
    rxTotalesMontoxMora.Value  := rxTotalesMontoxMora.Value  +
                                  qryDatosCuotaMONTO_APAGAR_PORMORA.Value;
    rxTotalesTotalAPagar.Value := rxTotalesTotalAPagar.Value +
                                  qryDatosCuotaMONTO_APAGAR_PORMORA.Value +
                                  qryDatosCuotaMONTO_CUOTA.Value +
                                  qryDatosCuotaMONTO_INTERES.Value;

    rxTotalesMontoCapital.Value:= rxTotalesMontoCapital.Value +
                                  qryDatosCuotaMONTO_CUOTA.Value;

    rxTotalesMontoInteres.Value:= rxTotalesMontoInteres.Value +
                                  qryDatosCuotaMONTO_INTERES.Value;
    rxTotales.Post;
    qryDatosCuota.Next;
  end;
  //t rxMontoPagado.Value:= rxTotalesTotalAPagar.Value;
  //t RxCalcEditNeto.Value := edtAbonoACapital.ValueFloat;
  //t  edtAbonoACapitalExit(Self);
end;

procedure TfrmCobroCuotasFinanciamientos.chkSoloAbonoClick(
  Sender: TObject);
begin
  SumarTotales;
  if chkSoloAbono.Checked then
  begin
    dbedit8.Enabled:=False;
    dbedit9.Enabled:=False;
    dbedit10.Enabled:=False;
    dbedit11.Enabled:=False;
    DBEdit12.Enabled:=True;    
  end;
end;

procedure TfrmCobroCuotasFinanciamientos.chkSaldarClick(Sender: TObject);
begin
  SumarTotales;
  if chksaldar.Checked then
  begin
    DBEdit12.Enabled:=False;
    dbedit8.Enabled:=True;
    dbedit9.Enabled:=True;
    ActualizaCalculos;
  end;
  if rxTotalesMontoParaSaldo.Value <= 0 then
  begin
    Messagedlg('Monto saldo no puede ser cero, verifique.', mtInformation, [mbok],0);
    BitBtn1.Enabled:=False;
  end;
end;

procedure TfrmCobroCuotasFinanciamientos.ActualizaCalculos;
begin
  if rxTotales.State = dsbrowse then rxTotales.Edit;

  if chkSoloAbono.Checked then
  rxTotalesTotalAPagar.Value:= rxTotalesAbonoACuota.Value
  else
  rxTotalesTotalAPagar.Value:= rxTotalesTotalAPagar.Value +
  rxTotalesAbonoACuota.Value;// + rxTotalesNotaDebito.Value - rxTotalesNotaCredito.Value;

  if chkSaldar.Checked then
  rxTotalesMontoParaSaldo.Value := qryDatosCuotaMONTOCAPITAL_PARASALDO.Value
                                   + rxTotalesNotaDebito.Value
                                   - rxTotalesNotaCredito.Value
  else
  rxTotalesMontoParaSaldo.Value := 0;
  if rxTotales.State in [dsEdit] then
  begin
    rxtotales.Post;
  end;
end;

procedure TfrmCobroCuotasFinanciamientos.DBEdit12Exit(Sender: TObject);
begin
  ActualizaCalculos;
end;

procedure TfrmCobroCuotasFinanciamientos.DBEdit8Exit(Sender: TObject);
begin
  ActualizaCalculos;
end;

procedure TfrmCobroCuotasFinanciamientos.DBEdit9Exit(Sender: TObject);
begin
  ActualizaCalculos;
end;

procedure TfrmCobroCuotasFinanciamientos.DBEdit12Enter(Sender: TObject);
begin
  dbedit12.SelectAll;
end;

procedure TfrmCobroCuotasFinanciamientos.DBEdit8Enter(Sender: TObject);
begin
  dbedit8.SelectAll;
end;

procedure TfrmCobroCuotasFinanciamientos.DBEdit9Enter(Sender: TObject);
begin
  dbedit9.SelectAll;
end;

procedure TfrmCobroCuotasFinanciamientos.ActualizaTablaFinanciamiento;
var
  xmonto : Extended;
begin
  if chkSaldar.Checked then
  xmonto:= rxTotalesMontoParaSaldo.Value
  else xmonto:= rxTotalesTotalAPagar.Value;
  
  tblCobroDeCuotasFinanc.Edit;
  tblCobroDeCuotasFinancFECHA_ULT_PAGO.Value := ExtraerFecha(GlbFechaTrnDiaria);
  tblCobroDeCuotasFinancFECHA_UPDATE.Value   := ExtraerFecha(Now);
  tblCobroDeCuotasFinancID_USUARIO_UPDATE.Value:= VarUsuarioGlb;

  tblCobroDeCuotasFinancCREDITO_ACUM.Value :=
  tblCobroDeCuotasFinancCREDITO_ACUM.Value + xmonto;

  tblCobroDeCuotasFinancBALANCE_ACT.Value :=
  tblCobroDeCuotasFinancBALANCE_ACT.Value - xmonto;

  tblCobroDeCuotasFinancCUOTASPEND.Value :=
  tblCobroDeCuotasFinancCUOTASPEND.Value - 1;
  tblCobroDeCuotasFinanc.ApplyUpdates;
  if Not tblCobroDeCuotasFinanc.Transaction.InTransaction then
  tblCobroDeCuotasFinanc.Transaction.StartTransaction;
  try
    tblCobroDeCuotasFinanc.Transaction.CommitRetaining;
  except
  tblCobroDeCuotasFinanc.Transaction.RollbackRetaining;
  end;
end;

procedure TfrmCobroCuotasFinanciamientos.BitBtn1Click(Sender: TObject);
var
  xMontoPagado : Extended;
  strConcepto : String;
begin
  frmFormaPago:=TfrmFormaPago.Create(nil);
  try
  frmFormaPago.setEfectivo := 1;
  if frmFormaPago.ShowModal = mrok then
  codigo_fpago := frmFormaPago.codigo_fpago
  else codigo_fpago := -1;
  finally
  frmFormaPago.Free;
  frmFormaPago:=Nil;
  end;

  if codigo_fpago <= 0 then
  Exit;

  //stpProcCobrarFinanc.Params[0].Value:= //Output numero_recibo
  stpProcCobrarFinanc.Params[1].Value:= tblCobroDeCuotasFinancSERIE.Value; //serie
  stpProcCobrarFinanc.Params[2].Value:= 2;//tblCobroDeCuotasFinanc //tipo
  stpProcCobrarFinanc.Params[3].Value:= tblCobroDeCuotasFinancNUMERO_TRN.Value;//numero
  stpProcCobrarFinanc.Params[4].Value:= '1';//moneda
  stpProcCobrarFinanc.Params[5].Value:= GlbFechaTrnDiaria;//fecha
  strConcepto := 'Saldo Cuota';
  if not chkSaldar.Checked then
  begin
    xMontoPagado:=rxTotalesTotalAPagar.Value;
    strConcepto := 'Saldo Cuota';
  end else
  if chkSaldar.Checked then
  begin
    xMontoPagado:=rxTotalesMontoParaSaldo.Value;
    strConcepto := 'Saldo Financiamiento';
  end;
  if chkSoloAbono.Checked then
  begin
    xMontoPagado:= rxTotalesAbonoACuota.Value;
    strConcepto := 'Abono a cuota';
  end;
  if xMontoPagado <= 0 then
  begin
    Messagedlg('Monto saldo no puede ser cero, verifique.', mtInformation, [mbok],0);
    exit;
  end;
  stpProcCobrarFinanc.Params[6].Value:=  xMontoPagado;//valor_ing
  stpProcCobrarFinanc.Params[7].Value:=  2;//tipo_ing
  if not qryFactPendNOMBRE_PERSONAL.IsNull then
  stpProcCobrarFinanc.Params[8].Value:=  qryFactPendNOMBRE_PERSONAL.Value
  else
  stpProcCobrarFinanc.Params[8].Value:= qryFactPendNOMBRE_EMPRESA.Value;  //nombre_cte
  stpProcCobrarFinanc.Params[9].Value:= qryFactPendCODIGO_CTE.Value;//codigo_cte
  stpProcCobrarFinanc.Params[10].Value:= 0; //cod_servicio
  stpProcCobrarFinanc.Params[11].Value:= codigo_fpago;//forma_pago
  stpProcCobrarFinanc.Params[12].Value:= Null;//documento
  stpProcCobrarFinanc.Params[13].Value:= Null;//tipo_targeta
  stpProcCobrarFinanc.Params[14].Value:= Null;//status_targeta
  stpProcCobrarFinanc.Params[15].Value:= strConcepto;//concepto
  stpProcCobrarFinanc.Params[16].Value:= 'A';//status
  stpProcCobrarFinanc.Params[17].Value:= edtObservacion.Text;//observacion
  stpProcCobrarFinanc.Params[18].Value:= Null;//cod_linea
  stpProcCobrarFinanc.Params[19].Value:= Now;//fecha_in
  stpProcCobrarFinanc.Params[20].Value:= strUserName;//in_por
  stpProcCobrarFinanc.Params[21].Value:= VarUsuarioGlb;//cod_empleado
  stpProcCobrarFinanc.Params[22].Value:= rxTotalesNotaDebito.Value; //nota_debito
  stpProcCobrarFinanc.Params[23].Value:= rxTotalesNotaCredito.Value;//nota_credito
  stpProcCobrarFinanc.Params[24].Value:= rxTotalesMontoInteres.Value;//monto_interes
  stpProcCobrarFinanc.Params[25].Value:= rxTotalesMontoxMora.Value;//monto_mora
  stpProcCobrarFinanc.Params[26].Value:= rxTotalesMontoCapital.Value;//monto_capital
  stpProcCobrarFinanc.Params[27].Value:= qryFactPendNUMERO_FACT.Value;//numero_factura
  stpProcCobrarFinanc.Params[28].Value:= qryFactPendTIPO.Value;//tipo_fctura

  if chkSaldar.Checked then
  stpProcCobrarFinanc.Params[29].Value:=2  //tipo_pago 0-abono 1-saldo cuota, 2-saldo financiamiento
  else if chkSoloAbono.Checked then
  stpProcCobrarFinanc.Params[29].Value:=0
  else stpProcCobrarFinanc.Params[29].Value:=1;
  
  stpProcCobrarFinanc.Params[30].Value:= qryDatosCuotaCUOTASPEND.Value;
  stpProcCobrarFinanc.ExecProc;
  //stpProcCobrarFinanc.ApplyUpdates;
  if not stpProcCobrarFinanc.Transaction.InTransaction then
  stpProcCobrarFinanc.Transaction.StartTransaction;
  try
    stpProcCobrarFinanc.Transaction.CommitRetaining;
  except
  stpProcCobrarFinanc.Transaction.RollbackRetaining;
  end;

  ImprimirRecibo(stpProcCobrarFinanc.Params[0].Value);
  BitBtn1.Enabled:=False;
end;

procedure TfrmCobroCuotasFinanciamientos.qryDatosCuotaAfterOpen(
  DataSet: TDataSet);
begin
  tblCobroDeCuotasFinanc.Close;
  tblCobroDeCuotasFinanc.Params[0].Value := qryDatosCuotaCODIGO_CTE.Value;
  tblCobroDeCuotasFinanc.Params[1].Value := qryDatosCuotaSERIE.Value;
  tblCobroDeCuotasFinanc.Open;

  qryFactPend.Close;
  qryFactPend.Params[0].Value :=  tblCobroDeCuotasFinancNUM_FACTURA.Value;
  qryFactPend.Open;
end;

procedure TfrmCobroCuotasFinanciamientos.ImprimirRecibo(
  recibo_numero: integer);
  var xnum : Integer;
begin
  xnum:= recibo_numero;
  if xnum  = 0 then
  xnum:= StrToInt(InputBox('Imprimir recibo de ingreso','Entre Número de Recibo','0'));
  if xnum<= 0 then exit;

  dmIngresos.qryRepIngMaster.Close;
  dmIngresos.qryRepIngMaster.Params[0].Value:= xnum;
  dmIngresos.qryRepIngMaster.Open;

  dmIngresos.tblIngresoMaster.Close;
  dmIngresos.tblIngresoMaster.Params[0].Value := dmIngresos.qryRepIngMasterFECHA.Value;
  dmIngresos.tblIngresoMaster.Params[1].Value := dmIngresos.qryRepIngMasterFECHA.Value;
  dmIngresos.tblIngresoMaster.Open;

  if dmUsuarios.qryUsuarios.state = dsInactive then
  dmUsuarios.qryUsuarios.Open;
  dmUsuarios.qryUsuarios.Locate('CODIGO_EMPLEADO',VarUsuarioGlb,[]);
  //qckReciboIngreso:=TqckReciboIngreso.Create(Nil);
  qckReciboIngreso:=TqckReciboIngreso.Create(Nil);

  //qckReciboAbonoCXC:=TqckReciboAbonoCXC.Create(nil);
  try
    qckReciboIngreso.LabelNombUser.Caption:= dmUsuarios.qryUsuariosNOMBRECOMPLETO.Value;
    if dmIngresos.tblIngresoMasterSTATUS.Value = 'P' then
    qckReciboIngreso.qrLabelReimprimir.Caption:='Re-Impresion' else
    qckReciboIngreso.qrLabelReimprimir.Caption:='';
    if MessageDlg('Imprimir?',mtInformation,[mbyes, mbno],0) = mryes then
    begin
      qckReciboIngreso.PrinterSetup;
      qckReciboIngreso.Print;
    end else
    qckReciboIngreso.Preview;
    if dmIngresos.tblIngresoMasterSTATUS.Value = 'A' then
    begin
      qckReciboIngreso.qrLabelReimprimir.Caption:='';
      dmIngresos.tblIngresoMaster.Edit;
      dmIngresos.tblIngresoMasterSTATUS.Value := 'P';
      dmIngresos.tblIngresoMaster.Post;
      dmIngresos.tblIngresoMaster.ApplyUpdates;
      if Not dmIngresos.tblIngresoMaster.Transaction.InTransaction then
      dmIngresos.tblIngresoMaster.Transaction.StartTransaction;
      try
        dmIngresos.tblIngresoMaster.Transaction.CommitRetaining;
      except
      dmIngresos.tblIngresoMaster.Transaction.RollbackRetaining;
      end;
    end;
  finally
  //qckReciboAbonoCXC.Free;
  //qckReciboAbonoCXC:=Nil;
  qckReciboIngreso.Free;
  qckReciboIngreso:=nil;
  end;
end;

procedure TfrmCobroCuotasFinanciamientos.BitBtn2Click(Sender: TObject);
begin
  if not stpProcCobrarFinanc.Params[0].IsNull then
  ImprimirRecibo(stpProcCobrarFinanc.Params[0].Value) else
  ImprimirRecibo(0);
end;

end.
