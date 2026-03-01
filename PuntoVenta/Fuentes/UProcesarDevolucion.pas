unit UProcesarDevolucion;

interface
uses Variants, Db, Dialogs, SysUtils, IBStoredProc, IBSQL, IBquery;
 var
  tipoCF : String;
  GeneraNCF : Boolean;
  descNCF: String;
  fechaTrn : TDateTime;
  codigo_cte : Integer;
  nombrecompleto : string;
  cedula : string;
  direccion: string;
  ciudad: string;
  monto : Currency;
  status: string;
  codig_usuario : integer;
  fechainsert : TDateTime;
  fechaupdate : TDateTime;
  codigousuarioupd : Integer;
  tipodoc : smallint;
  numeroFactura : Integer;
  numeroDevol : Integer;
  seriencfasignado : Integer;
  AfectaFactPend : Boolean;
  Moneda : String;
  numeroTrnVta : Integer;
  solNum : Boolean;

  UpdateBLCCXC : boolean;
  CancelaProceso : Boolean;
  procedure Ejecutar(tipoCF : String; tipoIFiscal:Integer;numerotrnorg:Integer);
  procedure ProcInsertarTransCXC(Serie_Asignadoncf: integer;numerotrnorg:integer);
  procedure ProcUpdateFactPendiente(Serie : Integer);

  procedure ProcInsertaDevolucionPend(accion : smallint);

  //Actualiza balance cxc y set R to trans_cxc
  procedure ProcUpdateBalanceCte(tipo : smallint);

  procedure ActBalaceCteP(operacion:smallint);
  procedure EditarBalanceP(monto : Real);
  procedure InsertaBalanceP(monto: Real);

implementation

uses UDatModFactura, uGlobal, UDatModCxc, UDatModReportes;

procedure ActBalaceCteP(operacion: smallint);
var
  Monto:Real;
begin
  if dmcxc.QrybalanceCtes.state = dsInactive then
  dmcxc.QrybalanceCtes.Open;
  if (Operacion=2) then
  Monto:=dmcxc.tblTransCxcVALOR_DOCUMENTO.Value*-1
  else Monto:=dmcxc.tblTransCxcVALOR_DOCUMENTO.Value;
  if dmcxc.QrybalanceCtes.Locate('CODIGO;SERVICIO;MONEDA',
     VarArrayOf([dmCxc.tblTransCxccodigo_cliente.Value,
                 dmCxc.tblTransCxcCODIGO_SERV.Value,dmCxc.tblTransCxcMONEDA.Value]),[]) then
  begin
    EditarBalanceP(Monto);
  end else
  begin
    InsertaBalanceP(Monto);
  end;
  if dmcxc.qryBalanceCtes.State in [dsEdit, dsInsert] then
  begin
    dmcxc.qryBalanceCtes.Post;
    dmcxc.qryBalanceCtes.ApplyUpdates;
  end;
  dmCxc.tblTranscxc.Edit;
  dmCxc.tblTransCxcSTATUS.Value:= 'R';
  dmCxc.tblTranscxc.Post;
  dmCxc.tblTranscxc.ApplyUpdates;
  if Not dmCxc.tblTranscxc.Transaction.InTransaction then
  dmCxc.tblTranscxc.Transaction.StartTransaction;
  try
    dmCxc.tblTranscxc.Transaction.CommitRetaining;
  except
  dmCxc.tblTranscxc.Transaction.RollbackRetaining;
  end;
  if Not dmcxc.qryBalanceCtes.Transaction.InTransaction then
  dmcxc.qryBalanceCtes.Transaction.StartTransaction;
  try
    dmcxc.qryBalanceCtes.Transaction.CommitRetaining;
  except
  dmcxc.qryBalanceCtes.Transaction.RollbackRetaining;
  end;
end;

procedure EditarBalanceP(monto: Real);
begin
  dmcxc.qryBalanceCtes.Edit;
  dmcxc.qryBalanceCtesFECHA_BCE.Value:= dmcxc.tblTransCxcFECHA.Value;
  dmcxc.qryBalanceCtesBALANCE_ANT.Value:=dmcxc.qryBalanceCtesBALANCE_ACT.Value;
  dmcxc.qryBalanceCtesBALANCE_ACT.Value:=//+
  dmcxc.qryBalanceCtesBALANCE_ACT.Value + Monto;
  dmcxc.qryBalanceCtesDEBITO_MES.Value:=//+
  dmcxc.qryBalanceCtesDEBITO_MES.Value + Monto;
  dmcxc.qryBalanceCtesDEBITO_ACM.Value:=//+
  dmcxc.qryBalanceCtesDEBITO_ACM.Value + Monto;
