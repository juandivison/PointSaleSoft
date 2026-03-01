unit UProcesarIngresoCxc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, Grids, DBGrids, RXDBCtrl,
  WinSkinData, StdCtrls, EditNew, RxMemDS, Buttons, ExtCtrls, RXCtrls,
  ShellApi, IBStoredProc, Menus, RxLookup, IBSQL, ComCtrls, Mask, DBCtrls, RxToolEdit;

type
  TfrmProcPagoCxc = class(TForm)
    stpactfctingresos: TIBStoredProc;
    stp_UpdateCxc: TIBStoredProc;
    ibstpProcInsCxcHist: TIBStoredProc;
    rxFormaPago: TRxMemoryData;
    rxFormaPagoformaPago: TSmallintField;
    rxFormaPagoNumeroDocumento: TStringField;
    rxFormaPagoNumeroTarjeta: TStringField;
    rxFormaPagoTipoTarjeta: TSmallintField;
    rxFormaPagoProveedorTarjeta: TSmallintField;
    rxFormaPagoNumeroAutorizacion: TStringField;
    rxFormaPagoMes: TSmallintField;
    rxFormaPagoAnio: TSmallintField;
    rxFormaPagoMONTOAUTORIZADO: TFloatField;
    ibsqlLastNum: TIBSQL;
    rxFacturaACobrar: TRxMemoryData;
    rxFacturaACobrarCodCte: TIntegerField;
    rxFacturaACobrarNumFactura: TIntegerField;
    rxFacturaACobrarMontoAbonado: TFloatField;
    rxFacturaACobrarTipoCobro: TSmallintField;
    rxFacturaACobrarTipoFactPend: TIntegerField;
    rxFacturaACobrarformaPago: TIntegerField;
    rxFacturaACobrarConcepto: TStringField;
    rxFacturaACobrarNombreCliente: TStringField;
    rxFacturaACobrarMontoNCRAplicado: TCurrencyField;
    rxFacturaACobrarMontoFactura: TCurrencyField;
    rxFacturaACobrarConceptoCxc: TStringField;
    dsrxFacturaACobrar: TDataSource;
    qryFactPendiente: TIBQuery;
    qryFactPendienteCODIGO_CTE: TIntegerField;
    qryFactPendienteFECHA: TDateTimeField;
    qryFactPendienteNUMPOL: TIntegerField;
    qryFactPendienteNOMBRE_CTE: TIBStringField;
    qryFactPendienteNOMBRE_FACTURAR: TIBStringField;
    qryFactPendienteTIPO: TIntegerField;
    qryFactPendienteMONEDA: TIBStringField;
    qryFactPendienteNUMERO_FACT: TIntegerField;
    qryFactPendienteMONTO_PENDIENTE: TFloatField;
    qryFactPendienteSTATUS: TIBStringField;
    qryFactPendienteCONCEPTO: TIBStringField;
    qryFactPendienteNUMERO_TRN_VTA: TIntegerField;
    qryFactPendienteMONTOPENALIDADCXC: TFloatField;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    _MontoACobrar : Currency;
    edtNota : String;
    
    procedure ProcUpdateFactPendiente;
    procedure ProcInsertarDetPagos(numtrn : integer);
    Procedure ProcInsertaFactura;
    Procedure ProcFacturasACxc(numFct:integer;codCte:integer);
  end;

var
  frmProcPagoCxc: TfrmProcPagoCxc;

  cont : Integer;
  strNumero : String;
  mto : Currency;
  _codUsuario : Integer;
  ReConfirmaPago:boolean;


implementation

uses UDatModCxc, UDatModIngresos, UGlobal;

{$R *.dfm}

{ TfrmProcPagoCxc }

