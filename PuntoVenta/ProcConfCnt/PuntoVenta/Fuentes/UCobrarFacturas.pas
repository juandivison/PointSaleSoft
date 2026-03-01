unit UCobrarFacturas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, Grids, DBGrids, RXDBCtrl,
  WinSkinData, StdCtrls, EditNew, RxMemDS, Buttons, ExtCtrls, RXCtrls,
  IBStoredProc, Menus, RxLookup, IBSQL;

type
  TfrmCobrarFacturas = class(TForm)
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
    rxFacturaACobrarMontoAbonado: TFloatField;
    rxFacturaACobrarTipoCobro: TSmallintField;
    Shape1: TShape;
    RxLabel1: TRxLabel;
    edtDisponible: TEditN;
    rxAcumulador: TRxMemoryData;
    rxAcumuladorMonto: TFloatField;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    dsrxFacturaACobrar: TDataSource;
    Label2: TLabel;
    RxLabel2: TRxLabel;
    stp_UpdateCxc: TIBStoredProc;
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
    stpactfctingresos: TIBStoredProc;
    RxLabel3: TRxLabel;
    ibsqlLastNum: TIBSQL;
    rxFacturaACobrarConcepto: TStringField;
    rxFacturaACobrarNombreCliente: TStringField;
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
  private
    { Private declarations }
    Procedure ProcInsertaFactura(x:smallint; y:smallint);
    Function TotalFacturas:Real;
    Procedure ProcSumar;
    Function SumarFactAcobrar:Real;
    Procedure ProcFacturasACxc;
    procedure ProcUpdateFactPendiente;
    procedure guardarReciboMaster;
    procedure guardarReciboDetalle(descDetalle : String);
    procedure ImprimirRecibo(tipo :smallint);
    function FNumReciboMax : Integer;
  public
    { Public declarations }
    CodCte : Integer;
    strNombreEmpresa : String;
  end;

var
  frmCobrarFacturas: TfrmCobrarFacturas;
  cont : Integer;
  strNumero : String;

implementation

uses UDatModConectar, UGlobal, UDatModCxc, UDatModIngresos,
  UDatModUsuarios, URepReciboAbonoCXC, UBuscarClientesPersonasP;

{$R *.dfm}

procedure TfrmCobrarFacturas.BitBtn1Click(Sender: TObject);
begin
  ProcInsertaFactura(1{solo fact actual},1{Completa});
  BitBtn7Click(Self);
end;

procedure TfrmCobrarFacturas.ProcInsertaFactura(x, y: smallint);
var i:integer;
    MontoDisponible : Real;
begin
  if rxfacturaacobrar.State = dsinactive then
  rxFacturaACobrar.Open;
  Case x Of
  2:begin //Solo factura seleccionada
    if (rxDBGrid1.SelectedRows.Count > 0) then
    with rxDBGrid1.DataSource.DataSet do
      for i:=0 to rxDBGrid1.SelectedRows.Count-1 do
      begin
        GotoBookmark(pointer(rxDBGrid1.SelectedRows.Items[i]));
        if not rxFacturaACobrar.locate('numfactura',qryFactPendienteNUMERO_FACT.Value,[]) then
        begin
          rxFacturaACobrar.Insert;
          rxFacturaACobrarTipoFactPend.Value := qryFactPendienteTIPO.Value;
          rxFacturaACobrarCodCte.Value       := qryFactPendienteCODIGO_CTE.Value;
          rxFacturaACobrarNumFactura.Value   := qryFactPendienteNUMERO_FACT.Value;
          rxFacturaACobrarTipoCobro.Value    := qryFactPendienteTIPO.Value;
          rxFacturaACobrarNombreCliente.Value:= qryFactPendienteNOMBRE_CTE.Value;
          //MontoDisponible:=
          if edtMontoAcobrar.ValueFloat < qryFactPendienteMONTO_PENDIENTE.Value then
          begin
            rxFacturaACobrarMontoAbonado.Value := edtMontoAcobrar.ValueFloat;
            rxFacturaACobrarConcepto.Value:='Abono';
          end else
          rxFacturaACobrarMontoAbonado.Value :=
          qryFactPendienteMONTO_PENDIENTE.Value;// - edtMontoAcobrar.ValueFloat;
          rxFacturaACobrarConcepto.Value:='Saldo';
          rxFacturaACobrar.Post;
        end;
      end;
    end;
  1:begin //Facturas seleccionadas
    if (rxDBGrid1.SelectedRows.Count = 1) then
    with rxDBGrid1.DataSource.DataSet do
      for i:=0 to rxDBGrid1.SelectedRows.Count-1 do
      begin
        GotoBookmark(pointer(rxDBGrid1.SelectedRows.Items[i]));
        if not rxFacturaACobrar.locate('numfactura',qryFactPendienteNUMERO_FACT.Value,[]) then
        begin
          rxFacturaACobrar.Insert;
          rxFacturaACobrarTipoFactPend.Value := qryFactPendienteTIPO.Value;
          rxFacturaACobrarCodCte.Value       := qryFactPendienteCODIGO_CTE.Value;
          rxFacturaACobrarNumFactura.Value   := qryFactPendienteNUMERO_FACT.Value;
          rxFacturaACobrarTipoCobro.Value    := qryFactPendienteTIPO.Value;
          rxFacturaACobrarNombreCliente.Value:= qryFactPendienteNOMBRE_CTE.Value;
          //t if qryFactPendienteMONTO_PENDIENTE.Value > edtMontoAcobrar.ValueFloat then
          if qryFactPendienteMONTO_PENDIENTE.Value > edtDisponible.ValueFloat then
          begin
            rxFacturaACobrarMontoAbonado.Value := edtDisponible.ValueFloat;
            rxFacturaACobrarConcepto.Value:='Abono';
          end else
          begin
            rxFacturaACobrarMontoAbonado.Value :=qryFactPendienteMONTO_PENDIENTE.Value;
            rxFacturaACobrarConcepto.Value:='Saldo';
          end;
          rxFacturaACobrar.Post;
        end;
      end;
    end;
  end;
