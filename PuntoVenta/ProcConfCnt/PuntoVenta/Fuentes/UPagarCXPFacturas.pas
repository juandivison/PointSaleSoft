unit UPagarCXPFacturas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, Grids, DBGrids, RXDBCtrl,
  WinSkinData, StdCtrls, EditNew, RxMemDS, Buttons, ExtCtrls, RXCtrls,
  IBStoredProc, Menus, RxLookup, IBSQL;

type
  TfrmPagarCXPFacturas = class(TForm)
    SkinData1: TSkinData;
    RxDBGrid1: TRxDBGrid;
    qryFactPendiente: TIBQuery;
    qryFactPendienteCODIGO_CTE: TIntegerField;
    qryFactPendienteFECHA: TDateTimeField;
    qryFactPendienteNOMBRE_CTE: TIBStringField;
    qryFactPendienteNOMBRE_FACTURAR: TIBStringField;
    qryFactPendienteTIPO: TIntegerField;
    qryFactPendienteMONEDA: TIBStringField;
    qryFactPendienteNUMERO_FACT: TIntegerField;
    qryFactPendienteMONTO_PENDIENTE: TFloatField;
    qryFactPendienteSTATUS: TIBStringField;
    dsqryFactPendiente: TDataSource;
    edtMontoAcobrar: TEditN;
    Label1: TLabel;
    RxDBGrid2: TRxDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    rxFacturaACobrar: TRxMemoryData;
    BitBtn5: TBitBtn;
    rxFacturaACobrarCodCte: TIntegerField;
    rxFacturaACobrarNumFactura: TIntegerField;
    rxFacturaACobrarTipoCobro: TSmallintField;
    Shape1: TShape;
    RxLabel1: TRxLabel;
    edtDisponible: TEditN;
    rxAcumulador: TRxMemoryData;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    dsrxFacturaACobrar: TDataSource;
    Label2: TLabel;
    RxLabel2: TRxLabel;
    stp_UpdateCxp: TIBStoredProc;
    RxSpeedButton5: TRxSpeedButton;
    PopupMenu1: TPopupMenu;
    BuscarCliente1: TMenuItem;
    ReImprimirRecibo1: TMenuItem;
    rxFacturaACobrarTipoFactPend: TIntegerField;
    rxFacturaACobrarformaPago: TIntegerField;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label15: TLabel;
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
    dsrxFormaPago: TDataSource;
    stpactfctRegPago: TIBStoredProc;
    RxLabel3: TRxLabel;
    ibsqlLastNum: TIBSQL;
    rxFacturaACobrarConcepto: TStringField;
    rxFacturaACobrarNombreCliente: TStringField;
    rxFacturaACobrarMontoAbonado: TCurrencyField;
    rxAcumuladorMonto: TCurrencyField;
    rxFormaPagoCodBanco: TIntegerField;
    Label3: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure RxDBGrid1Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure edtMontoAcobrarChange(Sender: TObject);
    procedure ReImprimirRecibo1Click(Sender: TObject);
    procedure BuscarCliente1Click(Sender: TObject);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure Label15Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
  private
    { Private declarations }
    Procedure ProcInsertaFactura(x:smallint; y:smallint);
    Function TotalFacturas : Extended;
    Procedure ProcSumar;
    Function SumarFactAcobrar : Extended;
    Procedure ProcFacturasACxp;
    procedure ProcUpdateFactPendiente;
    procedure guardarReciboMaster;
    procedure guardarReciboDetalle(descDetalle : String);
    procedure ImprimirRecibo(tipo :Smallint);
    function FNumReciboMax : Integer;
    procedure ProcIndicarNumdocCk;
    procedure ProcIndicarNumdocTarjeta;
  public
    { Public declarations }
    CodCte : Integer;
    strNombreEmpresa : String;
  end;

var
  frmPagarCXPFacturas: TfrmPagarCXPFacturas;
  cont : Integer;
  strNumero : String;