//Metodo de inicio
procedure TfrmProcPagoCxc.ProcFacturasACxc(numFct:integer;codCte:integer);
begin

  qryFactPendiente.Close;
  qryFactPendiente.Params[0].Value:= codCte;
  qryFactPendiente.Params[1].Value:= numFct;
  qryFactPendiente.Open;


  rxFormaPago.Close;
  rxFormaPago.EmptyTable;
  rxFormaPago.Open;
  rxFormaPago.Insert;
  rxFormaPagoformaPago.Value:=1;
  rxFormaPago.Post;
  
  ProcInsertaFactura;
  if dmcxc.qryTrancxc.State = dsInactive then
  begin
    dmcxc.qrytrancxc.Close;
    dmcxc.qrytrancxc.Params[2].Value := GlbCia_Key;    
    dmcxc.qrytrancxc.Open;
  end;
    if dmingresos.tblIngresoMaster.state = dsInactive then
    dmingresos.tblIngresoMaster.Open;
    dmingresos.tblIngresoMaster.Append;
    dmingresos.tblIngresoMasterCIA_KEY.Value:= glbCia_Key;
    //dmingresos.tblIngresoMasterSERIE.Value:= FsqlMaxNumero('ingresos','Serie');
    dmingresos.tblIngresoMasterTIPO.Value   := rxFacturaACobrarTipoFactPend.Value;
    dmingresos.tblIngresoMasterNUMERO.Value := FsqlMaxNumero('ingresos','numero');
    dmingresos.tblIngresoMasterMONEDA.Value := qryFactPendienteMONEDA.Value;
    //if GLBSAM = 1 then
    dmingresos.tblIngresoMasterFECHA.Value  := ExtraerFecha(GlbFechaTrnDiaria);
    //else
    //dmingresos.tblIngresoMasterFECHA.Value  := ExtraerFecha(glbFechatrnDiaria);
    dmingresos.tblIngresoMasterVALOR_ING.Value := _MontoACobrar;//SumarFactAcobrar;//edtmontoApagar.ValueFloat,
    dmingresos.tblIngresoMasterTIPO_ING.Value  := 2;//Credito, tipo_ing
    dmingresos.tblIngresoMasterNOMBRE_CTE.Value:= rxFacturaACobrarNombreCliente.Value;
    dmingresos.tblIngresoMasterCODIGO_CTE.Value:= rxFacturaACobrarCodCte.Value;
    dmingresos.tblIngresoMasterCOD_SERVICIO.Value:= 0;//codservicio
    dmingresos.tblIngresoMasterFORMA_PAGO.Value:=rxFormaPagoformaPago.Value;
    dmingresos.tblIngresoMasterDOCUMENTO.Value := rxFacturaACobrarNumFactura.AsString;
    dmingresos.tblIngresoMasterCONCEPTO.Value  := rxFacturaACobrarConcepto.Value;
    if _codUsuario > 0 then
    dmingresos.tblIngresoMasterCOD_EMPLEADO.Value := _codUsuario
    else
    dmingresos.tblIngresoMasterCOD_EMPLEADO.Value := VarUsuarioGlb;
    dmingresos.tblIngresoMasterSTATUS.Value  := 'A';
    dmingresos.tblIngresoMasterIN_POR.Value  := strUserName;
    dmingresos.tblIngresoMasterFECHA_IN.Value:= Now;
    if (edtNota <> '') then
    dmingresos.tblIngresoMasterOBSERVACION.Value := edtNota;
    GlbSalvarQuery(dmingresos.tblIngresoMaster);

    //if Not CheckBox4.Checked then
    //Guardar Info Pago con Cheques
    //RegistrarDetalleCheque(dmIngresos.tblIngresoMasterNUMERO.AsInteger);

    strNumero := dmingresos.tblIngresoMasterNUMERO.AsString;

  rxFacturaACobrar.First;
  While Not rxFacturaACobrar.Eof do
  begin
    dmcxc.qrytrancxc.Insert;
    dmcxc.qryTrancxcnumero_recibo.Value:=dmingresos.tblIngresoMasterNumero.AsInteger;
    //dmcxc.qrytrancxcserie.Value := FsqlMaxNumero('TRANS_CXC','SERIE');
    //if dmcxc.qrytrancxcserie.Value = 0 then
    //dmcxc.qrytrancxcserie.Value          := 1;
    dmcxc.qrytrancxctipo_doc.Value       := 2; //Recibo
    dmcxc.qrytrancxccia_key.Value        := GlbCia_Key;
    dmcxc.qrytrancxcmoneda.Value         := dmingresos.tblIngresoMasterMONEDA.Value;
    //if GLBSAM = 1 then
    dmcxc.qrytrancxcfecha.Value := ExtraerFecha(GlbFechaTrnDiaria);
    //else
    //dmcxc.qrytrancxcfecha.Value := ExtraerFecha(GlbFechaTrnDiaria);
    
    dmcxc.qrytrancxcnumero_doc.Value     := rxFacturaACobrarNumFactura.Value;
    dmcxc.qrytrancxctipo_serv.Value      := 2;
    dmcxc.qrytrancxccodigo_cliente.Value := rxFacturaACobrarCodCte.Value;
    dmcxc.qrytrancxccodigo_serv.Value    := 0;
    dmcxc.qrytrancxcconcepto.Value       := rxFacturaACobrarConcepto.Value;
    dmcxc.qrytrancxcValor_documento.Value:= rxFacturaACobrarMontoAbonado.Value;
    dmcxc.qrytrancxcTipo_tranf.Value     := 2;
    if _codUsuario > 0 then
    dmcxc.qryTrancxcCODIGO_VENDEDOR.Value:= _codUsuario
    else
    dmcxc.qryTrancxcCODIGO_VENDEDOR.Value:= VarUsuarioGlb;
    dmcxc.qryTrancxcIN_POR.Value         := strusername;
    dmcxc.qryTrancxcFECHA_IN.Value       := Now;
    dmcxc.qrytrancxcStatus.Value         := 'A';
    dmcxc.qrytrancxc.Post;
    dmcxc.qrytrancxc.ApplyUpdates;

    //if Not CheckBox4.Checked then
    ProcUpdateFactPendiente;//Actualiza tabla factura pendiente

      stpactfctingresos.Params[0].value:= FsqlMaxNumero('FctIngresos','Serie');
      stpactfctingresos.Params[1].Value:= dmIngresos.tblIngresoMasterNUMERO.Value;
      stpactfctingresos.Params[2].Value:= rxFacturaACobrarNumFactura.Value;
      stpactfctingresos.Params[3].Value:= rxFacturaACobrarMontoAbonado.Value;
      stpactfctingresos.Params[4].Value:= dmingresos.tblIngresoMasterMONEDA.Value;//FrmRecibosYCtaXCobrar.qryFactPendMONEDA.Value;
      stpactfctingresos.Params[5].Value:= 'A';
      stpactfctingresos.Params[6].Value:= 0;//Renta Vehiculo;dmIngresos.tblIngresosDetCOD_SERVICIO.Value;
      stpactfctingresos.Params[7].Value:= rxFacturaACobrarTipoFactPend.Value;// := qryFactPendienteTIPO.Value;
      stpactfctingresos.Params[8].Value:= 2;//Recibos;
      stpactfctingresos.ExecProc;

      try
        stpactfctingresos.Transaction.CommitRetaining;
      except
      stpactfctingresos.Transaction.RollbackRetaining;
      end;

      if dmIngresos.tblIngresoDet.state = dsInactive then
      dmIngresos.tblIngresoDet.open;

      dmIngresos.tblIngresoDet.Insert;
      dmIngresos.tblIngresoDetSERIE_MASTER.AsInteger:= dmIngresos.tblIngresoMasterNUMERO.AsInteger;
      dmIngresos.tblIngresoDetNUMERO_ING.AsInteger:= dmIngresos.tblIngresoMasterNUMERO.AsInteger;
      dmIngresos.tblIngresoDetMonto_Fact_pendte.Value:= rxFacturaACobrarMontoFactura.Value;
      //0,//CodServicio

      dmIngresos.tblIngresoDetCOD_SERVICIO.Value:=0;
      dmIngresos.tblIngresoDetCOD_DEPARTAMENTO.Value := '2';//,//Depto
      dmIngresos.tblIngresoDetDETALLE.Value := rxFacturaACobrarConcepto.Value;
      //,//edtMontoApagar.ValueFloat,
      dmIngresos.tblIngresoDetVALOR_DET.Value := rxFacturaACobrarMontoAbonado.Value;
      dmIngresos.tblIngresoDetSTATUS.Value := 'A';
      dmIngresos.tblIngresoDetVALOR_IMPUESTO.Value:=0;
      dmIngresos.tblIngresoDetPORC_DESCUENTO.Value:=0;
      dmIngresos.tblIngresoDetFECHA_IN.Value:= Now;
      dmIngresos.tblIngresoDetIN_POR.Value  := StrUserName;
      dmIngresos.tblIngresoDetFCTING_SERIE.Value :=stpactfctingresos.Params[0].value;
      //dmIngresos.tblIngresoDetFECHA_MOD.Value := Null;//,
      //dmIngresos.tblIngresoDetMOD_POR.Value:= null;//,//FrmRecibosYCtaXCobrar.rxFormaPagoTipoTarjeta.Value,
      if (rxFormaPago.RecordCount = 1) then
      begin
        dmIngresos.tblIngresoDetTIPO_TARJETA.Value := rxFormaPagoTipoTarjeta.Value;
        dmIngresos.tblIngresoDetNUMERO_TARJETA_CRED.Value:= rxFormaPagoNumeroTarjeta.Value;
        dmIngresos.tblIngresoDetANO_VENCE.Value := rxFormaPagoAnio.Value;
        dmIngresos.tblIngresoDetMES_VENCE.Value := rxFormaPagoMes.Value;
        dmIngresos.tblIngresoDetMONTOAUTORIZADO.Value  := rxFormaPagoMONTOAUTORIZADO.Value;
        dmIngresos.tblIngresoDetNUMERO_APROBACION.Value:= rxFormaPagoNumeroAutorizacion.Value;
      end;
      dmIngresos.tblIngresoDettipo.Value:= 1;//,
      //dmIngresos.tblIngresoDetcodigo_proveedor.Value:=stpactfctingresos.Params[0].value//fct_serie tabla fctingreso
      //]);

      dmIngresos.tblIngresoDet.Edit;
      GlbSalvarQuery(dmIngresos.tblIngresoDet);
      rxFacturaACobrar.Next;
      end;
  if Not dmcxc.qrytrancxc.Transaction.InTransaction then
  dmcxc.qrytrancxc.transaction.StartTransaction;
  try
    dmcxc.qrytrancxc.transaction.CommitRetaining;
  except
  dmcxc.qrytrancxc.transaction.RollbackRetaining;
  end;

  if Not stp_UpdateCxc.Transaction.InTransaction then
  stp_UpdateCxc.transaction.StartTransaction;
  try
    stp_UpdateCxc.transaction.CommitRetaining;
  except
  stp_UpdateCxc.transaction.RollbackRetaining;
  end;
  
  //ibstpProcInsCxcHist.Params[0].Value:= Output Parameter
  ibstpProcInsCxcHist.Params[1].Value:= dmingresos.tblIngresoMasterNUMERO.AsInteger;
  ibstpProcInsCxcHist.Params[2].Value:= rxFacturaACobrarCodCte.Value;
  ibstpProcInsCxcHist.Params[3].Value:= Trim(dmingresos.tblIngresoMasterMONEDA.Value);
  ibstpProcInsCxcHist.ExecProc;
  ProcInsertarDetPagos(dmcxc.qryTrancxcSERIE.AsInteger);