end;

procedure InsertaBalanceP(monto: Real);
begin
  dmcxc.qryBalanceCtes.Insert;
  dmcxc.qryBalanceCtesCODIGO.Value    := dmCxc.tblTransCxcCODIGO_CLIENTE.Value;
  dmcxc.qryBalanceCtesSERVICIO.Value  := 0;
  dmcxc.qryBalanceCtesMONEDA.Value    := '1';

  dmcxc.qryBalanceCtesBALANCE_ACT.Value := 0;
  dmcxc.qryBalanceCtesDEBITO_MES.Value  := 0;
  dmcxc.qryBalanceCtesDEBITO_ACM.Value  := 0;
  dmcxc.qryBalanceCtesCREDITO_MES.Value := 0;
  dmcxc.qryBalanceCtesCREDITO_ACM.Value := 0;
  dmcxc.qryBalanceCtesBALANCE_ANT.Value := 0;

  if dmcxc.qryBalanceCtesMONEDA.IsNull then
  dmcxc.qryBalanceCtesMONEDA.Value:='1';
  //chequear moneda
  dmcxc.qryBalanceCtesSTATUS_BCE.Value:= 'A';
  dmcxc.qryBalanceCtesFECHA_BCE.Value := ExtraerFecha(Now);
  dmcxc.qryBalanceCtesFECHA_IN.Value  := Now;
  dmcxc.qryBalanceCtesIN_POR.Value    := StrUserName;
  if (dmCxc.tblTransCxcTIPO_DOC.Value = 1) Or (dmCxc.tblTransCxcTIPO_DOC.Value = 3) then
  begin
   dmcxc.qryBalanceCtesBALANCE_ACT.Value:= Monto;
   dmcxc.qryBalanceCtesDEBITO_MES.Value := Monto;
   dmcxc.qryBalanceCtesDEBITO_ACM.Value := Monto;
  end else
  if (dmCxc.tblTransCxcTIPO_DOC.Value = 2) Or (dmCxc.tblTransCxcTIPO_DOC.Value = 4) or
  (dmCxc.tblTransCxcTIPO_DOC.Value = 5) then
  begin
    if (dmCxc.tblTransCxcTIPO_DOC.Value = 4) And ((dmCxc.tblTransCxcTIPO_DOC.Value = 1) ) then
    begin
      dmcxc.qryBalanceCtesBALANCE_ACT.Value:= Monto;
      dmcxc.qryBalanceCtesDEBITO_MES.Value := Monto;
      dmcxc.qryBalanceCtesDEBITO_ACM.Value := Monto;
    end else
    begin
      dmcxc.qryBalanceCtesBALANCE_ACT.Value:=//-
      dmcxc.qryBalanceCtesBALANCE_ACT.Value - monto;
      dmcxc.qryBalanceCtesCREDITO_MES.Value:= monto;
      dmcxc.qryBalanceCtesCREDITO_ACM.Value:= monto;
      dmcxc.qryBalanceCtesFECHA_ULT_PAGO.Value:= Now;
    end;
  end;
end;

procedure ProcInsertarTransCXC(Serie_Asignadoncf: integer;numerotrnorg:integer);
var
  xNumDoc : Integer;