implementation

uses UDatModConectar, UGlobal, UDatModCxc, UDatModIngresos,
  UDatModUsuarios, URepReciboAbonoCXC, 
  UBuscarProveedores, UDatModProveedor, UDatModCxp, URepCompAbonoCXP,
  URegNumChequeCxp, URegNumTarjetaPagoCxp;

{$R *.dfm}

procedure TfrmPagarCXPFacturas.BitBtn1Click(Sender: TObject);
begin
  ProcInsertaFactura(1{solo fact actual},1{Completa});
  BitBtn7Click(Self);
end;

procedure TfrmPagarCXPFacturas.ProcInsertaFactura(x, y: smallint);
var
    i : Integer;
    MontoDisponible : Extended;
begin
  if rxfacturaacobrar.State = dsinactive then
  rxFacturaACobrar.Open;
  Case x Of
  2:begin //Solo factura seleccionada
    if (rxDBGrid1.SelectedRows.Count > 0) then
    with rxDBGrid1.DataSource.DataSet do
      for i:=0 to rxDBGrid1.SelectedRows.Count-1 do
      begin
        GotoBookmark(Pointer(rxDBGrid1.SelectedRows.Items[i]));
        if Not rxFacturaACobrar.Locate('NumFactura', qryFactPendienteNUMERO_FACT.Value,[]) then
        begin
          rxFacturaACobrar.Insert;
          rxFacturaACobrarTipoFactPend.Value := qryFactPendienteTIPO.Value;
          rxFacturaACobrarCodCte.Value       := qryFactPendienteCODIGO_CTE.Value;
          rxFacturaACobrarNumFactura.Value   := qryFactPendienteNUMERO_FACT.Value;
          rxFacturaACobrarTipoCobro.Value    := qryFactPendienteTIPO.Value;
          rxFacturaACobrarNombreCliente.Value:= qryFactPendienteNOMBRE_CTE.Value;

          if (edtMontoAcobrar.ValueFloat < qryFactPendienteMONTO_PENDIENTE.Value) then
          begin
            rxFacturaACobrarMontoAbonado.Value := edtMontoAcobrar.ValueFloat;
            rxFacturaACobrarConcepto.Value:= 'Abono';
          end else
          rxFacturaACobrarMontoAbonado.Value :=
          qryFactPendienteMONTO_PENDIENTE.Value;
          rxFacturaACobrarConcepto.Value:='Saldo';
          rxFacturaACobrar.Post;
        end;
      end;
    end;
  1:begin //Facturas seleccionadas
    if (rxDBGrid1.SelectedRows.Count = 1) then
    With rxDBGrid1.DataSource.DataSet Do
      For i:=0 to rxDBGrid1.SelectedRows.Count-1 Do
      Begin
        GotoBookmark(pointer(rxDBGrid1.SelectedRows.Items[i]));
        if Not rxFacturaACobrar.locate('NumFactura', qryFactPendienteNUMERO_FACT.Value,[]) then
        Begin
          rxFacturaACobrar.Insert;
          rxFacturaACobrarTipoFactPend.Value := qryFactPendienteTIPO.Value;
          rxFacturaACobrarCodCte.Value       := qryFactPendienteCODIGO_CTE.Value;
          rxFacturaACobrarNumFactura.Value   := qryFactPendienteNUMERO_FACT.Value;
          rxFacturaACobrarTipoCobro.Value    := qryFactPendienteTIPO.Value;
          rxFacturaACobrarNombreCliente.Value:= qryFactPendienteNOMBRE_CTE.Value;
          if (qryFactPendienteMONTO_PENDIENTE.Value > edtDisponible.ValueFloat) then
          begin
            rxFacturaACobrarMontoAbonado.Value := edtDisponible.ValueFloat;
            rxFacturaACobrarConcepto.Value := 'Abono';
          end else
          begin
            rxFacturaACobrarMontoAbonado.Value :=qryFactPendienteMONTO_PENDIENTE.Value;
            rxFacturaACobrarConcepto.Value := 'Saldo';
          end;
          rxFacturaACobrar.Post;
        end;
      end;
    end;
  end;