end;

procedure TfrmProcPagoCxc.ProcInsertaFactura;
begin
  rxFacturaACobrar.Insert;
  rxFacturaACobrarTipoFactPend.Value := qryFactPendienteTIPO.Value;
  rxFacturaACobrarCodCte.Value       := qryFactPendienteCODIGO_CTE.Value;
  rxFacturaACobrarNumFactura.Value   := qryFactPendienteNUMERO_FACT.Value;
  rxFacturaACobrarTipoCobro.Value    := qryFactPendienteTIPO.Value;
  rxFacturaACobrarMontoFactura.Value := qryFactPendienteMONTO_PENDIENTE.Value;
  rxFacturaACobrarNombreCliente.Value:= qryFactPendienteNOMBRE_CTE.Value;
  //if not qryFactPendienteCONCEPTO.IsNull then
  //rxFacturaACobrarConceptoCxc.Value  :=qryFactPendienteCONCEPTO.Value
  //else
  rxFacturaACobrarConceptoCxc.Value  := 'Pago Servicio';
  //MontoDisponible:=
  if _MontoACobrar >= qryFactPendienteMONTO_PENDIENTE.Value then
  begin
    rxFacturaACobrarMontoAbonado.Value := _MontoACobrar;
    rxFacturaACobrarConcepto.Value:='Saldo';
  end else
  begin
    rxFacturaACobrarMontoAbonado.Value :=_MontoACobrar;
    rxFacturaACobrarConcepto.Value:='Abono';
  end;
  if (glbEcom = 1) and (rxFacturaACobrarConceptoCxc.Value <> '') then
  rxFacturaACobrarConcepto.Value:= rxFacturaACobrarConcepto.Value +' '+
  rxFacturaACobrarConceptoCxc.Value;
  rxFacturaACobrarMontoNCRAplicado.Value:=rxFacturaACobrarMontoAbonado.Value;
  rxFacturaACobrar.Post;