begin
  //t if (Codigo_Cte = 0) then Exit;
  xNumDoc :=-1;

    dmcxc.stpProcNumDoc.Params[1].Value:= 5;
    dmcxc.stpProcNumDoc.ExecProc;
    xNumDoc := dmcxc.stpProcNumDoc.Params[0].Value;
  //end;
  UProcesarDevolucion.numeroFactura := dmcxc.stpProcNumDoc.Params[0].Value;

  if dmcxc.tblTransCxc.State = dsInactive then
  begin
    dmcxc.tblTransCxc.Close;
    dmCxc.tblTransCxc.Params[2].Value:=glbCia_Key;
    dmcxc.tblTransCxc.Open;
  end;
    dmcxc.tblTransCxc.Insert;
    dmCxc.tblTransCxcCIA_KEY.Value := GlbCodigoCia;

    dmcxc.tblTransCxctipo_doc.Value       := tipoDoc;//tblDocTransCxcCODIGO.Value; //Recibo
    if (Moneda = '') then
    Moneda := '1';
    dmcxc.tblTransCxcmoneda.Value         := Moneda;
    dmcxc.tblTransCxcfecha.Value          := fechaTrn;//ExtraerFecha(GlbFechaTrnDiaria);
    if numeroFactura <= 0 then
    dmcxc.tblTransCxcnumero_doc.Value     := xNumDoc
    else
    dmcxc.tblTransCxcnumero_doc.Value     := numeroFactura;//rxFacturaACobrarNumFactura.Value;
    dmcxc.tblTransCxctipo_serv.Value      := 1;
    dmcxc.tblTransCxccodigo_cliente.Value := Codigo_Cte;//rxFacturaACobrarCodCte.Value;
    dmcxc.tblTransCxccodigo_serv.Value    := 0;
    dmcxc.tblTransCxcValor_documento.Value:= Abs(Monto);//rxFacturaACobrarMontoAbonado.Value;
    if (tipodoc = 5) then //Nota Credito
    begin
      dmcxc.tblTransCxcTipo_tranf.Value := 2;
      if (xNumDoc > 0) then
      dmcxc.tblTransCxcconcepto.Value   := 'Nota Crédito por Devolución #' + IntToStr(xNumDoc) //rxFacturaACobrarNumFactura.AsString
      else
      dmcxc.tblTransCxcconcepto.Value   := 'Nota Crédito';
    end;
    dmcxc.tblTransCxcStatus.Value       := 'R';
    dmcxc.tblTransCxcIN_POR.Value       := StrUserName;
    dmcxc.tblTransCxcFECHA_IN.Value     := Now;
    dmcxc.tblTransCxc.Post;
    dmcxc.tblTransCxc.ApplyUpdates;
    //Actualizar trans_cxc_det - registra datos nota credito
    dmcxc.transCxcNotaCredito.Close;
    dmcxc.transCxcNotaCredito.Open;
    dmcxc.transCxcNotaCredito.Insert;
    //dmcxc.transCxcNotaCreditoSERIE.Value := dmcxc.tblTransCxcserie.AsInteger;
    dmcxc.transCxcNotaCreditoNUM_DOC.Value := xNumDoc;
    dmcxc.transCxcNotaCreditoNUMERO_FACT.Value := numerofactura;//rxFacturaACobrarNumFactura.Value;
    dmcxc.transCxcNotaCreditoNUMERO_TRN_ORIGEN.Value:= numerotrnorg;

    if (Serie_Asignadoncf > 0 ) then
    dmcxc.transCxcNotaCreditoSERIE_NCF_ASIGNADO.Value := Serie_Asignadoncf;

    seriencfasignado := Serie_Asignadoncf;
    dmcxc.transCxcNotaCreditoSERIE.Value := dmcxc.tblTransCxcserie.AsInteger;

    dmcxc.transCxcNotaCredito.Post;
    dmcxc.transCxcNotaCredito.ApplyUpdates;

    if Not dmcxc.tblTransCxc.Transaction.InTransaction then
       dmcxc.tblTransCxc.transaction.StartTransaction;
    try
      dmcxc.tblTransCxc.transaction.CommitRetaining;
    except
    dmcxc.tblTransCxc.transaction.RollbackRetaining;
    end;

    if Not dmcxc.transCxcNotaCredito.Transaction.InTransaction then
       dmcxc.transCxcNotaCredito.transaction.StartTransaction;
    try
      dmcxc.transCxcNotaCredito.transaction.CommitRetaining;
    except
    dmcxc.transCxcNotaCredito.transaction.RollbackRetaining;
    end;
    
    if Not dmcxc.transCxcNotaCredito.Transaction.InTransaction then
    dmcxc.transCxcNotaCredito.transaction.StartTransaction;
    try
      dmcxc.transCxcNotaCredito.transaction.CommitRetaining;
    except
    dmcxc.transCxcNotaCredito.transaction.RollbackRetaining;
    end;

    //Aqui actualizar balance cxc
    //EsModificandoFactura
    if (dmcxc.tblTransCxcStatus.Value = 'R') then
    begin
      if UpdateBLCCXC then
      ActBalaceCteP(2);
    end;

    dmcxc.qryRepTransCxcNDB_NCR.Close;
    dmcxc.qryRepTransCxcNDB_NCR.Params[0].Value:= dmcxc.transCxcNotaCreditoSERIE.Value;
    dmcxc.qryRepTransCxcNDB_NCR.Params[1].Value:= 5;//Nota Credito
    dmcxc.qryRepTransCxcNDB_NCR.Open;

    dmreportes.qryDatosRepTranscxcIFiscal.Close;
    dmreportes.qryDatosRepTranscxcIFiscal.Params[0].value:= dmcxc.transCxcNotaCreditoSERIE.Value;
    dmreportes.qryDatosRepTranscxcIFiscal.Open;
    ProcInsertaDevolucionPend(2);//insert;

    //rxFacturaACobrar.Next;
    //end;
