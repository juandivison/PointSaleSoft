unit UBuscaProductoProcPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UBuscarProductoInvDespacho, DB, RxMemDS, IBCustomDataSet,
  IBQuery, EditNew, RxLookup, Mask, DBCtrls, RXCtrls, RXDBCtrl, ExtCtrls,
  StdCtrls, Buttons, Grids, DBGrids, IBTable, IBStoredProc, IBSQL;

type
  TfrmBuscarProdProcPed = class(TfrmBuscarInvDespachoVendedores)
    dbEditNumConduce: TDBEdit;
    labelNumConduce: TLabel;
    edtNumConduce: TEditN;
    rxDataNumConduce: TIntegerField;
    Label20: TLabel;
    RxDBLookupCombo3: TRxDBLookupCombo;
    IBTable1: TIBTable;
    IBTable2: TIBTable;
    IBTable2CODIGO_CTE: TIntegerField;
    IBTable2TIPO_CLIENTE: TIntegerField;
    IBTable2DESCRIPCION: TIBStringField;
    IBTable2ESTADO: TIBStringField;
    IBTable2CIUDAD: TIBStringField;
    IBTable2TELEFONO: TIBStringField;
    IBTable2DIRECCIONWEB: TIBStringField;
    DataSource1: TDataSource;
    rxProveedor: TRxMemoryData;
    rxProveedorCodigo: TIntegerField;
    dsrxProveedor: TDataSource;
    rxDataCodigoProd: TIntegerField;
    rxDataPrecioCompra: TFloatField;
    Label21: TLabel;
    DBEdit13: TDBEdit;
    rxProveedorFormaPago: TIntegerField;
    rxProveedorTipo: TIntegerField;
    edtBuscarProducto: TEditN;
    Label22: TLabel;
    ibStpActualizaInv: TIBStoredProc;
    BitBtn7: TBitBtn;
    Label23: TLabel;
    edtReferencia: TEditN;
    qryInventarioREFERENCIA: TIBStringField;
    BitBtn8: TBitBtn;
    Label24: TLabel;
    rxDataPrecioVenta: TFloatField;
    rxDataMargen: TFloatField;
    EditN2: TEditN;
    qryInventarioPRECIO_COMPRA: TFloatField;
    ibSqlUpdatePrecioInv: TIBStoredProc;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure RxDBGrid1CellClick(Column: TColumn);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RxDBLookupCombo3Exit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtBuscarProductoChange(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure EditN2Change(Sender: TObject);
    procedure edtReferenciaChange(Sender: TObject);
    procedure DBEdit1Change(Sender: TObject);
    procedure rxDataCalcFields(DataSet: TDataSet);
    procedure DBEdit2Exit(Sender: TObject);
    procedure DBEdit13Exit(Sender: TObject);
  private
    { Private declarations }
    procedure ProcRegProd;
    procedure ProcInsertarCXP(monto : Real);
    Function FuncGetFormaPago(var x:integer):Boolean;
    procedure ProcActInventario(codProd : Integer;NewCant : Real);
    procedure ProcAsignarValores;
  public
    { Public declarations }
    procedure ProcInsCostoProdProveedor(codProd:integer;numeroconduce:integer;precio:Real);

  end;

var
  frmBuscarProdProcPed: TfrmBuscarProdProcPed;
  xPrecio : Real;
implementation

uses UDatModDespacho, UGlobal, UDatosVentas, UDatModInventario, UProcesarPedidos,
  UDatModCuadrexRuta, UDatModConectar, URegFpago, UDatModCxp,
  ULabelImpCodBarra, UInventarioProd;

{$R *.dfm}


procedure TfrmBuscarProdProcPed.BitBtn2Click(Sender: TObject);
var
  xNumtrnmaster, x :integer;
  suma : Real;
begin
  //inherited;
  if (rxProveedorcodigo.IsNull) And (rxdata.RecordCount > 0)  then
  begin
    MessageDlg('Favor indicar proveedor', mtInformation, [mbOK], 0);
    Exit;
  end;
  if FuncGetFormaPago(x) then
  begin
    rxProveedor.Edit;
    rxProveedorFormaPago.Value:=x;
    rxProveedor.Post;
  end else
  begin
    MessageDlg('Favor indicar forma de pago',mtInformation, [mbOK], 0);
    BitBtn2.SetFocus;
    exit;
  end;
  if rxdata.RecordCount > 0 then
  begin
    dmDespacho.tblDespachoMaster.Insert;
    dmDespacho.tblDespachoMasterCODIGO_EMP.Value := VarUsuarioGlb;
    dmDespacho.tblDespachoMasterCODIGO_RUTA.Value:= 0;//Registro Pedido
    dmDespacho.tblDespachoMasterFECHA.Value      := ExtraerFecha(rxDataFecha.Value);
    dmDespacho.tblDespachoMasterSTATUS.Value     := 'A';
    dmDespacho.tblDespachoMasterNUM_CONDUCE.Value:= rxDataNumConduce.Value;
    //dmDespacho.tblDespachoMasterMONEDA.Value     := '1';
    dmDespacho.tblDespachoMasterCODIGO_DESPACHADOR.Value:= VarUsuarioGlb;
    dmDespacho.tblDespachoMaster.Post;
    dmDespacho.tblDespachoMaster.ApplyUpdates;
    if Not dmDespacho.tblDespachoMaster.Transaction.InTransaction then
      dmDespacho.tblDespachoMaster.Transaction.StartTransaction;
    try
      dmDespacho.tblDespachoMaster.Transaction.CommitRetaining;
    except
    dmDespacho.tblDespachoMaster.Transaction.RollbackRetaining;
    end;
    rxData.First;
    While Not rxdata.Eof do
    begin
      dmDespacho.tbldespachoDet.Insert;
      dmDespacho.tbldespachoDetNUMERO.Value       := dmDespacho.tblDespachoMasterNUMERO.Value;
      dmDespacho.tbldespachoDetCODIGO_PROD.Value  := rxDataCodigoProd.AsInteger;
      dmDespacho.tbldespachoDetDESCRIPCION.Value  := dmInventario.tblInventarioProdDESCRIPCION.Value;
      dmDespacho.tbldespachoDetCANTIDAD.Value     := rxDataCantidad.AsInteger;
      dmDespacho.tbldespachoDetPRECIO.Value       := rxDataPrecio.Value;
      dmDespacho.tbldespachoDetPORC_DESC_DET.Value   := rxDataporc_desc.Value;
      dmDespacho.tbldespachoDetITBI_DET.Value        := rxDataitbi.Value;
      dmDespacho.tblDespachoDetVALOR_BRUTO.Value     := rxDatavalor.Value;
      dmDespacho.tbldespachoDetVALOR_TOTAL_DET.Value := rxDatatotal_neto.Value;
      dmDespacho.tbldespachoDetSTATUS_DET.Value;
      dmDespacho.tbldespachoDetIN_POR.Value       := StrUserName;
      dmDespacho.tbldespachoDetFECHA_IN.Value     := Now;
      dmDespacho.tbldespachoDetSTATUS_DET.Value   := 'A';
      dmDespacho.tbldespachoDet.Post;
      dmDespacho.tbldespachoDet.ApplyUpdates;
      if Not dmDespacho.tbldespachoDet.Transaction.InTransaction then
      dmDespacho.tbldespachoDet.Transaction.StartTransaction;
      try
        dmDespacho.tbldespachoDet.Transaction.CommitRetaining;
      except
      dmDespacho.tbldespachoDet.Transaction.RollbackRetaining;
      end;
      if dmInventario.tblInventarioProd.Locate('CODIGO', rxDataCodigoProd.Value,[]) then
      begin
        dmInventario.tblInventarioProd.Edit;
        dmInventario.tblInventarioProdPRECIO_ANT.Value:=
        dmInventario.tblInventarioProdPRECIO.Value;
        dmInventario.tblInventarioProdPRECIO.Value := rxDataPrecioVenta.Value;
        dmInventario.tblInventarioProdPRECIO_COMPRA.Value:=rxDataPrecioCompra.Value;
        dmInventario.tblInventarioProd.Post;
        dmInventario.tblInventarioProd.ApplyUpdates;
      end;
      //ibSqlUpdatePrecioInv.Params[0].Value := rxDataCodigoProd.Value;
      //ibSqlUpdatePrecioInv.Params[1].Value := rxDataPrecioVenta.Value;
      //ibSqlUpdatePrecioInv.ExecProc;

      ProcInsCostoProdProveedor(rxDataCodigoProd.Value,rxDataNumConduce.Value,rxDataPrecioCompra.Value);

      //t ProcActInventario(rxDataCodigoProd.Value,rxDataCantidad.Value);
      //ibStpActualizaInv aqui voy que lo que
      if Not dmInventario.stpProcInsCostoProd.Transaction.InTransaction then
      dmInventario.stpProcInsCostoProd.Transaction.StartTransaction;
      try
        dmInventario.stpProcInsCostoProd.Transaction.CommitRetaining;
      except
      dmInventario.stpProcInsCostoProd.Transaction.RollbackRetaining;
      end;
      //if Not ibSqlUpdatePrecioInv.Transaction.InTransaction then
      //ibSqlUpdatePrecioInv.Transaction.StartTransaction;
      //try
      //  ibSqlUpdatePrecioInv.Transaction.CommitRetaining;
      //except
      //ibSqlUpdatePrecioInv.Transaction.RollbackRetaining;
      //end;
      //if Not ibStpActualizaInv.Transaction.InTransaction then
      //ibStpActualizaInv.Transaction.StartTransaction;
      //try
        //ibStpActualizaInv.Transaction.CommitRetaining;
      //except
      //ibStpActualizaInv.Transaction.RollbackRetaining;
      //end;

      rxData.Next;
    end;

    rxData.First;

    While Not rxData.Eof Do
    begin
      Suma:=Suma + rxDataTotal_neto.Value;
      rxData.Next;
    end;

    dmDespacho.tblDespachoMaster.Edit;
    xNumtrnmaster := dmDespacho.tblDespachoMasterNUMERO.Value;
    dmDespacho.tblDespachoMasterMONTO_TOTAL.Value:=Suma;
    dmDespacho.tblDespachoMaster.Post;
    dmDespacho.tblDespachoMaster.ApplyUpdates;
    if Not dmDespacho.tblDespachoMaster.Transaction.InTransaction then
    dmDespacho.tblDespachoMaster.Transaction.StartTransaction;
    try
      dmDespacho.tblDespachoMaster.Transaction.CommitRetaining;
    except
    dmDespacho.tblDespachoMaster.Transaction.RollbackRetaining;
    end;

    if (rxProveedorFormaPago.Value = 7) or (rxProveedorFormaPago.Value = 8) then
    begin
      ProcInsertarCXP(suma);

      dmInventario.stpProcActBlcProvCxp.params[0].Value:= rxProveedorCodigo.Value;//codigo proveedor
      dmInventario.stpProcActBlcProvCxp.params[1].Value:= rxProveedorTipo.Value;
      dmInventario.stpProcActBlcProvCxp.params[2].Value:= '1';//moneda
      dmInventario.stpProcActBlcProvCxp.params[3].Value:= 1;//debito
      dmInventario.stpProcActBlcProvCxp.params[4].Value:= Suma;
      dmInventario.stpProcActBlcProvCxp.params[5].Value:= ExtraerFecha(glbfechatrndiaria);
      dmInventario.stpProcActBlcProvCxp.params[6].Value:= dmCxp.tblTransCxpSerie.Value;
      dmInventario.stpProcActBlcProvCxp.ExecProc;
      if Not dmInventario.stpProcActBlcProvCxp.transaction.InTransaction then
      dmInventario.stpProcActBlcProvCxp.transaction.StartTransaction;
      try
        dmInventario.stpProcActBlcProvCxp.Transaction.CommitRetaining;
      except
      dmInventario.stpProcActBlcProvCxp.Transaction.RollbackRetaining;
      end;
    end; 
    rxData.Close;
    rxData.EmptyTable;
    rxData.Open;
    trnProcesada:=True;
    dmDespacho.qryBalanceDespacho.Close;
    dmDespacho.qryBalanceDespacho.Open;
    //frmProcesarDespachoVendedores.ProcesaVenta(2,True);
    if dmDespacho.tblDespachoMaster.State = dsInactive then
    begin
      dmDespacho.tblDespachoMaster.Params[0].Value:=ExtraerFecha(GlbFechaTrnDiaria);
      dmDespacho.tblDespachoMaster.Params[1].Value:=ExtraerFecha(GlbFechaTrnDiaria);
      dmDespacho.tblDespachoMaster.Open;
      dmDespacho.tblDespachoMaster.Locate('numero',xNumtrnmaster,[]);
    end;
    frmRegistrarPedidos.BitBtn4Click(Self);
    EditN2.Text:='';
    Close;

  end;
end;

procedure TfrmBuscarProdProcPed.FormShow(Sender: TObject);
begin
  //inherited;
  edtNumConduce.SetFocus;
end;

procedure TfrmBuscarProdProcPed.Edit1Exit(Sender: TObject);
begin
  //inherited;
  if edtNumConduce.Text = '' then exit;
  if edtNumConduce.ValueInteger = 0 then
  begin
    MessageDlg('Entre número de factura',mtInformation, [mbOK], 0);  
    edtNumConduce.SetFocus;
  end;
  frmBuscarProdProcPed.BitBtn1Click(Self);
end;

procedure TfrmBuscarProdProcPed.BitBtn1Click(Sender: TObject);
begin
  //inherited;
  if (Edit1.Text = '') And (edtBuscarProducto.Text = '') Then Exit;

  if (Edit1.Text <> '') then
  begin
    if qryInventario.Locate('CODIGO_TEXTO',Edit1.Text,[]) Then ProcRegProd
    else MessageDlg('Codigo producto no encontrado, verifique', mtInformation, [mbOK], 0);
  end else
  if (edtBuscarProducto.Text <> '') then
  begin
    if qryInventario.Locate('Descripcion', edtBuscarProducto.Text,[]) Then ProcRegProd
    else MessageDlg('Codigo producto no encontrado, verifique', mtInformation, [mbOK], 0);
  end else
  if (edtReferencia.Text <> '') then
  begin
    if qryInventario.Locate('Referencia', edtReferencia.Text,[]) Then ProcRegProd
    else MessageDlg('Referencia no encontrada, verifique', mtInformation, [mbOK], 0);
  end;
end;

procedure TfrmBuscarProdProcPed.RxDBGrid1CellClick(Column: TColumn);
begin
  //inherited;
  ProcRegProd;
end;

procedure TfrmBuscarProdProcPed.ProcRegProd;
var
  X : Smallint;
  CodCte:Integer;
  codruta, codemp:smallint;
begin
  Panel1.Visible:=True;
  if dmInventario.qryPrecioInventario.Locate('codigo_texto',qryInventarioCODIGO_Texto.AsString,[]) then
  begin
    //xPrecio:=dmInventario.qryPrecioInventarioprecio_distribuidor.value;
    rxDataCodigoProd.value:= qryInventarioCODIGO.Value;
  end
  else xPrecio:=0;

  if rxData.State in [dsEdit, dsinsert] then
  BitBtn4click(Self);
  if rxData.RecordCount = 0 then
  begin
    rxData.Insert;
    rxDataCodigoProd.value:= qryInventarioCODIGO.Value;
    rxDataTipo_trn.Value := 1;//Entrada
    rxDataNumConduce.Value:=edtNumconduce.ValueInteger;
    rxDataFecha.Value    := ExtraerFecha(GlbFechaTrnDiaria);
    if rxDatafecha.Value = 0 then rxData.Cancel;
    if FormatDateTime('yyyy',rxDataFecha.Value) = '1899' then rxData.Cancel;
    rxDatacodigo.Value   := qryInventarioCODIGO.AsString;
    //rxDataPrecio.Value   := xPrecio;
    rxDataBalanceAct.Value:=qryInventarioCANTIDAD.value;
    DBEdit3.SetFocus;
  end else
  begin
    CodEmp :=rxDataCodEmp.Value;
    CodRuta:=rxDataCodigoRuta.Value;
    rxData.Insert;
    rxDataCodigoProd.value:= qryInventarioCODIGO.Value;
    rxDataNumConduce.Value:=edtNumconduce.ValueInteger;
    rxDataTipo_trn.Value  := 1;//Entrada
    rxDataCodEmp.Value    := CodEmp;
    rxDataCodigoRuta.Value:= CodRuta;
    rxDataFecha.Value     := ExtraerFecha(GlbFechaTrnDiaria);
    rxDatacodigo.Value    := qryInventarioCODIGO.AsString;
    //rxDataPrecio.Value  := xPrecio;
    rxDataprecio.Value    := rxDataPrecioCompra.Value;
    rxDataPrecioVenta.Value := qryInventarioPRECIO.Value;
    rxDataPrecioCompra.Value:= qryInventarioPRECIO_COMPRA.Value;
    rxDataBalanceAct.Value:= qryInventarioCANTIDAD.value;
    DBEdit3.SetFocus;
  end;
end;

procedure TfrmBuscarProdProcPed.BitBtn4Click(Sender: TObject);
begin
  //inherited;
  if rxData.state in [dsEdit, dsInsert] then
  begin

    if rxDataCantidad.Value = 0 then
    begin
      rxData.Cancel;
      exit;
    end;
    edtBuscarProducto.Text:='';
    //rxDataporc_desc.Value:=qryInventarioPORC_DESCUENTO.Value;
    rxDatavalor.Value:=rxDataPrecio.Value * rxDataCantidad.Value;
    if qryInventarioPAGA_ITBI.Value = 1 then
    rxDataitbi.Value:= (rxDatavalor.Value -
                       (rxDatavalor.Value * rxDataporc_desc.Value/100)) *
    FGlbPorcItbi(ExtraerFecha(rxDataFecha.Value)) / 100;
    rxDatatotal_neto.Value:= (rxDatavalor.Value -
                       (rxDatavalor.Value * rxDataporc_desc.Value/100))
                                          + rxDataitbi.Value;
    rxDataCodEmp.Value:=dmDespacho.qryEmpleadosCODIGO.Value;
    rxDataNuevoBalance.Value:= rxDataCantidad.Value + rxDataBalanceAct.Value;
    // if rxDataprecio.Value = 0 then
    // begin
    //   DBEdit13.SetFocus;
    //   Exit;
    // end;
    //if (rxDataPrecioVenta.isNull) Or (rxDataPrecioVenta.Value = 0) then
    //begin
    //  dbedit2.Setfocus;
    //  //MessageDlg('Favor indicar el precio de venta',mtInformation, [mbOK], 0);
    //  Exit;
    //end;

    if edtNumConduce.ValueInteger > 0 then
    rxData.Post;
    Edit1.Text:='';
    if (rxDataPrecioCompra.IsNull or (rxDataPrecioCompra.Value = 0)) then
    DBEdit13.SetFocus else Edit1.SetFocus;
  end;

end;

procedure TfrmBuscarProdProcPed.FormCreate(Sender: TObject);
begin
  inherited;
  //
  rxProveedor.Close;
  rxProveedor.Open;
  rxProveedor.Insert;
  rxProveedor.Post;
  dmInventario.qryProveedores.Close;
  dmInventario.qryProveedores.Open;
end;

procedure TfrmBuscarProdProcPed.ProcInsCostoProdProveedor(codProd:integer;
numeroconduce:integer;precio:Real);

begin
  dmInventario.stpProcInsCostoProd.Params[0].Value:= rxProveedorCodigo.Value ;//Codigo Proveedor
  dmInventario.stpProcInsCostoProd.Params[1].Value:= codprod;//codigoarticulo
  dmInventario.stpProcInsCostoProd.Params[2].Value:= ExtraerFecha(GlbFechaTrnDiaria);//fecha_ult_pedido
  dmInventario.stpProcInsCostoProd.Params[3].Value:= numeroconduce;//numeroconduce
  dmInventario.stpProcInsCostoProd.Params[4].Value:= Precio;//precio
  dmInventario.stpProcInsCostoProd.Params[5].Value:= VarUsuarioGlb;//codigousuario
  dmInventario.stpProcInsCostoProd.ExecProc;
end;

procedure TfrmBuscarProdProcPed.RxDBLookupCombo3Exit(Sender: TObject);
begin
  inherited;
  if rxProveedor.State in [dsEdit, dsInsert] then
  rxProveedor.Post;
end;

function TfrmBuscarProdProcPed.FuncGetFormaPago(var x: integer): Boolean;
begin
  Result:=False;
  frmFormaPago:=TfrmFormaPago.Create(nil);
  try
    if frmFormaPago.Showmodal = mrOk then
    begin
      x:=dmVentas.TblFormaPagoCODIGO.Value;
      result:=True;
    end else x:=-1;
  finally
  frmFormaPago.Free;
  frmFormaPago:=Nil;
  end;
end;

procedure TfrmBuscarProdProcPed.ProcInsertarCXP(monto : Real);
begin
  dmCxp.tblTransCxp.Close;
  dmCxp.tblTransCxp.Params[0].Value:=ExtraerFecha(glbfechatrndiaria);
  dmCxp.tblTransCxp.Params[1].Value:=ExtraerFecha(glbfechatrndiaria);
  dmCxp.tblTransCxp.Open;

  dmCxp.tblTransCxp.Insert;
  dmCxp.tblTransCxpSTATUS.Value:='A';
  //dmCxc.tblTransCxcconcepto.Value     := 'Pago cuota';
  //if (tipo = 1) then
  //begin
    dmCxp.tblTransCxpTIPO_DOC.Value := 1; //Factura
    dmCxp.tblTransCxpconcepto.Value := 'Compra';
  //end else dmCxp.tblTransCxpTIPO_DOC.Value := 2; //Recibo
  dmCxp.tblTransCxpmoneda.Value  := '1';
  dmCxp.tblTransCxpfecha.Value   := ExtraerFecha(GlbFechatrndiaria);

  dmCxp.tblTransCxpcodigo_cliente.Value :=  rxProveedorCodigo.Value;
  dmCxp.tblTransCxpcodigo_serv.Value    := 0;
  dmCxp.tblTransCxpNUMERO_DOC.Value     := rxDataNumConduce.Value;

  dmCxp.tblTransCxpvalor_documento.Value:= Monto;
  dmCxp.tblTransCxptipo_tranf.Value     := 1;//Debito
  dmCxp.tblTransCxptipo_serv.Value      := 1;
  dmCxp.tblTransCxpfecha_in.Value       := Now;
  dmCxp.tblTransCxpIN_POR.Value := StrUserName;
  dmCxp.tblTransCxp.Post;
  dmCxp.tblTransCxp.ApplyUpdates;

  if Not dmCxp.tblTransCxp.Transaction.InTransaction then
  dmCxp.tblTransCxp.Transaction.StartTransaction;
  try
    dmCxp.tblTransCxp.Transaction.CommitRetaining;
  except
  dmCxp.tblTransCxp.Transaction.RollbackRetaining;
  end;
  dmcxp.stpInsFactPendiente.Params[0].Value := rxProveedorCodigo.Value;
  dmcxp.stpInsFactPendiente.Params[1].Value := rxProveedorTipo.Value;
  dmcxp.stpInsFactPendiente.Params[2].Value := '1';
  dmcxp.stpInsFactPendiente.Params[3].Value := rxDataNumConduce.Value;
  dmcxp.stpInsFactPendiente.Params[4].Value := Monto;

  dmcxp.stpInsFactPendiente.ExecProc;
  if Not dmCxp.stpInsFactPendiente.Transaction.InTransaction then
  dmCxp.stpInsFactPendiente.Transaction.StartTransaction;
  try
    dmCxp.stpInsFactPendiente.Transaction.CommitRetaining;
  except
  dmCxp.stpInsFactPendiente.Transaction.RollbackRetaining;
  end;
end;

procedure TfrmBuscarProdProcPed.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  //inherited;  
end;

procedure TfrmBuscarProdProcPed.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //inherited;
  if (key = 27) then
  begin
    if (rxData.State in [dsEdit, dsInsert]) then
    begin
      if MessageDlg('Cancelar transacción?', mtWarning, [mbyes,mbNo], 0) = mryes then
      begin
        rxData.Cancel;
      end;
    end else
    if MessageDlg('Cerrar ventana?',mtInformation, [mbyes,mbNo], 0) = mryes then
    Close;
  end;

end;

procedure TfrmBuscarProdProcPed.edtBuscarProductoChange(Sender: TObject);
begin
  //inherited;
  qryInventario.Locate('Descripcion',edtBuscarProducto.Text,[loCaseInsensitive,loPartialKey])
end;

procedure TfrmBuscarProdProcPed.ProcActInventario(codProd:Integer;NewCant: Real);
begin
  ibStpActualizaInv.Params[0].Value:= CodProd;
  ibStpActualizaInv.Params[1].Value:= NewCant;
  ibStpActualizaInv.Params[2].Value:= 1;
  ibStpActualizaInv.Params[3].Value:= 1;
  ibStpActualizaInv.ExecProc;
end;

procedure TfrmBuscarProdProcPed.BitBtn7Click(Sender: TObject);
begin
  //inherited;
  frmCodigoBarra:=TfrmCodigoBarra.Create(Nil);
  try
    if qryInventario.state = dsBrowse then
    begin
      if frmCodigoBarra.qryInv.State = dsBrowse then
      begin
        if Not frmCodigoBarra.qryInv.Locate('codigo', qryInventarioCODIGO.Value, []) then
        MessageDlg('Codigo no encontrado en tabla inventario.', mtInformation, [mbOK], 0);
      end
    end else
    begin
      MessageDlg('Favor seleccionar producto.', mtWarning, [mbOK], 0);
      frmCodigoBarra.Free;
      frmCodigoBarra:= Nil;
      exit;    
    end;
    frmCodigoBarra.ShowModal;
  finally
  frmCodigoBarra.Free;
  frmCodigoBarra:= Nil;
  end;
end;

procedure TfrmBuscarProdProcPed.BitBtn8Click(Sender: TObject);
var
  cod : String;
begin
  inherited;
  frmInventarioProd:=TfrmInventarioProd.Create(Nil);
  try
    dmInventario.tblInventarioProd.Locate('codigo',qryInventarioCODIGO_TEXTO.Value,[]);
    frminventarioprod.ShowModal;
  finally
  frmInventarioProd.Free;
  frmInventarioProd:=Nil;
  end;
  qryInventario.Close;
  qryInventario.Open;
  qryInventario.Locate('CODIGO', rxDataCodigoProd.Value,[]);
  dmInventario.tblInventarioProd.Close;
  dmInventario.tblInventarioProd.Open;
end;

procedure TfrmBuscarProdProcPed.EditN2Change(Sender: TObject);
begin
  inherited;
  if rxData.RecordCount > 0 then
  begin
    if rxData.state = dsbrowse then rxData.Edit;
    rxDataPrecioVenta.Value:= rxDataPrecioCompra.Value * (1 + EditN2.ValueFloat/100);
  end;
end;

procedure TfrmBuscarProdProcPed.edtReferenciaChange(Sender: TObject);
begin
  inherited;
  qryInventario.Locate('Referencia', edtReferencia.Text,[loCaseInsensitive,loPartialKey])
end;

procedure TfrmBuscarProdProcPed.DBEdit1Change(Sender: TObject);
begin
  inherited;
  if rxData.state = dsInactive then exit;
  if rxData.state = dsbrowse then rxData.Edit;
    rxDataPrecioVenta.Value:= rxDataPrecioCompra.Value * (1 + EditN2.ValueFloat/100);
end;

procedure TfrmBuscarProdProcPed.rxDataCalcFields(DataSet: TDataSet);
begin
  inherited;
  if rxDataPrecioCompra.Value> 0 then
  rxDataMargen.Value:=((rxDataPrecioVenta.Value - rxDataPrecioCompra.Value)
                                     / rxDataPrecioCompra.Value) * 100;
  if (editn2.Text = '') then
  editn2.SetFloat(rxDataMargen.Value);
end;

procedure TfrmBuscarProdProcPed.DBEdit2Exit(Sender: TObject);
begin
  inherited;
  if rxData.State in [dsedit, dsInsert] then
  begin
    Edit1.SetFocus;
    rxDataprecio.Value := rxDataPrecioCompra.Value;
    //rxDataPrecioVenta.Value := rxDataPrecioCompra.Value * (1 + EditN2.ValueFloat/100);
    BitBtn4Click(Self);
  end;
end;

procedure TfrmBuscarProdProcPed.ProcAsignarValores;
begin
  if rxData.state in [dsEdit, dsInsert] then
  begin
    rxDataprecio.Value := rxDataPrecioCompra.Value;
    rxDatavalor.Value:=rxDataPrecio.Value * rxDataCantidad.Value;
    if qryInventarioPAGA_ITBI.Value = 1 then
    rxDataitbi.Value:= (rxDatavalor.Value -
                       (rxDatavalor.Value * rxDataporc_desc.Value/100)) *
    FGlbPorcItbi(ExtraerFecha(rxDataFecha.Value)) / 100;
    rxDatatotal_neto.Value:= (rxDatavalor.Value -
                       (rxDatavalor.Value * rxDataporc_desc.Value/100))
                                          + rxDataitbi.Value;
    rxDataCodEmp.Value:=dmDespacho.qryEmpleadosCODIGO.Value;
    rxDataNuevoBalance.Value:= rxDataCantidad.Value + rxDataBalanceAct.Value;
  end;
end;

procedure TfrmBuscarProdProcPed.DBEdit13Exit(Sender: TObject);
begin
  //inherited;
  ProcAsignarValores;
end;

end.
