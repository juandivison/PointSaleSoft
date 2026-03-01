unit UProcVentaRapidaOrdComp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, RXDBCtrl, DBCtrls,
  Printers, DB, Mask, RxMemDS, EditNew, IBCustomDataSet, IBQuery, WinSkinData, Menus,
  ShellApi, RXCtrls, IBStoredProc, IBSQL, RxLookup; 

type
  TfrmProcOrdCompraN = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    rxVenta: TRxMemoryData;
    rxVentaSerie: TIntegerField;
    rxVentaFecha: TDateTimeField;
    rxVentaCant: TFloatField;
    rxVentaPrecio: TCurrencyField;
    rxVentaMontoBruto: TCurrencyField;
    rxVentaDescripcion: TStringField;
    rxVentaDevolucion: TCurrencyField;
    rxVentaMontoNeto: TCurrencyField;
    rxVentaCodUsuario: TIntegerField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBText1: TDBText;
    Label4: TLabel;
    RxDBGrid1: TRxDBGrid;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    Label6: TLabel;
    rxVentaCodArticulo: TIntegerField;
    BitBtn5: TBitBtn;
    Label7: TLabel;
    Edit1: TEdit;
    Label8: TLabel;
    edtCodigo: TEditN;
    qryProductos: TIBQuery;
    qryProductosCODIGO: TIntegerField;
    qryProductosCODIGO_TEXTO: TIBStringField;
    qryProductosDESCRIPCION: TIBStringField;
    qryProductosPRECIO: TFloatField;
    PopupMenu1: TPopupMenu;
    Inventario1: TMenuItem;
    RxSpeedButton5: TRxSpeedButton;
    ipStpInsertVentMast: TIBStoredProc;
    ibStpInsertVentaDet: TIBStoredProc;
    Label9: TLabel;
    Label10: TLabel;
    Ayuda1: TMenuItem;
    ImprimirRecibo1: TMenuItem;
    rxVentaNumeroRecibo: TIntegerField;
    Label11: TLabel;
    Label12: TLabel;
    rxVentaCodTexto: TStringField;
    rxVentaNCF: TStringField;
    NCFSinValorFiscal1: TMenuItem;
    CheckBox1: TCheckBox;
    BitBtn6: TBitBtn;
    Shape4: TShape;
    rxVentaNumeroTrn: TIntegerField;
    BuscarCliente1: TMenuItem;
    BitBtn8: TBitBtn;
    ipStpInsertCotizaMast: TIBStoredProc;
    ibStpInsertCotizaDet: TIBStoredProc;
    dsqryInventario: TDataSource;
    qryInventario: TIBQuery;
    qryInventarioDESCRIPCION: TIBStringField;
    qryInventarioPRECIO: TFloatField;
    qryInventarioPAGA_ITBI: TSmallintField;
    qryInventarioDESC_TIPOINV: TIBStringField;
    qryInventarioTIPO: TIntegerField;
    qryInventarioPORC_DESCUENTO: TFloatField;
    qryInventarioCANTIDAD: TFloatField;
    rxVentaporc_desc: TFloatField;
    rxVentaItbi: TFloatField;
    ibStpActualizaInvProd: TIBStoredProc;
    BitBtn9: TBitBtn;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    rxVentaMontoDescuento: TFloatField;
    Totales: TRxMemoryData;
    TotalesSubTotal: TFloatField;
    Totalesitbis: TFloatField;
    Totalesmontodesc: TFloatField;
    Totalestotalneto: TFloatField;
    Totalesmontorecibido: TFloatField;
    Totalesdevolucion: TFloatField;
    dsTotales: TDataSource;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    DBText7: TDBText;
    TotalesCodCliente: TIntegerField;
    TotalesNombreCliente: TStringField;
    TotalesDireccion: TStringField;
    TotalesTelefono: TStringField;
    Panel2: TPanel;
    RxDBGrid2: TRxDBGrid;
    DataSource2: TDataSource;
    Label16: TLabel;
    TotalesPorcDesAdicional: TFloatField;
    TotalesMontoDescAdicional: TFloatField;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    Totalesncf_numero: TStringField;
    TotalesMontoInteres: TCurrencyField;
    DBText6: TDBText;
    Label17: TLabel;
    BitBtn12: TBitBtn;
    rxSolDatoscte: TRxMemoryData;
    rxSolDatoscteNombre: TStringField;
    rxSolDatoscteDireccion1: TStringField;
    rxSolDatoscteDireccion2: TStringField;
    rxSolDatoscteTelefono: TStringField;
    rxSolDatoscteCedula: TStringField;
    rxSolDatoscteCelular: TStringField;
    rxSolDatoscteSector: TStringField;
    rxSolDatoscteCiudad: TStringField;
    rxSolDatoscteApodo: TStringField;
    rxSolDatoscteOtraPersona: TStringField;
    TotalesPorcientoInteres: TFloatField;
    qryProdSerie: TIBQuery;
    qryProdSerieCODIGO: TIntegerField;
    qryProdSerieSERIE: TIBStringField;
    qryProdSerieSTATUS: TIBStringField;
    rxVentaSerieProd: TStringField;
    MostrarVistaproductos1: TMenuItem;
    Label18: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    DBEdit6: TDBEdit;
    qryProveedores: TIBQuery;
    dsqryCliente: TDataSource;
    dstablaPropietario: TDataSource;
    tablaPropietario: TRxMemoryData;
    tablaPropietarioCodigoPropietario: TIntegerField;
    qryProductosREFERENCIA: TIBStringField;
    edtReferencia: TEditN;
    Label19: TLabel;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    rxVentaNumeroFactura: TIntegerField;
    Label20: TLabel;
    edtObservacion: TEdit;
    qryInventarioPRECIO_MINIMO: TFloatField;
    chkExento: TCheckBox;
    lblProcDev: TLabel;
    qryProductosPRECIO_MINIMO: TFloatField;
    qryProductosCANTIDAD: TFloatField;
    TotalesqrLabelNcfDesc: TStringField;
    TotalesRnc_Numero: TStringField;
    BitBtn15: TBitBtn;
    stpProcBuscarUltNum: TIBStoredProc;
    RxLabel1: TRxLabel;
    RxLabel2: TRxLabel;
    tblDatosVentaVehiculos: TIBDataSet;
    tblDatosVentaVehiculosNUM_SERIE: TIntegerField;
    tblDatosVentaVehiculosMARCA: TIBStringField;
    tblDatosVentaVehiculosMODELO: TIBStringField;
    tblDatosVentaVehiculosPLACA: TIBStringField;
    tblDatosVentaVehiculosMONTO_INICIAL: TFloatField;
    qryInventarioCODIGO_TEXTO: TIBStringField;
    LectorCodBarra1: TMenuItem;
    qryProductosINVENTARIAR: TSmallintField;
    qryInventarioINVENTARIAR: TSmallintField;
    rxVentaInvetariar: TSmallintField;
    tblProductoSerie: TIBDataSet;
    tblProductoSerieCODIGO: TIntegerField;
    tblProductoSerieSERIE: TIBStringField;
    tblProductoSerieSTATUS: TIBStringField;
    qryInventarioCODIGO: TIntegerField;
    rxVentaloteNum: TStringField;
    ibstpUpdateLote: TIBStoredProc;
    qryProductosPAGA_ITBI: TSmallintField;
    rxVentaMontoItbisenPrecio: TCurrencyField;
    rxVentaReferencia: TStringField;
    ImprimirLabel1: TMenuItem;
    NoGenerarNCF1: TMenuItem;
    Label21: TLabel;
    rxSolDatosctencfDescripcion: TStringField;
    BitBtn16: TBitBtn;
    ibstpProcSecuencia: TIBStoredProc;
    rxVentaNumeroDoc: TIntegerField;
    chkDisplay: TCheckBox;
    stpMantInvAlmacen: TIBStoredProc;
    Label22: TLabel;
    lblInventario: TLabel;
    qryClasifPrecio: TIBQuery;
    qryClasifPrecioCOD_PRODUCTO: TIntegerField;
    qryClasifPrecioPRECIO_ID: TIntegerField;
    qryClasifPrecioPRECIO_VENTA: TFloatField;
    Label23: TLabel;
    ibsqlBceCxcCte: TIBSQL;
    SecretPanel1: TSecretPanel;
    qryVence: TIBQuery;
    qryVenceCODIGO: TIntegerField;
    qryVenceLOTE_NUM: TIBStringField;
    qryVenceCODIGO_PROV: TIntegerField;
    qryVenceCANT_IN: TIntegerField;
    qryVenceCANT_OUT: TIntegerField;
    qryVenceFECHA_VENCIMIENTO: TDateTimeField;
    qryVenceNOMBRE_PROVEEDOR: TIBStringField;
    qryVenceDESCRIPCION_PRODUCTO: TIBStringField;
    qryVenceCODIGO_TEXTO: TIBStringField;
    qryVenceDIASPORVENCER: TIntegerField;
    qryVenceDIASVENCIDOS: TIntegerField;
    qryVencePRECIO: TFloatField;
    RxDBGrid3: TRxDBGrid;
    dsqryVence: TDataSource;
    NoMostrarProdVencidos1: TMenuItem;
    rxLabelVence: TRxLabel;
    rxqryInv: TRxMemoryData;
    rxqryInvCODIGO: TIntegerField;
    rxqryInvCODIGO_TEXTO: TStringField;
    rxqryInvDESCRIPCION: TStringField;
    rxqryInvREFERENCIA: TStringField;
    rxqryInvPAGA_ITBI: TSmallintField;
    dsrxqryInv: TDataSource;
    rxqryInvPRECIO: TCurrencyField;
    rxqryInvPRECIO_MINIMO: TCurrencyField;
    rxqryInvCANTIDAD: TCurrencyField;
    rxqryInvINVENTARIAR: TIntegerField;
    qryInventarioREFERENCIA: TIBStringField;
    rxqryInvPORC_DESCUENTO: TCurrencyField;
    ibsqlVerificaSerie: TIBSQL;
    Label24: TLabel;
    cboxTipoUnidad: TComboBox;
    rxqryInvPrecioXTipoUnidad: TCurrencyField;
    rxVentaTipoUnidad: TIntegerField;
    qryInventarioPRECIO_TIPO_UNIDAD: TFloatField;
    rxqryInvTipoUnidad: TIntegerField;
    qryInventarioTIPO_UNIDAD: TIntegerField;
    rxVentaDescUnidadMedida: TStringField;
    qryProductosPORC_DESCUENTO: TFloatField;
    qryProductosUNIDAD: TFloatField;
    qryProductosPRECIO_COMPRA: TFloatField;
    qryProductosFECHA_VENCIMIENTO: TDateTimeField;
    qryProductosPRECIO_TIPO_UNIDAD: TFloatField;
    qryProductosTIPO_UNIDAD: TIntegerField;
    TotalesFechaVence: TDateTimeField;
    qryPrecioXTipoUnidad: TIBQuery;
    qryPrecioXTipoUnidadID_PROD: TIntegerField;
    qryPrecioXTipoUnidadID_UNIDAD: TIntegerField;
    qryPrecioXTipoUnidadPRECIO: TFloatField;
    Label25: TLabel;
    RxSpeedButton1: TRxSpeedButton;
    MaestroInventario1: TMenuItem;
    DataSource3: TDataSource;
    ConsultaGeneral1: TMenuItem;
    BitBtn17: TBitBtn;
    rxPreventa: TRxMemoryData;
    rxPreventaSerie: TIntegerField;
    rxPreventaNumero: TIntegerField;
    ibsqlDeletePreventaDet: TIBSQL;
    ibsqlDeletePreventaMaster: TIBSQL;
    rxVentaItbisExento: TSmallintField;
    rxVentaTipoVenta: TIntegerField;
    SkinData1: TSkinData;
    Label26: TLabel;
    stpGenNumOrden: TIBStoredProc;
    Button1: TButton;
    qryProdPorProveedor: TIBQuery;
    qryProdPorProveedorFECHA: TDateTimeField;
    qryProdPorProveedorCODIGO_PROV: TSmallintField;
    qryProdPorProveedorNOMBREPROVEEDOR: TIBStringField;
    qryProdPorProveedorPRECIO: TFloatField;
    qryProdPorProveedorTELEFONO: TIBStringField;
    qryProdPorProveedorEMAIL: TIBStringField;
    dsqryProdPorProveedor: TDataSource;
    qryProveedoresCODIGO_CTE: TIntegerField;
    qryProveedoresTIPO_CLIENTE: TIntegerField;
    qryProveedoresNOMBRE_ABR: TIBStringField;
    qryProveedoresDESCRIPCION: TIBStringField;
    qryProveedoresCONTACTO: TIBStringField;
    qryProveedoresPAIS: TIBStringField;
    qryProveedoresESTADO: TIBStringField;
    qryProveedoresCIUDAD: TIBStringField;
    qryProveedoresCALYYNUM: TIBStringField;
    qryProveedoresTELEFONO: TIBStringField;
    qryProveedoresFAX: TIBStringField;
    qryProveedoresCODIGOPOSTAL: TIBStringField;
    qryProveedoresEMAIL: TIBStringField;
    qryProveedoresDIRECCIONWEB: TIBStringField;
    qryProveedoresSTATUS: TIBStringField;
    qryProveedoresFECHA_IN: TDateTimeField;
    qryProveedoresIN_POR: TIBStringField;
    qryProveedoresFECHA_MOD: TDateTimeField;
    qryProveedoresMOD_POR: TIBStringField;
    qryProveedoresRNC_PROVEEDOR: TIBStringField;
    qryProveedoresMOVIL1: TIBStringField;
    qryProveedoresMOVIL2: TIBStringField;
    qryProveedoresTELEFONO2: TIBStringField;
    qryProveedoresTELEFONO3: TIBStringField;
    qryProveedoresEXTENSIONES: TIBStringField;
    qryProveedoresCIA_KEY: TIntegerField;
    procedure BitBtn4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtCodigoChange(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure rxVentaAfterPost(DataSet: TDataSet);
    procedure Edit1Exit(Sender: TObject);
    procedure edtCodigoEnter(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rxVentaBeforePost(DataSet: TDataSet);
    procedure BitBtn5Click(Sender: TObject);
    procedure Inventario1Click(Sender: TObject);
    procedure Ayuda1Click(Sender: TObject);
    procedure ImprimirRecibo1Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BuscarCliente1Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure RxDBGrid2DblClick(Sender: TObject);
    procedure DBEdit1Enter(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure DBEdit5Exit(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure MostrarVistaproductos1Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure edtReferenciaChange(Sender: TObject);
    procedure edtReferenciaExit(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure DBEdit2Enter(Sender: TObject);
    procedure chkExentoExit(Sender: TObject);
    procedure RxDBGrid2KeyPress(Sender: TObject; var Key: Char);
    procedure RxDBGrid2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chkExentoEnter(Sender: TObject);
    procedure RxDBGrid2GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure BitBtn15Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RxLabel1Click(Sender: TObject);
    procedure LectorCodBarra1Click(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure ImprimirLabel1Click(Sender: TObject);
    procedure NoGenerarNCF1Click(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure qryProveedoresAfterScroll(DataSet: TDataSet);
    procedure qryProductosAfterScroll(DataSet: TDataSet);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure RxDBGrid3DblClick(Sender: TObject);
    procedure SecretPanel1DblClick(Sender: TObject);
    procedure NoMostrarProdVencidos1Click(Sender: TObject);
    procedure rxLabelVenceDblClick(Sender: TObject);
    procedure qryInventarioAfterOpen(DataSet: TDataSet);
    procedure rxqryInvAfterScroll(DataSet: TDataSet);
    procedure cboxTipoUnidadChange(Sender: TObject);
    procedure cboxTipoUnidadExit(Sender: TObject);
    procedure qryInventarioAfterScroll(DataSet: TDataSet);
    procedure Label25Click(Sender: TObject);
    procedure RxSpeedButton1Click(Sender: TObject);
    procedure MaestroInventario1Click(Sender: TObject);
    procedure cboxTipoUnidadEnter(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure RxDBGrid2Enter(Sender: TObject);
    procedure RxDBGrid2Exit(Sender: TObject);
    procedure rxVentaAfterScroll(DataSet: TDataSet);
    procedure ConsultaGeneral1Click(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure Label26Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure RxDBGrid1Enter(Sender: TObject);
    procedure RxDBGrid1Exit(Sender: TObject);
  private
    procedure ProcInsDetalleOrden;
    procedure ProcesarSumaTotal;
    procedure ProcesaNuevo;
    procedure InsertarDet(numero : Integer);
    procedure InsertarCotizacionDet(numero : Integer);
    procedure ProcesaCalculos;
    procedure ProcCargaDatosCotizacion;

    procedure ProcActUltTrn;
    procedure AbrirClasifPrecio;

    procedure ProcesaFacturar(tipo : smallint;numdoc:integer;codcte:integer);
    procedure ActBalaceCteP(operacion:smallint);
    procedure EditarBalanceP(monto:Real;tipo:Integer);overload;
    //procedure EditarBalanceP(monto:Real;fecha:TDateTime);overload;
    procedure EditarBalanceP(monto : Real);overload;
    procedure InsertaBalanceP(monto: Real);
    Function VerificaClave:Boolean;

    procedure ProcVentaConNCF(tiponcf:String; Var valorNCF:String; Var seriedoc:Integer; Var serie_asignadoncf : Integer);

    procedure ProcVenta(valorNCF:String; Serie_Asignadoncf:Integer; Var serieDoc:Integer);

    Procedure AplicaPrecioMayorista;
    Function FncFrecuencia(Frec : Integer):String;
    procedure AsignarSqlText(campo:String; valor:string; OrderBy : String);
    procedure Finalizardisplay;
    procedure ActualizaInvAlmacen;
    Function VerificaLimiteCredito(codigocte:integer;MontoVenta:Real):Boolean;
    procedure LlenarTipoUnidadBox(umedida:integer);
    Function precioXUnidad(idTipoUnidad:Integer;idProducto: Integer): Extended;
    procedure ImprimirFactura(Avance: Integer);
    procedure CargarPreventa;
    procedure ActualizarPreventa;
    Procedure InsertaTransCafeteria(numTrn : Integer;codigoP:Integer;cantP:Real);
  public
  end;

Const
  FormaPagoNotaDebito = 6;//Devolucion
  TipoPagoFactura = 7;//Factura-Credito
  //PORC_TRANSP_ITBIS = 16/1.16;//13.79;
var

  frmProcOrdCompraN: TfrmProcOrdCompraN;
  TipoVenta : String;
  xCodigoCte : Integer;
  xSalir, Prod_existe: boolean;
  EsFinanciamiento : Boolean = false;
  EsFactura  : Boolean = false;
  BuscandoPorDesc: Boolean = false;
  sumarDatos  : Boolean = True;
  clave : String;
  yNumSerie : Integer;
  MontoItbisEnPrecio : Extended;
  PrecioAnterior : Extended;
  Entro : Boolean = false;
  reciboImpreso : Boolean;
  isShowing : Boolean;
  FAplicaPrecioMayorista: Boolean;
  NoTieneCredito :  boolean = False;
  CantUnidad : Real;
  InactivaImprecibo : Boolean;
  noExiste : Boolean;
  sqlAsignado : Boolean;
  PrecioCambio : Boolean;
  cPrecio, aPrecio, PORC_TRANSP_ITBIS : Extended;

implementation
uses UDatModConectar, UGlobal, URepComprobante, UDatModCompania,
  UProcMiniInventario, UFormSelFecha, UDatModReportes, URepVentaDiaria,
  UDatModFactura, USeleccionarNCF, uFormAsignarNCFVenta,
  UBuscarClientesPersonasP, UFormDatosCotiza, UDatModCxc, UDatModClientes,
  UMaestroClientes, URFacturaStandar, URFactura, UFormSelproducto,
  UFormFinanciamiento, URepCotizacionPapel8_55, URepRecibo8_5_11,
  USolDatos, UDistCuotasFinanc, UFormSelSerieProd, UInvXReferencia,
  UTransNcNbDev, UEdicionVenta, UFormProcDevolucion, UFormEntreClave, Math,
  URFacturaStandarReimp, UFormDatosVentaVeh, UDatModInventario,
  UIndicarLoteNum, ULabelImpCodBarra, UConsultaPrecio,
  URepFacturaPuntoVenta, UDatModUsuarios, URepRecibo8_5_11REspinal,
  URFacturaStandarReimpREsp, UInventarioProd, UConsultaInventario,
  UConsultaPreventa, URepComprobanteFix, UDatosVentas,
  UFormVerIngredientes, UDatmodDatosGenerales, uSelSingleFechaOpc,
  UFormImpordenCompras, UFormPrecioProdPorProveedor, uFormAsignareCFVenta;

{$R *.dfm}

  function esNumero(valor:String):Boolean;
  begin
    if (Valor[1] =  '0') or (Valor[1] =  '1') or (Valor[1] =  '2')
    or (Valor[1] =  '3') or (Valor[1] =  '4') or (Valor[1] =  '5')
    or (Valor[1] =  '6') or (Valor[1] =  '7')
    or (Valor[1] =  '8') or (Valor[1] =  '9') then
    result:= True else result:= False;
  end;

procedure TfrmProcOrdCompraN.BitBtn4Click(Sender: TObject);
begin
  if rxVenta.RecordCount = 0 then
  begin
    Messagedlg('No hay datos para guardar',mtinformation,[mbok],0);
    exit;
  end;
  //dmdatos.stpInsOrdenMast.Params[0].Value:= //out NUMERO
  dmdatos.stpInsOrdenMast.Params[1].Value:= tablaPropietarioCodigoPropietario.Value; //CODIGO PROVEEDOR
  dmdatos.stpInsOrdenMast.Params[2].Value:= ExtraerFecha(rxVentaFecha.Value);//FECHA
  dmdatos.stpInsOrdenMast.Params[3].Value:= null;//FPAGO
  dmdatos.stpInsOrdenMast.Params[4].Value:= null;//COD_CAJA_CHICA
  dmdatos.stpInsOrdenMast.Params[5].Value:= null;//CODIGO BANCO
  dmdatos.stpInsOrdenMast.Params[6].Value:= null;//CTA BANCO
  dmdatos.stpInsOrdenMast.Params[7].Value:= 'ORDEN PEDIDO'; //OBSERVACION
  dmdatos.stpInsOrdenMast.Params[8].Value:= Totalestotalneto.Value; //MONTO
  dmdatos.stpInsOrdenMast.Params[9].Value:= 'A'; //STATUS
  dmdatos.stpInsOrdenMast.Params[10].Value:=  strusername; //IN POR
  dmdatos.stpInsOrdenMast.Params[11].Value:= now;//FECHA IN
  dmdatos.stpInsOrdenMast.Params[12].Value:= null;//MODNPOR
  dmdatos.stpInsOrdenMast.Params[13].Value:= null;//FECJA_MOD
  dmdatos.stpInsOrdenMast.Params[14].Value:= null;//TIPO_INV
  dmdatos.stpInsOrdenMast.Params[15].Value:= null;//STATUS_cnt
  dmdatos.stpInsOrdenMast.Params[16].Value:= null;//NUM_ORDEN
  dmdatos.stpInsOrdenMast.Params[17].Value:= null;//STATUS_ORDEN
  dmdatos.stpInsOrdenMast.Params[18].Value:= null;//AREA_ORDEN
  dmdatos.stpInsOrdenMast.ExecProc;

  rxVenta.First;
  While not rxVenta.Eof do
  begin
    ProcInsDetalleOrden;
    rxVenta.Next;
  end;
  BitBtn16Click(self);
end;

procedure TfrmProcOrdCompraN.ProcActUltTrn;
begin
  stpProcBuscarUltNum.ExecProc;
  RxLabel1.Caption:='Ult. #Fact:'+ stpProcBuscarUltNum.params[1].AsString;
  RxLabel2.Caption:='Ult. #Trans:'+ stpProcBuscarUltNum.params[0].AsString;
end;

procedure TfrmProcOrdCompraN.FormCreate(Sender: TObject);
begin
  //Ancho := 800;//1366;//1280; // Ancho del diseño
  //Alto  := 600;//768
{  Height := Height * Screen.Height Div Alto;
  Width := Width * Screen.Width Div Ancho;
  ScaleBy(Screen.Width, Ancho);
 } 
  sqlAsignado:=False;
  sumarDatos:=True;
  GlbImprimeReciboFact:=1;
  InactivaImprecibo:=False;
  cboxTipoUnidad.Clear;
  dmInventario.qryTipoUnidad.close;
  dmInventario.qryTipoUnidad.Open;
  dmInventario.qryTipoUnidad.First;
  While Not dmInventario.qryTipoUnidad.Eof Do
  begin
    cboxTipoUnidad.Items.Add(dmInventario.qryTipoUnidadDESCRIPCION.Value);
    dmInventario.qryTipoUnidad.Next;
  end;
  cboxTipoUnidad.ItemIndex := 1;
  if varTipousuario in [2,3]  then
  begin
  end else
  begin
  end;
  dmcompania.tblCompania.Close;
  dmcompania.tblCompania.Open;
  dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);
  reciboImpreso :=False;

  NoGenerarNCF1Click(Self);
  
  ProcActUltTrn;
  tablaPropietario.close;
  tablaPropietario.Open;
  qryProveedores.Close;
  qryProveedores.Open;
  qryProductos.Close;
  qryProductos.Open;
  Application.ProcessMessages;
  AsignarSqlText('','','');
  qryInventario.Close;
  qryInventario.Open;
  rxVenta.Close;
  rxVenta.Open;
  dmCompania.tblCompania.Close;
  dmCompania.tblCompania.Open;
  dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);
  Label10.Caption:= DateToStr(GlbFechaTrnDiaria);
  Label12.Caption:= VarNombreUsuario;
  Totales.Close;
  Totales.Open;
  Totales.Insert;
  TotalesSubTotal.Value:=0;
  Totalesitbis.Value:=0;
  Totalesmontodesc.Value:=0;
  Totalestotalneto.Value:=0;
  Totalesmontorecibido.Value:=0;
  Totalesdevolucion.Value:=0;
  Totales.Post;
  lblProcDev.Visible := False;
  //BitBtn1.SetFocus;
  //frmMostrarProductos:=TfrmMostrarProductos.Create(Nil);
  if GlbFinanciamiento = false then
  begin
    BitBtn11.Visible := False;
    BitBtn12.Visible := False;
    BitBtn15.Top     := 401;
  end;

  if GlbActF10CodBarra = 1 then
  LectorCodBarra1Click(Self);
  qryVence.close;
  qryVence.open;
  if qryVence.RecordCount > 0 then
  begin
    SecretPanel1.Visible:=true;
    SecretPanel1.Lines.Clear;
    while not qryVence.eof do
    begin
      SecretPanel1.Lines.Add(qryVenceDESCRIPCION_PRODUCTO.Value+' - '+
      qryVenceDIASPORVENCER.AsString);
      qryVence.Next;
    end;
    SecretPanel1.Visible:=True;
    SecretPanel1.Active :=True;
  end;
  NoGenerarNCF1Click(Self);
  Application.ProcessMessages;
  label25.Visible:=False;
  if (GlbImprimeReciboFact = 0) then
  begin
    label25.Caption:='No Imp Rcbo';
    label25.Visible:=True;
  end else
  label25.Caption:='';
end;

procedure TfrmProcOrdCompraN.edtCodigoChange(Sender: TObject);
begin
  //if rxVenta.State = dsBrowse then
  rxLabelVence.Visible:= False;
  if LectorCodBarra1.Checked then exit;
  BuscandoPorDesc:=False;
  if edtCodigo.Text = '' then Exit;
  if IsNumerico(edtCodigo.Text) then
  begin
    if Not sqlAsignado then
    AsignarSqlText('','','');
    //if rxqryInv.Locate('Codigo_Texto', edtCodigo.Text,[loCaseInsensitive, loPartialKey]) then
    if qryProductos.Locate('Codigo', edtCodigo.Text, [loCaseInsensitive, loPartialKey]) then
    begin
      qryProdPorProveedor.Close; //qryProductosCodigo.value
      qryProdPorProveedor.Params[0].Value:= qryProductosCODIGO.Value;
      qryProdPorProveedor.Open;

      dmInventario.qryTipoUnidad.Locate('IDUNIDAD',qryProductosTIPO_UNIDAD.Value ,[]);
      cboxTipoUnidad.Text:=dmInventario.qryTipoUnidadDescripcion.Value;
      if qryVence.Locate('codigo', qryProductosCodigo_Texto.Value,[]) then
      begin
        rxLabelVence.Visible:=true;
        rxLabelVence.Caption:='Vence en ' + qryVenceDIASPORVENCER.AsString;
      end else rxLabelVence.Visible:=False;
      panel2.Top := edtcodigo.Top + 30;
      panel2.Left:= edtcodigo.Left;
      panel2.Visible := True;
      panel2.BringToFront;
      noExiste:=False;
    end else noExiste:= True;
  end else
  begin
    sqlAsignado:=False;
    BuscandoPorDesc:=True;
    AsignarSqlText('codigo_texto', chr(39) + edtCodigo.Text +'%'+chr(39),'');
    if (qryProductos.recordcount = 0) then
    AsignarSqlText('descripcion', chr(39) + edtCodigo.Text +'%'+chr(39),'');
    if qryProductos.Locate('Descripcion', edtCodigo.Text, [loCaseInsensitive, loPartialKey]) then
    begin
      qryProdPorProveedor.Close; //qryProductosCodigo.value
      qryProdPorProveedor.Params[0].Value:= qryProductosCODIGO.Value;
      qryProdPorProveedor.Open;

      dmInventario.qryTipoUnidad.Locate('IDUNIDAD',qryProductosTipo_Unidad.value,[]);
      cboxTipoUnidad.Text:=dmInventario.qryTipoUnidadDescripcion.value;
      if qryVence.Locate('Codigo_Texto',qryProductosCodigo_Texto.Value,[]) then
      begin
        rxLabelVence.Visible := true;
        rxLabelVence.Caption := 'Vence en ' + qryVenceDIASPORVENCER.AsString;
      end else rxLabelVence.Visible:=False;
      panel2.Top := edtcodigo.Top+30;
      panel2.Left := edtcodigo.Left;
      panel2.Visible := True;
      panel2.BringToFront;
      noExiste:= False;
    end else noExiste:= True;
  end;
end;

procedure TfrmProcOrdCompraN.edtCodigoExit(Sender: TObject);
var
  numero : Integer;
  FExiste : Boolean;
begin
  //if (Length(edtcodigo.Text) > 0) And ( noExiste)
  if (Length(edtcodigo.Text) > 0) And (qryProductosCodigo_Texto.Value <> edtCodigo.text) And ( noExiste ) then
  begin
    MessageDlg('Código producto no encontrado, verifique', mtInformation, [mbOK], 0);
    edtCodigo.SetFocus;
    Exit;
  end;
  MontoItbisEnPrecio:=0;
  if (edtCodigo.Text = '') then Exit;
  Edit1.Text:='';
  PrecioCambio:=False;
  if reciboImpreso then
  Totales.EmptyTable;

  reciboImpreso :=False;
  if panel2.Visible  then
  edtCodigo.Text := qryProductosCodigo_Texto.Value;
  if BuscandoPorDesc then
  begin
    Panel2.BringToFront;
    Panel2.Visible:=True;
    RxDBGrid2.SetFocus;
    Exit;
  end;



  //****************xxxx***********************
  if IsNumerico(edtCodigo.Text) then
  begin
    if Not sqlAsignado then
    AsignarSqlText('','','');
    if qryProductos.Locate('Codigo_Texto', edtCodigo.Text,[loCaseInsensitive, loPartialKey]) then
    begin
      qryProdPorProveedor.Close; //qryProductosCodigo.value
      qryProdPorProveedor.Params[0].Value:= qryProductosCODIGO.Value;
      qryProdPorProveedor.Open;
      LlenarTipoUnidadBox(qryProductosTipo_Unidad.Value);
      if (qryProductosTipo_Unidad.value >0) or (Not qryProductosTipo_Unidad.IsNull) then
      begin
        dmInventario.qryTipoUnidad.Locate('IDUNIDAD',qryProductosTipo_Unidad.value,[]);
        cboxTipoUnidad.Text:=dmInventario.qryTipoUnidadDescripcion.value;
      end;
      if qryVence.Locate('codigo_texto', qryProductosCodigo_Texto.Value,[]) then
      begin
        rxLabelVence.Visible:= true;
        rxLabelVence.Caption:='Vence en ' + qryVenceDIASPORVENCER.AsString;
      end else rxLabelVence.Visible:=False;
      panel2.Top := edtcodigo.Top + 30;
      panel2.Left:= edtcodigo.Left;
      panel2.Visible := True;
      panel2.BringToFront;
    end
  end else
  begin
    BuscandoPorDesc:=True;
    sqlAsignado:=False;
    AsignarSqlText('codigo_texto',chr(39) + edtCodigo.Text +'%'+chr(39),'');
    if qryProductos.Locate('Descripcion',edtCodigo.Text,[loCaseInsensitive, loPartialKey]) then
    begin
      qryProdPorProveedor.Close; //qryProductosCodigo.value
      qryProdPorProveedor.Params[0].Value:= qryProductosCODIGO.Value;
      qryProdPorProveedor.Open;
      LlenarTipoUnidadBox(qryProductosTipo_Unidad.Value);
      dmInventario.qryTipoUnidad.Locate('IDUNIDAD',qryProductosTipo_Unidad.value,[]);
      cboxTipoUnidad.Text:=dmInventario.qryTipoUnidadDescripcion.value;

      if qryVence.Locate('Codigo_Texto',qryProductosCodigo_Texto.Value,[]) then
      begin
        rxLabelVence.Visible:=true;
        rxLabelVence.Caption:='Vence en ' + qryVenceDIASPORVENCER.AsString;
      end else rxLabelVence.Visible:=False;
      //panel2.Top:=edtcodigo.Top+30;
      panel2.Left:=edtcodigo.Left;
      panel2.Visible:=True;
      panel2.BringToFront;
    end;
  end;
  //****************xxxx***********************
  Prod_existe := True;
  if IsNumerico(edtCodigo.text) then
  begin
    if Not qryProductos.Locate('codigo', edtCodigo.Text,[]) then
    Prod_existe:= False;
  end else
  if Not qryProductos.Locate('codigo_Texto', edtCodigo.Text,[]) then
  Prod_existe:= False;

  if Prod_existe then
  begin
    Prod_existe:=False;

    if rxVenta.State = dsBrowse then
    begin
      rxVenta.DisableControls;
      //rxVenta.SortOnFields('serie', false, false);
      if (rxVenta.RecordCount > 0) then
      begin
        rxVenta.Last;
        numero := rxVentaSerie.Value + 1;
      end else numero := 1;
      rxVenta.EnableControls;
      WriteToLog('Post rxVenta - Line 796');
      rxVenta.Append;
      RxSpeedButton1.Visible:=True;
      rxVentaCant.Value := 1;
      rxVentaInvetariar.Value:= qryProductosINVENTARIAR.Value;
      rxVentaPrecio.Value:= qryProductosPRECIO_COMPRA.Value;
      rxVentaSerie.Value := Numero;
      rxVentaFecha.Value := ExtraerFecha(GlbFechaTrnDiaria);
      rxVentaCodUsuario.Value := VarUsuarioGlb;
    end;
    if rxVenta.State In [dsInsert, dsEdit] then
    begin
      rxVentaDescripcion.Value:= qryProductosDESCRIPCION.Value;
      rxVentaItbisExento.Value:= qryProductosPAGA_ITBI.Value;
      rxVentaReferencia.Value := qryProductosREFERENCIA.Value;

       //tj MontoItbisEnPrecio:=
       //tj qryProductosPRECIO.Value * FGlbPorcItbi(ExtraerFecha(rxVentaFecha.Value))/100;
       //tj if (qryProductosPAGA_ITBI.Value = 1) And (Not chkExento.Checked)
       //tj and GlbPermiteCambioPrecio then
       //tj rxVentaPrecio.Value  := qryProductosPRECIO.Value * (1 + FGlbPorcItbi(ExtraerFecha(rxVentaFecha.Value))/100)
       //tj else
       //tj begin

       {Not needed for orden compra
        if FAplicaPrecioMayorista then
        rxVentaPrecio.Value  := qryClasifPrecioPRECIO_VENTA.Value
        else
        begin
          if GlbTipoUnidad = 1 then
          rxVentaPrecio.Value  := qryProductosPRECIO.Value
          else
          if  precioXUnidad(GlbTipoUnidad,qryProductoscodigo.Value) > 0 then  // qryProductosPRECIO_TIPO_UNIDAD.Value > 0 then
          rxVentaPrecio.Value  := precioXUnidad(GlbTipoUnidad,qryProductoscodigo.Value)
          else
          begin
            rxVentaPrecio.Value  := qryProductosPRECIO.Value;
            cboxTipoUnidad.ItemIndex:=0;
            //MessageDlg('Precio no configurado para tipo unidad, verifique', mtError, [mbok],0);
          end;
        end;
        }
        rxVentaMontoItbisenPrecio.Value:=0;
        MontoItbisEnPrecio:=0;
       //tj end;

      rxVentaCodArticulo.Value:= qryProductoscodigo.Value;
      rxVentaCodTexto.Value   := edtCodigo.Text;
      rxVentaInvetariar.Value:= qryProductosINVENTARIAR.Value;
      qryProdSerie.close;
      //qryProdSerie.Params[0].Value:= edtCodigo.Text;
      qryProdSerie.Params[0].Value:= qryProductoscodigo.Value;
      qryProdSerie.Open;
      if qryProdSerie.RecordCount > 0 then
      begin
      frmSelSerie:=TfrmSelSerie.Create(Nil);
      try
        if frmSelSerie.Showmodal = mrOk then
        begin
          if (qryProdSerieSTATUS.Value = 'R') then
          begin
            MessageDlg('Número serie no disponible, verifique',mtInformation, [mbOK], 0);
           edtCodigo.SetFocus;
          end;
          if (ibsqlVerificaSerie.Open) then
          ibsqlVerificaSerie.Close;
          ibsqlVerificaSerie.Params[0].Value:=qryProdSerieSERIE.Value;
          ibsqlVerificaSerie.ExecQuery;
          if (ibsqlVerificaSerie.FieldByName('serie_prod').IsNull) Or
          (ibsqlVerificaSerie.FieldByName('serie_prod').Value = '') then
          rxVentaSerieProd.Value:= qryProdSerieSERIE.Value
          else
          begin
            MessageDlg('Este número de serie fue procesado en otra orden, verifique',mtInformation, [mbOK], 0);
           edtCodigo.SetFocus;ibsqlVerificaSerie.FieldByName('serie_prod').Value
          end;
        end;
      finally
      frmSelSerie.Free;
      frmSelSerie:= Nil;
      end;
      end;

      if (GlbSolicitaNumLote = 1) then
      begin
        dmInventario.qryLote.Close;
        dmInventario.qryLote.Params[0].Value:= qryProductosCODIGO.Value;
        dmInventario.qryLote.Open;
        if dmInventario.qryLote.Recordcount > 0 then
        begin
          frmShowLote:=TfrmShowLote.Create(Nil);
          try
            if frmShowLote.Showmodal = mrOk then
            rxVentaloteNum.Value:= dmInventario.qryLoteLOTE_NUM.Value;
          finally
          frmShowLote.Free;
          frmShowLote:=Nil;
          end;
        end;
      end;
    end else ProcesaNuevo;
  end;
  panel2.Visible:=MostrarVistaproductos1.Checked;
  if LectorCodBarra1.Checked And (rxVentaPrecio.Value > 0) then
  begin
    DBEdit1Enter(Self);
    DBEdit1Exit(Self);
    edtCodigo.SetFocus;
  end;
end;

procedure TfrmProcOrdCompraN.ProcesaNuevo;
var
  numero : Integer;
begin
  if rxVenta.State In [dsInsert, dsEdit] then
  begin
    if (rxVentaCodArticulo.IsNull) Or (rxVentaCant.IsNull) Or (rxVentaPrecio.IsNull) then
    begin
      //if frmProcVentaRapida.Showing then
      if isShowing then
      edtCodigo.SetFocus
    end else
    //Exit;
    rxVenta.Post;
  end;
  rxVenta.DisableControls;
  if (rxVenta.RecordCount > 0) then
  begin
    rxVenta.Last;
    numero := rxVentaSerie.Value + 1;
  end else numero:=1;
  rxVenta.EnableControls;
  WriteToLog('Post rxVenta - Line 929');
  rxVenta.Append;
  RxSpeedButton1.Visible:=True;
  rxVentaCant.Value:=1;
  rxVentaSerie.Value := Numero;
  rxVentaFecha.Value := ExtraerFecha(GlbFechaTrnDiaria);
  rxVentaCodUsuario.Value := VarUsuarioGlb;
end;

procedure TfrmProcOrdCompraN.BitBtn1Click(Sender: TObject);
begin
  {if (rxVentaCodArticulo.AsString <>'') and (rxVentaCant.AsString <> '')
     and (rxVentaMontoBruto.Value <= 0) then
  begin
    raise ERangeError.Create('Monto debe ser mayor que cero, verifique');
    DBEdit1.SetFocus;
    exit;
  end;}
  reciboImpreso :=False;
  ProcesaNuevo;
  //if frmProcVentaRapida.Showing then
  if isShowing then
  edtCodigo.SetFocus;
end;

procedure TfrmProcOrdCompraN.BitBtn3Click(Sender: TObject);
begin
  if rxVenta.RecordCount > 0 then
  begin
    if VerificaClave then
    begin
      if MessageDlg('Cancelar Venta?', mtInformation, [mbYes, mbNo], 0)= mryes then
      begin
        rxVenta.Close;
        rxVenta.EmptyTable;
        rxVenta.Open;
        Totales.EmptyTable;
      end;
    end;
  end;
end;

procedure TfrmProcOrdCompraN.DBEdit1Exit(Sender: TObject);
//var
//  guardarRec : TBookMark;
begin
  if rxVenta.State In [dsInsert, dsEdit] then
  begin
    rxVentaDescUnidadMedida.Value:=cboxTipoUnidad.Text;
    if (rxVentaCant.Value > qryProductosCANTIDAD.Value) and (GlbPermiteVentaInv0 = 0) then
    begin
      MessageDlg('Cantidad venta es mayor que existencia inventario', mtWarning, [mbOK], 0);
      DBEdit1.SetFocus;
      exit;
    end;

    if (rxVentaCant.Value < 0) then
    begin
      MessageDlg('Cantidad no puede ser numero negativo, verifique',mtError, [mbOK], 0);
      DBEdit1.SetFocus;
      exit;
    end;
    rxVentaMontoBruto.Value:= rxVentaCant.Value * rxVentaPrecio.Value;
    if EsDevolucion then
    rxVentaMontoBruto.Value:=rxVentaMontoBruto.Value * -1;
  end;
  // guardarRec := rxVenta.GetBookmark;
  //Aplica Descuento e Itbis
  GlbNumero:= rxVentaSerie.Value;
  ProcesaCalculos;

  if rxVenta.State In [dsInsert, dsEdit] Then
  rxVenta.Post;
  //ProcesaNuevo;
  edtCodigo.SelectAll;
  edtCodigo.ClearSelection;

  //if frmProcVentaRapida.Showing then
  if isShowing then
  edtCodigo.SetFocus;

  panel2.Visible := False;

  //BitBtn1.SetFocus;
  //if frmProcVentaRapida.Showing then
  if isShowing then
  if (GlbPermiteCambioPrecio ) then //Adm
  begin
    DBEdit2.ReadOnly := False;
    DBEdit2.SetFocus;
  end else ProcesaCalculos;
 // rxVenta.GotoBookmark(guardarRec);
 // rxVenta.FreeBookmark(guardarRec);
end;

procedure TfrmProcOrdCompraN.BitBtn2Click(Sender: TObject);
begin
//tj   if Not Entro And GlbPermiteCambioPrecio then
//tj   begin
    BitBtn10Click(Self);
//tj     rxVentaPrecio.Value:= rxqryInvPRECIO.Value;
//tj     DBEdit5Exit(Self);
//tj   end else
//tj   begin
//tj     rxVenta.Edit;
//tj     rxVentaPrecio.Value:= rxqryInvPRECIO.Value;
//tj   end;
  TipoVenta:='CONTADO';
  if rxVenta.State In [dsInsert, dsEdit] Then
  begin
    if rxVentaCodArticulo.IsNull Or rxVentaCant.IsNull Or rxVentaPrecio.IsNull then
    rxVenta.Cancel else
    rxVenta.Post;
  end;
  if rxVenta.RecordCount > 0 then
  //  if frmProcVentaRapida.Showing then
  if isShowing then
  Edit1.SetFocus;
end;

procedure TfrmProcOrdCompraN.rxVentaAfterPost(DataSet: TDataSet);
//var
//  GuardarRec : TBookMark;
begin
//  GuardarRec := rxVenta.GetBookmark;
  if sumarDatos then
  begin
    ProcesarSumaTotal;
    rxVenta.EnableControls;
    rxdbgrid2.EnableScroll;
    //rxdbgrid2.Enabled:=true;
  end;

//  rxVenta.GotoBookmark(GuardarRec);
//  rxVenta.FreeBookmark(GuardarRec);
end;

procedure TfrmProcOrdCompraN.ProcesarSumaTotal;
var
  monto:Extended;
  itbis, descuento, neto: Extended;
  puerto, linea1, linea2 : String;
begin
  if rxVenta.state <> dsBrowse then Exit;
  rxVenta.DisableControls;
  rxVenta.First;
  Monto:=0; Itbis:=0; Descuento:=0; Neto:=0;
  //rxVenta.Edit;
  //rxVentaMontoItbisEnPrecio.Value:=0;
  //rxVenta.Post;
  While Not rxVenta.Eof do
  begin
    Monto := Monto + rxVentaMontoBruto.Value;
    Itbis := itbis + rxVentaItbi.Value;
    Descuento:= descuento + rxVentaMontoDescuento.Value;
    Neto     := Neto + rxVentaMontoNeto.Value;
    rxVenta.Next;
  end;
  rxVenta.EnableControls;
  //EditN1.Text:=InsertarComa(FloatToStr(Monto));

  //EdtMontoDesc.Text := InsertarComa(FloatToStr(Descuento));
  //edtTotalNeto.Text := InsertarComa(FloatToStr(Neto));
  //edtItbis.Text     := InsertarComa(FloatToStr(Itbis));

  Totales.Edit;
  TotalesSubTotal.Value     := Monto;
  Totalesitbis.Value        := Itbis;
  Totalesmontodesc.Value    := Descuento;
  {if not EsFactura or not EsFinanciamiento then
    if (Totalesmontorecibido.Value < Neto) then
  begin
    MessageDlg('Monto recibido no puede ser menor que Neto, verifique',mtInformation, [mbOK], 0);
  end;}
  if EsFactura or EsFinanciamiento then
  begin
    if (Totalesmontorecibido.Value < Neto) then
    Totalestotalneto.Value := Neto - Totalesmontorecibido.Value +
    TotalesMontoInteres.Value
    else Totalestotalneto.Value   := Totalesmontorecibido.Value - Neto  +
    TotalesMontoInteres.Value;
  end else Totalestotalneto.Value := Neto;

  Totales.Post;

  if chkDisplay.Checked then
  begin
    puerto:='1';
    linea1:= '*** Total  Venta ***';
    linea2:=Format('%8.2f',[Totalestotalneto.Value]);
    WinExec(PChar('_display "'+puerto +'" "'+ linea1 +
    '" "'+ linea2 +'"'),SW_HIDE);
  end;
end;

procedure TfrmProcOrdCompraN.Edit1Exit(Sender: TObject);
var
  x,y : Real;
  Activa : Boolean;
  svalue : String;
  xvalue : String;
begin

  Activa:=True;
  if Edit1.text = '' then exit;
  x := StrToFloat(Edit1.Text);

  xvalue := Format('%8.2f', [StrToFloat(Edit1.Text)]);
  svalue := Format('%8.2f', [Totalestotalneto.Value]);
  x:= StrToFloat(xvalue);
  y:= StrToFloat(svalue);
  if (xvalue = svalue) then
  Activa:=True
  else
  if ((x - y) > 0 ) then
  begin
    Activa := False;
  end else Activa := True;

  x := StrToFloat(xvalue) - StrToFloat(svalue);
  Totales.Edit;
  BitBtn4.Enabled := True;
  if Not EsFactura Or Not EsFinanciamiento then
    if (x < -0.01 ) then
    begin
      MessageDlg('Monto entregado es menor que total a pagar, verifique',mtInformation, [mbOK], 0);
      Edit1.SetFocus;
      BitBtn4.Enabled := False;
      Exit;
    end;
  Totalesmontorecibido.AsString := Edit1.Text;
  if (x > 0) then
  Totalesdevolucion.Value := x;
  Totales.Post;

  //if Activa then
  //begin
    BitBtn4.Enabled := True;
    BitBtn4.SetFocus;
  //end;
end;

procedure TfrmProcOrdCompraN.edtCodigoEnter(Sender: TObject);
begin
  edtCodigo.SelectAll;
end;

procedure TfrmProcOrdCompraN.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var
    xxxx : word; item : String;
begin
  //113-F2 f4-115   f5-116     f3-114
  xxxx:= key;
  if (key = 122) then //F11
  begin
    if MessageDlg('Desea guardar venta?',mtWarning,[mbyes,mbno],0) = mryes then
    RxSpeedButton1Click(Self);
    exit;
  end;
  if (key = 123) then //F12
  begin
    NoGenerarNCF1Click(Self);
  end;
  if (key = 120) then
  BitBtn5Click(self);
  
  if (key = 27) then
  begin
    if MessageDlg('Cerrar ventana?', mtInformation, [mbYes,mbNo], 0) = mryes then
    Close;
  end;
  if (key = 121) then //F10
  LectorCodBarra1Click(Self);
  //lectorcodbarra1.Checked:= not lectorcodbarra1.Checked;
  
  if (key = 118) then //F7
  BuscarCliente1Click(Self)
  else if (key = 117) then
  CheckBox1.checked:= Not CheckBox1.checked;
  if (key = 113) then
  begin
    edtCodigo.SetFocus;
    Exit;
  end;
  if (key = 115) then
  BitBtn3Click(Self) else
  if (key = 113) then BitBtn1Click(Self)
  else if (key = 114) then BitBtn2Click(Self)
  else if (key = 116) then
  if (Edit1.Text <> '') then
  BitBtn4Click(Self)
  else if (key = 119) then //F9
  begin
    if rxVenta.State = dsBrowse then
    begin
      item:=InputBox('Borrar un item','Entre número item a eliminar','');
      if rxVenta.Locate('Serie', strToInt(item),[]) then
      rxVenta.Delete;
      ProcesarSumaTotal;
  end;
  end;
end;

procedure TfrmProcOrdCompraN.rxVentaBeforePost(DataSet: TDataSet);
begin
  if rxVentaCant.IsNull or rxVentaPrecio.IsNull then
  begin
    DataSet.Cancel;
    //if frmProcVentaRapida.Showing then
    if isShowing then
    BitBtn1.SetFocus;
  end;
end;

procedure TfrmProcOrdCompraN.BitBtn5Click(Sender: TObject);
begin
  if rxVenta.state = dsbrowse then
  begin
    if VerificaClave then
    begin
      if MessageDlg('Borrar item No.'+rxVentaSerie.AsString+'?',mtWarning, [mbYes,mbNO], 0)=mryes then
      begin
        rxVenta.Delete;
        ProcesarSumaTotal;
      end;
    end;
  end;
end;

procedure TfrmProcOrdCompraN.Inventario1Click(Sender: TObject);
begin
  frmRegMiniInvientario:=tfrmRegMiniInvientario.Create(nil);
  try
    frmRegMiniInvientario.Showmodal;
    if frmRegMiniInvientario.CodigoTexto <> '' then
    edtCodigo.Text:=frmRegMiniInvientario.CodigoTexto;
    edtCodigo.SetFocus;
  finally
  frmRegMiniInvientario.free;
  frmRegMiniInvientario:=nil;
  end;
end;

procedure TfrmProcOrdCompraN.InsertarDet(numero : Integer);
begin
  ibStpInsertVentaDet.Params[0].Value  := Numero;
  ibStpInsertVentaDet.Params[1].Value  := rxVentaCodArticulo.Value;
  ibStpInsertVentaDet.Params[2].Value  := Null;
  ibStpInsertVentaDet.Params[3].Value  := rxVentaDescripcion.Value;
  ibStpInsertVentaDet.Params[4].Value  := rxVentaCant.Value;
  ibStpInsertVentaDet.Params[5].Value  := rxVentaPrecio.Value;
  ibStpInsertVentaDet.Params[6].Value  := rxVentaporc_desc.Value;//descuento
  ibStpInsertVentaDet.Params[7].Value  := rxVentaItbi.Value;//itbi_det
  ibStpInsertVentaDet.Params[8].Value  := rxVentaMontoBruto.Value;
  ibStpInsertVentaDet.Params[9].Value  := rxVentaMontoNeto.Value;
  ibStpInsertVentaDet.Params[10].Value := Null;
  ibStpInsertVentaDet.Params[11].Value := 'A';
  ibStpInsertVentaDet.Params[12].Value := Now;
  ibStpInsertVentaDet.Params[13].Value := Null;
  ibStpInsertVentaDet.Params[14].Value := Null;
  ibStpInsertVentaDet.Params[15].Value := Null;
  ibStpInsertVentaDet.Params[16].Value := Null;
  ibStpInsertVentaDet.Params[17].Value := Null;
  ibStpInsertVentaDet.Params[18].Value := Null;
  ibStpInsertVentaDet.Params[19].Value := Null;
  ibStpInsertVentaDet.Params[20].Value := rxVentaSerieProd.Value;
  ibStpInsertVentaDet.Params[21].Value := rxVentaTipoUnidad.Value;
  ibStpInsertVentaDet.Params[22].Value := rxVentaItbisExento.Value;
  ibStpInsertVentaDet.Params[23].Value := rxVentaTipoVenta.Value;//Item de Venta
  tblProductoSerie.close;
  tblProductoSerie.Params[0].Value := rxVentaSerieProd.Value;
  tblProductoSerie.Open;

  if (tblProductoSerie.RecordCount = 1) then
  begin
    tblProductoSerie.Edit;
    tblProductoSerieSTATUS.Value:='R';
    tblProductoSerie.Post;
    tblProductoSerie.ApplyUpdates;
    if not tblProductoSerie.Transaction.InTransaction then
    tblProductoSerie.Transaction.StartTransaction;
    try
      tblProductoSerie.Transaction.CommitRetaining;
    except
    tblProductoSerie.Transaction.RollbackRetaining;
    end;
  end;
  if (not rxVentaloteNum.IsNull) then
  begin
    ibstpUpdateLote.Params[0].Value:= rxVentaCodArticulo.Value;
    ibstpUpdateLote.Params[1].Value:= rxVentaloteNum.Value;
    ibstpUpdateLote.Params[2].Value:= rxVentaCant.Value;
    ibstpUpdateLote.ExecProc;
  end;
  ibStpInsertVentaDet.ExecProc;

  if (GlbActivaCafeteria = 1) or (GlbActivaProduccion = 1) then
  begin
    dmVentas.qryIngredienteCaf.Close;
    dmVentas.qryIngredienteCaf.Params[0].Value:=rxVentaCodArticulo.Value;
    dmVentas.qryIngredienteCaf.Open;
    dmVentas.qryIngredienteCaf.First;
    dmVentas.tblTransCafeteria.Close;
    dmVentas.tblTransCafeteria.Params[0].Value:= Numero;
    dmVentas.tblTransCafeteria.open;
    while not dmVentas.qryIngredienteCaf.Eof do
    begin
      InsertaTransCafeteria(Numero,dmVentas.qryIngredienteCafCODIGO_PROD.Value,dmVentas.qryIngredienteCafCANT.Value);
      dmVentas.qryIngredienteCaf.Next;
    end;
  end;
end;

procedure TfrmProcOrdCompraN.Ayuda1Click(Sender: TObject);
begin
  ShellExecute(frmProcOrdCompraN.Handle,nil,PChar('C:\Proyectos\PointSaleSoftGold\PuntoVenta\ManualOnline.html'),'','',SW_SHOWNORMAL);
end;

procedure TfrmProcOrdCompraN.ImprimirRecibo1Click(Sender: TObject);
begin
  ImprimirRecibo1.Checked:= Not ImprimirRecibo1.Checked;
end;

procedure TfrmProcOrdCompraN.BitBtn6Click(Sender: TObject);
  var
     Serie_Asignadoncf : Integer;
     serieDoc : Integer;
     valorNCF : String;
begin
//tj   if Not Entro And GlbPermiteCambioPrecio then
//tj   begin
//tj     BitBtn10Click(Self);
//tj     rxVentaPrecio.Value:= rxqryInvPRECIO.Value;
//tj     DBEdit5Exit(Self);
//tj   end;

  xSalir := False;
  EsFinanciamiento := False;
  EsFactura := True;
  serieDoc := 0;
  if tablaPropietario.State In [dsEdit, dsInsert] then
  tablaPropietario.Post;
  if (tablaPropietario.RecordCount = 0) then
  begin
    MessageDlg('Favor seleccionar cliente', mtInformation, [mbOK], 0);
    RxDBLookupCombo1.SetFocus;
    Exit;
  end;

  FrmBuscarClientesPersonas:=TFrmBuscarClientesPersonas.Create(Nil);
  try
    TipoVenta := 'CREDITO';
    xCodigoCte:= -1;

    xCodigoCte := tablaPropietarioCodigoPropietario.Value; //FrmBuscarClientesPersonas.CodigoCliente;

    if (xCodigoCte <= 0) Then Exit;
    if Not  xSalir Then
    begin
      if xCodigoCte > 0 then
      begin
        if Totales.State = dsbrowse then Totales.Edit;
        TotalesCodCliente.Value:= xCodigoCte;

        qryProveedores.Locate('CODIGO_CTE',xCodigoCte,[]);
        TotalesNombreCliente.Value := qryProveedoresDESCRIPCION.Value;
        TotalesDireccion.Value     := qryProveedoresCALYYNUM.Value;
        TotalesTelefono.Value      := qryProveedoresTELEFONO.Value;
        TotalesCodCliente.Value    := qryProveedoresCODIGO_CTE.Value;
        TotalesRNC_NUMERO.Value    := qryProveedoresRNC_PROVEEDOR.Value;
        //if (Not qryClienteCANT_DIAS_CREDITO.IsNull) And (qryProveedoresCANT_DIAS_CREDITO.Value > 0) Then
        //TotalesFechaVence.Value    := GlbFechaTrnDiaria + qryProveedoresCANT_DIAS_CREDITO.Value
        //else
        TotalesFechaVence.Value    := GlbFechaTrnDiaria + 30;//Default
        Totales.Post;

        rxSolDatoscte.Close;
        rxSolDatoscte.Open;
        rxSolDatoscte.Insert;
        rxSolDatoscteNombre.Value    := qryProveedoresDESCRIPCION.Value;
        rxSolDatoscteDireccion1.Value:= qryProveedoresCALYYNUM.Value;
        rxSolDatoscteDireccion2.Value:= '';
        //rxSolDatosctencfDescripcion.Value := aquis123aquis

        if qryProveedoresRNC_PROVEEDOR.IsNull then
           rxSolDatoscteCedula.Value := null
        else
        rxSolDatoscteCedula.Value    := qryProveedoresRNC_PROVEEDOR.Value;

        rxSolDatoscteCiudad.Value    := qryProveedoresCIUDAD.Value;
        rxSolDatoscteTelefono.Value  := qryProveedoresTELEFONO.Value;

        if Length(edtObservacion.Text) > 0 then
        rxSolDatoscteNombre.Value    := edtObservacion.Text;

        if not VerificaLimiteCredito(
                  xCodigoCte,
                  TotalesTotalNeto.Value) then
        begin
          if NoTieneCredito then
          MessageDlg('Cliente no tiene crédito...', mtWarning, [mbOK], 0)
          else
          MessageDlg('Monto contrato excede limite de crédito, depositar diferencia...',mtWarning, [mbOK], 0);
          Exit;
        end;

        CheckBox1.Checked := True;
        ValorNCF := '';
        Serie_Asignadoncf := -1;

        frmSelNCF:=TfrmSelNCF.Create(Nil);
        try
          if NCFSinValorFiscal1.Checked then
          dmFactura.ibQryViewNCF.Locate('TIPO_CF','02',[])
          else dmFactura.ibQryViewNCF.Locate('TIPO_CF','01',[]);
          if (frmSelNCF.ShowModal = mrOK) then
          begin
            if (GlbUsaSecNCF2018 = 0) then
            GlbDescNCF:=dmFactura.ibQryViewNCFDESCRIPCION.Value
            else
            GlbDescNCF:=dmFactura.ibQryViewNCFDESCRIPCION_2018.Value;
            ProcVentaConNCF(dmFactura.ibQryViewNCFTIPO_CF.Value, ValorNCF, serieDoc, serie_asignadoncf);
            ProcVenta(valorNCF, Serie_Asignadoncf,serieDoc);//Aqui voy
            ProcesaFacturar(1, serieDoc, xcodigocte);
            Totales.EmptyTable;
          end else
          begin
            GlbDescNCF:='';
            ProcVenta(ValorNCF,Serie_Asignadoncf,serieDoc);//Aqui voy
            ProcesaFacturar(1, serieDoc, xcodigocte);
            Totales.EmptyTable;
            serieDoc:=-1;
            Serie_Asignadoncf:=-1;
          end;
          finally
          frmSelNCF.Free;
          frmSelNCF:= Nil;
          end;
        end;
    end;//if not xSalir
  finally
  try
    FrmBuscarClientesPersonas.qryPrestamos.Close;
    FrmBuscarClientesPersonas.qryClienteStd.Close;
    FrmBuscarClientesPersonas.Free;
    FrmBuscarClientesPersonas := Nil;
  except
  end;
  end;

  rxVenta.EmptyTable;
  Edit1.Text      := '';
  edtCodigo.Text  := '';
  BitBtn4.Enabled := False;
  Totales.EmptyTable;
  CheckBox1.Checked := False;
  EsDevolucion      := False;
  GlbDescNCF        := '';
  edtCodigo.SetFocus;
  PostMessage(edtCodigo.Handle, WM_SETFOCUS, 0, 0);
  //NoGenerarNCF1Click(Self);
  EsFactura := False;
  tablaPropietario.Edit;
  tablaPropietarioCodigoPropietario.AsVariant := null;
  tablaPropietario.Post;
  ActualizarPreventa;
end;

procedure TfrmProcOrdCompraN.BuscarCliente1Click(Sender: TObject);
begin
  FrmBuscarClientesPersonas:=TFrmBuscarClientesPersonas.Create(Nil);
  try
    xCodigoCte:=-1;
    if FrmBuscarClientesPersonas.Showmodal = mrOk then
    xCodigoCte := FrmBuscarClientesPersonas.CodigoCliente;
  finally
  FrmBuscarClientesPersonas.Free;
  FrmBuscarClientesPersonas:=Nil;
  end;
end;

procedure TfrmProcOrdCompraN.BitBtn8Click(Sender: TObject);
begin
//tj   if Not Entro And GlbPermiteCambioPrecio then
//tj   begin
//tj     BitBtn10Click(Self);
//tj     rxVentaPrecio.Value:= rxqryInvPRECIO.Value;
//tj     DBEdit5Exit(Self);
//tj   end;
        if (xCodigoCte =0) And (tablaPropietarioCodigoPropietario.Value > 0) then
        xCodigoCte := tablaPropietarioCodigoPropietario.Value;

        if Totales.State = dsbrowse then Totales.Edit;
        TotalesCodCliente.Value:= xCodigoCte;
        if xCodigoCte > 0 then
        begin
          qryProveedores.Locate('CODIGO_CTE',xCodigoCte,[]);
          TotalesNombreCliente.Value := qryProveedoresDESCRIPCION.Value;
          TotalesDireccion.Value     := qryProveedoresCALYYNUM.Value;
          TotalesTelefono.Value      := qryProveedoresTELEFONO.Value;
          TotalesCodCliente.Value    := qryProveedoresCODIGO_CTE.Value;
          TotalesRNC_NUMERO.Value    := qryProveedoresRNC_PROVEEDOR.Value;
          Totales.Post;
        end;

  CheckBox1.Checked := True;
  ipStpInsertCotizaMast.Params[1].Value:= GlbFechaTrnDiaria;
  ipStpInsertCotizaMast.Params[2].Value:= GlbFechaTrnDiaria+30;//fecha vence
  if not tablaPropietarioCodigoPropietario.IsNull then
  ipStpInsertCotizaMast.Params[3].Value:= tablaPropietarioCodigoPropietario.Value
  else
  ipStpInsertCotizaMast.Params[3].Value:= 0;//codigo cliente generico mientras tanto
  ipStpInsertCotizaMast.Params[4].Value:= VarUsuarioGlb;
  ipStpInsertCotizaMast.Params[5].Value:= 'Cotizacion';
  ipStpInsertCotizaMast.Params[6].Value:= '1';
  ipStpInsertCotizaMast.Params[7].AsString:= TotalesSubTotal.AsString;//EditN1.Text;
  ipStpInsertCotizaMast.Params[8].Value   := 'A';
  ipStpInsertCotizaMast.Params[9].Value   := Now;
  ipStpInsertCotizaMast.Params[10].AsString := Trim(StrUserName);
  ipStpInsertCotizaMast.Params[11].Value    := Null;
  ipStpInsertCotizaMast.Params[12].Value    := Null;
  ipStpInsertCotizaMast.ExecProc;

  if Not ipStpInsertCotizaMast.Transaction.InTransaction then
  ipStpInsertCotizaMast.Transaction.StartTransaction;
  try
    ipStpInsertCotizaMast.Transaction.CommitRetaining;
  except
  ipStpInsertCotizaMast.Transaction.RollbackRetaining;
  end;

  rxVenta.DisableControls;
  rxVenta.First;
  rxVenta.RecordCount;
  While Not rxVenta.Eof Do
  begin
    InsertarCotizacionDet(ipStpInsertCotizaMast.Params[0].Value);
    rxVenta.Next;
  end;

  rxVenta.First;
  While Not rxVenta.Eof Do
  begin
    rxVenta.Edit;
    rxVentaNumeroRecibo.Value := ipStpInsertCotizaMast.Params[0].Value;
    rxVenta.Post;
    rxVenta.Next;
  end;
  rxVenta.EnableControls;

  if Not ibStpInsertCotizaDet.Transaction.InTransaction then
  ibStpInsertCotizaDet.Transaction.StartTransaction;
  try
    ibStpInsertCotizaDet.Transaction.CommitRetaining;
  except
  ibStpInsertCotizaDet.Transaction.RollbackRetaining;
  end;

  if (GlbCot55Pulg = 1) then
  begin
    qckCotizacion8_55:=TqckCotizacion8_55.Create(nil);
    if Length(edtObservacion.Text) > 0 then
    qckCotizacion8_55.nombreCteGenerico:=edtObservacion.Text
    else 
    if tablaPropietarioCodigoPropietario.value > 0 then
    begin
      //qckCotizacion8_55.qrLabelRNC.Caption:='RNC-' + qryClienteRNC_NUMERO.Value;
      qckCotizacion8_55.nombreCteGenerico:= qryProveedoresDESCRIPCION.Value;
    end;

    //qckCotizacion8_55:=TqckCotizacion8_55.Create(Nil);
    try
      if GlbSizeCotiza8x11 = 1 then
      qckCotizacion8_55.Page.Length := 11;

      qckCotizacion8_55.xtipoVenta := 'COTIZACION';
      if MessageDlg('Imprimir?',mtInformation, [mbyes, mbno], 0) = mrYes then
      qckCotizacion8_55.Print else qckCotizacion8_55.Preview;
    finally
    qckCotizacion8_55.free;
    qckCotizacion8_55:=nil;
    end;
  end else
  begin
  qckRepRecibo:=TqckRepRecibo.Create(Nil);
  try
    if Length(edtObservacion.Text) > 0 then
    qckRepRecibo.nombreCteGenerico:=edtObservacion.Text
    else 
    if tablaPropietarioCodigoPropietario.Value > 0 then
    begin
      qryProveedores.Locate('CODIGO_CTE', tablaPropietarioCodigoPropietario.Value,[]);
      qckRepRecibo.qrLabelRNC.Caption:='RNC-' + qryProveedoresRNC_PROVEEDOR.Value;
      qckRepRecibo.nombreCteGenerico:= qryProveedoresDESCRIPCION.Value;
    end;
    qckRepRecibo.xtipoVenta := 'COTIZACION';
    qckRepRecibo.valorNCF:= '';
    if rxVenta.RecordCount > 2 then
    qckRepRecibo.Page.Length:= qckRepRecibo.Page.Length +
    (rxVenta.RecordCount - 2 ) * 0.65;
    if (GlbImpReciboSinPreg = 1) then
    qckRepRecibo.Print else
    if ImprimirRecibo1.Checked then
    begin
      qckRepRecibo.PrinterSetup;
      qckRepRecibo.Print;
    end  else
    qckRepRecibo.Preview;
  finally
  qckRepRecibo.Free;
  qckRepRecibo:=Nil;
  end;
  end;
  rxVenta.EmptyTable;
  Edit1.Text    := '';
  edtCodigo.Text := '';
  BitBtn4.Enabled := False;
  BitBtn1.SetFocus;
  Totales.EmptyTable;
  tablaPropietario.Edit;
  tablaPropietarioCodigoPropietario.AsVariant := null;
  tablaPropietario.Post;
  edtCodigo.SetFocus;
  PostMessage(edtCodigo.Handle, WM_SETFOCUS, 0, 0);
  edtObservacion.Text := '';
  xCodigoCte:=0;
end;

procedure TfrmProcOrdCompraN.InsertarCotizacionDet(numero: Integer);
begin
  //ibStpInsertCotizaDet.Params[0].Value:= Numero;
  ibStpInsertCotizaDet.Params[1].Value  := Numero;
  ibStpInsertCotizaDet.Params[2].Value  := rxVentaCodArticulo.Value;
  ibStpInsertCotizaDet.Params[3].Value  := Null;
  ibStpInsertCotizaDet.Params[4].Value  := rxVentaDescripcion.Value;
  ibStpInsertCotizaDet.Params[5].Value  := rxVentaCant.Value;
  ibStpInsertCotizaDet.Params[6].Value  := rxVentaPrecio.Value;
  ibStpInsertCotizaDet.Params[7].Value  := 0;
  ibStpInsertCotizaDet.Params[8].Value  := 0;//Itbis
  ibStpInsertCotizaDet.Params[9].Value  := rxVentaMontoBruto.Value;
  ibStpInsertCotizaDet.Params[10].Value := rxVentaMontoBruto.Value;
  ibStpInsertCotizaDet.Params[11].Value := 'A';
  ibStpInsertCotizaDet.Params[12].Value := Now;
  ibStpInsertCotizaDet.Params[13].AsString:= Trim(StrUserName);
  ibStpInsertCotizaDet.Params[14].Value   := Null;
  ibStpInsertCotizaDet.Params[15].Value   := Null;
  ibStpInsertCotizaDet.ExecProc;
end;

procedure TfrmProcOrdCompraN.ProcesaCalculos;
var
  porItbi: Real;
begin
  rxVenta.AutoCalcFields:=False;
  if rxVenta.State In [dsEdit, dsInsert] then
  begin
    rxVentaMontoBruto.Value:= rxVentaCant.Value * rxVentaPrecio.Value;
    if EsDevolucion then
    rxVentaMontoBruto.Value:= rxVentaMontoBruto.Value * -1;

    porItbi := FGlbPorcItbi(ExtraerFecha(rxVentaFecha.Value),rxVentaCodArticulo.Value);

    if chkExento.Checked then
    begin
      porItbi:=0;
      rxVentaItbisExento.Value:=1;
    end;
    
    if Not EsDevolucion then
    rxVentaPorc_Desc.Value := qryProductosPORC_DESCUENTO.Value;

    PORC_TRANSP_ITBIS := FGlbPorcItbi(ExtraerFecha(rxVentaFecha.Value), rxVentaCodArticulo.Value)/
                       (1+FGlbPorcItbi(ExtraerFecha(rxVentaFecha.Value),  rxVentaCodArticulo.Value)/100);

    //Transparentar el ITBIS
    if (qryInventarioPAGA_ITBI.Value = 1) And
       ((rxVentaPorc_Desc.Value = 0) Or rxVentaPorc_Desc.IsNull ) And
       (GlbTransparentaITBI = 1) And
       (Not chkExento.Checked) Then
    rxVentaPorc_Desc.Value := PORC_TRANSP_ITBIS;
    //End transparentar itbis

    if rxVentaPorc_Desc.Value > 0 then
    rxVentaMontoDescuento.Value := (rxVentaMontoBruto.Value * rxVentaporc_desc.Value/100)
    else rxVentaMontoDescuento.Value := 0;

    //temporal esta linea es para probar devoluciones
    //if EsDevolucion then
    //rxVentaMontoDescuento.Value:= rxVentaMontoDescuento.Value * -1;
    //final - temporal esta linea es para probar devoluciones

    //t if (TotalesPorcDesAdicional.Value > 0) then
    //t TotalesMontoDescAdicional.Value:= (rxVentaMontoBruto.Value * TotalesPorcDesAdicional.Value / 100);

    rxVentaMontoNeto.Value := rxVentaMontoBruto.Value - rxVentaMontoDescuento.Value;
    //t - TotalesMontoDescAdicional.Value;
    rxVentaitbi.Value:=0;
    if (qryInventarioPAGA_ITBI.Value = 1) And (Not chkExento.Checked) then
    rxVentaitbi.Value:= (rxVentaMontoNeto.Value * porItbi / 100);

    //temporal esta linea es para probar devoluciones
    //if EsDevolucion then
    //rxVentaitbi.Value := rxVentaitbi.Value * -1;
    //temporal esta linea es para probar devoluciones
    if GlbTransparentaITBI = 0 then
    rxVentaMontoNeto.Value:=rxVentaMontoNeto.Value + rxVentaitbi.Value;
    rxVenta.Post;
  end;
  if (TotalesPorcDesAdicional.Value > 0) then
  begin
    Totales.Edit;
    TotalesMontoDescAdicional.Value:= (TotalesSubTotal.Value * TotalesPorcDesAdicional.Value / 100);
    Totales.Post;
    if rxVenta.State = dsBrowse then rxVenta.Edit;
    rxVentaMontoNeto.Value := rxVentaMontoBruto.Value - rxVentaMontoDescuento.Value
                                                  -  TotalesMontoDescAdicional.Value;

    rxVentaitbi.Value:=0;
    if (qryInventarioPAGA_ITBI.Value = 1) And (Not chkExento.Checked) then
    rxVentaitbi.Value:= (rxVentaMontoNeto.Value * porItbi / 100);
    if GlbTransparentaITBI = 0 then
    rxVentaMontoNeto.Value:=rxVentaMontoNeto.Value + rxVentaitbi.Value;
    rxVenta.Post;
  end;
  rxVenta.AutoCalcFields := False;
end;

procedure TfrmProcOrdCompraN.BitBtn9Click(Sender: TObject);
begin
  if (Totalesmontorecibido.Value > 0) and(rxVenta.RecordCount > 0) then
  begin
    MessageDlg('Favor procesar o cancelar venta en progreso', mtInformation, [mbOK], 0);
    Exit;
  end;
  if (totales.RecordCount > 0) then
  begin
    totales.Close;
    totales.Open;
    Edit1.Text:='';
    Totales.Close;
    Totales.Open;
    Totales.Insert;
    TotalesSubTotal.Value:=0;
    Totalesitbis.Value:=0;
    Totalesmontodesc.Value:=0;
    Totalestotalneto.Value:=0;
    Totalesmontorecibido.Value:=0;
    Totalesdevolucion.Value:=0;
    Totales.Post;
    lblProcDev.Visible := False;
  end;
  frmCotizaciones:=TfrmCotizaciones.Create(Nil);
  try
    frmCotizaciones.BitBtn4Click(Self);
    if frmCotizaciones.Showmodal = mrOk then
    begin
      rxVenta.Close;
      rxVenta.Open;
      frmCotizaciones.ibqryCotizacionDet.First;
      While Not frmCotizaciones.ibqryCotizacionDet.Eof do
      begin
        if (frmCotizaciones.ibqryCotizacionDetCANTIDAD.Value > 0)
        and (frmCotizaciones.ibqryCotizacionDetSTATUS_DET.Value = 'A') then
        begin
          //WriteToLog('Post rxVenta - Line 6811');
          rxVenta.Append;
          RxSpeedButton1.Visible:=True;
          ProcCargaDatosCotizacion;
          if rxVenta.state in [dsInsert,dsedit] then
          rxVenta.Post;
          tablaPropietario.Edit;
          tablaPropietarioCodigoPropietario.Value:=
          frmCotizaciones.ibqryCotizacionMasterCODIGO_CTE.Value;
          tablaPropietario.Post;
        end;
        frmCotizaciones.ibqryCotizacionDet.Next;
      end;
    end;
  finally
  frmCotizaciones.Free;
  frmCotizaciones:=Nil;
  end;
end;

procedure TfrmProcOrdCompraN.ProcCargaDatosCotizacion;
begin
  rxVentaSerie.Value := frmCotizaciones.ibqryCotizacionDetSERIE.Value;
  rxVentaFecha.Value := ExtraerFecha(GlbFechaTrnDiaria);
  rxVentaCant.Value  := frmCotizaciones.ibqryCotizacionDetCANTIDAD.Value;
  rxVentaPrecio.Value:= frmCotizaciones.ibqryCotizacionDetPRECIO.Value;
  rxVentaporc_desc.Value := frmCotizaciones.ibqryCotizacionDetPORC_DESC_DET.Value;
  rxVentaDescripcion.Value := frmCotizaciones.ibqryCotizacionDetDESCRIPCION.Value;

  if qryProductos.Locate('CODIGO',frmCotizaciones.ibqryCotizacionDetCODIGO_PROD.Value,[]) then
  rxVentaCodTexto.Value:= qryProductosCODIGO_TEXTO.Value;

  rxVentaItbisExento.Value:=qryProductosPAGA_ITBI.Value;

  rxVentaReferencia.Value := qryProductosREFERENCIA.Value;
  rxVentaInvetariar.Value:= qryProductosINVENTARIAR.Value;
  rxVentaCodArticulo.Value:= frmCotizaciones.ibqryCotizacionDetCODIGO_PROD.AsInteger;
  rxVentaCodUsuario.Value := VarUsuarioGlb;
  ProcesaCalculos;
end;

procedure TfrmProcOrdCompraN.ProcesaFacturar(tipo : smallint; numdoc:Integer; codcte:Integer);
begin
  dmCxc.tblTransCxc.Close;
  dmCxc.tblTransCxc.Params[0].Value:=ExtraerFecha(glbfechatrndiaria);
  dmCxc.tblTransCxc.Params[1].Value:=ExtraerFecha(glbfechatrndiaria);
  dmCxc.tblTransCxc.Params[2].Value:=glbCia_Key;  
  dmCxc.tblTransCxc.Open;
  dmCxc.qryBalanceCtes.Close;
  dmCxc.qryBalanceCtes.Open;
  dmfactura.IBDataSetFacturas.Close;
  dmfactura.IBDataSetFacturas.Open;

  dmfactura.IBDataSetFacturas.Append;
  dmfactura.IBDataSetFacturasNUMERO.Value := numdoc;
  dmfactura.IBDataSetFacturasPORC_ATRASOCXC.Value := GLBPORC_ATRASOCXC;
  dmfactura.IBDataSetFacturasMONEDA.Value := '1';
  dmfactura.IBDataSetFacturasTIPO.Value   := 2;
  dmfactura.IBDataSetFacturasCODIGO_CTE.Value := codcte;
  dmfactura.IBDataSetFacturasFECHA.Value      := ExtraerFecha(GlbFechatrndiaria);
  dmfactura.IBDataSetFacturasDESCRIPCION.Value:= 'Venta';
  dmfactura.IBDataSetFacturasMONTO_FACT.Value := TotalestotalNeto.Value;
  dmfactura.IBDataSetFacturasRCXC.Value       := 'R';
  dmfactura.IBDataSetFacturasSTATUS.Value     := 'P';
  dmfactura.IBDataSetFacturasFECHA_IN.Value   := Now;
  dmfactura.IBDataSetFacturasFECHA_VENCE.Value:= TotalesFechaVence.Value;

  dmfactura.IBDataSetFacturas.Post;
  dmfactura.IBDataSetFacturas.ApplyUpdates;
  if Not dmfactura.IBDataSetFacturas.Transaction.InTransaction then
  dmfactura.IBDataSetFacturas.Transaction.StartTransaction;
  try
    dmfactura.IBDataSetFacturas.Transaction.CommitRetaining;
  except
  dmfactura.IBDataSetFacturas.Transaction.RollbackRetaining;
  end;

  //Inserta factura en tabla factura_pendiente y pone status factura igual a F donde
  //status igual a P
  dmfactura.stpProcInsFactPendiente.Params[0].Value:= ExtraerFecha(GlbFechatrndiaria);
  dmfactura.stpProcInsFactPendiente.Params[1].Value:= ExtraerFecha(GlbFechatrndiaria);
  dmfactura.stpProcInsFactPendiente.Params[2].Value:= '1';
  dmfactura.stpProcInsFactPendiente.Params[3].Value:= '1';
  dmfactura.stpProcInsFactPendiente.ExecProc;

  rxVenta.First;
  //While Not rxVenta.Eof Do
  //begin
  if (Totalestotalneto.Value > 0 ) then
  begin
    dmCxc.tblTransCxc.Insert;
    dmCxc.tblTransCxcCIA_KEY.Value:=GlbCodigoCia;

    dmCxc.tblTransCxcSTATUS.Value := 'A';
    //dmCxc.tblTransCxcconcepto.Value     := 'Pago cuota';
    if (tipo = 1) then
    begin
      dmCxc.tblTransCxcTIPO_DOC.Value := 1; //Factura
      dmCxc.tblTransCxcconcepto.Value := 'Venta';
    end else dmCxc.tblTransCxcTIPO_DOC.Value := 2; //Recibo
    dmCxc.tblTransCxcmoneda.Value  := '1';
    dmCxc.tblTransCxcfecha.Value   := ExtraerFecha(GlbFechatrndiaria);

    dmCxc.tblTransCxccodigo_cliente.Value := TotalesCodCliente.Value;
    dmCxc.tblTransCxccodigo_serv.Value    := 0;
    dmCxc.tblTransCxcNUMERO_DOC.Value     := Numdoc;

    dmCxc.tblTransCxcvalor_documento.Value:= TotalestotalNeto.Value;
    dmCxc.tblTransCxctipo_tranf.Value     := 1;//Debito
    dmCxc.tblTransCxctipo_serv.Value      := 2;//General
    dmCxc.tblTransCxcfecha_in.Value       := Now;
    dmCxc.tblTransCxcIN_POR.Value := StrUserName;
    dmCxc.tblTransCxc.Post;
    dmCxc.tblTransCxc.ApplyUpdates;
    if Not dmCxc.tblTransCxc.Transaction.InTransaction then
    dmCxc.tblTransCxc.Transaction.StartTransaction;
    try
      dmCxc.tblTransCxc.Transaction.CommitRetaining;
    except
    dmCxc.tblTransCxc.Transaction.RollbackRetaining;
    end;
    ActBalaceCteP(tipo);
    end;
  //end;
end;

procedure TfrmProcOrdCompraN.ActBalaceCteP(operacion:smallint);
var
  Monto:Real;
begin
  if (Operacion=2) then
  Monto:=dmcxc.tblTransCxcVALOR_DOCUMENTO.Value*-1
  else Monto:=dmcxc.tblTransCxcVALOR_DOCUMENTO.Value;
  if dmcxc.QrybalanceCtes.Locate('CODIGO;SERVICIO;MONEDA',
     VarArrayOf([dmCxc.tblTransCxccodigo_cliente.Value,
                 dmcxc.tblTransCxcCODIGO_SERV.Value,dmCxc.tblTransCxcMONEDA.Value]),[]) then
  begin
    EditarBalanceP(Monto,Operacion);
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

procedure TfrmProcOrdCompraN.EditarBalanceP(monto:Real);
begin
  dmcxc.qryBalanceCtes.Edit;
  dmcxc.qryBalanceCtesFECHA_BCE.Value:= dmcxc.tblTransCxcFECHA.Value;
  dmcxc.qryBalanceCtesBALANCE_ANT.Value:=dmcxc.qryBalanceCtesBALANCE_ACT.Value;
  dmcxc.qryBalanceCtesBALANCE_ACT.Value:=//+
  dmcxc.qryBalanceCtesBALANCE_ACT.Value + Monto;//dmCxc.tblTransCxcVALOR_DOCUMENTO.Value;
  dmcxc.qryBalanceCtesDEBITO_MES.Value:=//+
  dmcxc.qryBalanceCtesDEBITO_MES.Value + Monto;//dmCxc.tblTransCxcvalor_documento.Value;
  dmcxc.qryBalanceCtesDEBITO_ACM.Value:=//+
  dmcxc.qryBalanceCtesDEBITO_ACM.Value + Monto;//dmCxc.tblTransCxcvalor_documento.Value;
end;

procedure TfrmProcOrdCompraN.EditarBalanceP(monto:Real;tipo:Integer);
begin
  dmcxc.qryBalanceCtes.Edit;
  dmcxc.qryBalanceCtesFECHA_BCE.Value:= glbFechaTrnDiaria;
  dmcxc.qryBalanceCtesBALANCE_ANT.Value:=dmcxc.qryBalanceCtesBALANCE_ACT.Value;
  if tipo = 1 then
  begin
  dmcxc.qryBalanceCtesBALANCE_ACT.Value:=//+
  dmcxc.qryBalanceCtesBALANCE_ACT.Value + Monto;//dmCxc.tblTransCxcVALOR_DOCUMENTO.Value;
  dmcxc.qryBalanceCtesDEBITO_MES.Value:=//+
  dmcxc.qryBalanceCtesDEBITO_MES.Value + Monto;//dmCxc.tblTransCxcvalor_documento.Value;
  dmcxc.qryBalanceCtesDEBITO_ACM.Value:=//+
  dmcxc.qryBalanceCtesDEBITO_ACM.Value + Monto;//dmCxc.tblTransCxcvalor_documento.Value;
  end else
  begin
  dmcxc.qryBalanceCtesBALANCE_ACT.Value:=//+
  dmcxc.qryBalanceCtesBALANCE_ACT.Value - Monto;//dmCxc.tblTransCxcVALOR_DOCUMENTO.Value;
  dmcxc.qryBalanceCtesCREDITO_MES.Value:=//+
  dmcxc.qryBalanceCtesCREDITO_MES.Value - Monto;//dmCxc.tblTransCxcvalor_documento.Value;
  dmcxc.qryBalanceCtesCREDITO_ACM.Value:=//+
  dmcxc.qryBalanceCtesCREDITO_ACM.Value - Monto;//dmCxc.tblTransCxcvalor_documento.Value;
  end;
  dmcxc.qryBalanceCtesFECHA_MOD.Value:=Now;
  dmcxc.qryBalanceCtesFECHA_ULT_PAGO.Value:=ExtraerFecha(Now);
end;


procedure TfrmProcOrdCompraN.InsertaBalanceP(monto:Real);
begin
  dmcxc.qryBalanceCtes.Insert;
  dmcxc.qryBalanceCtesCODIGO.Value    := TotalesCodCliente.Value;//dmCxc.qryProcServcodigo_cliente.Value;
  dmcxc.qryBalanceCtesSERVICIO.Value  := 0; //dmCxc.qryProcServcodigo_serv.Value;
  dmcxc.qryBalanceCtesMONEDA.Value    := '1';// dmCxc.qryProcServmoneda.Value;

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
  dmcxc.qryBalanceCtesFECHA_BCE.Value := ExtraerFecha(Now);//dmCxc.qryProcServfecha.Value;
  dmcxc.qryBalanceCtesFECHA_IN.Value  :=Now;
  dmcxc.qryBalanceCtesIN_POR.Value    :=StrUserName;
  if (dmCxc.tblTransCxcTIPO_DOC.Value = 1) or (dmCxc.tblTransCxcTIPO_DOC.Value = 3) then
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
      dmcxc.qryBalanceCtesBALANCE_ACT.Value - monto;//dmCxc.qryProcServVALOR_DOCUMENTO.Value;
      dmcxc.qryBalanceCtesCREDITO_MES.Value:= monto;//dmCxc.qryProcServVALOR_DOCUMENTO.Value;
      dmcxc.qryBalanceCtesCREDITO_ACM.Value:= monto;//dmCxc.qryProcServVALOR_DOCUMENTO.Value;
      dmcxc.qryBalanceCtesFECHA_ULT_PAGO.Value:= now;       //dmCxc.qryProcServfecha.Value;
    end;
  end;
end;

procedure TfrmProcOrdCompraN.ProcVentaConNCF(tiponcf:String;var ValorNCF:String;var seriedoc:Integer; var serie_asignadoncf : Integer);
begin
  //Generar y Asignar Numero de Comprobante Fiscal
  valorNCF:='';
  serieDoc:= -1;//indica que no se generó el NCF

  if CheckBox1.Checked then
  begin
    if GLBActivaecf = 1 then
    begin
    frmAsignareCFVenta:=tfrmAsignareCFVenta.Create(nil);
    try
      frmAsignareCFVenta.IBDataSet1.Close;
      frmAsignareCFVenta.IBDataSet1.Open;
      frmAsignareCFVenta.IBDataSet1.Insert;
      frmAsignareCFVenta.IBDataSet1FECHA_INSERT.Value := Now;
      frmAsignareCFVenta.IBDataSet1FECHA.Value := ExtraerFEcha(GlbFechaTrnDiaria);
      frmAsignareCFVenta.IBDataSet1CODIGO_USUARIO.Value := VarUsuarioGlb;
      frmAsignareCFVenta.IBDataSet1STATUS.Value := 'A';

      frmAsignarNCFVenta.IBDataSet1TIPO_NCF.Value := tipoNCF;
      frmAsignarNCFVenta.BitBtn13Click(Self);

      frmAsignarNCFVenta.Asginarncf := frmAsignareCFVenta.ncfGenerado;

      GlbDescNCF := frmAsignarNCFVenta.descNCF;
      frmAsignareCFVenta.IBDataSet1NUMERO_eCF.Value := frmAsignareCFVenta.ncfGenerado;//rxVentaNCF.Value;
      frmAsignareCFVenta.IBDataSet1MONTO.Value      := Totalestotalneto.Value; //StrToFloat(EditN1.Text);

      frmAsignareCFVenta.BitBtn4Click(Self); //Guardar

      if (frmAsignareCFVenta.ncfGenerado = '') then
      begin
        if MessageDlg('NCF no fue generado, desea continuar?',mtWarning, [mbyes,mbno], 0) = mrNO then
        Exit;
      end;

      serie_asignadoncf := frmAsignareCFVenta.IBDataSet1SERIE.Value;
      serieDoc:= FsqlMaxNumeroFactura('gen_num_factura');//FsqlMaxNumero('facturas','numero');

      if (serieDoc = 0) then
      serieDoc:=1;

      valorNCF:= frmAsignareCFVenta.ncfGenerado;

      if Totales.State = dsBrowse then
      Totales.Edit;

      if Totales.State In [dsInsert, dsEdit] then
      begin
        Totales.Edit;
        Totalesncf_numero.Value := valorNCF;
        TotalesqrLabelNcfDesc.Value:=GlbDescNCF;
        Totales.Post;
      end;
    finally
    frmAsignareCFVenta.free;
    frmAsignareCFVenta:=nil;
    end;
    end else
    begin
    frmAsignarNCFVenta:=tfrmAsignarNCFVenta.Create(nil);
    try
      frmAsignarNCFVenta.IBDataSet1.Close;
      frmAsignarNCFVenta.IBDataSet1.Open;
      frmAsignarNCFVenta.IBDataSet1.Insert;
      frmAsignarNCFVenta.IBDataSet1FECHA_INSERT.Value := Now;
      frmAsignarNCFVenta.IBDataSet1FECHA.Value := ExtraerFEcha(GlbFechaTrnDiaria);
      frmAsignarNCFVenta.IBDataSet1CODIGO_USUARIO.Value := VarUsuarioGlb;
      frmAsignarNCFVenta.IBDataSet1STATUS.Value := 'A';

      frmAsignarNCFVenta.IBDataSet1TIPO_NCF.Value := tipoNCF;
      frmAsignarNCFVenta.BitBtn13Click(Self);

      frmAsignarNCFVenta.Asginarncf := frmAsignarNCFVenta.ncfGenerado;

      GlbDescNCF := frmAsignarNCFVenta.descNCF;
      frmAsignarNCFVenta.IBDataSet1NUMERO_NCF.Value := frmAsignarNCFVenta.ncfGenerado;//rxVentaNCF.Value;
      frmAsignarNCFVenta.IBDataSet1MONTO.Value      := Totalestotalneto.Value; //StrToFloat(EditN1.Text);

      frmAsignarNCFVenta.BitBtn4Click(Self); //Guardar

      if (frmAsignarNCFVenta.ncfGenerado = '') then
      begin
        if MessageDlg('NCF no fue generado, desea continuar?',mtWarning, [mbyes,mbno], 0) = mrNO then
        Exit;
      end;

      serie_asignadoncf := frmAsignarNCFVenta.IBDataSet1SERIE.Value;
      serieDoc:= FsqlMaxNumeroFactura('gen_num_factura');//FsqlMaxNumero('facturas','numero');

      if (serieDoc = 0) then
      serieDoc:=1;

      valorNCF:= frmAsignarNCFVenta.ncfGenerado;

      if Totales.State = dsBrowse then
      Totales.Edit;

      if Totales.State In [dsInsert, dsEdit] then
      begin
        Totales.Edit;
        Totalesncf_numero.Value := valorNCF;
        TotalesqrLabelNcfDesc.Value:=GlbDescNCF;
        Totales.Post;
      end;
    finally
    frmAsignarNCFVenta.free;
    frmAsignarNCFVenta:=nil;
    end;
    end;
  end;//Fin if CheckBox1.Checked then
end;

procedure TfrmProcOrdCompraN.RxDBGrid2DblClick(Sender: TObject);
begin
  //edtCodigo.Text:= frmProcVentaRapida.rxqryInvCodigo_texto.Value;
  edtCodigo.Text := qryProductosCodigo_texto.Value;
  panel2.Visible := False;
  Prod_existe    := False;
  //t DBEdit1.SetFocus;
  if frmProcOrdCompraN.Showing and cboxTipoUnidad.Visible then
  cboxTipoUnidad.SetFocus;
  edtCodigoExit(Self);
end;

procedure TfrmProcOrdCompraN.DBEdit1Enter(Sender: TObject);
begin
  yNumSerie:= rxVentaSerie.Value;
  if (rxVentaCodTexto.Value = '') then exit;
  if Not Prod_existe and ((rxVenta.State in [dsEdit, dsInsert]) or (rxVenta.RecordCount > 0)) then
  begin
    if qryProductos.Locate('codigo_Texto', rxVentaCodTexto.Value,[]) then
    begin
      Prod_existe:=True;
    end else
    begin
      MessageDlg('codigo producto no encontrado, verifique', mtInformation, [mbOK], 0);
      edtCodigo.SetFocus;
      PostMessage(edtCodigo.Handle, WM_SETFOCUS, 0, 0);
      Exit;
    end;
  end;
  //ProcesaCalculos;
  Panel2.Visible:=False;
end;

procedure TfrmProcOrdCompraN.BitBtn10Click(Sender: TObject);
begin
  if (rxVenta.RecordCount >  0) then
  begin
    Totales.Edit;
    rxVenta.Edit;
    DBEdit5.SetFocus;
  end;
end;

procedure TfrmProcOrdCompraN.DBEdit5Exit(Sender: TObject);
begin
  if Totales.State in [dsedit, dsinsert] then
  begin
    ProcesaCalculos;
    if Totales.State in [dsedit, dsinsert] then
    Totales.Post;
  end;

end;

procedure TfrmProcOrdCompraN.BitBtn11Click(Sender: TObject);
var
  frecuencia:string;
  serieDoc:Integer;
  muestraVentana:boolean;
begin
  //BitBtn6Click(Self);//Facturar;
  //if xSalir then Exit;
  xSalir:=False;
  EsFinanciamiento := True;
  muestraVentana:=True;
  xCodigoCte:=-1;
  if Not tablaPropietarioCodigoPropietario.IsNull then
  begin
    xCodigoCte := tablaPropietarioCodigoPropietario.Value;
    muestraVentana:=false;
  end;

  if Not Assigned(FrmBuscarClientesPersonas) Then
  FrmBuscarClientesPersonas:=TFrmBuscarClientesPersonas.Create(Nil);
  try
    TipoVenta:='CREDITO';
    if  muestraVentana then
    begin
      if FrmBuscarClientesPersonas.Showmodal = mrOk then
      begin
        xCodigoCte := FrmBuscarClientesPersonas.CodigoCliente;
      end else
      begin
        xSalir:=True;
      {FrmBuscarClientesPersonas.Free;
      FrmBuscarClientesPersonas := Nil;}
      end;
    end;

    //if FrmBuscarClientesPersonas.Showmodal = mrOk then
    //begin
    //  xCodigoCte := FrmBuscarClientesPersonas.CodigoCliente;
    if Not xSalir then
    begin
      if xCodigoCte > 0 then
      begin
        if Totales.State = dsbrowse then Totales.Edit;
        TotalesCodCliente.Value:= xCodigoCte;
        FrmBuscarClientesPersonas.qryClienteStd.Close;
        FrmBuscarClientesPersonas.qryClienteStd.Open;
        if FrmBuscarClientesPersonas.qryClienteStd.State = dsBrowse then
        begin
          FrmBuscarClientesPersonas.qryClienteStd.Locate('codigo_cte', xCodigoCte,[]);
          TotalesNombreCliente.Value := FrmBuscarClientesPersonas.qryClienteStdNOMBRE_CTE.Value;
          TotalesDireccion.Value     := FrmBuscarClientesPersonas.qryClienteStdDIRECCION_CONT.Value;
          TotalesTelefono.Value      := FrmBuscarClientesPersonas.qryClienteStdTELEF_CONTACTO.Value;
          TotalesRNC_NUMERO.Value    := FrmBuscarClientesPersonas.qryClienteStdRNC_NUMERO.Value;
        end else if FrmBuscarClientesPersonas.qryPrestamos.State = dsBrowse then
        begin
          FrmBuscarClientesPersonas.qryPrestamos.Locate('codigo_cte', xCodigoCte,[]);
          TotalesNombreCliente.Value := FrmBuscarClientesPersonas.qryPrestamosNOMBRE_CTE.Value;
          TotalesDireccion.Value     := FrmBuscarClientesPersonas.qryPrestamosDIRECCION_CONT.Value;
          TotalesTelefono.Value      := FrmBuscarClientesPersonas.qryPrestamosTELEF_CONTACTO.Value;
          TotalesRNC_NUMERO.Value    := FrmBuscarClientesPersonas.qryPrestamosRNC_NUMERO.Value;
        end;
        Totales.Post;

        CheckBox1.Checked:=True;

        frmFinanciamiento:=TfrmFinanciamiento.Create(Nil);

        frmFinanciamiento.rxLabelNombreCliente.Caption := TotalesNombreCliente.Value;
        frmFinanciamiento.xCodigocliente := xCodigoCte;
        frmFinanciamiento.qryFinancAbiertos.Close;
        frmFinanciamiento.qryFinancAbiertos.Params[0].Value:= xCodigoCte;
        frmFinanciamiento.qryFinancAbiertos.Open;
        //frmFinanciamiento.xNumeroTrn := SerieDoc;
        frmFinanciamiento.rxDatosFinanc.Insert;
        frmFinanciamiento.rxDatosFinancMontoAFinanciar.Value:= Totalestotalneto.Value;
        frmFinanciamiento.rxDatosFinancMontoInicial.Value:=0;
        //frmFinanciamiento.rxDatosFinancMontoInicial.Value:= Totalestotalneto.Value
        //- Totalesmontorecibido.Value;// - TotalesMontoInteres.Value;

        frmFinanciamiento.ShowModal;
        if frmFinanciamiento.rxDatosFinanc.RecordCount > 0 then
        begin
          Totales.Edit;
          TotalesMontoInteres.Value :=
          frmFinanciamiento.rxDatosFinancMontoInteres.Value *
          frmFinanciamiento.rxDatosFinanccantCuotas.Value;
          Totalesmontorecibido.Value :=frmFinanciamiento.rxDatosFinancMontoInicial.Value;
          TotalestotalNeto.Value  := frmFinanciamiento.rxDatosFinancMontoFinanciado.Value;
          Totales.Post;
        end;
    end else
    begin
      MessageDlg('Financiamiento cancelado.',mtInformation, [mbok], 0);
    end;
      //ProcesaFacturar(tipo : smallint;numdoc:integer;codcte:integer);
  end;//if not xSalir
    //end;
  finally
  //try
  //  FrmBuscarClientesPersonas.qryPrestamos.Close;
  //  FrmBuscarClientesPersonas.qryClienteStd.Close;
  //  FrmBuscarClientesPersonas.Free;
  //FrmBuscarClientesPersonas:=Nil;
  //except
  //end;
  end;

  //rxVenta.EmptyTable;
  //Edit1.Text      := '';
  //edtCodigo.Text  := '';
  //BitBtn4.Enabled := False;
  //Totales.EmptyTable;
  //CheckBox1.Checked:=false;
  //edtCodigo.SetFocus;
  if TotalesMontoInteres.Value > 0 then
  begin
    BitBtn12.Enabled:= True;
    BitBtn12.SetFocus;
    Label17.Visible := True;
    DBText6.Visible := True;
    BitBtn11.Enabled:=False;
    tablaPropietario.Edit;
    tablaPropietarioCodigoPropietario.AsVariant := null;
    tablaPropietario.Post;
  end;
end;

function TfrmProcOrdCompraN.FncFrecuencia(Frec: Integer): String;
begin
  case Frec of
  30 : result:='Mes(es)';
  15 : result:='Quincena(s)';
  07 : result:='Semana(s)';
  01 : result:='Dia(s)';
  else Result:= 'tiempo ind';
  end;
end;

procedure TfrmProcOrdCompraN.BitBtn12Click(Sender: TObject);
var
 serieDoc:Integer;
 frecuencia:string;
 ValorNCF : String;
 serie_asignadoncf : Integer;
 xgenNcf : Boolean;
begin
  BitBtn11.Enabled:=True;
  frmSelNCF:=TfrmSelNCF.Create(Nil);
  try //aqui prepara para que trabaja sin ncf
    if (frmSelNCF.ShowModal = mrOK) then
    xgenNcf:=True
    else xgenNcf:= false;
  finally
  frmSelNCF.Free;
  frmSelNCF:= Nil;
  end;

  if xGenNCf then
  begin
    ProcVentaConNCF(dmFactura.ibQryViewNCFTIPO_CF.Value, ValorNCF, serieDoc, serie_asignadoncf);
  end else
  begin
    serieDoc:= FsqlMaxNumeroFactura('gen_num_factura');//FsqlMaxNumero('facturas','numero');

    if (serieDoc = 0) then
    serieDoc:=1;
  end;
    ProcVenta(valorNCF, Serie_Asignadoncf,serieDoc);//Aqui voy

    if Totales.State = dsbrowse then Totales.Edit;
    TotalesCodCliente.Value:= xCodigoCte;

    qryProveedores.Locate('CODIGO_CTE',xCodigoCte,[]);
    TotalesNombreCliente.Value := qryProveedoresDESCRIPCION.Value;
    TotalesDireccion.Value     := qryProveedoresCALYYNUM.Value;
    TotalesTelefono.Value      := qryProveedoresTELEFONO.Value;
    TotalesCodCliente.Value    := qryProveedoresCODIGO_CTE.Value;
    TotalesRNC_NUMERO.Value    := qryProveedoresRNC_PROVEEDOR.Value;
    //if (Not qryClienteCANT_DIAS_CREDITO.IsNull) And (qryClienteCANT_DIAS_CREDITO.Value > 0) Then
    //TotalesFechaVence.Value    := GlbFechaTrnDiaria + qryClienteCANT_DIAS_CREDITO.Value
    //else
    TotalesFechaVence.Value    := GlbFechaTrnDiaria + 30;//Default
    Totales.Post;


    ProcesaFacturar(1, serieDoc, xCodigoCte);//xcodigocte);
    rxVenta.First;
    While Not rxVenta.Eof Do
    begin
      rxVenta.Edit;
      rxVentaNumeroFactura.Value:= serieDoc;
      rxVenta.Post;
      rxVenta.Next;
    end;
    if frmFinanciamiento.rxDatosFinanc.State = dsBrowse then
      frmFinanciamiento.rxDatosFinanc.Edit;
      frmFinanciamiento.rxDatosFinancNumeroFactura.Value:=serieDoc;
      //Aqui voy
      frmFinanciamiento.xNumeroTrn := rxVentaNumeroRecibo.Value;//aqui numero ventas master
      frmFinanciamiento.rxDatosFinanc.Post;
      frmFinanciamiento.ProcInsertarDatos;
      qckRepFacturaEstandarNew := TqckRepFacturaEstandarNew.Create(Nil);
      try
        if GlbSizeFact8x11 = 1 then
        qckRepFacturaEstandarNew.Page.Length := 11;

        frecuencia := FncFrecuencia(frmFinanciamiento.tblFrecPagoFRECUENCIA_DIAS.Value);

        qckRepFacturaEstandarNew.xtipoVenta := 'Financiamiento a ' + frmFinanciamiento.rxDatosFinanccantCuotas.AsString+ ' '+ frecuencia;
        qckRepFacturaEstandarNew.valorNCF   := Totalesncf_numero.Value;
        qckRepFacturaEstandarNew.QRLabel14.Caption := 'Monto Inicial';
        if Totales.State = dsBrowse then
        begin
          Totales.Edit;
          TotalesPorcientoInteres.Value:= frmFinanciamiento.rxDatosFinancPorcInteres.Value;
          Totales.Post;
        end else
        if Totales.State in [dsEdit, dsInsert] then
        TotalesPorcientoInteres.Value:= frmFinanciamiento.rxDatosFinancPorcInteres.Value;
        Totalestotalneto.Value;
        if ImprimirRecibo1.Checked then
        begin
          qckRepFacturaEstandarNew.PrinterSetup;
          qckRepFacturaEstandarNew.Print;
        end else
        qckRepFacturaEstandarNew.Preview;
      finally
      qckRepFacturaEstandarNew.Free;
      qckRepFacturaEstandarNew := Nil;
      end;
      Totales.EmptyTable;

    //Reporte Distribucion de cuotas
    frmDistCuotas:=TfrmDistCuotas.create(Nil);
    try
      dmReportes.qryRepFinancDistcuota.Close;
      dmReportes.qryRepFinancDistcuota.Params[0].Value := xCodigoCte;
      dmReportes.qryRepFinancDistcuota.Params[1].Value := serieDoc;
      dmReportes.qryRepFinancDistcuota.Open;
      frmDistCuotas.InsertarCuotas(
      dmReportes.qryRepFinancDistcuotaCANT_CUOTAS.Value,
      dmReportes.qryRepFinancDistcuotaMONTO_CAP_INICIAL.Value,
      dmReportes.qryRepFinancDistcuotaPORCIENTO.Value,
      dmReportes.qryRepFinancDistcuotaFECHA.Value,
      frmFinanciamiento.tblFrecPagoFRECUENCIA_DIAS.Value);
      frmDistCuotas.Showmodal;
    finally
    frmDistCuotas.Free;
    frmDistCuotas:= Nil;
    end;

    frmFinanciamiento.Free;
    frmFinanciamiento:=Nil;
              
  rxVenta.EmptyTable;
  Edit1.Text      := '';
  edtCodigo.Text  := '';
  BitBtn4.Enabled := False;
  Totales.EmptyTable;
  CheckBox1.Checked := False;
  edtCodigo.SetFocus;
  ActualizarPreventa;
end;

procedure TfrmProcOrdCompraN.MostrarVistaproductos1Click(Sender: TObject);
begin
  MostrarVistaproductos1.Checked := Not MostrarVistaproductos1.Checked;
end;

procedure TfrmProcOrdCompraN.BitBtn13Click(Sender: TObject);
begin
  //frmInvXReferencia:=TfrmInvXReferencia.Create(Nil);
  //try
  //  frmInvXReferencia.Showmodal;
  //finally
  //frmInvXReferencia.Free;
  //frmInvXReferencia:=Nil;
  //end;
end;

procedure TfrmProcOrdCompraN.edtReferenciaChange(Sender: TObject);
begin
  if qryProductos.Locate('referencia', edtReferencia.Text, [loCaseInsensitive, loPartialKey]) then
  begin
    Prod_existe:= True;
    edtCodigo.Text := qryProductosCODIGO_TEXTO.Value;
    panel2.Top := edtcodigo.Top+30;
    panel2.Left:= edtcodigo.Left;
    panel2.Visible:=True;
    panel2.BringToFront;
  end
end;

procedure TfrmProcOrdCompraN.edtReferenciaExit(Sender: TObject);
begin
  if Panel2.Visible then
  edtReferencia.Text := qryProductosCodigo_Texto.Value;

  qryProductos.Locate('Referencia', edtReferencia.Text, [loCaseInsensitive, loPartialKey])

end;

procedure TfrmProcOrdCompraN.BitBtn14Click(Sender: TObject);
begin
  DBEdit2.ReadOnly := False;
  if (varTipousuario = 0) then //Adm
  begin
    DBEdit2.ReadOnly := False;
    //tj Entro := True;
    //tj PrecioAnterior := rxVentaPrecio.Value;
    DBEdit2.SetFocus;
  end else
  begin
    if VerificaClave then
    begin
      DBEdit2.ReadOnly := False;
      //tj MontoItbisEnPrecio := 0;
      //tj Entro:=true;
      //tj PrecioAnterior := rxVentaPrecio.Value;
      DBEdit2.SetFocus;
    end;
  end;
end;

procedure TfrmProcOrdCompraN.DBEdit2Exit(Sender: TObject);
var
  guardarRec : TBookMark;
  porcdes : Extended;
begin
   cPrecio:= rxVentaPrecio.Value;
  if DBEdit2.ReadOnly = false then
  begin
  //guardarRec := rxVenta.GetBookmark;
  end;
  
  //Aquiiiiiiiiiiiii
  //tj if (PrecioAnterior <> rxVentaPrecio.Value) And (Entro) And (GlbPermiteCambioPrecio) then
  //tj begin
  //tj   if PrecioAnterior > 0 then
  //tj   porcdes := 1 - (PrecioAnterior - rxVentaPrecio.Value)/PrecioAnterior
  //tj   else porcdes:=0;
  //tj   BitBtn10Click(Self);
  //tj   TotalesPorcDesAdicional.Value:= porcdes;
  //tj   DBEdit5Exit(Self);
  //tj end;{t else
  //tj begin
  //tj   if rxVenta.State In [dsBrowse] Then
  //tj   rxVenta.Edit;
  //tj   rxVentaPrecio.Value:=rxqryInvPRECIO.Value;
  //tj end; }
  if (aPrecio <> cPrecio) then
  PrecioCambio:=True else PrecioCambio:=False;

  ProcesaCalculos;

  if rxVenta.State In [dsInsert, dsEdit] Then
  rxVenta.Post;

  if (DBEdit2.ReadOnly = false) then
  begin
    //rxVenta.GotoBookmark(guardarRec);
    //rxVenta.FreeBookmark(guardarRec);
  end;
  if rxVenta.State = dsBrowse then
  rxVenta.Locate('Serie', yNumSerie,[]);
  if rxVentaCodTexto.Value = '' then Exit;
  if not qryInventario.Locate('CODIGO_TEXTO', rxVentaCodTexto.Value,[]) then
  MessageDlg('codigo '+rxVentaCodTexto.Value+' no encontrado en inventario, verifique', mtError, [mbOK], 0)
  else
  begin
    //if (not FAplicaPrecioMayorista) and (rxVentaPrecio.Value < qryProductosPRECIO_MINIMO.Value) then
    //begin
   //   if MessageDlg('Precio es menor que el minimo, continuar?', mtError, [mbYes,mbNo], 0) = mrno then
    //  begin
    //    DBEdit2.ReadOnly := False;
    //    DBEdit2.SetFocus;
    //    Exit;
    //  end;
    //end;
  end;

  DBEdit2.ReadOnly := True;
  //if frmProcVentaRapida.Showing then
  if isShowing then
  edtCodigo.SetFocus;
end;

function TfrmProcOrdCompraN.VerificaClave: Boolean;
begin
  frmEntrreClave:=TfrmentrreClave.Create(nil);
  if frmEntrreClave.showmodal=mrOk then
  Clave:= frmEntrreClave.Edit1.Text
  else Result := False;
  frmentrreClave.Free;
  frmentrreClave:=Nil;
  if GlbClaveSup <> Encriptar(Trim(clave), 2005) then
  begin
    MessageDlg('Clave incorrecta, verifique', mtError, [mbOK], 0);
    Result := False;
  end else Result := True;
end;

procedure TfrmProcOrdCompraN.DBEdit2Enter(Sender: TObject);
begin
  if (GlbNumero > 0) then
  if rxVenta.State = dsbrowse then
  rxVenta.Locate('Serie', GlbNumero,[]);
  DBEdit2.SelectAll;
  aPrecio:= rxVentaPrecio.Value;
end;

procedure TfrmProcOrdCompraN.chkExentoExit(Sender: TObject);
begin
  if (rxVenta.Recordcount > 1) then
  begin
    SumarDatos := False;
    rxVenta.EnableControls;
    rxVenta.First;
    While Not rxVenta.Eof Do
    begin
      rxVenta.Edit;
      ProcesaCalculos;
      rxVenta.Next;
    end;
    sumarDatos := True;
    rxVenta.Edit;
    rxVenta.Post;
  end else
  begin
    rxVenta.Edit;
    ProcesaCalculos;
    //rxVenta.Post;
  end;
end;

procedure TfrmProcOrdCompraN.RxDBGrid2KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = '#13' then
  RxDBGrid2DblClick(Self);
end;

procedure TfrmProcOrdCompraN.RxDBGrid2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then
  RxDBGrid2DblClick(Self);
end;

procedure TfrmProcOrdCompraN.AsignarSqlText(campo, valor,
  OrderBy: String);
var
  nombProc:string;
begin
  //t rxqryInv.DisableControls;
  qryProductos.DisableControls;
  if qryProductos.Active then
  qryProductos.Close;
  if GlbVenderDesdeAlmacenP = 1 then
  nombProc:='PROC_INV_VENTA_est'
  else
  nombProc:='PROC_INV_VENTA';
  if (campo = '') then
  begin
    sqlAsignado := True;
    {Select INV.*,
    tipo_inv.Descripcion Desc_tipoInv
    From PROC_INV_VENTA_est(1) INV,
    TIPO_INVENTARIO tipo_inv
    Where inv.tipo = tipo_inv.codigo
    ORDER BY codigo, tipo,descripcion, Referencia}

  qryProductos.SQL.Text:=
  Format('Select INV.*, tipo_inv.Descripcion Desc_tipoInv From %s(%s) INV, TIPO_INVENTARIO tipo_inv', [nombProc, IntToStr(GlbCodDivInventario)]) +
  ' Where inv.tipo = tipo_inv.codigo' +' ORDER BY codigo, tipo,descripcion, Referencia';
  end else
  qryProductos.SQL.Text:=
  Format('Select INV.*,tipo_inv.Descripcion Desc_tipoInv  From %s(%s) INV, TIPO_INVENTARIO tipo_inv ' +
        ' WHERE inv.tipo = tipo_inv.codigo AND UPPER(inv.%s) like %s or upper(inv.codigo_texto) like %s',[nombProc, IntToStr(GlbCodDivInventario), Campo, Valor,Valor]) +
        ' ORDER BY codigo, tipo,descripcion, Referencia';
  qryProductos.Open;   
  qryProductos.EnableControls;
end;

procedure TfrmProcOrdCompraN.chkExentoEnter(Sender: TObject);
begin
  chkExento.SetFocus;
end;

procedure TfrmProcOrdCompraN.RxDBGrid2GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if qryProductosCANTIDAD.Value <=5 then
  begin
    BackGround := clYellow;
    aFont.Color := clblack;
  end;
end;

procedure TfrmProcOrdCompraN.BitBtn15Click(Sender: TObject);
var
  tRecordsDet : integer;
begin
  dmCompania.tblCompania.Close;
  dmCompania.tblCompania.Open;
  dmCompania.tblCompania.Locate('codigo',glbCia_Key,[]);
  dmfactura.qryFactReimpMaster.Close;
  dmfactura.qryFactReimpMaster.Params[0].Value:=
  StrToInt(InputBox('Re-Imprimir factura','Entre numero',''));

  dmfactura.qryFactReimpDet.Close;
  dmfactura.qryFactReimpDet.Params[0].Value:=dmfactura.qryFactReimpMaster.Params[0].Value;
  dmfactura.qryFactReimpDet.Open;
  dmfactura.qryFactReimpDet.Last;
  tRecordsDet := dmfactura.qryFactReimpDet.RecordCount;
  dmfactura.qryFactReimpDet.Close;

  dmfactura.qryFactReimpMaster.Open;
  if dmfactura.qryFactReimpMaster.Recordcount > 0 then
  begin

  if (GlbFact55Pulg = 1) then
  begin
      if GlbFacturaLicoreria =1 then
      begin
        qckRepFacturaEstandarNewReimpREsp:=TqckRepFacturaEstandarNewReimpREsp.Create(Nil);
        try
          if GlbSizeFact8x11 = 1 then
          qckRepFacturaEstandarNewReimpREsp.Page.Length := 11;
          qckRepFacturaEstandarNewReimpREsp.xtipoVenta := TipoVenta;
          qckRepFacturaEstandarNewReimpREsp.Prepare;
          glbTPag := qckRepFacturaEstandarNewReimpREsp.PageNumber;
          //qckRepRecibo8_5_11REsp.valorNCF:= GlbDescNCF;//valorNCF;
          if ImprimirRecibo1.Checked then
          begin
            qckRepFacturaEstandarNewReimpREsp.PrinterSetup;
            qckRepFacturaEstandarNewReimpREsp.Print;
          end else
          qckRepFacturaEstandarNewReimpREsp.Preview;
        finally
        qckRepFacturaEstandarNewReimpREsp.Free;
        qckRepFacturaEstandarNewReimpREsp:=Nil;
        end;
      end else
      begin
        qckRepFacturaEstandarNewReimp:=TqckRepFacturaEstandarNewReimp.Create(Nil);
        try
          if GlbSizeFact8x11 = 1 then
          qckRepFacturaEstandarNewReimp.Page.Length := 11;

          qckRepFacturaEstandarNewReimp.Prepare;
          glbTPag := qckRepFacturaEstandarNewReimp.PageNumber;
          
         if MessageDlg('Imprimir?', mtInformation, [mbYes, mbNo], 0) = mrYes then
         begin
           qckRepFacturaEstandarNewReimp.PrinterSetup;
           qckRepFacturaEstandarNewReimp.Print;
         end else
         qckRepFacturaEstandarNewReimp.Preview;
        finally
        qckRepFacturaEstandarNewReimp.Free;
        qckRepFacturaEstandarNewReimp:=Nil;
        end;
      end;
  end
  else
  begin
    qckRepFactPuntoVenta:=TqckRepFactPuntoVenta.Create(Nil);
    try
      if tRecordsDet > 2 then
      qckRepFactPuntoVenta.Page.Length:= qckRepFactPuntoVenta.Page.Length +
      (tRecordsDet - 1 ) * 74;
      if ImprimirRecibo1.Checked then
      qckRepFactPuntoVenta.Print else
      qckRepFactPuntoVenta.Preview;
    finally
    qckRepFactPuntoVenta.Free;
    qckRepFactPuntoVenta:=Nil;
    end;
  end;
  end else
  MessageDlg('Numero factura no econtrado verifique',mtInformation, [mbOK], 0);
{  dmCompania.tblCompania.Close;
  dmCompania.tblCompania.Open;
  dmfactura.qryFactReimpMaster.Close;
  dmfactura.qryFactReimpMaster.Params[0].Value:=
  StrToInt(InputBox('Re-Imprimir factura','Entre numero',''));
  dmfactura.qryFactReimpMaster.Open;
  if dmfactura.qryFactReimpMaster.Recordcount > 0 then
  begin

  if (GlbFact55Pulg = 1) then
  begin
    qckRepFacturaEstandarNewReimp:=TqckRepFacturaEstandarNewReimp.Create(Nil);
    try
      if GlbSizeFact8x11 = 1 then
      qckRepFacturaEstandarNewReimp.Page.Length := 11;
      //else
      //qckRepFacturaEstandarNewReimp.Page.PaperSize :=
      if MessageDlg('Imprimir?', mtInformation, [mbYes, mbno], 0) = mryes then
      begin
        qckRepFacturaEstandarNewReimp.PrinterSetup;
        qckRepFacturaEstandarNewReimp.Print;
      end else
      qckRepFacturaEstandarNewReimp.Preview;
    finally
    qckRepFacturaEstandarNewReimp.Free;
    qckRepFacturaEstandarNewReimp:=Nil;
    end;
  end
  else
  begin
    qckRepRecibo:=TqckRepRecibo.Create(Nil);
    try
      if Length(edtObservacion.Text) > 0 then
      qckRepRecibo.nombreCteGenerico:=edtObservacion.Text
      else
      if tablaPropietarioCodigoPropietario.Value > 0 then
      begin
        qryCliente.Locate('CODIGO_CTE', tablaPropietarioCodigoPropietario.Value,[]);
        qckRepRecibo.qrLabelRNC.Caption:='RNC-' + qryClienteRNC_NUMERO.Value;
        qckRepRecibo.nombreCteGenerico:= qryClienteNOMBRE_CTE.Value;
      end;
      qckRepRecibo.xtipoVenta := 'COTIZACION';
      qckRepRecibo.valorNCF:= '';
      if rxVenta.RecordCount > 2 then
      qckRepRecibo.Page.Length:= qckRepRecibo.Page.Length +
      (rxVenta.RecordCount - 2 ) * 0.65;
      if ImprimirRecibo1.Checked then
      begin
        qckRepRecibo.PrinterSetup;
        qckRepRecibo.Print;
      end else
      qckRepRecibo.Preview;
    finally
    qckRepRecibo.Free;
    qckRepRecibo:=Nil;
    end;
  end;
  end else
  MessageDlg('Numero factura no econtrado verifique',mtInformation, [mbOK], 0);
  }
end;

procedure TfrmProcOrdCompraN.FormShow(Sender: TObject);
begin
  ProcActUltTrn;
  isShowing:=True;
  if (GlbActivaCafeteria = 1) or (GlbActivaProduccion = 1) then
  label26.Visible:=True
  else label26.Visible:=False;
end;

procedure TfrmProcOrdCompraN.RxLabel1Click(Sender: TObject);
begin
  ProcActUltTrn;
end;

procedure TfrmProcOrdCompraN.ProcVenta(valorNCF:String;Serie_Asignadoncf:Integer; Var serieDoc:Integer);
begin
  if (seriedoc <= 0 ) then
  begin
    serieDoc:= FsqlMaxNumeroFactura('gen_num_factura');//FsqlMaxNumero('facturas','numero');
    if (serieDoc = 0) then
    serieDoc:=1;
  end;
  //if (GlbUsaFctMexico = 1) and (not TotalesFechaIniciaPoliza.IsNull) then
  //ipStpInsertVentMast.Params[1].Value := ExtraerFecha(TotalesFechaIniciaPoliza.Value)
  //else
  //ipStpInsertVentMast.Params[1].Value := ExtraerFecha(GlbFechaTrnDiaria);

  ipStpInsertVentMast.Params[1].Value:= GlbFechaTrnDiaria;
  ipStpInsertVentMast.Params[2].Value:=GlbCodigoCia;
  if Not tablaPropietarioCodigoPropietario.IsNull then
  ipStpInsertVentMast.Params[3].Value      := tablaPropietarioCodigoPropietario.Value
  else ipStpInsertVentMast.Params[3].Value := 0;//Generico

  ipStpInsertVentMast.Params[4].Value    := VarUsuarioGlb;
  //Asignar tipo Venta
  ipStpInsertVentMast.Params[5].Value    := 7;//Credito Normal

  ipStpInsertVentMast.Params[6].Value    := 'Venta a Credito';
  ipStpInsertVentMast.Params[7].Value    := '1';
  ipStpInsertVentMast.Params[8].AsString := Totalestotalneto.AsString; //EditN1.Text;
  ipStpInsertVentMast.Params[9].Value    := 'A';
  ipStpInsertVentMast.Params[10].Value    := Now;
  ipStpInsertVentMast.Params[11].Value   := Null;
  ipStpInsertVentMast.Params[12].Value   := Null;
  ipStpInsertVentMast.Params[13].Value:= Null;
  ipStpInsertVentMast.Params[14].Value:= serieDoc;//Numero Factura
  ipStpInsertVentMast.Params[15].Value:= Null;
  //ver mas abajo
  //ipStpInsertVentMast.Params[16].Value:= Serie_Asignadoncf;
  ipStpInsertVentMast.Params[17].Value:= TotalesSubTotal.Value;
  ipStpInsertVentMast.Params[18].Value:= TotalesPorcDesAdicional.Value;
  ipStpInsertVentMast.Params[19].Value:= TotalesMontoDescAdicional.Value;
  // if Abs(TotalesMontoDescAdicional.Value) > 0 then
  //ipStpInsertVentMast.Params[19].Value   := TotalesMontoDescAdicional.Value
  //else
  //ipStpInsertVentMast.Params[19].Value   := TotalesMontoDescItems.Value;

  ipStpInsertVentMast.Params[20].Value:= Totalesmontorecibido.Value;
  ipStpInsertVentMast.Params[21].Value:= Totalesdevolucion.Value;
  ipStpInsertVentMast.Params[22].Value:= Totalesitbis.Value;
  ipStpInsertVentMast.Params[23].Value:= Totalesmontorecibido.Value;
  ipStpInsertVentMast.Params[24].Value:= edtObservacion.Text;


  if Serie_asignadoncf > 0 then
  ipStpInsertVentMast.Params[16].Value     := Serie_Asignadoncf
  else ipStpInsertVentMast.Params[16].Value:= Null;
  //serie_ncf_asignado
  ipStpInsertVentMast.Params[39].Value:= 0;
  ipStpInsertVentMast.Params[40].Value:= 0;
  ipStpInsertVentMast.Params[41].Value:= 0;
  //if not rxPreventaticket_id.IsNull then
  //ipStpInsertVentMast.Params[42].Value:= rxPreventaticket_id.Value //ticket fast food limao
  //else
  ipStpInsertVentMast.Params[42].Value:= null;
  ipStpInsertVentMast.Params[43].Value:= 0;

  ipStpInsertVentMast.Params[44].Value:= Null;
  ipStpInsertVentMast.Params[45].Value:= Null;
  ipStpInsertVentMast.Params[46].Value:= Null;//TotalesidNumeroDVeh.Value;
  ipStpInsertVentMast.ExecProc;
  //t SerieDoc := temporal arreglar numero de Factura
  if Not ipStpInsertVentMast.Transaction.InTransaction then
  ipStpInsertVentMast.Transaction.StartTransaction;
  try
    ipStpInsertVentMast.Transaction.CommitRetaining;
  except
  ipStpInsertVentMast.Transaction.RollbackRetaining;
  end;
  ActualizaCodUsrCaja(ipStpInsertVentMast.Params[0].Value);
  rxVenta.DisableControls;
  rxVenta.First;
  While not rxVenta.Eof do
  begin
    InsertarDet(ipStpInsertVentMast.Params[0].Value);
    ibStpActualizaInvProd.Params[0].Value:= rxVentaCodArticulo.Value;
    ibStpActualizaInvProd.Params[1].Value:= rxVentaCant.Value;
    ibStpActualizaInvProd.Params[2].Value:= 0;//tipoTrn
    ibStpActualizaInvProd.Params[3].Value:= 1;//porCodigo
    if (rxVentaInvetariar.Value <> 0) And  (GlbCodDivInventario = 1 ) then
    ibStpActualizaInvProd.ExecProc;

    ActualizaInvAlmacen;

    rxVenta.Next;
  end;
  rxVenta.First;
  While Not rxVenta.Eof Do
  begin
    rxVenta.Edit;
    rxVentaNumeroRecibo.Value  := ipStpInsertVentMast.Params[0].Value;
    rxVentaNumeroFactura.Value := SerieDoc;
    rxVentaNumeroDoc.Value     := SerieDoc;
    rxVenta.Post;
  end;
  rxVenta.EnableControls;

  if Not ibStpInsertVentaDet.Transaction.InTransaction then
  ibStpInsertVentaDet.Transaction.StartTransaction;
  try
    ibStpInsertVentaDet.Transaction.CommitRetaining;
  except
  ibStpInsertVentaDet.Transaction.RollbackRetaining;
  end;

  if Not ibStpActualizaInvProd.Transaction.InTransaction then
  ibStpActualizaInvProd.Transaction.StartTransaction;
  try
    ibStpActualizaInvProd.Transaction.CommitRetaining;
  except
  ibStpActualizaInvProd.Transaction.RollbackRetaining;
  end;

  if Not EsFinanciamiento then
  begin
    if (GlbFact55Pulg = 1)  then
    begin
      //rxVenta.SortOnFields('Descripcion',True,False);
      if GlbFacturaLicoreria =1 then
      begin
        qckRepRecibo8_5_11REsp:=TqckRepRecibo8_5_11REsp.Create(Nil);
        try
          if GlbSizeFact8x11 = 1 then
          qckRepRecibo8_5_11REsp.Page.Length:= 11;
          qckRepRecibo8_5_11REsp.xtipoVenta := TipoVenta;
          qckRepRecibo8_5_11REsp.valorNCF   := valorNCF;
          qckRepRecibo8_5_11REsp.QRLabel2.Caption:='Factura:';

          qckRepRecibo8_5_11REsp.Prepare;
          glbTPag := qckRepRecibo8_5_11REsp.PageNumber;
          if ImprimirRecibo1.Checked then
          begin
            qckRepRecibo8_5_11REsp.PrinterSetup;
            qckRepRecibo8_5_11REsp.Print;
          end else
          qckRepRecibo8_5_11REsp.Preview;
        finally
        qckRepRecibo8_5_11REsp.Free;
        qckRepRecibo8_5_11REsp:=Nil;
        end;
      end else
      begin
        qckRepFacturaEstandarNew:=TqckRepFacturaEstandarNew.Create(Nil);
        try
          if GlbSizeFact8x11 = 1 then
          qckRepFacturaEstandarNew.Page.Length := 11;
          qckRepFacturaEstandarNew.xtipoVenta := TipoVenta;
          qckRepFacturaEstandarNew.valorNCF:= valorNCF;
          if ImprimirRecibo1.Checked then
          begin
            qckRepFacturaEstandarNew.PrinterSetup;
            qckRepFacturaEstandarNew.Print;
          end else
          qckRepFacturaEstandarNew.Preview;
        finally
        qckRepFacturaEstandarNew.Free;
        qckRepFacturaEstandarNew:=Nil;
        end;
      end;
    end else
    begin
      qckRepRecibo:=TqckRepRecibo.Create(Nil);
      try
        qckRepRecibo.xtipoVenta := TipoVenta;
        qckRepRecibo.valorNCF:= valorNCF;
        qckRepRecibo.ncfDesc:=GlbDescNCF;
        if rxVenta.RecordCount > 2 then
           qckRepRecibo.Page.Length:= qckRepRecibo.Page.Length +
           (rxVenta.RecordCount - 2 ) * 0.63;
        if ImprimirRecibo1.Checked then
           qckRepRecibo.Print else
          qckRepRecibo.Preview;
      finally
      qckRepRecibo.Free;
      qckRepRecibo:=Nil;
      end;
    end;
  end;
end;

procedure TfrmProcOrdCompraN.LectorCodBarra1Click(Sender: TObject);
begin
  LectorCodBarra1.Checked:= Not LectorCodBarra1.Checked;
  if lectorcodbarra1.Checked then
  edtCodigo.Hint:='Enter - para buscar codigo barra. F10-on/off'
  else edtCodigo.Hint:= '';
end;

procedure TfrmProcOrdCompraN.Edit1Enter(Sender: TObject);
begin
  if (Totalestotalneto.Value < 0) then
  begin
    MessageDlg('Total neto no puede ser negativo, verifique',mtError, [mbOK], 0);
    exit;
  end;
end;

procedure TfrmProcOrdCompraN.ImprimirLabel1Click(Sender: TObject);
begin
  frmCodigoBarra:=TfrmCodigoBarra.Create(Nil);
  try
    if frmCodigoBarra.qryInv.State = dsBrowse then
    begin
      if Not frmCodigoBarra.qryInv.Locate('codigo', rxVentaCodArticulo.Value, []) then
      MessageDlg('Codigo no encontrado en tabla inventario.', mtInformation, [mbOK], 0);
    end;
    frmCodigoBarra.ShowModal;
  finally
  frmCodigoBarra.Free;
  frmCodigoBarra:= Nil;
  end;
end;

procedure TfrmProcOrdCompraN.NoGenerarNCF1Click(Sender: TObject);
begin
  NoGenerarNCF1.Checked := not NoGenerarNCF1.Checked;
  if  NoGenerarNCF1.Checked then
  Label21.Visible := True else
  Label21.Visible := false;
  CheckBox1.Visible := Not Label21.Visible;
end;

procedure TfrmProcOrdCompraN.Finalizardisplay;
var
  puerto, linea1, linea2 : String;
begin
  puerto:='1';
  linea1 :='Gracia por su compra';
  linea2 :='**************';
  WinExec(PChar('_display "'+puerto +'" "'+ linea1 +
  '" "'+ linea2 +'"'),SW_HIDE);

  //puerto:='1';
  //linea1:= '*** Total  Venta ***';
  //linea2:=Format('%8.2f',[Totalestotalneto.Value]);
  //WinExec(PChar('_display "'+puerto +'" "'+ linea1 +
  //'" "'+ linea2 +'"'),SW_HIDE);

end;

procedure TfrmProcOrdCompraN.ActualizaInvAlmacen;
begin
  stpMantInvAlmacen.Params[0].Value := rxVentaCodArticulo.Value;//codigo inventario
  stpMantInvAlmacen.Params[1].Value := GlbCodDivInventario;//inventario_id
  if EsDevolucion then
  begin
    stpMantInvAlmacen.Params[2].Value := rxVentaCant.Value;
    if (rxVentaTipoUnidad.Value = 1) or (rxVentaTipoUnidad.Value = 0)  then
      stpMantInvAlmacen.Params[2].Value:= rxVentaCant.Value
    else
    begin
      stpMantInvAlmacen.Params[2].Value:= rxVentaCant.Value * CantUnidad;
    end;
  end else
  begin
    //stpMantInvAlmacen.Params[2].Value := rxVentaCant.Value * -1;
    if (rxVentaTipoUnidad.Value = 1) Or (rxVentaTipoUnidad.Value = 0) then
      stpMantInvAlmacen.Params[2].Value:= rxVentaCant.Value
    else
    begin
      stpMantInvAlmacen.Params[2].Value:= rxVentaCant.Value * CantUnidad *-1;
    end;
  end;
  stpMantInvAlmacen.Params[3].Value := VarUsuarioGlb;//codigo_usuario
  stpMantInvAlmacen.Params[4].Value := ExtraerFecha(Now);//fecha_in
  stpMantInvAlmacen.Params[5].Value := strUserName;//in_por
  stpMantInvAlmacen.Params[6].Value := ExtraerFecha(Now);//fecha_mod
  stpMantInvAlmacen.Params[7].Value := strUserName;//in_por//mod_por
  stpMantInvAlmacen.Params[8].Value := 'A';//status
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

procedure TfrmProcOrdCompraN.FormHide(Sender: TObject);
begin
  isShowing:=True;
end;

procedure TfrmProcOrdCompraN.qryProveedoresAfterScroll(DataSet: TDataSet);
begin
  AbrirClasifPrecio;
end;

procedure TfrmProcOrdCompraN.qryProductosAfterScroll(DataSet: TDataSet);
begin
  FAplicaPrecioMayorista := False;
  Label23.Visible := False;
  if qryClasifPrecio.state = dsInactive then exit;
  if qryClasifPrecio.Locate('COD_PRODUCTO', qryProductoscodigo.Value,[]) then
  begin
  //MessageDlg('Precio Mayorista no ha sido configurado para este producto', mtInformation, [mbOK], 0)
  //else
    FAplicaPrecioMayorista := True;
    Label23.Visible := True;
  end;
end;

procedure TfrmProcOrdCompraN.AbrirClasifPrecio;
begin
  qryClasifPrecio.Close;//tablaPropietario.RecordCount;
  qryClasifPrecio.Params[0].Value := tablaPropietarioCodigoPropietario.Value;// qryClientePRECIO_ID.Value;
  qryClasifPrecio.Open;
  if qryClasifPrecio.RecordCount > 0 then
  DBEdit6.Color:=clGreen
  else
  DBEdit6.Color:=clWindow;
end;

procedure TfrmProcOrdCompraN.AplicaPrecioMayorista;
begin
  if rxVenta.state = dsInactive then exit;
  sumarDatos:=False;
  qryClasifPrecio.Close;
  qryClasifPrecio.Params[0].Value := tablaPropietarioCodigoPropietario.Value;//qryClientePRECIO_ID.Value;
  qryClasifPrecio.Open;
  rxVenta.AutoCalcFields := False;
  rxVenta.First;
  While Not rxVenta.Eof Do
  begin
    if qryClasifPrecio.Locate('COD_PRODUCTO', rxVentaCodArticulo.Value,[]) then
    begin
      rxVenta.Edit;
      rxVentaPrecio.Value  := qryClasifPrecioPRECIO_VENTA.Value;
    end;
    //t Ene-09-2011 else
    //t Ene-09-2011 if rxqryInv.Locate('CODIGO', rxVentaCodArticulo.Value,[]) then
    //t Ene-09-2011 begin
    //t Ene-09-2011  rxVenta.Edit;
    //t Ene-09-2011 rxVentaPrecio.Value  := rxqryInvPRECIO.Value;
    //t Ene-09-2011 end;

    ProcesaCalculos;

    if rxVenta.state in [dsEdit, dsInsert] then
    rxVenta.Post;

    rxVenta.Next;
  end;

  sumarDatos:=True;
  rxVenta.AutoCalcFields := False;
end;

procedure TfrmProcOrdCompraN.RxDBLookupCombo1Exit(Sender: TObject);
begin
  // temp AbrirClasifPrecio;
  //temp AplicaPrecioMayorista;
end;

function TfrmProcOrdCompraN.VerificaLimiteCredito(codigocte: integer;
  MontoVenta: Real): Boolean;
var
  limite_Credito : Real;
begin
  ibsqlBceCxcCte.Close;
  ibsqlBceCxcCte.Params[0].Value := codigocte;
  ibsqlBceCxcCte.ExecQuery;
  //limite_Credito:=qryClienteLIMITE_CREDITO.Value  -
  //                ibsqlBceCxcCte.FieldByName('balance_act').Value;
  //if qryClienteLIMITE_CREDITO.Value = 0 then
  //begin
  //  Result:=False;
  //  NoTieneCredito:=True;
  //  Exit;
  //end else
  //if limite_credito < Abs(MontoVenta) then
  //begin
  //  NoTieneCredito := False;
  //  Result := False;
    //BitBtn9.SetFocus;
  ///  Exit;
  //end
   //else
   Result:=True;
end;

procedure TfrmProcOrdCompraN.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (rxVenta.RecordCount > 0) then
  begin
    if VerificaClave then
    begin
      CanClose:= True;
    end;
  end;
end;

procedure TfrmProcOrdCompraN.RxDBGrid3DblClick(Sender: TObject);
begin
  RxDBGrid3.Visible:=false;
end;

procedure TfrmProcOrdCompraN.SecretPanel1DblClick(Sender: TObject);
begin
  RxDBGrid3.Visible:= True;
  SecretPanel1.Visible:=False;
end;

procedure TfrmProcOrdCompraN.NoMostrarProdVencidos1Click(Sender: TObject);
begin
  NoMostrarProdVencidos1.Checked:= not NoMostrarProdVencidos1.Checked;
  if NoMostrarProdVencidos1.Checked then
  begin
    SecretPanel1.Visible:=True;
    SecretPanel1.Active :=True;
  end
  else SecretPanel1.Visible:=False;
end;

procedure TfrmProcOrdCompraN.rxLabelVenceDblClick(Sender: TObject);
begin
  RxDBGrid3.Visible:= True;
end;


procedure TfrmProcOrdCompraN.qryInventarioAfterOpen(DataSet: TDataSet);
begin
  //rxqryInv.Close;
  //rxqryInv.Open;
  //qryInventario.First;
  //While Not qryInventario.Eof do
  {begin
    rxqryInv.InsertRecord([
    qryInventarioCODIGO.Value,
    qryInventarioCODIGO_TEXTO.Value,
    qryInventarioDESCRIPCION.Value,
    qryInventarioPRECIO.Value,
    qryInventarioREFERENCIA.Value,
    qryInventarioPAGA_ITBI.Value,
    qryInventarioPRECIO_MINIMO.Value,
    qryInventarioCantidad.Value,
    qryInventarioINVENTARIAR.Value,
    qryInventarioPORC_DESCUENTO.Value,
    qryInventarioPRECIO_TIPO_UNIDAD.Value,
    qryInventarioTipo_Unidad.Value]);
    qryInventario.Next;
  end;
  rxqryInv.SortOnFields('descripcion', true, false);}
end;

procedure TfrmProcOrdCompraN.rxqryInvAfterScroll(DataSet: TDataSet);
begin
  {FAplicaPrecioMayorista := False;
  Label23.Visible := False;
  if qryClasifPrecio.state = dsInactive then Exit;
  if qryClasifPrecio.Locate('COD_PRODUCTO', qryProductoscodigo.Value,[]) then
  begin
    FAplicaPrecioMayorista := True;
    Label23.Visible := True;
  end;}
end;

procedure TfrmProcOrdCompraN.cboxTipoUnidadChange(Sender: TObject);
begin
  if rxVenta.State In [dsBrowse] Then
  rxVenta.Edit;

  if Not dmInventario.qryTipoUnidad.Locate('DESCRIPCION', cboxTipoUnidad.Text, []) then
  begin
    MessageDlg('Unidad no encontrada, verifique.', mtError, [mbOk], 0);
    exit;
  end else
  begin
    GlbTipoUnidad := dmInventario.qryTipoUnidadIDUNIDAD.Value;
    CantUnidad:= dminventario.qryTipoUnidadCANTIDAD.Value;
    rxVentaTipoUnidad.Value:=GlbTipoUnidad;

    if not qryProductoscodigo.isnull And (Not PrecioCambio ) then
    rxVentaPrecio.Value  := precioXUnidad(GlbTipoUnidad,qryProductoscodigo.value); //qryProductosPRECIO_TIPO_UNIDAD.Value;
    if (rxVentaprecio.Value = 0) And (Not PrecioCambio )then
    begin
      rxVentaPrecio.Value  := qryProductosPrecio_Compra.Value;
      cboxTipoUnidad.ItemIndex:=0;
    end;
  end;

  if rxVenta.State In [dsBrowse] Then
  rxVenta.Edit;

  //t if dmInventario.qryTipoUnidadIDUNIDAD.Value = 3  then
  //t begin
  //t   rxVentaPrecio.Value  := qryProductosPrecio.Value;
    //rxVentaCant.Value := rxVentaCant.Value * dmInventario.qryTipoUnidadCANTIDAD.Value;
  //t end;// else
  //begin
  //  MessageDlg('Precio no configurado para tipo unidad, verifique', mtError, [mbok],0);
  //end;
  rxVentaDescUnidadMedida.Value:=cboxTipoUnidad.Text;

  ProcesaCalculos;

  if rxVenta.State In [dsInsert, dsEdit] Then
  rxVenta.Post;

end;

procedure TfrmProcOrdCompraN.LlenarTipoUnidadBox(umedida:integer);
begin
  dmInventario.qryTipoUnidad.First;
  cboxTipoUnidad.Items.Clear;
  CantUnidad := 0;
  qryPrecioXTipoUnidad.Close;
  qryPrecioXTipoUnidad.Params[0].Value:=qryProductosCODIGO.Value;
  qryPrecioXTipoUnidad.Open;
  While Not dmInventario.qryTipoUnidad.Eof Do
  begin
    //t if (dmInventario.qryTipoUnidadIDUNIDAD.Value = 3) Or
    //t    (dmInventario.qryTipoUnidadIDUNIDAD.Value = umedida) then
    //t begin
    if qryPrecioXTipoUnidad.Locate('ID_UNIDAD',dminventario.qryTipoUnidadIDUNIDAD.Value,[]) then
    begin
      cboxTipoUnidad.Items.Add(dmInventario.qryTipoUnidadDESCRIPCION.Value);
      cantUnidad:=dmInventario.qryTipoUnidadCANTIDAD.Value;
    end;
    //if (dmInventario.qryTipoUnidadIDUNIDAD.Value = qryProductosTipo_Unidad.value) then
    //CantUnidad := dmInventario.qryTipoUnidadCANTIDAD.Value;
    //t end;
    dmInventario.qryTipoUnidad.Next;
  end;
  if cboxTipoUnidad.Items.Count = 0 then
  begin
    if dmInventario.qryTipoUnidad.Locate('descripcion', 'UNIDAD', [loCaseInsensitive]) then
    begin
      cboxTipoUnidad.Items.Add(dmInventario.qryTipoUnidadDESCRIPCION.Value);
      cboxTipoUnidad.Text:='UNIDAD';
      cantUnidad:=1;
    end;
  end;
  if (dmInventario.qryTipoUnidad.Locate('idunidad', umedida,[])) then
  begin
    cboxTipoUnidad.Text:= dmInventario.qryTipoUnidadDESCRIPCION.Value;
    cantUnidad := dmInventario.qryTipoUnidadCANTIDAD.Value;
  end;
  if (CantUnidad = 0) then
  begin
    CantUnidad := 1;
    cboxTipoUnidad.Text:='UNIDAD';
  end;
end;

procedure TfrmProcOrdCompraN.cboxTipoUnidadExit(Sender: TObject);
begin
  if rxVentaCodTexto.IsNull then exit;
  if rxVentaDescUnidadMedida.isNull or (rxVentaDescUnidadMedida.Value = '') then
  begin
    if rxVenta.State = dsInactive then rxVenta.Edit;
    rxVentaDescUnidadMedida.Value:=cboxTipoUnidad.Text;
  end;
  cboxTipoUnidadChange(Self);
  if rxVenta.State = dsBrowse then rxVenta.Edit;

  //if (GlbTipoUnidad = 0) then GlbTipoUnidad= 1;

  if rxVenta.State In [dsedit,dsInsert] then
  rxVentaTipoUnidad.Value:=GlbTipoUnidad;
end;

procedure TfrmProcOrdCompraN.qryInventarioAfterScroll(DataSet: TDataSet);
begin
  //Activar cuando retitres rxQryInv
  FAplicaPrecioMayorista := False;
  Label23.Visible := False;
  if qryClasifPrecio.state = dsInactive then Exit;
  if qryClasifPrecio.Locate('COD_PRODUCTO', rxqryInvcodigo.Value,[]) then
  begin
    FAplicaPrecioMayorista := True;
    Label23.Visible := True;
  end;
end;

function TfrmProcOrdCompraN.precioXUnidad(idTipoUnidad:Integer;idProducto: Integer): Extended;
begin
  if (idProducto > 0) then
  begin
    qryPrecioXTipoUnidad.Close;
    qryPrecioXTipoUnidad.Params[0].Value:=idProducto;
    qryPrecioXTipoUnidad.Open;
    if qryPrecioXTipoUnidad.Locate('id_unidad',idTipoUnidad,[]) then
    begin
      if Not qryPrecioXTipoUnidadPRECIO.IsNull then
      result := qryPrecioXTipoUnidadPRECIO.Value
    end else
    begin
      //if frmProcVentaRapida.Showing then
      //begin
      //  MessageDlg('Precio no configurado',mtwarning,[mbok],0);
      //  cboxTipoUnidad.SetFocus;
      //end;
      result:=0;
    end;
  end;
end;

procedure TfrmProcOrdCompraN.Label25Click(Sender: TObject);
begin
  if MessageDlg('Imprimir recibo cash en próxima transacción?',mtInformation,[mbyes,mbno],0) = mryes then
  begin
    GlbImprimeReciboFact := 1;
    InactivaImprecibo := true;
    label25.Font.Color :=clPurple;
  end else
  if InactivaImprecibo then
  begin
    GlbImprimeReciboFact := 0;
    InactivaImprecibo := False;
    label25.Font.Color :=clBlack;
  end;
end;

procedure TfrmProcOrdCompraN.RxSpeedButton1Click(Sender: TObject);
begin
  GlbImprimeReciboFact:=0;
  BitBtn4Click(Self);
  RxSpeedButton1.Visible:=False;
  GlbImprimeReciboFact:=1;
  ProcActUltTrn;  
end;

procedure TfrmProcOrdCompraN.MaestroInventario1Click(Sender: TObject);
begin
  frmInventarioProd:=TfrmInventarioProd.Create(Nil);
  try
    frmInventarioProd.ShowModal;
  finally
  frmInventarioProd.free;
  frmInventarioProd:=nil;
  end;
  qryInventario.Close;
  qryInventario.Open;
end;

procedure TfrmProcOrdCompraN.ImprimirFactura(Avance: Integer);

var
  DeviceMode: THandle;
  Device, Driver, Port: array[0..1023] of char;
  ms: Integer; //margen superior
  nLineas: Integer;

   procedure SaltarLinea;
   begin
      ms := ms + 100;
   end;
   procedure ImprimirLinea(Linea: String);
   begin
      Printer.Canvas.TextOut(10, ms, Linea);
      SaltarLinea;
   end;
begin
  //Configura la impresora
  ms:=10;
  Printer.GetPrinter(Device, Driver, Port, DeviceMode);
   
  Printer.SetPrinter('Microsoft XPS Document Writer', Driver, Port, DeviceMode);
  Printer.Title := 'Factura de Venta';
  with Printer do
  begin
    SetMapMode(Printer.Handle,MM_LOMETRIC);
    BeginDoc;
    Canvas.Font.Size:= 12;
    Canvas.Font.Name := 'ARIAL';
    //------------Datos del encabezado
    //Empresa
    ImprimirLinea('Cualquier Cosa');
    //Factura
    ImprimirLinea('Cualquier Cosa');
    //Datos del Cliente
    ImprimirLinea('RIF: ');
    ImprimirLinea('CLIENTE: ');
    ImprimirLinea('DIRECCION: ');
    SaltarLinea;
    //Encabezado
    ImprimirLinea('Can Descripcion Unitario Total');
    //Imprime los detalles
    nLineas := 0;
    rxVenta.First;
    while not rxVenta.Eof do
    begin
       ImprimirLinea(rxVentaCant.AsString+'     '+rxVentaDescripcion.Value);
       Inc(nLineas);
       rxVenta.Next;
    end;
    while nLineas < 10 do
    begin
       SaltarLinea;
       Inc(nLineas);
    end; //Rellena el numero de las lineas faltantes
    //Imprime el cierre de la factura
    ImprimirLinea('SubTotal: ');
    ImprimirLinea('Descuento: ');
    ImprimirLinea('IVA ');
    ImprimirLinea('Total: ');
    ImprimirLinea('PAGADO');
    if Avance > 0 then
    begin
       ms := ms + Avance;
       ImprimirLinea('-');
    end;
    EndDoc;
  end;
end;


procedure TfrmProcOrdCompraN.cboxTipoUnidadEnter(Sender: TObject);
begin
  panel2.Visible := False;
end;

procedure TfrmProcOrdCompraN.DBEdit3Exit(Sender: TObject);
begin
  if (rxVentaMontoBruto.Value = 0) or (rxVentaMontoBruto.IsNull) then
  edtCodigo.SetFocus;
end;

procedure TfrmProcOrdCompraN.RxDBGrid2Enter(Sender: TObject);
begin
  GlbNumero:= rxVentaSerie.Value;
end;

procedure TfrmProcOrdCompraN.RxDBGrid2Exit(Sender: TObject);
begin
  GlbNumero:= rxVentaSerie.Value;
  if Not dmInventario.qryTipoUnidad.Locate('IDUNIDAD', rxVentaTipoUnidad.Value, []) then
  begin
    if (rxVentaTipoUnidad.Value = 0) then
    begin
      if dmInventario.qryTipoUnidad.Locate('DESCRIPCION', 'UNIDAD', []) then
      begin
        GlbTipoUnidad := dmInventario.qryTipoUnidadIDUNIDAD.Value;
        CantUnidad:= dminventario.qryTipoUnidadCANTIDAD.Value;
        cboxTipoUnidad.Text := dminventario.qryTipoUnidadDESCRIPCION.Value;
      end;
    end else
    MessageDlg('Unidad no encontrada, verifique.', mtError, [mbOk], 0);
  end else
  begin
    GlbTipoUnidad := dmInventario.qryTipoUnidadIDUNIDAD.Value;
    CantUnidad:= dminventario.qryTipoUnidadCANTIDAD.Value;
    cboxTipoUnidad.Text := dmInventario.qryTipoUnidadDESCRIPCION.Value;
  end;
end;

procedure TfrmProcOrdCompraN.rxVentaAfterScroll(DataSet: TDataSet);
begin
  if rxVentaTipoUnidad.IsNull then Exit;
  if rxVentaTipoUnidad.Value = 0 then exit;
  
  if Not dmInventario.qryTipoUnidad.Locate('IDUNIDAD', rxVentaTipoUnidad.Value, []) then
  begin
    MessageDlg('Unidad no encontrada, verifique.', mtError, [mbOk], 0);
    exit;
  end else
  begin
    GlbTipoUnidad := dmInventario.qryTipoUnidadIDUNIDAD.Value;
    CantUnidad:= dminventario.qryTipoUnidadCANTIDAD.Value;
    cboxTipoUnidad.Text := dmInventario.qryTipoUnidadDESCRIPCION.Value;
  end;
end;

procedure TfrmProcOrdCompraN.ConsultaGeneral1Click(Sender: TObject);
begin
  frmConsultaInventario:=TfrmConsultaInventario.Create(Nil);
  try
    if frmConsultaInventario.Showmodal = mrOk then
    edtCodigo.Text:= frmConsultaInventario.ibquery1codigo.AsString;
  finally
  frmConsultaInventario.Free;
  frmConsultaInventario:=Nil;
  end;
  if (Length(edtcodigo.Text) > 0) then
  edtcodigo.SetFocus;
  {
  frmConsultaInventario:=TfrmConsultaInventario.Create(Nil);
  try
    frmConsultaInventario.Showmodal;
  finally
  frmConsultaInventario.Free;
  frmConsultaInventario:=Nil;
  end;}
end;

procedure TfrmProcOrdCompraN.BitBtn17Click(Sender: TObject);
begin
  if (Totalesmontorecibido.Value > 0) and(rxVenta.RecordCount > 0) then
  begin
    MessageDlg('Favor procesar o cancelar venta en progreso', mtInformation, [mbOK], 0);
    Exit;
  end;
  if (totales.RecordCount > 0) then
  begin
    totales.Close;
    totales.Open;
    Edit1.Text:='';
    Totales.Close;
    Totales.Open;
    Totales.Insert;
    TotalesSubTotal.Value:=0;
    Totalesitbis.Value:=0;
    Totalesmontodesc.Value:=0;
    Totalestotalneto.Value:=0;
    Totalesmontorecibido.Value:=0;
    Totalesdevolucion.Value:=0;
    Totales.Post;
    lblProcDev.Visible := False;
  end;
  frmConsultaPreVenta:=TfrmConsultaPreVenta.Create(Nil);
  try
    if frmConsultaPreVenta.Showmodal = mrOk then
    begin
      rxVenta.Close;
      rxVenta.Open;
      frmConsultaPreVenta.qryPreventaDet.First;
      rxPreventa.Close;
      rxPreventa.Open;
      edtObservacion.Text:=frmConsultaPreVenta.qryPreventaMasterNOMBRE_CLIENTE_GENERAL.Value;
      While Not frmConsultaPreVenta.qryPreventaDet.Eof do
      begin
        if (frmConsultaPreVenta.qryPreventaDetCANTIDAD.Value > 0)
        And (frmConsultaPreVenta.qryPreventaDetSTATUS_DET.Value = 'A') then
        rxVenta.Append;
        RxSpeedButton1.Visible := True;
        CargarPreventa;
        if rxVenta.State In [dsInsert,dsEdit] then
        rxVenta.Post;
        tablaPropietario.Edit;
        tablaPropietarioCodigoPropietario.Value:= frmConsultaPreVenta.qryPreventaMasterCODIGO_CTE.Value;
        tablaPropietario.Post;

        rxPreventa.Append;
        rxPreventaNumero.Value:= frmConsultaPreVenta.qryPreventaMasterNUMERO.Value;
        rxPreventaSerie.Value := frmConsultaPreVenta.qryPreventaDetSerie.Value;
        rxPreventa.Post;        
        frmConsultaPreVenta.qryPreventaDet.Next;
      end;
    end;
  finally
  frmConsultaPreVenta.Free;
  frmConsultaPreVenta:=Nil;
  end;
end;

procedure TfrmProcOrdCompraN.CargarPreventa;
begin
  rxVentaSerie.Value := frmConsultaPreVenta.qryPreventaDetSerie.Value;
  rxVentaFecha.Value := ExtraerFecha(GlbFechaTrnDiaria);
  rxVentaCant.Value  := frmConsultaPreVenta.qryPreventaDetCANTIDAD.Value;
  rxVentaPrecio.Value:= frmConsultaPreVenta.qryPreventaDetPRECIO.Value;
  rxVentaporc_desc.Value := frmConsultaPreVenta.qryPreventaDetPORC_DESC_DET.Value;
  rxVentaDescripcion.Value := frmConsultaPreVenta.qryPreventaDetDESCRIPCION.Value;

  if qryProductos.Locate('CODIGO',frmConsultaPreVenta.qryPreventaDetCODIGO_PROD.Value,[]) then
  rxVentaCodTexto.Value:= qryProductosCODIGO_TEXTO.Value;
  rxVentaReferencia.Value := qryProductosREFERENCIA.Value;
  rxVentaInvetariar.Value:= qryProductosINVENTARIAR.Value;
  rxVentaCodArticulo.Value:= frmConsultaPreVenta.qryPreventaDetCODIGO_PROD.AsInteger;
  rxVentaCodUsuario.Value := frmConsultaPreVenta.qryPreventaMasterCODIGO_VENDEDOR.Value;
  ProcesaCalculos;
end;

procedure TfrmProcOrdCompraN.ActualizarPreventa;
begin
  if rxPreventa.State = dsInactive then exit;
  rxPreventa.First;
  if (rxPreventa.RecordCount > 0) then
  begin
    ibsqlDeletePreventaMaster.Params[0].Value:= rxPreventaNumero.Value;
    ibsqlDeletePreventaMaster.ExecQuery;
    ibsqlDeletePreventaDet.Params[0].Value:= rxPreventaNumero.Value;
    ibsqlDeletePreventaDet.ExecQuery;
  end;
end;

procedure TfrmProcOrdCompraN.InsertaTransCafeteria(numTrn : Integer;codigoP:Integer;cantP:Real);
begin
  dmVentas.tblTransCafeteria.Append;
  dmVentas.tblTransCafeteriaSERIE.Value:=FsqlMaxNumero('trans_cafeteria','serie');
  dmVentas.tblTransCafeteriaNUMERO.Value:= numTrn;
  dmVentas.tblTransCafeteriaCODIGO_PROD.Value:= codigoP;
  dmVentas.tblTransCafeteriaCANT.Value:= cantP;
  dmVentas.tblTransCafeteriaCOD_USUARIO.Value:= VarUsuarioGlb;
  dmVentas.tblTransCafeteriaFECHA_IN.Value:= now;
  dmVentas.tblTransCafeteriaIN_POR.Value:= strUserName;
  dmVentas.tblTransCafeteriaSTATUS.Value:='A';
  dmVentas.tblTransCafeteria.Post;
  dmVentas.tblTransCafeteria.ApplyUpdates;
  if not dmVentas.tblTransCafeteria.Transaction.InTransaction then
  dmVentas.tblTransCafeteria.Transaction.StartTransaction;
  try
    dmVentas.tblTransCafeteria.Transaction.CommitRetaining;
  except
  dmVentas.tblTransCafeteria.Transaction.RollbackRetaining;
  end;

  //Actualizar inventario ingredientes cafeteria
  ibStpActualizaInvProd.Params[0].Value:= codigoP;
  if (rxVentaTipoUnidad.Value = 1) Or (rxVentaTipoUnidad.Value = 0) then
  ibStpActualizaInvProd.Params[1].Value:= rxVentaCant.Value * cantP
    else
    begin
      ibStpActualizaInvProd.Params[1].Value:= rxVentaCant.Value * cantP;
    end;
    if Not EsDevolucion then
    ibStpActualizaInvProd.Params[2].Value     := 0//tipoTrn
    else ibStpActualizaInvProd.Params[2].Value:= 1;//ingresar al inventario
    ibStpActualizaInvProd.Params[3].Value     := 1;//porCodigo
    //if (rxVentaInvetariar.Value <> 0) And (GlbCodDivInventario = 1 ) then
    ibStpActualizaInvProd.ExecProc;
  if not ibStpActualizaInvProd.Transaction.InTransaction then
  ibStpActualizaInvProd.Transaction.StartTransaction;
  try
    ibStpActualizaInvProd.Transaction.CommitRetaining;
  except
  ibStpActualizaInvProd.Transaction.RollbackRetaining;
  end;
end;

procedure TfrmProcOrdCompraN.Label26Click(Sender: TObject);
begin
  dmVentas.qryIngredienteCaf.Close;
  dmVentas.qryIngredienteCaf.Params[0].Value:=rxVentaCodArticulo.Value;
  dmVentas.qryIngredienteCaf.Open;
  frmVerIngredientes:=TfrmVerIngredientes.Create(nil);
  try
    frmVerIngredientes.Showmodal;
  finally
  frmVerIngredientes.free;
  frmVerIngredientes:=nil;
  end;
end;

procedure TfrmProcOrdCompraN.ProcInsDetalleOrden;
begin
  dmdatos.stpInsOrdenDet.Params[0].Value:= dmdatos.stpInsOrdenMast.Params[0].Value;//NUMERO
  dmdatos.stpInsOrdenDet.Params[1].Value:= rxVentaCodArticulo.Value;//COD_SERV_PROD
  dmdatos.stpInsOrdenDet.Params[2].Value:= null;//DEPARTAMENTO
  dmdatos.stpInsOrdenDet.Params[3].Value:= rxVentaDescripcion.Value;//OBSERVACION
  dmdatos.stpInsOrdenDet.Params[4].Value:= rxVentaCant.Value;//CANTIDAD
  dmdatos.stpInsOrdenDet.Params[5].Value:= rxVentaMontoBruto.Value;//VALOR
  dmdatos.stpInsOrdenDet.Params[6].Value:= 'A';;//STATUS
  dmdatos.stpInsOrdenDet.Params[7].Value:= strusername;//IN POR
  dmdatos.stpInsOrdenDet.Params[8].Value:= Now;//FECHA IN
  dmdatos.stpInsOrdenDet.Params[9].Value:= null;//MOD POR
  dmdatos.stpInsOrdenDet.Params[10].Value:=null;//FECHA MOD
  dmdatos.stpInsOrdenDet.Params[11].Value:=null;// NUMERO DOC
  dmdatos.stpInsOrdenDet.Params[12].Value:=null;//NUMERO FACTURA
  dmdatos.stpInsOrdenDet.Params[13].Value:=null;// COD CTA CONCEPTO
  dmdatos.stpInsOrdenDet.Params[14].Value:=null;// TIPOSERVICIO
  dmdatos.stpInsOrdenDet.Params[15].Value:=null;//SUBTIPOSERV
  dmdatos.stpInsOrdenDet.Params[16].Value:=null;//NOSEIRE RES
  dmdatos.stpInsOrdenDet.Params[17].Value:=null;//CODIGO CONDUCTOR
  dmdatos.stpInsOrdenDet.Params[18].Value:=null;//CODIGO SERVCOSTO
  dmdatos.stpInsOrdenDet.Params[19].Value:=rxVentaPrecio.Value;//PRECIO
  dmdatos.stpInsOrdenDet.Params[20].Value:=Null;//AREA ORDEN
  dmdatos.stpInsOrdenDet.Params[21].Value:=rxVentaItbi.Value;//ITBI DET
  dmdatos.stpInsOrdenDet.Params[22].Value:=rxVentaporc_desc.Value;//PORC DESC DET
  dmdatos.stpInsOrdenDet.Params[23].Value:=rxVentaMontoDescuento.Value;//MONTO DESCUNEOT
  dmdatos.stpInsOrdenDet.Params[24].Value:=rxVentaTipoUnidad.Value;//MONTO DESCUNEOT
  dmdatos.stpInsOrdenDet.Params[25].Value:=null;//cod_usuario_recibe
  dmdatos.stpInsOrdenDet.Params[26].Value:=VarUsuarioGlb;//cod_usuario_crea  
  dmdatos.stpInsOrdenDet.ExecProc;
end;

procedure TfrmProcOrdCompraN.BitBtn16Click(Sender: TObject);
var
  flag:boolean;
  fecha:TDateTime;
  pantalla: Boolean;
begin
 flag:=false;
 frmSelSingleFechaOpc:=TfrmSelSingleFechaOpc.Create(Nil);
 frmSelSingleFechaOpc.FechaIni.DateTime:=GlbFechaTrnDiaria;
 if frmSelSingleFechaOpc.ShowModal = mrOk then
 begin
   fecha:=ExtraerFecha(frmSelSingleFechaOpc.FechaIni.DateTime);
   flag :=True;
   pantalla:=frmSelSingleFechaOpc.RadioButton1.Checked;
 end;
 if flag then
 begin
   frmImpOrden:=TfrmImpOrden.Create(Nil);
   try
     frmImpOrden.ImpPantalla:=pantalla;
     frmImpOrden.qryDatosOrdenAImp.Close;
     frmImpOrden.qryDatosOrdenAImp.Params[0].Value:=fecha;
     frmImpOrden.qryDatosOrdenAImp.Open;
     frmImpOrden.showmodal;
   finally
   frmImpOrden.free;
   frmImpOrden:= nil;
   BitBtn2.Enabled:= False;   
   end;
 end;
 rxVenta.EmptyTable;
end;

procedure TfrmProcOrdCompraN.Button1Click(Sender: TObject);
begin
  frmListadoCostoProdProveedor:=TfrmListadoCostoProdProveedor.Create(Nil);
  try
    frmListadoCostoProdProveedor.AbrirQuery(qryProdPorProveedor.Params[0].Value);
    frmListadoCostoProdProveedor.Showmodal;
  finally
  frmListadoCostoProdProveedor.Free;
  frmListadoCostoProdProveedor:=Nil;
  end;
end;

procedure TfrmProcOrdCompraN.RxDBGrid1Enter(Sender: TObject);
begin
  GlbNumero:= rxVentaSerie.Value;
end;

procedure TfrmProcOrdCompraN.RxDBGrid1Exit(Sender: TObject);
begin
  GlbNumero:= rxVentaSerie.Value;
end;

end.