end;

procedure ProcInsertaDevolucionPend(accion : smallint);
begin
  //Output parameters
  {dmfactura.stpProcDevolPendiente.Params[0].Value:= numero devolucon
  dmfactura.stpProcDevolPendiente.Params[1].Value:= moneda
  dmfactura.stpProcDevolPendiente.Params[2].Value:= codigo_Cte
  dmfactura.stpProcDevolPendiente.Params[3].Value:= monto pendiente
  dmfactura.stpProcDevolPendiente.Params[4].Value:= status
  dmfactura.stpProcDevolPendiente.Params[5].Value:= fecha in
  dmfactura.stpProcDevolPendiente.Params[6].Value:= in por
  dmfactura.stpProcDevolPendiente.Params[7].Value:= fecha mod
  dmfactura.stpProcDevolPendiente.Params[8].Value:= mod por
  dmfactura.stpProcDevolPendiente.Params[9].Value:= numero trn vta
  dmfactura.stpProcDevolPendiente.Params[10].Value:= serie trnxcx }
  dmfactura.stpProcDevolPendiente.Params[11].Value:= dmcxc.tblTransCxcnumero_doc.Value;
  dmfactura.stpProcDevolPendiente.Params[12].Value:= dmcxc.tblTransCxcMONEDA.Value;
  dmfactura.stpProcDevolPendiente.Params[13].Value:= dmcxc.tblTransCxcCODIGO_CLIENTE.Value;
  dmfactura.stpProcDevolPendiente.Params[14].Value:= Abs(dmcxc.tblTransCxcVALOR_DOCUMENTO.Value);
  dmfactura.stpProcDevolPendiente.Params[15].Value:= 'A';
  dmfactura.stpProcDevolPendiente.Params[16].Value:= Now;
  dmfactura.stpProcDevolPendiente.Params[17].Value:= StrUserName;
  dmfactura.stpProcDevolPendiente.Params[18].Value:= null;
  dmfactura.stpProcDevolPendiente.Params[19].Value:= null;
  dmfactura.stpProcDevolPendiente.Params[20].Value:= numeroTrnVta;
  dmfactura.stpProcDevolPendiente.Params[21].Value:= dmcxc.tblTransCxcSERIE.Value;
  dmfactura.stpProcDevolPendiente.Params[22].Value:= 2; //Insert
  dmfactura.stpProcDevolPendiente.ExecProc;
  if Not dmfactura.stpProcDevolPendiente.Transaction.InTransaction then
  dmfactura.stpProcDevolPendiente.Transaction.StartTransaction;
  try
    dmfactura.stpProcDevolPendiente.Transaction.CommitRetaining
  except
  dmfactura.stpProcDevolPendiente.Transaction.RollbackRetaining;
  end;
end;
procedure ProcUpdateBalanceCte(tipo : smallint);
begin
  dmcxc.StpProcActBlceCteyTrncxcStatus.Params[0].Value:= dmcxc.tblTransCxcCODIGO_CLIENTE.Value;
  dmcxc.StpProcActBlceCteyTrncxcStatus.Params[1].Value:= 0;//1;//codservicio
  dmcxc.StpProcActBlceCteyTrncxcStatus.Params[2].Value:= dmcxc.tblTransCxcMONEDA.Value;//'1';//codmoneda
  dmcxc.StpProcActBlceCteyTrncxcStatus.Params[3].Value:= tipo; //Origen
  dmcxc.StpProcActBlceCteyTrncxcStatus.Params[4].Value:= dmcxc.tblTransCxcVALOR_DOCUMENTO.Value;
  dmcxc.StpProcActBlceCteyTrncxcStatus.Params[5].Value:= GlbFechaTrnDiaria;
  dmcxc.StpProcActBlceCteyTrncxcStatus.Params[6].Value:= dmcxc.tblTransCxcSERIE.Value;
  dmcxc.StpProcActBlceCteyTrncxcStatus.ExecQuery;
