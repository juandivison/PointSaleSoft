unit URegPedidoProv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UBuscarProductoInvDespacho, DB, RxMemDS, IBCustomDataSet,
  IBQuery, EditNew, RxLookup, Mask, DBCtrls, RXCtrls, RXDBCtrl, ExtCtrls,
  StdCtrls, Buttons, Grids, DBGrids, IBTable, IBStoredProc, IBSQL, rxToolEdit,
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
    edtLotNumnNotInUse: TEditN;
    ibstpInsertarLote: TIBStoredProc;
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
    RxDBLookupCombo5: TRxDBLookupCombo;
    rxDataTipoUnidad: TIntegerField;
    Label36: TLabel;
    DBEdit21: TDBEdit;
    Label37: TLabel;
    rxDataPrecioTUnidad: TCurrencyField;
    BitBtn29: TBitBtn;
    EditN3: TEditN;
    EditN4: TEditN;
    Label38: TLabel;
    Label39: TLabel;
    SkinData1: TSkinData;
    RxDBLookupCombo6: TRxDBLookupCombo;
    qryInvLookup: TIBQuery;
    dsqryInvLookup: TDataSource;
    qryInventarioPRECIOVENTA1: TFloatField;
    qryInventarioPRECIOVENTA2: TFloatField;
    qryInventarioPRECIOVENTA3: TFloatField;
    qryInventarioPRECIOVENTA4: TFloatField;
    qryInventarioPORCUTILIDAD1: TFloatField;
    qryInventarioPORCUTILIDAD2: TFloatField;
    qryInventarioPORCUTILIDAD3: TFloatField;
    qryInventarioPORCUTILIDAD4: TFloatField;
    rxDataRecalcularUtil: TSmallintField;
    DBCheckBox1: TDBCheckBox;
    qryInvLookupCODIGO: TIntegerField;
    qryInvLookupCODIGO_TEXTO: TIBStringField;
    qryInvLookupDESCRIPCION: TIBStringField;
    qryInvLookupPRECIO: TFloatField;
    qryInvLookupPAGA_ITBI: TSmallintField;
    qryInvLookupCANTIDAD: TFloatField;
    qryInvLookupREFERENCIA: TIBStringField;
    qryInvLookupDESC_TIPOINV: TIBStringField;
    qryInvLookupTIPO: TIntegerField;
    qryInvLookupPRECIO_COMPRA: TFloatField;
    qryInvLookupPORC_DESCUENTO: TFloatField;
    qryInvLookupFECHA_VENCIMIENTO: TDateTimeField;
    qryInvLookupPRECIOVENTA1: TFloatField;
    qryInvLookupPRECIOVENTA2: TFloatField;
    qryInvLookupPRECIOVENTA3: TFloatField;
    qryInvLookupPRECIOVENTA4: TFloatField;
    qryInvLookupPORCUTILIDAD1: TFloatField;
    qryInvLookupPORCUTILIDAD2: TFloatField;
    qryInvLookupPORCUTILIDAD3: TFloatField;
    qryInvLookupPORCUTILIDAD4: TFloatField;
    qryInventarioDESCRIPCION: TIBStringField;
    Modificar1: TMenuItem;
    edtlabelcantoferta: TLabel;
    rxDataCantOferta: TIntegerField;
    DBEdit1: TDBEdit;
    panelEscalaPrecio: TPanel;
    Shape3: TShape;
    Label40: TLabel;
    StaticText1: TStaticText;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    StaticText2: TStaticText;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    DBEdit28: TDBEdit;
    DBEdit29: TDBEdit;
    DBEdit30: TDBEdit;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    chkboxActPrecioXUnidad: TCheckBox;
    tblPrecioXUnidadLevel: TIBDataSet;
    tblPrecioXUnidadLevelIDUNIDAD: TIntegerField;
    tblPrecioXUnidadLevelDESCRIPCION: TIBStringField;
    tblPrecioXUnidadLevelCOD_PRODUCTO: TIntegerField;
    tblPrecioXUnidadLevelCANTIDAD: TFloatField;
    tblPrecioXUnidadLevelPRECIOVENTA1: TFloatField;
    tblPrecioXUnidadLevelPRECIOVENTA2: TFloatField;
    tblPrecioXUnidadLevelPRECIOVENTA3: TFloatField;
    tblPrecioXUnidadLevelPRECIOVENTA4: TFloatField;
    tblPrecioXUnidadLevelPORCUTILIDAD1: TFloatField;
    tblPrecioXUnidadLevelPORCUTILIDAD2: TFloatField;
    tblPrecioXUnidadLevelPORCUTILIDAD3: TFloatField;
    tblPrecioXUnidadLevelPORCUTILIDAD4: TFloatField;
    tblPrecioXUnidadLevelCOD_USUARIO_IN: TIntegerField;
    tblPrecioXUnidadLevelCOD_USUARIO_UPD: TIntegerField;
    tblPrecioXUnidadLevelFECHA_IN: TDateTimeField;
    tblPrecioXUnidadLevelIN_POR: TIBStringField;
    tblPrecioXUnidadLevelFECHA_MOD: TDateTimeField;
    tblPrecioXUnidadLevelMOD_POR: TIBStringField;
    BitBtn12: TBitBtn;
    qryInventarioCODIGO_BARRA: TIBStringField;
    rxDescAlmacen: TRxLabel;
    qryVerifica: TIBQuery;
    qryVerificaCANTIDAD: TFloatField;
    Consulta1: TMenuItem;
    qryVerificaLoteExiste: TIBQuery;
    qryVerificaLoteExisteCODIGO: TIntegerField;
    chkMostrarVtanaPrecios: TCheckBox;
    chboxImpLabelAuto: TCheckBox;
    rxDataNumLote: TStringField;
    Label45: TLabel;
    DBEdit31: TDBEdit;
    chkboxMostrarVtanPrecio: TCheckBox;
    Button2: TButton;
    qryInventarioTIPO_UNIDAD: TIntegerField;
    qryInventarioCODFABRICANTE: TIntegerField;
    Skin1: TMenuItem;
    Proveedores1: TMenuItem;
    SpeedButton1: TSpeedButton;
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
    procedure RxDBLookupCombo5Change(Sender: TObject);
    procedure DBEdit21Enter(Sender: TObject);
    procedure BitBtn29Click(Sender: TObject);
    procedure EditN3Change(Sender: TObject);
    procedure EditN4Change(Sender: TObject);
    procedure rxDataAfterScroll(DataSet: TDataSet);
    procedure DBEdit13Change(Sender: TObject);
    procedure DBEdit19Change(Sender: TObject);
    procedure qryInventarioAfterScroll(DataSet: TDataSet);
    procedure Modificar1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBEdit1Exit(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure edtNumConduceExit(Sender: TObject);
    procedure dbEditNumConduceExit(Sender: TObject);
    procedure Consulta1Click(Sender: TObject);
    procedure RxDBLookupCombo4Exit(Sender: TObject);
    procedure Skin1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Proveedores1Click(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
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
    procedure ProcSumatoria;
    function ProcVerificaDatos : boolean;

    //new code
    Procedure ProcInsDespachoMaster;
    Procedure ProcInsDespachoDetalle;
    procedure ActivaPVentaMargen;
    procedure ActualizaInvAlmacen;
    procedure ProcesaCalcular;
    Procedure CalcularPrecio(idx: smallint;porcValue: Extended;codProducto:Integer);

    Procedure CalcularPrecioSurt(idx: smallint;porcValue: Extended; codProducto: Integer; cantUni:integer);

  public
    { Public declarations }
     procedure ProcInsCostoProdProveedor(codProd:integer;numeroconduce:integer;precio:Real);
  end;

var
  frmRegPedidoProv: TfrmRegPedidoProv;
  xPrecio : Real;
  strTipoVenta : String;
  nombreuser : String[12];
  _MostrarVtanaPrecios : boolean;
implementation
 uses UDatModDespacho, UGlobal, UDatosVentas, UDatModInventario,
  UDatModCuadrexRuta, UDatModConectar, URegFpago, UDatModCxp,
  ULabelImpCodBarra, UInventarioProd, UQckReporteFactura, UDatModEmpleados,
  UDatModCompania, UPrecioProdXUnidad, UFormRegPedidoOrden,
  UFormPrecioXUnidadNivel, UFormConsultaRegPedido, UDatModRegOpeDiaria,
  UBuscarProveedores, UFormProveedores;

{$R *.dfm}

procedure TfrmRegPedidoProv.RxDBGrid1CellClick(Column: TColumn);
begin
  if rxData.State in [dsEdit, dsInsert] then rxData.Post;
  if (rxDataStatus.value = 'R') then
  begin
    MessageDlg('Favor limpiar datos para proceder con otro registro.',mtInformation, [mbOK], 0);
    Exit;
  end;
  ProcRegProd;
end;

procedure TfrmRegPedidoProv.BitBtn4Click(Sender: TObject);
begin
  if GlbFechaVencProducto = 1 then
  begin
    if (rxDataFechaVencimiento.IsNull or rxDataNumLote.IsNull) and
    (rxDataPrecioVenta.Value > 0) and (rxProveedorCodigo.Value > 0) and 
    (rxDataCantidad.Value > 0) and (rxDataPrecioCompra.Value > 0) then
    begin
      //MessageDlg('Indique numero de lote y fecha vencimiento.', mtInformation, [mbOK], 0);
      //exit;
    end;
  end;

  if rxData.State in [dsEdit, dsInsert] then
  begin
    edtBuscarProducto.Text:='';

    {if rxDataNumLote.IsNull and (rxDataPrecioVenta.Value > 0) and (rxDataPrecioCompra) then
    begin
      DBEdit31.SetFocus;
      Exit;
    end;}

    ProcesaCalcular;

    Edit1.Text:='';
    if (rxDataPrecioCompra.IsNull or (rxDataPrecioCompra.Value = 0)) then
    begin
      if rxDataCantUnidad.IsNull then
      DBEdit20.SetFocus
      else
      DBEdit13.SetFocus;// else Edit1.SetFocus;
      DBEdit13.Refresh;
      refresh;
    end;
    rxData.Post;
    ProcSumatoria;
  end;

  {if rxDataPrecioCompra.IsNull then
  DBEdit2.SetFocus else
  if rxDataPrecioVenta.IsNull then
  DBEdit2.SetFocus; }
end;

procedure TfrmRegPedidoProv.BitBtn1Click(Sender: TObject);
var
  lenC : integer;
begin
  if (Edit1.Text = '') and (edtBuscarProducto.Text = '') Then Exit;
  lenC := Length(Edit1.Text);
  if (Edit1.Text <> '') then
  begin
    if lenC <= 5 then
    begin
      if IsNumerico(Edit1.Text) then
      begin
        if qryInventario.Locate('CODIGO',StrToInt(Edit1.Text),[]) then
        ProcRegProd;
      end
      else
      if qryInventario.Locate('CODIGO_TEXTO',Edit1.Text,[]) Then
      ProcRegProd
      else MessageDlg('Codigo producto no encontrado, verifique', mtInformation, [mbOK], 0);
    end else
    begin
      if IsNumerico(Edit1.Text) then
      begin
        if qryInventario.Locate('CODIGO_Barra',Edit1.Text,[]) then
        ProcRegProd
        else
        if qryInventario.Locate('CODIGO',Edit1.Text,[]) then
        ProcRegProd;
      end
      else
      if qryInventario.Locate('CODIGO_Barra',Edit1.Text,[]) then
      ProcRegProd
      else
      if qryInventario.Locate('CODIGO_TEXTO',Edit1.Text,[]) Then
      ProcRegProd
      else MessageDlg('Codigo producto no encontrado, verifique', mtInformation, [mbOK], 0);
    end;
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
  if (rxDataStatus.Value = 'R') then
  begin
    if MessageDlg('Transacción fue procesada, desea inicializar?', mtInformation, [mbyes, mbno], 0)= mryes then
    begin
      rxData.EmptyTable;
      BitBtn2.Enabled:=True;
      Exit;
    end else Exit;
  end;

  {
  if (GlbFechaVencProducto = 1) then
  begin
    if (edtLotNum.Text = '') then
    begin
      MessageDlg('Favor indicar número de lote', mtInformation, [mbOK], 0);
      edtLotNum.SetFocus;
      exit;
    end;
  end; }
  if (rxProveedorcodigo.IsNull) And (rxdata.RecordCount > 0)   then
  begin
    MessageDlg('Favor indicar proveedor', mtInformation, [mbOK], 0);
    RxDBLookupCombo3.SetFocus;
    Exit;
  end;
  {temporal
  if (edtLotNum.Text <> '') then
  begin
    qryVerificaLoteExiste.close;
    qryVerificaLoteExiste.params[0].Value:= rxDataCodigoProd.Value;
    qryVerificaLoteExiste.params[1].Value:= trim(edtLotNum.Text);
    qryVerificaLoteExiste.params[2].Value:= ExtraerFecha(rxDataFechaVencimiento.Value);
    qryVerificaLoteExiste.open;
    qryVerificaLoteExiste.First;
    if not qryVerificaLoteExiste.fieldByName('codigo').IsNull then
    begin
      MessageDlg('Numero de Lote ya existe, verifique.', mtInformation, [mbOK], 0);
      Exit;
    end;
  end;
  }//temporal
  if edtNumConduce.ValueInteger = 0 then
  begin
    MessageDlg('Entre número de factura',mtInformation, [mbOK], 0);
    edtNumConduce.SetFocus;
    exit;
  end;

  if not ProcVerificaDatos then
  begin
    MessageDlg('Existen records sin numero lote o fecha vencimiento, verifique',mtError, [mbOK], 0);
    exit;
  end;

  if rxDataPrecioVenta.Value = 0 then
  begin
    MessageDlg('Favor indicar precio de venta',mtError, [mbOK], 0);
    if showing then
    DBEdit2.SetFocus;
    exit;
  end;

  if rxDataPrecioCompra.Value = 0 then
  begin
    MessageDlg('Favor indicar precio de compra',mtError, [mbOK], 0);
    if showing then
    DBEdit2.SetFocus;
    exit;
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

  rxdata.First;
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
  dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);
  dmDespacho.tblDespachoMasterRep.Close;
  dmDespacho.tblDespachoMasterRep.Params[0].Value:= stpProcInsDespachoMaster.Params[13].Value;//dmDespacho.tblDespachoMasterNUMERO.Value;
  dmDespacho.tblDespachoMasterRep.Params[1].Value:= rxProveedorCodigo.Value;
  dmDespacho.tblDespachoMasterRep.Open;
  if not dmDespacho.tblDespachoMasterRep.Locate('NUM_ORDEN',stpProcInsDespachoMaster.Params[1].Value,[]) then
  begin
    MessageDlg('Error en numero de orden. Verifique.',mtInformation, [mbOK], 0);
  end;
  dmVentas.qryProveedor.Close;
  dmVentas.qryProveedor.Params[0].Value:= rxProveedorCodigo.Value;
  dmVentas.qryProveedor.Open;
  Imprimir;
  //edtLotNum.Text:='';
  //edtLotNum.Clear;
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
    frmCodigoBarra.EditN1.Text;

    if (chboxImpLabelAuto.Checked) then
    begin
      if rxDataCantUnidad.AsInteger > 0 then
      frmCodigoBarra.EditN1.SetInteger(rxDataCantUnidad.AsInteger);
      if chboxImpLabelAuto.Checked then
      begin
        if MessageDlg('Imprimir '+rxDataCantUnidad.AsString+' label(s)?',mtInformation,[mbyes,mbno],0) = mryes then
        try
          rxData.first;
          frmCodigoBarra.sTest:=False;
          if frmCodigoBarra.qryInv.State = dsInactive then
          frmCodigoBarra.qryInv.Open;
          frmCodigoBarra.RadioGroup1.ItemIndex:=1;
          while not rxData.Eof do
          begin
             frmCodigoBarra.qryInv.Locate('CODIGO',rxDataCodigoProd.Value,[]);

             frmCodigoBarra._NumFactura:= edtNumConduce.Text;
             frmCodigoBarra._CodProveedor:= rxProveedorCodigo.AsString;
             frmCodigoBarra.EditN1.SetInteger(rxDataCantUnidad.AsInteger);
             if (rxDataCantUnidad.Value > 0) then
             frmCodigoBarra.Button1Click(Self);
             rxData.Next;
          end;
        except
        end;
      end;
    end else
    begin
      frmCodigoBarra.sTest:=False;
      frmCodigoBarra.ShowModal;
    end;
  finally
  frmCodigoBarra.Free;
  frmCodigoBarra:= Nil;
  end;
  rxData.first;
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
  dmInventario.tblInventarioProd.SelectSQL.Text := dmInventario.qryInvProd_Base.Sql.Text;
  dmInventario.tblInventarioProd.Params[0].Value:=glbCia_Key;
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
    if rxData.state in [dsEdit, dsInsert] then                //margen beneficio
    begin
      rxDataPrecioVenta.Value:= rxDataPrecioCompra.Value * (1 + EditN2.ValueFloat/100);
      rxData.AutoCalcFields:=True;
    end;
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
																					  
   pVMargen := 0;
   if rxDataPrecioCompra.Value > 0 then
   pVMargen := ((rxDataPrecioVenta.Value - rxDataPrecioCompra.Value) /
                rxDataPrecioCompra.Value) * 100;
   pVMargen := StrToFloat(Format('%8.2f',[pVMargen]));
   EditN2.SetFloat(pVMargen);
  end;

  //----------------------**********--------------------------

  if rxData.State In [dsedit, dsInsert] then
  begin
   // Edit1.SetFocus;
    rxDataprecio.Value := rxDataPrecioCompra.Value;
    BitBtn4Click(Self);
  end;
  if (rxData.State in [dsEdit,dsInsert]) then
  if edtNumConduce.ValueInteger <= 0 then
  begin
    edtNumConduce.SetFocus;
    exit;
  end;  
end;

procedure TfrmRegPedidoProv.Edit1Exit(Sender: TObject);
begin
  if (Edit1.Text = '') then exit;
  if (rxDataStatus.value = 'R') then
  begin
    MessageDlg('Favor limpiar datos para proceder con otro registro.',mtInformation, [mbOK], 0);
    Exit;
  end;
  
  BitBtn1Click(Self);
  //if (edtNumConduce.Text = '') then Exit;
  RxDBLookupCombo3.SetFocus;
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
  if rxProveedor.State In [dsEdit, dsInsert] then
  rxProveedorRNCPROVEEDOR.Value:= dmInventario.qryProveedoresRNC_PROVEEDOR.Value;

  if rxProveedor.State in [dsEdit, dsInsert] then
  rxProveedor.Post;
end;

procedure TfrmRegPedidoProv.rxDataCalcFields(DataSet: TDataSet);
begin
  if rxDataPrecio.IsNull or rxDataCodigoProd.IsNull or
     rxDataCantidad.IsNull then exit;

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
    rxDataP_I_Margen.Value:=
    rxDataPrecioVenta.Value  * (1 +FGlbPorcItbi(ExtraerFecha(rxDataFecha.Value), rxDataCodigoProd.Value)/100);
  end;
end;

function TfrmRegPedidoProv.FuncGetFormaPago(var x: integer): Boolean;
begin
  Result:=False;
  frmFormaPago:=TfrmFormaPago.Create(nil);
  try
    frmFormaPago.setEfectivo := 1;
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
    if rxDataPrecioCompra.IsNull or rxDataCantidad.IsNull then exit;
    rxDataprecio.Value := rxDataPrecioCompra.Value;
    if rxDataCantUnidad.Value > 0 then
        rxDatavalor.Value:=(rxDataPrecio.Value / rxDataCantidad.Value) * rxDataCantidad.Value
    else
    rxDatavalor.Value:=rxDataPrecio.Value * rxDataCantidad.Value;
    if qryInventarioPAGA_ITBI.Value = 1 then
    rxDataitbi.Value:= (rxDatavalor.Value -
                       (rxDatavalor.Value * rxDataporc_desc.Value/100)) *
    FGlbPorcItbi(ExtraerFecha(rxDataFecha.Value),rxDataCodigoProd.Value) / 100;
    rxDatatotal_neto.Value:= (rxDatavalor.Value -
                       (rxDatavalor.Value * rxDataporc_desc.Value/100))
                                          + rxDataitbi.Value;
    rxDataCodEmp.Value:=dmDespacho.qryEmpleadosCODIGO.Value;
    rxDataNuevoBalance.Value:= rxDataCantidad.Value + rxDataBalanceAct.Value + rxDataCantOferta.Value;
    rxData.AutoCalcFields:=True;
    ProcesaCalcular;
    EditN2Change(Self);
    BitBtn4Click(Self);
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
  dmCxp.tblTransCxpTIPO_DOC.Value := 2; //Factura
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
  if (rxDataNumConduce.Value > 0) then
  dmcxp.stpInsFactPendiente.Params[3].Value := rxDataNumConduce.Value
  else
  dmcxp.stpInsFactPendiente.Params[3].Value := edtNumConduce.ValueInteger;

  dmcxp.stpInsFactPendiente.Params[4].Value := Monto;
  dmcxp.stpInsFactPendiente.Params[5].Value := dmcxp.tblTransCxpFECHA.Value;
  if Not rxProveedorNCF.IsNull then
  dmcxp.stpInsFactPendiente.Params[6].Value := MyStrCopyRango(rxProveedorNCF.Value,10,11)
  else dmcxp.stpInsFactPendiente.Params[6].Value := null;
  dmcxp.stpInsFactPendiente.Params[7].Value := ExtraerFecha(GlbFechaTrnDiaria)+30;

  dmcxp.stpInsFactPendiente.Params[8].Value := edtNumConduce.Text; //num_fact_prov
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
  xPrecio:=0;
  if rxProveedor.State = dsInactive then rxProveedor.Open;
  //if dmInventario.qryPrecioInventario.Locate('codigo_texto',qryInventarioCODIGO_Texto.AsString,[]) then
  //begin
  rxData.AutoCalcFields:=False;

    //rxDataCodigoProd.value:= qryInventarioCODIGO.Value;
    //rxDataTipoUnidad.Value:=qryInventarioTIPO_UNIDAD.Value;
    if rxProveedor.RecordCount = 0 then
    begin
      rxProveedor.Append;
      rxProveedorCodigo.Value:=qryInventarioCODFABRICANTE.Value;
      rxProveedor.Post;
    end else
    begin
      rxProveedor.Edit;
      if rxProveedorCodigo.IsNull then
      rxProveedorCodigo.Value:=qryInventarioCODFABRICANTE.Value;
      rxProveedor.Post
    end;

    if (rxData.RecordCount = 0) Or (rxData.State = dsBrowse) then
    rxData.Insert;

    if not qryInventarioPORCUTILIDAD1.IsNull then
    EditN2.SetFloat(qryInventarioPORCUTILIDAD1.Value);
  //end
  //else xPrecio:=0;

  if rxData.RecordCount = 0 then
  begin
    if rxData.State = dsBrowse then
    rxData.Insert;
    if (GlbUsaPUnidadLevel = 1) then
    rxDataRecalcularUtil.Value:=1
    else
    rxDataRecalcularUtil.Value:=0;
    rxDataStatus.Value:= 'A';
    if qryInventarioCANTIDAD.IsNull then
    rxDataCantAct.Value:=0
    else
    rxDataCantAct.Value:=qryInventarioCANTIDAD.AsInteger;

    if (qryInventarioPORCUTILIDAD1.Value > 0 ) then
    begin
      EditN2.SetFloat(qryInventarioPORCUTILIDAD1.Value);
      RadioButton1.Checked:=True;
    end;
    rxDataCodigoProd.value:= qryInventarioCODIGO.Value;
    rxDataDescProducto.Value:=qryInventarioDESCRIPCION.Value;
    rxDataTipo_trn.Value := 1;//Entrada
    rxDataNumConduce.Value:=edtNumconduce.ValueInteger;
    rxDataFecha.Value    := ExtraerFecha(GlbFechaTrnDiaria);
    if rxDatafecha.Value = 0 then rxData.Cancel;
    if FormatDateTime('yyyy',rxDataFecha.Value) = '1899' then rxData.Cancel;
    rxDatacodigo.Value    := qryInventarioCODIGO.AsString;
    if not qryInventarioCANTIDAD.IsNull then
    rxDataBalanceAct.Value:=qryInventarioCANTIDAD.value
    else
    rxDataBalanceAct.Value:=0;
    rxDataPrecioTUnidad.Value:=rxDataPrecioVenta.Value;
    rxDataporc_desc.Value :=qryInventarioPORC_DESCUENTO.Value;
    rxDataTipoUnidad.Value:=1;
    rxDataunidadId.Value:=1;
    RxDBLookupCombo4.SetFocus;
  end else
  begin
    CodEmp :=rxDataCodEmp.Value;
    CodRuta:=rxDataCodigoRuta.Value;
    if (rxDataCodigoProd.value= qryInventarioCODIGO.Value) then Exit;

    if rxData.State = dsBrowse then
    rxData.Insert;
    rxDataStatus.Value    := 'A';
    rxDataporc_desc.Value := qryInventarioPORC_DESCUENTO.Value;

    if qryInventarioCANTIDAD.IsNull then
    rxDataCantAct.Value:=0
    else
    rxDataCantAct.Value:=qryInventarioCANTIDAD.AsInteger;

    //rxDataCantAct.Value   := qryInventarioCANTIDAD.AsInteger;
    if (qryInventarioPORCUTILIDAD1.Value > 0 ) then
    begin
      EditN2.SetFloat(qryInventarioPORCUTILIDAD1.Value);
      RadioButton1.Checked:=True;
    end;
    rxDataDescProducto.Value := qryInventarioDESCRIPCION.Value;
    rxDataCodigoProd.value   := qryInventarioCODIGO.Value;
    rxDataNumConduce.Value   := edtNumconduce.ValueInteger;
    rxDataTipo_trn.Value     := 1;//Entrada
    rxDataCodEmp.Value       := CodEmp;
    rxDataCodigoRuta.Value   := CodRuta;
    rxDataFecha.Value        := ExtraerFecha(GlbFechaTrnDiaria);
    rxDatacodigo.Value       := qryInventarioCODIGO.AsString;

    rxDataTipoUnidad.Value   := 1;

    if qryInventarioCANTIDAD.IsNull then
    rxDataCantAct.Value:=0
    else
    rxDataCantAct.Value:=qryInventarioCANTIDAD.AsInteger;
    //rxDataBalanceAct.Value   := qryInventarioCANTIDAD.value;
    RxDBLookupCombo4.SetFocus;
  end;
  if rxData.State in [dsEdit, dsinsert] then
  BitBtn4click(Self);
  rxData.AutoCalcFields:=True;
end;

procedure TfrmRegPedidoProv.FormCreate(Sender: TObject);
begin
  Skin1Click(Self);
  rxDescAlmacen.Caption:=GlbAlmacen;
  if (glbUsaescalaPrecio = 1) then
  panelEscalaPrecio.Visible:=True
  else
  panelEscalaPrecio.Visible:=False;
  
  dmInventario.qryTipoUnidad.Close;
  dmInventario.qryTipoUnidad.Open;

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
  //dmInventario.qryProveedores.Params[0].Value:=glbCia_Key;
  //dmInventario.qryProveedores.Filtered:=False;
  dmInventario.qryProveedores.Tag:=glbCia_Key;
  //dmInventario.qryProveedores.Filtered:=True;
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
  dmInventario.tblInventarioProd.SelectSQL.Text := dmInventario.qryInvProd_Base.Sql.Text;
  dmInventario.tblInventarioProd.Params[0].Value:=glbCia_Key;
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
    //edtLotNum.Visible:=True;
  end else
  begin
    Label28.Visible  :=False;
    //edtLotNum.Visible:=False;
  end;
  ActivaPVentaMargen;
  if GlbPrecioMayRegOrden = 0 then
  ConfigurarPrecio1.Enabled:=False;
  qryInvLookup.Close;
  qryInvLookup.Open;
  if (GlbUsaPUnidadLevel = 1) then
  chkMostrarVtanaPrecios.Visible:=true
  else
  chkMostrarVtanaPrecios.Visible:=false;
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
  stpProcInsDespachoMaster.Params[18].Value := Null;//serie_inv_id
  stpProcInsDespachoMaster.Params[19].Value := Null;//inv_id_origen
  stpProcInsDespachoMaster.Params[20].Value := Null;//inv_id_destino
  stpProcInsDespachoMaster.Params[21].Value := rxProveedorFormaPago.Value;
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
var
  idx : integer;
   fname : string;
begin
  dmInventario.tblInventarioProd.Close;
  dmInventario.tblInventarioProd.Open;            //13994
  _MostrarVtanaPrecios:=False;
  rxData.AutoCalcFields := false;
  rxData.First;
  While Not rxdata.Eof do
  begin
    if GlbEsDebugEntradas = 1 then
    begin
      WriteToLog('*** INI *** LOTE NUMERO: '+rxDataNumLote.Value);
      WriteToLog('Codigo Producto: '+rxDataCodigoProd.AsString);
      qryVerifica.Close;
      qryVerifica.Params[0].Value:= rxDataCodigoProd.AsInteger;
      qryVerifica.Open;
      WriteToLog('Balance Anterior: '+qryVerificaCANTIDAD.AsString);
    end;
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
    stpProcInsDespachoDet.Params[20].Value := rxDataCantOferta.Value;// edtCantOferta.ValueInteger;
    stpProcInsDespachoDet.Params[21].Value := rxDataNumLote.Value;
    stpProcInsDespachoDet.ExecProc;

    try
      ActualizaInvAlmacen;
    except on E : Exception do
    WriteToLog (E.ClassName+' frmRegPedidoProv.ActualizaInvAlmacen: '+E.Message);
    end;

    if Not stpProcInsDespachoDet.Transaction.InTransaction then
    stpProcInsDespachoDet.Transaction.StartTransaction;
    try
      stpProcInsDespachoDet.Transaction.CommitRetaining;
    except
    MessageDlg('Error actualizando almacen principal',mterror,[mbok],0);
    stpProcInsDespachoDet.Transaction.RollbackRetaining;
    end;

    stpProcActInv.Params[0].Value:= rxDataCodigoProd.Value;//Codigo_producto
    stpProcActInv.Params[1].Value:= rxDataCantidad.Value + rxDataCantOferta.Value;//edtCantOferta.ValueInteger;  //Nuevacantidad
    if rxDataCantidad.Value > 0 then
    stpProcActInv.Params[2].Value:= rxDataPrecioCompra.Value;// rxDataCantidad.Value;//I_precio_compra

    if (GlbIncItbisPvta = 1) then
    begin
      stpProcActInv.Params[3].Value:= rxDataP_I_Margen.Value; //P+I+Mgn
      if rxDataPrecioVenta.Value > 0 then
      stpProcActInv.Params[8].Value:= rxDataPrecioVenta.Value // / rxDataPrecioVenta.Value)
      else
      stpProcActInv.Params[8].Value:= rxDataPrecioVenta.Value;
    end else
    begin
      stpProcActInv.Params[3].Value:= rxDataPrecioVenta.Value; //I_precio_venta
      //stpProcActInv.Params[8].Value:= rxDataPrecioVenta.Value;//t - (rxDataPrecioVenta.Value * 1.18/100);
      //stpProcActInv.Params[3].Value:= rxDataP_I_Margen.Value; //P+I+Mgn
      if rxDataPrecioVenta.Value > 0 then
      stpProcActInv.Params[8].Value:= rxDataPrecioVenta.Value// / rxDataPrecioVenta.Value)
      else
      stpProcActInv.Params[8].Value:= (rxDataPrecioVenta.Value);
    end;
    if rxDataFechaVencimiento.IsNull then
    stpProcActInv.Params[4].Value:= null
    else
    stpProcActInv.Params[4].Value:= rxDataFechaVencimiento.Value; //
    stpProcActInv.Params[5].Value:= rxDataPrecioTUnidad.Value; //PrecioTipoUnidad|
    stpProcActInv.Params[6].Value:= rxDataTipoUnidad.Value; //Tipo Unidad

    if (rxDataRecalcularUtil.Value = 1) then
    stpProcActInv.Params[7].Value:= 1
    else
    stpProcActInv.Params[7].Value:= 0;
    stpProcActInv.ExecProc;

    if Not stpProcActInv.Transaction.InTransaction then
    stpProcActInv.Transaction.StartTransaction;
    try
      stpProcActInv.Transaction.CommitRetaining;
    except
    MessageDlg('Error actualizando almacen principal',mterror,[mbok],0);
    stpProcActInv.Transaction.RollbackRetaining;
    end;

    if (GlbEsDebugEntradas = 1) then
    begin
      dmInventario.tblInventarioProd.Close;
      dmInventario.tblInventarioProd.Open;
      qryVerifica.Close;
      qryVerifica.Params[0].Value:= rxDataCodigoProd.AsInteger;
      qryVerifica.Open;
      WriteToLog('Cant en Pedido: '+rxDataCantidad.AsString);
      WriteToLog('Nuevo Balance: '+qryVerificaCANTIDAD.AsString);

      if not dmInventario.tblInventarioProd.Locate('codigo', rxDataCodigoProd.Value,[]) then
        MessageDlg('Codigo no encontrado: '+rxDataCodigoProd.AsString,mtError,[mbok],0);

      if (dmInventario.tblInventarioProdCANTIDAD.Value < rxDataNuevoBalance.Value) then
      begin
        MessageDlg('Inventario no fue actualizado, verifique',mtError,[mbok],0);
      end;//dmInventario.tblInventarioProdprecio.value

      WriteToLog('Nuevo Balance: '+dmInventario.tblInventarioProdCANTIDAD.AsString);
      WriteToLog('Codigo Producto: '+rxDataCodigoProd.AsString);
      WriteToLog('*** FIN *** LOTE NUMERO: '+rxDataNumLote.Value);
    end;
    ProcInsCostoProdProveedor(rxDataCodigoProd.Value,rxDataNumConduce.Value,rxDataPrecioCompra.Value);
    if (not rxDataNumLote.IsNull) then
    begin
      ibstpInsertarLote.Params[0].Value:= rxDataCodigoProd.Value;
      ibstpInsertarLote.Params[1].Value:= rxDataNumLote.Value;//edtLotNum.Text;
      ibstpInsertarLote.Params[2].Value:= rxProveedorCodigo.Value;
      ibstpInsertarLote.Params[3].Value:= Date;
      ibstpInsertarLote.Params[4].Value:= rxDataCantidad.AsInteger;
      ibstpInsertarLote.Params[5].Value:= 0;
      ibstpInsertarLote.Params[6].Value:= rxDataFechaVencimiento.Value;
      ibstpInsertarLote.Params[7].Value:= stpProcInsDespachoDet.Params[0].Value;
      ibstpInsertarLote.ExecProc;
    end;
    if (GlbUsaPUnidadLevel = 1) then
    begin
      tblPrecioXUnidadLevel.Close;
      tblPrecioXUnidadLevel.Params[0].Value:=rxDataCodigoProd.Value;
      tblPrecioXUnidadLevel.Open;
      tblPrecioXUnidadLevel.First;

      if (tblPrecioXUnidadLevel.RecordCount = 0) then
      begin
        frmPrecioUnidadNivel:=TfrmPrecioUnidadNivel.Create(Nil);
        try
          dmInventario.tblInventarioProd.Locate('codigo',rxDataCodigoProd.Value,[]);
          frmPrecioUnidadNivel.xProd := rxDataCodigoProd.Value;
          frmPrecioUnidadNivel.buscarCodigo(rxDataCodigoProd.Value);
          frmPrecioUnidadNivel.BitBtn1Click(Self);
          if chkboxMostrarVtanPrecio.Checked then
          begin
            if (rxDataCodigoProd.Value <> dmInventario.tblInventarioProdCODIGO.Value) then
            begin
              dmInventario.tblInventarioProd.DisableControls;
              dmInventario.tblInventarioProd.Locate('CODIGO',rxDataCodigoProd.Value,[]);
              dmInventario.tblInventarioProd.EnableControls;
            end;
            frmPrecioUnidadNivel.Showmodal;
          end;
        finally
        frmPrecioUnidadNivel.Free;
        frmPrecioUnidadNivel:=Nil;
        end;
      end;

      tblPrecioXUnidadLevel.First;
      dmInventario.tblInventarioProd.close;
      dmInventario.tblInventarioProd.Open;
      dmInventario.tblInventarioProd.Locate('codigo', rxDataCodigoProd.Value,[]);
      While Not tblPrecioXUnidadLevel.Eof do
      begin
        For idx:=1 To 4 Do
        begin
          tblPrecioXUnidadLevel.Edit;
          if dmInventario.tblInventarioProd.State = dsBrowse then
          dmInventario.tblInventarioProd.Edit;
          if (rxDatastatus.Value = 'A') then //Te Amo JesusCrist
          begin
            fname :='PORCUTILIDAD'+IntToStr(idx);
            dmInventario.tblInventarioProdPRECIO_COMPRA.Value := rxDataPrecioCompra.Value;
            if not tblPrecioXUnidadLevel.Fieldbyname(fname).IsNull then
            begin
              //Actualizar solo el precio 1
              tblPrecioXUnidadLevel.Edit;
              if (idx = 1) then
              CalcularPrecioSurt(idx,EditN2.ValueFloat,
              dmInventario.tblInventarioProdCODIGO.Value,tblPrecioXUnidadLevelCANTIDAD.AsInteger)
              else
              CalcularPrecioSurt(idx,tblPrecioXUnidadLevel.Fieldbyname(fname).AsVariant,
              dmInventario.tblInventarioProdCODIGO.Value,tblPrecioXUnidadLevelCANTIDAD.AsInteger);
              if tblPrecioXUnidadLevel.State in [dsEdit, dsInsert] then
              tblPrecioXUnidadLevel.Post;
            end;
            if dmInventario.tblInventarioProd.State = dsEdit then
            begin
              if (idx = 1) then
              begin
                dmInventario.tblInventarioProdPRECIO.Value:=tblPrecioXUnidadLevelPRECIOVENTA1.Value;
                dmInventario.tblInventarioProdPRECIO_MINIMO.Value:=tblPrecioXUnidadLevelPRECIOVENTA1.Value;
              end;
              dmInventario.tblInventarioProd.Post;
              dmInventario.tblInventarioProd.ApplyUpdates;
            end;
          end;        
        end;
        GlbSalvarQuery(tblPrecioXUnidadLevel);
        GlbSalvarQuery(dmInventario.tblInventarioProd);
        tblPrecioXUnidadLevel.Next;
       end;
    end else
    if (glbUsaescalaPrecio = 1) then
    begin
      dmInventario.tblInventarioProd.close;
      dmInventario.tblInventarioProd.Open;
      dmInventario.tblInventarioProd.Locate('codigo', rxDataCodigoProd.Value,[]);
      if dmInventario.tblInventarioProd.state = dsInactive then
      dmInventario.tblInventarioProd.Open;
      if not dmInventario.tblInventarioProd.Locate('codigo', rxDataCodigoProd.Value,[]) then
      begin
        MessageDlg('Hay un error localizando el producto en inventario.',mterror,[mbok],0);
      end else
      begin
      dmInventario.tblInventarioProd.Edit;
      dmInventario.tblInventarioProdPRECIO_MINIMO.Value:= rxDataPrecioVenta.Value;
      dmInventario.tblInventarioProdPRECIO_ANT.Value:=dmInventario.tblInventarioProdPRECIO.Value;
      dmInventario.tblInventarioProdPRECIO.Value        := rxDataPrecioVenta.Value;
      dmInventario.tblInventarioProdPRECIO_COMPRA.Value := rxDataPrecioCompra.Value;
      if dmInventario.tblInventarioProdBLCE_CANT_ENTRADA.IsNull then
      dmInventario.tblInventarioProdBLCE_CANT_ENTRADA.Value:=0;

      dmInventario.tblInventarioProdBLCE_CANT_ENTRADA.Value:=
      dmInventario.tblInventarioProdBLCE_CANT_ENTRADA.Value +
      dmInventario.tblInventarioProdCANTIDAD.Value;
      dmInventario.tblInventarioProdFECHA_ULTIMA_TRN.Value:=ExtraerFecha(Date);

      GlbSalvarQuery(dmInventario.tblInventarioProd);
      end;

      For idx:=1 To 4 Do
      begin
        if dmInventario.tblInventarioProd.State = dsBrowse then
        dmInventario.tblInventarioProd.Edit;
        if (rxDatastatus.Value = 'A') then
        begin
          fname :='PORCUTILIDAD'+IntToStr(idx);
          dmInventario.tblInventarioProdPRECIO_COMPRA.Value := rxDataPrecioCompra.Value;
          if not dmInventario.tblInventarioProd.Fieldbyname(fname).IsNull then
          CalcularPrecio(idx,dmInventario.tblInventarioProd.Fieldbyname(fname).AsVariant,
          dmInventario.tblInventarioProdCODIGO.Value);

          if dmInventario.tblInventarioProd.State = dsEdit then
          begin
            dmInventario.tblInventarioProd.Post;
            dmInventario.tblInventarioProd.ApplyUpdates;
          end;
        end;
      end;
    end else
    begin
      dmInventario.tblInventarioProd.Close;
      if dmInventario.tblInventarioProd.state = dsInactive then
      dmInventario.tblInventarioProd.Open;
      if not dmInventario.tblInventarioProd.Locate('codigo', rxDataCodigoProd.Value,[]) then
      begin
        MessageDlg('Hay un error localizando el producto en inventario.',mterror,[mbok],0);
      end else
      begin
      dmInventario.tblInventarioProd.Edit;
      dmInventario.tblInventarioProdPRECIO_MINIMO.Value:= rxDataPrecioVenta.Value;
      dmInventario.tblInventarioProdPRECIO_ANT.Value:=dmInventario.tblInventarioProdPRECIO.Value;
      dmInventario.tblInventarioProdPRECIO.Value       := rxDataPrecioVenta.Value;
      dmInventario.tblInventarioProdPRECIO_COMPRA.Value := rxDataPrecioCompra.Value;
      if dmInventario.tblInventarioProdBLCE_CANT_ENTRADA.IsNull then
      dmInventario.tblInventarioProdBLCE_CANT_ENTRADA.Value:=0;

      dmInventario.tblInventarioProdBLCE_CANT_ENTRADA.Value:=
      dmInventario.tblInventarioProdBLCE_CANT_ENTRADA.Value +
      dmInventario.tblInventarioProdCANTIDAD.Value;
      dmInventario.tblInventarioProdFECHA_ULTIMA_TRN.Value:=ExtraerFecha(Date);

      GlbSalvarQuery(dmInventario.tblInventarioProd);
      end;
    end;

    try
    if dmInventario.tblInventarioProdINVENTARIAR.Value = 1 then
    dmVentas.Proc_InsertarKardexDet(
    glbCia_Key,
    1, //TIPO SMALLINT,  --1-Entradas 2-Salida
    7, //TIPO_OPE SMALLINT,--1-Orden Compra 2-Venta 3-Devolucion 4-Transferencia 5-Dañado 6-Donacion 7-Otro
    rxdataFecha.Value,
    rxDataCodigoProd.Value, //CODIGO_PRODUCTO :integer;
    rxDataCantidad.Value,
    rxDataPrecioCompra.Value, //COSTO_PRODUCTO :real;
    rxDataPrecioVenta.Value, // PRECIO_VENTA :real;
    VarUsuarioGlb, //CODIGO_USUARIO :integer;
    stpProcInsDespachoMaster.Params[0].Value,//Numero trn despacho
    'A' //STATUS :string;
    ,'Registro Pedido');
    except
    end;
    if _MostrarVtanaPrecios or chkMostrarVtanaPrecios.Checked then
    begin
      if (GlbUsaPUnidadLevel = 1) then
      begin
        tblPrecioXUnidadLevel.Close;
        tblPrecioXUnidadLevel.Params[0].Value:=rxDataCodigoProd.Value;
        tblPrecioXUnidadLevel.Open;
        tblPrecioXUnidadLevel.First;

        frmPrecioUnidadNivel:=TfrmPrecioUnidadNivel.Create(Nil);
        try
          frmPrecioUnidadNivel._NoInsert := True;
          dmInventario.tblPrecioUnidadXNivel.Close;
          dmInventario.tblPrecioUnidadXNivel.Params[0].Value:=rxDataCodigoProd.Value;
          dmInventario.tblPrecioUnidadXNivel.Open;
          frmPrecioUnidadNivel.xProd:=rxDataCodigoProd.Value;

          dmInventario.tblInventarioProd.Locate('codigo', rxDataCodigoProd.Value,[]);
          frmPrecioUnidadNivel.xProd := rxDataCodigoProd.Value;
          frmPrecioUnidadNivel.buscarCodigo(rxDataCodigoProd.Value);
          frmPrecioUnidadNivel.BitBtn1Click(Self);

            if (rxDataCodigoProd.Value <> dmInventario.tblInventarioProdCODIGO.Value) then
            begin
              dmInventario.tblInventarioProd.DisableControls;
              dmInventario.tblInventarioProd.Locate('CODIGO',rxDataCodigoProd.Value,[]);
              dmInventario.tblInventarioProd.EnableControls;
            end;

          
          if chkboxMostrarVtanPrecio.Checked then
          frmPrecioUnidadNivel.Showmodal;
        finally
        frmPrecioUnidadNivel.Free;
        frmPrecioUnidadNivel:=Nil;
        end;
      end;
    end;
    _MostrarVtanaPrecios:=False;

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

  if not dmInventario.tblInventarioProd.Transaction.InTransaction then
  dmInventario.tblInventarioProd.Transaction.StartTransaction;
  try
    dmInventario.tblInventarioProd.Transaction.CommitRetaining;
  except
  dmInventario.tblInventarioProd.Transaction.RollbackRetaining;
  end;
  rxData.AutoCalcFields := True;
  rxData.EnableControls;
  RxDBGrid2.EnableScroll;
end;

procedure TfrmRegPedidoProv.RxDBGrid2GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if (rxDataStatus.Value = 'R') then
  begin
    BackGround := $00CCFFFF;
    AFont.Color:= clBlack;
  end;
end;

procedure TfrmRegPedidoProv.BitBtn5Click(Sender: TObject);
begin
  if rxData.State in [dsInsert, dsEdit] then
  rxData.Cancel;
  if (rxData.RecordCount > 0) then
  if MessageDlg('Eliminar record?', mtWarning, [mbYes, mbNo], 0) = mrYes then
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
  qryInventario.Close;
  qryInventario.Open;
  //edtLotNum.Clear;
  edtNumConduce.Clear;
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
  dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);
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
  rxData.AutoCalcFields:=True;
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
  stpMantInvAlmacen.Params[1].Value := GlbCodDivInventario;//1-Almacen Principal, inventario_id
  stpMantInvAlmacen.Params[2].Value := rxDataCantidad.Value;
  stpMantInvAlmacen.Params[3].Value := VarUsuarioGlb;    //codigo_usuario
  stpMantInvAlmacen.Params[4].Value := ExtraerFecha(Now);//fecha_in
  stpMantInvAlmacen.Params[5].Value := strUserName;      //in_por
  stpMantInvAlmacen.Params[6].Value := ExtraerFecha(Now);//fecha_mod
  stpMantInvAlmacen.Params[7].Value := strUserName;      //in_por//mod_por
  stpMantInvAlmacen.Params[8].Value := 'A';              //status
  stpMantInvAlmacen.Params[9].Value := glbCia_Key;
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
  ProcSumatoria;
