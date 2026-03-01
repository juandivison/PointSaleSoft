unit UPagoFacturas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, Buttons, ExtCtrls, EditNew, Db, Grids,
  IBCustomDataSet, IBStoredProc, WinSkinData, RxMemDS, DBGrids,
  Variants, RXDBCtrl, RXCtrls, ComCtrls, IBQuery;


type
  Tfrmpagofacturas = class(TForm)
    Panel2: TPanel;
    DBNavigator2: TDBNavigator;
    BitBtn3: TBitBtn;
    PageControl1: TPageControl;
    tabFacturas: TTabSheet;
    tabFctIng: TTabSheet;
    Label1: TLabel;
    btnProcesar: TButton;
    edtnumfact: TEditN;
    edtMontoPendiente: TEditN;
    RxDBGrid2: TRxDBGrid;
    RxDBGrid3: TRxDBGrid;
    DBNavigator1: TDBNavigator;
    edtMontoApagar: TEditN;
    RxDBGrid1: TRxDBGrid;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    rxtotal: TRxMemoryData;
    rxtotaltotal: TFloatField;
    dsRxTotal: TDataSource;
    DBText1: TDBText;
    btnSalvar: TBitBtn;
    btnModificar: TBitBtn;
    BitBtn2: TBitBtn;
    DBStatusLabel1: TDBStatusLabel;
    Label2: TLabel;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    SkinData1: TSkinData;
    stFactFctIngresos: TIBStoredProc;
    stpactfctingresos: TIBStoredProc;
    dsQryFctIngresos: TDataSource;
    BitBtn4: TBitBtn;
    procedure btnProcesarClick(Sender: TObject);
    procedure edtnumfactExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure edtMontoPendienteEnter(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure edtnumfactChange(Sender: TObject);
    procedure edtMontoApagarExit(Sender: TObject);
  private
    { Private declarations }
    procedure CalculaTotalPagado;
    procedure TotalPagadoFactura;
    Procedure ProcFacturasACxc(xMonto : Real);    
  public
    { Public declarations }
    IngresReciboMaster : Boolean;
    xtipoVenta : String;
  end;

var
  frmpagofacturas : Tfrmpagofacturas;
  TotalRecibo     : Real;
  TotalPagadoFact : Real = 0;
implementation
  Uses UGlobal, UDatModConectar, UDatModIngresos, UDatmodDatosGenerales, URecibosYCtaXCobrar,
  UDetalleFormaDePago, UDatModCxc, URepReciboIngreso, UDatModUsuarios,
  URepReciboAbonoCXC;
{$R *.DFM}

procedure Tfrmpagofacturas.btnProcesarClick(Sender: TObject);
var
  Montopend : Real;
  descDetalle : String;
  MontoPagado : Real;
begin
  if edtmontoApagar.ValueFloat = 0 then
  begin
    MessageDlg('Monto a pagar no puede ser cero, verifique',mterror,[mbOk],0);
    Exit;
  end;
  if (edtmontoApagar.ValueFloat > edtMontoPendiente.ValueFloat) then
  begin
    MessageDlg('Valor a pagar es mayor que monto pendiente, verifique',mterror,[mbok],0);
    //RegistrarLogError('Saldo Facturas','UPagoFacturas','Valor a pagar es mayor que monto pendiente');
    if frmpagofacturas.Showing then
    begin
      edtmontoApagar.SetFocus;
      edtmontoApagar.SelectAll;
    end;
    Exit;
  end;

  MontoPagado:=GlbMontoInteresMoraPgdo + edtmontoApagar.ValueFloat;

  if IngresReciboMaster then
  begin
    dmingresos.tblIngresoMaster.InsertRecord([
    FsqlMaxNumero('ingresos','Serie'),
    FrmRecibosYCtaXCobrar.qryFactPendTIPO.Value,
    FsqlMaxNumero('ingresos','numero'),
    FrmRecibosYCtaXCobrar.qryFactPendMONEDA.Value,
    ExtraerFecha(GlbFechaTrnDiaria),
    MontoPagado,//edtmontoApagar.ValueFloat,
    2,//Credito, tipo_ing
    FrmRecibosYCtaXCobrar.qryFactPendNOMBRE_EMPRESA.Value,
    FrmRecibosYCtaXCobrar.qryFactPendCODIGO_CTE.Value,
    0,//codservicio
    FrmRecibosYCtaXCobrar.rxFormaPagoformaPago.Value,
    FrmRecibosYCtaXCobrar.rxFormaPagoNumeroDocumento.Value,
    FrmRecibosYCtaXCobrar.rxFormaPagoTipoTarjeta.Value,
    Null, 'Abono a Factura', 'A',  Null, Null, Date, Null, Null, Null,VarUsuarioGlb
    ]);
    dmingresos.tblIngresoMaster.ApplyUpdates;
    if Not dmingresos.tblIngresoMaster.Transaction.InTransaction then
    dmingresos.tblIngresoMaster.Transaction.StartTransaction;
    try
      dmingresos.tblIngresoMaster.Transaction.CommitRetaining;
    except
    dmingresos.tblIngresoMaster.Transaction.RollbackRetaining;
    end;
  end else
  begin
    dmingresos.tblIngresoMaster.Edit;
    if dmingresos.tblIngresoMasterCOD_EMPLEADO.IsNull then
    dmingresos.tblIngresoMasterCOD_EMPLEADO.Value:= VarUsuarioGlb;
    
    dmingresos.tblIngresoMasterVALOR_ING.Value:=
    dmingresos.tblIngresoMasterVALOR_ING.Value + edtmontoApagar.ValueFloat;
    dmingresos.tblIngresoMaster.Post;
    dmingresos.tblIngresoMaster.ApplyUpdates;
    if Not dmingresos.tblIngresoMaster.Transaction.InTransaction then
    dmingresos.tblIngresoMaster.Transaction.StartTransaction;
    try
      dmingresos.tblIngresoMaster.Transaction.CommitRetaining;
    except
    dmingresos.tblIngresoMaster.Transaction.RollbackRetaining;
  end;
  end;

  if edtMontoApagar.ValueInteger < FrmRecibosYCtaXCobrar.qryFactPendMONTO_PENDIENTE.Value then
  descDetalle:='Abono a Factura' else descDetalle:='Saldo Factura';

  dmIngresos.tblIngresoDet.InsertRecord([
  FsqlMaxNumero('Ingresos_det','Serie'),
  dmIngresos.tblIngresoMasterNUMERO.Value,
  dmIngresos.tblIngresoMasterNUMERO.Value,
  0,//CodServicio
  2,//Depto
  descDetalle,
  MontoPagado,//edtMontoApagar.ValueFloat,
  'A', 0, 0, Date, Trim(StrUserName), Null, Null,
  FrmRecibosYCtaXCobrar.rxFormaPagoTipoTarjeta.Value,
  FrmRecibosYCtaXCobrar.rxFormaPagoNumeroTarjeta.Value,
  FrmRecibosYCtaXCobrar.rxFormaPagoAnio.Value,
  FrmRecibosYCtaXCobrar.rxFormaPagoMes.Value,
  FrmRecibosYCtaXCobrar.rxFormaPagoMONTOAUTORIZADO.Value,
  FrmRecibosYCtaXCobrar.rxFormaPagoNumeroAutorizacion.Value,
  1,FrmRecibosYCtaXCobrar.rxFormaPagoProveedorTarjeta.Value]);
  
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

  Montopend:= edtMontoPendiente.ValueFloat;
  //Insertar Transaccion Cxc
  ProcFacturasACxc(edtMontoApagar.ValueFloat);
  //Actualizar Balance Cliente

  dmcxc.StpProcActBlceCteyTrncxcStatus.Params[0].Value:= FrmRecibosYCtaXCobrar.qryFactPendCODIGO_CTE.Value;
  dmcxc.StpProcActBlceCteyTrncxcStatus.Params[1].Value:= 0;//servicio
  //aqui verificar longitud campo 2 y 3
  dmcxc.StpProcActBlceCteyTrncxcStatus.Params[2].Value:= '1';//FrmRecibosYCtaXCobrar.qryFactPendMONEDA.Value;
  dmcxc.StpProcActBlceCteyTrncxcStatus.Params[3].Value:= 2;
  dmcxc.StpProcActBlceCteyTrncxcStatus.Params[4].Value:= edtMontoApagar.ValueFloat;
  dmcxc.StpProcActBlceCteyTrncxcStatus.Params[5].Value:= ExtraerFecha(GlbFechaTrnDiaria);
  dmcxc.StpProcActBlceCteyTrncxcStatus.Params[6].Value:= dmcxc.qryTrancxcSERIE.Value; //numero TrnCxc
  dmcxc.StpProcActBlceCteyTrncxcStatus.ExecQuery;
  
  MontoPend:=edtMontoApagar.ValueFloat;
  //While Not FrmRecibosYCtaXCobrar.qryFactPend.Eof do
  //begin
  // if Montopend = 0 then Break;
  //  if FrmRecibosYCtaXCobrar.qryFactPendMONTO_PENDIENTE.Value = 0 then
  //  begin
  //    FrmRecibosYCtaXCobrar.qryFactPend.Next;
  //    Continue;
  //  end;
    if FrmRecibosYCtaXCobrar.qryFactPendMONTO_PENDIENTE.Value < MontoPend then
    MontoPend:=FrmRecibosYCtaXCobrar.qryFactPendMONTO_PENDIENTE.Value;

    dmIngresos.stpFactPendiente.Close;
    dmIngresos.stpFactPendiente.Params[1].Value:= FrmRecibosYCtaXCobrar.qryFactPendTIPO.Value; //dmIngresos.tblIngresoMastertipo.value;
    dmIngresos.stpFactPendiente.Params[2].Value:= '1'; //dmIngresos.tblIngresoMasterMONEDA.Value;
    dmIngresos.stpFactPendiente.Params[3].Value:= FrmRecibosYCtaXCobrar.qryFactPendNUMERO_FACT.Value;//Vuevo
    dmIngresos.stpFactPendiente.Params[5].Value:= 'A';
    dmIngresos.stpFactPendiente.Params[6].value:= -1;//devuelve monto pendiente;
    dmIngresos.stpFactPendiente.ExecProc;

    try
      dmIngresos.stpFactPendiente.Transaction.CommitRetaining;
    except
    dmIngresos.stpFactPendiente.Transaction.RollbackRetaining;
    end;

    if dmIngresos.stpFactPendiente.Params[0].Value > 0 then
    Begin
      edtmontopendiente.Text:=Format('%8.2f',[dmIngresos.stpFactPendiente.Params[0].AsFloat]);
      dmIngresos.stpFactPendiente.Params[4].Value:=dmIngresos.stpFactPendiente.Params[0].Value - MontoPend;
      dmIngresos.stpFactPendiente.Params[6].Value:=1;//Actualiza Monto Factura
      dmIngresos.stpFactPendiente.ExecProc;

      stpactfctingresos.Params[0].value:= FsqlMaxNumero('FctIngresos','Serie');
      stpactfctingresos.Params[1].Value:= dmIngresos.tblIngresoMasterNUMERO.Value;
      stpactfctingresos.Params[2].Value:= FrmRecibosYCtaXCobrar.qryFactPendNUMERO_FACT.Value;
      stpactfctingresos.Params[3].Value:= Montopend;
      stpactfctingresos.Params[4].Value:= '1';//FrmRecibosYCtaXCobrar.qryFactPendMONEDA.Value;
      stpactfctingresos.Params[5].Value:= 'A';
      stpactfctingresos.Params[6].Value:= 0;//Renta Vehiculo;dmIngresos.tblIngresosDetCOD_SERVICIO.Value;
      stpactfctingresos.Params[7].Value:= FrmRecibosYCtaXCobrar.qryFactPendTIPO.Value;
      stpactfctingresos.Params[8].Value:= 2;//Recibos;
      stpactfctingresos.ExecProc;
      Montopend:= edtMontoApagar.ValueFloat - Montopend;
      try
        stpactfctingresos.Transaction.CommitRetaining;
      except
      stpactfctingresos.Transaction.RollbackRetaining;
      end;
    end;
    dmIngresos.qryfctingresos.Close;
    dmIngresos.qryfctingresos.Params[0].Value:= ExtraerFecha(GlbFechaTrnDiaria);//fecha
    dmIngresos.qryfctingresos.Params[1].Value:= dmIngresos.tblIngresoMasterNUMERO.Value;//numero ingreso
    dmIngresos.qryfctingresos.Open;
    FrmRecibosYCtaXCobrar.qryFactPend.Next;
  //end;
   FrmRecibosYCtaXCobrar.edtMontoAplicar.Text :=
   Format('%8.2f',[( FrmRecibosYCtaXCobrar.edtMontoAplicar.ValueFloat -
   edtMontoApagar.ValueFloat)]);
   edtMontoApagar.Text:=Format('%8.2f',[FrmRecibosYCtaXCobrar.edtMontoAplicar.ValueFloat]);
   if FrmRecibosYCtaXCobrar.edtMontoAplicar.ValueFloat = 0 then
   IngresReciboMaster := True else IngresReciboMaster:=False;
   CalculaTotalPagado;
   if frmpagofacturas.Showing then
   EdtMontoApagar.SetFocus;
   EdtMontoApagar.SelectAll;
   FrmRecibosYCtaXCobrar.qryFactPend.Close;
   FrmRecibosYCtaXCobrar.qryFactPend.Open;
   if IngresReciboMaster then
   BitBtn4Click(Self);
   if FrmRecibosYCtaXCobrar.CerrarVentana then Close;
end;

procedure Tfrmpagofacturas.edtnumfactExit(Sender: TObject);
begin
  if Not  FrmRecibosYCtaXCobrar.qryFactPend.Locate('NUMERO_FACT',edtNumFact.ValueInteger,[loCaseInsensitive,loPartialKey]) then
  begin
    MessageDlg('Factura no se encuentra, verifique',mtInformation, [mbOK], 0);
    edtMontoApagar.Enabled:=False;
  end else
  begin
    edtMontoPendiente.Text:= Format('%8.2f',[FrmRecibosYCtaXCobrar.qryFactPendMONTO_PENDIENTE.Value]);
    edtMontoApagar.Enabled:=True;
  end;
 {t if dmingresos.qryfctingresos.Locate('numero_fact',edtnumfact.ValueInteger,[]) then
  MessageDlg('Esta factura fue procesada, verifique',mtwarning,[mbok],0);
  if edtnumfact.ValueInteger > 0 then
  begin
    dmIngresos.stpFactPendiente.Close;
    //dmIngresos.stpFactPendiente.Params[0].Value := dmIngresos.tblIngresoMastertipo.value;
    dmIngresos.stpFactPendiente.Params[2].Value := dmIngresos.tblIngresoMasterMONEDA.Value;
    dmIngresos.stpFactPendiente.Params[3].Value := edtnumfact.ValueFloat;
    //dmIngresos.stpFactPendiente.Params[3].Value := //Output;
    dmIngresos.stpFactPendiente.Params[4].Value := 0;
    dmIngresos.stpFactPendiente.Params[5].Value := 'A';    
    dmIngresos.stpFactPendiente.Params[6].Value := -1;//devuelve monto pendiente;
    dmIngresos.stpFactPendiente.ExecProc;
    if dmIngresos.stpFactPendiente.Params[0].IsNull then //buscar en tabla facturas
    begin
      dmIngresos.StpFactPagoIng.Close;
      dmIngresos.stpFactPagoIng.Params[0].Value:=dmIngresos.tblIngresoMasterNUMERO.Value;
      dmIngresos.StpFactPagoIng.Params[1].Value:=edtnumfact.ValueFloat;
      dmIngresos.StpFactPagoIng.Params[2].Value:=edtMontoApagar.ValueFloat;
      dmIngresos.StpFactPagoIng.Params[3].Value:='A';
      dmIngresos.StpFactPagoIng.Params[4].Value:=dmIngresos.tblIngresoMasterTIPO.Value;
      dmIngresos.StpFactPagoIng.Params[5].Value:=dmIngresos.tblIngresoMasterMONEDA.Value;
      dmIngresos.StpFactPagoIng.Params[6].Value:=-1;
      dmIngresos.stpFactPagoIng.ExecProc;
      edtMontoPendiente.Text:=Format('%8.2f',[dmIngresos.StpFactPagoIng.params[7].AsFloat]);
    end else
    begin
      edtmontopendiente.Text:=Format('%8.2f',[dmingresos.stpFactPendiente.Params[3].AsFloat]);
    end;
  end;}
end;

procedure Tfrmpagofacturas.FormCreate(Sender: TObject);
begin
  dmUsuarios.qryUsuarios.Close;
  dmUsuarios.qryUsuarios.Open;
  dmIngresos.tblIngresoMaster.Close;
  dmIngresos.tblIngresoMaster.Params[0].Value := GlbFechaTrnDiaria;
  dmIngresos.tblIngresoMaster.Params[1].Value := GlbFechaTrnDiaria;
  dmIngresos.tblIngresoMaster.Open;
  edtnumfact.SetFloat(FrmRecibosYCtaXCobrar.qryFactPendNUMERO_FACT.AsFloat);
 
  //dmingresos.tblIngresosdet.DisableControls;
  //if dmingresos.tblIngresosdet.State = dsBrowse then
 // dmingresos.tblIngresosdet.First;
{  While Not dmingresos.tblIngresosDet.Eof do
  begin
    TotalRecibo:=TotalRecibo + dmingresos.tblIngresosdetVALOR_DET.Value -
    (dmingresos.tblIngresosdetVALOR_DET.value * (dmingresos.tblIngresosdetPORC_DESCUENTO.Value/100))
    + dmingresos.tblIngresosdetVALOR_IMPUESTO.Value;
    dmingresos.tblIngresosdet.next;
  end;
  dmingresos.tblIngresosdet.EnableControls;
  edtmontoApagar.Text:= FloattoStr(TotalRecibo);}
  dmIngresos.qryfctingresos.Close;
  dmIngresos.qryfctingresos.Open;
end;

procedure Tfrmpagofacturas.FormShow(Sender: TObject);
begin
  Pagecontrol1.ActivePage:=tabFacturas;
  edtmontopendiente.Text:=Format('%8.2f',[FrmRecibosYCtaXCobrar.qryDatosBlcCxcBALANCE_ACT.AsFloat]);
  if frmpagofacturas.Showing then
  edtnumfact.SetFocus;
end;

procedure Tfrmpagofacturas.CalculaTotalPagado;
begin
  if dmingresos.qryfctingresos.Active then
  begin
    dmingresos.qryfctingresos.First;
    rxtotal.close;
    rxtotal.EmptyTable;
    rxtotal.open;
    while not dmingresos.qryfctingresos.eof do
    begin
      if rxtotal.RecordCount = 0 then
      rxtotal.insert else rxtotal.Edit;
      rxtotaltotal.Value := rxtotaltotal.Value + dmingresos.qryfctingresosMONTO_FACT.Value;
      rxtotal.post;
      dmingresos.qryfctingresos.Next;
    end;
  end;
end;

procedure Tfrmpagofacturas.BitBtn2Click(Sender: TObject);
begin
  if (dmingresos.qryfctingresos.State in [dsBrowse]) and
     (dmingresos.qryfctingresosSTATUS.Value = 'A') then
  begin
    if MessageDlg('Borrar Record?',mtwarning,[mbyes,mbno],0)= mryes then
    begin
      dmingresos.qryfctingresos.Delete;
      dmingresos.qryfctingresos.ApplyUpdates;
      if Not dmingresos.qryfctingresos.Transaction.InTransaction then
      dmingresos.qryfctingresos.Transaction.StartTransaction;
      try
        dmingresos.qryfctingresos.Transaction.CommitRetaining;
      except
      dmingresos.qryfctingresos.Transaction.RollbackRetaining;
      end;
    end;
  end;
end;

procedure Tfrmpagofacturas.btnModificarClick(Sender: TObject);
begin
  if dmingresos.qryfctingresos.State in [dsBrowse] then
  begin
    if dmingresos.qryfctingresos.recordcount > 0 then
    dmingresos.qryfctingresos.Edit;
  end;
end;

procedure Tfrmpagofacturas.btnSalvarClick(Sender: TObject);
begin
 if dmingresos.qryfctingresos.State in [dsedit,dsinsert] then
  begin
    dmingresos.qryfctingresos.Post;
    dmingresos.qryfctingresos.ApplyUpdates;
    if Not dmingresos.qryfctingresos.Transaction.InTransaction then
    dmingresos.qryfctingresos.Transaction.StartTransaction;
    try
      dmingresos.qryfctingresos.Transaction.CommitRetaining;
    except
    dmingresos.qryfctingresos.Transaction.RollbackRetaining;
    end;
  end;
  CalculaTotalPagado;
end;

procedure Tfrmpagofacturas.TotalPagadoFactura;
begin
{  TotalPagadoFact:=0;
  dmingresos.qryfctingresos.First;
  while Not dmingresos.qryfctingresos.Eof do
  begin
    if dmingresos.qryfctingresosNUMERO_FACT.Value = edtnumfact.ValueFloat then
    TotalPagadoFact:= TotalPagadoFact + dmingresos.qryfctingresosMONTO_FACT.Value;
    dmingresos.qryfctingresos.next;
  end;}
end;

procedure Tfrmpagofacturas.edtMontoPendienteEnter(Sender: TObject);
begin
 { btnProcesar.Enabled:=true;
  TotalPagadoFactura;
  if (TotalPagadoFact) = (edtMontoPendiente.ValueFloat) then
  begin
    Beep;
    Messagedlg('Factura fue saldada, verifique',mtWarning,[mbOk],0);
  end else
  if TotalPagadoFact > edtMontoPendiente.ValueFloat then
  begin
    Beep;
    btnProcesar.Enabled:=False;
    Messagedlg('Valor pagado excede monto factura, verifique',mtError,[mbOk],0);
  end;}
end;

procedure Tfrmpagofacturas.BitBtn1Click(Sender: TObject);
begin
{  if dming.qryIngresosCODIGO_CTE.Value = 1 then //cdc
  begin
    frmFactCdcPagos:=TfrmFactCdcPagos.Create(nil);
    try
      frmFactCdcPagos.Showmodal;
    finally
    frmFactCdcPagos.free;
    frmFactCdcPagos:=nil;
    end;
  end;  }
end;

procedure Tfrmpagofacturas.ProcFacturasACxc(xMonto:Real);
begin
  if dmcxc.qryTrancxc.State = dsInactive then
  begin
    dmcxc.qrytrancxc.Close;
    dmcxc.qrytrancxc.Open;
  end;
  dmcxc.qrytrancxc.Insert;
  dmcxc.qrytrancxcserie.Value          := FsqlMaxNumero('TRANS_CXC','SERIE');
  if dmcxc.qrytrancxcserie.Value = 0 then
  dmcxc.qrytrancxcserie.Value          := 1;
  dmcxc.qrytrancxctipo_doc.Value       := 2; //Recibo
  dmcxc.qrytrancxcmoneda.Value         := '1';
  dmcxc.qrytrancxcfecha.Value          := ExtraerFecha(GlbFechaTrnDiaria);
  dmcxc.qrytrancxcnumero_doc.Value     := FrmRecibosYCtaXCobrar.qryFactPendNUMERO_FACT.Value;
  dmcxc.qrytrancxctipo_serv.Value      := 2;
  dmcxc.qrytrancxccodigo_cliente.Value := FrmRecibosYCtaXCobrar.qryFactPendCODIGO_CTE.Value;
  dmcxc.qrytrancxccodigo_serv.Value    := 0;
  dmcxc.qrytrancxcconcepto.Value       := 'Pago Factura';
  dmcxc.qrytrancxcValor_documento.Value:= xMonto;
  dmcxc.qrytrancxcTipo_tranf.Value     := 2;
  dmcxc.qrytrancxcStatus.Value         := 'A';
  dmcxc.qryTrancxcNUMERO_RECIBO.Value:= dmIngresos.tblIngresoMasterNUMERO.AsInteger;
  dmcxc.qrytrancxc.Post;
  dmcxc.qrytrancxc.ApplyUpdates;
  if Not dmcxc.qrytrancxc.Transaction.InTransaction then
  dmcxc.qrytrancxc.transaction.StartTransaction;
  try
    dmcxc.qrytrancxc.transaction.CommitRetaining;
  except
  dmcxc.qrytrancxc.transaction.RollbackRetaining;
  end;
end;

procedure Tfrmpagofacturas.BitBtn4Click(Sender: TObject);
begin
  dmIngresos.qryRepIngMaster.Close;
  dmIngresos.qryRepIngMaster.Params[0].Value:= dmIngresos.tblIngresoMasterNUMERO.Value;
  dmIngresos.qryRepIngMaster.Open;
  dmUsuarios.qryUsuarios.Locate('CODIGO_EMPLEADO',VarUsuarioGlb,[]);
  //t qckReciboAbonoCXC := TqckReciboAbonoCXC.Create(Nil);
  qckReciboIngreso:=TqckReciboIngreso.Create(nil);
  qckReciboIngreso.xtipoVenta:= xtipoVenta;
  //qckReciboIngreso:=TqckReciboIngreso.Create(Nil);
  try
    //qckReciboIngreso.LabelNombUser.Caption:= dmUsuarios.qryUsuariosNOMBRECOMPLETO.Value;
    qckReciboIngreso.LabelNombUser.Caption:= dmUsuarios.qryUsuariosNOMBRECOMPLETO.Value;
    if dmIngresos.tblIngresoMasterSTATUS.Value = 'P' then
    qckReciboIngreso.qrLabelReimprimir.Caption := 'Re-Impresion' else
   //qckReciboIngreso.qrLabelReimprimir.Caption := 'Re-Impresion' else
    qckReciboIngreso.qrLabelReimprimir.Caption := '';
   //qckReciboIngreso.qrLabelReimprimir.Caption := '';
   if MessageDlg('Imprimir?', mtinformation,[mbYes, mbNo],0) = mrYes then
   begin
     qckReciboIngreso.PrinterSetup;
     qckReciboIngreso.Print;
   end else
    qckReciboIngreso.Preview;
    //qckReciboIngreso.Preview;
    if dmIngresos.tblIngresoMasterSTATUS.Value = 'A' then
    begin
    //qckReciboIngreso.qrLabelReimprimir.Caption := '';
      qckReciboIngreso.qrLabelReimprimir.Caption :='';
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
  //qckReciboAbonoCXC := Nil;
  qckReciboIngreso.Free;
  qckReciboIngreso:=Nil;
  end;
end;

procedure Tfrmpagofacturas.edtnumfactChange(Sender: TObject);
begin
  FrmRecibosYCtaXCobrar.qryFactPend.Locate('NUMERO_FACT',edtNumFact.ValueInteger,[loCaseInsensitive,loPartialKey]);
end;

procedure Tfrmpagofacturas.edtMontoApagarExit(Sender: TObject);
begin
  if edtMontoAPagar.ValueFloat < 0 then
  begin
    MessageDlg('Monto a pagar es menor que cero, verifique',mtInformation, [mbOK], 0);
    if frmpagofacturas.Showing then
    edtnumfact.SetFocus;
  end;

  if edtMontoAPagar.ValueFloat > edtMontoPendiente.ValueFloat then
  begin
    MessageDlg('Monto a pagar es mayor que monto pendiente, verifique',mtInformation, [mbOK], 0);
    if frmpagofacturas.Showing then
    edtnumfact.SetFocus;
  end;
end;

end.