end;

procedure ProcUpdateFactPendiente(serie : integer);
begin
  //stp_UpdateCxc.Params[0].Value:= //Valor_Pendiente;
  dmcxc.stp_UpdateCxc.Params[1].Value:= 2;//tipo
  dmcxc.stp_UpdateCxc.Params[2].Value:= '1';//moneda
  dmcxc.stp_UpdateCxc.Params[3].Value:= numeroFactura;
  dmcxc.stp_UpdateCxc.Params[4].Value:= Monto;
  dmcxc.stp_UpdateCxc.Params[5].Value:= 'A';//status
  dmcxc.stp_UpdateCxc.Params[6].Value:= 1;//accion 1 = abono
  dmcxc.stp_UpdateCxc.Params[7].Value:= codigo_cte;
  dmcxc.stp_UpdateCxc.Params[8].Value:= FechaTrn;
  dmcxc.stp_UpdateCxc.Params[9].Value:= serie;///dmcxc.tblTransCxcserie.Value;

  dmcxc.stp_UpdateCxc.ExecProc;    //UPDATE balance_cte, facturas_pendiente,
                             //TRANS_CXC = R
  if Not dmcxc.stp_UpdateCxc.Transaction.InTransaction then
  dmcxc.stp_UpdateCxc.transaction.StartTransaction;
  try
    dmcxc.stp_UpdateCxc.transaction.CommitRetaining;
  except
  dmcxc.stp_UpdateCxc.transaction.RollbackRetaining;
  end;
end;

procedure Ejecutar(tipoCF : String; tipoIFiscal:Integer;numerotrnorg:Integer);
var
//  ibStpMaxNCF : TIBStoredProc;
  strnametipocf : string;