end;

procedure TfrmCobrarFacturas.RxDBGrid1Exit(Sender: TObject);
begin
  //if rxDBGrid1.SelectedRows.Count > 1 then
  //begin
  //  RadioButton1.Checked := True;
  //end;
  ProcSumar;
end;

procedure TfrmCobrarFacturas.FormShow(Sender: TObject);
begin
  qryFactPendiente.Close;
  qryFactPendiente.Params[0].Value:= CodCte;
  qryFactPendiente.Open;
  edtMontoAcobrar.SetFocus;
end;

procedure TfrmCobrarFacturas.BitBtn5Click(Sender: TObject);
begin
  if rxFormaPagoformaPago.IsNull then
  begin
    MessageDlg('Favor indicar forma de pago.', mtError, [mbOK], 0);
    RxDBLookupCombo1.SetFocus;
    Exit;
  end;
  if SumarFactAcobrar <> (edtMontoAcobrar.ValueFloat) then
  begin
    MessageDlg('Favor verificar monto factura(s) a cobrar.', mtError, [mbOK], 0);
    Exit;
  end;
  if (edtDisponible.ValueFloat > 0) then
  begin
    MessageDlg('Monto pendiente debe ser igual a cero (0).', mtError, [mbOK], 0);
    Exit;
  end;
  RxDBLookupCombo1Exit(Self);
  ProcFacturasACxc;//Registrar pago en tabla trans_cxc

  RxLabel3.Caption :='Ult. Recibo: '+InttoStr(FNumReciboMax);
  ImprimirRecibo(0);
  rxFacturaACobrar.Close;
  rxFacturaACobrar.Open;
  edtDisponible.SetFloat(0);
  edtMontoAcobrar.SetFloat(0);
  BitBtn6Click(Self);
  RxLabel3.Caption :='Ult. Recibo: '+InttoStr(FNumReciboMax);
end;

procedure TfrmCobrarFacturas.FormCreate(Sender: TObject);
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
  dmingresos.tblIngresoMaster.Close;
  dmingresos.tblIngresoMaster.Open;
  RxLabel3.Caption :='Ult. Recibo: '+InttoStr(FNumReciboMax);
end;

procedure TfrmCobrarFacturas.BitBtn6Click(Sender: TObject);
begin
  rxAcumulador.Close;
  rxAcumulador.Open;
  rxFacturaACobrar.Close;
  rxFacturaACobrar.Open;
  qryfactpendiente.Close;
  qryfactpendiente.Open;
  BitBtn7Click(Self);
end;

function TfrmCobrarFacturas.TotalFacturas: Real;
var
   monto : Real;
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

procedure TfrmCobrarFacturas.ProcSumar;
  var
    x : Integer;