end;

procedure TfrmRegPedidoProv.DBEdit20Exit(Sender: TObject);
begin
  if rxData.State In [dsEdit, dsinsert] then
  if not rxDataunidadId.IsNull then
  rxDataCantidad.Value:= rxDataCantUnidad.Value *
  dminventario.tblUnidadesCANTIDAD.Value;
  DBEdit19Change(Self);
  if rxDataPrecioCompra.Value > 0 then
  ProcesaCalcular;
end;

procedure TfrmRegPedidoProv.RxDBLookupCombo5Change(Sender: TObject);
begin
  if (rxDataTipoUnidad.Value = 1) Then
  rxDataPrecioTUnidad.Value:=rxDataPrecioVenta.Value;
end;

procedure TfrmRegPedidoProv.DBEdit21Enter(Sender: TObject);
begin
  DBEdit21.SelectAll;
end;

procedure TfrmRegPedidoProv.BitBtn29Click(Sender: TObject);
begin
  if GlbUsaPUnidadLevel = 1 then
  begin
    dmInventario.tblInventarioProd.Locate('codigo',rxDataCodigoProd.Value,[]);
    frmPrecioUnidadNivel:=TfrmPrecioUnidadNivel.Create(Nil);
    try
      frmPrecioUnidadNivel.buscarCodigo(rxDataCodigoProd.Value);

      if (rxDataCodigoProd.Value <> dmInventario.tblInventarioProdCODIGO.Value) then
      begin
        dmInventario.tblInventarioProd.DisableControls;
        dmInventario.tblInventarioProd.Locate('CODIGO',rxDataCodigoProd.Value,[]);
        dmInventario.tblInventarioProd.EnableControls;
      end;

      if chkboxMostrarVtanPrecio.Checked then
      frmPrecioUnidadNivel.Showmodal;
    finally
    frmPrecioUnidadNivel.Free;
    frmPrecioUnidadNivel:=Nil;
    end;
  end else
  begin
    frmPrecioProdXUnidad:=TfrmPrecioProdXUnidad.Create(nil);
    try
      if Not rxDataCodigoProd.IsNull then
      frmPrecioProdXUnidad.buscarCodigo(rxDataCodigoProd.Value)
      else
      frmPrecioProdXUnidad.buscarCodigo(0);
      frmPrecioProdXUnidad.Showmodal;
    finally
    frmPrecioProdXUnidad.Free;
    frmPrecioProdXUnidad:=Nil;
    end;
  end;