begin
  dmfactura.ibqryViewNCF.Close;
  dmFactura.ibQryViewNCF.Close;
  if dmFactura.ibQryViewNCF.Prepared then
  dmFactura.ibQryViewNCF.UnPrepare;
  dmFactura.ibQryViewNCF.SQL.Text := dmFactura.ibQryViewNCF_0.SQL.Text;
  ProcPrepNeCF('');
  dmfactura.ibqryViewNCF.Open;
  strnametipocf:='TIPO_CF';

  //temporal
  if not dmFactura.ibQryViewNCF.Locate(strnametipocf,
  //antes VarArrayOf([tipoCF,tipoIFiscal]), []) then
  VarArrayOf([tipoCF]), []) then
  begin
    if 5=5 then
    begin
    end;
  end;

  if dmFactura.ibQryViewNCF.Locate(strnametipocf,
  VarArrayOf([tipoCF,tipoIFiscal]), []) then
  //if dmfactura.ibqryViewNCF.Locate('TIPO_CF',tipoCF,[]) then
  begin       ///dmfactura.ibQryViewNCFtipo_cf.value
    //antes de B descNCF:= dmfactura.ibQryViewNCFDESCRIPCION.Value;

    if dmfactura.ibQryViewNCFFECHA_VENCE.IsNull then
    descNCF:= dmfactura.ibQryViewNCFDESCRIPCION.Value
    else
    descNCF:= dmfactura.ibQryViewNCFDESCRIPCION_2018.Value;

    {ibStpMaxNCF.Params[7].Value := dmfactura.ibQryViewNCFSERIE.Value;
    ibStpMaxNCF.Params[8].Value := dmfactura.ibQryViewNCFDIV_NEGOCIO.Value;
    ibStpMaxNCF.Params[9].Value := dmfactura.ibQryViewNCFPECF.Value;
    ibStpMaxNCF.Params[10].Value := dmfactura.ibQryViewNCFAICF.Value;
    ibStpMaxNCF.Params[11].Value :=dmfactura.ibQryViewNCFTIPO_CF.Value;
    ibStpMaxNCF.ExecProc;}
  //end;
  {dmfactura.stpProcDevolucion.Params[0].Value :=  //serie ncfasignado -output
  dmfactura.stpProcDevolucion.Params[1].Value := //xncf        -output
  dmfactura.stpProcDevolucion.Params[2].Value := // serie      -output
  dmfactura.stpProcDevolucion.Params[3].Value := //div_negocio -output
  dmfactura.stpProcDevolucion.Params[4].Value := //pecf        -output
  dmfactura.stpProcDevolucion.Params[5].Value := //aicf        -output
  dmfactura.stpProcDevolucion.Params[6].Value := //tipo cf     -output
  dmfactura.stpProcDevolucion.Params[7].Value := //error desc  -output
  }
  dmfactura.stpProcDevolucion.Params[8].Value :=  dmfactura.ibQryViewNCFSERIE.Value;//xserie
  dmfactura.stpProcDevolucion.Params[9].Value :=  dmfactura.ibQryViewNCFDIV_NEGOCIO.Value;//xdiv negocio
  dmfactura.stpProcDevolucion.Params[10].Value := dmfactura.ibQryViewNCFPECF.Value; //xpecf
  dmfactura.stpProcDevolucion.Params[11].Value := dmfactura.ibQryViewNCFAICF.Value; //xaicf
  dmfactura.stpProcDevolucion.Params[12].Value := dmfactura.ibQryViewNCFTIPO_CF.Value; //xtipo cf
  end else
  begin
    dmfactura.stpProcDevolucion.Params[8].Value :=  null;
    dmfactura.stpProcDevolucion.Params[9].Value :=  null;
    dmfactura.stpProcDevolucion.Params[10].Value := null;
    dmfactura.stpProcDevolucion.Params[11].Value := null;
    dmfactura.stpProcDevolucion.Params[12].Value := null;
  end;
  dmfactura.stpProcDevolucion.Params[13].Value := fechaTrn;//fecha
  dmfactura.stpProcDevolucion.Params[14].Value := codigo_cte;
  if codigo_cte > 0 then
  begin
    dmfactura.stpProcDevolucion.Params[15].Value := nombrecompleto;
    dmfactura.stpProcDevolucion.Params[16].Value := cedula;
    dmfactura.stpProcDevolucion.Params[17].Value := direccion;
    dmfactura.stpProcDevolucion.Params[18].Value := ciudad;
  end else
  begin
    dmfactura.stpProcDevolucion.Params[15].Value := null;
    dmfactura.stpProcDevolucion.Params[16].Value := null;
    dmfactura.stpProcDevolucion.Params[17].Value := null;
    dmfactura.stpProcDevolucion.Params[18].Value := null;
  end;
  dmfactura.stpProcDevolucion.Params[19].Value := Abs(monto);
  dmfactura.stpProcDevolucion.Params[20].Value := status;
  dmfactura.stpProcDevolucion.Params[21].Value := codig_usuario;
  dmfactura.stpProcDevolucion.Params[22].Value := fechainsert;
  dmfactura.stpProcDevolucion.Params[23].Value := fechaupdate;
  dmfactura.stpProcDevolucion.Params[24].Value := codigousuarioupd;
  dmfactura.stpProcDevolucion.Params[25].Value := tipodoc;
  if (GeneraNCF)  and (dmfactura.stpProcDevolucion.Params[8].IsNull) then
  begin
    MessageDlg('Verifique configuración NCF. Reporte a soporte usuario.', mtError,[mbOk], 0);
    //t Exit;
  end;
  if (GeneraNCF) then
  dmfactura.stpProcDevolucion.ExecProc;
  
  if Not dmfactura.stpProcDevolucion.Transaction.InTransaction then
  dmfactura.stpProcDevolucion.Transaction.StartTransaction;

  try
    dmfactura.stpProcDevolucion.Transaction.CommitRetaining;
  except
  dmfactura.stpProcDevolucion.Transaction.RollbackRetaining;
  end;
  if dmfactura.stpProcDevolucion.Params[0].IsNull And GeneraNCF then
  begin
    MessageDlg(dmfactura.stpProcDevolucion.Params[7].Value, mtError, [mbok],0);
    CancelaProceso:=True;
  end else
  ProcInsertarTransCXC(dmfactura.stpProcDevolucion.Params[0].Value,numerotrnorg);
end;
end.