end;

procedure TfrmProcPagoCxc.ProcInsertarDetPagos(numtrn: integer);
begin
  if rxFormaPagoMONTOAUTORIZADO.IsNull then Exit;
  dmcxc.tblDetallePagos.Close;
  dmcxc.tblDetallePagos.Open;
  dmcxc.tblDetallePagos.Append;
  dmcxc.tblDetallePagosFECHA.Value              :=dmingresos.tblIngresoMasterFECHA.Value;
  dmcxc.tblDetallePagosTIPO_TARJETA.Value       :=rxFormaPagoTipoTarjeta.Value;
  dmcxc.tblDetallePagosNUMERO_TARJETA_CRED.Value:=rxFormaPagoNumeroTarjeta.Value;
  dmcxc.tblDetallePagosANO_VENCE.Value := rxFormaPagoAnio.Value;
  dmcxc.tblDetallePagosMES_VENCE.Value := rxFormaPagoMes.Value;
  dmcxc.tblDetallePagosMONTO_PAGADO.Value     := rxFormaPagoMONTOAUTORIZADO.Value;
  dmcxc.tblDetallePagosNUMERO_APROBACION.Value:= rxFormaPagoNumeroAutorizacion.Value;
  dmcxc.tblDetallePagosCODIGO_PROVEEDOR.Value := rxFormaPagoProveedorTarjeta.Value;

  dmcxc.tblDetallePagosTIPO.Value             := 2;//tarjeta
  dmcxc.tblDetallePagosTIPO_PAGO.Value        := 2;//tarjeta 
  dmcxc.tblDetallePagosNUMERO_CHEQUE.AsVariant   := null;//dmcxc.rxIngChequeDetNumero_Cheque.Value;
  dmcxc.tblDetallePagosCOD_BANCO_CHEQUE.AsVariant:= null;//dmcxc.rxIngChequeDetCodigo_Banco.Value;
  dmcxc.tblDetallePagosSERIE_TRN.Value           := numtrn;

  //No es necesario
  //dmcxc.tblDetallePagosGlbNumVtaPOS.Value        := GlbNumVtaPOS;
  dmcxc.tblDetallePagosAREA_TRANS.Value          := 2;//1-VENTAS, 2-Cuentas x Cobrar
  
  GlbSalvarQuery(dmcxc.tblDetallePagos);