end;

procedure TfrmRegPedidoProv.EditN3Change(Sender: TObject);
begin
  qryInventario.Locate('Referencia_Alterna',editN3.Text,[loCaseInsensitive,loPartialKey])
end;

procedure TfrmRegPedidoProv.EditN4Change(Sender: TObject);
begin
  qryInventario.Locate('Modelo',editN4.Text,[loCaseInsensitive,loPartialKey])
end;

procedure TfrmRegPedidoProv.rxDataAfterScroll(DataSet: TDataSet);
begin
  if rxDataCodigoProd.IsNull then exit;
  qryInventario.Locate('CODIGO',rxDataCodigoProd.Value,[]);
  //if EsRecibiendoOrden then
  //begin
    if dmInventario.tblinventarioProd.state = dsInactive then
    begin
      dmInventario.tblInventarioProd.Close;
      dmInventario.tblInventarioProd.SelectSQL.Text := dmInventario.qryInvProd_Base.Sql.Text;
      dmInventario.tblInventarioProd.Params[0].Value:=glbCia_Key;
      dmInventario.tblInventarioProd.Open;
    end;
    dmInventario.tblInventarioProd.Locate('codigo',rxDataCodigoProd.Value,[]);
  //end;
end;

procedure TfrmRegPedidoProv.DBEdit13Change(Sender: TObject);
begin
  EditN2Change(Self);