end;

procedure TfrmPagarCXPFacturas.RxDBGrid1Exit(Sender: TObject);
begin
  //if rxDBGrid1.SelectedRows.Count > 1 then
  //begin
  //  RadioButton1.Checked := True;
  //end;
  ProcSumar;
end;

procedure TfrmPagarCXPFacturas.FormShow(Sender: TObject);
begin
  qryFactPendiente.Close;
  qryFactPendiente.Params[0].Value:= CodCte;
  qryFactPendiente.Open;
  edtMontoAcobrar.SetFocus;
end;

procedure TfrmPagarCXPFacturas.BitBtn5Click(Sender: TObject);
begin
  if rxFacturaACobrar.RecordCount = 0 then
  begin
    MessageDlg('No hay datos para procesar.', mtError, [mbOK], 0);
    Exit;
  end;
  if rxFormaPagoformaPago.IsNull then
  begin
    MessageDlg('Favor indicar forma de pago.', mtError, [mbOK], 0);
    RxDBLookupCombo1.SetFocus;
    Exit;
  end;
  if SumarFactAcobrar <> (edtMontoAcobrar.ValueFloat) then
  begin
    MessageDlg('Favor verificar monto factura(s) a pagar.', mtError, [mbOK], 0);
    Exit;
  end;
  if (edtDisponible.ValueFloat > 0) then
  begin
    MessageDlg('Monto pendiente debe ser igual a cero (0).', mtError, [mbOK], 0);
    Exit;
  end;
  RxDBLookupCombo1Exit(Self);
  ProcFacturasACxp;//Registrar pago en tabla trans_cxP

  RxLabel3.Caption :='Ult. Comprobante: '+InttoStr(FNumReciboMax);
  ImprimirRecibo(0);
  rxFacturaACobrar.Close;
  rxFacturaACobrar.Open;
  edtDisponible.SetFloat(0);
  edtMontoAcobrar.SetFloat(0);
  BitBtn6Click(Self);
  RxLabel3.Caption :='Ult. Comprobante: '+InttoStr(FNumReciboMax);
end;

procedure TfrmPagarCXPFacturas.FormCreate(Sender: TObject);
begin
  dmIngresos.tblFormaPago.close;
  dmIngresos.tblFormaPago.Open;
  dmUsuarios.qryUsuarios.close;
  dmUsuarios.qryUsuarios.open;
  rxAcumulador.Close;
  rxAcumulador.Open;
  cont:=0;
  CodCte:=0;
  rxFormaPago.Close;
  rxFormaPago.Open;
  rxFormaPago.Insert;
  rxFormaPago.Insert;
  dmCxp.qryPagosCxp.Close;
  dmCxp.qryPagosCxp.Open;
  RxLabel3.Caption :='Ult. #comp: '+InttoStr(FNumReciboMax);
end;

procedure TfrmPagarCXPFacturas.BitBtn6Click(Sender: TObject);
begin
  rxAcumulador.Close;
  rxAcumulador.Open;
  rxFacturaACobrar.Close;
  rxFacturaACobrar.Open;
  qryfactpendiente.Close;
  qryfactpendiente.Open;
  BitBtn7Click(Self);
end;

function TfrmPagarCXPFacturas.TotalFacturas: Extended;
var
   monto : Extended;
   i : integer;
begin
  monto:=0;
  if (rxDBGrid1.SelectedRows.Count > 0) then
  with rxDBGrid1.DataSource.DataSet do
  for i:=0 to rxDBGrid1.SelectedRows.Count-1 do
  begin
    GotoBookmark(pointer(rxDBGrid1.SelectedRows.Items[i]));
    monto := monto + qryFactPendienteMONTO_PENDIENTE.Value;
  end;
  result := monto;