end;

procedure TfrmProcPagoCxc.ProcUpdateFactPendiente;
begin
  //stp_UpdateCxc.Params[0].Value:= //Valor_Pendiente;
  stp_UpdateCxc.Params[1].Value:= 2;//tipo
  stp_UpdateCxc.Params[2].Value:= dmingresos.tblIngresoMasterMONEDA.Value;//moneda
  stp_UpdateCxc.Params[3].Value:= rxFacturaACobrarNumFactura.Value;//numero_fact
  stp_UpdateCxc.Params[4].Value:= rxFacturaACobrarMontoAbonado.Value;//monto_pagado
  stp_UpdateCxc.Params[5].Value:= 'A';//status
  stp_UpdateCxc.Params[6].Value:= 1;//accion 1 = abono
  stp_UpdateCxc.Params[7].Value:= rxFacturaACobrarCodCte.Value;//CODIGO_CTE_IN
  stp_UpdateCxc.Params[8].Value:= GlbFechaTrnDiaria;
  stp_UpdateCxc.Params[9].Value:= dmcxc.qrytrancxcserie.Value;

  stp_UpdateCxc.ExecProc; //UPDATE balance_cte, facturas_pendiente,
                          //TRANS_CXC = R

end;

procedure TfrmProcPagoCxc.FormCreate(Sender: TObject);
begin
  rxFacturaACobrar.Close;
  rxFacturaACobrar.Open;
end;

end.