end;

procedure TfrmRegPedidoProv.DBEdit19Change(Sender: TObject);
begin
  //ProcesaCalcular;
  DBEdit13Exit(Self);
end;

procedure TfrmRegPedidoProv.ProcesaCalcular;
begin
  if rxData.state = dsBrowse then rxData.Edit;
  if (rxDataCantidad.Value > 0) then
  rxDatavalor.Value:=rxDataPrecio.Value * rxDataCantidad.Value
  else
  rxDatavalor.Value:=rxDataPrecio.Value * rxDataCantidad.Value;

  rxDataMontoDescuento.Value:= rxDatavalor.Value * rxDataporc_desc.Value/100;
  if qryInventarioPAGA_ITBI.Value = 1 then
  rxDataitbi.Value:= (rxDatavalor.Value -
                     (rxDatavalor.Value * rxDataporc_desc.Value/100)) *
  FGlbPorcItbi(ExtraerFecha(rxDataFecha.Value),rxDataCodigoProd.Value) / 100;
  rxDatatotal_neto.Value:= (rxDatavalor.Value -
                           (rxDatavalor.Value * rxDataporc_desc.Value/100))
                                              + rxDataitbi.Value;
  rxDataCodEmp.Value:=dmDespacho.qryEmpleadosCODIGO.Value;
  if not rxDataBalanceAct.IsNull then
  rxDataNuevoBalance.Value:= rxDataCantidad.Value + rxDataBalanceAct.Value
  else
  rxDataNuevoBalance.Value:= rxDataCantidad.Value;