begin
  if Not Assigned(frmCobrarFacturas) then Exit;
  
  if frmCobrarFacturas.Showing then
  begin
    if rxAcumulador.recordcount = 0 then
    begin
      rxAcumulador.Insert;
      rxAcumuladorMonto.Value:=0;
      rxAcumulador.Post;
    end;
    rxAcumulador.Edit;
    rxAcumuladorMonto.Value:=edtMontoAcobrar.ValueFloat - SumarFactAcobrar;
    if (rxAcumuladorMonto.Text <> '') then
    begin
      try
        if (rxAcumuladorMonto.Value >= 0) then
        edtDisponible.SetFloat(rxAcumuladorMonto.Value);
      except
      end;
    end;
    if edtDisponible.ValueFloat < 0 then
       RxLabel1.Font.Color:=clRed else
    RxLabel1.Font.Color:= clWindowText;
    rxAcumulador.Post;
  end;
end;

procedure TfrmCobrarFacturas.BitBtn7Click(Sender: TObject);
begin
  ProcSumar;
end;

procedure TfrmCobrarFacturas.BitBtn3Click(Sender: TObject);
begin
  ProcInsertaFactura(2{solo fact actual},1{Completa});
  BitBtn7Click(Self);
end;

procedure TfrmCobrarFacturas.BitBtn2Click(Sender: TObject);
begin
  if rxFacturaACobrar.RecordCount > 0 then
  rxFacturaACobrar.Delete;
  BitBtn7Click(Self);
end;

procedure TfrmCobrarFacturas.BitBtn4Click(Sender: TObject);
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


function TfrmCobrarFacturas.SumarFactAcobrar: Real;
var
  t : Real;
begin
  t:=0;
  if rxFacturaACobrar.State = dsInactive then Exit;  
  rxFacturaACobrar.first;
  while not rxFacturaACobrar.eof do
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

procedure TfrmCobrarFacturas.edtMontoAcobrarChange(Sender: TObject);
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