end;

procedure TfrmPagarCXPFacturas.ProcSumar;
  var
    x : Integer;
begin
  if Not Assigned(frmPagarCXPFacturas) then Exit;

  if frmPagarCXPFacturas.Showing then
  begin
    if rxAcumulador.Recordcount = 0 then
    begin
      rxAcumulador.Insert;
      rxAcumuladorMonto.Value := 0;
      rxAcumulador.Post;
    end;
    rxAcumulador.Edit;
    
    if (edtMontoAcobrar.ValueFloat > 0) then
    rxAcumuladorMonto.Value:=edtMontoAcobrar.ValueFloat - SumarFactAcobrar;

    if (rxAcumuladorMonto.Text <> '') then
    begin
      try
        if (rxAcumuladorMonto.Value >= 0) then
        edtDisponible.SetFloat(rxAcumuladorMonto.Value);
      except
      end;
    end;
    if (edtDisponible.ValueFloat < 0) then
    RxLabel1.Font.Color:= clRed else
    RxLabel1.Font.Color:= clWindowText;
    rxAcumulador.Post;
  end;
end;

procedure TfrmPagarCXPFacturas.BitBtn7Click(Sender: TObject);
begin
  ProcSumar;
end;

procedure TfrmPagarCXPFacturas.BitBtn3Click(Sender: TObject);
begin
  ProcInsertaFactura(2{solo fact actual},1{Completa});
  BitBtn7Click(Self);
end;

procedure TfrmPagarCXPFacturas.BitBtn2Click(Sender: TObject);
begin
  if rxFacturaACobrar.RecordCount > 0 then
  rxFacturaACobrar.Delete;
  BitBtn7Click(Self);
end;

procedure TfrmPagarCXPFacturas.BitBtn4Click(Sender: TObject);
begin
  if MessageDlg('Cancelar facturas seleccionadas?', mtInformation, [mbyes, mbno], 0)=mryes then
  begin
    rxFacturaACobrar.First;
    While Not rxFacturaACobrar.Eof Do
    begin
      rxFacturaACobrar.Delete;
    end;
  end;
  BitBtn7Click(Self);
end;


function TfrmPagarCXPFacturas.SumarFactAcobrar: Extended;
var
  t : Extended;
begin
  t:=0;
  if rxFacturaACobrar.State = dsInactive then
  begin
   result:=0;
   Exit;
  end;
  rxFacturaACobrar.first;
  While Not rxFacturaACobrar.eof do
  begin
    t:=t + rxFacturaACobrarMontoAbonado.Value;
    rxFacturaACobrar.Next;
  end;
  result := t;
  RxLabel2.Caption:= InsertarComa(FloatToStr(t));
  //if (edtMontoAcobrar.ValueFloat >= t) then
  //RadioButton1.Checked := true
  //else
  //if (edtMontoAcobrar.ValueFloat < t) then
  //RadioButton1.Checked:=True;
end;

procedure TfrmPagarCXPFacturas.edtMontoAcobrarChange(Sender: TObject);
begin
  if edtMontoAcobrar.ValueFloat > 0 then
  begin
  BitBtn1.Enabled:=True;
  BitBtn2.Enabled:=True;
  BitBtn3.Enabled:=True;
  BitBtn4.Enabled:=True;
  end else
  begin
  BitBtn1.Enabled:=False;
  BitBtn2.Enabled:=False;
  BitBtn3.Enabled:=False;
  BitBtn4.Enabled:=False;
  end;
end;