end;

procedure TfrmRegPedidoProv.qryInventarioAfterScroll(DataSet: TDataSet);
var test : string;
begin
  test := 'test';
end;

procedure TfrmRegPedidoProv.Modificar1Click(Sender: TObject);
begin
  frmPedidosProveedores:=TfrmPedidosProveedores.Create(nil);
  try
    frmPedidosProveedores.showmodal;
  finally
  frmPedidosProveedores.free;
  frmPedidosProveedores:=nil;
  end;
end;

procedure TfrmRegPedidoProv.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryInventario.Close;
  dmInventario.qryTipoUnidad.Close;
  dminventario.tblUnidades.Close;
  tblTipoPrecio.close;
  qryClasifPrecio.close;
  rxProveedor.Close;
  rxProveedor.close;
  dmInventario.qryProveedores.Close;
  dmInventario.qryProveedores.Filtered:=False;
  dmInventario.qryProveedores.Tag:=glbCia_Key;
  dmInventario.qryProveedores.Filtered:=True;
  qryInventario.close;
  rxData.close;
  dmEmpleados.tblRuta.close;
  dmEmpleados.tblEmpleados.close;
  dmCuadrexRuta.tblBalanceDespacho.close;
  dmInventario.qryPrecioInventario.Close;
  dmInventario.tblInventarioProd.Close;
  dmInventario.tblInventarioProd.SelectSQL.Text := dmInventario.qryInvProd_Base.Sql.Text;
  dmInventario.tblInventarioProd.Params[0].Value := glbCia_Key;
  dmDespacho.tblTipoDespacho.Close;
  dmDespacho.qryEmpleados.close;
  dmDespacho.tblDespachoMaster.Close;
  qryInvLookup.Close;
  qryInventario.Close;