procedure TfrmCobrarFacturas.ProcFacturasACxc;
begin
  if dmcxc.qryTrancxc.State = dsInactive then
  begin
    dmcxc.qrytrancxc.Close;
    dmcxc.qrytrancxc.Open;
  end;
    if dmingresos.tblIngresoMaster.state = dsInactive then
    dmingresos.tblIngresoMaster.Open;
    dmingresos.tblIngresoMaster.Insert;
    dmingresos.tblIngresoMasterSERIE.Value:= FsqlMaxNumero('ingresos','Serie');
    dmingresos.tblIngresoMasterTIPO.Value := rxFacturaACobrarTipoFactPend.Value;
    dmingresos.tblIngresoMasterNUMERO.Value := FsqlMaxNumero('ingresos','numero');
    dmingresos.tblIngresoMasterMONEDA.Value := '1';
    dmingresos.tblIngresoMasterFECHA.Value  := ExtraerFecha(glbFechatrnDiaria);
    dmingresos.tblIngresoMasterVALOR_ING.Value := SumarFactAcobrar;//edtmontoApagar.ValueFloat,
    dmingresos.tblIngresoMasterTIPO_ING.Value  := 2;//Credito, tipo_ing
    dmingresos.tblIngresoMasterNOMBRE_CTE.Value:= rxFacturaACobrarNombreCliente.Value;
    dmingresos.tblIngresoMasterCODIGO_CTE.Value:= rxFacturaACobrarCodCte.Value;
    dmingresos.tblIngresoMasterCOD_SERVICIO.Value:= 0;//codservicio
    dmingresos.tblIngresoMasterFORMA_PAGO.Value:=rxFormaPagoformaPago.Value;
    dmingresos.tblIngresoMasterDOCUMENTO.Value := rxFacturaACobrarNumFactura.AsString;
    dmingresos.tblIngresoMasterCONCEPTO.Value  := rxFacturaACobrarConcepto.Value;
    dmingresos.tblIngresoMasterSTATUS.Value  := 'A';
    dmingresos.tblIngresoMasterIN_POR.Value  := strUserName;
    dmingresos.tblIngresoMasterFECHA_IN.Value:= Now;
    dmingresos.tblIngresoMaster.Post;
    dmingresos.tblIngresoMaster.ApplyUpdates;
    if Not dmingresos.tblIngresoMaster.Transaction.InTransaction then
    dmingresos.tblIngresoMaster.Transaction.StartTransaction;
    try
      dmingresos.tblIngresoMaster.Transaction.CommitRetaining;
    except
    dmingresos.tblIngresoMaster.Transaction.RollbackRetaining;
    end;

    strNumero := dmingresos.tblIngresoMasterNUMERO.AsString;
  rxFacturaACobrar.First;
  While Not rxFacturaACobrar.Eof do
  begin
    dmcxc.qrytrancxc.Insert;
    dmcxc.qryTrancxcnumero_recibo.Value:=dmingresos.tblIngresoMasterNumero.AsInteger;
    dmcxc.qrytrancxcserie.Value := FsqlMaxNumero('TRANS_CXC','SERIE');
    if dmcxc.qrytrancxcserie.Value = 0 then
    dmcxc.qrytrancxcserie.Value          := 1;
    dmcxc.qrytrancxctipo_doc.Value       := 2; //Recibo
    dmcxc.qrytrancxcmoneda.Value         := '1';
    dmcxc.qrytrancxcfecha.Value          := ExtraerFecha(GlbFechaTrnDiaria);
    dmcxc.qrytrancxcnumero_doc.Value     := rxFacturaACobrarNumFactura.Value;
    dmcxc.qrytrancxctipo_serv.Value      := 2;
    dmcxc.qrytrancxccodigo_cliente.Value := rxFacturaACobrarCodCte.Value;
    dmcxc.qrytrancxccodigo_serv.Value    := 0;
    dmcxc.qrytrancxcconcepto.Value       := rxFacturaACobrarConcepto.Value;
    dmcxc.qrytrancxcValor_documento.Value:= rxFacturaACobrarMontoAbonado.Value;
    dmcxc.qrytrancxcTipo_tranf.Value     := 2;
    dmcxc.qryTrancxcCODIGO_VENDEDOR.Value:= VarUsuarioGlb;
    dmcxc.qryTrancxcIN_POR.Value := strusername;
    dmcxc.qryTrancxcFECHA_IN.Value:=now;
    dmcxc.qrytrancxcStatus.Value         := 'A';
    dmcxc.qrytrancxc.Post;
    dmcxc.qrytrancxc.ApplyUpdates;

    ProcUpdateFactPendiente;//Actualiza tabla factura pendiente


      stpactfctingresos.Params[0].value:= FsqlMaxNumero('FctIngresos','Serie');
      stpactfctingresos.Params[1].Value:= dmIngresos.tblIngresoMasterNUMERO.Value;
      stpactfctingresos.Params[2].Value:= rxFacturaACobrarNumFactura.Value;
      stpactfctingresos.Params[3].Value:= rxFacturaACobrarMontoAbonado.Value;
      stpactfctingresos.Params[4].Value:= '1';//FrmRecibosYCtaXCobrar.qryFactPendMONEDA.Value;
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
      dmIngresos.tblIngresoDet.InsertRecord([
      FsqlMaxNumero('Ingresos_det','Serie'),
      dmIngresos.tblIngresoMasterNUMERO.Value,
      dmIngresos.tblIngresoMasterNUMERO.Value,
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
      stpactfctingresos.Params[0].value//fct_serie tabla fctingreso
      ]);

      dmIngresos.tblIngresoDet.Edit;
      dmIngresos.tblIngresoDet.Post;
      dmingresos.tblIngresoDet.ApplyUpdates;
      if Not dmingresos.tblIngresoDet.Transaction.InTransaction then
      dmingresos.tblIngresoDet.Transaction.StartTransaction;
      try
        dmingresos.tblIngresoDet.Transaction.CommitRetaining;
      except
      dmingresos.tblIngresoDet.Transaction.RollbackRetaining;
      end;
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
end;

procedure TfrmCobrarFacturas.ProcUpdateFactPendiente;
begin
  //stp_UpdateCxc.Params[0].Value:= //Valor_Pendiente;
  stp_UpdateCxc.Params[1].Value:= 2;//tipo
  stp_UpdateCxc.Params[2].Value:= '1';//moneda
  stp_UpdateCxc.Params[3].Value:= rxFacturaACobrarNumFactura.Value;//numero_fact
  stp_UpdateCxc.Params[4].Value:= rxFacturaACobrarMontoAbonado.Value;//monto_pagado
  stp_UpdateCxc.Params[5].Value:= 'A';//status
  stp_UpdateCxc.Params[6].Value:= 1;//accion 1 = abono
  stp_UpdateCxc.Params[7].Value:= rxFacturaACobrarCodCte.Value;//CODIGO_CTE_IN
  stp_UpdateCxc.Params[8].Value:= GlbFechaTrnDiaria;
  stp_UpdateCxc.Params[9].Value:= dmcxc.qrytrancxcserie.Value;

  stp_UpdateCxc.ExecProc;    //UPDATE balance_cte, facturas_pendiente,
                             //TRANS_CXC = R
