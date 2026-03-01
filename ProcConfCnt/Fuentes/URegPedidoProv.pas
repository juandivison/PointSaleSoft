unit URegPedidoProv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UBuscarProductoInvDespacho, DB, RxMemDS, IBCustomDataSet,
  IBQuery, EditNew, RxLookup, Mask, DBCtrls, RXCtrls, RXDBCtrl, ExtCtrls,
  StdCtrls, Buttons, Grids, DBGrids, IBTable, IBStoredProc, IBSQL, ToolEdit,
  WinSkinData, Menus;

type
  TfrmRegPedidoProv = class(TForm)
    Label1: TLabel;
    Label18: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    EditN1: TEditN;
    Label20: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    edtNumConduce: TEditN;
    edtBuscarProducto: TEditN;
    BitBtn7: TBitBtn;
    edtReferencia: TEditN;
    Shape1: TShape;
    Shape2: TShape;
    IBTable1: TIBTable;
    ibStpActualizaInv: TIBStoredProc;
    qryInventario: TIBQuery;
    qryInventarioDESCRIPCION: TIBStringField;
    qryInventarioPRECIO: TFloatField;
    qryInventarioPAGA_ITBI: TSmallintField;
    qryInventarioDESC_TIPOINV: TIBStringField;
    qryInventarioTIPO: TIntegerField;
    qryInventarioPORC_DESCUENTO: TFloatField;
    qryInventarioCODIGO: TIntegerField;
    qryInventarioCANTIDAD: TFloatField;
    qryInventarioREFERENCIA: TIBStringField;
    qryInventarioPRECIO_COMPRA: TFloatField;
    qryRuta: TIBQuery;
    qryRutaCODIGO: TIntegerField;
    qryRutaCODIGO_EMP: TIntegerField;
    rxProveedor: TRxMemoryData;
    rxProveedorCodigo: TIntegerField;
    rxProveedorFormaPago: TIntegerField;
    rxProveedorTipo: TIntegerField;
    rxData: TRxMemoryData;
    rxDataTIPO_TRN: TIntegerField;
    rxDataPrecio: TCurrencyField;
    rxDataCantidad: TFloatField;
    rxDataporc_desc: TFloatField;
    rxDataitbi: TCurrencyField;
    rxDatavalor: TCurrencyField;
    rxDatatotal_neto: TCurrencyField;
    rxDatafecha: TDateTimeField;
    rxDataCodigoRuta: TIntegerField;
    rxDataCodEmp: TIntegerField;
    rxDataNuevoBalance: TFloatField;
    rxDataNuevoMonto: TFloatField;
    rxDataBalanceAct: TFloatField;
    rxDataNumConduce: TIntegerField;
    rxDataCodigoProd: TIntegerField;
    rxDataPrecioCompra: TFloatField;
    rxDataPrecioVenta: TFloatField;
    rxDataMargen: TFloatField;
    IBTable2: TIBTable;
    IBTable2CODIGO_CTE: TIntegerField;
    IBTable2TIPO_CLIENTE: TIntegerField;
    IBTable2DESCRIPCION: TIBStringField;
    IBTable2ESTADO: TIBStringField;
    IBTable2CIUDAD: TIBStringField;
    IBTable2TELEFONO: TIBStringField;
    IBTable2DIRECCIONWEB: TIBStringField;
    dsrxProveedor: TDataSource;
    dsrxData: TDataSource;
    dsqryEmpleados: TDataSource;
    dstblRuta: TDataSource;
    DataSource1: TDataSource;
    dsqryInventario: TDataSource;
    ibSqlUpdatePrecioInv: TIBStoredProc;
    RxDBLookupCombo3: TRxDBLookupCombo;
    RxDBGrid1: TRxDBGrid;
    Panel1: TPanel;
    Label5: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBStatusLabel1: TDBStatusLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label19: TLabel;
    labelNumConduce: TLabel;
    lablBlcInv: TLabel;
    Label21: TLabel;
    Label24: TLabel;
    DBEdit4: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    RxDBLookupCombo1: TRxDBLookupCombo;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    RxDBLookupCombo2: TRxDBLookupCombo;
    dbEditNumConduce: TDBEdit;
    dbEditBlcInventario: TDBEdit;
    DBEdit13: TDBEdit;
    BitBtn8: TBitBtn;
    EditN2: TEditN;
    RxDBGrid2: TRxDBGrid;
    stpProcInsDespachoDet: TIBStoredProc;
    stpProcInsDespachoMaster: TIBStoredProc;
    rxDataDescProducto: TStringField;
    rxDataCantAct: TIntegerField;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    rxDataItbiUnitario: TCurrencyField;
    rxDataPrecioUnitario: TCurrencyField;
    Label25: TLabel;
    Label26: TLabel;
    rxDataP_I_Margen: TCurrencyField;
    rxDataStatus: TStringField;
    stpProcActInv: TIBStoredProc;
    Button1: TButton;
    Label27: TLabel;
    DBDateEdit1: TDBDateEdit;
    rxDataFechaVencimiento: TDateTimeField;
    qryInventarioFECHA_VENCIMIENTO: TDateTimeField;
    qryInventarioCODIGO_TEXTO: TIBStringField;
    rxDatacodigo: TStringField;
    Label28: TLabel;
    edtLotNum: TEditN;
    ibstpInsertarLote: TIBStoredProc;
    SkinData1: TSkinData;
    MainMenu1: TMainMenu;
    ReImprimirFactura1: TMenuItem;
    stpProcActBalanceProvcxp: TIBStoredProc;
    RadioButton1: TRadioButton;
    rdbtnPrecioVenta: TRadioButton;
    Label29: TLabel;
    DBEdit16: TDBEdit;
    Label30: TLabel;
    DBEdit17: TDBEdit;
    rxProveedorRNCPROVEEDOR: TStringField;
    rxProveedorNCF: TStringField;
    stpMantInvAlmacen: TIBStoredProc;
    panelClasifPrecio: TPanel;
    rxClasifPrecio: TRxMemoryData;
    tblTipoPrecio: TIBTable;
    tblTipoPrecioPRECIO_ID: TIntegerField;
    tblTipoPrecioDESCRIPCION: TIBStringField;
    DBGrid1: TDBGrid;
    dstblTipoPrecio: TDataSource;
    qryClasifPrecio: TIBDataSet;
    qryClasifPrecioCOD_PRODUCTO: TIntegerField;
    qryClasifPrecioPRECIO_ID: TIntegerField;
    qryClasifPrecioPRECIO_VENTA: TFloatField;
    qryClasifPrecioCOD_USUARIO: TIntegerField;
    qryClasifPrecioSTATUS: TIBStringField;
    qryClasifPrecioIN_POR: TIBStringField;
    qryClasifPrecioFECHA_IN: TDateTimeField;
    qryClasifPrecioMOD_POR: TIBStringField;
    qryClasifPrecioFECHA_MOD: TDateTimeField;
    DBGrid2: TDBGrid;
    dsqryClasifPrecio: TDataSource;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    DBStatusLabel2: TDBStatusLabel;
    PopupMenu1: TPopupMenu;
    ConfigurarPrecio1: TMenuItem;
    Label31: TLabel;
    qryClasifPrecioMargenG: TCurrencyField;
    DBEdit18: TDBEdit;
    Label32: TLabel;
    DBEdit19: TDBEdit;
    Label33: TLabel;
    rxDataFormaPago: TIntegerField;
    rxDataMontoDescuento: TCurrencyField;
    RxDBLookupCombo4: TRxDBLookupCombo;
    Label34: TLabel;
    rxDataunidadId: TIntegerField;
    rxDataCantUnidad: TFloatField;
    DBEdit20: TDBEdit;
    Label35: TLabel;
    procedure RxDBGrid1CellClick(Column: TColumn);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure DBEdit13Exit(Sender: TObject);
    procedure EditN2Change(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure edtBuscarProductoChange(Sender: TObject);
    procedure edtReferenciaChange(Sender: TObject);
    procedure RxDBLookupCombo3Exit(Sender: TObject);
    procedure rxDataCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure rxDataAfterPost(DataSet: TDataSet);
    procedure RxDBGrid2GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ReImprimirFactura1Click(Sender: TObject);
    procedure DBEdit2Change(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure rdbtnPrecioVentaClick(Sender: TObject);
    procedure tblTipoPrecioAfterScroll(DataSet: TDataSet);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure ConfigurarPrecio1Click(Sender: TObject);
    procedure qryClasifPrecioCalcFields(DataSet: TDataSet);
    procedure RxDBLookupCombo4Change(Sender: TObject);
    procedure DBEdit20Exit(Sender: TObject);
  private
    { Private declarations }
    procedure ProcRegProd;
    procedure ProcInsertarCXP(monto : Real);
    Function FuncGetFormaPago(var x:integer):Boolean;
    procedure ProcActInventario(codProd : Integer;NewCant : Real);
    procedure ProcAsignarValores;
    procedure ActualizaInventario(tipotrn:Smallint);
    procedure ActualizaBalanceDespacho(Tipotrn:Smallint);
    procedure Imprimir;

    //new code
    Procedure ProcInsDespachoMaster;
    Procedure ProcInsDespachoDetalle;
    procedure ActivaPVentaMargen;
    procedure ActualizaInvAlmacen;

  public
    { Public declarations }
     procedure ProcInsCostoProdProveedor(codProd:integer;numeroconduce:integer;precio:Real);
  end;

var
  frmRegPedidoProv: TfrmRegPedidoProv;
  xPrecio : Real;
  strTipoVenta : String;
  nombreuser : String[12];
implementation
 uses UDatModDespacho, UGlobal, UDatosVentas, UDatModInventario,
  UDatModCuadrexRuta, UDatModConectar, URegFpago, UDatModCxp,
  ULabelImpCodBarra, UInventarioProd, UQckReporteFactura, UDatModEmpleados,
  UDatModCompania;

{$R *.dfm}

procedure TfrmRegPedidoProv.RxDBGrid1CellClick(Column: TColumn);
begin
  if (rxDataStatus.value = 'R') then
  begin
    MessageDlg('Favor limpiar datos para proceder con otro registro.',mtInformation, [mbOK], 0);
    Exit;
  end;
  ProcRegProd;
end;

procedure TfrmRegPedidoProv.BitBtn4Click(Sender: TObject);
begin
  if rxData.State in [dsEdit, dsInsert] then
  begin
    if rxDataCantidad.Value = 0 then
    begin
      rxData.Cancel;
      exit;
    end;
    edtBuscarProducto.Text:='';

    rxDatavalor.Value:=rxDataPrecio.Value * rxDataCantidad.Value;

    rxDataMontoDescuento.Value:= rxDatavalor.Value * rxDataporc_desc.Value/100;
    if qryInventarioPAGA_ITBI.Value = 1 then
    rxDataitbi.Value:= (rxDatavalor.Value -
                       (rxDatavalor.Value * rxDataporc_desc.Value/100)) *
    FGlbPorcItbi(ExtraerFecha(rxDataFecha.Value)) / 100;
    rxDatatotal_neto.Value:= (rxDatavalor.Value -
                             (rxDatavalor.Value * rxDataporc_desc.Value/100))
                                                + rxDataitbi.Value;
    rxDataCodEmp.Value:=dmDespacho.qryEmpleadosCODIGO.Value;
    rxDataNuevoBalance.Value:= rxDataCantidad.Value + rxDataBalanceAct.Value;

    if edtNumConduce.ValueInteger > 0 then
    rxData.Post;
    Edit1.Text:='';
    if (rxDataPrecioCompra.IsNull or (rxDataPrecioCompra.Value = 0)) then
    DBEdit13.SetFocus else Edit1.SetFocus;
  end;
end;

procedure TfrmRegPedidoProv.BitBtn1Click(Sender: TObject);
begin
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

procedure TfrmRegPedidoProv.BitBtn2Click(Sender: TObject);
var
  xNumtrnmaster, x :integer;
  suma : Real;
begin
  if (GlbFechaVencProducto = 1) then
  begin
    if (edtLotNum.Text = '') then
    begin
      MessageDlg('Favor indicar numero de lote', mtInformation, [mbOK], 0);
      edtLotNum.SetFocus;
      exit;
    end;
  end;
  if (rxProveedorcodigo.IsNull) And (rxdata.RecordCount > 0)  then
  begin
    MessageDlg('Favor indicar proveedor', mtInformation, [mbOK], 0);
    RxDBLookupCombo3.SetFocus;
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
  if (rxDataStatus.Value = 'R') then
  begin
    if MessageDlg('Transaccion fue procesada, desea inicializar?', mtInformation, [mbyes, mbno], 0)= mryes then
    begin
      rxData.EmptyTable;
      BitBtn2.Enabled:=True;
      Exit;
    end else Exit;
  end;
  ProcInsDespachoMaster;  //Poblar tabla Despacho Master
  ProcInsDespachoDetalle; //Poblar tabla Despacho Detalle
  
  BitBtn2.Enabled:= False;
  
  trnProcesada:=True;
  dmDespacho.qryBalanceDespacho.Close;
  dmDespacho.qryBalanceDespacho.Open;

  //EditN2.Text:='';

  strTipoVenta:='Entrada';
  dmCompania.tblCompania.Close;
  dmCompania.tblCompania.Open;
  dmDespacho.tblDespachoMasterRep.Close;
  dmDespacho.tblDespachoMasterRep.Params[0].Value:= stpProcInsDespachoMaster.Params[13].Value;//dmDespacho.tblDespachoMasterNUMERO.Value;
  dmDespacho.tblDespachoMasterRep.Params[1].Value:=rxProveedorCodigo.Value;
  dmDespacho.tblDespachoMasterRep.Open;
  dmVentas.qryProveedor.Close;
  dmVentas.qryProveedor.Params[0].Value:= rxProveedorCodigo.Value;
  dmVentas.qryProveedor.Open;
  Imprimir;
  //t editn2.SetFloat(0);
  //Final
end;

procedure TfrmRegPedidoProv.BitBtn7Click(Sender: TObject);
begin
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
    frmCodigoBarra.EditN1.SetInteger(rxDataCantidad.AsInteger);
    frmCodigoBarra.ShowModal;
  finally
  frmCodigoBarra.Free;
  frmCodigoBarra:= Nil;
  end;
end;

procedure TfrmRegPedidoProv.BitBtn8Click(Sender: TObject);
begin
  frmInventarioProd:=TfrmInventarioProd.Create(Nil);
  try
    dmInventario.tblInventarioProd.Locate('codigo_texto',qryInventarioCODIGO_TEXTO.Value,[]);
    frminventarioprod.ShowModal;
  finally
  frmInventarioProd.Free;
  frmInventarioProd:=Nil;
  end;
  qryInventario.Close;
  qryInventario.Open;
  qryInventario.Locate('CODIGO', rxDataCodigoProd.Value,[]);
  if rxData.state = dsBrowse then
  rxData.Edit;
  rxDataDescProducto.Value:=qryInventarioDESCRIPCION.Value;
  dmInventario.tblInventarioProd.Close;
  dmInventario.tblInventarioProd.Open;

end;

procedure TfrmRegPedidoProv.DBEdit13Exit(Sender: TObject);
begin
  ProcAsignarValores;
end;

procedure TfrmRegPedidoProv.EditN2Change(Sender: TObject);
begin
  //if rxData.RecordCount > 0 then
  //begin
    if rdbtnPrecioVenta.Checked then Exit;
    if rxData.state = dsbrowse then rxData.Edit;
    if rxData.state in [dsEdit, dsInsert] then
    rxDataPrecioVenta.Value:= rxDataPrecioCompra.Value * (1 + EditN2.ValueFloat/100);
  //end;
end;

procedure TfrmRegPedidoProv.DBEdit2Exit(Sender: TObject);
var
  pVMargen : Extended;
begin
  if rdbtnPrecioVenta.Checked then
  begin
   if rxData.state = dsbrowse then rxData.Edit;
   if rxData.state in [dsEdit, dsInsert] then
   //rxDataPrecioVenta.Value:= rxDataPrecioCompra.Value * (1 + EditN2.ValueFloat/100);
   pVMargen := ((rxDataPrecioVenta.Value - rxDataPrecioCompra.Value) /
                rxDataPrecioCompra.Value) * 100;
   pVMargen := StrToFloat(Format('%8.2f',[pVMargen]));
   EditN2.SetFloat(pVMargen);
  end;

  //----------------------**********--------------------------

  if rxData.State In [dsedit, dsInsert] then
  begin
    Edit1.SetFocus;
    rxDataprecio.Value := rxDataPrecioCompra.Value;
    BitBtn4Click(Self);
  end;
end;

procedure TfrmRegPedidoProv.Edit1Exit(Sender: TObject);
begin
  if (rxDataStatus.value = 'R') then
  begin
    MessageDlg('Favor limpiar datos para proceder con otro registro.',mtInformation, [mbOK], 0);
    Exit;
  end;
  if edtNumConduce.Text = '' then exit;
  if edtNumConduce.ValueInteger = 0 then
  begin
    MessageDlg('Entre número de factura',mtInformation, [mbOK], 0);
    edtNumConduce.SetFocus;
  end;
  BitBtn1Click(Self);
end;

procedure TfrmRegPedidoProv.edtBuscarProductoChange(Sender: TObject);
begin
  qryInventario.Locate('Descripcion',edtBuscarProducto.Text,[loCaseInsensitive,loPartialKey])
end;

procedure TfrmRegPedidoProv.edtReferenciaChange(Sender: TObject);
begin
  qryInventario.Locate('Referencia', edtReferencia.Text,[loCaseInsensitive,loPartialKey])
end;

procedure TfrmRegPedidoProv.RxDBLookupCombo3Exit(Sender: TObject);
begin
  if rxProveedor.State in [dsEdit, dsInsert] then
  rxProveedor.Post;
end;

procedure TfrmRegPedidoProv.rxDataCalcFields(DataSet: TDataSet);
begin
  if rxDataPrecioCompra.Value> 0 then
  rxDataMargen.Value:=((rxDataPrecioVenta.Value - rxDataPrecioCompra.Value)
                                     / rxDataPrecioCompra.Value) * 100;
  if (editn2.Text = '') then
  editn2.SetFloat(rxDataMargen.Value);

  rxDataNuevoMonto.Value:= rxDataNuevoBalance.Value * rxDataPrecio.Value;
  if (rxDataCantidad.Value > 0) then
  begin
    if (rxDataCantidad.Value > 0) then
    rxDataPrecioUnitario.Value:=
    (rxDataitbi.Value + rxDatavalor.Value) / rxDataCantidad.Value;

    //rxDataPrecioUnitario.Value:=
    //(rxDataPrecioCompra.Value / rxDataCantidad.Value) *
    // (1 +FGlbPorcItbi(ExtraerFecha(rxDataFecha.Value))/100);

    rxDataP_I_Margen.Value:=
    rxDataPrecioVenta.Value  * (1 +FGlbPorcItbi(ExtraerFecha(rxDataFecha.Value))/100);
  end;
end;

function TfrmRegPedidoProv.FuncGetFormaPago(var x: integer): Boolean;
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

procedure TfrmRegPedidoProv.ProcActInventario(codProd: Integer;
  NewCant: Real);
begin
  ibStpActualizaInv.Params[0].Value:= CodProd;
  ibStpActualizaInv.Params[1].Value:= NewCant;
  ibStpActualizaInv.Params[2].Value:= 1;
  ibStpActualizaInv.Params[3].Value:= 1;
  ibStpActualizaInv.ExecProc;  
end;

procedure TfrmRegPedidoProv.ProcAsignarValores;
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

procedure TfrmRegPedidoProv.ProcInsCostoProdProveedor(codProd,
  numeroconduce: integer; precio: Real);
begin
  dmInventario.stpProcInsCostoProd.Params[0].Value:= rxProveedorCodigo.Value ;//Codigo Proveedor
  dmInventario.stpProcInsCostoProd.Params[1].Value:= codprod;//codigoarticulo
  dmInventario.stpProcInsCostoProd.Params[2].Value:= ExtraerFecha(GlbFechaTrnDiaria);//fecha_ult_pedido
  dmInventario.stpProcInsCostoProd.Params[3].Value:= numeroconduce;//numeroconduce
  dmInventario.stpProcInsCostoProd.Params[4].Value:= Precio;//precio
  dmInventario.stpProcInsCostoProd.Params[5].Value:= VarUsuarioGlb;//codigousuario
  dmInventario.stpProcInsCostoProd.ExecProc;
end;

procedure TfrmRegPedidoProv.ProcInsertarCXP(monto: Real);
begin
  dmCxp.tblTransCxp.Close;
  dmCxp.tblTransCxp.Params[0].Value:=ExtraerFecha(glbfechatrndiaria);
  dmCxp.tblTransCxp.Params[1].Value:=ExtraerFecha(glbfechatrndiaria);
  dmCxp.tblTransCxp.Open;

  dmCxp.tblTransCxp.Insert;
  dmCxp.tblTransCxpSTATUS.Value   := 'A';
  dmCxp.tblTransCxpTIPO_DOC.Value := 1; //Factura
  dmCxp.tblTransCxpconcepto.Value := 'Compra';

  dmCxp.tblTransCxpmoneda.Value  := '1';
  dmCxp.tblTransCxpfecha.Value   := ExtraerFecha(GlbFechatrndiaria);

  dmCxp.tblTransCxpcodigo_cliente.Value :=  rxProveedorCodigo.Value;
  dmCxp.tblTransCxpcodigo_serv.Value    := 0;
  dmCxp.tblTransCxpNUMERO_DOC.Value     := rxDataNumConduce.Value;

  dmCxp.tblTransCxpvalor_documento.Value:= Monto;
  dmCxp.tblTransCxptipo_tranf.Value     := 1;//Debito
  dmCxp.tblTransCxptipo_serv.Value      := 2;
  dmCxp.tblTransCxpfecha_in.Value       := Now;
  dmCxp.tblTransCxpIN_POR.Value         := StrUserName;
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

  stpProcActBalanceProvcxp.Params[0].Value := dmCxp.tblTransCxpCodigo_cliente.Value;
  stpProcActBalanceProvcxp.Params[1].Value := dmCxp.tblTransCxpCODIGO_SERV.Value;
  stpProcActBalanceProvcxp.Params[2].Value := dmCxp.tblTransCxpMONEDA.Value;
  stpProcActBalanceProvcxp.Params[3].Value := 1;
  stpProcActBalanceProvcxp.Params[4].Value := dmCxp.tblTransCxpVALOR_DOCUMENTO.Value;
  stpProcActBalanceProvcxp.Params[5].Value := dmCxp.tblTransCxpFECHA.Value;
  stpProcActBalanceProvcxp.Params[6].Value := dmCxp.tblTransCxpSERIE.Value;
  stpProcActBalanceProvcxp.ExecProc;

end;

procedure TfrmRegPedidoProv.ProcRegProd;
var
  X : Smallint;
  CodCte:Integer;
  codruta, codemp:smallint;
begin
  Panel1.Visible:=True;
  if dmInventario.qryPrecioInventario.Locate('codigo_texto',qryInventarioCODIGO_Texto.AsString,[]) then
  begin
    rxDataCodigoProd.value:= qryInventarioCODIGO.Value;
  end
  else xPrecio:=0;

  if rxData.State in [dsEdit, dsinsert] then
  BitBtn4click(Self);
  if rxData.RecordCount = 0 then
  begin
    rxData.Insert;
    rxDataStatus.Value:= 'A';
    rxDataporc_desc.Value:=qryInventarioPORC_DESCUENTO.Value;
    rxDataCantAct.Value:=qryInventarioCANTIDAD.AsInteger;
    rxDataCodigoProd.value:= qryInventarioCODIGO.Value;
    rxDataDescProducto.Value:=qryInventarioDESCRIPCION.Value;
    rxDataTipo_trn.Value := 1;//Entrada
    rxDataNumConduce.Value:=edtNumconduce.ValueInteger;
    rxDataFecha.Value    := ExtraerFecha(GlbFechaTrnDiaria);
    if rxDatafecha.Value = 0 then rxData.Cancel;
    if FormatDateTime('yyyy',rxDataFecha.Value) = '1899' then rxData.Cancel;
    rxDatacodigo.Value   := qryInventarioCODIGO.AsString;
    rxDataBalanceAct.Value:=qryInventarioCANTIDAD.value;
    RxDBLookupCombo4.SetFocus;
  end else
  begin
    CodEmp :=rxDataCodEmp.Value;
    CodRuta:=rxDataCodigoRuta.Value;
    rxData.Insert;
    rxDataStatus.Value:= 'A';
    rxDataporc_desc.Value:=qryInventarioPORC_DESCUENTO.Value;
    rxDataCantAct.Value:=qryInventarioCANTIDAD.AsInteger;
    rxDataDescProducto.Value:=qryInventarioDESCRIPCION.Value;
    rxDataCodigoProd.value:= qryInventarioCODIGO.Value;
    rxDataNumConduce.Value:=edtNumconduce.ValueInteger;
    rxDataTipo_trn.Value  := 1;//Entrada
    rxDataCodEmp.Value    := CodEmp;
    rxDataCodigoRuta.Value:= CodRuta;
    rxDataFecha.Value     := ExtraerFecha(GlbFechaTrnDiaria);
    rxDatacodigo.Value    := qryInventarioCODIGO.AsString;
    //rxDataprecio.Value    := rxDataPrecioCompra.Value;
    //rxDataPrecioVenta.Value := qryInventarioPRECIO.Value;
    //rxDataPrecioCompra.Value:= qryInventarioPRECIO_COMPRA.Value;
    rxDataBalanceAct.Value:= qryInventarioCANTIDAD.value;
    RxDBLookupCombo4.SetFocus;
  end;
end;

procedure TfrmRegPedidoProv.FormCreate(Sender: TObject);
begin
  dminventario.tblUnidades.Close;
  dminventario.tblUnidades.Open;
  panelClasifPrecio.Top := 336;
  tblTipoPrecio.close;
  tblTipoPrecio.Open;
  qryClasifPrecio.close;
  qryClasifPrecio.open;
  
  rxProveedor.Close;
  rxProveedor.Open;
  rxProveedor.Insert;
  rxProveedor.Post;
  dmInventario.qryProveedores.Close;
  dmInventario.qryProveedores.Open;

  qryInventario.close;
  qryInventario.open;
  rxData.close;
  rxData.Open;
  trnProcesada:=False;
  dmEmpleados.tblRuta.close;
  dmEmpleados.tblRuta.open;
  dmEmpleados.tblEmpleados.close;
  dmEmpleados.tblEmpleados.open;
  dmCuadrexRuta.tblBalanceDespacho.close;
  dmCuadrexRuta.tblBalanceDespacho.open;
  
  dmInventario.qryPrecioInventario.Close;
  dmInventario.qryPrecioInventario.Params[0].Value:=ExtraerFecha(Date);
  dmInventario.qryPrecioInventario.Params[1].Value:=ExtraerFecha(Date);
  dmInventario.qryPrecioInventario.open;

  dmInventario.tblInventarioProd.Close;
  dmInventario.tblInventarioProd.Open;
  dmDespacho.tblTipoDespacho.Close;
  dmDespacho.tblTipoDespacho.Open;
  dmDespacho.qryEmpleados.close;
  dmDespacho.qryEmpleados.open;

  dmDespacho.tblDespachoMaster.Close;
  dmDespacho.tblDespachoMaster.Params[0].Value:=ExtraerFecha(GlbFechaTrnDiaria);
  dmDespacho.tblDespachoMaster.Params[1].Value:=ExtraerFecha(GlbFechaTrnDiaria);
  dmDespacho.tblDespachoMaster.Open;
  //dmDespacho.tblDespachoDet.Close;
  //dmDespacho.tblDespachoDet.Open;
  //CheckBox1.Checked:=False;
  //RxLabel1.Visible :=False;
  //CheckBox1.Visible:=False;
  //Image1.Visible:=True;
  //if not EsCuadre then
  //if VerificaCierreDia(17,1,1,ExtraerFecha(Now),GlbFechaTrnDiaria) then
  //   If varTipousuario <> 2 then
  //   begin
  //     MessageDlg('El dia '+FormatDateTime('dd-mmm-yyyy',Glbfechatrndiaria)+' no se ha cerrado,'#13''+
  //                 'favor comuniquese con el supervisor',mtInformation, [mbOK], 0);
  //     Caption:='Procesar Ventas '+FormatDatetime('dd-mmm-yyyy',GlbFechaTrnDiaria)+' '+
  //     FormatDatetime('hh:mma/p',now)+' ATENCION: PARA PROCESAR TRANSACCIONES DEBE CERRAR EL DIA';
  //     panel1.Color:=clGray;
  //     dmDespacho.tblDespachoMaster.DisableControls;
  //     dmDespacho.tblDespachoDet.DisableControls;
  //   end else
  //Caption:='Procesar Ventas '+FormatDatetime('dd-mmm-yyyy',GlbFechaTrnDiaria)+' '+
  //FormatDatetime('hh:mma/p',now);
  if (GlbFechaVencProducto = 1) then
  begin
    Label28.Visible:=True;
    edtLotNum.Visible:=True;
  end else
  begin
    Label28.Visible  :=False;
    edtLotNum.Visible:=False;
  end;
  ActivaPVentaMargen;
  if GlbPrecioMayRegOrden = 0 then
  ConfigurarPrecio1.Enabled:=False;
end;
procedure TfrmRegPedidoProv.ActivaPVentaMargen;
begin
  if rdbtnPrecioVenta.Checked then
  begin
    DBEdit2.ReadOnly:=False;
    EditN2.ReadOnly :=True;
  end else
  begin
    DBEdit2.ReadOnly:=True;
    EditN2.ReadOnly :=False;
  end;
end;

procedure TfrmRegPedidoProv.ActualizaInventario(tipotrn: Smallint);
begin
  dmDespacho.tblDespachoDet.First;
  While Not dmDespacho.tblDespachoDet.Eof do
  begin
    if dmInventario.tblInventarioProd.Locate('CODIGO',dmDespacho.tblDespachoDetCODIGO_PROD.Value,[]) then
    begin
      dmInventario.tblInventarioProd.Edit;
      dmInventario.tblInventarioProdFECHA_ULTIMA_TRN.Value:=ExtraerFecha(Date);
      dmInventario.tblInventarioProd.Post;
      dmInventario.tblInventarioProd.ApplyUpdates;
    end;
    dmDespacho.IBStoredProc1.Params[0].Value:=dmDespacho.tblDespachoDetCODIGO_PROD.Value;
    dmDespacho.IBStoredProc1.Params[1].Value:=dmDespacho.tblDespachoDetCANTIDAD.Value;
    dmDespacho.IBStoredProc1.Params[2].Value:=tipotrn;
    dmDespacho.IBStoredProc1.Params[3].Value:=1;
    dmDespacho.IBStoredProc1.ExecProc;
    if not dmDespacho.IBStoredProc1.Transaction.InTransaction then
    dmDespacho.IBStoredProc1.Transaction.StartTransaction;
    try
      dmDespacho.IBStoredProc1.Transaction.CommitRetaining;
    except
    dmDespacho.IBStoredProc1.Transaction.RollbackRetaining;
    end;
    if not dmInventario.tblInventarioProd.Transaction.InTransaction then
    dmInventario.tblInventarioProd.Transaction.StartTransaction;
    try
      dmInventario.tblInventarioProd.Transaction.CommitRetaining;
    except
    dmInventario.tblInventarioProd.Transaction.RollbackRetaining;
    end;
    dmDespacho.tblDespachoDet.Next;
  end;
end;

procedure TfrmRegPedidoProv.ActualizaBalanceDespacho(Tipotrn: Smallint);
begin

end;

procedure TfrmRegPedidoProv.Imprimir;
begin
  qckFactura:=TqckFactura.Create(Nil);
  try
    qckFactura.Prepare;
    qckFactura.qrtipoVenta.Caption := strTipoVenta;
    qckFactura.TPag.Caption:=IntToStr(qckFactura.PageNumber);
    if MessageDlg('Imprimir factura?', mtInformation,[mbYes, mbNo],0) = mrYes then
    begin
      qckFactura.PrinterSetup;
      qckFactura.Print;
    end else
    qckFactura.Preview;
  finally
  qckFactura.Free;
  qckFactura:=Nil;
  end;
end;

procedure TfrmRegPedidoProv.ProcInsDespachoMaster;
var
  suma : Real;
begin
  rxData.AutoCalcFields := False;
  rxData.First;
  Suma:=0;
  While Not rxData.Eof Do
  begin
    Suma:=Suma + rxDataTotal_neto.Value;
    rxData.Next;
  end;
  //dmDespacho.tblDespachoMaster.Insert;

  //stpProcInsDespachoMaster.Params[0].Value := //Out - serie_Trans
  //stpProcInsDespachoMaster.Params[1].Value := //Out - numorden
  stpProcInsDespachoMaster.Params[2].Value := ExtraerFecha(rxDataFecha.Value);//fecha
  stpProcInsDespachoMaster.Params[3].Value := rxDataTipo_trn.Value;//tipo_trn
  stpProcInsDespachoMaster.Params[4].Value := VarUsuarioGlb;//codigo_despachador
  stpProcInsDespachoMaster.Params[5].Value := VarUsuarioGlb;//codigo_emp
  stpProcInsDespachoMaster.Params[6].Value := suma;//monto_total
  stpProcInsDespachoMaster.Params[7].Value := 'A';//status //0//num_orden
  stpProcInsDespachoMaster.Params[8].Value := GlbFechaTrnDiaria; //fecha_in
  nombreuser:=StrUserName;
  stpProcInsDespachoMaster.Params[9].Value :=  nombreuser;//in_por
  stpProcInsDespachoMaster.Params[10].Value := GlbFechaTrnDiaria;//fecha_mod
  stpProcInsDespachoMaster.Params[11].Value := Null;//mod_por
  stpProcInsDespachoMaster.Params[12].Value := 0;//codigo_ruta registro pedido
  stpProcInsDespachoMaster.Params[13].Value := rxDataNumConduce.Value;//num_conduce
  stpProcInsDespachoMaster.Params[14].Value := rxProveedorCodigo.Value;
  stpProcInsDespachoMaster.Params[15].Value := rxProveedorNCF.Value;
  stpProcInsDespachoMaster.Params[16].Value := rxProveedorRNCPROVEEDOR.Value;
  stpProcInsDespachoMaster.Params[17].Value := 1;//Master;
  stpProcInsDespachoMaster.ExecProc;
  if not stpProcInsDespachoMaster.Transaction.InTransaction then
  stpProcInsDespachoMaster.Transaction.StartTransaction;
  try
    stpProcInsDespachoMaster.Transaction.CommitRetaining;
  except
  stpProcInsDespachoMaster.Transaction.RollbackRetaining;
  end;

  if (rxProveedorFormaPago.Value = 7) OR (rxProveedorFormaPago.Value = 8) then
  ProcInsertarCXP(Suma);

  rxData.AutoCalcFields := True;
end;

procedure TfrmRegPedidoProv.ProcInsDespachoDetalle;
begin
  rxData.AutoCalcFields := false;
  rxData.First;
  While Not rxdata.Eof do
  begin
    //stpProcInsDespachoDet.Params[0].Value :=
    stpProcInsDespachoDet.Params[1].Value := stpProcInsDespachoMaster.Params[0].Value;
    stpProcInsDespachoDet.Params[2].Value := 1;//tipo_trn
    stpProcInsDespachoDet.Params[3].Value := rxDataCodigoProd.AsInteger;//cod_producto
    stpProcInsDespachoDet.Params[4].Value := rxDataCantidad.AsInteger;//cantidad
    stpProcInsDespachoDet.Params[5].Value := rxDataPrecio.Value;
    stpProcInsDespachoDet.Params[6].Value := rxDataporc_desc.Value;
    stpProcInsDespachoDet.Params[7].Value := rxDataitbi.Value;
    stpProcInsDespachoDet.Params[8].Value := rxDatavalor.Value;
    stpProcInsDespachoDet.Params[9].Value := rxDatatotal_neto.Value;
    stpProcInsDespachoDet.Params[10].Value := Null; //Num_orden
    stpProcInsDespachoDet.Params[11].Value := 'A';
    stpProcInsDespachoDet.Params[12].Value := Now;
    nombreuser:=StrUserName;
    stpProcInsDespachoDet.Params[13].Value := nombreuser;
    stpProcInsDespachoDet.Params[14].Value := Null;
    stpProcInsDespachoDet.Params[15].Value := Null;
    stpProcInsDespachoDet.Params[16].Value := rxDataDescProducto.Value;
    stpProcInsDespachoDet.Params[17].Value := Null;
    stpProcInsDespachoDet.Params[18].Value := rxDataCantUnidad.Value;
    stpProcInsDespachoDet.Params[19].Value := rxDataunidadId.Value;
    stpProcInsDespachoDet.ExecProc;

    ActualizaInvAlmacen;

    if Not stpProcInsDespachoDet.Transaction.InTransaction then
    stpProcInsDespachoDet.Transaction.StartTransaction;
    try
      stpProcInsDespachoDet.Transaction.CommitRetaining;
    except
    stpProcInsDespachoDet.Transaction.RollbackRetaining;
    end;

    stpProcActInv.Params[0].Value:= rxDataCodigoProd.Value;//Codigo_producto
    stpProcActInv.Params[1].Value:= rxDataCantidad.Value;  //Nuevacantidad
    stpProcActInv.Params[2].Value:= rxDataPrecioCompra.Value;//I_precio_compra
    stpProcActInv.Params[3].Value:= rxDataPrecioVenta.Value; //I_precio_venta
    stpProcActInv.Params[4].Value:= rxDataFechaVencimiento.Value; //Fecha Vencimiento
    stpProcActInv.ExecProc;

    if Not stpProcActInv.Transaction.InTransaction then
    stpProcActInv.Transaction.StartTransaction;
    try
      stpProcActInv.Transaction.CommitRetaining;
    except
    stpProcActInv.Transaction.RollbackRetaining;
    end;

    ProcInsCostoProdProveedor(rxDataCodigoProd.Value,rxDataNumConduce.Value,rxDataPrecioCompra.Value);
    if (edtLotNum.Text <> '') then
    begin
      ibstpInsertarLote.Params[0].Value:= rxDataCodigoProd.Value;
      ibstpInsertarLote.Params[1].Value:= edtLotNum.Text;
      ibstpInsertarLote.Params[2].Value:= rxProveedorCodigo.Value;
      ibstpInsertarLote.Params[3].Value:= Date;
      ibstpInsertarLote.Params[4].Value:= rxDataCantidad.AsInteger;
      ibstpInsertarLote.Params[5].Value:= 0;
      ibstpInsertarLote.Params[6].Value:= rxDataFechaVencimiento.Value;
      ibstpInsertarLote.ExecProc;
    end;
    rxData.Edit;
    rxDataStatus.Value:='R';
    rxData.Post;
    rxData.Next;
  end;

  if Not dmInventario.stpProcInsCostoProd.Transaction.InTransaction then
  dmInventario.stpProcInsCostoProd.Transaction.StartTransaction;
  try
    dmInventario.stpProcInsCostoProd.Transaction.CommitRetaining;
  except
  dmInventario.stpProcInsCostoProd.Transaction.RollbackRetaining;
  end;
  rxData.AutoCalcFields := True;
end;

procedure TfrmRegPedidoProv.rxDataAfterPost(DataSet: TDataSet);
var
  Monto, MontoNuevo : Real;
  recordActual: TBookmark;
begin
  rxdata.DisableControls;
  Monto := 0;
  recordActual:=rxdata.GetBookmark;
  rxdata.First;
  While Not rxdata.Eof do
  begin
    Monto := Monto + rxDataTotal_Neto.Value;
    MontoNuevo := MontoNuevo + rxDataNuevoMonto.Value;
    rxData.Next;
  end;
  Label11.Caption := Format('%m',[monto]);
  Label16.Caption := Format('%m',[MontoNuevo]);
  rxdata.GotoBookmark(recordActual);
  rxdata.FreeBookmark(recordActual);
  rxdata.EnableControls;
end;

procedure TfrmRegPedidoProv.RxDBGrid2GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if rxDataStatus.Value = 'R' then
  BackGround := $00CCFFFF;
end;

procedure TfrmRegPedidoProv.BitBtn5Click(Sender: TObject);
begin
  if (rxData.RecordCount > 0) then
  if MessageDlg('Eliminar record?',mtWarning, [mbYes, mbNo], 0) = mrYes then
  begin
    rxData.Delete;
  end;
end;

procedure TfrmRegPedidoProv.BitBtn6Click(Sender: TObject);
begin
  if (rxData.RecordCount > 0) then
  if MessageDlg('Cancelar registro pedido?',mtWarning, [mbYes, mbNo], 0) = mrYes then
  begin
    rxData.EmptyTable;
  end;
end;

procedure TfrmRegPedidoProv.Button1Click(Sender: TObject);
begin
  if (rxDataStatus.Value = 'A') then
  begin
    if MessageDlg('Orden pedido no ha sido procesada, aun desea limpiar?', mtWarning, [mbyes, mbNo], 0) = mrNo then
    Exit;
  end;
  BitBtn2.Enabled := False;
  EditN2.Text:='';
  EditN2.SetInteger(0);
  BitBtn2.Enabled:=True;
  rxData.EmptyTable;
end;

procedure TfrmRegPedidoProv.BitBtn2MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
   if BitBtn2.Enabled = false then
   BitBtn2.Hint:='Limpie datos para activar boton'
   else BitBtn2.Hint:='Procesar Venta';
end;

procedure TfrmRegPedidoProv.ReImprimirFactura1Click(Sender: TObject);
var
  sNum : Integer;
begin
  if rxProveedorCodigo.IsNull then
  begin
    MessageDlg('Favor indicar proveedor', mtInformation, [mbOK], 0);
    RxDBLookupCombo3.SetFocus;
    Exit;
  end;
  strTipoVenta:='Entrada';
  dmCompania.tblCompania.Close;
  dmCompania.tblCompania.Open;
  dmDespacho.tblDespachoMasterRep.Close;
  sNum:=0;
  if not stpProcInsDespachoMaster.Params[13].IsNull then
  sNum:= stpProcInsDespachoMaster.Params[13].Value;

  dmDespacho.tblDespachoMasterRep.Params[0].Value:=
  StrToInt(Inputbox('Re-imprimir factura','Entre número',InttoStr(sNum)));
  dmDespacho.tblDespachoMasterRep.Params[1].Value:=rxProveedorCodigo.Value;
  dmDespacho.tblDespachoMasterRep.Open;
  dmVentas.qryProveedor.Close;
  dmVentas.qryProveedor.Params[0].Value:= rxProveedorCodigo.Value;//dmDespacho.tblDespachoMasterRepCODIGO_PROV.Value;
  dmVentas.qryProveedor.Open;
  Imprimir;
end;

procedure TfrmRegPedidoProv.DBEdit2Change(Sender: TObject);
begin
  if GlbPrecioMayRegOrden = 1 then
  panelClasifPrecio.Visible:= True
  else panelClasifPrecio.Visible:= False;
end;
//http://www.utpl.edu.ec/eva/descargas/material/187/G17701.pdf
procedure TfrmRegPedidoProv.RadioButton1Click(Sender: TObject);
begin
  ActivaPVentaMargen;
end;

procedure TfrmRegPedidoProv.rdbtnPrecioVentaClick(Sender: TObject);
begin
  ActivaPVentaMargen;
end;

procedure TfrmRegPedidoProv.ActualizaInvAlmacen;
begin
  stpMantInvAlmacen.Params[0].Value := rxDataCodigoProd.AsInteger;//codigo inventario
  stpMantInvAlmacen.Params[1].Value := 1;//1-Almacen Principal, inventario_id
  stpMantInvAlmacen.Params[2].Value := rxDataCantidad.Value;
  stpMantInvAlmacen.Params[3].Value := VarUsuarioGlb;    //codigo_usuario
  stpMantInvAlmacen.Params[4].Value := ExtraerFecha(Now);//fecha_in
  stpMantInvAlmacen.Params[5].Value := strUserName;      //in_por
  stpMantInvAlmacen.Params[6].Value := ExtraerFecha(Now);//fecha_mod
  stpMantInvAlmacen.Params[7].Value := strUserName;      //in_por//mod_por
  stpMantInvAlmacen.Params[8].Value := 'A';              //status
  stpMantInvAlmacen.ExecProc;
  if Not stpMantInvAlmacen.Transaction.InTransaction then
  stpMantInvAlmacen.Transaction.StartTransaction;
  try
    stpMantInvAlmacen.Transaction.CommitRetaining;
  except
  stpMantInvAlmacen.Transaction.RollbackRetaining;
  end;
end;

procedure TfrmRegPedidoProv.tblTipoPrecioAfterScroll(DataSet: TDataSet);
begin
  qryClasifPrecio.Close;
  qryClasifPrecio.Params[0].Value := qryInventarioCODIGO.Value;
  qryClasifPrecio.Params[1].Value := tblTipoPrecioPRECIO_ID.Value;
  qryClasifPrecio.Open;
  qryClasifPrecio.RecordCount;
end;

procedure TfrmRegPedidoProv.BitBtn11Click(Sender: TObject);
begin
  if qryClasifPrecio.State = dsBrowse then
  begin
    if qryClasifPrecio.RecordCount = 0  then
    begin
      qryClasifPrecio.Insert;
      qryClasifPrecioCOD_PRODUCTO.Value:= qryInventarioCODIGO.Value;;
      qryClasifPrecioPRECIO_ID.Value   := tblTipoPrecioPRECIO_ID.Value;
      qryClasifPrecioIN_POR.Value      := StrUserName;
      qryClasifPrecioFECHA_IN.Value    := Now;
      DBGrid2.SetFocus;
    end else
    begin
      qryClasifPrecio.Edit;
      qryClasifPrecioMOD_POR.Value:= strUserName;
      qryClasifPrecioFECHA_MOD.Value:= ExtraerFecha(Date);
    end;
  end;
end;

procedure TfrmRegPedidoProv.BitBtn9Click(Sender: TObject);
begin
  if qryClasifPrecio.State In [dsEdit, dsInsert] then
  begin
    qryClasifPrecio.Post;
    qryClasifPrecio.ApplyUpdates;
    if Not qryClasifPrecio.Transaction.InTransaction then
    qryClasifPrecio.Transaction.StartTransaction;
    try
      qryClasifPrecio.Transaction.CommitRetaining;
    except
    qryClasifPrecio.Transaction.RollbackRetaining;
    end;
  end;
end;

procedure TfrmRegPedidoProv.BitBtn10Click(Sender: TObject);
begin
  //if GlbPrecioMayRegOrden = 1 then
  panelClasifPrecio.Visible:=False;
end;

procedure TfrmRegPedidoProv.ConfigurarPrecio1Click(Sender: TObject);
begin
  if GlbPrecioMayRegOrden = 1 then
  panelClasifPrecio.Visible := True
  else
  panelClasifPrecio.Visible := False;
end;

procedure TfrmRegPedidoProv.qryClasifPrecioCalcFields(DataSet: TDataSet);
begin
  qryClasifPrecioMargenG.Value :=
 ((qryClasifPrecioPRECIO_VENTA.Value - rxDataPrecioCompra.Value) /
   rxDataPrecioCompra.Value) * 100;
end;

procedure TfrmRegPedidoProv.RxDBLookupCombo4Change(Sender: TObject);
begin
  if rxData.State In [dsEdit, dsinsert] then
  if not rxDataunidadId.IsNull then
  rxDataCantidad.Value:= rxDataCantUnidad.Value *
  dminventario.tblUnidadesCANTIDAD.Value;
end;

procedure TfrmRegPedidoProv.DBEdit20Exit(Sender: TObject);
begin
  if rxData.State In [dsEdit, dsinsert] then
  if not rxDataunidadId.IsNull then
  rxDataCantidad.Value:= rxDataCantUnidad.Value *
  dminventario.tblUnidadesCANTIDAD.Value;
end;

end.