end;

procedure TfrmRegPedidoProv.DBEdit1Exit(Sender: TObject);
begin
  if rxData.State In [dsEdit, dsInsert] then
  ProcAsignarValores;
end;

procedure TfrmRegPedidoProv.CalcularPrecio(idx: smallint;
  porcValue: Extended; codProducto: Integer);
begin
  if dmInventario.tblInventarioProd.State in [dsBrowse,dsInactive] then exit;
  case idx of
  1:begin
      dmInventario.tblInventarioProdPRECIOVENTA1.Value:=
    (1 + porcValue / 100) * dmInventario.tblInventarioProdPRECIO_COMPRA.Value;
    dmInventario.tblInventarioProdPRECIOVENTA1.Value:=
    dmInventario.tblInventarioProdPRECIOVENTA1.Value
    * (1 +FGlbPorcItbi(ExtraerFecha(rxDataFecha.Value), dmInventario.tblInventarioProdCODIGO.Value)/100);
    end;
  2:begin
     dmInventario.tblInventarioProdPRECIOVENTA2.Value:=
     (1 + porcValue / 100) * dmInventario.tblInventarioProdPRECIO_COMPRA.Value;
    dmInventario.tblInventarioProdPRECIOVENTA2.Value:=
    dmInventario.tblInventarioProdPRECIOVENTA2.Value
    * (1 +FGlbPorcItbi(ExtraerFecha(rxDataFecha.Value), dmInventario.tblInventarioProdCODIGO.Value)/100);
    end;
  3:begin
     dmInventario.tblInventarioProdPRECIOVENTA3.Value:=
     (1 + porcValue / 100) * dmInventario.tblInventarioProdPRECIO_COMPRA.Value;
    dmInventario.tblInventarioProdPRECIOVENTA3.Value:=
    dmInventario.tblInventarioProdPRECIOVENTA3.Value
    * (1 +FGlbPorcItbi(ExtraerFecha(rxDataFecha.Value), dmInventario.tblInventarioProdCODIGO.Value)/100);
    end;

  4:begin
     dmInventario.tblInventarioProdPRECIOVENTA4.Value:=
     (1 + porcValue / 100) * dmInventario.tblInventarioProdPRECIO_COMPRA.Value;
     
    dmInventario.tblInventarioProdPRECIOVENTA4.Value:=
    dmInventario.tblInventarioProdPRECIOVENTA4.Value
    * (1 +FGlbPorcItbi(ExtraerFecha(rxDataFecha.Value), dmInventario.tblInventarioProdCODIGO.Value)/100);
    end;
  end;//case

  if dmInventario.tblInventarioProdPRECIOVENTA4.Value > 0 then
  dmInventario.tblInventarioProdPRECIO_MINIMO.Value:= dmInventario.tblInventarioProdPRECIOVENTA4.Value
  else
  dmInventario.tblInventarioProdPRECIO_MINIMO.Value:=dmInventario.tblInventarioProdPRECIO.Value;
  
  dmInventario.tblInventarioProdPRECIO_ANT.Value:=dmInventario.tblInventarioProdPRECIO.Value;
  if dmInventario.tblInventarioProdPRECIOVENTA1.Value > 0 then
  dmInventario.tblInventarioProdPRECIO.Value       :=dmInventario.tblInventarioProdPRECIOVENTA1.Value;
  if (dmInventario.tblInventarioProdPRECIO_MINIMO.Value < dmInventario.tblInventarioProdPRECIO.Value) then
  dmInventario.tblInventarioProdPRECIO_MINIMO.Value:=dmInventario.tblInventarioProdPRECIO.Value;
                                                              
  if dmInventario.tblInventarioProdBLCE_CANT_ENTRADA.IsNull then
  dmInventario.tblInventarioProdBLCE_CANT_ENTRADA.Value := 0;
  dmInventario.tblInventarioProdBLCE_CANT_ENTRADA.Value:=
  dmInventario.tblInventarioProdBLCE_CANT_ENTRADA.Value +
  dmInventario.tblInventarioProdCANTIDAD.Value;