procedure TfrmPagarCXPFacturas.ProcFacturasACxp;
var
str : string;
begin
  if dmcxp.tblTransCxp.State = dsInactive then
  begin
    dmcxp.tblTransCxp.Close;
    dmcxp.tblTransCxp.Open;
  end;
    if dmCxp.qryPagosCxp.state = dsInactive then
    dmCxp.qryPagosCxp.Open;
    dmCxp.qryPagosCxp.Insert;
    dmCxp.qryPagosCxpSERIE.Value  :=FsqlMaxNumero('pagos_cxp_master','Serie');
    dmCxp.qryPagosCxpTIPO.Value   :=rxFacturaACobrarTipoFactPend.Value;
    dmCxp.qryPagosCxpNUMERO.Value := FsqlMaxNumero('pagos_cxp_master','numero');
    dmCxp.qryPagosCxpMONEDA.Value := '1';
    dmCxp.qryPagosCxpFECHA.Value  := ExtraerFecha(glbFechatrnDiaria);
    dmCxp.qryPagosCxpVALOR_ING.Value   := SumarFactAcobrar;//edtmontoApagar.ValueFloat,
    dmCxp.qryPagosCxpTIPO_ING.Value    := 2;//Credito, tipo_ing
    dmCxp.qryPagosCxpNOMBRE_CTE.Value  := rxFacturaACobrarNombreCliente.Value;
    dmCxp.qryPagosCxpCODIGO_CTE.Value  := rxFacturaACobrarCodCte.Value;
    dmCxp.qryPagosCxpCOD_SERVICIO.Value:= 0;//codservicio
    dmCxp.qryPagosCxpFORMA_PAGO.Value  := rxFormaPagoformaPago.Value;
    dmCxp.qryPagosCxpDOCUMENTO.Value   := rxFacturaACobrarNumFactura.AsString;
    dmCxp.qryPagosCxpCONCEPTO.Value    := rxFacturaACobrarConcepto.Value;
    dmCxp.qryPagosCxpSTATUS.Value      := 'A';
    dmCxp.qryPagosCxpIN_POR.Value      := strUserName;
    dmCxp.qryPagosCxpNUM_CHEQ_COMP.Value := rxFormaPagoNumeroDocumento.Value;
    dmcxp.qryPagosCxpCOD_BANCO.Value     := rxFormaPagoCodBanco.Value;
    dmCxp.qryPagosCxpFECHA_IN.Value      := Now;
    dmCxp.qryPagosCxp.Post;
    dmCxp.qryPagosCxp.ApplyUpdates;
    if Not dmCxp.qryPagosCxp.Transaction.InTransaction then
    dmCxp.qryPagosCxp.Transaction.StartTransaction;
    try
      dmCxp.qryPagosCxp.Transaction.CommitRetaining;
    except
    dmCxp.qryPagosCxp.Transaction.RollbackRetaining;
    end;

  strNumero := dmCxp.qryPagosCxpNUMERO.AsString;
  rxFacturaACobrar.First;
  While Not rxFacturaACobrar.Eof do
  begin
    dmcxp.tblTransCxp.Insert;
    //dmcxp.tblTransCxpnumero_recibo.Value:=dmCxp.qryPagosCxpNumero.AsInteger;
    dmcxp.tblTransCxpserie.Value := FsqlMaxNumero('TRANS_CXP','SERIE');
    if dmcxp.tblTransCxpserie.Value = 0 then
    dmcxp.tblTransCxpserie.Value          := 1;
    dmcxp.tblTransCxptipo_doc.Value       := 2; //Recibo
    dmcxp.tblTransCxpmoneda.Value         := '1';
    dmcxp.tblTransCxpfecha.Value          := ExtraerFecha(GlbFechaTrnDiaria);
    dmcxp.tblTransCxpnumero_doc.Value     := rxFacturaACobrarNumFactura.Value;
    dmcxp.tblTransCxptipo_serv.Value      := 2;
    dmcxp.tblTransCxpcodigo_cliente.Value := rxFacturaACobrarCodCte.Value;
    dmcxp.tblTransCxpcodigo_serv.Value    := 0;
    dmcxp.tblTransCxpconcepto.Value       := rxFacturaACobrarConcepto.Value;
    dmcxp.tblTransCxpValor_documento.Value:= rxFacturaACobrarMontoAbonado.Value;
    dmcxp.tblTransCxpTipo_tranf.Value     := 2;
    dmcxp.tblTransCxpStatus.Value         := 'A';
    dmcxp.tblTransCxp.Post;
    dmcxp.tblTransCxp.ApplyUpdates;

    ProcUpdateFactPendiente;//Actualiza tabla factura pendiente

      str := stpactfctRegPago.Database.DatabaseName;
      stpactfctRegPago.Params[0].value:= FsqlMaxNumero('FCTPAGOSCXCP','Serie');
      stpactfctRegPago.Params[1].Value:= dmCxp.qryPagosCxpNUMERO.Value;
      stpactfctRegPago.Params[2].Value:= rxFacturaACobrarNumFactura.Value;
      stpactfctRegPago.Params[3].Value:= rxFacturaACobrarMontoAbonado.Value;
      stpactfctRegPago.Params[4].Value:= '1';//FrmRecibosYCtaXCobrar.qryFactPendMONEDA.Value;
      stpactfctRegPago.Params[5].Value:= 'A';
      stpactfctRegPago.Params[6].Value:= 0;//Renta Vehiculo;dmIngresos.tblIngresosDetCOD_SERVICIO.Value;
      stpactfctRegPago.Params[7].Value:= rxFacturaACobrarTipoFactPend.Value;// := qryFactPendienteTIPO.Value;
      stpactfctRegPago.Params[8].Value:= 2;//Recibos;
      stpactfctRegPago.ExecProc;

      try
        stpactfctRegPago.Transaction.CommitRetaining;
      except
      stpactfctRegPago.Transaction.RollbackRetaining;
      end;

      if dmcxp.qryPagoCxpDet.state = dsInactive then
      dmcxp.qryPagoCxpDet.open;
      dmcxp.qryPagoCxpDet.InsertRecord(
      [FsqlMaxNumero('pagos_cxp_det','Serie'),
      dmCxp.qryPagosCxpNUMERO.Value,
      dmCxp.qryPagosCxpNUMERO.Value,
      0,//CodServicio
      2,//Depto
      rxFacturaACobrarConcepto.Value,
      rxFacturaACobrarMontoAbonado.Value,//edtMontoApagar.ValueFloat,
      'A', 0, 0, Date, Trim(StrUserName), Null, Null,
      null,//FrmRecibosYCtaXCobrar.rxFormaPagoTipoTarjeta.Value,
      null,//FrmRecibosYCtaXCobrar.rxFormaPagoNumeroTarjeta.Value,
      null,//FrmRecibosYCtaXCobrar.rxFormaPagoAnio.Value,
      null,//FrmRecibosYCtaXCobrar.rxFormaPagoMes.Value,
      null,//FrmRecibosYCtaXCobrar.rxFormaPagoMONTOAUTORIZADO.Value,
      null,//FrmRecibosYCtaXCobrar.rxFormaPagoNumeroAutorizacion.Value,
      1, null,
      stpactfctRegPago.Params[0].value//fct_serie tabla fctingreso
      ]);

      dmcxp.qryPagoCxpDet.Edit;
      dmcxp.qryPagoCxpDet.Post;
      dmcxp.qryPagoCxpDet.ApplyUpdates;
      if Not dmcxp.qryPagoCxpDet.Transaction.InTransaction then
      dmcxp.qryPagoCxpDet.Transaction.StartTransaction;
      try
        dmcxp.qryPagoCxpDet.Transaction.CommitRetaining;
      except
      dmcxp.qryPagoCxpDet.Transaction.RollbackRetaining;
      end;
      rxFacturaACobrar.Next;
      end;
  if Not dmcxp.tblTransCxp.Transaction.InTransaction then
  dmcxp.tblTransCxp.transaction.StartTransaction;
  try
    dmcxp.tblTransCxp.transaction.CommitRetaining;
  except
  dmcxp.tblTransCxp.transaction.RollbackRetaining;
  end;

  if Not stp_UpdateCxp.Transaction.InTransaction then
  stp_UpdateCxp.transaction.StartTransaction;
  try
    stp_UpdateCxp.transaction.CommitRetaining;
  except
  stp_UpdateCxp.transaction.RollbackRetaining;
  end;