end;

procedure TfrmCobrarFacturas.GuardarReciboMaster;
begin
end;

procedure TfrmCobrarFacturas.guardarReciboDetalle(descDetalle : String);
begin
end;

procedure TfrmCobrarFacturas.ImprimirRecibo(tipo :smallint);
begin
  if tipo = 1 then
  begin
    strNumero := InputBox('Imprimir recibo de ingreso','Entre Número de Recibo','');
    dmIngresos.qryRepIngMaster.Close;
    dmIngresos.qryRepIngMaster.Params[0].Value:= StrToInt(strNumero);
    dmIngresos.qryRepIngMaster.Open;
  end else
  begin
    dmIngresos.qryRepIngMaster.Close;
    dmIngresos.qryRepIngMaster.Params[0].Value:= StrToInt(strNumero);
    dmIngresos.qryRepIngMaster.Open;
  end;
  dmIngresos.tblIngresoMaster.Close;
  dmIngresos.tblIngresoMaster.params[0].Value:= ExtraerFecha(dmIngresos.qryRepIngMasterFECHA.Value);
  dmIngresos.tblIngresoMaster.params[1].Value:= ExtraerFecha(dmIngresos.qryRepIngMasterFECHA.Value);
  dmIngresos.tblIngresoMaster.Open;
  if not dmIngresos.tblIngresoMaster.Locate('NUMERO',dmIngresos.qryRepIngMaster.Params[0].Value,[]) then
  begin
    MessageDlg('Recibo no encontrado, verifique.', mtWarning, [mbOK], 0);
    exit;
  end;
  dmUsuarios.qryUsuarios.Locate('CODIGO_EMPLEADO',VarUsuarioGlb,[]);
  //qckReciboIngreso:=TqckReciboIngreso.Create(Nil);
  qckReciboAbonoCXC:=TqckReciboAbonoCXC.Create(nil);
  try
    qckReciboAbonoCXC.LabelNombUser.Caption:= dmUsuarios.qryUsuariosNOMBRECOMPLETO.Value;
    //qckReciboAbonoCXC.qrLabelReimprimir.Caption:=;//aqui aqui aqui
    if dmIngresos.tblIngresoMasterSTATUS.Value = 'P' then
    qckReciboAbonoCXC.qrLabelReimprimir.Caption:='Re-Impresion' else
    qckReciboAbonoCXC.qrLabelReimprimir.Caption:='';
    if dmIngresos.qryRepIngDetalle.RecordCount > 1 then
    begin
      qckReciboAbonoCXC.Page.Length := qckReciboAbonoCXC.Page.Length +
      dmIngresos.qryRepIngDetalle.RecordCount * 2;
    end;
    if  MessageDlg('Imprimir?',mtInformation, [mbyes, mbno], 0) = mryes then
    begin
      qckReciboAbonoCXC.PrinterSetup;
      qckReciboAbonoCXC.Print;
    end else
    qckReciboAbonoCXC.Preview;
    if dmIngresos.tblIngresoMasterSTATUS.Value = 'A' then
    begin
      qckReciboAbonoCXC.qrLabelReimprimir.Caption:='';
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
  qckReciboAbonoCXC.Free;
  qckReciboAbonoCXC:=Nil;
  end;
end;

procedure TfrmCobrarFacturas.ReImprimirRecibo1Click(Sender: TObject);
begin
  ImprimirRecibo(1);
end;

procedure TfrmCobrarFacturas.BuscarCliente1Click(Sender: TObject);
begin
  FrmBuscarClientesPersonas:=TFrmBuscarClientesPersonas.Create(nil);
  try
    if FrmBuscarClientesPersonas.showmodal = mrOk then
    begin
      frmCobrarFacturas.CodCte:=FrmBuscarClientesPersonas.CodigoCliente;
      strNombreEmpresa:=FrmBuscarClientesPersonas.nombrecliente;
      FormShow(Self);
    end;
  finally
  FrmBuscarClientesPersonas.free;
  FrmBuscarClientesPersonas:=nil;
  end;
end;

procedure TfrmCobrarFacturas.RxDBLookupCombo1Exit(Sender: TObject);
begin
  if rxFormaPago.State in [dsEdit, dsInsert] then
  rxFormaPago.Post;
end;

function TfrmCobrarFacturas.FNumReciboMax: Integer;
begin
  ibsqlLastNum.Close;
  ibsqlLastNum.ExecQuery;
  Result := ibsqlLastNum.FieldByName('numeromax').AsInteger;
end;

end.