end;

procedure TfrmRegPedidoProv.CalcularPrecioSurt(idx: smallint;
  porcValue: Extended; codProducto: Integer; cantUni:integer);
begin
  if not chkboxActPrecioXUnidad.Checked then Exit;

  //if (cantUni = 1) then
  //dmInventario.tblInventarioProdPRECIO_ANT.Value:=dmInventario.tblInventarioProdPRECIO.Value;
  //t if (cantUni = 1) then //nuevo Ene-10-2021
  //t dmInventario.tblInventarioProdPRECIO.Value :=
  //t (1 + porcValue / 100) * (dmInventario.tblInventarioProdPRECIO_COMPRA.Value  * cantUni);
  if porcValue <= 0 then
  exit;//no actualizar
  if tblPrecioXUnidadLevel.State in [dsBrowse,dsInactive] then exit;
  case idx of
  1:begin
      tblPrecioXUnidadLevelPORCUTILIDAD1.Value:=porcValue;
      tblPrecioXUnidadLevelPRECIOVENTA1.Value:=
      (1 + porcValue / 100) * ((dmInventario.tblInventarioProdPRECIO_COMPRA.Value) * cantUni);

      if (GLBAplicaITBISLevel = 1) then
      tblPrecioXUnidadLevelPRECIOVENTA1.Value:=
      tblPrecioXUnidadLevelPRECIOVENTA1.Value
      * (1 +FGlbPorcItbi(ExtraerFecha(rxDataFecha.Value), dmInventario.tblInventarioProdCODIGO.Value)/100);
    end;
  2:begin
    tblPrecioXUnidadLevelPORCUTILIDAD2.Value:=porcValue;
     tblPrecioXUnidadLevelPRECIOVENTA2.Value:=
     (1 + porcValue / 100) * (dmInventario.tblInventarioProdPRECIO_COMPRA.Value * cantUni);
     if (GLBAplicaITBISLevel = 1) then
    tblPrecioXUnidadLevelPRECIOVENTA2.Value:=
    tblPrecioXUnidadLevelPRECIOVENTA2.Value
    * (1 +FGlbPorcItbi(ExtraerFecha(rxDataFecha.Value), dmInventario.tblInventarioProdCODIGO.Value)/100);
    end;
  3:begin
     tblPrecioXUnidadLevelPORCUTILIDAD3.Value:=porcValue;  
     tblPrecioXUnidadLevelPRECIOVENTA3.Value:=
     (1 + porcValue / 100) * (dmInventario.tblInventarioProdPRECIO_COMPRA.Value * cantUni);
     if (GLBAplicaITBISLevel = 1) then
    tblPrecioXUnidadLevelPRECIOVENTA3.Value:=
    tblPrecioXUnidadLevelPRECIOVENTA3.Value
    * (1 +FGlbPorcItbi(ExtraerFecha(rxDataFecha.Value), dmInventario.tblInventarioProdCODIGO.Value)/100);
    end;

  4:begin
     tblPrecioXUnidadLevelPORCUTILIDAD4.Value:=porcValue;  
     tblPrecioXUnidadLevelPRECIOVENTA4.Value:=
     (1 + porcValue / 100) * (dmInventario.tblInventarioProdPRECIO_COMPRA.Value * cantUni);
     
     if (GLBAplicaITBISLevel = 1) then     
    tblPrecioXUnidadLevelPRECIOVENTA4.Value:=
    tblPrecioXUnidadLevelPRECIOVENTA4.Value
    * (1 +FGlbPorcItbi(ExtraerFecha(rxDataFecha.Value), dmInventario.tblInventarioProdCODIGO.Value)/100);

    if (cantUni = 1) then
    begin
      dmInventario.tblInventarioProdPRECIO_MINIMO.Value:=tblPrecioXUnidadLevelPRECIOVENTA4.Value;
      dmInventario.tblInventarioProdPRECIO.Value:=tblPrecioXUnidadLevelPRECIOVENTA1.Value;
      if (dmInventario.tblInventarioProdPRECIO_MINIMO.Value < dmInventario.tblInventarioProdPRECIO.Value) then
      dmInventario.tblInventarioProdPRECIO_MINIMO.Value:= dmInventario.tblInventarioProdPRECIO.Value;
    end;

    if (dmInventario.tblInventarioProdPRECIO_MINIMO.Value > tblPrecioXUnidadLevelPRECIOVENTA1.Value) then
    begin
      _MostrarVtanaPrecios:=True;
    end;
    end;
  end;//case
  //dmInventario.tblInventarioProdPRECIO_MINIMO.Value:= dmInventario.tblInventarioProdPRECIOVENTA4.Value;