end;

procedure TfrmPagarCXPFacturas.ProcUpdateFactPendiente;
begin
  //stp_UpdateCxc.Params[0].Value:= //Valor_Pendiente;
  stp_UpdateCxp.Params[1].Value:= 0;//tipo
  stp_UpdateCxp.Params[2].Value:= '1';//moneda
  stp_UpdateCxp.Params[3].Value:= rxFacturaACobrarNumFactura.Value;//numero_fact
  stp_UpdateCxp.Params[4].Value:= rxFacturaACobrarMontoAbonado.Value;//monto_pagado
  stp_UpdateCxp.Params[5].Value:= 'A';//status
  stp_UpdateCxp.Params[6].Value:= 1;//accion 1 = abono
  stp_UpdateCxp.Params[7].Value:= rxFacturaACobrarCodCte.Value;//CODIGO_CTE_IN
  stp_UpdateCxp.Params[8].Value:= GlbFechaTrnDiaria;
  stp_UpdateCxp.Params[9].Value:= dmcxp.tblTransCxpSERIE.Value;

  stp_UpdateCxp.ExecProc;    //UPDATE balance_cte, facturas_pendiente,
                             //TRANS_CXC = R
end;

procedure TfrmPagarCXPFacturas.GuardarReciboMaster;
begin
end;

procedure TfrmPagarCXPFacturas.guardarReciboDetalle(descDetalle : String);
begin
end;

procedure TfrmPagarCXPFacturas.ImprimirRecibo(tipo :smallint);
begin
  if tipo = 1 then
  begin
    strNumero := InputBox('Imprimir comprobante de pago','Entre Número de comprobante','');
    dmcxp.qryRepPgoMaster.Close;
    dmcxp.qryRepPgoMaster.Params[0].Value:= StrToInt(strNumero);
    dmcxp.qryRepPgoMaster.Open;
  end else
  begin
    dmcxp.qryRepPgoMaster.Close;
    dmcxp.qryRepPgoMaster.Params[0].Value:= StrToInt(strNumero);
    dmcxp.qryRepPgoMaster.Open;
  end;
  dmUsuarios.qryUsuarios.Locate('CODIGO_EMPLEADO',VarUsuarioGlb,[]);
  //qckReciboIngreso:=TqckReciboIngreso.Create(Nil);
  QckRepCompAbonoCXP:=TQckRepCompAbonoCXP.Create(nil);
  try
    QckRepCompAbonoCXP.LabelNombUser.Caption:= dmUsuarios.qryUsuariosNOMBRECOMPLETO.Value;
    //QckRepCompAbonoCXP.qrLabelReimprimir.Caption:=;//aqui aqui aqui
    if dmCxp.qryPagosCxpSTATUS.Value = 'P' then
    begin
      QckRepCompAbonoCXP.qrLabelReimprimir.Caption:='Re-Impresion';
      QckRepCompAbonoCXP.qrLabelReimprimir.Enabled:=True;
    end else
    QckRepCompAbonoCXP.qrLabelReimprimir.Caption:='';

    if dmcxp.qryPagoCxpDet.RecordCount > 1 then
    begin
      QckRepCompAbonoCXP.Page.Length := QckRepCompAbonoCXP.Page.Length +
      dmcxp.qryPagoCxpDet.RecordCount * 1.15;
    end;
    if  MessageDlg('Imprimir?',mtInformation, [mbyes, mbno], 0) = mryes then
    begin
      QckRepCompAbonoCXP.PrinterSetup;
      QckRepCompAbonoCXP.Print;
    end else
    QckRepCompAbonoCXP.Preview;
    if (dmCxp.qryPagosCxpSTATUS.Value = 'A') then
    begin
      QckRepCompAbonoCXP.qrLabelReimprimir.Caption:='';
      dmCxp.qryPagosCxp.Edit;
      dmCxp.qryPagosCxpSTATUS.Value := 'P';
      dmCxp.qryPagosCxp.Post;
      dmCxp.qryPagosCxp.ApplyUpdates;
      if Not dmCxp.qryPagosCxp.Transaction.InTransaction then
      dmCxp.qryPagosCxp.Transaction.StartTransaction;
      try
        dmCxp.qryPagosCxp.Transaction.CommitRetaining;
      except
      dmCxp.qryPagosCxp.Transaction.RollbackRetaining;
      end;
    end;
  finally
  QckRepCompAbonoCXP.Free;
  QckRepCompAbonoCXP:=Nil;
  end;