end;

procedure TfrmRegPedidoProv.BitBtn12Click(Sender: TObject);
begin
  dmInventario.tblInventarioProd.Close;
  frmInventarioProd:=TfrmInventarioProd.Create(Nil);
  try
    if not rxDataCodigoProd.IsNull then
    begin
     if not dmInventario.tblInventarioProd.Locate('codigo_texto',rxDataCodigoProd.Value,[]) then
     dmInventario.tblInventarioProd.Locate('codigo',rxDataCodigoProd.Value,[]);
    end;
    frminventarioprod.ShowModal;
  finally
  frmInventarioProd.Free;
  frmInventarioProd:=Nil;
  end;

  if not rxDataCodigoProd.IsNull then
  begin
    qryInventario.Close;
    qryInventario.Open;
    qryInventario.Locate('CODIGO', rxDataCodigoProd.Value,[]);

    if rxData.state = dsBrowse then
    rxData.Edit;
    rxDataDescProducto.Value:=qryInventarioDESCRIPCION.Value;
    dmInventario.tblInventarioProd.Close;
    dmInventario.tblInventarioProd.SelectSQL.Text := dmInventario.qryInvProd_Base.Sql.Text;
    dmInventario.tblInventarioProd.Params[0].Value:=glbCia_Key;
    dmInventario.tblInventarioProd.Open;
  end else
  begin
    qryInventario.Close;
    qryInventario.Open;
    if not rxDataCodigoProd.IsNull then
    qryInventario.Locate('CODIGO', rxDataCodigoProd.Value,[]);
  end;
end;

procedure TfrmRegPedidoProv.edtNumConduceExit(Sender: TObject);
begin
  if rxData.State in [dsEdit, dsInsert] then
  rxDataNumConduce.Value := edtNumconduce.ValueInteger;
end;

procedure TfrmRegPedidoProv.dbEditNumConduceExit(Sender: TObject);
begin
  if rxData.State in [dsEdit, dsInsert] then
  if not rxDataNumConduce.IsNull then
  edtNumconduce.SetInteger(rxDataNumConduce.Value);
end;

procedure TfrmRegPedidoProv.Consulta1Click(Sender: TObject);
begin
  frmConsultaRegPedido:=TfrmConsultaRegPedido.Create(nil);
  try
    frmConsultaRegPedido.ShowModal;
  finally
  frmConsultaRegPedido.free;
  frmConsultaRegPedido:=nil;
  end;
end;

procedure TfrmRegPedidoProv.ProcSumatoria;
var
  Monto, MontoNuevo : Real;
  recordActual: TBookmark;
begin
  if (rxDataCantUnidad.Value  = 0) or rxDataCantUnidad.IsNull then
  exit;
  if rxdata.State in [dsEdit, dsInsert] then rxData.Post;
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
  rxdata.First;
  rxdata.GotoBookmark(recordActual);
  rxdata.FreeBookmark(recordActual);
  rxdata.EnableControls;
end;

procedure TfrmRegPedidoProv.RxDBLookupCombo4Exit(Sender: TObject);
begin
  if rxDataPrecioVenta.Value > 0 then
  DBEdit2Exit(Self);
end;

procedure TfrmRegPedidoProv.Skin1Click(Sender: TObject);
begin
  SkinData1.Active:= not SkinData1.Active;
end;

function TfrmRegPedidoProv.ProcVerificaDatos : boolean;
var
  cantFV, numL: Integer;
  recordActual: TBookmark;
begin
  if GlbFechaVencProducto = 0 then Exit;

  rxdata.DisableControls;
  recordActual:=rxdata.GetBookmark;
  rxdata.First;
  cantFV :=0;
  numL :=0;
  While Not rxdata.Eof do
  begin
    if rxDataFechaVencimiento.IsNull then
    cantFV:=cantFV + 1 ;
    if rxDataNumLote.IsNull then
    numL:=numL + 1;
    rxData.Next;
  end;
  rxdata.First;
  rxdata.GotoBookmark(recordActual);
  rxdata.FreeBookmark(recordActual);
  rxdata.EnableControls;
  if (numl > 0) or (cantFV > 0) then
  result:= False else result:= True;
end;

procedure TfrmRegPedidoProv.SpeedButton1Click(Sender: TObject);
begin
  frmProcBuscarProv:=TfrmProcBuscarProv.Create(Nil);
  try
    if frmProcBuscarProv.Showmodal = mrOk then
    begin
      rxProveedor.Close;
      rxProveedor.Open;
      rxProveedor.Append;
      rxProveedorCodigo.Value:=frmProcBuscarProv.xCodigoCte;
      rxProveedor.Post;
    end;
  finally
  frmProcBuscarProv.Free;
  frmProcBuscarProv:=Nil;
  end;
end;

procedure TfrmRegPedidoProv.Proveedores1Click(Sender: TObject);
begin
  frmProveedores:=TfrmProveedores.Create(Nil);
  try
    frmProveedores.Showmodal;
  finally
  frmProveedores.Free;
  frmProveedores:=Nil;
  end;
end;

procedure TfrmRegPedidoProv.Edit1Enter(Sender: TObject);
begin
  if rxData.State = dsEdit then
  rxData.Post else
  if rxData.State = dsInsert then
  begin
    MessageDlg('Debe terminar la transaccion actual.',mtWarning,[mbok],0);
    Exit;
  end;
end;

end.