end;

procedure TfrmPagarCXPFacturas.ReImprimirRecibo1Click(Sender: TObject);
begin
  ImprimirRecibo(1);
end;

procedure TfrmPagarCXPFacturas.BuscarCliente1Click(Sender: TObject);
begin
  frmProcBuscarProv:=TfrmProcBuscarProv.Create(Nil);
  try
    if frmProcBuscarProv.Showmodal = mrOk then
    begin
      CodCte:=dmproveedor.qryProveCxpCODIGO_CTE.Value;
      strNombreEmpresa:= dmproveedor.qryProveCxpDESCRIPCION.Value;
      FormShow(Self);
    end;
  finally
  frmProcBuscarProv.Free;
  frmProcBuscarProv:=Nil;
  end;
end;

procedure TfrmPagarCXPFacturas.RxDBLookupCombo1Exit(Sender: TObject);
begin
  if rxFormaPago.State in [dsEdit, dsInsert] then
  rxFormaPago.Post;

end;

function TfrmPagarCXPFacturas.FNumReciboMax: Integer;
begin
  ibsqlLastNum.Close;
  ibsqlLastNum.ExecQuery;
  Result := ibsqlLastNum.FieldByName('numeromax').AsInteger;
end;

procedure TfrmPagarCXPFacturas.ProcIndicarNumdocCk;
begin
  frmRegNumCheque:=tFrmRegNumCheque.Create(Nil);
  try
    if frmRegNumCheque.Showmodal = mrok then
    rxFormaPago.Post
    else rxFormaPago.Cancel;
  finally
  frmRegNumCheque.Free;
  frmRegNumCheque:=Nil;
  end;
end;

procedure TfrmPagarCXPFacturas.ProcIndicarNumdocTarjeta;
begin
  frmRegNumTarjeta:=tFrmRegNumTarjeta.Create(Nil);
  try
    if frmRegNumTarjeta.Showmodal = mrOk then
    rxFormaPago.Post
    else rxFormaPago.cancel;
  finally
  frmRegNumTarjeta.Free;
  frmRegNumTarjeta:=Nil;
  end;
end;

procedure TfrmPagarCXPFacturas.Label15Click(Sender: TObject);
begin
  if rxFormaPago.State = dsbrowse then
  rxFormaPago.Edit;
  if (rxFormaPagoformaPago.Value = 3) then
  begin
    rxFormaPago.Edit;
    ProcIndicarNumdocCk
  end else
  if (rxFormaPagoformaPago.Value = 2) then
  begin
    rxFormaPago.Edit;
    ProcIndicarNumdocTarjeta;
  end;
end;

procedure TfrmPagarCXPFacturas.Label3Click(Sender: TObject);
begin
  Label15Click(Self)
end;

end.
